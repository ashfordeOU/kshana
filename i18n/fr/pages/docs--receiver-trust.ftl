# docs--receiver-trust: translations (fr)

# text
seg-adc34608c46b = Classe

# text
seg-2247a2344710 = Signification

# text
seg-fdbb9db68f1d = aucun

# text
seg-f63dd3d7aad4 = Source

# text
seg-98151954f217 = false

# text
seg-c353e7bec219 = Clé

# text
seg-cc38b40eb7a5 = Moniteur

# text
seg-7670cf4ceda3 = Valeur par défaut

# text
seg-a0cc45088f5f = GSV

# attr:alt
seg-26ab8544afba = Score de confiance sur un passage synthétique, issu d'une exécution réelle du moteur v{ $version } sur examples/maritime-trust (un journal NMEA inventé d'un ferry sur une liaison Tallinn-Helsinki, { "3001" } époques à { "1" } Hz). Trois couloirs partagent un même axe des temps. En haut : la distance entre la position rapportée par le récepteur et la position réelle du navire, qui reste à quelques mètres près jusqu'à environ { "1576" } s, moment où l'entraînement de position scénarisé du journal l'écarte, tandis que le récepteur continue de rapporter un point de position valide. Au milieu : le score de confiance de { "0" } à { "100" }, non calculé pendant les { "300" } premières secondes d'étalonnage, dans la bande nominal (au moins { "90" }) jusqu'à l'entraînement, puis chutant à travers la bande degraded (au moins { "55" }) pour atteindre la bande untrusted. En bas : la bande de chaque époque sous forme de ruban coloré portant son nom. Le score est à titre consultatif. Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) : l'opérateur reste responsable de la navigation du navire. Le journal est inventé pour montrer le format et les moniteurs ; ce n'est pas une mesure et il ne dit rien de la façon dont un récepteur se comporterait.

# attr:alt
seg-7000c522cc93 = L'indicateur de leurrage propre du récepteur mis en regard des alarmes de Kshana, d'après une exécution réelle du moteur v{ $version } sur un journal UBX fictif ({ "200" } époques à { "1" } Hz). Le C/N0 chute de { "20" } dB de { "80" } à { "90" } s et de { "120" } à { "130" } s ; le récepteur signale { "120" } à { "130" } s et { "160" } à { "165" } s. Sur { "140" } époques comparées après calibration, { "11" } avaient les deux en alerte, { "6" } le récepteur seul, { "11" } Kshana seul et { "112" } aucun. Aucun des deux côtés n'est la vérité terrain et l'accord n'est pas une validation. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.

# text
seg-18d7538bc56d = Moniteurs

# text
# c1: monitors_run
# c2: calibration_s
seg-e5c1cb89f0b3 = Chaque moniteur a besoin de ses données ; un moniteur dont les données ne figurent pas dans le journal n'est pas exécuté et n'est pas listé dans <c1/>. Les <c2/> premières secondes (par défaut { "60" }) fixent la référence de base et ne déclenchent jamais d'alarme.

# text
seg-3be9ee05f087 = Alarme quand

# text
seg-98ead58c671d = Nécessite

# text
# c1: cn0_drop_db
seg-f6e6df453260 = le C/N0 moyen sur les satellites communs avec la référence de base baisse de <c1/> ou plus (par défaut { "6" } dB)

# text
# c1: sats_lost
seg-d9bf6efc6835 = les satellites suivis tombent de <c1/> ou plus sous la médiane de la référence de base (par défaut { "4" })

# text
# c1: agc_k_sigma
seg-60c7a99f9819 = la valeur de l'AGC s'écarte de sa référence de base de plus de <c1/> écarts types (par défaut { "5" })

# text
# c1: AgcDb
seg-7c1c65e64418 = UBX MON-RF ou Android <c1/>

# text
# c1: jamInd
# c2: jam_ind_threshold
seg-a5a5252417cb = <c1/> du u-blox dépasse <c2/> (par défaut { "80" } sur { "255" })

# text
seg-8bca191bf4c4 = UBX MON-RF

# text
# c1: position_jump_m
seg-0ac4898d81cf = la position propre du récepteur est à plus de <c1/> de sa moyenne de calibration (par défaut { "50" } m)

# text
seg-6a3fec1214b9 = une position rapportée

# text
seg-4c05faf783eb = la surveillance autonome de l'intégrité par le récepteur (RAIM) de parité, appliquée à la position à point unique propre au moteur, rejette l'ensemble de mesures

# text
# c1: nav
seg-037ab193613c = journal RINEX avec <c1/>

# text
seg-8890a4ebf231 = la position à point unique du moteur échoue avec cinq satellites ou plus

# text
seg-0a5a708ac75b = l'horloge du récepteur s'écarte de sa droite prédite de plus du décalage minimal détectable de son bruit de calibration

# text
seg-31b64b635261 = Profil calibré (sur option).

# text
# c1: [monitors] profile = "jammertest-2024-calibrated"
# c2: cn0_drop_db = 1.5
# c3: agc_k_sigma = 3.5
# c4: jam_ind_threshold = 29
# c5: xval/jammertest-trust/PREREGISTRATION.md
# c6: cn0_drop_db
# c7: xval/jammertest-trust/RESULTS.md
# c8: profile_note
seg-a73f2c2dfc9a = <c1/> remplace les trois seuils d'interférence par des valeurs calibrées sur le jeu de données public JammerTest { "2024" } (un u-blox ZED-F9P par scénario ; Zenodo { "15911589" }) : <c2/>, <c3/>, <c4/>. La calibration a été préenregistrée (<c5/>) et le profil est MODELLED, ajusté sur une seule campagne publique : son seuil <c6/> a <b>manqué</b> le seuil de fausses alarmes préenregistré sur le jeu réservé ({ "0.0231" } contre { "0.02" }) ; les seuils de l'AGC et de l'indicateur de brouillage ainsi que le seuil de l'union (fausses alarmes { "0.033" }, détection { "0.81" }) ont été atteints (<c7/>). Il vaut pour ce type de récepteur lors de cet événement, face à des créneaux d'attaque planifiés, et a été calibré sur les journaux CSV du jeu de données (ses journaux UBX donnent plus de fausses alarmes dans deux dossiers). Un résultat produit avec ce profil rappelle les seuils appliqués et porte une <c8/> qui dit tout cela. Sans le profil, les valeurs par défaut ci-dessus s'appliquent et toutes les sorties sont inchangées.

# text
# c1: vessel
# c2: [maritime]
# c3: src/receiver_trust/maritime.rs
# c4: monitors_run
seg-1fa8c4bd1a18 = Pour une plateforme <c1/>, les moniteurs de plateforme mobile s'exécutent aussi (seuils dans une table <c2/> de premier niveau, chaque valeur par défaut documentée dans <c3/>) ; chacun a besoin de ses données et n'est listé dans <c4/> que lorsqu'il a décidé :

# text
seg-4b2840d9d0af = le changement de position ne concorde pas avec la vitesse et la route rapportées, ou implique une vitesse, une accélération ou une vitesse de giration supérieure aux limites du navire

# text
seg-656c19cb5b52 = positions ; vitesse et route (RMC ou VTG) pour la partie à l'estime

# text
# c1: hdg_cog_tol_deg
# c2: min_speed_kn
seg-cedefd52998d = le cap gyroscopique et la route fond diffèrent de plus de <c1/> (vitesse supérieure à <c2/>)

# text
# c1: heading_sensor = true
seg-c66704cbdd02 = cap HDT, THS ou VHW, <c1/>

# text
# c1: stw_sog_tol_kn
seg-1bbbf0033234 = la vitesse surface et la vitesse fond diffèrent de plus de <c1/>

# text
seg-c9101740b235 = VHW ou VBW, et vitesse fond

# text
# c1: antenna_height_m
# c2: sea_level_tol_m
seg-42ac59072099 = l'altitude GGA diffère de <c1/> de plus de <c2/>

# text
# c1: antenna_height_m
seg-811ec460249c = altitude GGA, <c1/>

# text
# c1: cn0_spread_frac
seg-854ea9c26df4 = la dispersion du C/N0 entre satellites tombe à <c1/> de sa médiane de calibration

# text
# c1: cn0_rise_db
# c2: cn0_rise_frac
seg-837fc4cb832c = le C/N0 des satellites communs a augmenté de <c1/> en moyenne et <c2/> d'entre eux ont augmenté

# text
seg-faae07674361 = les instants d'époques consécutives avancent de façon irrégulière, reculent ou s'écartent de l'horloge de l'hôte

# text
seg-f799a53897ed = heure NMEA ; horloge de l'hôte pour la dernière partie

# text
seg-ee4913c9f2ed = le récepteur signale un échec d'authentification OSNMA (un état rapporté est lu ; rien n'est vérifié ; pour vérifier OSNMA à partir des pages I/NAV elles-mêmes, voir <a1>docs/OSNMA.md</a1>)

# text
# c1: $PKSOS
seg-3fad5fcde4dc = phrase d'état <c1/>

# text
seg-ce072f2ebb6c = Une époque est <b>non fiable</b> lorsque RAIM, le moniteur d'horloge, un échec de résolution ou un saut de position déclenche une alarme, ou lorsque la baisse de C/N0 atteint le double de son seuil ; <b>dégradée</b> pour toute autre alarme ; et <b>nominale</b> dans le cas contraire.

# text
# c1: raim
# c2: solve-failure
# c3: clock
# c4: tests/jammertest_spoof_oracle_support
# c5: tests/receiver_trust_jammertest.rs
seg-4124ff6013a0 = Le chemin du moteur (<c1/>, <c2/>, <c3/>) est le même calcul que la référence indépendante de leurrage JammerTest { "2024" } dans <c4/> : <c5/> vérifie que, sur les huit débuts publiés, la première alarme tombe sur la même époque et est de même nature.

# text
seg-83be3c22a577 = Score de confiance (plateforme navire)

# text
# c1: statistic / threshold
seg-812991f245cd = Pour un navire, chaque époque après la calibration reçoit aussi un score de { "0" } à { "100" } et les raisons pour lesquelles il n'est pas de { "100" }. L'application est déterministe et fixée avant qu'aucun journal ne soit noté : pas d'apprentissage, rien d'ajusté sur des événements. Chaque moniteur ramène ses éléments de preuve à un rapport <c1/> (une alarme à { "1" } ou plus) ; un rapport coûte au score

# text
# c1: onset_ratio
# c2: full_ratio
# c3: evidence_hold_s
seg-ada5a0a52315 = de sorte qu'un moniteur ne coûte rien tant qu'il est sous <c1/> de son seuil (par défaut { "0.5" }), la moitié de son poids à son seuil, et la totalité à <c2/> fois le seuil (par défaut { "1.5" }) ; le score est non croissant en chaque statistique. Une source qui ne rapporte rien à une époque conserve sa dernière statistique pendant <c3/> (par défaut { "10" } s : deux cycles d'une phrase C/N0 envoyée toutes les { "5" } s), tant comme alarme que comme déduction.

# text
# c1: floor(x * 10 + 0.5) / 10
# c2: cn0-drop
# c3: agc
# c4: jam-ind
# c5: loss-of-lock
# c6: position-jump
# c7: raim
# c8: clock
# c9: solve-failure
# c10: kinematic
# c11: heading-course
# c12: speed-log
# c13: sea-level
# c14: cn0-spread
# c15: cn0-rise
# c16: time-consistency
# c17: osnma
# c18: geometry
seg-6c06de24ebfe = L'arrondi se fait à la valeur supérieure en cas d'égalité (<c1/>), la bande est celle du score arrondi, et le plafonnement précède l'arrondi. Seuls les moniteurs dont les points sont supérieurs à zéro figurent dans les déductions, avec leur rapport et leurs points non arrondis, les plus gros points d'abord ; les déductions de points égaux sont listées dans l'ordre des noms de moniteurs <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>. Un moniteur dont le test est réussi ou échoué (une résolution échouée, une authentification échouée) reçoit le rapport { "1.5" }, le poids plein. Les points listés sont ceux d'avant le plafonnement à { "0" }.

# text
seg-e36961d46c41 = Poids (points)

# text
seg-673f6adcd681 = Pourquoi

# text
seg-399be3301faf = un échec d'authentification est un constat, non une statistique

# text
seg-69cfc61477d6 = une fausse position doit contredire la physique ou les propres contrôles du récepteur, et le temps ne peut pas remonter ; une violation à pleine force ({ "1.5" } fois son seuil : { "60" } points, score { "40" }) est non fiable, et à son seuil ({ "30" } points, score { "70" }) dégradée

# text
seg-7fa1e6e67411 = un seul capteur indépendant en désaccord donne un état dégradé ; deux à pleine force donnent un état non fiable

# text
seg-4c4825d2957a = l'environnement du signal, ou un contrôle peu informatif

# text
seg-b5a364a03714 = l'environnement est hostile ; cela seul ne montre pas que la position est fausse

# text
# c1: [geometry]
seg-4e3749965405 = jusqu'à { "15" }, <c1/>

# text
# c1: cap_points
seg-1e595dbcf96f = pas un poids sur cette rampe : rien à moins que le ciel ne soit pauvre, puis jusqu'à <c1/> ({ "15" }) ; la géométrie seule atteint l'état dégradé, jamais non fiable, et ne déclenche aucune alarme (voir « Géométrie » ci-dessous)

# text
# c1: score_model
# c2: score.deductions
seg-9902ca062070 = Les bornes des bandes découlent des poids : le moniteur le plus léger qui déclenche une alarme coûte { "12.5" } points à son seuil, de sorte que toute alarme fait quitter la bande nominale ; aucun moniteur seul sous { "60" } points ne peut atteindre seul la bande non fiable (plusieurs ensemble le peuvent). Le résultat consigne le modèle de score (<c1/>) et chaque époque porte <c2/> : quels moniteurs ont déduit, leurs rapports et leurs points. Pour un navire, l'état de l'époque est la bande de son score.

# text
seg-6f620668ee85 = Géométrie : dégradation naturelle distincte d'une incohérence de type attaque

# text
# c1: docs/design/2026-10-12-geometry-and-skyline-design.md
# c2: geometry
# c3: environment
# c4: inconsistency
seg-93257d87e0d4 = Un récepteur à côté d'une grue de quai, dans une écluse ou sous une coque haute perd des satellites et sa position se dégrade pour une raison qui n'est pas une attaque. À partir de { "0.36" }, selon la note de conception de la géométrie (<c1/>, section { "4" }), chaque époque porte sa <b>géométrie satellitaire</b>, le score d'un navire a un <b>moniteur de géométrie</b>, et chaque déduction porte une <b>classe</b> : <c2/> (le ciel), <c3/> (l'environnement du signal) ou <c4/> (éléments de type attaque).

# text
# c1: orbit::dop
# c2: source = derived
# c3: source = reported
# c4: evidence_hold_s
# c5: unknown
seg-17d13c39b5aa = <b>D'où vient la géométrie.</b> L'élévation et l'azimut de chaque satellite suivi (NMEA GSV, UBX NAV-SAT), dont est dérivée la dilution de précision (DOP) avec l'unique noyau DOP du moteur (<c1/>, VALIDATED par rapport à gnss_lib_py) : <c2/>. À défaut, le DOP et les satellites utilisés que le récepteur indique (NMEA GSA) : <c3/>. Les positions dans le ciel et GSA comptent pour le <c4/> du score (par défaut { "10" } s), car de nombreux bus envoient GSV toutes les quelques secondes ; un ensemble GSV incomplet à une époque (la fin d'un extrait, une phrase perdue) n'est pas utilisé. Un journal sans l'un ni l'autre, comme un NMEA avec seulement GGA et RMC, ou les journaux Android et RINEX aujourd'hui, reçoit l'état <b><c5/></b> avec la note « geometry unknown » : le moteur ne devine pas une géométrie qu'on ne lui a pas donnée, et le moniteur de géométrie ne s'exécute pas.

# text
seg-a267da42ac3d = assez de satellites et DOP dans les seuils

# text
# c1: few-satellites
# c2: high-pdop
# c3: high-hdop
# c4: sky-blocked
seg-dabcd392914a = une ou plusieurs raisons : <c1/>, <c2/>, <c3/>, et (à titre informatif, hors du score) <c4/> lorsque tous les satellites suivis se trouvent dans une moitié de l'horizon

# text
seg-c255a66d3813 = le journal ne donne aucune géométrie satellitaire pour cette époque

# text
# c1: degraded
# c2: sky-blocked
# c3: poor
seg-0a50145c2bfa = L'état est descriptif et c'est l'étiquette (ci-dessous) qui compte pour le score : <c1/> inclut le cas informatif <c2/>, qui peut s'accompagner d'un DOP bon ou moyen, et seule une étiquette <c3/> est notée.

# text
# c1: geometry.label
# c2: good
# c3: hdop_good
# c4: pdop_good
# c5: used_good
# c6: poor
# c7: hdop_max
# c8: pdop_max
# c9: min_used
# c10: fair
# c11: unknown
seg-93e49a562493 = <b>L'étiquette</b> (toujours rapportée, jamais notée). Le <c1/> de chaque époque vaut <c2/> (HDOP d'au plus <c3/> { "2" }, PDOP d'au plus <c4/> { "3" } et au moins <c5/> { "6" } satellites), <c6/> (HDOP supérieur à <c7/> { "4" }, PDOP supérieur à <c8/> { "6" } ou moins de <c9/> { "5" } satellites), <c10/> entre les deux, ou <c11/>. La note de l'époque s'ouvre toujours par l'étiquette et les chiffres, par exemple « geometry fair: HDOP { "1.105" }, PDOP { "1.831" }, VDOP { "1.410" }, { "8" } satellites; not scored (the score deducts only above HDOP { "4" }, PDOP { "6" } or below { "5" } satellites) », et ajoute « , signal loss » lorsque c'est le cas.

# text
# c1: max(hdop / hdop_max, pdop / pdop_max, min_used / n_used)
# c2: cap_points
# c3: full_ratio
# c4: floor
# c5: degraded_min
# c6: min(cap_points, 100 - floor)
# c7: [score]
# c8: degraded_min
# c9: degraded_min
# c10: 100 - degraded_min
# c11: floor
# c12: degraded_min
# c13: monitors_run
# c14: [score.weights]
# c15: geometry_model.cap_in_force
# c16: geometry_model.floor_in_force
seg-13838e036fae = <b>Le moniteur de géométrie</b> (score du navire). Il ne déduit <b>rien tant que la géométrie n'est pas mauvaise</b> : son rapport est <c1/>, et tant qu'il vaut au plus { "1" } (géométrie bonne ou moyenne, y compris un ciel dégagé GPS seul de { "8" } satellites) il ne coûte rien, de sorte qu'un tel journal obtient exactement le même score qu'en { "0.35" }. Au-dessus de { "1" }, la déduction monte linéairement jusqu'à <c2/> ({ "15" }) à <c3/> ({ "1.5" } fois les seuils : HDOP { "6" }, PDOP { "9" }, { "3" } satellites) : { "7.5" } points au rapport { "1.25" } (HDOP { "5" }, ou { "4" } satellites), { "15" } à partir de { "1.5" } (score { "85" }, dégradé). À lui seul, il ne peut jamais faire passer le score sous <c4/> (par défaut : le <c5/> du score, { "55" }), de sorte que la géométrie seule atteint au plus la bande dégradée et jamais la bande non fiable : le plafond en vigueur est <c6/>, si bien qu'une table <c7/> qui relève <c8/> (une table { "0.35" } avec <c9/> { "90" }, par exemple) abaisse le plafond à <c10/> au lieu d'être refusée, et un <c11/> fixé sous <c12/> est refusé. Le moniteur ne déclenche aucune alarme ; il est listé en dernier dans <c13/> lorsqu'il a décidé à une époque quelconque (un navire dont le journal donne la géométrie), et n'est pas compté dans l'identité avec { "0.35" } ; ce n'est pas une entrée de <c14/> (en définir une est refusé), et le plafond et le plancher en vigueur sont consignés dans <c15/> et <c16/>. La note d'une époque mauvaise dit pourquoi, par exemple « geometry poor: HDOP { "5.200" }, PDOP { "7.900" }, VDOP { "4.100" }, { "7" } satellites; degraded by geometry: HDOP { "5.200" } above { "4" } (derived from { "7" } logged satellites); not an inconsistency ».

# text
# c1: score.deductions[].class
seg-2082f4ccb250 = <b>Classes.</b> Chaque déduction (<c1/>) :

# text
# c1: geometry
# c2: loss-of-lock
# c3: low_elev_deg
seg-4197bc517f73 = <c1/> (mauvaise géométrie) ; <c2/> lorsque chaque satellite perdu par rapport à la référence de base de calibration était sous <c3/> à son dernier rapport

# text
# c1: cn0-drop
# c2: cn0-spread
# c3: cn0-rise
# c4: agc
# c5: jam-ind
# c6: loss-of-lock
# c7: geometry
seg-e06597696553 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> dans les autres cas ; <c7/> pendant une perte de signal (ci-dessous)

# text
# c1: kinematic
# c2: heading-course
# c3: speed-log
# c4: sea-level
# c5: time-consistency
# c6: clock
# c7: raim
# c8: position-jump
# c9: osnma
# c10: solve-failure
# c11: geometry
seg-5fc0eb79c51b = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/> ; et <c11/> lorsque la géométrie est mauvaise et que le HDOP indiqué est en désaccord avec le ciel indiqué (ci-dessous)

# text
# c1: max(reported_vs_derived_tol, reported_vs_derived_rel × derived HDOP)
# c2: reported_derived_mismatch: true
# c3: inconsistency
# c4: reported_derived_mismatch
# c5: geometry_summary.hdop_mismatch
# c6: geometry
seg-1b5e88a4aae4 = <b>La protection contre un faux ciel pauvre.</b> Un leurreur pourrait envoyer un GSV maigre, ou rapporter un HDOP élevé, pour acheter de la tolérance. Le moteur étiquette et ne pardonne pas : aucun autre contrôle n'est élargi par une mauvaise géométrie, et le HDOP indiqué par le récepteur (GSA dans la durée de maintien, sinon GGA) est comparé au HDOP dérivé du ciel qu'il indique. Lorsqu'ils diffèrent de plus de <c1/> ({ "1.0" }, ou { "25" } % du HDOP dérivé, la plus grande des deux valeurs), l'époque porte <c2/> et, lorsque la géométrie est mauvaise, sa déduction est classée <c3/>. Avec une géométrie bonne ou moyenne, le désaccord est rapporté et non noté : rien n'est déduit tant que la géométrie n'est pas mauvaise. C'est un choix délibéré ({ "0.36" }) : « zéro sauf si mauvaise » vaut pour chaque époque, de sorte qu'une géométrie bonne ou moyenne obtient exactement le même score qu'en { "0.35" }, et qu'un HDOP falsifié n'est jamais passé sous silence. Le drapeau (<c4/>) figure sur chaque époque du résultat et chaque ligne en direct, la note dit « …beyond the tolerance: reported, not scored (the geometry is not poor) » ou « …: the geometry deduction is classed an inconsistency », <c5/> compte les époques, et la page de synthèse des preuves affiche le décompte, zéro compris. Les { "25" } % sont un choix d'ingénierie <b>REPRESENTATIVE</b>, non un chiffre mesuré ou normalisé : un récepteur qui résout une horloge par constellation, ou avec un sous-ensemble des satellites qu'il suit (masque d'élévation, seuil de C/N0, exclusion RAIM), indique un HDOP qui diffère du HDOP à horloge unique de tous les satellites suivis d'un écart qui croît avec le HDOP, de sorte qu'une tolérance fixe seule lirait une mauvaise géométrie naturelle comme une incohérence. Un écart plus grand se lit toujours comme tel. Une déduction classée <c6/> est un constat sur le ciel, non la conclusion qu'aucune attaque n'a eu lieu.

# text
# c1: low_elev_deg
# c2: signal_loss: true
# c3: environment
seg-0e729ad96db9 = <b>Une perte de signal n'est pas le ciel.</b> Lorsque des satellites que le récepteur liste en vue (au-dessus de <c1/>) ne sont pas suivis, le moteur dérive aussi le DOP de tous les satellites en vue. Si ce DOP en vue est dans les seuils et que soit rien n'est suivi, soit les satellites non suivis sont répartis autour de l'horizon (non confinés à une moitié), le ciel était là et le signal non : l'époque porte <c2/>, la note « satellites in view but not tracked: signal environment, not geometry », et la déduction de géométrie est classée <c3/>. Des satellites non suivis confinés à une moitié de l'horizon se lisent toujours comme un ciel bloqué (un mur, une falaise, un quai). Une obstruction des deux côtés (un canyon ou un fjord étroit) se lit comme une perte de signal tant qu'aucun profil d'horizon n'est configuré. Les valeurs sentinelles d'absence de position du récepteur ne sont pas un DOP : un HDOP ou PDOP indiqué de { "99" } ou plus, une qualité GGA de { "0" } et un mode GSA de { "1" } ne donnent aucun DOP indiqué.

# text
# c1: [geometry]
seg-0f218d21843b = clé <c1/>

# text
# c1: sigma_uere_m
# c2: kin_pos_tol_m
seg-e5ec84abd61b = choisi (note de conception { "4.2" }) : à <c1/> { "1.5" } m, un HDOP de { "4" } correspond à un 2drms de { "12" } m, le <c2/> du contrôle cinématique. IEC 61108-1 est couramment citée comme énonçant ses exigences de précision pour HDOP ≤ { "4" } (ou PDOP ≤ { "6" }) : rappelé d'après la littérature secondaire sur les récepteurs GNSS, sans source secondaire précise consultée et sans que la norme ait été lue ; à vérifier par rapport au texte de la norme

# text
# c1: scenarios/polar-arctic-leo-coverage.toml
# c2: tests/constellation_availability_published_spec_oracle.rs
seg-d99dc0fd090a = le seuil de disponibilité du PDOP de <c1/> ; GPS SPS Performance Standard, 5e éd. ({ "2020" }), PDOP ≤ { "6" }, tel que cité dans <c2/> ; à vérifier par rapport au texte de la norme

# text
seg-2fffa47378ec = un de plus que ce qu'exige une position, de sorte qu'une seule perte ne met pas fin à la position ; le minimum avec une mesure redondante pour RAIM

# text
# c1: hdop_max
seg-7dc0baed2bc4 = une entrée indiquée pour le lien 2drms de <c1/> ; indiquez la valeur propre au récepteur

# text
seg-7b5778d93d40 = { "1.0" } HDOP

# text
seg-093cff5d1150 = choisi (note de conception { "4.2" }) : la partie absolue de la tolérance ; un désaccord au-delà de la tolérance n'est pas de la géométrie

# text
seg-be5c3aefd942 = choix d'ingénierie REPRESENTATIVE : la partie relative, pour les récepteurs à horloges par constellation ou à solutions sur sous-ensemble

# text
seg-e71c6876114b = note de conception { "4.3" } : les satellites perdus sous ce seuil sont perdus pour le ciel ; un profil d'horizon (élément { "1" } de { "0.36" }) l'étendra

# text
seg-bebe291ca1c0 = géométrique, à titre informatif : tous les satellites dans une moitié de l'horizon

# text
seg-06519582227b = note de conception { "4.2" } : la géométrie seule fait passer le score de nominal à dégradé et jamais à non fiable ; déduit seulement lorsque la géométrie est mauvaise (décision du fondateur B1, { "0.36" })

# text
# c1: full_ratio
# c2: cap_points
seg-be21b5a31382 = le <c1/> propre au score : la rampe atteint <c2/> à { "1.5" } fois les seuils de mauvaise géométrie

# text
# c1: degraded_min
seg-e922a5342a3c = le <c1/> du score ({ "55" })

# text
# c1: min(cap_points, 100 - floor)
# c2: degraded_min
seg-09fe8c435ece = la géométrie seule n'atteint jamais la bande non fiable ; le plafond en vigueur est <c1/> ; un plancher sous <c2/> est refusé

# text
# c1: hdop_max
seg-a07e6ce67371 = REPRESENTATIVE, pour l'étiquette seulement : la moitié de <c1/> (le rapport de début du score { "0.35" })

# text
# c1: pdop_max
seg-06db7e7af59c = REPRESENTATIVE, pour l'étiquette seulement : la moitié de <c1/>

# text
# c1: min_used
seg-7e7f17d36ea4 = REPRESENTATIVE, pour l'étiquette seulement : un de plus que <c1/>, de sorte qu'une seule perte laisse encore une mesure redondante

# text
# c1: epochs[].geometry
# c2: status
# c3: reasons
# c4: source
# c5: n_used
# c6: hdop
# c7: pdop
# c8: vdop
# c9: open_fraction
# c10: max_azimuth_gap_deg
# c11: age_s
# c12: reported_hdop
# c13: reported_derived_mismatch
# c14: note
# c15: in_view
# c16: low_elev_deg
# c17: signal_loss
# c18: label
# c19: class
# c20: geometry_model
# c21: geometry_summary
# c22: score_model.weights
# c23: docs/revisions/STUDIO15-portable-math-rebaseline.md
# c24: tests/geometry_trust_no_change.rs
# c25: $PKSHT
# c26: tests/geometry_corpus_identity.rs
# c27: $PKSHT
# c28: inconsistency
# c29: tests/geometry_trust.rs
# c30: environment
# c31: geometry
# c32: inconsistency
seg-ef7a4c24e870 = <b>Ce qui a changé dans les sorties, et ce qui n'a pas changé.</b> Aucun score ne change tant que la géométrie n'est pas mauvaise ; l'étiquette est toujours rapportée. Clés ajoutées : <c1/> (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/> arrondi à { "0.001" }, <c9/> (null tant qu'aucun profil d'horizon n'est configuré), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/> (satellites listés au-dessus de <c16/>), <c17/>, <c18/>), <c19/> sur chaque déduction, et à la fin <c20/> (seuils, durée de maintien, plafond et plancher en vigueur, provenance, règles de classe) et <c21/> (époques par état, par étiquette et par classe de déduction, et époques avec un écart de HDOP indiqué) ; <c22/> est comme en { "0.35" }. Deux tests rattachent cela, à l'octet près, à la référence de base « { "0.36" } portable » une fois ces clés retirées (les empreintes { "0.35.0" }, rebasées lorsque le moteur est passé aux mathématiques portables et conservées dans les tests comme trace de ce que { "0.35.0" } a publié : <c23/>). <c24/> couvre chaque sortie des deux sessions d'exemple (JSON de résultat, CSV, SVG, verdict, lignes en direct rejouées, <c25/>, Prometheus, CEF, LEEF). <c26/> couvre le résultat par lot, la synthèse, les lignes en direct et <c27/> de chaque corpus NMEA de navire versionné (la démonstration et les jeux de référence maritimes, chacun aussi en ciel dégagé GPS seul avec { "8" } satellites, et les scénarios de formation d'équipage générés à partir de leurs graines) ; dans les deux scénarios de formation dont le brouillage rend la géométrie mauvaise, chaque époque qui n'est pas mauvaise est identique et chaque époque mauvaise diffère par la seule déduction de géométrie. Un journal dont la géométrie est mauvaise perd jusqu'à { "15" } points qu'il ne perdait pas en { "0.35" } ; c'est le changement voulu. Sur la démonstration, l'entraînement progressif se lit <c28/> ; <c29/> modifie le journal pour masquer le ciel ouest (moyen : étiqueté, non noté), pour le masquer ainsi que deux satellites à l'est (mauvais : déductions de géométrie, perte d'accrochage <c30/> parce que des satellites hauts ont aussi disparu), pour ne perdre que des satellites sous { "15" }° (perte d'accrochage <c31/>), et pour indiquer un HDOP que le ciel n'explique pas (la déduction de mauvaise géométrie devient <c32/>). Les seuils sont MODELLED : choisis, non ajustés sur un journal quelconque ; rien ici n'affirme à quelle fréquence la dégradation naturelle et les attaques sont distinguées sur des données réelles.

# text
seg-8ddaf82ba00b = Énoncer les événements et les prédictions

# text
# c1: detected
# c2: late
# c3: missed
# c4: not-evaluable
# c5: agree
# c6: disagree
# c7: no-prediction
# c8: not-evaluable
seg-c52c285aa308 = Pour chaque événement, le résultat donne les fausses alarmes entre la calibration et le début, la première alarme et ses moniteurs, la latence, l'issue (<c1/>, <c2/>, <c3/> ou <c4/>), et la baisse médiane observée de C/N0 par rapport à la prédiction (<c5/>, <c6/>, <c7/> ou <c8/>). Le désaccord est rapporté, jamais effacé par réglage : les tolérances sont dans le scénario, et le scénario est dans l'empreinte du résultat.

# text
seg-3715df3fd8f7 = Ce que cela n'affirme pas

# text
# c1: VERIFICATION-MATRIX.md
seg-21a4b903e179 = Les moniteurs de confiance sont MODELLED : leurs seuils sont des entrées, et leur performance de détection sur de véritables interférences est ce que mesure la notation des événements, non quelque chose qu'affirme ce type de scénario. Sur les sessions de leurrage JammerTest { "2024" }, les moniteurs du chemin du moteur détectent certains débuts en { "10" } s et sont en retard sur d'autres ; voir la ligne « Clock-aided χ², RAIM, AGC, SQM fused per-epoch security FoM » dans <a1><c1/></a1> pour les chiffres. Une prédiction qui concorde avec un journal est un point de donnée, non une validation.

# text
seg-0c413c1a491c = <s1>Précédent</s1>Table de correspondance de résilience

# text
seg-63fc2b340fd1 = <s1>Suivant</s1>Confiance maritime
