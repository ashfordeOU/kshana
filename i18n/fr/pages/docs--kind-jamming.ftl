# docs--kind-jamming: translations (fr)

# text
seg-debc2f07db78 = true

# text
seg-8784979d6569 = dBW

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-cc2ad9e12064 = <b>MODELLED</b> Bilan de liaison J/S géométrique, C/N₀ anti-brouillage, perte d'accrochage par satellite. Référence indépendante (InternalConsistency) : Équation du bilan de liaison C/N₀ anti-brouillage vérifiée par rapport à une nouvelle dérivation numpy indépendante (partage la même forme fermée → InternalConsistency) plus une caractérisation de la dégradation du C/N₀ de JammerTest-2024 réel. { "0.30" } tour { "2" }, bloqué (reste MODELLED) : la baisse de C/N0 mesurée de JammerTest { "2024" } par rapport à une prédiction de bilan de liaison (préenregistrée 6a66994b, à { "3" } dB près) n'a pas été exécutée parce que la position et le pointage de l'antenne F8.1 à

# text
seg-59afd80736c5 = <b>PARTNER</b> Non fourni — Kshana modélise la performance du signal, et non le matériel de charge utile ou d'antenne. Référence indépendante (NoneKind) : aucune : une discipline propre au partenaire, sans module ni test par conception

# text
seg-143f3f1cc521 = La résilience au brouillage en l'absence de GNSS est MODELLED, et non validée : vérifiée par rapport à sa propre identité analytique en forme fermée — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-ee7dd15019d0 = Page thématique : <a1>CAMPAIGNS.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-9521a296d617 = dBi

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
seg-55ee4fdf9240 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>

# text
seg-304496607bd7 = Type de scénario du moteur v{ $version }, famille <a1>Brouillage, leurrage et spectre</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-5d23d7f8f872 = Page de famille : <a1>Brouillage, leurrage et spectre</a1>

# text
# c1: docs/kinds/by-kind/jamming.md
seg-53b1a341460a = Source : <c1/>

# text
# c1: jamming
seg-1c9fd1344128 = <c1/> (type de scénario)

# text
seg-60bf3f0ff000 = Brouillage par bilan de liaison : J/S → C/N₀ effectif → perte d'accrochage.

# text
# c1: scenarios/jamming-demo.toml
seg-25a1f4f327bd = Une exécution de <c1/> se résume ainsi : scenario 5aac34b045c7 | jamming ON | availability under jamming { "0.00" } (nominal { "1.00" }) | min tracking { "0" } | mean J/S { "72.2" } dB

# text
# c1: jammer
# c2: mask_deg
# c3: tracking_threshold_dbhz
# c4: degraded_margin_db
# c5: signal_power_dbw
# c6: temp_k
# c7: freq_hz
# c8: chip_rate_hz
# c9: skyline
seg-e4f8d6b2fe1f = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: scenarios/jamming-demo.toml
seg-a2433f85f8d0 = L'exemple <c1/> définit, entre autres :

# text
seg-f85a85f0c7e4 = MHz

# text
seg-7154243aabbe = broadband

# attr:alt
seg-42d46b928d09 = Le graphique que le moteur écrit pour scenarios/jamming-demo.toml, type de scénario jamming

# text
seg-4d946761b93f = <b>MODELLED</b> Bilan de liaison J/S géométrique, C/N₀ anti-brouillage, perte d'accrochage par satellite Tests : <a1>gnss_denied_jamming_resilience_reference.rs</a1>.

# text
seg-4f5e697dfaeb = <b>MODELLED</b> Le rapport hybrid-optical-rf indique une disponibilité de liaison RF, composée à partir de grandeurs que le moteur calcule déjà plutôt qu'à partir d'une climatologie importée, et énonce la composition comme une règle nommée : A_rf = I_closure * I_track, où I_clos

# text
seg-cec5c06d38af = <b>MODELLED</b> Rapport brouilleur/signal propre à la Lune, C/N₀ effectif et perte d'accrochage pour un utilisateur à la surface sélénographique sous un brouilleur à la surface lunaire (ou surélevé), sur la constellation illustrative de classe Moonlight/LCNS issue de sources publiques.

# text
# c1: lunar-jamming
seg-edcd55ccc993 = <b>MODELLED</b> Le rapport <c1/> ne repose plus sur un seul scalaire pour son contour de refus.

# text
seg-e34f60d56cf7 = et { "5" } autres dans la matrice.

# text
seg-d7f1fc7f30a6 = Page thématique : <a1>SPECTRUM.md</a1>

# text
seg-bd78e9277435 = <s1>Précédent</s1>integrity

# text
seg-1d5e7a4b87e9 = <s1>Suivant</s1>launch-window

seg-a349aa76b0ed = PARTNER
