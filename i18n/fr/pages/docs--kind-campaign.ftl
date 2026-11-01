# docs--kind-campaign: translations (fr)

# text
seg-8784979d6569 = dBW

# text
# c1: docs/kinds/by-kind/campaign.md
seg-68a2bcb6eedd = Source : <c1/>

# text
# c1: campaign
seg-24ce6aee5e53 = <c1/> (type de scénario)

# text
seg-931a3d27c0f0 = Type de scénario du moteur v{ $version }, famille <a1>Campagnes</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-a07990e776cb = Campagne : des types de scénario existants composés en une seule exécution, chaque nombre étant lu dans une véritable exécution du type de scénario nommé. Quatre sections, en toute combinaison. PHASES : une mission enchaînée sur une chronologie partagée -- chaque phase exécute un ou plusieurs scénarios (par exemple brouillage, puis leurrage, puis une horloge en holdover avec un système de navigation inertielle en roue libre à ses côtés, puis une alarme d'intégrité, puis la récupération), leurs sorties sont lues dans des canaux nommés (erreur de temps d'horloge par rapport à sa garde, rapport porteuse sur densité de bruit par rapport au plancher de poursuite, niveau de protection par rapport à la limite d'alerte, erreur de position, satellites en poursuite, indicateurs d'alarme) par un préréglage propre au type de scénario ou par des chemins de résultat explicites, et rééchantillonnées sur une grille commune par maintien d'ordre zéro, avec les limites de phase et les événements ; l'état est transmis par carry (un canal se poursuit à partir de la valeur de fin de la phase précédente), handoff (un nombre d'une phase précédente écrit dans le scénario de cette phase) et end_at (une phase se termine à un instant qu'une exécution a calculé, tel que le temps de détection d'un moniteur de leurrage). SWEEP : une grille sur une à trois clés pointées de scénario de n'importe quel type de scénario (un segment entier indexe un tableau de tables, comme dans system.2.sisre_m), avec des métriques lues par chemin de résultat et, avec plus d'une exécution, un ensemble Monte Carlo initialisé à chaque nœud. MONTE_CARLO : la réalisation k s'exécute à base_seed + k ; chaque métrique rapporte la moyenne, l'écart type, les percentiles au rang le plus proche 5e/50e/95e et un intervalle de confiance bootstrap à graine fixe de { "95" } % sur la moyenne. COMPOSE : plusieurs scénarios sous des valeurs partagées (la puissance et la position d'un brouilleur écrites dans un récepteur maritime et un récepteur routier), avec un résumé combiné meilleur/pire cas. Le résultat porte un hachage de campagne, un condensé sur chaque résultat de membre, et une entrée d'unités pour chaque nombre émis ; les exports d'interopérabilité écrivent chaque scénario membre qui a une géométrie comme son propre jeu de fichiers. Les identités de composition sont testées : une campagne à une seule phase reproduit l'exécution autonome bit pour bit, un ensemble à graine fixe est stable à l'octet près, et sur une horloge à bruit blanc de fréquence la moyenne de l'ensemble tombe à l'intérieur de l'intervalle rapporté avec une dispersion correspondant à sqrt(q_wf * tau). MODELLED : le carry additif et le maintien d'ordre zéro sont des choix de modélisation, et chaque phase porte l'étiquette du type de scénario qui l'a exécutée.

# text
# c1: scenarios/campaign-sweep-jammer-power.toml
# c2: jamming
seg-05e842f80dbb = Une exécution de <c1/> se résume ainsi : campaign 46aa07cb58fb | Jammer power sweep: availability and J/S against transmit power | sweep of <c2/>: { "13" } nodes over [jammer_power] | { "13" } member runs (MODELLED)

# text
# c1: title
# c2: seed
# c3: timeline
# c4: phases
# c5: sweep
# c6: monte_carlo
# c7: compose
seg-bf339fa14645 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/campaign-sweep-jammer-power.toml
seg-abd3eac6da41 = L'exemple <c1/> définit, entre autres :

# text
seg-c4f955d5f506 = disponibilité

# text
# c1: scenarios/
seg-7bcf77278958 = { "22" } scénarios fournis utilisent ce type de scénario ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-38faa927b2bd = lin

# text
seg-1a33a746eeee = Étiquette du résultat (celle du moteur) : composition MODELLED de types de scénario existants. Chaque nombre est lu dans une véritable exécution du type de scénario nommé ; l'enchaînement (report additif d'un canal à travers une limite de phase, maintien d'ordre zéro sur la grille de la chronologie, phase terminée à un instant calculé) est un choix de modélisation, et chaque phase porte l'étiquet

# attr:alt
seg-b2c7cd1f9712 = Le graphique que le moteur écrit pour scenarios/campaign-sweep-jammer-power.toml, type de scénario campaign

# text
seg-8d3c1f9f3e9a = <b>MODELLED</b> iq::campaign::detect et l'exécuteur de campagne : une table facultative [monitors] exécute les moniteurs IQ sur chaque cellule en un seul passage de l'exécuteur. Tests : <a1>iq_campaign.rs</a1>.

# text
seg-7e491ab49c2f = <b>MODELLED</b> iq::campaign::detect (windows, roc) et iq::campaign::report::rocs : chaque cellule d'une campagne avec moniteurs conserve, par type d'alarme et par canal, le maximum de la statistique de test propre au moniteur sur chaque fenêtre d'événement indiquée (positif) et sur t

# text
# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-f21e0ab2ad06 = <b>MODELLED</b> iq::labfit (campaign, cn0, iqfit, iqreport) et <c1/> sur <c2/>, Python <c3/> et l'outil MCP labfit (dossiers de campagne à l'intérieur de son répertoire de travail uniquement) : lit un dossier de sortie <c4/> par son Tests : <a1>iq_labfit_followup.rs</a1>.

# text
# c1: campaign
seg-f16a176dc1f8 = <b>MODELLED</b> Les phases du type de scénario <c1/> : chaque phase exécute un ou plusieurs scénarios de types existants via run_toml, lit leurs sorties dans des canaux nommés (erreur de temps d'horloge et garde, rapport porteuse sur densité de bruit effectif moyen et plancher de poursuite, v Tests : <a1>campaign_composition_reference.rs</a1>.

# text
seg-be831b52a339 = et { "4" } autres dans la matrice.

# text
seg-cc2ad9e12064 = <b>MODELLED</b> Bilan de liaison J/S géométrique, C/N₀ anti-brouillage, perte d'accrochage par satellite. Référence indépendante (InternalConsistency) : Équation du bilan de liaison C/N₀ anti-brouillage vérifiée par rapport à une nouvelle dérivation numpy indépendante (partage la même forme fermée → InternalConsistency) plus une caractérisation de la dégradation du C/N₀ de JammerTest-2024 réel. { "0.30" } tour { "2" }, bloqué (reste MODELLED) : la baisse de C/N0 mesurée de JammerTest { "2024" } par rapport à une prédiction de bilan de liaison (préenregistrée 6a66994b, à { "3" } dB près) n'a pas été exécutée parce que la position et le pointage de l'antenne F8.1 à

# text
seg-59afd80736c5 = <b>PARTNER</b> Non fourni — Kshana modélise la performance du signal, et non le matériel de charge utile ou d'antenne. Référence indépendante (NoneKind) : aucune : une discipline propre au partenaire, sans module ni test par conception

# text
# c1: campaign
seg-fa3ad6babe54 = <b>MODELLED</b> Le balayage du type de scénario <c1/> (une à trois clés pointées de n'importe quel type de scénario, sur les valeurs d'axe du balayage générique, avec facultativement un ensemble à chaque nœud) et la sec monte_carlo. Référence indépendante (InternalConsistency) : La forme fermée de la marche aléatoire de phase sous bruit blanc de fréquence, variance q_wf tau (NIST Technical Note { "1337" }), pour la machinerie statistique, et l'égalité à l'octet près avec les exécutions autonomes pour l'initialisation. Elle vérifie l'arithmétique d'ensemble sur le modèle d'horloge propre au moteur, et non un jeu de données externe

# text
# c1: label
seg-c15b5ac32282 = Composition MODELLED de types de scénario existants. Chaque nombre est lu dans une véritable exécution du type de scénario nommé ; l'enchaînement (report additif d'un canal à travers une limite de phase, maintien d'ordre zéro sur la grille de la chronologie, phase terminée à un instant calculé) est un choix de modélisation, et chaque phase porte l'étiquette du type de scénario qui l'a produite. (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-9e33dcc39c27 = MODELLED : le report additif et le maintien d'ordre zéro sont des choix de modélisation, et chaque phase porte l'étiquette du type de scénario qui l'a exécutée. (catalogue des types de scénario (<c1/>))

# text
# c1: jamming
seg-adcc6ea59840 = MODELLED : comme l'est le type de scénario <c1/>. (commentaire du fichier de scénario, ligne { "14" })

# text
seg-143f3f1cc521 = La résilience au brouillage en l'absence de GNSS est MODELLED, et non validée : vérifiée par rapport à sa propre identité analytique en forme fermée — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-d1c11e493795 = Les balayages de paramètres et les ensembles Monte Carlo initialisés sur n'importe quel type de scénario sont MODELLED, et non validés : vérifiés par rapport à leur propre identité analytique en forme fermée — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-edbda7aca5b9 = Page de famille : <a1>Campagnes</a1>

# text
seg-cb91473bfdda = Page thématique : <a1>LEO-PNT.md</a1>

# text
seg-c4ed27a559df = Page thématique : <a1>RESILIENCE-CROSSWALK.md</a1>

# text
seg-774e035da605 = <s1>Précédent</s1>body-pnt

# text
seg-fadd92303a4d = <s1>Suivant</s1>cislunar-arc-recovery

seg-a349aa76b0ed = PARTNER
