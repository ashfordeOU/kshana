# docs--tutorial-first-orbit: translations (fr)

# text
seg-51ae9468b92a = Ce qu'est ce scénario

# text
seg-08f3fdc9252a = Lire le résumé d'une ligne

# text
seg-def5271a207d = Ce que le test fixe

# text
seg-e5f926d1055b = Pièges et unités

# text
seg-cb457294fc53 = Pour aller plus loin

# text
# c1: docs/tutorials/01-first-orbit.md
seg-dcb2d0b170c1 = Source : <c1/>

# text
seg-f57d8b38bf08 = Tutoriel { "1" } — Ma première orbite : où sont les satellites GPS

# text
# c1: orbit
# c2: scenarios/orbit-sgp4-gps.toml
# c3: scenarios/orbit.toml
seg-1b9e1178555d = <c1/> · <b>Scénario :</b> <c2/> (copie pédagogique : <a1><c3/></a1>) · <b>Difficulté :</b> débutant · <b>~{ "15" } min</b>

# text
seg-d065731294a1 = À la fin, vous aurez propagé la <em>véritable</em> constellation GPS opérationnelle, lu sa disponibilité et sa géométrie, et exporté un tableau de l'endroit où se trouve réellement chaque satellite dans l'espace — et vous saurez que ce tableau est validé par rapport à une référence externe, et non par rapport à lui-même.

# text
seg-b07bb365235d = Les satellites GPS (Global Positioning System) indiquent à un utilisateur <em>où il se trouve</em> et <em>quelle heure il est</em>. Avant tout cela, il faut savoir <b>où sont les satellites</b> et <b>combien d'entre eux un utilisateur peut voir</b>. C'est la géométrie, et la géométrie fixe le plancher de la précision avec laquelle vous pouvez être positionné (la dilution de la précision, ou DOP). Ce tutoriel :

# text
# c1: gps-ops
seg-dec5079e7715 = prend un véritable instantané Celestrak <c1/> de la constellation GPS (2021-07-28, { "30" } satellites, véritables éléments à deux lignes, TLE),

# text
seg-693859c435d8 = propage chaque satellite avec le modèle validé SGP4/SDP4 (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }),

# text
seg-74b73260c7bc = détermine à chaque pas de temps quels satellites un utilisateur en orbite terrestre basse peut voir (ligne de visée, occultation par la Terre et masque d'élévation de { "5" }°),

# text
seg-605c40b73e96 = transforme cette géométrie en <b>PDOP</b> (dilution de la précision en position) et en <b>précision de position</b>, et

# text
seg-356e96d219b5 = exporte les positions réelles des satellites dans le référentiel terrestre fixe centré sur la Terre (ECEF) vers un fichier SP3 (Standard Product { "3" }, le format d'orbite précise de l'International GNSS Service, IGS ; GNSS désigne Global Navigation Satellite System).

# text
seg-ff1666fe175e = Le fil conducteur est : <b>TLE → propagation SGP4 → ECEF par époque → visibilité → nombre de satellites visibles → PDOP → sigma de position = PDOP · σ_UERE</b>, où σ_UERE est l'erreur de distance équivalente de l'utilisateur (l'erreur de mesure de distance à 1 σ par satellite).

# text
seg-379da723ae57 = Ou ouvrez le <a1>Studio dans le navigateur</a1> et choisissez le scénario d'orbite.

# text
seg-441743833f1e = L'exécution déterministe (seed = { "17" }) affiche :

# text
seg-918a30fea48a = Champ par champ :

# text
# c1: scenario 4c51512369a6
seg-375fad797dcf = <b><c1/></b> — l'empreinte de scénario de 12 caractères. Elle identifie de façon unique les entrées exactes (graine, seuils, paramètres du modèle, bloc TLE). Changez une entrée et elle change ; gardez-les identiques et vous reproduisez l'exécution bit pour bit. La même empreinte est inscrite dans le pied du graphique et dans le fichier JSON (JavaScript Object Notation) de résultat.

# text
# c1: 345/361 samples GNSS-nominal
seg-133711d1ad9f = <b><c1/></b> — sur les { "361" } pas de temps, l'utilisateur dispose d'un point exploitable à { "345" } d'entre eux ({ "95.6" } %). L'exécution est un passage de { "12" } h ({ "43,200" } s) avec un pas de { "120" } s.

# text
# c1: best PDOP 1.07
seg-a500c0473784 = <b><c1/></b> — la meilleure (la plus basse) dilution de la précision en position sur le passage. Un PDOP proche de { "1" } correspond à une excellente géométrie ; plus il est bas, mieux c'est.

# text
# c1: pos 1.07m
# c2: sigma_uere_m = 1.0
seg-98a24f0170d2 = <b><c1/></b> — la meilleure précision de position : <b>sigma de position = PDOP · σ_UERE</b>. Dans ce scénario, <c2/>, de sorte que les deux nombres sont <em>numériquement égaux</em> ici — mais la règle est PDOP × UERE, <b>et non</b> « position = PDOP ». Avec une UERE de { "3" } m, le sigma de position serait d'environ { "3.2" } m. (Voir le piège à la fin.)

# text
# c1: holdover
# c2: p95
# c3: integrity
# c4: security
# c5: security
# c6: n/a (no attack)
seg-410081c6dcab = Les figures d'horloge (<c1/>, <c2/>, <c3/>, <c4/>) sont fournies parce que le paquet d'orbite porte aussi une horloge pendant le passage ; elles sont l'objet du <a1>Tutoriel { "2" }</a1>, et non de celui-ci. (<c5/> affiche <c6/> parce qu'aucune attaque n'est configurée.)

# text
seg-95ccef0d94ae = Le bloc de géométrie du JSON contient les nombres sous-jacents :

# text
seg-89cb7db9b9eb = Où sont les satellites ? (la récompense)

# text
seg-81678afa0cee = La géométrie est bonne <em>parce que</em> les satellites sont réellement dans la couche GPS. Prouvez-le — exportez leurs positions dans le référentiel terrestre fixe :

# text
seg-1452dfac9e06 = Les trois premiers satellites au premier pas d'échantillonnage, ECEF en km (le fichier SP3 porte une quatrième colonne, d'horloge, écrite avec le marqueur « sans valeur » { "999999.999999" }) :

# text
seg-4fd0f95da0cf = Prenons le rayon géocentrique de PG01 :

# text
seg-cb02d7c01561 = La référence indépendante non circulaire : est-ce vraiment une orbite GPS ?

# text
seg-a7c478360464 = Un tutoriel qui vérifie le moteur par rapport à lui-même ne prouve rien. Voici l'ancrage externe, <em>non circulaire</em>, de chaque affirmation ci-dessus.

# text
# c1: a
# c2: tests/tutorials.rs::tutorial1_satellites_are_in_the_gps_meo_shell
# c3: 26000 km < |r(PG01)| < 27200 km
# c4: a
seg-eec62069a957 = <b>{ "1" }. Les satellites se situent sur la véritable couche d'orbite terrestre moyenne (MEO) du GPS.</b> Le demi-grand axe nominal du GPS est <b>a = { "26,560" } km</b>, soit une altitude ≈ { "20,180" } km au-dessus du rayon terrestre moyen de { "6,378" } km (IS-GPS-200, la spécification d'interface du GPS ; la norme de performance du service de positionnement standard (SPS) du GPS, département de la Défense des États-Unis (DoD) ; Misra & Enge, <em>Global Positioning System</em>, 2e éd.). Le rayon instantané de PG01, de <b>{ "26,480.9" } km</b>, se situe à quelques centaines de km de <c1/> — exactement ce que produit l'excentricité réelle du GPS (~{ "0.005" }–{ "0.02" }). Le test <c2/> vérifie <c3/> par rapport à ce <c4/> publié, qui est <b>externe à Kshana</b>.

# text
# c1: T = 2π√(a³/μ)
# c2: a = 26,560 km
# c3: μ = 398,600.4418 km³/s²
# c4: T = 43,078 s = 11.967 h
seg-a052774de08f = <b>{ "2" }. La durée du passage est une révolution GPS.</b> La troisième loi de Kepler donne la période <c1/> avec <c2/> et <c3/> (World Geodetic System { "1984" }, WGS-84 ; rapport technique de la National Imagery and Mapping Agency NIMA TR8350.2) : <c4/>, soit un demi-jour sidéral. La durée du scénario de { "43,200" } s (« environ une révolution GPS ») s'y accorde à moins de { "0.3" } % près, et la trace au sol du GPS se répète chaque jour sidéral (deux révolutions), selon l'IS-GPS-200.

# text
# c1: tests/sgp4_verification.rs
# c2: docs/SGP4-VALIDATION.md
# c3: sgp4
seg-067fb466e396 = <b>{ "3" }. Les positions propagées sont validées, et non auto-cohérentes.</b> Le propagateur SGP4/SDP4 qui a produit ce tableau ECEF concorde avec <b>l'ensemble des { "666" } vecteurs de vérification AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 avec un pire cas de { "4.12" } mm</b> (<c1/>, <a1><c2/></a1>) et concorde avec la crate indépendante <c3/> à moins du micron. Le tableau que vous avez exporté est donc vérifié par rapport à une implémentation de référence externe, et non par rapport à l'arithmétique propre de Kshana.

# text
seg-652ec3b3d3b8 = <b>Une remarque sur les dates SP3.</b> L'en-tête d'époque SP3 affiche une date calendaire de substitution (2000-01-01) ; la propagation part en réalité de l'époque propre à chaque TLE ({ "2021" }). Lisez le tableau comme « positions ECEF au premier pas d'échantillonnage », et non « au { "1" } janv. { "2000" } ».

# text
# c1: tests/tutorials.rs
seg-74dcb96a27a9 = <c1/> transforme chaque nombre ci-dessus en contrat d'intégration continue :

# text
# c1: tutorial1_orbit_headline_holds
# c2: best_pdop ≈ 1.071
# c3: best_position_sigma_m == best_pdop
# c4: sigma_uere_m = 1.0
# c5: samples_total == 361
# c6: 345/361
seg-cbad1e83279d = <c1/> — <c2/>, <c3/> (parce que <c4/>), <c5/>, et le résumé contient <c6/>.

# text
# c1: tutorial1_satellites_are_in_the_gps_meo_shell
# c2: a = 26,560 km
seg-241d75b1502b = <c1/> — le rayon de PG01 se situe dans la bande de la couche GPS, vérifié par rapport au <c2/> publié.

# text
seg-34328f4f148b = Si le moteur cesse un jour de produire une véritable couche GPS, la construction passe au rouge.

# text
# c1: sigma_uere_m = 1.0
seg-3c23c11911cb = <b>Le sigma de position est PDOP × UERE, et non PDOP.</b> Les deux sont égaux <em>uniquement parce que</em> <c1/> ici. Changez l'UERE et ils se séparent.

# text
seg-6bb2f31c15dc = <b>Les figures de synchronisation temporelle sont en nanosecondes</b>, la figure de position en mètres. Ne les mélangez pas.

# text
# c1: holdover_s
seg-5bc68d0c144d = <b><c1/> est quantifié par la grille</b> (une borne inférieure au pas de la grille temporelle). Dans ce passage, l'utilisateur est pratiquement toujours en position fixée, donc le holdover est de { "0" } s (aucune panne à traverser en roue libre) — c'est le <em>bon</em> cas.

# text
# c1: mask_deg
seg-9c36a5c64af5 = Resserrez ou élargissez le masque d'élévation (<c1/>) et observez la disponibilité changer — c'est un exercice de niveau 2.

# text
# c1: scripts/fetch_tles.sh
seg-b0222934237e = Remplacez-le par un instantané TLE récent avec <c1/> (niveau 2 « utiliser des données récentes »).

# text
seg-e487166204f8 = Passez au <a1>Tutoriel { "2" } — Holdover d'horloge</a1>, où le signal GNSS est <em>retiré</em> et où l'horloge embarquée doit tenir en roue libre.

# text
seg-795315608752 = <s1>Précédent</s1>Tutoriels

# text
seg-97ca5a3cc77e = <s1>Suivant</s1>{ "2" } · Holdover d'horloge
