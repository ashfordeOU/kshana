# docs--compliance-dhs-rpcf: translations (fr)

# attr:aria-label, text
seg-d01db1c2710a = Référence

# text
seg-fdbb9db68f1d = aucun

# text
# c1: docs/compliance/dhs-rpcf.md
seg-dbec6a166e56 = Source : <c1/>

# text
seg-6e9b601864df = US DHS Resilient PNT Conformance Framework : ce en faveur de quoi Kshana apporte des éléments de preuve

# text
seg-cef4181edf29 = Le cadre décrit des niveaux de résilience de { "0" } à { "4" } construits à partir de huit exigences numérotées, et une approche d'évaluation qui combine l'analyse statique et l'analyse dynamique, dans laquelle des vecteurs d'essai tiennent lieu de menaces. Il n'a pas de schéma d'identifiants d'exigences qui lui soit propre ; les références ci-dessous sont donc ses numéros de niveau et d'exigence et ses numéros de section. Il est fondé sur les résultats et ne catalogue pas les menaces.

# text
# c1: kshana compliance-report
seg-ff0e00610721 = Chaque ligne indique quelles sorties de Kshana <b>apportent des éléments de preuve en faveur de</b> l'exigence et ce qui reste. Rien ici ne dit qu'un cadre est satisfait ni qu'un produit a été évalué ou approuvé par qui que ce soit. Exécutez <c1/> sur vos propres fichiers de résultats pour voir quelles lignes vos exécutions étayent réellement ; voir <a1>README.md</a1>.

# text
seg-30c8cabb6e90 = Documents sources

# text
seg-2261e4292865 = <b>Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework</b> : version { "2.0" }, { "26" } avril { "2022" } (DHS Science and Technology Directorate, avec la CISA). <a1>https://www.dhs.gov/sites/default/files/2022-05/22_0531_st_resilient_pnt_conformance_framework_v2.0.pdf</a1>. Lu le 2026-10-09 : document lu en entier ; la page d'accueil de la publication n'a pas été consultée.

# text
seg-955191e0baab = Correspondance

# text
seg-6ba8f74126ee = Ce qu'il demande (paraphrasé)

# text
seg-0438151025da = Sorties de Kshana qui apportent des éléments de preuve en sa faveur

# text
seg-3f265e18f56c = Écart

# text
seg-4263435e702a = Section { "5.2" } (Prevent, Respond, Recover)

# text
seg-e7b721f6e216 = La résilience est décrite comme trois fonctions : prévenir le dommage, répondre (détecter, signaler, atténuer, contenir) et rétablir. La détection est probabiliste, de sorte que les fausses alarmes et les détections manquées comptent toutes deux.

# text
seg-3447d3b53fe8 = Évaluation de la confiance d'un journal de récepteur ; détection du leurrage et du meaconing ; holdover et marche à l'inertie

# text
seg-ab055a50e16e = La prévention est une propriété de conception du produit qu'aucune sortie de simulation ne montre. Les statistiques de détection d'une exécution synthétique ou d'une seule session ne sont pas un taux mesuré de fausses alarmes ou de détections manquées pour un produit déployé.

# text
seg-501badd6a436 = Niveau { "1" }, exigence { "1" }

# text
seg-e8cfbe121084 = Vérifier que les données stockées provenant de sources externes correspondent aux formats et aux plages de valeurs des normes pertinentes.

# text
seg-7d7196aefa05 = Une propriété d'assurance logicielle et de validation des entrées du produit testé. Kshana n'inspecte pas la gestion des entrées d'un produit.

# text
seg-6085030de980 = Niveau { "1" }, exigence { "2" }

# text
seg-e8cd6fb732ad = Permettre une récupération manuelle complète en effaçant ou en réinitialisant la mémoire, ce qui ramène le système à la performance définie une fois la menace disparue.

# text
seg-8d216d42c776 = Évaluation de la confiance d'un journal de récepteur

# text
seg-e3ca721d9d2e = Un journal de récepteur montre quand une position est devenue non fiable et quand elle s'est rétablie ; il ne montre pas qu'une réinitialisation manuelle efface tous les états stockés.

# text
seg-2c78c15cea96 = Niveau { "1" }, exigence { "3" }

# text
seg-ab9458f8b8fc = Recharger ou mettre à jour le micrologiciel de façon sécurisée.

# text
seg-3a50eceb47f5 = La sécurité de la mise à jour du micrologiciel est hors de ce qu'observe toute sortie de Kshana.

# text
seg-752a194674f6 = Niveau { "2" }, exigence { "4" }

# text
seg-a5f263a083c7 = Identifier les sources PNT compromises et les empêcher de corrompre la solution.

# text
seg-4e7034acccc0 = Détection du leurrage et du meaconing ; évaluation de la confiance d'un journal de récepteur ; surveillance de l'intégrité et niveaux de protection

# text
seg-d5fdef2a78f2 = Kshana note des détecteurs et des moniteurs qu'il modélise ou exécute sur un journal ; pour savoir si l'exclusion de sources propre à un produit fonctionne, il faut l'état interne du produit, et pas seulement son journal.

# text
seg-e3ea1208fac9 = Niveau { "2" }, exigence { "5" }

# text
seg-c0219254fe8e = Rétablir automatiquement les sources et le système sans interrompre la sortie ; une solution est encore fournie pendant la menace, avec une dégradation éventuellement non bornée.

# text
seg-3dd48cb65cb4 = Holdover et marche à l'inertie ; évaluation de la confiance d'un journal de récepteur

# text
seg-0c36c4a3eb4e = Les exécutions de holdover bornent une dérive modélisée pour un modèle d'horloge ou inertiel donné, et non le comportement de rétablissement propre au produit.

# text
seg-befbf4b94876 = Niveau { "3" }, exigence { "6" }

# text
seg-45410d1675be = Des données corrompues provenant d'une source ne doivent pas contaminer une autre source.

# text
seg-ff808ce8ec48 = Sources PNT alternatives et diversifiées

# text
seg-ccf628643110 = Kshana exécute des sources côte à côte ; l'isolation des sources à l'intérieur d'un produit exige une revue de conception ou une injection de fautes dans le produit.

# text
seg-a1d5a3125697 = Niveau { "3" }, exigence { "7" }

# text
seg-db149ea618dd = Recouper les solutions de toutes les sources et maintenir la dégradation bornée pendant une menace.

# text
seg-4afa05ef42fa = Surveillance de l'intégrité et niveaux de protection ; holdover et marche à l'inertie ; sources PNT alternatives et diversifiées

# text
seg-8b1f938c0175 = Une dégradation bornée est montrée pour les capteurs modélisés ; le recoupement propre au produit n'est pas observé.

# text
seg-772244881e5b = Niveau { "4" }, exigence { "8" }

# text
seg-aff5161e6363 = Utiliser des sources de technologies différentes contre les menaces de mode commun, sans dégradation pendant la menace.

# text
seg-587889f9881c = Sources PNT alternatives et diversifiées ; effets du bilan de liaison de brouillage

# text
seg-65b96caf8d6b = Un argument de mode commun exige l'ensemble de sources du produit réel et une menace qui les couvre ; un scénario en énonce une, il ne prouve pas que le produit n'a pas de faiblesse partagée.

# text
seg-3c4cc0793454 = Section { "5.5" } (mode commun)

# text
seg-a87c9808dd99 = Des mécanismes diversifiés ne doivent pas partager une faiblesse : par exemple, un brouilleur qui couvre deux bandes met en échec la diversité de bandes.

# text
seg-c10ba3bb01be = Effets du bilan de liaison de brouillage ; notation de la résilience sur des ensembles de menaces ; sources PNT alternatives et diversifiées

# text
seg-843fe2fc9e33 = La notation utilise un ensemble de menaces synthétique, énoncé comme tel ; ce ne sont pas des données de terrain.

# text
seg-3158e7efd1a5 = Sections { "8.1" } à { "8.3" } (évaluation)

# text
seg-3942d9cdc64b = L'évaluation combine l'analyse statique et l'analyse dynamique, où des vecteurs d'essai tiennent lieu de menaces ; les classes d'essai sont la défaillance de source, l'interférence et les pannes internes. Les simulateurs sont nommés comme méthode d'essai.

# text
seg-9d5c297c1ab9 = Évaluation de la confiance d'un journal de récepteur ; effets du bilan de liaison de brouillage ; détection du leurrage et du meaconing

# text
seg-bb02568e8f8f = Le mouvement et les événements exportés peuvent piloter un simulateur de laboratoire (docs/TEST-BENCH.md). Kshana n'écrit aucun signal ; le simulateur et son opérateur autorisé fournissent donc la menace.

# text
seg-b81625e9e071 = Section { "8.6" } (éléments d'un plan d'essai)

# text
seg-27d645a79672 = Un plan d'essai indique le niveau, l'exigence, les entrées, les références, l'accès aux données nécessaire, la procédure avec critères de réussite ou d'échec, les résultats et les notes.

# text
seg-1f2898855ccc = Provenance d'exécution reproductible ; évaluation de la confiance d'un journal de récepteur

# text
seg-d8b08da48cb2 = Les critères de réussite ou d'échec sont choisis par l'évaluateur ; Kshana consigne les entrées, les seuils et les hachages avec lesquels il a travaillé.

# text
seg-ccfdf53a1e54 = <s1>Précédent</s1>Compliance mapping

# text
seg-260ba950eb89 = <s1>Suivant</s1>Orientations de l'OMI pour les navires
