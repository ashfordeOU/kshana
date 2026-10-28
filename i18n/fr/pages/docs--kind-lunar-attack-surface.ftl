# docs--kind-lunar-attack-surface: translations (fr)

# text
seg-8784979d6569 = dBW

# text
seg-37d16b499bc5 = dB

# text
seg-98151954f217 = false

# text
seg-cc2ad9e12064 = <b>MODELLED</b> Bilan de liaison J/S géométrique, C/N₀ anti-brouillage, perte d'accrochage par satellite. Référence indépendante (InternalConsistency) : Équation du bilan de liaison C/N₀ anti-brouillage vérifiée par rapport à une nouvelle dérivation numpy indépendante (partage la même forme fermée → InternalConsistency) plus une caractérisation de la dégradation du C/N₀ de JammerTest-2024 réel. { "0.30" } tour { "2" }, bloqué (reste MODELLED) : la baisse de C/N0 mesurée de JammerTest { "2024" } par rapport à une prédiction de bilan de liaison (préenregistrée 6a66994b, à { "3" } dB près) n'a pas été exécutée parce que la position et le pointage de l'antenne F8.1 à

# text
seg-143f3f1cc521 = La résilience au brouillage en l'absence de GNSS est MODELLED, et non validée : vérifiée par rapport à sa propre identité analytique en forme fermée — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
seg-a3697ad561db = Hz

# text
seg-9521a296d617 = dBi

# text
# c1: docs/kinds/by-kind/lunar-attack-surface.md
seg-c14d2343d802 = Source : <c1/>

# text
# c1: lunar-attack-surface
seg-9c0b5e933472 = <c1/> (type de scénario)

# text
seg-004c56ded47f = Surface d'attaque de sécurité des signaux de navigation en surface lunaire (P1) : compose les analyses ouvertes de sécurité des signaux en une seule exécution accessible depuis le binaire. Rapporte ({ "1" }) la puissance reçue de l'AFS et son EXCÉDENT de puissance par rapport à une référence GPS terrestre, ainsi que la bande de sensibilité de 12-18 dB sous forme de véritable balayage multi-axes sur les entrées de la liaison (niveau de référence x PIRE x distance oblique), avec la réconciliation du facteur linéaire de 25x arrondi / 28x non arrondi. RÉVISÉ (règle R4) : ce rapport indiquait un DÉFICIT de puissance de { "15.6" } dB et un facteur de 32x/36x jusqu'à ce que la référence GPS soit corrigée de -125 / -128.5 (qui sont les valeurs en dBm) à -155 / -158.5 dBW, les valeurs de l'ICD-GPS-200 que le module de brouillage a toujours portées. Le signe s'inverse : le signal AFS lunaire modélisé est PLUS FORT de { "14.4" } dB que le GPS L1 C/A terrestre, et non plus faible. La puissance reçue elle-même n'a pas bougé d'un bit, et le facteur linéaire est l'ancien divisé par exactement { "1000" }, ce qui est exactement le décalage de { "30" } dB entre dBm et dBW ; ({ "2" }) la puissance d'émission requise de l'attaquant pour leurrer (J/S = { "3" } dB) et pour interdire (J/S = { "30" } dB) à chaque distance de sécurité, l'inverse de la liaison J/S ; ({ "3" }) l'empreinte orbitale de capture sous un diagramme d'antenne réel à ouverture uniforme (Airy [{ "2" } J1(x)/x]^{ "2" }), une calotte sous-hémisphérique limitée par l'altitude dont le limbe N'EST PAS capturé ; ({ "4" }) un résultat calculé d'accrochage de capture par leurrage de la boucle de poursuite (un leurre à code adapté, à un avantage de puissance et un décalage de code donnés, entraîne-t-il réellement la DLL/PLL), plutôt que le seuil affirmé de { "3" } dB ; ({ "5" }) la portée de l'horizon géométrique d'un émetteur de surface surélevé sur un corps sans atmosphère ; et ({ "6" }) le budget d'authentification OSNMA/TESLA (surcharge de { "20" } bit/s = ~{ "40" } % d'un message de navigation AFS de { "50" } bit/s, latence de divulgation de clé, falsification à { "2" }^-40). Un corps vide reproduit la référence de base P1 ; chaque entrée a une valeur par défaut et peut être redéfinie. Les sous-résultats VALIDATED portent la référence indépendante de leur module source (radiométrie en dB en forme close ; aller-retour J/S inverse ; diagramme d'Airy par rapport aux Bessel de A&S et à la géométrie de la calotte sphérique ; identité de l'horizon tangent sphérique par rapport à eo_payload ; dimensionnement des champs de l'ICD SIS d'OSNMA). MODELLED : les ordres de grandeur représentatifs de géométrie et de puissance et les valeurs des cellules de la carte de capture. Pas un produit de sécurité certifié.

# text
# c1: scenarios/lunar-attack-surface.toml
seg-e5edd5b9ef27 = Une exécution de <c1/> se résume ainsi : lunar-attack-surface | AFS -140.6 dBW, surplus { "14.4" } dB (band -17.9–-12.0, { "25" }×/28× surplus) | spoof@{ "1000" } m { "0.000" } W | footprint { "3" }% cap, limb false | spoof-capture true (lock { "0.00" } s) | mast reach { "21.0" } km | OSNMA { "20" } bit/s ({ "40" }% of { "50" } bit/s), { "30" } s latency | footprint sweep 7x5 (alt 20-500 km x HPBW 1.83-29.20 deg), capture 0.6-42.9% | limb NOT reached on this grid (best -0.8 dB, { "3.8" } dB short; needs { "19.8" } dBW vs { "16.0" } dBW)

# text
# c1: afs_eirp_dbw
# c2: user_gain_dbi
# c3: slant_range_m
# c4: slant_range_max_m
# c5: carrier_hz
# c6: gps_reference_dbw
# c7: gps_reference_min_dbw
# c8: afs_isotropic_signal_dbw
# c9: transmitter_altitude_m
# c10: transmitter_power_dbw
# c11: antenna_diameter_m
# c12: footprint_grid
# c13: spoof_power_advantage_db
# c14: spoof_code_offset_chips
# c15: attacker_gain_dbi
# c16: spoof_capture_js_db
# c17: jam_denial_js_db
# c18: standoffs_m
# c19: mast_height_m
# c20: user_antenna_height_m
# c21: footprint_altitude_min_m
# c22: footprint_altitude_max_m
# c23: footprint_altitude_steps
# c24: footprint_altitude_scale
# c25: footprint_diameter_min_m
# c26: footprint_diameter_max_m
# c27: footprint_diameter_steps
# c28: footprint_diameter_scale
seg-781a7094b955 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>

# text
# c1: scenarios/lunar-attack-surface.toml
seg-87e0c97de011 = L'exemple <c1/> définit, entre autres :

# text
seg-6ea8f1132b57 = linéaire

# text
seg-8b701f465117 = log

# attr:alt
seg-de295af20c55 = Le graphique que le moteur écrit pour scenarios/lunar-attack-surface.toml, type de scénario lunar-attack-surface

# text
seg-c853e3e832c0 = <b>MODELLED</b> Balayage à deux axes de l'empreinte de capture en surface, pondérée par le diagramme et limitée par l'altitude, selon l'altitude de l'émetteur et le diamètre de la parabole, émis à raison d'une ligne par point de fonctionnement. Référence indépendante (InternalConsistency) : inclusion d'ensembles : le rapport brouilleur/signal entre comme un décalage uniforme en décibels, de sorte que l'ensemble capturé à une puissance d'émission plus élevée contient l'ensemble capturé à une puissance plus faible et que la fraction ne peut que croître -- propriété que le diagramme d'Airy NE donne PAS en largeur de faisceau ni en altitude, où la région capturée se brise en anneaux et où la fraction est véritablement non monotone. Aucune table publiée ne donne la fraction de disque capturée d'un émetteur orbital lunaire

# text
# c1: kshana kinds --json
seg-d11486381332 = MODELLED : les ordres de grandeur représentatifs de géométrie et de puissance et les valeurs des cellules de la carte de capture. (catalogue des types de scénario (<c1/>))

# text
seg-95be70748647 = L'empreinte de capture en fonction de l'altitude et de la largeur de faisceau est MODELLED, et non vérifiée : elle est contrôlée par rapport à sa propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-1a1799e01ac4 = <s1>Précédent</s1>link-budget

# text
seg-4b0efe4b9b85 = <s1>Suivant</s1>lunar-beacon

seg-ca1c7e92b98e = <s1>Précédent</s1>lunar-ascent
