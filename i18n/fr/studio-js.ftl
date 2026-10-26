# studio-js.ftl (fr): translations

js-adv-all-domains = Tous les domaines

js-adv-animation-frame-title = Animation de cette exécution, écrite par le moteur

js-adv-animation-html-player = Lecteur HTML

js-adv-animation-html-player-title = Le lecteur monofichier, tel que le moteur l'a écrit

js-adv-animation-load-failed = L'animation enregistrée n'a pas pu être chargée ({ $reason }).

js-adv-animation-loading = Chargement de l'animation enregistrée…

js-adv-animation-none = Il n'y a pas d'animation enregistrée pour ce scénario.

js-adv-animation-note = Le moteur écrit une animation de toute exécution qui possède un axe temporel : un SVG qui se lit tout seul et un lecteur HTML monofichier avec ses propres commandes de lecture et de défilement. La version pour navigateur ne contient pas cet outil d'écriture ; c'est donc le fichier que le moteur natif en ligne de commande a écrit pour le scénario fourni.

js-adv-animation-svg = SVG animé

js-adv-animation-svg-title = Le SVG qui se lit tout seul, tel que le moteur l'a écrit

js-adv-axis-averaging-time = temps de moyennage τ (s)

js-adv-axis-observation-interval = intervalle d'observation τ (s)

js-adv-axis-value = valeur

js-adv-badge-live-engine = Moteur en direct

js-adv-badge-recorded = Enregistrée

js-adv-badge-recorded-engine = Exécution enregistrée, moteur v{ $version }

js-adv-badge-recorded-native = Exécution enregistrée, moteur natif v{ $version }

js-adv-band-carrier = Porteuse

js-adv-band-carrier-not-set = non définie dans ce scénario

js-adv-band-chip-rate = Débit de chips

js-adv-band-jammer-bandwidth = Bande passante du brouilleur

js-adv-band-jammer-label = brouilleur { $bandwidth } MHz

js-adv-band-jammer-power = Puissance du brouilleur

js-adv-band-jammer-type = Type de brouilleur

js-adv-band-no-carrier-note = Le moteur calcule le rapport brouilleur/signal à partir du bilan de liaison. Ce scénario n'indique pas de fréquence de porteuse ; aucun spectre n'est donc tracé.

js-adv-band-satellites = Satellites

js-adv-band-signal-main-lobe = lobe principal du signal

js-adv-band-svg-label = Bandes du signal et du brouilleur autour de la porteuse

js-adv-band-tracking-threshold = Seuil de poursuite

js-adv-browser-cannot-run = La version pour navigateur ne peut pas exécuter ce scénario.

js-adv-busy-running = Exécution

js-adv-busy-sweeping = Balayage

js-adv-chain-handed-on =
    { $n ->
        [one] { $n } valeur transmise
        [many] { $n } de valeurs transmises
       *[other] { $n } valeurs transmises
    }

js-adv-chain-note = Un système suivi à travers chaque étape du moteur. Le tableau ci-dessous liste chaque nombre qu'une étape a calculé et que l'étape suivante a utilisé.

js-adv-chain-stage = Étape { $n }

js-adv-chain-sub = la sortie de chaque étape alimente la suivante

js-adv-chain-title = La chaîne

js-adv-chart-allan-title = Écart-type d'Allan

js-adv-chart-budget-label = budget

js-adv-chart-default-title = Graphique Kshana

js-adv-chart-effective-cn0 = C/N0 effectif par satellite

js-adv-chart-ground-track = Trace au sol

js-adv-chart-holdover-budget = Holdover par rapport à un budget de synchronisation temporelle

js-adv-chart-mtie-title = MTIE (erreur maximale d'intervalle de temps)

js-adv-chart-provenance = Kshana v{ $version } · kshana.dev

js-adv-chart-provenance-hash = Kshana v{ $version } · scénario { $hash } · kshana.dev

js-adv-chart-stability-title = Stabilité de l'horloge (écart-type d'Allan chevauchant)

js-adv-chart-tdev-title = TDEV (écart temporel)

js-adv-chart-undrawable = Ce graphique n'a pas pu être tracé.

js-adv-chip-live = Moteur en direct · v{ $version }

js-adv-chip-live-title = Le moteur Kshana s'exécute dans ce navigateur sous forme de WebAssembly

js-adv-chip-recorded = Exécutions enregistrées · v{ $version }

js-adv-chip-recorded-title = WebAssembly n'a pas pu démarrer ici. Affichage d'exécutions enregistrées réelles des scénarios fournis.

js-adv-chip-recorded-title-reason = WebAssembly n'a pas pu démarrer ici ({ $reason }). Affichage d'exécutions enregistrées réelles des scénarios fournis.

js-adv-chip-unavailable = Moteur indisponible

js-adv-cmd-all-fields = Afficher tous les champs numériques

js-adv-cmd-compare = Comparer les exécutions épinglées

js-adv-cmd-embed-code = Copier le code d'intégration

js-adv-cmd-exports = Télécharger les résultats (exports)

js-adv-cmd-history = Ouvrir l'historique des exécutions

js-adv-cmd-parameters = Ouvrir les paramètres

js-adv-cmd-pin = Épingler cette exécution pour la comparer

js-adv-cmd-report = Télécharger le rapport

js-adv-cmd-reset = Réinitialiser le texte du scénario

js-adv-cmd-run = Exécuter le scénario

js-adv-cmd-share-link = Copier le lien de partage

js-adv-cmd-start = Aller à l'écran de démarrage

js-adv-cmd-theme = Basculer entre le mode clair et le mode sombre

js-adv-cmd-tour = Démarrer la visite guidée

js-adv-command-line-only = ligne de commande uniquement

js-adv-compare-deltas-note = Les écarts sont calculés par rapport à l'exécution A. Le vert marque la meilleure valeur pour chaque chiffre.

js-adv-compare-no-common = Ces exécutions n'ont aucune figure de mérite comparable. Épinglez des exécutions de la même famille de scénarios pour voir des nombres et des écarts.

js-adv-compare-one-pinned = Une exécution est épinglée. Changez un paramètre, relancez, puis épinglez cette exécution pour comparer les deux.

js-adv-compare-overlay = Superposition des exécutions épinglées

js-adv-compare-overlay-diff = Superposition avec la différence B − A

js-adv-compare-overlay-note = Les lignes pleines sont l'exécution A, les lignes en tirets l'exécution B, sur les mêmes axes.

js-adv-compare-overlay-title = { $title } : exécution { $a } (A) contre exécution { $b } (B)

js-adv-compare-pin-two = Épinglez au moins deux exécutions pour les comparer côte à côte. Épinglez une exécution, changez un paramètre ou choisissez un autre scénario de la même famille, exécutez-le, puis épinglez à nouveau.

js-adv-compare-run-heading = { $letter } · exécution { $run }

js-adv-copy-blocked = La copie est bloquée ici.

js-adv-copy-command = Copier : { $command }

js-adv-could-not-load = Impossible de charger { $file }.

js-adv-coverage-dots = Les points sont { $shown } satellites sur { $total }, déplacés le long de leurs traces au sol ; lancez le rejeu pour les faire bouger.

js-adv-coverage-field-label = Champ à cartographier

js-adv-coverage-map = Carte de couverture

js-adv-coverage-map-over = sur { $body }

js-adv-coverage-map-select = Cartographier

js-adv-coverage-note = Chaque cellule est un point de grille sur { $body }, évalué sur chaque époque de l'exécution.

js-adv-coverage-title = { $field } sur { $body }

js-adv-crumb-studio = Studio

js-adv-crumb-studio-title = L'écran de démarrage : tous les domaines

js-adv-decrease-field = Diminuer { $field }

js-adv-domain = Domaine

js-adv-domain-line-campaigns = Missions enchaînées, balayages et exécutions de Monte-Carlo sur une même horloge.

js-adv-domain-line-constellations = Concevoir une constellation et cartographier sa couverture et son PDOP (dilution de précision de position).

js-adv-domain-line-deepspace = Navigation et temps sur la Lune, dans l'espace cislunaire et sur Mars.

js-adv-domain-line-integrity = Les positions calculées et la question de savoir si l'on peut s'y fier : RAIM (surveillance autonome de l'intégrité par le récepteur) et sa forme avancée, ARAIM.

js-adv-domain-line-interference = Des brouilleurs contre des récepteurs GNSS : ce qui est perdu, et quand.

js-adv-domain-line-leo = Signaux de navigation en orbite terrestre basse, passages, messages et positions.

js-adv-domain-line-leo-missions = Études et services construits sur une couche en orbite terrestre basse.

js-adv-domain-line-navigation = Navigation inertielle, par le terrain, par la gravité et autre, sans GNSS.

js-adv-domain-line-optional = Un groupe facultatif de scénarios.

js-adv-domain-line-orbits = Propagation d'orbite, éphémérides et géométrie GNSS.

js-adv-domain-line-solar = Chaque planète et chaque lune à une même époque, avec les temps de lumière.

js-adv-domain-line-spaceops = Passages, fenêtres de lancement, rentrée atmosphérique, bilans de liaison et d'attitude.

js-adv-domain-line-spectrum = Cascades de la bande radio : brouilleurs, signaux et ce que le récepteur poursuit.

js-adv-domain-line-spoofing = Faux signaux et meaconing, et les moniteurs qui les détectent.

js-adv-domain-line-studies = Capteurs quantiques, études comparatives et formats d'interopérabilité.

js-adv-domain-line-timing = Horloges sans GNSS : holdover, stabilité, gabarits de télécommunications, transfert de temps.

js-adv-domain-pick-hint = Choisissez-en un : il s'ouvre et s'exécute dans votre navigateur. Vous pourrez ensuite changer ses paramètres.

js-adv-domain-scenario-count =
    { $n ->
        [one] { $label } : { $n } scénario
        [many] { $label } : { $n } de scénarios
       *[other] { $label } : { $n } scénarios
    }

js-adv-domain-select-label = Afficher un seul domaine

js-adv-download = Télécharger

js-adv-edited-cli-only-status = Modifié : ce scénario ne s'exécute que dans le moteur en ligne de commande.

js-adv-edited-needs-engine = Modifié : nécessite le moteur { $need }.

js-adv-edited-needs-live-engine = Les scénarios modifiés nécessitent le moteur en direct.

js-adv-embed-copied = Code d'intégration copié.

js-adv-engine-chart = Graphique du moteur

js-adv-engine-chart-alt = Graphique du moteur pour cette exécution

js-adv-engine-file-http-error = le fichier du moteur a renvoyé HTTP { $status }

js-adv-engine-load-failed-no-recordings = le moteur n'a pas pu se charger ({ $reason }) et aucune exécution enregistrée n'a été trouvée

js-adv-engine-loading = Chargement du moteur…

js-adv-engine-loading-title = Le moteur en direct est encore en cours de téléchargement. Ce résultat enregistré sera remplacé par une exécution en direct dès qu'il sera prêt.

js-adv-engine-start-failed = Le moteur n'a pas pu démarrer : { $reason }. Servez ce dossier en HTTP (par exemple python3 -m http.server) plutôt que d'ouvrir le fichier directement.

js-adv-entries-count = { $n } entrées

js-adv-export-card-title = Export { $format }

js-adv-export-csv-desc = Les mêmes octets que ceux que l'outil en ligne de commande écrit sous le nom { $file }.

js-adv-export-csv-title = Tableau de reproductibilité

js-adv-export-ephemeris-checking = Vérification des formats d'éphéméride que cette exécution peut exporter…

js-adv-export-ephemeris-waiting = Les exports d'éphéméride apparaissent ici quand le moteur est chargé.

js-adv-export-json-desc = La sortie complète du moteur pour cette exécution, unités et provenance comprises.

js-adv-export-json-title = Document de résultat complet

js-adv-export-large-not-recorded = Cet export est volumineux ; il n'a donc pas été enregistré. Il nécessite le moteur en direct.

js-adv-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) pour GMAT, Orekit ou STK

js-adv-export-omm-desc = Catalogue CCSDS OMM (Orbit Mean-elements Message)

js-adv-export-report-desc = Un fichier hors ligne : résumé, chiffres avec leurs niveaux, chaque graphique et le texte exact du scénario, horodaté avec la version du moteur et le hachage du scénario.

js-adv-export-report-title = Rapport reproductible

js-adv-export-sp3-desc = Éphéméride précise SP3-c de cette constellation

js-adv-export-toml-desc = L'entrée exacte de cette exécution. Relancez-la n'importe où avec l'outil en ligne de commande ou les paquets Python et npm.

js-adv-export-toml-title = Fichier de scénario

js-adv-export-too-large = { $desc }. Trop volumineux pour être enregistré : nécessite le moteur en direct.

js-adv-field-find-match =
    { $n ->
        [one] { $n } commande guidée et { $fields } champs sur { $total } correspondent à « { $query } ».
        [many] { $n } de commandes guidées et { $fields } champs sur { $total } correspondent à « { $query } ».
       *[other] { $n } commandes guidées et { $fields } champs sur { $total } correspondent à « { $query } ».
    }

js-adv-field-find-none = Aucun champ de ce scénario ne correspond à « { $query } ». Recherchez dans tous les scénarios avec la recherche de la bibliothèque.

js-adv-field-hit-in = dans { $title }

js-adv-field-not-single-number = Ce champ n'est pas un nombre unique dans ce scénario : modifiez-le dans la source.

js-adv-field-opened = Ouvert à { $field }. Modifiez-le et le scénario se relance.

js-adv-fields-matching = Champs correspondant à « { $query } »

js-adv-fields-more = { $n } de plus : affinez les mots, ou cherchez sur l'écran de démarrage.

js-adv-fields-top-level = niveau supérieur

js-adv-filter-check-tuning = vérifier le réglage

js-adv-filter-consistent = cohérent

js-adv-from-the-link = depuis le lien

js-adv-geo-sub = { $name } · { $shown } entités sur { $total } tracées · enregistré avec le moteur natif

js-adv-geo-title = Export GeoJSON : { $name }

js-adv-gt-note = En surbrillance : satellite visible depuis la station.

js-adv-gt-note-both = En surbrillance : satellite visible depuis la station. Élévation maximale { $elevation }°. Doppler maximal { $doppler } Hz.

js-adv-gt-note-doppler = En surbrillance : satellite visible depuis la station. Doppler maximal { $doppler } Hz.

js-adv-gt-note-elevation = En surbrillance : satellite visible depuis la station. Élévation maximale { $elevation }°.

js-adv-heatmap-label = Carte thermique { $metric }

js-adv-hist-runs-count = { $n } exécutions.

js-adv-history-pin = Épingler

js-adv-history-restore = Restaurer

js-adv-history-run-time = exécution { $run } · { $time }

js-adv-holdover-engine-figure = Holdover du moteur au budget du scénario : { $duration }

js-adv-holdover-engine-figure-budget = Holdover du moteur au budget du scénario ({ $budget } { $unit }) : { $duration }

js-adv-holdover-error-after-loss = erreur après la perte du GNSS à t = { $loss } s

js-adv-holdover-error-since-fix = erreur depuis la dernière position calculée

js-adv-holdover-stays-inside = reste dans ce budget pendant tout l'enregistrement

js-adv-holdover-until-breached = jusqu'au dépassement du budget

js-adv-honesty-modelled = Physique à partir des premiers principes, avec des tests, pas encore vérifiée par rapport à une référence indépendante externe. { $text }

js-adv-honesty-partner = Chiffres détenus par un partenaire. { $text }

js-adv-honesty-validated = Vérifié par rapport à une référence indépendante externe. { $text }

js-adv-increase-field = Augmenter { $field }

js-adv-install-version = Installer v{ $version }

js-adv-interop-no-file = Le moteur n'a écrit aucun fichier de ce format pour cette exécution.

js-adv-interop-not-applicable = Ne s'applique pas à ce scénario : { $reason }.

js-adv-interop-not-bundled = Non fourni ici (taille) : la commande ci-dessus l'écrit.

js-adv-interop-note = Le moteur écrit la géométrie et les échantillons de signal d'une exécution dans des formats que d'autres outils ouvrent : CZML pour Cesium, KML (Keyhole Markup Language) pour Google Earth, GeoJSON pour les cartes, fichiers d'éphéméride STK (.e) et enregistrements SigMF (Signal Metadata Format). La version pour navigateur ne contient pas ces outils d'écriture ; les fichiers ci-dessous sont donc ceux que le moteur natif en ligne de commande a écrits pour le scénario fourni.

js-adv-js-range-label = plage J/S

js-adv-js-range-value = { $low } à { $high } dB

js-adv-json-copied = JSON copié.

js-adv-kind-default = genre : holdover d'horloge (par défaut)

js-adv-kind-label = genre : { $kind }

js-adv-kpi-check = Vérifier

js-adv-kpi-delta-since-run = { $arrow } { $change } depuis l'exécution { $run }

js-adv-kpi-fail = Échec

js-adv-kpi-first-run = première exécution

js-adv-kpi-not-in-previous = absent de votre exécution précédente

js-adv-kpi-pass = Réussi

js-adv-lib-count-all = { $scenarios } scénarios · { $domains } domaines

js-adv-lib-count-filtered = { $n } sur { $total } scénarios

js-adv-lib-no-match = Aucun scénario ni champ ne correspond. Essayez un mot comme brouillage, horloge, lunaire, orbite, masque ou PDOP.

js-adv-loaded-shared = Un scénario partagé a été chargé depuis le lien.

js-adv-mask-envelope = Enveloppe d'erreur de temps du holdover ({ $source })

js-adv-mask-exceeded-after = dépassé après { $duration }

js-adv-mask-limit-label = limite { $limit } ns

js-adv-mask-max-te = |TE| max

js-adv-mask-not-exceeded = non dépassé

js-adv-matrix-counts = { $validated } sur { $total }

js-adv-matrix-line = { $counts } capacités vérifiées par rapport à des références indépendantes externes · { $modelled } modélisées · { $partner } détenues par un partenaire

js-adv-max-close = Fermer

js-adv-max-close-label = Fermer le plein écran

js-adv-max-expand = Agrandir

js-adv-max-expand-label = Agrandir ce panneau en plein écran

js-adv-max-title = Afficher ce panneau en plein écran (Échap le ferme)

js-adv-meta-engine = moteur

js-adv-meta-file = fichier

js-adv-meta-scenario = scénario

js-adv-meta-seed = graine

js-adv-meta-time = heure

js-adv-mission-timeline = Chronologie de la mission

js-adv-native-edited-notice = { $why } L'exécution enregistrée est celle du fichier fourni ; une copie modifiée ne peut donc pas être affichée ici : lancez-la avec l'outil en ligne de commande, ou utilisez Réinitialiser pour voir l'enregistrement.

js-adv-native-notice-command = { $why } Ce que vous voyez est une exécution enregistrée avec le moteur natif en ligne de commande v{ $version } en lançant { $command }, affichée telle quelle. Elle ne se relance pas quand vous modifiez.

js-adv-native-notice-plain = { $why } Ce que vous voyez est une exécution enregistrée avec le moteur natif en ligne de commande v{ $version }, affichée telle quelle. Elle ne se relance pas quand vous modifiez.

js-adv-native-notice-platform = { $why } Ce que vous voyez est une exécution enregistrée avec le moteur natif en ligne de commande v{ $version } ({ $platform }), affichée telle quelle. Elle ne se relance pas quand vous modifiez.

js-adv-native-notice-platform-command = { $why } Ce que vous voyez est une exécution enregistrée avec le moteur natif en ligne de commande v{ $version } ({ $platform }) en lançant { $command }, affichée telle quelle. Elle ne se relance pas quand vous modifiez.

js-adv-needs-live-engine = Cela nécessite le moteur en direct.

js-adv-needs-newer-engine-status = Nécessite un moteur plus récent.

js-adv-nees-line = NEES { $mean } (bande à 95 % { $low }–{ $high }, cible 2.0)

js-adv-newer-engine-edited-notice = Ce scénario nécessite le moteur { $need } ou une version ultérieure ; le moteur exécuté ici est v{ $version }. Seul l'enregistrement du fichier fourni peut être affiché : utilisez Réinitialiser pour le voir, ou lancez une copie modifiée avec le moteur { $need }.

js-adv-newer-engine-no-recording = Ce scénario nécessite le moteur { $need } ou une version ultérieure ; le moteur exécuté ici est v{ $version }. Il n'en existe aucun enregistrement ici.

js-adv-newer-engine-shown-commit = Ce scénario nécessite le moteur { $need } ou une version ultérieure ; le moteur exécuté ici est v{ $version }. Ce que vous voyez est l'exécution enregistrée avec une version du moteur au commit { $commit }, affichée telle quelle ; elle ne se relance pas ici.

js-adv-newer-engine-shown-version = Ce scénario nécessite le moteur { $need } ou une version ultérieure ; le moteur exécuté ici est v{ $version }. Ce que vous voyez est l'exécution enregistrée avec le moteur v{ $recorded }, affichée telle quelle ; elle ne se relance pas ici.

js-adv-nis-line = NIS { $mean } (bande à 95 % { $low }–{ $high }, cible 1.0)

js-adv-no-guided-controls = Ce scénario n'a aucune des commandes guidées. Utilisez Tous les champs, ou modifiez la source.

js-adv-no-numeric-fields = Aucun champ numérique unique à régler ici. Modifiez directement la source.

js-adv-no-recorded-run = Il n'y a pas d'exécution enregistrée pour ce scénario. Il nécessite le moteur en direct.

js-adv-no-summary = (ce scénario ne publie aucun résumé en une ligne)

js-adv-noise-floor = plancher de bruit { $level }

js-adv-not-in-browser-status = Ce scénario ne s'exécute pas dans le navigateur.

js-adv-open-and-run = Ouvrir et exécuter

js-adv-open-at-field = ouvrir à ce champ

js-adv-opened-from-simple = Ouvert avec les réglages que vous avez modifiés dans la vue simple.

js-adv-optional-preset = préréglage facultatif : scenarios/{ $file }

js-adv-orbit-canvas-label = Vue 3D interactive de la trace propagée

js-adv-orbit-fallback-alt = Vue orthographique de la trace propagée

js-adv-orbit-note-epoch = Faites glisser pour faire pivoter, faites défiler ou pincez pour zoomer. Terre à l'échelle, imagerie NASA Blue Marble. Tournée à l'époque de l'exécution.

js-adv-orbit-note-no-epoch = Faites glisser pour faire pivoter, faites défiler ou pincez pour zoomer. Terre à l'échelle, imagerie NASA Blue Marble. Cette exécution n'indique pas d'époque ; l'angle de rotation de la Terre n'a donc pas de sens ici.

js-adv-orbit-static-note = Vue statique (la bibliothèque 3D n'a pas pu se charger ici).

js-adv-pal-commands = Commandes

js-adv-pal-domain = Domaine : { $name }

js-adv-pal-domains = Domaines

js-adv-pal-field = Champ : { $name }

js-adv-pal-fields = Champs

js-adv-pal-nothing = Aucune correspondance

js-adv-pal-opens-page = ouvre une page

js-adv-pal-page = Page : { $name }

js-adv-pal-pages = Pages

js-adv-pal-panel = Panneau : { $name }

js-adv-pal-panels = Panneaux

js-adv-pal-scenarios = Scénarios

js-adv-params-hint-all = Chaque nombre du scénario. Faites-le varier pas à pas, saisissez-le ou utilisez les touches fléchées ; le scénario se relance.

js-adv-params-hint-guided = Faites glisser un curseur et le scénario se relance. Chaque commande écrit directement dans le texte du scénario ci-dessous.

js-adv-pin-already = Cette exécution est déjà épinglée.

js-adv-pin-first = Exécution { $run } épinglée. Changez un paramètre, relancez, puis épinglez aussi cette exécution.

js-adv-pin-label = { $letter } · { $title } · exécution { $run }

js-adv-pin-opening-compare = { $n } exécutions épinglées. Ouverture de Comparer.

js-adv-plan-view = Vue en plan

js-adv-plan-view-epoch = à { $epoch }

js-adv-plan-view-note = Chaque point est un corps à l'époque de l'exécution et chaque courbe est la trace d'orbite que le moteur a calculée pour lui. Une ligne en tirets est une liaison que demande le scénario. Choisissez une planète pour voir ses lunes autour d'elle.

js-adv-player-name-mission = rejeu de la mission

js-adv-player-name-orbit = rejeu de l'orbite

js-adv-player-name-replay = rejeu

js-adv-player-name-waterfall = rejeu de la cascade

js-adv-player-pause = Mettre en pause : { $name }

js-adv-player-play = Lancer : { $name }

js-adv-player-position = Position dans : { $name }

js-adv-png-download-title = Image bitmap haute résolution pour diapositives et documents

js-adv-png-export-failed = L'export PNG a échoué : { $reason }

js-adv-ready-live = Prêt. S'exécute localement dans votre navigateur.

js-adv-ready-recorded = Prêt. Affichage d'exécutions enregistrées.

js-adv-receiver-at-time = Récepteur à t = { $time }

js-adv-recorded-edit-notice = WebAssembly est bloqué sur cette page ; elle affiche donc des exécutions réelles des scénarios fournis, enregistrées avec le moteur v{ $version }. Les scénarios modifiés, les balayages et les nouveaux exports nécessitent le moteur en direct : ouvrez kshana.dev, ou servez ce dossier localement. Réinitialiser restaure le scénario enregistré.

js-adv-recorded-edited-warning = Vous avez modifié le scénario : cet enregistrement est celui du fichier fourni, et non de votre modification. Lancez la commande sur votre propre fichier pour obtenir le vôtre.

js-adv-recorded-intro = WebAssembly est bloqué sur cette page ; elle affiche donc des exécutions réelles des scénarios fournis, enregistrées avec le moteur v{ $version }. La modification, les balayages et les nouveaux exports nécessitent le moteur en direct sur kshana.dev.

js-adv-recorded-run-native = exécution enregistrée, moteur natif

js-adv-recorded-written-by = Écrit par le moteur natif en ligne de commande v{ $version } ({ $platform }) avec { $command }. Affiché tel quel.

js-adv-replay = Rejeu

js-adv-report-downloaded = Rapport téléchargé.

js-adv-report-frame-title = Rapport d'exécution écrit par le moteur

js-adv-report-html = Rapport (HTML)

js-adv-report-html-title = Le fichier de rapport, tel que le moteur l'a écrit

js-adv-report-load-failed = Le rapport enregistré n'a pas pu être chargé ({ $reason }).

js-adv-report-loading = Chargement du rapport enregistré…

js-adv-report-none = Il n'y a pas de rapport enregistré pour ce scénario.

js-adv-report-note = Chaque exécution en ligne de commande écrit un rapport : résumé, entrées, résultats, le graphique, ce qui est vérifié et ce qui est modélisé, et un enregistrement de reproductibilité. La version pour navigateur ne contient pas cet outil d'écriture ; c'est donc le rapport que le moteur natif en ligne de commande a écrit pour le scénario fourni. Le rapport propre au Studio sur l'exécution affichée à l'écran se trouve sous Exports.

js-adv-report-open-tab = Ouvrir dans un nouvel onglet

js-adv-report-open-tab-title = Ouvrir le rapport seul

js-adv-report-orbit-title = Orbite (inertiel centré sur la Terre, orthographique)

js-adv-report-stability-chart = Stabilité de l'horloge

js-adv-report-stability-title = Stabilité de l'horloge (écart-type d'Allan)

js-adv-restored-run = Exécution { $run } restaurée.

js-adv-result = Résultat

js-adv-run-cancelled = Exécution annulée.

js-adv-run-cancelled-previous = Exécution annulée. Le résultat précédent reste affiché.

js-adv-run-failed = L'exécution a échoué. Voir le message dans les résultats.

js-adv-scenario-copied = Scénario copié.

js-adv-scenarios-count = { $n } scénarios

js-adv-share-link-copied = Lien de partage copié. Il contient le scénario exact.

js-adv-share-link-in-bar = Lien placé dans la barre d'adresse.

js-adv-shared-link = lien partagé

js-adv-shared-needs-live = Ce lien contient son propre scénario, qui nécessite le moteur en direct. Ouvrez-le sur kshana.dev.

js-adv-shared-scenario = Scénario partagé

js-adv-shared-scenario-question = Un scénario ouvert depuis un lien de partage. Il s'exécute exactement comme il a été partagé.

js-adv-solar-bodies-label = Quels corps dessiner

js-adv-spectrum-part-label = Quelle partie du spectre

js-adv-spectrum-row-note = Le spectre le long de la ligne de la cascade où se trouve le rejeu.

js-adv-spectrum-row-title = Spectre le long de la ligne affichée

js-adv-start-field-meta = { $domain } · champ { $field }

js-adv-start-fields-hint = Chacun ouvre le scénario avec cette commande mise en évidence, prête à être modifiée.

js-adv-start-fields-named =
    { $n ->
        [one] Champs nommés comme « { $query } » : dans { $n } scénario
        [many] Champs nommés comme « { $query } » : dans { $n } de scénarios
       *[other] Champs nommés comme « { $query } » : dans { $n } scénarios
    }

js-adv-start-more-matches = { $n } correspondances de plus : ajoutez un mot pour les réduire.

js-adv-start-nothing = Rien ne correspond à « { $query } ». Essayez un mot comme brouillage, horloge, lunaire, orbite, masque ou PDOP.

js-adv-start-scenarios-count = Scénarios ({ $count })

js-adv-status-fetching-recorded = Chargement du moteur… Récupération du résultat enregistré de ce scénario.

js-adv-status-ran-locally = Exécuté localement à { $time }, exécution { $run }.

js-adv-status-ran-locally-secs = Exécuté localement à { $time }, exécution { $run }, { $secs } s.

js-adv-status-recorded-native = Exécution enregistrée affichée à { $time } (moteur natif).

js-adv-status-recorded-needs-engine = Exécution enregistrée affichée à { $time } (nécessite le moteur { $need }).

js-adv-status-recorded-shown = Exécution enregistrée affichée à { $time }, exécution { $run }.

js-adv-status-recorded-shown-secs = Exécution enregistrée affichée à { $time }, exécution { $run }, { $secs } s.

js-adv-status-showing-recorded = Chargement du moteur… Affichage du résultat enregistré de ce scénario en attendant que le moteur en direct soit prêt.

js-adv-subtabs-label = Tuiles de cette vue (téléphone)

js-adv-suggest-campaign = Rejouer une mission de brouillage, de leurrage et de holdover

js-adv-suggest-coverage = Cartographier la couverture de quatre constellations GNSS (système mondial de navigation par satellites)

js-adv-suggest-holdover = Durée de maintien quand le GNSS est perdu

js-adv-suggest-waterfall = Observer un brouilleur sur la cascade de la bande L

js-adv-svg-download-title = Graphique vectoriel avec titre et provenance

js-adv-sweep-cancelled = Balayage annulé.

js-adv-sweep-done-grid = { $total } exécutions balayées ({ $columns } × { $rows }) localement en { $time }.

js-adv-sweep-done-line = { $done } exécutions sur { $total } balayées localement en { $time }.

js-adv-sweep-enter-range = Saisissez une plage numérique.

js-adv-sweep-enter-range-second = Saisissez une plage numérique pour le second paramètre.

js-adv-sweep-failed = Le balayage a échoué : { $reason }

js-adv-sweep-interrupted = Balayage interrompu par une nouvelle exécution.

js-adv-sweep-needs-live = Un balayage exécute le moteur de nombreuses fois ; il nécessite donc le moteur en direct.

js-adv-sweep-none-line-chart = Aucun (courbe)

js-adv-sweep-nothing = Rien à balayer pour ce scénario.

js-adv-sweep-progress = Balayage de l'exécution { $n } sur { $total }…

js-adv-sweep-status-done = { $total } exécutions balayées à { $time }.

js-adv-sweep-title-grid = { $metric } selon { $first } et { $second }

js-adv-sweep-title-line = { $metric } en fonction de { $parameter }

js-adv-sweep-wait = Attendez la fin de l'exécution en cours, puis balayez.

js-adv-tab-animation = Animation

js-adv-tab-compare = Comparer

js-adv-tab-engine-report = Rapport du moteur

js-adv-tab-exports-report = Exports et rapport

js-adv-tab-ground-track = Trace au sol

js-adv-tab-holdover = Holdover

js-adv-tab-orbit-3d = Orbite 3D

js-adv-tab-overview = Vue d'ensemble

js-adv-tab-signal-band = Signal et bande

js-adv-tab-stability = Stabilité

js-adv-tab-sweep = Balayage

js-adv-tab-time-series = Séries temporelles

js-adv-tab-timing-masks = Gabarits de synchronisation

js-adv-th-at-tau-or-time = À τ ou au temps

js-adv-th-body = Corps

js-adv-th-clock = Horloge

js-adv-th-distance-sun = Distance au Soleil

js-adv-th-figure = Chiffre

js-adv-th-file = Fichier

js-adv-th-format = Format

js-adv-th-key-figure = Chiffre clé

js-adv-th-light-time-from = Temps de lumière à sens unique depuis { $observer }

js-adv-th-light-time-observer = Temps de lumière à sens unique depuis l'observateur

js-adv-th-limit = Limite

js-adv-th-margin = Marge

js-adv-th-mask-or-budget = Gabarit ou budget

js-adv-th-metric = Métrique

js-adv-th-orbital-period = Période orbitale

js-adv-th-provenance = Provenance

js-adv-th-size = Taille

js-adv-th-source = Source

js-adv-th-tier = Niveau

js-adv-th-unit = Unité

js-adv-th-value = Valeur

js-adv-th-verdict = Verdict

js-adv-th-what-it-is = Ce que c'est

js-adv-the-body = le corps

js-adv-tile-scenario-count =
    { $n ->
        [one] { $n } scénario
        [many] { $n } de scénarios
       *[other] { $n } scénarios
    }

js-adv-timeline-chart-title = Chronologie de la mission : { $title }

js-adv-timeline-latest-event = Dernier événement, à { $time } : { $label }

js-adv-timeline-no-event = Aucun événement pour l'instant à ce moment.

js-adv-timeline-note = Un seul curseur de défilement pilote tous les graphiques ci-dessous. Chaque phase exécute des scénarios ordinaires ; la campagne lit leurs sorties sur une même grille temporelle. Les bandes ombrées sont les phases, les traits verticaux les événements. Les valeurs ci-dessus sont les canaux de la campagne au moment du rejeu.

js-adv-timeline-on-one-clock = { $duration } sur une même horloge

js-adv-timeline-phase = Phase : { $phase }

js-adv-tour-back = Retour

js-adv-tour-done = Terminé

js-adv-tour-eyebrow = Visite guidée

js-adv-tour-headline-body = Le résumé en une ligne, la version du moteur et l'empreinte du scénario, et si chaque chiffre est vérifié ou modélisé.

js-adv-tour-headline-title = Lire la réponse

js-adv-tour-keyboard-body = ⌘K trouve n'importe quel scénario, vue ou commande. [ et ] permettent de passer d'une vue à l'autre.

js-adv-tour-keyboard-title = Tout au clavier

js-adv-tour-library-body = Chaque scénario fourni, regroupé par domaine de mission : brouillage, spectre, leurrage, horloges, navigation, intégrité, orbites, conception de constellations, navigation en orbite terrestre basse, campagnes, la Lune, Mars et le système solaire. Recherchez avec /.

js-adv-tour-library-title = Choisir une mission

js-adv-tour-next = Suivant

js-adv-tour-params-body = Des curseurs guidés pour les réglages courants, ou chaque champ numérique du scénario. Chaque modification relance l'exécution.

js-adv-tour-params-title = Le régler

js-adv-tour-pin-body = Épinglez jusqu'à quatre exécutions et comparez-les côte à côte, avec les écarts et une courbe de différence.

js-adv-tour-pin-title = Comparer des exécutions

js-adv-tour-run-body = Le moteur Rust s'exécute dans votre navigateur sous forme de WebAssembly. Rien n'est téléversé. ⌘↵ lance l'exécution depuis n'importe où.

js-adv-tour-run-title = L'exécuter, en local

js-adv-tour-share-body = Téléchargez le rapport, le résultat, le scénario et les exports du moteur, ou copiez un lien qui contient le scénario exact, ou un iframe pour une page de cours ou un wiki.

js-adv-tour-share-title = Partager ou exporter

js-adv-tour-skip = Passer

js-adv-tour-source-body = Le scénario complet en TOML. Ce que vous exécutez est exactement ce que vous pouvez partager et reproduire.

js-adv-tour-source-title = Ou tout modifier

js-adv-tour-tabs-body = Les vues apparaissent quand le résultat les prend en charge : signal et bande pour le brouillage, la cascade pour le spectre, la chronologie de la mission pour les campagnes, les cartes de couverture pour les constellations, le holdover pour les horloges, les gabarits pour la synchronisation des télécommunications, les orbites 3D, les traces au sol, les balayages, ainsi que l'animation et le rapport propres au moteur.

js-adv-tour-tabs-title = Chaque vue de l'exécution

js-adv-tracking-threshold-value = Seuil de poursuite { $value }

js-adv-transport-label = Rejeu : un seul curseur pilote chaque panneau de cette exécution

js-adv-transport-sub = un seul curseur pilote chaque panneau de cette exécution

js-adv-unpin-run = Désépingler l'exécution { $run }

js-adv-waterfall = Cascade

js-adv-waterfall-note = La couleur est la puissance au-dessus du plancher de bruit du récepteur. Les signaux de navigation se trouvent sous ce plancher ; ce qui s'allume, ce sont donc les brouilleurs. Lancez le rejeu ou faites-le glisser, et les bandes à droite montrent ce que le récepteur poursuit encore à cet instant.

js-adv-waterfall-sub = densité spectrale de puissance : fréquence en abscisse, temps vers le bas

js-adv-waterfall-title = Cascade, { $name }

js-adv-webassembly-unavailable = WebAssembly indisponible

js-app-all-questions = Toutes les questions

js-app-anim-frame-title = Animation de cette exécution, écrite par le moteur

js-app-anim-html-player = Lecteur HTML

js-app-anim-html-player-title = Le lecteur monofichier, tel que le moteur l'a écrit

js-app-anim-load-failed = L'animation enregistrée n'a pas pu être chargée ({ $reason }).

js-app-anim-loading = Chargement de l'animation enregistrée…

js-app-anim-none = Il n'y a pas d'animation enregistrée pour ce scénario.

js-app-anim-note = Le moteur écrit une animation de toute exécution qui possède un axe temporel : un SVG qui se lit tout seul et un lecteur HTML monofichier avec ses propres commandes de lecture et de défilement. La version pour navigateur ne contient pas cet outil d'écriture ; c'est donc le fichier que le moteur natif en ligne de commande a écrit pour le scénario fourni.

js-app-anim-svg = SVG animé

js-app-anim-svg-title = Le SVG qui se lit tout seul, tel que le moteur l'a écrit

js-app-axis-averaging-time = temps de moyennage τ (s)

js-app-axis-observation-interval = intervalle d'observation τ (s)

js-app-axis-value = valeur

js-app-badge-modelled = { $n } modélisés

js-app-badge-recorded = Enregistrée

js-app-badge-validated = { $n } vérifiés

js-app-band-carrier = Porteuse

js-app-band-carrier-unset = non définie dans ce scénario

js-app-band-chip-rate = Débit de chips

js-app-band-jammer-bandwidth = Bande passante du brouilleur

js-app-band-jammer-mhz = brouilleur { $mhz } MHz

js-app-band-jammer-power = Puissance du brouilleur

js-app-band-jammer-type = Type de brouilleur

js-app-band-main-lobe = lobe principal du signal

js-app-band-no-carrier-note = Le moteur calcule le rapport brouilleur/signal à partir du bilan de liaison. Ce scénario n'indique pas de fréquence de porteuse ; aucun spectre n'est donc tracé.

js-app-band-satellites = Satellites

js-app-band-svg-label = Bandes du signal et du brouilleur autour de la porteuse

js-app-band-tracking-threshold = Seuil de poursuite

js-app-browse-all-title = Les { $n } scénarios

js-app-browse-area-kicker =
    { $n ->
        [one] Domaine · { $n } scénario
        [many] Domaine · { $n } de scénarios
       *[other] Domaine · { $n } scénarios
    }

js-app-browse-area-lede = Choisissez-en un : il s'ouvre directement sur son résultat.

js-app-browse-evidence = Les méthodes du moteur que ses scénarios exécutent comptent { $validated } lignes vérifiées et { $modelled } lignes modélisées dans la matrice de vérification.

js-app-browse-evidence-title = Les preuves derrière ce domaine.

js-app-browse-kicker = Parcourir

js-app-browse-lede = Recherchez, ou choisissez un domaine. Chaque scénario s'ouvre directement sur son résultat.

js-app-browse-validated-examples = Vérifiés, par exemple : { $examples }.

js-app-browser-cannot-run = La version pour navigateur ne peut pas exécuter ce scénario.

js-app-btn-all-exports = Tous les exports

js-app-btn-all-exports-title = Tous les exports de cette exécution, y compris les formats propres au moteur

js-app-btn-compare-pinned = Comparer les exécutions épinglées

js-app-btn-copy-embed = Copier le code d'intégration

js-app-btn-copy-link = Copier un lien vers ce scénario exact

js-app-btn-figure-png = Figure (PNG)

js-app-btn-figure-png-title = Le graphique affiché, en image bitmap haute résolution

js-app-btn-figure-svg = Figure (SVG)

js-app-btn-figure-svg-title = Le graphique affiché, avec son titre, la version du moteur et le DOI

js-app-btn-pin-compare = Épingler cette exécution pour la comparer

js-app-btn-pin-count = Épingler cette exécution ({ $n } épinglées)

js-app-btn-report-html = Rapport reproductible (HTML)

js-app-btn-report-html-title = Un fichier hors ligne : résumé, chiffres avec leurs niveaux, graphiques et scénario exact

js-app-btn-result-json = Données du résultat (JSON)

js-app-btn-result-json-title = La sortie complète du moteur pour cette exécution

js-app-btn-run-history = Historique des exécutions

js-app-btn-scenario-toml = Fichier de scénario (TOML)

js-app-btn-scenario-toml-title = L'entrée exacte de cette exécution

js-app-btn-table-csv = Tableau (CSV)

js-app-btn-table-csv-title = Les mêmes octets que ceux que l'outil en ligne de commande écrit sous le nom { $file }

js-app-bytes =
    { $n ->
        [one] { $n } octet
        [many] { $n } d'octets
       *[other] { $n } octets
    }

js-app-cap-sub = { $areas } domaines, { $total } scénarios prêts à exécuter. Chaque domaine montre un résultat enregistré réel et la répartition des preuves qui le sous-tendent : la part de ses méthodes du moteur vérifiées par rapport à une référence extérieure.

js-app-chain-hint = la sortie de chaque étape alimente la suivante

js-app-chain-note = Un système suivi à travers chaque étape du moteur. Le tableau ci-dessous liste chaque nombre qu'une étape a calculé et que l'étape suivante a utilisé.

js-app-chain-stage = Étape { $n }

js-app-chain-values-handed =
    { $n ->
        [one] { $n } valeur transmise
        [many] { $n } de valeurs transmises
       *[other] { $n } valeurs transmises
    }

js-app-chart-allan-deviation = Écart-type d'Allan

js-app-chart-cn0-by-satellite = C/N0 effectif par satellite

js-app-chart-default-title = Graphique Kshana

js-app-chart-ground-track = Trace au sol

js-app-chart-holdover-title = Holdover par rapport à un budget de synchronisation temporelle

js-app-chart-mtie-title = MTIE (erreur maximale d'intervalle de temps)

js-app-chart-not-drawn = Ce graphique n'a pas pu être tracé.

js-app-chart-scenario-hash = scénario { $hash }

js-app-chart-stability-title = Stabilité de l'horloge (écart-type d'Allan chevauchant)

js-app-chart-tdev-title = TDEV (écart temporel)

js-app-chip-failed-title = WebAssembly n'a pas pu démarrer ici. Affichage d'exécutions enregistrées réelles des scénarios fournis.

js-app-chip-failed-title-reason = WebAssembly n'a pas pu démarrer ici ({ $reason }). Affichage d'exécutions enregistrées réelles des scénarios fournis.

js-app-chip-live = Moteur en direct · v{ $version }

js-app-chip-live-title = Le moteur Kshana s'exécute dans ce navigateur sous forme de WebAssembly

js-app-chip-loading = Chargement du moteur

js-app-chip-loading-title = Le moteur est en cours de téléchargement. Les résultats enregistrés s'affichent en attendant.

js-app-chip-recorded = Exécutions enregistrées · v{ $version }

js-app-chip-unavailable = Moteur indisponible

js-app-cli-note = Installez avec { $command }. L'exécution écrit { $file }, un graphique et un rapport.

js-app-cli-only-title = Celui-ci s'exécute en ligne de commande, pas dans le navigateur.

js-app-cli-save-comment = # enregistrez le fichier de scénario ci-dessous sous le nom { $file }, puis

js-app-cmd-advanced = Afficher tous les réglages (réglages avancés)

js-app-cmd-browse = Parcourir tous les scénarios

js-app-cmd-compare = Comparer les exécutions épinglées

js-app-cmd-embed = Copier le code d'intégration

js-app-cmd-exports = Télécharger les résultats (exports)

js-app-cmd-history = Ouvrir l'historique des exécutions

js-app-cmd-home = Aller à l'écran d'accueil

js-app-cmd-how = Comment cela est calculé

js-app-cmd-pin = Épingler cette exécution pour la comparer

js-app-cmd-report = Télécharger le rapport

js-app-cmd-research = Code, données et citation (pour les chercheurs)

js-app-cmd-reset = Réinitialiser le texte du scénario

js-app-cmd-run = Exécuter le scénario

js-app-cmd-share = Copier le lien de partage

js-app-cmd-theme = Basculer entre le mode clair et le mode sombre

js-app-cmd-tour = Démarrer la visite guidée

js-app-compare-deltas = Les écarts sont calculés par rapport à l'exécution A. Le vert marque la meilleure valeur pour chaque chiffre.

js-app-compare-none = Ces exécutions n'ont aucune figure de mérite comparable. Épinglez des exécutions de la même famille de scénarios pour voir des nombres et des écarts.

js-app-compare-pin-two = Épinglez au moins deux exécutions pour les comparer côte à côte. Épinglez une exécution, changez un paramètre ou choisissez un autre scénario de la même famille, exécutez-le, puis épinglez à nouveau.

js-app-compare-run-head = { $letter } · exécution { $id }

js-app-coverage-cell-note = Chaque cellule est un point de grille sur { $body }, évalué sur chaque époque de l'exécution.

js-app-coverage-dots-of = sur

js-app-coverage-dots-post = satellites, déplacés le long de leurs traces au sol ; lancez le rejeu pour les faire bouger.

js-app-coverage-dots-pre = Les points sont

js-app-coverage-field-label = Champ à cartographier

js-app-coverage-map = Carte de couverture

js-app-coverage-map-select = Cartographier

js-app-coverage-over = sur

js-app-coverage-title = { $field } sur { $body }

js-app-crumb-all-scenarios = Tous les scénarios

js-app-crumb-area = Domaine

js-app-crumb-search = Recherche : { $query }

js-app-crumb-studio = Studio

js-app-download-label = Télécharger

js-app-edited-cli-only = Modifié : ce scénario ne s'exécute que dans le moteur en ligne de commande.

js-app-edited-needs-engine = Modifié : nécessite le moteur { $need }.

js-app-edited-needs-live = Les scénarios modifiés nécessitent le moteur en direct.

js-app-embed-copied = Code d'intégration copié.

js-app-engine-chart = Graphique du moteur

js-app-engine-chart-alt = Graphique du moteur pour cette exécution

js-app-engine-could-not-start = Le moteur n'a pas pu démarrer : { $reason }. Servez ce dossier en HTTP (par exemple { $command }) plutôt que d'ouvrir le fichier directement.

js-app-engine-failed = Le moteur n'a pas pu se charger ({ $reason }).

js-app-engine-file-http = Le fichier du moteur a renvoyé HTTP { $status }.

js-app-engine-no-recordings = Le moteur n'a pas pu se charger ({ $reason }) et aucune exécution enregistrée n'a été trouvée.

js-app-entries-count =
    { $n ->
        [one] { $n } entrée
        [many] { $n } de entrées
       *[other] { $n } entrées
    }

js-app-ev-aria = { $validated } lignes vérifiées et { $modelled } lignes modélisées de la matrice de vérification

js-app-ev-title = { $validated } vérifiées · { $modelled } lignes modélisées dans la matrice de vérification

js-app-ev-validated = vérifiées

js-app-export-card-title = Export { $format }

js-app-export-checking = Vérification des formats d'éphéméride que cette exécution peut exporter…

js-app-export-csv-desc = Les mêmes octets que ceux que l'outil en ligne de commande écrit sous le nom { $file }.

js-app-export-csv-title = Tableau de reproductibilité

js-app-export-engine-loading = Les exports d'éphéméride apparaissent ici quand le moteur est chargé.

js-app-export-json-desc = La sortie complète du moteur pour cette exécution, unités et provenance comprises.

js-app-export-json-title = Document de résultat complet

js-app-export-not-recorded = Cet export est volumineux ; il n'a donc pas été enregistré. Il nécessite le moteur en direct.

js-app-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) pour GMAT, Orekit ou STK

js-app-export-omm-desc = Catalogue CCSDS OMM (Orbit Mean-elements Message)

js-app-export-report-desc = Un fichier hors ligne : résumé, chiffres avec leurs niveaux, chaque graphique et le texte exact du scénario, horodaté avec la version du moteur et le hachage du scénario.

js-app-export-report-title = Rapport reproductible

js-app-export-sp3-desc = Éphéméride précise SP3-c de cette constellation

js-app-export-toml-desc = L'entrée exacte de cette exécution. Relancez-la n'importe où avec l'outil en ligne de commande ou les paquets Python et npm.

js-app-export-toml-title = Fichier de scénario

js-app-export-too-large = { $desc }. Trop volumineux pour être enregistré : nécessite le moteur en direct.

js-app-fields-more = { $n } de plus

js-app-fields-none = aucun

js-app-fields-none-hint = Aucun autre nombre unique à modifier ici. Modifiez le fichier sous « Pour les chercheurs ».

js-app-fields-top-of-file = début du fichier

js-app-find-matches =
    { $n ->
        [one] { $n } commande guidée et { $m } champs sur { $total } correspondent à « { $query } ».
        [many] { $n } de commandes guidées et { $m } champs sur { $total } correspondent à « { $query } ».
       *[other] { $n } commandes guidées et { $m } champs sur { $total } correspondent à « { $query } ».
    }

js-app-find-none = Aucun champ de ce scénario ne correspond à « { $query } ». Recherchez dans tous les scénarios avec la recherche de la bibliothèque.

js-app-geo-sub = { $name } · { $features } entités sur { $total } tracées · enregistré avec le moteur natif

js-app-geojson-title = Export GeoJSON : { $name }

js-app-gt-highlighted = En surbrillance : satellite visible depuis la station.

js-app-gt-peak-doppler = Doppler maximal { $value } Hz.

js-app-gt-peak-elevation = Élévation maximale { $value }°.

js-app-health-check-tuning = vérifier le réglage

js-app-health-consistent = cohérent

js-app-health-nees-band = NEES { $mean } (bande à 95 % { $lo }–{ $hi }, cible 2.0)

js-app-health-nis-band = NIS { $mean } (bande à 95 % { $lo }–{ $hi }, cible 1.0)

js-app-heat-map-label = Carte thermique { $metric }

js-app-hero-clock = { $elapsed } sur { $total }

js-app-hero-mask = masque d'élévation de { $deg }°

js-app-hero-places =
    { $n ->
        [one] { $n } lieu
        [many] { $n } de lieux
       *[other] { $n } lieux
    }

js-app-hero-positions-only = Positions des satellites seulement : ni puissance du signal, ni état de santé des satellites, ni terrain.

js-app-hero-ramp = { $lo } à { $hi } { $field }

js-app-hero-ramp-over = { $lo } à { $hi } { $field }, sur { $duration }

js-app-hero-recorded-bare = Résultat enregistré

js-app-hero-satellites =
    { $n ->
        [one] { $n } satellite
        [many] { $n } de satellites
       *[other] { $n } satellites
    }

js-app-hero-steps =
    { $n ->
        [one] { $n } pas de temps
        [many] { $n } de pas de temps
       *[other] { $n } pas de temps
    }

js-app-hist-runs = { $n } exécutions.

js-app-history-pin = Épingler

js-app-history-restore = Restaurer

js-app-history-restored = Exécution { $id } restaurée.

js-app-history-run = exécution { $id } · { $time }

js-app-hit-in-scenario = dans { $title }

js-app-hit-native-note = exécution enregistrée, moteur natif

js-app-hit-setting-meta = { $area } · réglage { $name }

js-app-ho-budget = budget

js-app-ho-engine-budget = Holdover du moteur au budget du scénario ({ $budget } { $unit }) : { $duration }

js-app-ho-engine-budget-bare = Holdover du moteur au budget du scénario : { $duration }

js-app-ho-error-after-loss = erreur après la perte du GNSS à t = { $t } s

js-app-ho-error-since-fix = erreur depuis la dernière position calculée

js-app-ho-stays-inside = reste dans ce budget pendant tout l'enregistrement

js-app-ho-until-breached = jusqu'au dépassement du budget

js-app-hover-classical = classique

js-app-hover-quantum = quantique

js-app-how-checks = (vérifie : { $requirement })

js-app-how-matrix = Les méthodes du moteur que ce scénario exécute comptent { $validated } lignes vérifiées et { $modelled } lignes modélisées dans la matrice de vérification :

js-app-how-matrix-partner = Les méthodes du moteur que ce scénario exécute comptent { $validated } lignes vérifiées et { $modelled } lignes modélisées dans la matrice de vérification, et { $partner } lignes détenues par des partenaires :

js-app-how-mix-chip = { $validated } vérifiées · { $modelled } modélisées

js-app-how-more-notes =
    { $n ->
        [one] { $n } note de plus du fichier de scénario
        [many] { $n } de notes de plus du fichier de scénario
       *[other] { $n } notes de plus du fichier de scénario
    }

js-app-how-more-rows =
    { $n ->
        [one] { $n } ligne de plus dans la matrice de vérification (page Preuves du site).
        [many] { $n } de lignes de plus dans la matrice de vérification (page Preuves du site).
       *[other] { $n } lignes de plus dans la matrice de vérification (page Preuves du site).
    }

js-app-how-no-header = Ce fichier de scénario n'a pas de note d'en-tête. Le résumé du moteur ci-dessous indique ce qui a été exécuté.

js-app-how-no-matrix-row = Aucune ligne de la matrice de vérification ne nomme encore le genre de moteur de ce scénario.

js-app-how-no-sources = Le fichier de scénario ne cite aucune source, et aucune ligne vérifiée de la matrice ne couvre son genre.

js-app-how-own-label = Étiquette propre à cette exécution : { $label }

js-app-how-per-figure = Par chiffre, d'après le bloc figure_tiers du moteur : { $validated } vérifiés, { $modelled } modélisés. Le niveau de chaque chiffre figure dans la vue Vue d'ensemble.

js-app-install-copy = Copier : { $command }

js-app-install-label = Installer v{ $version }

js-app-interop-no-file = Le moteur n'a écrit aucun fichier de ce format pour cette exécution.

js-app-interop-not-apply = Ne s'applique pas à ce scénario : { $reason }.

js-app-interop-not-bundled = Non fourni ici (taille) : la commande ci-dessus l'écrit.

js-app-interop-note = Le moteur écrit la géométrie et les échantillons de signal d'une exécution dans des formats que d'autres outils ouvrent : CZML pour Cesium, KML (Keyhole Markup Language) pour Google Earth, GeoJSON pour les cartes, fichiers d'éphéméride STK (.e) et enregistrements SigMF (Signal Metadata Format). La version pour navigateur ne contient pas ces outils d'écriture ; les fichiers ci-dessous sont donc ceux que le moteur natif en ligne de commande a écrits pour le scénario fourni.

js-app-job-running = Exécution

js-app-job-sweeping = Balayage

js-app-js-range-label = plage J/S

js-app-js-range-value = { $lo } à { $hi } dB

js-app-latest-event-at = Dernier événement, à

js-app-legend-all = capacités du moteur sont vérifiées sur l'ensemble de la matrice de vérification ; { $modelled } sont modélisées et { $partner } sont détenues par des partenaires.

js-app-legend-count = { $validated } sur { $total }

js-app-load-failed = Impossible de charger { $file }.

js-app-mask-envelope = Enveloppe d'erreur de temps du holdover ({ $source })

js-app-mask-exceeded-after = dépassé après { $duration }

js-app-mask-limit = limite { $value } ns

js-app-mask-not-exceeded = non dépassé

js-app-meta-engine = moteur

js-app-meta-file = fichier

js-app-meta-scenario = scénario

js-app-meta-seed = graine

js-app-meta-shared-link = lien partagé

js-app-meta-time = heure

js-app-mission-timeline = Chronologie de la mission

js-app-native-edited-notice = L'exécution enregistrée est celle du fichier fourni ; une copie modifiée ne peut donc pas être affichée ici : lancez-la avec l'outil en ligne de commande, ou utilisez Réinitialiser pour voir l'enregistrement.

js-app-native-recorded = Ce que vous voyez est une exécution enregistrée avec le moteur natif en ligne de commande v{ $version }, affichée telle quelle. Elle ne se relance pas quand vous modifiez.

js-app-native-recorded-c = Ce que vous voyez est une exécution enregistrée avec le moteur natif en ligne de commande v{ $version } en lançant { $command }, affichée telle quelle. Elle ne se relance pas quand vous modifiez.

js-app-native-recorded-p = Ce que vous voyez est une exécution enregistrée avec le moteur natif en ligne de commande v{ $version } ({ $platform }), affichée telle quelle. Elle ne se relance pas quand vous modifiez.

js-app-native-recorded-pc = Ce que vous voyez est une exécution enregistrée avec le moteur natif en ligne de commande v{ $version } ({ $platform }) en lançant { $command }, affichée telle quelle. Elle ne se relance pas quand vous modifiez.

js-app-needs-live-engine = Cela nécessite le moteur en direct.

js-app-needs-newer-engine = Nécessite un moteur plus récent.

js-app-needs-newer-why = Ce scénario nécessite le moteur { $need } ou une version ultérieure ; le moteur exécuté ici est v{ $version }.

js-app-no-chart-export = Cette vue n'a aucun graphique à exporter.

js-app-no-event-yet = Aucun événement pour l'instant à ce moment.

js-app-no-recorded-run = Il n'y a pas d'exécution enregistrée pour ce scénario. Il nécessite le moteur en direct.

js-app-no-recording-here = Il n'en existe aucun enregistrement ici.

js-app-no-summary = (ce scénario ne publie aucun résumé en une ligne)

js-app-noise-floor = plancher de bruit { $value }

js-app-not-in-browser = Ce scénario ne s'exécute pas dans le navigateur.

js-app-notice-shared-needs-live = Ce lien contient son propre scénario, qui nécessite le moteur en direct. Ouvrez-le sur kshana.dev.

js-app-on-one-clock = sur une même horloge

js-app-only-bundled-recording = Seul l'enregistrement du fichier fourni peut être affiché : utilisez Réinitialiser pour le voir, ou lancez une copie modifiée avec le moteur { $need }.

js-app-opening-result = Ouverture du résultat…

js-app-orbit-canvas-label = Vue 3D interactive de la trace propagée

js-app-orbit-epoch-set = Tournée à l'époque de l'exécution.

js-app-orbit-epoch-unset = Cette exécution n'indique pas d'époque ; l'angle de rotation de la Terre n'a donc pas de sens ici.

js-app-orbit-img-alt = Vue orthographique de la trace propagée

js-app-orbit-note = Faites glisser pour faire pivoter, faites défiler ou pincez pour zoomer. Terre à l'échelle, imagerie NASA Blue Marble.

js-app-orbit-static = Vue statique (la bibliothèque 3D n'a pas pu se charger ici).

js-app-overlay-note = Les lignes pleines sont l'exécution A, les lignes en tirets l'exécution B, sur les mêmes axes.

js-app-overlay-pinned = Superposition des exécutions épinglées

js-app-overlay-title = { $title } : exécution { $a } (A) contre exécution { $b } (B)

js-app-overlay-with-diff = Superposition avec la différence B − A

js-app-pal-area = Domaine : { $label }

js-app-pal-nothing = Aucune correspondance

js-app-pal-scenario-count =
    { $n ->
        [one] { $n } scénario
        [many] { $n } de scénarios
       *[other] { $n } scénarios
    }

js-app-pal-sec-areas = Domaines

js-app-pal-sec-commands = Commandes

js-app-pal-sec-scenarios = Scénarios

js-app-pal-sec-settings = Réglages

js-app-pal-sec-views = Vues

js-app-pal-setting = Réglage : { $label }

js-app-pal-view = Vue : { $label }

js-app-panel-close = Fermer

js-app-panel-close-full = Fermer le plein écran

js-app-panel-expand = Agrandir

js-app-panel-expand-full = Agrandir ce panneau en plein écran

js-app-panel-expand-title = Afficher ce panneau en plein écran (Échap le ferme)

js-app-params-hint = Modifiez une valeur, puis relancez. La réponse et le graphique se mettent à jour sur place.

js-app-phase = Phase :

js-app-pin-already = Cette exécution est déjà épinglée.

js-app-pin-compare = { $n } exécutions épinglées. Ouverture de Comparer.

js-app-pin-first = Exécution { $id } épinglée. Changez un paramètre, relancez, puis épinglez aussi cette exécution.

js-app-pin-label = { $letter } · { $title } · exécution { $id }

js-app-plan-view = Vue en plan

js-app-plan-view-at = à

js-app-player-pause = Mettre en pause le rejeu

js-app-player-pause-mission = Mettre en pause le rejeu de la mission

js-app-player-pause-orbit = Mettre en pause le rejeu de l'orbite

js-app-player-pause-waterfall = Mettre en pause le rejeu de la cascade

js-app-player-play = Lire le rejeu

js-app-player-play-mission = Lire le rejeu de la mission

js-app-player-play-orbit = Lire le rejeu de l'orbite

js-app-player-play-waterfall = Lire le rejeu de la cascade

js-app-player-position = Position dans le rejeu

js-app-player-position-mission = Position dans le rejeu de la mission

js-app-player-position-orbit = Position dans le rejeu de l'orbite

js-app-player-position-waterfall = Position dans le rejeu de la cascade

js-app-png-button-title = Image bitmap haute résolution pour présentations et documents

js-app-png-export-failed = Échec de l'export PNG : { $reason }

js-app-py-note = Installez avec { $command }.

js-app-ran-locally = Exécuté en local à { $time }, exécution { $n }.

js-app-ran-locally-took = Exécuté en local à { $time }, exécution { $n }, { $took } s.

js-app-receiver-at = Récepteur à t =

js-app-recorded-edit-notice = WebAssembly est bloqué sur cette page : elle affiche donc de vraies exécutions des scénarios fournis, enregistrées avec le moteur v{ $version }. Les scénarios modifiés, les balayages et les nouveaux exports nécessitent le moteur en direct : ouvrez kshana.dev ou servez ce dossier en local. Réinitialiser rétablit le scénario enregistré.

js-app-recorded-intro = WebAssembly est bloqué sur cette page : elle affiche donc de vraies exécutions des scénarios fournis, enregistrées avec le moteur v{ $version }. La modification, les balayages et les nouveaux exports nécessitent le moteur en direct sur kshana.dev.

js-app-recorded-shown-native = Exécution enregistrée affichée à { $time } (moteur natif).

js-app-recorded-shown-needs = Exécution enregistrée affichée à { $time } (nécessite le moteur { $need }).

js-app-recorded-shown-run = Exécution enregistrée affichée à { $time }, exécution { $n }.

js-app-recorded-shown-took = Exécution enregistrée affichée à { $time }, exécution { $n }, { $took } s.

js-app-recorded-with-commit = Ce que vous voyez est l'exécution enregistrée avec une version du moteur au commit { $commit }, affichée telle quelle ; elle ne se relance pas ici.

js-app-recorded-with-engine = Ce que vous voyez est l'exécution enregistrée avec le moteur v{ $version }, affichée telle quelle ; elle ne se relance pas ici.

js-app-recording-edited-warning = Vous avez modifié le scénario : cet enregistrement correspond au fichier fourni, et non à votre modification. Lancez la commande sur votre propre fichier pour obtenir le vôtre.

js-app-replay = Rejeu

js-app-report-downloaded = Rapport téléchargé.

js-app-report-frame-title = Rapport d'exécution écrit par le moteur

js-app-report-html = Rapport (HTML)

js-app-report-html-title = Le fichier du rapport, tel que le moteur l'a écrit

js-app-report-load-failed = Le rapport enregistré n'a pas pu être chargé ({ $reason }).

js-app-report-loading = Chargement du rapport enregistré…

js-app-report-none = Il n'y a pas de rapport enregistré pour ce scénario.

js-app-report-note = Chaque exécution en ligne de commande écrit un rapport : résumé, entrées, résultats, graphique, ce qui est vérifié et ce qui est modélisé, et un relevé de reproductibilité. La version pour navigateur ne contient pas cet écrivain ; ceci est donc le rapport que le moteur natif en ligne de commande a écrit pour le scénario fourni. Le rapport propre au Studio pour l'exécution affichée se trouve sous Exports.

js-app-report-open-tab = Ouvrir dans un nouvel onglet

js-app-report-open-tab-title = Ouvrir le rapport seul

js-app-report-orbit-title = Orbite (inertiel centré sur la Terre, orthographique)

js-app-report-stability-short = Stabilité de l'horloge

js-app-report-stability-title = Stabilité de l'horloge (écart-type d'Allan)

js-app-run-again = Relancer

js-app-run-cancelled = Exécution annulée.

js-app-run-cancelled-previous = Exécution annulée. Le résultat précédent reste affiché.

js-app-run-failed = L'exécution a échoué. Voir le message dans les résultats.

js-app-run-when-ready = Lancer quand le moteur est prêt

js-app-run-will-run = Se lancera quand le moteur sera prêt

js-app-run-with-settings = Lancer avec ces réglages

js-app-search-more-matches =
    { $n ->
        [one] { $n } autre correspondance : ajoutez un mot pour affiner.
        [many] { $n } d'autres correspondances : ajoutez un mot pour affiner.
       *[other] { $n } autres correspondances : ajoutez un mot pour affiner.
    }

js-app-search-nothing = Aucun résultat pour « { $query } ». Essayez un mot comme brouillage, horloge, lunaire, orbite, masque ou PDOP.

js-app-search-scenarios = Scénarios ({ $n })

js-app-search-settings =
    { $n ->
        [one] Réglages nommés comme « { $query } » : dans { $n } scénario
        [many] Réglages nommés comme « { $query } » : dans { $n } de scénarios
       *[other] Réglages nommés comme « { $query } » : dans { $n } scénarios
    }

js-app-search-settings-hint = Chacun ouvre le scénario avec ce réglage mis en évidence, prêt à être modifié.

js-app-share-copied = Lien de partage copié. Il contient le scénario exact.

js-app-share-in-address-bar = Lien placé dans la barre d'adresse.

js-app-share-link-sub = Il s'exécute exactement comme il a été partagé.

js-app-share-link-title = Un scénario ouvert depuis un lien de partage

js-app-shared-scenario = Scénario partagé

js-app-shown-unchanged = Affiché tel quel.

js-app-solar-note = Chaque point est un corps à l'époque de l'exécution et chaque courbe est la trace d'orbite que le moteur a calculée pour lui. Une ligne en pointillés est une liaison que demande le scénario. Choisissez une planète pour voir ses lunes autour d'elle.

js-app-solar-which-bodies = Quels corps tracer

js-app-source-live = Résultat en direct · moteur v{ $version }

js-app-source-native = Résultat enregistré, moteur natif · v{ $version }

js-app-source-recorded = Résultat enregistré · v{ $version }

js-app-source-recorded-loading = Résultat enregistré · v{ $version } · chargement du moteur

js-app-spectrum-row-note = Le spectre le long de la ligne de la cascade où se trouve le rejeu.

js-app-spectrum-row-title = Spectre le long de la ligne affichée

js-app-spectrum-which-part = Quelle partie du spectre

js-app-status-last-run-took = La dernière exécution a pris { $ms } ms dans votre navigateur. Rien n'est téléversé.

js-app-status-loading-kept = Le moteur est encore en cours de chargement. Vos modifications sont conservées et s'exécutent dès qu'il est prêt.

js-app-status-loading-recorded = Le moteur est encore en cours de chargement. Le résultat ci-dessus est une exécution enregistrée.

js-app-status-not-run-yet = Vos modifications ne sont pas encore exécutées.

js-app-status-runs-in-browser = S'exécute dans votre navigateur. Rien n'est téléversé.

js-app-status-wasm-blocked = WebAssembly est bloqué ici : cela affiche donc des exécutions enregistrées des scénarios fournis.

js-app-stepper-decrease = Diminuer { $key }

js-app-stepper-increase = Augmenter { $key }

js-app-subtabs-label = Vignettes de cette vue (téléphone)

js-app-svg-button-title = Graphique vectoriel avec titre et provenance

js-app-sweep-cancelled = Balayage annulé.

js-app-sweep-done-1d = { $done } exécutions sur { $total } balayées en local en { $duration }.

js-app-sweep-done-2d = { $total } exécutions ({ $a } × { $b }) balayées en local en { $duration }.

js-app-sweep-enter-range = Saisissez une plage numérique.

js-app-sweep-enter-range-2 = Saisissez une plage numérique pour le second paramètre.

js-app-sweep-failed = Échec du balayage : { $reason }

js-app-sweep-interrupted = Balayage interrompu par une nouvelle exécution.

js-app-sweep-needs-live = Un balayage lance le moteur de nombreuses fois : il nécessite donc le moteur en direct.

js-app-sweep-none-line = Aucun (graphique en courbe)

js-app-sweep-nothing = Rien à balayer pour ce scénario.

js-app-sweep-progress = Balayage de l'exécution { $n } sur { $total }…

js-app-sweep-status-done = { $total } exécutions balayées à { $time }.

js-app-sweep-title-1d = { $metric } en fonction de { $knob }

js-app-sweep-title-2d = { $metric } selon { $knob1 } et { $knob2 }

js-app-sweep-wait = Attendez la fin de l'exécution en cours, puis balayez.

js-app-tab-animation = Animation

js-app-tab-compare = Comparer

js-app-tab-exports = Exports et rapport

js-app-tab-ground = Trace au sol

js-app-tab-holdover = Holdover

js-app-tab-json = JSON

js-app-tab-masks = Gabarits de synchronisation

js-app-tab-orbit = Orbite 3D

js-app-tab-overview = Vue d'ensemble

js-app-tab-report = Rapport du moteur

js-app-tab-signal = Signal et bande

js-app-tab-stability = Stabilité

js-app-tab-sweep = Balayage

js-app-tab-timeseries = Séries temporelles

js-app-th-at-tau = À τ ou à l'instant

js-app-th-body = Corps

js-app-th-clock = Horloge

js-app-th-figure = Chiffre

js-app-th-file = Fichier

js-app-th-format = Format

js-app-th-key-figure = Chiffre clé

js-app-th-light-time = Temps de lumière aller simple depuis { $observer }

js-app-th-limit = Limite

js-app-th-margin = Marge

js-app-th-mask-or-budget = Gabarit ou budget

js-app-th-metric = Métrique

js-app-th-metric-2 = Métrique

js-app-th-orbital-period = Période orbitale

js-app-th-provenance = Provenance

js-app-th-size = Taille

js-app-th-source = Source

js-app-th-sun-distance = Distance au Soleil

js-app-th-tier = Niveau

js-app-th-unit = Unité

js-app-th-value = Valeur

js-app-th-value-2 = Valeur

js-app-th-value-3 = Valeur

js-app-th-verdict = Verdict

js-app-th-what-it-is = De quoi il s'agit

js-app-the-body = le corps

js-app-the-chain = La chaîne

js-app-the-observer = l'observateur

js-app-tile-browse-all = Parcourir les { $n } scénarios

js-app-tile-browse-sub = Rechercher par nom, question ou réglage

js-app-tile-preview-label = Aperçu enregistré de { $source } : { $title }

js-app-tile-scenario-count =
    { $n ->
        [one] { $n } scénario
        [many] { $n } de scénarios
       *[other] { $n } scénarios
    }

js-app-timeline-chart-title = Chronologie de la mission : { $title }

js-app-timeline-note = Un seul curseur pilote tous les graphiques ci-dessous. Chaque phase exécute des scénarios ordinaires ; la campagne lit leurs sorties sur une même grille temporelle. Les bandes ombrées sont les phases, les traits verticaux les événements. Les valeurs ci-dessus sont les canaux de la campagne à l'instant du rejeu.

js-app-toast-copied = Copié.

js-app-toast-copy-blocked = La copie est bloquée ici.

js-app-toast-copy-blocked-select = La copie est bloquée ici : sélectionnez plutôt le texte.

js-app-toast-json-copied = JSON copié.

js-app-toast-loading-run = Le moteur est encore en cours de chargement. Votre exécution démarre dès qu'il est prêt.

js-app-toast-no-scenario = Il n'y a pas de scénario nommé { $name } ici. Voici les correspondances les plus proches.

js-app-toast-not-single-number = Ce réglage n'est pas un nombre unique dans ce scénario : modifiez-le dans le fichier du scénario.

js-app-toast-one-pinned = Une exécution est épinglée. Changez un réglage, relancez, puis épinglez cette exécution pour comparer les deux.

js-app-toast-opened-advanced = Ouvert avec les réglages que vous avez modifiés dans la vue avancée.

js-app-toast-opened-at = Ouvert à { $label }. Modifiez-le, puis relancez.

js-app-toast-scenario-copied = Scénario copié.

js-app-tour-answer-body = Une phrase simple tirée du résultat, et l'origine du résultat : une exécution en direct dans votre navigateur, ou une exécution enregistrée avec le même moteur.

js-app-tour-answer-title = La réponse d'abord

js-app-tour-back = Retour

js-app-tour-done = Terminé

js-app-tour-eyebrow = Visite guidée

js-app-tour-figures-body = Chaque carte est lue dans le document de résultat du moteur.

js-app-tour-figures-title = Les chiffres qui y répondent

js-app-tour-how-body = La méthode, le niveau de preuve et les références.

js-app-tour-how-title = Comment c'est calculé

js-app-tour-next = Suivant

js-app-tour-research-body = La ligne de commande et Python pour l'exécuter vous-même, les données et les figures, et la façon de le citer.

js-app-tour-research-title = Pour les chercheurs

js-app-tour-search-body = ⌘K trouve n'importe quel scénario, domaine, réglage, vue ou commande.

js-app-tour-search-title = Recherche

js-app-tour-settings-body = Les cinq réglages qui comptent le plus pour cette question. Changez-en un, puis relancez. Le moteur s'exécute dans votre navigateur ; rien n'est téléversé.

js-app-tour-settings-title = Essayer d'autres réglages

js-app-tour-skip = Passer

js-app-tour-views-body = Graphiques, cartes, rejeux, rapport propre au moteur et exports. [ et ] permettent de passer d'une vue à l'autre.

js-app-tour-views-title = Chaque vue de l'exécution

js-app-tracking-threshold = Seuil de poursuite

js-app-transport-hint = un seul curseur pilote chaque panneau de cette exécution

js-app-transport-label = Rejeu : un seul curseur pilote chaque panneau de cette exécution

js-app-unpin-run = Désépingler l'exécution { $id }

js-app-waterfall = Cascade

js-app-waterfall-hint = densité spectrale de puissance : fréquence en abscisse, temps vers le bas

js-app-waterfall-note = La couleur est la puissance au-dessus du plancher de bruit du récepteur. Les signaux de navigation se trouvent sous ce plancher : ce qui s'allume, ce sont donc les brouilleurs. Lancez le rejeu ou faites-le glisser, et les bandes à droite montrent ce que le récepteur poursuit encore à cet instant.

js-app-waterfall-title = Cascade, { $name }

js-app-webassembly-unavailable = WebAssembly indisponible

js-app-written-by-native = Écrit par le moteur natif en ligne de commande v{ $version } ({ $platform }) avec

js-cat-acm-link-question = Le long de chaque passage, quel mode DVB-S2 la liaison tient-elle, et quelle quantité de données le passage transfère-t-il ? (modélisé)

js-cat-acm-link-title = Liaison descendante satellite à codage adaptatif

js-cat-aocs-slew-mekf-question = Avec le contrôleur alimenté par un filtre d'attitude et un gyroscope biaisé, comment le basculement se compare-t-il au cas de l'état vrai ? (modélisé)

js-cat-aocs-slew-mekf-title = Basculement sur une estimation d'attitude

js-cat-aocs-slew-question = La loi de rétroaction stabilise-t-elle un basculement de grand angle avec quatre roues, et quel effort les roues fournissent-elles ? (la boucle de commande est vérifiée ; le satellite est illustratif)

js-cat-aocs-slew-title = Basculement par roues de réaction

js-cat-aperture-duty-cycle-question = Quand une même ouverture sert à la navigation et aux communications, quelle interruption cela coûte-t-il ? (modélisé)

js-cat-aperture-duty-cycle-title = Rapport cyclique de l'ouverture

js-cat-araim-gps-galileo-question = Avec GPS + Galileo et l'hypothèse de panne à l'échelle de la constellation, quelle est la disponibilité du RAIM avancé ?

js-cat-araim-gps-galileo-title = ARAIM à deux constellations

js-cat-araim-reference-check-question = Les niveaux de protection du moteur tombent-ils sur les exemples travaillés publiés du Working Group C ?

js-cat-araim-reference-check-title = Vérification de référence ARAIM

js-cat-ascent-losses-question = Quelle part du gain de vitesse idéal d'un lanceur à deux étages la gravité, la traînée, le pilotage et la contre-pression prélèvent-ils ? (modélisé)

js-cat-ascent-losses-title = Pertes à la montée du lanceur

js-cat-attitude-budget-question = Quel est le couple perturbateur le plus défavorable et le budget d'erreur de pointage ?

js-cat-attitude-budget-title = Budget de pointage

js-cat-automotive-urban-canyon-question = Sous un passage inférieur et face à un brouilleur en bord de route, une voiture reste-t-elle dans un budget d'une demi-voie ? (modélisé)

js-cat-automotive-urban-canyon-title = Voiture dans un canyon urbain

js-cat-campaign-jam-spoof-holdover-integrity-question = Qu'arrive-t-il à un récepteur à travers un brouillage, un leurrage, une perte du GNSS, une alarme d'intégrité et la reprise, sur une seule chronologie ? (modélisé)

js-cat-campaign-jam-spoof-holdover-integrity-title = Mission enchaînée : brouillage, leurrage, holdover, alarme

js-cat-campaign-monte-carlo-clock-holdover-question = Sur de nombreuses exécutions à graine fixée, l'erreur de temps d'une horloge libre correspond-elle à sa dispersion en forme fermée ?

js-cat-campaign-monte-carlo-clock-holdover-title = Holdover d'horloge par Monte-Carlo

js-cat-campaign-optimize-link-budget-question = Selon la distance et le débit de données, où une liaison en bande X laisse-t-elle exactement 3 dB de marge ?

js-cat-campaign-optimize-link-budget-title = Optimiser un bilan de liaison

js-cat-campaign-shared-jammer-sea-road-question = Sous un seul brouilleur, quelle plateforme perd sa position : le navire à 30 km ou la voiture à 50 km ? (modélisé)

js-cat-campaign-shared-jammer-sea-road-title = Un brouilleur, un navire et une voiture

js-cat-campaign-spectrum-holdover-integrity-question = Un brouilleur prend deux signaux en bande L, l'horloge passe en holdover et le récepteur se rabat sur Galileo seul : la surveillance d'intégrité tient-elle encore ? (modélisé)

js-cat-campaign-spectrum-holdover-integrity-title = Mission pilotée par le spectre

js-cat-campaign-sweep-jammer-power-question = Quand un brouilleur situé à 1 km passe de 10 nW à 10 W, à quel moment le récepteur perd-il sa position ? (modélisé)

js-cat-campaign-sweep-jammer-power-title = Balayage de la puissance du brouilleur

js-cat-cislunar-arc-recovery-question = Un estimateur indépendant des moindres carrés retrouve-t-il réellement l'état à partir de la longueur d'arc que prédit le test de rang ? (modélisé ; lent : environ 15 s dans un navigateur)

js-cat-cislunar-arc-recovery-title = Récupération d'arc cislunaire

js-cat-cislunar-observability-question = Quelle part de l'état d'un engin cislunaire un arc inter-satellites rend-il observable ?

js-cat-cislunar-observability-title = Observabilité cislunaire

js-cat-clock-ensemble-question = Sur de nombreux tirages de bruit, dans quelle bande de confiance le holdover se situe-t-il ?

js-cat-clock-ensemble-title = Ensemble de holdover d'horloge

js-cat-clock-holdover-labsr-question = Comment une horloge optique au strontium de laboratoire se compare-t-elle à une horloge atomique à l'échelle d'une puce en holdover ?

js-cat-clock-holdover-labsr-title = Holdover d'horloge, horloge optique de laboratoire

js-cat-clock-holdover-question = Combien de temps une horloge peut-elle garder l'heure après la disparition du GNSS ?

js-cat-clock-holdover-title = Holdover d'horloge

js-cat-combined-altpnt-question = Qu'apporte la fusion de trois canaux de carte scalaires par rapport à chacun pris seul ?

js-cat-combined-altpnt-title = Alt-PNT combiné

js-cat-conflict-resilience-question = Comment une architecture PNT en couches se dégrade-t-elle sous des menaces de brouillage / leurrage / cinétiques / cyber ? (modélisé)

js-cat-conflict-resilience-title = Résilience en situation de conflit

js-cat-constellation-multi-gnss-coverage-question = Avec les quatre systèmes mondiaux réunis, combien de satellites sont en vue et quelle est la qualité de la géométrie, partout sur Terre ? (modélisé)

js-cat-constellation-multi-gnss-coverage-title = Quatre constellations GNSS, une carte

js-cat-contact-schedule-question = Pour trois satellites et trois stations sur 12 heures, quels passages un plan sans conflit retient-il, et quelle quantité de données transfère-t-il ? (modélisé)

js-cat-contact-schedule-title = Plan de contacts sol

js-cat-domain-campaigns-label = Campagnes

js-cat-domain-campaigns-line = Missions enchaînées, balayages et exécutions Monte-Carlo sur une même horloge.

js-cat-domain-constellations-label = Conception de constellation

js-cat-domain-constellations-line = Concevez une constellation et cartographiez sa couverture et son PDOP (dilution de précision de position).

js-cat-domain-deepspace-label = Lune, cislunaire et Mars

js-cat-domain-deepspace-line = Navigation et temps sur la Lune, dans l'espace cislunaire et sur Mars.

js-cat-domain-integrity-label = Intégrité et positionnement

js-cat-domain-integrity-line = Les positions calculées et la possibilité de leur faire confiance : RAIM (surveillance autonome de l'intégrité par le récepteur) et sa forme avancée, l'ARAIM.

js-cat-domain-interference-label = Brouillage et interférence

js-cat-domain-interference-line = Les brouilleurs face aux récepteurs de navigation par satellite : ce qui est perdu, et quand.

js-cat-domain-leo-label = Navigation en orbite terrestre basse (LEO)

js-cat-domain-leo-line = Signaux de navigation en orbite terrestre basse, passages, messages et positions.

js-cat-domain-leo-missions-label = Missions et études LEO

js-cat-domain-leo-missions-line = Études et services bâtis sur une couche en orbite terrestre basse.

js-cat-domain-navigation-label = Navigation inertielle et alternative

js-cat-domain-navigation-line = Navigation inertielle, par le relief, par la gravité et autres, sans satellites.

js-cat-domain-orbits-label = Orbites et géométrie GNSS

js-cat-domain-orbits-line = Propagation d'orbite, éphémérides et géométrie des satellites de navigation.

js-cat-domain-solar-label = Système solaire

js-cat-domain-solar-line = Chaque planète et chaque lune à une même époque, avec les temps de lumière.

js-cat-domain-spaceops-label = Analyse de mission et opérations spatiales

js-cat-domain-spaceops-line = Passages, fenêtres de lancement, rentrée atmosphérique, budgets de liaison et d'attitude.

js-cat-domain-spectrum-label = Spectre

js-cat-domain-spectrum-line = Cascades de la bande radio : brouilleurs, signaux et ce que le récepteur poursuit.

js-cat-domain-spoofing-label = Leurrage et sécurité du signal

js-cat-domain-spoofing-line = Faux signaux et meaconing, et les moniteurs qui les détectent.

js-cat-domain-studies-label = Quantique, études comparatives et interopérabilité

js-cat-domain-studies-line = Capteurs quantiques, études comparatives et formats d'interopérabilité.

js-cat-domain-timing-label = Horloges et synchronisation temporelle

js-cat-domain-timing-line = Horloges sans satellites : holdover, stabilité, gabarits de télécommunications, transfert de temps.

js-cat-earth-gnss-lunar-question = Un récepteur proche de la Lune peut-il entendre le GNSS terrestre, et cela suffit-il jamais pour une position ? (modélisé)

js-cat-earth-gnss-lunar-title = GNSS terrestre à la Lune

js-cat-entry-heating-stardust-question = Le modèle de rentrée reproduit-il la décélération maximale publiée de la capsule de retour d'échantillons Stardust ?

js-cat-entry-heating-stardust-title = Rentrée de la capsule Stardust

js-cat-eo-coverage-question = Quelle fauchée, quelle distance d'échantillonnage au sol et quelle revisite une orbite d'observation de la Terre donne-t-elle ?

js-cat-eo-coverage-title = Couverture d'observation de la Terre

js-cat-eo-radiometry-question = Pour une petite caméra d'observation de la Terre, quel rapport signal sur bruit, quelle FTM à Nyquist et quel NIIRS une scène de 15 % de réflectance donne-t-elle ? (modélisé)

js-cat-eo-radiometry-title = Radiométrie de l'imageur et qualité d'image

js-cat-ephemeris-question = Où est le satellite, et quand passe-t-il à la verticale ?

js-cat-ephemeris-title = Trace au sol

js-cat-europa-surface-pnt-question = Un atterrisseur sur Europe, lune de Jupiter, peut-il être positionné à partir d'une petite constellation de relais et d'une mesure de distance depuis la Terre ? (modélisé)

js-cat-europa-surface-pnt-title = Atterrisseur sur Europe

js-cat-fusion-pnt-coupled-question = Avec un seul filtre de Kalman empilé sur la position, l'horloge et le biais de l'accéléromètre, comment le navigateur traverse-t-il une panne du GNSS ? (modélisé)

js-cat-fusion-pnt-coupled-title = Navigateur à fusion de capteurs couplée

js-cat-fusion-pnt-question = Qu'apporte un estimateur conjoint unique sur horloge + position ?

js-cat-fusion-pnt-title = Fusion de capteurs

js-cat-gnss-ins-aviation-question = Pendant un déni de GNSS de deux minutes couvrant un virage incliné, de combien une centrale inertielle (INS) à couplage serré, de classe navigation ou tactique, dérive-t-elle ? (modélisé)

js-cat-gnss-ins-aviation-title = Virage d'un avion pendant une coupure du GNSS

js-cat-gnss-ins-maritime-question = Après une panne du GNSS de cinq minutes sur un navire qui zigzague, de combien une INS de classe navigation ou tactique dérive-t-elle ? (modélisé)

js-cat-gnss-ins-maritime-title = Navire zigzaguant pendant une panne du GNSS

js-cat-gnss-ins-question = Dans quelle mesure un navigateur inertiel assisté traverse-t-il une panne du GNSS sans accroc ?

js-cat-gnss-ins-rail-question = Dans une tranchée profonde avec deux satellites, puis un tunnel, de combien une INS à couplage serré dérive-t-elle ? (modélisé)

js-cat-gnss-ins-rail-title = Train dans une tranchée et un tunnel

js-cat-gnss-ins-title = Fusion GNSS/INS

js-cat-gnss-sim-container-terminal-skyline-question = Avec des grues côté mer et des piles côté terre, combien de satellites restent, et que devient la protection RAIM ? (modélisé ; profil d'horizon représentatif)

js-cat-gnss-sim-container-terminal-skyline-title = Cavalier de manutention sur un quai à conteneurs

js-cat-gnss-sim-raim-question = Comment l'ionosphère et la troposphère façonnent-elles les pseudodistances brutes, et le RAIM protège-t-il encore ?

js-cat-gnss-sim-raim-title = Mesures GNSS

js-cat-gnss-ssv-formation-heo-question = Dans quelle mesure un filtre connaît-il la position relative de deux engins distants d'un kilomètre, par rapport à la différence de leurs positions absolues ? (modélisé ; exécution enregistrée avec le moteur natif)

js-cat-gnss-ssv-formation-heo-title = Navigation relative en formation, orbite très elliptique

js-cat-gnss-ssv-heo-question = Qu'entend une orbite très elliptique le long de sa trajectoire : signaux en vue, meilleur C/N0, lobe principal contre lobe secondaire, DOP et signaux rasants ? (modélisé ; exécution enregistrée avec le moteur natif)

js-cat-gnss-ssv-heo-title = Signaux GNSS sur une orbite très elliptique

js-cat-gnss-ssv-lunar-weak-question = Que peut utiliser, sur la route de la Lune, un récepteur conçu pour les signaux les plus faibles ? (modélisé ; exécution enregistrée avec le moteur natif)

js-cat-gnss-ssv-lunar-weak-title = Signaux GNSS sur un transfert lunaire, récepteur à signaux faibles

js-cat-gnss-ssv-nav-lunar-question = Dans quelle mesure un filtre embarqué tient-il un transfert lunaire, par rapport à la borne qu'il annonce ? (modélisé ; exécution enregistrée avec le moteur natif)

js-cat-gnss-ssv-nav-lunar-title = Filtre GNSS embarqué sur un transfert lunaire

js-cat-gnss-ssv-shell-question = À quelle fréquence un engin à l'altitude géostationnaire entend-il au moins un, et au moins quatre, signaux de navigation, par constellation et par bande ? (modélisé ; exécution enregistrée avec le moteur natif)

js-cat-gnss-ssv-shell-title = Signaux GNSS au-dessus des satellites : une coquille à 36 000 km

js-cat-gps-denied-gravity-nav-egm2008-question = Sur le vrai champ de gravité EGM2008 jusqu'au degré 70, la corrélation de cartes peut-elle tenir une trajectoire sans GPS ? (modélisé)

js-cat-gps-denied-gravity-nav-egm2008-title = Navigation par la gravité sur le champ réel

js-cat-gps-denied-gravity-nav-question = De combien la position dérive-t-elle pendant une heure entière sans GNSS, et une carte de gravité peut-elle la brider ?

js-cat-gps-denied-gravity-nav-title = Navigation sans GNSS

js-cat-gravity-map-error-mc-question = À mesure que la carte de gravité stockée devient plus bruitée, à quelle fréquence la corrélation de cartes garde-t-elle encore une position sans GPS dans sa cible ? (modélisé)

js-cat-gravity-map-error-mc-title = Monte-Carlo de l'erreur de carte de gravité

js-cat-gravity-map-nav-question = Un gravimètre à atomes froids peut-il tenir la position sans GNSS en corrélant le champ de gravité qu'il traverse ?

js-cat-gravity-map-nav-title = Navigation par carte de gravité

js-cat-holdover-test-example-question = Débranchez l'antenne, notez le holdover : un enregistrement scindé aux deux instants indiqués par l'opérateur, chaque étape mesurée face aux gabarits de l'UIT-T écrits pour elle. (modélisé ; l'enregistrement est inventé pour l'exemple)

js-cat-holdover-test-example-title = Test de holdover : un enregistrement d'erreur de temps face aux gabarits

js-cat-holdover-test-ptp4l-question = Les mêmes quatre étapes lues dans un journal d'asservissement ptp4l : à quelle distance des gabarits le décalage propre au démon reste-t-il tant que le GNSS est absent ? (modélisé ; le journal est inventé pour l'exemple)

js-cat-holdover-test-ptp4l-title = Test de holdover : un journal linuxptp

js-cat-hybrid-optical-rf-question = Quelle continuité et quelle intégrité la combinaison du PNT optique et radiofréquence apporte-t-elle ? (modélisé)

js-cat-hybrid-optical-rf-title = Hybride optique/RF

js-cat-hybrid-pnt-question = Qu'apporte un ensemble combinant horloge et inertie ?

js-cat-hybrid-pnt-title = PNT hybride

js-cat-hybrid-ukf-question = Le UKF à couplage serré à 17 états est-il auto-cohérent (NEES + blancheur de l'innovation) ? Une vérification d'auto-cohérence, et non une affirmation de précision.

js-cat-hybrid-ukf-title = UKF hybride à 17 états

js-cat-impairment-eval-question = Dans quelle mesure un détecteur sépare-t-il le brouillage / leurrage / trajets multiples du nominal ? (ROC/AUC modélisées)

js-cat-impairment-eval-title = Évaluation des dégradations RF

js-cat-imu-deadreckoning-question = De combien la position dérive-t-elle en s'appuyant sur une seule IMU ?

js-cat-imu-deadreckoning-title = Navigation à l'estime inertielle

js-cat-ins-trn-coast-question = De combien la position dérive-t-elle pendant une coupure de navigation, et quand franchit-elle 10 m et 50 m ? (modélisé)

js-cat-ins-trn-coast-title = Inertie/relief en roue libre

js-cat-integrity-harbour-approach-question = Avec des bâtiments de quai et une digue qui masquent les satellites bas, le GPS et Galileo maintiennent-ils la protection ARAIM dans les limites d'alerte ? (modélisé ; profil d'horizon représentatif)

js-cat-integrity-harbour-approach-title = ARAIM à l'entrée du port

js-cat-integrity-raim-question = La géométrie respecte-t-elle les limites d'alerte (HPL / VPL) ?

js-cat-integrity-raim-title = Intégrité RAIM

js-cat-jamming-demo-question = À quel rapport brouilleur/signal le récepteur perd-il l'accrochage ?

js-cat-jamming-demo-title = Brouillage

js-cat-jamming-harbour-approach-skyline-question = Sous un brouilleur côtier de 2 W, combien de satellites un navire conserve-t-il, et combien le quai lui-même en masque-t-il ? (modélisé ; profil d'horizon représentatif)

js-cat-jamming-harbour-approach-skyline-title = Navire brouillé à l'entrée du port

js-cat-l-band-waterfall-jamming-question = À quoi ressemble toute la bande L du GNSS pendant qu'un brouilleur à balayage, un brouilleur à tonalité et un brouilleur de bruit s'allument, et quels signaux chacun enlève-t-il ? (modélisé)

js-cat-l-band-waterfall-jamming-title = Cascade de la bande L sous brouillage

js-cat-launch-window-question = Quel azimut de lancement et quel Δv de dogleg atteignent une inclinaison cible depuis un site ?

js-cat-launch-window-title = Fenêtre de lancement

js-cat-leo-band-trade-question = Que gagne et que perd un signal de navigation en orbite basse dans chaque bande, de l'ultra haute fréquence (UHF) à la bande C ? (conceptions représentatives)

js-cat-leo-band-trade-title = Comparaison des bandes, de l'UHF à la bande C

js-cat-leo-doppler-positioning-question = Quelle est la qualité d'une position obtenue à partir de dix minutes de Doppler sur une constellation de navigation en orbite basse ? (modélisé)

js-cat-leo-doppler-positioning-title = Positionnement par le seul Doppler

js-cat-leo-focus-data-services-question = Que coûte chaque service de données supplémentaire en bits de message de navigation ? (modélisé)

js-cat-leo-focus-data-services-title = Données de service en fonction de la longueur de trame

js-cat-leo-focus-fused-pnt-sisre-question = Quelle doit être la qualité de l'erreur de distance du signal dans l'espace en orbite basse pour que la couche en orbite basse améliore une position fusionnée ? (modélisé)

js-cat-leo-focus-fused-pnt-sisre-title = Position fusionnée en fonction de l'erreur d'orbite et d'horloge

js-cat-leo-focus-indoor-uhf-question = Quelle bande atteint encore un utilisateur à l'intérieur d'un bâtiment traditionnel et d'un bâtiment thermiquement efficace ? (modélisé)

js-cat-leo-focus-indoor-uhf-title = Réception en intérieur selon la bande et le bâtiment

js-cat-leo-focus-iot-eirp-question = De quelle puissance d'émission du satellite une balise sur batterie a-t-elle besoin pour durer ? (modélisé)

js-cat-leo-focus-iot-eirp-title = Énergie du traceur en fonction de la puissance d'émission

js-cat-leo-focus-ntn-bandwidth-question = Comment l'erreur de positionnement diminue-t-elle quand le signal de référence s'élargit de 180 kHz à 20 MHz ? (modélisé)

js-cat-leo-focus-ntn-bandwidth-title = Positionnement par liaison descendante 5G en fonction de la bande passante

js-cat-leo-focus-ppp-altitude-question = Une couche en orbite basse plus basse ou plus haute raccourcit-elle davantage la convergence ? (modélisé ; lent, environ une minute dans un navigateur)

js-cat-leo-focus-ppp-altitude-title = Positionnement précis en fonction de l'altitude de la couche

js-cat-leo-focus-science-iono-sounding-question = Dans quelle mesure la différence de retard entre deux bandes mesure-t-elle le contenu électronique sous un satellite en orbite basse ? (modélisé)

js-cat-leo-focus-science-iono-sounding-title = Sondage de l'ionosphère à partir de deux bandes

js-cat-leo-indoor-uhf-question = Pourquoi une porteuse UHF pénètre-t-elle à l'intérieur d'un bâtiment alors que les bandes L, S et C peinent ? (modélisé)

js-cat-leo-indoor-uhf-title = En intérieur en UHF

js-cat-leo-iot-energy-question = Quelle énergie une balise sur batterie dépense-t-elle pour chaque position tirée d'un signal en orbite basse ? (modélisé)

js-cat-leo-iot-energy-title = Énergie par position pour un traceur

js-cat-leo-navmsg-encode-decode-question = Que coûte la quantification de chaque champ, et la trame survit-elle à l'encodage, au décodage et à un bit corrompu ? (modélisé)

js-cat-leo-navmsg-encode-decode-title = Message de navigation : trame binaire

js-cat-leo-navmsg-fit-interval-trade-question = Combien de temps un message diffusé peut-il couvrir avant que son erreur d'orbite ne dépasse la cible ? (modélisé ; lent, environ 30 s dans un navigateur)

js-cat-leo-navmsg-fit-interval-trade-title = Message de navigation : intervalle d'ajustement

js-cat-leo-navmsg-midpass-update-question = Quand un satellite passe à un nouveau message au milieu d'un passage, l'utilisateur voit-il un saut ? (modélisé)

js-cat-leo-navmsg-midpass-update-title = Message de navigation : mise à jour en plein passage

js-cat-leo-navmsg-model-comparison-question = Quel modèle d'éphéméride représente le mieux une orbite basse, et comment se situe-t-il par rapport à une table publiée ? (modélisé)

js-cat-leo-navmsg-model-comparison-title = Message de navigation : quatre modèles

js-cat-leo-pass-iridium-question = Quelle puissance de signal et quel Doppler un avion de ligne perçoit-il sur un passage Iridium ? (modélisé)

js-cat-leo-pass-iridium-title = Salves Iridium depuis un avion

js-cat-leo-pass-vs-gnss-cn0-question = Comment la puissance de signal d'un passage en orbite basse se compare-t-elle aux satellites Galileo en vue ? (modélisé)

js-cat-leo-pass-vs-gnss-cn0-title = Un passage face au GNSS

js-cat-leo-pass-xona-pulsar-question = À quoi ressemblent les signaux X1 et X5 sur un passage, pour un navire dans le golfe de Gascogne ? (modélisé)

js-cat-leo-pass-xona-pulsar-title = Passage Xona Pulsar

js-cat-leo-pnt-end-to-end-question = De la conception du signal à la position finale, que chaque étape transmet-elle à la suivante ? (modélisé)

js-cat-leo-pnt-end-to-end-title = De bout en bout, constellation générique

js-cat-leo-pnt-mega-shell-question = Quelle couverture et quelle géométrie une constellation de navigation de 5 000 satellites en orbite terrestre basse donne-t-elle ? (modélisé ; un exemple de conception)

js-cat-leo-pnt-mega-shell-title = Conception de 5 000 satellites en orbite basse

js-cat-leo-ppp-convergence-question = De combien le positionnement ponctuel précis (PPP) converge-t-il plus vite quand une couche en orbite basse est ajoutée ? (modélisé ; lent, environ 30 s dans un navigateur)

js-cat-leo-ppp-convergence-title = Convergence du positionnement précis

js-cat-leo-pvt-fjord-skyline-question = Là où les parois d'un fjord laissent une bande de ciel le long du chenal, qu'apporte une couche en orbite basse au GPS et à Galileo ? (modélisé ; profil d'horizon représentatif)

js-cat-leo-pvt-fjord-skyline-title = Ferry au fond d'un fjord

js-cat-leo-resilience-gnss-jammed-leo-carries-question = Quand le GNSS est brouillé, une couche en orbite basse sur d'autres bandes peut-elle conserver la position et son intégrité ? (modélisé)

js-cat-leo-resilience-gnss-jammed-leo-carries-title = GNSS brouillé, l'orbite basse prend le relais

js-cat-leo-resilience-js-margin-question = Combien de brouillage en plus un signal en orbite basse plus fort supporte-t-il, par rapport à un signal GNSS en orbite moyenne ? (modélisé)

js-cat-leo-resilience-js-margin-title = Marge de brouillage à partir de la puissance reçue

js-cat-leo-resilience-multiband-diversity-question = Quand un brouilleur en bande L monte en puissance, lesquelles des quatre bandes continuent la poursuite ? (modélisé)

js-cat-leo-resilience-multiband-diversity-title = Diversité de bandes sous un brouilleur à large bande

js-cat-leo-resilience-spoof-doppler-question = Quand un leurre déplace la position calculée de 30 m, avec quelle rapidité un contrôle de Doppler et de géométrie de passage le détecte-t-il ? (modélisé)

js-cat-leo-resilience-spoof-doppler-title = Leurrage détecté par le Doppler

js-cat-leo-resilience-spoof-monitors-question = Quel moniteur voit quel type de leurre ? (modélisé)

js-cat-leo-resilience-spoof-monitors-title = Moniteurs de leurrage face à quatre leurres

js-cat-leo-timing-utc-question = Avec quelle précision un récepteur peut-il retrouver le temps universel coordonné (UTC) à partir de satellites en orbite basse, selon l'oscillateur et le niveau de signal ? (modélisé)

js-cat-leo-timing-utc-title = Transfert de temps vers l'UTC

js-cat-leo-vertical-5g-network-timing-question = Quand le GNSS est perdu pendant une journée, le temps en orbite basse maintient-il une station de base dans sa limite de synchronisation ? (modélisé)

js-cat-leo-vertical-5g-network-timing-title = Synchronisation de stations de base 5G

js-cat-leo-vertical-asset-tracking-iot-question = Tout au long du trajet d'un conteneur, que coûte chaque position à une balise sur batterie ? (modélisé)

js-cat-leo-vertical-asset-tracking-iot-title = Suivi de conteneurs

js-cat-leo-vertical-autonomous-vehicle-question = Quand des bâtiments masquent les satellites bas, une couche en orbite basse maintient-elle une voiture dans une erreur à l'échelle de la voie ? (modélisé)

js-cat-leo-vertical-autonomous-vehicle-skyline-question = Modélisée comme une vraie rue plutôt que comme une coupure plate à 35°, une couche en orbite basse maintient-elle encore une voiture dans une erreur à l'échelle de la voie ? (modélisé ; profil d'horizon représentatif)

js-cat-leo-vertical-autonomous-vehicle-skyline-title = Véhicule dans une rue, et non derrière une coupure plate

js-cat-leo-vertical-autonomous-vehicle-title = Véhicule dans un canyon urbain

js-cat-leo-vertical-critical-infrastructure-timing-question = Quand le GNSS est perdu, le temps en orbite basse maintient-il la synchronisation d'un poste électrique ? (modélisé)

js-cat-leo-vertical-critical-infrastructure-timing-title = Synchronisation d'un poste électrique

js-cat-leo-vertical-polar-arctic-question = De Tromsø au pôle Nord, qu'apporte au GNSS une couche polaire en orbite basse ? (modélisé)

js-cat-leo-vertical-polar-arctic-title = Voyage arctique

js-cat-leo-vertical-rail-maritime-question = Quand les scénarios fournis du navire et du train perdent le GNSS, un passage en orbite basse les atteint-il encore ? (modélisé)

js-cat-leo-vertical-rail-maritime-title = Ferroviaire et maritime avec une couche en orbite basse

js-cat-link-budget-question = La liaison aller simple se ferme-t-elle avec de la marge à la distance et au débit donnés ?

js-cat-link-budget-title = Bilan de liaison

js-cat-lunanet-araim-question = Un ensemble clairsemé de relais lunaires respecte-t-il les limites d'intégrité pour un récepteur dans la région Artemis ?

js-cat-lunanet-araim-title = Intégrité lunaire

js-cat-lunar-attack-surface-question = Que faut-il pour leurrer ou priver un récepteur de surface lunaire, et quel budget d'authentification y répond ? (modélisé)

js-cat-lunar-attack-surface-title = Surface d'attaque lunaire

js-cat-lunar-beacon-question = De combien une poignée de balises de surface géoréférencées réduit-elle le DOP du pôle sud ? (modélisé)

js-cat-lunar-beacon-title = Balises de surface lunaire

js-cat-lunar-differential-pnt-question = Dans quelle mesure la correction différentielle annule-t-elle l'erreur de mode commun par rapport à la référence de base sur la Lune ? (modélisé)

js-cat-lunar-differential-pnt-title = PNT différentiel lunaire

js-cat-lunar-frame-campaign-question = Quelle précision de datum sort d'une campagne d'observation plutôt que d'une transformation injectée ? (modélisé)

js-cat-lunar-frame-campaign-title = Campagne de référentiel lunaire

js-cat-lunar-frame-realisation-question = Un ajustement de datum de Helmert peut-il retrouver une transformation de référentiel lunaire ? (modélisé)

js-cat-lunar-frame-realisation-title = Référentiel lunaire

js-cat-lunar-infrastructure-carrier-phase-question = Une station de surface et un orbiteur peuvent-ils lever ensemble les ambiguïtés entières de phase de la porteuse des signaux du GNSS terrestre ? L'exécution rapide de l'exemple. (modélisé ; exécution enregistrée avec le moteur natif)

js-cat-lunar-infrastructure-carrier-phase-title = Phase de la porteuse lunaire : station de surface et orbiteur

js-cat-lunar-infrastructure-frame-coestimation-question = Quelle quantité d'information supplémentaire les mesures de distance orbiteur-station de surface apportent-elles aux sept paramètres du datum lunaire ? (modélisé ; exécution enregistrée avec le moteur natif)

js-cat-lunar-infrastructure-frame-coestimation-title = Co-estimation du référentiel lunaire avec des liaisons orbiteur

js-cat-lunar-infrastructure-geodesy-sensitivity-question = Quelle est la sensibilité de la télémétrie laser, du suivi d'orbiteur, d'un gravimètre et d'une horloge de surface à h2, k2, l2 et à la libration ? (modélisé ; exécution enregistrée avec le moteur natif)

js-cat-lunar-infrastructure-geodesy-sensitivity-title = Nombres de Love lunaires et sensibilité à la libration

js-cat-lunar-infrastructure-od-consistency-model-error-question = La même comparaison avec une petite accélération non modélisée injectée : le contrôle de cohérence la remarque-t-il ? (modélisé ; exécution enregistrée avec le moteur natif)

js-cat-lunar-infrastructure-od-consistency-model-error-title = Détermination d'orbite lunaire, avec une erreur de modélisation injectée

js-cat-lunar-infrastructure-od-consistency-question = La détermination d'orbite embarquée par GNSS terrestre sur une orbite de halo lunaire et la détermination d'orbite radiométrique indépendante au sol concordent-elles dans les limites de leurs incertitudes annoncées ? (modélisé ; exécution enregistrée avec le moteur natif)

js-cat-lunar-infrastructure-od-consistency-title = Détermination d'orbite lunaire : GNSS embarqué face au suivi au sol

js-cat-lunar-infrastructure-space-tie-question = Avec quelle précision les décalages entre trois techniques peuvent-ils être reliés, face à l'erreur du rattachement local ? (modélisé ; exécution enregistrée avec le moteur natif)

js-cat-lunar-infrastructure-space-tie-title = Rattachement spatial : GNSS, VLBI et télémétrie laser sur un même engin

js-cat-lunar-interop-export-question = Le référentiel, le temps et l'éphéméride lunaires peuvent-ils faire l'aller-retour par CCSDS OEM + une enveloppe KIF ?

js-cat-lunar-interop-export-title = Export d'interopérabilité lunaire

js-cat-lunar-jamming-question = À quelle distance un brouilleur peut-il se trouver tout en privant un récepteur de surface lunaire de signal ? (modélisé)

js-cat-lunar-jamming-title = Brouillage lunaire

js-cat-lunar-joint-od-clock-question = Un rattachement VLBI sur une base terrestre rend-il observable la position absolue d'une station lunaire ? (modélisé)

js-cat-lunar-joint-od-clock-title = OD + horloge lunaires conjointes

js-cat-lunar-llr-datum-question = À quoi ressemble le datum lunaire quand la campagne est une vraie télémétrie laser lunaire (LLR) archivée ? (modélisé ; exécution enregistrée avec le moteur natif)

js-cat-lunar-llr-datum-title = Datum de télémétrie laser lunaire

js-cat-lunar-relay-constellation-question = Quelle couverture une constellation de relais et de navigation sur des orbites lunaires gelées et basses donne-t-elle sur toute la Lune ? (modélisé ; un exemple de conception)

js-cat-lunar-relay-constellation-title = Constellation de relais lunaires

js-cat-lunar-station-coverage-public-sources-question = Avec les seules hypothèses publiquement annoncées, quelle erreur corrigée la station donne-t-elle au-dessus du pôle sud ? Le résultat est dominé par les éléments orbitaux, qui ne sont pas publics et sont fixés à titre ILLUSTRATIF ; c'est l'entrée de la prédiction figée. (modélisé ; pas une déclaration sur un système réel)

js-cat-lunar-station-coverage-public-sources-title = Station de référence lunaire, hypothèses publiques

js-cat-lunar-station-coverage-question = Sur la région polaire sud et sur une journée, quelle erreur corrigée une station de référence lunaire donne-t-elle, et jusqu'à quelle distance la couverture tient-elle ? (modélisé ; pas une déclaration sur un système réel)

js-cat-lunar-station-coverage-terrain-question = Avec l'horizon de chaque site tracé par lancer de rayons sur un vrai modèle d'élévation lunaire, quelle couverture la station perd-elle à cause du relief ? (modélisé)

js-cat-lunar-station-coverage-terrain-title = Station lunaire avec relief réel

js-cat-lunar-station-coverage-title = Couverture d'une station de référence lunaire

js-cat-lunar-station-geodesy-baseline-question = Dans quelle mesure les cinq réseaux de rétroréflecteurs actuels fixent-ils le datum lunaire sur un vrai calendrier, avant l'ajout de toute station ? La référence de base d'une paire. (modélisé ; exécution enregistrée avec le moteur natif)

js-cat-lunar-station-geodesy-baseline-title = Géodésie de station lunaire : les cinq réseaux seuls

js-cat-lunar-station-geodesy-with-station-question = Le même calendrier archivé avec un réflecteur polaire sud et une balise VLBI ajoutés : de combien la borne du datum se resserre-t-elle ? (modélisé, site illustratif ; exécution enregistrée avec le moteur natif)

js-cat-lunar-station-geodesy-with-station-title = Géodésie de station lunaire : avec une station polaire sud

js-cat-lunar-station-time-lab-question = Après le dernier asservissement de l'horloge miniature au rubidium d'une station sur le temps lunaire, combien de temps reste-t-elle à moins de 1, 10 et 100 ns, et quel terme d'erreur domine ? (modélisé)

js-cat-lunar-station-time-lab-title = Laboratoire de temps d'une station lunaire

js-cat-lunar-time-budget-question = Quelle est la taille du décalage de temps-coordonnée Terre-Lune, et son budget d'erreur ? (modélisé)

js-cat-lunar-time-budget-title = Budget de temps lunaire

js-cat-lunar-time-offset-question = À quelle vitesse une horloge lunaire diverge-t-elle du temps terrestre (~56–59 µs/jour) ?

js-cat-lunar-time-offset-title = Décalage de temps lunaire

js-cat-lunar-vlbi-fim-question = Quelle précision de coordonnées de station un calendrier de suivi VLBI donné apporte-t-il réellement ? (modélisé)

js-cat-lunar-vlbi-fim-title = Information VLBI lunaire

js-cat-lunar-vlbi-question = Quel retard une paire VLBI sur base terrestre voit-elle pour une balise de surface lunaire ? (modélisé)

js-cat-lunar-vlbi-title = VLBI lunaire

js-cat-maritime-port-approach-coast-question = À l'entrée du port sans GNSS, quand une INS de classe navigation sort-elle des budgets du port et de la haute mer ? (modélisé)

js-cat-maritime-port-approach-coast-title = Approche du port à l'inertie

js-cat-maritime-spoof-position-push-question = Quand un leurre entraîne la position d'un navire de 500 m, quelles couches de détection le repèrent ? (modélisé)

js-cat-maritime-spoof-position-push-title = Position de navire leurrée

js-cat-maritime-strait-jamming-question = Sur 30 km de mer libre, un brouilleur de 50 W prive-t-il un navire de son GNSS ? (modélisé)

js-cat-maritime-strait-jamming-title = Navire brouillé dans un détroit

js-cat-mars-orbit-pnt-question = Dans quelle mesure un orbiteur martien bas est-il positionné à partir de douze relais de navigation, et qu'ajoute une mesure de distance depuis la Terre ? (modélisé)

js-cat-mars-orbit-pnt-title = Orbiteur martien avec relais et liaison avec la Terre

js-cat-mars-pnt-lmo-question = Une constellation de relais MARCONI peut-elle faire naviguer un utilisateur sur Mars ? (FoM de covariance, et non un PL certifié)

js-cat-mars-pnt-lmo-title = PNT martien, orbite basse

js-cat-mars-pnt-surface-question = Dans quelle mesure un atterrisseur ou un rover sur la surface martienne en rotation peut-il naviguer par rapport à la constellation de relais ?

js-cat-mars-pnt-surface-title = PNT martien, surface

js-cat-mars-pnt-transfer-question = Dans quelle mesure un véhicule sur un arc d'approche ou de capture haut et excentrique navigue-t-il sur Mars ?

js-cat-mars-pnt-transfer-title = PNT martien, transfert

js-cat-meo-leo-fused-pvt-question = Que fait l'ajout d'une couche en orbite basse au GPS et à Galileo sur l'erreur de position et la géométrie ? (modélisé)

js-cat-meo-leo-fused-pvt-title = Position fusionnée GNSS et orbite basse

js-cat-moonlight-service-volume-question = Quels DOP, couverture et intégrité une constellation de classe Moonlight/LCNS donne-t-elle au pôle sud ? (modélisé)

js-cat-moonlight-service-volume-title = Volume de service lunaire

js-cat-multi-band-jamming-waterfall-question = Avec des signaux de navigation répartis sur quatre bandes, que laisse debout un brouilleur conçu pour une seule bande ? (modélisé)

js-cat-multi-band-jamming-waterfall-title = Cascade de brouillage multibande

js-cat-notinbrowser-elevation-model = Nécessite l'extrait du modèle d'élévation lunaire ({ $path }) livré avec le dépôt, et non avec la version pour navigateur.

js-cat-notinbrowser-laser-ranging-data = Nécessite la tranche de données de télémétrie laser archivées livrée avec le dépôt, et non avec la version pour navigateur.

js-cat-notinbrowser-study-suite = Une suite d'études, et non un scénario unique. Lancez-la avec l'outil en ligne de commande : { $command }.

js-cat-ntn-5g-positioning-question = Avec quelle précision un combiné peut-il se positionner à partir d'une liaison descendante d'un réseau 5G non terrestre, selon la largeur de bande du signal ? (modélisé)

js-cat-ntn-5g-positioning-title = Positionnement par liaison descendante satellite 5G

js-cat-oem-interop-question = Une éphéméride OEM de GMAT / Orekit / STK peut-elle être importée et refaire l'aller-retour ?

js-cat-oem-interop-title = Passerelle CCSDS OEM

js-cat-optical-atmosphere-network-question = À quelle fréquence une liaison de synchronisation optique est-elle disponible à travers nuages et turbulence, et qu'apportent des sites au sol supplémentaires ? (modélisé ; climats nuageux illustratifs)

js-cat-optical-atmosphere-network-title = Liaison optique à travers l'atmosphère, trois sites

js-cat-optical-atmosphere-techniques-question = Qu'apportent une plus grande ouverture, une autre longueur d'onde ou l'optique adaptative à une liaison montante optique sous nuages et turbulence ? (modélisé ; climat nuageux illustratif)

js-cat-optical-atmosphere-techniques-title = Techniques de liaison optique

js-cat-orbit-gnss-challenged-question = Quand une position est-elle seulement possible d'après la géométrie des satellites ?

js-cat-orbit-gnss-challenged-title = Disponibilité du GNSS

js-cat-orbit-molniya-question = Un utilisateur sur une orbite Molniya très excentrique voit-il encore assez de satellites GNSS près de l'apogée ?

js-cat-orbit-molniya-title = Utilisateur Molniya

js-cat-orbit-multignss-question = De combien GPS + Galileo ensemble relèvent-ils la disponibilité et resserrent-ils la dilution de précision ?

js-cat-orbit-multignss-title = Disponibilité multi-GNSS

js-cat-orbit-real-tle-question = Quelle couverture une constellation réelle, donnée sous forme d'éléments à deux lignes, fournit-elle ?

js-cat-orbit-real-tle-title = Éléments à deux lignes réels

js-cat-orbit-rinex-question = Quelle disponibilité sort d'une vraie éphéméride diffusée RINEX 3 ?

js-cat-orbit-rinex-title = Éphéméride diffusée

js-cat-orbit-sgp4-gps-question = Comment une vraie constellation de type GPS se propage-t-elle sur une journée ?

js-cat-orbit-sgp4-gps-title = Orbites SGP4

js-cat-orbit-urban-canyon-skyline-question = Au fond d'une rue de ville, pendant quelle part de la journée le GPS et Galileo donnent-ils quatre satellites, et qu'est-ce que la bande de ciel fait au PDOP ? (modélisé ; profil d'horizon représentatif)

js-cat-orbit-urban-canyon-skyline-title = Disponibilité dans une rue de ville

js-cat-passes-question = Quand un satellite se lève-t-il et se couche-t-il au-dessus d'une station, et pendant combien de temps ?

js-cat-passes-title = Passages au sol

js-cat-polar-arctic-leo-coverage-question = De l'équateur au pôle, comment les satellites en vue et la géométrie changent-ils avec le GNSS seul, une couche polaire en orbite basse seule, et les deux ? (modélisé)

js-cat-polar-arctic-leo-coverage-title = De l'équateur au pôle

js-cat-pvt-abmf-question = La position d'un vrai récepteur peut-elle être résolue à partir de mesures RINEX brutes ?

js-cat-pvt-abmf-title = Positionnement (SPP)

js-cat-quantum-anomaly-detect-question = Dans quelle mesure les pannes d'un système quantique sont-elles détectées à un taux de fausses alarmes fixé ? (modélisé)

js-cat-quantum-anomaly-detect-title = Détection d'anomalies quantiques

js-cat-quantum-cai-coast-question = Combien de temps un interféromètre à atomes froids, spécifié par sa physique, maintient-il l'estime à moins de 100 m après la perte du GNSS, face à un accéléromètre à quartz de classe navigation ? (modélisé)

js-cat-quantum-cai-coast-title = Roue libre d'un accéléromètre quantique

js-cat-quantum-gnss-free-nav-question = De combien un navigateur à atomes froids dérive-t-il en roue libre, par rapport à une INS de classe navigation, sans GNSS ? (modélisé)

js-cat-quantum-gnss-free-nav-title = Navigation quantique sans GNSS

js-cat-quantum-pnt-demonstrator-suite-question = Les trois domaines d'application quantiques en une seule étude (une suite d'études en ligne de commande : kshana --study).

js-cat-quantum-pnt-demonstrator-suite-title = Étude de démonstrateur PNT quantique

js-cat-quantum-time-transfer-question = Qu'apporte une synchronisation quantique de confiance par rapport à une chaîne CSAC + RF classique ? (modélisé)

js-cat-quantum-time-transfer-title = Transfert de temps quantique

js-cat-quantum-trade-question = Quel holdover de temps / inertiel une horloge candidate apporte-t-elle par rapport à une référence de base classique ? (modélisé)

js-cat-quantum-trade-title = Étude comparative PNT quantique

js-cat-rail-tunnel-coast-question = À 160 km/h dans un tunnel, au bout de combien de temps une INS de classe tactique sort-elle de son budget ? (modélisé)

js-cat-rail-tunnel-coast-title = Train dans un tunnel

js-cat-realtime-frame-eop-question = Quelle erreur de référentiel l'orientation de la Terre en temps réel (prédite) introduit-elle ? (modélisé)

js-cat-realtime-frame-eop-title = Référentiel/EOP en temps réel

js-cat-reentry-question = Quels pic de g et vitesse au pic d'échauffement une rentrée balistique subit-elle ?

js-cat-reentry-title = Corridor de rentrée

js-cat-slot-timing-ocxo-leo-question = Combien de temps un oscillateur à quartz thermostaté sur un petit satellite en orbite basse reste-t-il dans sa garde de créneau après la dernière position GNSS ? (modélisé)

js-cat-slot-timing-ocxo-leo-title = Synchronisation de créneau

js-cat-small-uas-jammed-nav-question = Après qu'un brouilleur a supprimé le GNSS, de combien une centrale inertielle de classe contrôleur de vol dérive-t-elle, par rapport à une centrale de classe tactique ?

js-cat-small-uas-jammed-nav-title = Petit drone sous brouillage

js-cat-solar-system-tour-question = Où se trouve chaque corps que connaît le moteur, du Soleil à Pluton et aux grandes lunes, et combien de temps la lumière met-elle pour aller de l'un à l'autre ?

js-cat-solar-system-tour-title = Système solaire à une époque

js-cat-space-packet-question = Un flux de paquets CCSDS 133.0 s'encode-t-il et se décode-t-il bit à bit ?

js-cat-space-packet-title = Space Packet

js-cat-space-weather-question = Comment l'activité solaire / géomagnétique modifie-t-elle la densité thermosphérique ? (modélisé)

js-cat-space-weather-title = Météorologie spatiale

js-cat-spoof-attack-question = Un leurrage de temps à dérive progressive est-il détecté avant d'atteindre la spécification ?

js-cat-spoof-attack-title = Détection de leurrage

js-cat-spoof-detect-question = Un moniteur fusionnant RF + mesures peut-il détecter un leurrage coordonné ?

js-cat-spoof-detect-title = Détection de leurrage multicouche

js-cat-spoof-meaconing-question = Avec une forme d'attaque explicite, à quelle fréquence un détecteur d'énergie assisté par l'horloge détecte-t-il le leurrage à un taux de fausses alarmes fixé ?

js-cat-spoof-meaconing-title = Statistiques du détecteur de leurrage

js-cat-starlink-sop-doppler-positioning-question = Dans quelle mesure un récepteur peut-il se positionner à partir du Doppler d'une constellation à large bande qui n'envoie aucun message de navigation ? (modélisé)

js-cat-starlink-sop-doppler-positioning-title = Signaux d'opportunité à large bande

js-cat-sweep-clock-stability-question = Comment le holdover change-t-il quand un paramètre d'horloge est balayé ?

js-cat-sweep-clock-stability-title = Balayage de paramètre

js-cat-sweep-nd-inertial-question = Comment une figure de mérite varie-t-elle sur une grille multiparamètre ?

js-cat-sweep-nd-inertial-title = Balayage à N dimensions

js-cat-telecom-prtc-holdover-24h-question = Une référence au rubidium qui perd le GNSS pendant 24 heures reste-t-elle dans les gabarits d'erreur de temps de l'UIT-T ? (modélisé)

js-cat-telecom-prtc-holdover-24h-title = Holdover télécom, 24 h

js-cat-telecom-synce-eec-question = Un oscillateur thermostaté en roue libre reste-t-il dans les gabarits de dérive d'horloge d'équipement de l'Ethernet synchrone ? (modélisé)

js-cat-telecom-synce-eec-title = Synchronisation de fréquence face aux gabarits SyncE

js-cat-telecom-tie-ingest-question = Un enregistrement d'erreur d'intervalle de temps passe-t-il les gabarits MTIE et TDEV de l'UIT-T ?

js-cat-telecom-tie-ingest-title = Vérification de gabarits télécom, vos données

js-cat-terrain-nav-question = Un altimètre peut-il corriger la dérive d'une INS en corrélant un profil d'élévation du relief ?

js-cat-terrain-nav-title = Navigation par le relief

js-cat-terrain-slam-question = Un filtre particulaire peut-il suivre une dérive d'INS variable dans le temps par rapport à une carte du relief ?

js-cat-terrain-slam-title = SLAM par le relief

js-cat-time-transfer-budget-question = Que font les termes de station, de transpondeur, d'ionosphère et de Sagnac à un décalage de temps bidirectionnel, et quel est son budget d'incertitude ? (modélisé)

js-cat-time-transfer-budget-title = Transfert de temps bidirectionnel par satellite

js-cat-timetransfer-question = Avec quelle finesse deux sites peuvent-ils rester synchronisés par une liaison ?

js-cat-timetransfer-title = Transfert de temps

js-cat-tracking-loop-question = À quel C/N0 un récepteur perd-il réellement l'accrochage, et un leurre peut-il faire décrocher les boucles ? (modélisé)

js-cat-tracking-loop-title = Boucle de poursuite

js-cat-xona-pulsar-end-to-end-question = La même chaîne avec les chiffres publics de Xona Pulsar : signal, passage, message, position fusionnée et positionnement précis. (modélisé)

js-cat-xona-pulsar-end-to-end-title = De bout en bout, Xona Pulsar

js-cat-xona-pulsar-signals-question = Avec quelle précision un récepteur peut-il mesurer la distance sur les signaux X1 et X5 publiés, et quelle est la taille de la recherche d'acquisition ? (table de signaux publique)

js-cat-xona-pulsar-signals-title = Signaux Xona Pulsar

js-geo-a-place = Un lieu…

js-geo-axis-east = E +{ $ext } m

js-geo-axis-north = N +{ $ext } m

js-geo-canyon-needs = La forme en canyon urbain nécessite le moteur 0.36.

js-geo-canyon-out-of-range = Les valeurs du canyon urbain sont hors plage (azimut 0 à 359,9°, largeur 1 à 200 m, hauteurs 0 à 500 m, antenne 0 à 50 m) ; un horizon dégagé est utilisé.

js-geo-canyon-reduced = La réduction du canyon à une table de 360 intervalles par le moteur.

js-geo-compute-failed = Le moteur n'a pas pu calculer ce ciel : { $reason }

js-geo-computing = Calcul en cours…

js-geo-copy-link = Copiez ce lien : { $url }

js-geo-count-below = Sous l'horizon

js-geo-count-hidden = Masqués par le profil d'horizon

js-geo-count-in-view = En vue

js-geo-count-open-sky = Ciel dégagé

js-geo-count-used = Dans la solution

js-geo-cursor-live = Azimut { $az }°, profil d'horizon { $el }°.

js-geo-dated-sky = Un ciel daté, seulement aussi bon que les éléments et leur âge ; les préréglages sont écartés.

js-geo-dop-geometric = géométrique

js-geo-dop-geometric-title = dilution de précision géométrique

js-geo-dop-horizontal = horizontale

js-geo-dop-horizontal-title = dilution de précision horizontale

js-geo-dop-position = position, 3D

js-geo-dop-position-title = position, dilution de précision 3D

js-geo-dop-time = temps

js-geo-dop-time-title = dilution de précision temporelle

js-geo-dop-vertical = verticale

js-geo-dop-vertical-title = dilution de précision verticale

js-geo-east = E

js-geo-engine-not-running = Le moteur ne s'exécute pas dans ce navigateur ({ $reason }).

js-geo-err-geometry-object = la réponse de géométrie du moteur n'est pas un objet

js-geo-err-mc-object = la réponse Monte-Carlo du moteur n'est pas un objet

js-geo-err-no-sentences = la réponse du moteur ne contient aucune phrase

js-geo-err-reply-kind-not-json = la réponse { $what } du moteur n'était pas du JSON

js-geo-err-reply-not-json = la réponse du moteur n'était pas du JSON

js-geo-error-line = Avec σ_UERE = { $uere } m, sous le modèle d'erreur indiqué (chiffres du moteur) : { $bits }.

js-geo-error-line-needs = Erreur de position ≈ σ_UERE × HDOP à l'horizontale et σ_UERE × VDOP à la verticale ; ce chiffre nécessite le moteur 0.36.

js-geo-error-rms-3d = RMS 3D σ_UERE × PDOP = { $m } m

js-geo-error-rms-h = RMS horizontal σ_UERE × HDOP = { $m } m

js-geo-error-sigma = Erreur à 1 sigma : est { $east } m, nord { $north } m

js-geo-fact-ellipse-1s = Ellipse, 1 sigma

js-geo-fact-ellipse-1s-value = { $major } m × { $minor } m, grand axe à { $deg }° du nord

js-geo-fact-ellipse-pct = Ellipse, { $pct } %

js-geo-fact-ellipse-pct-scaled = { $major } m × { $minor } m (1 sigma × { $k })

js-geo-fact-ellipse-pct-value = { $major } m × { $minor } m

js-geo-fact-inside = Dans l'ellipse à 95 %

js-geo-fact-inside-value = { $pct } % des points

js-geo-fact-line = { $key } : { $value }.

js-geo-fact-mc = Monte-Carlo

js-geo-fact-mc-value =
    { $n ->
        [one] { $n } solution des moindres carrés, graine { $seed }
        [many] { $n } de solutions des moindres carrés, graine { $seed }
       *[other] { $n } solutions des moindres carrés, graine { $seed }
    }

js-geo-fact-rms-3d = RMS du nuage, 3D

js-geo-fact-rms-3d-beside = { $rms } m, à côté de σ_UERE × PDOP = { $predicted } m

js-geo-fact-rms-h = RMS du nuage, horizontal

js-geo-fact-rms-h-beside = { $rms } m, à côté de σ_UERE × HDOP = { $predicted } m

js-geo-fact-rms-value = { $rms } m

js-geo-gj-not-geojson = { $name } : pas du GeoJSON (une FeatureCollection, une Feature ou une géométrie était attendue).

js-geo-gj-not-json = { $name } : pas du JSON ({ $reason }).

js-geo-gj-not-object = { $name } : pas un objet GeoJSON.

js-geo-gj-too-many = { $name } : { $count } entités ; cette page en trace au plus { $max }.

js-geo-legend-item = { $label } : { $used } dans la solution sur { $total }

js-geo-link-copied = Lien copié.

js-geo-link-copied-no-tle = Lien copié (sans vos éléments collés : un lien ouvre les préréglages).

js-geo-mc-off = Désactivé

js-geo-missing-ellipse = l'ellipse d'erreur

js-geo-missing-gdop = GDOP

js-geo-missing-leo = LEO

js-geo-missing-monte-carlo = le nuage Monte-Carlo

js-geo-missing-open-sky = la fraction de ciel dégagé

js-geo-missing-skyline = le profil d'horizon

js-geo-missing-tdop = TDOP

js-geo-needs = nécessite le moteur 0.36

js-geo-needs-cap = Nécessite le moteur 0.36

js-geo-no = Non

js-geo-no-ellipse = Pas d'ellipse

js-geo-no-sats = Aucun satellite à afficher.

js-geo-north = N

js-geo-not-given = non indiqué

js-geo-note-elements-skipped = { $count } jeu(x) d'éléments ignoré(s) : { $list }.

js-geo-note-latitude-limited = Cette version du moteur modélise des sites à moins de 89° de l'équateur ; la latitude a été limitée à cette valeur.

js-geo-note-leo-left-out = LEO : nécessite le moteur 0.36 ; écarté.

js-geo-note-no-engine = Le moteur ne s'exécute pas dans ce navigateur : il n'y a donc rien à afficher. Il s'exécute en WebAssembly ; un navigateur ou un hôte qui bloque WebAssembly ne peut pas exécuter cette vue.

js-geo-note-pick-one = Choisissez au moins un parmi GPS, Galileo et BeiDou.

js-geo-note-skyline-not-applied = Le profil d'horizon est tracé mais non appliqué : l'appliquer nécessite le moteur 0.36. Les satellites derrière lui comptent toujours ici.

js-geo-note-skyline-source = Profil d'horizon : { $source }.

js-geo-note-training-model = Moteur { $version }, modèle de ciel d'entraînement (nmea_training) à { $instant } : angles en degrés entiers et DOP à une décimale, comme les portent les phrases du récepteur ; la position utilise au plus 12 satellites, choisis selon la force du signal.

js-geo-note-unknown-systems = { $count } enregistrement(s) de satellite d'un système que cette vue ne trace pas ont été écartés.

js-geo-off-leo = LEO : nécessite le moteur 0.36.

js-geo-off-monte-carlo = Le nuage Monte-Carlo nécessite le moteur 0.36.

js-geo-off-skyline = Appliquer un profil d'horizon nécessite le moteur 0.36 : ici, il est seulement tracé.

js-geo-offset-own = Décalage par rapport à l'époque de vos éléments ({ $epoch })

js-geo-offset-ref = Décalage par rapport à l'époque de référence des constellations

js-geo-open-sky-share = { $pct } % de l'hémisphère supérieur

js-geo-out-of-range = Hors plage, donc conservé à la dernière bonne valeur : { $names }.

js-geo-own-elements-at = Vos propres éléments à { $epoch }.

js-geo-pick-constellation = Choisissez au moins une constellation.

js-geo-place-geiranger = Geirangerfjord, Norvège

js-geo-place-manhattan = Midtown Manhattan, États-Unis

js-geo-place-oslo = Port d'Oslo, Norvège

js-geo-place-rotterdam = Port de Rotterdam, Pays-Bas

js-geo-place-singapore = Détroit de Singapour

js-geo-place-tallinn = Port de Tallinn, Estonie

js-geo-place-tromso = Tromsø, Norvège

js-geo-plot-desc =
    { $total ->
        [one] { $total } satellite dans le tracé, { $used } dans la solution.
        [many] { $total } de satellites dans le tracé, { $used } dans la solution.
       *[other] { $total } satellites dans le tracé, { $used } dans la solution.
    }

js-geo-preset-illustrative = Contour illustratif tracé par cette page ; appliquer un profil d'horizon nécessite le moteur 0.36.

js-geo-ready = Prêt.

js-geo-ready-needs = Prêt. Nécessite le moteur 0.36 : { $list }.

js-geo-sat-masked = { $label } { $id } : azimut { $az }°, élévation { $el }°, masqué par le profil d'horizon

js-geo-sat-unused = { $label } { $id } : azimut { $az }°, élévation { $el }°, non utilisé

js-geo-sat-used = { $label } { $id } : azimut { $az }°, élévation { $el }°, dans la solution

js-geo-scenarios-under = Les scénarios du moteur sous ce profil d'horizon :

js-geo-sky-canyon = Canyon urbain

js-geo-sky-drawn = Tracé sur le skyplot

js-geo-sky-open = Horizon dégagé

js-geo-sky-preset = Préréglage : { $name }

js-geo-sky-source = Ciel : { $source }.

js-geo-skyline-city-street = Rue de ville

js-geo-skyline-container = Terminal à conteneurs

js-geo-skyline-fjord = Fjord

js-geo-skyline-harbour = Approche du port

js-geo-skyline-load-failed = Le profil d'horizon n'a pas pu être chargé ({ $reason }).

js-geo-skyplot-downloaded = Skyplot téléchargé.

js-geo-skyplot-export-failed = Le skyplot n'a pas pu être exporté ({ $reason }).

js-geo-source-geometry = Moteur Kshana { $version }, sky_geometry

js-geo-source-line = { $source }.

js-geo-source-training = Moteur Kshana { $version }, modèle de ciel d'entraînement

js-geo-south = S

js-geo-style-own-elements = Vos éléments

js-geo-svg-refused = le SVG du moteur a été refusé

js-geo-table-count =
    { $n ->
        [one] { $n } satellite, comme sur le skyplot.
        [many] { $n } de satellites, comme sur le skyplot.
       *[other] { $n } satellites, comme sur le skyplot.
    }

js-geo-tle-epoch = Indiquez une époque UTC de 2000 à 2099.

js-geo-tle-paste-first = Collez d'abord un ou plusieurs jeux d'éléments à deux lignes.

js-geo-tle-too-large = Les éléments collés dépassent 4 Mio, la limite d'entrée du moteur.

js-geo-used-masked = Non : masqué par le profil d'horizon

js-geo-using-own = Utilisation de vos propres éléments. Un lien indique seulement que vous les avez utilisés, pas les éléments eux-mêmes.

js-geo-wasm-blocked = WebAssembly est bloqué

js-geo-west = O

js-geo-why = Pourquoi

js-geo-why-interim = L'ellipse d'erreur et le nuage Monte-Carlo nécessitent le moteur 0.36 (ses fonctions sky_geometry et sky_monte_carlo) ; le moteur de cette page est plus ancien.

js-geo-why-no-ellipse = Le moteur n'a donné aucune ellipse pour cette géométrie (trop peu de satellites pour une position, ou géométrie singulière).

js-geo-why-no-ellipse-reason = Le moteur n'a donné aucune ellipse pour cette géométrie (trop peu de satellites pour une position, ou géométrie singulière) : { $reason }.

js-geo-why-waiting = En attente du moteur.

js-geo-yes = Oui

js-hold-axis-seconds = secondes depuis le premier échantillon

js-hold-axis-tau = temps d'observation τ, s (log)

js-hold-axis-te = erreur de temps, ns

js-hold-band-title = Bande de récupération ±{ $band } ns

js-hold-blurb-example = Échantillons toutes les 5 s : 600 s verrouillé, GNSS retiré à 600 s, holdover, GNSS rétabli à 2400 s. L'enregistrement est généré pour l'exemple ; ce n'est pas une mesure.

js-hold-blurb-ptp4l = Les mêmes quatre étapes lues dans un journal d'asservissement ptp4l (le décalage propre au démon, en ns). Le journal est écrit pour l'exemple ; aucun démon n'a tourné.

js-hold-budget-exceeded = { $name } dépassé pour la première fois { $s } s après le retrait

js-hold-chip-baseline = Référence de base face à ses gabarits

js-hold-chip-envelope = Enveloppe de holdover ePRTC-A

js-hold-chip-holdover = Holdover face à ses gabarits

js-hold-chip-measured = mesuré face au gabarit

js-hold-chip-recovery = Récupération

js-hold-chip-words = Mots

js-hold-curve-title = { $step } : { $which }, ns

js-hold-curves-aria = { $which } en fonction du temps d'observation, avec les limites des gabarits

js-hold-envelope-exceeded = Enveloppe de holdover ePRTC-A dépassée pour la première fois { $s } s après le retrait

js-hold-envelope-exceeded-short = { $verdict }, dépassée pour la première fois { $s } s après le retrait (l'enregistrement est plus court que la période de l'enveloppe)

js-hold-envelope-exceeded-value = { $verdict }, dépassée pour la première fois { $s } s après le retrait

js-hold-envelope-short = { $verdict } (l'enregistrement est plus court que la période de l'enveloppe)

js-hold-file-error = { $name } : { $error }.

js-hold-file-not-json = { $name } : pas du JSON.

js-hold-file-read-here = { $name }, lu ici ; rien n'a été téléversé.

js-hold-file-too-large = { $name } est plus grand que ce que cette page lit.

js-hold-from-record = l'enregistrement du résultat

js-hold-from-record-decimated = l'enregistrement du résultat, décimé à { $have } échantillons sur { $total }

js-hold-gnss-removed = GNSS retiré

js-hold-gnss-removed-stated = GNSS retiré (indiqué par l'opérateur)

js-hold-gnss-restored = GNSS rétabli

js-hold-gnss-restored-stated = GNSS rétabli (indiqué par l'opérateur)

js-hold-largest-at = { $value } à T+{ $time } s

js-hold-limit-label = Gabarit { $step } ±{ $ns } ns

js-hold-limit-title = { $id } : ±{ $ns } ns, l'erreur de temps absolue maximale sur l'étape { $step }

js-hold-mark-title = { $id } limite { $limit } ns à τ { $tau } s ({ $verdict } ; { $source })

js-hold-marker-time = { $name }, T+{ $time } s

js-hold-na = n/d

js-hold-no-curve = Pas de courbe d'erreur de temps : l'enregistrement n'a pas pu être reproduit pour le tracé.

js-hold-no-which-curve = Pas de courbe { $which } dans ce résultat.

js-hold-not-exceeded = non dépassé

js-hold-not-recovered = n'est pas resté dans la bande

js-hold-not-result = ceci n'est pas un résultat de test de holdover

js-hold-open-failed = { $title } n'a pas pu être ouvert : { $reason }.

js-hold-opening = Ouverture de { $title }…

js-hold-phase-baseline = Référence de base : verrouillé

js-hold-phase-holdover = Holdover : GNSS retiré

js-hold-phase-recovery = Récupération : GNSS rétabli

js-hold-phase-title = { $phase }, T+{ $from } s à { $to } s

js-hold-read-failed = N'a pas pu être lu ni tracé ({ $reason }).

js-hold-recorded = { $title } : le résultat enregistré du moteur (version { $version }).

js-hold-recovered = dans ±{ $band } ns pendant { $dwell } s, { $after } s après le retour du GNSS

js-hold-result-not-json = le résultat n'est pas du JSON ({ $reason })

js-hold-result-not-loaded = le résultat enregistré ne s'est pas chargé

js-hold-row-envelope = Enveloppe de holdover ePRTC-A

js-hold-row-frequency = Décalage de fréquence tenu (pente ajustée)

js-hold-row-largest = Plus grande erreur de temps absolue

js-hold-row-length = Durée du holdover

js-hold-row-margin = Plus petite marge dans l'enveloppe

js-hold-row-peak = Pic après rétablissement

js-hold-row-recovery = Récupération

js-hold-row-recovery-step = Plus grand saut pendant la récupération

js-hold-row-residual = Résidu autour de cette droite (rms)

js-hold-row-step = Saut au moment du retrait

js-hold-status-final = { $status } { $label } ; mesuré face au gabarit.

js-hold-step-span = T+{ $from } à { $to } s

js-hold-te-aria = Erreur de temps sur l'enregistrement, avec les phases et les limites des gabarits

js-hold-te-line-title = Erreur de temps, ns

js-hold-te-note = Erreur de temps à partir de { $from }. Les deux instants ont été indiqués par { $by }.

js-hold-th-budget = Budget

js-hold-th-budget-limit = Limite |TE|, ns

js-hold-th-first-exceeded = Premier dépassement après le retrait, s

js-hold-th-largest = |TE| maximale, ns

js-hold-th-limit = Limite, ns

js-hold-th-margin = Marge, ns

js-hold-th-mask = Gabarit

js-hold-th-mean = Moyenne, ns

js-hold-th-measured-on = Mesuré sur

js-hold-th-metric = Métrique

js-hold-th-rms = RMS, ns

js-hold-th-samples = Échantillons

js-hold-th-source = Source

js-hold-th-span = Étendue

js-hold-th-step = Étape

js-hold-th-value = Valeur, ns

js-hold-th-verdict = Verdict

js-hold-th-worst-at = Pire à τ ou T+, s

js-hold-title-example = Un enregistrement d'erreur de temps

js-hold-title-ptp4l = Un journal linuxptp

js-hold-why-no-samples = le résultat ne contient aucun échantillon d'erreur de temps (record.series) : aucune courbe n'est donc tracée

js-hold-why-not-series = la série du résultat n'est pas une série temporelle (moins de deux échantillons, ou temps non croissant) : aucune courbe n'est donc tracée

js-hold-why-sentence = { $why }.

js-hold-why-too-many = la série du résultat compte { $have } échantillons là où le moteur en a noté { $scored } : aucune courbe n'est donc tracée

js-interf-attribution = Attribution

js-interf-build-failed = { $name } : n'a pas pu être construit ({ $reason }).

js-interf-built-day-maps =
    { $n ->
        [one] { $n } carte journalière construite à partir de { $name } avec le moteur { $version }, dans ce navigateur.
        [many] { $n } de cartes journalières construites à partir de { $name } avec le moteur { $version }, dans ce navigateur.
       *[other] { $n } cartes journalières construites à partir de { $name } avec le moteur { $version }, dans ce navigateur.
    }

js-interf-built-detail = { $date } : { $published } cellules publiées, { $flagged } signalées

js-interf-built-from-sample = Construit à partir de l'échantillon synthétique { $kind } avec le moteur, dans ce navigateur. Relevés inventés ; ni vrai aéronef, ni vrai navire, ni vrai jour.

js-interf-built-maps =
    { $n ->
        [one] { $n } carte construite ({ $detail }). Agrégat seulement : une cellule signalée ne désigne pas l'interférence comme cause.
        [many] { $n } de cartes construites ({ $detail }). Agrégat seulement : une cellule signalée ne désigne pas l'interférence comme cause.
       *[other] { $n } cartes construites ({ $detail }). Agrégat seulement : une cellule signalée ne désigne pas l'interférence comme cause.
    }

js-interf-built-none = { $name } : le moteur n'a construit aucune carte.

js-interf-caveat-coverage = La couverture suit la source de données ; lisez les notes de couverture.

js-interf-caveat-no-colour = Une cellule sans couleur n'a pas été observée. Ce n'est pas la preuve que la zone était dégagée.

js-interf-caveat-not-finding = Une cellule dégradée ou anormale n'est pas un constat d'interférence. D'autres causes existent.

js-interf-caveat-past-reports = Ceci est une description de relevés de position passés, non une prévision et non une mesure d'un récepteur quelconque.

js-interf-caveats = Réserves

js-interf-cell-size-rule = La taille de cellule doit être un nombre de degrés supérieur à 0 et d'au plus 10, ou vide pour 0,5.

js-interf-check-failed = { $name } : n'a pas pu être vérifié ({ $reason }).

js-interf-click-cell = Cliquez sur une cellule, ou placez le focus sur la carte et utilisez les flèches, pour voir ses chiffres.

js-interf-close = Fermer

js-interf-close-file = Fermer { $name }

js-interf-col-affected = Touchés

js-interf-col-cell-area = Aire de la cellule

js-interf-col-detectors = Détecteurs

js-interf-col-observed = Observés

js-interf-col-sampled = Échantillonnés

js-interf-col-share = Part

js-interf-col-status = État

js-interf-coverage-limits = Limites de couverture de cette source

js-interf-csv-too-big = { $name } : plus grand que 24 Mio ; construisez à partir d'un extrait (l'outil en ligne de commande accepte un fichier entier).

js-interf-csv-too-big-short = { $name } : plus grand que 24 Mio ; construisez à partir d'un extrait.

js-interf-custom-needs-licence = Un jeu de données personnalisé exige la licence, son URL et le texte d'attribution : ils sont écrits dans le fichier de carte.

js-interf-dataset = Jeu de données

js-interf-dates-rule = Les dates sont au format AAAA-MM-JJ, ou vides pour aucune limite.

js-interf-day = Jour

js-interf-day-aria = Jour { $kind }

js-interf-day-confounded-note = Ce jour est perturbé : aucune cellule n'a été jugée dégradée à cause du bruit de fond du jour. Les cellules qui auraient autrement ressorti sont affichées comme non évaluées.

js-interf-day-figures-aria = Chiffres du jour

js-interf-demo-csv-name = { $file } (échantillon synthétique)

js-interf-demo-failed = La démonstration n'a pas pu être ouverte : { $reason }.

js-interf-demo-opened = Démonstration synthétique : trois fichiers inventés sur une région de haute mer inventée (deux jours ADS-B, dont un perturbé, et un jour AIS). Aucun vrai aéronef, navire ni jour n'est derrière eux. Utilisez le sélecteur de jour sur la couche ADS-B.

js-interf-demo-route-name = route.csv (synthétique)

js-interf-describe-map = Carte { $kind } pour { $date } : { $cells } cellules tracées, { $parts }. Les cellules non tracées n'ont pas été observées.

js-interf-did-not-load = { $url } ne s'est pas chargé

js-interf-engine-no-fn = Cette version du moteur (version { $version }) n'a pas de { $fn } ; elle est antérieure à cette page. L'équivalent en ligne de commande se trouve dans la page Outils.

js-interf-engine-start-failed = Le moteur n'a pas pu démarrer ici ({ $reason }). L'ouverture de fichiers de carte ci-dessus fonctionne toujours.

js-interf-err-format-version = { $name } : pas une carte d'interférence Kshana prise en charge (format_version { $version } ; cette page prend en charge { $supported }).

js-interf-err-no-rows = { $name } : pas de rows[] dans ce rapport.

js-interf-err-not-json = { $name } : pas du JSON ({ $reason }).

js-interf-err-not-map = { $name } : c'est du GeoJSON mais pas une carte d'interférence Kshana (pas de membre kshana_interference_map).

js-interf-err-not-route = { $name } : pas un rapport d'exposition de route Kshana (pas de membre kshana_route_exposure).

js-interf-err-route-schema = { $name } : le schéma { $schema } n'est pas { $expected }, que cette page lit.

js-interf-err-source-kind = { $name } : source_kind { $kind } n'est ni adsb ni ais.

js-interf-err-unknown-schema = { $name } : schéma { $schema } inconnu ; cette page lit { $supported }.

js-interf-foot-attribution = Attribution : { $text }

js-interf-foot-coverage = Couverture : { $notes }

js-interf-foot-layer = Couche { $kind }, { $date }. Les cellules non tracées n'ont pas été observées.

js-interf-foot-licence = Licence : { $licence }

js-interf-foot-licence-url = Licence : { $licence } ({ $url })

js-interf-grid = Grille : cellules carrées de { $size }° en latitude et en longitude ({ $type }). La largeur est-ouest diminue avec la latitude.

js-interf-guards = Garde-fous contre d'autres causes

js-interf-input = Entrée

js-interf-land-set = Polygones de terre : { $name }.

js-interf-land-too-big = Ce fichier de terre est plus grand que 24 Mio.

js-interf-larger-than = { $name } : plus grand que { $limit } ; cette page lit des fichiers de carte jusqu'à cette taille.

js-interf-layer-adsb-sub = cellules où des aéronefs ont signalé une faible précision de navigation

js-interf-layer-ais-sub = cellules où des navires ont signalé des positions ou des mouvements invraisemblables

js-interf-layer-heading = Couche { $kind }

js-interf-layer-hidden = La couche { $kind } est masquée.

js-interf-layers-separate = ADS-B et AIS sont des couches distinctes, avec leurs propres bascules, légendes et lignes de licence. Elles ne sont jamais fusionnées en un seul champ de couleur ni en un seul compte.

js-interf-legend-aria = Ce que signifie chaque état de cellule ; décochez-en un pour estomper ces cellules

js-interf-licence = Licence

js-interf-licence-aria = Licence des données de { $name }

js-interf-licence-heading = Licence et attribution des données

js-interf-map-aria = { $summary } Les flèches permettent de passer d'une cellule tracée à l'autre.

js-interf-maps-open =
    { $n ->
        [one] { $n } carte ouverte.
        [many] { $n } de cartes ouvertes.
       *[other] { $n } cartes ouvertes.
    }

js-interf-method-summary = Méthode et réserves

js-interf-no-cell-at = Pas de cellule à { $lat }, { $lon } : non observée. Ce n'est pas la preuve que la zone était dégagée.

js-interf-no-cell-drawn = aucune cellule tracée

js-interf-no-cells-draw = Ce fichier n'a aucune cellule à tracer.

js-interf-no-day-figures = Ce fichier n'indique aucun chiffre au niveau du jour.

js-interf-no-file-opened = Aucun fichier n'a pu être ouvert.

js-interf-no-file-text = Les cartes ouvertes ne portent aucun texte de fichier à vérifier (elles n'ont pas été ouvertes en tant que fichiers).

js-interf-none = aucun

js-interf-none-stated = (aucun indiqué)

js-interf-none-stated-file = (aucun indiqué dans ce fichier)

js-interf-north-abbr = N

js-interf-not-evaluated = non évalué

js-interf-not-opened-full = { $name } : non ouvert, { $max } cartes sont déjà ouvertes. Fermez-en d'abord quelques-unes.

js-interf-nothing-open = Rien d'ouvert pour l'instant.

js-interf-nothing-opened = Rien n'a été ouvert.

js-interf-one-day = un jour à la fois

js-interf-opened-file-map = { $files } fichier ouvert ; { $maps } carte ouverte.

js-interf-opened-file-maps = { $files } fichier ouvert ; { $maps } cartes ouvertes.

js-interf-opened-files-map = { $files } fichiers ouverts ; { $maps } carte ouverte.

js-interf-opened-files-maps = { $files } fichiers ouverts ; { $maps } cartes ouvertes.

js-interf-opening-demo = Ouverture de la démonstration synthétique…

js-interf-parameters = Paramètres, fixés avant la lecture de toute donnée

js-interf-read-draw-failed = { $name } : n'a pas pu être lu ni tracé ({ $reason }).

js-interf-read-failed = { $name } : n'a pas pu être lu ({ $reason }).

js-interf-read-with-map = À lire avec la carte

js-interf-reading = Lecture…

js-interf-route-aria = Exposition de la route { $name }

js-interf-route-chip = Route

js-interf-route-done =
    { $n ->
        [one] Exposition de la route calculée à partir de { $n } carte avec le moteur { $version } ; le rapport est affiché ci-dessous.
        [many] Exposition de la route calculée à partir de { $n } de cartes avec le moteur { $version } ; le rapport est affiché ci-dessous.
       *[other] Exposition de la route calculée à partir de { $n } cartes avec le moteur { $version } ; le rapport est affiché ci-dessous.
    }

js-interf-route-explain = Part de la longueur de la route dans chaque état, par jour et par source. Les quatre parts totalisent 1 et se lisent ensemble : une faible part dégradée avec une forte part non observée n'a pas été montrée comme dégagée. Les lignes ADS-B et AIS ne sont jamais combinées.

js-interf-route-exposure = Exposition de la route

js-interf-route-needs-map = Ouvrez ou construisez d'abord au moins une carte : la route est vérifiée par rapport aux cartes de cette page.

js-interf-route-open-failed = La route n'a pas pu être ouverte : { $reason }.

js-interf-route-range = { $from } à { $to }

js-interf-route-too-big = { $name } : plus grand que 24 Mio.

js-interf-row-affected-share = Part touchée

js-interf-row-aircraft-affected = Aéronefs touchés

js-interf-row-aircraft-observed = Aéronefs observés

js-interf-row-aircraft-sampled = Aéronefs échantillonnés

js-interf-row-area = Aire

js-interf-row-cell = Cellule

js-interf-row-detectors = Détecteurs retenus

js-interf-row-flagged = Signalée : { $detector }

js-interf-row-status = État

js-interf-row-vessels-observed = Navires observés

js-interf-rows-skipped = { $count } ligne(s) n'étaient pas valides et ont été ignorées.

js-interf-rt-day = Jour

js-interf-rt-km = Km de route

js-interf-rt-licence = Licence et attribution de la carte

js-interf-rt-shares = Parts de la route

js-interf-rt-source = Source

js-interf-sample-failed = L'échantillon n'a pas pu être ouvert : { $reason }.

js-interf-save = Enregistrer :

js-interf-save-report = Enregistrer le rapport (JSON)

js-interf-show-layer = Afficher cette couche

js-interf-st-anomalous-label = Anormale

js-interf-st-anomalous-text = Au moins un détecteur a signalé ici ce jour-là assez de navires distincts (au moins 3 navires et 20 % de ceux observés). Les causes possibles incluent l'interférence, mais aussi de nombreuses causes ordinaires.

js-interf-st-confounded-label = Jour perturbé

js-interf-st-confounded-text = La part médiane des cellules sur toute la journée était élevée, ce qui désigne une cause étendue. Aucune cellule n'est déclarée dégradée un tel jour ; cette cellule aurait autrement ressorti.

js-interf-st-degraded-label = Dégradée

js-interf-st-degraded-text = Une forte part des aéronefs échantillonnés a signalé ici ce jour-là une faible précision de navigation, bien au-dessus de la cellule médiane du jour. Cela n'en dit pas la raison.

js-interf-st-no-background-label = Pas d'estimation du bruit de fond

js-interf-st-no-background-text = Le bruit de fond du jour (la part typique des aéronefs signalant une faible précision) n'a pas pu être estimé à partir d'assez de cellules : aucune cellule n'est donc comparée à lui et aucune n'est jugée.

js-interf-st-not-anomalous-label = Sans anomalie

js-interf-st-not-anomalous-text = Observée, et aucun détecteur n'a été retenu. Ce n'est pas la preuve qu'il ne s'est rien passé.

js-interf-st-not-degraded-label = Non dégradée

js-interf-st-not-degraded-text = Échantillonnée, et la part des aéronefs signalant une faible précision n'a pas ressorti. Ce n'est pas la preuve qu'il ne s'est rien passé.

js-interf-st-too-few-label = Trop peu d'aéronefs

js-interf-st-too-few-text = Publiée (au moins 5 aéronefs distincts observés) mais moins de 10 aéronefs ont pu être échantillonnés : aucun jugement n'est donc rendu.

js-interf-starting-build = Démarrage du moteur et construction…

js-interf-starting-route = Démarrage du moteur et vérification de la route…

js-interf-state-clear-adsb = Dégagée

js-interf-state-clear-adsb-text = Observée avec assez d'aéronefs et non signalée. Ce n'est pas la preuve qu'il ne s'est rien passé.

js-interf-state-clear-ais = Dégagée

js-interf-state-clear-ais-text = Observée avec assez de navires et non signalée. Ce n'est pas la preuve qu'il ne s'est rien passé.

js-interf-state-degraded-adsb = Dégradée

js-interf-state-degraded-adsb-text = Une forte part des aéronefs échantillonnés a signalé ici ce jour-là une faible précision de navigation, bien au-dessus de la cellule médiane du jour.

js-interf-state-degraded-ais = Anormale

js-interf-state-degraded-ais-text = Au moins un détecteur a signalé ici ce jour-là assez de navires distincts (au moins 3 navires et 20 % de ceux observés).

js-interf-state-notobs-adsb = Non observée

js-interf-state-notobs-adsb-text = Aucune cellule tracée : trop peu d'aéronefs ont été observés pour la publier. Ce n'est pas la preuve que la zone était dégagée.

js-interf-state-notobs-ais = Non observée

js-interf-state-notobs-ais-text = Aucune cellule tracée : trop peu de navires ont été observés pour la publier. Ce n'est pas la preuve que la zone était dégagée.

js-interf-state-unassessed-adsb = Non évaluée

js-interf-state-unassessed-adsb-text = Observée, mais trop peu d'aéronefs ont pu être échantillonnés, le jour était perturbé, ou le bruit de fond du jour n'a pas pu être estimé : aucun jugement n'est donc rendu.

js-interf-state-unassessed-ais = Non évaluée

js-interf-state-unassessed-ais-text = Observée, mais aucun jugement n'est rendu.

js-interf-status-unknown = Un état que cette page ne décrit pas.

js-interf-table-first = Les { $shown } premières cellules sur { $total } sont affichées, les jugements qui comptent d'abord.

js-interf-table-summary = Chaque cellule tracée sous forme de tableau ({ $n })

js-interf-the-day = Le jour

js-interf-unknown-date = date inconnue

js-interf-warn-cell-size = Ce fichier utilise une taille de cellule de { $size }° qui n'est pas celle préenregistrée : ce n'est pas la méthode préenregistrée, donc ses jugements ne sont pas comparables à ceux des fichiers qui l'utilisent.

js-interf-warn-cell-size-known = Ce fichier utilise une taille de cellule de { $size }° qui n'est pas celle préenregistrée ({ $registered }°) : ce n'est pas la méthode préenregistrée, donc ses jugements ne sont pas comparables à ceux des fichiers qui l'utilisent.

js-interf-warn-day-confounded = Ce jour est perturbé : aucune cellule n'a été jugée dégradée à cause du bruit de fond du jour (la part médiane des cellules était elle-même élevée).

js-interf-warn-flag-disagrees = { $count } cellule(s) ont un indicateur « dégradée » qui ne concorde pas avec leur état. C'est l'état qui est tracé.

js-interf-warn-no-licence = Ce fichier ne porte aucun texte { $fields }. Il est affiché, mais une carte sans sa licence ni son attribution ne doit pas être republiée.

js-interf-warn-on-land-off = Le détecteur sur terre était désactivé pour ce fichier (aucun polygone de terre n'a été fourni).

js-interf-warn-skipped = { $count } entité(s) n'étaient pas du GeoJSON valide et ont été ignorées.

js-interf-warn-unknown-status = Valeur(s) d'état que cette page ne connaît pas : { $values }. Elles sont tracées comme « pas de jugement ».

js-interf-withheld = retenu (moins de 5)

js-interf-written-by = écrit par Kshana { $version }

js-kind-axis-3-d-position-error-m = erreur de position 3D (m)

js-kind-axis-c-n0-db-hz = C/N0 (dB-Hz)

js-kind-axis-code-jitter-m = gigue de code (m)

js-kind-axis-code-tracking-jitter-m = gigue de poursuite de code (m)

js-kind-axis-doppler-shift-hz = décalage Doppler (Hz)

js-kind-axis-effective-c-n0-db-hz = C/N0 effectif (dB-Hz)

js-kind-axis-elevation = élévation (°)

js-kind-axis-fit-interval-s = intervalle d'ajustement (s)

js-kind-axis-formal-position-sigma-m = sigma de position formel (m)

js-kind-axis-latitude = latitude (°)

js-kind-axis-leo-satellites-added-to-the = satellites LEO ajoutés à la position

js-kind-axis-mean-satellites-in-view = nombre moyen de satellites en vue

js-kind-axis-median-dilution-of-precision = dilution de précision médiane

js-kind-axis-median-error-m = erreur médiane (m)

js-kind-axis-median-pdop = PDOP médian

js-kind-axis-metres = mètres

js-kind-axis-observation-window-s = fenêtre d'observation (s)

js-kind-axis-offset-from-the-signal-s = écart par rapport au centre du signal (MHz)

js-kind-axis-offset-from-the-snapshot-centre = écart par rapport au centre de l'instantané (MHz)

js-kind-axis-pdop = PDOP

js-kind-axis-position-error-m = erreur de position (m)

js-kind-axis-power-spectral-density-db-hz = densité spectrale de puissance (dB/Hz, puissance unitaire)

js-kind-axis-power-spectral-density-dbw-hz = densité spectrale de puissance (dBW/Hz)

js-kind-axis-probability-of-detection = probabilité de détection

js-kind-axis-range-error-m = erreur de distance (m)

js-kind-axis-relays = relais

js-kind-axis-sisre-root-mean-square-m = SISRE, valeur quadratique moyenne (m)

js-kind-axis-time-error-ns = erreur de temps (ns)

js-kind-axis-time-s = temps (s)

js-kind-axis-time-since-the-start-min = temps depuis le début (min)

js-kind-axis-update-period-s = période de mise à jour (s)

js-kind-cap-body-pnt-label = Positionnement par relais

js-kind-cap-campaign-label = Campagne

js-kind-cap-constellation-design-label = Couverture

js-kind-cap-leo-navmsg-label = Message de navigation

js-kind-cap-leo-pass-label = Passage et liaison

js-kind-cap-leo-pnt-chain-label = Chaîne de bout en bout

js-kind-cap-leo-ppp-label = Positionnement

js-kind-cap-leo-pvt-label = Positionnement

js-kind-cap-leo-signal-label = Conception du signal

js-kind-cap-lunar-llr-datum-label = Datum de télémétrie laser

js-kind-cap-ntn-positioning-label = Positionnement

js-kind-cap-solar-system-label = Système solaire

js-kind-cap-spectrum-label = Spectre

js-kind-guided-doppler-error-hz = Erreur Doppler (Hz)

js-kind-guided-duration-s = Durée (s)

js-kind-guided-earth-range-error-m = Erreur de distance à la Terre (m)

js-kind-guided-elevation-mask = Masque d'élévation (°)

js-kind-guided-first-jammer-bandwidth-mhz = Bande passante du premier brouilleur (MHz)

js-kind-guided-first-jammer-power-dbw = Puissance du premier brouilleur (dBW)

js-kind-guided-first-jammer-range-m = Distance du premier brouilleur (m)

js-kind-guided-first-jammer-received-power-dbw = Puissance reçue du premier brouilleur (dBW)

js-kind-guided-first-phase-length-s = Durée de la première phase (s)

js-kind-guided-first-shell-altitude-km = Altitude de la première coquille (km)

js-kind-guided-first-shell-inclination = Inclinaison de la première coquille (°)

js-kind-guided-first-signal-bandwidth-hz = Bande passante du premier signal (Hz)

js-kind-guided-first-system-range-error-m = Erreur de distance du premier système (m)

js-kind-guided-fit-interval-s = Intervalle d'ajustement (s)

js-kind-guided-gravity-field-degree = Degré du champ de gravité

js-kind-guided-grid-step = Pas de la grille (°)

js-kind-guided-integration-time-s = Temps d'intégration (s)

js-kind-guided-leo-satellites-in-the-sweep = Satellites LEO dans le balayage

js-kind-guided-loop-bandwidth-hz = Bande passante de boucle (Hz)

js-kind-guided-monte-carlo-runs = Exécutions Monte-Carlo

js-kind-guided-network-synchronisation-error-m = Erreur de synchronisation du réseau (m)

js-kind-guided-orbit-altitude-km = Altitude de l'orbite (km)

js-kind-guided-orbit-determination-error-m = Erreur de détermination d'orbite (m)

js-kind-guided-orbit-inclination = Inclinaison de l'orbite (°)

js-kind-guided-pdop-threshold = Seuil de PDOP

js-kind-guided-peak-elevation-of-the-pass = Élévation maximale du passage (°)

js-kind-guided-points-per-orbit-track = Points par trace d'orbite

js-kind-guided-receiver-noise-figure-db = Facteur de bruit du récepteur (dB)

js-kind-guided-receiver-power-when-awake-mw = Puissance du récepteur en activité (mW)

js-kind-guided-reference-c-n0-db-hz = C/N0 de référence (dB-Hz)

js-kind-guided-relay-altitude-km = Altitude des relais (km)

js-kind-guided-relay-inclination = Inclinaison des relais (°)

js-kind-guided-relay-planes = Plans de relais

js-kind-guided-relay-range-error-m = Erreur de distance aux relais (m)

js-kind-guided-relays-per-plane = Relais par plan

js-kind-guided-runs-per-case = Exécutions par cas

js-kind-guided-satellite-altitude-km = Altitude du satellite (km)

js-kind-guided-second-system-range-error-m = Erreur de distance du second système (m)

js-kind-guided-shared-condition = Condition commune

js-kind-guided-slant-electron-content-tecu = Contenu électronique oblique (TECU)

js-kind-guided-slant-range-km = Distance oblique (km)

js-kind-guided-spoofed-offset-m = Décalage de leurrage (m)

js-kind-guided-spoofing-starts-s = Début du leurrage (s)

js-kind-guided-sweep-from = Balayer de

js-kind-guided-sweep-steps = Pas du balayage

js-kind-guided-sweep-to = Balayer jusqu'à

js-kind-guided-timeline-step-s = Pas de la chronologie (s)

js-kind-guided-tracking-threshold-db-hz = Seuil de poursuite (dB-Hz)

js-kind-guided-transmit-power-dbw = Puissance d'émission (dBW)

js-kind-guided-update-period-s = Période de mise à jour (s)

js-kind-guided-user-latitude = Latitude de l'utilisateur (°)

js-kind-hint-a-band-under-this-carrier = une bande sous cette densité porteuse sur bruit a perdu l'accrochage

js-kind-hint-a-grid-point-is-available = un point de grille est disponible tant que sa dilution de précision de position est inférieure à cette valeur

js-kind-hint-a-satellite-must-be-this = un satellite doit être aussi haut pour compter comme en vue

js-kind-hint-a-satellite-must-be-this-2 = un satellite doit être aussi haut pour être utilisé

js-kind-hint-a-satellite-of-the-first = un satellite du premier système doit être aussi haut

js-kind-hint-arc-one-message-is-fitted = arc sur lequel un message est ajusté

js-kind-hint-code-tracking-loop-noise-bandwidth = bande passante de bruit de la boucle de poursuite de code

js-kind-hint-detail-of-the-truth-orbit = finesse du modèle de gravité de l'orbite de référence

js-kind-hint-distance-from-the-first-jammer = distance entre le premier brouilleur et le récepteur

js-kind-hint-distance-to-the-satellite-in = distance au satellite dans la comparaison des bandes

js-kind-hint-drawn-while-acquiring-and-tracking = tracé pendant l'acquisition et la poursuite

js-kind-hint-equivalent-isotropically-radiated-power-of = puissance isotrope rayonnée équivalente du premier brouilleur

js-kind-hint-equivalent-isotropically-radiated-power-of-2 = puissance isotrope rayonnée équivalente de la bande

js-kind-hint-filter-runs-averaged-for-each = exécutions du filtre moyennées pour chaque cas (plus il y en a, plus c'est lent)

js-kind-hint-first-value-of-the-swept = première valeur du paramètre balayé

js-kind-hint-height-of-the-chain-s = altitude du satellite de la chaîne

js-kind-hint-height-of-the-first-shell = altitude des orbites de la première coquille

js-kind-hint-height-of-the-relay-orbits = altitude des orbites des relais au-dessus du corps

js-kind-hint-height-of-the-satellite-whose = altitude du satellite dont le message est ajusté

js-kind-hint-how-far-the-spoofer-moves = de combien le leurre déplace la position calculée

js-kind-hint-how-finely-each-orbit-is = finesse d'échantillonnage de chaque orbite pour le tracé

js-kind-hint-how-high-the-satellite-climbs = hauteur atteinte par le satellite

js-kind-hint-how-long-the-first-phase = durée de la première phase

js-kind-hint-how-long-the-receiver-integrates = durée d'intégration du récepteur pour une mesure de distance

js-kind-hint-how-many-low-orbit-satellites = nombre de satellites en orbite basse que le balayage de géométrie ajoute

js-kind-hint-how-many-seeded-runs-make = nombre d'exécutions à graine fixée qui forment l'ensemble

js-kind-hint-how-many-values-are-run = nombre de valeurs exécutées

js-kind-hint-how-often-a-new-message = fréquence d'émission d'un nouveau message

js-kind-hint-how-wide-the-first-jammer = largeur sur laquelle le premier brouilleur étale sa puissance

js-kind-hint-ionosphere-along-the-path-in = ionosphère le long du trajet, en unités de contenu électronique total

js-kind-hint-last-value-of-the-swept = dernière valeur du paramètre balayé

js-kind-hint-length-of-each-filter-run = durée de chaque exécution du filtre

js-kind-hint-length-of-the-run = durée de l'exécution

js-kind-hint-length-of-the-timeline = durée de la chronologie

js-kind-hint-occupied-bandwidth-of-the-first = bande passante occupée du premier signal de référence

js-kind-hint-one-sigma-doppler-measurement-error = erreur de mesure Doppler à un sigma

js-kind-hint-one-sigma-error-of-a = erreur à un sigma d'une distance à un relais

js-kind-hint-one-sigma-error-of-the = erreur à un sigma de la distance aller-retour depuis la Terre

js-kind-hint-orbital-planes-of-the-navigation = plans orbitaux des relais de navigation

js-kind-hint-power-of-the-first-jammer = puissance du premier brouilleur au récepteur

js-kind-hint-raises-the-noise-floor-under = relève le plancher de bruit sous chaque bande

js-kind-hint-satellites-in-each-plane = satellites dans chaque plan

js-kind-hint-sets-the-doppler-range-a = fixe la plage Doppler qu'une recherche à froid doit couvrir

js-kind-hint-signal-in-space-range-error = erreur de distance du signal dans l'espace du premier système

js-kind-hint-signal-in-space-range-error-2 = erreur de distance du signal dans l'espace du second système

js-kind-hint-signal-level-the-tracking-figures = niveau de signal auquel les chiffres de poursuite sont donnés

js-kind-hint-spacing-of-the-latitude-and = espacement de la grille en latitude et en longitude

js-kind-hint-spacing-of-the-shared-mission = espacement de la grille temporelle commune de la mission

js-kind-hint-the-part-of-the-range = la part de l'erreur de distance que le message ne peut pas supprimer

js-kind-hint-the-value-every-member-runs = la valeur sous laquelle chaque membre s'exécute

js-kind-hint-tilt-of-that-orbit = inclinaison de cette orbite

js-kind-hint-tilt-of-the-first-shell = inclinaison des plans de la première coquille

js-kind-hint-tilt-of-the-relay-planes = inclinaison des plans de relais

js-kind-hint-timing-error-between-satellites-as = erreur de synchronisation entre satellites, exprimée en distance

js-kind-hint-when-the-spoofer-captures-the = moment où le leurre capture le récepteur

js-kind-hint-where-the-receiver-stands = où se trouve le récepteur

js-kind-hint-where-the-user-stands = où se trouve l'utilisateur

js-kind-label-3-d-error = Erreur 3D

js-kind-label-3-d-error-time-of = Erreur 3D, temps d'arrivée

js-kind-label-a-corrupted-frame-is-rejected = une trame corrompue est rejetée

js-kind-label-all-channels = tous les canaux

js-kind-label-availability = Disponibilité

js-kind-label-band = Bande

js-kind-label-bodies = Corps

js-kind-label-body = Corps

js-kind-label-both = les deux

js-kind-label-case = Cas

js-kind-label-class = Classe

js-kind-label-code-jitter = gigue de code

js-kind-label-constellation = Constellation

js-kind-label-doppler = Doppler

js-kind-label-event = Événement

js-kind-label-evidence = Preuve

js-kind-label-fewest-in-view = Minimum en vue

js-kind-label-field = Champ

js-kind-label-first-detection-after-onset = Première détection après le début

js-kind-label-frame-length = Longueur de trame

js-kind-label-fused = fusionné

js-kind-label-fused-cap = Fusionné

js-kind-label-gnss = GNSS

js-kind-label-gnss-and-leo = GNSS et LEO

js-kind-label-gnss-channels = Canaux GNSS

js-kind-label-gnss-highest-in-sky = GNSS { $id } (le plus haut dans le ciel)

js-kind-label-gnss-only = GNSS seul

js-kind-label-gnss-only-cap = GNSS seul

js-kind-label-gnss-signal = Signal GNSS

js-kind-label-hdop = HDOP

js-kind-label-highest = Le plus haut

js-kind-label-horizontal-error = erreur horizontale

js-kind-label-horizontal-error-2 = Erreur horizontale

js-kind-label-jammer = Brouilleur

js-kind-label-jump-threshold = Seuil de saut

js-kind-label-largest-range-jump = Plus grand saut de distance

js-kind-label-largest-range-jump-against-the = plus grand saut de distance face au seuil

js-kind-label-leo = LEO

js-kind-label-leo-channels = Canaux LEO

js-kind-label-leo-only = LEO seul

js-kind-label-light-time-from-observer = Temps de lumière depuis { $observer }

js-kind-label-light-time-from-the-observer = Temps de lumière depuis l'observateur

js-kind-label-light-time-one-way = Temps de lumière, aller simple

js-kind-label-lowest = Le plus bas

js-kind-label-lowest-c-n0 = C/N0 minimal

js-kind-label-mean = Moyenne

js-kind-label-mean-in-view = Moyenne en vue

js-kind-label-median-convergence = Convergence médiane

js-kind-label-median-pdop = PDOP médian

js-kind-label-member-runs = Exécutions des membres

js-kind-label-message-switch-iod = changement de message, de la donnée d'émission { $old } à { $new }

js-kind-label-mission-length = Durée de la mission

js-kind-label-model = modèle

js-kind-label-monte-carlo-runs = Exécutions Monte-Carlo

js-kind-label-noise-floor = Plancher de bruit

js-kind-label-parameters = Paramètres

js-kind-label-payload = Charge utile

js-kind-label-pdop = PDOP

js-kind-label-pdop-95th-percentile = PDOP, 95e centile

js-kind-label-peak-elevation = Élévation maximale

js-kind-label-peak-tracked-c-n0 = C/N0 poursuivi maximal

js-kind-label-phase = Phase

js-kind-label-predicted-horizontal-sigma = sigma horizontal prédit

js-kind-label-quantisation-position = Quantification, position

js-kind-label-range-error = erreur de distance

js-kind-label-relays-above-the-mask = relais au-dessus du masque

js-kind-label-relays-and-earth-link = relais et liaison avec la Terre

js-kind-label-relays-only = relais seuls

js-kind-label-satellite = Satellite

js-kind-label-satellites = Satellites

js-kind-label-satellites-used = Satellites utilisés

js-kind-label-signal = Signal

js-kind-label-signal-chip-spacing = { $name } (espacement de chip { $spacing })

js-kind-label-sisre-after-quantisation = SISRE après quantification

js-kind-label-sisre-root-mean-square = SISRE, valeur quadratique moyenne

js-kind-label-spoofing-starts = début du leurrage

js-kind-label-standard-deviation = Écart-type

js-kind-label-sun-separation = Séparation du Soleil

js-kind-label-sweep-runs = Exécutions du balayage

js-kind-label-system = Système

js-kind-label-time-above-the-mask = Temps au-dessus du masque

js-kind-label-time-error-root-mean-square = Erreur de temps, valeur quadratique moyenne

js-kind-label-tracked-component = composante poursuivie

js-kind-label-tracking-threshold = Seuil de poursuite

js-kind-label-transmit-bandwidth = Bande passante d'émission

js-kind-label-vdop = VDOP

js-kind-label-welch-estimate-of-the-synthesised = Estimation de Welch des échantillons synthétisés

js-kind-label-whole-signal = signal entier

js-kind-label-wideband-j-s-tolerated = J/S large bande toléré

js-kind-label-with-unit = { $label } ({ $unit })

js-kind-label-worst-site-availability = Disponibilité du pire site

js-kind-no = non

js-kind-note-a-gap-is-an-epoch = Une lacune est une époque avec trop peu de relais en vue pour une position.

js-kind-note-a-helmert-transform-is-the = Une transformation de Helmert est le décalage, la rotation et le changement d'échelle à sept paramètres entre deux référentiels.

js-kind-note-a-low-earth-orbit-leo = Un satellite en orbite terrestre basse (LEO) traverse le ciel en quelques minutes : son C/N0 (rapport densité de porteuse sur bruit) monte et descend en cloche ; un satellite GNSS bouge à peine dans le même temps.

js-kind-note-a-receiver-independent-exchange-format = Un enregistrement de style Receiver Independent Exchange Format (RINEX) 4. Les types d'enregistrement LEO sont une extension de Kshana, comme l'indique l'en-tête.

js-kind-note-a-single-pass-fixes-the = Un seul passage fixe la direction le long de la trace bien mieux que la direction transversale.

js-kind-note-aos-is-acquisition-of-signal = AOS est l'acquisition du signal, TCA l'instant d'approche maximale et LOS la perte du signal.

js-kind-note-c-n0-is-the-carrier = C/N0 est le rapport densité de porteuse sur bruit. Une bande sous le seuil de poursuite du récepteur a perdu l'accrochage.

js-kind-note-cells-are-the-code-and = Les cellules sont les cases de code et de Doppler qu'une recherche à froid doit tester.

js-kind-note-cold-is-a-first-fix = À froid est une première position sans aucune connaissance préalable ; à chaud est une position peu après la précédente.

js-kind-note-dilution-of-precision-dop-scales = La dilution de précision (DOP) convertit une erreur de distance en erreur de position : G est géométrique, P position, H horizontale, V verticale. Les centiles portent sur chaque point de grille et chaque époque.

js-kind-note-drawn-at-the-strongest-signal = Tracé au niveau de signal le plus fort de l'exécution. Une lacune est un intervalle sans satellite en vue.

js-kind-note-each-body-carries-its-own = Chaque corps porte sa propre étiquette de preuve. Le temps de lumière est aller simple, depuis l'observateur nommé dans le scénario.

js-kind-note-each-row-is-one-full = Chaque ligne est une exécution complète du moteur sur le scénario balayé.

js-kind-note-each-rule-is-a-switch = Chaque règle est un passage à un message plus récent au milieu du passage.

js-kind-note-each-signal-is-drawn-about = Chaque signal est tracé autour de sa propre fréquence centrale. Une lacune est un nul spectral.

js-kind-note-eirp-is-the-equivalent-isotropically = EIRP est la puissance isotrope rayonnée équivalente.

js-kind-note-every-phase-is-an-ordinary = Chaque phase est une exécution de scénario ordinaire. Les empreintes identifient l'entrée de chaque membre et son document de résultat.

js-kind-note-iod-is-the-issue-of = IOD est la donnée d'émission (issue of data) : le numéro de série du message.

js-kind-note-j-s-is-the-jammer = J/S est le rapport de puissance brouilleur sur signal. La fraction de poursuite est la part de l'exécution pendant laquelle la bande reste au-dessus du seuil.

js-kind-note-p05-p50-and-p95-are = p05, p50 et p95 sont les 5e, 50e et 95e centiles. ci95 est l'intervalle de confiance à 95 % sur la moyenne.

js-kind-note-parameters-are-public-with-a = Les paramètres sont PUBLICS (avec une source), REPRÉSENTATIFS ou D'ATELIER, comme chaque préréglage l'indique.

js-kind-note-precise-point-positioning-ppp-converges = Le positionnement ponctuel précis (PPP) converge quand l'erreur reste sous le critère. NEES est l'erreur d'estimation normalisée au carré, un contrôle de cohérence du filtre.

js-kind-note-sisre-defined = SISRE est l'erreur de distance du signal dans l'espace : ce que le message diffusé ajoute à la distance d'un utilisateur. Ici, c'est l'erreur de représentation du message par rapport à l'orbite de référence propre au moteur.

js-kind-note-sisre-is-the-signal-in = SISRE est l'erreur de distance du signal dans l'espace supposée pour l'orbite et l'horloge diffusées de chaque système.

js-kind-note-ssc-is-the-spectral-separation = SSC est le coefficient de séparation spectrale : la part de la puissance d'un signal qui tombe dans le récepteur de l'autre. Un tiret signifie que les deux ne se recouvrent pas.

js-kind-note-the-chain-runs-the-signal = La chaîne enchaîne dans l'ordre les étapes de signal, de passage, de message de navigation, de positionnement et de positionnement précis. Chaque ligne est un nombre qu'une étape a calculé et que la suivante a utilisé.

js-kind-note-the-doppler-and-pass-geometry = Le moniteur de Doppler et de géométrie de passage compare les vitesses de distance mesurées à celles prédites d'après les orbites. La règle marque le début du leurrage.

js-kind-note-the-engine-draws-its-spectrum = Le moteur tire son modèle de spectre sous forme d'échantillons en phase et en quadrature (IQ) à un instant, et en réestime le spectre. Les mêmes échantillons constituent l'export SigMF (Signal Metadata Format).

js-kind-note-the-engine-s-own-documented = La trame binaire documentée propre au moteur, fermée par un contrôle de redondance cyclique sur 24 bits (CRC-24Q).

js-kind-note-the-gabor-root-mean-square = La bande passante de Gabor (valeur quadratique moyenne) fixe la finesse avec laquelle on peut mesurer la distance sur un signal.

js-kind-note-the-largest-jammer-to-signal = Le plus grand rapport brouilleur sur signal (J/S) que chaque signal poursuit, pour un brouilleur à onde continue (CW), à spectre adapté et à large bande.

js-kind-note-the-shapiro-delay-is-the = Le retard de Shapiro est le temps de lumière supplémentaire dû à la gravité du Soleil le long du trajet.

js-kind-note-the-spectrum-kind-and-the = Le type spectre et le type brouillage calculent la même liaison de deux façons ; la dernière colonne est leur différence.

js-kind-note-time-of-arrival-toa-ranging = Mesure de distance par temps d'arrivée (TOA) sur une liaison descendante d'un réseau non terrestre (NTN) : un signal plus large mesure la distance plus finement.

js-kind-note-what-half-a-least-significant = Ce que coûte, en position et en horloge, exprimé en distance, un demi-bit de poids faible (LSB) de chaque champ.

js-kind-rowhead-block = Bloc

js-kind-rowhead-condition = Condition

js-kind-rowhead-figure = Chiffre

js-kind-rowhead-member = Membre

js-kind-rowhead-metric = Métrique

js-kind-rowhead-monitor = Moniteur

js-kind-rowhead-phase = Phase

js-kind-rowhead-satellite = Satellite

js-kind-rowhead-signal = Signal

js-kind-rowhead-solution = Solution

js-kind-sub-clock-offset-db = { $clock }, { $offset } dB

js-kind-sub-doppler-only = Doppler seul

js-kind-sub-from-to = { $from } à { $to }

js-kind-sub-fused = fusionné

js-kind-sub-gnss-and-leo-latitude = GNSS et LEO, latitude { $lat }°

js-kind-sub-gnss-only = GNSS seul

js-kind-sub-gnss-only-latitude = GNSS seul, latitude { $lat }°

js-kind-sub-model-fit-seconds = { $model }, ajustement de { $fit } s

js-kind-threshold-4-needed-for-a-fix = 4 nécessaires pour une position

js-kind-threshold-convergence-criterion = critère de convergence

js-kind-threshold-elevation-mask = masque d'élévation

js-kind-threshold-gnss-median = médiane GNSS

js-kind-threshold-tracking-threshold = seuil de poursuite

js-kind-title-acquisition = Acquisition

js-kind-title-against-a-simulated-campaign = Face à une campagne simulée

js-kind-title-assumptions = Hypothèses

js-kind-title-band-trade-at-equal-transmit = Comparaison des bandes à puissance d'émission égale

js-kind-title-bands = Bandes

js-kind-title-beside-the-published-figures = À côté des chiffres publiés

js-kind-title-beside-the-published-speed-up = À côté de l'accélération publiée

js-kind-title-bodies = Corps

js-kind-title-body = Corps

js-kind-title-by-latitude = Par latitude

js-kind-title-c-n0-by-band-over = C/N0 par bande sur l'exécution

js-kind-title-c-n0-over-the-pass = C/N0 sur le passage

js-kind-title-cases = Cas

js-kind-title-central-body = Corps central

js-kind-title-closed-form-doppler-against-finite = Doppler en forme fermée face aux différences finies

js-kind-title-code-tracking-jitter = Gigue de poursuite de code

js-kind-title-code-tracking-jitter-against-c = Gigue de poursuite de code face au C/N0

js-kind-title-combined-over-the-members = Combiné sur les membres

js-kind-title-compatibility-with-gnss-signals = Compatibilité avec les signaux GNSS

js-kind-title-constellations = Constellations

js-kind-title-continuity-across-message-switches = Continuité à travers les changements de message

js-kind-title-cross-check-against-the-jamming = Recoupement avec le type brouillage

js-kind-title-datum-accuracy = Précision du datum

js-kind-title-dilution-of-precision-over-the = Dilution de précision sur toute la grille

js-kind-title-doppler = Doppler

js-kind-title-doppler-envelopes = Enveloppes Doppler

js-kind-title-doppler-only-fix = Position par le seul Doppler

js-kind-title-doppler-over-the-pass = Doppler sur le passage

js-kind-title-doppler-positioning-from-one-pass = Positionnement Doppler à partir d'un passage

js-kind-title-earth-link = Liaison avec la Terre

js-kind-title-elevation = Élévation

js-kind-title-encoded-frame = Trame encodée

js-kind-title-epoch = Époque

js-kind-title-epoch-and-frame = Époque et référentiel

js-kind-title-events = Événements

js-kind-title-every-node-of-the-sweep = Chaque nœud du balayage

js-kind-title-field-table = Table des champs

js-kind-title-figures-of-merit = Figures de mérite

js-kind-title-filter-noise = Bruit du filtre

js-kind-title-fit-interval-trade = Compromis sur l'intervalle d'ajustement

js-kind-title-fix-quality-against-observation-window = Qualité de la position selon la fenêtre d'observation

js-kind-title-frame-checks = Contrôles de trame

js-kind-title-frame-hexadecimal = Trame, hexadécimal

js-kind-title-geometry-against-latitude = Géométrie selon la latitude

js-kind-title-geometry-as-leo-satellites-are = Géométrie à mesure que des satellites LEO sont ajoutés

js-kind-title-geometry-position-dilution-of-precision = Géométrie : dilution de précision de position

js-kind-title-global-coverage = Couverture mondiale

js-kind-title-gnss-leo-and-fused = GNSS, LEO et fusionné

js-kind-title-gnss-reference = Référence GNSS

js-kind-title-hand-offs-between-phases = Transmissions entre phases

js-kind-title-helmert-fit = Ajustement de Helmert

js-kind-title-helmert-transform-parameters = Paramètres de la transformation de Helmert

js-kind-title-inputs = Entrées

js-kind-title-ionosphere-free-band-pairs = Paires de bandes sans ionosphère

js-kind-title-jammer-tolerance = Tolérance au brouilleur

js-kind-title-jammers = Brouilleurs

js-kind-title-joint-fix = Position conjointe

js-kind-title-leo-against-gnss = LEO face au GNSS

js-kind-title-limitations = Limites

js-kind-title-links = Liaisons

js-kind-title-member-runs = Exécutions des membres

js-kind-title-members-under-the-shared-conditions = Membres sous les conditions communes

js-kind-title-message = Message

js-kind-title-message-models-compared = Modèles de message comparés

js-kind-title-message-switches = Changements de message

js-kind-title-metric-against-axis = { $metric } en fonction de { $axis }

js-kind-title-metric-distribution-over-runs = { $metric } : distribution sur les exécutions

js-kind-title-mid-pass-update = Mise à jour en plein passage

js-kind-title-modelled = Modélisé

js-kind-title-monte-carlo = Monte-Carlo

js-kind-title-navigation-message-stage = Étape du message de navigation

js-kind-title-not-modelled = Non modélisé

js-kind-title-notes = Notes

js-kind-title-notes-on-the-spoofing-model = Notes sur le modèle de leurrage

js-kind-title-observation-windows = Fenêtres d'observation

js-kind-title-one-pass-alone = Un passage seul

js-kind-title-orbit = Orbite

js-kind-title-over-the-message-sequence = Sur la séquence de messages

js-kind-title-pass = Passage

js-kind-title-pass-c-n0-of-the = Passage : C/N0 du signal entier et de la composante poursuivie

js-kind-title-pass-code-tracking-jitter = Passage : gigue de poursuite de code

js-kind-title-pass-doppler = Passage : Doppler

js-kind-title-pass-stage = Étape du passage

js-kind-title-passes = Passages

js-kind-title-phases = Phases

js-kind-title-position-error-gnss-leo-and = Erreur de position : GNSS, LEO et position fusionnée

js-kind-title-position-uncertainty-relays-alone-and = Incertitude de position : relais seuls, et avec la liaison avec la Terre

js-kind-title-positioning-by-signal-bandwidth = Positionnement selon la bande passante du signal

js-kind-title-positioning-gnss-alone-against-the = Positionnement : GNSS seul face à la position fusionnée

js-kind-title-power-spectral-density = Densité spectrale de puissance

js-kind-title-power-spectral-density-of-each = Densité spectrale de puissance de chaque signal

js-kind-title-precise-point-positioning = Positionnement ponctuel précis

js-kind-title-published-comparison = Comparaison publiée

js-kind-title-quantisation-budget = Budget de quantification

js-kind-title-range-residuals = Résidus de distance

js-kind-title-ranging-stations = Stations de télémétrie

js-kind-title-reading-the-trade = Lire le compromis

js-kind-title-realised-position-error = Erreur de position réalisée

js-kind-title-receiver = Récepteur

js-kind-title-receiver-power-budget = Budget de puissance du récepteur

js-kind-title-reflector-information = Information des réflecteurs

js-kind-title-relay-constellation = Constellation de relais

js-kind-title-relays-in-view = Relais en vue

js-kind-title-reproducibility = Reproductibilité

js-kind-title-retroreflectors = Rétroréflecteurs

js-kind-title-rinex-style-record = Enregistrement de style RINEX

js-kind-title-round-trips = Allers-retours

js-kind-title-run = Exécution

js-kind-title-satellites-in-view-against-latitude = Satellites en vue selon la latitude

js-kind-title-sensitivity-to-a-line-of = Sensibilité à une inclinaison de la ligne de visée

js-kind-title-shared-conditions = Conditions communes

js-kind-title-signal-components = Composantes du signal

js-kind-title-signal-stage = Étape du signal

js-kind-title-signals = Signaux

js-kind-title-sisre-against-fit-interval = SISRE selon l'intervalle d'ajustement

js-kind-title-sisre-against-update-period = SISRE selon la période de mise à jour

js-kind-title-sisre-weights = Pondérations SISRE

js-kind-title-snapshot = Instantané

js-kind-title-snapshot-against-the-model = Instantané face au modèle

js-kind-title-snapshot-spectrum-welch-estimate-against = Spectre de l'instantané : estimation de Welch face au modèle

js-kind-title-sources = Sources

js-kind-title-spoofer-and-monitor-settings = Réglages du leurre et du moniteur

js-kind-title-spoofing-monitor-probability-of-detection = Moniteur de leurrage : probabilité de détection

js-kind-title-statistics-over-the-runs = Statistiques sur les exécutions

js-kind-title-sweep = Balayage

js-kind-title-systems = Systèmes

js-kind-title-systems-in-the-fix = Systèmes dans la position

js-kind-title-the-archived-campaign = La campagne archivée

js-kind-title-time-error = Erreur de temps

js-kind-title-time-error-by-receiver-clock = Erreur de temps selon l'horloge du récepteur

js-kind-title-time-scale = Échelle de temps

js-kind-title-time-to-first-fix-and = Temps avant la première position et énergie par position

js-kind-title-time-transfer-by-clock-and = Transfert de temps selon l'horloge et le niveau de signal

js-kind-title-trade-conditions = Conditions de la comparaison

js-kind-title-update-period-trade = Compromis sur la période de mise à jour

js-kind-title-user = Utilisateur

js-kind-title-user-range-error-through-the = Erreur de distance utilisateur pendant le passage

js-kind-title-validated = Vérifié

js-kind-title-what-each-stage-hands-to = Ce que chaque étape transmet à la suivante

js-kind-title-what-this-run-is-and = Ce qu'est cette exécution, et ce qu'elle n'est pas

js-kind-title-when-each-monitor-detects = Quand chaque moniteur détecte

js-kind-title-work-done = Travail accompli

js-kind-yes = oui

js-ledger-rows =
    { $n ->
        [one] { $n } ligne du registre
        [many] { $n } de lignes du registre
       *[other] { $n } lignes du registre
    }

js-lib-abbr-apv = approche avec guidage vertical

js-lib-abbr-araim = surveillance autonome avancée de l'intégrité par le récepteur

js-lib-abbr-auc = aire sous la courbe

js-lib-abbr-c-n0 = densité de porteuse sur bruit

js-lib-abbr-ccsds = Comité consultatif pour les systèmes de données spatiales

js-lib-abbr-cli = interface en ligne de commande

js-lib-abbr-csac = horloge atomique à l'échelle d'une puce

js-lib-abbr-cw = onde continue

js-lib-abbr-doi = identifiant d'objet numérique

js-lib-abbr-dop = dilution de précision

js-lib-abbr-eo = observation de la Terre

js-lib-abbr-gnss = système mondial de navigation par satellite

js-lib-abbr-gps = système de positionnement mondial

js-lib-abbr-hal = limite d'alerte horizontale

js-lib-abbr-hpl = niveau de protection horizontal

js-lib-abbr-imu = centrale de mesure inertielle

js-lib-abbr-ins = système de navigation inertielle

js-lib-abbr-iot = Internet des objets

js-lib-abbr-itu-t = Union internationale des télécommunications, Secteur de la normalisation des télécommunications

js-lib-abbr-j-s = rapport brouilleur sur signal

js-lib-abbr-leo = orbite terrestre basse

js-lib-abbr-llr = télémétrie laser lunaire

js-lib-abbr-meo = orbite terrestre moyenne

js-lib-abbr-mtie = erreur maximale d'intervalle de temps

js-lib-abbr-ntn = réseau non terrestre

js-lib-abbr-ocxo = oscillateur à quartz thermostaté

js-lib-abbr-oem = message d'éphéméride d'orbite

js-lib-abbr-omm = message d'éléments moyens d'orbite

js-lib-abbr-pdop = dilution de précision de position

js-lib-abbr-pnt = positionnement, navigation et synchronisation temporelle

js-lib-abbr-ppp = positionnement ponctuel précis

js-lib-abbr-raim = surveillance autonome de l'intégrité par le récepteur

js-lib-abbr-rf = radiofréquence

js-lib-abbr-rinex = format d'échange indépendant du récepteur

js-lib-abbr-roc = caractéristique de fonctionnement du récepteur

js-lib-abbr-sbas = système d'augmentation par satellite

js-lib-abbr-sgp4 = Simplified General Perturbations 4, un propagateur d'orbite

js-lib-abbr-sisre = erreur de distance du signal dans l'espace

js-lib-abbr-slam = localisation et cartographie simultanées

js-lib-abbr-spp = positionnement ponctuel simple

js-lib-abbr-tdev = écart de temps

js-lib-abbr-tle = jeu d'éléments à deux lignes

js-lib-abbr-toml = le format de fichier de scénario

js-lib-abbr-trn = navigation par référence au relief

js-lib-abbr-uhf = ultra haute fréquence

js-lib-abbr-ukf = filtre de Kalman sans parfum

js-lib-abbr-utc = temps universel coordonné

js-lib-abbr-val = limite d'alerte verticale

js-lib-abbr-vlbi = interférométrie à très longue base

js-lib-abbr-vpl = niveau de protection vertical

js-lib-abbr-wg = Working Group

js-lib-areas-ground-track = Trace au sol

js-lib-areas-holdover = Holdover

js-lib-compare-availability = Disponibilité

js-lib-compare-holdover = Holdover

js-lib-compare-timing-p95 = Synchronisation temporelle p95

js-lib-compare-timing-rms = Synchronisation temporelle RMS

js-lib-counts-explorer-tally = { $validated } capacités sur { $total } vérifiées par rapport à une référence indépendante · { $modelled } modélisées · { $partner } relevant du partenaire — présentées ici sous forme de { $cards } fiches de capacité dans { $domains } domaines, { $evidence } éléments de preuve

js-lib-counts-validated-tally = { $validated } capacités sur { $total } vérifiées par rapport à une référence indépendante — présentées ici sous forme de { $cards } fiches de capacité et { $evidence } éléments de preuve

js-lib-engine-busy = { $verb }…

js-lib-engine-busy-seconds = { $verb }… { $s } s

js-lib-engine-page-http = le fichier du moteur a renvoyé HTTP { $status }

js-lib-engine-page-not-running = le moteur ne s'exécute pas ici

js-lib-engine-worker-crashed = le worker du moteur a planté

js-lib-evidence-aria = Preuve : { $tier }, { $count }

js-lib-evidence-ledger-rows =
    { $n ->
        [one] { $n } ligne du registre
        [many] { $n } de lignes du registre
       *[other] { $n } lignes du registre
    }

js-lib-evidence-rows-behind = Lignes du registre derrière ce résultat

js-lib-geometry-url-bad-mc = Le nombre d'échantillons Monte-Carlo ne figure pas parmi { $choices } ; { $default } est utilisé.

js-lib-geometry-url-bad-number = « { $key } » n'est pas un nombre de { $min } à { $max } ; la valeur par défaut est utilisée.

js-lib-geometry-url-bad-site = Le site n'est pas latitude,longitude[,hauteur] dans la plage ; le site par défaut est utilisé.

js-lib-geometry-url-bad-sky = Le profil d'horizon n'est ni un préréglage, ni une table de 360 intervalles, ni un canyon dans la plage ; un horizon dégagé est utilisé.

js-lib-geometry-url-bad-sys = La liste des constellations n'est pas G, E, C et au plus un L:<préréglage LEO> que cette vue connaît ; le mélange par défaut est utilisé.

js-lib-geometry-url-own-tle = L'expéditeur a utilisé ses propres éléments orbitaux (TLE), qu'un lien ne transporte pas ; les préréglages sont affichés à la place.

js-lib-geometry-url-repeated = « { $key } » apparaît plus d'une fois ; la première valeur est utilisée.

js-lib-geometry-url-too-long = L'adresse dépasse { $max } caractères : aucun de ses réglages n'a donc été lu.

js-lib-geometry-url-unreadable = L'adresse n'a pas pu être lue.

js-lib-guided-duration-s-hint = durée de propagation de la trace au sol

js-lib-guided-duration-s-label = Durée (s)

js-lib-guided-dut1-s-hint = décalage de rotation de la Terre ; déplace la trace au sol vers l'est ou l'ouest

js-lib-guided-dut1-s-label = UT1−UTC (s)

js-lib-guided-mask-deg-hint = un satellite doit être aussi haut pour compter comme visible

js-lib-guided-mask-deg-label = Masque d'élévation (°)

js-lib-guided-seed-hint = un autre tirage de bruit de la même physique

js-lib-guided-seed-label = Graine aléatoire

js-lib-guided-sigma-uere-m-hint = erreur équivalente de distance utilisateur à 1 σ pour le résumé de position

js-lib-guided-sigma-uere-m-label = Erreur de distance σ (m)

js-lib-guided-station-lat-deg-hint = latitude de la station au sol : détermine la géométrie du passage

js-lib-guided-station-lat-deg-label = Latitude de la station (°)

js-lib-guided-station-lon-deg-hint = longitude de la station au sol

js-lib-guided-station-lon-deg-label = Longitude de la station (°)

js-lib-guided-step-s-hint = cadence d'échantillonnage de la trace au sol

js-lib-guided-step-s-label = Pas de temps (s)

js-lib-guided-threshold-ns-hint = marge admise par la spécification ; « disponible » tant que l'erreur reste en dessous

js-lib-guided-threshold-ns-label = Seuil de la spécification (ns)

js-lib-guided-time-duration-s-hint = durée totale de l'exécution

js-lib-guided-time-duration-s-label = Durée (s)

js-lib-guided-time-step-s-hint = cadence d'intégration et d'échantillonnage

js-lib-guided-time-step-s-label = Pas de temps (s)

js-lib-guided-user-altitude-km-hint = altitude orbitale du vaisseau utilisateur

js-lib-guided-user-altitude-km-label = Altitude de l'utilisateur (km)

js-lib-guided-user-inclination-deg-hint = inclinaison de l'orbite de l'utilisateur

js-lib-guided-user-inclination-deg-label = Inclinaison de l'utilisateur (°)

js-lib-imufit-card-accel-slope = Pente d'Allan de l'accéléromètre, début (environ -0,5 pour un bruit blanc)

js-lib-imufit-card-bias = Biais de l'accéléromètre, moyenne (m/s²)

js-lib-imufit-card-bias-instability = Instabilité de biais de l'accéléromètre (m/s²), 0 quand la courbe n'a pas de plancher

js-lib-imufit-card-gyro-bias = Biais du gyroscope, moyenne (rad/s)

js-lib-imufit-card-gyro-slope = Pente d'Allan du gyroscope, début (environ -0,5 pour un bruit blanc)

js-lib-imufit-card-note-n = Note { $n }

js-lib-imufit-card-q-arw = Marche aléatoire d'angle du gyroscope, q_arw (rad²/s)

js-lib-imufit-card-q-va = Marche aléatoire de vitesse de l'accéléromètre, q_va (m²/s³)

js-lib-imufit-card-sample-rate = Fréquence d'échantillonnage

js-lib-imufit-card-samples = Échantillons

js-lib-imufit-card-span = Étendue

js-lib-jammertest-card-clean-epochs = Époques sans brouillage

js-lib-jammertest-card-clean-hours = Heures sans brouillage

js-lib-jammertest-card-detected = Détecté dans la tolérance

js-lib-jammertest-card-detection-rate = Taux de détection (toute alarme)

js-lib-jammertest-card-evaluable = Évaluable

js-lib-jammertest-card-fa-epochs = Époques de fausse alarme

js-lib-jammertest-card-fa-per-hour = Séquences de fausse alarme par heure

js-lib-jammertest-card-fa-runs = Séquences de fausse alarme

js-lib-jammertest-card-in-tol-rate = Détecté dans la tolérance, taux

js-lib-jammertest-card-late = Tardif

js-lib-jammertest-card-median-latency = Latence de détection médiane

js-lib-jammertest-card-median-recover = Temps de récupération médian

js-lib-jammertest-card-missed = Manqué

js-lib-jammertest-card-na = n/d

js-lib-jammertest-card-not-assessable = Aucun test n'était évaluable dans ce journal : aucun taux de détection ni aucune latence ne peut donc être indiqué. C'est un résultat, pas une défaillance de la page : rien ici n'est une réussite.

js-lib-jammertest-card-not-json = { $name } : ce n'est pas du JSON ({ $reason }).

js-lib-jammertest-card-not-scorecard = { $name } : ce n'est pas une fiche de résultats jammertest (elle exige tests[] et summary).

js-lib-jammertest-card-tests = Tests de la tranche du plan

js-lib-jammertest-card-too-large = { $name } : plus de 8 MiB ; cette page lit une fiche de résultats jusqu'à cette taille.

js-lib-kpi-available-everywhere = disponible partout, à chaque époque

js-lib-kpi-available-everywhere-pdop = disponible partout, à chaque époque (PDOP, dilution de précision de position, sous { $thr })

js-lib-kpi-drops-under = tombe sous le seuil de poursuite de { $thr } dB-Hz : accrochage perdu

js-lib-kpi-end-of-mission = à la fin de la mission

js-lib-kpi-figure-tiers = Niveaux de preuve des chiffres : { $parts }.

js-lib-kpi-n-modelled =
    { $n ->
        [one] { $n } modélisé
       *[other] { $n } modélisés
    }

js-lib-kpi-n-partner =
    { $n ->
        [one] { $n } relevant du partenaire
       *[other] { $n } relevant du partenaire
    }

js-lib-kpi-n-validated =
    { $n ->
        [one] { $n } validé
       *[other] { $n } validés
    }

js-lib-kpi-no-change = aucun changement

js-lib-kpi-no-fix = { $pct } % du temps ou des lieux sans position calculée

js-lib-kpi-no-fix-pdop = { $pct } % du temps ou des lieux sans position calculée à un PDOP sous { $thr }

js-lib-kpi-over-jump = au-dessus du seuil de saut de { $thr } m

js-lib-kpi-over-pdop = au-dessus du seuil de PDOP { $thr }

js-lib-kpi-stays-above = reste au-dessus du seuil de poursuite de { $thr } dB-Hz

js-lib-kpi-under-jump = sous le seuil de saut de { $thr } m

js-lib-kpi-under-pdop = sous le seuil de PDOP { $thr }

js-lib-orbit3d-apogee = apogée

js-lib-orbit3d-perigee = périgée

js-lib-orbit3d-prov-scenario = scénario { $hash }

js-lib-orbit3d-title = Orbite (ECI, orthographique)

js-lib-orbit3d-view-angles = az { $az }° · él { $el }°

js-lib-overlay-meta-clock-bias-m = Biais d'horloge

js-lib-overlay-meta-converged-pos-3sigma-m = Position 3σ

js-lib-overlay-meta-converged-pos-rms-m = Position RMS

js-lib-overlay-meta-converged-pos-sigma-m = Position σ

js-lib-overlay-meta-final-clock-freq-sigma = σ de fréquence d'horloge

js-lib-overlay-meta-mean-relays-in-view = Relais en vue

js-lib-overlay-meta-pos-p95-m = Position p95

js-lib-overlay-meta-pos-rms-m = Position RMS

js-lib-overlay-meta-postfit-rms-m = RMS post-ajustement

js-lib-overlay-prov-scenario = scénario { $hash }

js-lib-overlay-subtitle =
    { $n ->
        [one] |erreur| (ns) en fonction du temps — { $n } exécution
        [many] |erreur| (ns) en fonction du temps — { $n } d'exécutions
       *[other] |erreur| (ns) en fonction du temps — { $n } exécutions
    }

js-lib-overlay-time-s = temps (s)

js-lib-overlay-title = Superposition : erreur de temps pendant la coupure

js-lib-packs-cannot-unpack = ce navigateur ne peut pas décompresser le fichier enregistré

js-lib-replay-demos-below-130 = Seuls les azimuts inférieurs à 130° sont conservés (indiqué)

js-lib-replay-demos-coastal-drag-off = Dérive côtière

js-lib-replay-demos-combined-event = Événement combiné

js-lib-replay-demos-drag-off-stated = Dérive de position (indiquée par la démo)

js-lib-replay-demos-ferry-drag-off = Traversée en ferry, dérive de position

js-lib-replay-demos-ferry-drag-off-description = Un journal de ferry fictif, Tallinn–Helsinki, à 1 Hz. À partir de 1500 s, une dérive de position éloigne la position indiquée alors que le récepteur continue d'annoncer une position valide.

js-lib-replay-demos-fjord = Dégradation naturelle en fjord

js-lib-replay-demos-masked-sky = Traversée en ferry, la moitié du ciel masquée

js-lib-replay-demos-masked-sky-description = Le même journal de ferry avec la moitié ouest du ciel réduite au silence à partir de 600 s, un ciel plus étroit de 900 s à 1200 s, et la dérive à partir de 1500 s : une seule exécution où le ciel, le signal et la position défaillent tour à tour.

js-lib-replay-demos-open-sea-jamming = Brouillage en pleine mer

js-lib-replay-demos-port-approach = Leurrage temporel à l'approche d'un port

js-lib-replay-demos-source-training = Scénario synthétique { $id } : le flux nmea_training du moteur et le journal de l'instructeur, évalués par son receiver-trust.

js-lib-replay-demos-source-trust = Journal synthétique { $id } : NMEA fictif, évalué par le receiver-trust du moteur.

js-lib-replay-demos-west-masked = Moitié ouest du ciel masquée (indiqué)

js-lib-replay-demos-west-masked-again = Moitié ouest de nouveau masquée (indiqué)

js-lib-report-charts = Graphiques

js-lib-report-eyebrow = l'instant précis

js-lib-report-figures-of-merit = Chiffres de mérite

js-lib-report-footer = Kshana { $version } · scénario { $hash } · généré { $iso }. Reproductible à partir du scénario, de la graine et de la version du moteur. S'exécute en local ; rien n'est envoyé.

js-lib-report-not-applicable = sans objet (aucune attaque configurée)

js-lib-report-scenario-definition = Définition du scénario (TOML)

js-lib-report-th-clock = Horloge

js-lib-report-th-metric = Métrique

js-lib-report-th-validation = Validation

js-lib-report-th-value = Valeur

js-lib-report-tier-note = Chaque chiffre de mérite porte l'étiquette { $validated } (vérifié par rapport à une référence externe) ou { $modelled } (premiers principes, testé en interne) — déduite de la matrice de vérification.

js-lib-report-title = Kshana — rapport de scénario

js-lib-skydraw-azimuth-range = azimut de { $from } à { $to } degrés

js-lib-skydraw-describe =
    { $listed ->
        [one] { $listed } satellite répertorié, { $heard } avec un signal
        [many] { $listed } de satellites répertoriés, { $heard } avec un signal
       *[other] { $listed } satellites répertoriés, { $heard } avec un signal
    }

js-lib-skydraw-describe-mean =
    { $listed ->
        [one] { $listed } satellite répertorié, { $heard } avec un signal, { $snr } dB-Hz en moyenne
        [many] { $listed } de satellites répertoriés, { $heard } avec un signal, { $snr } dB-Hz en moyenne
       *[other] { $listed } satellites répertoriés, { $heard } avec un signal, { $snr } dB-Hz en moyenne
    }

js-lib-skydraw-east = E

js-lib-skydraw-no-signal-from = aucun signal de { $sectors }

js-lib-skydraw-none-listed = Aucun satellite répertorié dans le journal à cet instant.

js-lib-skydraw-north = N

js-lib-skydraw-sat-heard = { $sys } { $prn } : élévation { $el }, azimut { $az }, signal { $snr } dB-Hz

js-lib-skydraw-sat-quiet = { $sys } { $prn } : élévation { $el }, azimut { $az }, répertorié, aucun signal

js-lib-skydraw-south = S

js-lib-skydraw-unheard-sector = Satellites répertoriés entre l'azimut { $from } et { $to } degrés, aucun avec un signal

js-lib-skydraw-west = O

js-lib-skyline-edit-describe = Horizon obstrué sur { $blocked } des 360 degrés d'azimut ; point le plus haut { $el }° à l'azimut { $az }°.

js-lib-skyline-edit-open = Horizon dégagé : aucun obstacle.

js-lib-stages-all-planets = Toutes les planètes

js-lib-stages-au-from-sun = { $d } ua du Soleil

js-lib-stages-band-carrier = Porteuse { $name }, { $mhz } MHz

js-lib-stages-bin-title =
    { $count ->
        [one] { $from } à { $to }{ $unit } : { $count } exécution
        [many] { $from } à { $to }{ $unit } : { $count } d'exécutions
       *[other] { $from } à { $to }{ $unit } : { $count } exécutions
    }

js-lib-stages-body-and-moons = { $name } et ses lunes

js-lib-stages-cell-title = lat { $lat }°, lon { $lon }° · { $field } { $value }

js-lib-stages-chain-navmsg = Message de navigation

js-lib-stages-chain-pass = Passage et liaison

js-lib-stages-chain-ppp = Positionnement ponctuel précis

js-lib-stages-chain-pvt = Positionnement fusionné

js-lib-stages-chain-signal = Conception du signal

js-lib-stages-coverage-aria = { $field } sur { $body }, par latitude et longitude

js-lib-stages-feature-n = élément { $n }

js-lib-stages-flag = drapeau

js-lib-stages-frequency-mhz = fréquence (MHz)

js-lib-stages-from-to = { $from } à { $to }

js-lib-stages-geojson-aria = L'export GeoJSON tracé sur une carte

js-lib-stages-histogram = Histogramme

js-lib-stages-inner-planets = Planètes intérieures

js-lib-stages-km-from-centre = { $d } km de { $centre }

js-lib-stages-linear-scale = échelle linéaire

js-lib-stages-link-light-time = { $from } à { $to } : temps de lumière aller { $time } s

js-lib-stages-longitude-axis = longitude · latitude sur le côté

js-lib-stages-mission-time = temps de mission (s)

js-lib-stages-noise-floor = plancher de bruit

js-lib-stages-orrery-note = { $scale } · plan x-y du référentiel, vu depuis son pôle nord

js-lib-stages-panel-n = Panneau { $n }

js-lib-stages-plan-view-aria = Vue en plan de { $centre } et des corps qui l'entourent, { $scale }

js-lib-stages-psd-at-t = Densité spectrale de puissance à t = { $t } s

js-lib-stages-psd-axis = densité spectrale de puissance (dBW/Hz)

js-lib-stages-runs = exécutions

js-lib-stages-sat-title = { $constellation } { $id } · lat { $lat }°, lon { $lon }°

js-lib-stages-satellites = satellites

js-lib-stages-spectrum-at-t = spectre à t = { $t } s

js-lib-stages-sqrt-scale = échelle de distance en racine carrée

js-lib-stages-the-body = le corps

js-lib-stages-time-s = temps (s)

js-lib-stages-unit-alarm = Alarme

js-lib-stages-unit-cn0 = Densité porteuse sur bruit

js-lib-stages-unit-position = Position et protection

js-lib-stages-unit-satellites = Satellites

js-lib-stages-unit-time-error = Erreur de temps

js-lib-stages-waterfall-aria = Cascade de densité spectrale de puissance : fréquence en abscisse, temps vers le bas

js-lib-stages-whole-band = Bande entière

js-lib-sweep-clock-availability = Disponibilité de { $who }

js-lib-sweep-clock-holdover = Holdover de { $who } (s)

js-lib-sweep-clock-timing-p95 = Synchronisation temporelle p95 de { $who } (ns)

js-lib-sweep-clock-timing-rms = Synchronisation temporelle RMS de { $who } (ns)

js-lib-sweep-max-altitude = altitude max (km)

js-lib-sweep-max-elevation = élévation max (°)

js-lib-sweep-max-speed = vitesse max (m/s)

js-lib-sweep-min-altitude = altitude min (km)

js-lib-sweep-peak-doppler = Doppler de crête (Hz)

js-lib-sweep-prov-scenario = scénario { $hash }

js-lib-sweep-y-vs-x = { $y } en fonction de { $x }

js-lib-tabs-3d-orbit = Orbite 3D

js-lib-tabs-figures-of-merit = Chiffres de mérite

js-lib-tabs-stability = Stabilité

js-lib-tabs-sweep = Balayage

js-lib-tabs-time-series = Série temporelle

js-lib-tour-ashforde-body = Merci d'avoir exploré Kshana. Nous concevons une ingénierie ouverte, reproductible et fondée d'abord sur les preuves, pour des missions qui ne peuvent pas échouer — honnête sur ce qui est validé et ce qui est modélisé. Une question, une collaboration ou une étude ? Écrivez-nous à contact@ashforde.org.

js-lib-tour-ashforde-title = De la part d'Ashforde® OÜ

js-lib-tour-capabilities-body = Choisissez un onglet de domaine — Orbites, Synchronisation, Inertiel, GNSS, Résilience, Lunaire, IA/ML, Interop — pour voir ses capacités, chacune étiquetée Validé ou Modélisé, avec un bouton ▸ exécuter pour les scénarios détaillés. Ouvrez « Preuves et provenance » dans n'importe quel domaine pour remonter jusqu'à la preuve, ou activez « Validé uniquement » pour n'afficher que ce qui est vérifié par rapport à une référence externe.

js-lib-tour-capabilities-title = Explorer le moteur, un domaine après l'autre

js-lib-tour-cite-body = Kshana est conçu pour être cité — une version logicielle citable avec un DOI, ainsi que des articles de type publication sur l'écart d'optimisme des dégradations RF et sur un niveau de protection temporel conditionnel. Copiez la citation directement d'ici.

js-lib-tour-cite-title = Publications et comment citer

js-lib-tour-download-report-body = L'onglet Balayage fait varier un paramètre sur une plage ; « Épingler pour comparer » superpose deux exécutions ou plus côte à côte avec le Δ entre elles (valable pour tous les types de scénarios — horloge, PNT Mars, positionnement…) ; et ce bouton télécharge l'exécution sous forme de rapport HTML autonome, hors ligne.

js-lib-tour-download-report-title = Balayer, comparer et exporter

js-lib-tour-guided-body = Les réglages guidés s'adaptent au scénario — graine, seuil de la spécification, durée, masque d'élévation, altitude d'orbite — et chaque modification relance l'exécution instantanément.

js-lib-tour-guided-title = Ajustez les curseurs

js-lib-tour-mcp-body = Un serveur MCP permet aux assistants IA d'exécuter le moteur validé au lieu de deviner ; un plugin JetBrains lance des scénarios d'un clic droit.

js-lib-tour-mcp-title = Utilisez-le depuis un agent IA ou votre IDE

js-lib-tour-playground-body = Choisissez un scénario dans la liste déroulante — ou cliquez sur ▸ exécuter sur n'importe quelle capacité ci-dessus — et le moteur s'exécute en WebAssembly sur votre machine. Rien n'est envoyé.

js-lib-tour-playground-title = Exécutez-le dans votre navigateur

js-lib-tour-run-body = Exécute le scénario courant. Ouvrez « Avancé » pour modifier le TOML et tout changer ; « Copier le lien de partage » reproduit cette exécution exacte pour quelqu'un d'autre.

js-lib-tour-run-title = Exécutez-le

js-lib-tour-tabs-body = Passez des chiffres de mérite au graphique de série temporelle, à la stabilité de l'horloge (écart d'Allan) et — pour les exécutions d'orbite — à une vue d'orbite 3D interactive.

js-lib-tour-tabs-title = Lisez les résultats

js-lib-tour-validation-body = Le même explorateur est aussi le registre de preuves : chaque domaine comporte un tiroir « Preuves et provenance » — le chiffre, la référence externe par rapport à laquelle il est vérifié, et un statut Validé / Modélisé honnête pour chaque affirmation. « Validé uniquement » filtre sur les lignes vérifiées par jeu de données.

js-lib-tour-validation-title = Des preuves, pas des adjectifs

js-lib-views-3-sigma-bound = borne à 3 sigmas

js-lib-views-3d-position-error = erreur de position 3D

js-lib-views-a-parameter = un paramètre

js-lib-views-band-runs =
    { $runs ->
        [one] Bande d'erreur de temps sur { $runs } exécution Monte Carlo
        [many] Bande d'erreur de temps sur { $runs } d'exécutions Monte Carlo
       *[other] Bande d'erreur de temps sur { $runs } exécutions Monte Carlo
    }

js-lib-views-band-the-runs = Bande d'erreur de temps sur les exécutions Monte Carlo

js-lib-views-below-tracking = sous le seuil de poursuite

js-lib-views-chart = graphique

js-lib-views-classical = classique

js-lib-views-epoch = époque

js-lib-views-four-needed = 4 requis pour une position calculée

js-lib-views-free-inertial = inertiel libre

js-lib-views-gnss-denied = GNSS refusé

js-lib-views-ground-track = Trace au sol

js-lib-views-heatmap-effective = Densité porteuse sur bruit effective par satellite et par instant

js-lib-views-heatmap-nominal = Densité porteuse sur bruit nominale (sans brouilleur) par satellite et par instant

js-lib-views-horizontal-alert-limit = limite d'alerte horizontale

js-lib-views-horizontal-hpl = horizontal (HPL)

js-lib-views-id-bound = borne { $id }

js-lib-views-id-median = médiane { $id }

js-lib-views-id-offset = décalage { $id }

js-lib-views-id-p95 = p95 { $id }

js-lib-views-map-matched = calé sur la carte

js-lib-views-map-matched-title = Calé sur la carte, par rapport à l'erreur de position en inertiel libre

js-lib-views-metric = métrique

js-lib-views-oscillator = oscillateur

js-lib-views-oscillator-source = oscillateur ({ $source })

js-lib-views-position-error-axis = erreur de position ({ $unit })

js-lib-views-position-error-m = erreur de position (m)

js-lib-views-position-error-run = Erreur de position au fil de l'exécution
