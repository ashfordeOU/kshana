# site-js.ftl (fr): translations

js-app-engine-failed = Le moteur n'a pas pu se charger ({ $reason }).

js-ledger-rows =
    { $n ->
        [one] { $n } ligne du registre
        [many] { $n } de lignes du registre
       *[other] { $n } lignes du registre
    }

js-site-action-copy-install = Copier : cargo install kshana

js-site-action-launch = Lancer { $name }

js-site-action-licence = Nous parler d'une licence commerciale

js-site-action-pro-eval = Demander une évaluation de Kshana Pro

js-site-action-study = Demander une étude

js-site-action-theme = Basculer entre le thème clair et le thème sombre

js-site-capabilities-bd-after = { $m } m après { $s } s

js-site-capabilities-bd-combined = combiné

js-site-capabilities-bd-crossing = { $m } m à { $s } s

js-site-capabilities-bd-fig-crossing = «{ $m } m» après { $s } s, dominé par { $dom }

js-site-capabilities-bd-fig-lead = Temps écoulé depuis la perte du GNSS sur l'axe logarithmique, une IMU de classe { $grade } à { $speed } m/s :

js-site-capabilities-bd-fig-tail = Les lignes sont les lois de croissance du moteur en marche libre courte et leur racine de la somme des carrés ; les croisements proviennent de son modèle d'erreur complet à neuf états (Schuler), qui borne les termes de biais, de sorte que, en marche libre longue, chaque croisement survient un peu plus tard que la ligne ne l'atteint. Les barres : les mêmes croisements pour quatre classes d'IMU.

js-site-capabilities-cd-canvas-aria = Constellation autour de son corps, imagerie réelle : faire glisser ou utiliser les flèches pour tourner, plus et moins pour zoomer

js-site-capabilities-cd-design-meta = { $n } satellites · { $body } · { $file }

js-site-capabilities-cd-foot-frozen = Chaque satellite suit la trace propre du moteur ; le rayon de l'orbite gelée provient des éléments de la couche.

js-site-capabilities-cd-foot-mean-motion = Chaque satellite suit la trace propre du moteur, au rayon que lui impose son mouvement moyen.

js-site-capabilities-cd-foot-walker = Les { $n } satellites sont placés d'après les paramètres Walker propres aux couches (vérifiés par rapport aux { $shown } traces du moteur : pire écart { $deg }°) ; les sillages sont les { $shown } traces du moteur.

js-site-capabilities-cd-hud-body = { $body } · «{ $n }» satellites

js-site-capabilities-cd-hud-mission = Mission «{ $time }»

js-site-capabilities-cd-legend-shell = couche { $n } · { $inc }°

js-site-capabilities-cd-map-availability = Part de l'exécution avec PDOP ≤ { $limit } (0 à 100 %)

js-site-capabilities-cd-map-pdop = PDOP moyen par cellule de { $step }° ({ $lo } à { $hi } ; plus clair est meilleur)

js-site-capabilities-cd-map-visible = Nombre moyen de satellites en vue ({ $lo } à { $hi })

js-site-capabilities-cd-metric-availability = Disponibilité

js-site-capabilities-cd-metric-pdop = PDOP moyen

js-site-capabilities-cd-metric-visible = En vue

js-site-capabilities-cd-no-webgl = La vue 3D nécessite WebGL ; la carte de couverture et les chiffres proviennent de la même exécution.

js-site-capabilities-cd-pause = Mettre les orbites en pause

js-site-capabilities-cd-play = Lancer les orbites

js-site-capabilities-cd-shell = { $name } : Walker { $pattern } { $total }/{ $planes }/{ $phasing } · { $alt } km · { $inc }°

js-site-capabilities-cd-slots = { $name } : { $n } satellites, table des emplacements de l'opérateur

js-site-capabilities-cd-span = sur { $dur }, en boucle

js-site-capabilities-cd-stat-in-view = En vue en moyenne

js-site-capabilities-cd-stat-mask = Masque · exécution

js-site-capabilities-cd-stat-median = PDOP médian

js-site-capabilities-cd-stat-pdop = PDOP ≤ { $limit }, { $body } entier

js-site-capabilities-cd-stat-satellites = Satellites

js-site-capabilities-cd-stat-worst = Pire site

js-site-capabilities-cd-title-gnss = Quatre GNSS ensemble

js-site-capabilities-cd-title-leo = Méga-constellation en orbite terrestre basse

js-site-capabilities-cd-title-lunar = Ensemble de relais lunaires

js-site-capabilities-cd-work-ratio = { $pct } % après le préfiltre de latitude · { $dop } solutions DOP

js-site-capabilities-cd-work-tests = { $after } tests satellite-point au lieu des { $brute } qu'un balayage exhaustif ferait

js-site-capabilities-cd-work-title = Travail de visibilité

js-site-capabilities-cg-cn0-sub = C/N0 par rapport au seuil de poursuite

js-site-capabilities-cg-cn0-title = Densité porteuse sur bruit

js-site-capabilities-cg-compose-availability = Disponibilité

js-site-capabilities-cg-compose-fewest = Moins de satellites suivis

js-site-capabilities-cg-compose-js = J/S moyen

js-site-capabilities-cg-compose-text = Un brouilleur, { $power } { $unit }, à un endroit, lié à { $n } exécutions membres de type ‹{ $kind }› : un navire dans un détroit et une voiture sur une route côtière voient la même cause et obtiennent des réponses différentes.

js-site-capabilities-cg-log-campaign = campagne { $file } · { $phases } phases · { $runs } exécutions membres

js-site-capabilities-cg-log-phase = la phase { $name } commence

js-site-capabilities-cg-log-phase-carries = la phase { $name } commence · reprend { $carried }

js-site-capabilities-cg-monte-axis = erreur finale d'horloge sur { $n } graines ({ $path })

js-site-capabilities-cg-monte-ci = Moyenne, intervalle à 95 %

js-site-capabilities-cg-monte-mean = Moyenne

js-site-capabilities-cg-monte-p05 = 5e

js-site-capabilities-cg-monte-p05-p95 = 5e à 95e

js-site-capabilities-cg-monte-p50 = médiane

js-site-capabilities-cg-monte-p95 = 95e

js-site-capabilities-cg-monte-std = Écart type

js-site-capabilities-cg-monte-text = Le même scénario de type ‹{ $kind }› exécuté { $n } fois à partir de la graine de base { $seed }, une graine par exécution : la dispersion de l'erreur finale de l'horloge en marche libre, avec son intervalle de confiance à 95 % sur la moyenne.

js-site-capabilities-cg-not-in-phase = pas dans cette phase

js-site-capabilities-cg-now = Phase { $n } sur { $total } : { $name } · { $from } à { $to }

js-site-capabilities-cg-phase-title = { $name } : { $from } à { $to } · terminée par { $by } · types membres { $kinds }

js-site-capabilities-cg-pl-sub = par rapport à la limite d'alerte

js-site-capabilities-cg-pl-title = Niveau de protection

js-site-capabilities-cg-pos-sub = par rapport à son budget · log

js-site-capabilities-cg-pos-title = Erreur de position inertielle

js-site-capabilities-cg-range = { $lo } à { $hi }

js-site-capabilities-cg-sweep-all-lost = Tous perdus à partir de

js-site-capabilities-cg-sweep-axis = puissance d'émission du brouilleur ({ $key })

js-site-capabilities-cg-sweep-first-loss = Première perte

js-site-capabilities-cg-sweep-lg-availability = disponibilité

js-site-capabilities-cg-sweep-lg-js = J/S moyen

js-site-capabilities-cg-sweep-never = jamais

js-site-capabilities-cg-sweep-nodes = Nœuds

js-site-capabilities-cg-sweep-none = aucun

js-site-capabilities-cg-sweep-span = Plage de J/S

js-site-capabilities-cg-sweep-text = Un scénario de type ‹{ $kind }›, exécuté une fois par nœud tandis que la puissance d'émission du brouilleur passe par paliers de { $from } à { $to } { $unit }. La disponibilité sous brouillage (trait plein) et le J/S moyen (tirets) proviennent des figures de mérite propres à chaque exécution membre.

js-site-capabilities-cg-te-sub = par rapport à sa borne de garde

js-site-capabilities-cg-te-title = Erreur de temps de l'horloge

js-site-capabilities-copy = Copier

js-site-capabilities-copy-aria = Copier la commande qui reproduit l'exécution : kshana { $file }

js-site-capabilities-cz-best = Meilleur PDOP

js-site-capabilities-cz-failed = L'exécution enregistrée n'a pas pu être chargée ici ; ouvrez-la plutôt dans le Studio.

js-site-capabilities-cz-fix = Échantillons avec solution de position

js-site-capabilities-cz-fix-value = { $n } sur { $total } ({ $pct } %)

js-site-capabilities-cz-median = PDOP médian

js-site-capabilities-engine = Moteur v{ $version }

js-site-capabilities-engine-build = Moteur v{ $version }, build

js-site-capabilities-engine-report = Rapport du moteur

js-site-capabilities-globe-aria = { $name } sur son imagerie réelle ({ $credit }). Faites glisser ou utilisez les flèches pour la tourner ; plus et moins zooment.

js-site-capabilities-ho-ends = l'exécution se termine à { $t }

js-site-capabilities-ho-past-guard = au-delà de la borne de garde

js-site-capabilities-no-seed = déterministe, sans graine

js-site-capabilities-open-in-studio = Ouvrir dans { $studio }

js-site-capabilities-open-report = Ouvrir le rapport du moteur

js-site-capabilities-orrery-aria = Le système solaire à l'époque de l'exécution : faire glisser ou utiliser les flèches pour tourner, plus et moins pour zoomer

js-site-capabilities-orrery-bodies = { $n } corps · observateur «{ $observer }»

js-site-capabilities-orrery-epoch = Époque «{ $epoch }» · TDB (Barycentric Dynamical Time), date julienne { $jd }

js-site-capabilities-pnt-chart-title = relais en vue (ligne) · Terre au-dessus de l'horizon (zone ombrée) · quatre nécessaires pour une solution de position

js-site-capabilities-pnt-kicker = Positionnement près de ce corps · type body-pnt

js-site-capabilities-pnt-lander = Un atterrisseur à { $lat }°, { $lon }° à la surface navigue grâce aux relais, avec une mesure de distance aller-retour depuis la Terre chaque fois que la Terre est au-dessus de l'horizon (temps de lumière aller { $min } min). Disponibilité : { $a } % avec les relais seuls, { $b } % avec la liaison avec la Terre.

js-site-capabilities-pnt-orbiter = Un utilisateur en orbite navigue grâce aux relais, avec une mesure de distance aller-retour depuis la Terre chaque fois que la Terre est au-dessus de l'horizon (temps de lumière aller { $min } min). Disponibilité : { $a } % avec les relais seuls, { $b } % avec la liaison avec la Terre.

js-site-capabilities-pnt-relays = { $n } relais à { $alt } km autour de { $body }

js-site-capabilities-report-data = Rapport et données

js-site-capabilities-result-data = Données de résultat

js-site-capabilities-saved = { $name } enregistré

js-site-capabilities-scenario-file = Fichier de scénario

js-site-capabilities-seed = graine { $seed }

js-site-capabilities-six-clock-fig = «{ $id }» tient la borne de garde pendant { $dur }

js-site-capabilities-six-clock-guard = borne de garde de { $v } ns

js-site-capabilities-six-coast-budget = budget de { $m } m

js-site-capabilities-six-coast-denied = GNSS refusé

js-site-capabilities-six-coast-fig = «{ $id }» dans le budget pendant { $s } s

js-site-capabilities-six-floor = seuil de poursuite

js-site-capabilities-six-integ-fig = «{ $ok }» époques disponibles sur { $n } · limites d'alerte { $h } m à l'horizontale, { $v } m à la verticale

js-site-capabilities-six-integ-limit = limite d'alerte verticale

js-site-capabilities-six-integ-pl = niveau de protection vertical (trait plein) et horizontal (tirets)

js-site-capabilities-six-jam-effective = effectif, { $n } satellites

js-site-capabilities-six-jam-fig = Suivis «{ $min }» sur { $max } en vue · disponibilité sous brouillage «{ $av }» (nominale { $nom }) · J/S moyen «{ $js } dB»

js-site-capabilities-six-jam-nominal = nominal, sans brouilleur (tirets)

js-site-capabilities-six-orbit-fig = Altitude «{ $lo }–{ $hi } km» · trace au sol sur { $dur }

js-site-capabilities-six-orbit-label = { $source } · { $n } échantillons

js-site-capabilities-six-orbit-sgp4 = SGP4 à partir d'un jeu d'éléments à deux lignes

js-site-capabilities-six-spoof-detects = { $id } détecte

js-site-capabilities-six-spoof-fig = «{ $id }» détecte à { $s } s (borne { $ns } ns)

js-site-capabilities-ss-angle = Angle par rapport au Soleil

js-site-capabilities-ss-credit = Imagerie : { $credits }. * La carte s'arrête avant les pôles ; la lacune prend la couleur polaire moyenne de la carte. Anneaux de Saturne : { $ring } ({ $licence }).

js-site-capabilities-ss-days = { $v } jours

js-site-capabilities-ss-frame-origin = Origine du référentiel

js-site-capabilities-ss-from-sun = Depuis le Soleil

js-site-capabilities-ss-gloss = NAIF : le code de corps de la Navigation and Ancillary Information Facility de la NASA. GM : paramètre gravitationnel. J2 : terme d'aplatissement. Pôle UAI : le pôle de rotation de l'Union astronomique internationale, en ascension droite (RA) et déclinaison (Dec).

js-site-capabilities-ss-j2-none = aucun publié

js-site-capabilities-ss-kind = { $class } · NAIF { $naif }

js-site-capabilities-ss-kind-of = { $class } de { $parent } · NAIF { $naif }

js-site-capabilities-ss-light-time = Temps de lumière depuis { $observer }

js-site-capabilities-ss-link = { $from } vers { $to }, temps de lumière aller { $one }, aller-retour { $two }

js-site-capabilities-ss-links-lead =
    { $n ->
        [one] Liaison que calcule cette exécution :
        [many] Liaisons que calcule cette exécution :
       *[other] Liaisons que calcule cette exécution :
    }

js-site-capabilities-ss-moons =
    { $n ->
        [one] Sa lune, à l'échelle, à l'époque
        [many] Ses lunes, à l'échelle, à l'époque
       *[other] Ses lunes, à l'échelle, à l'époque
    }

js-site-capabilities-ss-nominal-error = erreur nominale de { $km } km en distance

js-site-capabilities-ss-north = Vu du nord de l'écliptique.

js-site-capabilities-ss-period = Période orbitale

js-site-capabilities-ss-period-about = Période autour de { $parent }

js-site-capabilities-ss-pole = Pôle UAI (RA, Dec)

js-site-capabilities-ss-radius = Rayon moyen

js-site-capabilities-ss-retrograde = { $v } h, rétrograde

js-site-capabilities-ss-rotation = Rotation sidérale

js-site-capabilities-ss-years = { $v } ans

js-site-capabilities-st-bound = borne de { $v } m

js-site-capabilities-st-fig-none = { $n } époques, aucune avec l'erreur au-dessus de sa borne. En abscisse : l'erreur de position réelle ; en ordonnée : le niveau de protection ; les deux sur des axes logarithmiques.

js-site-capabilities-st-fig-some = { $n } époques, { $k } avec l'erreur au-dessus de sa borne. En abscisse : l'erreur de position réelle ; en ordonnée : le niveau de protection ; les deux sur des axes logarithmiques.

js-site-capabilities-st-limit = limite d'alerte { $m } m

js-site-capabilities-st-misleading = trompeur : erreur au-dessus de la borne

js-site-capabilities-st-normal = fonctionnement normal

js-site-capabilities-st-unavailable = indisponible : borne au-dessus de la limite

js-site-capabilities-studio-embedded = { $studio }, intégré : l'exécution orbit-multignss

js-site-capabilities-studio-load = Charger { $studio } ici

js-site-capabilities-studio-outline = Afficher de nouveau le plan

js-site-capabilities-wave-chirp = chirp

js-site-capabilities-wave-cw = tonalité CW

js-site-capabilities-wave-noise = bruit

js-site-capabilities-wf-an-caption = ligne T+{ $t } s · dB au-dessus du seuil, échelle logarithmique · pic de toute la grille { $peak } dB

js-site-capabilities-wf-degraded = Dégradé

js-site-capabilities-wf-degraded-low = dégradé

js-site-capabilities-wf-failed = L'exécution enregistrée n'a pas pu être chargée ici.

js-site-capabilities-wf-grid = grille

js-site-capabilities-wf-iq = À T+{ $t } s, le moteur trace aussi le modèle sous forme de { $n } échantillons IQ (en phase et en quadrature) autour de { $mhz } MHz et lui confronte une estimation de Welch ({ $segments } segments de { $nfft }) : rapport de puissance intégrée { $ratio }.

js-site-capabilities-wf-jammer-off = { $what } éteint

js-site-capabilities-wf-jammer-on = { $what } allumé

js-site-capabilities-wf-jammer-open = { $name } · { $mhz } MHz · de { $on } s jusqu'à la fin

js-site-capabilities-wf-jammer-span = { $name } · { $mhz } MHz · { $on }–{ $off } s

js-site-capabilities-wf-lost = Accrochage perdu

js-site-capabilities-wf-lost-low = accrochage perdu

js-site-capabilities-wf-max = { $peak } dB au-dessus · échelle logarithmique à partir de { $v0 } dB

js-site-capabilities-wf-no-jammer = pas de brouilleur

js-site-capabilities-wf-now = maintenant

js-site-capabilities-wf-pause = Mettre la cascade en pause

js-site-capabilities-wf-peak = pic { $v } dB

js-site-capabilities-wf-play = Lancer la cascade

js-site-capabilities-wf-replay-previous = début de la relecture · passage précédent en dessous

js-site-capabilities-wf-replay-start = début de la relecture

js-site-capabilities-wf-say = T+{ $t } s, { $band } { $v } dB-Hz, { $state }

js-site-capabilities-wf-signal = signal +{ $v } dB

js-site-capabilities-wf-summary = Exécution enregistrée de { $file } : { $bands } bandes, { $jammers } brouilleurs sur { $seconds } secondes. La pire bande, { $worst }, tombe à { $min } dB-Hz à { $at } s ; seuil de poursuite { $floor } dB-Hz.

js-site-capabilities-wf-tip-above = { $v } dB au-dessus du seuil de bruit

js-site-capabilities-wf-tip-in = dans { $bands }

js-site-capabilities-wf-tracking = Poursuite

js-site-capabilities-wf-tracking-low = poursuite

js-site-caphero-aria = Le système solaire d'après l'exécution solaire du moteur au { $date } : le Soleil et { $bodies } corps qui se déplacent le long des traces orbitales du moteur ; { $valid } des orbites sont validées par rapport à JPL Horizons.

js-site-caphero-clock = +{ $days } jours · { $date }

js-site-caphero-copy-command = Copier la commande

js-site-caphero-copy-title = Copier la commande qui la reproduit

js-site-caphero-credits = Distances compressées sur une échelle logarithmique, directions exactes ; corps agrandis, rotation à une cadence d'affichage. Imagerie : { $credits } ; anneaux de Saturne : { $ring } ({ $licence }).

js-site-caphero-credits-summary = Crédits d'échelle et d'imagerie

js-site-caphero-engine-build = Moteur v{ $version }, build

js-site-caphero-explore = Explorer chaque corps

js-site-caphero-file-title = Le fichier de scénario qui a été exécuté

js-site-caphero-list-item = { $name } : { $label }, { $au } au du Soleil à l'époque, période orbitale { $period }.

js-site-caphero-list-item-light = { $name } : { $label }, { $au } au du Soleil à l'époque, période orbitale { $period }, temps de lumière depuis { $observer } { $light }.

js-site-caphero-no-seed = déterministe, sans graine

js-site-caphero-open-in-studio = Ouvrir dans { $studio }

js-site-caphero-pause = Mettre les orbites en pause

js-site-caphero-period-days = { $value } jours

js-site-caphero-period-years = { $value } ans

js-site-caphero-play = Lancer les orbites

js-site-caphero-rate = { $days } jours de l'exécution par seconde

js-site-caphero-rate-epoch = L'image à l'époque de l'exécution

js-site-caphero-read-distance = { $au } au du Soleil

js-site-caphero-read-light = temps de lumière depuis { $observer } à l'époque { $light }

js-site-caphero-read-orbit = orbite { $period }

js-site-caphero-seed = graine { $seed }

js-site-copy-aria = Copier : { $cmd }

js-site-developers-captured-from = capturé { $recorded } à partir de

js-site-developers-engine-build = Moteur v{ $version }, build

js-site-developers-exit-stamp = sortie { $rc } · { $ms } ms

js-site-developers-file-open-in-studio = { $file } : ouvrir dans { $studio }

js-site-developers-no-seed = (déterministe, sans graine)

js-site-developers-open-in-studio = Ouvrir dans { $studio }

js-site-developers-pause = Mettre la relecture en pause

js-site-developers-play = Lancer la relecture

js-site-developers-replaying = # relecture de la session enregistrée

js-site-developers-seed = (graine { $seed })

js-site-developers-what-runs-write = Ce que chaque exécution écrit

js-site-editions-builds-on-it = { $label } s'appuie dessus

js-site-editions-core-kinds =
    { $n ->
        [one] { $n } type
        [many] { $n } de types
       *[other] { $n } types
    }

js-site-editions-core-title = Noyau ouvert

js-site-editions-core-validated = validés

js-site-editions-core-validated-of = { $validated } sur { $total }

js-site-editions-free-core = Gratuit dans le noyau ouvert, comme tous les types

js-site-editions-group-other = Autres

js-site-editions-kind-no-ledger = aucun module du registre ne lui correspond par son nom

js-site-editions-kind-validated = { $v } lignes du registre sur { $tot } validées

js-site-editions-pause = Mettre les anneaux en pause

js-site-editions-play = Lancer les anneaux

js-site-editions-ring-pro = Kshana Pro

js-site-editions-ring-study = Étude sur mesure

js-site-evidence-allan-aria = Quatre écarts-types du jeu de données de 1000 points NIST SP 1065 en fonction du temps de moyennage ; les { $n } valeurs publiées sont toutes reproduites, pire erreur relative { $err }

js-site-evidence-allan-lg-published = valeur publiée, SP 1065 tableau 31

js-site-evidence-allan-mdev = écart-type d'Allan modifié

js-site-evidence-allan-na = n/d

js-site-evidence-allan-oadev = écart-type d'Allan avec recouvrement

js-site-evidence-allan-ohdev = écart-type d'Hadamard avec recouvrement

js-site-evidence-allan-read = { $tau } s · Allan { $oadev } · modifié { $mdev } · Hadamard { $ohdev }

js-site-evidence-allan-st-gate = le seuil du test

js-site-evidence-allan-st-reproduced = valeurs publiées reproduites

js-site-evidence-allan-st-worst = pire erreur relative

js-site-evidence-allan-tdev = écart de temps, en secondes

js-site-evidence-allan-tip-at = «{ $name }» à { $m } s

js-site-evidence-allan-tip-engine = moteur : «{ $got }» · erreur relative { $err }

js-site-evidence-allan-tip-table = SP 1065 tableau 31 : «{ $want }»

js-site-evidence-cell-tip = Capacité { $i } sur { $n } · «{ $label }»

js-site-evidence-cowell-aria = Différence de position par rapport à Orekit sur 24 heures : les niveaux de force 1 à 5 restent sous { $worst } ; le niveau de traînée atteint { $drag }, une bande de caractérisation

js-site-evidence-cowell-gto = orbite de transfert géostationnaire

js-site-evidence-cowell-leo = orbite terrestre basse

js-site-evidence-cowell-lg-con = niveaux 1 à 5, deux corps jusqu'à la pression de radiation solaire, deux orbites chacun

js-site-evidence-cowell-lg-drag = niveau 6, traînée : caractérisation seulement (modèles de densité différents)

js-site-evidence-cowell-read = { $h } h · niveaux 1 à 5 pire { $con } · traînée { $drag }

js-site-evidence-cowell-st-drag = niveau de traînée, pire

js-site-evidence-cowell-st-epochs = époques des niveaux 1 à 5

js-site-evidence-cowell-tip-tier = «Niveau { $tier } : { $label }» · { $regime }

js-site-evidence-cowell-tip-worst = pire différence «{ $err }» à { $h } h

js-site-evidence-hero-live = { $label }. { $cap }. { $oracle }

js-site-evidence-hero-no-oracle = Aucune référence indépendante externe nommée.

js-site-evidence-hero-oracle = Référence indépendante

js-site-evidence-hero-oracle-is = Référence indépendante : { $o }

js-site-evidence-hero-owner = Propriétaire

js-site-evidence-hero-partner = Un partenaire en est propriétaire ; le moteur n'en revendique rien.

js-site-evidence-hero-pause = Mettre le balayage en pause

js-site-evidence-hero-play = Lancer le balayage

js-site-evidence-hero-row = Ligne { $i } sur { $n }

js-site-evidence-hold-accepted = accepté : dans un facteur de { $bar }

js-site-evidence-hold-aria = Erreur de temps quadratique moyenne mesurée de l'horloge au césium en fonction du temps de marche libre, avec la prédiction du moteur ; le rapport prédit sur mesuré franchit la limite de { $lo } à { $hi }

js-site-evidence-hold-control = «Contrôle :» la prédiction naïve (la stabilité à une seconde lue comme un bruit blanc de fréquence) donne un rapport de { $ratio }, à côté d'un facteur d'environ { $factor }, et échoue au même seuil. Le seuil a du mordant.

js-site-evidence-hold-lg-meas = mesuré sur l'enregistrement réservé (point : franchissement)

js-site-evidence-hold-lg-pred = prédit à partir du premier tiers (anneau : franchissement)

js-site-evidence-hold-nodata = L'enregistrement mesuré n'était pas disponible lors de la génération de cette page.

js-site-evidence-hold-perfect = 1 = parfait

js-site-evidence-hold-ratio-aria = Prédit sur mesuré pour { $n } seuils, tous dans le facteur accepté de { $bar }

js-site-evidence-hold-read = marche libre { $h } h · mesuré { $m } ns · prédit { $p } ns

js-site-evidence-hold-st-fit = utilisé pour l'ajustement

js-site-evidence-hold-st-samples = échantillons à une seconde

js-site-evidence-hold-st-syncs = points de synchronisation réservés

js-site-evidence-hold-tip-breach = franchissement prédit { $p } s · mesuré { $m } s

js-site-evidence-hold-tip-error = «Erreur de temps { $thr } ns»

js-site-evidence-hold-tip-ratio = prédit sur mesuré «{ $ratio }»

js-site-evidence-hold-tip-row = «{ $thr } ns» · prédit sur mesuré «{ $ratio }»

js-site-evidence-kernel-chi2-cdf = loi du khi carré

js-site-evidence-kernel-chi2-quantile = quantile du khi carré

js-site-evidence-kernel-noncentral = khi carré non centré

js-site-evidence-kernel-normal-cdf = loi normale

js-site-evidence-kernel-normal-quantile = quantile de la loi normale

js-site-evidence-kernel-pbias = biais de détection

js-site-evidence-ladder-aria = Résidus d'orbite de { $lo } à { $hi } m sur une seule échelle logarithmique, avec le seuil d'agence de { $bar } m

js-site-evidence-ladder-bar = seuil d'agence { $bar } m

js-site-evidence-ladder-cowell = Cowell face à Orekit 12.2, pire

js-site-evidence-ladder-g24 = Galileo E11, ajustement sur 24 heures

js-site-evidence-ladder-g8 = Galileo E11, ajustement sur 8 heures

js-site-evidence-ladder-lg-headline = résidu principal

js-site-evidence-ladder-lg-over = au-delà du seuil d'agence de { $bar } m

js-site-evidence-ladder-lg-ring = modèle de forces seul, avant les accélérations empiriques

js-site-evidence-ladder-lro = Lunar Reconnaissance Orbiter, ajustement sur 4 heures

js-site-evidence-ladder-read = balayage à { $v } · { $n } résidus principaux sur { $total } à ce niveau ou en dessous

js-site-evidence-ladder-rt-arc = arc { $arc } · degré et ordre { $do } · { $n } observations

js-site-evidence-ladder-rt-rtn = radial { $r } m · le long de la trace { $a } m · transversal { $c } m

js-site-evidence-ladder-sgp4 = SGP4 face aux vecteurs AIAA, pire

js-site-evidence-ladder-swarm = Swarm-A, ajustement sur 3 heures

js-site-evidence-ladder-tip-cowell = «Cowell · pire de { $n } époques» · { $worst }

js-site-evidence-ladder-tip-g24 = «Galileo E11 · une journée entière» · { $rms } m

js-site-evidence-ladder-tip-g8a = «Galileo E11 · modèle de forces seul» · { $rms } m

js-site-evidence-ladder-tip-g8b = «Galileo E11 · avec accélérations empiriques» · { $rms } m

js-site-evidence-ladder-tip-lrd = «Orbiteur lunaire · dynamique» · { $rms } m

js-site-evidence-ladder-tip-lrr = «Orbiteur lunaire · dynamique réduite» · { $rms } m, au-dessus du seuil de { $bar } m et rapporté tel quel

js-site-evidence-ladder-tip-sgp4 = «SGP4 · pire de { $n } vecteurs» · { $worst }

js-site-evidence-ladder-tip-swd = «Swarm-A · dynamique» · { $rms } m, presque entièrement le long de la trace (traînée)

js-site-evidence-ladder-tip-swr = «Swarm-A · dynamique réduite» · { $rms } m

js-site-evidence-raim-aria = { $pass } cas SciPy sur { $n } dans leur bande de tolérance, sur { $kernels } noyaux

js-site-evidence-raim-lane = { $kernel } · { $n }

js-site-evidence-raim-lg-most = la plus grande part d'une bande qu'un cas utilise

js-site-evidence-raim-read = cas { $q } sur { $n } · { $kernel } · { $what }

js-site-evidence-raim-read-band = { $pct } % de la bande

js-site-evidence-raim-scale-aria = Échelle de couleurs : part de la bande de tolérance utilisée, logarithmique de 10 puissance moins 11 jusqu'au bord de la bande

js-site-evidence-raim-st-inside = dans la bande

js-site-evidence-raim-st-most = plus grande part d'une bande utilisée

js-site-evidence-raim-tick-edge = bord de la bande

js-site-evidence-raim-tick-exact = exact

js-site-evidence-raim-tip-case = «{ $kernel }» · cas { $j } sur { $n }

js-site-evidence-raim-tip-exact = «correspondance exacte» avec SciPy

js-site-evidence-raim-tip-uses = utilise «{ $pct } %» de sa bande de tolérance

js-site-evidence-sgp4-aria = { $n } vecteurs AIAA sur { $n } reproduits ; pire { $worst }, médiane { $median }, tous dans la tolérance { $tol }

js-site-evidence-sgp4-deep = espace lointain (SDP4)

js-site-evidence-sgp4-lg-deep = vecteur d'espace lointain (SDP4)

js-site-evidence-sgp4-lg-median = médiane et pire sur l'échelle

js-site-evidence-sgp4-lg-near = vecteur proche de la Terre (SGP4)

js-site-evidence-sgp4-near = proche de la Terre (SGP4)

js-site-evidence-sgp4-read = vecteur { $i } sur { $n } · satellite { $sat } · erreur { $err }

js-site-evidence-sgp4-read-deep = vecteur { $i } sur { $n } · satellite { $sat }, espace lointain · erreur { $err }

js-site-evidence-sgp4-scale-aria = Échelle de couleurs de 0,1 micromètre à la tolérance, logarithmique

js-site-evidence-sgp4-st-deep = vecteurs d'espace lointain

js-site-evidence-sgp4-st-sats = satellites de test

js-site-evidence-sgp4-tip-sat = «Satellite { $sat }» · { $kind }

js-site-evidence-sgp4-tip-vector = vecteur { $j } sur { $n } · erreur de position «{ $err }»

js-site-evidence-st-median = médiane

js-site-evidence-st-worst = pire

js-site-evidence-tolerance = tolérance { $v }

js-site-filter-in-all = { $total } au total

js-site-filter-matches =
    { $n ->
        [one] { $n } résultat
        [many] { $n } de résultats
       *[other] { $n } résultats
    }

js-site-filter-n-of-m = { $n } sur { $total }

js-site-filter-n-of-m-rows = { $n } lignes sur { $total }

js-site-filter-rows = { $total } lignes

js-site-home-banner-gnss-lost = GNSS perdu · holdover

js-site-home-banner-holdover-out = Holdover · horloge hors de la borne de garde

js-site-home-banner-integrity-holdover = Alarme d'intégrité · le holdover continue

js-site-home-banner-integrity-none = Alarme d'intégrité · pas de niveau de protection

js-site-home-banner-integrity-pl = Alarme d'intégrité · PL > AL

js-site-home-banner-jamming = Brouillage · C/N0 près du seuil

js-site-home-banner-spoofing = Alarme de leurrage · détecteur RF

js-site-home-cap-holdover = Le brouilleur passe à { $dbw } dBW : { $trk } satellites suivis. L'horloge dérive librement à partir des { $carry } ns laissées par l'émetteur de leurrage et franchit sa borne de garde de { $guard } ns à { $at } ; l'INS poursuit en marche libre.

js-site-home-cap-integrity = Les satellites reviennent, mais seulement au-dessus d'un masque de { $mask }° : { $trk } suivis. Le niveau de protection dépasse la limite d'alerte de { $al } m ou ne peut pas être formé, donc le moniteur déclenche l'alarme et l'horloge reste en holdover.

js-site-home-cap-jamming = Un brouilleur à large bande à { $km } km, à { $dbw } dBW. Le C/N0 tombe à { $cn } dB-Hz, soit { $above } dB au-dessus du seuil de poursuite de { $floor } dB-Hz ; les { $trk } satellites restent tous suivis.

js-site-home-cap-nominal = { $trk } satellites suivis avec un C/N0 moyen de { $cn } dB-Hz. L'horloge est asservie au temps GNSS et le niveau de protection ({ $pl } m) se situe sous la limite d'alerte de { $al } m.

js-site-home-cap-recovery = GNSS resynchronisé : { $trk } satellites suivis, erreur de temps revenue à { $te } ns, niveau de protection { $pl } m.

js-site-home-cap-spoofing = Un émetteur de leurrage décale l'horloge du récepteur de { $rate } ns/s. Le détecteur RF (radiofréquence) déclenche l'alarme aussitôt ; le moniteur assisté par l'horloge se déclenche après { $det } s, et la phase se termine avec { $off } ns de décalage.

js-site-home-cn-no-lock = 0 sur { $max } suivi · pas d'accrochage

js-site-home-cn-tracking = { $n } sur { $max } suivis

js-site-home-no-pl = pas de PL

js-site-home-pause = Mettre la mission en pause

js-site-home-pl-alarm = alarme · PL au-dessus de l'AL

js-site-home-pl-no-sats = pas de satellites, pas de PL

js-site-home-pl-not-computed = non calculé dans cette phase

js-site-home-pl-too-few = trop peu de satellites

js-site-home-pl-under-al = sous l'AL de { $thr } m

js-site-home-play = Lancer la mission

js-site-home-receiver-tracking = Récepteur · { $n } suivis

js-site-home-replay-restarted = Relecture redémarrée · { $file }

js-site-home-te-disciplined = asservie au GNSS

js-site-home-te-free-running = holdover · dérive libre

js-site-home-te-outside-guard = holdover · hors de la borne de garde

js-site-home-te-spoofer = émetteur de leurrage qui décale l'horloge

js-site-home-thr-floor = seuil

js-site-home-thr-guard = borne de garde

js-site-kind-action = Action

js-site-mcp-arguments-excerpt = arguments (extrait)

js-site-mcp-axis-mission-time = temps de mission

js-site-mcp-clock-holdover = holdover de { $clock }

js-site-mcp-dir-reply = kshana-mcp → assistant

js-site-mcp-dir-request = assistant → kshana-mcp

js-site-mcp-figcaption = Tracé à partir de la série renvoyée : l'erreur de temps de chaque horloge par rapport au seuil

js-site-mcp-fom-availability = disponibilité

js-site-mcp-fom-caption = Figures de mérite renvoyées par run_scenario, par horloge

js-site-mcp-fom-header = Figure de mérite

js-site-mcp-fom-holdover = holdover (s)

js-site-mcp-fom-p95 = erreur de temps, 95e centile (ns)

js-site-mcp-fom-rms = erreur de temps, valeur quadratique moyenne (ns)

js-site-mcp-lede = Enregistré { $recorded } · v{ $version } · entrée et sortie standard · protocole { $protocol } · messages exacts uniquement

js-site-mcp-legend-gnss-lost = GNSS perdu à { $s } s

js-site-mcp-legend-threshold = seuil { $v } ns

js-site-mcp-pause = Pause

js-site-mcp-play = Lecture

js-site-mcp-plot-aria = Erreur de temps de { $quantum } et de { $classical } renvoyée par run_scenario, par rapport au seuil de { $threshold } ns ; GNSS (système mondial de navigation par satellite) perdu à { $lost } s

js-site-mcp-recorded-json = JSON enregistré : { $label }

js-site-mcp-scenario-hash = empreinte du scénario

js-site-mcp-server-identity = identité du serveur

js-site-mcp-show-json = Afficher le JSON

js-site-mcp-step-aria = Étape { $n } sur { $total } : { $name }

js-site-mcp-step-result = résultat : figures de mérite

js-site-mcp-step-status = Étape { $n } sur { $total } · { $name }

js-site-mcp-summary-excerpt = ligne de synthèse et résultat (extrait)

js-site-mcp-tab-result = résultat

js-site-mcp-threshold = seuil

js-site-mcp-toml-lines =
    { $n ->
        [one] { $n } ligne
        [many] { $n } de lignes
       *[other] { $n } lignes
    }

js-site-mcp-toml-more = … ({ $n } lignes de plus de { $file })

js-site-mcp-tool-count =
    { $n ->
        [one] { $n } outil
        [many] { $n } d'outils
       *[other] { $n } outils
    }

js-site-mcp-tools-with-descriptions =
    { $n ->
        [one] { $n } outil avec descriptions
        [many] { $n } d'outils avec descriptions
       *[other] { $n } outils avec descriptions
    }

js-site-menu-close = Fermer le menu

js-site-menu-open = Ouvrir le menu

js-site-missions-avail-title = Disponibilité : part de l'exécution avec PDOP ≤ { $limit }

js-site-missions-avail-uniform = { $v } % dans chaque cellule

js-site-missions-chart-error-title = erreur de position (m, log)

js-site-missions-chart-four = quatre nécessaires pour une solution de position

js-site-missions-chart-four-short = quatre pour une solution

js-site-missions-chart-lg-earth = Terre visible

js-site-missions-chart-lg-error-earth = erreur, relais et distance à la Terre

js-site-missions-chart-lg-error-relays = erreur, relais seuls

js-site-missions-chart-lg-relays = relais en vue

js-site-missions-chart-relays-title = relais en vue · zone ombrée : Terre au-dessus de l'horizon

js-site-missions-chip-at-pdop = à PDOP ≤ { $limit }

js-site-missions-chip-engine = Moteur :

js-site-missions-chip-fix-earth = solution, avec la Terre

js-site-missions-chip-median-pdop = PDOP médian

js-site-missions-chip-relays = relais

js-site-missions-chip-rms = erreur RMS

js-site-missions-chip-satellites = satellites

js-site-missions-chip-tracking-held = poursuite { $label } maintenue

js-site-missions-clocks-aria = Erreur de temps après un jour de holdover, par classe d'horloge, échelle logarithmique

js-site-missions-clocks-frame = plancher du référentiel { $ns } ns

js-site-missions-clocks-note = erreur de temps après un jour, secondes (log)

js-site-missions-clocks-sigma = σy(1 s) { $sigma }

js-site-missions-clocks-title = { $clock } : { $ns } ns après un jour, σy(1 s) { $sigma }

js-site-missions-cone-aria = Cône d'erreur de position depuis la perte du GNSS

js-site-missions-cone-axis-x = temps écoulé depuis la perte du GNSS (s)

js-site-missions-cone-axis-y = erreur de position (m)

js-site-missions-cone-budget = budget de ±{ $m } m

js-site-missions-cone-clipped = écrêté à ±{ $m } m

js-site-missions-cone-leaves = en sort à { $s } s

js-site-missions-cone-readout = t { $t } s · { $errors }

js-site-missions-copy-command = Copier la commande

js-site-missions-copy-title = Copier la commande qui la reproduit

js-site-missions-deterministic = déterministe

js-site-missions-engine-build = Moteur v{ $version }, build

js-site-missions-engine-build-commit = Moteur v{ $version }, build { $commit }

js-site-missions-fp-aria = Carte de l'empreinte de brouillage. Les flèches déplacent entre les cellules, Entrée ouvre cette exécution.

js-site-missions-fp-aria-svg = Empreinte de brouillage autour du brouilleur

js-site-missions-fp-darker = plus sombre = J/S moyen plus élevé · cellules de { $step } km · { $n } exécutions du moteur

js-site-missions-fp-jammer = brouilleur

js-site-missions-fp-lg-held = poursuite maintenue

js-site-missions-fp-lg-lost = tous les satellites perdus

js-site-missions-fp-lg-some = quelques époques perdues

js-site-missions-fp-open = Ouvrir cette exécution dans { $studio }

js-site-missions-fp-read = à environ { $km } km du brouilleur · J/S moyen { $js } dB · disponibilité de la poursuite { $av }

js-site-missions-fp-ship = le navire du scénario

js-site-missions-grades-aria = Marche libre inertielle avant { $a } m et { $b } m, par classe d'IMU

js-site-missions-grades-axis = secondes de marche libre après la perte du GNSS (log)

js-site-missions-grades-point = { $grade } : { $s } s pour atteindre { $m } m ({ $why })

js-site-missions-grades-reaches = l'erreur atteint { $m } m

js-site-missions-grades-speed = à { $v } m/s

js-site-missions-grades-this = ce scénario

js-site-missions-hud-earth-link = Liaison avec la Terre

js-site-missions-hud-link-above = Liaison avec la Terre · au-dessus de l'horizon

js-site-missions-hud-link-occulted = Liaison avec la Terre · occultée

js-site-missions-hud-orbiter = Orbiteur

js-site-missions-hud-receiver = Récepteur

js-site-missions-hud-relays = Relais

js-site-missions-hud-selected-lat = latitude sélectionnée

js-site-missions-info-in-view = En vue

js-site-missions-info-in-view-value = { $mean } en moyenne · { $fewest } au minimum

js-site-missions-info-pdop-above = { $pdop }, au-dessus de { $limit }

js-site-missions-json-title = Le résultat du moteur, non modifié

js-site-missions-json-unavailable = JSON indisponible

js-site-missions-key-avail = Disponibilité

js-site-missions-key-pdop-title = PDOP moyen (dilution de précision de position)

js-site-missions-key-vis = Satellites en vue

js-site-missions-key-vis-short = En vue

js-site-missions-leo-grid = de la grille à PDOP ≤ { $limit }

js-site-missions-leo-in-view = en vue en moyenne

js-site-missions-leo-shells = satellites en quatre couches

js-site-missions-map-aria = { $title } au-dessus de { $body }, par cellule de 10 degrés. Les flèches déplacent le récepteur ; sa cellule est lue ci-dessous.

js-site-missions-map-colour-by = Colorer la carte selon

js-site-missions-map-fewest-in-view = minimum en vue

js-site-missions-map-grey = gris : pas de solution

js-site-missions-map-hatched = hachuré : au-dessus de la limite de PDOP de { $limit }

js-site-missions-map-in-view = en vue

js-site-missions-map-live = { $cell } : { $rows }

js-site-missions-map-mean-in-view = moyenne en vue

js-site-missions-map-mean-pdop = PDOP moyen

js-site-missions-map-pdop-limit = limite de PDOP { $limit }

js-site-missions-matrix-caption = Fichiers de scénario par secteur (lignes) et mode de défaillance (colonnes). Sélectionnez un nombre pour ouvrir ce secteur.

js-site-missions-matrix-cell =
    { $n ->
        [one] { $sector }, { $mode } : { $n } fichier de scénario
        [many] { $sector }, { $mode } : { $n } de fichiers de scénario
       *[other] { $sector }, { $mode } : { $n } fichiers de scénario
    }

js-site-missions-matrix-files =
    { $n ->
        [one] { $n } fichier :
        [many] { $n } de fichiers :
       *[other] { $n } fichiers :
    }

js-site-missions-matrix-sector = Secteur

js-site-missions-mode-int = Interférence

js-site-missions-mode-itg = Intégrité

js-site-missions-mode-nav = Marche libre

js-site-missions-mode-orb = Géométrie

js-site-missions-mode-spf = Leurrage

js-site-missions-mode-tim = Synchronisation temporelle

js-site-missions-n-of-total = { $n } sur { $total }

js-site-missions-no-fix = pas de solution

js-site-missions-no-seed = déterministe, sans graine

js-site-missions-open-in-studio = Ouvrir dans { $studio }

js-site-missions-open-report = Ouvrir le rapport du moteur

js-site-missions-ow-chart-aria = Réponse du récepteur sur l'exécution pour { $name } : relais en vue, et erreur de position avec les relais seuls et avec la distance à la Terre

js-site-missions-ow-chip-epochs = époques

js-site-missions-ow-chip-mask = masque

js-site-missions-ow-chip-orbiter = orbiteur

js-site-missions-ow-chip-range = distance σ

js-site-missions-ow-chip-relays = relais

js-site-missions-ow-chip-relays-value = { $planes } × { $per } à { $alt } km, { $inc }°

js-site-missions-ow-chip-span = durée

js-site-missions-ow-count-relays = { $n } relais et un orbiteur · { $body }

js-site-missions-ow-count-sats = { $n } satellites · { $body }

js-site-missions-ow-engine = moteur v{ $version } · build { $commit }

js-site-missions-ow-lat-label = Latitude du récepteur

js-site-missions-ow-map-aria = Réponse du récepteur pour { $name } : une carte de { $body } par cellule de 10 degrés, avec à côté le nombre moyen et minimal de satellites en vue et le PDOP moyen par latitude

js-site-missions-ow-note-imagery = Imagerie de { $body } : NASA.

js-site-missions-ow-note-rebuilt = Orbites : les relais et l'orbiteur reconstruits à partir du scénario exactement comme le moteur les construit ; le nombre de satellites en vue qu'ils donnent est égal à celui du moteur aux { $n } époques.

js-site-missions-ow-note-sats = Orbites : les satellites de l'exécution repropagés ici et vérifiés par rapport aux { $n } échantillons de trace au sol écrits par le moteur (pire écart { $deg }°).

js-site-missions-ow-note-scaled = Les rayons d'orbite sont mis à l'échelle pour l'affichage ; les plans, le phasage et les périodes sont ceux de l'exécution.

js-site-missions-ow-note-tracks = Le moteur a écrit des traces au sol pour { $shown } des { $total } satellites ; les { $total } sont tracés à partir de ses couches.

js-site-missions-ow-note-walker = Orbites : les couches Walker de l'exécution repropagées ici et vérifiées par rapport aux { $n } échantillons de trace au sol écrits par le moteur (pire écart { $deg }°).

js-site-missions-ow-off = désactivé

js-site-missions-ow-on = activé

js-site-missions-ow-pause = Mettre les orbites en pause

js-site-missions-ow-play = Lancer les orbites

js-site-missions-ow-time = t = { $time }

js-site-missions-ow-time-label = Temps de mission

js-site-missions-ow-valuetext = { $time }, { $n } relais en vue

js-site-missions-pdop-title = PDOP moyen (dilution de précision de position), échelle logarithmique, plus bas est meilleur

js-site-missions-report = Rapport

js-site-missions-report-title = Le rapport propre du moteur sur cette exécution

js-site-missions-ro-above-horizon = au-dessus de l'horizon

js-site-missions-ro-availability = Disponibilité, PDOP ≤ { $limit }

js-site-missions-ro-earth-light = Terre · temps de lumière { $s } s

js-site-missions-ro-error-relays = Erreur de position, relais seuls

js-site-missions-ro-occulted = occultée

js-site-missions-ro-place-availability = À { $place } : disponibilité

js-site-missions-ro-place-in-view = À { $place } : en vue, moyenne · minimum

js-site-missions-ro-relays = Relais en vue

js-site-missions-ro-satellites = Satellites

js-site-missions-ro-with-earth = Avec la distance à la Terre

js-site-missions-run-failed = L'exécution enregistrée n'a pas pu être chargée ici ; ouvrez-la dans { $studio } depuis le lien ci-dessous.

js-site-missions-seed = graine { $seed }

js-site-missions-spoof-aria = Décalage de leurrage en fonction du temps, avec la borne de détection et l'instant de détection de chaque moniteur

js-site-missions-spoof-axis-x = temps écoulé depuis le début du leurrage (s)

js-site-missions-spoof-axis-y = décalage temporel (ns)

js-site-missions-spoof-detects = { $id } détecte à { $s } s

js-site-missions-spoof-lg-bound = borne { $id }

js-site-missions-spoof-lg-offset = décalage de leurrage

js-site-missions-spoof-readout = t { $t } s · décalage { $offset } ns

js-site-missions-spoof-spec = spécification { $v } ns

js-site-missions-sr-aria = { $members } ; brouilleur partagé { $power } dBW

js-site-missions-sr-aria-member = { $label } : poursuite maintenue { $held } %, rapport brouilleur-signal moyen { $js } dB, minimum de satellites suivis { $min }

js-site-missions-sr-car = Voiture

js-site-missions-sr-fewest = minimum suivis

js-site-missions-sr-held = poursuite maintenue

js-site-missions-sr-mean-js = J/S moyen

js-site-missions-sr-ship = Navire

js-site-missions-swipe =
    { $n ->
        [one] Balayer pour voir le fichier de scénario ({ $n })
        [many] Balayer pour voir les { $n } de fichiers de scénario
       *[other] Balayer pour voir les { $n } fichiers de scénario
    }

js-site-missions-toml-download-title = Télécharger le fichier de scénario qui a été exécuté

js-site-missions-toml-title = Le fichier de scénario qui a été exécuté

js-site-missions-vis-title = Satellites en vue, moyenne sur l'exécution

js-site-missions-vis-uniform = { $v } dans chaque cellule

js-site-palette-none = Aucun résultat

js-site-palette-results = { $count } résultats

js-site-pro-band-at = À { $minutes } minutes : 5e au 95e centile

js-site-pro-band-range = { $lo } à { $hi } { $unit }

js-site-pro-band-runs-within = exécutions sur { $n } dans ±{ $limit } { $unit }

js-site-pro-design-readout = { $sat } satellites, { $av } % de disponibilité · { $planes } plans à { $alt } km, { $incl }°

js-site-pro-front-design = Conception du front { $id }

js-site-pro-front-design-knee = Conception du front { $id } · coude

js-site-pro-more-designs =
    { $n ->
        [one] (+{ $n } autre conception du front à ce point)
        [many] (+{ $n } d'autres conceptions du front à ce point)
       *[other] (+{ $n } autres conceptions du front à ce point)
    }

js-site-pro-not-rerun = non réexécuté

js-site-pro-rerun-free = réexécuté dans le moteur libre :

js-site-pro-same-sha = même SHA-256 { $sha }…

js-site-pro-same-sha-index = même SHA-256 de résultat que l'index

js-site-toast-copied = Copié : { $text }

js-site-toast-data-failed = Le fichier de données n'a pas pu être chargé

js-site-toast-data-saved = Données enregistrées en CSV

js-site-toast-no-data = Aucune donnée pour ce graphique

js-site-toast-svg-saved = Graphique enregistré en SVG

js-site-toast-table-saved = Tableau enregistré en CSV

js-site-waterfall-axis-now = maintenant

js-site-waterfall-bar-title = { $band } : { $cn0 } dB-Hz, { $state }

js-site-waterfall-bar-title-js = { $band } : { $cn0 } dB-Hz, { $state }, J/S { $js } dB

js-site-waterfall-below-floor = les signaux sont sous le seuil de bruit

js-site-waterfall-campaign-drives = Campagne qu'elle pilote :

js-site-waterfall-campaign-seed = graine { $seed } · { $phases } phases sur { $duration } s

js-site-waterfall-chip-aria = { $band }, { $fc } mégahertz : afficher cette bande

js-site-waterfall-chip-title = { $band } · { $fc } MHz · bande passante du récepteur { $bw } MHz

js-site-waterfall-engine-build = Moteur v{ $version } · build

js-site-waterfall-fallback-head = Repli Galileo · { $s } s, tonalité CW seule

js-site-waterfall-fallback-text = { $band } de retour à { $v } dB-Hz. Surveillance d'intégrité avec Galileo seul : niveau de protection { $min }–{ $max } m, sous la limite d'alerte de { $limit } m.

js-site-waterfall-floor = seuil de poursuite de { $thr } dB-Hz

js-site-waterfall-holdover-head = Holdover · { $s } s, chirp actif

js-site-waterfall-holdover-text = { $band0 } { $v0 }, { $band1 } { $v1 } dB-Hz, sous le seuil. L'horloge dérive librement : pire { $worst } ns face à une borne de garde de { $guard } ns.

js-site-waterfall-jammer-off = { $what } éteint

js-site-waterfall-jammer-on = { $what } allumé

js-site-waterfall-live = { $freq } mégahertz, { $time } : { $detail }

js-site-waterfall-live-band = { $band } { $cn0 } dB-Hz, { $state }

js-site-waterfall-live-none = aucune bande modélisée

js-site-waterfall-load-failed = L'exécution enregistrée n'a pas pu être chargée. Le rapport du moteur ci-dessous montre la même exécution.

js-site-waterfall-no-jammer-band = Aucun brouilleur dans cette bande

js-site-waterfall-no-jammer-in-band = aucun brouilleur dans la bande

js-site-waterfall-no-seed = déterministe, sans graine

js-site-waterfall-onset-head = Début · { $t0 }–{ $t1 } s

js-site-waterfall-onset-text = Les { $n } bandes sont suivies, jusqu'à ce que l'exécution spectrale perde { $band } pour la première fois à { $s } s.

js-site-waterfall-pause = Mettre la cascade en pause

js-site-waterfall-play = Lancer la cascade

js-site-waterfall-quiet-band = { $band } { $cn0 } dB-Hz · { $state }

js-site-waterfall-run-time = exécution T+{ $s } s

js-site-waterfall-scale-caption = DSP au-dessus du seuil de { $floor } dBW/Hz · cellules de { $bin } MHz × { $step } s

js-site-waterfall-seed = graine { $seed }

js-site-waterfall-short-lost = perdu

js-site-waterfall-short-ok = suivi

js-site-waterfall-short-rec = récup.

js-site-waterfall-state-lost = Accrochage perdu

js-site-waterfall-state-lost-low = accrochage perdu

js-site-waterfall-state-ok = Poursuite

js-site-waterfall-state-ok-low = poursuite

js-site-waterfall-state-rec = Récupéré

js-site-waterfall-state-rec-low = récupéré

js-site-waterfall-summary-recovers = { $band } perd l'accrochage à { $lost } s et le récupère à { $rec } s, minimum { $min } dB-Hz.

js-site-waterfall-summary-rows = { $n } lignes de { $step } s.

js-site-waterfall-summary-stays-lost = { $band } perd l'accrochage à { $lost } s et reste perdue, minimum { $min } dB-Hz.

js-site-waterfall-summary-tracks = { $band } est suivie en permanence, minimum { $min } dB-Hz.

js-site-waterfall-tip-above-floor = au-dessus du seuil de bruit

js-site-waterfall-tip-at-floor = Au seuil de bruit thermique

js-site-waterfall-tip-band = { $cn0 } dB-Hz · { $state }

js-site-waterfall-tip-head = { $lo }–{ $hi } MHz · { $time }

js-site-waterfall-tip-js = J/S { $js } dB

js-site-waterfall-tip-no-band = La bande passante du récepteur d'aucune bande modélisée ne couvre cette colonne

js-site-waterfall-wave-chirp = chirp

js-site-waterfall-wave-cw = tonalité CW

js-site-waterfall-wave-noise = bruit

js-site-waterfall-who-cursor = Bande sous le curseur

js-site-waterfall-who-selected = Bande sélectionnée

js-site-waterfall-who-worst = Pire bande
