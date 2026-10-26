# docs--kinds-lunar-and-cislunar: translations (fr)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Type

# text
# c1: independence
seg-f994c81583bf = Test d'estimateur indépendant MODELLED du seuil d'observabilité de longueur d'arc cislunaire. Ce seuil est une lecture de RANG de la matrice d'observabilité assemblée à partir des lignes ANALYTIQUES du jacobien de distance et de la matrice de transition d'état variationnelle ANALYTIQUE, et son contrôle croisé par filtre d'information en racine carrée replie ces mêmes lignes — un contrôle de cohérence entre deux machines numériques, et non une corroboration. Ce type de scénario fournit l'arbitre manquant : un estimateur par moindres carrés par lot qui RETROUVE réellement l'état initial du chef à partir de mesures simulées, avec les dérivées partielles de mesure prises comme DIFFÉRENCES FINIES CENTRÉES du modèle direct composé. Il n'appelle aucune ligne de jacobien analytique, aucune STM variationnelle, aucune décomposition en valeurs singulières ou en valeurs propres, aucune tolérance de rang et aucun filtre d'information en racine carrée — une garde sur le texte source dans tests/cislunar_arc_recovery_reference.rs le rend vérifiable — tandis que la dynamique (le même flot RK4 du CR3BP), les conditions initiales (la même constellation corrigée différentiellement), l'observable scalaire et la grille d'époques sont partagés délibérément et nommés dans le bloc <c1/> émis, car deux analyses d'un même problème physique doivent s'accorder sur la physique pour être comparables. Deux critères, chacun balayé sur cinq décades de sa propre borne : RÉCUPÉRATION SANS BRUIT (l'erreur d'état finale de chaque essai initialisé au plus égale à recovery_factor fois son déplacement a priori — l'analogue du rang, sans tolérance de valeur singulière) et ESTIMABILITÉ MONTE-CARLO (l'erreur de position efficace mesurée sur un ensemble de bruit initialisé en dessous d'une borne indiquée — l'analogue de l'estimabilité, mesurée plutôt que prédite). Prend en charge le quatre-états plan et le six-états spatial, les familles DRO / halo L2 / NRHO L2, les observables de distance et de vitesse de distance, et une paramétrisation polaire centrée sur la Lune dans laquelle la transformation est appliquée à l'ÉTAT et le modèle direct re-différencié à cet endroit. MEASURED sur la grille DRO plane publiée : l'estimateur retrouve le quatre-états à partir de { "0.782609" } h contre { "2.086957" } h pour le critère de rang à rel_tol { "1e-6" } (rapport { "0.375" }) — le seuil de rang n'est PAS corroboré comme frontière de récupérabilité — tandis que la frontière d'estimabilité mesurée tombe dans la même cellule de grille que la formelle, { "5.739130" } h, et la courbe d'erreur mesurée reproduit le 1-sigma formel sur { "21" } longueurs d'arc avec un rapport moyen géométrique de { "0.98" }. MODELLED : la conception de la constellation, la grille d'époques, l'unique liaison suivie, l'amplitude du déplacement, le sigma de mesure et les deux bornes indiquées. Ce n'est pas un produit de performance de navigation certifié.

# attr:alt
seg-2fe411ae2153 = Le graphique que le moteur écrit pour scenarios/cislunar-arc-recovery.toml, type de scénario cislunar-arc-recovery

# text
seg-7ccd0a3babb8 = Observabilité MODELLED d'une constellation cislunaire plane (P6) : suit une constellation plane de quatre engins sur DRO plane corrigée différentiellement avec mesure de distance inter-satellites et rapporte quelle part de l'état à quatre composantes [x,y,ẋ,ẏ] d'un engin l'arc rend observable. Émet ({ "1" }) le tableau rang-contre-longueur d'arc pour une seule liaison de distance seule — de rang 1 instantanément, croissant vers l'état complet à quatre composantes à mesure que l'arc s'allonge (P6 Tableau { "1" }) ; ({ "2" }) le spectre propre du Gramien d'observabilité + le nombre de conditionnement sur l'arc ; ({ "3" }) la comparaison de rang instantané distance seule contre distance + vitesse de distance (le levier de conception Doppler) plus le rapport de GDOP indéfini en distance seule / défini en distance + vitesse ; et ({ "4" }) une validation croisée indépendante par SRIF dont la covariance a posteriori devient finie / bien conditionnée exactement à l'arc où le rang observable atteint quatre. Cœur VALIDATED : le rang observable est un seuil de valeur singulière révélateur du rang, recoupé avec le rang propre du Gramien ; le spectre propre obéit aux invariants spectraux (trace=Σλ, det=Πλ, Frobenius²=Σλ²) ; la STM variationnelle est la STM du CR3BP validée par différences finies ; les lignes du jacobien de distance / vitesse de distance sont des dérivées partielles analytiques validées par différences finies (recoupées avec l'observable de vitesse de distance 3-D de la crate) ; les quatre conditions initiales sont des DRO planes corrigées différentiellement qui se ferment à un résidu de périodicité serré et sont rétrogrades ; la transition de rang est validée de façon croisée par le filtre d'information en racine carrée de la crate (covariance a posteriori finie exactement au rang plein, cond(P)=cond(OᵀO)) ; un instantané à rang déficient est signalé GDOP indéfini (fim condition=inf), jamais une valeur finie factice — la même garde de géométrie singulière que pvt::solve_spp applique. MODELLED : la conception de la constellation (amplitudes et phases au périlune des DRO) et la progression spécifique du rang qu'elle produit. Ce n'est pas un produit de performance de navigation certifié.

# attr:alt
seg-f15bbf30b0dd = Le graphique que le moteur écrit pour scenarios/cislunar-observability.toml, type de scénario cislunar-observability

# text
seg-c8a8be4b8894 = Réception du GNSS terrestre à distance lunaire, la couche de signal faible que nomme l'article sur la résilience aux conflits et pour laquelle le moteur n'avait aucun modèle. Un satellite GNSS pointe son antenne vers la Terre ; un récepteur près de la Lune se trouve à environ quinze fois le rayon orbital, de sorte que trois effets jouent à la fois. La Terre OCCULTE L'AXE DE VISÉE : à { "26,560" } km, elle sous-tend un demi-angle de { "13.9" } deg, si bien que tout rayon à destination de la Lune doit quitter l'émetteur à au moins cet écart du nadir, ce qui supprime le pic du faisceau avant même tout calcul de puissance. Ce qui reste, c'est LE BORD DU LOBE PRINCIPAL ET LES LOBES SECONDAIRES, le régime dans lequel la charge utile LuGRE a effectivement fonctionné en { "2025" }. Et l'affaiblissement en espace libre est d'environ { "208" } dB en L1, soit environ { "25" } dB de plus que ce que paie un utilisateur terrestre. Le rapport émet une ligne par satellite (angle hors axe de visée, occultation par la Terre, distance, affaiblissement de propagation, gain d'émission à cet angle, puissance reçue, densité porteuse/bruit) et n'agrège que les liaisons qui franchissent le seuil de poursuite. IL RAPPORTE AUSSI LE CONDITIONNEMENT, car c'est ce qui définit cette couche : chaque satellite visible se trouve dans un cône large de quelques degrés vu de la Lune, de sorte que les lignes de visée sont presque parallèles, que la dilution de précision est énorme et qu'un point fixe du GNSS terrestre à distance lunaire est une observation de synchronisation temporelle bien plus qu'une observation de position. MODELLED, et le diagramme d'émission en est la raison : le gain en fonction de l'angle est celui d'une ouverture circulaire uniforme (Airy), alors qu'une vraie antenne GPS L1 est un réseau hélicoïdal à douze éléments avec un lobe principal conformé et des lobes secondaires non Airy. Des diagrammes mesurés existent et ne sont pas fournis ici, de sorte que les classements et les ordres de grandeur sont significatifs, alors que le dB d'un satellite pris isolément ne l'est pas. Volontairement ABSENTS, chacun rendant le bilan optimiste : aucune perte ionosphérique ou troposphérique sur les rayons rasant le limbe, aucune perte de polarisation, de pointage ou de mise en œuvre, et une Terre sphérique sans extension réfractive. La position de la Lune est une ENTRÉE (distance plus direction inertielle) plutôt qu'une consultation d'éphéméride, parce que la grandeur testée est la liaison et la géométrie du faisceau. Faire passer cette ligne à l'état validé exige un diagramme d'émission mesuré et des points normaux LuGRE ; ni l'un ni l'autre ne figure dans le dépôt et aucun n'est inventé ici.

# attr:alt
seg-cf1dce5fc824 = Le graphique que le moteur écrit pour scenarios/earth-gnss-lunar.toml, type de scénario earth-gnss-lunar

# text
seg-004c56ded47f = Surface d'attaque de sécurité des signaux de navigation en surface lunaire (P1) : compose les analyses ouvertes de sécurité des signaux en une seule exécution accessible depuis le binaire. Rapporte ({ "1" }) la puissance reçue de l'AFS et son EXCÉDENT de puissance par rapport à une référence GPS terrestre, ainsi que la bande de sensibilité de 12-18 dB sous forme de véritable balayage multi-axes sur les entrées de la liaison (niveau de référence x PIRE x distance oblique), avec la réconciliation du facteur linéaire de 25x arrondi / 28x non arrondi. RÉVISÉ (règle R4) : ce rapport indiquait un DÉFICIT de puissance de { "15.6" } dB et un facteur de 32x/36x jusqu'à ce que la référence GPS soit corrigée de -125 / -128.5 (qui sont les valeurs en dBm) à -155 / -158.5 dBW, les valeurs de l'ICD-GPS-200 que le module de brouillage a toujours portées. Le signe s'inverse : le signal AFS lunaire modélisé est PLUS FORT de { "14.4" } dB que le GPS L1 C/A terrestre, et non plus faible. La puissance reçue elle-même n'a pas bougé d'un bit, et le facteur linéaire est l'ancien divisé par exactement { "1000" }, ce qui est exactement le décalage de { "30" } dB entre dBm et dBW ; ({ "2" }) la puissance d'émission requise de l'attaquant pour leurrer (J/S = { "3" } dB) et pour interdire (J/S = { "30" } dB) à chaque distance de sécurité, l'inverse de la liaison J/S ; ({ "3" }) l'empreinte orbitale de capture sous un diagramme d'antenne réel à ouverture uniforme (Airy [{ "2" } J1(x)/x]^{ "2" }), une calotte sous-hémisphérique limitée par l'altitude dont le limbe N'EST PAS capturé ; ({ "4" }) un résultat calculé d'accrochage de capture par leurrage de la boucle de poursuite (un leurre à code adapté, à un avantage de puissance et un décalage de code donnés, entraîne-t-il réellement la DLL/PLL), plutôt que le seuil affirmé de { "3" } dB ; ({ "5" }) la portée de l'horizon géométrique d'un émetteur de surface surélevé sur un corps sans atmosphère ; et ({ "6" }) le budget d'authentification OSNMA/TESLA (surcharge de { "20" } bit/s = ~{ "40" } % d'un message de navigation AFS de { "50" } bit/s, latence de divulgation de clé, falsification à { "2" }^-40). Un corps vide reproduit la référence de base P1 ; chaque entrée a une valeur par défaut et peut être redéfinie. Les sous-résultats VALIDATED portent la référence indépendante de leur module source (radiométrie en dB en forme close ; aller-retour J/S inverse ; diagramme d'Airy par rapport aux Bessel de A&S et à la géométrie de la calotte sphérique ; identité de l'horizon tangent sphérique par rapport à eo_payload ; dimensionnement des champs de l'ICD SIS d'OSNMA). MODELLED : les ordres de grandeur représentatifs de géométrie et de puissance et les valeurs des cellules de la carte de capture. Pas un produit de sécurité certifié.

# attr:alt
seg-de295af20c55 = Le graphique que le moteur écrit pour scenarios/lunar-attack-surface.toml, type de scénario lunar-attack-surface

# text
seg-142ad48fe422 = Augmentation par balises de surface d'un service de navigation orbital lunaire, sous forme de tableau avant/après exécutable. Un utilisateur au pôle sud voit un ensemble orbital clairsemé dans une étroite portion de ciel, de sorte que la géométrie de mesure de distance est mal conditionnée ; quelques BALISES DE SURFACE RELEVÉES fournissent les lignes de visée à basse élévation et grand azimut qui manquent à un ensemble entièrement au zénith, et la dilution de précision horizontale s'effondre. Le scénario rapporte trois configurations à une même époque — les satellites seuls, les satellites plus les balises visibles, et une constellation plus grande comme autre voie vers la même géométrie — chacune avec ses nombres de sources visibles, son DOP complet, et la précision réalisée à 1 sigma en MÈTRES obtenue en multipliant par une erreur équivalente de mesure de distance par balise, assemblée comme la racine de la somme des carrés des termes de synchronisation d'horloge, de multitrajet et de relevé. La visibilité des balises est l'horizon géométrique à deux hauteurs de la Lune sans atmosphère (pas d'atmosphère, donc la borne est exacte), et l'assemblage du DOP est le même noyau recoupé avec gnss_lib_py dans tests/dop_reference.rs. POURQUOI CE TYPE DE SCÉNARIO EXISTE : le module qui le sous-tend est dans le moteur et contrôlé par rapport à un chemin DOP indépendant depuis L08/L09, mais il n'était pas accessible depuis une exécution — pas de type de scénario, pas de branche de répartition, pas de fichier fourni. Le README annonçait la capacité et la matrice de vérification ne comportait AUCUNE ligne la concernant, de sorte qu'elle était à la fois revendiquée en prose et non revendiquée dans le registre, tout en étant inaccessible dans le moteur. Les valeurs par défaut sont la géométrie qui porte déjà une référence figée validée (un utilisateur à -80 deg avec une antenne de { "2" } m, trois balises à -80/0, -79/+{ "60" } et -79/-60 à { "2" } km, un instantané illustratif de LCNS à six satellites à t={ "0" }, un masque de { "5" } deg), de sorte qu'une exécution nue reproduit un tableau déjà couvert par une référence indépendante plutôt que d'inventer de nouveaux nombres. MODELLED : la conception de la constellation, le placement des balises et chaque ordre de grandeur du budget d'erreur sont des entrées illustratives, et non un relevé en service ni une liaison mesurée ; seuls l'arithmétique du DOP, la forme close de l'horizon et la relation sigma = DOP x sigma_URE sont ancrés à l'extérieur. Pas un engagement de performance de service.

# attr:alt
seg-a53e353706f6 = Le graphique que le moteur écrit pour scenarios/lunar-beacon.toml, type de scénario lunar-beacon

# text
seg-8ac5ac006ae7 = PNT DIFFÉRENTIEL lunaire modélisé (un analogue lunaire du DGNSS/SBAS) : une station de référence de classe NovaMoon, en un lieu sélénographique CONNU, calcule des corrections différentielles par satellite à partir d'une constellation ILLUSTRATIVE de classe Moonlight/LCNS à sources publiques (NovaMoon n'est cité que comme CLASSE de système, sans affiliation à l'ESA), et un utilisateur décalé de baseline_km les applique de sorte que les erreurs d'orbite et d'horloge de MODE COMMUN s'annulent. Le terme d'horloge s'annule EXACTEMENT (une identité algébrique) ; le terme d'orbite ne laisse que la projection de la différence de ligne de visée, qui → { "0" } quand la ligne de base → { "0" } (le plancher de décorrélation spatiale) et croît ≈ linéairement avec la ligne de base. Rapporte l'erreur de position 3D de l'utilisateur AVEC et SANS corrections, le facteur de réduction, la courbe d'erreur en fonction de la ligne de base, et un niveau de protection de l'utilisateur qui RÉUTILISE le mécanisme SBAS de la DO-229E (crate::sbas) avec le résiduel différentiel σ. MODELLED — identité d'annulation exacte + modèle de décorrélation au premier ordre ; non vérifié sur des données réelles ; aucun TRL, héritage ni aval d'une agence. Déterministe si initialisé par une graine.

# attr:alt
seg-8e67df89448a = Le graphique que le moteur écrit pour scenarios/lunar-differential-pnt.toml, type de scénario lunar-differential-pnt

# text
seg-55679aff66db = Datum de référentiel de Helmert (similitude) à sept paramètres piloté par une CAMPAGNE D'OBSERVATION SIMULÉE plutôt que par une transformation injectée. Un réseau de stations terrestres observe un catalogue de balises de surface lunaire selon un calendrier explicite ; les dérivées partielles du retard VLBI lunaire sont accumulées sur ce calendrier en une matrice d'information de Fisher des coordonnées des balises exactement comme le fait lunar-vlbi-fim ; et cette information est propagée par la matrice de conception de Helmert A = [I3 | [p]_x | p] aux points du catalogue jusqu'à la covariance du datum H = A^T M_b A, diagnostiquée par crate::fim::crlb. AUCUNE transformation n'est injectée et rien n'est retrouvé à partir d'une réponse plantée, de sorte que la précision du datum rapportée découle du programme d'observation : diviser par deux le sigma du retard la divise exactement par deux, et allonger l'arc l'améliore parce que la libration que le rapport MESURE (sub_earth_direction_sweep_deg) est ce qui sépare la coordonnée de balise selon la ligne de visée de celles dans le plan du ciel. Le rang, le défaut de datum, le conditionnement, le spectre complet, les directions inobservables DANS LA BASE À SEPT PARAMÈTRES, la direction la plus faible même à plein rang et la part de chaque paramètre dans celle-ci sont émis à chaque exécution ; un paramètre que la campagne ne contraint pas est publié comme NULL avec un statut, jamais lu dans une inverse quasi singulière. La corrélation des erreurs de balises est mesurée, non supposée : avec les stations maintenues fixes, aucune observation ne touche deux balises, de sorte que la matrice d'information est exactement bloc-diagonale (offblock_fraction { "0" }), et avec les stations estimées, le bloc marginalisé par Schur est couplé, la corrélation induite étant imprimée et toute la propagation étant relancée sans elle, de sorte que le prix d'une hypothèse d'indépendance est un nombre. La même propagation sous un sigma isotrope par coordonnée, et l'erreur de récupération que rapporte le scénario lunar-frame-realisation, sont toutes deux exécutées ici et imprimées à côté de la valeur de la campagne avec leurs rapports. MODELLED : le catalogue de balises est sourcé mais la CAMPAGNE est simulée — le réseau de stations et le sigma du retard sont des entrées illustratives, les observations de retard individuelles sont traitées comme indépendantes, et l'éphéméride du centre de la Lune, les horloges des stations, la troposphère et les paramètres d'orientation de la Terre sont maintenus FIXES, de sorte que la covariance du datum est une borne de Cramer-Rao pour un jeu de paramètres réduit. Pas un produit géodésique.

# attr:alt
seg-883d94b321b4 = Le graphique que le moteur écrit pour scenarios/lunar-frame-campaign.toml, type de scénario lunar-frame-campaign

# text
seg-0c4c119abfca = Réalisation modélisée du référentiel lunaire : ajustement d'un datum de Helmert (similitude) à 7 paramètres — { "3" } de translation, { "3" } de rotation à petit angle, { "1" } d'échelle — rattachant un ensemble estimé de coordonnées de points MCMF dérivées de coordonnées sélénographiques à un datum par moindres carrés pondérés (crate::batch_ls::gauss_newton), plus un simple rattachement d'orientation exprimant la petite rotation réalisée autour des axes de l'ICRF par rapport à l'orientation du corps WGCCRE de l'UAI { "2015" }. Le scénario injecte une petite transformation connue (translation ~dizaines de m, rotation ~µrad, échelle ~{ "1e-7" }) dans un réseau de points synthétique bien réparti, ajoute un bruit gaussien initialisé par une graine, retrouve le datum, et rapporte la transformation retrouvée, l'erreur de récupération par paramètre par rapport à la vérité injectée, et le résiduel RMS après ajustement. Autocohérence MODELLED — retrouve une transformation de similitude injectée (sans bruit à ~la précision machine), et NON une réalisation par rapport à de vraies données de suivi/VLBI ; déterministe (graine) ; aucun TRL, héritage ni aval d'une agence.

# attr:alt
seg-f3a6d69d0225 = Le graphique que le moteur écrit pour scenarios/lunar-frame-realisation.toml, type de scénario lunar-frame-realisation

# text
# c1: study
seg-d0fb90f506c9 = Études MODELLED de l'orbite et de la surface de la Lune comme infrastructure de navigation et de géodésie, cinq études derrière un seul type de scénario choisi par <c1/> : od-consistency (détermination d'orbite embarquée par GNSS terrestre en NRHO ou ELFO par rapport à une détermination d'orbite radiométrique au sol indépendante, jugées par leurs propres covariances sur une simulation de Monte-Carlo initialisée par une graine), carrier-phase (phase de la porteuse en double différence conjointe surface-orbiteur et résolution de l'ambiguïté entière avec LAMBDA), frame-coestimation (une station de surface et des orbiteurs ajoutés à la télémétrie de stations terrestres pour le datum de référentiel lunaire à sept paramètres), space-tie (GNSS, VLBI et télémétrie laser sur un même engin spatial, précision du rattachement de référentiel par rapport à l'erreur de rattachement local) et geodesy-sensitivity (information de Fisher des nombres de Love lunaires h2, k2, l2 et de la libration physique à partir de la télémétrie laser, du suivi d'orbiteur, d'un gravimètre de surface et d'une horloge de surface). Un modèle restreint à trois corps avec des simplifications énoncées ; les calculs numériques sont vérifiés par rapport à des programmes indépendants et rien n'est comparé à une mesure d'une grandeur lunaire.

# text
seg-f3b4a80a739b = pas de tracé : l'exemple n'écrit aucun graphique

# text
seg-4b6daea39f5c = Passage de niveau de protection ARAIM au pôle sud lunaire par rapport à un ensemble représentatif de relais LunaNet. sigma_ure_m expose la précision de mesure de distance du signal dans l'espace (les niveaux de protection lui sont proportionnels, de sorte que la balayer répond à la question de la précision de mesure de distance qu'exige une limite d'alerte). Par défaut, le cas historique du pôle sud de classe LNIS.

# attr:alt
seg-610fa190a393 = Le graphique que le moteur écrit pour scenarios/lunanet-araim.toml, type de scénario lunar-integrity

# text
seg-5a4dcb93a643 = Export d'interopérabilité lunaire modélisé : émet le référentiel lunaire, l'échelle de temps lunaire et l'éphéméride lunaire sous des formes d'échange alignées sur LunaNet/IOAG et fondées sur le CCSDS, avec vérification d'aller-retour et de correspondance des champs. RÉUTILISE l'émetteur+analyseur CCSDS OEM { "2.0" } du crate (crate::oem) rebaptisé pour le contexte lunaire — le REF_FRAME de l'OEM porte le référentiel de corps lunaire WGCCRE de l'UAI { "2015" } (MOON_ME / MOON_PA), TIME_SYSTEM l'échelle de temps lunaire (LTC / TCL / UTC), CENTER_NAME = MOON — sur un échantillon d'éphéméride illustratif de classe LCNS (positions issues de crate::lunar_service, vitesse par différence finie). Émet aussi un descripteur de temps lunaire aligné sur LunaNet/IOAG (identifiant d'échelle, taux séculaire µs/jour issu de crate::lunar_time, bande publiée, surface de référence) qui fait l'aller-retour via serde_json, et enveloppe les artefacts dans l'enveloppe KIF existante (crate::interchange) avec l'étiquette d'honnêteté MODELLED. Rapporte les artefacts émis, le nombre de lignes OEM, la réussite du contrôle de correspondance des champs + la liste des champs présents/manquants, l'aller-retour OEM réussi, l'aller-retour des métadonnées de temps réussi, et la taille en octets du KIF. MODELLED — l'aller-retour déterministe + la correspondance des noms de champs par rapport au CCSDS OEM publié + la sémantique des champs de LunaNet/IOAG sont la référence indépendante ; PAS un test de conformité d'interopérabilité certifié ; éphéméride illustrative à sources publiques, sans affiliation à l'ESA ; aucun TRL, héritage ni aval d'une agence.

# attr:alt
seg-0e86ff364c17 = Le graphique que le moteur écrit pour scenarios/lunar-interop-export.toml, type de scénario lunar-interop-export

# text
# c1: jamming
seg-a91a9ad5d8d1 = Brouillage RF propre à la Lune : rapport brouilleur/signal par satellite, C/N₀ effectif et perte d'accrochage pour un utilisateur de surface sélénographique sous un brouilleur de surface lunaire (ou surélevé), sur la constellation illustrative de classe Moonlight/LCNS en orbite lunaire, à sources publiques. Compose la physique ouverte existante du brouillage (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) avec la géométrie existante du ciel lunaire (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf) ; aucune géométrie ni radiométrie n'est redérivée. Contrairement au type de scénario terrestre <c1/>, la branche du signal n'est PAS une puissance reçue fixe : la puissance reçue isotrope de chaque satellite est son propre bilan de liaison PIRE − FSPL(distance oblique), de sorte que le J/S varie d'un satellite à l'autre avec la distance et l'élévation lunaires. Rapporte UNE LIGNE PAR LIAISON (époque, satellite) VISIBLE — azimut, élévation, distance oblique, les deux puissances reçues dont le J/S est la différence, le J/S, le C/N₀ nominal et effectif et l'état d'accrochage — plus des chiffres de mérite agrégés à côté de ce tableau (jamais à sa place), et le même tableau sous forme d'artefact CSV. Chaque champ numérique émis porte une unité et une classe de provenance. Les sous-résultats VALIDATED portent la référence indépendante de leur module source (l'équation anti-brouillage et la liaison J/S de Kaplan & Hegarty §{ "9.4" }, référencées de façon externe dans tests/gnss_denied_jamming_resilience_reference.rs ; la géométrie lunaire de lunar_service). La composition elle-même est recoupée avec un chemin indépendant à deux bilans de liaison (linkbudget::received_signal_power_dbw, une expression différente de l'affaiblissement en espace libre) à { "1e-9" } dB près. MODELLED : la constellation illustrative, la PIRE / puissance du brouilleur / gains d'antenne / température de bruit représentatifs, et l'absence d'ombrage par le terrain, de multitrajet, de dynamique de CAG et d'annulation adaptative. Pas un produit certifié de déni de service. Lorsqu'un brouilleur est configuré, le rapport porte aussi un CONTOUR DE DÉNI AVEC UNE BANDE D'INCERTITUDE plutôt qu'un contour lu à partir d'un seul scalaire : la distribution mesurée complète du C/N₀ du signal utile sur le tableau par satellite (n, min, p05, p25, médiane, p75, p95, max, moyenne, écart-type de l'échantillon, et l'asymétrie propre de l'échantillon), et le contour évalué à chacune de ces statistiques d'ordre selon les DEUX critères de déni que le moteur reconnaît — celui en vigueur par rapport de puissance (J/S = { "30" } dB, comme dans attack-surface et tracking-loop) et celui de perte d'accrochage (C/N₀ effectif tombant à tracking_threshold_dbhz, le critère qu'utilise la propre colonne d'état de ce rapport) — sur les deux axes du plan de déni (PIRE de brouilleur requise à la distance de sécurité du scénario, distance de sécurité de déni à la PIRE du scénario). Les bords de la bande SONT contour(p05) et contour(p95), la même application en forme close appliquée aux propres quantiles de l'échantillon : non un sigma ajusté à l'échantillon et non médiane ± k·écart-type, l'écart-type étant émis par continuité et n'étant utilisé par rien. Un quantile déjà égal ou inférieur au seuil de suivi n'a pas de J/S de déni fini et ses colonnes de perte d'accrochage sont nulles avec une raison comptée, jamais un rayon borné.

# attr:alt
seg-6fe8b3c6c584 = Le graphique que le moteur écrit pour scenarios/lunar-jamming.toml, type de scénario lunar-jamming

# text
seg-200e58e189c2 = Estimateur par lots modélisé conjoint multi-techniques de détermination d'orbite lunaire + horloge sur un réseau SIMULÉ : un ajustement instantané de Gauss-Newton qui fusionne les retards VLBI géodésiques sur des lignes de base terrestres, les distances station↔satellite locales à la Lune et les distances inter-satellites pour retrouver, ensemble, la position 3D d'une station de surface lunaire, les positions d'une petite constellation et le décalage d'horloge de chaque élément à partir d'une vérité injectée. Le résultat principal, honnête — le VLBI rend observable la position 3D complète de la station là où la seule télémétrie locale à la Lune laisse une direction faiblement observée — est rapporté sous la forme du contraste d'erreur de station avec et sans VLBI. Récupération en boucle fermée simulée MODELLED (la vérité partage le modèle d'observation), déterministe (graine), NON vérifiée sur des données réelles ; aucune propagation par modèle de forces dans le résolveur ; aucun TRL, héritage ni aval d'une agence.

# attr:alt
seg-cfa051b87e59 = Le graphique que le moteur écrit pour scenarios/lunar-joint-od-clock.toml, type de scénario lunar-joint-od-clock

# text
seg-25455a33523c = Datum de référentiel lunaire de Helmert à sept paramètres piloté par une campagne d'observation RÉELLE et ARCHIVÉE plutôt que simulée. Là où lunar-frame-campaign avait retiré la transformation injectée mais énonçait encore son réseau de stations, son calendrier et son sigma par observation comme des entrées ILLUSTRATIVES, ce type de scénario prend les trois à partir de mesures : les époques sont les heures d'émission depuis le sol de points normaux archivés des données consolidées de télémétrie laser (CLRD) de l'ILRS, les observations sont les mesures laser réellement tirées vers les cinq réseaux de rétroréflecteurs sur la Lune, et chaque poids d'observation est la propre précision archivée de ce point normal, bin_rms/sqrt(n_raw), lue dans le fichier. Les coordonnées des stations proviennent de la solution SLR ITRF2020 de l'IERS (propagées à l'époque par leurs vitesses publiées) et celles des réflecteurs de la Table { "7" } de JPL DE430 dans le référentiel Terre moyenne/rotation moyenne que réalise le modèle WGCCRE de l'UAI { "2015" }. Les dérivées partielles de distance s'accumulent dans la matrice d'information de Fisher conjointe des coordonnées des réflecteurs et se propagent par la même matrice de conception de Helmert jusqu'à la covariance du datum, diagnostiquée par crate::fim::crlb. Le rang, le défaut, le conditionnement, le spectre, les directions inobservables dans la base à sept paramètres, la direction la plus faible à plein rang et la part de chaque paramètre dans celle-ci sont émis à chaque exécution, et un paramètre non contraint est publié comme NULL avec un statut. La corrélation entre réseaux est MESURÉE à exactement zéro plutôt que supposée, parce qu'une mesure laser touche un seul réseau. Un enregistrement que les catalogues ne peuvent pas placer — une station sans position ITRF publiée — est IGNORÉ ET COMPTÉ, sans jamais recevoir de coordonnée de substitution. LES LIAISONS MESURÉES ET CELLES QUI SONT MODELLED, C'EST LE RAPPORT, PAS UNE NOTE DE BAS DE PAGE : l'éphéméride du centre de la Lune et l'orientation du corps de l'UAI restent modélisées et leur taille combinée est émise sous forme du résiduel de distance aller observé moins calculé sur chaque point utilisé ; la troposphère, les marées du corps solide, l'excentricité de la station, le mouvement du pôle, UT1-UTC, le retard relativiste et les horloges des stations sont absents et inclus dans ce résiduel. Comme une erreur d'éphéméride n'atteint une covariance que par la direction de chaque ligne de visée, chaque exécution résout aussi à nouveau tout le datum avec toutes les dérivées partielles inclinées de sensitivity_tilt_deg (signe alterné) et émet le rapport, de sorte que l'insensibilité de la covariance à l'éphéméride modélisée est un nombre plutôt qu'un argument. Les chiffres de la campagne simulée sont EXÉCUTÉS et imprimés à côté de ceux mesurés, et non transcrits. MODELLED : les chiffres à sept paramètres sont une borne de Cramer-Rao pour un jeu de paramètres réduit sur un calendrier réel — pas un datum résolu, pas une analyse LLR et pas un produit géodésique. La tranche de données réelles consignée est livrée avec le dépôt mais pas avec le crate publié ; faites pointer data_dir vers une copie de celle-ci.

# attr:alt
seg-e4da113cbe18 = Le graphique que le moteur écrit pour scenarios/lunar-llr-datum.toml, type de scénario lunar-llr-datum

# text
seg-f7ea776e70c9 = Couverture modélisée d'une station de référence lunaire : un balayage de Monte-Carlo du modèle de PNT différentiel lunaire sur une grille d'utilisateurs du pôle sud et une journée d'époques. Une station de référence différentielle en un site connu du pôle sud corrige une constellation donnée (képlérienne illustrative ou éphéméride tabulée) avec une erreur de signal dans l'espace, une erreur de relevé, une latence de correction et une quantification de liaison données ; par point et sur la région, elle rapporte l'erreur de position corrigée et non corrigée en percentile (3D, horizontale, verticale), la disponibilité, la couverture par rapport à un seuil donné, les niveaux de protection DO-229E, le rayon de couverture par azimut et le bilan de la liaison de correction à la station et au pire point. Pas une déclaration sur la performance d'un système réel ; sans affiliation ni aval d'aucune agence. MODELLED.

# attr:alt
seg-922b8656fcae = Le graphique que le moteur écrit pour scenarios/lunar-station-coverage.toml, type de scénario lunar-station-coverage

# text
seg-cac3a0bcbfc6 = Budget d'erreur de temps de bout en bout MODELLED du Temps lunaire coordonné (LTC) : les sept termes d'erreur du LTC assemblés sous forme de courbes d'erreur de temps x_i(τ) sur toute une grille de temps de moyennage, sommés quadratiquement en x_Σ(τ), et le τ de CROISEMENT horloge-référentiel auquel le terme d'horloge croissant dépasse le terme constant de réalisation du référentiel en temps réel (en dessous, le budget est limité par le référentiel, au-dessus, limité par l'horloge) — la réponse honnête à l'artefact du τ unique. Les pentes en τ sont en forme close et vérifiables analytiquement (horloge τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, planchers τ^{ "0" }, mesure τ^{ "{" }-1/2{ "}" }) et les lignes d'horloge reproduisent les spécifications d'horloge publiées sur un jour (crate::clock_specs) ; les ORDRES DE GRANDEUR des planchers de liaison RF/optique, de réalisation du référentiel, de résiduel relativiste et d'éphéméride sont des allocations de budget modélisées (valeurs par défaut documentées, redéfinissables par l'appelant), et non des mesures. L'apport est le τ de croisement reproductible, et non un nombre certifié par terme ; non certifié pour la tenue du temps en exploitation.

# attr:alt
seg-56fe184f2a12 = Le graphique que le moteur écrit pour scenarios/lunar-time-budget.toml, type de scénario lunar-time-budget

# text
seg-7f3e13712f10 = Taux d'horloge relativiste Terre–Lune modélisé (Temps lunaire coordonné, LTC/TCL) : le taux séculaire LTC−TT issu de la différence de potentiel propre et du terme cinétique de la Lune, rapporté avec la bande publiée de { "56" }–{ "59" } µs/jour, plus le décalage accumulé sur un horizon.

# attr:alt
seg-e9deb6ed41c1 = Le graphique que le moteur écrit pour scenarios/lunar-time-offset.toml, type de scénario lunar-time-offset

# text
seg-1bc37634ba9f = Covariance des coordonnées de station en VLBI lunaire : les dérivées partielles du retard de l'observable lunar-vlbi accumulées sur un CALENDRIER explicite (lignes de base x époques) dans une matrice d'information de Fisher, inversée, et rapportée comme covariance des coordonnées de station et sigma de station par coordonnée — une sortie calculée du moteur plutôt qu'une précision de retard scalaire passée à travers un facteur d'équipartition isotrope supposé g = { "3" }. L'état porte des coordonnées de station FIXES dans la Terre (ITRS), de sorte que le jacobien est la dérivée partielle inertielle tournée par la matrice GCRS->ITRS de chaque époque : la rotation de la Terre est ce qui rend ces coordonnées observables, et le rapport MESURE le balayage de la ligne de visée fixe dans la Terre et la déclinaison de la balise plutôt que de les supposer. Une observation est une paire (ligne de base, époque) avec LES DEUX stations au-dessus du masque d'élévation, pondérée par 1/delay_sigma_s^{ "2" }. Rapporte à chaque exécution le rang, le défaut de datum, le conditionnement, le spectre d'information complet, la matrice de covariance, les sigmas par station et par axe ainsi que 3D, et l'espace nul du réseau libre ; en cas de déficience de rang, le sigma principal est publié comme NULL avec un statut, jamais lu dans une inverse quasi singulière. La valeur d'équipartition c<em>delay_sigma_s</em>sqrt(g/N) pour le MÊME calendrier est émise à côté de la valeur calculée avec le rapport, ainsi que la borne isotrope de trace sqrt(p/trace(M)) qu'AM-HM rend plancher strict — de sorte que le rapport est l'anisotropie que l'hypothèse avait écartée. La fermeture de retard tau_ik = tau_ij + tau_jk ne rend géométriquement indépendantes que n-1 des n(n-1)/2 lignes de base ; le rapport énonce les deux nombres. MODELLED : l'éphéméride du centre de la Lune, les horloges des stations, la troposphère et les paramètres d'orientation de la Terre sont maintenus FIXES et les observations sont traitées comme indépendantes, de sorte que la covariance est une borne de Cramer-Rao pour un jeu de paramètres réduit, et non un résultat de session prédit ; le sigma de retard, les coordonnées des stations et le calendrier sont des entrées. La dérivée partielle que le jacobien du retard géométrique omet (le terme de Shapiro différencié) est mesurée par différence finie et émise. Pas un produit géodésique.

# attr:alt
seg-19c383444296 = Le graphique que le moteur écrit pour scenarios/lunar-vlbi-fim.toml, type de scénario lunar-vlbi-fim

# text
seg-e01f77d493a0 = Observable de retard VLBI géodésique lunaire modélisé : une ligne de base terrestre (deux stations au sol, GCRS) observe un signal aller d'une balise de surface lunaire de classe NovaMoon. Émet le retard en champ proche par différence de deux distances, son taux, et la correction de courbure du front d'onde en champ proche sur un passage — recoupé avec l'observable Δ-DOR à onde plane du même code source dans la limite du champ lointain, avec des dérivées partielles vérifiées par différences finies. Le chemin analytique par défaut est MODELLED et comporte les réserves de cohérence de référentiel, de mouvement du pôle xp=yp={ "0" } et d'onde plane contre champ proche. Définir planetary_kernel_path, earth_orientation_kernel_path et moon_orientation_kernel_path exécute à la place le chemin par noyaux (DE440, MOON_PA_DE440, ITRF93 ; temps de trajet lumineux barycentriques convergés ; ajoute les dérivées partielles de la balise et des stations de l'époque), dont le retard newtonien et les dérivées partielles concordent avec les temps de trajet lumineux convergés de NAIF SPICE à { "0.06" } ps et { "7.4e-9" }. Non vérifié sur de vraies données VLBI.

# attr:alt
seg-07d97fc1abac = Le graphique que le moteur écrit pour scenarios/lunar-vlbi.toml, type de scénario lunar-vlbi

# text
seg-28c6a5644152 = Analyse modélisée du volume de service de navigation lunaire à partir d'une constellation ILLUSTRATIVE de classe Moonlight/LCNS en orbite lunaire, à sources publiques (sans affiliation à l'ESA) : balaie une grille sélénographique de latitude/longitude sur un horizon temporel et rapporte le DOP / la couverture / la disponibilité (≥{ "4" } sats ET PDOP < seuil) ainsi qu'une enveloppe généralisée de niveaux de protection ARAIM lunaires (HPL/VPL) sur le volume. La géométrie du DOP RÉUTILISE le noyau VALIDATED par gnss_lib_py (crate::orbit::dop) ; le niveau de protection RÉUTILISE le mécanisme ARAIM lunaire LunaNet LNIS (crate::lunar, σ_URE≈{ "30" } m) et se réduit au niveau de protection existant du pôle sud comme cas particulier. Composition MODELLED : un ensemble de relais képlériens circulaires/elliptiques (et non l'éphéméride réelle LCNS/NRHO à correction différentielle), une Lune à rotation moyenne (sans libration ni pôle en précession). Déterministe (géométrie pure). Aucun TRL, héritage ni aval d'une agence.

# attr:alt
seg-edb738273a3a = Le graphique que le moteur écrit pour scenarios/moonlight-service-volume.toml, type de scénario moonlight-service-volume

# text
seg-4e31c8daf798 = Registre

# text
seg-efd15cff3d32 = MODELLED (libellé du résultat)

# text
seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
# c1: docs/kinds/lunar-and-cislunar.md
seg-a240ef37dc6d = Source : <c1/>

# text
seg-befef5f2f8dd = Lunaire et cislunaire (famille de types de scénario)

# text
seg-f964724ea446 = { "20" } types de scénario du moteur v{ $version }. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, pas un équipement de navigation homologué et pas un service de sauvegarde de la vie humaine. Chaque libellé ici est celui du moteur ou de la matrice de vérification ; un type est MODELLED sauf indication contraire de la matrice (comment un libellé s'obtient : la section Evidence du README).

# text
# c1: kshana scenarios/lunar-infrastructure-od-consistency.toml
seg-369e7cfcc1d3 = Pages thématiques : <a1>LUNAR-REFERENCE-STATION</a1>, <a2>LUNAR-INFRASTRUCTURE</a2>, <a3>LUNANET-AFS</a3>. En exécuter une : <c1/>. Toutes les familles : <a4>KINDS.md</a4>.

# attr:alt
seg-15b8e26dc24b = Planche-contact des graphiques que le moteur écrit pour les types de la famille Lunaire et cislunaire

# text
seg-fd2a12be04c2 = Passage des niveaux de protection ARAIM au pôle sud lunaire par rapport à un ensemble représentatif de relais LunaNet.

# text
seg-240eb5858113 = Taux d'horloge relativiste Terre–Lune modélisé (temps coordonné lunaire, LTC/TCL) : le taux séculaire LTC−TT issu de la différence de potentiel propre et du terme cinétique de la Lune, rapporté avec les { "56" }–{ "59" } publiés

# text
seg-177bff8d753e = Bilan d'erreur de temps de bout en bout du temps lunaire coordonné (LTC) MODELLED : les sept termes d'erreur du LTC assemblés sous forme de courbes d'erreur de temps x_i(τ) sur toute une grille de temps de moyennage, sommés en racine dans x_Σ(τ), et le c

# text
seg-df0437ef8324 = Observable de retard VLBI géodésique lunaire modélisé : une base terrestre (deux stations au sol, GCRS) observe un signal à sens unique d'une balise de surface lunaire de classe NovaMoon.

# text
seg-528223b4d676 = MODELLED { "3" } · VALIDATED { "3" }

# text
seg-38254487fb7f = Covariance des coordonnées de station VLBI lunaire : les dérivées partielles du retard de l'observable lunar-vlbi accumulées sur un PLANNING explicite (bases x époques) en une matrice d'information de Fisher, inversée, et rapp

# text
seg-23706714da99 = Estimateur par lots conjoint multi-techniques d'OD lunaire et d'horloge modélisé sur un réseau SIMULÉ : un ajustement instantané de Gauss-Newton qui fusionne les retards VLBI géodésiques de base terrestre, les distances station↔satellite locales à la Lune

# text
seg-2359450b3967 = Réalisation modélisée du référentiel lunaire : un ajustement de datum de Helmert (similitude) à 7 paramètres — { "3" } translations, { "3" } rotations de petit angle, { "1" } échelle — reliant un ensemble estimé de points MCMF dérivés de coordonnées sélénographiques

# text
seg-2a5af9961e99 = Datum de référentiel de Helmert (similitude) à sept paramètres piloté par une CAMPAGNE D'OBSERVATION SIMULÉE plutôt que par une transformation injectée.

# text
seg-3615bea1ea75 = Datum de référentiel lunaire de Helmert à sept paramètres piloté par une campagne d'observation RÉELLE et ARCHIVÉE plutôt que simulée.

# text
seg-5413116b8b42 = Analyse modélisée du volume de service de navigation lunaire à partir d'une constellation ILLUSTRATIVE en orbite lunaire de classe Moonlight/LCNS, de source publique (sans lien avec l'ESA) : balaie une grille de latitude/longitude sélénographique sur

# text
seg-a0e202b3566c = PNT DIFFÉRENTIEL lunaire modélisé (un analogue lunaire du DGNSS/SBAS) : une station de référence de classe NovaMoon à un emplacement sélénographique CONNU calcule des corrections différentielles par satellite à partir d'une constellation ILLUSTRATIVE

# text
seg-ed4ec8b6378c = Couverture modélisée d'une station de référence lunaire : un balayage de Monte Carlo du modèle de PNT différentiel lunaire sur une grille d'utilisateurs polaire sud et une journée d'époques.

# text
seg-aeec32be6092 = Augmentation par balises de surface d'un service de navigation orbital lunaire, sous forme de tableau avant/après exécutable.

# text
seg-b28693368acd = Export d'interopérabilité lunaire modélisé : émet le référentiel lunaire, l'échelle de temps lunaire et l'éphéméride lunaire sous des formes d'échange fondées sur CCSDS et alignées sur LunaNet/IOAG, avec des vérifications d'aller-retour et de respect du format des champs

# text
seg-d88605893c05 = Observabilité MODELLED d'une constellation cislunaire plane (P6) : suit une constellation plane de quatre engins en DRO corrigée différentiellement avec télémétrie intersatellite et rapporte quelle part d'un engin

# text
seg-8eaec90d1df5 = Test MODELLED d'estimateur indépendant du seuil d'observabilité de la longueur d'arc cislunaire.

# text
seg-9619b3d699c6 = Surface d'attaque de la sécurité des signaux de navigation en surface lunaire (P1) : compose les analyses ouvertes de sécurité des signaux en une seule exécution atteignable en binaire.

# text
seg-64c78e211181 = Brouillage RF natif lunaire : rapport brouilleur/signal par satellite, C/N₀ effectif et perte d'accrochage pour un utilisateur en surface sélénographique sous un brouilleur en surface lunaire (ou surélevé), sur la constellation publique illustrative

# text
seg-df68720ee7a5 = Réception du GNSS terrestre à la distance lunaire, la couche de signal faible que nomme l'article sur la résilience aux conflits et pour laquelle le moteur n'avait pas de modèle.

# text
# c1: study
seg-e6475fe9f443 = Études MODELLED de l'orbite et de la surface de la Lune comme infrastructure de navigation et de géodésie, cinq études derrière un seul type sélectionné par <c1/> : od-consistency (détermination d'orbite embarquée par GNSS terrestre en

# text
# c1: step_s
# c2: duration_s
# c3: alert_limit_m
# c4: p_hmi
# c5: sigma_ure_m
seg-ca4fac406beb = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-da20b48985b9 = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>lunar-integrity</a1>.

# text
# c1: epoch_year
# c2: epoch_month
# c3: epoch_day
# c4: horizon_days
seg-564b491c4bb8 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-0f0b2d0ca0b4 = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>lunar-time-offset</a1>.

# text
# c1: clock
# c2: tau_min_s
# c3: tau_max_s
# c4: points_per_decade
# c5: clocks
# c6: time_lab
seg-128bf57a76d1 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-d6aa5d645fb7 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>lunar-time-budget</a1>.

# text
# c1: station1_lat_deg
# c2: station1_lon_deg
# c3: station1_alt_m
# c4: station2_lat_deg
# c5: station2_lon_deg
# c6: station2_alt_m
# c7: beacon_lat_deg
# c8: beacon_lon_deg
# c9: beacon_alt_m
# c10: epoch_year
# c11: epoch_month
# c12: epoch_day
# c13: horizon_hours
# c14: step_min
# c15: planetary_kernel_path
# c16: earth_orientation_kernel_path
# c17: moon_orientation_kernel_path
seg-79140f2544ea = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>.

# text
seg-de468e4d4b46 = <b>Registre :</b> MODELLED { "3" } · VALIDATED { "3" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>lunar-vlbi</a1>.

# text
# c1: stations
# c2: beacon_lat_deg
# c3: beacon_lon_deg
# c4: beacon_alt_m
# c5: epoch_year
# c6: epoch_month
# c7: epoch_day
# c8: arc_hours
# c9: step_min
# c10: delay_sigma_s
# c11: elevation_mask_deg
# c12: datum
# c13: estimate_beacon
# c14: rel_tol
# c15: equipartition_g
# c16: planetary_kernel_path
seg-7da3c3ff2386 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-3119d4005897 = <b>Registre :</b> MODELLED { "3" } · VALIDATED { "2" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>lunar-vlbi-fim</a1>.

# text
# c1: n_sat
# c2: n_earth
# c3: seed
# c4: sigma_vlbi_s
# c5: sigma_range_m
# c6: sigma_isl_m
# c7: station_lat_deg
# c8: station_lon_deg
# c9: station_alt_m
# c10: orbit_radius_km
# c11: sigma_clock_s
# c12: orbit_ecc
# c13: orbit_inc_deg
# c14: orbit_argp_deg
# c15: orbit_planes
# c16: epoch_year
# c17: epoch_month
# c18: epoch_day
seg-6f59a33a35b3 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-142f2253e4d6 = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>lunar-joint-od-clock</a1>.

# text
# c1: n_points
# c2: tx_m
# c3: ty_m
# c4: tz_m
# c5: rot_x_urad
# c6: rot_y_urad
# c7: rot_z_urad
# c8: scale_ppb
# c9: noise_sigma_m
# c10: seed
# c11: epoch_year
# c12: epoch_month
# c13: epoch_day
seg-32c31af24e1b = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-73c0415efd2f = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>lunar-frame-realisation</a1>.

# text
# c1: stations
# c2: beacons
# c3: epoch_year
# c4: epoch_month
# c5: epoch_day
# c6: arc_hours
# c7: step_min
# c8: delay_sigma_s
# c9: elevation_mask_deg
# c10: earth_elevation_mask_deg
# c11: station_datum
# c12: rel_tol
# c13: assumed_coordinate_sigma_m
# c14: solver
seg-96efcb8d55d1 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

# text
seg-ce2f0f85dda4 = <b>Registre :</b> MODELLED { "2" } · VALIDATED { "3" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>lunar-frame-campaign</a1>.

# text
# c1: data_dir
# c2: normal_points_dir
# c3: reflectors_path
# c4: stations_path
# c5: dut1_s
# c6: rel_tol
# c7: compare_simulated_campaign
# c8: sensitivity_tilt_deg
# c9: planetary_kernel_path
# c10: extra_reflectors
# c11: extra_beacons
# c12: extra_earth_elevation_mask_deg
# c13: beacon_campaign
seg-d9e24a9a8c0c = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-4f05fad4b146 = <b>Registre :</b> VALIDATED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>lunar-llr-datum</a1>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: lat_min_deg
# c7: lat_max_deg
# c8: lat_step_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: lon_step_deg
# c12: horizon_hours
# c13: step_min
# c14: elev_mask_deg
# c15: pdop_threshold
# c16: alert_limit_m
# c17: p_hmi
# c18: perturbed
# c19: sigma_ure_m
# c20: export_site_lat_deg
# c21: export_site_lon_deg
# c22: export_antenna
# c23: ephemeris_path
# c24: planetary_kernel_path
# c25: epoch_utc
# c26: terrain
seg-8d9e0277303e = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>.

# text
seg-204901ae3684 = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>moonlight-service-volume</a1>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ref_lat_deg
# c7: ref_lon_deg
# c8: baseline_km
# c9: orbit_err_m
# c10: clock_err_m
# c11: noise_m
# c12: seed
# c13: t_s
# c14: residual_sigma_m
# c15: p_hmi
# c16: survey_sigma_m
# c17: latency_s
# c18: quantization_bits
seg-6fe67fa619d0 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-c83350735643 = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>lunar-differential-pnt</a1>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ephemeris_path
# c7: mask_deg
# c8: station_lat_deg
# c9: station_lon_deg
# c10: station_height_m
# c11: survey_sigma_m
# c12: orbit_err_m
# c13: clock_err_m
# c14: sise_sigma_m
# c15: sise_orbit_variance_fraction
# c16: noise_m
# c17: latency_s
# c18: quantization_bits
# c19: grid_lat_max_deg
# c20: grid_lat_step_deg
# c21: points
# c22: t_start_s
# c23: t_span_s
# c24: t_step_s
# c25: n_trials
# c26: accuracy_threshold_m
# c27: percentile
# c28: alert_limit_m
# c29: residual_sigma_m
# c30: p_hmi
# c31: seed
# c32: terrain
# c33: orbit_err_growth_m_per_s
# c34: receiver
# c35: solution
seg-facc442295f1 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>.

# text
seg-8a2f6f535c4a = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>lunar-station-coverage</a1>.

# text
# c1: user
# c2: beacons
# c3: n_satellites
# c4: comparison_n_satellites
# c5: epoch_s
# c6: elevation_mask_deg
# c7: clock_sync_m
# c8: multipath_m
# c9: survey_m
seg-a790c54ac1aa = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

# text
seg-4efffcd615df = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>lunar-beacon</a1>.

# text
# c1: frame
# c2: time_system
# c3: n_states
# c4: epoch
# c5: step_min
# c6: object
seg-720d0bbeaf6e = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-019ca0f1051e = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>lunar-interop-export</a1>.

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: rel_tol
# c6: spatial
# c7: sigma_range_m
# c8: family
# c9: n_spacecraft
# c10: sigma_pos_threshold_km
seg-28695dd2ecc3 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-af5d871bc69e = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>cislunar-observability</a1>.

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: spatial
# c6: family
# c7: n_spacecraft
# c8: observable
# c9: coordinates
# c10: trials
# c11: seed
# c12: displacement_nd
# c13: recovery_factor
# c14: sigma_range_m
# c15: sigma_range_rate_mm_s
# c16: error_bound_km
# c17: max_iterations
# c18: rel_tol
seg-f646e9fd7553 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-5e7bd8bb1adf = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>cislunar-arc-recovery</a1>.

# text
# c1: afs_eirp_dbw
# c2: user_gain_dbi
# c3: slant_range_m
# c4: slant_range_max_m
# c5: carrier_hz
# c6: gps_reference_dbw
# c7: gps_reference_min_dbw
# c8: afs_isotropic_signal_dbw
# c9: transmitter_altitude_m
# c10: transmitter_power_dbw
# c11: antenna_diameter_m
# c12: footprint_grid
# c13: spoof_power_advantage_db
# c14: spoof_code_offset_chips
# c15: attacker_gain_dbi
# c16: spoof_capture_js_db
# c17: jam_denial_js_db
# c18: standoffs_m
# c19: mast_height_m
# c20: user_antenna_height_m
# c21: footprint_altitude_min_m
# c22: footprint_altitude_max_m
# c23: footprint_altitude_steps
# c24: footprint_altitude_scale
# c25: footprint_diameter_min_m
# c26: footprint_diameter_max_m
# c27: footprint_diameter_steps
# c28: footprint_diameter_scale
seg-3c514f3acc78 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>.

# text
seg-00b06a4fc0e0 = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>lunar-attack-surface</a1>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: site_lat_deg
# c7: site_lon_deg
# c8: site_alt_m
# c9: horizon_hours
# c10: step_min
# c11: elev_mask_deg
# c12: sat_eirp_dbw
# c13: carrier_hz
# c14: chip_rate_hz
# c15: user_boresight_gain_dbi
# c16: temp_k
# c17: tracking_threshold_dbhz
# c18: degraded_margin_db
# c19: jammer
seg-079d2bb805f1 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

# text
seg-63d4157e2294 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>lunar-jamming</a1>.

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
seg-7bb977529f30 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

# text
seg-287f89e6bf6b = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>earth-gnss-lunar</a1>.

# text
# c1: study
# c2: seed
# c3: orbit
# c4: gnss
# c5: ground
# c6: monte_carlo
# c7: surface
# c8: llr
# c9: orbiter
# c10: gravimeter
# c11: clock
# c12: techniques
# c13: nominal
seg-f7ed8b60e7d1 = Champs obligatoires : <c1/>. Facultatifs : <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-41e50e49da99 = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>lunar-infrastructure</a1>.

# text
seg-09f7f99d04a6 = <s1>Précédent</s1>Navigation en orbite basse

# text
seg-74c6bf83988e = <s1>Suivant</s1>Analyse de mission, liaisons et opérations spatiales
