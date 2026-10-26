# docs--kind-spectrum: translations (fr)

# text
seg-37d16b499bc5 = dB

# text
seg-59afd80736c5 = <b>PARTNER</b> Non fourni — Kshana modélise la performance du signal, et non le matériel de charge utile ou d'antenne. Référence indépendante (NoneKind) : aucune : une discipline propre au partenaire, sans module ni test par conception

# text
seg-cb91473bfdda = Page thématique : <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-a3697ad561db = Hz

# text
seg-304496607bd7 = Type de scénario du moteur v{ $version }, famille <a1>Brouillage, leurrage et spectre</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-5d23d7f8f872 = Page de famille : <a1>Brouillage, leurrage et spectre</a1>

# text
seg-f85a85f0c7e4 = MHz

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-3319b18ac61f = et { "1" } autre dans la matrice.

# text
# c1: spectrum
seg-9ca82c79430e = <b>MODELLED</b> Le type de scénario <c1/> étendu au-delà de la bande L : bandes données sous forme de conception de signal préréglée (tracée avec chaque composante, limitée en bande à la largeur de bande d'émission, C/N0 et J/S rapportés à la composante suivie) ou sous forme de porteuse et de modulation personnalisées Tests : <a1>leo_signal_reference.rs</a1>.

# text
# c1: docs/kinds/by-kind/spectrum.md
seg-ab8fe1c3cb79 = Source : <c1/>

# text
# c1: spectrum
seg-10a4479141b5 = <c1/> (type de scénario)

# text
seg-fef00c827c6a = Modèle de spectre en bande L et cascade : toute la bande L du GNSS comme une seule densité spectrale de puissance (DSP), fréquence en abscisse, temps vers le bas, sur une chronologie de brouilleurs scriptée. SIGNAUX : GPS L1 C/A et L2C (BPSK({ "1" })), service ouvert Galileo E1 (MBOC(6,1,1/11), ou BOC({ "1,1" })), GPS L5 et Galileo E5a (BPSK({ "10" })), chacun à sa porteuse avec la puissance reçue minimale de la spécification d'interface (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD) sauf indication contraire ; GLONASS, BeiDou et Galileo E6 ne sont pas modélisés. BROUILLEURS : onde continue, bruit à bande étroite plat, chirp en dents de scie linéaire et bruit à large bande adapté à la modulation propre d'une bande, chacun avec un centre, une largeur de bande, une puissance reçue (directe, ou PIRE et portée via l'affaiblissement en espace libre du type de brouillage) et des instants d'activation et de désactivation. Chaque brouilleur est évalué par rapport à chaque bande par son coefficient de séparation spectrale kappa sur la largeur de bande du récepteur, et (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1 ; pour un seul brouilleur, cela équivaut à l'équation anti-brouillage du type de brouillage avec Q = 1/(R_c kappa), et le rapport comporte cette vérification croisée (ainsi que, à côté, la valeur de Q représentative du type de brouillage). Le plancher de bruit est k T_sys avec T_sys = T_ant + { "290" } K (F - { "1" }). La cascade moyenne chaque cellule sur son intervalle de fréquence et sa ligne (chirps de façon exacte, balayages entiers plus le balayage partiel ; brouilleurs commutant en milieu de ligne selon leur rapport cyclique), de sorte que la chronologie du C/N0 et l'image proviennent des mêmes nombres ; result.json porte la grille moyennée par blocs en puissance, le C/N0 et le J/S par bande et par ligne, et, par brouilleur et par bande, le SSC, le Q, le J/S, le J/S dans la bande et le C/N0 stable. [iq] facultatif : le modèle tiré comme un IQ complexe à un instant donné, écrit dans un enregistrement SigMF puis relu depuis celui-ci (cf32_le ou ci16_le), et comparé à une estimation de Welch. [recording] facultatif (versions natives) : la DSP de Welch d'un vrai enregistrement SigMF à côté du modèle. VALIDATED : les DSP des signaux par rapport aux largeurs de lobe principal des manuels (BPSK(n) 2n x { "1.023" } MHz de nul à nul ; lobes de BOC({ "1,1" }) centrés à +/-1.023 MHz) et les coefficients de séparation spectrale par rapport à leurs formes fermées de Parseval et à Q = { "1" } (CW) et { "1.5" } (adapté) de Kaplan & Hegarty. MODELLED : les puissances des brouilleurs, la chronologie, les largeurs de bande des étages d'entrée, le traitement à spectre continu (sans raies de code) et l'absence de CAG, de suppression d'impulsions et de diagramme d'antenne.

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-92f1d6d2c0f2 = Une exécution de <c1/> se résume ainsi : scénario spectrum | { "5" } bandes | { "3" } brouilleurs | plancher de bruit -202.0 dBW/Hz | pire bande gps-l1ca C/N0 min { "3.2" } dB-Hz (J/S { "60.2" } dB)

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: receiver
# c5: grid
# c6: bands
# c7: jammers
# c8: iq
# c9: recording
seg-ed3a383d6f1e = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-fb332c77fd0e = L'exemple <c1/> définit, entre autres :

# text
seg-df78607f9cdb = Libellé du résultat (celui du moteur) : MODELLED : une densité spectrale de puissance en bande L construite à partir de spectres de signaux en forme fermée (VALIDATED par rapport aux largeurs de lobe principal des manuels et aux coefficients de séparation spectrale), de spectres de brouilleurs et d'un plancher de bruit kT, réduite en J/S et en C/N0 effectif par le coefficient de séparation spectrale. Les puissances des brouilleurs, t

# attr:alt
seg-ea1678eb9e84 = Le graphique que le moteur écrit pour scenarios/l-band-waterfall-jamming.toml, type spectrum

# text
seg-ce0afea7b030 = <b>VALIDATED</b> Densités spectrales de puissance d'aire unitaire de GPS L1 C/A et L2C (BPSK({ "1" })), GPS L5 et Galileo E5a (BPSK({ "10" })), sine-BOC({ "1,1" }) et Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, avec une variante MBOC ajoutée), leurs nuls localisés numériquement et

# text
# c1: spectrum
seg-7e315c5675d0 = <b>MODELLED</b> Le type <c1/> : une grille fréquence par temps de la densité spectrale de puissance en bande L (plancher thermique k T_sys avec T_sys = T_ant + { "290" } K (F - { "1" }), les signaux à leurs puissances reçues minimales de la spécification d'interface, et onde continue, à bande étroite

# text
seg-7871f9f54ef4 = <b>VALIDATED</b> sigmf : lecture et écriture d'enregistrements au format Signal Metadata Format (JSON .sigmf-meta avec les champs globaux, captures et annotations du noyau ; .sigmf-data brut en cf32_le, ci16_le ou ci8, les décodeurs d'entiers partagés avec realdata::iqif::load_iq), tous sur s

# text
seg-4e35cc861b15 = <b>VALIDATED</b> Densités spectrales de puissance d'aire unitaire de GPS L1 C/A et L2C (BPSK({ "1" })), GPS L5 et Galileo E5a (BPSK({ "10" })), sine-BOC({ "1,1" }) et Galileo E1 MBOC(6,1,1/11) (navsignal::M. Référence indépendante (ExternalDataset) : valeurs publiées dans les manuels : le lobe principal de BPSK(n) de 2n x { "1.023" } MHz de nul à nul et les coefficients anti-brouillage Q = { "1" } pour un brouilleur à bande étroite (CW) et Q = { "1.5" } pour un brouilleur à étalement de spectre adapté au C/A (Kaplan & Hegarty, Understanding GPS/GNSS, 3e éd., section { "9.4" }) ; les lobes principaux de BOC(m,n) centrés à plus ou moins m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }) ; le

# text
# c1: spectrum
# c2: jamming
seg-287de49e90a8 = <b>MODELLED</b> Le type <c1/> : une grille fréquence par temps de la densité spectrale de puissance en bande L (plancher thermique k T_sys avec T_sys = T_ant + { "290" } K (F - { "1" }), les signaux à. Référence indépendante (InternalConsistency) : réduction à l'équation anti-brouillage et au bilan de liaison du type <c2/> existant (le même code, appelé sur les mêmes entrées), et forme fermée du plancher de bruit k T0 F. Les spectres de signaux sous-jacents sont la ligne validée ci-dessus ; les puissances des brouilleurs, la chronologie et les largeurs de bande des étages d'entrée sont des entrées du scénario, les spectres sont continus (sans raies de code d'étalement), et aucune commande automatique de gain, suppression d'impulsions ou diagramme d'antenne n'agit sur le j

# text
seg-4eca77cc59c4 = <b>VALIDATED</b> sigmf : lecture et écriture d'enregistrements au format Signal Metadata Format (JSON .sigmf-meta avec les champs globaux, captures et annotations du noyau ; .sigmf-data brut en cf32_le, ci1. Référence indépendante (ExternalDataset) : scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) avec la même fenêtre de Hann périodique, le même recouvrement, la même mise à l'échelle en densité, sans retrait de tendance et avec une moyenne bilatérale : chaque intervalle de fréquence à moins de { "1e-12" } en relatif (observé { "6.0e-14" }) sur { "27" } cas, avec des nombres de segments tirés du propre spectrogramme de scipy. sigmf-python { "1.13.0" } (LGPL-3.0, exécuté comme outil) écrit cinq enregistrements tiers (cf32_le, ci16_le, ci8, deux captures avec annotations, un fir non nul

# text
# c1: not_modelled[0]
seg-0cbbe567f1c8 = structure en raies du code d'étalement (par exemple les raies de { "1" } kHz du C/A) : les tonalités sont évaluées par rapport à l'enveloppe lissée (résultat <c1/>)

# text
# c1: not_modelled[1]
seg-2efdae3f5764 = commande automatique de gain, quantification, suppression d'impulsions et filtrage réjecteur (résultat <c1/>)

# text
# c1: not_modelled[2]
seg-f3e58705c9a2 = le diagramme de l'antenne de réception en direction du brouilleur au-delà d'une seule valeur de gain (résultat <c1/>)

# text
# c1: not_modelled[3]
seg-c0d379cb1ab3 = l'interférence d'accès multiple intra-système entre satellites d'une même bande (résultat <c1/>)

# text
# c1: not_modelled[4]
seg-83f414112e45 = GLONASS G1/G2, BeiDou B1/B2 et Galileo E6 (résultat <c1/>)

# text
# c1: not_modelled[5]
seg-249d8a46f95a = les émissions d'un signal conçu en dehors de sa largeur de bande d'émission : son spectre y est tronqué, de sorte qu'aucune émission hors bande n'atteint une bande voisine (résultat <c1/>)

# text
# c1: not_modelled[6]
seg-cc83c047f02a = l'effet d'un chirp sur la boucle à des vitesses de balayage comparables à la largeur de bande de la boucle : son C/N0 utilise le spectre moyenné par ligne (résultat <c1/>)

# text
# c1: label
seg-7155706bc289 = MODELLED : une densité spectrale de puissance en bande L construite à partir de spectres de signaux en forme fermée (VALIDATED par rapport aux largeurs de lobe principal des manuels et aux coefficients de séparation spectrale), de spectres de brouilleurs et d'un plancher de bruit kT, réduite en J/S et en C/N0 effectif par le coefficient de séparation spectrale. Les puissances des brouilleurs, la chronologie et les largeurs de bande des étages d'entrée sont des entrées du scénario, et non des mesures. (résultat <c1/>)

# text
seg-95879767c438 = Page thématique : <a1>LEO-SIGNAL.md</a1>

# text
seg-ce69d8d2d9d1 = <s1>Précédent</s1>space-weather

# text
seg-ac2c9c25fbb6 = <s1>Suivant</s1>spoof-detect
