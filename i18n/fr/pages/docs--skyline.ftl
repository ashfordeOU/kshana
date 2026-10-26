# docs--skyline: translations (fr)

# text
seg-f917e7fcac09 = Ce que c'est

# text
seg-6c6e7248496f = Géométrie du ciel

# text
seg-379f49bff6fb = Python

# text
seg-2bd2101ce454 = Surface

# text
seg-ad856ad710eb = État

# text
seg-cbf0f9bcd2d8 = Référence indépendante

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-c14b8fe46517 = Masque de ligne d'horizon dépendant de l'azimut : ensemble visible, azimut et élévation, et DOP sous le masque

# text
seg-bbb1828b3db1 = Réductions de canyon urbain, de secteur et de relief en table

# text
seg-2c53381d48ae = Ellipse d'erreur horizontale et cofacteur par système à partir de la covariance de géométrie

# text
seg-de6c33774c9c = CLI

# text
seg-d1e9715513b4 = Exemple

# text
seg-587beeccaa11 = Préréglage

# text
seg-98f4f946a7ac = WASM

# text
seg-b03d56f501c3 = Type

# text
seg-4dbf41c0ec3b = Fonction

# text
seg-2b0d77219437 = Préréglages

# text
seg-7338b6210228 = Ligne

# text
seg-6317db731879 = Description

# text
# c1: docs/SKYLINE.md
seg-be2f66de7d07 = Source : <c1/>

# text
seg-3cb660ef6b03 = Masques d'horizon et géométrie du ciel

# text
# c1: mask_deg
# c2: docs/design/2026-10-12-geometry-and-skyline-design.md
seg-724f72bdfa36 = Jusqu'à la { "0.36" }, chaque test de visibilité terrestre du moteur reposait sur un seul seuil d'élévation, <c1/> : un satellite comptait dès qu'il était à ce nombre ou au-dessus, quelle que soit sa direction. Une rue, un quai, un fjord ou une grue bloque une partie du ciel et laisse le reste dégagé. Une <b>ligne d'horizon</b> (skyline) est une coupure d'élévation qui dépend de l'azimut ; les <b>fonctions de géométrie du ciel</b> transforment un site, un instant, des constellations et une ligne d'horizon en ensemble visible, dilution de précision (DOP), covariance géométrique, ellipse d'erreur horizontale, nuage Monte Carlo et diagramme du ciel (skyplot). La conception est décrite dans <c2/> (points { "1" } et { "2" }).

# text
seg-4c1bc0b37f54 = Preuves : la décision de visibilité masquée (angles de visée géodésiques, masque tabulé, ensemble visible et son DOP) est <b>VALIDATED</b> par rapport à Orekit { "12.2" } et à gnss_lib_py { "1.0.4" } dans une comparaison préenregistrée, de même que l'ellipse d'erreur et le cofacteur par système (numpy, préenregistré) ; les réductions de canyon, de secteur et de relief, les préréglages et le reste des fonctions de géométrie du ciel sont <b>MODELLED</b> (<a1>Preuves</a1>). Une ligne d'horizon retire les satellites en ligne de visée directe, et rien de plus. Les préréglages sont des géométries REPRESENTATIVE, et non des relevés.

# text
seg-6fa3291b70e3 = La ligne d'horizon

# text
# c1: [0, 90)
seg-08585dd55bb5 = Une ligne d'horizon est le maximum point par point de quatre descriptions. L'azimut est exprimé en degrés dans le sens horaire à partir du nord vrai, dans le repère local est-nord-haut du site ; les élévations sont dans <c1/>.

# text
seg-9d0e2b0a469f = TOML

# text
seg-3dbc7ff9f5ab = Table

# text
# c1: [0, 360)
seg-a67486e7d10e = Élévations interpolées linéairement en azimut, avec bouclage à { "360" }°. Azimuts strictement croissants dans <c1/> ; { "3600" } lignes au plus.

# text
seg-bc12ba94381f = Canyon urbain

# text
seg-23066e2eb509 = Deux murs rectilignes parallèles (ci-dessous).

# attr:aria-label, text
seg-821762272e2f = Secteurs

# text
# c1: az_from
# c2: az_to
seg-7387a718a7c3 = Intervalles à bords francs, dans le sens horaire de <c1/> (inclus) à <c2/> (exclu), qui peuvent passer par le nord ; { "360" } au plus.

# text
seg-2768e3772b56 = Relief

# text
# c1: atan((height_m − d²/(2 R_eff)) / d)
# c2: R_eff = 4/3 × 6371 km
# c3: height_m
seg-5a5c08a77b86 = Points ramenés à une table : élévation <c1/>, avec la chute due à la courbure pour <c2/> (une constante choisie et déclarée). <c3/> est mesuré au-dessus de l'antenne.

# text
# c1: preset = "<name>"
# c2: table
# c3: sectors
# c4: terrain
seg-fb86c0db0c90 = <c1/> part d'une géométrie nommée ; les champs du canyon remplacent alors, champ par champ, le canyon du préréglage, et <c2/>, <c3/> et <c4/> s'y ajoutent.

# text
# c1: mask_deg
# c2: az
# c3: max(mask_deg, skyline(az))
# c4: >=
# c5: mask_deg
seg-0d76504a1d74 = Le <c1/> du récepteur garde son sens : c'est une ligne d'horizon plate. La coupure effective à l'azimut <c2/> est <c3/>, et un satellite est visible lorsque son élévation est <b>égale ou supérieure</b> à celle-ci : le même <c4/> que celui qu'utilisait toujours le masque plat. Un satellite au-dessus de <c5/> mais sous la ligne d'horizon est <b>masqué par la ligne d'horizon</b>.

# text
seg-f7fd13e569e3 = Le canyon urbain

# text
# c1: s
# c2: w
# c3: a
# c4: az
# c5: θ = az − s
# c6: d(az) = (w/2) / |sin θ|
# c7: h
seg-290f563c1ff7 = Une rue court selon l'azimut <c1/>, large de <c2/> mètres entre les murs, l'antenne se trouvant à <c3/> mètres de hauteur sur l'axe central. Selon l'azimut <c4/>, avec <c5/>, le rayon atteint un mur après <c6/> ; un mur de hauteur <c7/> coupe donc à

# text
# c1: length_m = L
# c2: d(az) · |cos θ| > L/2
# c3: antenna_m
# c4: width_m
seg-8662708f4f32 = La bande dégagée s'étend le long de la rue. Avec <c1/> (l'antenne au milieu), un rayon sort par une extrémité ouverte, et le mur ne coupe rien, lorsque <c2/>. Un mur pas plus haut que l'antenne ne coupe rien. <c3/> vaut par défaut { "1.5" } m (un toit de voiture ou un récepteur portatif, un choix déclaré) ; un nouveau canyon exige <c4/>.

# text
# c1: kshana skyline --preset <name>
seg-1eeff52ea5a5 = Dimensions choisies et déclarées (celles de la note de conception), et non relevés d'un lieu réel. <c1/> en affiche une avec sa provenance et sa coupure à chaque degré.

# text
seg-13e8e5460280 = Géométrie

# text
seg-6d71c5cbe104 = Canyon : rue à { "0" }°, largeur { "20" } m, murs de { "30" } m et { "30" } m, antenne à { "1.5" } m. { "70.7" }° en travers de la rue, dégagé le long de celle-ci.

# text
seg-ab3415ff8811 = Rapport hauteur/largeur de { "1.5" }, à l'intérieur de la fourchette de { "0.5" } à { "2" } des rapports d'aspect des canyons urbains donnée par Oke ({ "1988" }), <em>Street design and urban canopy layer climate</em>, Energy and Buildings { "11" }, { "103" }–{ "113" }.

# text
seg-e331f02251f8 = Secteurs : ouvert vers le large sur { "090" }–{ "270" } ({ "180" }°) ; bâtiments du quai { "8" }° sur { "315" }–{ "045" } ({ "90" }°) ; la digue et son feu { "3" }° sur { "045" }–{ "090" } et { "270" }–{ "315" }.

# text
seg-6926e1bfc55d = Choix déclarés (par exemple des entrepôts de { "40" } m à environ { "285" } m).

# text
# c1: 1500/|sin az|
seg-f13d4df9a42c = Relief : parois à { "600" } m au-dessus de l'antenne, à { "1500" } m de part et d'autre d'un chenal nord-sud, un point par degré (à <c1/> m), chute de courbure appliquée. { "21.8" }° en travers, moins de { "1" }° le long de l'axe.

# text
seg-4d3dedbe4491 = De l'ordre de la largeur et du relief des profonds fjords de l'ouest de la Norvège (Holtedahl ({ "1967" }), <em>Notes on the formation of fjords and fjord-valleys</em>, Geografiska Annaler 49A, { "193" }–{ "203" }).

# text
seg-51f5219cb050 = Secteurs : piles de conteneurs { "12" }° sur la moitié côté terre { "000" }–{ "180" } ; flèches de grues { "35" }° sur { "245" }–{ "255" } et { "25" }° sur { "285" }–{ "295" } ; dégagé vers l'eau ailleurs.

# text
seg-a568ae949c3b = Cinq conteneurs ISO { "668" } high-cube ({ "14.5" } m) à environ { "60" } m d'une antenne située à { "2" } m de hauteur ; une flèche à environ { "50" } m au-dessus du quai, à { "70" } m et { "100" } m, de l'ordre d'une grue post-Panamax. Un secteur de grue est opaque.

# text
seg-65b1b45c787f = Dans un scénario

# text
# c1: [skyline]
seg-e489759bbd65 = Une section <c1/> facultative, par-dessus le seuil propre au type de scénario :

# text
seg-f98345079e70 = Ce que la ligne d'horizon change

# text
seg-cbe2f5ae721f = Par échantillon

# text
# c1: orbit
# c2: user_site
seg-7368ea5c4b79 = <c1/> (avec <c2/>)

# text
seg-fde216d940fb = La chronologie de visibilité (disponibilité GNSS) et le résumé du DOP.

# text
# c1: integrity
# c2: user_site
seg-7f6b2fcda681 = <c1/> (avec <c2/>)

# text
# c1: araim_dual
seg-8fafdb892253 = Les satellites utilisés par RAIM et ARAIM (<c1/>).

# text
seg-c0156fd1c895 = Les satellites dont les pseudodistances sont simulées et utilisées par RAIM.

# text
seg-d7fa5e5cf33d = Les satellites que le récepteur peut suivre, avant le brouilleur.

# text
seg-86caf3ae19ad = L'ensemble en vue de chaque mode au-dessus du masque propre à chaque système, balayage polaire compris (la même ligne d'horizon à chaque site). L'enveloppe du mode Doppler et le passage unique conçu sont des bornes de ce qu'un récepteur doit pouvoir gérer et conservent le masque de chaque système.

# text
seg-20d2e86d17bc = Quelles époques comptent comme au-dessus du masque, la durée passée au-dessus, les satellites de la comparaison GNSS.

# text
# c1: nmea-scenario
seg-ed5bbd6b2c46 = <c1/> (NMEA d'entraînement)

# text
seg-d0eb9fd84d24 = Les satellites présents dans GSV et dans la position calculée. Les azimuts sont des relèvements vrais fixés au sol, et non le cap du navire.

# text
# c1: orbit
# c2: integrity
# c3: user_site = { lat_deg, lon_deg, height_m }
# c4: user
# c5: epoch + t
# c6: t
# c7: epoch
# c8: epoch
# c9: integrity
# c10: user_site
# c11: user
seg-56cc8ae30218 = <b>Le site au sol de <c1/> et de <c2/>.</b> Ces deux types de scénario modélisent un utilisateur en orbite avec une élévation géocentrique et sans azimut lié à la Terre ; ils n'acceptent donc une ligne d'horizon qu'avec le mode site au sol de la note de conception : <c3/> à la place de <c4/> (exactement l'un des deux). Chaque échantillon est un instant absolu, <c5/> : chaque satellite y est propagé (un jeu d'éléments, des éphémérides diffusées ou un fichier SP3 sont avancés à partir de leur propre époque, un satellite Walker compte <c6/> à partir de <c7/>) et mis en rotation dans le repère terrestre à cet instant, de sorte que le site voit un seul ciel cohérent. <c8/> est celle du scénario d'orbite ; sans elle (et toujours pour <c9/>, qui n'en a pas), c'est l'époque la plus récente parmi les satellites qui en portent une, ou J2000 pour les seules constellations Walker. L'élévation et l'azimut sont géodésiques (WGS-84). La séparation horizontale et verticale des niveaux de protection ARAIM du type intégrité et de l'erreur verticale de Stanford utilise le même haut géodésique (la normale à l'ellipsoïde WGS-84, à environ { "0.19" }° de la radiale géocentrique à { "45" }° de latitude) ; le RAIM instantané l'utilisait déjà. Un <c10/> sans ligne d'horizon est un simple utilisateur au sol ; le chemin <c11/> en orbite est inchangé.

# text
# c1: [skyline]
# c2: tests/skyline_scenarios.rs
# c3: docs/revisions/STUDIO15-portable-math-rebaseline.md
# c4: [skyline]
# c5: skyline
# c6: masked_by_skyline
seg-fae979b3b96f = <b>Rétrocompatibilité.</b> Sans section <c1/>, un scénario est identique octet pour octet à ce que le même moteur donnait avant l'existence du code de ligne d'horizon : <c2/> vérifie le JSON, le graphique et le résumé de chaque scénario livré qui exécute un de ces types de scénario, ainsi que le texte NMEA de chaque scénario d'entraînement, par rapport aux empreintes SHA-256 de la référence « { "0.36" } portable » (les empreintes du commit de la version { "0.35.0" }, rebasées lorsque le moteur est passé aux mathématiques portables et conservées dans le test à titre de trace : <c3/>). Une section <c4/> vide ne coupe rien ; le résultat est alors égal à l'exécution sans elle, à l'exception du bloc <c5/> ajouté et des compteurs <c6/> à zéro.

# text
# c1: user
# c2: user
# c3: user_site
# c4: width_m
# c5: [0, 360)
# c6: [0, 90)
seg-fe88e0ad01e9 = <b>Ce qui est refusé</b>, avec la raison dans le message : une ligne d'horizon sur un <c1/> en orbite ; <c2/> et <c3/> ensemble ; un préréglage inconnu ; un canyon sans <c4/> ; une table qui n'est pas strictement croissante dans <c5/> ; une élévation hors de <c6/> ; un secteur vide ; une distance de relief non positive ; une entrée dépassant les plafonds ; toute clé inconnue.

# text
# c1: skyline: { source, open_fraction, provenance }
# c2: source
# c3: preset:<name>
# c4: preset:<name>+overrides
# c5: custom
# c6: open_fraction
# c7: max(mask_deg, skyline)
# c8: 1 − sin(cut)
# c9: provenance
# c10: units
seg-d1b10a0c833f = <b>Le résultat</b> gagne <c1/> lorsque la section est présente : <c2/> vaut <c3/>, <c4/> ou <c5/> ; <c6/> est la fraction de l'angle solide de l'hémisphère supérieur au-dessus de <c7/> (la moyenne de <c8/> sur l'azimut : { "1" } pour un masque nul, { "0.5" } pour une coupure plate à { "30" }°) ; <c9/> est la ligne du préréglage ou celle du scénario lui-même. Les unités et les classes de provenance figurent dans le bloc <c10/>.

# text
# c1: kshana example <name>
seg-0842c1133eb5 = Exemples fournis (<c1/>) :

# text
# c1: [skyline]
seg-5f77a52314c7 = Ce qu'il montre (retirez la section <c1/> pour comparer)

# text
# c1: city-street
seg-523f8c1a7912 = GPS + Galileo au fond de <c1/> : { "17" } échantillons sur { "289" } conservent une position calculée, PDOP médian de { "70.5" } ({ "1.14" } à ciel dégagé).

# text
seg-6c5618dce8ab = ARAIM à deux constellations à l'entrée d'un port : { "70" } époques-satellites masquées, disponibilité inchangée ({ "145" } sur { "145" }).

# text
seg-36254db521fd = Pseudodistances et RAIM sur un quai : { "44" } époques-satellites masquées ; disponibilité RAIM de { "0.59" } ({ "0.85" } à ciel dégagé).

# text
seg-6b0f8b4c700f = Un brouilleur de { "2" } W dans un port : { "83" } époques-satellites masquées, suivi inchangé (le brouilleur les avait déjà prises).

# text
seg-22ceab915271 = GPS + Galileo + une couche LEO dans un fjord : PDOP fusionné médian de { "1.14" } ({ "0.93" } à ciel dégagé).

# text
# c1: leo-vertical-autonomous-vehicle
# c2: city-street
seg-f940e764e244 = Le canyon de <c1/> en coupure plate à { "35" }° et sous la forme de <c2/> tourné selon le cap de la voiture : { "8" } contre { "4" } à { "5" } satellites GPS et Galileo ; erreur moyenne fusionnée de { "2.1" } m dans les deux cas ; l'alarme à { "1.5" } m pour { "51" } % et { "59" } % des époques.

# text
# c1: src/geometry.rs
seg-6aa4ec7e4058 = Cinq fonctions du moteur (<c1/>), identiques sur toutes les surfaces :

# text
seg-4d6a793b2794 = Entrée → sortie

# text
# c1: id
# c2: system
# c3: az_deg
# c4: el_deg
# c5: cut_deg
# c6: visible
# c7: masked
# c8: n_visible
# c9: n_masked
# c10: open_fraction
# c11: dop
# c12: tdop_by_clock
# c13: states
# c14: cofactor_enu
# c15: covariance_enu_m2
# c16: ellipse_1sigma
# c17: ellipse
# c18: label
# c19: statement
# c20: advisory
seg-c99f58f1ccd2 = par satellite <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> ; <c8/>, <c9/>, <c10/> ; <c11/> (GDOP, PDOP, HDOP, VDOP, TDOP, <c12/>) ; <c13/>, <c14/> (variance unitaire), <c15/> ; <c16/> et <c17/> à la confiance demandée ; <c18/>, <c19/>, <c20/>

# text
# c1: n
# c2: σ_UERE
# c3: seed
# c4: samples_enu_m
# c5: σ_UERE × HDOP
# c6: σ_UERE × PDOP
seg-a5b914aac404 = <c1/> (au plus { "5000" }, un plafond d'entrée) erreurs des moindres carrés sous des erreurs de distance gaussiennes indépendantes de <c2/>, tirées d'un flux ChaCha8 initialisé par <c3/> : <c4/>, la covariance empirique, l'erreur quadratique moyenne horizontale et 3D à côté de <c5/> et <c6/>, la fraction à l'intérieur de l'ellipse à { "95" } %

# text
# c1: open_fraction
seg-f435ee3b8709 = les préréglages avec libellé, description, provenance, la coupure à chaque degré et <c1/>

# text
# c1: source
# c2: provenance
# c3: open_fraction
seg-1937af5fa347 = une section de ligne d'horizon réduite à la table de 360 entrées qu'utilise le moteur, avec <c1/>, <c2/>, <c3/>

# text
seg-f16a1f2de329 = le diagramme du ciel en SVG statique (sans script, sans référence externe, chaque chaîne d'entrée échappée)

# text
seg-c802cf2a2e30 = Une requête :

# text
# c1: systems
# c2: constellation-design
# c3: gps-baseline
# c4: galileo
# c5: beidou-meo
# c6: glonass
# c7: xona-pulsar
# c8: iridium-stl
# c9: leo-pvt
# c10: [[system]]
# c11: time_s
# c12: leo-pvt
# c13: "satellites": [{"id": "G05", "system": "GPS", "az_deg": 120, "el_deg": 35}, ...]
# c14: "ecef_m": [x, y, z]
# c15: site
# c16: user_ecef_m
# c17: "common"
# c18: σ_UERE
seg-c3c44c1967ba = <c1/> sont les préréglages de constellation du moteur (<c3/>, <c4/>, <c5/>, <c6/>, ... de <c2/> ; les préréglages LEO <c7/>, <c8/>, ...) ou une table <c10/> complète de <c9/>, propagée jusqu'à <c11/> (képlérienne avec J2 séculaire, les orbites en mode conjoint de <c12/>). Leurs phases relatives proviennent d'époques de référence différentes ; le ciel est donc <b>une géométrie représentative, et non le ciel de cette date à cet endroit</b>. Les satellites peuvent aussi (ou en plus) être donnés directement : <c13/>, ou avec <c14/> et un <c15/> ou <c16/>. Valeurs par défaut : le masque propre à chaque système ({ "5" }° GNSS, { "10" }° LEO ; { "5" }° pour les satellites donnés directement), une horloge de récepteur par système (<c17/> pour une seule horloge partagée), <c18/> de { "1" } m (une ligne de budget bifréquence représentative), confiance de { "0.95" }. Plafonds d'entrée : { "2000" } satellites au plus au-dessus de l'horizon (une table de système qui en demande davantage est refusée avant d'être construite) et { "16" } horloges de récepteur.

# text
seg-6408f9b02ccb = Un ciel daté à partir de jeux d'éléments.

# text
# c1: "tle"
# c2: orbit-real-tle
# c3: "epoch"
# c4: time_s
# c5: site
# c6: "epoch"
# c7: 2026-06-07T12:00:00Z
# c8: epoch
# c9: tle
# c10: "tle_system"
# c11: TLE
# c12: sky_source
# c13: sky_statement
seg-7724e4ecafee = <c1/> accepte du texte de jeux d'éléments à deux lignes (une ligne de nom avant chaque jeu est facultative ; { "4" } MiB au plus, un plafond d'entrée), propagé par le SGP4 du moteur (WGS-72, le propagateur qu'utilise <c2/>) jusqu'à <c3/> plus <c4/>, mis en rotation dans le repère terrestre avec UT1 pris égal à UTC et sans mouvement du pôle, et vu depuis <c5/>. <c6/> est en UTC ISO { "8601" } (<c7/>) et ne date que les jeux d'éléments (les préréglages ne portent aucune date : un <c8/> sans <c9/> est donc refusé) ; <c10/> les étiquette pour l'horloge par système (par défaut <c11/>). Chaque résultat indique de quel ciel il s'agit dans <c12/> et <c13/> :

# text
seg-13a8b4ac40f9 = Le ciel

# text
seg-c0bde35f9442 = les préréglages de constellation du moteur : une géométrie représentative

# text
seg-d368b50280cc = les jeux d'éléments propagés jusqu'à l'époque indiquée : le ciel que ces jeux d'éléments donnent à cette époque, et non une mesure de celui-ci (leur propre exactitude est celle de SGP4 et de l'âge des jeux)

# text
# c1: epoch
# c2: time_s
seg-0bc07825a9b5 = pas de <c1/> : les jeux d'éléments propagés jusqu'à l'époque propre du jeu le plus récent plus <c2/>, un ciel représentatif

# text
seg-1230388da233 = satellites donnés directement, tels qu'indiqués

# text
# c1: +
# c2: epoch_utc
# c3: tle_skipped
# c4: systems
seg-1a30004a7f9e = Un mélange les réunit avec <c1/>. <c2/> est l'instant jusqu'auquel les jeux d'éléments ont été propagés, et <c3/> nomme la partie du texte qui n'a pas été utilisée, avec la raison : lignes de jeux d'éléments mal formées ou orphelines (avec leurs numéros de ligne), jeux que l'analyseur a refusés, et jeux que SGP4 n'a pas pu propager jusqu'à cet instant (en rentrée atmosphérique, ou au-delà de ses limites) ; { "100" } entrées au plus en tout, puis une dernière entrée qui compte le reste. Une liste <c4/> vide n'ajoute aucun préréglage. Le diagramme du ciel indique la base dans son pied de page.

# text
# c1: orbit::cofactor_from_los
# c2: orbit::dop
# c3: orbit::dop_cov
# c4: orbit::dop
# c5: tests/dop_reference.rs
seg-8560c13c7ea3 = <b>Un seul noyau.</b> La matrice de cofacteurs est <c1/>, l'assemblage de la matrice de conception et l'inverse de Gauss-Jordan derrière <c2/>. <c3/> expose la covariance et <c4/> en est la réduction ; les scalaires VALIDATED sont donc inchangés et toujours figés par <c5/>. Il n'existe pas de seconde implémentation du DOP.

# text
# c1: k σ √λ
# c2: λ
# c3: k = √(−2 ln(1 − p))
# c4: √5.991 = 2.448
# c5: ½ atan2(2 Q_EN, Q_NN − Q_EE)
# c6: [0, 180)
seg-cb1be3e04419 = <b>L'ellipse.</b> Demi-axes <c1/> pour les valeurs propres <c2/> du bloc est-nord, avec <c3/> (<c4/> à { "95" } %, { "1" } à { "39.35" } %), et l'azimut <c5/> du grand axe dans <c6/> à partir du nord.

# text
seg-96062e2cfed1 = Points d'entrée

# text
# c1: kshana sky <request.json|toml>
# c2: kshana sky --site <lat,lon[,h]> (--systems <a,b> | --tle <file>) [--epoch] [--tle-system] [--time] [--mask] [--skyline-preset] [--uere] [--clock]
# c3: --monte-carlo <n> --seed <s>
# c4: --svg
# c5: kshana skyline --preset <name> | --presets | --profile <file>
seg-f8dc86bd9da2 = <c1/> ou <c2/>, avec <c3/> ou <c4/> ; <c5/>

# text
seg-d5b5bdf6081c = Rust

# text
# c1: kshana::geometry::{sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg}
# c2: kshana::surface::*
seg-8d0f99ed4837 = <c1/>, <c2/> aux mêmes noms

# text
seg-40a7552d2ba9 = MCP

# text
# c1: sky_geometry
# c2: request
# c3: skyline_preset
seg-42f0fe3b42ab = <c1/> (<c2/>, ou <c3/>) ; pas de Monte Carlo via MCP (des échantillons en masse qu'un agent devrait résumer, non transporter)

# text
# c1: label
# c2: statement
seg-9d04c658b37a = Chaque résultat porte <c1/> (MODELLED), le <c2/> (géométrie sous un modèle d'erreur déclaré : erreurs de distance gaussiennes indépendantes, égales, de moyenne nulle ; pas une prédiction de l'erreur réelle d'un récepteur, qui comporte aussi des biais, des trajets multiples et des erreurs hors ligne de visée ; pas une borne d'intégrité) et l'avis indicatif : <em>Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) : l'opérateur reste responsable de la navigation du navire.</em>

# text
# c1: docs/VERIFICATION-MATRIX.md
seg-0e1285fdfe52 = Cinq lignes du registre (<c1/>), telles que la note de conception les délimite :

# text
# c1: TopocentricFrame
# c2: ElevationMask
# c3: get_dop
# c4: xval/orekit-skyline/PREREGISTRATION.md
seg-1aa76286f152 = Orekit { "12.2" } (angles de visée <c1/>, <c2/>) avec gnss_lib_py { "1.0.4" } (<c3/> et la matrice du DOP), préenregistrés dans <c4/> (commit e4b9d912) avant l'exécution de l'un comme de l'autre : { "1173" } angles de visée sur six sites et quatre époques, six tables, { "142" } ensembles visibles ; pire élévation { "1.3e-13" }°, azimut { "2.3e-13" }°, masque { "1.1e-12" }° contre { "1e-9" }° ; ensembles visibles identiques, aucun dans la bande limite ; DOP { "3.3e-13" } en relatif et cofacteur { "6.6e-13" } de l'échelle de la matrice contre { "1e-9" }. Portée : masques tabulés, angles de visée géodésiques, l'ensemble masqué et son DOP et cofacteur à horloge commune.

# text
seg-b33828edbe2f = valeurs calculées à la main ; la comparaison ci-dessus lit leurs tables comme entrées et ne les vérifie pas

# text
seg-ca950752be62 = Préréglages de ligne d'horizon

# text
seg-83946f66ca78 = aucune : dimensions choisies et déclarées (vérifiées seulement par rapport à elles-mêmes)

# text
# c1: linalg.inv
# c2: linalg.eigh
# c3: xval/numpy-ellipse/PREREGISTRATION.md
seg-ca5db55640a9 = numpy { "2.5.4" } <c1/> et <c2/> (P2 standard) sur les { "142" } ensembles visibles versionnés, horloge commune et une horloge par système, préenregistrés dans <c3/> (commit 0bbeeaee) : { "270" } cas, axes { "5.1e-13" } en relatif, orientation { "5.3e-12" }°, cofacteur { "1.0e-12" } de l'échelle de la matrice, contre { "1e-9" } et { "1e-6" }°

# text
seg-44e5f9ca28f7 = Fonctions de géométrie du ciel

# text
seg-8e3953481bbf = la composition : propagation du préréglage vers un ciel représentatif, le nuage Monte Carlo (vérifié par rapport à la géométrie qu'il échantillonne), les surfaces

# text
# c1: [skyline]
seg-e8eec007c6b9 = L'absence de section <c1/> est vérifiée octet pour octet par rapport aux sorties de la { "0.35.0" }, ce qui démontre la rétrocompatibilité et ne valide rien. gnss_lib_py n'applique qu'un seul masque d'élévation ; c'est donc la référence indépendante pour le DOP ici, et non pour le masque.

# text
seg-d5894e54715b = Ce qu'une ligne d'horizon ne modélise pas : la diffraction sur le bord d'un mur, les réflexions et les signaux hors ligne de visée qu'un vrai récepteur peut encore suivre (ils sont écartés, et non dégradés), la transparence partielle (une grue à treillis est opaque sur tout son secteur), le relief au-delà des points donnés, et la courbure de la Terre à l'intérieur des formes de canyon et de secteur.

# text
seg-745d19d6b35d = <s1>Précédent</s1>Intégrations maritimes

# text
seg-bbe8dd07d33b = <s1>Suivant</s1>La confiance comme télémétrie de sécurité
