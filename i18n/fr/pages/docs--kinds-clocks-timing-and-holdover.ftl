# docs--kinds-clocks-timing-and-holdover: translations (fr)

# text
seg-b03d56f501c3 = Type

# text
seg-78cba87823f7 = Holdover d'horloge par rapport à la spécification ; ensemble Monte-Carlo facultatif (runs > { "1" }).

# attr:alt
seg-cb0b7da83f5c = Le graphique que le moteur écrit pour scenarios/clock-ensemble.toml, type de scénario clock

# text
seg-c0924aa36e64 = Test de holdover MODELLED d'un système de synchronisation temporelle, noté à partir d'un enregistrement d'erreur temporelle que fournit l'OPÉRATEUR (un journal linuxptp ptp4l, phc2sys ou ts2phc, un journal de suivi ou de statistiques chrony, un journal d'horloge TICC, TimeLab ou RINEX, ou des paires time_s,time_error_ns). Le test comporte quatre étapes et Kshana n'en effectue aucune : une RÉFÉRENCE DE BASE verrouillée, le GNSS RETIRÉ par l'opérateur (le câble d'antenne ou la sortie du simulateur ; Kshana ne transmet ni ne pilote rien) à un instant indiqué, le HOLDOVER sur l'oscillateur propre du système, et le RÉTABLISSEMENT après que l'opérateur a rétabli le GNSS à un second instant indiqué. L'enregistrement est découpé à ces deux instants. Référence de base : statistiques d'erreur temporelle et masques ITU-T écrits pour une horloge verrouillée. Holdover : statistiques, l'écart relatif de fréquence que le système a tenu (une droite des moindres carrés), les masques écrits pour le holdover ou une horloge autonome, l'enveloppe de holdover ePRTC-A à partir de la durée verrouillée indiquée, et le temps nécessaire pour dépasser chaque budget d'erreur temporelle. Rétablissement : si et quand |TE| est entré dans une bande indiquée et y est resté, le pic et le plus grand saut. Chaque limite est transcrite d'un tableau public de l'ITU-T (les masques de synchronisation des télécommunications) ; les termes sont « mesuré par rapport au masque », et les deux instants sont l'énoncé de l'opérateur, non vérifié. Un enregistrement trop court pour un masque est INCOMPLETE, jamais extrapolé. Voir docs/TIMING-HIL.md.

# attr:alt
seg-8ce93392747b = Le graphique que le moteur écrit pour scenarios/holdover-test-ptp4l.toml, type de scénario holdover-test

# text
seg-540545e6f846 = Chaîne de synchronisation temporelle quantique de confiance MODELLED : un budget de transfert de temps de bout en bout quantique (horloge à réseau optique + liaison à intrication/photon unique) contre classique (CSAC + liaison RF bidirectionnelle), un niveau de protection de la synchronisation temporelle réutilisé + une figure de mérite de sécurité contre les attaques par retard/rejeu (1-P_md), une probabilité de détection d'anomalie d'horloge + une latence CUSUM, et le compromis quantique contre classique sous forme de TradeEvidence honnête avec un dossier de représentativité + d'écarts avant le vol. Paramètres de dispositif/liaison illustratifs à sources publiques ; modélise la classe, aucun TRL, vol ni certification revendiqué.

# attr:alt
seg-09760f892c7b = Le graphique que le moteur écrit pour scenarios/quantum-time-transfer.toml, type de scénario quantum-time-transfer

# text
seg-1b61962464c5 = Synchronisation d'un créneau : nombre de secondes avant qu'une horloge en marche libre ne sorte de la marge de garde d'un créneau d'acheminement ou d'affectation indexé sur le temps (l'erreur de temps absolue maximale que le créneau tolère), contribution de chaque terme à cet instant avec le terme dominant nommé (incertitude de recalage, bruit blanc de phase, bruit de fréquence blanc, de scintillation, de marche aléatoire et de course aléatoire, décalage de fréquence résiduel, température, vieillissement), temps restant depuis le dernier recalage, et plus grand intervalle de recalage qui maintient l'horloge dans la marge, net de la latence du recalage. L'oscillateur est une valeur par défaut de CLASSE (csac, uso, dsac, tcxo, ocxo ou rafs : un écart-type d'Allan à une seconde cité et un plancher de bruit rouge supposé), un PRÉRÉGLAGE DE FICHE TECHNIQUE de synchronisation télécom ou une FICHE TECHNIQUE en ligne (maxima d'écart-type d'Allan ajustés comme une enveloppe, plus le vieillissement et un coefficient de température), ou un ENREGISTREMENT DE PHASE MEASURED en ligne (son écart-type d'Allan chevauchant ajusté par moindres carrés pondérés dans la base du bruit blanc de phase et du bruit de modulation de fréquence de l'IEEE Std { "1139" }, de sorte que le plancher de bruit rouge est mesuré et non supposé). Un dépassement au-delà du plus long temps de moyennage que la fiche technique ou l'enregistrement permet est signalé comme extrapolé. Une section facultative de leurrage ajoute le niveau de protection de la synchronisation temporelle pour un récepteur en orbite : vitesse et période orbitales, durée pendant laquelle un seul leurre au sol peut atteindre le satellite par passage, plancher du moniteur assisté par l'horloge et latence de détection CUSUM, borne conditionnelle, écart qu'accumule un leurre à un taux de rampe maximal donné avant que le satellite ne quitte sa portée ou qu'une vérification indépendante ne s'exécute, et indication si chaque vérification par contact au sol ou par liaison croisée est indépendante de ce leurre. VALIDATED : l'inversion de holdover à partir d'un enregistrement ajusté, mise de côté sur une vraie horloge au césium mesurée par rapport à un maser à hydrogène (tests/slot_timing_cs5071a_holdout.rs, conditionné par les données) ; sur un oscillateur à quartz mesuré, la prédiction mise de côté est prudente mais n'atteint pas le seuil, de sorte que le cas du quartz est MODELLED. MODELLED : les sources de classe et de fiche technique, les termes déterministes et l'évaluation du leurrage.

# attr:alt
seg-97a91c8a60cd = Le graphique que le moteur écrit pour scenarios/slot-timing-ocxo-leo.toml, type slot-timing

# text
seg-4f19d4fb1341 = Balayage N-D générique sur n'importe quel paquet via des clés TOML pointées / des chemins de métriques JSON.

# attr:alt
seg-621a18c07044 = Le graphique que le moteur écrit pour scenarios/sweep-nd-inertial.toml, type sweep-nd

# text
seg-e7ab7b55c969 = Balayage 1-D d'étude de compromis sur un paramètre du paquet d'horloge.

# attr:alt
seg-c784b8f22f12 = Le graphique que le moteur écrit pour scenarios/sweep-clock-stability.toml, type sweep

# text
seg-a448b24ded2b = Synchronisation télécom : erreur de temps, erreur maximale d'intervalle de temps (MTIE) et déviation de temps (TDEV) d'un holdover GNSS, vérifiées par rapport aux masques de l'UIT-T avec un PASS ou un FAIL et une marge par masque. L'entrée est soit un HOLDOVER SYNTHÉTIQUE (un préréglage d'oscillateur -- ocxo, rubidium, césium ou csac, chacun portant les valeurs de stabilité, de vieillissement et de température d'une fiche technique publique nommée de Microchip -- plus la durée de perte du GNSS, la longueur de l'enregistrement et l'intervalle d'échantillonnage ; l'horloge en marche libre porte un bruit de fréquence blanc, de scintillation et, lorsque l'ajustement à la fiche technique l'exige, de marche aléatoire, un vieillissement linéaire et un terme de température sinusoïdal) soit une SÉRIE INGÉRÉE de paires [time_s, time_error_ns] fournies en ligne (et, uniquement sur les versions natives, un fichier CSV). Masques : UIT-T G.8272 (07/2025) PRTC-A et PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE Tables 1-2, TDEV Tables 3-4) ; G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC verrouillé ({ "30" } ns, Tables 1-2) et holdover ePRTC-A (l'enveloppe d'erreur de temps de la Table { "3" } passant de { "30" } ns à { "100" } ns sur la période de holdover H fixée par la durée de verrouillage, MTIE Table { "4" }, TDEV Table { "5" }) ; G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) classes A-C de T-BC/T-TSC (max|TE|, erreur de temps constante, MTIE et TDEV filtrés passe-bas) et classe D (max|TE_L| { "5" } ns, la seule valeur de classe D qui ne soit pas laissée à étude ultérieure) ; G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) point de référence C (max|TE_L| { "1100" } / { "600" } / { "100" } ns avec MTIE Tables 7-1 à 7-3). Chaque entrée qu'une Recommandation marque comme « à l'étude » est absente plutôt que remplie, et chaque rapport liste ce qui n'est pas implémenté. Rapporte aussi le temps de dépassement de chaque budget d'erreur de temps maximale (par défaut : { "100" } ns max|TE_HO| ePRTC, { "400" } ns allocation de holdover du réseau, { "1100" } ns point C, { "1.5" } us classe { "4" }), les courbes MTIE/TDEV sous forme de tableau CSV avec chaque limite de masque, et une entrée d'unités et de provenance par champ numérique. VALIDATED : les estimateurs MTIE et TDEV par rapport au paquet allantools sur une série de holdover versionnée dans le dépôt. MODELLED : les tables de masques sont des transcriptions, et un holdover synthétique est un modèle construit à partir de maxima de fiches techniques, et non la mesure d'une unité quelconque. Pas un test de respect de la norme.

# attr:alt
seg-ec7745a09d08 = Le graphique que le moteur écrit pour scenarios/telecom-synce-eec.toml, type telecom-timing

# text
seg-9a2bb9809aed = Transfert bidirectionnel de temps et de fréquence par satellite entre deux stations via un relais géostationnaire : l'équation bidirectionnelle résolue pour T_A - T_B avec chaque terme non réciproque (retards des équipements de station, ionosphère en bande Ku, transpondeur, Sagnac), un bilan d'incertitude en quadrature dont le terme de type A est le TDEV de la liaison simulée au temps de moyennage, une liaison simulée avec bruit de phase blanc et de scintillation et une non-réciprocité diurne, et la stabilité (dérive, RMS résiduel, TDEV, ADEV) de toute série BIPM Circular T Section { "1" }, CSV MJD,ns ou enregistrements d'horloge de station RINEX IGS fournie. MODELLED.

# attr:alt
seg-92d3c84024d7 = Le graphique que le moteur écrit pour scenarios/time-transfer-budget.toml, type time-transfer-budget

# text
seg-ccb244e60d60 = Transfert bidirectionnel de temps/fréquence optique contre RF.

# attr:alt
seg-bd76bd68eab3 = Le graphique que le moteur écrit pour scenarios/timetransfer.toml, type timetransfer

# text
seg-4e31c8daf798 = Registre

# text
# c1: docs/kinds/clocks-timing-and-holdover.md
seg-45a59bc9ac90 = Source : <c1/>

# text
seg-3b549536beed = Horloges, synchronisation temporelle et holdover (famille de types de scénario)

# text
seg-9095869ec445 = { "9" } types de scénario du moteur v{ $version }. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, pas un équipement de navigation homologué et pas un service de sauvegarde de la vie humaine. Chaque libellé ici est celui du moteur ou de la matrice de vérification ; un type est MODELLED sauf indication contraire de la matrice (comment un libellé s'obtient : la section Evidence du README).

# text
# c1: kshana scenarios/clock-holdover.toml
seg-59c2beac56b5 = Pages thématiques : <a1>TELECOM-TIMING</a1>, <a2>SLOT-TIMING</a2>, <a3>TIMING-HIL</a3>, <a4>CLOCK-LOG-FORMATS</a4>. En exécuter une : <c1/>. Toutes les familles : <a5>KINDS.md</a5>.

# attr:alt
seg-b333618375db = Planche-contact des graphiques que le moteur écrit pour les types de la famille Horloges, synchronisation temporelle et holdover

# text
seg-efd15cff3d32 = MODELLED (libellé du résultat)

# text
seg-ff7dca09f0f2 = Synchronisation télécom : erreur de temps, erreur maximale d'intervalle de temps (MTIE) et déviation de temps (TDEV) d'un holdover GNSS, vérifiées par rapport aux masques de l'UIT-T avec un PASS ou un FAIL et une marge par masque.

# text
seg-651ef9489065 = MODELLED { "5" } · VALIDATED { "1" }

# text
seg-413edbab9fa9 = Synchronisation d'un créneau : nombre de secondes avant qu'une horloge en marche libre ne sorte de la marge de garde d'un créneau d'acheminement ou d'affectation indexé sur le temps (l'erreur de temps absolue maximale que le créneau tolère), contribution de chaque terme à cet

# text
seg-23dbca6bce68 = MODELLED { "2" } · VALIDATED { "1" }

# text
seg-d425ce2b9f9c = Transfert bidirectionnel de temps et de fréquence par satellite entre deux stations via un relais géostationnaire : l'équation bidirectionnelle résolue pour T_A - T_B avec chaque terme non réciproque (retards des équipements de station, Ku

# text
seg-a2a710b3204f = Essai de holdover MODELLED d'un système de synchronisation, noté à partir d'un enregistrement d'erreur de temps que l'OPÉRATEUR fournit (un journal linuxptp ptp4l, phc2sys ou ts2phc, un journal de suivi ou de statistiques chrony, un TICC, TimeLab ou RINEX

# text
seg-1da440dd525c = Chaîne de synchronisation quantique de confiance MODELLED : un bilan de transfert de temps de bout en bout quantique (horloge à réseau optique + liaison à intrication/photon unique) contre classique (CSAC + bidirectionnel RF), un niveau de protection de la synchronisation temporelle réutilisé

# text
# c1: seed
# c2: threshold_ns
# c3: time
# c4: gnss
# c5: clock_quantum
# c6: clock_classical
# c7: runs
# c8: integrity
seg-50d75d48ed43 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Facultatifs : <c7/>, <c8/>.

# text
seg-3273244f755c = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>clock</a1>.

# text
# c1: parameter
# c2: metric
# c3: start
# c4: stop
# c5: steps
# c6: base
# c7: scale
seg-ee8d6e20c844 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Facultatif : <c7/>.

# text
seg-e359cc42506e = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>sweep</a1>.

# text
# c1: base
# c2: axes
# c3: metrics
seg-616716b33732 = Champs obligatoires : <c1/>, <c2/>, <c3/>.

# text
seg-6f282be980ca = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>sweep-nd</a1>.

# text
# c1: seed
# c2: masks
# c3: budgets
# c4: holdover
# c5: series
seg-79c3d3cd6c7d = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-c23e498daa3d = <b>Registre :</b> MODELLED { "5" } · VALIDATED { "1" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>telecom-timing</a1>.

# text
# c1: oscillator
# c2: slot
# c3: spoofing
seg-248e1686fddc = Champs obligatoires : <c1/>, <c2/>. Facultatif : <c3/>.

# text
seg-cc04bc2d43c5 = <b>Registre :</b> MODELLED { "2" } · VALIDATED { "1" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>slot-timing</a1>.

# text
# c1: seed
# c2: samples
# c3: step_s
# c4: range_spec_mm
# c5: link_quantum
# c6: link_classical
seg-50273a29deec = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-adf570e18299 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>timetransfer</a1>.

# text
# c1: station_a
# c2: station_b
# c3: satellite_lon_deg
# c4: transponder_ab_ns
# c5: transponder_ba_ns
# c6: white_noise_ns
# c7: uncertainty
# c8: uplink_ghz
# c9: downlink_ghz
# c10: true_offset_ns
# c11: flicker_noise_ns
# c12: diurnal_amplitude_ns
# c13: reciprocity_bias_ns
# c14: step_s
# c15: span_days
# c16: averaging_s
# c17: seed
# c18: series
seg-5134a01b60a0 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>. Facultatifs : <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-09b554a74d49 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>time-transfer-budget</a1>.

# text
# c1: test
# c2: series
# c3: masks
# c4: budgets
seg-58952681ea9d = Champs obligatoires : <c1/>, <c2/>. Facultatifs : <c3/>, <c4/>.

# text
seg-635ec95c2e86 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>holdover-test</a1>.

# text
# c1: integration_s
# c2: dissemination_interval_s
# c3: link_loss_db
# c4: classical_link_sigma_s
# c5: monitor_pfa
# c6: attack_delay_s
# c7: clock_fault_sigma
seg-76bb4110ea36 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-bb6d7df61e2f = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>quantum-time-transfer</a1>.

# text
seg-245adc6e6766 = <s1>Précédent</s1>Campagnes

# text
seg-960d5c757310 = <s1>Suivant</s1>Constellations, couverture et géométrie
