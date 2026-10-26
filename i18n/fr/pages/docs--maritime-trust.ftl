# docs--maritime-trust: translations (fr)

# text
seg-2247a2344710 = Signification

# text
seg-6940543aa3c0 = chaîne

# text
seg-abec93a4a488 = chaîne ou null

# text
seg-f5e7215e6835 = objet

# text
seg-b993ef559bd0 = Depuis le code

# text
seg-c353e7bec219 = Clé

# text
# c1: calibrating
# c2: nominal
# c3: degraded
# c4: untrusted
seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> ou <c4/>

# text
# c1: docs/MARITIME-TRUST.md
seg-2896f449bffb = Source : <c1/>

# text
seg-342f34403ac5 = Confiance maritime : la passerelle peut-elle se fier à ce point de position ?

# text
# c1: kshana receiver-trust
seg-49b609a9655c = <c1/> peut noter, pour un <b>navire en mouvement</b>, un chiffre de confiance en direct de 0 à 100 pour chaque point de position, à partir de ce que tout récepteur met déjà sur le bus (NMEA { "0183" } d'abord), et dire quels contrôles l'ont réduit. C'est une couche logicielle qui se place à côté d'un récepteur. Ce n'est pas un récepteur, elle n'en remplace pas, et elle ne rend pas un point de position plus précis.

# text
seg-3c66739c9250 = <b>Logiciel à titre consultatif.</b> Kshana n'est pas un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) et n'a été évalué par rapport à aucune norme de performance. Son score et sa barrière sont des aides au jugement du navigateur. L'opérateur reste responsable de la sécurité de la navigation du navire et de toute décision de s'appuyer, ou de cesser de s'appuyer, sur un point de position.

# text
# c1: RECEIVER-TRUST.md
seg-a9899ca66661 = Cette page dit ce que les contrôles examinent, ce que chacun peut et ne peut pas détecter, comment l'exécuter en direct et ce que fait la barrière. La correspondance du score et chaque valeur par défaut figurent dans <a1><c1/></a1>.

# text
seg-05e79b6c5a58 = Ce qu'il lit

# text
seg-e784fdbe26e6 = Un navire est déclaré dans le fichier de session, avec ses limites énoncées avant l'exécution :

# text
seg-e8e9ee2965cf = Phrase

# text
seg-e127f2f26824 = Lu

# text
seg-5e17bb4156f1 = GGA

# text
seg-b38b8385ddcb = position, qualité du point ({ "0" } = pas de point de position), altitude au-dessus du niveau moyen de la mer, séparation du géoïde, HDOP

# text
seg-870056f55c30 = RMC

# text
# c1: A
# c2: V
seg-445c02505551 = état (<c1/> valide, <c2/> non), vitesse et route sur le fond, date, mode

# text
seg-8a259fc7b06d = VTG

# text
seg-eb3e34f58751 = vitesse et route sur le fond, là où RMC n'en a pas

# text
seg-add66711c27b = HDT, THS

# text
# c1: V
seg-24e36e50b0ad = cap (THS seulement lorsque son mode n'est pas <c1/>)

# text
seg-bcfb4cd59951 = VHW, VBW

# text
# c1: A
seg-fa0a0dae1510 = vitesse dans l'eau (VBW seulement lorsque son état est <c1/>)

# text
seg-774d1991fb0b = ZDA

# text
seg-68d981999c72 = heure

# text
seg-a0cc45088f5f = GSV

# text
seg-0fad368a11cb = intensité du signal par satellite (dB-Hz), élévation et azimut (pour la géométrie)

# text
seg-032eafc03b42 = GSA

# text
seg-71334afb8a7d = dilution de précision et satellites utilisés (pour la géométrie, là où GSV ne donne pas de ciel ; et le HDOP déclaré que la protection compare)

# text
# c1: A
# c2: F
# c3: N
seg-305f423d3ead = un état OSNMA rapporté par un récepteur, traduit en cette phrase par l'adaptateur qui lit le récepteur : <c1/> authentifié, <c2/> échec, <c3/> aucun résultat

# text
# c1: V
# c2: E
# c3: M
# c4: S
# c5: N
seg-7ce1d69e710e = Les époques que le récepteur lui-même déclare ne pas être un point de position par satellite (qualité GGA { "0" }, ou { "6" } à { "8" } : estimé, manuel, simulateur ; état RMC <c1/>, ou mode <c2/>, <c3/>, <c4/>, <c5/>) ne sont pas utilisées pour les contrôles de position et ne portent aucune preuve dans un sens ou dans l'autre : le récepteur l'a déjà dit.

# text
# c1: calibration_s
seg-a0ae80781c6e = Les <c1/> premières secondes forment la référence de base et ne sont jamais notées. Chaque moniteur ne regarde que l'époque courante et les précédentes, de sorte qu'une décision prise à une époque ne change pas lorsque des données ultérieures arrivent, et qu'un flux en direct donne le même score que le même texte lu comme un fichier.

# text
seg-068593ad0a52 = Ce que chaque contrôle détecte, et ce qu'il ne peut pas détecter

# text
seg-094b90f0c701 = Les directions entre points de position (le relèvement de trajectoire utilisé par le contrôle du taux de virage, la route impliquée par deux positions) sont la direction de la corde qui les relie, c'est-à-dire l'<b>azimut moyen</b> de la géodésique entre les points, et non l'azimut direct au premier point ; les deux diffèrent d'environ la moitié de la convergence des méridiens entre les points ({ "0.001" } degré pour une base de { "260" } m à { "59.5" } degrés de latitude).

# text
seg-ed3cdfcfbff5 = Une position contrefaite doit concorder avec la physique d'un navire et avec les autres capteurs du navire. Chaque contrôle compare le point de position à l'un d'eux. Un contrôle n'est indépendant que dans la mesure de son autre source : un cap issu d'un compas GNSS, ou une « vitesse dans l'eau » dérivée du GNSS, n'est pas indépendant du récepteur sous test et n'apporte rien.

# text
seg-9480aabf136e = Contrôle

# text
seg-20e4f746c7e1 = Détecte

# text
seg-e7b2ebe5eabc = Ne peut pas détecter

# text
seg-21ad9895f606 = un saut de position ; une trajectoire dont la vitesse et la route rapportées n'expliquent pas le mouvement ; une vitesse, une accélération ou un taux de virage impliqués au-delà des limites déclarées du navire

# text
seg-dcbc6d4cd17f = un entraînement dont la vitesse et la route rapportées suivent la trajectoire contrefaite et restent dans les limites (le récepteur les dérive de sa propre solution, de sorte qu'elles concordent entre elles) ; une limite de vitesse déclarée trop haute

# text
seg-3542f83a7988 = une trajectoire qui s'écarte de la direction où pointe le navire de plus que l'angle de dérive déclaré

# text
# c1: min_speed_kn
seg-75f4d659f716 = un entraînement le long de la route (la route ne change pas) ; un cap provenant du même récepteur ou d'un compas GNSS ; une dérive transversale supérieure à la tolérance (fausse alarme) ; des vitesses inférieures à <c1/>

# text
seg-09dde82be447 = un entraînement qui modifie la vitesse sur le fond par rapport à la vitesse dans l'eau

# text
seg-6ac740e5f51c = un loch dérivé du GNSS ; un courant supérieur à la marge admise (fausse alarme) ; un entraînement plus lent que la marge admise

# text
seg-e85d5f0933b7 = une altitude qui n'est pas là où la surface de la mer et la hauteur d'antenne déclarée la placent

# text
seg-3806e1d46332 = un leurreur qui garde l'altitude plausible ; la tolérance est large parce que l'erreur verticale en mode autonome est grande ; la séparation du géoïde est enregistrée mais non contrôlée, car il n'y a pas de modèle de géoïde dans le moteur

# text
seg-5b70bd80640e = la signature d'un seul émetteur : le C/N0 de l'ensemble des satellites qui s'effondre en bloc, ou qui monte en bloc, par rapport à la référence de base d'étalonnage

# text
seg-e6874a8047b1 = un leurreur qui module la puissance satellite par satellite ; quoi que ce soit tant que la référence de base elle-même est leurrée ; une cadence GSV trop lente pour suivre

# text
seg-371b17ce936a = l'heure du récepteur qui avance de façon irrégulière ou qui recule ; par rapport à l'horloge de cet ordinateur, l'heure du récepteur qui dérive par rapport à elle (flux en temps réel seulement)

# text
seg-026479cb7966 = une heure contrefaite cohérente et régulière ; une horloge fausse dès le départ

# text
seg-906ab911b73d = un échec d'authentification OSNMA rapporté

# text
seg-a04757b7ae57 = l'état est lu, non vérifié ; un leurreur qui supprime le rapport n'est pas vu

# text
seg-c36c24a337b8 = le déni de puissance et la perte de satellites, comme dans le cas statique

# text
seg-940b39a3988a = ils disent que l'environnement est hostile, non que le point de position est faux

# text
seg-9d751e1f5938 = <b>Ce que les moniteurs NMEA seuls ne peuvent pas faire.</b> Un leurreur qui reproduit toute la constellation avec une position, une vitesse, une route compatible avec le cap, une puissance plausible par satellite et une horloge concordante, tous cohérents entre eux, est invisible pour chacun des contrôles ci-dessus : rien dans les phrases ne distingue son point de position d'un point réel. Un rejeu de signaux réels enregistrés non plus. L'authentification (OSNMA, ou un récepteur doté de sa propre protection anti-leurrage) et des capteurs de navigation indépendants sont ce qui comble cet écart ; cette couche ne peut qu'utiliser leur état rapporté. Un flux déjà leurré pendant que la référence de base se forme n'a pas de référence de base saine. L'absence d'alarme n'est pas une preuve d'un bon point de position.

# text
seg-e3e09e2412fb = Score de confiance

# text
# c1: nominal
# c2: degraded
# c3: untrusted
# c4: RECEIVER-TRUST.md
seg-a1c05079de2f = Chaque époque après l'étalonnage reçoit un score de { "0" } à { "100" } et les raisons pour lesquelles il n'est pas de { "100" } : quels contrôles ont retranché des points, leur statistique par rapport au seuil, et leurs points. Bandes (bornes indiquées dans la session) : <c1/> à { "90" } ou plus, <c2/> à { "55" } ou plus, <c3/> en dessous. La correspondance, chaque pondération et sa raison figurent dans <a1><c4/></a1> ; elle est déterministe et fixée avant qu'un journal soit noté, sans apprentissage et sans rien d'ajusté à des événements.

# text
# c1: advisory
# c2: #
# c3: <desc>
# c4: session.result.json
# c5: session.trust.csv
# c6: score
# c7: score_reasons
# c8: session.trust.svg
seg-d56822e82e3d = Chaque sortie de navire porte la déclaration à titre consultatif : la clé <c1/> du JSON de résultat et de chaque ligne en direct, une première ligne de commentaire <c2/> du CSV (les lecteurs l'ignorent avec leur option de commentaire), le <c3/> et un pied de page du SVG. Sorties d'une exécution par lot : <c4/> (avec le modèle de score et les déductions de chaque époque), <c5/> (avec les colonnes <c6/> et <c7/>) et <c8/>, qui pour un navire est la trajectoire rapportée par le récepteur, colorée par bande de confiance, au-dessus du score en fonction du temps.

# text
seg-918516588036 = Une démonstration synthétique

# text
# c1: examples/maritime-trust/
# c2: session.toml
seg-e6717d346ca6 = <c1/> contient un journal NMEA inventé d'un ferry sur une liaison Tallinn-Helsinki (un extrait de 50 minutes, environ { "17" } kn, { "1" } Hz : GGA, RMC, VTG, un cap gyroscopique, un loch, GSV avec un ciel plausible) dans lequel un entraînement de position éloigne la position <em>rapportée</em> de la position réelle du navire à partir de { "1500" } s. Le récepteur continue de rapporter un point de position <b>valide</b> tout du long ; c'est le score de confiance qui chute, en traversant la bande degraded pour atteindre la bande untrusted. <c2/> énonce chaque seuil, les limites du navire et chaque pondération du score avant l'exécution.

# text
# c1: cargo run --example gen_maritime_trust_demo
# c2: tests/receiver_trust_maritime_demo.rs
seg-b2f24e5091d0 = Le journal est un <b>texte écrit dans un fichier</b> par <c1/> : il ne modélise aucun signal radio et n'émet rien. Ce n'est pas une mesure et la route est illustrative, non une carte marine. <c2/> fige le journal et la sortie attendue comme garde-fous de régression sur les données synthétiques ; ils ne disent rien de la façon dont un moniteur se comporte face à de véritables interférences.

# attr:alt
seg-26ab8544afba = Score de confiance sur un passage synthétique, issu d'une exécution réelle du moteur v{ $version } sur examples/maritime-trust (un journal NMEA inventé d'un ferry sur une liaison Tallinn-Helsinki, { "3001" } époques à { "1" } Hz). Trois couloirs partagent un même axe des temps. En haut : la distance entre la position rapportée par le récepteur et la position réelle du navire, qui reste à quelques mètres près jusqu'à environ { "1576" } s, moment où l'entraînement de position scénarisé du journal l'écarte, tandis que le récepteur continue de rapporter un point de position valide. Au milieu : le score de confiance de { "0" } à { "100" }, non calculé pendant les { "300" } premières secondes d'étalonnage, dans la bande nominal (au moins { "90" }) jusqu'à l'entraînement, puis chutant à travers la bande degraded (au moins { "55" }) pour atteindre la bande untrusted. En bas : la bande de chaque époque sous forme de ruban coloré portant son nom. Le score est à titre consultatif. Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) : l'opérateur reste responsable de la navigation du navire. Le journal est inventé pour montrer le format et les moniteurs ; ce n'est pas une mesure et il ne dit rien de la façon dont un récepteur se comporterait.

# text
# c1: tools/gen_readme_assets.py
# c2: kshana receiver-trust examples/maritime-trust/session.toml
seg-ed183c325c7e = La figure est dessinée par <c1/> à partir d'une exécution réelle de cette démonstration (<c2/>) ; le score est à titre consultatif, et le journal est inventé.

# text
seg-8badaf0d8586 = Spécification de la vue Studio

# text
seg-588092535a89 = À l'intention de qui construit la vue Studio d'une exécution de navire. Rien dans cette section n'est encore implémenté dans le Studio ; le côté moteur (les données ci-dessous) l'est.

# text
seg-5c34f31acf1d = <b>Entrées.</b> L'une ou l'autre de :

# text
# c1: kshana receiver-trust <session.toml>
# c2: receiver_trust(toml)
# c3: score_model
# c4: monitors_run
# c5: states
# c6: epochs[]
# c7: t_s
# c8: state
# c9: alarms
# c10: score.{score,band,deductions[]}
# c11: marine.{position:[lat,lon], stats, ratios}
# c12: geometry
# c13: class
# c14: geometry_model
# c15: geometry_summary
seg-57ca6d9000b1 = le JSON de résultat d'une exécution par lot (<c1/>, ou le même via <c2/> dans le paquet WebAssembly avec le journal en ligne) : <c3/> (bornes des bandes, rampe, maintien des preuves, chaque pondération), <c4/>, <c5/>, et <c6/>, chacun avec <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, et à partir de { "0.36" } <c12/> et le <c13/> de chaque déduction, avec <c14/> et <c15/> au niveau supérieur ; ou

# text
# c1: position
seg-bfab64386b6c = les lignes JSON en direct (schéma ci-dessus), un objet par époque, ajoutées au fil du flux. Chaque ligne porte la <c1/> rapportée par le récepteur (schéma { "1.1" }).

# text
# c1: examples/maritime-trust/
# c2: session.toml
# c3: tallinn-helsinki.nmea
# c4: tallinn-helsinki.truth.csv
# c5: t_s,true_lat_deg,true_lon_deg
seg-f7c7462d315e = Le jeu de démonstration est <c1/> : <c2/>, <c3/> (le journal) et <c4/> (<c5/> : où le navire se trouvait réellement, ce qu'aucun journal réel ne contient). Une vue devrait exécuter la session et lire en parallèle le fichier de vérité.

# text
seg-c015c26cf30a = Ce qu'il faut dessiner.

# text
seg-92f452bdbed6 = <em>Trajectoire</em>, nord en haut, une seule échelle sur les deux axes : les positions rapportées par le récepteur sous forme d'une ligne colorée selon la bande de l'époque (gris étalonnage, vert nominal, ambre degraded, rouge untrusted), début et fin marqués, une barre d'échelle. Pour la démonstration, la trajectoire vraie sous forme d'une ligne neutre fine en dessous, de sorte que l'entraînement apparaît comme la séparation des deux ; une bascule pour la trajectoire vraie et un affichage du décalage en mètres à l'instant du curseur.

# text
# c1: nominal_min
# c2: degraded_min
# c3: score_model
seg-3ba328e2188c = <em>Courbe temporelle du score</em> : le score de { "0" } à { "100" } en fonction du temps, les bornes des bandes (<c1/>, <c2/> de <c3/>) en lignes pointillées, la bande sous forme de ruban en dessous, et le début de tout événement déclaré sous forme de repère. L'axe des temps est partagé avec la trajectoire.

# text
# c1: score_model.weights
# c2: monitors_run
# c3: geometry
# c4: score_model.weights
# c5: geometry_model.cap_in_force
seg-33447da1d56d = <em>Raisons</em> : pour l'époque sous le curseur, les déductions (moniteur, rapport au seuil, points) sous forme de barres horizontales, les plus grandes en premier, avec la pondération que porte chaque moniteur d'après <c1/> ; les moniteurs qui ont tourné sans rien coûter affichés en pâle, les moniteurs qui n'ont pas tourné (absents de <c2/>) listés comme « non exécuté », jamais comme réussis. Le moniteur <c3/> n'a pas d'entrée <c4/> : son plafond est <c5/>.

# text
# c1: monitors_run
seg-d0379b68ea67 = <em>Bandes de moniteurs</em> : une bande fine par moniteur de <c1/> montrant son rapport en fonction du temps (alarme à { "1" }), de sorte qu'un lecteur voit quel contrôle a bougé en premier.

# text
# c1: gate
# c2: off
# c3: passed
# c4: withheld
# c5: $PKSHT
seg-83d881ce6ab0 = <em>État de la barrière</em> : dans une vue en direct, le <c1/> de chaque époque (<c2/>, <c3/>, <c4/>) sous forme de bande sous la bande de confiance, et la dernière <c5/>. Dans une vue par lot, les époques qu'une barrière aurait retenues sont celles dont la bande est untrusted, avec le maintien avant libération appliqué.

# text
# c1: geometry.status
# c2: class
# c3: geometry_summary
# c4: geometry.note
# c5: n_used
# c6: source
# c7: age_s
# c8: reported_derived_mismatch
# c9: unknown
# c10: [geometry]
# c11: geometry_model
seg-b96652af3a03 = <em>Couloir de géométrie</em> ({ "0.36" }) : une bande sous la bande de confiance colorée selon <c1/> (vert good, ambre degraded, gris hachuré unknown), dans une famille de couleurs distincte de celle des couloirs d'incohérence et d'environnement, avec la légende « géométrie : le ciel, non le signal ». Des déductions colorées selon <c2/> (geometry, environment, inconsistency) dans le panneau des raisons et les bandes de moniteurs, et les nombres d'époques par classe d'après <c3/> à côté des nombres par bande. Pour l'époque sous le curseur : <c4/>, <c5/>, HDOP, PDOP, VDOP, <c6/>, <c7/>, et un indicateur lorsque <c8/> est défini (la déduction de géométrie est alors une incohérence). <c9/> s'affiche comme « géométrie inconnue : ni GSV ni GSA dans le journal », jamais comme bonne. Les seuils <c10/> et leur provenance d'après <c11/> se placent à côté des réglages du score. La note à titre consultatif demeure.

# text
seg-c48906d03f90 = <em>Point de position rapporté par le récepteur</em> : le récepteur de la démonstration rapporte un point de position valide tout du long (qualité GGA { "1" }, état RMC A) ; dites-le dans la légende, car c'est tout l'intérêt de la vue.

# text
seg-869c8a92e2cf = <b>Interactions.</b> Un curseur temporel unique partagé par tous les panneaux (glisser, touches fléchées, et un bouton de lecture qui rejoue de 1x à 60x) ; survoler la trajectoire ou une bande quelconque le déplace. Cliquer sur une déduction met en évidence les époques où ce moniteur était au-dessus de son seuil de déclenchement. Un filtre de bande (n'afficher que les époques degraded et untrusted) et un saut vers la première déduction et vers la première époque untrusted. Un texte au survol de chaque nom de moniteur donnant la description en une ligne de cette page. Les seuils et les pondérations de la session sont affichés, en lecture seule, à côté du graphique, de sorte que ce que le score a utilisé est à l'écran.

# text
seg-1f97fe8ea2f1 = <b>Formulations à conserver.</b> La page doit dire qu'il s'agit d'un logiciel à titre consultatif et non d'un équipement de navigation homologué, que la démonstration est un texte synthétique avec un entraînement inventé, et qu'un point de position sans alarme n'est pas pour autant un bon point de position (voir les limites ci-dessus). Aucun chiffre de la page ne doit se lire comme une mesure de la façon dont les contrôles se comportent face à de véritables interférences.

# text
# c1: kshana::receiver_trust::assess
seg-079ce44fd53e = Pour les appelants qui détiennent la session et les octets en mémoire (pas de fichiers, pas d'horloge, pas de sockets ; sûr pour WebAssembly), <c1/> propose :

# text
# c1: assess_vessel_log(session_toml, log_bytes) -> Result<ReceiverTrustResult, String>
# c2: kshana receiver-trust <session.toml>
# c3: score_model
# c4: monitors_run
# c5: epochs[]
seg-e8c3172d72b8 = <c1/> : un journal entier, noté comme une exécution par lot ; le même résultat que <c2/>, qui se sérialise en JSON de résultat (<c3/>, <c4/>, <c5/> avec scores et déductions).

# text
# c1: assess_stream_excerpt(session_toml, excerpt_bytes) -> Result<ExcerptAssessment, String>
# c2: epochs[]
# c3: $PKSHT
seg-0302b7c35fd3 = <c1/> : un morceau borné d'un flux (au plus { "2" } Mio et { "20,000" } époques, et assez long pour contenir la fenêtre d'étalonnage), noté comme le mode en direct le note et renvoyé dans le schéma de lignes JSON en direct (<c2/>, la dernière <c3/>, un résumé des nombres par bande, du score le plus bas et final, de la première heure untrusted). L'heure du récepteur n'est pas comparée à une horloge hôte. Le mode en direct de longue durée (sockets, fichier en cours d'ajout, barrière) relève du binaire.

# text
# c1: [platform] kind = "vessel"
# c2: [log]
seg-d971dae93784 = Les deux exigent une session avec <c1/> ; sa table <c2/> est facultative.

# text
seg-870fece8026e = L'exécuter en direct

# text
# c1: session.toml
# c2: [platform]
# c3: kind = "vessel"
# c4: [log]
# c5: stty
# c6: cat
seg-c132d449414f = La session est le même <c1/> que pour une exécution par lot, avec une table <c2/> qui déclare <c3/> ; sa table <c4/> n'est pas nécessaire. Les ports série ne sont pas encore ouverts directement : lisez le port avec l'outil que vous utilisez déjà (<c5/> et <c6/>, un serveur de terminaux, un multiplexeur) et redirigez-le ou transmettez-le. L'entrée série directe pourra venir plus tard.

# text
seg-13a043c1ce60 = Chaque époque terminée écrit une ligne JSON sur la sortie standard :

# text
# c1: state
# c2: calibrating
# c3: nominal
# c4: degraded
# c5: untrusted
# c6: [score]
# c7: score
# c8: deductions
seg-b1f0c563c94d = <c1/> vaut <c2/>, <c3/>, <c4/> ou <c5/> (la bande du score, avec les bornes dans la table <c6/> de la session) ; <c7/> est absent pendant l'étalonnage ; <c8/> énumère quels contrôles ont retiré des points et combien, les plus grands en premier.

# text
seg-9b21238a7dc1 = Schéma de lignes JSON (version { "1.1" })

# text
seg-79306ff2d878 = Un objet JSON par époque terminée, clés dans cet ordre :

# text
seg-a129b9e613d0 = Type

# text
seg-bbcdd898d24d = entier

# text
seg-96958263575f = nombre d'époques rapportées, à partir de { "1" }

# text
seg-16022703e1c0 = nombre

# text
seg-95dde7698840 = secondes depuis la première époque du flux

# text
# c1: hh:mm:ss.mmm UTC (date not in log)
seg-dee4f7b91079 = l'heure de l'époque telle que le flux l'indique (UTC ISO-8601 avec une date une fois qu'une RMC a été vue, sinon <c1/>)

# text
seg-0361f40a8e59 = nombre ou null

# text
# c1: note
seg-c2418289d966 = { "0" } à { "100" }, une décimale ; null pendant l'étalonnage ou lorsque <c1/> dit pourquoi aucun n'a pu être produit

# text
seg-00575e5df2e1 = tableau

# text
# c1: {"monitor": string, "ratio": number, "points": number, "class": string}
# c2: ratio
# c3: class
# c4: geometry
# c5: environment
# c6: inconsistency
seg-54c1f879643b = <c1/>, plus grands points en premier ; <c2/> est la statistique rapportée au seuil (alarme à { "1" } ou plus) ; seuls les moniteurs qui coûtent des points sont listés ; <c3/> <em>(ajouté en { "1.3" })</em> vaut <c4/>, <c5/> ou <c6/>

# text
seg-24d178dfb34f = tableau de chaînes

# text
seg-30948e769405 = moniteurs à leur seuil ou au-dessus

# text
# c1: off
# c2: passed
# c3: withheld
seg-fb08af60656f = <c1/>, <c2/> ou <c3/>

# text
seg-495aa49df7e2 = pourquoi aucun score n'a été produit (par exemple un capteur de cap déclaré qui est absent)

# text
seg-3dabfd59cf4b = objet ou null

# text
# c1: {"lat_deg", "lon_deg", "height_m"}
seg-9395d2543ac0 = <em>(ajouté en { "1.1" })</em> la position que le récepteur a rapportée à cette époque, <c1/> (hauteur ellipsoïdale lorsque la phrase donne la séparation du géoïde, sinon au-dessus du niveau moyen de la mer) ; null lorsque le récepteur n'en a donné aucune, y compris pour les époques d'étalonnage sans point de position

# text
seg-3af4806d7d74 = <em>(ajouté en { "1.2" })</em> ce qu'est et n'est pas ce logiciel : à titre consultatif, non un équipement de navigation homologué, l'opérateur reste responsable

# text
# c1: status
# c2: good
# c3: degraded
# c4: unknown
# c5: reasons
# c6: few-satellites
# c7: high-pdop
# c8: high-hdop
# c9: sky-blocked
# c10: source
# c11: derived
# c12: reported
# c13: none
# c14: n_used
# c15: hdop
# c16: pdop
# c17: vdop
# c18: open_fraction
# c19: max_azimuth_gap_deg
# c20: age_s
# c21: reported_hdop
# c22: reported_derived_mismatch
# c23: note
# c24: in_view
# c25: signal_loss
# c26: environment
# c27: label
# c28: good
# c29: fair
# c30: poor
# c31: unknown
# c32: poor
# c33: RECEIVER-TRUST.md
seg-79adcc5ee873 = <em>(ajouté en { "1.3" })</em> la géométrie des satellites : <c1/> (<c2/>, <c3/>, <c4/> lorsque le flux n'a ni élévations et azimuts GSV ni GSA), <c5/> (<c6/>, <c7/>, <c8/>, <c9/>), <c10/> (<c11/>, <c12/>, <c13/>), <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/> (satellites en vue mais non poursuivis alors que le DOP en vue est bon : la déduction de géométrie est alors <c26/>), <c27/> (<c28/>, <c29/>, <c30/>, <c31/> : toujours rapporté, jamais noté ; le score ne déduit que pour <c32/>) (voir <a1><c33/></a1>)

# text
# c1: cn0-drop
# c2: agc
# c3: jam-ind
# c4: loss-of-lock
# c5: position-jump
# c6: raim
# c7: clock
# c8: solve-failure
# c9: kinematic
# c10: heading-course
# c11: speed-log
# c12: sea-level
# c13: cn0-spread
# c14: cn0-rise
# c15: time-consistency
# c16: osnma
# c17: geometry
# c18: $PKSHT
# c19: position
# c20: advisory
# c21: geometry
# c22: class
seg-fc212411bf3c = Noms de moniteurs (kebab-case ; { "17" }) : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, et à partir de { "1.3" } <c17/>. De nouveaux noms peuvent être ajoutés dans des versions ultérieures ; les consommateurs doivent traiter un nom de moniteur inconnu comme un moniteur. La disposition <c18/> ci-dessous porte une version de format dans son premier champ ; ce schéma JSON est en version { "1.3" } : { "1.1" } a ajouté <c19/>, { "1.2" } <c20/>, { "1.3" } <c21/> à la fin et <c22/> dans chaque déduction, et il ne change qu'en ajoutant des clés à la fin.

# text
seg-0019bf7fbfcd = Entrée d'authentification

# text
# c1: osnma
# c2: MarineObs::sat_auth
# c3: (satellite, status)
# c4: Authenticated
# c5: Failed
# c6: Unavailable
# c7: MarineObs::osnma
# c8: $PKSOS,<A|F|N>[,<sat>:<A|F|N>...]
# c9: $PKSOS,A,E11:A,E19:F
seg-39b3dfbd97cc = Le moniteur <c1/> prend l'état d'authentification par satellite auprès d'une source d'authentification via <c2/> (une liste de <c3/>, état <c4/>, <c5/> ou <c6/>), à côté du <c7/> global. Côté NMEA, la même chose est portée par <c8/>, par exemple <c9/>. Tout échec, global ou sur un satellite, déclenche l'alarme du moniteur et lui coûte toute sa pondération (on lui donne le rapport { "1.5" }) ; un succès n'est pas une preuve. Kshana ne vérifie rien ici : la source qui le fait est responsable de l'état qu'elle rapporte.

# text
# c1: [live] idle_flush_s
# c2: calibration_s
# c3: time-consistency
# c4: calibration_s
seg-8ffc94901796 = Une époque est terminée lorsque la phrase horodatée suivante arrive ; les phrases d'instruments plus lents ou non synchronisés (un gyroscope en retard de quelques dixièmes de seconde sur le récepteur) qui arrivent avant lui lui appartiennent. Si le flux se bloque pendant <c1/> (par défaut { "1.5" } s, réglez-le au-dessus du plus long intervalle entre les phrases horodatées de votre récepteur), l'époque est terminée en l'état. Les <c2/> premières secondes du flux forment la référence de base et ne sont jamais notées, de sorte qu'<b>un flux déjà leurré lors de sa première connexion n'a pas de référence de base saine</b> : démarrez la couche avant la traversée, ou pendant que le point de position est connu pour être bon. La fenêtre d'étalonnage se ferme une seule fois, par arrivée : une époque dont l'heure est antérieure à une heure déjà vue (un retour en arrière, un rejeu du début du flux) n'est jamais de l'étalonnage quoi que dise son heure ; elle est notée avec une déduction <c3/> complète, ce qui est untrusted. Le moteur en direct note chaque époque sur les époques d'étalonnage et sur la dernière minute environ du flux, de sorte que son coût par époque croît avec <c4/> multiplié par la cadence des époques ; gardez la fenêtre courte sur un récepteur rapide. Ses tampons sont bornés (un flot de lignes sans phrase horodatée est terminé toutes les { "5,000" } lignes, l'étalonnage et l'historique sont plafonnés à { "20,000" } époques).

# text
# c1: --replay
# c2: --file
# c3: --follow
# c4: --file ... --follow
seg-2ef5aad7c750 = L'heure du récepteur est aussi comparée à l'horloge monotone de cet ordinateur, ce qui n'a de sens que pour un flux arrivant en temps réel. Un journal stocké injecté à pleine vitesse par stdin, TCP ou UDP déclenche ce contrôle par construction : passez <c1/>. (<c2/> sans <c3/> l'implique déjà.) Un <c4/> est lu comme un rejeu jusqu'à ce qu'il ait été lu jusqu'à sa fin, et l'horloge hôte est engagée à partir de là, de sorte qu'un arriéré ne se lit pas comme un défaut d'horloge ; le contrôle exige alors que la fenêtre d'étalonnage soit encore ouverte (sinon il n'a pas de référence de base et ne s'exécute pas).

# text
# c1: --udp <port>
# c2: --udp <addr>:<port>
seg-a06e58b2cfc8 = Fins de flux et défaillances : stdin et un fichier lu jusqu'à sa fin se terminent normalement (sortie { "0" }). Une connexion TCP fermée par le pair n'est pas une fin normale pour un flux qui devrait continuer : la couche se termine avec un code non nul après avoir noté et écrit tout ce qu'elle avait reçu et ne se reconnecte pas ; exécutez-la donc sous un superviseur qui la redémarre. Les datagrammes UDP qui scindent une phrase sont réunis ; les lecteurs de stdin, d'un fichier et de TCP s'appuient sur une file bornée qui exerce une contre-pression sur l'émetteur (rien n'est perdu), tandis que UDP, qui ne peut pas exercer de contre-pression, abandonne les datagrammes que le moteur ne peut pas prendre et le signale sur stderr. <c1/> se lie à l'adresse de bouclage ; donnez <c2/> pour écouter ailleurs (un avertissement est affiché).

# text
# c1: $PKSHT
seg-0a0ed5e74ea4 = <c1/> : la phrase propriétaire

# text
# c1: --pksht <path|->
seg-71ccf4a80c99 = Chaque époque produit aussi une phrase NMEA { "0183" }, avec une somme de contrôle valide, que <c1/> écrit dans un fichier ou sur la sortie standard et que la barrière insère dans le flux transmis :

# text
# c1: 1
seg-df9382f4b055 = <c1/> : la version du format

# text
# c1: hhmmss.ss
seg-6986879f86fb = heure UTC de l'époque, <c1/> ; vide si le flux n'en a donné aucune

# text
seg-34418696f9d2 = score de confiance de { "0" } à { "100" }, une décimale ; vide pendant l'étalonnage ou lorsqu'aucun n'a pu être produit

# text
# c1: C
# c2: N
# c3: D
# c4: U
seg-0b249ba73868 = bande : <c1/> calibrating, <c2/> nominal, <c3/> degraded, <c4/> untrusted

# text
# c1: -
# c2: P
# c3: W
seg-281aba68405a = barrière : <c1/> off, <c2/> passed, <c3/> withheld (le point de position a été marqué invalide dans le cycle transmis)

# text
# c1: monitor:points
# c2: /
seg-f306c3f54a48 = jusqu'à deux raisons, <c1/> jointes par <c2/> ; vide lorsque rien n'a été déduit

# text
# c1: P
# c2: KSH
# c3: T
# c4: $PKSHT
seg-4bee29dfe578 = L'adresse est <c1/> + le mnémonique du fabricant <c2/> + <c3/>. Un équipement qui ne connaît pas une phrase propriétaire l'ignore. Kshana ignore sa propre <c4/> en entrée.

# text
seg-d75c9da94f37 = Mode barrière

# text
# c1: --gate
seg-30c1f4a5706c = <c1/> place Kshana entre le récepteur et l'équipement qui utilise son point de position (un système de cartographie, un système de contrôle de route). Le flux NMEA entre, ressort sur la sortie standard, et est :

# text
# c1: $PKSHT
seg-aa0692146620 = <b>transmis sans modification</b> tant que l'époque n'est pas untrusted (et pendant l'étalonnage), avec une <c1/> après chaque cycle de phrases ; et

# text
# c1: 0
# c2: V
# c3: N
# c4: V
# c5: N
# c6: V
# c7: N
# c8: N
seg-bbdd68edbb17 = <b>marqué invalide</b> tant qu'elle est untrusted : qualité GGA <c1/> ; état RMC <c2/> (et son indicateur de mode <c3/> et son état de navigation <c4/> lorsqu'ils sont présents) ; mode GNS <c5/> dans chaque position ; état GLL <c6/> et mode <c7/> ; mode VTG <c8/> lorsqu'elle en a un. Les champs de position sont laissés tels quels : l'idée est que l'équipement voit le récepteur lui-même déclarer le point invalide et déclenche sa propre alarme. Chaque phrase réécrite voit sa somme de contrôle recalculée.

# text
# c1: [live] gate_release_s
# c2: --json <path>
seg-23ee46747297 = Une fois retenu, le point de position n'est libéré qu'après que les époques sont restées hors de la bande untrusted pendant <c1/> (par défaut { "30" } s), de sorte qu'un score à la limite de la bande ne peut pas faire clignoter le point. Les lignes JSON ne vont que là où <c2/> le dit (par défaut nulle part, car le flux occupe la sortie standard).

# text
seg-6b7b557a4909 = Pour qu'un traceur de cartes se connecte directement, servez le flux filtré par la barrière sur TCP plutôt que sur la sortie standard :

# text
# c1: --listen tcp:<port>
# c2: tcp:<addr>:<port>
# c3: --listen
# c4: --gate
# c5: --json -
seg-96ff51df9abe = <c1/> écoute sur l'adresse de bouclage ; <c2/> écoute ailleurs (un avertissement est affiché, car quiconque peut atteindre l'adresse peut lire le flux). Un nombre quelconque de clients peuvent se connecter ; chacun reçoit le même flux à partir du moment où il se connecte, et les clients ne font que lire. Chaque client a sa propre file bornée et son propre rédacteur, de sorte que celui qui ne suit pas est abandonné (sa connexion fermée, une ligne sur stderr) et ne retarde jamais les autres ni l'entrée. <c3/> exige <c4/> ; la sortie standard ne porte alors rien du flux, de sorte que <c5/> est libre.

# text
seg-960e0abb0466 = Ce que la barrière ne fait pas, et ce qu'il faut savoir avant de l'utiliser :

# text
# c1: --gate
seg-ee3f18efa84c = Elle est <b>facultative</b>. Rien ne marque un point de position comme invalide à moins que <c1/> ne soit donné.

# text
# c1: idle_flush_s
seg-9cd8243cb437 = Elle <b>ajoute de la latence</b> : un cycle est retenu jusqu'à ce que son époque soit notée, ce qui correspond au temps jusqu'à la phrase horodatée suivante (environ un cycle : une seconde pour un récepteur à { "1" } Hz), ou <c1/> après la dernière lorsque le flux se bloque. Un équipement qui a besoin d'une phrase dans les quelques dizaines de millisecondes suivant la sortie du récepteur ne doit pas se placer derrière elle.

# text
seg-ec63f8f3230b = Elle est <b>un point unique dans la chaîne</b> : si elle s'arrête, le flux s'arrête. Exécutez-la sous supervision, et décidez à l'avance de ce que fait l'équipement en aval sans flux.

# text
# c1: note
seg-536e41a6a5e7 = Elle <b>échoue en mode fermé sur ses propres défaillances</b> : si les moniteurs ne peuvent pas produire de score après l'étalonnage (un capteur de cap déclaré qui n'envoie rien, trop peu d'époques d'étalonnage), l'époque est untrusted, porte une <c1/>, et est retenue ; le maintien avant libération est chronométré sur l'horloge de cet ordinateur, non sur l'heure du récepteur, que contrôle un leurreur (pour un rejeu, il n'y a que l'heure du récepteur).

# text
seg-5dd62cd853c6 = Elle peut <b>retenir un bon point de position</b> (une fausse alarme) aussi bien que laisser passer un point leurré (une détection manquée). Les moniteurs confrontent un point de position à la physique d'un navire et à ses autres capteurs ; une contrefaçon cohérente avec tous ceux-ci n'est pas vue (voir les limites ci-dessous).

# text
# c1: $PKSHT
seg-a284a3ec9dfe = Elle attend un <b>flux texte NMEA { "0183" } pur</b>. Les trames binaires mêlées au flux sont transmises sans modification, mais une <c1/> peut alors tomber entre les octets d'une trame.

# text
seg-0c919698fa92 = Elle n'est <b>pas homologuée</b> et rien en elle n'a été évalué par rapport à IEC { "61108" } ou IEC { "61162" }. L'opérateur reste responsable de la navigation du navire.

# text
seg-9e3ea39c38cf = <s1>Précédent</s1>Confiance dans le récepteur

# text
seg-136da5c10b2d = <s1>Suivant</s1>Flux d'entraînement NMEA

# text
seg-990a49527516 = $PKSHT : la phrase propriétaire
