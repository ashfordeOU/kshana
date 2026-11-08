# docs--kind-realtime-frame-eop: translations (fr)

# text
seg-8e845ce908ee = Type de scénario du moteur v{ $version }, famille <a1>Mesures GNSS, positionnement et intégrité</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-f6b7ca020692 = Page de famille : <a1>Mesures GNSS, positionnement et intégrité</a1>

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-a2889fb2b42a = Page de sujet : <a1>integrations.md</a1>

# text
# c1: docs/kinds/by-kind/realtime-frame-eop.md
seg-1ad013ffb9d1 = Source : <c1/>

# text
# c1: realtime-frame-eop
seg-54620502f0dd = <c1/> (type de scénario)

# text
seg-edfcb546d9de = Budget de prévision du référentiel lunaire / de l'orientation de la Terre en temps réel : Table { "1" } de P4 (le contrôle de cohérence de l'erreur de référentiel — en post-traitement ~{ "0.27" } m ↔ ~{ "0.010" } ms et en temps réel ~{ "15" } m ↔ ~{ "0.5" } ms, chaque position de référentiel exprimée par son erreur UT1 équivalente via le bras de levier L19 Δr = D_EM·ω⊕·ΔUT1) et Table { "2" } (erreur mesurée de prévision d'UT1 en fonction de l'horizon — la courbe L18 lue directement sur la vraie série IERS finals2000A : le plancher final Bulletin A − Bulletin B et l'erreur du prédicteur de persistance sur plusieurs jours, chacune ramenée à une position dans le référentiel lunaire par L19), plus le budget d'erreur de référentiel en temps réel L21 en racine de la somme des carrés (EOP + éphéméride + plancher de réalisation). Forme close VALIDATED (le bras de levier L19, ω⊕ recoupé avec l'angle de rotation de la Terre du CIO) et données réelles VALIDATED (la courbe L18 lue sur les vraies lignes de finals2000A) ; sont MODELLED les ordres de grandeur de covariance d'OD du relais lunaire et le plancher de réalisation du référentiel (allocations représentatives) ainsi que le prédicteur de persistance (et non l'algorithme opérationnel du Bulletin A de l'IERS). Pas un produit certifié de référentiel en temps réel.

# text
# c1: scenarios/realtime-frame-eop.toml
seg-488039e4240f = Une exécution de <c1/> se résume ainsi : realtime-frame-eop | Table { "1" }: post-proc { "0.27" } m ({ "0.0096" } ms UT1) ↔ real-time { "14.4" } m ({ "0.514" } ms UT1) | Table { "2" }: final floor { "0.0171" } ms → 3-day { "1.6644" } ms | budget total { "20.1" } m ({ "67.0" } ns) | L19 lever arm + L18 real-data (Validated), OD cov (Modelled)

# text
# c1: epoch
# c2: horizons_days
# c3: ephemeris_pos_sigma_m
# c4: ephemeris_vel_sigma_mps
# c5: latency_s
# c6: frame_realization_floor_m
# c7: delta_ut1_ms
# c8: delta_xp_mas
# c9: delta_yp_mas
# c10: eop_finals2000a
# c11: eop_finals2000a_later
# c12: frame_realization_tie_noise_m
# c13: operational_window_days
# c14: operational_min_cycle_fraction
# c15: operational_anchor_residual
seg-66264ec78a4c = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: scenarios/realtime-frame-eop.toml
seg-45a4ed476311 = L'exemple <c1/> définit, entre autres :

# text
seg-c39a26aa1f1e = jeu de test fourni finals2000A_20260930

# text
seg-9ef8a2b4c144 = Libellé du résultat (celui du moteur) : budget de prévision du référentiel lunaire / de l'orientation de la Terre en temps réel. Forme close VALIDATED : le bras de levier L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ recoupé avec l'angle de rotation de la Terre du CIO. Données réelles VALIDATED : les courbes d'erreur de prévision d'UT1 et du mouvement du pôle L18 lues directement sur les vraies IERS finals200

# attr:alt
seg-2721ed7727bb = Le graphique que le moteur écrit pour scenarios/realtime-frame-eop.toml, type de scénario realtime-frame-eop

# text
seg-72a1fc2f5c90 = <b>VALIDATED</b> Un tableau rapporte l'erreur de prévision d'UT1, l'erreur de pôle du mouvement du pôle et leur combinaison en quadrature à la Lune sur un ensemble d'époques IDENTIQUE par horizon, en émettant les époques auxquelles chaque composante a été mesurée. Tests : <a1>embedded_eop_vintage_astropy_preregistered.rs</a1>.

# text
# c1: realtime-frame-eop
seg-b1d90bf98ac3 = <b>VALIDATED</b> La valeur par défaut d'exécution de <c1/> est la propre copie intégrée de la bibliothèque d'un extrait verbatim de finals2000A de l'IERS (tools/finals2000A_20260930.txt : { "174" } lignes quotidiennes consécutives, MJD 61224-61397, extraites du finals2000A.all du 2026-09-30) porte Tests : <a1>operational_eop_predictor_reference.rs</a1>.

# text
seg-0298bd40d72f = <b>MODELLED</b> Un ajustement par moindres carrés biais plus pente sur une fenêtre glissante, plus les principaux termes périodiques — annuel, semi-annuel et les deux principales marées zonales pour UT1 ; Chandler, annuel et semi-annuel pour le pôle — extrapolé avec la dernière valeur de la fenêtre Tests : <a1>operational_eop_predictor_reference.rs</a1>.

# text
seg-12efcd20ca62 = <b>VALIDATED</b> Un tableau rapporte l'erreur de prévision d'UT1, l'erreur de pôle du mouvement du pôle et leur combinaison en quadrature à la Lune sur un ensemble d'époques IDENTIQUE par horizon, en. Référence indépendante (ExternalDataset) : astropy { "8.0.1" } utils.iers (BSD-3) lisant le produit finals2000A de l'IERS avec sa propre règle Bulletin-B-sinon-A, et pyerfa { "2.0.1.5" } (SOFA) rotations complètes céleste-terrestre (c2i06a, sp00, pom00, c2tcio ; l'angle de rotation de la Terre selon l'IERS { "2010" } éq. { "5.15" } en arithmétique exacte), exécutés comme programmes séparés sur des lignes verbatim du finals2000A.all figé du 2026-09-30 ; préenregistré (455b8fb5) avec les amendements A1 et A2 ne fixant que

# text
# c1: realtime-frame-eop
seg-020e5919c8fd = <b>VALIDATED</b> La valeur par défaut d'exécution de <c1/> est la propre copie intégrée de la bibliothèque d'un extrait verbatim de finals2000A de l'IERS (tools/finals2000A_20260930.txt : { "174" } lignes quotidiennes consécutiv. Référence indépendante (ExternalDataset) : astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), lisant les mêmes octets avec son propre lecteur, et la table du Bulletin A de l'IERS Vol. XXXIX No. { "039" }, recopiée nombre pour nombre ; préenregistrée (6fdae01b) avec six critères exacts avant l'exécution d'astropy. Les six sont satisfaits : { "30" } lignes finales, { "54" } rapides et { "90" } prédites avec des listes de MJD égales, chaque ligne prédite portant le drapeau P, le recensement de l'exécution par défaut égal, et les prédictions égales à Bullet

# text
seg-530c87bbff78 = <b>MODELLED</b> Un ajustement par moindres carrés biais plus pente sur une fenêtre glissante, plus les principaux termes périodiques — annuel, semi-annuel et les deux principales marées zonales pour UT1 ; Cha. Référence indépendante (ReferenceImpl) : trois chemins indépendants, dont aucun n'est une valeur publiée de précision de prévision. ({ "1" }) Un signal analytique à coefficients connus — la seule façon d'exercer le mécanisme périodique, puisqu'aucune série consignée n'est assez longue pour admettre un terme annuel. ({ "2" }) La solution des moindres carrés en forme close de manuel, une algèbre différente de la résolution matricielle testée, sur des lignes réelles. ({ "3" }) Les véritables lignes archivées de prévision du Bulletin A que le

# text
# c1: label
seg-a233df86be95 = Budget de prévision du référentiel lunaire / de l'orientation de la Terre en temps réel. Forme close VALIDATED : le bras de levier L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ recoupé avec l'angle de rotation de la Terre du CIO. Données réelles VALIDATED : les courbes d'erreur de prévision d'UT1 et du mouvement du pôle L18 lues directement sur la vraie série IERS finals2000A (Bulletin A rapide contre Bulletin B final, et persistance sur plusieurs jours sur les vraies lignes quotidiennes). DERIVED : le référentiel (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-60e7ee7e6e3e = Forme close VALIDATED (le bras de levier L19, ω⊕ recoupé avec l'angle de rotation de la Terre du CIO) et données réelles VALIDATED (la courbe L18 lue sur les vraies lignes de finals2000A) ; sont MODELLED les ordres de grandeur de covariance d'OD du relais lunaire et le plancher de réalisation du référentiel (allocations représentatives) ainsi que le prédicteur de persistance (et non l'algorithme opérationnel du Bulletin A de l'IERS). (catalogue des types de scénario (<c1/>))

# text
seg-ddf4702f78e5 = Honnêteté : forme analytique fermée VALIDATED (le bras de levier L19, omega_earth recoupé avec l'angle de rotation de la Terre CIO) et données réelles VALIDATED (les courbes UT1 et de mouvement polaire L18 tirées des lignes réelles de finals2000A). Plancher de réalisation du référentiel DÉRIVÉ (le résidu post-ajustement de Helmert). MODELLED sont les ordres de grandeur de covariance d'OD du relais lunaire ({ "0.27" } m en post-traitement, ~{ "14.4" } m en temps réel avec une latence d'une heure — un chiffre arrondi, non déduit par calcul inverse, all (commentaire du fichier de scénario, lignes { "27" } à { "32" })

# text
seg-bc51b666d070 = L'erreur de prédiction de l'orientation de la Terre de type opérationnel, mesurée en comparant prédiction et valeur finale, est MODELLED, non validée : vérifiée par rapport à une autre implémentation de ce même code source — indépendante de l'unité testée, mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-653fad5e0afe = <s1>Précédent</s1>quantum-trade

# text
seg-5abe534d4ef1 = <s1>Suivant</s1>reentry
