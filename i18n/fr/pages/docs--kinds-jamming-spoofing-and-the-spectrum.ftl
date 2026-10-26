# docs--kinds-jamming-spoofing-and-the-spectrum: translations (fr)

# text
seg-b03d56f501c3 = Type

# text
seg-98e740d32860 = Banc d'évaluation de la détection par apprentissage automatique des altérations RF ({ "13494" }) : générer un corpus SYNTHÉTIQUE étiqueté et fondé sur des paramètres (nominal/brouillage/leurrage en temps/leurrage en position/trajets multiples), noter un détecteur (energy|agc|sqm|parity|fused) avec le banc indépendant du détecteur, et rapporter AUC/ROC/matrice de confusion + Pd par classe à un Pfa cible, ainsi que l'écart d'optimisme entre dans la distribution et hors de la distribution. Caractéristiques de fonctionnement MODELLED seulement — jamais de données de terrain/IQ, aucun verdict bon/mauvais.

# attr:alt
seg-7e7b07bc5545 = Le graphique que le moteur écrit pour scenarios/impairment-eval.toml, type de scénario impairment-eval

# text
seg-60bf3f0ff000 = Brouillage par bilan de liaison : J/S → C/N₀ effectif → perte d'accrochage.

# attr:alt
seg-42d46b928d09 = Le graphique que le moteur écrit pour scenarios/jamming-demo.toml, type de scénario jamming

# text
seg-fef00c827c6a = Modèle de spectre en bande L et cascade : toute la bande L du GNSS comme une seule densité spectrale de puissance (DSP), fréquence en abscisse, temps vers le bas, sur une chronologie de brouilleurs scriptée. SIGNAUX : GPS L1 C/A et L2C (BPSK({ "1" })), service ouvert Galileo E1 (MBOC(6,1,1/11), ou BOC({ "1,1" })), GPS L5 et Galileo E5a (BPSK({ "10" })), chacun à sa porteuse avec la puissance reçue minimale de la spécification d'interface (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD) sauf indication contraire ; GLONASS, BeiDou et Galileo E6 ne sont pas modélisés. BROUILLEURS : onde continue, bruit à bande étroite plat, chirp en dents de scie linéaire et bruit à large bande adapté à la modulation propre d'une bande, chacun avec un centre, une largeur de bande, une puissance reçue (directe, ou PIRE et portée via l'affaiblissement en espace libre du type de brouillage) et des instants d'activation et de désactivation. Chaque brouilleur est évalué par rapport à chaque bande par son coefficient de séparation spectrale kappa sur la largeur de bande du récepteur, et (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1 ; pour un seul brouilleur, cela équivaut à l'équation anti-brouillage du type de brouillage avec Q = 1/(R_c kappa), et le rapport comporte cette vérification croisée (ainsi que, à côté, la valeur de Q représentative du type de brouillage). Le plancher de bruit est k T_sys avec T_sys = T_ant + { "290" } K (F - { "1" }). La cascade moyenne chaque cellule sur son intervalle de fréquence et sa ligne (chirps de façon exacte, balayages entiers plus le balayage partiel ; brouilleurs commutant en milieu de ligne selon leur rapport cyclique), de sorte que la chronologie du C/N0 et l'image proviennent des mêmes nombres ; result.json porte la grille moyennée par blocs en puissance, le C/N0 et le J/S par bande et par ligne, et, par brouilleur et par bande, le SSC, le Q, le J/S, le J/S dans la bande et le C/N0 stable. [iq] facultatif : le modèle tiré comme un IQ complexe à un instant donné, écrit dans un enregistrement SigMF puis relu depuis celui-ci (cf32_le ou ci16_le), et comparé à une estimation de Welch. [recording] facultatif (versions natives) : la DSP de Welch d'un vrai enregistrement SigMF à côté du modèle. VALIDATED : les DSP des signaux par rapport aux largeurs de lobe principal des manuels (BPSK(n) 2n x { "1.023" } MHz de nul à nul ; lobes de BOC({ "1,1" }) centrés à +/-1.023 MHz) et les coefficients de séparation spectrale par rapport à leurs formes fermées de Parseval et à Q = { "1" } (CW) et { "1.5" } (adapté) de Kaplan & Hegarty. MODELLED : les puissances des brouilleurs, la chronologie, les largeurs de bande des étages d'entrée, le traitement à spectre continu (sans raies de code) et l'absence de CAG, de suppression d'impulsions et de diagramme d'antenne.

# attr:alt
seg-ea1678eb9e84 = Le graphique que le moteur écrit pour scenarios/l-band-waterfall-jamming.toml, type spectrum

# text
seg-f43fe94d84e0 = Détecteur combiné de leurrage RF/mesures (cohérence RAIM multi-SV + CAG + SQM, fusionnés) face à une attaque paramétrée (avantage de puissance, alignement de la phase de la porteuse, poussée en temps/position ; de type TEXBAT).

# attr:alt
seg-268ebf4cba99 = Le graphique que le moteur écrit pour scenarios/spoof-detect.toml, type spoof-detect

# text
seg-cbd77f6ffd63 = Détecteur stochastique de leurrage temporel (Neyman–Pearson / χ²₁) avec P_fa/P_md par Monte-Carlo.

# attr:alt
seg-6f6a8c975111 = Le graphique que le moteur écrit pour scenarios/spoof-attack.toml, type spoof

# text
seg-f6ff1c8c78db = Perte d'accrochage de la boucle de poursuite : C/N0 -> accrochage/décrochage AVEC HYSTÉRÉSIS, temps nécessaire pour perdre l'accrochage, et capture par leurrage en fonction du TAUX de décalage de code et de porteuse. Les critères de déni et de capture existants du moteur sont des rapports sur la puissance reçue (un brouilleur interdit à J/S = { "30" } dB, un leurre capture à { "3" } dB) ; la vraie perte d'accrochage n'est pas un rapport de puissance, c'est le point où la gigue d'une boucle plus la contrainte dynamique quittent son budget de seuil de poursuite. Rapporte ({ "1" }) la gigue thermique à 1 sigma de la porteuse (Costas) et du code (avance/retard non cohérent) en fonction du C/N0, perte de quadrature incluse, par rapport aux règles indiquées { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (la règle des 15 degrés sous forme à trois sigma) et { "3" }</em>sigma_DLL + retard de rampe <= d/2 chips ; ({ "2" }) les seuils de C/N0 de décrochage et de ré-accrochage avec la boucle déterminante nommée, le seuil de ré-accrochage DÉRIVÉ de la largeur de bande plus large à laquelle un récepteur se ré-accroche plutôt qu'affirmé, de sorte que la largeur d'hystérésis doit se situer entre { "5" }<em>log10(rapport) et { "10" }</em>log10(rapport) dB ; ({ "3" }) le temps déclaré pour perdre l'accrochage d'un détecteur d'accrochage à deux seuils avec des durées de confirmation, piloté sur une rampe de C/N0, rapporté séparément du temps physique d'échappement de phase (le temps moyen de Viterbi entre sauts de cycle, en log10 s car il s'étend sur des centaines de décades) ; ({ "4" }) les limites de capture par leurrage — la plus grande vitesse de glissement de code et le plus grand taux de Doppler de porteuse que les boucles d'une victime peuvent suivre, avec une carte sur les deux axes, car un leurre qui glisse plus vite que ces valeurs ne capture pas la boucle, il la distance ; et ({ "5" }) le RAYON DE DÉNI qu'impliquent les dynamiques de boucle, rapporté EN PLUS du rayon en rapport de puissance existant, jamais à sa place, avec leur différence signée comme champ nommé à part (denial_radius_delta_km) et une définition à côté. Chaque champ numérique émis porte une unité et une classe de provenance. Formes fermées VALIDATED : les expressions de gigue de porteuse et de code, la réduction du filtre de boucle sqrt({ "2" }<em>B_n</em>T) et le retard de rampe du premier ordre sont recoupés avec le propre corrélateur sdr du moteur avancé pas à pas sur une FI synthétique initialisée — un autre chemin vers les mêmes nombres — à { "0.6" } %, { "3.7" } % et { "0.17" } % respectivement, et la fonction de Bessel modifiée I0 qui sous-tend le temps de saut de cycle avec des valeurs tabulées standard à { "1e-7" }. La limite de validité inférieure est affirmée, et non simplement indiquée : en dessous d'environ { "32" } dB-Hz à { "1" } ms, le vrai discriminateur atan sature contre sa plage +-pi/2 et mesure moins de gigue que n'importe quelle théorie linéaire. MODELLED : les largeurs de bande de boucle, le temps d'intégration, l'espacement des corrélateurs, le rapport de largeur de bande de capture, les durées de confirmation, la puissance du brouilleur et les gains d'antenne sont des valeurs représentatives de la bande, et non une fiche technique. NON modélisés : la gigue d'oscillateur (écart-type d'Allan) et de vibration, la limitation de largeur de bande de l'étage d'entrée, les trajets multiples, la dynamique de la CAG, la perte de transition de bit de données, l'aide externe, et toute correction d'un demi-cycle à la formule de saut de cycle de Costas. Sous les dynamiques de boucle, la capture par leurrage n'a aucun rayon — la contrainte déterminante est le taux de décalage, non la puissance — de sorte que ce champ est nul avec une raison plutôt qu'un nombre fabriqué. Pas un produit certifié de performance de récepteur.

# attr:alt
seg-72182c1aecd9 = Le graphique que le moteur écrit pour scenarios/tracking-loop.toml, type tracking-loop

# text
seg-4e31c8daf798 = Registre

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
seg-63c3a7483268 = { "6" } types de scénario du moteur v{ $version }. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, pas un équipement de navigation homologué et pas un service de sauvegarde de la vie humaine. Chaque libellé ici est celui du moteur ou de la matrice de vérification ; un type est MODELLED sauf indication contraire de la matrice (comment un libellé s'obtient : la section Evidence du README).

# text
# c1: docs/kinds/jamming-spoofing-and-the-spectrum.md
seg-f6a18b7cb172 = Source : <c1/>

# text
seg-d4ae70a5d619 = Brouillage, leurrage et spectre (famille de types de scénario)

# text
# c1: kshana scenarios/jamming-demo.toml
seg-b4b8b72e060b = Pages thématiques : <a1>SPECTRUM</a1>, <a2>DECEIVED-TIME</a2>, <a3>IQ-FOLLOW</a3>. En exécuter une : <c1/>. Toutes les familles : <a4>KINDS.md</a4>.

# attr:alt
seg-cc031b964086 = Planche-contact des graphiques que le moteur écrit pour les types de la famille Brouillage, leurrage et spectre

# text
seg-bbbd87f888b9 = Perte d'accrochage de la boucle de poursuite : C/N0 -> accrochage/décrochage AVEC HYSTÉRÉSIS, temps nécessaire pour perdre l'accrochage, et capture par leurrage en fonction du TAUX de décalage de code et de porteuse.

# text
seg-e37f1e071b2c = Modèle de spectre en bande L et cascade : toute la bande L du GNSS comme une seule densité spectrale de puissance (DSP), fréquence en abscisse, temps vers le bas, sur une chronologie de brouilleurs scriptée.

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
seg-8887d666b4fc = Plateforme d'évaluation de détection de perturbations RF par apprentissage automatique ({ "13494" }) : générer un corpus SYNTHÉTIQUE étiqueté et fondé sur des paramètres (nominal/brouillage/leurrage en temps/leurrage en position/trajets multiples), noter un détecteur (énergie/agc/s

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
# c5: jammer
# c6: mask_deg
# c7: tracking_threshold_dbhz
# c8: degraded_margin_db
# c9: signal_power_dbw
# c10: temp_k
# c11: freq_hz
# c12: chip_rate_hz
# c13: skyline
seg-f6dcb5b36454 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>. Facultatifs : <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-7bb2f42902f0 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>jamming</a1>.

# text
# c1: threshold_ns
# c2: time
# c3: attack
# c4: clock_quantum
# c5: clock_classical
seg-d5f06ff66e1b = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-1bd760afbaca = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>spoof</a1>.

# text
# c1: attack
# c2: satellites
# c3: detector
seg-fb15ecc29f7c = Champs obligatoires : <c1/>. Facultatifs : <c2/>, <c3/>.

# text
seg-15c08ee5ae76 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>spoof-detect</a1>.

# text
# c1: pll_bandwidth_hz
# c2: dll_bandwidth_hz
# c3: predetection_integration_s
# c4: correlator_spacing_chips
# c5: carrier_allowance_deg
# c6: code_allowance_chips
# c7: pullin_bandwidth_ratio
# c8: drop_confirm_epochs
# c9: relock_confirm_epochs
# c10: doppler_rate_hz_per_s
# c11: code_slew_chips_per_s
# c12: cn0_high_dbhz
# c13: cn0_low_dbhz
# c14: ramp_duration_s
# c15: jitter_table_cn0_dbhz
# c16: jammer_power_dbw
# c17: jammer_gain_dbi
# c18: rx_gain_toward_jammer_db
# c19: rx_gain_toward_sat_db
# c20: signal_power_dbw
# c21: temp_k
# c22: freq_hz
# c23: chip_rate_hz
# c24: jammer_type
# c25: q_override
# c26: denial_js_threshold_db
# c27: capture_js_threshold_db
# c28: spoof_code_slew_chips_per_s
# c29: spoof_doppler_rate_hz_per_s
seg-c65b9d45bdcc = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>.

# text
seg-bd1b04ccfe22 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>tracking-loop</a1>.

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
seg-5024b537d000 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

# text
seg-a73f44c04565 = <b>Registre :</b> MODELLED { "3" } · VALIDATED { "2" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>spectrum</a1>.

# text
# c1: seed
# c2: n_per_class
# c3: nominal_cn0_dbhz
# c4: meas_noise
# c5: detector
# c6: target_pfa
# c7: shift_severity_scale
# c8: optimism_tol
seg-cbcc6f5302b8 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-d14fa8348a2a = <b>Registre :</b> MODELLED { "1" } · VALIDATED { "2" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>impairment-eval</a1>.

# text
seg-5242026d2998 = <s1>Précédent</s1>Inertiel, fusion et capteurs quantiques

# text
seg-6b9b04e59491 = <s1>Suivant</s1>Navigation en orbite basse
