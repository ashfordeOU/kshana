# Texte de l'interface (français) : en-tête du site, avis, sélecteur de langue, coque du Studio.

## Site chrome
site-skip-link = Aller au contenu
site-nav-primary = Principale
site-nav-missions = Missions
site-nav-capabilities = Capacités
site-nav-evidence = Preuves
site-nav-research = Recherche
site-nav-developers = Développeurs
site-nav-docs = Documentation
site-nav-editions = Éditions
site-nav-search = Rechercher
site-nav-launch = Lancer
site-nav-studio = { -brand } Studio
site-nav-home = Accueil { -brand }
site-nav-theme = Basculer entre le mode clair et le mode sombre
site-version = v{ $version }

site-footer-tagline = Simulateur open source de résilience PNT (positionnement, navigation et synchronisation temporelle). Il ne pilote aucun matériel radio et n'émet rien : sa sortie au niveau du signal se compose de fichiers d'échantillons IQ en bande de base, et son récepteur GNSS logiciel est un outil d'analyse. Ce n'est pas un produit de vol.
site-footer-product = Produit
site-footer-company = Entreprise
site-footer-benchmark = Banc d'essai comparatif
site-footer-install = Installation
site-footer-mcp = Serveur MCP
site-footer-github = GitHub
site-footer-kshana-pro = { -brand } Pro
site-footer-licence = { -brand } v{ $version } · par Ashforde® OÜ · AGPL-3.0, avec une option de licence commerciale
site-footer-provenance = Chaque graphique est tracé à partir d'une exécution enregistrée du moteur v{ $version } et indique son scénario, sa graine et la marche à suivre pour le reproduire.

## Language switcher
site-lang-label = Langue
site-lang-switch-aria = Choisir la langue de cette page
site-lang-auto = Langue du navigateur
site-lang-remembered = Votre choix est mémorisé sur cet appareil.

## Notices (shown at the top of a page's content)
notice-machine-translation = { -mt-notice }
notice-fallback =
    { $n ->
        [one] { $n } partie de cette page a changé depuis sa traduction et s'affiche en anglais.
        [many] { $n } de parties de cette page ont changé depuis leur traduction et s'affichent en anglais.
       *[other] { $n } parties de cette page ont changé depuis leur traduction et s'affichent en anglais.
    }
notice-not-started = Cette page n'a pas encore été traduite. Elle s'affiche en anglais.
notice-detected = Affichage en { $language }. <a1>Passer à l'anglais</a1>
notice-dismiss = Fermer
notice-recorded-in-english = Consigné en anglais
notice-advisory = { -advisory }

## Studio shell
studio-title = { -brand } Studio
studio-home = Accueil { -brand }
studio-search-label = Trouver un scénario, un domaine, un réglage ou une commande
studio-search-placeholder = Rechercher par nom, question ou réglage, par exemple masque d'élévation
studio-search-scenarios = Rechercher des scénarios, des domaines ou des réglages
studio-search-commands = Rechercher des scénarios et des commandes
studio-search-all = Trouver un scénario, un domaine, un réglage, une vue ou une commande
studio-search = Rechercher
studio-theme = Basculer entre le mode clair et le mode sombre
studio-starting-questions = Questions pour commencer
studio-where-you-are = Où vous en êtes
studio-engine-status = Où le moteur s'exécute
studio-views = Vues : Géométrie, Confiance du récepteur, Carte des interférences, Débriefing de formation, Outils
studio-more-views = Plus de vues
studio-advanced-full = Le tableau de bord complet : tous les panneaux, champs et onglets
studio-advanced-switch = Passer à la vue avancée
studio-view-geometry = Géométrie : skyplot, horizon et DOP
studio-view-training = Débriefing de formation : ouvrir un journal d'instructeur
studio-view-interference = Carte des interférences : ouvrir des fichiers de carte
studio-view-receiver-trust = Confiance du récepteur : ouvrir une exécution de navire
studio-view-tools = Outils : preuves, bench, compliance, OSNMA
studio-result = Résultat
studio-result-meaning = Ce que signifie le résultat
studio-key-figures = Chiffres clés
studio-result-views = Vues de ce résultat
studio-figures-of-merit = Figures de mérite
studio-find-result-field = Trouver un champ du résultat
studio-capability-view = Vue des capacités
studio-time-series = Séries temporelles
studio-chart-source = Source du graphique
studio-signal-band = Signal et bande
studio-signal-field = Champ de signal
studio-clock-holdover = Holdover de l'horloge
studio-telecom-masks = Gabarits de synchronisation des télécommunications
studio-clock-stability = Stabilité de l'horloge
studio-orbit-3d = Orbite 3D
studio-ground-track = Trace au sol
studio-parameter-sweep = Balayage de paramètres
studio-compare-runs = Comparer des exécutions
studio-animation = Animation
studio-engine-report = Rapport du moteur
studio-exports = Exports et rapport
studio-full-result = Document de résultat complet
studio-settings = Réglages et détails
studio-find-setting = Trouver un réglage, par exemple masque
studio-find-scenario-setting = Trouver un réglage de ce scénario
studio-engine-summary = Le résumé propre au moteur
studio-restore-scenario = Restaurer le scénario fourni
studio-copy-scenario = Copier le texte du scénario
studio-scenario-source = Source du scénario (TOML)
studio-install-engine = Installer le moteur
studio-run-history = Historique des exécutions
studio-scenarios-count =
    { $n ->
        [one] Scénario qu'il exécute ({ $n })
        [many] Scénarios qu'il exécute ({ $n })
       *[other] Scénarios qu'il exécute ({ $n })
    }
studio-ledger-rows =
    { $n ->
        [one] { $n } ligne du registre
        [many] { $n } de lignes du registre
       *[other] { $n } lignes du registre
    }
studio-recorded-in-english = Consigné en anglais
studio-lang-engine-fallback = Le texte du moteur pour cette langue n'a pas pu être chargé ; l'anglais s'affiche.

studio-geometry-kshana-home = Accueil Kshana

studio-geometry-back-to-the-studio = Retour au Studio

studio-geometry-step-the-time = Avancer le temps pas à pas

studio-geometry-draw-the-skyline = Dessiner l'horizon

studio-geometry-skip-to-the-view = Aller à la vue

studio-geometry-which-satellites-can-you-see = Quels satellites voyez-vous, et quelle est la qualité de leur géométrie ?

studio-geometry-what-this-shows = Ce que cela montre

studio-geometry-starting-the-engine = Démarrage du moteur…

studio-geometry-every-setting-is-in-the = Chaque réglage figure dans l'adresse de la page : un lien copié ouvre donc le même ciel.

studio-geometry-offset-from-the-constellations-reference = Décalage par rapport à l'époque de référence des constellations

studio-geometry-10-min = −10 min

studio-geometry-10-min-2 = +10 min

studio-geometry-your-own-orbital-elements-tle = Vos propres éléments orbitaux (TLE)

studio-geometry-use-these-elements = Utiliser ces éléments

studio-geometry-back-to-the-presets = Retour aux préréglages

studio-geometry-clear-the-skyline = Effacer l'horizon

studio-geometry-drag-on-the-skyplot-to = Faites glisser sur le skyplot pour dessiner l'horizon (pas de 1° en azimut, 0,5° en élévation). Le skyplot étant sélectionné : Gauche et Droite font le tour de l'horizon (Maj pour 10°), Haut et Bas relèvent ou abaissent l'horizon à cet endroit (Maj pour 5°), Suppr l'efface.

studio-geometry-copy-a-link-to-this = Copier un lien vers ce ciel

studio-geometry-download-the-skyplot-svg = Télécharger le skyplot (SVG)

studio-geometry-zenith-in-the-centre-the = Zénith au centre, horizon sur le bord, nord en haut. Les repères pleins sont les satellites de la solution ; les repères creux sont masqués par le masque ou l'horizon, ou ne sont pas utilisés.

studio-geometry-dilution-of-precision = Dilution de la précision

studio-geometry-how-much-the-geometry-multiplies = De combien la géométrie multiplie l'erreur de distance. Plus bas est meilleur ; environ 1 est excellent, au-delà de 6 est mauvais.

studio-geometry-horizontal-position-error = Erreur de position horizontale

studio-geometry-satellites-as-a-table = Satellites, sous forme de tableau

studio-geometry-the-same-satellites-as-the = Les mêmes satellites que sur le skyplot.

studio-geometry-azimuth = Azimut, °

studio-geometry-elevation = Élévation, °

studio-geometry-in-the-solution = Dans la solution

studio-geometry-the-engine-runs-here-as = Le moteur s'exécute ici sous forme de WebAssembly. Rien n'est récupéré depuis un autre site et rien de ce que vous réglez n'est envoyé ailleurs.

studio-holdover-holdover-test-scenarios = Scénarios de test de holdover

studio-holdover-holdover-test = Test de holdover

studio-holdover-how-far-does-the-time = Jusqu'où l'erreur de temps monte-t-elle quand le GNSS disparaît ?

studio-holdover-opening-the-scenarios = Ouverture des scénarios…

studio-holdover-verdict-step-by-step = Verdict, étape par étape

studio-holdover-time-error-over-the-record = Erreur de temps sur l'enregistrement

studio-holdover-the-three-phases-are-shaded = Les trois phases sont ombrées ; les lignes verticales en pointillés sont les deux instants indiqués par l'opérateur. Les lignes horizontales en pointillés sont les limites des gabarits sur l'erreur de temps absolue maximale, chacune tracée sur l'étape que nomme son gabarit, ainsi que la bande de récupération ; un triangle marque le moment où un budget ou l'enveloppe de holdover ePRTC-A est dépassé pour la première fois.

studio-holdover-of-the-baseline-and-the = De la référence de base et du holdover ; une croix est une limite de gabarit à l'instant où sa vérification était la pire.

studio-holdover-the-same-two-steps-against = Les deux mêmes étapes face aux limites TDEV.

studio-holdover-the-numbers = Les chiffres

studio-holdover-everything-below-is-the-engine = Tout ce qui suit provient du moteur, dans les unités qu'il indique.

studio-holdover-mask-checks = Vérifications des gabarits

studio-holdover-each-mask-is-measured-on = Chaque gabarit est mesuré sur l'étape que nomme sa condition. Un gabarit qui exige un enregistrement plus long que celui fourni par l'étape est INCOMPLETE, jamais extrapolé ; toute entrée qu'une recommandation laisse à l'étude est absente.

studio-holdover-what-this-does-not-cover = Ce que cela ne couvre pas

studio-interference-cell-size-in-degrees-empty = Taille de cellule en degrés (vide pour 0,5)

studio-interference-https = https://…

studio-interference-about-this-page = À propos de cette page

studio-interference-interference-map = Carte des interférences

studio-interference-where-did-position-reports-look = Où les rapports de position semblaient-ils dégradés ?

studio-interference-open-map-files = Ouvrir des fichiers de carte

studio-interference-or-drop-them-here = ou les déposer ici

studio-interference-open-the-synthetic-demo = Ouvrir la démo synthétique

studio-interference-close-all-maps = Fermer toutes les cartes

studio-interference-nothing-open-yet = Rien d'ouvert pour l'instant.

studio-interference-build-a-map-here = Construire une carte ici

studio-interference-build-from-the-synthetic-sample = Construire à partir de l'échantillon synthétique

studio-interference-route-exposure-here = Exposition d'un itinéraire ici

studio-interference-use-the-synthetic-route = Utiliser l'itinéraire synthétique

studio-interference-reading-these-maps = Lire ces cartes

studio-interference-maps-inherit-the-coverage-of = Les cartes héritent de la couverture de leur source : les récepteurs ADS-B bénévoles laissent la haute mer peu couverte, et les données AIS ouvertes omettent certaines classes de navires. Lisez les notes de couverture de chaque fichier.

studio-interference-no-coastline-or-basemap-is = Aucun trait de côte ni fond de carte n'est tracé et rien n'est récupéré depuis un serveur ; la grille n'est que latitude et longitude.

studio-interference-no-identifier-of-any-aircraft = Aucun identifiant d'aéronef ou de navire ne figure dans ces fichiers ; les cellules comptant trop peu d'aéronefs ou de navires distincts ne sont pas publiées du tout, et un décompte AIS de un ou deux est retenu.

studio-lunar-infra-lunar-infrastructure-scenarios = Scénarios d'infrastructure lunaire

studio-lunar-infra-lunar-infrastructure = Infrastructure lunaire

studio-lunar-infra-what-can-the-moon-s = Que peuvent apporter l'orbite et la surface de la Lune comme infrastructure de navigation et de géodésie, et où est-ce insuffisant ?

studio-lunar-infra-five-studies-of-what-lunar = Cinq études de ce que des orbiteurs lunaires et une station de surface lunaire pourraient apporter ensemble comme infrastructure de navigation et de géodésie : détermination d'orbite à partir de signaux GNSS terrestres face au suivi depuis le sol, fixation de la phase de la porteuse entre une station de surface et un orbiteur, co-estimation du référentiel lunaire, rattachement du GNSS, du VLBI et de la télémétrie laser sur un même engin spatial, et sensibilité de la télémétrie laser et du suivi aux marées et à la libration de la Lune. Les entrées sont illustratives et le modèle est restreint ; lorsqu'une étude a manqué le seuil auquel elle était préenregistrée, cette page le dit. Chaque nombre est copié d'un résultat enregistré par le moteur ; la page le met à l'échelle et le trace, et ne calcule rien d'autre.

studio-lunar-infra-what-the-result-holds = Ce que contient le résultat

studio-lunar-infra-findings-disclosures-and-what-was = Constats, divulgations et ce qui n'a pas été vérifié

studio-lunar-what-these-figures-are = Ce que sont ces chiffres

studio-lunar-map-key = Légende de la carte

studio-lunar-lunar-station = Station lunaire

studio-lunar-what-accuracy-could-a-reference = Quelle précision une station de référence près du pôle sud lunaire pourrait-elle offrir, et où ?

studio-lunar-the-constellation-its-signal-in = La constellation, son erreur de signal dans l'espace, l'erreur de levé de la station, la latence de correction et la quantification de la liaison sont des entrées indiquées dans le fichier de scénario, chacune avec sa source ou marquée comme illustrative. Aucun chiffre ici n'a été confronté à une vraie station ni à des données de vol.

studio-lunar-the-source-and-every-input = La source et chaque entrée que vous modifiez figurent dans l'adresse de la page : un lien copié ouvre donc la même étude.

studio-lunar-a-result-file-is-the = Un fichier de résultat est le JSON que le moteur écrit pour ce type (la sortie JSON de la ligne de commande, ou une exécution enregistrée depuis ici). Il est lu dans cette page ; rien n'est envoyé.

studio-lunar-each-field-shows-the-scenario = Chaque champ affiche la valeur du fichier de scénario tant que vous ne la modifiez pas. Une journée d'époques sur toute la grille prend un certain temps : moins d'essais ou un pas de temps plus long vont plus vite.

studio-lunar-run-it-here = Exécuter ici

studio-lunar-back-to-the-file-s = Retour aux valeurs du fichier

studio-lunar-copy-a-link = Copier un lien

studio-lunar-save-this-result-json = Enregistrer ce résultat (JSON)

studio-lunar-corrected-error-over-the-south = Erreur corrigée sur la région polaire sud

studio-lunar-south-polar-stereographic-the-pole = Projection stéréographique polaire sud : le pôle au centre, le bord de la grille sur le pourtour, longitude 0° en haut, 90° est à droite. Chaque cellule est un point de grille ; la ligne épaisse est l'endroit où l'erreur corrigée franchit le seuil, et la ligne en pointillés est le rayon de couverture par azimut.

studio-lunar-region-figures = Chiffres de la région

studio-lunar-over-the-whole-grid-means = Sur toute la grille : moyennes pondérées par l'aire, et pire point.

studio-lunar-coverage-radius-per-azimuth = Rayon de couverture par azimut

studio-lunar-along-each-bearing-from-the = Le long de chaque relèvement depuis la station, la distance à laquelle la couverture passe pour la première fois sous 95 %.

studio-lunar-as-a-table = Sous forme de tableau

studio-lunar-radius-km = Rayon, km

studio-lunar-at-the-grid-edge = Au bord de la grille

studio-lunar-points-along-it = Points le long de celui-ci

studio-lunar-an-epoch-is-unavailable-at = Une époque est indisponible en un point quand l'utilisateur voit moins de quatre satellites, ou que la station ne voit pas chaque satellite qu'utilise l'utilisateur ; aucune erreur n'est calculée pour elle.

studio-lunar-grid-points-as-a-table = Points de grille, sous forme de tableau

studio-lunar-the-same-points-as-the = Les mêmes points que sur la carte, les plus proches de la station en premier.

studio-lunar-latitude = Latitude, °

studio-lunar-longitude = Longitude, °

studio-lunar-from-the-station-km = Depuis la station, km

studio-lunar-corrected-error = Erreur corrigée

studio-lunar-uncorrected-error = Erreur non corrigée

studio-lunar-hpl-median = Médiane du HPL

studio-lunar-the-engine-s-statement-inputs = L'énoncé du moteur, les entrées et le bilan de liaison

studio-lunar-inputs-as-the-engine-read = Entrées, telles que le moteur les a lues

studio-lunar-error-model = Modèle d'erreur

studio-lunar-correction-link-budget-at-the = Bilan de la liaison de correction à la station et au pire point

studio-observatory-previous-day = Jour précédent

studio-observatory-day-opened = Jour ouvert

studio-observatory-next-day = Jour suivant

studio-observatory-interference-observatory = Observatoire des interférences

studio-observatory-what-did-one-day-s = À quoi ressemblaient les rapports de position d'une journée ?

studio-observatory-the-observatory-writes-a-few = L'observatoire écrit quelques fichiers pour chaque jour UTC et chaque région : les cellules de grille avec l'un de trois états, une liste d'incidents et un manifeste. Ouvrez ici les fichiers que vous avez produits et lisez-les. La page ne calcule rien et n'affiche que ce que disent les fichiers. Elle ne fournit aucune donnée de l'observatoire, ne récupère rien et ne téléverse rien.

studio-observatory-open-a-day = Ouvrir un jour

studio-observatory-larr = ←

studio-observatory-rarr = →

studio-observatory-the-three-states = Les trois états

studio-observatory-the-picture-the-observatory-wrote = L'image écrite par l'observatoire

studio-observatory-the-png-you-opened-as = Le PNG que vous avez ouvert, tel quel. Les cellules qui ne sont pas dessinées n'ont pas été observées.

studio-observatory-cells-drawn-from-the-file = Cellules, dessinées à partir du fichier

studio-observatory-plate-carr-eacute-e-no = Plate carrée, sans fond de carte. Survolez une cellule, ou utilisez le tableau, pour son état et ses décomptes. Un endroit sans cellule n'a pas été observé.

studio-observatory-hover-or-focus-a-cell = Survolez une cellule ou donnez-lui le focus pour voir son état.

studio-observatory-every-cell-in-the-file = Toutes les cellules du fichier

studio-observatory-a-count-the-file-withholds = Un décompte que le fichier retient (moins de 5 aéronefs) s'affiche « retenu », jamais 0.

studio-observatory-files-and-their-hashes = Fichiers et leurs empreintes

studio-observatory-dataset-licence-and-notice = Jeu de données, licence et mention

studio-observatory-what-this-page-does-and = Ce que cette page montre et ne montre pas

studio-observatory-products-are-released-at-least = Les produits sont publiés au moins 24 heures après la fin du jour UTC, sur des cellules de 0,5 degré ou plus grossières. Ce n'est jamais une vue en direct et elle ne dit jamais « maintenant ».

studio-observatory-it-shows-no-cause-no = Elle n'indique aucune cause, aucun pays, aucune force et aucune source d'interférence, aucune alerte, aucune comparaison entre lieux ou jours, et aucun AIS. L'ADS-B et l'AIS ne sont jamais combinés.

studio-observatory-the-page-ships-none-of = La page ne fournit aucun des produits de l'observatoire. Les publier est la décision du propriétaire.

studio-optical-optical-atmosphere-scenarios = Scénarios d'atmosphère optique

studio-optical-optical-pnt = PNT optique

studio-optical-can-an-optical-link-get = Une liaison optique peut-elle traverser les intempéries ?

studio-optical-the-link = La liaison

studio-optical-sites-as-the-engine-states = Sites, tels que le moteur les énonce

studio-optical-inputs-are-marked-everything-else = Les entrées sont signalées ; tout le reste est la sortie du moteur pour elles.

studio-optical-it-draws-only-what-the = Elle ne trace que ce que le moteur a enregistré pour chaque scénario, y compris sa série temporelle à graine fixée. La page ne calcule rien : elle met les nombres du moteur à l'échelle du graphique.

studio-optical-the-sites-their-cloud-climates = Les sites, leurs climats nuageux, les classes d'horloge et les techniques sont des entrées choisies pour illustrer, et sont signalées comme telles. Aucun relevé de disponibilité mesurée n'a été comparé.

studio-replay-replay-controls = Commandes de rejeu

studio-replay-previous-moment-page-up = Instant précédent (Page précédente)

studio-replay-step-back = Reculer d'un pas

studio-replay-step-back-left-arrow = Reculer d'un pas (flèche gauche)

studio-replay-play-or-pause-space = Lire ou mettre en pause (Espace)

studio-replay-step-forward = Avancer d'un pas

studio-replay-step-forward-right-arrow = Avancer d'un pas (flèche droite)

studio-replay-next-moment-page-down = Instant suivant (Page suivante)

studio-replay-replay-speed-mission-seconds-per = Vitesse de rejeu, secondes de mission par seconde

studio-replay-mission-clock-seconds-from-the = Horloge de mission, secondes depuis le début de chaque exécution

studio-replay-bridge-replay = Rejeu de la passerelle

studio-replay-two-runs-one-clock-when = Deux exécutions, une horloge : quand la passerelle l'a-t-elle su ?

studio-replay-put-two-synthetic-runs-side = Placez deux exécutions synthétiques côte à côte et lisez-les sur une même horloge de mission. Chaque panneau montre où le navire se trouvait réellement face à l'endroit où le récepteur le situait, le score de confiance du moteur et sa bande au fil du temps, les satellites que le journal lui-même énumère (le ciel reste vide là où le journal n'en entend aucun), et un verdict à la fin de l'exécution. Tout ce qui est tracé provient d'un journal ou du résultat du moteur pour celui-ci ; rien n'est lu depuis le réseau.

studio-replay-save-animated-svg = Enregistrer le SVG animé

studio-replay-save-frames-zip = Enregistrer les images (ZIP)

studio-replay-opening-the-two-demo-runs = Ouverture des deux exécutions de démonstration…

studio-replay-the-skyplot-is-the-log = Le skyplot est le GSV propre au journal : un repère plein est un satellite avec une force de signal, un repère creux est énuméré sans en avoir, et un secteur ombré est une plage d'azimut où le journal énumère des satellites et n'en entend aucun. Un ciel obstrué et un signal brouillé s'y ressemblent. Ce n'est pas un horizon, et la constellation est nominale, et non une éphéméride pour la date du journal.

studio-replay-position-error-is-the-logged = L'« erreur de position » est la distance consignée entre la position vraie et la position rapportée ; l'anneau autour du navire est cette distance tracée à l'échelle. Le temps écoulé entre le début d'un événement et le premier score sous le nominal est une soustraction de deux instants consignés, et non une mesure de performance de détection.

studio-replay-the-vessel-glyph-points-along = Le pictogramme du navire pointe selon le cap gyroscopique (HDT), qu'aucun événement ne touche ; le contour en pointillés est l'endroit où le récepteur place le navire, selon la route qu'il rapporte. Un écart entre les deux est un point à relever au débriefing.

studio-replay-the-coast-is-natural-earth = La côte est la terre du domaine public de Natural Earth au 1:10 million, fournie avec cette page (rien n'est récupéré). Les positions des démonstrations sont inventées : la côte montre donc où tombent ces coordonnées inventées. Illustration seulement, jamais pour la navigation.

studio-ssv-space-user-gnss-scenarios = Scénarios GNSS pour utilisateurs spatiaux

studio-ssv-space-user-gnss = GNSS pour utilisateurs spatiaux

studio-ssv-which-navigation-signals-can-a = Quels signaux de navigation un engin spatial très au-dessus des satellites GNSS peut-il encore utiliser ?

studio-ssv-the-satellites-of-a-navigation = Les satellites d'un système de navigation pointent vers la Terre : un engin situé au-dessus d'eux n'entend donc que ce qui déborde du limbe ou fuit par les lobes secondaires. Cette page montre ce que le moteur trouve pour cinq cas : la disponibilité sur une coque à l'altitude géostationnaire, une orbite très elliptique, un transfert lunaire avec un récepteur à signal faible, un filtre embarqué et une formation de deux engins. Chaque nombre est copié d'un résultat enregistré par le moteur ; la page le met à l'échelle et le trace, et ne calcule rien d'autre.

studio-ssv-against-the-icg-booklet = Face au livret de l'ICG

studio-tools-leave-empty-to-check-integrity = laisser vide pour ne vérifier que l'intégrité

studio-tools-synthetic-osnma-example = Exemple OSNMA synthétique

studio-tools-trust-and-evidence-tools = Outils de confiance et de preuves

studio-tools-trust-evidence-and-test-tools = Outils de confiance, de preuves et d'essai

studio-tools-the-0-35-features-that = Les fonctions de la 0.35 qui s'exécutent dans votre navigateur, et où trouver celles qui ne le peuvent pas. Les fichiers que vous ouvrez ici sont lus dans cette page et jamais téléversés ; le moteur s'exécute sur votre ordinateur sous forme de WebAssembly.

studio-tools-maritime-trust = Confiance maritime

studio-tools-training-debrief = Débriefing de formation

studio-tools-the-engine-starts-when-you = Le moteur démarre quand vous utilisez un outil.

studio-tools-every-0-35-feature-and = Toutes les fonctions de la 0.35, et où elles se trouvent

studio-tools-in-this-browser-where-it = Dans ce navigateur là où elle peut s'exécuter. Les autres sont des fonctions de ligne de commande ou de serveur, et la raison est indiquée.

studio-tools-in-the-studio = Dans le Studio

studio-tools-verify-an-evidence-pack = Vérifier un paquet de preuves

studio-tools-open-the-synthetic-example-pack = Ouvrir le paquet d'exemple synthétique

studio-tools-open-it-with-one-byte = L'ouvrir avec un octet modifié

studio-tools-no-pack-files-chosen = Aucun fichier de paquet choisi.

studio-tools-verify-the-pack = Vérifier le paquet

studio-tools-attach-a-timestamp-token = Joindre un jeton d'horodatage

studio-tools-attach-to-the-chosen-pack = Joindre au paquet choisi

studio-tools-export-a-scenario-for-a = Exporter un scénario pour un simulateur de laboratoire

studio-tools-which-public-framework-rows-do = Pour quelles lignes de référentiels publics vos exécutions apportent-elles des éléments de preuve en faveur de ?

studio-tools-use-the-synthetic-example-runs = Utiliser les exécutions d'exemple synthétiques

studio-tools-show-the-mapping-tables = Afficher les tables de correspondance

studio-tools-show-the-sources-they-cite = Afficher les sources qu'elles citent

studio-tools-no-result-files-chosen = Aucun fichier de résultat choisi.

studio-tools-build-the-report = Construire le rapport

studio-tools-galileo-osnma-is-the-navigation = Galileo OSNMA : les données de navigation sont-elles authentifiées ?

studio-tools-load-it = Le charger

studio-tools-show-the-recorded-result = Afficher le résultat enregistré

studio-tools-imu-fit-sensor-parameters-for = Ajustement IMU : paramètres de capteur pour les scénarios hybrides et de fusion

studio-tools-fit-the-parameters = Ajuster les paramètres

studio-tools-jammertest-score-a-receiver-log = Jammertest : noter un journal de récepteur face au plan d'essai publié

studio-tools-import-the-schedule = Importer le calendrier

studio-tools-score-the-log = Noter le journal

studio-training-synthetic-library-scenarios = Scénarios synthétiques de la bibliothèque

studio-training-library-scenario-to-generate = Scénario de la bibliothèque à générer

studio-training-random-seed-optional = Graine aléatoire (facultatif)

studio-training-from-the-scenario = d'après le scénario

studio-training-time-cursor = Curseur temporel

studio-training-replay-speed = Vitesse de rejeu

studio-training-time-cursor-in-log-rows = Curseur temporel, en lignes de journal

studio-training-debrief-timeline-time-cursor = Chronologie du débriefing : curseur temporel

studio-training-what-did-the-crew-see = Que voyait l'équipage, et que se passait-il réellement ?

studio-training-open-a-log = Ouvrir un journal

studio-training-choose-an-instructor-log-or = Choisissez un journal d'instructeur, ou ouvrez l'un des cinq scénarios synthétiques de la bibliothèque écrits par la CLI.

studio-training-or-drop-it-here-or = ou déposez-le ici, ou ouvrez un scénario de la bibliothèque :

studio-training-generate-a-stream-here = Générer un flux ici

studio-training-run-the-engine-s-nmea = Exécutez le générateur de formation NMEA du moteur dans ce navigateur. Vous obtenez le flux NMEA 0183 synthétique pour l'exercice et le journal d'instructeur, et pouvez le débriefer immédiatement. Rien n'est téléversé ; la diffusion vers un simulateur de passerelle par TCP ou UDP est une fonction de ligne de commande (voir la page Outils).

studio-training-previous-moment = Instant précédent

studio-training-next-moment = Instant suivant

studio-training-true-track-against-reported = Route vraie face à la route rapportée

studio-training-north-up-one-scale-on = Nord en haut, une seule échelle sur les deux axes. La fine ligne grise est l'endroit où le navire se trouvait réellement. La ligne colorée est ce que le récepteur a rapporté, colorée selon son éloignement de la réalité. Là où le récepteur n'a rapporté aucune position, rien n'est tracé pour lui.

studio-training-events-and-what-the-receiver = Événements et ce que le récepteur a dit

studio-training-one-shared-time-axis-drag = Un axe temporel partagé. Faites glisser ou cliquez pour déplacer le curseur ; les touches fléchées le font avancer pas à pas. Les barres d'événement montrent l'intensité de chaque événement injecté au fil du temps.

studio-training-sky-at-the-cursor = Ciel au curseur

studio-training-the-satellites-the-stream-s = Les satellites qu'énumère le GSV propre au flux. Un repère plein a une force de signal ; un repère creux est énuméré sans en avoir ; un secteur ombré est un endroit où le flux énumère des satellites sans qu'aucun soit entendu. Constellation nominale, et non éphéméride pour la date du flux.

studio-training-at-the-cursor = Au curseur

studio-training-events-injected = Événements injectés

studio-training-as-the-instructor-log-states = Tels que les énonce le journal d'instructeur, avec chaque paramètre.

studio-training-debrief-timeline = Chronologie du débriefing

studio-training-choose-a-moment-to-move = Choisissez un instant pour y déplacer le curseur.

studio-training-the-satellite-sky-is-a = Le ciel des satellites est une constellation nominale, et non une éphéméride pour la date du flux.

studio-training-nothing-here-is-a-measure = Rien ici ne mesure la façon dont un récepteur ou un système se comporte face aux interférences.

studio-trust-session-settings-in-toml = Réglages de session en TOML

studio-trust-receiver-trust-session-settings-in = Réglages de session de confiance du récepteur en TOML

studio-trust-time-cursor-and-filters = Curseur temporel et filtres

studio-trust-time-cursor-in-epochs = Curseur temporel, en époques

studio-trust-score-timeline-time-cursor = Chronologie du score : curseur temporel

studio-trust-each-monitor-s-alarm-ratio = Taux d'alarme de chaque moniteur au fil du temps

studio-trust-about-this-view = À propos de cette vue

studio-trust-can-the-bridge-trust-this = La passerelle peut-elle se fier à cette position ?

studio-trust-open-a-run = Ouvrir une exécution

studio-trust-open-the-masked-sky-demo = Ouvrir la démo du ciel masqué (géométrie, 0.36)

studio-trust-score-an-nmea-log-here = Noter un journal NMEA ici

studio-trust-run-the-engine-in-this = Exécutez le moteur dans ce navigateur sur le journal NMEA 0183 d'un navire et voyez le résultat dans la vue ci-dessous. Le journal est lu dans cette page et jamais téléversé. Ce doit être un extrait d'au plus 2 Mio (environ 20 000 époques) contenant la fenêtre d'étalonnage de cinq minutes. Les réglages sont les limites du navire et les poids du score, comme dans un fichier de session.

studio-trust-score-the-synthetic-demo-log = Noter le journal de démonstration synthétique

studio-trust-session-settings-toml = Réglages de session (TOML)

studio-trust-starts-from-the-demo-s = Part des réglages de la démonstration : modifiez les limites de vitesse, d'accélération et de vitesse de giration du navire pour qu'elles correspondent aux vôtres. Un fichier de réglages pour votre propre navire peut être collé ici.

studio-trust-jammertest-scorecard = Fiche de notation Jammertest

studio-trust-no-scorecard-open = Aucune fiche de notation ouverte.

studio-trust-generic-receiver-trust-run-not = Exécution générique de confiance du récepteur (pas un navire)

studio-trust-run-the-illustrative-jamming-example = Exécuter l'exemple illustratif de brouillage

studio-trust-assess-the-chosen-file = Évaluer le fichier choisi

studio-trust-the-format-is-guessed-from = Le format est deviné d'après le nom du fichier ; changez-le ici s'il est faux, puis évaluez à nouveau. NovAtel OEM7, RTCM 3 et Septentrio SBF sont des formats binaires ; ils sont envoyés tels quels au moteur, dans ce navigateur.

studio-trust-imu-file-optional-a-second = Fichier IMU (facultatif) : un second capteur pour le cap

studio-trust-an-imu-log-on-the = Un journal IMU sur l'horloge du journal du récepteur fournit le cap que lit le moniteur cap contre route partout où le journal du récepteur n'en contient pas. Seule une session de navire l'utilise.

studio-trust-remove-the-imu-file = Retirer le fichier IMU

studio-trust-no-imu-file = Aucun fichier IMU.

studio-trust-session-settings-toml-the-log = Réglages de session (TOML, le journal est fourni en ligne)

studio-trust-first-deduction = Première déduction

studio-trust-first-untrusted = Première perte de confiance

studio-trust-receiver-reported-track = Trajectoire indiquée par le récepteur

studio-trust-the-satellites-the-log-s = Les satellites que liste le GSV du journal lui-même. Un repère plein a une puissance de signal ; un repère creux est listé sans aucune ; un secteur ombré est une zone où le journal liste des satellites sans en entendre aucun (un ciel obstrué et un signal brouillé s'y ressemblent). Constellation nominale, et non une éphéméride pour la date du journal.

studio-trust-score-over-time = Score au fil du temps

studio-trust-score-0-to-100-dashed = Score de 0 à 100. Les lignes en pointillés sont les bords des bandes ; les bandeaux en dessous sont la bande et la porte. Faites glisser ou cliquez pour déplacer le curseur temporel ; les touches fléchées le font avancer pas à pas.

studio-trust-reasons-at-the-cursor = Raisons au niveau du curseur

studio-trust-points-each-check-took-off = Points retirés par chaque vérification à cette époque, du plus grand au plus petit. Cliquez sur une vérification pour marquer où elle était au-dessus de son seuil de déclenchement.

studio-trust-geometry-at-the-cursor = Géométrie au niveau du curseur

studio-trust-the-satellite-geometry-always-shown = La géométrie des satellites, toujours affichée : son étiquette (bonne, moyenne ou mauvaise) et les DOP. Un ciel masqué (une coque, un quai, une paroi de fjord) est une dégradation naturelle, distincte d'une incohérence semblable à une attaque. Le score ne retire de points pour la géométrie que lorsqu'elle est mauvaise, au plus 15, et jamais en dessous de la bande dégradée.

studio-trust-the-receiver-s-own-flag = L'indicateur propre au récepteur

studio-trust-what-the-receiver-itself-says = Ce que le récepteur lui-même dit du leurrage et du brouillage (u-blox UBX-NAV-STATUS et UBX-SEC-SIG), placé à côté des moniteurs de Kshana. Les codes sont ceux du récepteur ; aucun des deux détecteurs n'est la vérité terrain, et leur accord n'est pas une validation. L'indicateur ne change aucun score.

studio-trust-over-the-run = Sur l'exécution

studio-trust-what-the-score-used = Ce qu'a utilisé le score

studio-trust-read-from-the-run-read = Lu à partir de l'exécution, en lecture seule.

studio-trust-what-this-view-does-and = Ce que cette vue montre et ne montre pas

studio-trust-nmea-only-checks-cannot-see = Les vérifications NMEA seules ne peuvent pas voir un leurre qui reproduit toute la constellation avec une position, une vitesse, un cap, une puissance et une horloge cohérentes entre elles, ni un rejeu de signaux réels enregistrés. Une position sans alarme n'est pas pour autant une bonne position.

studio-trust-nothing-on-this-page-is = Rien sur cette page ne mesure la performance des vérifications face à de réelles interférences. La correspondance du score et chaque poids sont fixés avant qu'un journal soit noté, sans apprentissage et sans rien ajuster sur des événements.

studio-main-which-satellites-can-you-see = Quels satellites voyez-vous depuis un lieu, et quelle est la qualité de leur géométrie ? Skyplot, horizon et DOP issus du moteur dans votre navigateur

studio-main-trainer-debrief-for-kshana-nmea = Débriefing de formation pour les journaux d'instructeur kshana nmea-scenario (formation uniquement ; les fichiers restent dans votre navigateur)

studio-main-where-did-aircraft-and-ships = Où des aéronefs et des navires ont-ils signalé des données de navigation dégradées un jour passé ? Ouvrez des fichiers de carte par jour (ils restent dans votre navigateur)

studio-main-can-the-bridge-trust-this = La passerelle peut-elle se fier à cette position ? Ouvrez une exécution receiver-trust de navire (les fichiers restent dans votre navigateur)

studio-main-evidence-packs-test-bench-export = Paquets de preuves, export test-bench, correspondance de compliance, OSNMA, outils en ligne de commande et assistant IA (les fichiers restent dans votre navigateur)

studio-main-map-of-satellites-in-view = Carte des satellites en vue au-dessus de la Terre, d'après l'exécution enregistrée

studio-main-interactive-3-d-view-of = Vue 3D interactive de la trajectoire propagée

studio-main-close-history = Fermer l'historique

studio-main-skip-to-the-content = Aller au contenu

studio-main-receiver-trust = Confiance du récepteur

studio-main-advanced-view = Vue avancée

studio-main-what-would-you-like-to = Que voulez-vous découvrir ?

studio-main-pick-a-question-or-start = Choisissez une question, ou partez du résultat ci-dessous.

studio-main-showing-below = Affiché ci-dessous

studio-main-integrity-over-12-hours = Intégrité sur 12 heures

studio-main-a-radio-waterfall = Une cascade radio

studio-main-recorded-result = Résultat enregistré

studio-main-how-many-navigation-satellites-can = Combien de satellites de navigation voyez-vous depuis n'importe quel point de la Terre ?

studio-main-loading-the-recorded-result = Chargement du résultat enregistré…

studio-main-everything-kshana-can-do = Tout ce que Kshana sait faire

studio-main-each-area-shows-a-real = Chaque domaine montre un résultat réel enregistré et la combinaison de preuves qui le soutient.

studio-main-open-your-own-files = Ouvrir vos propres fichiers

studio-main-pages-that-run-the-engine = Des pages qui exécutent le moteur avec vos propres réglages et fichiers. Chacune fonctionne dans ce navigateur ; rien n'est téléversé.

studio-main-which-satellites-can-you-see-2 = Quels satellites voyez-vous depuis un lieu, et quelle est la qualité de leur géométrie ? Dessinez l'horizon.

studio-main-what-accuracy-could-a-reference = Quelle précision une station de référence près du pôle Sud lunaire pourrait-elle donner, et où ? MODELLED.

studio-main-can-the-bridge-trust-this-2 = La passerelle peut-elle se fier à cette position ? Notez le journal NMEA d'un navire.

studio-main-where-aircraft-and-ships-reported = Où des aéronefs et des navires ont signalé des données de navigation dégradées, et l'exposition d'une route.

studio-main-generate-a-drift-or-jamming = Générer un flux d'exercice de dérive ou de brouillage et débriefer le journal d'instructeur.

studio-main-two-synthetic-runs-on-one = Deux exécutions synthétiques sur une même horloge : trajectoire, score de confiance, skyplot en direct et verdict.

studio-main-the-two-optical-atmosphere-scenarios = Les deux scénarios d'atmosphère optique : disponibilité face au plafond nuageux, interruptions et diversité de sites.

studio-main-which-navigation-signals-a-spacecraft = Quels signaux de navigation un engin spatial très au-dessus des satellites peut encore utiliser, et comment s'en tirent avec eux un filtre embarqué et une formation.

studio-main-what-lunar-orbiters-and-a = Ce que des orbiteurs lunaires et une station de surface peuvent apporter comme infrastructure de navigation et de géodésie, avec les échecs indiqués.

studio-main-open-a-day-s-observatory = Ouvrez les fichiers de l'observatoire d'un jour et lisez-les : trois états, aucune cause, rien de téléversé.

studio-main-pull-the-antenna-score-the = Débranchez l'antenne, notez le holdover : un enregistrement d'erreur de temps mesuré face aux gabarits de l'UIT-T.

studio-main-check-a-signed-pack-or = Vérifiez un paquet signé, ou joignez un horodatage.

studio-main-motion-and-event-files-for = Fichiers de mouvement et d'événements pour un simulateur de laboratoire.

studio-main-what-your-runs-evidence-against = Ce que vos exécutions attestent face aux cadres publiés.

studio-main-whether-recorded-galileo-data-is = Si les données Galileo enregistrées sont authentifiées, balise par balise.

studio-main-use-kshana-from-your-assistant = Utilisez Kshana depuis votre assistant via le serveur MCP.

studio-main-all-scenarios = Tous les scénarios

studio-main-pick-one-it-opens-on = Choisissez-en un : il s'ouvre aussitôt sur son résultat.

studio-main-all-questions = Toutes les questions

studio-main-every-published-figure = Chaque chiffre publié

studio-main-read-from-the-result-document = Lus dans le document de résultat, avec l'unité, la note et la provenance que le moteur enregistre pour chacun.

studio-main-kalman-self-consistency = Auto-cohérence du filtre de Kalman

studio-main-a-consistent-filter-s-reported = L'incertitude annoncée par un filtre cohérent correspond à ses erreurs réelles. Le NIS (carré normalisé de l'innovation) devrait se situer près de 1 et le NEES (carré normalisé de l'erreur d'estimation) près de 2, chacun dans sa bande χ² à 95 %.

studio-main-engine-chart = Graphique du moteur

studio-main-each-series-this-run-publishes = Chaque série que publie cette exécution, en fonction du temps. Survolez ou faites glisser le curseur sur le graphique pour lire les valeurs.

studio-main-carrier-to-noise-density-db = densité porteuse sur bruit, dB-Hz

studio-main-with-the-jammer = Avec le brouilleur

studio-main-without-it = Sans lui

studio-main-each-cell-is-one-satellite = Chaque cellule est un satellite à une époque de cette exécution. Les cellules hachurées sont sous le seuil de poursuite du récepteur : ce satellite est perdu.

studio-main-interference-outcome = Résultat de l'interférence

studio-main-error-since-gnss-was-lost = erreur depuis la perte du GNSS

studio-main-scenario-budget = Budget du scénario

studio-main-move-the-budget-and-the = Déplacez le budget et le temps avant dépassement est lu dans l'enregistrement d'erreur propre à cette exécution. Le chiffre de holdover du moteur, calculé au budget du scénario, est affiché à côté et fait foi. Changez l'horloge ou l'interruption dans les paramètres pour relancer la physique.

studio-main-maximum-time-interval-error = erreur maximale d'intervalle de temps

studio-main-time-deviation = déviation temporelle

studio-main-mask-checks-and-holdover-budgets = Vérifications des gabarits et budgets de holdover

studio-main-each-check-s-limit-is = La limite de chaque vérification est tracée sous forme d'anneau au temps de moyennage où la marge était la plus faible. Les gabarits sont transcrits des Recommandations de l'UIT-T (Union internationale des télécommunications, Secteur de la normalisation des télécommunications) nommées dans chaque ligne.

studio-main-lower-is-better-fractional-frequency = Plus bas, c'est mieux. Stabilité de fréquence fractionnaire en fonction du temps de moyennage τ, sur axes logarithmiques.

studio-main-earth-centred-inertial-frame = Référentiel inertiel géocentrique

studio-main-drag-to-rotate-scroll-to = Faites glisser pour pivoter, défilez pour zoomer.

studio-main-run-the-engine-once-per = Exécutez le moteur une fois par valeur et tracez un chiffre de mérite. Ajoutez un second paramètre pour une carte thermique. Chaque point est une exécution réelle du moteur, jusqu'à 60.

studio-main-pinned-runs-side-by-side = exécutions épinglées côte à côte

studio-main-clear-pins = Retirer les épingles

studio-main-key-figures-run-against-run = Chiffres clés, exécution contre exécution

studio-main-the-headline-readouts-of-each = Les principaux relevés de chaque exécution épinglée ; la variation est calculée par rapport à l'exécution A.

studio-main-the-engine-s-own-export = l'export propre du moteur

studio-main-written-by-the-engine = écrit par le moteur

studio-main-czml-kml-geojson-stk-ephemeris = CZML, KML, GeoJSON, éphéméride STK, SigMF

studio-main-try-other-settings = Essayer d'autres réglages

studio-main-change-a-value-then-run = Changez une valeur, puis relancez. La réponse et le graphique se mettent à jour sur place.

studio-main-run-again = Relancer

studio-main-cancel-the-run = Annuler l'exécution

studio-main-runs-in-your-browser-nothing = S'exécute dans votre navigateur. Rien n'est téléversé.

studio-main-advanced-settings = Réglages avancés

studio-main-every-setting-comes-from-the = Chaque réglage provient du fichier de scénario. Modifiez le fichier entier sous « Pour les chercheurs ».

studio-main-how-this-is-computed = Comment cela est calculé

studio-main-level-of-evidence = Niveau de preuve

studio-main-the-engine-s-own-one = Le résumé en une ligne propre au moteur

studio-main-every-figure-is-labelled-with = Chaque chiffre porte l'étiquette de son niveau de preuve. Validé signifie vérifié par rapport à une référence externe indépendante ; modélisé signifie une physique de premiers principes avec des tests, pas encore vérifiée par une référence.

studio-main-for-researchers = Pour les chercheurs

studio-main-code-data-citation = code, données, citation

studio-main-run-it-on-your-computer = L'exécuter sur votre ordinateur

studio-main-run-it-from-python = L'exécuter depuis Python

studio-main-exported-figures-carry-this-doi = Les figures exportées portent ce DOI (identifiant d'objet numérique) dans leur légende. Un même scénario, une même graine et une même version du moteur donnent les mêmes nombres.

studio-main-toml-tom-s-obvious-minimal = TOML (Tom's Obvious, Minimal Language)

studio-main-in-the-editor-tab-indents = Dans l'éditeur, Tab indente de deux espaces. Appuyez sur Échap, puis sur Tab, pour continuer. Relancez pour utiliser votre modification.

studio-main-every-panel-and-field = Chaque panneau et chaque champ

studio-main-the-advanced-view-is-the = La vue avancée est le tableau de bord complet : chaque panneau de cette exécution côte à côte, chaque champ du scénario, les balayages, les comparaisons et le rapport propre au moteur. Elle s'ouvre sur ce scénario, avec vos réglages.

studio-main-kshana-pro = Kshana Pro

studio-main-kshana-studio = Kshana Studio

studio-main-request-an-evaluation = Demander une évaluation

studio-main-talk-to-us-about-a = Parlez-nous d'une licence commerciale

studio-main-request-a-study = Demander une étude

studio-main-imagery-nasa-visible-earth-blue = Imagerie : NASA Visible Earth (Blue Marble). Côtes : Natural Earth. Chaque graphique ici est tracé à partir d'une exécution du moteur ; une exécution, un rapport, une animation ou un export produit par le moteur natif en ligne de commande est étiqueté comme enregistré.

studio-main-this-session = cette session

studio-main-runs-you-make-appear-here = Les exécutions que vous lancez apparaissent ici. Sélectionnez-en une pour retrouver son scénario et son résultat, ou épinglez-la pour comparer.

studio-advanced-find-a-scenario-a-domain = Trouver un scénario, un domaine, un champ ou une commande

studio-advanced-the-runs-you-made-in = Les exécutions que vous avez lancées dans cette session

studio-advanced-a-short-tour-of-the = Une courte visite du Studio

studio-advanced-toggle-colour-theme = Basculer entre le mode clair et le mode sombre

studio-advanced-switch-to-the-simple-view = Passer à la vue simple

studio-advanced-the-simple-view-the-answer = La vue simple : la réponse d'abord, cinq réglages, les détails à la demande

studio-advanced-scenario-library = Bibliothèque de scénarios

studio-advanced-close-the-library = Fermer la bibliothèque

studio-advanced-find-a-scenario-a-domain-2 = Trouver un scénario, un domaine ou un champ

studio-advanced-scenario-domain-or-field = Scénario, domaine ou champ

studio-advanced-filter-by-domain = Filtrer par domaine

studio-advanced-scenarios-by-mission-domain = Scénarios par domaine de mission

studio-advanced-how-the-studio-works = Comment fonctionne le Studio

studio-advanced-search-scenarios-domains-or-fields = Rechercher des scénarios, des domaines ou des champs

studio-advanced-search-scenarios-domains-or-fields-2 = Rechercher des scénarios, des domaines ou des champs, par exemple masque d'élévation

studio-advanced-the-engine-kind-this-scenario = Le type de moteur qu'exécute ce scénario

studio-advanced-open-the-scenario-library = Ouvrir la bibliothèque de scénarios

studio-advanced-show-the-parameters-and-the = Afficher les paramètres et la source du scénario

studio-advanced-keep-this-run-to-compare = Garder cette exécution pour la comparer à une autre (jusqu'à 4)

studio-advanced-compare-the-pinned-runs = Comparer les exécutions épinglées

studio-advanced-share-this-run-or-download = Partager cette exécution, ou la télécharger

studio-advanced-result-panels = Panneaux de résultat

studio-advanced-run-summary = Résumé de l'exécution

studio-advanced-parameters-and-scenario-source = Paramètres et source du scénario

studio-advanced-close-the-parameters-and-show = Fermer les paramètres et afficher les résultats

studio-advanced-find-a-field-of-this = Trouver un champ de ce scénario

studio-advanced-find-a-field-for-example = Trouver un champ, par exemple masque

studio-advanced-parameter-view = Vue des paramètres

studio-advanced-find-a-scenario-domain-field = Trouver un scénario, un domaine, un champ, un panneau ou une commande

studio-advanced-skip-to-results = Aller aux résultats

studio-advanced-find-anything = Tout trouver

studio-advanced-lunar-station-coverage-of-a = Station lunaire : couverture d'une station de référence (MODELLED)

studio-advanced-simple-view = Vue simple

studio-advanced-choose-a-scenario = Choisir un scénario

studio-advanced-what-do-you-want-to = Que voulez-vous faire ?

studio-advanced-pick-a-domain-and-a = Choisissez un domaine et un scénario, réglez-le, exécutez le moteur dans votre navigateur, puis lisez, comparez et exportez les résultats. Rien n'est téléversé.

studio-advanced-share-or-export = Partager ou exporter

studio-advanced-good-first-runs = Bonnes premières exécutions

studio-advanced-pin-run = Épingler l'exécution

studio-advanced-report-json-scenario-tables-and = rapport, JSON, scénario, tableaux et exports

studio-advanced-the-exact-scenario-in-the = le scénario exact, dans le lien

studio-advanced-an-iframe-for-a-course = un iframe pour une page de cours ou un wiki

studio-advanced-opens-in-a-new-tab = s'ouvre dans un nouvel onglet

studio-advanced-loading-the-engine-the-recorded = Chargement du moteur. Le résultat enregistré de ce scénario s'affiche en premier.

studio-advanced-got-it = Compris

studio-advanced-headline-numbers-from-the-engine = Les principaux chiffres du résultat du moteur, avec la variation depuis votre exécution précédente de ce scénario, et une réussite ou un échec lorsque l'exécution indique un seuil.

studio-advanced-set-parameters = Régler les paramètres

studio-advanced-every-change-re-runs-the = Chaque modification relance le moteur et met à jour les chiffres clés et les panneaux.

studio-advanced-drag-a-slider-and-the = Faites glisser un curseur et le scénario est relancé. Chaque commande écrit directement dans le texte du scénario ci-dessous.

studio-advanced-in-the-editor-tab-indents = Dans l'éditeur, Tab indente de deux espaces. Appuyez sur Échap, puis sur Tab, pour continuer.

studio-mission-thread-time-axis = Axe du temps

studio-mission-thread-mission-thread = Fil de mission

studio-mission-thread-where-does-a-mission-s = Où le budget d'erreur de navigation et de synchronisation d'une mission s'épuise-t-il ?

studio-mission-thread-a-mission-is-a-chain = Une mission est une chaîne de phases : lancement, rendez-vous, transfert vers la Lune, atterrissage, retour. Chaque phase a ses propres capteurs et son propre budget d'erreur, et chacune transmet son incertitude à la suivante. Cette page montre le budget de toute la chaîne, phase par phase, et nomme le maillon le plus faible.

studio-mission-thread-open-the-artemis-class-example = Ouvrir l'exemple de classe Artemis

studio-mission-thread-open-a-result-file = Ouvrir un fichier de résultat…

studio-mission-thread-the-thread = Le fil

studio-mission-thread-error-against-mission-elapsed-time = Erreur en fonction du temps écoulé de la mission

studio-mission-thread-the-phases = Les phases

studio-mission-thread-the-budget-of-one-phase = Le budget d'une phase
