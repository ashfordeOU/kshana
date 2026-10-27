# docs--compliance-mapping: translations (fr)

# attr:aria-label, text
seg-6555ff9a6d8e = Sortie

# text
seg-2247a2344710 = Signification

# text
seg-d6476863f862 = Capacité

# text
seg-ad856ad710eb = État

# text
seg-8d216d42c776 = Évaluation de la confiance d'un journal de récepteur

# text
seg-ff808ce8ec48 = Sources PNT alternatives et diversifiées

# text
seg-3621a68a508c = Provenance d'exécution reproductible

# text
seg-50fe2a3ff712 = Surveillance de l'intégrité et niveaux de protection

# text
# c1: docs/compliance/README.md
seg-554a16dc7965 = Source : <c1/>

# text
# c1: kshana compliance-report
seg-76db63e8d2de = Les acheteurs et les fabricants de récepteurs doivent répondre à des cadres publics de résilience. Ce dossier met en correspondance ce que Kshana calcule et consigne avec ces cadres, ligne par ligne, et <c1/> remplit la correspondance à partir des exécutions dont vous disposez réellement.

# text
seg-e22a3aca9550 = <b>Formulation.</b> Les sorties de Kshana <em>apportent des éléments de preuve en faveur d'</em>une exigence. Elles ne constituent ni une évaluation ni une approbation d'un produit, et aucun de ces fichiers n'est une déclaration d'un organisme d'évaluation ; Kshana n'en est pas un. Le texte des exigences est paraphrasé, jamais reproduit.

# text
seg-2602c3f5aff6 = Cadre

# text
seg-245fe1f87b08 = Fichier

# text
seg-d104ce416298 = US DHS Resilient PNT Conformance Framework, v2.0

# text
seg-0f7279ffb619 = Orientations de l'OMI sur les interférences GNSS pour les navires

# text
seg-f318176b86de = Orientations de l'EASA sur les interférences GNSS pour l'aviation

# text
seg-7939ac1eea3b = Directive NIS2 de l'UE, article { "21" }

# text
seg-f2eccc9b815f = EN { "16803" } (norme payante ; par partie et par numéros d'articles visibles dans le catalogue seulement)

# text
seg-4970f6c15605 = NIST IR 8323r1, Foundational PNT Profile (janvier { "2023" })

# text
# c1: kshana standards-pack list
seg-499fc17fb83a = Les <b>paquets de normes</b> ({ "0.38" }) transforment un cadre en scénarios notés : chaque paquet comprend des scénarios, des seuils fixés avant l'exécution et les lignes en faveur desquelles il apporte des éléments de preuve. <c1/> les affiche.

# text
seg-9c0eb89a2fbe = Paquet

# text
seg-191baf9f2738 = DHS Resilient PNT Conformance Framework, profils d'essai pour les niveaux { "1" } à { "4" }

# text
seg-13e63b993f26 = IMO MSC.1/Circ.1575, traitement des données PNT de bord : niveaux de précision et intégrité

# text
seg-aa77ffe0acbf = OACI Doc { "9849" } annexe F, surveiller, évaluer et atténuer les interférences GNSS

# text
seg-b9387be0e4f1 = Chaque fichier énumère ses documents sources avec la version, l'URL, la date de lecture et ce qui a été vérifié ou non. Les sources ont été lues le 2026-10-09 (le profil du NIST le 2026-10-18 ; le bulletin de l'EASA et les pages du catalogue de l'EN { "16803" } ont été revérifiés le 2026-10-10). Lorsqu'une source n'a pu être lue que par un miroir ou une page de catalogue, le fichier le dit.

# attr:alt
seg-e98e25897176 = Chaque essai des trois paquets de normes notés, issu d'exécutions réelles du moteur v{ $version } (`kshana standards-pack run`) : dhs-rpcf : { "6" } atteints, { "1" } non atteint, { "2" } nécessitent une entrée ; imo-circ-1575 : { "1" } atteint, { "4" } non atteints, { "2" } nécessitent une entrée ; icao-doc9849-appf : { "6" } atteints, { "0" } non atteint, { "2" } nécessitent une entrée. Au total, { "13" } atteints, { "5" } non atteints et { "6" } nécessitent une entrée que le moteur n'a pas (un journal de récepteur ou la documentation d'un équipement). Chaque seuil a été fixé avant l'exécution ; un échec est conservé comme un échec. Un seuil atteint signifie qu'un scénario modélisé a atteint un seuil donné, et ne dit rien d'un produit. Les paquets apportent des éléments de preuve en faveur des lignes qu'ils citent ; ils ne constituent pas une évaluation. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine ; il ne doit pas constituer l'unique fondement d'une décision de navigation ou de sécurité.

# text
seg-092dd691ca17 = Le rapport

# text
# c1: compliance-report.compliance.md
# c2: compliance-report.compliance.json
# c3: --out <base>
# c4: <name>.result.json
# c5: <name>.toml
# c6: kshana receiver-trust
# c7: kind
# c8: kind
# c9: scenario_hash
seg-10fac3e641e0 = écrit <c1/> et <c2/> (<c3/> change le nom). Les entrées sont des fichiers de résultats d'exécutions antérieures : l'exécution d'un scénario écrit <c4/> à côté de <c5/>, et <c6/> écrit le sien. Le type de scénario de chaque exécution est lu dans le fichier de scénario voisin du résultat, dans le contenu d'un résultat receiver-trust, ou dans un <c7/> de premier niveau, et doit être un type de scénario que le moteur connaît. Un résultat est signalé comme non utilisé, avec la raison, et ne compte pour rien lorsque son type de scénario est introuvable, n'est pas un type de scénario connu, ou lorsque le scénario voisin et le <c8/> propre au résultat ne concordent pas. (Le <c9/> du résultat et un hachage du fichier de scénario ne sont pas comparés : le moteur calcule le premier sur son scénario analysé et un hachage de fichier porte sur le texte, ce sont donc des grandeurs différentes.)

# text
# c1: jamming
# c2: integrity
# c3: src/compliance/mapping.rs
# c4: KIND_FIELDS
seg-464351dcdcc3 = <b>Une étiquette de type de scénario seule n'est pas une preuve.</b> Une exécution ne compte pour une capacité que lorsque son résultat porte aussi les champs qu'écrit ce type de scénario (par exemple un résultat <c1/> a besoin de ses figures de mérite et de ses lignes par époque ; un résultat <c2/> a besoin de ses décomptes d'échantillons). Les champs sont énumérés dans <c3/> (<c4/>), et un résultat auquel il en manque un n'est pas compté. Un hachage qui n'est pas hexadécimal n'est pas signalé comme un hachage. Un résultat receiver-trust dont les décomptes ne sont pas des nombres entiers, ou dont le décompte détecté ou concordant dépasse son décompte évaluable, est exclu et signalé comme non utilisé.

# text
seg-5a316d97f37b = Pour chaque ligne, le rapport donne l'une des mentions suivantes :

# text
seg-2243532bd26b = chaque capacité que nomme la ligne a au moins une exécution dans l'ensemble

# text
seg-e905ae20cec1 = certaines en ont

# text
seg-e23d6dfc4a00 = aucune n'en a

# text
seg-cf223ce076ce = aucune sortie de Kshana ne répond à la ligne

# text
# c1: --mapping
# c2: --sources
seg-ec76997fb4d4 = La colonne d'écart est affichée pour chaque ligne, y compris celles étayées : une exécution qui apporte des éléments de preuve en faveur d'une capacité laisse quand même l'essentiel d'une exigence à d'autres éléments de preuve. Le rapport répète la règle de formulation en tête. <c1/> affiche les tableaux statiques et <c2/> la liste des sources.

# text
seg-f1c508a908ad = Les exécutions receiver-trust apportent aussi les décomptes qu'elles indiquent (événements détectés parmi ceux évaluables, prédictions concordantes parmi celles évaluables). Ceux-ci décrivent ce journal, noté par rapport à des événements et à des tolérances fixés avant l'exécution, et sont rapportés tels que l'exécution les indique.

# text
seg-662b717575e0 = Types de scénario des exécutions

# text
seg-4377e24c36f5 = état de confiance par époque du propre journal d'un récepteur réel, instants d'alarme, et concordance avec des événements fixés avant l'exécution

# text
seg-766182e85848 = Effets du bilan de liaison de brouillage

# text
seg-6bee09017be6 = densité porteuse sur bruit et état d'accrochage par satellite sous une géométrie de brouilleur donnée

# text
seg-213117f2877a = jamming, lunar-jamming, conflict-resilience

# text
seg-48fb757a45fc = Détection du leurrage et du meaconing

# text
seg-2e4a3355a936 = décisions du détecteur et discrimination du détecteur sous une attaque de leurrage donnée

# text
seg-6fdf939cef5c = spoof, spoof-detect, impairment-eval

# text
seg-e9a55e5a015b = niveaux de protection, disponibilité par rapport aux limites d'alerte, et résultats de détection de pannes

# text
seg-8799ac418ef0 = integrity, araim-reference-check, lunar-integrity

# text
seg-6344bf03463c = Holdover et marche à l'inertie

# text
seg-a643345646c3 = croissance de l'erreur de position ou de temps lorsque le GNSS est refusé, par rapport à un seuil donné

# text
seg-7483fbb49a12 = clock, inertial, gnss-ins, ins-trn-coast, hybrid, hybrid-ukf, fusion, timetransfer, quantum-gnss-free-nav, quantum-time-transfer

# text
seg-97e06c8a9b7f = performance de navigation ou de synchronisation temporelle à partir de sources indépendantes de la bande GNSS principale

# text
seg-0cb972a92a4c = combined-altpnt, terrain-nav, terrain-slam, gravity-map, leo-pass, leo-pvt, leo-pnt-chain, hybrid-optical-rf, ntn-positioning, hybrid, fusion

# text
seg-25291db2798d = Notation de la résilience sur des ensembles de menaces

# text
seg-9eef8dd0d9b9 = rapports de survie et de résilience par vecteur de menace sur un ensemble donné, avec les hypothèses énoncées

# text
seg-bdaa039247bd = conflict-resilience, campaign

# text
seg-e4be26a0cc63 = hachage du scénario, version du moteur et graine portés dans chaque résultat afin qu'une exécution puisse être répétée

# text
# c1: scenario_hash
seg-89edc36c3560 = toute exécution dont le résultat porte un <c1/>

# text
seg-488aeabdc552 = <s1>Précédent</s1>Faire tourner un récepteur sur un scénario

# text
seg-53a872636d5a = <s1>Suivant</s1>Cadre PNT résilient du DHS américain
