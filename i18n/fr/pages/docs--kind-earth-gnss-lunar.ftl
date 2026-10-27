# docs--kind-earth-gnss-lunar: translations (fr)

# text
seg-37d29d8303fe = km

# text
seg-b054c73f22e5 = aucune valeur

# text
seg-59afd80736c5 = <b>PARTNER</b> Non fourni — Kshana modélise la performance du signal, et non le matériel de charge utile ou d'antenne. Référence indépendante (NoneKind) : aucune : une discipline propre au partenaire, sans module ni test par conception

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
# c1: docs/kinds/by-kind/earth-gnss-lunar.md
seg-9a399fed06c4 = Source : <c1/>

# text
# c1: earth-gnss-lunar
seg-886b3796afaa = <c1/> (type de scénario)

# text
seg-c8a8be4b8894 = Réception du GNSS terrestre à distance lunaire, la couche de signal faible que nomme l'article sur la résilience aux conflits et pour laquelle le moteur n'avait aucun modèle. Un satellite GNSS pointe son antenne vers la Terre ; un récepteur près de la Lune se trouve à environ quinze fois le rayon orbital, de sorte que trois effets jouent à la fois. La Terre OCCULTE L'AXE DE VISÉE : à { "26,560" } km, elle sous-tend un demi-angle de { "13.9" } deg, si bien que tout rayon à destination de la Lune doit quitter l'émetteur à au moins cet écart du nadir, ce qui supprime le pic du faisceau avant même tout calcul de puissance. Ce qui reste, c'est LE BORD DU LOBE PRINCIPAL ET LES LOBES SECONDAIRES, le régime dans lequel la charge utile LuGRE a effectivement fonctionné en { "2025" }. Et l'affaiblissement en espace libre est d'environ { "208" } dB en L1, soit environ { "25" } dB de plus que ce que paie un utilisateur terrestre. Le rapport émet une ligne par satellite (angle hors axe de visée, occultation par la Terre, distance, affaiblissement de propagation, gain d'émission à cet angle, puissance reçue, densité porteuse/bruit) et n'agrège que les liaisons qui franchissent le seuil de poursuite. IL RAPPORTE AUSSI LE CONDITIONNEMENT, car c'est ce qui définit cette couche : chaque satellite visible se trouve dans un cône large de quelques degrés vu de la Lune, de sorte que les lignes de visée sont presque parallèles, que la dilution de précision est énorme et qu'un point fixe du GNSS terrestre à distance lunaire est une observation de synchronisation temporelle bien plus qu'une observation de position. MODELLED, et le diagramme d'émission en est la raison : le gain en fonction de l'angle est celui d'une ouverture circulaire uniforme (Airy), alors qu'une vraie antenne GPS L1 est un réseau hélicoïdal à douze éléments avec un lobe principal conformé et des lobes secondaires non Airy. Des diagrammes mesurés existent et ne sont pas fournis ici, de sorte que les classements et les ordres de grandeur sont significatifs, alors que le dB d'un satellite pris isolément ne l'est pas. Volontairement ABSENTS, chacun rendant le bilan optimiste : aucune perte ionosphérique ou troposphérique sur les rayons rasant le limbe, aucune perte de polarisation, de pointage ou de mise en œuvre, et une Terre sphérique sans extension réfractive. La position de la Lune est une ENTRÉE (distance plus direction inertielle) plutôt qu'une consultation d'éphéméride, parce que la grandeur testée est la liaison et la géométrie du faisceau. Faire passer cette ligne à l'état validé exige un diagramme d'émission mesuré et des points normaux LuGRE ; ni l'un ni l'autre ne figure dans le dépôt et aucun n'est inventé ici.

# text
# c1: scenarios/earth-gnss-lunar.toml
seg-75b6814c0091 = Une exécution de <c1/> se résume ainsi : Earth-GNSS at lunar distance — { "24" } satellites, receiver at { "384400" } km Earth limb from the constellation: { "13.90" } deg off nadir — any lunar-bound ray must exceed this { "22" } of { "24" } not occulted; { "0" } clear the { "25.0" } dB-Hz tracking threshold no link reaches the threshold fewer than two trackable links; no angular spread to report fewer than four trackable links, or a singular geometry: no DOP SWEEP over { "64" } epochs / { "43082" } s: signal availability { "0.375" }, FIX availability { "0.000" } trackable links mean { "0.75" }, max { "2" }; best C/N0 { "30.93" } dB-Hz; best PDOP none Prenez la disponibilité du point FIX comme a priori de cette couche, et non la disponibilité du signal : une liaison est une observation d'horloge, quatre sont une position. MODELLED : le gain d'émission est un substitut à ouverture uniforme (Airy), et non un faisceau GPS mesuré, et aucune perte atmosphérique, de polarisation ou de mise en œuvre n'est appliquée — le bilan est donc optimiste. Les ordres de grandeur et les classements sont significatifs ; le dB d'un satellite pris isolément ne l'est pas.

# text
# c1: altitude_km
# c2: inclination_deg
# c3: planes
# c4: sats_per_plane
# c5: phasing_f
# c6: epoch_s
# c7: receiver_range_m
# c8: receiver_ra_deg
# c9: receiver_dec_deg
# c10: tx_power_dbw
# c11: tx_diameter_m
# c12: tx_efficiency
# c13: freq_hz
# c14: rx_gain_dbi
# c15: system_temp_k
# c16: tracking_threshold_dbhz
# c17: back_lobe_suppression_db
# c18: epochs
# c19: span_s
seg-6c0897da2efa = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

# text
# c1: scenarios/earth-gnss-lunar.toml
seg-8c6bb203352d = L'exemple <c1/> définit, entre autres :

# text
seg-a3697ad561db = Hz

# text
seg-9521a296d617 = dBi

# attr:alt
seg-cf1dce5fc824 = Le graphique que le moteur écrit pour scenarios/earth-gnss-lunar.toml, type de scénario earth-gnss-lunar

# text
seg-04f59a1e2ec2 = <b>MODELLED</b> Réception du GNSS terrestre à distance lunaire : la couche de signal faible que nomme le tableau { "1" } de P7 et pour laquelle le moteur n'avait aucun modèle.

# text
seg-9531f6b14fc8 = <b>MODELLED</b> Réception du GNSS terrestre à distance lunaire : la couche de signal faible que nomme le tableau { "1" } de P7 et pour laquelle le moteur n'avait aucun modèle. Par satellite et par époque, il calcule l'écart par rapport à l'axe de visée. Référence indépendante (InternalConsistency) : identités en forme fermée et cohérence interne ; AUCUNE référence indépendante externe n'est revendiquée. Le demi-angle du limbe est vérifié par rapport à asin(R_earth/r_orbit) et la géométrie par rapport à lui ; l'affaiblissement en espace libre, le noyau DOP et la propagation SGP4 que cela compose sont chacun validés en externe dans leurs propres lignes et cette ligne n'emprunte pas leur statut. POURQUOI MODELLED, et c'est le diagramme d'émission : le gain en fonction de l'angle est celui d'une ouverture uniformément illuminée

# text
# c1: kshana kinds --json
seg-6dfc5503f58f = MODELLED, et le diagramme d'émission en est la raison : le gain en fonction de l'angle est celui d'une ouverture circulaire uniforme (Airy), alors qu'une vraie antenne GPS L1 est un réseau hélicoïdal à douze éléments avec un lobe principal conformé et des lobes secondaires non Airy. (catalogue des types de scénario (<c1/>))

# text
seg-c40d3fd8c12e = CE QUI EST MODELLED, ET POURQUOI CE N'EST PAS VALIDATED Le gain d'émission en fonction de l'angle est celui d'une ouverture circulaire uniformément illuminée — un diagramme d'Airy. Une vraie antenne GPS L1 est un réseau hélicoïdal à douze éléments dont le diagramme mesuré présente un lobe principal conformé, volontairement maximal hors de l'axe de visée pour uniformiser la puissance sur le disque terrestre, et des lobes secondaires qui ne sont pas du tout d'Airy. Des diagrammes mesurés sont publiés ; ils ne sont pas fournis dans ce (commentaire du fichier de scénario, lignes { "29" } à { "35" })

# text
seg-01fa469abd95 = Le GNSS terrestre à distance lunaire est MODELLED, et non validé : vérifié par rapport à sa propre identité analytique / en forme fermée — il détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-2fd936b76f4a = <s1>Précédent</s1>contact-schedule

# text
seg-95a5aa0adeb3 = <s1>Suivant</s1>entry-heating
