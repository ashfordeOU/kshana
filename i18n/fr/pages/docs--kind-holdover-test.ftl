# docs--kind-holdover-test: translations (fr)

# text
seg-f42465f7d066 = ns

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } scénarios fournis utilisent ce type de scénario ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-c61e88721556 = Type de scénario du moteur v{ $version }, famille <a1>Horloges, synchronisation temporelle et holdover</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-849c08d3ce70 = Page de famille : <a1>Horloges, synchronisation temporelle et holdover</a1>

# text
# c1: docs/kinds/by-kind/holdover-test.md
seg-73929aeded02 = Source : <c1/>

# text
# c1: holdover-test
seg-218f00012d0e = <c1/> (type de scénario)

# text
seg-c0924aa36e64 = Test de holdover MODELLED d'un système de synchronisation temporelle, noté à partir d'un enregistrement d'erreur temporelle que fournit l'OPÉRATEUR (un journal linuxptp ptp4l, phc2sys ou ts2phc, un journal de suivi ou de statistiques chrony, un journal d'horloge TICC, TimeLab ou RINEX, ou des paires time_s,time_error_ns). Le test comporte quatre étapes et Kshana n'en effectue aucune : une RÉFÉRENCE DE BASE verrouillée, le GNSS RETIRÉ par l'opérateur (le câble d'antenne ou la sortie du simulateur ; Kshana ne transmet ni ne pilote rien) à un instant indiqué, le HOLDOVER sur l'oscillateur propre du système, et le RÉTABLISSEMENT après que l'opérateur a rétabli le GNSS à un second instant indiqué. L'enregistrement est découpé à ces deux instants. Référence de base : statistiques d'erreur temporelle et masques ITU-T écrits pour une horloge verrouillée. Holdover : statistiques, l'écart relatif de fréquence que le système a tenu (une droite des moindres carrés), les masques écrits pour le holdover ou une horloge autonome, l'enveloppe de holdover ePRTC-A à partir de la durée verrouillée indiquée, et le temps nécessaire pour dépasser chaque budget d'erreur temporelle. Rétablissement : si et quand |TE| est entré dans une bande indiquée et y est resté, le pic et le plus grand saut. Chaque limite est transcrite d'un tableau public de l'ITU-T (les masques de synchronisation des télécommunications) ; les termes sont « mesuré par rapport au masque », et les deux instants sont l'énoncé de l'opérateur, non vérifié. Un enregistrement trop court pour un masque est INCOMPLETE, jamais extrapolé. Voir docs/TIMING-HIL.md.

# text
# c1: scenarios/holdover-test-ptp4l.toml
seg-cd6d840a1382 = Une exécution de <c1/> se résume ainsi : holdover-test: holdover { "1795" } s, max|TE| { "59.0" } ns; prtc-a PASS, eprtc-a-holdover FAIL; recovered { "0" } s after GNSS returned (MODELLED, measured against the mask)

# text
# c1: test
# c2: series
seg-6a3dc8804be5 = Champs obligatoires : <c1/>, <c2/>

# text
# c1: masks
# c2: budgets
seg-4792040e4773 = Champs facultatifs : <c1/>, <c2/>

# text
# c1: scenarios/holdover-test-ptp4l.toml
seg-ad4f9c40e317 = L'exemple <c1/> définit, entre autres :

# text
seg-f0517ab67e28 = [prtc-a, eprtc-a-holdover]

# text
seg-fe13d0e59509 = ptp4l[{ "1000.000" }]: master offset -4 s2 freq + { "1200" } pa

# text
seg-a0f9749e9ca1 = master

# text
seg-cd857523297f = phase

# text
seg-29a012ae4735 = refuse

# text
seg-d578fc8e6052 = Étiquette du résultat (celle du moteur) : MODELLED — un test de holdover noté à partir d'un enregistrement d'erreur temporelle fourni par l'opérateur. Chaque limite est transcrite de la Recommandation ITU-T publique nommée et le résultat est mesuré par rapport au masque ; il ne dit rien de la question de savoir si une horloge ou un système satisfait une Recommandation, et personne n'a coté ni approu

# attr:alt
seg-8ce93392747b = Le graphique que le moteur écrit pour scenarios/holdover-test-ptp4l.toml, type de scénario holdover-test

# text
# c1: holdover-test
seg-3361819ae321 = <b>MODELLED</b> Le type de scénario <c1/> : un enregistrement d'erreur temporelle (un journal d'horloge linuxptp, chrony, TICC, TimeLab ou RINEX, ou des paires time_s,time_error_ns) est découpé aux deux instants que l'opérateur indique pour le retrait et le rétablissement du GNSS en une référence de base, un holdover a

# text
# c1: telecom-timing
seg-e7273fd2a640 = <b>VALIDATED</b> L'erreur d'intervalle de temps maximale et l'écart temporel que le type de scénario <c1/> rapporte, sur un enregistrement de holdover à l'échelle des télécommunications : un fenêtrage glissant à file monotone en O(n). Référence indépendante (ExternalDataset) : allantools { "2024.06" } — une bibliothèque tierce indépendante de stabilité de fréquence — mtie() et tdev() sur tests/fixtures/telecom_timing/holdover_te_series.csv, la série étant analysée à partir du même texte à 17 chiffres significatifs des deux côtés ; la référence enregistre le SHA-256 de la série et peut être régénérée hors ligne via tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Valide les ESTIMATEURS sur cet enregistrement, non la syn

# text
seg-4cf0f94f96c9 = <b>MODELLED</b> Limites transcrites de l'ITU-T G.8272 (07/2025) PRTC-A/B, de G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC verrouillé et holdover ePRTC-A (y compris l'enveloppe d'erreur temporelle du tableau { "3" }). Référence indépendante (InternalConsistency) : transcription des Recommandations nommées (téléchargeables librement sur itu.int), chaque limite portant son tableau ou sa clause, listée avec chaque élément non confirmé ou non implémenté dans docs/TELECOM-TIMING.md ; les identités de continuité aux points de rupture qu'impliquent les tableaux sont vérifiées dans les tests. Une transcription de normes avec contrôles de cohérence interne, et non un essai de respect de la norme ni une validation externe. { "0.30" } tour { "2" } (préenregistré

# text
# c1: holdover-test
seg-142528f34e66 = <b>MODELLED</b> Le type de scénario <c1/> : un enregistrement d'erreur temporelle (un journal d'horloge linuxptp, chrony, TICC, TimeLab ou RINEX, ou des paires time_s,time_error_ns) est découpé aux deux instants. Référence indépendante (InternalConsistency) : calcul à la main sur des enregistrements construits à partir de formules dont la pente, le saut, l'extremum et le temps de rétablissement sont connus avant l'exécution (les tests les énoncent), et les masques, l'enveloppe et les budgets des lignes de synchronisation des télécommunications ci-dessus. Aucune mesure en laboratoire d'un holdover réel n'a été notée et aucune référence indépendante externe n'a été comparée, de sorte que le type de scénario ne fait aucune affirmation sur une horloge ou un système quelconque ; un partenaire de laboratoire de synchronisation temporelle est nécessaire avant toute classe d'horloge

# text
# c1: label
seg-59ff0b0e3d2d = MODELLED — un test de holdover noté à partir d'un enregistrement d'erreur temporelle fourni par l'opérateur. Chaque limite est transcrite de la Recommandation ITU-T publique nommée et le résultat est mesuré par rapport au masque ; il ne dit rien de la question de savoir si une horloge ou un système satisfait une Recommandation, et personne ne l'a coté ni approuvé. Les instants auxquels le GNSS a été retiré puis rétabli sont l'énoncé de l'opérateur et ne sont pas vérifiés. Logiciel à titre consultatif (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-daeb4ad7aa35 = Test de holdover MODELLED d'un système de synchronisation temporelle, noté à partir d'un enregistrement d'erreur temporelle que fournit l'OPÉRATEUR (un journal linuxptp ptp4l, phc2sys ou ts2phc, un journal de suivi ou de statistiques chrony, un journal d'horloge TICC, TimeLab ou RINEX, ou des paires time_s,time_error_ns). (catalogue des types de scénario (<c1/>))

# text
seg-ff3008c250cc = Les masques de synchronisation des télécommunications ITU-T avec PASS/FAIL et marge sont MODELLED, et non validés : vérifiés par rapport à leur propre identité analytique / en forme fermée — ils détectent les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-8ccd0f911626 = Le test de holdover noté à partir d'un enregistrement d'erreur temporelle fourni par l'opérateur est MODELLED, et non validé : vérifié par rapport à sa propre identité analytique / en forme fermée — il détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-72bad5444282 = Page thématique : <a1>TIMING-HIL.md</a1>

# text
seg-3b3a24664dae = Page thématique : <a1>HARDWARE-SAFETY.md</a1>

# text
seg-b754be35fb52 = <s1>Précédent</s1>gravity-map

# text
seg-e7665ee5e30e = <s1>Suivant</s1>hybrid-optical-rf
