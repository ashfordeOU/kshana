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
