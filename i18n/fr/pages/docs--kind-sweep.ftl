# docs--kind-sweep: translations (fr)

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
seg-4636d450ef60 = <b>MODELLED</b> Une exécution prend un plan de contacts (une liste de fenêtres aos_s/los_s, chacune demandant à l'ouverture la navigation ou les communications — le même vocabulaire de fenêtres qu'émet <c1/>, converti par <c2/>), un nombre d'ouvertures

# text
# c1: campaign
seg-fa3ad6babe54 = <b>MODELLED</b> Le balayage du type de scénario <c1/> (une à trois clés pointées de n'importe quel type de scénario, sur les valeurs d'axe du balayage générique, avec facultativement un ensemble à chaque nœud) et la sec monte_carlo. Référence indépendante (InternalConsistency) : La forme fermée de la marche aléatoire de phase sous bruit blanc de fréquence, variance q_wf tau (NIST Technical Note { "1337" }), pour la machinerie statistique, et l'égalité à l'octet près avec les exécutions autonomes pour l'initialisation. Elle vérifie l'arithmétique d'ensemble sur le modèle d'horloge propre au moteur, et non un jeu de données externe

# text
seg-d1c11e493795 = Les balayages de paramètres et les ensembles Monte Carlo initialisés sur n'importe quel type de scénario sont MODELLED, et non validés : vérifiés par rapport à leur propre identité analytique en forme fermée — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-cb91473bfdda = Page thématique : <a1>LEO-PNT.md</a1>

# text
seg-c61e88721556 = Type de scénario du moteur v{ $version }, famille <a1>Horloges, synchronisation temporelle et holdover</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-a8d92406e428 = Strontium optical lattice clock, space-oriented goal sigma_y

# text
seg-5278ccdaf16f = <b>MODELLED</b> Croissance de l'erreur de dérive en forme fermée + holdover jusqu'au seuil ; classes d'horloges quantiques. Référence indépendante (ReferenceImpl) : récurrence de covariance multi-pas de clock_state (recoupement au sein de la même base de code) ; le noyau sous-jacent de variance de dérive et d'inversion du holdover est validé en externe par rapport à scipy (voir « Clock-holdover coast-variance & threshold inversion »). Les chiffres de holdover par classe au plancher de bruit rouge restent MODELLED

# text
seg-e12f672ae71d = Le holdover d'horloge sans GNSS est MODELLED, et non validé : vérifié par rapport à une implémentation distincte de cette même base de code — indépendante de l'unité testée, mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-849c08d3ce70 = Page de famille : <a1>Horloges, synchronisation temporelle et holdover</a1>

# text
seg-ee7dd15019d0 = Page thématique : <a1>CAMPAIGNS.md</a1>

# text
# c1: gnss-ssv
seg-0aae0574c5e6 = <b>MODELLED</b> Les balayages de disponibilité du type de scénario <c1/> : par constellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) et combinées, la part des paires (utilisateur, époque) avec au moins un et au moins quatre signaux et l'interruption la plus longue, pour un utilisateur sur une sphère

# text
seg-8b701f465117 = log

# text
# c1: docs/kinds/by-kind/sweep.md
seg-de72ae48731d = Source : <c1/>

# text
# c1: sweep
seg-81c2da4650c9 = <c1/> (type de scénario)

# text
seg-e7ab7b55c969 = Balayage 1-D d'étude de compromis sur un paramètre du paquet d'horloge.

# text
# c1: scenarios/sweep-clock-stability.toml
seg-0412c0dbfb75 = Une exécution de <c1/> se résume ainsi : balayage de holdover_s sur classical_q_wf ({ "1.00e-24" }..1.00e-18, { "25" } points, échelle logarithmique) | quantique 6600.000->{ "6600.000" } | classique 2610.000->{ "250.000" }

# text
# c1: parameter
# c2: metric
# c3: start
# c4: stop
# c5: steps
# c6: base
seg-d2a441254bcd = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scale
seg-2b8d8159bdaf = Champs facultatifs : <c1/>

# text
# c1: scenarios/sweep-clock-stability.toml
seg-73c2e732b0c1 = L'exemple <c1/> définit, entre autres :

# text
seg-f8a627a78bdb = Fiche technique du CSAC Microchip SA.45s sigma_y(1s)={ "3e-10" } ; q_wf est s

# attr:alt
seg-c784b8f22f12 = Le graphique que le moteur écrit pour scenarios/sweep-clock-stability.toml, type sweep

# text
# c1: campaign
seg-cb00aca0268d = <b>MODELLED</b> Les sections sweep (une à trois clés pointées de n'importe quel type, sur les valeurs d'axe du balayage générique, éventuellement avec un ensemble à chaque nœud) et monte_carlo du type <c1/> : la réalisation k s'exécute à base_seed + k ; chaque métrique rapporte la moyenne, l'écart-type d Tests : <a1>campaign_composition_reference.rs</a1>.

# text
seg-1750fbfc4a99 = <s1>Précédent</s1>sweep-nd

# text
seg-de5468ac32fc = <s1>Suivant</s1>telecom-timing

seg-795e0409fa5a = <b>MODELLED</b> La phase <c1/> : l'état moyen par le propagateur de Cowell du moteur (masse ponctuelle terrestre et J2, le Soleil et la Lune comme corps tiers, la Lune issue du noyau DE440 du fil là où il couvre le segment et le Soleil issu de la sér
