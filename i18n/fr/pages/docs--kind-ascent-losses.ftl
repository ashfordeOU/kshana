# docs--kind-ascent-losses: translations (fr)

# text
seg-99ef7c1d552c = Type de scénario du moteur v{ $version }, famille <a1>Analyse de mission, liaisons et opérations spatiales</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catalogue des types de scénario (<c1/>))

# text
seg-8f1e7d3f5a07 = Page de famille : <a1>Analyse de mission, liaisons et opérations spatiales</a1>

# text
# c1: docs/kinds/by-kind/ascent-losses.md
seg-5d7cf510f4e9 = Source : <c1/>

# text
# c1: ascent-losses
seg-23e7becab606 = <c1/> (type de scénario)

# text
seg-34d041d6bd9f = Ascension plane en virage gravitationnel d'un véhicule à plusieurs étages au-dessus d'une Terre sphérique sans rotation, à travers l'US Standard Atmosphere { "1976" } (montée verticale, coup de tangage, poussée selon la vitesse), intégrant les pertes de gravité, de traînée, de pilotage et de contre-pression et vérifiant le dv idéal moins les pertes par rapport à la vitesse de fin de combustion ; max-Q, accélération de crête et état de fin de combustion. MODELLED.

# text
# c1: scenarios/ascent-losses.toml
seg-cd6181de5e43 = Une exécution de <c1/> se résume ainsi : ascent-losses: ideal dv { "11290" } m/s, losses { "2359" } m/s (gravity { "2276" }, drag { "15" }, steering { "0" }, back-pressure { "67" }); burnout { "509" } km at { "8932" } m/s, gamma { "8.7" } deg; max-Q { "32.5" } kPa (MODELLED)

# text
# c1: stages
# c2: payload_kg
# c3: drag_coefficient
# c4: reference_area_m2
# c5: kick_altitude_m
# c6: kick_angle_deg
# c7: kick_duration_s
# c8: step_s
seg-58f9e8d24a73 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/ascent-losses.toml
seg-ec4396f2fa76 = L'exemple <c1/> définit, entre autres :

# text
seg-a44edb1eb84d = kg

# text
seg-37205a55d23c = m^{ "2" }

# text
seg-98151954f217 = false

# text
seg-68a37ebbc01e = Étiquette du résultat (celle du moteur) : MODELLED — ascension plane en virage gravitationnel d'un véhicule à plusieurs étages au-dessus d'une Terre sphérique sans rotation à travers l'US76, avec les pertes de gravité, de traînée, de pilotage et de contre-pression intégrées et l'identité dv idéal moins pertes vérifiée ; C_D constant, pas de rotation, pas de phase balistique, pas de guidage au-delà du coup de tangage

# attr:alt
seg-ccf2185b0b5e = Le graphique que le moteur écrit pour scenarios/ascent-losses.toml, type de scénario ascent-losses

# text
seg-3a3ee499961e = <b>MODELLED</b> Ascension plane en virage gravitationnel d'un véhicule à plusieurs étages au-dessus d'une Terre sphérique sans rotation, à travers l'US Standard Atmosphere { "1976" } (densité et pression), avec un coup de tangage, une poussée réduite par la contre-pression de la tuyère, des fins de combustion d'étage à des s exacts

# text
seg-cac91718c4e1 = <b>MODELLED</b> Ascension plane en virage gravitationnel d'un véhicule à plusieurs étages au-dessus d'une Terre sphérique sans rotation, à travers l'US Standard Atmosphere { "1976" } (densité et pression), avec un c. Référence indépendante (InternalConsistency) : Cohérence interne : l'identité exacte vitesse de fin de combustion = somme Isp g0 ln(m0/mf) moins les quatre pertes intégrées (résidu inférieur à { "1e-6" } m/s), l'équation de Tsiolkovski sur une combustion verticale dans le vide avec la gravité pour seule perte, et les pressions US76 au niveau de la mer et à la tropopause. CE QUI NE L'EST PAS : les pertes d'aucun véhicule publié n'ont été comparées ; pas de rotation de la Terre, de phase balistique, de régulation de poussée ni de guidage au-delà du coup de tangage ; C_D constant ; pas une trajectoire

# text
# c1: label
seg-906f001cd9ea = MODELLED — ascension plane en virage gravitationnel d'un véhicule à plusieurs étages au-dessus d'une Terre sphérique sans rotation à travers l'US76, avec les pertes de gravité, de traînée, de pilotage et de contre-pression intégrées et l'identité dv idéal moins pertes vérifiée ; C_D constant, pas de rotation, pas de phase balistique, pas de guidage au-delà du coup de tangage (résultat <c1/>)

# text
seg-4c237f051651 = Les pertes de gravité, de traînée, de pilotage et de contre-pression de l'ascension d'un lancement sont MODELLED, et non validées : vérifiées par rapport à leur propre identité analytique en forme fermée — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-8e62cc4af6ea = Page thématique : <a1>ENTRY-EO-ASCENT.md</a1>

# text
seg-73148557c9a6 = <s1>Précédent</s1>araim-reference-check

# text
seg-3af9699f27a7 = <s1>Suivant</s1>attitude-budget

# text
seg-f916c5a08595 = Pertes d'ascension en virage gravitationnel d'un lanceur bi-étage kérosène/oxygène ILLUSTRATIF (pas un véhicule réel) : montée verticale jusqu'à { "1" } km, un coup de tangage de { "3" } deg pendant { "10" } s, puis une poussée selon la vitesse. L'exécution intègre les pertes de gravité, de traînée, de pilotage et de contre-pression et vérifie que le dv idéal moins les pertes est égal à la vitesse de fin de combustion. MODELLED : plan, Terre sans rotation, C_D constant, pas de phase balistique, pas de guidage au-delà du coup de tangage. (commentaire du fichier de scénario, lignes { "1" } à { "5" })
