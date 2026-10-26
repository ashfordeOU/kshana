# docs--kinds-campaigns: translations (fr)

# text
seg-b03d56f501c3 = Type

# text
seg-a07990e776cb = Campagne : des types de scénario existants composés en une seule exécution, chaque nombre étant lu dans une véritable exécution du type de scénario nommé. Quatre sections, en toute combinaison. PHASES : une mission enchaînée sur une chronologie partagée -- chaque phase exécute un ou plusieurs scénarios (par exemple brouillage, puis leurrage, puis une horloge en holdover avec un système de navigation inertielle en roue libre à ses côtés, puis une alarme d'intégrité, puis la récupération), leurs sorties sont lues dans des canaux nommés (erreur de temps d'horloge par rapport à sa garde, rapport porteuse sur densité de bruit par rapport au plancher de poursuite, niveau de protection par rapport à la limite d'alerte, erreur de position, satellites en poursuite, indicateurs d'alarme) par un préréglage propre au type de scénario ou par des chemins de résultat explicites, et rééchantillonnées sur une grille commune par maintien d'ordre zéro, avec les limites de phase et les événements ; l'état est transmis par carry (un canal se poursuit à partir de la valeur de fin de la phase précédente), handoff (un nombre d'une phase précédente écrit dans le scénario de cette phase) et end_at (une phase se termine à un instant qu'une exécution a calculé, tel que le temps de détection d'un moniteur de leurrage). SWEEP : une grille sur une à trois clés pointées de scénario de n'importe quel type de scénario (un segment entier indexe un tableau de tables, comme dans system.2.sisre_m), avec des métriques lues par chemin de résultat et, avec plus d'une exécution, un ensemble Monte Carlo initialisé à chaque nœud. MONTE_CARLO : la réalisation k s'exécute à base_seed + k ; chaque métrique rapporte la moyenne, l'écart type, les percentiles au rang le plus proche 5e/50e/95e et un intervalle de confiance bootstrap à graine fixe de { "95" } % sur la moyenne. COMPOSE : plusieurs scénarios sous des valeurs partagées (la puissance et la position d'un brouilleur écrites dans un récepteur maritime et un récepteur routier), avec un résumé combiné meilleur/pire cas. Le résultat porte un hachage de campagne, un condensé sur chaque résultat de membre, et une entrée d'unités pour chaque nombre émis ; les exports d'interopérabilité écrivent chaque scénario membre qui a une géométrie comme son propre jeu de fichiers. Les identités de composition sont testées : une campagne à une seule phase reproduit l'exécution autonome bit pour bit, un ensemble à graine fixe est stable à l'octet près, et sur une horloge à bruit blanc de fréquence la moyenne de l'ensemble tombe à l'intérieur de l'intervalle rapporté avec une dispersion correspondant à sqrt(q_wf * tau). MODELLED : le carry additif et le maintien d'ordre zéro sont des choix de modélisation, et chaque phase porte l'étiquette du type de scénario qui l'a exécutée.

# attr:alt
seg-b2c7cd1f9712 = Le graphique que le moteur écrit pour scenarios/campaign-sweep-jammer-power.toml, type de scénario campaign

# text
# c1: docs/kinds/campaigns.md
seg-ea93f81fa08b = Source : <c1/>

# text
seg-7f8e8af56bc0 = Campagnes (famille de types de scénario)

# text
seg-c8012ee549ea = { "1" } type de scénario du moteur v{ $version }. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, pas un équipement de navigation homologué et pas un service de sauvegarde de la vie humaine. Chaque libellé ici est celui du moteur ou de la matrice de vérification ; un type est MODELLED sauf indication contraire de la matrice (comment un libellé s'obtient : la section Evidence du README).

# text
# c1: kshana scenarios/campaign-jam-spoof-holdover-integrity.toml
seg-09ed7c4e175c = Pages thématiques : <a1>CAMPAIGNS</a1>. En exécuter une : <c1/>. Toutes les familles : <a2>KINDS.md</a2>.

# attr:alt
seg-b49ec180e810 = Planche-contact des graphiques que le moteur écrit pour les types de la famille Campagnes

# text
seg-4e31c8daf798 = Registre

# text
seg-b2016159c9d0 = Campagne : des types de scénario existants composés en une seule exécution, chaque nombre étant lu dans une vraie exécution du type nommé.

# text
# c1: title
# c2: seed
# c3: timeline
# c4: phases
# c5: sweep
# c6: monte_carlo
# c7: compose
seg-25148644a262 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-e0334a6899b6 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>campaign</a1>.

# text
seg-906f63ffbc30 = <s1>Précédent</s1>Code de conduite

# text
seg-cdf23ced49bd = <s1>Suivant</s1>Horloges, synchronisation temporelle et holdover
