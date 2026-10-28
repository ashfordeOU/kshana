# docs--kind-link-budget: translations (fr)

# text
seg-99ef7c1d552c = Type de scénario du moteur v{ $version }, famille <a1>Analyse de mission, liaisons et opérations spatiales</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-debc2f07db78 = true

# text
seg-8784979d6569 = dBW

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Page de famille : <a1>Analyse de mission, liaisons et opérations spatiales</a1>

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-a3697ad561db = Hz

# text
seg-cec5c06d38af = <b>MODELLED</b> Rapport brouilleur/signal propre à la Lune, C/N₀ effectif et perte d'accrochage pour un utilisateur à la surface sélénographique sous un brouilleur à la surface lunaire (ou surélevé), sur la constellation illustrative de classe Moonlight/LCNS issue de sources publiques.

# text
# c1: docs/kinds/by-kind/link-budget.md
seg-120fcc840b87 = Source : <c1/>

# text
# c1: link-budget
seg-738aa7d45efb = <c1/> (type de scénario)

# text
seg-953188c11165 = Bilan de liaison unidirectionnel selon l'équation de liaison CCSDS { "401" } / DSN 810-005 : affaiblissement en espace libre, C/N₀, Eb/N₀, marge et fermeture pour une PIRE d'émission, un G/T de réception, une distance, un débit de données et une bande (s|x|ka), par rapport à un Eb/N₀ requis. Un calcul d'ingénierie déterministe à partir des entrées fournies (et non la fiche technique d'un terminal étalonné).

# text
# c1: scenarios/link-budget.toml
seg-6697c741d09c = Une exécution de <c1/> se résume ainsi : link-budget: x-band, { "2000" } km, { "1000000" } bit/s -> FSPL { "177.0" } dB, Eb/N0 { "96.6" } dB, margin { "92.1" } dB (closes)

# text
# c1: band
# c2: eirp_dbw
# c3: g_over_t_db
# c4: range_km
# c5: data_rate_bps
# c6: other_losses_db
# c7: required_eb_n0_db
# c8: tsys_k
seg-2305502051b6 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/link-budget.toml
seg-588476f4ae75 = L'exemple <c1/> définit, entre autres :

# text
seg-ebb923e1a3b5 = Libellé du résultat (celui du moteur) : Bilan de liaison unidirectionnel selon l'équation de liaison CCSDS { "401" } / DSN 810-005 (EIRP − FSPL − L_other + G/T − k) ; un calcul d'ingénierie déterministe à partir des entrées fournies, et NON la fiche technique d'un terminal étalonné

# attr:alt
seg-bd375631bc7e = Le graphique que le moteur écrit pour scenarios/link-budget.toml, type de scénario link-budget

# text
seg-4f92669c3946 = <b>VALIDATED</b> Affaiblissement en espace libre, C/N₀, Eb/N₀, marge et fermeture selon l'équation de liaison CCSDS { "401" } / DSN 810-005 pour EIRP/G·T/distance/débit/bande, par rapport à un Eb/N₀ requis. Tests : <a1>one_way_link_budget_reference.rs</a1>.

# text
seg-bfaeb6f1cc5a = <b>VALIDATED</b> Affaiblissement en espace libre, C/N₀, Eb/N₀, marge et fermeture selon l'équation de liaison CCSDS { "401" } / DSN 810-005 pour EIRP/G·T/distance/débit/bande, par rapport à un Eb/N₀ requis. Runn. Référence indépendante (ExternalDataset) : table publiée de contrôle de conception de télécommunications en espace lointain, sous forme de vecteurs numériques figés : DESCANSO / J. H. Yuen (éd.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, Table 1-1 (Galileo, bande X) — kshana reconstitue les lignes de la table et reproduit son L_fs de bout en bout publié de { "290.54" } dB et son Pr/N0 de { "54.6" } dB-Hz ; l'affaiblissement en espace libre est aussi comparé à l'UIT-R P.525

# text
seg-2598c2360113 = <b>MODELLED</b> Le rapport du bilan de liaison énonce chaque constante absolue à partir de laquelle sa propre marge a été calculée -- la fréquence porteuse utilisée pour l'affaiblissement en espace libre, la PIRE, la valeur o. Référence indépendante (InternalConsistency) : aucune référence externe : il s'agit d'une auto-description d'une équation déjà vérifiée par rapport à une table publiée de contrôle de conception (voir la ligne du bilan de liaison unidirectionnel). Elle est consignée parce que son absence a été un défaut mesuré -- reproduire le d1_rate_gain_beamwidth.csv publié exigeait de résoudre à rebours une constante effective unique à { "0.0034" } dB à partir des trente lignes, et le moteur à la fois nomme désormais cette combinaison et prouve, par test

# text
seg-c779823e860c = Facultatif : la température de bruit du système de réception (K). Ce n'est PAS une entrée de l'équation de liaison -- celle-ci n'a besoin que du rapport G/T -- mais la renseigner permet au rapport de donner aussi le gain de l'antenne de réception que sous-entend le facteur de mérite (G = G/T + { "10" }*log10(T_sys)). Si elle est omise, la répartition du gain est absente du rapport plutôt que supposée. tsys_k = { "300.0" } (commentaire du fichier de scénario, lignes { "21" } à { "25" })

# text
seg-d717412c4f06 = L'auto-description du rapport de bilan de liaison est MODELLED, et non vérifiée : elle est contrôlée par rapport à sa propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-ffbc9de75306 = <s1>Précédent</s1>leo-signal

# text
seg-59d4cb995cb9 = <s1>Suivant</s1>lunar-attack-surface

seg-410a790785e7 = <s1>Suivant</s1>lunar-ascent
