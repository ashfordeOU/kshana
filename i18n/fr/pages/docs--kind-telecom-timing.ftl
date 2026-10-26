# docs--kind-telecom-timing: translations (fr)

# text
seg-f42465f7d066 = ns

# text
seg-98151954f217 = false

# text
seg-cb91473bfdda = Page thématique : <a1>LEO-PNT.md</a1>

# text
seg-c61e88721556 = Type de scénario du moteur v{ $version }, famille <a1>Horloges, synchronisation temporelle et holdover</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input : une couche d'analyse unique qui transforme un fichier d'horloge RINEX (enregistrements AS/AR d'une horloge nommée, versions { "2" } et { "3.00" } à { "3.04" }), un journal ASCII de phase ou de fréquence de type TimeLab, ou un journal d'horodatages ou d'intervalles TAPR TICC en un fichier uniforme de pha Tests : <a1>clock_log_allantools.rs</a1>.

# text
seg-849c08d3ce70 = Page de famille : <a1>Horloges, synchronisation temporelle et holdover</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
# c1: telecom-timing
seg-e7273fd2a640 = <b>VALIDATED</b> L'erreur d'intervalle de temps maximale et l'écart temporel que le type de scénario <c1/> rapporte, sur un enregistrement de holdover à l'échelle des télécommunications : un fenêtrage glissant à file monotone en O(n). Référence indépendante (ExternalDataset) : allantools { "2024.06" } — une bibliothèque tierce indépendante de stabilité de fréquence — mtie() et tdev() sur tests/fixtures/telecom_timing/holdover_te_series.csv, la série étant analysée à partir du même texte à 17 chiffres significatifs des deux côtés ; la référence enregistre le SHA-256 de la série et peut être régénérée hors ligne via tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Valide les ESTIMATEURS sur cet enregistrement, non la syn

# text
seg-4cf0f94f96c9 = <b>MODELLED</b> Limites transcrites de l'ITU-T G.8272 (07/2025) PRTC-A/B, de G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC verrouillé et holdover ePRTC-A (y compris l'enveloppe d'erreur temporelle du tableau { "3" }). Référence indépendante (InternalConsistency) : transcription des Recommandations nommées (téléchargeables librement sur itu.int), chaque limite portant son tableau ou sa clause, listée avec chaque élément non confirmé ou non implémenté dans docs/TELECOM-TIMING.md ; les identités de continuité aux points de rupture qu'impliquent les tableaux sont vérifiées dans les tests. Une transcription de normes avec contrôles de cohérence interne, et non un essai de respect de la norme ni une validation externe. { "0.30" } tour { "2" } (préenregistré

# text
seg-5547f1f662d3 = et { "2" } de plus dans la matrice.

# text
seg-8aee75a55007 = ocxo

# text
# c1: docs/kinds/by-kind/telecom-timing.md
seg-9b72d3b3a0ab = Source : <c1/>

# text
# c1: telecom-timing
seg-f4dc88ffe6b5 = <c1/> (type de scénario)

# text
seg-a448b24ded2b = Synchronisation télécom : erreur de temps, erreur maximale d'intervalle de temps (MTIE) et déviation de temps (TDEV) d'un holdover GNSS, vérifiées par rapport aux masques de l'UIT-T avec un PASS ou un FAIL et une marge par masque. L'entrée est soit un HOLDOVER SYNTHÉTIQUE (un préréglage d'oscillateur -- ocxo, rubidium, césium ou csac, chacun portant les valeurs de stabilité, de vieillissement et de température d'une fiche technique publique nommée de Microchip -- plus la durée de perte du GNSS, la longueur de l'enregistrement et l'intervalle d'échantillonnage ; l'horloge en marche libre porte un bruit de fréquence blanc, de scintillation et, lorsque l'ajustement à la fiche technique l'exige, de marche aléatoire, un vieillissement linéaire et un terme de température sinusoïdal) soit une SÉRIE INGÉRÉE de paires [time_s, time_error_ns] fournies en ligne (et, uniquement sur les versions natives, un fichier CSV). Masques : UIT-T G.8272 (07/2025) PRTC-A et PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE Tables 1-2, TDEV Tables 3-4) ; G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC verrouillé ({ "30" } ns, Tables 1-2) et holdover ePRTC-A (l'enveloppe d'erreur de temps de la Table { "3" } passant de { "30" } ns à { "100" } ns sur la période de holdover H fixée par la durée de verrouillage, MTIE Table { "4" }, TDEV Table { "5" }) ; G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) classes A-C de T-BC/T-TSC (max|TE|, erreur de temps constante, MTIE et TDEV filtrés passe-bas) et classe D (max|TE_L| { "5" } ns, la seule valeur de classe D qui ne soit pas laissée à étude ultérieure) ; G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) point de référence C (max|TE_L| { "1100" } / { "600" } / { "100" } ns avec MTIE Tables 7-1 à 7-3). Chaque entrée qu'une Recommandation marque comme « à l'étude » est absente plutôt que remplie, et chaque rapport liste ce qui n'est pas implémenté. Rapporte aussi le temps de dépassement de chaque budget d'erreur de temps maximale (par défaut : { "100" } ns max|TE_HO| ePRTC, { "400" } ns allocation de holdover du réseau, { "1100" } ns point C, { "1.5" } us classe { "4" }), les courbes MTIE/TDEV sous forme de tableau CSV avec chaque limite de masque, et une entrée d'unités et de provenance par champ numérique. VALIDATED : les estimateurs MTIE et TDEV par rapport au paquet allantools sur une série de holdover versionnée dans le dépôt. MODELLED : les tables de masques sont des transcriptions, et un holdover synthétique est un modèle construit à partir de maxima de fiches techniques, et non la mesure d'une unité quelconque. Pas un test de respect de la norme.

# text
# c1: scenarios/telecom-synce-eec.toml
seg-07f81cfd606a = Une exécution de <c1/> se résume ainsi : telecom-timing : max|TE| { "488.2" } ns sur { "12000" } s ; g8262-eec-option-1 FAIL, g8262-eec-option-2 FAIL, g8262-1-eeec FAIL (MODELLED)

# text
# c1: seed
# c2: masks
# c3: budgets
# c4: holdover
# c5: series
seg-17f291bfc65d = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/telecom-synce-eec.toml
seg-d192feecd4b3 = L'exemple <c1/> définit, entre autres :

# text
seg-e7cab30ef039 = [] (aucun élément)

# text
seg-864d84810a5c = [g8262-eec-option-1, g8262-eec-option-2, g8262-1-eeec]

# text
seg-01b1287f233b = Libellé du résultat (celui du moteur) : MODELLED — erreur de temps, MTIE et TDEV vérifiés par rapport à des masques UIT-T transcrits. Les estimateurs sont validés par rapport à allantools ; les tables de masques sont des transcriptions des Recommandations nommées ; un holdover synthétique est un modèle construit à partir de valeurs publiques de fiches techniques, et non la mesure d'une unité quelconque. Pas un co

# attr:alt
seg-ec7745a09d08 = Le graphique que le moteur écrit pour scenarios/telecom-synce-eec.toml, type telecom-timing

# text
seg-219651a7958b = MODELLED { "5" } · VALIDATED { "1" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type.

# text
# c1: telecom-timing
seg-c21ebd79f497 = <b>VALIDATED</b> L'erreur maximale d'intervalle de temps et la déviation de temps que rapporte le type de scénario <c1/>, sur un enregistrement de holdover à l'échelle des télécoms : un MTIE à fenêtre glissante en O(n) par file monotone (telecom_timing::mtie_sliding, nécessaire pour qu'une journée d'échantillons à une seconde Tests : <a1>telecom_timing_reference.rs</a1>.

# text
seg-75aa6f7234ae = <b>MODELLED</b> Limites transcrites de l'UIT-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. Tests : <a1>telecom_timing_reference.rs</a1>.

# text
# c1: telecom-timing
seg-d0ab0ca72b80 = <b>MODELLED</b> Sept masques de génération de dérive MTIE et TDEV à température constante pour le type <c1/> : G.811 (09/1997) PRC (autonome), G.812 (06/2004) Types I, II et III, G.8262 (10/2024) EEC Options { "1" } et { "2" } et G.8262.1 (11/2025) eEEC (verrouillé

# text
seg-d4bd840708db = <b>MODELLED</b> Quatre préréglages — OCXO (Microchip OX-208), rubidium (Microchip 8040C), césium (Microchip 5071A tube haute performance) et CSAC (Microchip SA.45s) — chacun portant . Référence indépendante (InternalConsistency) : les quatre fiches techniques Microchip nommées (numéros de document et URL dans chaque préréglage et dans docs/TELECOM-TIMING.md) pour les valeurs d'entrée ; la rampe de vieillissement en forme fermée et la propriété d'enveloppe de l'ajustement comme vérifications internes. La façon dont les valeurs deviennent un modèle de bruit — l'ajustement, la règle du plancher, le mois de 30 jours, la lecture linéaire de la température — est un choix de modélisation ; aucun préréglage n'est la mesure d'une unité. { "0.30" } tour { "2" }, seuils unilatéraux contre

# text
# c1: not_implemented[0]
seg-cbb39b4105ac = toute exigence que les Recommandations marquent comme « à l'étude » (classe D au-delà de max|TE_L|, holdover ePRTC-B, holdover T-BC/T-TSC avec les deux entrées perdues, limites réseau TDEV, MTIE et TDEV du holdover ePRTC-A au-delà de { "10 000" } s) (résultat <c1/>)

# text
# c1: not_implemented[1]
seg-a70f575aeb21 = erreur de temps dynamique filtrée passe-haut (dTE_H, G.8273.2 Table 7-7 et G.8271.1 clauses 7.3.2-7.3.3) (résultat <c1/>)

# text
# c1: not_implemented[2]
seg-66446247fc49 = le MTIE à température variable de la G.8273.2 Table 7-6 et le MTIE de holdover assisté par la couche physique de la G.8273.2 Table 7-10 (résultat <c1/>)

# text
# c1: not_implemented[3]
seg-c1d601b45182 = erreur de temps relative (cTE_R, dTE_R,L) entre deux sorties (résultat <c1/>)

# text
# c1: not_implemented[4]
seg-6146f857c2df = le filtre de paquets à moyenne glissante que G.8272 et G.8272.1 indiquent pour les interfaces PTP : la série est traitée comme une erreur d'intervalle de temps d'une impulsion par seconde (résultat <c1/>)

# text
# c1: label
seg-d5e956023b48 = MODELLED — erreur de temps, MTIE et TDEV vérifiés par rapport à des masques UIT-T transcrits. Les estimateurs sont validés par rapport à allantools ; les tables de masques sont des transcriptions des Recommandations nommées ; un holdover synthétique est un modèle construit à partir de valeurs publiques de fiches techniques, et non la mesure d'une unité quelconque. Pas un test de respect de la norme. (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-f163ae37b8c7 = MODELLED : les tables de masques sont des transcriptions, et un holdover synthétique est un modèle construit à partir de maxima de fiches techniques, et non la mesure d'une unité quelconque. (catalogue des types (<c1/>))

# text
seg-a0ddb65b00af = L'horloge : le préréglage OCXO (fiche technique Microchip OX-208, Rév. 12-1-2021), en marche libre dès le premier échantillon avec un bruit de fréquence blanc, de scintillation et (lorsque l'ajustement l'exige) de marche aléatoire ajusté aux maxima d'écart-type d'Allan de la fiche technique, et son vieillissement linéaire. La température est maintenue constante (amplitude { "0" } K), comme le supposent les masques. (commentaire du fichier de scénario, lignes { "12" } à { "15" })

# text
seg-101dbde1c65b = Page thématique : <a1>CLOCK-LOG-FORMATS.md</a1>

# text
seg-c32dc02f981d = <s1>Précédent</s1>sweep

# text
seg-8aef86c9aa68 = <s1>Suivant</s1>terrain-nav
