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
       *[other] { $n } lieux
    }

js-app-hero-positions-only = Positions des satellites seulement : ni puissance du signal, ni état de santé des satellites, ni terrain.

js-app-hero-ramp = { $lo } à { $hi } { $field }

js-app-hero-ramp-over = { $lo } à { $hi } { $field }, sur { $duration }

js-app-hero-recorded-bare = Résultat enregistré

js-app-hero-satellites =
    { $n ->
        [one] { $n } satellite
       *[other] { $n } satellites
    }

js-app-hero-steps =
    { $n ->
        [one] { $n } pas de temps
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
       *[other] { $n } notes de plus du fichier de scénario
    }

js-app-how-more-rows =
    { $n ->
        [one] { $n } ligne de plus dans la matrice de vérification (page Preuves du site).
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
