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
        [many] { $n } modélisés
       *[other] { $n } modélisés
    }

js-lib-kpi-n-partner =
    { $n ->
        [one] { $n } relevant du partenaire
        [many] { $n } relevant du partenaire
       *[other] { $n } relevant du partenaire
    }

js-lib-kpi-n-validated =
    { $n ->
        [one] { $n } validé
        [many] { $n } validés
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

js-lib-views-position-m = position (m)

js-lib-views-predicted-time-error = Erreur de temps prédite depuis la dernière position calculée

js-lib-views-protection-level-m = niveau de protection (m)

js-lib-views-protection-levels = Niveaux de protection par rapport à la limite d'alerte

js-lib-views-quantum = quantum

js-lib-views-relay-error-bound = Erreur de position par navigation par relais et sa borne à 3 sigmas

js-lib-views-satellites = satellites

js-lib-views-satellites-tracking = Satellites visibles et toujours poursuivis

js-lib-views-shaded-gnss-denied = ombré : GNSS refusé

js-lib-views-slot-guard = garde de créneau

js-lib-views-spoofed-offset = Décalage temporel leurré par rapport à la borne de détection

js-lib-views-sweep-of = Balayage de { $parameter } : { $metric }

js-lib-views-sync-error-axis = erreur de synchronisation ({ $unit })

js-lib-views-sync-error-run = Erreur de synchronisation au fil de l'exécution

js-lib-views-threshold = seuil

js-lib-views-time-error-ns = erreur de temps (ns)

js-lib-views-time-ns = temps (ns)

js-lib-views-time-s = temps (s)

js-lib-views-time-since-fix = temps depuis la dernière position calculée (s)

js-lib-views-timing-error-axis = erreur de synchronisation temporelle ({ $unit })

js-lib-views-timing-error-run = Erreur de synchronisation temporelle au fil de l'exécution

js-lib-views-tracking = poursuite

js-lib-views-value = valeur

js-lib-views-vertical-vpl = vertical (VPL)

js-lib-views-visible = visibles

js-lib-views-word-enbw = largeur de bande de bruit équivalente

js-lib-views-word-nfft = longueur de FFT

js-lib-views-word-stec = TEC oblique

js-lib-views-word-toa = temps d'arrivée

js-lib-views-word-ttff = délai avant la première position calculée

js-lib-views-word-tx = émission

js-lib-views-word-zwd = retard humide zénithal

js-lunar-address-outside-range = { $label } : « { $raw } » est hors de la plage { $min } à { $max } ; la valeur du fichier est utilisée.

js-lunar-address-too-long = L'adresse était trop longue ; les valeurs par défaut sont affichées.

js-lunar-address-unknown-source = Source inconnue dans l'adresse ; l'enregistrement est affiché.

js-lunar-alert-limit = limite d'alerte { $value } (illustrative)

js-lunar-alert-not-stated = limite d'alerte non indiquée

js-lunar-bearing-east = 90° E

js-lunar-bearing-west = 90° O

js-lunar-cell-title = { $lat }°, { $lon }° : corrigée { $corrected }, disponibilité { $availability }, couverture { $coverage }

js-lunar-copy-address = Copiez l'adresse depuis la barre d'adresse.

js-lunar-counts = { $sats } satellites, { $points } points de grille, { $epochs } époques, { $trials } essais Monte Carlo par époque. Étiquette : { $label }.

js-lunar-engine-no-start = Le moteur n'a pas pu démarrer dans ce navigateur ({ $reason }). Ouvrez plutôt un fichier de résultats.

js-lunar-engine-unknown-kind = Ce moteur ({ $version }) ne connaît pas le type { $kind } ; il exige le moteur 0.36.

js-lunar-fig-availability-region = Disponibilité sur la région

js-lunar-fig-corrected-3d = Erreur corrigée, { $n } %, 3D

js-lunar-fig-coverage = Couverture

js-lunar-fig-epochs-within = époques dans { $value }

js-lunar-fig-horizontal-vertical = horizontale { $h }, verticale { $v }

js-lunar-fig-hpl-below-alert = HPL sous la limite d'alerte

js-lunar-fig-hpl-vpl = HPL, VPL au plus

js-lunar-fig-improvement = Facteur d'amélioration

js-lunar-fig-lowest-point = Minimum en un point

js-lunar-fig-points-always-available = Points disponibles à chaque époque

js-lunar-fig-uncorrected-3d = Erreur non corrigée, { $n } %, 3D

js-lunar-fig-worst-point = Pire point

js-lunar-file-not-json = Ce fichier n'est pas du JSON.

js-lunar-file-not-object = Ce fichier n'est pas un objet JSON.

js-lunar-file-too-large = { $name } : plus de 32 MiB ; cette page lit les fichiers de résultats jusqu'à cette taille.

js-lunar-file-value = fichier : { $value }

js-lunar-full-of-total = { $full } sur { $total }

js-lunar-give-value = { $label } : indiquez une valeur de { $min } à { $max }.

js-lunar-give-whole-value = { $label } : indiquez une valeur de { $min } à { $max } (un nombre entier).

js-lunar-honesty-affiliation = Sans affiliation ni aval d'aucune agence.

js-lunar-honesty-assumptions = Sous les hypothèses publiques indiquées ; ce n'est pas une déclaration sur les performances d'un système réel.

js-lunar-in-grid-spacing = Espacement des anneaux de la grille, degrés

js-lunar-in-latency = Latence de la correction, secondes

js-lunar-in-seed = Graine

js-lunar-in-station-lat = Latitude de la station, degrés

js-lunar-in-station-lon = Longitude de la station, degrés

js-lunar-in-survey-error = Erreur de levé de la station (1 sigma), mètres

js-lunar-in-threshold = Seuil de précision, mètres

js-lunar-in-time-step = Pas de temps, secondes

js-lunar-in-trials = Essais Monte Carlo par époque

js-lunar-input-out-of-range = { $label } est hors plage.

js-lunar-json-field-not-json = Le champ json du fichier n'est pas du JSON.

js-lunar-key-50-or-more = 50 % ou plus

js-lunar-key-90-or-more = 90 % ou plus

js-lunar-key-95-or-more = 95 % ou plus

js-lunar-key-99-or-more = 99 % ou plus

js-lunar-key-above = au-dessus de { $value }

js-lunar-key-above-threshold = au-dessus de { $value } × le seuil

js-lunar-key-below-50 = moins de 50 %

js-lunar-key-between = { $from } à { $to }

js-lunar-key-between-threshold = { $from } à { $to } × le seuil

js-lunar-key-up-to = jusqu'à { $value }

js-lunar-key-up-to-threshold = jusqu'à { $value } × le seuil

js-lunar-layer-availability = disponibilité

js-lunar-layer-coverage = couverture

js-lunar-layer-error = erreur corrigée

js-lunar-layer-range = erreur corrigée sur sa propre plage

js-lunar-legend-no-figure = aucun chiffre (indisponible partout)

js-lunar-legend-radius = rayon de couverture

js-lunar-legend-threshold = seuil, { $value }

js-lunar-legend-worst = pire point

js-lunar-link-copied = Lien copié.

js-lunar-map-desc = { $points } points de grille du pôle jusqu'à { $rim }° de latitude. { $meet } d'entre eux ont une erreur corrigée au percentile { $percentile } dans le seuil de { $threshold }. Colorée selon { $layer }. La station est à { $lat }°, { $lon }°.

js-lunar-map-note-one-band = { $share } % des points tombent dans une seule bande de l'échelle de seuil, si bien que la carte montre peu de variation : colorez selon « sa propre plage » pour voir comment l'erreur varie sur la région.

js-lunar-needs-newer-engine = Cette étude exige le moteur { $need } ou plus récent ; le moteur exécuté ici est v{ $version }. L'enregistrement, ou un fichier de résultats, peut tout de même être affiché.

js-lunar-no = non

js-lunar-no-recording = Aucun enregistrement de cette étude n'est encore livré : il est réalisé à la publication avec le moteur 0.36. Exécutez-la ici avec un moteur qui connaît ce type, ou ouvrez un fichier de résultats.

js-lunar-no-scenario = Ce site n'a pas encore de { $file } : il arrive avec le moteur 0.36. Ouvrez plutôt un fichier de résultats.

js-lunar-no-scenario-note = Ce site n'a pas encore de { $file } (il arrive avec le moteur 0.36), donc une exécution ici n'est pas possible ; ouvrez plutôt un fichier de résultats.

js-lunar-not-report = Ce n'est pas un rapport { $kind }.

js-lunar-not-stated = non indiqué

js-lunar-note-none = Le fichier n'indique aucune note.

js-lunar-note-withheld = La déclaration propre au fichier nomme un programme ou une agence ; cette page ne l'affiche donc pas, et la déclaration en haut de la page s'applique.

js-lunar-point-epochs-reason = points-époques : { $reason }

js-lunar-radius-desc =
    { $count ->
        [one] Rayon de couverture sur { $count } azimut : le plus court { $lo } km à { $loAz }°, le plus long { $hi } km à { $hiAz }°.
        [many] Rayon de couverture sur { $count } d'azimuts : le plus court { $lo } km à { $loAz }°, le plus long { $hi } km à { $hiAz }°.
       *[other] Rayon de couverture sur { $count } azimuts : le plus court { $lo } km à { $loAz }°, le plus long { $hi } km à { $hiAz }°.
    }

js-lunar-radius-desc-limited =
    { $count ->
        [one] { $count } atteint le bord de la grille, donc la couverture s'étend au moins jusque-là.
        [many] { $count } d'entre eux atteignent le bord de la grille, donc la couverture s'étend au moins jusque-là.
       *[other] { $count } atteignent le bord de la grille, donc la couverture s'étend au moins jusque-là.
    }

js-lunar-radius-hollow = Les points creux atteignent le bord de la grille : la couverture tient au moins jusque-là le long de cet azimut.

js-lunar-radius-none = Le rapport n'indique aucun rayon de couverture.

js-lunar-radius-per-azimuth = rayon de couverture par azimut

js-lunar-radius-point = { $az }° : { $km } km

js-lunar-radius-point-limited = { $az }° : { $km } km (atteint le bord de la grille : au moins jusque-là)

js-lunar-radius-zero = Sur chaque azimut, la couverture est déjà inférieure à 95 % à la station, donc le rayon est de 0 km : l'erreur corrigée dépasse là le seuil de { $value }.

js-lunar-reason-station-missing = la station ne voit pas tous les satellites que l'utilisateur emploie

js-lunar-reason-user-lt4 = moins de quatre satellites en vue de l'utilisateur

js-lunar-run-stopped = L'exécution s'est arrêtée : { $message }

js-lunar-running = Exécution de l'étude dans ce navigateur…

js-lunar-running-elapsed = Exécution de l'étude dans ce navigateur… { $seconds } s

js-lunar-scenario-missing-keys = Le fichier de scénario n'a pas de { $keys } ; il ne peut pas être modifié ici.

js-lunar-set-inputs = Réglez les entrées puis appuyez sur Exécuter ici.

js-lunar-showing = Affichage de { $what }.

js-lunar-showing-engine = Affichage de { $what } (moteur { $version }).

js-lunar-source-error = { $what } : { $error }

js-lunar-station = station

js-lunar-station-title = station { $lat }°, { $lon }°

js-lunar-table-count =
    { $n ->
        [one] { $n } point, le plus proche de la station d'abord.
        [many] { $n } de points, les plus proches de la station d'abord.
       *[other] { $n } points, les plus proches de la station d'abord.
    }

js-lunar-th-corrected = Erreur corrigée, { $n } %

js-lunar-threshold-title = erreur corrigée { $value } (le seuil)

js-lunar-what-file = le fichier { $name }

js-lunar-what-recording = l'enregistrement livré avec le Studio

js-lunar-what-run = une exécution dans ce navigateur (moteur { $version })

js-lunar-worst-at = à { $lat }°, { $lon }°

js-lunar-worst-title = pire point { $lat }°, { $lon }° : { $value }

js-lunar-yes-at-least = oui : au moins jusque-là

js-lunarinfra-above-95-point = au-dessus du point à 95 %

js-lunarinfra-advisory = Logiciel à titre consultatif, et non un équipement homologué ; aucune voie d'émission d'aucune sorte.

js-lunarinfra-arc-note = Longueur d'onde de la porteuse { $value } m.

js-lunarinfra-arc-title = Chaque arc

js-lunarinfra-bars-not-loaded = le fichier des seuils ne s'est pas chargé

js-lunarinfra-bars-not-shown = Les seuils fixés à l'avance n'ont pas pu être affichés ({ $reason }).

js-lunarinfra-bars-note = Fixés avant toute notation d'étude, avec les verdicts de référence (commit du moteur { $commit }). Rien n'est VALIDATED ; un seuil marqué NOT MET est figé par un test qui affirme l'échec, et aucun n'a été assoupli.

js-lunarinfra-bars-title = Par rapport aux seuils fixés à l'avance

js-lunarinfra-bars-wrong-file = le fichier des seuils n'est pas celui que lit cette page

js-lunarinfra-blurb-carrier-phase = Une station de surface et un orbiteur utilisant la phase de la porteuse en double différence de signaux GNSS terrestres : les ambiguïtés entières peuvent-elles être fixées, et qu'est-ce que cela change pour la borne de position ? L'exemple d'exécution rapide.

js-lunarinfra-blurb-frame-coestimation = Les sept paramètres du système géodésique lunaire à partir de la télémétrie laser depuis des stations terrestres, avec et sans mesures de distance entre orbiteur et station de surface : de combien l'information s'améliore-t-elle ?

js-lunarinfra-blurb-geodesy-sensitivity = Quelle est la sensibilité de la télémétrie laser, du suivi d'orbiteur, d'un gravimètre et d'une horloge de surface aux nombres de Love de marée h2, k2 et l2 de la Lune et à sa libration physique ?

js-lunarinfra-blurb-od-consistency = Détermination d'orbite embarquée par GNSS terrestre sur une orbite de halo quasi rectiligne, par rapport à une solution radiométrique au sol indépendante du même arc : les deux s'accordent-elles dans les limites de leurs incertitudes indiquées, et le contrôle de cohérence repère-t-il une erreur de modélisation lorsqu'on en injecte une ? Présentées côte à côte.

js-lunarinfra-blurb-space-tie = GNSS, VLBI et télémétrie laser sur un même engin spatial : avec quelle précision peut-on relier les décalages entre les trois techniques, par rapport à l'erreur du lien local sur l'engin ?

js-lunarinfra-bound-label = Incertitude de position, flottante et fixée, échelle logarithmique

js-lunarinfra-bound-note = Incertitude de position à un sigma de la station et de l'orbiteur avec les ambiguïtés laissées flottantes et avec elles fixées (ce que donnerait la fixation si elle était atteinte).

js-lunarinfra-bound-title = Borne de position, flottante et fixée

js-lunarinfra-chip-na = n/d

js-lunarinfra-comp-normal = normale

js-lunarinfra-comp-position = position (3D)

js-lunarinfra-comp-radial = radiale

js-lunarinfra-comp-transverse = transverse

js-lunarinfra-compare-note = Sur { $sets } jeux aléatoires de stations, la plus petite valeur propre n'était pas plus petite avec les liaisons de l'orbiteur dans { $lambda } et la trace pas plus grande dans { $trace } ; la hausse médiane de la plus petite valeur propre était de { $median } fois.

js-lunarinfra-compare-title = La comparaison en chiffres

js-lunarinfra-crsigma-label = Sigma de Cramér-Rao, échelle logarithmique

js-lunarinfra-crsigma-note = En mètres à la surface.

js-lunarinfra-crsigma-title = Sigma de Cramér-Rao par paramètre

js-lunarinfra-days =
    { $n ->
        [one] { $n } jour
        [many] { $n } de jours
       *[other] { $n } jours
    }

js-lunarinfra-direction = direction { $n }

js-lunarinfra-disclosures = Divulgations

js-lunarinfra-eig-label = Valeurs propres d'information, échelle logarithmique

js-lunarinfra-eig-note = Les sept valeurs propres de la matrice d'information, de la plus petite à la plus grande, sans et avec les liaisons orbiteur-station. La plus petite est multipliée par { $times }, et la trace de Cramér-Rao tombe à { $share } de sa valeur. Cela suppose que l'orbite est connue dans les axes lunaires (son erreur est portée par le sigma de distance de l'orbiteur).

js-lunarinfra-eig-title = L'information dans chaque direction du système géodésique

js-lunarinfra-fact-arc = Arc

js-lunarinfra-fact-hash = Empreinte du scénario

js-lunarinfra-fact-llr-rows = Lignes de télémétrie laser

js-lunarinfra-fact-orbit-family = Famille d'orbites

js-lunarinfra-fact-orbiter-arc = Arc de l'orbiteur

js-lunarinfra-fact-orbiter-rows = Lignes de l'orbiteur

js-lunarinfra-fact-study = Étude

js-lunarinfra-fact-wavelength = Longueur d'onde de la porteuse

js-lunarinfra-families-note = Le RMS de la dérivée partielle de chaque paramètre sur les lignes de la famille, et le nombre de lignes. Un zéro est un paramètre auquel cette famille est aveugle. La sensibilité de la famille de l'orbiteur à k2 est un chiffre de haut de fourchette.

js-lunarinfra-families-title = Ce que voit chaque famille

js-lunarinfra-findings = Constats

js-lunarinfra-fix-note-a = La part des essais Monte Carlo qui ont fixé correctement toutes les ambiguïtés entières (avec son erreur standard), et le taux que prédit l'estimation par bootstrap.

js-lunarinfra-fix-note-b = La fixation des entiers n'est PAS atteinte à cette entrée : le meilleur arc fixe { $share } des essais.

js-lunarinfra-fix-note-c = Il n'y a aucun délai de fixation à montrer, car la fixation n'est pas atteinte.

js-lunarinfra-fix-rate-label = Taux de fixation des entiers en fonction de la longueur de l'arc

js-lunarinfra-fix-title = Taux de fixation en fonction de la longueur de l'arc

js-lunarinfra-fixed = fixée

js-lunarinfra-float = flottante

js-lunarinfra-fraction-above-95 = Fraction des essais au-dessus du point à 95 %

js-lunarinfra-ground-radiometric = radiométrique au sol indépendante

js-lunarinfra-injected-error = erreur injectée { $value } m/s²

js-lunarinfra-mean-consistency = Statistique de cohérence moyenne

js-lunarinfra-mean-q = q moyen

js-lunarinfra-miss-line = { $id } est { $status } : { $value }

js-lunarinfra-miss-no-fix = La fixation des ambiguïtés entières n'est PAS atteinte à cette entrée : le meilleur arc fixe { $share } des essais Monte Carlo.

js-lunarinfra-na = n/d

js-lunarinfra-nominal = nominale

js-lunarinfra-not-result = ceci n'est pas un résultat d'infrastructure lunaire

js-lunarinfra-not-verified = Non vérifié

js-lunarinfra-offset-precision-label = Précision des décalages en fonction du lien local, log-log

js-lunarinfra-offsets-note = Sigma de translation par axe, sigma d'échelle et de rotation à la surface, en mètres.

js-lunarinfra-offsets-title = Les décalages pour chaque erreur de lien (arc de { $days } jours, { $epochs } époques)

js-lunarinfra-onboard-gnss = GNSS terrestre embarqué

js-lunarinfra-open-failed = { $title } n'a pas pu être ouvert : { $reason }.

js-lunarinfra-opening = Ouverture de { $title }…

js-lunarinfra-orbit-uncertainty-log = Incertitude d'orbite par composante, échelle logarithmique

js-lunarinfra-orbiter-days = orbiteur, { $days } j

js-lunarinfra-q-note = Moyenne de la statistique de cohérence q sur { $trials } essais ; { $expected } est ce que donne un couple cohérent de solutions. La fraction d'essais au-dessus du point à 95 % est le taux de détection du contrôle.

js-lunarinfra-q-title = Le contrôle de cohérence, nominal contre erreur injectée

js-lunarinfra-recorded =
    { $n ->
        [one] { $title } : le résultat enregistré du moteur (version { $version }).
        [many] { $title } : les résultats enregistrés du moteur (version { $version }).
       *[other] { $title } : les résultats enregistrés du moteur (version { $version }).
    }

js-lunarinfra-rel-label = Sigma rapporté au nominal, échelle logarithmique

js-lunarinfra-rel-note = Sigma de Cramér-Rao en pourcentage de la valeur nominale, avec les quatre familles ensemble. h2 et l2 sont des points de linéarisation, pas des valeurs vérifiées ; k2 provient d'un ajustement publié.

js-lunarinfra-rel-title = Avec quelle précision chaque paramètre peut être fixé, par rapport à sa valeur nominale

js-lunarinfra-result-not-json = le résultat n'est pas du JSON ({ $reason })

js-lunarinfra-result-not-loaded = le résultat enregistré { $file } ne s'est pas chargé

js-lunarinfra-row-above-95 = Essais au-dessus du point à 95 % (khi-deux à 95 % = { $chi })

js-lunarinfra-row-crtrace = Trace de Cramér-Rao

js-lunarinfra-row-degeneracy = Métrique de dégénérescence

js-lunarinfra-row-formal-diff = Sigma formel de cette différence

js-lunarinfra-row-ground-meas = Sol : mesures, époques avec une station

js-lunarinfra-row-mean-diff = Différence moyenne des deux orbites

js-lunarinfra-row-mean-q = q moyen (6 attendu)

js-lunarinfra-row-observations = Observations

js-lunarinfra-row-onboard-epochs = Embarqué : époques avec au moins un / au moins quatre satellites

js-lunarinfra-row-onboard-meas = Embarqué : mesures, nombre moyen de satellites poursuivis

js-lunarinfra-row-origin-scale = Corrélation origine-échelle

js-lunarinfra-row-origin-sigma = Sigma de l'origine, m

js-lunarinfra-row-rank-defect = Rang (défaut)

js-lunarinfra-row-smallest-eig = Plus petite valeur propre

js-lunarinfra-row-trace-ground = Échantillon sur trace formelle, sol

js-lunarinfra-row-trace-onboard = Échantillon sur trace formelle, embarqué

js-lunarinfra-row-within-95 = Essais dans le point à 95 %

js-lunarinfra-series-bootstrapped = par bootstrap

js-lunarinfra-series-floor = plancher

js-lunarinfra-series-monte-carlo = Monte Carlo

js-lunarinfra-side-note = L'orbite : { $family }, un arc de { $arc } jours d'une orbite de { $period } jours, échantillonné toutes les { $sample } s.

js-lunarinfra-side-title = Côte à côte

js-lunarinfra-sigma-note = Incertitude de position à un sigma par composante, en mètres, à partir des deux estimations du même arc.

js-lunarinfra-sigma-over-nominal = sigma / nominal

js-lunarinfra-sigma-title = Avec quelle précision chaque côté connaît l'orbite

js-lunarinfra-station-days = station, { $days } j

js-lunarinfra-status-verdict = { $status } : { $verdict }

js-lunarinfra-subsets-note = L'ajout d'une famille n'a jamais abaissé la plus petite valeur propre ({ $lambda } ajouts sur { $pairs }), mais la trace de la pseudo-inverse n'était pas plus grande dans seulement { $trace } cas sur { $pairs }, car une famille ajoutée peut faire monter le rang.

js-lunarinfra-subsets-title = Chaque combinaison de familles

js-lunarinfra-sweep-note = La pire composante de translation de chaque décalage, en mètres, quand on fait varier l'erreur du lien entre les trois techniques sur l'engin spatial. Avec les sigmas enregistrés des techniques (GNSS { $gnss } m, VLBI { $vlbi } m, laser { $slr } m), les décalages sont limités par le bruit de mesure, pas par le lien ; le lien ne fixe le plancher que pour des techniques quasi parfaites.

js-lunarinfra-sweep-title = Précision des décalages entre techniques en fonction du lien local (arc de { $days } jours)

js-lunarinfra-th-arc-days = Arc, jours

js-lunarinfra-th-bar = Seuil

js-lunarinfra-th-bootstrapped = Taux par bootstrap

js-lunarinfra-th-budget-exhausted = Budget de recherche épuisé (essais)

js-lunarinfra-th-common-sats = Époques avec 2 satellites communs ou plus

js-lunarinfra-th-crtrace = Trace de Cramér-Rao

js-lunarinfra-th-dd-ambiguities = Ambiguïtés en double différence

js-lunarinfra-th-epochs = Époques

js-lunarinfra-th-families = Familles

js-lunarinfra-th-family = Famille

js-lunarinfra-th-local-tie = Sigma du lien local, m

js-lunarinfra-th-mc-fix-rate = Taux de fixation Monte Carlo

js-lunarinfra-th-median-ambiguity = Sigma d'ambiguïté médian, cycles

js-lunarinfra-th-offset = Décalage

js-lunarinfra-th-quantity = Grandeur

js-lunarinfra-th-rank = Rang

js-lunarinfra-th-rotation = Rotation à la surface, m

js-lunarinfra-th-rows = Lignes

js-lunarinfra-th-scale = Échelle à la surface, m

js-lunarinfra-th-smallest-eig = Plus petite valeur propre

js-lunarinfra-th-translation = Translation x, y, z, m

js-lunarinfra-th-value = Valeur

js-lunarinfra-th-verdict = Verdict

js-lunarinfra-th-with-links = Avec liaisons de l'orbiteur

js-lunarinfra-th-without-links = Sans liaisons de l'orbiteur

js-lunarinfra-title-carrier-phase = Phase de la porteuse, surface et orbiteur

js-lunarinfra-title-frame-coestimation = Co-estimation du référentiel

js-lunarinfra-title-geodesy-sensitivity = Nombres de Love et libration

js-lunarinfra-title-od-consistency = Cohérence de la détermination d'orbite

js-lunarinfra-title-space-tie = Lien spatial

js-lunarinfra-unknown-study = ce résultat d'infrastructure lunaire est l'étude « { $study } », que cette page ne lit pas

js-lunarinfra-where-missed = Où cette étude a échoué.

js-lunarinfra-with-links = avec liaisons de l'orbiteur

js-lunarinfra-without-links = sans liaisons de l'orbiteur

js-lunarinfra-x-arc-length = longueur de l'arc, jours

js-lunarinfra-x-local-tie = sigma du lien local, m (log)

js-lunarinfra-y-fixed-correctly = fixées correctement, %

js-lunarinfra-y-offset-sigma = sigma du décalage, m (log) ; le plancher en pointillés est le lien seul, sqrt(2) × l'erreur du lien

js-meaning-body-generic = le corps

js-meaning-body-the = { $name }

js-meaning-card-label-sub = { $k }, { $sub }

js-meaning-checks-of =
    { $n ->
        [one] { $av } sur { $n } vérification
        [many] { $av } sur { $n } de vérifications
       *[other] { $av } sur { $n } vérifications
    }

js-meaning-coverage-average-label = Moyenne en vue

js-meaning-coverage-big-min =
    { $n ->
        [one] Au moins { $n } satellite en vue en tout lieu, { $mean } en moyenne.
        [many] Au moins { $n } de satellites en vue en tout lieu, { $mean } en moyenne.
       *[other] Au moins { $n } satellites en vue en tout lieu, { $mean } en moyenne.
    }

js-meaning-coverage-big-none = Certains lieux ne voient parfois aucun satellite ; { $mean } sont en vue en moyenne.

js-meaning-coverage-fewest-label = Minimum en vue, où que ce soit

js-meaning-coverage-line-many = Avec { $names } ensemble, une position calculée est possible en { $share } % des lieux et des instants autour de { $body }.

js-meaning-coverage-line-many-pdop = Avec { $names } ensemble, une position calculée est possible en { $share } % des lieux et des instants autour de { $body } (qualité de la géométrie, PDOP, sous { $thr }).

js-meaning-coverage-line-none = Une position calculée est possible en { $share } % des lieux et des instants autour de { $body }.

js-meaning-coverage-line-none-pdop = Une position calculée est possible en { $share } % des lieux et des instants autour de { $body } (qualité de la géométrie, PDOP, sous { $thr }).

js-meaning-coverage-line-one = Avec { $names }, une position calculée est possible en { $share } % des lieux et des instants autour de { $body }.

js-meaning-coverage-line-one-pdop = Avec { $names }, une position calculée est possible en { $share } % des lieux et des instants autour de { $body } (qualité de la géométrie, PDOP, sous { $thr }).

js-meaning-coverage-places-label = Lieux qui obtiennent une position calculée

js-meaning-duration-days =
    { $n ->
        [one] { $days } jour
        [many] { $days } de jours
       *[other] { $days } jours
    }

js-meaning-ensemble-big-many = Sur de nombreux tirages de bruit, { $q } tient { $thr } ns pendant { $qd } en moyenne ; { $c } pendant { $cd }.

js-meaning-ensemble-big-runs =
    { $n ->
        [one] Sur { $n } tirage de bruit, { $q } tient { $thr } ns pendant { $qd } en moyenne ; { $c } pendant { $cd }.
        [many] Sur { $n } de tirages de bruit, { $q } tient { $thr } ns pendant { $qd } en moyenne ; { $c } pendant { $cd }.
       *[other] Sur { $n } tirages de bruit, { $q } tient { $thr } ns pendant { $qd } en moyenne ; { $c } pendant { $cd }.
    }

js-meaning-ensemble-line = Neuf tirages sur dix de { $name } tiennent de { $band }.

js-meaning-ensemble-mean = moyenne

js-meaning-ensemble-mean-band = moyenne ; bande à 90 % { $band }

js-meaning-error-p95-label = Erreur, 95 % du temps, { $name }

js-meaning-generic-big = { $label } : { $value }.

js-meaning-generic-line-one = Également issu de cette exécution : { $a }.

js-meaning-generic-line-two = Également issus de cette exécution : { $a } et { $b }.

js-meaning-generic-none = Cette exécution n'a pas de chiffre principal unique ; le graphique ci-dessous montre son résultat.

js-meaning-holdover-label = Holdover, { $name }

js-meaning-hpl-sub = niveau de protection horizontal

js-meaning-inside-budget = dans { $budget }

js-meaning-integrity-big-checks-mostly = Oui, en majorité : à { $share } % des vérifications.

js-meaning-integrity-big-checks-no = Non : à { $share } % des vérifications.

js-meaning-integrity-big-checks-partly = Seulement en partie : à { $share } % des vérifications.

js-meaning-integrity-big-checks-yes = Oui : à { $share } % des vérifications.

js-meaning-integrity-big-span-mostly = Oui, en majorité : pendant { $share } % de { $span }.

js-meaning-integrity-big-span-no = Non : pendant { $share } % de { $span }.

js-meaning-integrity-big-span-partly = Seulement en partie : pendant { $share } % de { $span }.

js-meaning-integrity-big-span-yes = Oui : pendant { $share } % de { $span }.

js-meaning-integrity-bound-label = Borne d'erreur typique

js-meaning-integrity-bound-sub = horizontale / verticale, médiane

js-meaning-integrity-gap-all-passed = toutes les vérifications réussies

js-meaning-integrity-gap-label = Plus longue interruption

js-meaning-integrity-gap-none = aucune

js-meaning-integrity-gap-sub =
    { $n ->
        [one] { $n } vérification d'affilée, à partir de { $from }
        [many] { $n } de vérifications d'affilée, à partir de { $from }
       *[other] { $n } vérifications d'affilée, à partir de { $from }
    }

js-meaning-integrity-line-h =
    { $n ->
        [one] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale) à { $av } vérification sur { $tot }.
        [many] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale) à { $av } vérifications sur { $tot }.
       *[other] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale) à { $av } vérifications sur { $tot }.
    }

js-meaning-integrity-line-h-clean =
    { $n ->
        [one] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale) à { $av } vérification sur { $tot }, et aucune position calculée n'était trompeuse.
        [many] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale) à { $av } vérifications sur { $tot }, et aucune position calculée n'était trompeuse.
       *[other] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale) à { $av } vérifications sur { $tot }, et aucune position calculée n'était trompeuse.
    }

js-meaning-integrity-line-h-some =
    { $n ->
        [one] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale) à { $av } vérifications sur { $tot } ; { $n } position calculée était trompeuse.
        [many] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale) à { $av } vérifications sur { $tot } ; { $n } de positions calculées étaient trompeuses.
       *[other] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale) à { $av } vérifications sur { $tot } ; { $n } positions calculées étaient trompeuses.
    }

js-meaning-integrity-line-hv =
    { $n ->
        [one] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale et { $v } m à la verticale) à { $av } vérification sur { $tot }.
        [many] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale et { $v } m à la verticale) à { $av } vérifications sur { $tot }.
       *[other] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale et { $v } m à la verticale) à { $av } vérifications sur { $tot }.
    }

js-meaning-integrity-line-hv-clean =
    { $n ->
        [one] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale et { $v } m à la verticale) à { $av } vérification sur { $tot }, et aucune position calculée n'était trompeuse.
        [many] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale et { $v } m à la verticale) à { $av } vérifications sur { $tot }, et aucune position calculée n'était trompeuse.
       *[other] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale et { $v } m à la verticale) à { $av } vérifications sur { $tot }, et aucune position calculée n'était trompeuse.
    }

js-meaning-integrity-line-hv-some =
    { $n ->
        [one] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale et { $v } m à la verticale) à { $av } vérifications sur { $tot } ; { $n } position calculée était trompeuse.
        [many] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale et { $v } m à la verticale) à { $av } vérifications sur { $tot } ; { $n } de positions calculées étaient trompeuses.
       *[other] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $h } m à l'horizontale et { $v } m à la verticale) à { $av } vérifications sur { $tot } ; { $n } positions calculées étaient trompeuses.
    }

js-meaning-integrity-line-none =
    { $n ->
        [one] La borne d'erreur du récepteur (son niveau de protection) est restée sous la limite d'alerte à { $av } vérification sur { $tot }.
        [many] La borne d'erreur du récepteur (son niveau de protection) est restée sous la limite d'alerte à { $av } vérifications sur { $tot }.
       *[other] La borne d'erreur du récepteur (son niveau de protection) est restée sous la limite d'alerte à { $av } vérifications sur { $tot }.
    }

js-meaning-integrity-line-none-clean =
    { $n ->
        [one] La borne d'erreur du récepteur (son niveau de protection) est restée sous la limite d'alerte à { $av } vérification sur { $tot }, et aucune position calculée n'était trompeuse.
        [many] La borne d'erreur du récepteur (son niveau de protection) est restée sous la limite d'alerte à { $av } vérifications sur { $tot }, et aucune position calculée n'était trompeuse.
       *[other] La borne d'erreur du récepteur (son niveau de protection) est restée sous la limite d'alerte à { $av } vérifications sur { $tot }, et aucune position calculée n'était trompeuse.
    }

js-meaning-integrity-line-none-some =
    { $n ->
        [one] La borne d'erreur du récepteur (son niveau de protection) est restée sous la limite d'alerte à { $av } vérifications sur { $tot } ; { $n } position calculée était trompeuse.
        [many] La borne d'erreur du récepteur (son niveau de protection) est restée sous la limite d'alerte à { $av } vérifications sur { $tot } ; { $n } de positions calculées étaient trompeuses.
       *[other] La borne d'erreur du récepteur (son niveau de protection) est restée sous la limite d'alerte à { $av } vérifications sur { $tot } ; { $n } positions calculées étaient trompeuses.
    }

js-meaning-integrity-line-v =
    { $n ->
        [one] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $v } m à la verticale) à { $av } vérification sur { $tot }.
        [many] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $v } m à la verticale) à { $av } vérifications sur { $tot }.
       *[other] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $v } m à la verticale) à { $av } vérifications sur { $tot }.
    }

js-meaning-integrity-line-v-clean =
    { $n ->
        [one] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $v } m à la verticale) à { $av } vérification sur { $tot }, et aucune position calculée n'était trompeuse.
        [many] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $v } m à la verticale) à { $av } vérifications sur { $tot }, et aucune position calculée n'était trompeuse.
       *[other] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $v } m à la verticale) à { $av } vérifications sur { $tot }, et aucune position calculée n'était trompeuse.
    }

js-meaning-integrity-line-v-some =
    { $n ->
        [one] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $v } m à la verticale) à { $av } vérifications sur { $tot } ; { $n } position calculée était trompeuse.
        [many] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $v } m à la verticale) à { $av } vérifications sur { $tot } ; { $n } de positions calculées étaient trompeuses.
       *[other] La borne d'erreur du récepteur (son niveau de protection) est restée sous les limites d'alerte ({ $v } m à la verticale) à { $av } vérifications sur { $tot } ; { $n } positions calculées étaient trompeuses.
    }

js-meaning-integrity-misleading-label = Positions calculées trompeuses

js-meaning-integrity-misleading-sub = erreur réelle au-dessus de la borne

js-meaning-integrity-trusted-label = Durée pendant laquelle la position calculée est fiable

js-meaning-jamming-above-label = Brouilleur au-dessus du signal

js-meaning-jamming-above-sub = rapport brouilleur sur signal moyen

js-meaning-jamming-big-gone = Le brouilleur supprime complètement la position calculée.

js-meaning-jamming-big-share = Avec le brouilleur, une position calculée est disponible { $share } % du temps.

js-meaning-jamming-clear-label = Position calculée disponible, sans brouilleur

js-meaning-jamming-fewest-label = Minimum de satellites poursuivis

js-meaning-jamming-fewest-sub = au pire instant

js-meaning-jamming-jammed-label = Position calculée disponible, brouillée

js-meaning-jamming-line = Sans le brouilleur, la position calculée est disponible { $share } % du temps.

js-meaning-jamming-line-js = Sans le brouilleur, la position calculée est disponible { $share } % du temps ; le brouilleur arrive { $db } dB au-dessus du signal en moyenne.

js-meaning-kicker = { $domain } · { $title }

js-meaning-lunar-big-all =
    { $n ->
        [one] Oui : à chacune des { $n } vérification.
        [many] Oui : à chacune des { $n } de vérifications.
       *[other] Oui : à chacune des { $n } vérifications.
    }

js-meaning-lunar-big-none =
    { $n ->
        [one] Non : à aucune des { $n } vérification.
        [many] Non : à aucune des { $n } de vérifications.
       *[other] Non : à aucune des { $n } vérifications.
    }

js-meaning-lunar-big-some =
    { $n ->
        [one] À { $av } vérification sur { $n } ({ $share } %).
        [many] À { $av } vérifications sur { $n } ({ $share } %).
       *[other] À { $av } vérifications sur { $n } ({ $share } %).
    }

js-meaning-lunar-largest-label = Plus grande borne d'erreur

js-meaning-lunar-line = Le niveau de protection allait de { $min } à { $max } m pour une limite d'alerte de { $limit } m.

js-meaning-lunar-meet-label = Vérifications qui respectent la limite

js-meaning-lunar-meet-value = { $av } sur { $tot }

js-meaning-lunar-smallest-label = Plus petite borne d'erreur

js-meaning-median-lower-better = médiane, plus bas est meilleur

js-meaning-of-the-time = du temps

js-meaning-orbit-best-label = Meilleure géométrie (PDOP)

js-meaning-orbit-best-sub = le plus bas sur l'exécution

js-meaning-orbit-big-always = Une position calculée est possible tout le temps.

js-meaning-orbit-big-share = Une position calculée est possible { $share } % du temps.

js-meaning-orbit-error-label = Erreur de position typique

js-meaning-orbit-error-sub = 1 sigma, médiane

js-meaning-orbit-line =
    { $n ->
        [one] Assez de satellites étaient en vue à { $fix } instant sur { $n }.
        [many] Assez de satellites étaient en vue à { $fix } instants sur { $n }.
       *[other] Assez de satellites étaient en vue à { $fix } instants sur { $n }.
    }

js-meaning-orbit-line-pdop =
    { $n ->
        [one] Assez de satellites étaient en vue à { $fix } instant sur { $n } ; la qualité typique de la géométrie (PDOP, dilution de précision de position) est de { $pdop }, plus bas est meilleur.
        [many] Assez de satellites étaient en vue à { $fix } instants sur { $n } ; la qualité typique de la géométrie (PDOP, dilution de précision de position) est de { $pdop }, plus bas est meilleur.
       *[other] Assez de satellites étaient en vue à { $fix } instants sur { $n } ; la qualité typique de la géométrie (PDOP, dilution de précision de position) est de { $pdop }, plus bas est meilleur.
    }

js-meaning-orbit-moments =
    { $n ->
        [one] { $fix } instant sur { $n }
        [many] { $fix } instants sur { $n }
       *[other] { $fix } instants sur { $n }
    }

js-meaning-orbit-time-label = Durée pendant laquelle une position calculée est possible

js-meaning-pair-big-diff-pos = { $best } reste dans { $budget } pendant { $bestDur } ; { $other } pendant { $otherDur }.

js-meaning-pair-big-diff-time = { $best } garde l'heure dans { $budget } pendant { $bestDur } ; { $other } pendant { $otherDur }.

js-meaning-pair-big-same-pos = { $q } comme { $c } restent dans { $budget } pendant { $dur }.

js-meaning-pair-big-same-time = { $q } comme { $c } gardent l'heure dans { $budget } pendant { $dur }.

js-meaning-pair-line-clock = Le holdover est la durée pendant laquelle chaque horloge reste dans le budget de { $budget } après la perte de la navigation par satellite.

js-meaning-pair-line-navigator = Le holdover est la durée pendant laquelle chaque navigateur reste dans le budget de { $budget } après la perte de la navigation par satellite.

js-meaning-pdop-label = Qualité de la géométrie (PDOP)

js-meaning-places-times = des lieux et des instants

js-meaning-range-to = { $from } à { $to }

js-meaning-satellites =
    { $n ->
        [one] satellite
        [many] satellites
       *[other] satellites
    }

js-meaning-spectrum-above = au-dessus du seuil

js-meaning-spectrum-below = sous le seuil : perdu

js-meaning-spectrum-big-kept =
    { $n ->
        [one] Chacun des { $n } signal reste poursuivi.
        [many] Chacun des { $n } de signaux reste poursuivi.
       *[other] Chacun des { $n } signaux reste poursuivi.
    }

js-meaning-spectrum-big-lost =
    { $n ->
        [one] Les brouilleurs font perdre { $lost } sur { $n } signal : { $names }.
        [many] Les brouilleurs font perdre { $lost } sur { $n } de signaux : { $names }.
       *[other] Les brouilleurs font perdre { $lost } sur { $n } signaux : { $names }.
    }

js-meaning-spectrum-line-kept =
    { $n ->
        [one] { $names } reste au-dessus du seuil de poursuite du récepteur pendant toute l'exécution.
        [many] { $names } restent au-dessus du seuil de poursuite du récepteur pendant toute l'exécution.
       *[other] { $names } restent au-dessus du seuil de poursuite du récepteur pendant toute l'exécution.
    }

js-meaning-spectrum-line-kept-thr =
    { $n ->
        [one] { $names } reste au-dessus du seuil de poursuite de { $thr } dB-Hz du récepteur pendant toute l'exécution.
        [many] { $names } restent au-dessus du seuil de poursuite de { $thr } dB-Hz du récepteur pendant toute l'exécution.
       *[other] { $names } restent au-dessus du seuil de poursuite de { $thr } dB-Hz du récepteur pendant toute l'exécution.
    }

js-meaning-spectrum-line-none = Aucun signal ne reste au-dessus du seuil de poursuite du récepteur pendant toute l'exécution.

js-meaning-spectrum-line-none-thr = Aucun signal ne reste au-dessus du seuil de poursuite de { $thr } dB-Hz du récepteur pendant toute l'exécution.

js-meaning-spectrum-weakest-label = Signal le plus faible, { $name }

js-meaning-whole-run = sur toute l'exécution

js-meaning-your-setting = votre réglage

js-meankind-acm-big =
    { $n ->
        [one] Le codage adaptatif fait passer { $gain } fois les données du meilleur mode fixe : { $acm } Gbit contre { $ccm } Gbit sur { $n } passage.
        [many] Le codage adaptatif fait passer { $gain } fois les données du meilleur mode fixe : { $acm } Gbit contre { $ccm } Gbit sur { $n } de passages.
       *[other] Le codage adaptatif fait passer { $gain } fois les données du meilleur mode fixe : { $acm } Gbit contre { $ccm } Gbit sur { $n } passages.
    }

js-meankind-acm-line = Mode fixe { $mode } ; { $dur } de coupure.

js-meankind-anomaly-big = Le moniteur de défauts quantique obtient { $q } contre { $c } pour le moniteur classique (aire sous la courbe, 1 étant parfait).

js-meankind-anomaly-line = Le plus petit défaut détectable est { $q } contre { $c }.

js-meankind-aocs-big-open = La manœuvre de { $slew } degrés ne se stabilise pas sous { $threshold } degrés.

js-meankind-aocs-big-settles = La manœuvre de { $slew } degrés se stabilise sous { $threshold } degrés après { $dur }.

js-meankind-aocs-line = Erreur de pointage finale { $final } degrés.

js-meankind-aocs-line-filter = Erreur de pointage finale { $final } degrés. Un filtre d'attitude dans la boucle se trompe de { $arcsec } secondes d'arc RMS.

js-meankind-aocs-line-wheel = Erreur de pointage finale { $final } degrés. Couple maximal de la roue { $torque } N m.

js-meankind-aocs-line-wheel-filter = Erreur de pointage finale { $final } degrés. Couple maximal de la roue { $torque } N m. Un filtre d'attitude dans la boucle se trompe de { $arcsec } secondes d'arc RMS.

js-meankind-aperture-big = La navigation utilise { $nav } % du temps d'antenne et les communications { $comms } %.

js-meankind-aperture-big-idle = La navigation utilise { $nav } % du temps d'antenne et les communications { $comms } % ; { $idle } % est inutilisé.

js-meankind-aperture-line-all =
    { $n ->
        [one] { $n } ouverture selon la règle { $policy }, avec { $dur } de contention.
        [many] { $n } d'ouvertures selon la règle { $policy }, avec { $dur } de contention.
       *[other] { $n } ouvertures selon la règle { $policy }, avec { $dur } de contention.
    }

js-meankind-aperture-line-contention =
    { $n ->
        [one] { $n } ouverture, avec { $dur } de contention.
        [many] { $n } d'ouvertures, avec { $dur } de contention.
       *[other] { $n } ouvertures, avec { $dur } de contention.
    }

js-meankind-aperture-line-count =
    { $n ->
        [one] { $n } ouverture.
        [many] { $n } d'ouvertures.
       *[other] { $n } ouvertures.
    }

js-meankind-aperture-line-nocount = Les ouvertures.

js-meankind-aperture-line-nocount-all = Les ouvertures selon la règle { $policy }, avec { $dur } de contention.

js-meankind-aperture-line-nocount-contention = Les ouvertures, avec { $dur } de contention.

js-meankind-aperture-line-nocount-policy = Les ouvertures selon la règle { $policy }.

js-meankind-aperture-line-policy =
    { $n ->
        [one] { $n } ouverture selon la règle { $policy }.
        [many] { $n } d'ouvertures selon la règle { $policy }.
       *[other] { $n } ouvertures selon la règle { $policy }.
    }

js-meankind-araim-big-no = Non : les niveaux de protection du moteur s'écartent de la référence publiée.

js-meankind-araim-big-yes = Oui : les niveaux de protection du moteur correspondent à la référence publiée.

js-meankind-araim-line = La pire différence est de { $worst } m pour une tolérance propre à la référence de { $tol } m.

js-meankind-araim-line-vectors =
    { $n ->
        [one] La pire différence est de { $worst } m pour une tolérance propre à la référence de { $tol } m, sur { $n } vecteur de référence.
        [many] La pire différence est de { $worst } m pour une tolérance propre à la référence de { $tol } m, sur { $n } de vecteurs de référence.
       *[other] La pire différence est de { $worst } m pour une tolérance propre à la référence de { $tol } m, sur { $n } vecteurs de référence.
    }

js-meankind-arc-big = L'estimateur retrouve l'orbite dès qu'il dispose de { $dur } de l'arc de { $h } h.

js-meankind-arc-line =
    { $n ->
        [one] { $n } engin spatial, mesures { $observable }.
        [many] { $n } d'engins spatiaux, mesures { $observable }.
       *[other] { $n } engins spatiaux, mesures { $observable }.
    }

js-meankind-ascent-big = La gravité, la traînée, le pilotage et la contre-pression retirent { $loss } m/s du gain de vitesse idéal de { $ideal } m/s.

js-meankind-ascent-line = Fin de combustion à { $km } km et { $speed } m/s ; pression dynamique maximale { $kpa } kPa.

js-meankind-attack-big-no = Un leurreur en surface ne peut pas capturer un récepteur lunaire.

js-meankind-attack-big-yes = Un leurreur en surface peut capturer un récepteur lunaire.

js-meankind-attack-line = Un émetteur de surface porte à { $km } km avant que l'horizon ne le bloque.

js-meankind-attitude-big = L'erreur de pointage totalise { $total } secondes d'arc.

js-meankind-attitude-big-from = L'erreur de pointage totalise { $total } secondes d'arc, principalement à cause de { $from }.

js-meankind-attitude-line = Le plus grand couple de gradient de gravité est de { $torque } N·m.

js-meankind-beacon-big = Les balises de surface améliorent la qualité de la géométrie (PDOP) d'un facteur { $x }.

js-meankind-beacon-line = Ajouter plutôt des satellites l'améliore d'un facteur { $x }.

js-meankind-bodypnt-big = Les relais seuls donnent une position calculée { $share } % du temps autour de { $body }.

js-meankind-bodypnt-big-earth = Les relais seuls donnent une position calculée { $share } % du temps autour de { $body } ; { $earth } % avec des liaisons vers la Terre.

js-meankind-bodypnt-line = { $mean } relais sont en vue en moyenne.

js-meankind-by = { $a } par { $b }

js-meankind-campaign-compose-line = Chaque membre est une exécution ordinaire du moteur ; la campagne lit leurs résultats côte à côte.

js-meankind-campaign-compose-range =
    { $n ->
        [one] Sur { $n } scénario dans les mêmes conditions, { $what } va de { $low } à { $high }.
        [many] Sur { $n } de scénarios dans les mêmes conditions, { $what } va de { $low } à { $high }.
       *[other] Sur { $n } scénarios dans les mêmes conditions, { $what } va de { $low } à { $high }.
    }

js-meankind-campaign-compose-same =
    { $n ->
        [one] Sur { $n } scénario dans les mêmes conditions, { $what } vaut { $value } dans chacun.
        [many] Sur { $n } de scénarios dans les mêmes conditions, { $what } vaut { $value } dans chacun.
       *[other] Sur { $n } scénarios dans les mêmes conditions, { $what } vaut { $value } dans chacun.
    }

js-meankind-campaign-line =
    { $n ->
        [one] { $n } phase.
        [many] { $n } de phases.
       *[other] { $n } phases.
    }

js-meankind-campaign-line-all =
    { $n ->
        [one] { $n } phase et { $events }, issues de { $runs } ; à la fin, { $label } vaut { $value }.
        [many] { $n } de phases et { $events }, issues de { $runs } ; à la fin, { $label } vaut { $value }.
       *[other] { $n } phases et { $events }, issues de { $runs } ; à la fin, { $label } vaut { $value }.
    }

js-meankind-campaign-line-end =
    { $n ->
        [one] { $n } phase ; à la fin, { $label } vaut { $value }.
        [many] { $n } de phases ; à la fin, { $label } vaut { $value }.
       *[other] { $n } phases ; à la fin, { $label } vaut { $value }.
    }

js-meankind-campaign-line-events =
    { $n ->
        [one] { $n } phase et { $events }.
        [many] { $n } de phases et { $events }.
       *[other] { $n } phases et { $events }.
    }

js-meankind-campaign-line-events-end =
    { $n ->
        [one] { $n } phase et { $events } ; à la fin, { $label } vaut { $value }.
        [many] { $n } de phases et { $events } ; à la fin, { $label } vaut { $value }.
       *[other] { $n } phases et { $events } ; à la fin, { $label } vaut { $value }.
    }

js-meankind-campaign-line-events-runs =
    { $n ->
        [one] { $n } phase et { $events }, issues de { $runs }.
        [many] { $n } de phases et { $events }, issues de { $runs }.
       *[other] { $n } phases et { $events }, issues de { $runs }.
    }

js-meankind-campaign-line-runs =
    { $n ->
        [one] { $n } phase, issue de { $runs }.
        [many] { $n } de phases, issues de { $runs }.
       *[other] { $n } phases, issues de { $runs }.
    }

js-meankind-campaign-line-runs-end =
    { $n ->
        [one] { $n } phase, issue de { $runs } ; à la fin, { $label } vaut { $value }.
        [many] { $n } de phases, issues de { $runs } ; à la fin, { $label } vaut { $value }.
       *[other] { $n } phases, issues de { $runs } ; à la fin, { $label } vaut { $value }.
    }

js-meankind-campaign-mission-alarm = L'alarme est levée pendant { $alarm } d'une mission de { $dur }.

js-meankind-campaign-mission-phases = Une mission à { $phases } phases sur { $dur }, enchaînées sur une seule horloge.

js-meankind-campaign-mission-quiet = Aucune alarme sur toute la mission de { $dur }.

js-meankind-campaign-montecarlo =
    { $n ->
        [one] Sur { $n } exécution à graine fixée, { $name } vaut en moyenne { $mean }, avec un écart de { $std }.
        [many] Sur { $n } d'exécutions à graine fixée, { $name } vaut en moyenne { $mean }, avec un écart de { $std }.
       *[other] Sur { $n } exécutions à graine fixée, { $name } vaut en moyenne { $mean }, avec un écart de { $std }.
    }

js-meankind-campaign-montecarlo-line = L'écart est un écart type sur les exécutions.

js-meankind-campaign-optimize =
    { $n ->
        [one] La recherche se fixe sur { $name } de { $value } après { $n } exécution.
        [many] La recherche se fixe sur { $name } de { $value } après { $n } d'exécutions.
       *[other] La recherche se fixe sur { $name } de { $value } après { $n } exécutions.
    }

js-meankind-campaign-optimize-at = À { $at }.

js-meankind-campaign-optimize-kind =
    { $n ->
        [one] La recherche se fixe sur { $name } de { $value } après { $n } exécution de { $kind }.
        [many] La recherche se fixe sur { $name } de { $value } après { $n } d'exécutions de { $kind }.
       *[other] La recherche se fixe sur { $name } de { $value } après { $n } exécutions de { $kind }.
    }

js-meankind-campaign-sweep-flat =
    { $n ->
        [one] Sur { $n } exécution de { $axis } de { $from } à { $to }, { $metric } reste à { $value }.
        [many] Sur { $n } d'exécutions de { $axis } de { $from } à { $to }, { $metric } reste à { $value }.
       *[other] Sur { $n } exécutions de { $axis } de { $from } à { $to }, { $metric } reste à { $value }.
    }

js-meankind-campaign-sweep-flat-line = Le graphique montre chaque exécution.

js-meankind-campaign-sweep-goes =
    { $n ->
        [one] Sur { $n } exécution de { $axis } de { $from } à { $to }, { $metric } passe de { $first } à { $last }.
        [many] Sur { $n } d'exécutions de { $axis } de { $from } à { $to }, { $metric } passe de { $first } à { $last }.
       *[other] Sur { $n } exécutions de { $axis } de { $from } à { $to }, { $metric } passe de { $first } à { $last }.
    }

js-meankind-campaign-sweep-goes-line = Le graphique montre chaque exécution ; elle s'étend de { $min } à { $max }.

js-meankind-classical-link = liaison classique

js-meankind-clock-word = horloge

js-meankind-conflict-big = L'architecture en couches résiste { $ratio } fois mieux qu'une couche unique.

js-meankind-conflict-line-threats = Un Monte Carlo des menaces donne { $ratio } fois.

js-meankind-conflict-line-threats-corr = Un Monte Carlo des menaces donne { $ratio } fois ; avec des menaces corrélées, il peut tomber à { $low } fois.

js-meankind-conflict-line-trials =
    { $n ->
        [one] Un Monte Carlo de { $n } essai donne { $ratio } fois.
        [many] Un Monte Carlo de { $n } d'essais donne { $ratio } fois.
       *[other] Un Monte Carlo de { $n } essais donne { $ratio } fois.
    }

js-meankind-conflict-line-trials-corr =
    { $n ->
        [one] Un Monte Carlo de { $n } essai donne { $ratio } fois ; avec des menaces corrélées, il peut tomber à { $low } fois.
        [many] Un Monte Carlo de { $n } d'essais donne { $ratio } fois ; avec des menaces corrélées, il peut tomber à { $low } fois.
       *[other] Un Monte Carlo de { $n } essais donne { $ratio } fois ; avec des menaces corrélées, il peut tomber à { $low } fois.
    }

js-meankind-contacts-big =
    { $n ->
        [one] Le plan retient { $kept } contact candidat sur { $n } et livre { $gbit } Gbit.
        [many] Le plan retient { $kept } contacts candidats sur { $n } et livre { $gbit } Gbit.
       *[other] Le plan retient { $kept } contacts candidats sur { $n } et livre { $gbit } Gbit.
    }

js-meankind-contacts-big-waiting =
    { $n ->
        [one] Le plan retient { $kept } contact candidat sur { $n } et livre { $gbit } Gbit sur les { $waiting } Gbit en attente.
        [many] Le plan retient { $kept } contacts candidats sur { $n } et livre { $gbit } Gbit sur les { $waiting } Gbit en attente.
       *[other] Le plan retient { $kept } contacts candidats sur { $n } et livre { $gbit } Gbit sur les { $waiting } Gbit en attente.
    }

js-meankind-contacts-line = { $sats ->
        [one] { $sats } satellite
        [many] { $sats } de satellites
       *[other] { $sats } satellites
    } et { $stations ->
        [one] { $stations } station
        [many] { $stations } de stations
       *[other] { $stations } stations
    } sur { $hours } h.

js-meankind-dpnt-big = Les corrections différentielles ramènent l'erreur de { $from } m à { $to } m.

js-meankind-dpnt-line = Avec une station de référence à { $km } km.

js-meankind-duration-days =
    { $n ->
        [one] { $days } jour
        [many] { $days } de jours
       *[other] { $days } jours
    }

js-meankind-earthgnss-big =
    { $n ->
        [one] À la distance de la Lune, { $visible } satellite sur { $n } est en vue, mais { $trackable } peut être poursuivi.
        [many] À la distance de la Lune, { $visible } satellites sur { $n } sont en vue, mais { $trackable } peuvent être poursuivis.
       *[other] À la distance de la Lune, { $visible } satellites sur { $n } sont en vue, mais { $trackable } peuvent être poursuivis.
    }

js-meankind-earthgnss-line = Le meilleur signal est de { $best } dB-Hz pour un seuil de poursuite de { $threshold } dB-Hz.

js-meankind-engine-run-count =
    { $n ->
        [one] { $n } exécution du moteur
        [many] { $n } d'exécutions du moteur
       *[other] { $n } exécutions du moteur
    }

js-meankind-entry-big = La décélération maximale est de { $g } g à { $km } km, avec un flux thermique maximal de { $flux } W/cm².

js-meankind-entry-line = Entrée à { $speed } m/s, { $angle } degrés sous l'horizon.

js-meankind-eo-big = La caméra voit une fauchée de { $swath } km à une résolution de { $gsd } m.

js-meankind-eo-line-contiguous = Les traces au sol sont espacées de { $km } km à l'équateur, la couverture est donc continue.

js-meankind-eo-line-gapped = Les traces au sol sont espacées de { $km } km à l'équateur, la couverture comporte donc des trous.

js-meankind-eop-big = À la distance de la Lune, la rotation de la Terre balaie { $m } m chaque seconde, si bien que l'âge des données d'orientation de la Terre ({ $dur } ici) compte.

js-meankind-eop-line = Entrée : { $source }.

js-meankind-ephemeris-big = Le satellite vole entre { $min } et { $max } km, jusqu'à { $lat }° de latitude.

js-meankind-ephemeris-line = Vu de la station, il monte jusqu'à { $deg }°.

js-meankind-ephemeris-line-doppler = Vu de la station, il monte jusqu'à { $deg }°, avec jusqu'à { $khz } kHz de Doppler.

js-meankind-event-count =
    { $n ->
        [one] { $n } événement
        [many] { $n } d'événements
       *[other] { $n } événements
    }

js-meankind-framecampaign-big-open =
    { $n ->
        [one] La campagne laisse { $n } direction du système géodésique indéterminée.
        [many] La campagne laisse { $n } de directions du système géodésique indéterminées.
       *[other] La campagne laisse { $n } directions du système géodésique indéterminées.
    }

js-meankind-framecampaign-big-yes = Oui : la campagne fixe entièrement le système géodésique du référentiel lunaire.

js-meankind-framecampaign-line = Nombre de conditionnement { $n }.

js-meankind-framereal-big = Le référentiel lunaire est réalisé avec { $m } m d'erreur résiduelle.

js-meankind-framereal-big-open = Le référentiel lunaire est réalisé avec { $m } m d'erreur résiduelle, bien que l'ajustement n'ait pas convergé.

js-meankind-framereal-line = Erreur de translation { $trans } m, erreur d'échelle { $scale } parties par milliard.

js-meankind-gnsssim-big = La surveillance d'intégrité protège la position calculée { $share } % du temps.

js-meankind-gnsssim-line = L'ionosphère ajoute { $iono } m et la troposphère { $tropo } m à chaque mesure de distance en moyenne.

js-meankind-headline-figure = chiffre principal

js-meankind-holdovertest-big = Mesuré par rapport aux gabarits, le holdover de { $dur } s de l'enregistrement atteint { $te } ns d'erreur de temps.

js-meankind-holdovertest-big-open = Mesuré par rapport aux gabarits, le holdover de { $dur } s de l'enregistrement atteint { $te } ns d'erreur de temps, et ne s'est pas rétabli dans la bande.

js-meankind-holdovertest-big-recovered = Mesuré par rapport aux gabarits, le holdover de { $dur } s de l'enregistrement atteint { $te } ns d'erreur de temps, et s'est rétabli { $recover } s après le retour du GNSS.

js-meankind-holdovertest-line = Mesuré par rapport au gabarit : cela n'affirme jamais qu'un système est conforme ; les deux instants sont la déclaration de l'opérateur.

js-meankind-holdovertest-line-masks = { $masks }. Mesuré par rapport au gabarit : cela n'affirme jamais qu'un système est conforme ; les deux instants sont la déclaration de l'opérateur.

js-meankind-impairment-big = Le détecteur sépare les signaux altérés des signaux sains avec une aire sous la courbe de { $auc } (1 étant parfait).

js-meankind-impairment-line = Sur des cas différents de son jeu d'entraînement, il obtient { $auc }.

js-meankind-infra-carrier = La fixation entière de la phase de la porteuse entre une station de surface et un orbiteur a fixé { $share } % des essais sur l'arc le plus long ({ $days } jours).

js-meankind-infra-frame = Les liaisons orbiteur-station multiplient par { $x } la plus petite valeur propre d'information du système géodésique lunaire et ramènent la trace de Cramér-Rao à { $share } %, si l'orbite est connue dans les axes lunaires.

js-meankind-infra-geodesy = Avec les quatre familles ensemble, h2, k2 et l2 sont déterminés à { $h2 } %, { $k2 } % et { $l2 } % de leurs valeurs nominales.

js-meankind-infra-od = La détermination d'orbite embarquée par GNSS terrestre en orbite lunaire est précise à { $gnss } m, le suivi indépendant au sol à { $ground } m ; la statistique de cohérence vaut en moyenne { $mean } ({ $expected } attendu).

js-meankind-infra-tail = MODELLED : un modèle restreint avec des entrées illustratives, pas une déclaration sur une mission quelconque.

js-meankind-infra-tie =
    { $n ->
        [one] Un lien local de { $mm } mm sur un engin spatial relie les référentiels GNSS, VLBI et de télémétrie laser pour { $n } erreur de lien balayée.
        [many] Un lien local de { $mm } mm sur un engin spatial relie les référentiels GNSS, VLBI et de télémétrie laser pour { $n } d'erreurs de lien balayées.
       *[other] Un lien local de { $mm } mm sur un engin spatial relie les référentiels GNSS, VLBI et de télémétrie laser pour { $n } erreurs de lien balayées.
    }

js-meankind-inside-spec = dans { $spec }

js-meankind-instrn-big = En roue libre sur l'inertiel seul, l'erreur de position dépasse { $threshold } m après { $dur }.

js-meankind-instrn-dom = { $dominant } domine.

js-meankind-instrn-line = Elle dépasse { $passes }.

js-meankind-instrn-line-dom = Elle dépasse { $passes } ; { $dominant } domine.

js-meankind-instrn-pass = { $threshold } m après { $dur }

js-meankind-interop-big-no = Non : le fichier d'éphéméride lunaire ne fait pas l'aller-retour.

js-meankind-interop-big-yes = Oui : le fichier d'éphéméride lunaire fait l'aller-retour intact.

js-meankind-interop-line =
    { $n ->
        [one] { $n } état dans le référentiel { $frame }, temps { $time }.
        [many] { $n } d'états dans le référentiel { $frame }, temps { $time }.
       *[other] { $n } états dans le référentiel { $frame }, temps { $time }.
    }

js-meankind-its-spec = sa spécification

js-meankind-jointod-big = L'ajout d'un retard d'interférométrie depuis la Terre améliore la position de la station d'un facteur { $x }.

js-meankind-jointod-line = La station est alors connue à { $m } m.

js-meankind-launch-big =
    { $n ->
        [one] { $n } occasion de lancement par jour atteint une orbite de { $incl }° depuis la latitude { $lat }°.
        [many] { $n } d'occasions de lancement par jour atteignent une orbite de { $incl }° depuis la latitude { $lat }°.
       *[other] { $n } occasions de lancement par jour atteignent une orbite de { $incl }° depuis la latitude { $lat }°.
    }

js-meankind-launch-line = La rotation de la Terre apporte gratuitement { $speed } m/s.

js-meankind-layer-agc = AGC (contrôle automatique de gain)

js-meankind-layer-raim = RAIM (surveillance autonome de l'intégrité par le récepteur)

js-meankind-layer-sqm = SQM (surveillance de la qualité du signal)

js-meankind-leochain-big = De bout en bout, le système en orbite basse ramène l'erreur de position de { $from } m à { $to } m.

js-meankind-leochain-line = Son signal est poursuivi jusqu'à { $cn0 } dB-Hz.

js-meankind-leopass-big-many = Les satellites passent à { $elev }° de hauteur et restent au-dessus du masque pendant { $dur } (le premier sur { $n }).

js-meankind-leopass-big-one = Le satellite passe à { $elev }° de hauteur et reste au-dessus du masque pendant { $dur }.

js-meankind-leopass-line = À son maximum, le signal en orbite basse arrive { $db } dB plus fort qu'un signal de navigation par satellite typique.

js-meankind-leoppp-big = Le positionnement précis converge en { $best } min avec la plus grande couche en orbite basse, contre { $base } min avec la seule navigation par satellite.

js-meankind-leoppp-line = Médiane des exécutions par cas, à { $m } m.

js-meankind-leoppp-line-runs =
    { $n ->
        [one] Médiane de { $n } exécution par cas, à { $m } m.
        [many] Médiane de { $n } d'exécutions par cas, à { $m } m.
       *[other] Médiane de { $n } exécutions par cas, à { $m } m.
    }

js-meankind-leopvt-doppler-big = Le positionnement Doppler à partir de satellites en orbite basse aboutit à { $m } m de la vérité (horizontal).

js-meankind-leopvt-doppler-line =
    { $n ->
        [one] { $n } satellite utilisé.
        [many] { $n } de satellites utilisés.
       *[other] { $n } satellites utilisés.
    }

js-meankind-leopvt-joint-big = L'ajout de la couche en orbite basse ramène l'erreur de { $from } m à { $to } m (RMS 3D).

js-meankind-leopvt-joint-line = La qualité de la géométrie (PDOP) passe de { $from } à { $to }.

js-meankind-leopvt-polar-big = Près du pôle, la couche en orbite basse améliore la qualité de la géométrie (PDOP) de { $from } à { $to }.

js-meankind-leopvt-polar-line =
    { $n ->
        [one] Sur { $n } latitude.
        [many] Sur { $n } de latitudes.
       *[other] Sur { $n } latitudes.
    }

js-meankind-leopvt-timing-big = Le transfert de temps en orbite basse maintient la meilleure horloge à moins de { $ns } ns d'UTC (RMS).

js-meankind-leopvt-timing-line =
    { $n ->
        [one] { $n } cas d'horloge et de signal comparé.
        [many] { $n } de cas d'horloge et de signal comparés.
       *[other] { $n } cas d'horloge et de signal comparés.
    }

js-meankind-leosignal-big =
    { $n ->
        [one] Sur { $n } conception de signal, { $best } tolère le plus de brouillage : { $db } dB au-dessus du signal.
        [many] Sur { $n } de conceptions de signal, { $best } tolère le plus de brouillage : { $db } dB au-dessus du signal.
       *[other] Sur { $n } conceptions de signal, { $best } tolère le plus de brouillage : { $db } dB au-dessus du signal.
    }

js-meankind-leosignal-line-fail = Les contrôles de forme du spectre échouent.

js-meankind-leosignal-line-pass = Les contrôles de forme du spectre réussissent.

js-meankind-link-big-closes = La liaison se ferme avec { $margin } dB de marge.

js-meankind-link-big-open = La liaison ne se ferme pas : { $margin } dB de marge.

js-meankind-link-line = Sur { $km } km.

js-meankind-link-line-band = Bande { $band } sur { $km } km.

js-meankind-link-line-band-rate = Bande { $band } sur { $km } km à { $rate } bit/s.

js-meankind-link-line-rate = Sur { $km } km à { $rate } bit/s.

js-meankind-list-and = { $head } et { $last }

js-meankind-llr-big = La télémétrie laser réelle fixe le référentiel lunaire à { $mm } mm.

js-meankind-llr-line = Échelle à { $ppb } parties par milliard.

js-meankind-mapmatch-altimeter = L'altimètre mesure à { $sigma } m près.

js-meankind-mapmatch-big = Le calage sur carte maintient la position à { $matched } m, contre { $free } m de dérive en inertiel seul.

js-meankind-mapmatch-gravimeter = Le gravimètre mesure à { $sigma } mGal près.

js-meankind-mapmatch-sources = La gravité seule donne { $gravity } m, le magnétisme { $magnetic } m, le terrain { $terrain } m.

js-meankind-marspnt-big = Le navigateur { $user } se stabilise à { $m } m (RMS).

js-meankind-marspnt-line =
    { $n ->
        [one] { $mean } relais en vue en moyenne, sur { $n } époque.
        [many] { $mean } relais en vue en moyenne, sur { $n } d'époques.
       *[other] { $mean } relais en vue en moyenne, sur { $n } époques.
    }

js-meankind-moonlight-big = Le service couvre { $share } % des lieux et des instants contrôlés.

js-meankind-moonlight-line =
    { $n ->
        [one] Entre { $min } et { $n } satellite sont en vue ; la qualité de la géométrie (PDOP) va de { $pmin } à { $pmax }.
        [many] Entre { $min } et { $n } de satellites sont en vue ; la qualité de la géométrie (PDOP) va de { $pmin } à { $pmax }.
       *[other] Entre { $min } et { $n } satellites sont en vue ; la qualité de la géométrie (PDOP) va de { $pmin } à { $pmax }.
    }

js-meankind-navmsg-big =
    { $n ->
        [one] Un message de navigation tient en { $n } octet.
        [many] Un message de navigation tient en { $n } d'octets.
       *[other] Un message de navigation tient en { $n } octets.
    }

js-meankind-navmsg-cases-big =
    { $n ->
        [one] Sur { $n } cas, l'erreur de distance par rapport à l'orbite diffusée va de { $min } à { $max } mm.
        [many] Sur { $n } de cas, l'erreur de distance par rapport à l'orbite diffusée va de { $min } à { $max } mm.
       *[other] Sur { $n } cas, l'erreur de distance par rapport à l'orbite diffusée va de { $min } à { $max } mm.
    }

js-meankind-navmsg-cases-line = Erreur de distance du signal dans l'espace, RMS.

js-meankind-navmsg-line = L'arrondi au format du message coûte { $mm } mm d'erreur de distance.

js-meankind-navmsg-midpass-big = La mise à jour du message en cours de passage fait sauter la distance d'au plus { $mm } mm.

js-meankind-navmsg-midpass-line = La limite est de { $mm } mm.

js-meankind-ntn-big = Le positionnement 5G depuis l'orbite atteint { $m } m avec { $signal }.

js-meankind-ntn-line = Le Doppler sur un passage donne { $m } m.

js-meankind-obs-big-full = L'orbite devient entièrement observable après { $dur } de suivi.

js-meankind-obs-big-partly = L'orbite reste partiellement observable sur l'arc de { $h } h.

js-meankind-obs-line = Rang { $rank } sur { $dim } à la fin de l'arc.

js-meankind-oem-big = Le fichier d'éphéméride fait l'aller-retour avec au plus { $mm } mm d'erreur de position.

js-meankind-oem-line =
    { $n ->
        [one] { $states } états en { $n } segment.
        [many] { $states } états en { $n } de segments.
       *[other] { $states } états en { $n } segments.
    }

js-meankind-optical-big-alone = Le meilleur site seul maintient la liaison optique { $best } % du temps (plafond sans nuage { $ceiling } %) ; aucune marge sans nuage ne la porte au-dessus de { $ceiling } %.

js-meankind-optical-big-team = Le meilleur site seul maintient la liaison optique { $best } % du temps (plafond sans nuage { $ceiling } %) ; { $n } sites ensemble atteignent { $independent } % si leur météo est indépendante, { $correlated } % avec la corrélation indiquée.

js-meankind-optical-line-sites =
    { $n ->
        [one] { $n } site modélisé ; les climats nuageux sont illustratifs.
        [many] { $n } de sites modélisés ; les climats nuageux sont illustratifs.
       *[other] { $n } sites modélisés ; les climats nuageux sont illustratifs.
    }

js-meankind-optical-line-tech = { $name } : { $base } % devient { $with } %.

js-meankind-opticalrf-big = La combinaison de la télémétrie optique et radio donne des niveaux de protection de { $h } m à l'horizontale et { $v } m à la verticale.

js-meankind-opticalrf-line-fault = Le test de cohérence indique { $stat } pour un seuil de { $threshold } : un défaut est signalé.

js-meankind-opticalrf-line-ok = Le test de cohérence indique { $stat } pour un seuil de { $threshold } : aucun défaut n'est signalé.

js-meankind-packet-big-no = Non : le flux décodé diffère de ce qui a été envoyé.

js-meankind-packet-big-yes = Oui : le flux de paquets se décode bit pour bit.

js-meankind-packet-line =
    { $n ->
        [one] { $n } paquet, { $octets } octets au total.
        [many] { $n } de paquets, { $octets } octets au total.
       *[other] { $n } paquets, { $octets } octets au total.
    }

js-meankind-passes-big-day =
    { $n ->
        [one] { $n } passage par jour, { $dur } de contact au total.
        [many] { $n } de passages par jour, { $dur } de contact au total.
       *[other] { $n } passages par jour, { $dur } de contact au total.
    }

js-meankind-passes-big-window =
    { $n ->
        [one] { $n } passage dans une fenêtre de { $hours } heures, { $dur } de contact au total.
        [many] { $n } de passages dans une fenêtre de { $hours } heures, { $dur } de contact au total.
       *[other] { $n } passages dans une fenêtre de { $hours } heures, { $dur } de contact au total.
    }

js-meankind-passes-line = Le meilleur passage monte à { $deg }°.

js-meankind-percentile-word = percentile

js-meankind-pnt-big = La suite quantique conserve la position et le temps pendant { $q } ; la suite classique pendant { $c }.

js-meankind-pnt-classical-label = Holdover, suite classique

js-meankind-pnt-line = Le holdover est la durée pendant laquelle chaque suite (horloge { $q }, contre horloge { $c }) reste dans { $spec } après la perte de la navigation par satellite.

js-meankind-pnt-quantum-label = Holdover, suite quantique

js-meankind-pnt-timing-classical-label = Erreur de synchronisation temporelle, 95 %, classique

js-meankind-pnt-timing-quantum-label = Erreur de synchronisation temporelle, 95 %, quantique

js-meankind-pvt-big =
    { $n ->
        [one] Une position est résolue à { $solved } époque sur { $n }, à { $rms } m (RMS 3D).
        [many] Une position est résolue à { $solved } époques sur { $n }, à { $rms } m (RMS 3D).
       *[other] Une position est résolue à { $solved } époques sur { $n }, à { $rms } m (RMS 3D).
    }

js-meankind-pvt-line = À partir de { $mean } satellites en moyenne, d'après de vraies mesures de récepteur.

js-meankind-qnav-big = Après la coupure, le navigateur à atomes froids dérive de { $q } m ; celui de qualité navigation de { $c } m.

js-meankind-qnav-big-outage = Après { $dur } sans satellites, le navigateur à atomes froids dérive de { $q } m ; celui de qualité navigation de { $c } m.

js-meankind-qnav-line = Dans le budget : { $q } contre { $c }.

js-meankind-qnav-line-threshold = Dans { $threshold } m : { $q } contre { $c }.

js-meankind-qtt-big = Le transfert de temps quantique tient { $q } ps (1 sigma) contre { $c } ns pour la chaîne classique.

js-meankind-qtt-line = Le moniteur de sécurité détecte { $pd } % des attaques.

js-meankind-qtt-line-pfa = Le moniteur de sécurité détecte { $pd } % des attaques à un taux de fausse alarme de { $pfa }.

js-meankind-quantum-link = liaison quantique

js-meankind-radiometry-big = La caméra atteint NIIRS { $niirs } à { $gsd } m de distance d'échantillonnage au sol, avec un rapport signal sur bruit de { $snr }.

js-meankind-radiometry-line = MTF du système à Nyquist { $mtf }.

js-meankind-reentry-big = La décélération maximale est de { $g } g, à { $km } km.

js-meankind-reentry-line = Le véhicule est alors à { $speed } m/s.

js-meankind-slam-big = L'appariement au terrain finit à { $matched } m, contre { $free } m en inertiel seul.

js-meankind-slam-line =
    { $n ->
        [one] Sur { $n } point de passage, apparié à une carte du terrain avec { $sigma } m de bruit d'altimètre.
        [many] Sur { $n } de points de passage, apparié à une carte du terrain avec { $sigma } m de bruit d'altimètre.
       *[other] Sur { $n } points de passage, apparié à une carte du terrain avec { $sigma } m de bruit d'altimètre.
    }

js-meankind-slot-big = L'horloge quitte sa garde de créneau { $dur } après la dernière position satellite.

js-meankind-slot-line = Elle a donc besoin d'une position toutes les { $interval }, environ { $perDay } par jour.

js-meankind-solar-big =
    { $n ->
        [one] { $n } corps placé à une époque.
        [many] { $n } de corps placés à une époque.
       *[other] { $n } corps placés à une époque.
    }

js-meankind-solar-big-link =
    { $n ->
        [one] { $n } corps placé à une époque ; la lumière met { $dur } de { $from } à { $to }.
        [many] { $n } de corps placés à une époque ; la lumière met { $dur } de { $from } à { $to }.
       *[other] { $n } corps placés à une époque ; la lumière met { $dur } de { $from } à { $to }.
    }

js-meankind-solar-line =
    { $n ->
        [one] { $n } liaison est chronométrée au total.
        [many] { $n } de liaisons sont chronométrées au total.
       *[other] { $n } liaisons sont chronométrées au total.
    }

js-meankind-spoof-caught = Le leurrage est détecté avant de violer la spécification de synchronisation temporelle.

js-meankind-spoof-caught-both = Le leurrage est détecté avant de violer la spécification de synchronisation temporelle, par les deux horloges.

js-meankind-spoof-caught-label = Détecté après, { $name }

js-meankind-spoof-caught-thr = Le leurrage est détecté avant de violer la spécification de synchronisation temporelle de { $thr } ns.

js-meankind-spoof-caught-thr-both = Le leurrage est détecté avant de violer la spécification de synchronisation temporelle de { $thr } ns, par les deux horloges.

js-meankind-spoof-detects = { $name } le détecte après { $dur }, à un décalage de { $offset } ns.

js-meankind-spoof-missed =
    { $n ->
        [one] Le leurrage viole la spécification de synchronisation temporelle avant d'être détecté par { $names }.
        [many] Le leurrage viole la spécification de synchronisation temporelle avant d'être détecté par { $names }.
       *[other] Le leurrage viole la spécification de synchronisation temporelle avant d'être détecté par { $names }.
    }

js-meankind-spoof-offset = décalage { $offset } ns

js-meankind-spoofdetect-big-by = Oui : le leurrage est détecté, par { $by }.

js-meankind-spoofdetect-big-no = Non : le moniteur fusionné ne détecte pas le leurrage.

js-meankind-spoofdetect-big-yes = Oui : le leurrage est détecté.

js-meankind-spoofdetect-line =
    { $n ->
        [one] { $on } couche de détection sur { $n } donne l'alarme.
        [many] { $on } couches de détection sur { $n } donnent l'alarme.
       *[other] { $on } couches de détection sur { $n } donnent l'alarme.
    }

js-meankind-spoofdetect-line-score =
    { $n ->
        [one] { $on } couche de détection sur { $n } donne l'alarme ; le score fusionné est { $score }.
        [many] { $on } couches de détection sur { $n } donnent l'alarme ; le score fusionné est { $score }.
       *[other] { $on } couches de détection sur { $n } donnent l'alarme ; le score fusionné est { $score }.
    }

js-meankind-ssv-formation = À { $km } km d'écart, le filtre connaît la position relative à { $filter } m RMS, contre { $absolute } m en différenciant les deux positions absolues.

js-meankind-ssv-navigation = Le filtre embarqué tient la position à { $inside } m RMS à l'intérieur des orbites GNSS et à { $above } m au-dessus.

js-meankind-ssv-shell = Sur la coquille, toutes les constellations ensemble donnent au moins un signal { $one } % du temps et au moins quatre { $four } % (L1).

js-meankind-ssv-tail = MODELLED : un balayage géométrique et de bilan de liaison, pas une mesure d'un signal dans l'espace.

js-meankind-ssv-trajectory = De { $from } à { $to } km d'altitude, au moins un signal est en vue { $one } % des époques et au moins quatre { $four } % (L1, toutes constellations).

js-meankind-station-big = Sur la région polaire sud, les corrections d'une station de référence lunaire ramènent l'erreur au { $percentile } de { $from } m à { $to } m (modélisé).

js-meankind-station-line = Dans le seuil de précision pour { $share } % des époques ; pas une déclaration sur un système réel.

js-meankind-sweep-big =
    { $n ->
        [one] Sur { $n } valeur de { $param }, { $parts }.
        [many] Sur { $n } de valeurs de { $param }, { $parts }.
       *[other] Sur { $n } valeurs de { $param }, { $parts }.
    }

js-meankind-sweep-line = { $param } va de { $from } à { $to }.

js-meankind-sweep-line-log = { $param } va de { $from } à { $to } sur une échelle logarithmique.

js-meankind-sweep-part-flat = { $metric } ({ $key }) reste à { $value }

js-meankind-sweep-part-goes = { $metric } ({ $key }) passe de { $first } à { $last }

js-meankind-sweep-result-word = résultat

js-meankind-sweepnd-big =
    { $n ->
        [one] Sur { $n } combinaison de { $keys }, { $metric } va de { $min } à { $max }.
        [many] Sur { $n } de combinaisons de { $keys }, { $metric } va de { $min } à { $max }.
       *[other] Sur { $n } combinaisons de { $keys }, { $metric } va de { $min } à { $max }.
    }

js-meankind-sweepnd-line = Une grille de { $shape } exécutions du moteur.

js-meankind-telecom-fail =
    { $n ->
        [one] L'horloge échoue à { $fail } sur { $n } contrôle d'erreur de temps télécoms.
        [many] L'horloge échoue à { $fail } sur { $n } de contrôles d'erreur de temps télécoms.
       *[other] L'horloge échoue à { $fail } sur { $n } contrôles d'erreur de temps télécoms.
    }

js-meankind-telecom-line = Contrôles du MTIE (erreur maximale d'intervalle de temps), du TDEV (écart de temps) et de l'enveloppe de holdover par rapport aux gabarits UIT-T nommés dans chaque ligne.

js-meankind-telecom-line-margin = Contrôles du MTIE (erreur maximale d'intervalle de temps), du TDEV (écart de temps) et de l'enveloppe de holdover par rapport aux gabarits UIT-T nommés dans chaque ligne. La plus petite marge par rapport à l'enveloppe de holdover est de { $margin } ns.

js-meankind-telecom-pass =
    { $n ->
        [one] L'horloge réussit le contrôle d'erreur de temps télécom ({ $n } sur { $n }).
        [many] L'horloge réussit la totalité des { $n } de contrôles d'erreur de temps télécoms.
       *[other] L'horloge réussit la totalité des { $n } contrôles d'erreur de temps télécoms.
    }

js-meankind-the-best = le meilleur

js-meankind-the-body = le corps

js-meankind-the-first = le premier

js-meankind-the-name = { $name }

js-meankind-the-second = le second

js-meankind-the-widest-signal = le signal le plus large

js-meankind-timebudget-big = L'erreur de { $clock } et celle du référentiel se croisent à un temps de moyennage de { $tau }.

js-meankind-timebudget-line = À ce croisement, l'erreur de temps est de { $x } s.

js-meankind-timeoffset-big = Une horloge sur la Lune avance de { $rate } µs par jour sur une horloge sur Terre.

js-meankind-timeoffset-line = La plage publiée va de { $low } à { $high } µs par jour.

js-meankind-timetransfer-big = { $q } garde les deux sites à moins de { $qps } ps (RMS) ; { $c } à moins de { $cps } ps.

js-meankind-timetransfer-line = Dans la spécification de télémétrie { $q } % du temps, contre { $c } %.

js-meankind-timetransfer-line-mm = Dans la spécification de télémétrie de { $mm } mm { $q } % du temps, contre { $c } %.

js-meankind-tracking-big = Un leurreur peut capturer le récepteur depuis une distance allant jusqu'à { $km } km.

js-meankind-tracking-line = Avec la dynamique de boucle propre au récepteur, l'accrochage est perdu à { $db } dB de brouilleur au-dessus du signal.

js-meankind-trade-big = Les capteurs quantiques sont { $timing } fois meilleurs en synchronisation temporelle et { $inertial } fois meilleurs en navigation inertielle que la référence de base classique.

js-meankind-trade-line = Sans satellites, la suite quantique tient { $dur } en roue libre.

js-meankind-ttbudget-big = Le décalage bidirectionnel est de { $offset } ns, avec une incertitude combinée de { $uncertainty } ns.

js-meankind-ttbudget-line = Sagnac { $sagnac } ns ; ionosphère { $iono } ns.

js-meankind-ukf-big-no = Non : le filtre n'est pas auto-cohérent.

js-meankind-ukf-big-yes = Oui : le filtre est auto-cohérent.

js-meankind-ukf-line-in = Son carré normalisé de l'innovation vaut en moyenne { $mean }, dans la bande à 95 % de { $low } à { $high }. Cela vérifie la cohérence, pas la précision.

js-meankind-ukf-line-in-seeds =
    { $n ->
        [one] Son carré normalisé de l'innovation vaut en moyenne { $mean }, dans la bande à 95 % de { $low } à { $high }, sur { $n } graine. Cela vérifie la cohérence, pas la précision.
        [many] Son carré normalisé de l'innovation vaut en moyenne { $mean }, dans la bande à 95 % de { $low } à { $high }, sur { $n } de graines. Cela vérifie la cohérence, pas la précision.
       *[other] Son carré normalisé de l'innovation vaut en moyenne { $mean }, dans la bande à 95 % de { $low } à { $high }, sur { $n } graines. Cela vérifie la cohérence, pas la précision.
    }

js-meankind-ukf-line-out = Son carré normalisé de l'innovation vaut en moyenne { $mean }, hors de la bande à 95 % de { $low } à { $high }. Cela vérifie la cohérence, pas la précision.

js-meankind-ukf-line-out-seeds =
    { $n ->
        [one] Son carré normalisé de l'innovation vaut en moyenne { $mean }, hors de la bande à 95 % de { $low } à { $high }, sur { $n } graine. Cela vérifie la cohérence, pas la précision.
        [many] Son carré normalisé de l'innovation vaut en moyenne { $mean }, hors de la bande à 95 % de { $low } à { $high }, sur { $n } de graines. Cela vérifie la cohérence, pas la précision.
       *[other] Son carré normalisé de l'innovation vaut en moyenne { $mean }, hors de la bande à 95 % de { $low } à { $high }, sur { $n } graines. Cela vérifie la cohérence, pas la précision.
    }

js-meankind-user-word = utilisateur

js-meankind-vlbi-big = Sur une ligne de base de { $km } km, le signal de la balise arrive à { $ms } ms d'écart aux deux stations.

js-meankind-vlbi-line = La correction de champ proche est de { $us } µs.

js-meankind-vlbifim-big = Chaque coordonnée de station est connue à { $m } m grâce à ce calendrier d'observation.

js-meankind-vlbifim-line = L'estimation simple à parts égales annoncerait { $m } m.

js-meankind-weather-big = La haute atmosphère chauffe jusqu'à { $k } K.

js-meankind-weather-big-ref = La haute atmosphère chauffe jusqu'à { $k } K, contre { $ref } K pour la référence.

js-meankind-weather-line = L'indice d'activité géomagnétique ap est { $ap }.

js-meankind-whole-run = sur toute l'exécution

js-mthread-bcol-label = Libellé

js-mthread-bcol-share = Taille par rapport au plus grand terme de position

js-mthread-bcol-sigma = 1 sigma

js-mthread-bcol-source = Contribution

js-mthread-budget-caption = { $phase } : 1 sigma à l'entrée { $entry }, au pic { $peak }, à la sortie { $exit } (position) ; chaque contribution ci-dessous, la plus grande d'abord.

js-mthread-chart-title = { $metric } en fonction du temps écoulé de la mission, une bande par phase

js-mthread-col-kind = Type

js-mthread-col-label = Libellé

js-mthread-col-limit = Plus grande contribution

js-mthread-col-margin = Par rapport à la limite

js-mthread-col-peak-pos = Position maximale

js-mthread-col-peak-time = Biais d'horloge maximal

js-mthread-col-peak-vel = Vitesse maximale

js-mthread-col-phase = Phase

js-mthread-col-window = Temps de mission

js-mthread-example-not-loaded = le résultat enregistré ne s'est pas chargé

js-mthread-file-failed = { $name } n'a pas pu être lu : { $reason }.

js-mthread-kv-elapsed = Temps écoulé de la mission

js-mthread-kv-engine = Moteur

js-mthread-kv-epoch = Époque (UTC)

js-mthread-kv-limits = Phases avec une limite indiquée

js-mthread-kv-limits-value = { $n } ({ $met } atteintes, { $missed } non atteintes)

js-mthread-kv-phases = Phases

js-mthread-kv-seed = Graine

js-mthread-kv-title = Fil

js-mthread-layout-phases = Largeur égale par phase

js-mthread-layout-time = Temps de mission réel

js-mthread-limit-title = { $phase } : la limite indiquée, { $limit }

js-mthread-log-scale = échelle logarithmique

js-mthread-margin-met = { $m }× la limite, respectée

js-mthread-margin-missed = { $m }× la limite, non respectée

js-mthread-metric-pos = Position, 1 sigma

js-mthread-metric-time = Biais d'horloge, 1 sigma

js-mthread-metric-vel = Vitesse, 1 sigma

js-mthread-na = n/d

js-mthread-no-events = Cette phase n'enregistre aucun événement.

js-mthread-no-phases = le résultat ne contient aucune phase

js-mthread-no-requirement = aucune limite indiquée

js-mthread-no-series = Le résultat ne contient aucun échantillon de cette grandeur.

js-mthread-no-weak = Le résultat ne nomme aucun maillon le plus faible.

js-mthread-not-json = le résultat n'est pas du JSON ({ $reason })

js-mthread-not-thread = ceci n'est pas un résultat de fil de mission (schéma { $schema } attendu)

js-mthread-note-phases = Chaque phase est tracée avec la même largeur, afin qu'une phase courte soit aussi visible qu'une phase longue ; l'instant où chacune commence figure sous la bande. Passez au temps de mission réel pour voir les vraies proportions. Les lignes en pointillés sont les limites que le document indique ; une coupure dans la ligne est un transfert.

js-mthread-note-time = Temps de mission réel : une phase de quelques minutes peut être trop étroite pour être vue. Passez aux largeurs égales pour la lire. Les lignes en pointillés sont les limites que le document indique ; une coupure dans la ligne est un transfert.

js-mthread-open-failed = L'exemple n'a pas pu être ouvert : { $reason }.

js-mthread-opened = { $name } lu dans cette page ; rien n'a été envoyé nulle part.

js-mthread-opening = Ouverture de l'exemple de classe Artemis…

js-mthread-prov = Chaque libellé de cette page est celui du moteur ; la page copie chaque nombre du résultat et ne fait que le mettre à l'échelle.

js-mthread-recorded = Le résultat enregistré du moteur (version { $version }) : une chaîne illustrative construite à partir de descriptions publiques de missions ; les nombres sont modélisés et ne représentent rien de réel.

js-mthread-sets-peak = fixe le pic

js-mthread-too-large = Ce fichier dépasse { $mb } Mo ; il n'est pas lu.

js-mthread-weak-line = Le maillon le plus faible est la phase <b>{ $phase }</b> : { $margin }× sa limite indiquée, fixée par { $source }. La marge est le plus petit rapport entre une limite indiquée et le pic de la phase ; au-dessus de 1, l'exigence est respectée.

js-mthread-weakest-flag = maillon le plus faible

js-mthread-weakest-mark = maillon le plus faible

js-obs-cell-extent = { $south }° à { $north }° N, { $west }° à { $east }° E

js-obs-cell-read = { $state } : { $cell }. Échantillonnés { $sampled }, affectés { $affected }.

js-obs-cell-title = { $state } ; échantillonnés { $sampled }, affectés { $affected }

js-obs-cell-title-reason = { $state } ({ $reason }) ; échantillonnés { $sampled }, affectés { $affected }

js-obs-clear-note = { $notClear } Une cellule sans entrée a été vue par moins de 5 aéronefs distincts et est retenue ; elle n'est pas tracée. La couleur n'est jamais le seul indice : une cellule non observée est hachurée, et le tableau détaille chaque état.

js-obs-col-affected = Aéronefs affectés

js-obs-col-bbox = Boîte englobante (S, O, N, E)

js-obs-col-bytes = Octets

js-obs-col-cause = Cause

js-obs-col-cell = Cellule (latitude, longitude)

js-obs-col-cells = Cellules

js-obs-col-check = Contrôle

js-obs-col-file = Fichier

js-obs-col-incident = Incident

js-obs-col-sampled = Aéronefs échantillonnés

js-obs-col-sha = SHA-256 (manifeste)

js-obs-col-share = Part affectée

js-obs-col-state = État

js-obs-col-why = Pourquoi non observée

js-obs-day-alt = { $degraded } cellules dégradées, { $notDegraded } non dégradées, { $notObserved } non observées, le { $date }.

js-obs-day-heading = Jour { $date } (UTC)

js-obs-ds-attribution = Attribution

js-obs-ds-coverage = Couverture

js-obs-ds-dataset = Jeu de données

js-obs-ds-licence = Licence

js-obs-ds-licence-address = Adresse de la licence

js-obs-ds-product = Produit

js-obs-ds-written-by = Écrit par Kshana

js-obs-err-cause = { $name } indique une cause autre que « not attributed » ; cette page n'en montre aucune

js-obs-err-feature-polygon = { $name } : l'élément { $n } n'est pas un polygone de cellule

js-obs-err-feature-state = { $name } : l'élément { $n } a l'état « { $state } », qui ne fait pas partie de { $states }

js-obs-err-incident-object = { $name } : l'incident { $n } n'est pas un objet

js-obs-err-no-date = { $name } n'indique aucune date

js-obs-err-no-features = { $name } n'a aucun élément

js-obs-err-no-incidents = { $name } n'a pas de liste d'incidents

js-obs-err-not-day = { $name } n'est pas un fichier { $schema }

js-obs-err-not-incident = { $name } n'est pas un fichier { $schema }

js-obs-err-not-json = { $what } n'est pas du JSON ({ $reason })

js-obs-err-not-manifest = { $name } n'est pas un fichier { $schema }

js-obs-err-not-object = { $what } n'est pas un objet JSON

js-obs-err-not-text = { $what } n'est pas du texte ou dépasse { $mib } MiB

js-obs-err-states = { $name } nomme des états autres que les trois que montre cette page

js-obs-file-matches = correspond

js-obs-file-mismatch = ne correspond pas

js-obs-file-no-hash = aucun hachage indiqué

js-obs-file-not-opened = non ouvert

js-obs-files-note = Méthode { $method }. Le SHA-256 de chaque fichier est calculé ici à partir du fichier que vous avez ouvert et comparé au manifeste ; un fichier que vous n'avez pas ouvert n'est pas vérifié.

js-obs-incident = incident

js-obs-incident-note = Les cellules dégradées contiguës (diagonales comprises) forment un incident. La cause de chaque incident est : non attribuée. Ce n'est ni une confirmation ni un NOTAM.

js-obs-kv-cells = Cellules publiées

js-obs-kv-day-wide = Effet sur toute la journée

js-obs-kv-degraded = Dégradées

js-obs-kv-not-degraded = Non dégradées

js-obs-kv-not-observed = Non observées (publiées)

js-obs-kv-scope = Portée

js-obs-map-aria = { $summary } Le tableau ci-dessous liste chaque cellule.

js-obs-means-degraded = Une forte part des aéronefs échantillonnés dans la cellule a signalé une faible précision de navigation ce jour-là, nettement au-dessus du bruit de fond de la journée.

js-obs-means-not-degraded = Assez d'aéronefs ont été échantillonnés et la part n'a pas satisfait à la règle.

js-obs-means-not-observed = Les données n'ont pas permis de trancher. Ce n'est pas « dégagé ».

js-obs-na = n/d

js-obs-no = non

js-obs-no-cells = Aucune cellule dans ce fichier

js-obs-no-day-file = Les fichiers du { $date } n'ont pas de fichier de jour (.geojson), il n'y a donc rien à montrer pour cette date.

js-obs-no-degraded = Aucune cellule dégradée ce jour-là.

js-obs-no-file-read = Aucun fichier n'a pu être lu.

js-obs-no-incident-file = Aucun fichier d'incidents n'a été ouvert pour ce jour.

js-obs-no-manifest = Aucun manifeste n'a été ouvert pour ce jour, les fichiers ne peuvent donc pas être comparés à leurs hachages.

js-obs-no-notice = Ce fichier ne porte aucune mention. La déclaration à titre consultatif en haut de cette page s'applique malgré tout.

js-obs-no-reason = aucune raison indiquée

js-obs-not-clear = Non observé ne veut pas dire dégagé.

js-obs-not-readable = { $name } : pas un fichier que lit cette page (.geojson, .incidents.json, .manifest.json ou .png).

js-obs-not-stated = non indiqué

js-obs-note-day-wide = C'était une journée à effet sur toute la journée : le bruit de fond de la journée était lui-même élevé, si bien qu'aucune cellule n'a pu être tranchée ce jour-là. Cela ne signifie pas que le ciel était propre.

js-obs-note-summary-mismatch = Le récapitulatif indiqué par le fichier ne correspond pas aux cellules qu'il liste ; les nombres sont montrés tels qu'écrits.

js-obs-nothing-yet = Rien à montrer pour l'instant : ouvrez aussi le fichier .geojson du jour.

js-obs-notice = Mention portée par le fichier : { $notice }

js-obs-opened-day-file = { $days } jour ouvert à partir de { $files } fichier. Lu ici ; rien n'a été téléversé.

js-obs-opened-day-files = { $days } jour ouvert à partir de { $files } fichiers. Lu ici ; rien n'a été téléversé.

js-obs-opened-days-file = { $days } jours ouverts à partir de { $files } fichier. Lu ici ; rien n'a été téléversé.

js-obs-opened-days-files = { $days } jours ouverts à partir de { $files } fichiers. Lu ici ; rien n'a été téléversé.

js-obs-read-failed = { $name } : n'a pas pu être lu ({ $reason }).

js-obs-reason-day-wide = le bruit de fond de la journée était lui-même élevé, si bien qu'aucune cellule n'a pu être tranchée ce jour-là

js-obs-reason-insufficient = trop peu d'aéronefs ont été échantillonnés pour trancher

js-obs-reason-no-background = il n'y avait pas de bruit de fond de la journée auquel comparer la cellule

js-obs-release = Publié au plus tôt le { $when } : les produits sont publiés au moins { $hours } heures après la fin de la journée, sur des cellules de { $deg } degrés. Ce n'est pas une vue en direct.

js-obs-release-default = la fin de la journée plus le délai

js-obs-show-all = Afficher les { $n } cellules

js-obs-state-degraded = Dégradée

js-obs-state-not-degraded = Non dégradée

js-obs-state-not-observed = Non observée

js-obs-the-day-file = le fichier de jour

js-obs-the-incident-file = le fichier d'incidents

js-obs-the-manifest = le manifeste

js-obs-too-large = { $name } : plus de { $mib } MiB ; ouvrez un fichier plus petit.

js-obs-unstated-number = un nombre non indiqué de

js-obs-withheld = retenue

js-obs-yes-no-call = oui : aucune cellule n'a pu être tranchée

js-opt-avail-label = Disponibilité, plafond et disponibilité par ciel dégagé, par site

js-opt-avail-note = Par site : la disponibilité de la liaison face aux affaiblissements dus aux nuages et à la turbulence, le plafond qu'aucune marge supplémentaire ne peut dépasser (nuages et pointage), et la disponibilité sans aucun nuage.

js-opt-avail-title = Disponibilité par rapport au plafond

js-opt-bar-available = { $name } : disponible

js-opt-bar-ceiling = { $name } : plafond

js-opt-bar-clear-sky = { $name } : ciel dégagé

js-opt-blurb-network = Un site nord plus nuageux, un site central intermédiaire et un site sud plus dégagé voient un terminal optique LEO à 30 degrés : à quelle fréquence la liaison est-elle disponible, et que rapportent des sites supplémentaires ?

js-opt-blurb-techniques = Une liaison montante à 25 degrés sous nuages et turbulence : que rapportent une autre longueur d'onde, une plus grande ouverture, l'optique adaptative ou plus de marge ?

js-opt-cloud-episode = épisode nuageux

js-opt-correlated = corrélée

js-opt-default-bars = barres

js-opt-default-chart = graphique

js-opt-direction-wave = { $direction }, onde { $wave }

js-opt-diversity-label = Disponibilité du réseau en fonction du nombre de sites

js-opt-diversity-note = Disponibilité des 1, 2 et 3 meilleurs sites, avec une météo indépendante et avec une météo corrélée sur { $km } km.

js-opt-diversity-title = Diversité de sites

js-opt-fact-capture-loss = Perte de capture géométrique

js-opt-fact-direction = Direction

js-opt-fact-elevation = Élévation

js-opt-fact-footprint = Empreinte du faisceau

js-opt-fact-margin = Marge sans atmosphère

js-opt-fact-received = Puissance reçue, sans atmosphère

js-opt-fact-sensitivity = Sensibilité du récepteur

js-opt-fact-wavelength = Longueur d'onde

js-opt-gain-points = +{ $n } points

js-opt-hours = heures

js-opt-independent = indépendante

js-opt-link-down = liaison coupée

js-opt-margin-label = Marge supplémentaire nécessaire pour chaque objectif de disponibilité

js-opt-margin-line-title = { $name } : marge de liaison, dB

js-opt-margin-note = Marge de liaison supplémentaire, en dB en plus de la liaison actuelle, pour chaque objectif de disponibilité ; une valeur négative signifie que la liaison a déjà plus que nécessaire. Un objectif au-dessus du plafond d'un site n'a aucune marge qui l'atteigne (le moteur l'omet).

js-opt-margin-title = Marge que nécessite chaque objectif de disponibilité

js-opt-model-output = Sortie du modèle

js-opt-na = n/d

js-opt-no-data = Aucune donnée dans ce résultat.

js-opt-no-series = Aucune série temporelle dans ce résultat.

js-opt-no-source = aucune source indiquée

js-opt-not-result = ceci n'est pas un résultat d'atmosphère optique avec des sites

js-opt-open-failed = { $title } n'a pas pu être ouvert : { $reason }.

js-opt-opening = Ouverture de { $title }…

js-opt-outage-label = Probabilité qu'une coupure dure plus longtemps qu'une durée

js-opt-outage-note = Probabilité qu'une coupure dure plus longtemps qu'une durée, par site (axe de temps logarithmique).

js-opt-outage-title = Durée des coupures

js-opt-point-title = { $name } : { $xLabel } { $x }, { $yLabel } { $y }

js-opt-prov = { $label } Sites : { $sites }.

js-opt-realised-up = { $value } en service

js-opt-recorded = { $title } : le résultat enregistré du moteur (version { $version }). Sortie de modèle, pas une mesure.

js-opt-result-not-json = le résultat n'est pas du JSON ({ $reason })

js-opt-result-not-loaded = le résultat enregistré ne s'est pas chargé

js-opt-series-label = Marge de liaison en fonction du temps

js-opt-series-note = Une réalisation à graine fixée du modèle de site indiqué (graine { $seed }, { $hours } h par pas de { $step } s) : épisodes nuageux, une colonne d'eau liquide pour chacun, un échantillon de scintillation par pas. La marge est le budget d'affaiblissement moins les affaiblissements dus aux nuages et à la scintillation ; la liaison est coupée sous 0 dB. C'est un tirage, pas le climat : sa disponibilité diffère de celle indiquée de l'erreur d'échantillonnage du tirage. La marge est écrêtée à −40 dB pour le tracé.

js-opt-series-title = Marge de liaison en fonction du temps

js-opt-stated = indiquée { $value }

js-opt-stripe-cloud = nuage

js-opt-stripe-down = coupée

js-opt-stripe-title = { $what }, de l'heure { $from } à { $to }

js-opt-techniques-label = Gain de disponibilité par technique

js-opt-techniques-note = Gain de disponibilité en points de pourcentage par rapport à la référence de base, pour un site.

js-opt-techniques-title = Ce que rapporte chaque technique

js-opt-th-availability = Disponibilité

js-opt-th-ceiling = Plafond

js-opt-th-clear-air = Perte en air clair

js-opt-th-cloud-prob = Probabilité de nuages (entrée)

js-opt-th-fade-budget = Budget d'affaiblissement

js-opt-th-latlon = Latitude, longitude

js-opt-th-mean-outage = Coupure moyenne

js-opt-th-outages-year = Coupures par an

js-opt-th-scint = Indice de scintillation

js-opt-th-site = Site

js-opt-timing-label = Disponibilité de la synchronisation temporelle par site et par horloge

js-opt-timing-note = Fraction du temps total pendant laquelle l'erreur de synchronisation temporelle reste dans le seuil, par site et par classe d'horloge : le holdover de l'horloge face à la durée des coupures.

js-opt-timing-title = Synchronisation temporelle maintenue pendant les coupures

js-opt-title-network = Trois sites au sol, diversité de sites

js-opt-title-techniques = Une liaison montante, techniques d'amélioration

js-opt-x-best-n = n meilleurs sites

js-opt-x-outage-duration = durée de la coupure, h (log)

js-opt-x-target = objectif de disponibilité, %

js-opt-y-availability = disponibilité, %

js-opt-y-extra-margin = marge supplémentaire, dB

js-opt-y-p-longer = P(plus long)

js-replay-band-calibrating = en calibrage

js-replay-band-degraded = dégradé

js-replay-band-nominal = nominal

js-replay-band-run-ended = { $band } · exécution terminée

js-replay-band-untrusted = non fiable

js-replay-clock = T+{ $t } sur { $max }

js-replay-coast-hidden = côte masquée : les positions inventées de ce journal tombent sur la terre

js-replay-coast-note = Côte : { $source }, illustration seulement.

js-replay-coast-note-hidden = { $reason }.

js-replay-coast-window = Natural Earth 1:10 millions, fenêtre { $window }

js-replay-coast-world = Natural Earth 1:110 millions (le contour du monde du Studio), grossier

js-replay-demo-trust-log = { $title } (journal de confiance)

js-replay-dir-east = est

js-replay-dir-north = nord

js-replay-dir-south = sud

js-replay-dir-west = ouest

js-replay-dirs-and = { $list } et { $last }

js-replay-drawing-animation = Tracé de l'animation…

js-replay-drawing-frames = Tracé des images…

js-replay-every-direction = toutes les directions

js-replay-file-error = { $name } : { $error }

js-replay-kinds-convergence-horizontal = Convergence : erreur horizontale médiane

js-replay-kinds-convergence-vertical = Convergence : erreur verticale médiane

js-replay-kv-course = Route déclarée

js-replay-kv-heading = Cap (gyro)

js-replay-kv-position-error = Erreur de position

js-replay-kv-receiver = Récepteur

js-replay-kv-run-time = Temps de l'exécution

js-replay-kv-satellites = Satellites utilisés / en vue

js-replay-kv-sky = Ciel

js-replay-legend = Légende

js-replay-legend-no-fix = pas de position calculée

js-replay-legend-true-track = trace réelle

js-replay-moment = Instant à T+{ $t } :

js-replay-no-coast = Aucune côte n'est tracée : aucune n'est fournie pour cette fenêtre.

js-replay-no-gsv = pas de GSV dans ce journal

js-replay-not-json = { $name } : pas du JSON.

js-replay-not-scored = non évalué

js-replay-obs-not-attributed = non attribuée

js-replay-open-failed = { $id } n'a pas pu être ouvert : { $reason }.

js-replay-open-file = Ouvrir un fichier…

js-replay-opened = { $name } ouvert dans le panneau { $n }. Lu ici ; rien n'a été téléversé.

js-replay-opening = Ouverture de { $id }…

js-replay-pause = Pause

js-replay-play = Lecture

js-replay-read-failed = { $name } : n'a pas pu être lu ou tracé ({ $reason }).

js-replay-reading = Lecture de { $name }…

js-replay-reduced-motion = Le mouvement réduit est préféré ; la relecture démarre donc à 1x et ne se lance pas toute seule.

js-replay-run = Exécuter

js-replay-run-shown = Exécution affichée dans le panneau { $n }

js-replay-saved-svg = { $name } enregistré ({ $size } ko) : toutes les images dans un seul fichier, tracées à partir des mêmes lignes que cette page.

js-replay-saved-zip = { $name } enregistré ({ $size } Mo) : un SVG par image, un manifeste des lignes derrière chacune, et un README.

js-replay-src-instructor = Votre fichier { $name } : un journal d'instructeur seul n'apporte ni score du moteur ni ciel.

js-replay-src-trust = Votre fichier { $name } : un résultat de confiance ne porte ni ciel ni cap, ils ne sont donc pas tracés.

js-replay-status-ready = { $a } et { $b } : exécutions synthétiques, évaluées par le moteur. Appuyez sur Lecture, ou déplacez l'horloge.

js-replay-status-synthetic = { $titles } : exécutions synthétiques, évaluées par le moteur.

js-replay-status-synthetic-no-coast = { $titles } : exécutions synthétiques, évaluées par le moteur. Trait de côte indisponible.

js-replay-strip-label = Score de confiance sur l'exécution

js-replay-titles-and = { $a } et { $b }

js-replay-too-large = { $name } dépasse ce que lit cette page.

js-replay-track = Trace de { $n } lignes de journal, nord en haut.

js-replay-track-widened = Trace de { $n } lignes de journal, nord en haut, élargie pour montrer la côte la plus proche.

js-replay-verdict = Verdict

js-replay-verdict-degraded = { $dur } en bande dégradée, aucune en bande non fiable

js-replay-verdict-early = Verdict (provisoire)

js-replay-verdict-fine = D'après le journal et le score du moteur seulement ; synthétique, à titre consultatif, pas un chiffre de performance de détection.

js-replay-verdict-first = premier passage sous la bande nominale à T+{ $t }

js-replay-verdict-first-after = premier passage sous la bande nominale à T+{ $t }, { $dur } après le début du premier événement (T+{ $onset })

js-replay-verdict-first-before = premier passage sous la bande nominale à T+{ $t }, avant le début du premier événement (T+{ $onset })

js-replay-verdict-lowest = Score de confiance le plus bas { $score } ({ $band }) à T+{ $t }

js-replay-verdict-never-left = le score n'a jamais quitté la bande nominale

js-replay-verdict-no-fix = pas de position calculée pendant { $dur }

js-replay-verdict-not-scored = Non évalué : le score de confiance du moteur est montré pour les exécutions de la bibliothèque

js-replay-verdict-peak-error = plus grande erreur de position consignée { $err } m à T+{ $t }

js-replay-verdict-untrusted = { $dur } dans la bande non fiable

js-replay-verdict-wait = Affiché à la fin de cette exécution, à T+{ $t }.

js-ssv-altitude-label = Altitude et mesures utilisées

js-ssv-at-least-1 = au moins 1 signal

js-ssv-at-least-4 = au moins 4 signaux

js-ssv-avail-label = Disponibilité, { $band }

js-ssv-bar-title = { $label }, { $name } : { $value }{ $unit }

js-ssv-blurb-formation-heo = Un satellite chef et un satellite adjoint distants d'un kilomètre sur une orbite très elliptique : avec quelle précision le filtre connaît leur position relative, par rapport à ce que donneraient les deux positions absolues.

js-ssv-blurb-heo = Une orbite très elliptique (apogée vers 58 600 km) avec une antenne à gain élevé au nadir et une antenne patch au zénith et un modèle paramétrique de lobes secondaires : signaux en vue, meilleur C/N0, lobe principal contre lobe secondaire, dilution de précision et signaux qui rasent l'atmosphère.

js-ssv-blurb-lunar-weak = Une trajectoire de transfert lunaire avec un récepteur conçu pour fonctionner aux signaux les plus faibles : ce qu'il lui faut pour acquérir et poursuivre, et quelle part de la trajectoire il peut utiliser.

js-ssv-blurb-nav-lunar = Un filtre de navigation embarqué sur un transfert lunaire : son erreur de position par rapport à la borne qu'il indique, sous et au-dessus des orbites propres des satellites GNSS.

js-ssv-blurb-shell = Une coquille sphérique à la hauteur géostationnaire, échantillonnée sur une grille : à quelle fréquence un engin spatial qui s'y trouve entend-il au moins un, et au moins quatre, signaux à 20 dB-Hz, en L1 et L5, pour chaque constellation et toutes ensemble ?

js-ssv-cn0-altitude-label = Meilleur C/N0 et altitude en fonction du temps, { $band }

js-ssv-cn0-label = Meilleur C/N0, { $band }

js-ssv-cn0-note = Parmi les signaux en vue, le plus fort à chaque époque : du plus petit au plus grand sur les époques, avec la moyenne marquée.

js-ssv-cn0-title = Meilleure densité porteuse sur bruit, { $band }

js-ssv-comparison-failed = La comparaison n'a pas pu être affichée ({ $reason }).

js-ssv-comparison-not-loaded = le fichier de comparaison ne s'est pas chargé

js-ssv-default-bars = barres

js-ssv-default-chart = graphique

js-ssv-default-ranges = plages

js-ssv-deputies-note = RMS absolu du chef { $rms } m sur { $epochs } époques.

js-ssv-deputies-title = Chaque adjoint

js-ssv-dop-note = Médiane, 95e percentile et pire PDOP sur les époques qui ont une position calculée, et, lorsque le scénario définit une atmosphère, les signaux qui la rasent.

js-ssv-dop-title = Dilution de précision et atmosphère, { $band }

js-ssv-err-label = Erreur de position par rapport à la borne indiquée

js-ssv-err-note = La ligne en pointillés est la borne à un sigma que le filtre indique ; la ligne pleine est son erreur par rapport à la vérité que connaît le scénario. Décimée par le moteur.

js-ssv-err-title = Erreur de position par rapport à la borne propre du filtre

js-ssv-fact-antenna = Antenne

js-ssv-fact-apogee = Altitude d'apogée

js-ssv-fact-cn0-threshold = Seuil de densité porteuse sur bruit

js-ssv-fact-duration = Durée

js-ssv-fact-eccentricity = Excentricité

js-ssv-fact-grid-points = Points de grille

js-ssv-fact-inclination = Inclinaison

js-ssv-fact-mode = Mode

js-ssv-fact-perigee = Altitude de périgée

js-ssv-fact-period = Période

js-ssv-fact-shell-altitude = Altitude de la coquille

js-ssv-fact-sma = Demi-grand axe

js-ssv-fact-step = Pas

js-ssv-filter = filtre

js-ssv-formation-note = Erreur de position relative RMS, issue du filtre et de la différenciation des deux positions absolues, sur toute l'exécution et au-dessus des orbites GNSS.

js-ssv-formation-title = Position relative des adjoints

js-ssv-from-absolute = à partir de deux positions absolues

js-ssv-group-combined = toutes ensemble

js-ssv-icg-note = { $label } ; les verdicts par seuil des fichiers de résultats versionnés du moteur (commit du moteur { $commit }). Les tableaux du livret sont publics ; rien ici n'est VALIDATED.

js-ssv-icg-wrong-file = le fichier de comparaison ICG n'est pas celui que lit cette page

js-ssv-lobe-note = Combien de liaisons utilisables sont passées par le lobe principal et combien par un lobe secondaire, comptées par le moteur.

js-ssv-lobe-title = Lobe principal et lobe secondaire, { $band }

js-ssv-na = n/d

js-ssv-nav-note = Mesures utilisées et écartées, la plus longue interruption avec moins de quatre signaux, l'erreur finale et l'estimation de la pression de rayonnement solaire par rapport à la vérité que connaît le scénario.

js-ssv-nav-title = L'exécution en chiffres

js-ssv-never = jamais

js-ssv-never-had-four = n'a jamais eu quatre

js-ssv-never-had-one = n'a jamais eu un

js-ssv-no-range = Aucune plage dans ce résultat.

js-ssv-no-series = Le résultat ne contient aucune série pour ce graphique.

js-ssv-not-in-variant = ne fait pas partie de la variante

js-ssv-not-result = ceci n'est pas un résultat gnss-ssv

js-ssv-of = { $n } sur { $total }

js-ssv-offset = décalage de { $deg }°

js-ssv-open-failed = { $title } n'a pas pu être ouvert : { $reason }.

js-ssv-opening = Ouverture de { $title }…

js-ssv-outage-note = En minutes, sur l'exécution. « Jamais » marque un groupe qui n'a jamais eu autant de signaux nulle part sur la coquille.

js-ssv-outage-title = Plus longues coupures sur la coquille

js-ssv-phases-note = Une statistique du filtre sur l'exécution et sur ses deux parties. Un NEES de position moyen proche de 3 signifie que la borne indiquée par le filtre est cohérente avec son erreur.

js-ssv-phases-title = Erreur de position par phase

js-ssv-point-title = { $name } : { $xLabel } { $x }, { $yLabel } { $y }

js-ssv-range-title = { $label } : min { $min }, moy { $mean }, max { $max } { $unit }

js-ssv-range-value = { $min } à { $max }

js-ssv-recorded = { $title } : le résultat enregistré du moteur (version { $version }).

js-ssv-relative-label = Erreur de position relative

js-ssv-result-not-json = le résultat n'est pas du JSON ({ $reason })

js-ssv-result-not-loaded = le résultat enregistré ne s'est pas chargé

js-ssv-row-acquires = Acquisition jusqu'à

js-ssv-row-carrier = Poursuite de la porteuse jusqu'à

js-ssv-row-code = Poursuite du code jusqu'à

js-ssv-row-coherent = Intégration cohérente

js-ssv-row-delay-mean = Retard, moyenne

js-ssv-row-detection = Seuil de détection

js-ssv-row-false-alarm = Probabilité de fausse alarme par cellule

js-ssv-row-final-error = Erreur de position finale

js-ssv-row-gap = Plus longue interruption

js-ssv-row-gated = Mesures écartées

js-ssv-row-grazing = Rasant sous 100 km

js-ssv-row-limb-links = Liaisons à travers le limbe

js-ssv-row-loss-mean = Perte, moyenne

js-ssv-row-lost = Perdu à cause de l'atmosphère

js-ssv-row-pdop-median = PDOP, médiane

js-ssv-row-pdop-p95 = PDOP, 95e percentile

js-ssv-row-pdop-worst = PDOP, pire

js-ssv-row-plasma-mean = TEC plasmasphérique, moyenne

js-ssv-row-search-cells = Cellules de recherche

js-ssv-row-search-time = Temps de recherche

js-ssv-row-srp-est = Pression de rayonnement solaire, estimée

js-ssv-row-srp-truth = Pression de rayonnement solaire, vérité

js-ssv-row-stec-mean = TEC oblique, moyenne

js-ssv-row-tangent = Hauteur de tangente, min à max

js-ssv-row-tracking = Seuil de poursuite utilisé

js-ssv-row-used = Mesures utilisées

js-ssv-series-altitude = altitude/1000

js-ssv-series-altitude-name = altitude

js-ssv-series-best-cn0 = meilleur C/N0

js-ssv-series-error = erreur

js-ssv-series-measurements = mesures

js-ssv-series-note = Une série décimée du nombre combiné sur toutes les constellations. Le moteur n'écrit aucune série par constellation, aucune n'est donc tracée.

js-ssv-series-signals = signaux en vue

js-ssv-series-signals-label = Signaux en vue en fonction du temps, { $band }

js-ssv-series-stated-bound = borne indiquée

js-ssv-series-title = Signaux et meilleur C/N0 le long de l'orbite, { $band }

js-ssv-shell-avail-note = Part des points de grille et des instants avec au moins un et au moins quatre signaux au-dessus de { $cn0 } dB-Hz.

js-ssv-shell-avail-title = Disponibilité sur la coquille, { $band }

js-ssv-tangent-value = { $min } à { $max } km

js-ssv-th-above-absolute = Au-dessus du GNSS : à partir des absolues, m

js-ssv-th-above-filter = Au-dessus du GNSS : filtre, m

js-ssv-th-band-group = Bande et groupe

js-ssv-th-bar = Seuil

js-ssv-th-baseline = Ligne de base, km

js-ssv-th-common-4 = Époques avec 4 signaux communs

js-ssv-th-common-mean = Moyenne des signaux communs

js-ssv-th-compares = Ce qu'elle compare

js-ssv-th-deputy = Adjoint

js-ssv-th-epochs = Époques

js-ssv-th-group = Groupe

js-ssv-th-main-lobe = Liaisons du lobe principal

js-ssv-th-nees = NEES de position moyen

js-ssv-th-phase = Phase

js-ssv-th-pos-p95 = Position 95e percentile, m

js-ssv-th-pos-rms = Position RMS, m

js-ssv-th-quantity = Grandeur

js-ssv-th-rel-absolute = RMS relatif, à partir des absolues, m

js-ssv-th-rel-filter = RMS relatif, filtre, m

js-ssv-th-rel-vel = RMS de vitesse relative, m/s

js-ssv-th-run1-cells = Exécution 1 : cellules dans la tolérance

js-ssv-th-run1-verdict = Verdict de l'exécution 1

js-ssv-th-sidelobe = Liaisons des lobes secondaires

js-ssv-th-sidelobe-share = Part des lobes secondaires

js-ssv-th-value = Valeur

js-ssv-th-variant = Variante (diagnostic, angles de référence GLONASS du tableau 4.2)

js-ssv-th-vel-rms = Vitesse RMS, m/s

js-ssv-th-with-4 = Avec 4 signaux ou plus

js-ssv-th-without-1 = Plus longue durée sans 1 signal

js-ssv-th-without-4 = Plus longue durée sans 4 signaux

js-ssv-title-formation-heo = Formation, orbite très elliptique

js-ssv-title-heo = Orbite très elliptique

js-ssv-title-lunar-weak = Transfert lunaire, récepteur à signaux faibles

js-ssv-title-nav-lunar = Filtre embarqué, transfert lunaire

js-ssv-title-shell = Coquille à 36 000 km

js-ssv-traj-avail-note = Part des époques avec au moins un et au moins quatre signaux au-dessus de { $cn0 } dB-Hz.

js-ssv-traj-avail-title = Disponibilité le long de la trajectoire, { $band }

js-ssv-transmit-pattern = Diagramme d'émission : { $pattern }

js-ssv-unit-signals = signaux

js-ssv-unknown-mode = ce résultat gnss-ssv a le mode « { $mode } », que cette page ne lit pas

js-ssv-variant-met = { $n } sur { $total }, seraient atteints

js-ssv-variant-not-met = { $n } sur { $total }, toujours non atteints

js-ssv-view-note = Du plus petit au plus grand nombre en vue sur les époques, avec la moyenne marquée.

js-ssv-view-title = Signaux en vue, { $band }

js-ssv-weak-note = Ce dont a besoin la conception du récepteur, telle que le moteur la calcule à partir de l'intégration indiquée.

js-ssv-weak-title = Le récepteur à signaux faibles

js-ssv-x-minutes = minutes

js-ssv-y-altitude-measurements = altitude, milliers de km ; mesures utilisées

js-ssv-y-cn0-altitude = dB-Hz ; altitude en milliers de km

js-ssv-y-position-log = position, mètres (log)

js-ssv-y-signals-all = signaux en vue, toutes constellations

js-t35data-ai-q-bench-export = Exporter le mouvement et les événements d'un scénario pour un simulateur de laboratoire

js-t35data-ai-q-compliance-rows = Ces exécutions apportent des éléments de preuve en faveur de quelles lignes de cadres publics ?

js-t35data-ai-q-evidence-pack = Vérifier ou créer un paquet de preuves d'un événement de confiance

js-t35data-ai-q-interference-route = Où le GNSS a-t-il semblé dégradé, et quelle part de cet itinéraire s'y trouve ?

js-t35data-ai-q-iq-recordings = Enregistrements IQ GNSS (scène, acquisition, poursuite, frontal, campagnes)

js-t35data-ai-q-osnma-satellites = Les données de navigation de quels satellites Galileo ce flux du récepteur authentifie-t-il (OSNMA) ?

js-t35data-ai-q-run-scenario = Exécuter ou expliquer un scénario PNT (orbites, GNSS, synchronisation temporelle, fusion, lunaire)

js-t35data-ai-q-training-nmea = J'ai besoin de NMEA synthétique avec un événement de brouillage, de dérive, de leurrage temporel ou de rejeu pour la formation

js-t35data-ai-q-trustworthy-log = Ce journal de récepteur, ou le NMEA de ce navire, était-il digne de confiance, et quand a-t-il cessé de l'être ?

js-t35data-ai-tool-osnma-satellites = aucun sur MCP : utilisez osnma_verify (la carte OSNMA ici, WebAssembly), kshana osnma verify (CLI) ou kshana.osnma_verify (Python)

js-t35data-card-evidence-create-title = Créer un paquet de preuves

js-t35data-card-evidence-create-what = Signe une fenêtre d'un journal de récepteur et ce que le moteur en a calculé, afin que chacun puisse vérifier que rien n'a été modifié ensuite. Le Studio vérifie les paquets.

js-t35data-card-evidence-create-why = La signature exige une clé privée, qui ne devrait pas transiter par une page web.

js-t35data-card-iq-title = Moniteurs et outils IQ GNSS

js-t35data-card-iq-what = Construire une scène, acquérir et poursuivre des signaux, balayer des paramètres, modéliser un frontal, exécuter des moniteurs et des campagnes IQ, ajuster un journal de laboratoire. Également disponible depuis Python et, dans un dossier de travail, depuis les outils de l'assistant IA.

js-t35data-card-iq-why = Un enregistrement représente des gigaoctets d'échantillons. Une page ne peut pas le contenir, et les commandes qui convertissent, extraient et décimentent réécrivent les enregistrements sur disque.

js-t35data-card-land-title = Téléchargement des polygones de terre pour le détecteur AIS sur terre

js-t35data-card-land-what = Récupère un fichier de terres épinglé (Natural Earth, domaine public) et vérifie son SHA-256. Le constructeur de cartes prend plutôt le fichier de terres sous forme de texte.

js-t35data-card-land-why = C'est la seule commande qui ouvre une connexion réseau, et elle exige le curl du système et un indicateur explicite.

js-t35data-card-marine-title = Intégrations maritimes

js-t35data-card-marine-what = Un plugin pour serveur Signal K et OpenCPN via du NMEA en mode passerelle sur TCP mettent le score de confiance dans des logiciels que les plaisanciers utilisent déjà ; une version de référence le met sur un petit ordinateur à côté du récepteur.

js-t35data-card-marine-why = Ils consomment le processus en direct en cours d'exécution et sa barrière TCP : ce sont des déploiements sur l'ordinateur du bateau.

js-t35data-card-telemetry-title = La confiance comme télémétrie de sécurité

js-t35data-card-telemetry-what = Transforme le flux de confiance (score, bande, motifs) en métriques Prometheus, en événements syslog au format CEF ou LEEF pour un SIEM, et en OpenTelemetry. Il lit le flux et ne modifie jamais l'évaluation.

js-t35data-card-telemetry-why = C'est un processus qui sert des métriques et envoie vers vos systèmes de supervision : il s'exécute donc à côté du récepteur, pas dans une page.

js-t35data-card-training-stream-title = Flux de formation vers une adresse TCP ou UDP

js-t35data-card-training-stream-what = Envoie un flux de formation généré à un simulateur de passerelle ou à un traceur de cartes, en temps réel ou plus vite. La page de formation du Studio génère le même texte et vous permet de le télécharger.

js-t35data-card-training-stream-why = Envoyer vers une adresse réseau est une opération qu'une page de navigateur ne fait pas. Le flux est du texte seulement et n'est jamais destiné aux systèmes de navigation en direct d'un navire.

js-t35data-feat-ai-ai = Options d'installation du serveur MCP, avec les questions auxquelles répond chaque outil

js-t35data-feat-ai-name = Utiliser depuis un assistant IA (serveur MCP)

js-t35data-feat-bench-bench = Exporter ici le mouvement, les trames NMEA, les points de passage et les événements d'un scénario

js-t35data-feat-bench-name = Export bench de test pour un simulateur de laboratoire

js-t35data-feat-compliance-compliance = Voir ici pour quelles lignes de cadre vos exécutions apportent des éléments de preuve en faveur, ainsi que les tables de correspondance

js-t35data-feat-compliance-name = Cartographie de compliance avec des cadres publics de résilience

js-t35data-feat-evidence-evidence = Vérifier ici un paquet et y joindre un jeton d'horodatage

js-t35data-feat-evidence-name = Paquets de preuves signés

js-t35data-feat-evidence-why = Créer un paquet exige une clé de signature privée, qui ne devrait pas transiter par une page web. Les paquets sont créés avec la ligne de commande, Python ou les outils de l'assistant IA.

js-t35data-feat-interference-map-interference = Ouvrir des fichiers de carte, ou construire ici une carte à partir d'un CSV, et y vérifier un itinéraire

js-t35data-feat-interference-map-name = Carte des interférences (ADS-B et AIS) et exposition d'un itinéraire

js-t35data-feat-iq-name = Moniteurs et outils IQ GNSS (scène, acquisition, poursuite, balayage, étage d'entrée, surveillance, campagnes)

js-t35data-feat-iq-why = Un enregistrement représente des gigaoctets d'échantillons, qu'une page ne peut pas contenir, et certaines commandes réécrivent des enregistrements sur le disque. La version pour navigateur n'a aucune fonction IQ.

js-t35data-feat-jammertest-jammertest = Importer le plan pour la période couverte par un journal, ou évaluer un journal de récepteur (UBX, RINEX, Android, NMEA ou Septentrio SBF) test par test : latence de détection, détections manquées, fausses alarmes, temps de récupération ; MODELLED

js-t35data-feat-jammertest-name = Jammertest comme arbitre : le plan d'essai publié comme vérité planifiée, un journal de récepteur évalué par rapport à lui (0.38)

js-t35data-feat-live-gate-name = Flux de confiance en direct, barrière et écoute (stdin, fichier, TCP, UDP, --gate, --listen)

js-t35data-feat-live-gate-why = C'est un processus en cours d'exécution dans le chemin des données. Une page rend la main quand elle se termine : elle ne peut ni garder un socket ouvert pour un traceur de cartes, ni marquer une position comme invalide dans un flux en direct. Le Studio évalue à la place un extrait borné, dans le même format en direct, sans barrière.

js-t35data-feat-machines-imufit = Ajuster les paramètres d'accéléromètre et de gyroscope des scénarios hybrides et de fusion à partir d'un journal d'IMU immobile ; MODELLED

js-t35data-feat-machines-name = Entrées de récepteur et de capteur : RTKLIB .pos, NovAtel OEM7, RTCM 3 MSM, GNSS-SDR, une IMU pour le cap, et un ajustement d'IMU pour les scénarios hybrides et de fusion (0.38)

js-t35data-feat-machines-trust = Ouvrir un journal dans l'un de ces formats (et un fichier d'IMU facultatif) dans l'exécution générique de confiance du récepteur ; l'indicateur de brouilleur propre à NovAtel est comparé aux alarmes de Kshana

js-t35data-feat-marine-name = Intégrations maritimes : plugin Signal K et OpenCPN

js-t35data-feat-marine-why = Elles consomment le processus en direct en cours d'exécution et sa barrière TCP : ce sont donc des déploiements sur un ordinateur de bateau, pas quelque chose qu'une page peut exécuter.

js-t35data-feat-maritime-trust-name = Score de confiance maritime pour un navire en mouvement (de 0 à 100, avec les motifs)

js-t35data-feat-maritime-trust-trust = Ouvrir un résultat ou une exécution JSON-lines en direct et voir la trace, le score, les motifs et la barrière ; évaluer ici un journal NMEA

js-t35data-feat-nmea-training-name = Flux de formation NMEA avec un journal d'instructeur

js-t35data-feat-nmea-training-training = Générer ici un flux et son journal d'instructeur, les télécharger, et lancer le débriefing du formateur

js-t35data-feat-osnma-name = Vérification Galileo OSNMA (entrée UBX SFRBX)

js-t35data-feat-osnma-osnma = Charger un fichier enregistré et voir l'état d'authentification par satellite et par balise

js-t35data-feat-telemetry-name = Export de télémétrie : métriques Prometheus, syslog CEF et LEEF, OpenTelemetry

js-t35data-feat-telemetry-why = Il sert des métriques, envoie du syslog et exporte OpenTelemetry à partir d'un flux en cours d'exécution : c'est un processus qui dialogue avec vos systèmes de supervision, ce qu'une page ne peut pas être.

js-t35data-feat-training-stream-name = Diffusion d'un flux de formation vers une adresse TCP ou UDP

js-t35data-feat-training-stream-why = Il envoie vers une adresse réseau, ce qu'une page web ne fait pas. Le Studio génère le texte et vous le téléchargez.

js-t35data-page-ai = Utiliser depuis votre assistant IA

js-t35data-page-bench = Export bench de test

js-t35data-page-cli = Fonctions en ligne de commande

js-t35data-page-compliance = Cartographie de compliance

js-t35data-page-evidence = Paquets de preuves

js-t35data-page-geometry = Géométrie : skyplot, horizon et DOP

js-t35data-page-imufit = Ajustement d'IMU

js-t35data-page-interference = Carte des interférences

js-t35data-page-jammertest = Évaluation Jammertest

js-t35data-page-osnma = Vérification OSNMA

js-t35data-page-training = Débriefing de formation

js-t35data-page-trust = Confiance maritime

js-t35data-sample-iq-help = La liste des commandes IQ

js-t35data-sample-telemetry-cef = Syslog au format CEF pour l'exécution de démonstration

js-t35data-sample-telemetry-leef = Syslog au format LEEF pour l'exécution de démonstration

js-t35data-sample-telemetry-metrics = Métriques Prometheus pour l'exécution de démonstration

js-tools-ai-group-engine = Installer le moteur et ses bibliothèques

js-tools-ai-group-integrations = Intégrations maritimes, de plugins et de tableaux de bord

js-tools-ai-group-mcp = Installer le serveur MCP pour votre assistant

js-tools-ai-heading = Utiliser Kshana depuis votre assistant IA

js-tools-ai-install-mcp = Installer le serveur MCP

js-tools-ai-intro = Le serveur MCP de Kshana permet à un assistant IA d'exécuter le moteur au lieu de deviner des chiffres. Il s'exécute sur votre ordinateur ; rien n'est envoyé à Kshana. Choisissez la méthode qui convient à votre outil.

js-tools-ai-load-failed = Les options d'installation n'ont pas pu être chargées ({ $reason }). Consultez la documentation du serveur MCP.

js-tools-ai-mcp-docs = Documentation du serveur MCP

js-tools-ai-more-ways = Autres méthodes d'installation

js-tools-ai-none-listed = Aucune option d'installation n'est listée dans cette version.

js-tools-ai-other-ways = Autres façons d'installer Kshana

js-tools-ai-read-agent-guide = Lire le guide de l'agent

js-tools-ai-rule = La règle pour chaque réponse : l'assistant exécute le moteur et rapporte ce qu'un outil a renvoyé, avec son unité et son niveau de preuve (vérifié par rapport à une référence indépendante externe, ou modélisé), le scénario, la graine et la version du moteur, afin que l'exécution puisse être répétée. Les réserves propres à un résultat restent attachées à celui-ci. Le serveur MCP ne lit ni n'écrit aucun fichier en dehors d'un seul dossier activé sur option.

js-tools-ai-what-to-ask = Que demander, et quel outil répond

js-tools-ai-where-reachable = Où chaque capacité est accessible

js-tools-bench-files-written =
    { $n ->
        [one] { $n } fichier écrit dans la mémoire de votre navigateur
        [many] { $n } de fichiers écrits dans la mémoire de votre navigateur
       *[other] { $n } fichiers écrits dans la mémoire de votre navigateur
    }

js-tools-bench-note = Mouvement et intervalles d'événements étiquetés seulement. Téléchargez-les pour les charger dans un simulateur de laboratoire.

js-tools-bench-wrong-kind = { $name } est un scénario de type { $kind }. Une trajectoire de véhicule existe pour les types { $kinds } ; les autres types indiquent pourquoi ils n'en ont pas.

js-tools-building-report = Construction du rapport…

js-tools-choose-catalogue-first = Choisissez d'abord le JSON du catalogue.

js-tools-choose-file-first = Choisissez d'abord un fichier.

js-tools-choose-imu-log = Choisissez d'abord un journal d'IMU immobile.

js-tools-choose-pack-first = Choisissez d'abord les fichiers du paquet.

js-tools-choose-pack-first-above = Choisissez d'abord les fichiers du paquet (ci-dessus).

js-tools-choose-plan-file = Choisissez au moins un fichier de plan.

js-tools-choose-receiver-log = Choisissez d'abord le journal du récepteur.

js-tools-choose-result-first = Choisissez d'abord au moins un fichier de résultat (*.result.json).

js-tools-choose-scenario-first = Choisissez d'abord un scénario.

js-tools-choose-tsr-first = Choisissez d'abord la réponse d'horodatage (.tsr).

js-tools-chosen = Choisi

js-tools-col-check = Contrôle

js-tools-col-detail = Détail

js-tools-col-first-monitors = Premiers moniteurs

js-tools-col-gap-that-stays = Écart qui subsiste

js-tools-col-last-auth-tag = Dernière balise authentifiée (Galileo System Time)

js-tools-col-latency = Latence, s

js-tools-col-name = Nom

js-tools-col-outcome = Issue

js-tools-col-question = Question

js-tools-col-recovered = Récupéré

js-tools-col-reference = Référence

js-tools-col-result = Résultat

js-tools-col-row = Ligne

js-tools-col-satellite = Satellite

js-tools-col-slot = Créneau, s

js-tools-col-status = État

js-tools-col-tags = Balises

js-tools-col-test = Test

js-tools-col-these-runs = Ces exécutions

js-tools-col-tool = Outil

js-tools-col-what-is-missing = Ce qui manque

js-tools-col-what-it-asks = Ce qu'elle demande

js-tools-col-why-not-auth = Pourquoi non authentifiée

js-tools-copied = Copié

js-tools-copy = Copier

js-tools-copy-command-aria = Copier : { $cmd }

js-tools-copy-labelled-aria = Copier { $label } : { $text }

js-tools-did-not-work = Cela n'a pas fonctionné

js-tools-documentation = Documentation

js-tools-download = Télécharger

js-tools-download-all-zip = Tout télécharger (zip)

js-tools-download-events-toml = Télécharger les événements (TOML)

js-tools-download-md = Télécharger (Markdown)

js-tools-download-report-json = Télécharger le rapport (JSON)

js-tools-download-report-md = Télécharger le rapport (Markdown)

js-tools-download-scorecard-json = Télécharger la fiche de score (JSON)

js-tools-download-table-toml = Télécharger la table (TOML)

js-tools-download-updated-pack = Télécharger le paquet mis à jour (zip)

js-tools-download-whole-report-json = Télécharger le rapport complet (JSON)

js-tools-engine-lacks-error = Cette version du moteur (version { $version }) n'a pas de { $need } ; elle ne peut donc pas encore l'exécuter ici. Les résultats enregistrés et la ligne de commande fonctionnent toujours.

js-tools-engine-lacks-status = Cette version du moteur (version { $version }) n'a pas de { $need } : elle est antérieure à la version dont cet outil a besoin. L'équivalent en ligne de commande se trouve dans l'onglet Ligne de commande.

js-tools-engine-running = Le moteur (version { $version }) s'exécute dans ce navigateur. Rien n'est téléversé.

js-tools-engine-starting = Démarrage du moteur dans ce navigateur…

js-tools-engine-unavailable = Le moteur n'a pas pu démarrer ici ({ $reason }). L'ouverture de fichiers fonctionne ; l'exécution des outils exige WebAssembly.

js-tools-epoch-format = Utilisez AAAA-MM-JJTHH:MM:SS, avec un Z facultatif (UTC).

js-tools-epoch-not-real = Ce n'est pas un instant UTC réel entre les années 2000 et 2099.

js-tools-every-check = Tous les contrôles

js-tools-evidence-disclaimer = Un paquet de preuves est un enregistrement technique de ce que le moteur a calculé à partir d'un journal donné avec des réglages donnés. Ce n'est ni un avis juridique, ni la constatation d'un fait concernant un événement, ni une certification. Un succès signifie seulement que l'enregistrement est inchangé.

js-tools-example-pack = Paquet d'exemple synthétique

js-tools-example-pack-note = Un paquet synthétique créé par la ligne de commande du moteur à partir du journal de démonstration du ferry, avec une clé de démonstration. La clé est renseignée ci-dessous ; la clé d'un signataire réel vient du signataire par une autre voie.

js-tools-example-pack-tampered = Paquet d'exemple dont un octet de epochs.json a été modifié

js-tools-example-runs = Exécutions d'exemple synthétiques

js-tools-example-tampered-note = Un octet d'un fichier du paquet a été modifié après la signature. Vérifiez-le : le contrôle nomme le fichier.

js-tools-exporting = Export en cours…

js-tools-field-whole-number = { $field } doit être un nombre entier

js-tools-file-not-chosen = { $file } ne fait pas partie des fichiers choisis

js-tools-file-too-large = { $name } dépasse 64 MiB

js-tools-files-selected = { $label } : { $files }

js-tools-fingerprint-not-pinned = Empreinte du signataire : { $fingerprint } (non épinglée : la clé que le paquet désigne lui-même)

js-tools-fingerprint-pinned = Empreinte du signataire : { $fingerprint } (épinglée)

js-tools-fitting = Ajustement…

js-tools-framework-summary = { $name } : { $evidenced } étayées, { $partly } en partie, { $notEvidenced } non étayées, { $outOfScope } hors périmètre

js-tools-fw-dhs-rpcf = US DHS Resilient PNT Conformance Framework, v2.0

js-tools-fw-easa-aviation = Recommandations de l'EASA sur les interférences GNSS pour l'aviation

js-tools-fw-en-16803 = EN 16803 (par partie et numéro d'article seulement)

js-tools-fw-imo-ships = Recommandations de l'OMI sur les interférences GNSS pour les navires

js-tools-fw-nis2-art21 = Directive européenne NIS2, article 21

js-tools-gst-none = aucune

js-tools-gst-text = semaine { $week }, { $tow } s

js-tools-how-to-run = Comment l'exécuter

js-tools-imu-file-too-large = { $name } dépasse 32 MiB ; ouvrez un extrait.

js-tools-imu-mean-not-number = La force spécifique au repos n'est pas un nombre (0 pour un axe horizontal, environ 9.80665 pour l'axe vertical).

js-tools-imu-notice = { $evidence } : l'estimateur est vérifié sur des journaux synthétiques de bruit blanc à coefficients connus, et non par rapport à une référence indépendante externe. La table nomme le SHA-256 du journal ({ $sha }…).

js-tools-imu-selected = { $name } ({ $size }), lu ici, jamais téléversé.

js-tools-jt-events-count =
    { $n ->
        [one] { $n } événement planifié
        [many] { $n } d'événements planifiés
       *[other] { $n } événements planifiés
    }

js-tools-jt-events-note = comme vérité planifiée : créneaux prévus, et non heures d'émission enregistrées. Hors RF : { $nonRf } ; hors du journal : { $outside } ; identifiants inconnus : { $unknown }.

js-tools-jt-guard-hold = Garde { $guard } s, maintien de récupération { $hold } s.

js-tools-jt-guard-hold-overlap = Garde { $guard } s, maintien de récupération { $hold } s. La référence d'étalonnage chevauchait un créneau planifié.

js-tools-jt-import-needs-start = L'import exige la première époque du journal en UTC (ISO 8601), car le plan est en heure locale.

js-tools-jt-sel-catalogue = catalogue { $name }

js-tools-jt-sel-log = journal { $name } ({ $size })

js-tools-jt-sel-no-catalogue = aucun catalogue

js-tools-jt-sel-no-log = aucun journal

js-tools-jt-sel-no-plan = aucun plan

js-tools-jt-sel-plans =
    { $n ->
        [one] { $n } fichier de plan
        [many] { $n } de fichiers de plan
       *[other] { $n } fichiers de plan
    }

js-tools-jt-slot-range = { $from } à { $to }

js-tools-jt-what-area = La zone d'essai

js-tools-jt-what-guard = La garde

js-tools-jt-what-hold = Le maintien de récupération

js-tools-jt-what-offset = Le décalage par rapport à l'UTC

js-tools-jt-what-year = L'année du plan

js-tools-label-command = commande

js-tools-label-pinned-command = commande épinglée

js-tools-label-settings-example = exemple de réglages { $n }

js-tools-loading = Chargement…

js-tools-max-runs =
    { $max ->
        [one] { $max } exécution au maximum.
        [many] { $max } d'exécutions au maximum.
       *[other] { $max } exécutions au maximum.
    }

js-tools-merkle-root-format = La racine de Merkle compte 64 chiffres hexadécimaux.

js-tools-must-be-number = { $what } doit être un nombre

js-tools-must-be-whole-zero = { $what } doit être un nombre entier, 0 pour « non renseigné »

js-tools-na = s. o.

js-tools-needs = Nécessite : { $requires }

js-tools-no = non

js-tools-none = aucun

js-tools-none-in-build = aucun dans cette version

js-tools-not-in-browser = Pas dans un navigateur.

js-tools-not-osnma = Pas un résultat OSNMA

js-tools-not-used = Non utilisé : { $item }

js-tools-notes = Notes

js-tools-open = Ouvrir

js-tools-osnma-advisory = À titre consultatif : il s'agit d'une sortie d'analyse et de surveillance, et non d'un équipement de navigation homologué. L'état d'authentification rapporté ici n'est pas un service d'intégrité de la navigation et ne doit jamais être le seul fondement d'une décision de navigation ou de sécurité.

js-tools-osnma-authenticated = Authentifiée

js-tools-osnma-caption = État d'authentification par satellite

js-tools-osnma-demo-note = La clé publique jetable est renseignée ; appuyez sur Vérifier pour exécuter le vérificateur ici, ou affichez le résultat enregistré.

js-tools-osnma-discarded = Écartée

js-tools-osnma-events = Ce qu'a vu le vérificateur

js-tools-osnma-examples-missing = les exemples synthétiques ne sont pas encore dans cette version

js-tools-osnma-failed = Échec

js-tools-osnma-nma-alert = État NMA { $status } ; le système a émis un message d'alerte.

js-tools-osnma-nma-status = État NMA { $status }.

js-tools-osnma-not-json = Ce n'est pas le JSON de kshana osnma verify --json (il lui faut overall et satellites).

js-tools-osnma-overall = Global : { $status }

js-tools-osnma-pages-read =
    { $n ->
        [one] { $n } page lue.
        [many] { $n } de pages lues.
       *[other] { $n } pages lues.
    }

js-tools-osnma-pending = En attente

js-tools-osnma-recorded-failed = le résultat enregistré n'a pas pu être chargé

js-tools-osnma-recorded-result = Résultat enregistré de kshana osnma verify --json pour { $file }.

js-tools-osnma-tag-counts = { $authenticated } authentifiées, { $failed } en échec, { $pending } en attente, { $discarded } écartées

js-tools-osnma-tag-totals =
    { $n ->
        [one] { $n } balise : { $authenticated } authentifiées, { $failed } en échec, { $pending } en attente, { $discarded } écartées.
        [many] { $n } de balises : { $authenticated } authentifiées, { $failed } en échec, { $pending } en attente, { $discarded } écartées.
       *[other] { $n } balises : { $authenticated } authentifiées, { $failed } en échec, { $pending } en attente, { $discarded } écartées.
    }

js-tools-osnma-time-caveat = Temps : chaque contrôle est relatif aux horodatages des pages fournies au vérificateur, qui proviennent ici des données elles-mêmes et n'offrent aucune protection contre le rejeu d'anciennes données. L'authentification indique que les données proviennent du système ; elle ne dit rien du signal par lequel elles sont arrivées ni de la qualité de la position.

js-tools-osnma-unavailable = Indisponible

js-tools-osnma-word-authenticated = Au moins un satellite est authentifié et aucun n'a échoué

js-tools-osnma-word-failed = Un contrôle des données d'un satellite a échoué

js-tools-osnma-word-unavailable = Aucun satellite n'est authentifié

js-tools-pack-selected = { $label } : { $files } ({ $size })

js-tools-pinned-to-release = Épinglé à cette version :

js-tools-preview = Aperçu

js-tools-public-key-format = Une clé publique compte 64 chiffres hexadécimaux (32 octets). Rien d'autre n'est accepté.

js-tools-read-documentation = Lire la documentation

js-tools-reading-plan = Lecture du plan…

js-tools-refused-file-name = nom de fichier refusé : { $name }

js-tools-run = Exécuter

js-tools-runs-read =
    { $n ->
        [one] { $n } exécution lue : { $runs }
        [many] { $n } d'exécutions lues : { $runs }
       *[other] { $n } exécutions lues : { $runs }
    }

js-tools-runs-read-engine =
    { $n ->
        [one] { $n } exécution lue, par le moteur { $engine } : { $runs }
        [many] { $n } d'exécutions lues, par le moteur { $engine } : { $runs }
       *[other] { $n } exécutions lues, par le moteur { $engine } : { $runs }
    }

js-tools-sample-load-failed = L'échantillon n'a pas pu être chargé ({ $reason }).

js-tools-sample-note = Une sortie réelle de la commande, enregistrée à partir du moteur sur l'exécution de démonstration synthétique. Ce n'est la mesure de rien.

js-tools-sample-output = Exemple de sortie : { $label }

js-tools-scenario-list-failed = La liste des scénarios n'a pas pu être chargée

js-tools-scoring = Évaluation…

js-tools-select-and-copy = Sélectionner et copier

js-tools-settings-example = Exemple de réglages { $n } :

js-tools-status-evidenced-label = Les exécutions apportent des éléments de preuve en faveur de cette ligne

js-tools-status-evidenced-short = Étayée

js-tools-status-not-evidenced-label = Ces exécutions ne montrent rien pour cette ligne

js-tools-status-not-evidenced-short = Non étayée

js-tools-status-out-of-scope-label = Hors de ce que Kshana peut montrer

js-tools-status-out-of-scope-short = Hors périmètre

js-tools-status-partly-label = Les exécutions apportent des éléments de preuve en faveur d'une partie de cette ligne

js-tools-status-partly-short = En partie

js-tools-tab-ai = Assistant IA

js-tools-tab-bench = Bench de test

js-tools-tab-cli = Ligne de commande

js-tools-tab-compliance = Compliance

js-tools-tab-evidence = Paquets de preuves

js-tools-tab-imufit = Ajustement d'IMU

js-tools-tab-jammertest = Jammertest

js-tools-tab-osnma = OSNMA

js-tools-tele-all-events = Un événement syslog par époque (par défaut : un par changement de bande)

js-tools-tele-file-aria = Fichier de résultat ou JSON-lines

js-tools-tele-fmt-cef = Syslog, CEF

js-tools-tele-fmt-leef = Syslog, LEEF

js-tools-tele-fmt-mqtt = MQTT, découverte Home Assistant (sujet, tabulation, charge utile)

js-tools-tele-fmt-otlp = OpenTelemetry (OTLP JSON)

js-tools-tele-fmt-prometheus = Métriques Prometheus

js-tools-tele-format-aria = Format

js-tools-tele-host = Hôte

js-tools-tele-host-aria = Nom d'hôte écrit dans les événements syslog

js-tools-tele-include-position = Inclure la position rapportée (désactivé par défaut)

js-tools-tele-intro = Transformez un fichier de résultat (session.result.json) ou les lignes JSON en direct en l'un de ces formats, dans ce navigateur. Nécessite une version du moteur qui comporte l'export de télémétrie (0.35 et ultérieures avec l'export) ; les commandes ci-dessus fonctionnent partout.

js-tools-tele-note = Les lignes syslog ne portent ici aucun horodatage (la page ne lit aucune horloge) ; l'outil en ligne de commande les horodate. Prometheus donne l'état final. MQTT donne une ligne par message, le sujet, puis une tabulation, puis la charge utile ; rien n'est publié d'ici. Le texte est le même que celui qu'imprime la commande.

js-tools-tele-run-here = L'exécuter ici

js-tools-that-file-too-large = Ce fichier dépasse 64 MiB.

js-tools-token-attached = Jeton joint

js-tools-token-attached-note = Le paquet mis à jour est ci-dessous. La signature de l'autorité d'horodatage n'a PAS été vérifiée ici : exécutez openssl ts -verify.

js-tools-trust-monitor-sentence = Phrase du moniteur de confiance : { $sentence }

js-tools-two-files-same-name = deux fichiers s'appellent { $name }

js-tools-ubx-bad-crc =
    { $n ->
        [one] { $n } page a échoué à son CRC.
        [many] { $n } de pages ont échoué à leur CRC.
       *[other] { $n } pages ont échoué à leur CRC.
    }

js-tools-ubx-file = Le fichier UBX

js-tools-ubx-frames-pages = { $frames } trames UBX ; { $pages } pages I/NAV décodées.

js-tools-ubx-skipped-bytes =
    { $n ->
        [one] { $n } octet a été sauté entre les trames.
        [many] { $n } d'octets ont été sautés entre les trames.
       *[other] { $n } octets ont été sautés entre les trames.
    }

js-tools-ubx-time-conflicts =
    { $n ->
        [one] { $n } page avait une heure en conflit avec ses voisines.
        [many] { $n } de pages avaient une heure en conflit avec leurs voisines.
       *[other] { $n } pages avaient une heure en conflit avec leurs voisines.
    }

js-tools-ubx-unstamped =
    { $n ->
        [one] { $n } page n'a pas pu être placée dans le temps.
        [many] { $n } de pages n'ont pas pu être placées dans le temps.
       *[other] { $n } pages n'ont pas pu être placées dans le temps.
    }

js-tools-unknown = inconnu

js-tools-unused-scenarios = Les fichiers de scénario sans résultat correspondant n'ont pas été utilisés : { $files }.

js-tools-verdict-failed-text = La vérification a échoué.

js-tools-verdict-failed-title = Échec

js-tools-verdict-intact-text = Le paquet est intact par rapport à la clé qu'il désigne lui-même, que n'importe qui peut générer. Obtenez la clé publique du signataire auprès de lui par une autre voie et épinglez-la.

js-tools-verdict-intact-title = Intact, mais le signataire n'est pas épinglé

js-tools-verdict-verified-text = Le paquet est inchangé et signé par la clé que vous avez épinglée.

js-tools-verdict-verified-title = Vérifié

js-tools-verifying = Vérification…

js-tools-what-failed = Ce qui a échoué

js-tools-why-not-browser = Pourquoi pas dans un navigateur :

js-tools-yes = oui

js-training-active-events = Événements actifs

js-training-band-large = plus de 100 m

js-training-band-medium = de 25 à 100 m

js-training-band-small = moins de 25 m

js-training-chart-max = max { $v }

js-training-chart-mean-cn0 = C/N0 moyen

js-training-chart-position-error = erreur de position

js-training-chart-s-reported-minus-true = s, rapportée moins réelle

js-training-chart-satellites = satellites

js-training-chart-time-offset = décalage temporel

js-training-chart-used-tracked = utilisés / suivis

js-training-col-reported = Rapporté par le récepteur

js-training-col-true = Réel

js-training-cue-course = Le cap gyroscopique et la vitesse du loch ne sont touchés par aucun événement. Ici, la route rapportée diffère du cap gyroscopique de { $course }. Un courant sépare aussi le cap de la route : comparez donc avec le début de l'exécution.

js-training-cue-course-speed = Le cap gyroscopique et la vitesse du loch ne sont touchés par aucun événement. Ici, la route rapportée diffère du cap gyroscopique de { $course } et la vitesse rapportée de la vitesse réelle de { $speed } kn. Un courant sépare aussi le cap de la route : comparez donc avec le début de l'exécution.

js-training-cue-title = Repère de débriefing.

js-training-cue-unknown-amount = une valeur inconnue

js-training-debrief-now = Le débriefer maintenant

js-training-default-warning = Données de formation synthétiques. Pour la formation et les essais uniquement : n'injectez jamais ce flux dans les systèmes de navigation en service d'un navire.

js-training-demo-coastal-drag-off = Entraînement progressif côtier

js-training-demo-combined-event = Événement combiné

js-training-demo-fjord-degradation = Dégradation naturelle en fjord

js-training-demo-open-sea-jamming = Brouillage en haute mer

js-training-demo-port-time-spoof = Leurrage temporel à l'approche d'un port

js-training-dl-log-json = Télécharger le journal de l'instructeur (JSON)

js-training-dl-log-text = Télécharger le journal de l'instructeur (texte)

js-training-dl-nmea = Télécharger le flux NMEA

js-training-err-demo-open = { $title } n'a pas pu être ouvert : { $reason }.

js-training-err-engine-old = Cette version du moteur (version { $version }) n'a pas de générateur de formation NMEA ; elle est antérieure à cette page. La commande est { $command }.

js-training-err-engine-start = Le moteur n'a pas pu démarrer ici ({ $reason }). Les scénarios de la bibliothèque ci-dessus s'ouvrent quand même sans lui.

js-training-err-file-not-loaded = le fichier n'a pas pu être chargé

js-training-err-generate = Génération impossible : { $reason }.

js-training-err-newer-schema = { $name } : le schéma { $schema } est plus récent ou différent de { $supported }, que lit cette page. Mettez à jour le Studio plutôt que de deviner ses champs.

js-training-err-no-schema = { $name } : ce n'est pas un journal d'instructeur de formation Kshana (aucune balise de schéma).

js-training-err-no-track = { $name } : le journal n'a aucune ligne de trace à dessiner.

js-training-err-no-usable-rows = { $name } : aucune ligne de trace exploitable.

js-training-err-not-json = { $name } : ce n'est pas du JSON ({ $reason }).

js-training-err-read = { $name } : n'a pas pu être lu ({ $reason }).

js-training-err-read-or-draw = { $name } : n'a pas pu être lu ni dessiné ({ $reason }).

js-training-err-scenario-not-loaded = le fichier de scénario n'a pas pu être chargé

js-training-err-seed = La graine doit être un nombre entier, ou vide pour utiliser celle du scénario.

js-training-err-too-large = { $name } : plus grand que { $max }. Cette page lit des journaux jusqu'à cette taille.

js-training-err-too-many-rows = { $name } : le journal compte { $count } lignes de trace ; cette page en dessine au plus { $max }. Journalisez moins souvent (log_interval_s) ou ouvrez un extrait.

js-training-err-unknown-schema = { $name } : schéma inconnu { $schema } ; cette page lit { $supported }.

js-training-event-n = Événement { $id }

js-training-event-onset = Début { $utc }

js-training-extra-bearing = Relèvement appliqué, deg vrai

js-training-extra-peak-accel = Accélération de pointe ajoutée par l'entraînement, m/s²

js-training-extra-peak-speed = Vitesse de pointe ajoutée par l'entraînement, m/s

js-training-fact-duration = Durée

js-training-fact-events = Événements injectés

js-training-fact-max-error = Plus grande erreur de position

js-training-fact-max-time-offset = Plus grand décalage temporel

js-training-fact-no-fix = Durée sans position

js-training-fact-peak-accel = Accélération de pointe, réelle / rapportée

js-training-fact-peak-speed = Vitesse de pointe, réelle / rapportée

js-training-fact-seed = Graine

js-training-fact-start = Début (UTC)

js-training-fix-reported-span = position rapportée, de { $from } à { $to }

js-training-generated = « { $title } » généré avec le moteur { $version } : { $lines } phrases NMEA. Synthétique : pour la formation et les essais uniquement ; ne l'injectez jamais dans les systèmes de navigation en service d'un navire.

js-training-generated-here = Généré ici par le moteur (« { $title } »). Synthétique : positions et dates inventées.

js-training-generating = Démarrage du moteur et génération…

js-training-kind-drag-off = Entraînement progressif de la position

js-training-kind-jamming = Brouillage

js-training-kind-natural-degradation = Dégradation naturelle (ciel obstrué)

js-training-kind-replay-delay = Retard de rejeu

js-training-kind-time-spoof = Leurrage temporel

js-training-legend-no-fix = Pas de position : le récepteur n'a rien rapporté

js-training-legend-reported = Rapportée, { $band } de la réelle

js-training-legend-true = Trace réelle

js-training-library-label = Scénario synthétique de la bibliothèque « { $title } », écrit par { $command }. Positions et dates inventées ; aucun navire ni enregistrement réel.

js-training-log-row = Ligne de journal { $row } sur { $total }, { $utc }

js-training-max-error-at = { $m } m à T+{ $s } s

js-training-moment-event = (événement { $id })

js-training-moment-title = T+{ $s } s { $what } : { $text }

js-training-moments-shown = Les { $shown } premiers moments sur { $total } sont affichés.

js-training-no-events = Aucun : c'est une exécution propre.

js-training-no-fix-nothing = pas de position : rien de rapporté

js-training-no-fix-span = pas de position, de { $from } à { $to }

js-training-no-moments = Aucun moment enregistré.

js-training-none = aucun

js-training-none-now = Aucun à ce moment.

js-training-none-reported = aucun rapporté

js-training-north = N

js-training-not-touched = non touché par un événement

js-training-opened = { $name } ouvert : { $rows } lignes de journal sur { $secs } s.

js-training-opening = Ouverture de { $title }…

js-training-param-affect-time = Affecte l'heure

js-training-param-bearing-deg = Relèvement, deg vrai

js-training-param-cn0-drop-db = Baisse de C/N0, dB

js-training-param-counterfeit-cn0-dbhz = C/N0 contrefait, dB-Hz

js-training-param-delay-s = Retard, s

js-training-param-duration-s = Durée, s

js-training-param-final-offset-m = Décalage final, m

js-training-param-kind = Type

js-training-param-label = Libellé

js-training-param-offset-s = Décalage temporel, s

js-training-param-ramp-s = Rampe de début, s

js-training-param-recovery-s = Rampe de récupération, s

js-training-param-relative-bearing-deg = Relèvement relatif à la route, deg

js-training-param-skyline = Horizon obstrué

js-training-param-spread-db = Dispersion par satellite, dB

js-training-param-start-s = Début, s

js-training-pause = Pause

js-training-play = Lecture

js-training-reading = Lecture…

js-training-readout-fix = position

js-training-readout-no-fix = pas de position

js-training-reduced-motion = Le mouvement réduit est préféré : la lecture démarre donc à 1x. Utilisez le curseur ou les touches fléchées pour vous déplacer sans animation.

js-training-row-cn0 = C/N0 moyen, dB-Hz

js-training-row-cog = Route fond, deg

js-training-row-error = Erreur de position, m

js-training-row-fix = position

js-training-row-heading = Cap (gyro), deg

js-training-row-moments = moments

js-training-row-position = Position

js-training-row-sats = Satellites utilisés / suivis

js-training-row-sog = Vitesse fond, kn

js-training-row-time-offset = Décalage temporel, s

js-training-say-active = actif : { $list }

js-training-say-event-id = événement { $id }

js-training-say-fix = le récepteur rapporte une position

js-training-say-mean-cn0 = C/N0 moyen { $cn0 } dB-Hz

js-training-say-no-fix = pas de position

js-training-say-position-from-true = position rapportée à { $m } m de la réelle

js-training-say-sats-used = { $used } satellites utilisés sur { $tracked }

js-training-say-time-ahead = heure rapportée en avance de { $s } s sur la réelle

js-training-say-time-behind = heure rapportée en retard de { $s } s sur la réelle

js-training-sky-no-gsv = pas de GSV

js-training-sky-none = Pas de ciel pour ce journal : un journal d'instructeur seul n'a aucun satellite. Ouvrez un scénario de la bibliothèque, ou générez ici un flux et débriefez-le, pour voir les satellites que liste son GSV.

js-training-skyline-preset = préréglage { $name }

js-training-skyline-stated = profil indiqué

js-training-span-no-fix = de T+{ $from } à { $to } s

js-training-track-desc =
    Trace réelle et trace rapportée, nord en haut. Plus grande erreur de position { $error }.
    { $periods ->
        [one] { $periods } période sans position.
        [many] { $periods } de périodes sans position.
       *[other] { $periods } périodes sans position.
    }

js-training-track-end = fin

js-training-track-start = début

js-training-trainer-note = Note du formateur

js-training-warn-no-warning-text = Ce fichier ne porte aucun texte d'avertissement. C'est un journal de formation : n'injectez pas son flux dans la navigation en service.

js-training-warn-rows-skipped =
    { $count ->
        [one] { $count } ligne de trace n'était pas valide et a été ignorée.
        [many] { $count } de lignes de trace n'étaient pas valides et ont été ignorées.
       *[other] { $count } lignes de trace n'étaient pas valides et ont été ignorées.
    }

js-training-what-fix-lost = Position perdue

js-training-what-fix-regained = Position retrouvée

js-training-what-full-effect = Plein effet

js-training-what-onset = Début

js-training-what-recovered = Récupéré

js-training-what-recovery-begins = Début de la récupération

js-trust-adv-carried = Mention indicative portée par ce fichier :

js-trust-adv-none = Ce fichier ne porte aucune mention indicative

js-trust-adv-none-rest = (les anciennes sorties n'en portent pas). La mention indicative en haut de cette page s'y applique quand même entièrement.

js-trust-agree-both = les deux signalent : l'indicateur propre du récepteur et un moniteur Kshana

js-trust-agree-calibrating = dans la fenêtre d'étalonnage : non comparé

js-trust-agree-kshana-only = seul Kshana alarme : le récepteur ne signale rien

js-tools-ubx-ignored-sfrbx = Messages SFRBX ignorés (autres systèmes, E5b, alertes, sommes de contrôle erronées) : { $n }.

js-trust-agree-neither = aucun ne signale

js-trust-agree-receiver-only = seul le récepteur signale : aucun moniteur Kshana n'alarme

js-trust-assessed = { $name } évalué avec le moteur { $version }, dans ce navigateur.

js-trust-assessed-as = { $name } évalué comme { $format }, avec le moteur, dans ce navigateur. Rien n'a été téléversé.

js-trust-assessing = Démarrage du moteur et évaluation…

js-trust-class-also-costing = { $class } (coûte aussi des points)

js-trust-class-environment = environnement : le signal (puissance, brouillage, satellites perdus alors que le ciel est dégagé)

js-trust-class-geometry = géométrie : le ciel, pas le signal

js-trust-class-inconsistency = incohérence : de type attaque, non expliquée par le ciel ni par le signal

js-trust-dl-result-json = Télécharger le résultat (JSON)

js-trust-dl-table-csv = Télécharger la table par époque (CSV)

js-trust-edge-degraded = { $v } dégradé

js-trust-edge-nominal = { $v } nominal

js-trust-err-assess = { $name } : n'a pas pu être évalué ({ $reason }).

js-trust-err-demo-files = les fichiers de démonstration n'ont pas pu être chargés

js-trust-err-demo-log-open = Le journal de démonstration n'a pas pu être ouvert : { $reason }.

js-trust-err-demo-open = La démonstration n'a pas pu être ouverte : { $reason }.

js-trust-err-engine-no-receiver-trust = Cette version du moteur (version { $version }) n'a pas de receiver_trust.

js-trust-err-engine-no-scorer = Cette version du moteur (version { $version }) n'a pas d'évaluateur de journal ; elle est antérieure à cette page. La commande est { $command }.

js-trust-err-engine-start = Le moteur n'a pas pu démarrer ici ({ $reason }).

js-trust-err-engine-start-open = Le moteur n'a pas pu démarrer ici ({ $reason }). L'ouverture des fichiers de résultat ci-dessus fonctionne toujours.

js-trust-err-example-files = les fichiers d'exemple n'ont pas pu être chargés

js-trust-err-example-open = L'exemple n'a pas pu être ouvert : { $reason }.

js-trust-err-file-2mib = { $name } : plus grand que 2 MiB. Ouvrez un extrait.

js-trust-err-file-too-large = { $name } : plus grand que { $max }. Cette page lit des fichiers jusqu'à cette taille ; ouvrez un extrait.

js-trust-err-gen-too-large = { $name } : plus grand que 2 MiB. Ouvrez un extrait (l'outil en ligne de commande accepte un journal entier).

js-trust-err-imu-format = « { $format } » n'est pas un format d'IMU que lit cette page (csv ou euroc)

js-trust-err-imu-heading = le cap de l'IMU à son premier échantillon n'est pas un nombre

js-trust-err-log-format = « { $format } » n'est pas un format de journal que cette page peut envoyer au moteur

js-trust-err-no-epochs = Le fichier ne contient aucune époque.

js-trust-err-no-epochs-result = Ce fichier de résultat n'a pas de epochs[]. Il doit provenir de `{ $command }` pour une session de navire.

js-trust-err-no-epochs-returned = { $name } : le moteur n'a renvoyé aucune époque.

js-trust-err-no-score-model = Ce résultat n'a pas de score_model : c'est donc une exécution de plateforme statique, sans score de confiance. La vue dessine des exécutions de navire (plateforme mobile).

js-trust-err-not-readable = { $name } : n'est pas un fichier que lit cette vue (un JSON de résultat, des lignes JSON, trust.csv, un journal NMEA ou un fichier de vérité).

js-trust-err-nothing-to-draw = Rien à dessiner : choisissez un JSON de résultat, des lignes JSON ou trust.csv.

js-trust-err-read = { $name } : n'a pas pu être lu ({ $reason }).

js-trust-err-read-or-draw = { $name } : n'a pas pu être lu ni dessiné ({ $reason }).

js-trust-err-score = { $name } : n'a pas pu être évalué ({ $reason }).

js-trust-err-score-file-too-large = { $name } : plus grand que 2 MiB. L'évaluateur dans le navigateur accepte un extrait qui contient la fenêtre d'étalonnage de cinq minutes.

js-trust-err-score-too-large = { $name } : plus grand que 2 MiB. L'évaluateur dans le navigateur accepte un extrait (la commande { $command } accepte un journal entier) ; ouvrez un extrait qui contient la fenêtre d'étalonnage de cinq minutes.

js-trust-err-scorecard-too-large = { $name } : plus grand que 8 MiB ; cette page lit une fiche de score jusqu'à cette taille.

js-trust-err-session-empty = Les réglages de session sont vides. Ils déclarent le navire ({ $setting }).

js-trust-err-too-many-epochs = Le fichier compte { $count } époques ; cette page en dessine au plus { $max }. Ouvrez un extrait.

js-trust-err-triple-quote = { $what } contient trois apostrophes simples à la suite, qui ne peuvent pas être intégrées dans les réglages

js-trust-err-what-file = le fichier

js-trust-err-what-imu = le fichier d'IMU

js-trust-event-label = événement : { $label }

js-trust-event-onset = début

js-trust-evt-col-first-alarm = Première alarme, s

js-trust-evt-col-latency = Latence, s

js-trust-evt-col-onset = Début, s

js-trust-evt-col-outcome = Issue

js-trust-evt-col-stated = Événement déclaré

js-trust-fmt-android = Android GNSS Logger (texte)

js-trust-fmt-gnss-sdr = Lignes JSON relayées par GNSS-SDR (texte)

js-trust-fmt-nmea = NMEA 0183 (texte)

js-trust-fmt-novatel = NovAtel OEM7 (ASCII ou binaire)

js-trust-fmt-rinex = Observation RINEX (texte)

js-trust-fmt-rtcm3 = RTCM 3 MSM4 / MSM7 (binaire)

js-trust-fmt-rtklib-pos = Solution RTKLIB .pos (texte)

js-trust-fmt-sbf = Septentrio SBF (binaire)

js-trust-fmt-ubx = u-blox UBX (binaire)

js-trust-gate-note-derived = Cette exécution n'a pas d'enregistrement de barrière. La bande montre où une barrière aurait retenu la position calculée : les époques de la bande non fiable, retenues jusqu'à 30 s après l'avoir quittée. Dérivé ici, non lu depuis une barrière. Une barrière est facultative et ajoute de la latence.

js-trust-gate-note-read = La barrière de chaque époque telle que le flux en direct l'a rapportée : désactivée, passée ou retenue (la position calculée a été marquée invalide dans le cycle transmis).

js-trust-gate-now-derived = { $gate } · dérivé

js-trust-gate-off = Désactivée

js-trust-gate-off-cal = Désactivée (étalonnage)

js-trust-gate-passed = Passée : la position calculée est transmise inchangée

js-trust-gate-span = barrière { $gate }, de { $from } à { $to }

js-trust-gate-span-derived = barrière { $gate } (dérivée), de { $from } à { $to }

js-trust-gate-withheld = Retenue : la position calculée serait marquée invalide en aval

js-trust-gen-chart-label = Le graphique du moteur pour l'exécution : densité porteuse sur bruit, état et alarmes dans le temps

js-trust-gen-epochs =
    Époques : { $nominal } nominales, { $degraded } dégradées, { $untrusted } non fiables après la fenêtre d'étalonnage de { $window ->
        [one] { $window } époque
        [many] { $window } d'époques
       *[other] { $window } époques
    }.

js-trust-gen-self-heading = Les indicateurs propres du récepteur, face aux alarmes de Kshana

js-trust-gen-self-note = Une comparaison, et non une vérification de l'un ou de l'autre : l'indicateur du récepteur est son propre rapport.

js-trust-geo-deduction-class =
    { $points ->
        [one] { $points } point ({ $class })
        [many] { $points } de points ({ $class })
       *[other] { $points } points ({ $class })
    }

js-trust-geo-deduction-points =
    { $points ->
        [one] { $points } point
        [many] { $points } de points
       *[other] { $points } points
    }

js-trust-geo-flag-mismatch = Le HDOP indiqué par le récepteur est en désaccord avec celui dérivé du ciel qu'il rapporte : une déduction de géométrie compte comme incohérence.

js-trust-geo-flag-signal-loss = Perte de signal : des satellites en vue ne sont pas suivis alors que leur géométrie est bonne ; une déduction de géométrie compte donc comme environnement.

js-trust-geo-heading-label = géométrie { $label }

js-trust-geo-label-fair = { $label } (non évalué)

js-trust-geo-label-poor = { $label } (la seule étiquette pour laquelle le score déduit)

js-trust-geo-none-in-run = Aucune géométrie dans cette exécution (un moteur antérieur à 0.36 n'en écrit aucune).

js-trust-geo-reason-few-satellites = moins de satellites que le minimum

js-trust-geo-reason-high-hdop = HDOP au-dessus de son seuil

js-trust-geo-reason-high-pdop = PDOP au-dessus de son seuil

js-trust-geo-reason-sky-blocked = les satellites suivis laissent un large vide en azimut (un côté du ciel obstrué)

js-trust-geo-row-deduction = Déduction de géométrie

js-trust-geo-row-from = Depuis

js-trust-geo-row-gap = Plus grand écart en azimut

js-trust-geo-row-label = Étiquette

js-trust-geo-row-open-sky = Ciel dégagé

js-trust-geo-row-reported-hdop = HDOP indiqué par le récepteur

js-trust-geo-row-sats-used = Satellites utilisés

js-trust-geo-row-sky-age = Ancienneté du ciel

js-trust-geo-row-status = État

js-trust-geo-say-deduction =
    { $points ->
        [one] déduction de géométrie { $points } point
        [many] déduction de géométrie { $points } de points
       *[other] déduction de géométrie { $points } points
    }

js-trust-geo-say-label-hdop = géométrie { $label } (HDOP { $hdop })

js-trust-geo-say-mismatch = le HDOP indiqué est en désaccord

js-trust-geo-source-derived = dérivée des satellites que rapporte le journal (GSV)

js-trust-geo-source-none = rien

js-trust-geo-source-reported = le DOP indiqué par le récepteur (GSA)

js-trust-geo-status-reasons = { $status } : { $reasons }

js-trust-geo-status-title = géométrie { $status }

js-trust-geo-unknown-no-gsv = géométrie inconnue : ni GSV ni GSA dans le journal

js-trust-geo-unknown-no-gsv-sentence = Géométrie inconnue : ni GSV ni GSA dans le journal.

js-trust-geo-unknown-odd = Géométrie inconnue (le fichier indique « { $odd } », que cette page ne connaît pas).

js-trust-geo-used-of-view = { $used } sur { $inView } en vue

js-trust-got-file-kind = { $name } : { $kind }

js-trust-got-lines-skipped =
    { $count ->
        [one] { $count } ligne de { $name } n'était pas une époque et a été ignorée
        [many] { $count } de lignes de { $name } n'étaient pas des époques et ont été ignorées
       *[other] { $count } lignes de { $name } n'étaient pas des époques et ont été ignorées
    }

js-trust-imu-csv = CSV avec une ligne d'en-tête

js-trust-imu-euroc = EuRoC MAV imu0 data.csv

js-trust-imu-file = Fichier d'IMU : { $name } ({ $chars } caractères). Utilisé à la prochaine évaluation.

js-trust-imu-file-press = Fichier d'IMU : { $name } ({ $chars } caractères). Utilisé à la prochaine évaluation ; appuyez sur Évaluer le fichier choisi.

js-trust-imu-none = Aucun fichier d'IMU.

js-trust-jt-col-latency = Latence, s

js-trust-jt-col-monitors = Premiers moniteurs

js-trust-jt-col-name = Nom

js-trust-jt-col-outcome = Issue

js-trust-jt-col-recovered = Récupéré

js-trust-jt-col-slot = Créneau, s

js-trust-jt-col-test = Test

js-trust-jt-label = { $label } Garde { $guard } s, maintien de récupération { $hold } s.

js-trust-jt-label-contaminated = { $label } Garde { $guard } s, maintien de récupération { $hold } s. La référence d'étalonnage chevauchait un créneau planifié.

js-trust-jt-opened =
    { $count ->
        [one] { $name } ouvert : { $count } test. Lu ici ; rien n'a été téléversé.
        [many] { $name } ouvert : { $count } de tests. Lu ici ; rien n'a été téléversé.
       *[other] { $name } ouvert : { $count } tests. Lu ici ; rien n'a été téléversé.
    }

js-trust-kind-batch-result = résultat par lot

js-trust-kind-json-lines = lignes JSON

js-trust-kind-nmea-log = journal NMEA

js-trust-kind-truth-file = fichier de vérité

js-trust-label-demo = Démonstration synthétique : un journal de ferry inventé avec un entraînement progressif de position inventé, évalué par Kshana. Enregistré à partir du moteur ; le journal est du texte, pas une mesure.

js-trust-label-example = Exemple illustratif : un journal NMEA inventé avec un brouilleur inventé de 120 s à 240 s, évalué ici par le moteur. Du texte, pas une mesure.

js-trust-label-geo-demo = Démonstration synthétique de ciel masqué : le journal du ferry avec la moitié ouest du ciel effacée à partir de 600 s (dégradation naturelle, attribuée à la géométrie) et le même entraînement progressif inventé à partir de 1500 s (de type attaque). Enregistré à partir d'un moteur avec la géométrie 0.36 ; du texte, pas une mesure.

js-trust-label-score-demo = Journal de démonstration synthétique, évalué ici par le moteur. Journal de ferry et entraînement progressif inventés ; du texte, pas une mesure.

js-trust-legend-calibrating = Étalonnage (jamais évalué)

js-trust-legend-class = Classe de déduction :

js-trust-legend-class-environment = environnement : le signal

js-trust-legend-class-geometry = géométrie : le ciel, pas le signal

js-trust-legend-class-inconsistency = incohérence (de type attaque)

js-trust-legend-degraded = Dégradé

js-trust-legend-demo = Dans cette démonstration, le récepteur rapporte une position valide tout du long (qualité GGA 1, état RMC A). C'est le score qui chute.

js-trust-legend-geo-degraded = géométrie dégradée

js-trust-legend-geo-good = géométrie bonne

js-trust-legend-geo-unknown = géométrie inconnue (ni GSV ni GSA ; pas bonne)

js-trust-legend-nominal = Nominal

js-trust-legend-self = Indicateur propre du récepteur face aux alarmes de Kshana :

js-trust-legend-self-both = les deux signalent

js-trust-legend-self-kshana = seulement Kshana

js-trust-legend-self-neither = aucun

js-trust-legend-self-receiver = seulement le récepteur

js-trust-legend-sky = Ciel :

js-trust-legend-true-track = Trace réelle (données synthétiques seulement)

js-trust-legend-underline = souligné : la géométrie coûte aussi des points

js-trust-legend-untrusted = Non fiable

js-trust-marks-cleared = Repères effacés.

js-trust-marks-set =
    { $count ->
        [one] { $name } était au-dessus de son seuil de début dans { $count } époque ; elles sont marquées sur la chronologie et la trace.
        [many] { $name } était au-dessus de son seuil de début dans { $count } d'époques ; elles sont marquées sur la chronologie et la trace.
       *[other] { $name } était au-dessus de son seuil de début dans { $count } époques ; elles sont marquées sur la chronologie et la trace.
    }

js-trust-mon-agc = Le contrôle automatique de gain s'est écarté de sa référence de base.

js-trust-mon-clock = Le moniteur assisté par l'horloge : l'horloge du récepteur par rapport à sa droite prédite.

js-trust-mon-cn0-drop = Déni de puissance : force du signal tombée par rapport à la référence de base d'étalonnage.

js-trust-mon-cn0-rise = Recherche la signature d'un seul émetteur : la force du signal sur les satellites qui monte de concert par rapport à la référence de base.

js-trust-mon-cn0-spread = Recherche la signature d'un seul émetteur : la force du signal sur les satellites qui s'effondre de concert par rapport à la référence de base d'étalonnage.

js-trust-mon-geometry = La géométrie des satellites (0.36) : ne coûte des points que lorsque la géométrie est mauvaise (HDOP, PDOP ou satellites utilisés au-delà de leurs seuils), plafonnée et jamais en dessous de la bande dégradée.

js-trust-mon-heading-course = Compare la direction de la trace avec la direction vers laquelle pointe le navire, dans la limite de l'angle de dérive indiqué.

js-trust-mon-jam-ind = L'indicateur de brouillage propre du récepteur.

js-trust-mon-kinematic = Compare chaque pas de position avec la vitesse et la route rapportées, et avec les limites de vitesse, d'accélération et de vitesse de giration indiquées pour le navire.

js-trust-mon-loss-of-lock = Perte de satellites suivis.

js-trust-mon-osnma = Lit un échec d'authentification OSNMA rapporté. L'état est lu, non vérifié.

js-trust-mon-position-jump = Un saut de la position rapportée plus grand que ce que permet la référence de base.

js-trust-mon-raim = La statistique de test de la surveillance autonome de l'intégrité par le récepteur par rapport à son seuil.

js-trust-mon-receiver-self-report = L'indicateur propre du récepteur de leurrage ou de brouillage (par exemple u-blox UBX-SEC-SIG ou NAV-STATUS spoofDetState), affiché à côté des moniteurs de Kshana. Lu depuis le journal, non vérifié ; l'emplacement est prêt pour le moniteur du moteur 0.38 et se dessine comme une bande dès qu'un résultat le porte.

js-trust-mon-sea-level = Vérifie que l'altitude est là où la surface de la mer et la hauteur d'antenne indiquée la placent.

js-trust-mon-solve-failure = La solution de position n'a pas pu être calculée.

js-trust-mon-speed-log = Compare la vitesse fond avec la vitesse surface, dans la limite du courant admis indiqué.

js-trust-mon-time-consistency = Vérifie que l'heure du récepteur ne présente ni pas irréguliers ni retour en arrière, et la compare à l'horloge de cet ordinateur pour les flux en temps réel.

js-trust-mon-unknown = Un moniteur pour lequel cette vue n'a pas de description (plus récent que la page). Traitez-le comme un moniteur.

js-trust-na = s. o.

js-trust-name-colon-text = { $name } : { $text }

js-trust-never = jamais

js-trust-no = non

js-trust-no-deduction = aucune déduction

js-trust-none = aucun

js-trust-north = N

js-trust-not-stated = non indiqué

js-trust-note-advisories =
    { $count ->
        [one] Les lignes portent { $count } mention indicative différente ; la première est affichée.
        [many] Les lignes portent { $count } de mentions indicatives différentes ; la première est affichée.
       *[other] Les lignes portent { $count } mentions indicatives différentes ; la première est affichée.
    }

js-trust-note-csv-limits = trust.csv porte des scores et des motifs, mais ni rapports ni positions.

js-trust-note-live-no-model = Un flux en direct n'indique ni les moniteurs exécutés ni le modèle de score ; les bords de bande ci-dessous sont les valeurs par défaut documentées, et les bandes de moniteurs ne montrent que les moniteurs qui coûtent des points.

js-trust-note-nmea-no-match = Aucune position NMEA n'a pu être associée à une époque par l'heure.

js-trust-note-nmea-skipped =
    { $count ->
        [one] { $count } phrase NMEA dont la somme de contrôle ou les champs étaient erronés a été ignorée.
        [many] { $count } de phrases NMEA dont la somme de contrôle ou les champs étaient erronés ont été ignorées.
       *[other] { $count } phrases NMEA dont la somme de contrôle ou les champs étaient erronés ont été ignorées.
    }

js-trust-note-skipped-epochs =
    { $count ->
        [one] { $count } époque sans t_s numérique a été ignorée.
        [many] { $count } d'époques sans t_s numérique ont été ignorées.
       *[other] { $count } époques sans t_s numérique ont été ignorées.
    }

js-trust-note-truth-no-match = Les heures du fichier de vérité ne correspondent à aucune époque.

js-trust-note-unknown-state =
    { $count ->
        [one] { $count } époque porte un état que cette page ne connaît pas ({ $states }) ; elle est dessinée comme en étalonnage, jamais évaluée.
        [many] { $count } d'époques portent un état que cette page ne connaît pas ({ $states }) ; elles sont dessinées comme en étalonnage, jamais évaluées.
       *[other] { $count } époques portent un état que cette page ne connaît pas ({ $states }) ; elles sont dessinées comme en étalonnage, jamais évaluées.
    }

js-trust-offset-at = À { $time }, la position rapportée par le récepteur est à { $m } m de l'endroit où se trouvait réellement le navire (vérité synthétique).

js-trust-offset-no-truth = Aucune position réelle à cet instant.

js-trust-opened =
    { $count ->
        [one] { $count } époque ouverte ({ $source }).
        [many] { $count } d'époques ouvertes ({ $source }).
       *[other] { $count } époques ouvertes ({ $source }).
    }

js-trust-opening-demo = Ouverture de la démonstration synthétique…

js-trust-opening-demo-log = Ouverture du journal de démonstration synthétique…

js-trust-opening-example = Ouverture de l'exemple illustratif…

js-trust-opening-geo-demo = Ouverture de la démonstration de ciel masqué…

js-trust-pause = Pause

js-trust-play = Lecture

js-trust-reading = Lecture…

js-trust-reasons-calibrating = Étalonnage : les premières secondes forment la référence de base et ne sont jamais évaluées.

js-trust-reasons-class-note = Chaque déduction porte la classe du moteur : géométrie (le ciel), environnement (le signal) ou incohérence (de type attaque)

js-trust-reasons-live-unknown = Les moniteurs exécutés ne sont pas indiqués dans un flux en direct ; un contrôle absent ici peut ne pas avoir été exécuté.

js-trust-reasons-marked-none = marqué ; aucune déduction ici

js-trust-reasons-no-score = Aucun score à cette époque.

js-trust-reasons-no-score-note = Aucun score à cette époque : { $note }.

js-trust-reasons-not-run = Non exécuté (pas un succès)

js-trust-reasons-nothing = Rien n'a été déduit à cette époque. Ce n'est pas une preuve que la position calculée est bonne : voyez ce que les contrôles ne peuvent pas voir, ci-dessous.

js-trust-reasons-pts = { $points } pts

js-trust-reasons-ran-free = Exécuté, sans coût

js-trust-reasons-ratio = rapport { $ratio }

js-trust-reasons-row-title = { $name } : { $text } Cliquez pour marquer où il dépassait son seuil de début.
