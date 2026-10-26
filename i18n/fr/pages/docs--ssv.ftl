# docs--ssv: translations (fr)

# text
seg-0857a94a948e = Limites

# text
seg-75c8da01c0f1 = MET

# text
seg-069a652c402e = seuil

# attr:alt
seg-1f79a5aae6c5 = Disponibilité des signaux pour un utilisateur sur une sphère à { "36000" } km d'altitude avec une antenne hémisphérique, d'après une exécution réelle du moteur v{ $version } sur scenarios/gnss-ssv-shell.toml (une exécution réduite : { "162" } utilisateurs, { "3" } jours, pas de { "10" } min), à un seuil de { "20" } dB-Hz. Pour chaque constellation et chaque bande, deux barres : la part des paires (utilisateur, époque) avec au moins un signal et avec au moins quatre. Combiné, L1 : { "99.4" } % avec au moins un, { "73.2" } % avec au moins quatre, plus longue interruption sous quatre signaux { "160" } min. Combiné, L5 : { "100.0" } % avec au moins un, { "99.9" } % avec au moins quatre, plus longue interruption sous quatre signaux { "20" } min. MODELLED : une étude modélisée à partir d'entrées indiquées, non une mesure et non une affirmation de volume de service pour un système quelconque. La taille réduite n'est pas la comparaison avec le livret. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.

# attr:alt
seg-92ef8e0b78de = Signaux le long d'une orbite terrestre haute (périgée { "497" } km, apogée { "58622" } km, période { "18.8" } h), d'après une exécution réelle du moteur v{ $version } sur scenarios/gnss-ssv-heo.toml, bande L1. En haut : la meilleure densité porteuse sur bruit parmi les signaux en vue, face au seuil de { "20" } dB-Hz. Au milieu : le nombre de signaux en vue de toutes les constellations, de { "4" } à { "55" } le long des points échantillonnés. Sur les liaisons reçues, { "2252" } sont passées par un lobe principal et { "696" } par des lobes secondaires, à l'aide d'un diagramme paramétrique de substitution étiqueté, non le diagramme mesuré d'un système quelconque. PDOP médian { "67" }, 95e centile { "358" }. MODELLED : une étude modélisée à partir d'entrées indiquées, non une mesure et non une affirmation de volume de service pour un système quelconque. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.

# attr:alt
seg-902c5c7da9aa = Un filtre embarqué à neuf états sur un transfert depuis l'orbite basse vers la Lune, d'après une exécution réelle du moteur v{ $version } sur scenarios/gnss-ssv-nav-lunar.toml ({ "289" } époques, { "13" } points tracés). Sur un axe logarithmique, l'erreur de position vraie et la borne à un sigma propre du filtre en fonction du temps écoulé depuis le début. À l'intérieur des orbites GNSS, le RMS de position est de { "1.4" } m ; au-dessus, il est de { "90" } m, avec une erreur finale de { "184" } m à { "193,330" } km d'altitude avec { "1" } mesure. L'erreur d'estimation normalisée au carré moyenne sur toute l'exécution est de { "4.4" } (environ { "3" } pour un bloc de position cohérent). La vérité et le filtre partagent leurs substituts du Soleil et de la Lune. MODELLED : une étude modélisée à partir d'entrées indiquées, non une mesure et non une affirmation de volume de service pour un système quelconque. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.

# attr:alt
seg-9a947b61a4cb = Navigation relative de { "2" } satellites adjoints autour d'un chef sur une orbite haute, d'après une exécution réelle du moteur v{ $version } sur scenarios/gnss-ssv-formation-heo.toml ({ "401" } époques). Pour chaque adjoint, deux barres : le RMS de position relative obtenu en soustrayant les deux estimations absolues indépendantes, et celui du filtre relatif sur des pseudodistances à différence simple. Ligne de base { "0.8" } km : { "5.1" } m et { "1.2" } m. Ligne de base { "2.0" } km : { "4.1" } m et { "2.1" } m. Le filtre absolu n'est pas cohérent ici : erreur d'estimation normalisée au carré moyenne { "187" } contre environ { "3" } pour un filtre cohérent, de sorte que son incertitude annoncée est bien trop petite. MODELLED : une étude modélisée à partir d'entrées indiquées, non une mesure et non une affirmation de volume de service pour un système quelconque. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.

# attr:alt
seg-d76123040989 = La comparaison enregistrée du modèle de disponibilité de l'utilisateur spatial avec le livret public Space Service Volume, d'après les résultats enregistrés de l'exécution préenregistrée (xval/gnss-ssv/results-run1.json, écrit par l'exemple ssv_booklet_check du moteur v{ $version }). Seuil par seuil, les cellules dans la tolérance : S0 { "13" } sur { "13" } (MET) ; S1 { "43" } sur { "52" } (NOT MET) ; S2 { "48" } sur { "52" } (NOT MET) ; S3 { "122" } sur { "155" } (NOT MET) ; S4 { "132" } sur { "156" } (NOT MET) ; S5 { "18" } sur { "26" } (NOT MET) ; S6 { "26" } sur { "26" } (MET) ; S7 { "0" } sur { "20" } diagrammes de panneaux (NOT MET). Seuls S0 et S6 sont atteints selon la lecture préenregistrée. Une variante de diagnostic qui utilise les autres angles GLONASS du livret amène S1, S2 et S4 à toutes les cellules, mais ne remplace pas l'exécution de référence. Aucune ligne du registre n'est VALIDATED. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.

# text
# c1: docs/SSV.md
seg-74675df154dc = Source : <c1/>

# text
# c1: gnss-ssv
seg-ce7ea32e67f1 = Le GNSS au-delà de la constellation : le type <c1/>

# text
seg-389cb131fd77 = À titre consultatif seulement. Résultats modélisés à partir d'entrées indiquées et d'une vérité simulée ; ni une certification, ni un chiffre qualifié pour le vol, ni une affirmation de volume de service pour un système quelconque. Kshana n'émet rien.

# text
# c1: gnss-ssv
# c2: [shell]
# c3: [trajectory]
# c4: [navigation]
# c5: [formation]
seg-a0011b278269 = Le type <c1/> répond à ceci : pour un engin spatial au-dessus, autour ou bien au-delà des orbites GNSS, combien de signaux GNSS peut-il utiliser, quelle est leur force, quelle est la qualité de la géométrie, et que peut en faire un filtre embarqué ? Il a trois modes, choisis selon la table que contient le scénario : <c2/>, <c3/> ou <c4/> (avec un <c5/> facultatif).

# text
seg-2e4ac6b7a883 = État : <b>MODELLED</b>. Les balayages de disponibilité sont comparés au livret Space Service Volume de l'ICG dans le cadre d'un préenregistrement ; voir <a1>ce que montre la comparaison</a1> avant de s'appuyer sur un nombre quelconque.

# text
seg-a0ff58bccaa8 = Sources publiques

# text
# c1: xval/gnss-ssv/fetch.sh
seg-4658268e82e1 = <em>The Interoperable Global Navigation Satellite Systems Space Service Volume</em>, Bureau des affaires spatiales des Nations Unies, ST/SPACE/75 ({ "1" }er novembre { "2018" }), préparé par le Comité international sur les GNSS (ICG), groupe de travail B : la méthode (annexe B), les éléments orbitaux de chaque constellation (annexe C), les ouvertures de faisceau et puissances d'émission (tableaux B2, B6, B8, { "4.2" }), les antennes utilisateur (tableau B10), et les tableaux de disponibilité publiés. Il s'agit lui-même d'une simulation. Récupéré par <c1/> (SHA-256 épinglé), jamais embarqué dans le dépôt.

# text
seg-e46d9353e6f3 = U.S. Coast Guard Navigation Center, diagrammes des panneaux d'antenne des GPS Block IIR et IIR-M (Marquis, { "2014" }) : les diagrammes mesurés des panneaux L1, utilisés uniquement pour juger la solution de remplacement paramétrique (seuil S7). Récupérés, jamais embarqués dans le dépôt, aucune donnée de diagramme versionnée.

# text
# c1: src/ssv/limb.rs
seg-0a002dc0df64 = Les constantes du modèle (gravité, rotation de la Terre, affaiblissement en espace libre, densité de bruit) sont standard ; la loi de densité de la plasmasphère de Gallagher, la couche de Chapman et le profil de réfractivité radio sont des formes publiées, utilisées avec des paramètres simples indiqués (voir <c1/>).

# text
seg-c3c3f63df966 = Mode coque : la métrique globale du livret

# text
# c1: [shell]
seg-f1e153c95b13 = <c1/> place un utilisateur sur une sphère (par défaut { "36,000" } km d'altitude avec une antenne hémisphérique pointée au nadir, le SSV supérieur ; ou { "8,000" } km avec une antenne omnidirectionnelle, le SSV inférieur) sur une grille d'icosphère de 2,562 points et compte, sur { "14" } jours par pas de 1 minute, la part des couples (utilisateur, époque) avec au moins un et au moins quatre signaux, par constellation et en combiné, ainsi que la plus longue interruption pour l'utilisateur le plus défavorisé. Le balayage utilise l'intervalle de visibilité en forme fermée en angle au centre (un cône de faisceau, le blocage par la Terre représenté par la sphère de { "6378" } km plus { "50" } km, l'hémisphère de l'utilisateur et la limite de portée RF) et s'exécute en quelques secondes dans un build de release ; un test de propriété le vérifie par rapport au prédicat géométrique général.

# text
seg-3fb4c06c8b3f = Mode trajectoire : le long d'une orbite

# text
# c1: [trajectory]
# c2: leo
# c3: meo
# c4: geo
# c5: heo
# c6: lunar-transfer
seg-632fedc95af5 = <c1/> fait voler l'utilisateur sur une orbite képlérienne (un préréglage : <c2/>, <c3/>, <c4/>, <c5/> (le tableau { "5.10" } du livret) ou <c6/>, ou des éléments) et rapporte, par bande et par constellation, la disponibilité d'un et de quatre signaux, les durées d'interruption, les signaux en vue, le meilleur C/N0, la dilution de précision (médiane, 95e centile, pire cas), les liaisons reçues par le lobe principal et par les lobes secondaires, ainsi qu'une série temporelle et un CSV facultatifs.

# text
# c1: [transmit] pattern
# c2: booklet
# c3: parametric
# c4: table
# c5: pattern_csv
# c6: pattern_text
# c7: xval/gnss-ssv/extract_patterns.py
seg-7bfd301cd789 = <b>Diagramme d'émission</b> (<c1/>) : <c2/> (puissance constante à l'intérieur de l'angle hors axe de référence), <c3/> (une solution de remplacement étiquetée : { "3" } dB par degré au-delà de l'angle de référence jusqu'à un plancher { "25" } dB sous le lobe principal ; <b>pas</b> le diagramme mesuré d'un système quelconque) ou <c4/> (un diagramme mesuré que vous fournissez : <c5/> ou <c6/> en ligne ; les diagrammes des panneaux Block IIR/IIR-M peuvent être extraits avec <c7/>).

# text
seg-c1390929d9f2 = <b>Antennes de réception</b> : omnidirectionnelle, hémisphérique, ou les antennes à gain élevé et les antennes patch du tableau B10 du livret, au nadir ou au zénith ; chaque liaison utilise l'antenne au gain le plus élevé.

# text
# c1: [atmosphere]
seg-fe56ab7a2cac = <b>Milieu de rayon rasant</b> (<c1/>) : une ionosphère de Chapman, une plasmasphère (forme de Gallagher { "1988" }, plasmapause à L = { "4.5" }, atténuée sous { "1,500" } km) et une atmosphère neutre (courbure d'environ { "1.33" } degrés à la surface, absorption par l'oxygène, défocalisation) intégrés le long du rayon rectiligne. Rapporte le TEC oblique, la part plasmasphérique, le retard excédentaire, l'altitude de la tangente et les liaisons perdues par rasance. Intégration en rayon rectiligne : la courbure est rapportée, non itérée.

# text
# c1: [receiver] weak_signal
seg-1bad91204f6a = <b>Récepteur de signal faible</b> (<c1/>) : intégration cohérente et non cohérente, limite de bit de données, canaux d'aide et pilote, recherche Doppler ; le seuil d'acquisition aux probabilités de détection et de fausse alarme indiquées et les seuils de poursuite de porteuse et de code remplacent le seuil fixe de C/N0 (plage de { "10" } à { "25" } dB-Hz). Réutilise les modèles d'acquisition et de boucle de poursuite du moteur.

# text
seg-497126fe23e9 = Mode navigation : un filtre embarqué

# text
# c1: [navigation]
# c2: [atmosphere]
seg-af7919ae046e = <c1/> fait voler un engin en orbite haute ou en transfert lunaire et exécute un filtre de Kalman étendu à neuf états (position, vitesse, biais et dérive d'horloge du récepteur, un facteur d'échelle de pression de radiation solaire) sur des pseudo-distances. La vérité est intégrée avec la gravité de masse ponctuelle, J2, les perturbations de troisième corps du Soleil et de la Lune et la pression de radiation avec une ombre terrestre cylindrique ; le filtre modélise la gravité, J2 et les troisièmes corps et estime la pression de radiation. Les pseudo-distances proviennent de la même géométrie de liaison et du même seuil de C/N0 que les balayages ; leur bruit croît à mesure que le C/N0 baisse ; le retard excédentaire du milieu (avec <c2/>) est ajouté et n'est pas modélisé par le filtre. Le rapport sépare la partie de l'exécution à l'intérieur des orbites GNSS (sous { "20,000" } km d'altitude) de la partie au-dessus, donne la plus longue interruption sans mesure et l'erreur d'estimation normalisée au carré moyenne (environ { "3" } pour un bloc de position cohérent). Le Soleil et la Lune sont des substituts circulaires de faible précision.

# text
seg-a515950c13d6 = Mode formation : navigation relative

# text
# c1: [formation]
# c2: [navigation]
seg-8d2b72ca56d9 = <c1/> (a besoin de <c2/> pour le chef de file) ajoute des adjoints décalés en anomalie vraie. Chaque engin exécute le filtre absolu ; la position de l'adjoint par rapport au chef de file est estimée en soustrayant les estimations absolues indépendantes et par un filtre relatif sur des pseudo-distances à simple différence des signaux que les deux engins poursuivent. Le rapport donne les deux, la référence de base, et le nombre de signaux poursuivis en commun.

# text
seg-dc78efcb8bcb = Ce que montre la comparaison avec le livret

# text
# c1: xval/gnss-ssv/PREREGISTRATION.md
# c2: xval/gnss-ssv/RESULTS.md
# c3: results-*.json
# c4: tests/ssv_booklet_results.rs
seg-643bcfcea515 = Les seuils ont été préenregistrés (<c1/>, addenda { "1" } à { "5" }) avant l'exécution en pleine taille ; résultats dans <c2/>, cellules dans <c3/>, épinglés par <c4/>, échecs compris.

# text
seg-5498636f8d07 = quoi

# text
seg-32c0ea7929e2 = exécution { "1" } (lecture préenregistrée)

# text
seg-abe521171d2f = variante d'angle GLONASS (diagnostic)

# text
seg-9489ef691574 = puissance rayonnée minimale, { "13" } signaux, à { "0.1" } dB près

# text
seg-4b7e0252355c = géométrie du SSV supérieur (tableau B4)

# text
seg-e3c870085a6c = NOT MET ({ "43" } cellules sur { "52" })

# text
seg-b57b1f9b0b43 = les { "52" } cellules dans la tolérance

# text
seg-6bf57763d120 = SSV inférieur (tableau { "5.2" })

# text
seg-c9349a3a0185 = NOT MET ({ "48" } sur { "52" })

# text
seg-056eae8e55d1 = les { "52" }
