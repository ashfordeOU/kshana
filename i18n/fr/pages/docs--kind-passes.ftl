# docs--kind-passes: translations (fr)

# text
seg-debc2f07db78 = true

# text
seg-37d29d8303fe = km

# text
seg-0f4c2ab525ac = <b>MODELLED</b> Es/N0 de liaison descendante le long de chaque passage d'un satellite au-dessus d'une station (PIRE, perte en espace libre, perte atmosphérique en loi de cosécante, autres pertes, G/T, constante de Boltzmann, débit de symboles), le MODCOD DVB-S2 le plus efficace qui franchit son seuil de l'ETSI EN { "302" } 307-

# text
seg-72fd0321e4af = Page thématique : <a1>CONTACT-SCHEDULING.md</a1>

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
seg-4636d450ef60 = <b>MODELLED</b> Une exécution prend un plan de contacts (une liste de fenêtres aos_s/los_s, chacune demandant à l'ouverture la navigation ou les communications — le même vocabulaire de fenêtres qu'émet <c1/>, converti par <c2/>), un nombre d'ouvertures

# text
seg-11e8c29ecb45 = Type de scénario du moteur v{ $version }, famille <a1>Constellations, couverture et géométrie</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-a4f1e7d2041e = Page de famille : <a1>Constellations, couverture et géométrie</a1>

# text
seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-df90e5910fb4 = h

# text
# c1: docs/kinds/by-kind/passes.md
seg-2544da673115 = Source : <c1/>

# text
# c1: passes
seg-0db3f4e2402e = <c1/> (type de scénario)

# text
seg-a4bdfc291fce = Prévision des passages de stations au sol : les passages de visibilité dans le domaine temporel (AOS/TCA/LOS, élévation apparente maximale, durée) d'une orbite circulaire, sous forme d'éléments moyens SGP4 au début de la fenêtre, au-dessus d'une station située au-dessus d'un masque d'élévation sur une fenêtre, avec le temps d'accès total. Propagation SGP4/SDP4 sur le référentiel terrestre IAU 2006/2000A (UT1 - UTC et mouvement du pôle facultatifs), réfraction troposphérique UIT-R P.834-9 et temps de trajet lumineux de la liaison descendante (tous deux activés par défaut), franchissements résolus à { "1e-7" } s et culmination par recherche par section dorée. La géométrie des passages est VALIDATED par rapport à Orekit { "13.1.8" } à des stations au niveau de la mer ; l'orbite et la station du scénario sont des entrées illustratives.

# text
# c1: scenarios/passes.toml
seg-3050cc7fdc79 = Une exécution de <c1/> se résume ainsi : passes: { "5" } pass(es) of a { "550" } km / { "97.6" }° orbit over ({ "52.2" }°, { "4.4" }°) > { "10" }° in { "24" } h; { "1659" } s total access (MODELLED)

# text
# c1: altitude_km
# c2: inclination_deg
# c3: raan_deg
# c4: arg_lat_deg
# c5: station_lat_deg
# c6: station_lon_deg
# c7: station_alt_m
# c8: epoch
# c9: mask_deg
# c10: duration_hours
# c11: step_s
# c12: refraction
# c13: light_time
# c14: ut1_minus_utc_s
# c15: xp_arcsec
# c16: yp_arcsec
seg-699b650604d4 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

# text
# c1: scenarios/passes.toml
seg-9d2941ba37e2 = L'exemple <c1/> définit, entre autres :

# text
seg-6f849331e33c = Libellé du résultat (celui du moteur) : MODELLED — prévision des passages de stations au sol dans le domaine temporel ; propagation SGP4/SDP4, référentiel terrestre IAU 2006/2000A (UT1 = UTC, pas de mouvement du pôle sauf si des paramètres d'orientation de la Terre sont fournis), élévation apparente avec réfraction UIT-R P.834-9 et temps de trajet lumineux lorsqu'ils sont activés, franchissements et culmination affinés

# attr:alt
seg-a09be8c586e3 = Le graphique que le moteur écrit pour scenarios/passes.toml, type de scénario passes

# text
seg-db35e4ebd275 = <b>VALIDATED</b> Passages de visibilité dans le domaine temporel (AOS/TCA/LOS, élévation maximale, durée) d'un propagateur du moteur au-dessus d'une station située au-dessus d'un masque d'élévation, avec franchissements de lever/coucher interpolés et accès total : passes::predict_passes, l'ordonnanceur géométrique (no Tests : <a1>ground_station_pass_prediction_reference.rs</a1>.

# text
seg-6799a54acee6 = <b>VALIDATED</b> Passages de visibilité (AOS, TCA, LOS, élévation apparente maximale, durée) d'un jeu d'éléments SGP4 au-dessus d'une station WGS-84 sur le chemin validé d'orbite terrestre (IAU 2006/2000A, paramètres d'orientation de la Terre facultatifs), avec réfraction troposphérique UIT-R P.834-9 Tests : <a1>pass_predictor_on_path_orekit_oracle.rs</a1>.

# text
seg-42d4290ed718 = <b>VALIDATED</b> Passages de visibilité dans le domaine temporel (AOS/TCA/LOS, élévation maximale, durée) d'un propagateur du moteur au-dessus d'une station située au-dessus d'un masque d'élévation, avec lever/coucher interpolés . Référence indépendante (ExternalDataset) : Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — une bibliothèque indépendante de dynamique de vol : ElevationDetector (chercheur de racines de Brent) + EventsLogger sur une éphéméride ITRF, station comme TopocentricFrame WGS-84. AOS/LOS/élévation maximale/nombre de passages/accès total concordants sur une orbite+station+masque+fenêtre identiques (jeu de test consigné ; pilote xval/orekit-passes)

# text
# c1: label
seg-eb79c117f1df = MODELLED — prévision des passages de stations au sol dans le domaine temporel ; propagation SGP4/SDP4, référentiel terrestre IAU 2006/2000A (UT1 = UTC, pas de mouvement du pôle sauf si des paramètres d'orientation de la Terre sont fournis), élévation apparente avec réfraction UIT-R P.834-9 et temps de trajet lumineux lorsqu'ils sont activés, franchissements et culmination affinés en deçà du pas (résultat <c1/>)

# text
seg-a7ddc8eeaf1e = <s1>Précédent</s1>orbit

# text
seg-3079cfb8decc = <s1>Suivant</s1>pvt
