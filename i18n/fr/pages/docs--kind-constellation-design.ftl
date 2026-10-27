# docs--kind-constellation-design: translations (fr)

# text
seg-e27476e37522 = Terre

# text
seg-37d29d8303fe = km

# text
seg-11e8c29ecb45 = Type de scénario du moteur v{ $version }, famille <a1>Constellations, couverture et géométrie</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-a4f1e7d2041e = Page de famille : <a1>Constellations, couverture et géométrie</a1>

# text
seg-670191cf797f = Page thématique : <a1>SOLAR-SYSTEM.md</a1>

# text
seg-cb91473bfdda = Page thématique : <a1>LEO-PNT.md</a1>

# text
# c1: docs/kinds/by-kind/constellation-design.md
seg-f305ed6dc164 = Source : <c1/>

# text
# c1: constellation-design
seg-f708c26a5139 = <c1/> (type de scénario)

# text
seg-de173c9f4034 = Conception de constellations à grande échelle : motifs Walker DELTA et Walker STAR dans la convention i: T/P/F (nœuds répartis sur { "360" } ou { "180" } deg, espacement dans le plan { "360" }<em>P/T, décalage de phase entre plans { "360" }</em>F/T), listes d'éléments explicites et conceptions à plusieurs coquilles, plusieurs constellations dans une même exécution, autour de la Terre, de la Lune, de Mars ou de toute autre planète, de Pluton ou d'une lune majeure, à l'aide des constantes du module body (les mêmes que celles utilisées par les types de scénario solar-system et body-pnt). PRÉRÉGLAGES issus d'éléments nominaux publiés : gps-baseline et gps-expandable (les { "24" } emplacements et les six paires extensibles avant/arrière du GPS Standard Positioning Service Performance Standard, 5e édition { "2020" }, tableaux 3.2-1 à 3.2-3), galileo (Walker 24/3/1 à { "29 599.801" } km et { "56" } deg, Galileo Open Service Service Definition Document édition { "1.1" } tableaux { "1" } et { "23" }), beidou et beidou-meo (Walker 24/3/1 à { "21 528" } km et { "55" } deg plus trois satellites géostationnaires à { "80" }, { "110.5" } et { "140" } deg E et trois satellites géosynchrones inclinés à { "55" } deg, BeiDou Open Service Performance Standard { "3.0" } section { "4.1" } ; la phase MEO et le croisement géosynchrone incliné à { "118" } deg E sont modélisés parce que la norme ne les indique pas) et glonass (24/3/1 à { "19 100" } km et { "64.8" } deg d'après la formule d'emplacement du GLONASS Interface Control Document édition { "5.1" } section { "5.2" }). COUVERTURE ET DILUTION DE PRÉCISION : sur une grille de latitude/longitude et une fenêtre échantillonnée avec un masque d'élévation, le nombre de satellites en vue, GDOP, PDOP, HDOP et VDOP par cellule, la disponibilité (un point fixe dont le PDOP est inférieur ou égal à un seuil, { "6" } par défaut) par cellule, globalement (pondérée par la surface) et au pire site, avec une horloge de récepteur par constellation sauf si clock = "common". Cela passe à l'échelle de milliers de satellites : la visibilité est un produit scalaire par rapport au demi-angle de couverture de chaque satellite, et les satellites sont répartis en bandes par latitude du point sous-satellite à chaque époque, de sorte qu'une ligne de la grille ne teste que ceux qui peuvent être en vue ; le rapport compte les tests de paires économisés. Le JSON contient les cartes de la grille et des traces au sol sous-échantillonnées par satellite. VALIDATED : le générateur Walker par rapport au tableau { "23" } du SDD Galileo OS et à la formule d'emplacement de l'ICD GLONASS, le préréglage GPS par rapport à la colonne publiée des passages à l'équateur du tableau 3.2-1 du SPS PS, et la distribution mondiale du HDOP de la référence de base GPS par rapport à l'annexe B du SPS PS (médiane { "0.94" }, { "95" } % { "1.25" }, moyenne { "0.96" }, tolérance { "0.03" }). MODELLED : orbites à deux corps avec J2 séculaire facultatif, un corps sphérique, visibilité géométrique seulement (ni puissance de signal, ni état de santé, ni relief), et la phase relative entre différents systèmes, qui n'est l'instantané d'aucune date réelle.

# text
# c1: scenarios/leo-pnt-mega-shell.toml
seg-21fbd84bfba1 = Une exécution de <c1/> se résume ainsi : constellation-design: { "5000" } satellites (LEO-PNT) around the Earth; availability { "99.22" }% (PDOP <= { "3" } at { "20" } deg mask), worst site { "0.00" }%, median PDOP { "1.11" }, mean { "39.4" } in view; { "648" } grid points x { "12" } epochs (MODELLED)

# text
# c1: body
# c2: duration_s
# c3: step_s
# c4: mask_deg
# c5: pdop_threshold
# c6: grid_step_deg
# c7: lat_min_deg
# c8: lat_max_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: clock
# c12: j2
# c13: track_points
# c14: max_tracks
# c15: constellation
seg-af572ce1fd89 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: scenarios/leo-pnt-mega-shell.toml
seg-fd393ddc7d5d = L'exemple <c1/> définit, entre autres :

# text
seg-d72b4c5393e0 = earth

# text
seg-d9b3c54bd272 = common

# text
seg-6411970ba342 = delta

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-0a6f7f6c66c4 = km^3/s^{ "2" }

# text
seg-ab9b72b9ffce = Étiquette du résultat (celle du moteur) : MODELLED - orbites képlériennes à deux corps (J2 séculaire facultatif) autour d'un corps sphérique, visibilité géométrique au-dessus d'un masque d'élévation, dilution de précision avec tous les satellites en vue et une horloge de récepteur par constellation sauf si clock = "common" ; ni puissance de signal, ni état de santé, ni relief. La géométrie Walker et les préréglages publiés

# attr:alt
seg-899e728ad9bd = Le graphique que le moteur écrit pour scenarios/leo-pnt-mega-shell.toml, type de scénario constellation-design

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
# c1: constellation-design
seg-602493ac6987 = <b>VALIDATED</b> Les générateurs du type de scénario <c1/> : motifs Walker delta et star dans la convention T/P/F (espacement des nœuds 360/P ou 180/P, espacement dans le plan { "360" }·P/T, décalage de phase entre plans { "360" }·F/T), et la référence de base GPS ainsi que les 24 emplacements extensibles, Gal

# text
# c1: constellation-design
seg-bdc81f37ad16 = <b>VALIDATED</b> Le moteur de couverture de <c1/> sur le préréglage GPS de référence à 24 emplacements, dans les conditions de l'annexe B du GPS Standard Positioning Service Performance Standard (SPS PS) (un jour sidéral, { "287" } pas de cinq minutes, une grille mondiale de { "4" } x { "4" } deg w

# text
# c1: constellation-design
seg-1272200ad4f2 = <b>MODELLED</b> Le type de scénario <c1/> au-delà des deux cas figés : conceptions explicites et à plusieurs coquilles, plusieurs constellations par exécution avec une horloge de récepteur par constellation, la Terre, la Lune et Mars à partir des constantes de corps, le préréglage BeiDou Tests : <a1>coverage_dop_gnss_lib_py_oracle.rs</a1>.

# text
# c1: constellation-design
seg-0c64f22330d2 = <b>VALIDATED</b> Les générateurs du type de scénario <c1/> : motifs Walker delta et star dans la convention T/P/F (espacement des nœuds 360/P ou 180/P, espacement dans le plan { "360" }·P/T, int. Référence indépendante (ExternalDataset) : documents d'agences publiés : Galileo Open Service Service Definition Document édition { "1.1" } (European GNSS Service Centre) tableaux { "1" } et { "23" }, la constellation de référence au 2016-11-21 { "00" }:{ "00" } UTC ; GLONASS Interface Control Document édition { "5.1" } ({ "2008" }) section { "5.2" }, la formule d'emplacement pour la longitude du nœud et l'argument de latitude ; GPS Standard Positioning Service Performance Standard 5e édition (avril { "2020" }) tableaux 3.2-1, 3.2-2 et

# text
# c1: constellation-design
seg-87c4e19dc780 = <b>VALIDATED</b> Le moteur de couverture de <c1/> sur le préréglage GPS de référence à 24 emplacements, dans les conditions de l'annexe B du GPS Standard Positioning Service Performance Standard (SPS PS). Référence indépendante (ExternalDataset) : GPS SPS PS 5e édition (avril { "2020" }) annexe B sections B.3.2.2 et B.3.2.3, la distribution publiée du HDOP moyen mondial de la constellation de référence à 24 emplacements entièrement occupée (médiane { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, moyenne { "0.96" }), tableau 3.8-1 (disponibilité du PDOP) et tableau B.3-1 (PDOP d'ensemble d'une constellation dégradée, utilisé seulement comme borne supérieure), plus une forme fermée dérivée à la main pour une époque. Le VDOP et le PD

# text
# c1: constellation-design
seg-04289f7252cd = <b>MODELLED</b> Le type de scénario <c1/> au-delà des deux cas figés : conceptions explicites et à plusieurs coquilles, plusieurs constellations par exécution avec une horloge de récepteur par const. Référence indépendante (InternalConsistency) : cohérence interne : le balayage d'élévation par force brute, les réductions calculées à la main et par orbit::dop, et la géométrie Walker et géosynchrone en forme fermée. Orbites à deux corps avec J2 séculaire facultatif, un corps sphérique avec la verticale locale suivant le rayon, visibilité géométrique seulement (ni puissance de signal, ni état de santé du satellite, ni relief, ni perturbation due à un troisième corps), et la phase relative entre systèmes prise de différents

# text
# c1: label
seg-00fa65d44cbd = MODELLED - orbites képlériennes à deux corps (J2 séculaire facultatif) autour d'un corps sphérique, visibilité géométrique au-dessus d'un masque d'élévation, dilution de précision avec tous les satellites en vue et une horloge de récepteur par constellation sauf si clock = "common" ; ni puissance de signal, ni état de santé, ni relief. La géométrie Walker et les préréglages publiés sont vérifiés par rapport au SDD Galileo OS, à l'ICD GLONASS et aux tableaux d'emplacements du Performance Standard GPS SPS, a (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-62f0fc16a247 = MODELLED : orbites à deux corps avec J2 séculaire facultatif, un corps sphérique, visibilité géométrique seulement (ni puissance de signal, ni état de santé, ni relief), et la phase relative entre différents systèmes, qui n'est l'instantané d'aucune date réelle. (catalogue des types de scénario (<c1/>))

# text
seg-3ef4276dd40b = Ce à quoi l'exécution répond : satellites en vue, PDOP/HDOP/VDOP/GDOP par cellule de { "10" } deg, et la part du temps avec un PDOP inférieur ou égal à { "3" } au-dessus d'un masque de { "20" } deg sur deux heures. Le point faible que montre la carte, ce sont les calottes polaires : aucune coquille n'atteint plus d'environ { "82" } deg de latitude, de sorte qu'un utilisateur près d'un pôle voit tous les satellites d'un même côté du ciel et que la géométrie verticale se dégrade. MODELLED : une conception illustrative, des orbites à deux corps avec J2, un corps sph (commentaire du fichier de scénario, lignes { "17" } à { "21" })

# text
seg-c333d3fe22cd = Les cartes de couverture et de dilution de précision pour des conceptions multiconstellations arbitraires à grande échelle, autour de n'importe quel corps central, sont MODELLED, et non validées : vérifiées par rapport à leur propre identité analytique / en forme fermée — elles détectent les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-436504a8b26f = <s1>Précédent</s1>conflict-resilience

# text
seg-cba188459c80 = <s1>Suivant</s1>contact-schedule
