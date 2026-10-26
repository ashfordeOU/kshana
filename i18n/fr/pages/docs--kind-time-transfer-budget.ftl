# docs--kind-time-transfer-budget: translations (fr)

# text
seg-f42465f7d066 = ns

# text
seg-dfe78b9d0811 = GHz

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catalogue des types de scénario (<c1/>))

# text
seg-c61e88721556 = Type de scénario du moteur v{ $version }, famille <a1>Horloges, synchronisation temporelle et holdover</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-849c08d3ce70 = Page de famille : <a1>Horloges, synchronisation temporelle et holdover</a1>

# text
# c1: docs/kinds/by-kind/time-transfer-budget.md
seg-937ebbbd612c = Source : <c1/>

# text
# c1: time-transfer-budget
seg-6af6f07f5f5a = <c1/> (type de scénario)

# text
seg-9a2bb9809aed = Transfert bidirectionnel de temps et de fréquence par satellite entre deux stations via un relais géostationnaire : l'équation bidirectionnelle résolue pour T_A - T_B avec chaque terme non réciproque (retards des équipements de station, ionosphère en bande Ku, transpondeur, Sagnac), un bilan d'incertitude en quadrature dont le terme de type A est le TDEV de la liaison simulée au temps de moyennage, une liaison simulée avec bruit de phase blanc et de scintillation et une non-réciprocité diurne, et la stabilité (dérive, RMS résiduel, TDEV, ADEV) de toute série BIPM Circular T Section { "1" }, CSV MJD,ns ou enregistrements d'horloge de station RINEX IGS fournie. MODELLED.

# text
# c1: scenarios/time-transfer-budget.toml
seg-a4f8e9a09026 = Une exécution de <c1/> se résume ainsi : time-transfer-budget : décalage europe - north-america { "12.500" } ns (Sagnac { "204.365" } ns, ionosphère { "0.0213" } ns) ; u combinée { "1.087" } ns (type A { "0.031" } ns à { "86400" } s) ; { "0" } série réelle (MODELLED)

# text
# c1: station_a
# c2: station_b
# c3: satellite_lon_deg
# c4: transponder_ab_ns
# c5: transponder_ba_ns
# c6: white_noise_ns
# c7: uncertainty
seg-0353d795ebdf = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: uplink_ghz
# c2: downlink_ghz
# c3: true_offset_ns
# c4: flicker_noise_ns
# c5: diurnal_amplitude_ns
# c6: reciprocity_bias_ns
# c7: step_s
# c8: span_days
# c9: averaging_s
# c10: seed
# c11: series
seg-fe3afa366df2 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/time-transfer-budget.toml
seg-00026a1d3760 = L'exemple <c1/> définit, entre autres :

# text
seg-2409cc9397c7 = Libellé du résultat (celui du moteur) : MODELLED — équation bidirectionnelle TWSTFT (retards de station, ionosphère en bande Ku, transpondeur, Sagnac) résolue à partir de retards indiqués, un bilan d'incertitude en quadrature avec le TDEV de la liaison simulée comme terme de type A, une liaison simulée avec bruit de phase de scintillation et non-réciprocité diurne, et la stabilité de toute série r

# attr:alt
seg-92d3c84024d7 = Le graphique que le moteur écrit pour scenarios/time-transfer-budget.toml, type time-transfer-budget

# text
seg-83b9c66b9e92 = <b>MODELLED</b> L'équation bidirectionnelle TWSTFT résolue pour T_A - T_B avec les retards d'émission et de réception de station, l'asymétrie ionosphérique montante/descendante en bande Ku, la différence de retard de transpondeur et les termes de Sagnac, par rapport à son modèle direct exact ; une incertitude en quadrature

# text
seg-58cf4086c7a5 = <b>MODELLED</b> L'équation bidirectionnelle TWSTFT résolue pour T_A - T_B avec les retards d'émission et de réception de station, l'asymétrie ionosphérique montante/descendante en bande Ku, la différence de retard de transpondeur. Référence indépendante (InternalConsistency) : cohérence interne : le modèle direct et l'équation résolue concordent à { "1e-15" } s, le terme de Sagnac est égal à la forme en boucle BIPM 2A omega/c^{ "2" } indépendante du module, le terme ionosphérique est { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, et les processus de bruit présentent les formes de TDEV attendues. CE QUI N'EST PAS FAIT : aucune mesure TWSTFT réelle ni aucun rapport d'étalonnage n'a été comparé ; les retards et incertitudes indiqués sont des entrées, non mesurées ; t

# text
# c1: label
seg-15de1cdaa684 = MODELLED — équation bidirectionnelle TWSTFT (retards de station, ionosphère en bande Ku, transpondeur, Sagnac) résolue à partir de retards indiqués, un bilan d'incertitude en quadrature avec le TDEV de la liaison simulée comme terme de type A, une liaison simulée avec bruit de phase de scintillation et non-réciprocité diurne, et la stabilité de toute série réelle UTC-UTC(k) ou d'horloge de station fournie ; non comparé à une vraie liaison TWSTFT (résultat <c1/>)

# text
seg-4b0d23aed0ab = L'équation bidirectionnelle TWSTFT, le bilan d'incertitude et la stabilité de liaison avec scintillation et non-réciprocité diurne sont MODELLED, non validés : vérifiés par rapport à leur propre identité analytique en forme fermée — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-52e06909ccc5 = <s1>Précédent</s1>terrain-slam

# text
seg-a22fa1c51042 = <s1>Suivant</s1>timetransfer

# text
seg-70448ca49780 = Transfert bidirectionnel de temps et de fréquence par satellite (TWSTFT) entre deux stations ILLUSTRATIVES, l'une en Europe centrale et l'autre dans l'est de l'Amérique du Nord, via un relais géostationnaire à { "10" } deg O. L'exécution résout l'équation bidirectionnelle pour T_A - T_B à partir des termes indiqués d'équipement, de transpondeur, d'ionosphère (bande Ku, 14/11 GHz) et de Sagnac. Elle forme un bilan d'incertitude dont le terme statistique est le TDEV, à un jour, d'une simula (commentaire du fichier de scénario, lignes { "1" } à { "8" })
