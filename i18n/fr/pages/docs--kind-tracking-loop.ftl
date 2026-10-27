# docs--kind-tracking-loop: translations (fr)

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-b054c73f22e5 = aucune valeur

# text
seg-59afd80736c5 = <b>PARTNER</b> Non fourni — Kshana modélise la performance du signal, et non le matériel de charge utile ou d'antenne. Référence indépendante (NoneKind) : aucune : une discipline propre au partenaire, sans module ni test par conception

# text
seg-a3697ad561db = Hz

# text
seg-304496607bd7 = Type de scénario du moteur v{ $version }, famille <a1>Brouillage, leurrage et spectre</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-5d23d7f8f872 = Page de famille : <a1>Brouillage, leurrage et spectre</a1>

# text
# c1: lunar-jamming
seg-edcd55ccc993 = <b>MODELLED</b> Le rapport <c1/> ne repose plus sur un seul scalaire pour son contour de refus.

# text
seg-05e8854de548 = chip

# text
# c1: docs/kinds/by-kind/tracking-loop.md
seg-4f57723d340e = Source : <c1/>

# text
# c1: tracking-loop
seg-e84aabe07c43 = <c1/> (type de scénario)

# text
seg-f6ff1c8c78db = Perte d'accrochage de la boucle de poursuite : C/N0 -> accrochage/décrochage AVEC HYSTÉRÉSIS, temps nécessaire pour perdre l'accrochage, et capture par leurrage en fonction du TAUX de décalage de code et de porteuse. Les critères de déni et de capture existants du moteur sont des rapports sur la puissance reçue (un brouilleur interdit à J/S = { "30" } dB, un leurre capture à { "3" } dB) ; la vraie perte d'accrochage n'est pas un rapport de puissance, c'est le point où la gigue d'une boucle plus la contrainte dynamique quittent son budget de seuil de poursuite. Rapporte ({ "1" }) la gigue thermique à 1 sigma de la porteuse (Costas) et du code (avance/retard non cohérent) en fonction du C/N0, perte de quadrature incluse, par rapport aux règles indiquées { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (la règle des 15 degrés sous forme à trois sigma) et { "3" }</em>sigma_DLL + retard de rampe <= d/2 chips ; ({ "2" }) les seuils de C/N0 de décrochage et de ré-accrochage avec la boucle déterminante nommée, le seuil de ré-accrochage DÉRIVÉ de la largeur de bande plus large à laquelle un récepteur se ré-accroche plutôt qu'affirmé, de sorte que la largeur d'hystérésis doit se situer entre { "5" }<em>log10(rapport) et { "10" }</em>log10(rapport) dB ; ({ "3" }) le temps déclaré pour perdre l'accrochage d'un détecteur d'accrochage à deux seuils avec des durées de confirmation, piloté sur une rampe de C/N0, rapporté séparément du temps physique d'échappement de phase (le temps moyen de Viterbi entre sauts de cycle, en log10 s car il s'étend sur des centaines de décades) ; ({ "4" }) les limites de capture par leurrage — la plus grande vitesse de glissement de code et le plus grand taux de Doppler de porteuse que les boucles d'une victime peuvent suivre, avec une carte sur les deux axes, car un leurre qui glisse plus vite que ces valeurs ne capture pas la boucle, il la distance ; et ({ "5" }) le RAYON DE DÉNI qu'impliquent les dynamiques de boucle, rapporté EN PLUS du rayon en rapport de puissance existant, jamais à sa place, avec leur différence signée comme champ nommé à part (denial_radius_delta_km) et une définition à côté. Chaque champ numérique émis porte une unité et une classe de provenance. Formes fermées VALIDATED : les expressions de gigue de porteuse et de code, la réduction du filtre de boucle sqrt({ "2" }<em>B_n</em>T) et le retard de rampe du premier ordre sont recoupés avec le propre corrélateur sdr du moteur avancé pas à pas sur une FI synthétique initialisée — un autre chemin vers les mêmes nombres — à { "0.6" } %, { "3.7" } % et { "0.17" } % respectivement, et la fonction de Bessel modifiée I0 qui sous-tend le temps de saut de cycle avec des valeurs tabulées standard à { "1e-7" }. La limite de validité inférieure est affirmée, et non simplement indiquée : en dessous d'environ { "32" } dB-Hz à { "1" } ms, le vrai discriminateur atan sature contre sa plage +-pi/2 et mesure moins de gigue que n'importe quelle théorie linéaire. MODELLED : les largeurs de bande de boucle, le temps d'intégration, l'espacement des corrélateurs, le rapport de largeur de bande de capture, les durées de confirmation, la puissance du brouilleur et les gains d'antenne sont des valeurs représentatives de la bande, et non une fiche technique. NON modélisés : la gigue d'oscillateur (écart-type d'Allan) et de vibration, la limitation de largeur de bande de l'étage d'entrée, les trajets multiples, la dynamique de la CAG, la perte de transition de bit de données, l'aide externe, et toute correction d'un demi-cycle à la formule de saut de cycle de Costas. Sous les dynamiques de boucle, la capture par leurrage n'a aucun rayon — la contrainte déterminante est le taux de décalage, non la puissance — de sorte que ce champ est nul avec une raison plutôt qu'un nombre fabriqué. Pas un produit certifié de performance de récepteur.

# text
# c1: scenarios/tracking-loop.toml
seg-62d230dfccce = Une exécution de <c1/> se résume ainsi : tracking-loop : B_pll { "10.0" } Hz / B_dll { "1.0" } Hz, T { "1" } ms, d { "0.50" } chip -> décrochage { "25.4744" } dB-Hz (la porteuse est déterminante), ré-accrochage { "27.4413" } dB-Hz, hystérésis { "1.9669" } dB | perte d'accrochage déclarée { "39.101" } s après le début de la rampe | rayon de déni seuil(J/S { "30" } dB) { "127.413" } km contre dynamiques de boucle { "53.1694" } km, delta -74.2438 km | capture par leurrage <= { "0.966" } chip/s en code et { "41.45" } Hz/s en porteuse (boucle MODELLED, formes fermées VALIDATED)

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
seg-7614718317f4 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>

# text
# c1: scenarios/tracking-loop.toml
seg-41162ed2743b = L'exemple <c1/> définit, entre autres :

# text
seg-773fff0feaf7 = encadré

# text
seg-23f3aa5c2064 = Libellé du résultat (celui du moteur) : MIXED — formes fermées de boucle VALIDATED, configuration de boucle MODELLED. Les expressions de gigue thermique de porteuse et de code, la réduction du filtre de boucle sqrt({ "2" }<em>B_n</em>T) et le retard de rampe du premier ordre sont recoupés avec le propre corrélateur sdr du moteur avancé pas à pas sur une FI synthétique initialisée (un chemin différent

# attr:alt
seg-72182c1aecd9 = Le graphique que le moteur écrit pour scenarios/tracking-loop.toml, type tracking-loop

# text
seg-346594a654f2 = <b>MODELLED</b> Perte d'accrochage calculée à partir des dynamiques de boucle au lieu d'un rapport de puissance : gigue thermique à 1σ de la porteuse (Costas) et du code (avance/retard non cohérent) en fonction du C/N₀ avec la perte de quadrature, par rapport aux règles indiquées 3σ_PLL + θ_e ≤ { "45" }° et 3σ_DLL + retard de rampe

# text
seg-3aa7f9748dc2 = <b>MODELLED</b> Perte d'accrochage calculée à partir des dynamiques de boucle au lieu d'un rapport de puissance : gigue thermique à 1σ de la porteuse (Costas) et du code (avance/retard non cohérent) en fonction du C/N₀ avec la. Référence indépendante (ReferenceImpl) : le propre corrélateur sdr du moteur (sdr::correlate / synth_if / CaCode) avancé pas à pas sur une FI synthétique initialisée à un C/N₀ étalonné — un chemin de code distinct aboutissant aux mêmes nombres par corrélation numérique d'IQ échantillonnés plutôt que par une expression algébrique de gigue, de sorte que c'est un chemin différent et non une reformulation — plus des valeurs tabulées standard de la fonction de Bessel modifiée I₀ pour le terme de saut de cycle. Théorie des boucles selon Kaplan & Hegar

# text
# c1: label
seg-de048f9cf1f6 = MIXED — formes fermées de boucle VALIDATED, configuration de boucle MODELLED. Les expressions de gigue thermique de porteuse et de code, la réduction du filtre de boucle sqrt({ "2" }<em>B_n</em>T) et le retard de rampe du premier ordre sont recoupés avec le propre corrélateur sdr du moteur avancé pas à pas sur une FI synthétique initialisée (un chemin différent vers les mêmes nombres), et la fonction de Bessel modifiée I0 avec des valeurs tabulées standard. MODELLED : les largeurs de bande de boucle, integ (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-0dc70b7607f0 = MODELLED : les largeurs de bande de boucle, le temps d'intégration, l'espacement des corrélateurs, le rapport de largeur de bande de capture, les durées de confirmation, la puissance du brouilleur et les gains d'antenne sont des valeurs représentatives de la bande, et non une fiche technique. (catalogue des types (<c1/>))

# text
# c1: kshana kinds --json
seg-a679a9732b2a = NON modélisés : la gigue d'oscillateur (écart-type d'Allan) et de vibration, la limitation de largeur de bande de l'étage d'entrée, les trajets multiples, la dynamique de la CAG, la perte de transition de bit de données, l'aide externe, et toute correction d'un demi-cycle à la formule de saut de cycle de Costas. (catalogue des types (<c1/>))

# text
seg-f8d50cbc6f2c = Chaque paramètre de boucle ci-dessous est une valeur représentative de la bande MODELLED, et non une fiche technique. (commentaire du fichier de scénario, ligne { "22" })

# text
seg-9241a57823cd = --- géométrie de boucle ----------------------------------------------------------------- Une boucle de porteuse de Costas à { "10" } Hz et une boucle de code assistée par la porteuse à { "1" } Hz, intégration cohérente de { "1" } ms (une période de code C/A, de sorte qu'aucune synchronisation des bits de données n'est supposée), corrélateur étroit de { "0.5" } chip. (commentaire du fichier de scénario, lignes { "25" } à { "28" })

# text
seg-3a677e343081 = La perte d'accrochage de la boucle de poursuite et la capture par leurrage sous interférence sont MODELLED, non validées : vérifiées par rapport à une autre implémentation de ce même code source — indépendante de l'unité testée, mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-e3a8f20108f3 = <s1>Précédent</s1>timetransfer
