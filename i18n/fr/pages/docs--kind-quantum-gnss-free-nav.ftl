# docs--kind-quantum-gnss-free-nav: translations (fr)

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
seg-7b2721b7588d = Type de scénario du moteur v{ $version }, famille <a1>Capteurs inertiels, de fusion et quantiques</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-451a304052c4 = <b>MODELLED</b> Accéléromètre à interféromètre à atomes froids à partir des premiers principes (k_eff·T², QPN). Référence indépendante (ExternalDataset) : vecteurs numériques publiés d'articles primaires sur le CAI (fonction de transfert de Cheinet { "2008" } ; sensibilité de Peters/Freier) : k_eff·T² concorde exactement, ASD du bruit de grenaille un plancher unilatéral à ~{ "2" }× de chaque instrument publié (les dispositifs réels portent un bruit technique au-dessus du plancher quantique). Un encadrement, et non une parité. { "0.30" } tour { "2" } (préenregistré fcb9ac64), un constat (reste MODELLED) : le bruit de rotation limité au seul QPN face au Gauguet et al. mesuré.

# text
seg-9955b1b1c018 = La performance des capteurs inertiels quantiques est MODELLED, et non validée : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Page de famille : <a1>Capteurs inertiels, de fusion et quantiques</a1>

# text
seg-496b17a8d3b9 = Page thématique : <a1>QUANTUM-MODELS.md</a1>

# text
seg-753f0302eeef = Page thématique : <a1>QUANTUM.md</a1>

# text
seg-bb07c8ee153f = <b>PARTNER</b> Non fourni — modèles de performance seulement ; le matériel à atomes froids/horloge est celui d'un partenaire. Référence indépendante (NoneKind) : aucune : une discipline appartenant au partenaire, sans module et sans test par conception

# text
seg-f44afe581836 = { $version }

# text
seg-c37642bb24fe = <b>MODELLED</b> Un objet TradeEvidence reproductible (cadre fixé : scénario+graine+moteur ; valeurs communes quantique contre classique par figure de mérite avec bénéfice de polarité correcte, { "95" } % facultatif. Référence indépendante (InternalConsistency) : identités en forme close de bénéfice/gagnant et enveloppe fidèle de l'existant quantum_trade::TradeResult ; honnêteté liée au registre de représentativité et aux étiquettes de vérification

# text
seg-eb75c6a4dcec = Les éléments de preuve de compromis quantique contre classique (forme commune) sont MODELLED, et non vérifiés : ils sont contrôlés par rapport à leur propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
# c1: docs/kinds/by-kind/quantum-gnss-free-nav.md
seg-bfbcc7e8f620 = Source : <c1/>

# text
# c1: quantum-gnss-free-nav
seg-cfa59601df4a = <c1/> (type de scénario)

# text
seg-790fbfdd80f0 = Navigation quantique sans GNSS MODELLED : lors d'une interruption du GNSS, un budget inertiel quantique (interféromètre à atomes froids) par rapport à une centrale inertielle (INS) classique de qualité navigation — croissance de l'erreur de position pendant la dérive libre, holdover jusqu'à un seuil de position, et compromis quantique contre classique sous forme de TradeEvidence honnête avec représentativité. Note honnête d'observabilité : sans mesure externe, le biais de l'accéléromètre est inobservable, de sorte que l'erreur croît ; le capteur quantique ralentit cet écart sans le combler. Paramètres de dispositif illustratifs à sources publiques ; modélise la classe, aucun TRL, vol ni certification.

# text
# c1: scenarios/quantum-gnss-free-nav.toml
seg-dd74f248373d = Une exécution de <c1/> se résume ainsi : quantum-gnss-free-nav | outage 300s | quantum pos err { "0.00" } m vs classical { "37.31" } m (8289.5x) | holdover quantum 44721s vs classical 534s (thr { "100" } m) | trade quantum wins 2/2 | MODELLED

# text
# c1: outage_s
# c2: threshold_m
# c3: quantum_bias_m_s2
# c4: classical_bias_m_s2
seg-960491d74173 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/quantum-gnss-free-nav.toml
seg-88d9dfe0353a = L'exemple <c1/> définit, entre autres :

# attr:alt
seg-1bdbf1a737b2 = Le graphique que le moteur écrit pour scenarios/quantum-gnss-free-nav.toml, type de scénario quantum-gnss-free-nav

# text
seg-d196391dcf4f = <b>MODELLED</b> Navigation à l'estime quantique (interféromètre à atomes froids) contre INS classique de qualité navigation lors d'une interruption du GNSS : croissance de l'erreur de position, holdover jusqu'à un seuil de position,. Référence indépendante (InternalConsistency) : budgets inertiels réutilisés recoupés avec une double intégration Octave indépendante de la même EDO de navigation à l'estime (environnement d'exécution différent, modèle partagé → ReferenceImpl) plus le bruit à court terme publié de Freier-2016 comme ancrage unilatéral ; le composite quantique contre classique reste MODELLED

# text
# c1: kshana kinds --json
seg-af35cccc4e2c = Navigation quantique sans GNSS MODELLED : lors d'une interruption du GNSS, un budget inertiel quantique (interféromètre à atomes froids) par rapport à une centrale inertielle (INS) classique de qualité navigation — croissance de l'erreur de position pendant la dérive libre, holdover jusqu'à un seuil de position, et compromis quantique contre classique sous forme de TradeEvidence honnête avec représentativité. (catalogue des types de scénario (<c1/>))

# text
seg-9b9ce7600ffc = Navigation quantique sans GNSS — navigation à l'estime quantique (interféromètre à atomes froids) contre INS classique de qualité navigation lors d'une interruption du GNSS. MODELLED ; paramètres de dispositif illustratifs, à sources publiques ; modélise la classe, aucune revendication de TRL ni de vol. (commentaire du fichier de scénario, lignes { "1" } à { "3" })

# text
seg-9d67411151e3 = La navigation quantique sans GNSS est MODELLED, et non vérifiée : elle est contrôlée par rapport à sa propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-e1d502e1ed6d = <s1>Précédent</s1>quantum-anomaly-detect

# text
seg-1f3705925b3c = <s1>Suivant</s1>quantum-time-transfer
