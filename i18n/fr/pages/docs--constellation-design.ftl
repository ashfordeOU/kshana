# docs--constellation-design: translations (fr)

# text
seg-f63dd3d7aad4 = Source

# text
# c1: docs/CONSTELLATION-DESIGN.md
seg-8f0e4021404d = Source : <c1/>

# text
# c1: constellation-design
# c2: src/body.rs
# c3: solar-system
# c4: body-pnt
# c5: src/constellation.rs
seg-44196ab9678c = Le type de scénario <c1/> construit une ou plusieurs constellations de satellites autour de la Terre, de la Lune, de Mars ou de tout autre corps du catalogue du système solaire (<c2/> : les huit planètes, Pluton, la Lune, Phobos, Déimos, les quatre lunes galiléennes et Titan, avec les mêmes constantes que celles des types de scénario <c3/> et <c4/> ; voir <a1>SOLAR-SYSTEM.md</a1>) et cartographie leur couverture et leur dilution de précision (DOP) sur une grille de latitude/longitude. Source : <c5/>.

# text
# c1: body
# c2: earth
# c3: duration_s
# c4: step_s
# c5: mask_deg
# c6: grid_step_deg
# c7: lat_min_deg
# c8: lat_max_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: j2 = true
seg-61385c509a3d = Le corps est choisi avec <c1/> (par défaut <c2/>). L'exécution couvre <c3/> (par défaut un jour sidéral, { "86 164" } s) par pas de <c4/> (par défaut { "600" } s), au-dessus de <c5/> (par défaut { "5" } deg), sur une grille de <c6/> (par défaut { "10" } deg) que <c7/>, <c8/>, <c9/> et <c10/> peuvent restreindre ; <c11/> ajoute la dérive séculaire due à J2, le deuxième harmonique zonal du champ de gravité du corps.

# text
seg-d02f6d747522 = Ce qui entre

# text
# c1: T/P/F
# c2: T
# c3: P
# c4: F
# c5: k
# c6: raan0 + k·ΔΩ
# c7: j
# c8: m0 + j·360·P/T + k·360·F/T
seg-743e68478333 = <b>Couches Walker</b> dans la convention <c1/> : <c2/> satellites dans <c3/> plans régulièrement espacés avec le phasage <c4/>. Un motif <em>delta</em> répartit les nœuds ascendants sur { "360" } deg, un motif <em>étoile</em> sur { "180" } deg. Le plan <c5/> se situe au nœud <c6/> et son satellite <c7/> à l'anomalie moyenne <c8/>.

# text
seg-d86b01d633a0 = <b>Jeux d'éléments explicites</b> : demi-grand axe ou altitude, excentricité, inclinaison, ascension droite du nœud ascendant (RAAN), argument du périapse et anomalie moyenne.

# text
seg-0737ef1ddb72 = <b>Préréglages</b> issus d'éléments nominaux publiés (Terre seulement ; un préréglage autour d'un autre corps est une erreur) :

# text
seg-587beeccaa11 = Préréglage

# text
seg-1ff32b87e030 = Satellites

# text
seg-9e0514e371e5 = Global Positioning System (GPS) Standard Positioning Service Performance Standard (SPS PS), 5ᵉ édition, avril { "2020" }, tableaux 3.2-1 et 3.2-3

# text
seg-fb6956d09acc = { "24" } à { "30" }

# text
# c1: expanded
seg-f679ee0f3a3f = SPS PS tableau 3.2-2 : chacun des six emplacements extensibles (B1, D2, F2, A2, C4, E3) nommés dans <c1/> est remplacé par sa paire avant et arrière ; les six par défaut

# text
seg-45f3abdcb8d4 = Galileo Open Service Service Definition Document (OS SDD), édition { "1.1" } : Walker 24/3/1, demi-grand axe { "29 599.801" } km, { "56" } deg (tableau { "1" }), emplacements du tableau { "23" }

# text
seg-87e23a896f58 = BeiDou Open Service Performance Standard { "3.0" } ({ "2021" }), section { "4.1" } : orbite terrestre moyenne (MEO) Walker 24/3/1 à { "21 528" } km et { "55" } deg, plus trois satellites géostationnaires (GEO) à { "80" }, { "110.5" } et { "140" } deg E et trois satellites géosynchrones inclinés (IGSO) à { "55" } deg

# text
seg-70a32cd2402d = GLONASS Interface Control Document (ICD), édition { "5.1" } ({ "2008" }), section { "5.2" } : formule des emplacements, { "19 100" } km, { "64.8" } deg

# text
seg-654d7aceff94 = Le RAAN du tableau GPS est inertiel à son époque ; le préréglage le convertit en longitude de nœud liée à la Terre avec l'angle horaire de Greenwich que le tableau indique ({ "100.765" } deg). GLONASS indique directement des longitudes de nœud absolues (de Greenwich). Le document Galileo n'indique aucun angle horaire, son RAAN est donc utilisé comme longitude de nœud. La norme BeiDou n'indique ni la phase MEO ni les nœuds IGSO ; le préréglage démarre le motif MEO au nœud { "0" } et à l'anomalie moyenne { "0" } et place les trois IGSO sur une même trace au sol qui franchit l'équateur à { "118" } deg E. Ces deux choix sont modélisés.

# text
# c1: clock = "per-constellation"
# c2: clock = "common"
seg-b2bbdd23c13b = Plusieurs constellations peuvent partager une même exécution. Avec <c1/> (par défaut), le récepteur estime une horloge par système en vue, comme le fait un récepteur multi-GNSS (Global Navigation Satellite System) ; <c2/> partage une seule horloge.

# text
seg-27db52482bdd = Ce qui sort

# text
# c1: pdop_threshold
# c2: track_points
# c3: max_tracks
seg-2405196cfccb = Par cellule de la grille : nombre moyen, minimal et maximal de satellites au-dessus du masque ; la part des époques avec une position et avec un DOP de position (PDOP) inférieur ou égal à <c1/> ; DOP géométrique, de position, horizontal et vertical moyens (GDOP, PDOP, HDOP, VDOP) ; PDOP maximal. Globalement, pondéré par le cosinus de la latitude pour que chaque cellule compte selon sa surface : disponibilité, disponibilité au pire site, et moyenne, médiane, 90ᵉ, 95ᵉ et 99ᵉ percentile et maximum de chaque DOP. Par satellite : une trace au sol sous-échantillonnée (<c2/> échantillons, { "24" } par défaut, pour au plus <c3/> satellites, { "120" } par défaut). Le graphique est composé de deux cartes, la disponibilité et le PDOP moyen.

# text
seg-6cb532d0bca9 = Comment cela passe à l'échelle

# text
# c1: r
# c2: ε
# c3: λ = arccos((R/r)·cos ε) − ε
# c4: cos λ
# c5: φ
# c6: λ_max
# c7: φ
# c8: work
# c9: leo-pnt-mega-shell
seg-988ae3272c1f = Un satellite au rayon <c1/> est au-dessus d'un masque d'élévation <c2/> exactement lorsque son angle au centre depuis l'utilisateur est au plus <c3/>, de sorte que le test de visibilité est un seul produit scalaire par rapport à <c4/>. À chaque époque, les satellites sont aussi triés par latitude du point subsatellite, et une ligne de grille à la latitude <c5/> ne teste que les satellites situés à moins de <c6/> de <c7/>. Les deux sont exacts sur un corps sphérique, et un test unitaire confronte chaque carte à un balayage par force brute avec le test d'élévation direct. Le bloc <c8/> indique les tests de paires qu'un balayage par force brute ferait et ceux qui ont été faits. La conception à { "5" } 000 satellites du test unitaire sur une grille de { "10" } deg ({ "648" } points, { "6" } époques) conserve { "9.9" } % des { "19 440 000" } tests de paires par force brute ; le scénario fourni <c9/> ({ "5 000" } satellites, { "648" } points, { "12" } époques) s'exécute en environ { "0.14" } s avec le binaire en ligne de commande de la version publiée sur un ordinateur portable à processeur Apple silicon. Les durées d'horloge murale varient selon la machine et sa charge. Le moteur n'utilise ni threads, ni horloge, ni système de fichiers, et s'exécute donc tel quel en WebAssembly.

# text
seg-abba032ee1c7 = Ce qui est vérifié, et par rapport à quoi

# text
seg-2342ed239300 = VALIDATED, par rapport à des documents publiés :

# text
seg-dc7fe92fcf05 = le générateur Walker reproduit les { "24" } lignes du tableau { "23" } du Galileo OS SDD, et la formule des emplacements de l'ICD GLONASS est le même ensemble de { "24" } emplacements qu'un Walker 24/3/1 ;

# text
seg-686f9543c7c9 = le préréglage GPS reproduit la colonne des franchissements équatoriaux de la trace au sol des tableaux 3.2-1 et 3.2-2 du SPS PS : { "35" } emplacements sur { "36" } à moins de { "0.0108" } deg, contre un seuil d'arrondi de { "0.015" } deg. E3F est tenu à un seuil plus lâche de { "0.06" } deg, parce que la ligne E3F du tableau est elle-même incohérente avec son RAAN et son argument de latitude : son argument de latitude est en avance de { "14.60" } deg sur celui de E3, ce qui décale le franchissement de { "7.30" } deg, alors que le tableau le décale de { "7.36" } deg ;

# text
seg-dc2756c75401 = la référence de base GPS dans les conditions de l'annexe B du SPS PS (un jour sidéral, { "287" } pas de cinq minutes, une grille de { "4" } deg, tous en vue, masque de { "5" } deg) donne un HDOP global de médiane { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" } et de moyenne { "0.965" }, contre les valeurs publiées { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } et { "0.96" } (seuil { "0.03" }, fixé avant la première exécution). La médiane du PDOP { "1.795" } est inférieure aux { "1.815" } du tableau B.3-1, qui décrit un mélange dégradé de 20 à 24 satellites. Un PDOP inférieur ou égal à { "6" } est tenu { "100" } % du temps, contre { "98" } % au niveau global et { "88" } % au pire site dans le tableau 3.8-1.

# text
seg-9aac9d8aa228 = Vérifié par rapport à une dérivation à la main, et non à un document externe : un DOP à époque unique concorde avec la forme close pour un satellite au zénith et trois à { "30" } deg d'élévation (PDOP 8/3, GDOP { "3.0732" }).

# text
seg-d946dad08e23 = MODELLED : orbites à deux corps avec une dérive séculaire J2 facultative ; un corps sphérique ; visibilité géométrique seulement (ni puissance du signal, ni état de santé du satellite, ni terrain) ; pas de perturbation d'un troisième corps, dont dépend une véritable orbite lunaire gelée. Le pire point espace-temps isolé dépend de la grille : HDOP { "2.40" } et VDOP { "5.22" } ici contre { "2.49" } et { "5.43" } publiés ; ces valeurs sont rapportées, non épinglées. Les préréglages des quatre systèmes proviennent d'époques de référence différentes, de sorte que leur phase relative dans une exécution n'est l'instantané d'aucune date.

# text
seg-a6c63abeb7e6 = Scénarios fournis

# text
seg-3e6a942c84d4 = Chaque ligne donne ce que l'exécution affiche avec kshana { $version }.

# text
# c1: scenarios/constellation-multi-gnss-coverage.toml
seg-c8b40c9c2c00 = <c1/> : GPS, Galileo, BeiDou et GLONASS ({ "102" } satellites) sur une journée au-dessus d'un masque de { "10" } deg, une horloge par système. Disponibilité (PDOP inférieur ou égal à { "6" }) de { "100" } % au niveau global et au pire site, PDOP médian { "0.95" }, { "31.0" } satellites en vue en moyenne.

# text
# c1: scenarios/leo-pnt-mega-shell.toml
seg-b65ade1eab04 = <c1/> : { "5 000" } satellites sur quatre couches en orbite terrestre basse (LEO) pour le positionnement, la navigation et la synchronisation temporelle (PNT), avec J2, au-dessus d'un masque de { "20" } deg. Disponibilité (PDOP inférieur ou égal à { "3" }) de { "99.22" } % au niveau global et de { "0" } % au pire site, PDOP médian { "1.11" }, { "39.4" } satellites en vue en moyenne.

# text
# c1: scenarios/lunar-relay-constellation.toml
seg-7d860ca30360 = <c1/> : { "8" } satellites sur des orbites lunaires gelées elliptiques et une couche circulaire de 6 satellites autour de la Lune. Disponibilité (PDOP inférieur ou égal à { "6" }) de { "21.33" } % au niveau global et de { "0" } % au pire site, PDOP médian { "5.22" }, { "3.2" } satellites en vue en moyenne.

# text
# c1: leo-pvt
# c2: scenarios/polar-arctic-leo-coverage.toml
seg-0c331bea1f52 = La couverture LEO-PNT pour les utilisateurs polaires et arctiques, par rapport au GNSS en orbite terrestre moyenne, relève du mode polaire du type de scénario <c1/> (<c2/> ; voir <a1>LEO-PNT.md</a1>).

# text
seg-9aab3bf49146 = <s1>Précédent</s1>Positionnement fusionné MEO et LEO

# text
seg-9f717b9015e1 = <s1>Suivant</s1>Modèles de capteurs quantiques
