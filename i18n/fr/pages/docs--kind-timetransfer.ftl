# docs--kind-timetransfer: translations (fr)

# text
seg-c61e88721556 = Type de scénario du moteur v{ $version }, famille <a1>Horloges, synchronisation temporelle et holdover</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-849c08d3ce70 = Page de famille : <a1>Horloges, synchronisation temporelle et holdover</a1>

# text
seg-5a70fcb097dc = Champs facultatifs : aucun

# text
seg-a1810bbca337 = <b>MODELLED</b> Aller-retour/TWSTFT (Sagnac), vue commune GNSS, PPP ; gigue de liaison→distance. Référence indépendante (ExternalDataset) : amplitude de Sagnac vérifiée par rapport à une VALEUR PUBLIÉE faisant autorité — N. Ashby, « Relativity in the GPS », Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), éq. { "1.29" } : un tour de l'équateur vers l'est accumule { "207.4" } ns (2ωA_E/c²) ; kshana reproduit { "207.386" } ns. Corroboré indépendamment par geodist() de RTKLIB { "2.4.3" } (Takasu, BSD-2-Clause), qui porte la même géométrie 2Aω/c². Le BIPM TWSTFT composite transpondeur/vue commune/

# text
seg-a8beb8dfc757 = Le budget d'erreur du transfert de temps est MODELLED, et non validé : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-37a77f49f048 = ps

# text
# c1: docs/kinds/by-kind/timetransfer.md
seg-2ccebbc74d9f = Source : <c1/>

# text
# c1: timetransfer
seg-289a9f8dc990 = <c1/> (type de scénario)

# text
seg-ccb244e60d60 = Transfert bidirectionnel de temps/fréquence optique contre RF.

# text
# c1: scenarios/timetransfer.toml
seg-59347fda6c66 = Une exécution de <c1/> se résume ainsi : scénario 8f9c2e0e31a5 | optique sync_rms 0.98ps range_rms 0.293mm adev(1s) { "1.73e-12" } | RF sync_rms 1137.3ps range_rms 341.0mm adev(1s) { "8.65e-10" }

# text
# c1: seed
# c2: samples
# c3: step_s
# c4: range_spec_mm
# c5: link_quantum
# c6: link_classical
seg-890040dd3d96 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/timetransfer.toml
seg-7b887ea27a86 = L'exemple <c1/> définit, entre autres :

# text
seg-2485eaa6dbf4 = Transfert bidirectionnel de temps et de fréquence par satellite (TWSTFT, bande Ku

# text
seg-fa54f1a81b57 = Liaison optique intersatellite, synchronisation au niveau de la picoseconde

# text
seg-a30fe2b87ee2 = mm

# attr:alt
seg-bd76bd68eab3 = Le graphique que le moteur écrit pour scenarios/timetransfer.toml, type timetransfer

# text
seg-3c9d28692f9f = <b>MODELLED</b> Bidirectionnel/TWSTFT (Sagnac), vue commune GNSS, PPP ; gigue de liaison→distance Tests : <a1>time_transfer_error_budgeting_reference.rs</a1>.

# text
seg-84fcf20588fb = <s1>Précédent</s1>time-transfer-budget

# text
seg-149ad280a1f9 = <s1>Suivant</s1>tracking-loop
