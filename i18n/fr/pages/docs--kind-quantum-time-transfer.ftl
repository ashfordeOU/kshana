# docs--kind-quantum-time-transfer: translations (fr)

# text
seg-f42465f7d066 = ns

# text
seg-37d16b499bc5 = dB

# text
seg-c61e88721556 = Type de scénario du moteur v{ $version }, famille <a1>Horloges, synchronisation temporelle et holdover</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-849c08d3ce70 = Page de famille : <a1>Horloges, synchronisation temporelle et holdover</a1>

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
seg-a3697ad561db = Hz

# text
seg-496b17a8d3b9 = Page thématique : <a1>QUANTUM-MODELS.md</a1>

# text
seg-a1810bbca337 = <b>MODELLED</b> Aller-retour/TWSTFT (Sagnac), vue commune GNSS, PPP ; gigue de liaison→distance. Référence indépendante (ExternalDataset) : amplitude de Sagnac vérifiée par rapport à une VALEUR PUBLIÉE faisant autorité — N. Ashby, « Relativity in the GPS », Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), éq. { "1.29" } : un tour de l'équateur vers l'est accumule { "207.4" } ns (2ωA_E/c²) ; kshana reproduit { "207.386" } ns. Corroboré indépendamment par geodist() de RTKLIB { "2.4.3" } (Takasu, BSD-2-Clause), qui porte la même géométrie 2Aω/c². Le BIPM TWSTFT composite transpondeur/vue commune/

# text
seg-a8beb8dfc757 = Le budget d'erreur du transfert de temps est MODELLED, et non validé : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-bb07c8ee153f = <b>PARTNER</b> Non fourni — modèles de performance seulement ; le matériel à atomes froids/horloge est celui d'un partenaire. Référence indépendante (NoneKind) : aucune : une discipline appartenant au partenaire, sans module et sans test par conception

# text
seg-f44afe581836 = { $version }

# text
seg-c37642bb24fe = <b>MODELLED</b> Un objet TradeEvidence reproductible (cadre fixé : scénario+graine+moteur ; valeurs communes quantique contre classique par figure de mérite avec bénéfice de polarité correcte, { "95" } % facultatif. Référence indépendante (InternalConsistency) : identités en forme close de bénéfice/gagnant et enveloppe fidèle de l'existant quantum_trade::TradeResult ; honnêteté liée au registre de représentativité et aux étiquettes de vérification

# text
seg-eb75c6a4dcec = Les éléments de preuve de compromis quantique contre classique (forme commune) sont MODELLED, et non vérifiés : ils sont contrôlés par rapport à leur propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
# c1: docs/kinds/by-kind/quantum-time-transfer.md
seg-eee91dc5741d = Source : <c1/>

# text
# c1: quantum-time-transfer
seg-05060df7f0b7 = <c1/> (type de scénario)

# text
seg-540545e6f846 = Chaîne de synchronisation temporelle quantique de confiance MODELLED : un budget de transfert de temps de bout en bout quantique (horloge à réseau optique + liaison à intrication/photon unique) contre classique (CSAC + liaison RF bidirectionnelle), un niveau de protection de la synchronisation temporelle réutilisé + une figure de mérite de sécurité contre les attaques par retard/rejeu (1-P_md), une probabilité de détection d'anomalie d'horloge + une latence CUSUM, et le compromis quantique contre classique sous forme de TradeEvidence honnête avec un dossier de représentativité + d'écarts avant le vol. Paramètres de dispositif/liaison illustratifs à sources publiques ; modélise la classe, aucun TRL, vol ni certification revendiqué.

# text
# c1: scenarios/quantum-time-transfer.toml
seg-ed79bfe80fe7 = Une exécution de <c1/> se résume ainsi : quantum-time-transfer | quantum chain 1.233e-12s vs classical 5.292e-9s | PL { "555.24" } ns | security Pd { "1.000" } (Pfa { "1e-3" }) | anomaly Pd { "0.761" } | trade quantum wins 2/2 | MODELLED

# text
# c1: integration_s
# c2: dissemination_interval_s
# c3: link_loss_db
# c4: classical_link_sigma_s
# c5: monitor_pfa
# c6: attack_delay_s
# c7: clock_fault_sigma
seg-80e94491c3df = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/quantum-time-transfer.toml
seg-6b03fa15a60d = L'exemple <c1/> définit, entre autres :

# attr:alt
seg-09760f892c7b = Le graphique que le moteur écrit pour scenarios/quantum-time-transfer.toml, type de scénario quantum-time-transfer

# text
seg-873de4d05663 = <b>VALIDATED</b> Latence de détection dans le pire cas du détecteur CUSUM tabulaire (⌊h/(z−k)⌋+{ "1" }) et longueur moyenne de séquence hors contrôle, utilisées par le niveau de protection de la synchronisation temporelle et les moniteurs de leurrage. Référence indépendante (ExternalDataset) : ARL publiée du CUSUM tabulaire : approximation par mouvement brownien de Siegmund ({ "1985" }) (Hawkins & Olwell { "1998" }, éq. { "3.7" }) ancrée de façon croisée aux tables d'ARL de Montgomery, Introduction to Statistical Quality Control (Wiley) pour k=½, h∈{ "{" }{ "4,5" }{ "}" } ; latence déterministe concordant exactement avec une référence de premier passage. La borne composée du TPL reste MODELLED

# text
# c1: kshana kinds --json
seg-b51e62b8dc63 = Chaîne de synchronisation temporelle quantique de confiance MODELLED : un budget de transfert de temps de bout en bout quantique (horloge à réseau optique + liaison à intrication/photon unique) contre classique (CSAC + liaison RF bidirectionnelle), un niveau de protection de la synchronisation temporelle réutilisé + une figure de mérite de sécurité contre les attaques par retard/rejeu (1-P_md), une probabilité de détection d'anomalie d'horloge + une latence CUSUM, et le compromis quantique contre classique sous forme de TradeEvidence honnête avec un dossier de représentativité + d'écarts avant le vol. (catalogue des types de scénario (<c1/>))

# text
seg-dee0faf63e7f = Synchronisation temporelle quantique de confiance — chaîne de transfert de temps de bout en bout, diffusion sécurisée, détection d'anomalies et compromis quantique contre classique. MODELLED ; paramètres de dispositif/liaison illustratifs, à sources publiques ; modélise la classe, aucune revendication de TRL ni de vol. (commentaire du fichier de scénario, lignes { "1" } à { "3" })

# text
seg-6e9f5dfca6b0 = La synchronisation temporelle quantique de confiance (transfert de temps + diffusion sécurisée + anomalie) est MODELLED, et non vérifiée : elle est contrôlée par rapport à sa propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-d3665be74ff1 = <s1>Précédent</s1>quantum-gnss-free-nav

# text
seg-0d4b1f97541f = <s1>Suivant</s1>quantum-trade
