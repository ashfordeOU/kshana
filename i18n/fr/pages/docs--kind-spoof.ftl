# docs--kind-spoof: translations (fr)

# text
seg-f42465f7d066 = ns

# text
seg-debc2f07db78 = true

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } scénarios fournis utilisent ce type de scénario ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-f4cf8b629797 = Page thématique : <a1>INTEGRITY.md</a1>

# text
seg-b0a5473bec67 = Microchip SA65 / SA.45s CSAC datasheet sigma_y(1s)={ "3e-10" }; q_

# text
seg-a8d92406e428 = Strontium optical lattice clock, space-oriented goal sigma_y

# text
seg-b9174c70772f = <b>MODELLED</b> χ² assisté par l'horloge, RAIM, AGC, SQM fusionnés en un indice de mérite de sécurité par époque. Référence indépendante (ExternalDataset) : paramètres de scénario TEXBAT (Humphreys { "2012" }) — caractérisation, et non vecteurs figés. { "0.30" } comparaison externe, un constat (reste MODELLED) : sur JammerTest { "2024" } (Bleik ; données GPL-3.0) les moniteurs de niveau observable (khi-deux assisté par l'horloge, RAIM, échec de résolution) n'ont déclenché aucune alarme dans les { "10" } s suivant l'un des { "8" } débuts de leurrage publiés évaluables (là où la fenêtre précédant le début était propre, la première alarme est venue { "10.2" } à { "39" } s après le pu

# text
seg-e4b64d7277da = La détection du leurrage est MODELLED, et non validée : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-ee7dd15019d0 = Page thématique : <a1>CAMPAIGNS.md</a1>

# text
seg-5a70fcb097dc = Champs facultatifs : aucun

# text
seg-304496607bd7 = Type de scénario du moteur v{ $version }, famille <a1>Brouillage, leurrage et spectre</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-5d23d7f8f872 = Page de famille : <a1>Brouillage, leurrage et spectre</a1>

# text
seg-03d8dc3de7ca = <b>MODELLED</b> χ² assisté par l'horloge, RAIM, CAG, SQM, FoM de sécurité par époque fusionné Tests : <a1>spoof_texbat_validation.rs</a1>.

# text
# c1: docs/kinds/by-kind/spoof.md
seg-09125f609abe = Source : <c1/>

# text
# c1: spoof
seg-8bf73eca4115 = <c1/> (type de scénario)

# text
seg-cbd77f6ffd63 = Détecteur stochastique de leurrage temporel (Neyman–Pearson / χ²₁) avec P_fa/P_md par Monte-Carlo.

# text
# c1: scenarios/spoof-attack.toml
seg-2a1e4e7893ba = Une exécution de <c1/> se résume ainsi : scénario 2b6bd22c3b80 | leurrage LinearRamp { "{" } rate_ns_per_s: { "0.1" } { "}" } contre une spécification de { "20.000" } ns (P_fa { "0.010" }) | sécurité quantique { "1.000" } (P_md { "0.000" }, MC { "0.000" }) détecté 70s | sécurité classique { "0.558" } (P_md { "0.442" }, MC { "0.444" }) détecté 430s

# text
# c1: threshold_ns
# c2: time
# c3: attack
# c4: clock_quantum
# c5: clock_classical
seg-b577342dfe39 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/spoof-attack.toml
seg-adb7ff15a702 = L'exemple <c1/> définit, entre autres :

# attr:alt
seg-6f6a8c975111 = Le graphique que le moteur écrit pour scenarios/spoof-attack.toml, type spoof

# text
# c1: leo-pass
# c2: [spoofer]
seg-ecc2dc8489bb = <b>MODELLED</b> La section <c2/> du type <c1/> : un leurre contrefait, de façon cohérente en distance et en vitesse de variation de distance, les signaux vus à une position déclarée qui saute et/ou est écartée de la position réelle après un début d'attaque (par bande LEO et pour le MEO Tests : <a1>leo_resilience_verticals.rs</a1>.

# text
# c1: [spoofer]
seg-8b3523b5fa2c = <b>MODELLED</b> Pour chaque satellite LEO et chaque paire de bandes de télémétrie, la section <c1/> forme la combinaison de pseudodistances sans géométrie, retire le modèle ionosphérique du récepteur et teste son saut d'une époque à l'autre par rapport au bruit de code des deux bandes et à un Tests : <a1>leo_resilience_verticals.rs</a1>.

# text
seg-e5bbd2fca4fb = <s1>Précédent</s1>spoof-detect

# text
seg-8d3311751876 = <s1>Suivant</s1>sweep-nd
