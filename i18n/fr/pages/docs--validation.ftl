# docs--validation: translations (fr)

# text
seg-70860389903a = Horloge

# text
seg-583dc9ff6178 = Bibliothèque

# attr:aria-label, text
seg-d01db1c2710a = Référence

# text
seg-619f89bf160c = Réalisation du référentiel lunaire

# text
seg-2db69c58f694 = PNT différentiel lunaire

# text
seg-2eb6d1b0483d = RAIM / ARAIM

# text
seg-da3532b1444d = SBAS / DO-229E

# text
seg-d3af26f389f5 = IONEX / Klobuchar

# text
seg-d6476863f862 = Capacité

# text
seg-ad856ad710eb = État

# text
seg-d12d4565b01d = VLBI géodésique lunaire, chemin par noyau

# text
seg-5ed34a5b402e = OD multi-technique conjointe lunaire + horloge

# text
seg-4bcec6e2dd9f = Volume de service de navigation lunaire

# text
seg-c04a3591074c = Export d'interopérabilité lunaire

# text
seg-20fee61b3107 = Bibliothèque de modèles d'erreur de dispositifs quantiques

# text
seg-eaf341ff4522 = Navigation quantique sans GNSS

# text
seg-75636f9419b2 = Limites connues

# text
seg-9c0eb89a2fbe = Paquet

# text
seg-f63dd3d7aad4 = Source

# text
seg-638b8d451550 = Capteur

# text
seg-04f69a0edb2f = type

# text
seg-b03d56f501c3 = Type

# text
seg-35bf9a48e566 = Terme

# text
seg-f3526b0d95f8 = Mesuré

# text
# c1: KSHANA_KFGINS_DIR
seg-fea9287d6533 = Portée honnête : ceci valide le <b>modèle d'erreur stochastique</b> par rapport aux coefficients d'Allan des fiches techniques. Le jeu de données de véhicule i2Nav-WHU (WHU : université de Wuhan) <b>KF-GINS</b> sert de vérification distincte, conditionnée par la disponibilité des données : l'EKF à boucle fermée sur l'état d'erreur, faiblement couplé, avec le modèle de bras de levier GNSS, est une ligne VALIDATED de la <a1>matrice de vérification</a1> (<em>EKF GNSS/INS faiblement couplé avec bras de levier sur le jeu de données KF-GINS</em>), comparée à la trajectoire de référence C++ de KF-GINS selon des seuils enregistrés avant l'exécution. Il ne s'exécute que lorsque le jeu de données est fourni (<c1/>) ; sans lui, ce sont le chargeur synthétique et les tests de bras de levier qui s'exécutent. Les variantes à couplage serré et à phase de la porteuse ne sont pas couvertes par cette ligne (la ligne GNSS/INS à couplage serré avec phase de la porteuse est MODELLED).

# text
# c1: src/body.rs
# c2: src/mars_frame.rs
# c3: src/ephem_provider.rs
# c4: src/radiometric.rs
# c5: src/timescales.rs
seg-f0ab98c1a79d = PNT pour l'espace lointain et Mars — fondation D0 (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

# text
# c1: tests/cross_platform_golden.rs
# c2: tests/golden.rs
seg-bd222b27949c = Le premier jalon du moteur de navigation pour l'espace lointain : généraliser le noyau, codé en dur pour la Terre, à un corps central arbitraire, ajouter la dynamique martienne, une interface de fournisseur d'éphémérides, un temps de précision inférieure à la microseconde, et les primitives de temps de lumière et de retard relativiste. <b>Chaque scénario terrestre existant est identique à l'octet près</b> — les références d'or de reproductibilité multiplateforme (<c1/>, <c2/>) passent sans modification et sans régénération, ce qui est vérifié à chaque commit.

# text
seg-e0cdbfcbb28a = Abstraction du corps central (Terre identique à l'octet près)

# text
# c1: src/body.rs
# c2: Body{mu,re,zonals,gravity,rotation,IAU-pole}
# c3: earth()/mars()/moon()/sun()
# c4: tests/mars_dynamics.rs
# c5: two_body_accel_body(r,&Body::earth())
# c6: zonal_accel_body
# c7: assert_eq!
# c8: ForceModel
seg-7d20649189fa = <c1/> : <c2/> avec <c3/>. <c4/> vérifie que <c5/> et <c6/> sont égales aux fonctions terrestres historiques par <b>égalité exacte au bit près</b> (<c7/>), et qu'un arc terrestre avec <c8/> par défaut est identique à l'octet près — les références d'or de reproductibilité sont inchangées (même SHA, sans régénération).

# text
seg-658acc8112e3 = Gravité de Mars (GMM-3 (GMM : Goddard Mars Model) tesséral, lié au corps)

# text
# c1: Body::mars_gmm3(nmax)
# c2: C̄n0=−Jn/√(2n+1)
# c3: tests/mars_dynamics.rs
# c4: .gfc
# c5: gravity_sh::from_gfc
seg-9b058665cf4b = <c1/> : zonaux C̄20/C̄30/C̄{ "40" } issus de J2/J3/J4 de MRO110 (solution de gravité de Mars Reconnaissance Orbiter) (<c2/>, J2 revient à { "1.9604e-3" } après aller-retour) + sectoriels/tesséraux C̄22/S̄{ "22" }, C̄32/S̄{ "32" } de MRO110B2 (Konopliv et al. { "2011" } ; tabulés dans Liu, Baoyin & Ma { "2012" }), évalués dans le référentiel IAU lié à Mars. <c3/> vérifie l'aller-retour, l'écart d'échelle J2 par rapport à la masse ponctuelle, et que le champ est réellement lié au corps (une réorientation d'un quart de jour martien modifie l'accélération inertielle). Un degré/ordre plus élevé se charge depuis un fichier <c4/> intégré au dépôt via <c5/>.

# text
seg-1dcbee768418 = Référentiel lié à Mars (pôle IAU)

# text
# c1: src/mars_frame.rs
# c2: R3(W)·R1(90°−δ0)·R3(90°+α0)
# c3: lunar_frame.rs
# c4: prime_w_dot
seg-0708e5b37d69 = <c1/> : la rotation IAU 3-1-3 <c2/> (convention WGCCRE/NAIF (WGCCRE : Working Group on Cartographic Coordinates and Rotational Elements), identique à <c3/>). Tests : orthonormée à { "1e-12" } près avec det +{ "1" }, identité après aller-retour, le méridien origine avance de <c4/> par jour.

# text
seg-5b6355a143c7 = Propagation centrée sur Mars / sur le Soleil

# text
# c1: validated
seg-4ab87f666765 = <c1/> (autocohérence)

# text
# c1: tests/mars_propagation.rs
seg-12e3d173340b = <c1/> : une orbite basse martienne revient à son point de départ après une période képlérienne (fermeture) ; l'énergie spécifique ε=v²/2−μ/r dérive de <{ "1e-9" } sur l'arc ; la régression séculaire du nœud due à J2 de Mars concorde avec le taux analytique de Vallado (calculé indépendamment ≈ −{ "5.15" } °/jour à { "60" }° d'inclinaison) à { "3" } % près ; une orbite héliocentrique retrouve l'année martienne d'environ 687 jours (vis-viva + récupération indépendante de la période à partir de l'arc). Aucune donnée externe.

# text
seg-acff4c016089 = Validation croisée avec DE440 (Mars héliocentrique)

# text
# c1: xval/anise-mars-od/
# c2: xval/anise-lunar-od
# c3: de440s.bsp
# c4: c1c7fee…b260a49f2
# c5: $KSHANA_ANISE_DE440S
# c6: workflow_dispatch
seg-ed164e298754 = <c1/> (EXCLU de l'espace de travail ; ANISE sous MPL-2.0 confiné à son propre Cargo.lock ; calqué sur <c2/>) : compare la propagation de Mars centrée sur le Soleil de Kshana à JPL DE440 (via ANISE), la vérité de Horizons étant citée mot pour mot (provenance + SHA-256). <b>Résultat reproduit</b> (date julienne (JD) initiale { "2459580.5" } TDB (temps dynamique barycentrique), <c3/> SHA-256 <c4/>) : résidu de position <b>{ "137" } m pour un arc de 1 jour</b> ({ "5.97" }×{ "10" }⁻¹⁰ de la distance héliocentrique de { "2.299" }×10¹¹ m), croissant jusqu'à { "3.3" } km à { "5" } j, { "87.9" } km à { "30" } j, { "1.71" } Mm à { "90" } j — le résidu <em>croît</em> avec la longueur de l'arc parce qu'un modèle à deux corps centré sur le Soleil omet délibérément les perturbations planétaires (celles de Jupiter surtout) et le mouvement interne du système martien que porte l'éphéméride du barycentre DE440 ; cette croissance est donc la signature honnête de la dynamique à n corps non modélisée, et non une erreur de l'intégrateur ; un arc court restant une infime fraction de la distance héliocentrique confirme que la mécanique centrée sur le Soleil est correcte. Ne s'exécute que lorsque le noyau DE440 est présent (<c5/>, ou récupéré automatiquement, ~{ "32" } Mo) — une vérification manuelle / <c6/> de niveau DE, <b>et non</b> une barrière CI par défaut, de sorte que le crate publié et toutes les barrières par défaut restent inchangés à l'octet près.

# text
seg-a7d79066a53b = Temps de lumière + retard de Shapiro

# text
# c1: src/radiometric.rs
seg-798148171dab = <c1/> : la solution itérative du temps de lumière à l'époque retardée (converge à |Δτ|<{ "1e-12" } s, plafonnée) et le retard de Shapiro Δt=(2μ/c³)·ln[(r1+r2+r12)/(r1+r2−r12)]. Tests : Terre–Soleil ≈ { "499" } s et Terre–Lune ≈ { "1.28" } s via l'éphéméride intégrée ; un émetteur synthétique à vitesse constante retrouve la solution retardée analytique à <{ "1e-9" } s près (solveur démontré indépendant de toute éphéméride réelle) ; Shapiro concorde exactement avec une valeur calculée à la main et donne ~{ "100" }–{ "250" } µs pour un rayon rasant de conjonction supérieure Terre–Mars.

# text
seg-1bc28f6bdc8f = Interface de fournisseur d'éphémérides

# text
# c1: src/ephem_provider.rs
# c2: trait EphemerisProvider
# c3: BuiltinEphemeris
# c4: None
# c5: LunarEnvironment
# c6: AniseLunarEnvironment
seg-34d6a07ad252 = <c1/> : <c2/> + <c3/> sans noyau (Soleil/Lune de Montenbruck–Gill, géocentrique) ; renvoie <c4/> pour les corps pour lesquels il n'a pas de série (par exemple Mars), pour lesquels le fournisseur ANISE de niveau DE est la voie à suivre — la même séparation intégré/ANISE que <c5/>/<c6/>.

# text
seg-5e1fed7a98c0 = Temps en deux parties + TT↔TDB

# text
# c1: src/timescales.rs
# c2: TwoPartJd{day,frac}
# c3: tt_to_tdb
# c4: tdb_to_tt
seg-5ebca9b5f2db = <c1/> : un <c2/> avec accumulation à deux sommes de Knuth retrouve des intervalles inférieurs à la microseconde que le JD en f64 simple perd près de J2000 (meilleur de plus de { "1000" }×, testé) ; <c3/>/<c4/> utilisent la série périodique dominante de Fairhead–Bretagnon (|TDB−TT|≲{ "1.7" } ms, vérifiée à la main à J2000). Additif — le chemin temporel existant en f64 simple est inchangé.

# text
# c1: src/radiometric.rs
# c2: src/ccsds_tdm.rs
seg-d2da2e1d1711 = Observables radiométriques de l'espace lointain et message de données de poursuite CCSDS — D1 (<c1/>, <c2/>)

# text
# c1: sigma
seg-b98f508f2375 = Le deuxième jalon du moteur de navigation pour l'espace lointain : le <b>modèle d'observables</b> qui transforme le noyau de temps de lumière et de retard relativiste de D0 en grandeurs effectives que rapporte une passe de poursuite du Deep Space Network (DSN) ou d'ESTRACK (European Space Tracking network) — distance, Doppler à un, deux ou trois trajets, transpondeur cohérent à rapport de transposition, mesure de distance régénérative/PN (PN : pseudo-bruit), Δ-DOR (DOR : differential one-way ranging), et milieux de propagation — ainsi que l'entrée/sortie du <b>message de données de poursuite (TDM) CCSDS (Consultative Committee for Space Data Systems) 503.0-B</b>, qui ingère et émet un fichier de poursuite d'agence standard. <b>Portée honnête :</b> il s'agit de <b>modèles géométriques exacts</b> suivant les conventions de Moyer / CCSDS ; le <em>bruit</em> de mesure est le <c1/> par observation fourni par l'appelant, et non intégré au modèle. Reproduire une <em>passe de poursuite réelle donnée</em> nécessite de vraies données TDM ainsi que le solveur de détermination d'orbite pour l'espace lointain — c'est <b>D2</b>, et non D1. Tout ce qui suit est additif (les références d'or de reproductibilité sont inchangées ; même SHA, sans régénération).

# text
seg-d1d2dc7906c8 = Distance et Doppler à 1/2/3 trajets (résolution à deux segments de Moyer)

# text
# c1: src/radiometric.rs
# c2: one_way_range
# c3: two_way_range
# c4: ρ₂ = c·(τ_up + τ_down)
# c5: one_way_doppler
# c6: two_way_doppler
# c7: three_way_doppler
# c8: f_D = −(M·f_ul/c)·(ρ̇_up + ρ̇_down)
# c9: c·τ
# c10: −(f/c)·ρ̇
seg-e2176b844df8 = <c1/> : <c2/>/<c3/> composent les solutions de temps de lumière retardée (segment descendant) et avancée (segment montant) de D0 ; la convention complète de l'aller-retour est <c4/> (m), documentée et cohérente. <c5/>/<c6/>/<c7/> forment le décalage de porteuse <c8/> (Hz) à partir de la vitesse de variation de la distance sur la ligne de visée, <b>convention de signe : un engin spatial qui s'approche donne un décalage positif (vers le bleu)</b>. Tests : distance à deux trajets = somme des segments à <{ "1" } mm près (~{ "2" } UA d'aller-retour Terre–Soleil) ; distance à un trajet = <c9/> exactement ; le Doppler à un trajet concorde avec l'expression analytique <c10/> pour un émetteur radial à vitesse constante, au ppt près ; à trois trajets avec des stations colocalisées, le résultat se réduit à l'identique, à l'octet près, à celui à deux trajets.

# text
seg-638697be5b5b = Transpondeur cohérent à rapport de transposition (rapports DSN exacts)

# text
# c1: turnaround_ratio
# c2: M = f_down/f_up
# c3: two_way_doppler_coherent
# c4: two_way_doppler
seg-781aa4041c58 = <c1/> : les nombres rationnels exacts de transposition DSN/CCSDS <c2/> (Moyer §{ "13" } ; DSN 810-005 module 201/214) — S/S 240/221, S/X 880/221, X/S 240/749, X/X 880/749, X/Ka 3344/749, Ka/Ka 3360/3599. Testés pour l'égalité exacte ; une paire de bandes non définie <b>provoque un panic</b> (échec bruyant, n'invente jamais de rapport). <c3/> applique la porteuse de bande et le rapport de bout en bout et égale le <c4/> explicite à la précision machine.

# text
seg-f24f9da1570c = Mesure de distance régénérative / PN (CCSDS { "414" } ; ambiguïté)

# text
# c1: src/radiometric.rs
# c2: regenerative_range_ambiguity
# c3: c/(2·chip_rate)
# c4: pn_range_ambiguity
# c5: c·L/(2·f_chip)
seg-1abd8c221e8d = <c1/> : <c2/> = <c3/> (la distance non ambiguë à l'échelle de la résolution par élément de code) et <c4/> = cette valeur × la longueur du code (la distance non ambiguë du code PN complet <c5/>), selon CCSDS 414.1-B. Testé : une horloge de mesure de distance de { "1" } MHz donne ~{ "149.9" } m ; le code PN à vote pondéré CCSDS-414.1 ({ "1 009 470" } éléments) à { "1" } Mélément/s donne la distance non ambiguë nominale d'environ { "151 000" } km ; doubler le rythme des éléments divise par deux l'ambiguïté par élément.

# text
seg-16b9fdd916a7 = Δ-DOR (CCSDS { "506" } plan du ciel)

# text
# c1: delta_dor
# c2: Δτ = −B⃗·(ŝ_sc − ŝ_quasar)/c
# c3: B⃗
# c4: −B·sin(Δθ)/c
# c5: |Δτ| ≈ B·Δθ/c
seg-93055e944306 = <c1/> : le retard différentiel dans le plan du ciel <c2/> (s) pour une base d'interféromètre <c3/> (CCSDS 506.1-B). Testé : concorde avec la projection analytique exacte <c4/> pour un décalage connu aligné sur la base à { "1e-15" } s près, avec l'amplitude aux petits angles <c5/>, et avec le <b>cas nul</b> (un engin spatial coaligné avec le quasar donne exactement un retard différentiel nul).

# text
seg-4e5258bb04d5 = Étalonnage du plasma en 1/f² à deux fréquences

# text
# c1: src/radiometric.rs
# c2: solar_plasma_delay
# c3: K_PLASMA·TEC/(c·f²)
# c4: 1/f²
# c5: K_PLASMA = 40.3 m·Hz²·TECU⁻¹
# c6: coronal_tec_from_sep
# c7: TEC ∝ 1/sin(SEP)
# c8: dual_freq_plasma_calibration
# c9: K_disp = (Δt_X−Δt_Ka)/(1/f_X²−1/f_Ka²)
# c10: d_X/d_Ka = (f_Ka/f_X)²
# c11: dual_frequency_recovers_injected_plasma
seg-e3b340103825 = <c1/> : <c2/> = <c3/> (le retard de groupe dispersif des particules chargées en <c4/>, <c5/>) ; <c6/> la colonne de couronne de type Cassini en <c7/> (substitut analytique, et non une couronne étalonnée) ; <c8/> l'inversion de dispersion <c9/> que le DSN utilise pour supprimer le plasma. Testé : la loi en 1/f² <c10/> ; la couronne s'intensifie à l'approche de la conjonction ; et un <b>TEC injecté est retrouvé à <{ "1" } % près</b> (en fait ≪ { "1e-9" } sans bruit) — <c11/>.

# text
seg-e1e265ab499a = Milieux tropo / iono (réutilisation des modèles GNSS)

# text
# c1: tropo_delay
# c2: iono_delay
# c3: gnss_sim::tropo_delay_m
# c4: gnss_sim::klobuchar_delay_m
seg-2d9aa52f318b = <c1/>/<c2/> : le segment de station sol de l'espace lointain traverse la même atmosphère terrestre que le paquet GNSS modélise déjà ; ces fonctions délèguent donc à <c3/> (zénith de Saastamoinen + fonction de projection de Niell, non dispersif) et à <c4/> (iono diffusée). Testé : câblage vérifié et signe physique correct : tropo positive et plus grande à basse élévation qu'au zénith ; iono, un retard oblique non négatif (la fidélité numérique relève des propres tests du paquet GNSS, référencés aux fiches techniques).

# text
seg-44ba6e0411fd = Analyse / émission CCSDS-TDM { "503" } + passerelle radiométrique

# text
# c1: src/ccsds_tdm.rs
# c2: META_START…META_STOP
# c3: DATA_START…DATA_STOP
# c4: RANGE
# c5: DOPPLER_*
# c6: ANGLE_*
# c7: *_FREQ
# c8: #[cfg(test)]
# c9: tests/fixtures/deepspace/reference.tdm
# c10: to_radiometric_obs
# c11: RANGE
# c12: DOPPLER_*
# c13: RadiometricObs
# c14: PATH
# c15: 1,2
# c16: 1,2,1
# c17: 1,2,3
# c18: TRANSMIT_BAND
# c19: sigma
# c20: 0.0
seg-18eafe936dcb = <c1/> : un lecteur <b>et</b> écrivain CCSDS 503.0-B-2 KVN (keyword-value notation) (en-tête + segments <c2/> / <c3/> ; enregistrements <c4/>/<c5/>/<c6/>/<c7/>). Tests (<c8/> + <c9/>) : le fichier de référence est analysé en champs nommés attendus ; <b>analyse→émission→analyse donne une structure égale</b> (aller-retour sémantique) ; la passerelle <c10/> convertit les enregistrements non ambigus <c11/>/<c12/> en <c13/> (trajets déduits de <c14/> <c15/>/<c16/>/<c17/>, bande déduite de <c18/>, km→m) ; un fichier multisegment réinitialise la machine à états. <b>Omission honnête plutôt que supposition :</b> les angles et fréquences, les bandes inconnues, les époques en jour de l'année et les échelles de temps non reconnues sont <b>omis</b>, jamais mal convertis, et <c19/> est laissé à <c20/> pour que l'appelant le pondère.

# text
seg-e8ca55dd29b1 = Benchmark DSN/ESTRACK (précision du modèle ≫ plancher publié)

# text
# c1: tests/radiometric_benchmark.rs
# c2: v/(1+v/c)
seg-247b9e7b2be8 = <c1/> : les observables sont des calculs géométriques exacts ; le benchmark honnête consiste donc à montrer que l'<b>erreur numérique propre du modèle est très inférieure au plancher de mesure DSN/ESTRACK publié</b> — le modèle n'est pas le goulot d'étranglement de la précision, c'est le σ fourni par l'appelant. Chaque test calcule une observable de deux manières indépendantes (ou retrouve une vérité injectée) et vérifie que le résidu est inférieur au plancher : la <b>distance</b> revient à <{ "1" } mm près ≪ le plancher d'environ { "1" } m de la mesure de distance PN (DSN 810-005 mod. { "214" } / CCSDS 414.1-B) ; le <b>Doppler</b> concorde avec la vitesse de variation de distance retardée en forme close exacte <c2/> à ~{ "10" }⁻⁶ m/s près, soit plusieurs × sous le plancher de bande X d'environ { "0.05" } mm/s (DSN 810-005 mod. { "203" } / Moyer) — le résidu est le plancher de différenciation de distance en f64 à ~{ "1" } UA, une caractéristique numérique et non une erreur de modélisation ; le <b>Δ-DOR</b> reproduit la projection en forme close avec un angle équivalent dans le plan du ciel ≪ { "1" } nrad ≪ le plancher d'environ { "1" }–{ "10" } nrad (DSN 810-005 mod. { "210" } / CCSDS 506.1-B) ; le <b>plasma</b> à deux fréquences retrouve le retard injecté à ≪ { "1" } % près ; et le retard de <b>Shapiro</b> se situe dans la bande publiée d'environ { "100" }–{ "250" } µs de conjonction Terre–Mars. Les chiffres publiés sont énoncés et présentés comme des spécifications DSN en <b>ordre de grandeur</b>, et non comme des nombres exacts inventés, et la documentation du module précise explicitement que ceci évalue la PRÉCISION DU MODÈLE, et non la reproduction d'une passe réelle (cela relève de D2 + de vrais TDM).

# text
# c1: src/deepspace_od.rs
# c2: src/clock_state.rs
# c3: src/mars_atmos.rs
seg-2a25e6a8a5b1 = DO en dynamique réduite pour l'espace lointain — D2 (<c1/>, <c2/>, <c3/>)

# text
# c1: xval/anise-mars-od
seg-0d7a1b75a0ea = Le troisième jalon du moteur de navigation pour l'espace lointain : l'<b>estimateur</b> qui transforme les observables radiométriques de D1 en trajectoire retrouvée — un filtre d'information en racine carrée (SRIF) numériquement robuste, avec des accélérations empiriques en dynamique réduite, une horloge embarquée à trois états, un modèle de traînée martienne, et les dérivées partielles de mesure radiométrique qui relient distance et Doppler à l'état du filtre, le tout bouclé de bout en bout par une récupération synthétique de détermination d'orbite en orbite basse martienne (LMO). <b>Portée honnête :</b> la récupération est une <b>boucle fermée synthétique</b> (la vérité et le filtre partagent le même propagateur martien, et les observations sont le même modèle géométrique d'observables que le filtre inverse, plus un bruit gaussien injecté) — elle valide la <b>mécanique de l'estimateur</b>, et non la fidélité absolue du modèle de forces martien ; la vérification croisée externe de niveau DE est le crate <c1/> conditionné par le noyau (D0.8b). Tout ce qui suit est additif (les références d'or de reproductibilité sont inchangées ; même SHA, sans régénération).

# text
seg-51f203291066 = Noyau SRIF (filtre d'information en racine carrée)

# text
# c1: Srif
# c2: R
# c3: Λ = RᵀR
# c4: b
# c5: Vec<f64>
# c6: gauss_newton
# c7: srif_matches_batch_on_linear
# c8: P = R⁻¹R⁻ᵀ
# c9: srif_covariance_is_spd
# c10: P
seg-9d5fd8c1d37d = <c1/> : un filtre d'information en racine carrée de Bierman écrit à la main — <c2/> triangulaire supérieure avec <c3/>, vecteur d'information <c4/>, mises à jour de mesure et de temps par Householder, arithmétique <c5/> nue (sans nalgebra). Tests : le SRIF séquentiel concorde avec la solution des moindres carrés pondérés par lot (<c6/>) en <b>état comme en covariance à { "1e-9" } près</b> sur un problème linéaire-gaussien conçu à cet effet (<c7/>) ; la covariance retrouvée <c8/> est <b>symétrique ({ "1e-12" }) et définie positive par construction</b> après une longue séquence de mises à jour de mesure et de temps (<c9/>, la factorisation de Cholesky réussit) ; et l'information s'accumule (la trace de <c10/> décroît de façon monotone à mesure que des mesures de géométrie identique sont intégrées).

# text
seg-f9ffa1ef4688 = Accélérations empiriques en dynamique réduite (réglage croisière↔LMO)

# text
# c1: ReducedDynamicOd
# c2: [r; v; a_emp]
# c3: dynamic_tightness
# c4: reduced_dynamic_tracks_maneuver
# c5: tuning_is_a_continuum
seg-b0612a7140c3 = <c1/> : le filtre à neuf états <c2/> avec des accélérations empiriques RTN comme états de processus de Gauss–Markov du premier ordre, la technique de dynamique réduite de JPL/ESOC exposée sous la forme d'un unique réglage <c3/> (quasi dynamique ⇒ lisse le bruit sur un arc balistique ; quasi cinématique ⇒ l'étage empirique absorbe une manœuvre ou une traînée non modélisée). Tests : un filtre quasi cinématique suit une <b>manœuvre en échelon (propulseur)</b> avec un résidu inférieur à <½ de celui du filtre quasi dynamique, tandis que le filtre quasi dynamique <b>lisse mieux un arc balistique bruité</b> (<c4/>) ; faire varier la rigidité déplace le résidu après ajustement <b>de façon monotone</b>, un continuum et non un commutateur (<c5/>).

# text
seg-9d5db4d63990 = Horloge embarquée à 3 états (phase/fréq./dérive, Q de van Loan, Allan)

# text
# c1: ClockState3
# c2: Q
# c3: T⁵
# c4: Q/R
# c5: ClockClass
# c6: σ_y(1 s)
# c7: Δv = c·σ_y
seg-fe5beef74e24 = <c1/> : état d'erreur de phase + fréquence fractionnaire + dérive de fréquence avec le <b>bruit de processus discret exact de van Loan</b> et une mise à jour stabilisée de Joseph. Tests : le <c2/> discrétisé concorde avec le polynôme de van Loan établi à la main <b>à { "1e-12" } près</b> et <b>se réduit exactement au Q de la KalmanClock à deux états lorsque la dérive = { "0" }</b> (un sur-ensemble strict) ; une marche libre en plusieurs pas fait croître la variance de phase jusqu'à la relation analytique de holdover de NIST SP { "1065" } via le terme de marche aléatoire en <c3/> ; l'état de dérive <b>retrouve une rampe de vieillissement réelle à <{ "5" } % près</b> ; un <b>profil d'Allan de classe USO est retrouvé</b> (ADEV recouvrant à τ={ "1" } s dans la barrière d'étalonnage) et l'estimateur reste cohérent au sens du NEES (>{ "95" } % dans 3σ) et défini positif tout au long d'une exécution à <c4/> sévère. <c5/> porte les valeurs <c6/> citées de CSAC/USO/DSAC (USO : oscillateur ultrastable ; DSAC : Deep Space Atomic Clock) et le plancher Doppler <c7/>.

# text
seg-8666d18daa2b = Traînée atmosphérique martienne (Mars-GRAM-lite (GRAM : Global Reference Atmospheric Model))

# text
# c1: src/mars_atmos.rs
# c2: ..._scaled
seg-6a64c2b9e553 = <c1/> : un profil de densité neutre martienne exponentiel par morceaux (surface ~{ "0.020" } kg/m³, hauteur d'échelle près de la surface ~{ "11" } km, la moyenne à faible teneur en poussière de Mars-GRAM { "2010" } / MCD (Mars Climate Database)) et l'accélération de traînée quadratique prise relativement à l'atmosphère martienne <b>en corotation</b>, plus une variante <c2/> que le SRIF peut multiplier. Tests : la densité décroît de façon monotone et continue d'une bande à l'autre, la hauteur d'échelle près de la surface retrouvée est la valeur physique d'environ { "11" } km, la traînée est <b>strictement antiparallèle à la vitesse relative</b> (le produit vectoriel s'annule à { "1e-12" } près) avec une grandeur raisonnable d'environ { "3e-4" } m/s² en LMO, et elle est linéaire en le terme balistique. <b>Portée honnête :</b> une atmosphère d'ingénierie représentative, et non un Mars-GRAM/MCD validé en vol avec dépendance à la poussière, à la saison et à l'heure locale.

# text
seg-452f32dace80 = Dérivées partielles de mesure radiométrique (distance/Doppler) pour le SRIF

# text
# c1: range_observable
# c2: range_rate_observable
# c3: ρ = |r_sc − r_sta|
# c4: ρ̇ = û·(v_sc − v_sta)
# c5: ∂ρ̇_obs/∂y = c
# c6: range_partial_matches_finite_difference
# c7: range_rate_partials_match_finite_difference
# c8: radiometric_update_reduces_covariance_in_observed_direction
# c9: range_rate_update_observes_velocity
seg-6661d241cdaf = <c1/> / <c2/> : les dérivées partielles de la distance sur la ligne de visée <c3/> (∂ρ/∂r = û, ∂ρ/∂v = { "0" }) et de la vitesse de variation de distance <c4/> (∂ρ̇/∂v = û, ∂ρ̇/∂r = (v_rel − ρ̇·û)/ρ) qui relient les observables de D1 à l'état du filtre, plus la dérivée partielle de fréquence d'horloge du Doppler à un trajet <c5/>. Tests : les deux dérivées partielles concordent avec une <b>différence finie centrée de l'observable à { "1e-6" } près</b> (<c6/>, <c7/>) ; une seule mise à jour de distance <b>réduit la covariance dans la direction observée (ligne de visée, LOS) d'un facteur ≫{ "1000" }</b> et la maintient définie positive (PD), et une mise à jour Doppler réduit la variance de <b>vitesse</b> sur la LOS (<c8/>, <c9/>).

# text
seg-9a2cb6292477 = DO de bout en bout en LMO martienne à partir de données radiométriques

# text
# c1: tests/mars_lmo_od.rs
# c2: Body::mars_gmm3(4)
# c3: xval/anise-mars-od
seg-6318968b683a = <c1/> : un arc de vérité en orbite basse martienne propagé sous la gravité <c2/> génère des mesures bruitées de <b>distance à deux trajets (σ={ "1" } m) + Doppler (σ={ "0.1" } mm/s)</b> vers deux stations de poursuite ; le SRIF en dynamique réduite le retrouve à partir d'un état initial <b>perturbé d'environ { "2.7" } km</b>. Résultat obtenu : <b>RMS de position convergée ≈ { "0.2" } m</b> (inférieur au mètre, bien en deçà du critère de réussite de quelques mètres à quelques dizaines de mètres) sur un arc de 3 orbites à cadence de { "30" } s, avec la <b>covariance factorisée définie positive à chaque époque</b> (la garantie du SRIF, vérifiée tout au long). Le <b>continuum de réglage croisière→LMO</b> est exercé de bout en bout : avec une vérité de traînée non modélisée que le modèle du filtre ne possède pas, le réglage en dynamique réduite (rigidité { "1" }) converge à ~{ "14" } m contre ~{ "677" } m pour l'exécution quasi dynamique (rigidité { "0" }) — une amélioration de { "48" }× due à l'étage empirique qui absorbe la traînée. <b>Portée honnête :</b> boucle fermée synthétique (vérité = le même propagateur que celui du filtre) ; la vérification croisée externe de niveau DE est <c3/>, conditionnée par le noyau (D0.8b), jamais exécutée ici, sans réseau.

# text
# c1: src/mars_pnt.rs
# c2: src/deepspace_od.rs
seg-559176eb1a82 = Scénario PNT pour l'espace lointain et fusion à un trajet + deux trajets — D3 (<c1/>, <c2/>)

# text
# c1: mars-pnt
seg-bdb5da496071 = Le quatrième jalon du moteur de navigation pour l'espace lointain : un <b>scénario de produit PNT martien</b> exécutable qui relie le corps / référentiel martien de D0, les observables radiométriques de D1 et la DO en dynamique réduite de D2 en un unique type de scénario <c1/>. Il modélise une petite <b>constellation relais de style MARCONI</b> qui diffuse un signal dans l'espace à un trajet (couplé à l'horloge) et relaie en outre une liaison à deux trajets (cohérente, indépendante de l'horloge) vers une station de l'espace lointain, et il navigue trois utilisateurs de référence (transfert vers Mars, orbiteur en orbite basse martienne, point fixe de surface) à l'aide de l'<b>estimateur de fusion conjoint à un trajet + deux trajets de D3.1</b> — un SRIF à douze états qui augmente le bloc orbite/empirique en dynamique réduite de D2 d'une horloge embarquée à trois états. <b>Portée honnête :</b> chaque chiffre de mérite est la <b>borne de covariance formelle</b> de l'estimateur (position à 1σ / 3σ par époque) et le RMS atteint par rapport à une vérité en <b>boucle fermée synthétique</b> (la vérité et le filtre partagent la même dynamique martienne et le même modèle géométrique d'observables, plus un bruit gaussien injecté) — un chiffre de mérite de navigation simulé, <b>et NON</b> un niveau de protection certifié pour l'aviation, <b>et NON</b> une affirmation de vol (pas de modèle de pannes certifié, pas de moniteur d'intégrité, pas de données de poursuite réelles). Tout ce qui suit est additif (les références d'or de reproductibilité sont inchangées ; même SHA, sans régénération).

# text
seg-b81920d2df82 = Fusion radiométrique conjointe à un trajet + deux trajets (la fusion bat chacun seul)

# text
# c1: FusionOd
# c2: ClockState3
# c3: ∂ρ̇_obs/∂y = c
# c4: fused_observable
# c5: src/deepspace_od.rs
# c6: #[cfg(test)]
seg-cd9d2a7dd08f = <c1/> : le SRIF en dynamique réduite D2.2 augmenté des trois états d'horloge embarquée (<c2/>), qui ingère une série temporelle mixte de distance/Doppler à <b>deux trajets</b> (indépendants de l'horloge, fixant l'orbite — colonnes d'horloge nulles dans la dérivée partielle) et à <b>un trajet</b> (couplés à l'horloge — la dérivée partielle de fréquence <c3/>) via <c4/>. La structure d'étalonnage puis de marche libre : les passes à deux trajets fixent l'orbite, puis les données à un trajet étalonnent l'horloge et prolongent l'orbite entre les passes avec une erreur bornée par la stabilité d'Allan de l'horloge. Testé dans <c5/> <c6/> : la solution <b>fusionnée</b> bat <b>chaque type de liaison seul</b> ; l'erreur de marche libre d'une exécution à un trajet seul croît avec l'intervalle entre passes à deux trajets, conformément à la borne d'Allan de la classe d'horloge ; la covariance conjointe reste SPD (symétrique définie positive) tout au long.

# text
seg-26a4bfa8e6ad = Constellation MARCONI (rayon aréostationnaire, occultation)

# text
# c1: MarconiConstellation
# c2: r = (μ/ω²)^{1/3} ≈ 20 428 km
# c3: mars_gmm3
# c4: chord_clears_sphere
seg-f2c2e1b83411 = <c1/> : un ensemble de cinq relais — trois relais <b>aréostationnaires</b> à <c2/> (le rayon synchrone de Mars déduit de μ et de la vitesse de rotation publiés ; testé dans la bande <b>{ "20 400" }–{ "20 500" } km</b>) régulièrement espacés de { "120" }° en longitude avec { "5" }° d'inclinaison, plus deux relais sur une orbite circulaire plus haute ({ "1.4" }× l'orbite aréostationnaire) inclinée de { "60" }° pour la couverture dans le plan du ciel. Les états des relais à chaque époque sont intégrés vers l'avant sous la gravité <c3/> ; le test de visibilité par <b>occultation par Mars</b> est la géométrie corde-dégage-sphère (<c4/>, testé : un relais diamétralement opposé est occulté, un relais à la verticale est visible). <b>Portée honnête :</b> une géométrie minimale représentative de diffusion plus relais construite à partir de constantes martiennes publiées — et non la conception d'une constellation de vol précise.

# text
# c1: mars-pnt
seg-b53ea4dd9f7d = Scénario <c1/> accessible via CLI / Python / WASM (WebAssembly) / MCP (Model Context Protocol)

# text
# c1: MarsScenario
# c2: run_mars_pnt
# c3: kind = "mars-pnt"
# c4: src/api.rs
# c5: mars_pnt_kind_round_trips_through_the_dispatch
# c6: scenarios/mars-pnt-lmo.toml
# c7: scenarios/mars-pnt-surface.toml
# c8: scenarios/mars-pnt-transfer.toml
# c9: fom_note
# c10: summary
# c11: to_svg
seg-3a01d13ad2e7 = <c1/> / <c2/> est câblé comme le scénario <c3/> sur toutes les surfaces (D3.3) : l'exécuteur CLI, la liaison Python, la version WASM/playground et le dispatch du serveur MCP y mènent tous (<c4/> test d'aller-retour <c5/>). Scénarios de référence fournis : <c6/>, <c7/>, <c8/>. Le résultat porte une <c9/> explicite qualifiant le chiffre de mérite de borne de covariance (et non de PL certifié), et les sorties <c10/> / <c11/> répètent l'étiquette d'honnêteté.

# text
seg-28a49a455a74 = Objectifs MARCONI / LightShip reproduits : <b>orbiteur < { "100" } m</b>, <b>rover < { "15" } m</b>

# text
# c1: src/lunar_time.rs
seg-37b2bad62854 = Temps-coordonnée lunaire — vitesse relativiste de l'horloge Terre-Lune (<c1/>)

# text
# c1: src/lunar_time.rs
# c2: L_G
# c3: W0 = L_G·c² ≈ 6.26369e7 m²/s²
# c4: GM_moon/R_moon ≈ 2.822e6 m²/s²
# c5: −<v²>/2c²
# c6: src/ephem.rs
# c7: lunar-time-offset
seg-787705fa0fac = Une échelle de temps-coordonnée lunaire (LTC/TCL (TCL : Temps-Coordonnée Lunaire, nom français du temps-coordonnée lunaire)) exige la vitesse séculaire à laquelle une horloge en surface lunaire marche par rapport à une horloge du géoïde terrestre (TT). <c1/> la calcule à partir des premiers principes : une identité post-newtonienne du premier ordre qui somme la <b>différence de potentiel propre</b> (le potentiel conventionnel du géoïde IAU <c2/> <c3/> moins le potentiel propre de la surface de la Lune <c4/>) et le <b>terme cinétique (effet Doppler du second ordre)</b> <c5/> issu de la vitesse géocentrique de la Lune (obtenue par différences finies à partir de la série lunaire de Montenbruck-Gill dans <c6/>). Le terme dominant de potentiel propre donne <b>≈ { "57.5" } µs/jour</b>, le terme cinétique <b>≈ −{ "0.5" } µs/jour</b>, pour un total de <b>≈ { "57" } µs/jour</b>. Le scénario <c7/> rapporte cette vitesse, le décalage LTC−TT accumulé sur un horizon, et prend en charge un ensemble minimal à variance inverse (une horloge papier lunaire) ; les conversions TT↔LTC reviennent à leur valeur de départ à < { "1" } ns/jour près.

# text
seg-beeb6561ef6b = Référence indépendante / portée honnête

# text
seg-4500e65ede97 = Vitesse relativiste de l'horloge Terre-Lune (LTC/TCL)

# text
# c1: lunar_rate_breakdown
# c2: tt_to_ltc
# c3: ltc_to_tt
# c4: lunar_ensemble
# c5: LunarTimeScenario
# c6: L_G
# c7: lunar_time::tests
# c8: W0
# c9: Modelled
seg-4c7a29bc3003 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>. <b>Référence indépendante : une identité relativiste interne en forme close</b> (géopotentiel IAU <c6/> / conventions IERS et potentiel propre GM/r (GM : paramètre gravitationnel, G fois la masse)), <b>recoupée avec la bande publiée de vitesse d'horloge lunaire [{ "56" }, { "59" }] µs/jour</b>. Tests (<c7/>) : le terme de potentiel propre ≈ { "57.5" } µs/jour, la vitesse de la Lune ≈ { "1" } km/s, le terme cinétique un petit négatif, le total dans la bande avec les termes nommés qui le somment, le décalage LTC−TT sur 1 jour ≈ { "57" } µs, et un aller-retour TT↔LTC à < { "1" } ns/jour près. <b>Portée honnête :</b> la valeur phare en µs/jour <b>dépend de la référence</b> — elle dépend des surfaces de référence choisies (géoïde terrestre <c8/> ou sélénoïde lunaire), de la fenêtre de moyennage temporel et des corrections centrifuge/J₂ inférieures à la µs/jour négligées — c'est pourquoi la sortie publiée est une <b>bande</b>, et non un nombre unique certifié. Il s'agit d'une vérification d'autocohérence <c9/>, <b>et NON</b> d'une validation externe, <b>NON</b> d'une exactitude absolue inférieure à la nanoseconde, et <b>NON</b> certifié pour la tenue du temps opérationnelle.

# text
# c1: src/lunar_vlbi.rs
seg-b4e3228c84b8 = VLBI géodésique lunaire — retard en champ proche pour une base terrestre observant une balise lunaire (<c1/>)

# text
# c1: tau_geom = (|r2 − r_B| − |r1 − r_B|)/c
# c2: src/radiometric.rs
# c3: src/frames.rs
# c4: src/cio.rs
# c5: src/ephem.rs
# c6: src/lunar.rs
# c7: src/lunar_frame.rs
# c8: lunar-vlbi
seg-bbb634953ebf = Une observable de VLBI (very-long-baseline interferometry) géodésique pour deux stations terrestres au sol (une base) observant un signal à un trajet d'un émetteur de classe NovaMoon en surface lunaire. La Lune est en <b>champ proche</b>, et non une onde plane ; le retard géométrique est donc la différence exacte de deux distances <c1/> plutôt que la projection dans le plan du ciel. L'observable complète ajoute la différence des décalages d'horloge des stations et un terme de Shapiro du potentiel terrestre différencié (réutilisé de <c2/>). Les stations sont placées en coordonnées inertielles géocentriques (GCRS) via <c3/> + <c4/> ; la balise via <c5/> (Lune géocentrique) + <c6/> (sélénographique→MCMF (MCMF : Moon-centred, Moon-fixed, centré sur la Lune et lié à la Lune)) + <c7/> (corps lié IAU-2015 ME→inertiel). Le scénario <c8/> échantillonne le retard, sa vitesse de variation par différences finies et la correction de champ proche au cours d'une passe.

# text
# c1: delta_dor
# c2: src/radiometric.rs
# c3: −(B·ŝ_B)/c = delta_dor(r_B, [0,0,0], B)
# c4: dtau/dr_B = ((r_B−r2)/|r_B−r2| − (r_B−r1)/|r_B−r1|)/c
seg-b2b758337ebc = La <b>référence indépendante</b> est l'observable Δ-DOR en onde plane de la même base de code <c1/> dans <c2/> : à la limite du champ lointain (une balise synthétique à { "1e15" } m), le retard géométrique doit se réduire à <c3/> à la précision machine ; à la vraie distance lunaire, la correction de champ proche due à la courbure du front d'onde est non nulle (de quelques dizaines à quelques centaines de µs). Les dérivées partielles de la balise <c4/> (et celles des stations) sont vérifiées par différence finie centrée (erreur relative < { "1e-5" }).

# text
seg-107b9d328f69 = Retard VLBI géodésique lunaire + dérivées partielles

# text
# c1: geometric_delay_s
# c2: vlbi_delay_s
# c3: delay_partials_beacon
# c4: _station1
# c5: _station2
# c6: near_field_correction_s
# c7: LunarVlbiScenario
# c8: ReferenceImpl
# c9: delta_dor
# c10: src/radiometric.rs
# c11: lunar_vlbi::tests
# c12: delta_dor
# c13: run_toml
# c14: Modelled
# c15: xp = yp = 0
# c16: jd_tdb ≈ jd_tt
seg-acee0ad60cf4 = <c1/>, <c2/>, <c3/>/<c4/>/<c5/>, <c6/>, <c7/>. <b>Référence indépendante : <c8/></b> — le <c9/> en onde plane de la même base de code (<c10/>) à la limite du champ lointain, plus des <b>dérivées partielles par différences finies</b>. Tests (<c11/>) : la grandeur de la station ≈ le rayon terrestre, la distance de la balise à la distance lunaire ({ "356" }–{ "407" } Mm), le retard géométrique en champ lointain concorde avec <c12/> à < { "1e-9" } s près, une correction de champ proche non nulle à la distance lunaire, des dérivées partielles balise/station par différences finies à { "1e-5" } près en relatif, un terme d'horloge exact, et une exécution de scénario finie dirigée via <c13/>. <b>Portée honnête :</b> <c14/>, et <b>NON</b> validé par rapport à de vraies données VLBI. Le mouvement du pôle est ignoré (<c15/>), de sorte que les positions inertielles des stations portent une erreur de référentiel de quelques mètres ; la balise mélange une série de la Lune à l'équateur moyen de la date avec un décalage lié au corps en ICRF (International Celestial Reference Frame) (<c16/>), une discordance de cohérence de référentiel inférieure à la fidélité du modèle mais non rigoureuse ; et il n'y a ni itération du temps de lumière, ni rotation de la Terre pendant le temps de lumière, ni milieux (tropo/iono/plasma), ni terme d'aberration au-delà du Shapiro différencié. Aucun TRL (technology readiness level), aucun héritage de vol ni aucune approbation d'agence n'est revendiqué. { "0.30" } : par rapport aux temps de lumière ANISE via DE440, aucun retard de ce chemin analytique n'est à { "1" } ps près (plus grand écart { "24" } µs) ; le constat est figé.

# text
# c1: KernelGeometry
# c2: lunar-vlbi
seg-d90c67f098f7 = <c1/> (Terre et Lune DE440, axes principaux lunaires DE440, orientation de la Terre ITRF93, chaque temps de lumière convergé dans le référentiel barycentrique), exécuté par le scénario <c2/> lorsque les trois chemins de noyaux sont définis. <b>Référence indépendante : Library</b> — NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }) temps de lumière convergés vers DSS-14/43/63, préenregistrés : { "75" } retards à { "1" } ps près (pire cas { "0.06" } ps), dérivées partielles de la balise et des stations à { "1e-6" } près, à { "25" } époques proches de J2000 (un amendement après que les époques de { "2024" } ont échoué sur l'époque d'émission en double précision propre à SPICE, d'environ { "6" } ps, divulgué et figé). Le terme de Shapiro différencié, la vitesse de variation du retard et la correction de champ proche du scénario ne sont pas comparés.

# text
# c1: src/lunar_combination.rs
seg-8bed75c5402d = DO et horloge lunaires conjointes multitechniques — récupération simulée en boucle fermée (<c1/>)

# text
# c1: crate::batch_ls::gauss_newton_qr
# c2: src/lunar_vlbi.rs
# c3: [station_pos(3), {sat_pos(3)}×N_sat, station_clk, {sat_clk}×N_sat]
# c4: lunar-joint-od-clock
seg-d518eead07c4 = Un ajustement par moindres carrés par lot à époque unique (instantané) (<c1/>, une étape QR de Householder depuis { "0.30" }) qui <b>fusionne les techniques de VLBI géodésique, de radiométrie/télémétrie locale lunaire et de télémétrie inter-satellites</b> sur un réseau lunaire SIMULÉ afin de retrouver, <em>ensemble</em>, la position 3-D d'une station de surface lunaire, les positions par satellite d'une petite constellation et le décalage d'horloge de chaque équipement. Les observables sont : ({ "1" }) les retards de VLBI géodésique sur base terrestre vers la station lunaire traitée comme balise (réutilisant <c2/>, inertiel géocentrique) — la technique phare ; ({ "2" }) les distances radiométriques géocentriques station terrestre→satellite (qui multilatèrent la constellation à partir des stations terrestres bien réparties) et les distances locales lunaires station↔satellite (distance euclidienne MCI (Moon-centred inertial, inertiel centré sur la Lune) plus le terme d'horloge différencié) ; ({ "3" }) les distances inter-satellites (même forme) ; plus une unique pseudo-observation de synchronisation d'horloge de station qui ancre le décalage d'horloge commun, sinon inobservable. Le vecteur d'état est <c3/>. Il n'y a <b>aucune propagation par modèle de forces dans le solveur</b> — les satellites sont des points fixes, distincts et illustratifs sur une orbite lunaire représentative ; il s'agit d'un ajustement instantané volontairement épuré. En interne, les positions sont mises à l'échelle et les horloges sont estimées en mètres équivalents-distance afin que la matrice normale reste bien conditionnée en f64 ; les distances VLBI et lunaires sont centrées (moyenne retirée) autour de la géométrie nominale afin que le jacobien par différences finies ne souffre pas d'une annulation catastrophique. Le scénario <c4/> exécute la résolution avec et sans les liaisons VLBI sur la même graine/vérité et rapporte les deux solutions ainsi que le facteur d'amélioration de l'observabilité de la station.

# text
# c1: vlbi_restores_station_observability
seg-f634e976b583 = Le <b>résultat honnête phare</b> : la télémétrie locale lunaire depuis une station polaire vers une poignée de satellites tous situés d'un même côté du ciel laisse la position de la station <b>faiblement observée selon une direction</b>, de sorte que la résolution par distances seules est mal conditionnée et que l'erreur 3-D retrouvée de la station est grande (ou que la résolution ne converge pas). <b>Ajouter les retards VLBI sur base terrestre rend observable la position 3-D complète de la station</b>, et l'erreur retrouvée de la station tombe au niveau du mètre. Le test <c1/> vérifie que l'erreur de la station avec VLBI est nettement (≥{ "5" }×) plus petite que l'erreur avec distances seules sur la même vérité injectée — le VLBI qui rétablit la direction de la station, sinon inobservable, est l'objet de cette phase.

# text
# c1: 1/σ²
# c2: Δxᵀ(HᵀWH)Δx
# c3: formal_covariance_nees
# c4: n_params
seg-d5feea2381b7 = La <b>référence indépendante</b> est la cohérence interne : un état de vérité injecté (station ~{ "50" } m/axe, satellites ~{ "30" } m/axe, horloges ~{ "1e-7" } s, avec une gigue par composante issue d'une graine) est converti en observables synthétiques par le <em>même</em> modèle géométrique que le solveur inverse, un bruit gaussien issu d'une graine est ajouté (valeurs illustratives par défaut : σ VLBI ≈ { "1e-11" } s, σ de distance ≈ { "0.1" } m, σ ISL ≈ { "0.1" } m ; poids <c1/>), et l'estimateur doit retrouver la vérité injectée dans le bruit à partir d'une estimation initiale nulle. Un NEES moyen Monte-Carlo <c2/> sur les graines (<c3/>) reste dans une bande large autour de <c4/>, une vérification du réalisme de la covariance.

# text
# c1: validated
seg-abc40f1f301a = <c1/> ({ "0.30" }, P2 : l'algèbre linéaire de la résolution)

# text
# c1: estimate
# c2: formal_covariance_nees
# c3: LunarCombinationScenario
# c4: tests/lunar_joint_od_numpy_oracle.rs
# c5: InternalConsistency
# c6: lunar_combination::tests
# c7: n_params
# c8: run_toml
seg-87de27c2421a = <c1/>, <c2/>, <c3/>. <b>Référence indépendante { "0.30" } : P2</b> — numpy { "2.4.6" } (LAPACK gelsd et inv) recalcule chaque pas de Gauss-Newton, la solution pondérée convergée, les sigmas formels et l'erreur de la station sur les jacobiens enregistrés de six réseaux (<c4/>, pas à { "2.4e-11" } près, sigmas à { "1.3e-11" } près) ; les modèles d'observation physiques et leurs grandeurs restent MODELLED. <b>Référence indépendante antérieure : <c5/></b> — récupération d'une vérité simulée injectée + cohérence de covariance NEES. Tests (<c6/>) : la fusion complète retrouve la vérité (station < { "5" } m, RMS des satellites < { "5" } m, horloges < { "1e-8" } s, convergée) ; le VLBI rétablit l'observabilité 3-D de la station (erreur de la station ≥{ "5" }× plus petite avec le VLBI qu'avec distances seules sur la même vérité) ; déterministe (même graine → solution identique au bit près, graine différente → solution différente mais retrouvée) ; NEES moyen dans une bande large autour de <c7/> ; chiffres rapportés finis/protégés même lorsque les distances seules sont mal conditionnées ; scénario dirigé via <c8/>. <b>Portée honnête :</b> il s'agit d'une <b>récupération simulée en boucle fermée</b> — la vérité partage le modèle d'observation — <b>et NON</b> d'une validation sur données réelles ; aucune propagation par modèle de forces dans le solveur ; les positions des satellites et la géométrie des stations terrestres/lunaires sont illustratives. Aucun TRL, aucun héritage de vol ni aucune approbation d'agence n'est revendiqué.

# text
# c1: src/lunar_frame_realise.rs
seg-7620f3a821f6 = Réalisation du référentiel lunaire — ajustement de datum par transformation de Helmert à 7 paramètres (<c1/>)

# text
# c1: src/lunar_frame.rs
# c2: p_i
# c3: q_i
# c4: q_i = t + (1 + s)·R(θ)·p_i
# c5: R(θ) = rz(θz)·ry(θy)·rx(θx)
# c6: crate::precession::{rx, ry, rz, matmul, mat_vec}
# c7: [tx, ty, tz, θx, θy, θz, s]
# c8: crate::batch_ls::gauss_newton
# c9: q_i
# c10: p_i
# c11: z
# c12: 1/σ²
# c13: x0 = zeros
# c14: icrf_orientation_tie
# c15: transpose(crate::lunar_frame::icrf_to_iau_moon(jd_tdb))
seg-240271b9d7de = Là où <c1/> <em>applique</em> l'orientation du corps lunaire IAU { "2015" } WGCCRE (un modèle direct), ce module <em>estime</em> (réalise) un référentiel lunaire à partir d'un réseau de coordonnées de points estimées rattaché à un datum. Le cœur d'estimation est une <b>transformation de similitude (Helmert) classique à 7 paramètres</b> — trois de translation, trois de rotation aux petits angles et un d'échelle — qui transforme les points <c2/> (référentiel estimé) en <c3/> (référentiel du datum) sous la forme <c4/>, avec <c5/> construit à partir de <c6/>. Les sept paramètres <c7/> sont estimés à partir d'au moins { "3" } paires de points non colinéaires par moindres carrés pondérés via <c8/> : le modèle direct prédit chaque <c9/> à partir de son <c10/> et aplatit les trois composantes de tous les points dans le vecteur d'observables, les coordonnées observées du datum forment <c11/>, les poids sont <c12/>, et la résolution part de <c13/>. Les angles de rotation sont estimés en µrad et l'échelle en ppb afin que le jacobien par différences finies reste bien mis à l'échelle à la grandeur des coordonnées de surface lunaire (~{ "1.7e6" } m). Un petit <c14/> compose la petite rotation réalisée à travers l'orientation IAU corps→ICRF (<c15/>) et renvoie le décalage résiduel aux petits angles du référentiel réalisé autour des axes ICRF — un changement d'expression de référentiel volontairement simple, <b>et non</b> une estimation indépendante du pôle lunaire.

# text
# c1: lunar-frame-realisation
seg-75769fc9671c = La <b>référence indépendante</b> est la cohérence interne : une transformation de Helmert connue (translation de l'ordre de quelques dizaines de m, rotation de l'ordre du µrad, échelle ~{ "1e-7" }) est <em>injectée</em> dans un réseau de points synthétique bien réparti (latitude/longitude sélénographiques variées → MCMF, certains points en altitude), un bruit gaussien issu d'une graine est ajouté, et l'ajustement doit retrouver les paramètres injectés. Sur des données sans bruit, la récupération se fait à environ la précision machine (translation < { "1e-6" } m, rotation < { "1e-9" } rad, échelle < { "1e-12" }) ; avec un bruit métrique, les paramètres retrouvés se situent à quelques × le σ formel et le RMS résiduel après ajustement est proche du niveau de bruit. Le scénario <c1/> rapporte le datum retrouvé, l'erreur de récupération par paramètre par rapport à la vérité injectée, le RMS résiduel après ajustement et le rattachement d'orientation ICRF de la rotation réalisée.

# text
# c1: helmert_fit
# c2: apply_helmert
# c3: realise_frame
# c4: icrf_orientation_tie
# c5: LunarFrameRealiseScenario
# c6: InternalConsistency
# c7: apply_helmert
# c8: lunar_frame_realise::tests
# c9: run_toml
seg-3768ce021e23 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Référence indépendante : <c6/></b> — récupération d'une transformation de similitude à 7 paramètres injectée plus l'identité algébrique d'aller-retour de <c7/>. Tests (<c8/>) : récupération sans bruit de la transformation injectée (translation < { "1e-6" } m, rotation < { "1e-9" } rad, échelle < { "1e-12" }) ; récupération avec bruit à quelques × σ près et RMS résiduel proche du niveau de bruit ; aller-retour appliquer-puis-inverser ; déterministe (même graine → identique au bit près, graine différente → différent mais retrouvé) ; le rattachement ICRF à rotation nulle est nul et le rattachement préserve la grandeur de la rotation ; scénario dirigé via <c9/>. <b>Portée honnête :</b> il s'agit d'une vérification d'<b>autocohérence</b> — elle retrouve une transformation <em>injectée</em> sur un réseau <em>synthétique</em> — <b>et NON</b> d'une réalisation du référentiel lunaire à partir de vraies données de poursuite / VLBI, et elle ne revendique aucune exactitude absolue du référentiel. Le rattachement d'orientation ICRF est un simple changement d'expression, et non une estimation indépendante du pôle. Aucun TRL, aucun héritage de vol ni aucune approbation d'agence n'est revendiqué.

# text
# c1: src/lunar_service.rs
seg-f14930d33f47 = Volume de service de navigation lunaire — DOP / couverture / disponibilité + PL ARAIM lunaire généralisé (<c1/>)

# text
# c1: crate::orbit::dop
# c2: service_dop
# c3: service_dop
# c4: orbit::dop
# c5: crate::lunar::lunar_araim
# c6: P_sat
# c7: lunar_protection_level
# c8: lunar::lunar_araim
seg-9b4f13e138e4 = Ce module <em>compose</em> des éléments déjà construits en une analyse de <b>volume de service</b> de navigation lunaire : il balaie une grille de latitude/longitude sélénographiques sur un horizon temporel face à une constellation en orbite lunaire <b>illustrative, de source publique, de classe Moonlight / LCNS</b> (LCNS : Lunar Communications and Navigation Services) et rapporte le DOP / la couverture / la disponibilité ainsi qu'une enveloppe généralisée de niveau de protection ARAIM lunaire. Les deux réutilisations sont déterminantes et explicites. La <b>géométrie DOP</b> est le noyau <b>VALIDATED</b> (par rapport à gnss_lib_py) <c1/> — <c2/> est un simple filtre de masque d'élévation plus ce noyau, et un test vérifie l'identité (<c3/> égale un <c4/> direct sur les mêmes positions visibles). L'<b>intégrité</b> réutilise la mécanique ARAIM lunaire LunaNet LNIS (LunaNet Interoperability Specification) <c5/> (σ_URE ≈ { "30" } m, <c6/> ≈ { "1e-4" }) ; <c7/> généralise le niveau de protection existant du pôle Sud à un point de surface arbitraire, et un test vérifie qu'il <b>se réduit au cas du pôle Sud</b> (au pôle Sud, avec la même géométrie et le même budget, il renvoie exactement le résultat existant de <c8/> à < { "1e-9" } près).

# text
# c1: moonlight-service-volume.toml
# c2: moonlight-service-volume
seg-456bf257f689 = Les paramètres de la constellation sont une <b>approximation illustrative des descriptions publiques de l'ESA</b> pour cette classe de système (≈ { "4" } satellites sur des orbites lunaires elliptiques gelées favorisant la couverture du pôle Sud — apolune au-dessus de l'hémisphère sud ; { "4" } est la valeur par défaut de la bibliothèque, et le <c1/> fourni la fixe à { "8" } parce que le niveau de protection exige au moins { "6" } en vue). Ils ne sont <b>pas</b> les véritables éphémérides Moonlight/LCNS et n'impliquent <b>aucune</b> affiliation, approbation, héritage, certification ni TRL. La composition (couverture / disponibilité / intégrité) est <b>MODELLED</b> : un ensemble de relais képlériens circulaires/elliptiques (et non des éphémérides LCNS / NRHO (near-rectilinear halo orbit) { "9" }:{ "2" } corrigées différentiellement), une Lune en rotation moyenne (sans libration physique ni précession du pôle) et des paramètres d'intégrité LunaNet LNIS publiés. Elle illustre la <em>méthode</em> de volume de service, et non un chiffre de disponibilité opérationnelle. Déterministe (géométrie pure ; aucun aléa). Le scénario <c2/> rapporte le pourcentage de couverture, les enveloppes du nombre de satellites visibles et du PDOP, l'enveloppe HPL/VPL sur le volume et la disponibilité du niveau de protection par rapport à la limite d'alerte.

# text
# c1: LunarConstellation
# c2: visible_sats
# c3: service_dop
# c4: coverage
# c5: lunar_protection_level
# c6: LunarServiceScenario
# c7: crate::orbit::dop
# c8: crate::lunar::lunar_araim
# c9: lunar_service::tests
# c10: service_dop
# c11: lunar_protection_level
# c12: lunar::lunar_araim
# c13: run_toml
seg-c28e56391894 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Géométrie DOP validée par réutilisation</b> du noyau <c7/> validé par gnss_lib_py ; l'intégrité réutilise l'ARAIM lunaire publié LunaNet/LNIS (<c8/>, σ_URE ≈ { "30" } m). Tests (<c9/>) : <c10/> est une identité sur le noyau validé ; <c11/> au pôle Sud égale le PL existant de <c12/> à < { "1e-9" } près (se réduit au cas du pôle Sud) ; la couverture est non décroissante avec la taille de la constellation ; la visibilité respecte le masque d'élévation ; le scénario est déterministe et est dirigé via <c13/>. <b>Portée honnête :</b> la constellation est <b>illustrative, de source publique, NON affiliée à l'ESA</b> — et non les véritables éphémérides Moonlight/LCNS ; la composition couverture/disponibilité/intégrité est <b>MODELLED</b> (relais képlériens circulaires/elliptiques, Lune en rotation moyenne, paramètres LNIS publiés), <b>et NON</b> un chiffre de disponibilité opérationnelle de Moonlight. Aucun TRL, aucun héritage de vol ni aucune approbation d'agence n'est revendiqué.

# text
# c1: src/lunar_dpnt.rs
seg-4ff4929f71df = PNT différentiel lunaire — annulation du mode commun + résidu croissant avec la base + niveaux de protection DGNSS (<c1/>)

# text
# c1: i
# c2: e_i
# c3: c_i
# c4: −e_i · û_ref,i + c_i
# c5: −e_i · û_user,i + c_i
# c6: −e_i · (û_user,i − û_ref,i)
# c7: c_i
# c8: [x, y, z, clock]
# c9: crate::orbit::invert4
# c10: crate::sbas::sbas_protection_level
seg-8f94c4bf3fe6 = Un analogue lunaire de DGNSS (navigation par satellite différentielle) / SBAS : une <b>station de référence de classe NovaMoon</b> à un emplacement sélénographique <em>connu</em> calcule des corrections différentielles par satellite à partir d'une constellation <b>illustrative, de source publique, de classe Moonlight / LCNS</b>, et un utilisateur mobile décalé de celle-ci d'une base les applique de sorte que les erreurs d'éphémérides diffusées de <b>mode commun</b> s'annulent. Chaque satellite <c1/> porte un vecteur d'erreur d'orbite 3-D commun injecté <c2/> et une erreur d'horloge commune <c3/>. Le résidu de pseudodistance de la station de référence est la correction <c4/> ; l'erreur brute de l'utilisateur est <c5/> ; l'erreur corrigée de l'utilisateur est leur différence <c6/>. Le <b>terme d'horloge <c7/> s'annule exactement</b> (il est identique dans les deux observations), et le <b>terme d'orbite se réduit à la projection sur la différence des deux vecteurs unitaires de ligne de visée</b>, qui → { "0" } lorsque la base → { "0" } (le plancher de décorrélation spatiale) et croît ≈ linéairement avec la base. Les erreurs de distance corrigées par satellite sont projetées à travers la géométrie de l'utilisateur par une petite résolution instantanée aux moindres carrés pondérés à faibles dépendances (état <c8/> via <c9/> ; un biais de distance constant est absorbé par l'inconnue d'horloge au lieu de corrompre la solution) pour donner l'erreur de <b>position</b> de l'utilisateur. Le <b>niveau de protection de l'utilisateur réutilise la mécanique de niveau de protection SBAS DO-229E</b> (<c10/>, facteurs K d'approche de précision) avec le σ résiduel différentiel comme budget d'erreur à 1-σ de chaque satellite.

# text
# c1: crate::lunar_service::LunarConstellation
# c2: lunar-differential-pnt
seg-06978cfaebe3 = NovaMoon n'est référencé <b>que comme classe de système</b> (une description publique d'une station de référence lunaire) ; la constellation réutilise la <c1/> illustrative de source publique. Ce sont des paramètres illustratifs destinés à exercer la <em>méthode</em> différentielle, <b>et non</b> des éphémérides réelles, et ils n'impliquent <b>aucune</b> affiliation, approbation, héritage, certification ni TRL. Le scénario <c2/> rapporte l'erreur de position de l'utilisateur avec et sans corrections, le facteur de réduction, la courbe erreur-en-fonction-de-la-base et le niveau de protection. Dans la configuration par défaut, l'erreur corrigée de l'utilisateur à une base de { "50" } km est ≈ { "0.008" } m contre ≈ { "24" } m sans correction (une réduction d'un facteur ~{ "3000" }), et ≈ { "0" } à base nulle.

# text
# c1: noise = 0
seg-6bb4dbe998f9 = La <b>référence indépendante</b> est la cohérence interne : l'annulation du mode commun est une <b>identité algébrique exacte</b> (avec <c1/>, erreur corrigée < { "1e-6" } m à base nulle ; le terme d'horloge s'annule à la précision machine quelle que soit la base), le résidu <b>croît de façon monotone avec la base</b>, et le niveau de protection est le <b>même algorithme DO-229E</b> auquel la pile SBAS est rattachée. Le résidu de décorrélation spatiale est un modèle géométrique <b>du premier ordre</b>, <b>et non</b> un modèle de décorrélation ajusté sur de vraies données de poursuite lunaire.

# text
# c1: differential_corrections
# c2: corrected_user_range_errors
# c3: user_position_error_m
# c4: lunar_dgnss_protection_level
# c5: LunarDpntScenario
# c6: InternalConsistency
# c7: crate::sbas
# c8: lunar_dpnt::tests
# c9: sbas::sbas_protection_level
# c10: None
# c11: run_toml
seg-fd282b10cc77 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Référence indépendante : <c6/></b> — l'identité d'annulation d'erreur différentielle plus la réutilisation de la mécanique de niveau de protection SBAS DO-229E (<c7/>). Tests (<c8/>) : à base nulle, l'erreur corrigée de l'utilisateur et chaque erreur de distance corrigée par satellite sont ~{ "0" } (< { "1e-6" } m) et ≪ l'erreur non corrigée ; le terme d'horloge s'annule exactement quelle que soit la base (cas à erreur d'orbite nulle) ; l'erreur corrigée croît de façon monotone avec la base tout en restant ≪ à l'erreur non corrigée pour des bases modestes ; le différentiel bat l'autonome avec une marge nette (> { "2" }×) ; le niveau de protection égale un appel direct à <c9/> et évolue avec le σ résiduel ; une géométrie sous-déterminée renvoie <c10/> ; le scénario est déterministe (graine) et est dirigé via <c11/>. <b>Portée honnête :</b> <b>MODELLED</b> — l'annulation du mode commun est une identité exacte, mais le résidu de décorrélation spatiale est un modèle géométrique <b>du premier ordre</b>, <b>et NON</b> un modèle de décorrélation ajusté sur de vraies données de poursuite lunaire, et ceci <b>n'est PAS</b> validé sur données réelles. NovaMoon n'est référencé <b>que comme classe de système</b> (illustrative, de source publique, <b>non affiliée à l'ESA</b>). Aucun TRL, aucun héritage de vol ni aucune approbation d'agence n'est revendiqué.

# text
# c1: src/lunar_interop.rs
seg-08e8a73f3426 = Export d'interopérabilité lunaire — CCSDS OEM + KIF alignés LunaNet/IOAG avec vérification d'aller-retour (<c1/>)

# text
seg-7634c6f4b32c = Liaison

# text
seg-b966dd26caa6 = Jeu de données

# text
seg-4fe4920a3fa1 = Norme

# text
# c1: docs/VALIDATION.md
seg-84430d202cd4 = Source : <c1/>

# text
seg-028f26d1374e = <b>À propos des tolérances.</b> « Vérifié » ci-dessous signifie qu'un test d'étalonnage affirme que la statistique simulée correspond à la relation de référence à l'intérieur d'un <b>seuil appliqué</b>, actuellement <b>{ "20" }–{ "25" } % d'erreur relative</b> (moyennée sur les graines) pour les relations d'Allan et de budget de bruit. L'accord médian observé est souvent bien plus serré (quelques pour cent), mais la borne <em>garantie</em> est le seuil, et non la médiane. Lorsqu'un nombre comme « ~{ "2" } % » apparaît, il s'agit d'une observation typique, et non de la tolérance appliquée. Voir <a1>Affirmations et réalité</a1>.

# text
seg-94a480ed9ccb = La règle de promotion

# text
# c1: src/verification.rs
seg-a550784412a6 = Une ligne de la matrice de vérification contrôlée par machine (<c1/>) est VALIDATED seulement lorsqu'une référence indépendante <b>indépendante de Kshana</b> concorde avec l'implémentation <b>dans une tolérance énoncée avant l'exécution de la comparaison</b>, dans un test exécuté dans la barrière de contrôle. Cette section est le seul endroit où la règle est écrite ; la matrice, le texte de chaque ligne et les notes de version s'y réfèrent.

# text
seg-5e14faed9f05 = Les types de référence indépendante acceptés

# text
seg-4297b6a1b385 = Ce qui compte

# text
seg-a42c0c36b37f = Exemples déjà présents dans la matrice

# text
seg-e39aeb132e03 = Des données réelles mesurées de la grandeur que la ligne revendique : une observation du monde physique, et non une sortie de modèle.

# text
seg-e77977db9de1 = Les deux tiers réservés d'un enregistrement réel d'horloge au césium ; les points normaux archivés de télémétrie laser lunaire ; la série UTC(k) de la Circular T du BIPM (Bureau international des poids et mesures) ; la tuile de terrain SRTM (Shuttle Radar Topography Mission).

# text
seg-6325fe1fafaf = Une bibliothèque ou un outil tiers indépendant qui calcule une grandeur <b>définie de façon unique</b> sur les mêmes entrées, la bibliothèque implémentant elle-même le calcul du domaine. La concordance entre bibliothèques n'est un contrôle authentique que parce que la grandeur n'a qu'une seule bonne réponse.

# text
seg-a9cd35495601 = allantools, Orekit, ANISE, RTKLIB, gnss_lib_py, lamberthub, pymcdm, scikit-learn, les distributions statistiques de SciPy.

# text
seg-056adffae706 = Vecteurs de référence, tables ou exemples de vérification publiés : des nombres qu'une norme, une agence ou un texte de référence imprime afin que les implémentations puissent être vérifiées par rapport à eux.

# text
seg-991fb822e99c = Vecteurs SOFA/ERFA (Standards of Fundamental Astronomy), vecteurs de vérification SGP4 de l'AIAA (American Institute of Aeronautics and Astronautics), exemples de validation de l'UIT-R (Union internationale des télécommunications, Secteur des radiocommunications), exemple détaillé ARAIM du Working Group C, JPL (Jet Propulsion Laboratory) Horizons.

# text
seg-2a774e48055a = Deux autres critères tranchent les cas limites. Les deux sont adoptés pour la version { "0.30" }.

# text
seg-f5c6cf536ba1 = <b>P1, une valeur détaillée publiée.</b> Une valeur détaillée publiée, calculée à partir de la même forme fermée que celle qu'implémente la ligne, compte comme un vecteur de référence publié, lorsque la publication est indépendante de Kshana et que la comparaison fixe une tolérance énoncée. La valeur doit être imprimée sous forme de nombre dans la publication (une valeur lue sur un graphique ne compte que si l'incertitude de lecture est inférieure à la tolérance énoncée), et le test doit faire calculer cette valeur par Kshana à partir des entrées de la publication ; comparer une constante au document dont elle a été copiée est un contrôle de transcription, pas P1.

# text
seg-0b043b552e76 = <b>P2, une bibliothèque numérique indépendante.</b> Une bibliothèque numérique indépendante telle que numpy ou LAPACK (Linear Algebra PACKage) qui recalcule une grandeur d'algèbre linéaire définie de façon unique sur des entrées indiquées compte comme une bibliothèque indépendante. La bibliothèque doit effectuer l'étape de décomposition, d'inversion, de résolution ou de moindres carrés par son propre algorithme, sur des entrées validées avec le jeu de test ; l'affirmation validée porte alors sur l'algèbre linéaire sur ces entrées, et non sur les grandeurs physiques d'un scénario représentatif. Un script qui réévalue une forme fermée scalaire avec l'arithmétique de numpy est une seconde implémentation de notre cru, pas P2.

# text
seg-b7911d589f7a = Conditions valables pour tous les types : la référence indépendante n'est ni écrite, ni exécutée, ni publiée par ce projet (la série d'articles propre à ce dépôt n'est donc pas indépendante de lui) ; la tolérance figure dans le test et a été fixée avant la première comparaison ; un test conditionné par des données, qui est ignoré lorsque ses données publiques sont absentes, le signale lorsqu'il est ignoré.

# text
seg-7e6057a2cad7 = Ce qui ne compte pas

# text
# c1: ReferenceImpl
seg-80cfbb204767 = <b>Notre propre seconde implémentation</b> : un second chemin de code dans ce crate (<c1/>), ou un script de ce dépôt qui réévalue la même forme fermée.

# text
seg-d6efaf8399f9 = <b>La concordance avec nos propres sorties antérieures</b> : références figées (goldens), points de non-régression, instantanés, ou un tableau issu des propres articles de ce projet.

# text
seg-4d0365b383e5 = <b>Une transcription des constantes d'une citation</b> : vérifier un coefficient, un préréglage, une valeur de fiche technique ou une fiche de paramètres par rapport au document dont ils ont été copiés.

# text
seg-3bf8025077fb = <b>Un choix de conception</b> : une allocation, une pondération, un seuil, une limite d'alerte ou un scénario représentatif. Il n'y a pas de vérité externe pour un choix.

# text
seg-4f0aafd7166e = <b>Une identité interne</b> : une intégrale numérique comparée à sa propre forme analytique, un aller-retour, une inversion, un test de propriété ou de monotonie.

# text
# c1: IntegrationRun
# c2: IntegrationRun
# c3: integration_run_only_on_modelled_rows
# c4: src/verification.rs
# c5: validated_rows_require_an_external_oracle
# c6: ExternalDataset
seg-4f4408e4ebab = <b>Une exécution d'intégration contre un hôte réel</b> (<c1/>) : charger un module dans un vrai serveur Signal K ou OpenCPN, ou alimenter un consommateur TCP avec la sortie d'une vraie passerelle, et vérifier que l'hôte accepte l'entrée et affiche l'état attendu. Cela montre que la tuyauterie fonctionne. L'hôte n'est pas une référence indépendante pour une valeur que porte l'intégration ; il n'y a donc rien d'externe à comparer, et une telle ligne (la ligne des intégrations maritimes) est MODELLED, et non VALIDATED. <c2/> est son propre type de référence indépendante, autorisé seulement sur les lignes MODELLED : <c3/> dans <c4/> échoue si une ligne VALIDATED le porte, et <c5/> exige déjà que chaque ligne VALIDATED soit <c6/>.

# text
seg-a39a87c56a16 = <b>La vraisemblance sur des entrées réelles</b> : des données réelles utilisées uniquement comme entrée, avec des assertions d'ordre de grandeur plutôt qu'une comparaison à une valeur externe.

# text
seg-db6f5d98b4ef = Une tolérance choisie après avoir vu la comparaison.

# text
seg-f4f18b7549df = Comment la règle est appliquée

# text
# c1: validated_oracle_basis()
# c2: src/verification.rs
# c3: tests/verification_rows_declare_an_oracle_basis.rs
# c4: #[test]
seg-19a62c7e0aee = Chaque ligne VALIDATED déclare, dans <c1/> de <c2/>, sur quel type elle repose (Measured, Library, Reference, P1 ou P2), la source indépendante (citée à partir du texte de référence indépendante de la ligne elle-même) et l'unique test qui porte la comparaison. Les tests unitaires placés à côté du tableau échouent lorsqu'une ligne VALIDATED n'est pas déclarée ou l'est deux fois, lorsqu'une déclaration nomme une ligne qui n'est pas VALIDATED, lorsque la source déclarée n'est pas celle que nomme le texte de référence indépendante de la ligne ou est Kshana lui-même, lorsque le test déclaré n'est pas un test que cite la ligne, ou lorsqu'une ligne P2 ne nomme aucune bibliothèque numérique indépendante. <c3/> exige ensuite que le test déclaré existe sur le disque comme un véritable <c4/> qui n'est pas ignoré. Ce que la machine ne peut pas vérifier, c'est si le test nommé compare bien à la source déclarée ; cela reste une lecture humaine. Les décomptes par type ne sont pas saisis ici : le tableau fait foi.

# text
seg-e8ae3e380f40 = Lignes VALIDATED existantes réexaminées selon la règle

# text
seg-1dd44545a67a = La règle a été appliquée aux lignes existantes comme aux promotions futures.

# text
seg-38db7b6e7053 = <b>Lignes P1 nommées par l'étude de validation { "0.30" }, chacune étayée :</b> bilan de liaison unidirectionnel (le tableau de contrôle de conception X-band Galileo du JPL Pub 82-76, reconstitué à partir de ses lignes de détail à { "4.6e-3" } dB de perte en espace libre) ; formes fermées en bande limitée pour tout signal de télémétrie ({ "90.3" } pour cent de la puissance du lobe principal et la gigue cohérente early-late publiée) ; Doppler maximal d'un satellite de navigation en orbite terrestre basse (les chiffres publiés de Xona Pulsar X1 et d'Iridium) ; Doppler maximal vu par un utilisateur statique depuis une orbite LEO ou MEO (tableau { "1" } de l'article Pulsar, { "20" } valeurs) ; Doppler qu'un récepteur au sol doit gérer depuis un satellite de navigation LEO (les mêmes chiffres publiés à partir d'une orbite effectivement parcourue). Chaque publication est indépendante de Kshana, imprime ses nombres, et le test énonce sa tolérance.

# text
seg-8e38103d05d6 = <b>Autres lignes reposant sur P1, trouvées lors du réexamen, chacune étayée :</b> compromis de conception du code de télémétrie (la corrélation croisée de Gold publiée à −{ "23.9" } dB) ; temps-coordonnée lunaire (Ashby et Patla { "2024" }, dont le contrôle croisé de la vitesse de la Lune par rapport à DE440 est un contrôle Library) ; densités spectrales de puissance de signaux en bande L en forme fermée (valeurs Q de Kaplan et Hegarty) ; retard ionosphérique au premier ordre par bande (le rapport de retard de groupe de l'IS-GPS-200) ; pondérations de l'erreur de distance du signal dans l'espace en moyenne globale (le tableau de Montenbruck, Steigenberger et Hauschild { "2018" }).

# text
# c1: eigh
# c2: inv
seg-0014c53752ac = <b>Lignes P2 nommées par l'étude, chacune étayée :</b> information de Fisher et observabilité de Cramér–Rao (numpy <c1/>/<c2/>) ; identifiabilité du datum lunaire ; jauge couplée du référentiel et de l'échelle de temps lunaires ; chaîne autonome d'observabilité de défaut en réseau libre (SVD numpy/SciPy, décomposition en valeurs singulières). Chacune recalcule une grandeur d'algèbre linéaire définie de façon unique sur des entrées validées, par un algorithme différent du solveur propre de Jacobi de Kshana.

# text
# c1: expm
seg-e9d01633d002 = <b>Autres lignes reposant sur P2, trouvées lors du réexamen, chacune étayée :</b> dérivation de priorité MCDA (analyse de décision multicritère) (le vecteur propre AHP, processus de hiérarchie analytique, par SciPy/LAPACK ; la table d'indice aléatoire qu'elle reproduit aussi est une transcription et n'est pas comptée) ; variance de dérive en holdover d'horloge (<c1/> de SciPy sur la matrice augmentée de Van Loan) ; réalisation du référentiel lunaire (une résolution d'Umeyama par SVD numpy) ; formation de faisceau CRPA (antenne à diagramme de réception contrôlé) (résolution complexe LAPACK) ; noyau de niveau de protection ARAIM lunaire (l'inverse LU de RTKLIB avec les quantiles de SciPy) ; cohérence référentiel/dynamique lunaire entre fournisseurs (un ajustement par moindres carrés SVD numpy de trois éphémérides publiées).

# text
# c1: validated_oracle_basis()
seg-1fd94e94e89d = <b>Signalées lors du premier passage, rétablies sur une base solide à la ronde { "2" } de l'exécution { "0.30" }.</b> Trois lignes avaient été signalées comme non étayées par la règle écrite. Chacune repose désormais sur une comparaison préenregistrée avant la récupération de son jeu de test ; aucune ligne n'est donc signalée ; un test unitaire placé à côté de <c1/> fige la liste (désormais vide).

# text
# c1: raim_fde
# c2: raim::araim_raim
# c3: raim::araim_dual_raim
seg-3ef9479dea55 = <b>Intégrité (RAIM/ARAIM/SBAS).</b> Les tests cités n'affirmaient auparavant que la vraisemblance sur la géométrie réelle de l'IGS (International GNSS Service). La ligne repose maintenant sur trois références indépendantes de type bibliothèque : la séparation des solutions à hypothèses multiples de l'ARAIM du Airborne Design Document v4.2 par rapport à Stanford MAAST pour ARAIM { "2" } ({ "270" } cas réels, pire écart de VPL { "2.2e-3" } m contre { "0.05" } m) ; la détection et l'exclusion RAIM par instantané par rapport à RTKLIB <c1/> ({ "2016" } décisions identiques sur { "2016" }) avec le niveau de protection de pente ; et les niveaux de protection SBAS DO-229E L1 par rapport à Stanford MAAST sur de vraies diffusions WAAS ({ "2868" } paires à { "1.6e-5" } m près). La ligne dit clairement que les fonctions à sigma uniforme <c2/> et <c3/> ne respectent pas l'ADD et que la comparaison SBAS L5 bifréquence est un constat.

# text
seg-16a4261c77ec = <b>Positions des planètes dans tout le système solaire à partir des éléments képlériens de Standish du JPL.</b> Le seuil a posteriori de deux fois l'erreur nominale est remplacé par un seuil préenregistré : RMS au plus égal à la valeur du tableau { "8.10.1" } de l'Explanatory Supplement par planète et par composante, par rapport à JPL Horizons DE441, avec la scission de la Terre et la rotation ICRF couvertes.

# text
seg-8d5b51a942e0 = <b>Temps de lumière entre corps du système solaire.</b> Le solveur de temps de lumière est désormais comparé aux temps de lumière d'Horizons à { "1e-6" } s près sur les positions DE441, un seuil préenregistré qui n'hérite pas du seuil de position.

# text
seg-e96900bc322f = <b>Lignes MODELLED que les deux politiques rendent promouvables</b> (seulement par l'exécution { "0.30" } ligne par ligne, jamais par ce texte) : sous P1, la borne de géolocalisation d'émetteur TDOA/FDOA (différence de temps et de fréquence d'arrivée), le couplage entre taux d'horloge relativiste et référentiel, les gabarits de synchronisation de l'UIT-T (Secteur de la normalisation des télécommunications) (seulement pour les valeurs de gabarit que les Recommandations impriment sous forme de nombres ; les points de rupture transcrits contrôlés par rapport à eux-mêmes ne comptent pas) et la borne de positionnement 5G par réseau non terrestre (seulement si une valeur détaillée publiée est trouvée) ; sous P2, la cécité d'intégrité en mode commun, le niveau de protection temporel scalaire MHSS (séparation des solutions à hypothèses multiples) et le blanchiment GLS (moindres carrés généralisés). Les deux lignes de benchmark d'intégrité temporelle (le classifieur du diagramme d'intégrité de Stanford et le calculateur de couverture d'intégrité) relèvent d'une classification à base de règles, et non de l'algèbre linéaire ; P2 ne les atteint donc pas ; elles ont besoin d'un outil indépendant, et le seul trouvé (gLAB) porte une licence non commerciale.

# text
seg-50a08fe5918b = <b>Cohérence avec des refus antérieurs.</b> Le contrôle de Vallado de la ligne de fenêtre de lancement serait maintenant admissible sous P1 si son test calcule l'exemple détaillé imprimé ; le plan { "0.30" } la promeut plutôt par Orekit. Le tableau de croisement du temps lunaire par classe d'horloge reste MODELLED : le tableau qu'il reproduit provient de l'article propre à ce projet, qui n'est pas indépendant.

# text
seg-02423542480f = Terme de bruit

# text
seg-2bd49b92f14b = Parité des estimateurs d'Allan (ADEV/MDEV/TDEV/OHDEV (ADEV : écart-type d'Allan ; MDEV : écart-type d'Allan modifié ; OHDEV : écart-type d'Hadamard avec recouvrement))

# text
# c1: tests/allan_reference.rs
# c2: tests/allan_nist_sp1065_1000point.rs
# c3: tests/nbs14
seg-c429a25d17ae = Deux contrôles à partir de sources primaires par rapport à <b>NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>, { "2008" }), tous deux à une tolérance relative de <b>{ "1e-4" }</b>. ({ "1" }) <c1/> : les estimateurs ADEV avec recouvrement, ADEV modifié, écart de temps et Hadamard avec recouvrement reproduisent les écarts-types du jeu de données canonique à 10 points <b>NBS14</b> (<b>SP { "1065" } Tableau 29/30, p. { "107" }</b>) pour tau = { "1" }, { "2" } — l'accord est en réalité d'environ { "1e-6" } (p. ex. ADEV avec recouvrement (OADEV) à τ = { "2" } : { "85.952868" } contre { "85.95287" }). ({ "2" }) <c2/> : les quatre mêmes estimateurs reproduisent le <b>jeu de données à 1000 points de la SP { "1065" } §{ "12.4" }</b> (<b>Tableau { "31" }, p. { "108" }</b>) pour des facteurs de moyennage { "1" } / { "10" } / { "100" }, le jeu de données étant régénéré dans le code à partir du LCG de la SP { "1065" } (éq. { "73" }) — hermétique, sans fichier de test. Les mêmes données et les nombres du tableau 31 sont la cible de non-régression dans aewallin/allantools (<c3/>), reproduits ici sans code tiers. Cela fixe les <em>mathématiques de l'estimateur</em> par rapport à la référence, distinctement des lignes d'<em>étalonnage</em> du bruit ci-dessous.

# text
seg-79e6f7d1e7f0 = Parité des estimateurs d'Allan sur du <b>matériel réel mesuré</b>

# text
# c1: tests/cs5071a_reference.rs
# c2: allantools
# c3: scripts/fetch_cs5071a.sh
# c4: tests/fixtures/cs5071a/
seg-8c72a9df2547 = <c1/> : les estimateurs d'Allan avec recouvrement et d'Hadamard avec recouvrement reproduisent les écarts-types de référence de <b>Stable32</b> pour un <b>véritable étalon primaire au césium 5071A mesuré par rapport à un maser à hydrogène</b> ({ "556 990" } échantillons de phase à τ₀ = { "1" } s ; { "1" } PPS (impulsion par seconde) vers un compteur 53230A, févr. { "2014" } ; collectés par A. Wallin, distribués avec <c2/>). Contrôlé sur <b>toute l'échelle décadique de τ ({ "16" } facteurs de moyennage, τ = { "1" } s … { "4" }×10⁴ s)</b> : facteurs bien échantillonnés avec un seuil relatif de <b>{ "1e-3" }</b> (l'accord observé est en réalité ≤ { "3e-5" }, p. ex. OADEV({ "1" } s) { "3.317111e-10" } contre Stable32 { "3.3171e-10" }), facteurs épars à long τ tenus de tomber dans la bande de confiance à { "1" }‑σ imprimée par Stable32. Cela complète la parité synthétique NBS14 ci-dessus par un contrôle sur horloge mesurée. Le fichier de phase brut est une donnée tierce sans licence de redistribution ; il est donc ignoré par git ; <c3/> le reproduit et le test imprime un avis d'omission (la CI (intégration continue) reste au vert) lorsqu'il est absent. Seuls les nombres de référence publics de Stable32 sont versés (<c4/>) ; aucun code tiers n'est utilisé.

# text
seg-1a7f0e741913 = Parité des estimateurs d'Allan sur le <b>PHASE.DAT canonique de Stable32</b>

# text
# c1: tests/phasedat_reference.rs
# c2: allantools
# c3: scripts/fetch_phasedat.sh
# c4: tests/fixtures/phasedat/
seg-00e382874a00 = <c1/> : les estimateurs d'Allan avec recouvrement, d'Allan modifié et d'écart de temps reproduisent les écarts-types de référence de <b>Stable32</b> pour <b>PHASE.DAT</b> — la série de 1001 points distribuée avec Stable32 que des outils indépendants (p. ex. <c2/>) utilisent comme cible de non-régression standard — sur toute <b>l'échelle des facteurs de moyennage ({ "139" } facteurs)</b> avec un seuil relatif de <b>{ "1e-3" }</b> (observé ≤ { "5e-5" }). Une seconde série de référence réelle et indépendante, en plus du contrôle sur césium mesuré ci-dessus. PHASE.DAT est livré avec l'outil commercial Stable32 ; la série brute est donc ignorée par git ; <c3/> la reproduit et le test est omis au vert (la CI reste au vert) lorsqu'elle est absente. Seuls les nombres de référence publics de Stable32 sont versés (<c4/>) ; aucun code tiers n'est utilisé.

# text
seg-9dde9e0c8055 = Stabilité d'horloge optique sur une <b>courbe réelle mesurée</b>

# text
# c1: tests/optical_clock_adev_reference.rs
# c2: quantum_trade::qparams_from_adev_curve
# c3: tests/fixtures/optical_clock_adev/
seg-ea908ba3a79f = <c1/> : l'inversion des paramètres de bruit d'horloge (<c2/>) reproduit le <b>σ_y(τ) publié de l'horloge optique à réseau ⁸⁸Sr de Norcia et al., <em>Science</em> { "366" } : { "93" } ({ "2019" })</b> (Zenodo 10.5281/zenodo.3382347, <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }), courbe incluse dans <c3/>) : le coefficient de bruit blanc de fréquence retrouvé √q_wf ≈ { "4.33e-16" } correspond à la stabilité à court terme de ≈4.7e-16/√τ de l'article (~{ "10" } % RMS (valeur efficace) sur la courbe) et l'ajustement détecte un plancher mesuré non nul (q_rw > { "0" }). Cela fixe <b>l'inversion de l'ADEV mesuré vers les paramètres de bruit par rapport à une horloge optique réelle</b> ; le bénéfice de holdover jusqu'au seuil qui en découle reste MODELLED.

# text
seg-e1e930dcd0a1 = ROC (caractéristique de fonctionnement du récepteur) AUC (aire sous la courbe) de détection d'anomalies sur de la <b>télémétrie réelle OPS-SAT de l'ESA (Agence spatiale européenne)</b>

# text
# c1: validated
seg-2b637daa985c = <c1/> (reproduit les étiquettes)

# text
# c1: tests/opssat_ad_reference.rs
# c2: impairment_eval::auc
# c3: roc_auc_score
# c4: eval_stats::bootstrap_auc_ci
# c5: tests/fixtures/opssat/
# c6: generate_opssat_oracle.py
seg-c667434b580d = <c1/> : sur le jeu de données <b>OPSSAT-AD</b> (Ruszczak et al. { "2025" }, Zenodo 10.5281/zenodo.12588359, <b>CC BY { "4.0" }</b>) — de véritables segments de télémétrie de service d'OPS-SAT avec des étiquettes d'anomalie de vérité terrain — l'AUC ROC de Mann–Whitney de Kshana (<c2/>) reproduit <b><c3/> de scikit-learn</b> à <b>< { "1e-9" }</b> sur la partition de test réservée ({ "529" } segments, { "113" } anomalies), pour deux scores déterministes : un détecteur transparent à une seule caractéristique (nombre de pics du segment, <b>AUC ≈ { "0.851" }</b>) et un score de Mahalanobis diagonal à 8 caractéristiques ajusté sur les segments d'entraînement normaux (AUC ≈ { "0.556" }) ; <c4/> encadre l'estimation ponctuelle avec une borne inférieure qui dépasse le hasard. Cela valide le <b>calcul de l'AUC sur des données réelles de l'ESA</b> et la <b>séparation étiquetée</b> d'un détecteur transparent — cela ne reproduit <b>pas</b> la meilleure métrique publiée de l'article OPSSAT-AD (un FCNN supervisé (réseau de neurones entièrement connecté), F1 ≈ { "0.95" }), qui requiert leur modèle entraîné. Données CC-BY incluses (<c5/>, hermétique) ; la référence indépendante est régénérée par <c6/>.

# text
seg-5f2d41617fb2 = Synthèse de fonctionnelles du champ de gravité (carte de navigation assistée par la gravité / sans GNSS (GNSS : système mondial de navigation par satellite))

# text
# c1: tests/icgem_gravity_reference.rs
# c2: gravity_sh::gravity_magnitude
# c3: gravity_disturbance_mgal
# c4: from_gfc
# c5: tests/agency_lro.rs
seg-4c1126137428 = <c1/> : le noyau de fonctionnelles de gravité en harmoniques sphériques (<c2/> / <c3/>) — le « lecteur de carte » auquel un navigateur assisté par la gravité se compare — est validé par rapport à la <b>norme de gravité normale GRS80 (Geodetic Reference System { "1980" })</b> (Moritz { "1980" }, adoptée par l'AIG (Association internationale de géodésie)). Construire le champ normal GRS80 à partir de ses harmoniques zonales paires publiées J₂…J₈ et synthétiser la gravité (gravitation + force centrifuge) sur l'ellipsoïde reproduit la gravité normale en forme fermée de <b>Somigliana</b>, ainsi que les valeurs équatoriale et polaire publiées γ_e = { "9.7803267715" } / γ_p = { "9.8321863685" } m/s², à <b>{ "3.5e-12" }</b> en valeur relative sur toutes les latitudes (seuil { "1e-9" }). Le même noyau charge le <b>véritable modèle terrestre ICGEM (International Centre for Global Earth Models) EGM2008 (Earth Gravitational Model { "2008" })</b>, modèle phare, (domaine public de la NGA (National Geospatial-Intelligence Agency) via l'ICGEM ; le lecteur <c4/> est aussi exercé sur le champ lunaire GRAIL (Gravity Recovery and Interior Laboratory) dans <c5/>) et produit une carte de perturbation de gravité physiquement bornée (RMS ≈ { "26" } mGal, max ≈ { "89" } mGal à d/o { "70" }). Valide la <b>justesse du code de synthèse</b> ; la <em>précision de position de la navigation</em> assistée par la gravité reste MODELLED (aucune trajectoire publique de gravimètre embarqué sur une plateforme avec vérité terrain).

# text
seg-7dc3ff4c6eea = ddl équivalents (edf) spécifiques au type de bruit (intervalles de confiance)

# text
# c1: src/allan.rs
# c2: tests/allan_nist_sp1065_1000point.rs
seg-7e8a93fb2eea = <c1/> : la bande de confiance χ² de chaque point d'ADEV avec recouvrement utilise les degrés de liberté effectifs spécifiques au type de bruit (formes fermées du tableau { "5" } de NIST SP { "1065" } pour la modulation de phase blanche et de scintillement, la modulation de fréquence blanche et de scintillement et la modulation de fréquence de marche aléatoire (WPM/FPM/WFM/FFM/RWFM) — l'ensemble simple de Stable32), le type de loi de puissance de l'enregistrement étant identifié à partir de la pente log-log de son MDEV. Trois contrôles indépendants : (a) les cinq formules reproduisent des valeurs évaluées à la main à N={ "64" },m={ "4" } à { "1e-12" } ; (b) un <b>ensemble Monte-Carlo de FM blanche (FM : modulation de fréquence)</b> ({ "4 000" } enregistrements) mesure le ddl effectif réel du chi carré de l'estimateur = { "2" }·moyenne²/Var(σ²) et correspond à la formule à { "20" } % près (et bat nettement le décompte prudent sans recouvrement) ; (c) <c2/> reproduit le ddl imprimé du <b>tableau { "32" } de la SP { "1065" } (p. { "109" })</b> = { "146.177" } pour le jeu de données à 1000 points à m={ "10" } (FM blanche) à { "5e-3" } près, et les bornes de confiance à { "95" } % du tableau ({ "8.223942e-2" } / { "1.035201e-1" }) à <{ "0.2" } % près (le petit résidu est l'approximation de Wilson-Hilferty du χ² par rapport au χ² exact de NIST). La courbe d'ADEV exportée porte le type de bruit identifié, le ddl effectif et la bande à { "95" } % pour chaque τ.

# text
seg-7048ac695b99 = FM blanche (court terme)

# text
# c1: tests/calibration.rs
seg-b6982cb2ca25 = <c1/> : l'ADEV avec recouvrement simulé reproduit sigma_y({ "1" } s) publié — typiquement à quelques pour cent près, <b>seuil appliqué de { "20" } %</b> (CSAC et objectif du réseau optique) — et la courbe de FM blanche sigma_y(tau)=sigma_y(1s)/sqrt(tau) pour tau = { "1" }, { "10" }, { "100" } s dans un <b>seuil de { "25" } %</b> (correspond à la fiche technique CSAC (horloge atomique à l'échelle d'une puce) { "3e-10" } / { "1e-10" } / { "3e-11" }).

# text
seg-11fc7c4b61ff = FM de marche aléatoire (long terme)

# text
# c1: tests/calibration.rs
seg-1e211f342e79 = <c1/> : l'ADEV simulé correspond à sigma_y^{ "2" }(tau)=q_rw*tau/3 (Riley NIST SP { "1065" }) à ~{ "20" } % près (moyenné sur les graines).

# text
seg-dcfca4041429 = Vieillissement / dérive linéaire

# text
# c1: modeled
seg-2d5c6a44cbdb = <c1/> + corrigé

# text
# c1: src/estimator.rs
# c2: src/models.rs
seg-492f91ba2f79 = Déterministe ; l'estimateur de holdover supprime le décalage et le vieillissement par un prédicteur quadratique, de sorte que le résidu est la limite stochastique. Testé dans <c1/> / <c2/>.

# text
seg-2ea6a14cac1c = Estimateur de Kalman + borne d'intégrité

# text
# c1: src/kalman.rs
# c2: q_wf*T + q_rw*T^3/3
# c3: P⁺ = (I−KH)P(I−KH)ᵀ + KRKᵀ
# c4: R=1e-26 / Q≈1e-30
# c5: src/run.rs
seg-8c8f8a5eba5a = <c1/> : un filtre à deux états (phase, fréquence) dont le bruit de processus exact de van Loan correspond au modèle de vérité ; la marche libre reproduit la variance analytique de holdover <c2/> à { "1e-9" }. La mise à jour de covariance est sous <b>forme stabilisée de Joseph</b> <c3/>, qui reste semi-définie positive (vérifiée par Cholesky) sur { "500" } pas de prédiction/mise à jour avec un rapport extrême <c4/>, et concorde avec la forme naïve à { "1e-9" } là où celle-ci est bien conditionnée. La couche d'exécution rapporte l'intégrité comme la fraction des échantillons de l'interruption situés à l'intérieur de la borne de protection à 3 sigma (<c5/>).

# text
seg-f332f06e80f9 = Auto-cohérence du filtre (NIS (innovation normalisée au carré) / NEES (erreur d'estimation normalisée au carré))

# text
# c1: validated
seg-333e1701b6d0 = <c1/> (modèle)

# text
# c1: src/filter_health.rs
# c2: consistent=true
# c3: consistent=false
# c4: filter_health
# c5: detection::chi2_inv_cdf
seg-c1304de95180 = <c1/> : une évaluation de cohérence par Monte-Carlo (Bar-Shalom §{ "5.4" }). Le <b>NIS → { "1" }</b> et le <b>NEES → { "2" }</b> regroupés du filtre adapté tombent à l'intérieur de leurs bandes χ² à { "95" } % (la bande du NIS utilise le décompte regroupé d'innovations blanches ; la bande du NEES utilise le décompte d'exécutions indépendantes, car les erreurs d'estimation sont corrélées dans le temps). Un test de <b>balayage de désaccord Q/R</b> vérifie que le moniteur rapporte <c2/> seulement au réglage unitaire et <c3/> pour des déréglages ×0.1/×0.5/×2/×{ "10" }, le NIS variant en ≈1/q_factor comme le prévoit la dérivation. Exposé sous <c4/> dans le JSON (JavaScript Object Notation) du résultat d'horloge et dans une carte du playground. Les bandes χ² utilisent le quantile de Wilson–Hilferty (<c5/>, contrôlé par table).

# text
seg-078c4009b24f = Modèle de transfert de temps bidirectionnel

# text
# c1: src/timetransfer.rs
# c2: (m_AB - m_BA)/2
# c3: 1/sqrt(2)
# c4: sigma_y^2(tau) = q_rw*tau/3
# c5: step()
# c6: sigma_j
# c7: q_rw
seg-22f8cdeda335 = <c1/> : le retard réciproque de mode commun s'annule exactement dans l'estimation <c2/> (dérivé à la main, exact) et deux mesures unidirectionnelles se moyennent en <c3/> (moyenné sur les graines) ; le retard différentiel non réciproque est un processus coloré de FM blanche + FM de marche aléatoire dont l'écart-type d'Allan suit <c4/> (moyenné sur les graines, ~{ "20" } %, via le propre <c5/> de la liaison). Les <em>paramètres</em> (<c6/>, <c7/> par liaison) sont des valeurs représentatives de TWSTFT/optique (TWSTFT : transfert bidirectionnel de temps et de fréquence par satellite), non ajustées à un terminal précis.

# text
seg-6ab219622143 = Sécurité (score de détection de leurrage)

# text
# c1: src/security.rs
# c2: sqrt(r/m + q_wf*tau + q_rw*tau^3/3)
# c3: k
# c4: [0,1]
# c5: tau
# c6: k
# c7: r
seg-29dd10011ed1 = <c1/> : le plancher à 1 sigma du moniteur <c2/>, le décalage minimal détectable à <c3/> sigma qui en résulte et le score <c4/> sont dérivés à la main et testés unitairement. Le modèle (détection assistée par l'horloge de type innovation / RAIM (RAIM : surveillance autonome de l'intégrité par le récepteur)) est solide ; les <em>paramètres</em> (fenêtre de surveillance <c5/>, multiplicateur de détection <c6/>, bruit de mesure <c7/>) sont représentatifs, non ajustés à un récepteur précis.

# text
seg-ca51e4f1e19c = Détection d'attaque par leurrage

# text
# c1: src/spoof.rs
# c2: start + bound/rate
# c3: representative-parameters
seg-e991f5b2fdb2 = <c1/> : un leurrage temporel progressif est signalé lorsque son décalage dépasse la borne de détection de l'horloge ; l'instant de détection correspond à <c2/> dérivé à la main à un pas de grille près, et une horloge dont la borne dépasse la spécification laisse le leurrage atteindre le seuil sans être détecté. Même réserve <c3/> que pour le score de sécurité.

# text
seg-3d2f6d2b7722 = FM de scintillement (plancher)

# text
# c1: modeled
seg-55697d598918 = <c1/> (désactivé par défaut)

# text
# c1: src/models.rs
# c2: flicker_floor
seg-55000870c060 = Synthétisé comme une somme de processus d'Ornstein-Uhlenbeck (OU) espacés logarithmiquement et calibrés sur un plancher d'ADEV plat configurable ; <c1/> valide que le plancher est plat selon le temps de moyennage et se situe au niveau configuré (moyenné sur les graines). Activé par horloge via <c2/>. Les scénarios de référence cités le laissent désactivé : le CSAC est dominé par la FM blanche sur toute la plage de sa fiche technique (1-1000 s) et le plancher systématique de l'horloge optique (~{ "5e-17" }) est représenté par sa valeur d'exactitude.

# text
seg-e2e3de9a61a4 = Statistiques d'ensemble Monte Carlo

# text
# c1: validated
seg-9785d05ec5a7 = <c1/> (agrégation)

# text
# c1: src/ensemble.rs
# c2: runs
# c3: p05 <= p50 <= p95
seg-cc6c6bb5eb83 = <c1/> : percentiles au rang le plus proche et moyenne sur <c2/> réalisations reproductibles ; une exécution unique écrase la dispersion, la bande par pas de temps est ordonnée <c3/>, et les réexécutions sont identiques au bit près. Il s'agit d'une agrégation statistique sur l'exécution unique déjà validée, et non d'un nouveau modèle physique.

# text
seg-72a9d5de61f5 = sigma_y({ "1" } s)

# text
seg-ebbe708d9cbc = csac-sa45s (CSAC)

# text
seg-c43fe67d4200 = Fiche technique Microchip SA65 / SA.45s

# text
seg-e3bde4355d78 = optical-sr-lattice (réseau Sr)

# text
seg-87793f684233 = horloge optique à réseau de strontium, objectif orienté spatial, arXiv:{ "1503.08457" }

# text
seg-b03f5856d451 = Statut : FM blanche et FM de marche aléatoire validées ; vieillissement modélisé et corrigé ; FM de scintillement modélisée et validée (désactivée par défaut dans les scénarios cités).

# text
seg-c5ff448dcb88 = Maturité : les chiffres de l'horloge optique sont l'<em>objectif orienté spatial</em> sur du matériel au sol -- aucune horloge optique à strontium n'a volé. Les horloges Sr de laboratoire atteignent { "4.8e-17" } (Oelker et al. { "2019" }, Nature Photonics). Les chiffres du CSAC proviennent d'un composant commercial déployé.

# text
seg-b59a4b8e6d88 = Relations : Riley, NIST SP { "1065" }, éq. { "67" } -- FM blanche sigma_y^{ "2" }(tau)=h0/({ "2" } tau) ; FM de marche aléatoire sigma_y^{ "2" }(tau)=({ "2" } pi^2/3) h_-2 tau, soit de façon équivalente q_rw*tau/3 pour un processus de Wiener de fréquence de diffusion q_rw.

# text
seg-dca7ee671d91 = Paquet { "2" } — navigation à l'estime inertielle (centrale inertielle quantique)

# text
seg-98452a081241 = Biais constant/résiduel -> position

# text
# c1: src/inertial/mod.rs
seg-6aa386251acf = erreur de position = famille { "0.5" }<em>b</em>T^{ "2" } (tutoriel Groves AESS (Aerospace and Electronic Systems Society)) ; test discret dérivé à la main dans <c1/>.

# text
seg-c60c0b54c485 = Marche aléatoire de vitesse (accélération blanche)

# text
# c1: src/inertial/mod.rs
seg-7ce1f40566cf = <c1/> : l'écart-type (ET) de l'erreur de position simulée correspond à sigma_x(T)=sqrt(S_a*T^3/3) (Groves éq. 54) à ~{ "12" } % observé (moyenné sur les graines ; seuil appliqué de { "20" } %).

# text
seg-8ac776795d40 = Physique de l'accéléromètre à interféromètre à atomes froids (CAI) (à partir des premiers principes)

# text
# c1: src/inertial/quantum_imu.rs
# c2: k_eff = 4pi/lambda ~ 1.611e7 rad/m
# c3: Phi = k_eff*a*T^2 ~ 1.580e4 rad
# c4: T = 10 ms
# c5: sigma_Phi = 1/(C*sqrt(N)) = 2e-3 rad
# c6: C = 0.5
# c7: N = 1e6
# c8: sigma_a ~ 1.24e-6 m/s^2
# c9: 1/T^2
# c10: 1/sqrt(N)
# c11: q_va()
# c12: AccelModel
# c13: QUANTUM.md
seg-4eafc81873ed = <c1/> : un interféromètre de Mach-Zehnder à atomes froids à trois impulsions. Vérifié à la main par rapport à la géométrie des manuels — Rb-87 <c2/> ; <c3/> à { "1" } g, <c4/> ; bruit de projection <c5/> à <c6/>, <c7/> ; <c8/> par tir ; les lois d'échelle <c9/> et <c10/> ; décroissance exponentielle du contraste. <c11/> <b>dérive</b> la DSP (densité spectrale de puissance) d'accélération blanche que consomme le <c12/> classique. Portée honnête : seulement le <b>plancher de bruit de projection quantique</b> (~{ "0.09" } ug/sqrtHz ici) — très inférieur aux dispositifs réels limités par les vibrations (1-50 ug/sqrtHz) ; le tenseur de vibration, les systématiques de Coriolis et de déplacement lumineux ne sont pas encore modélisés (voir <a1><c13/></a1>).

# text
seg-ed78f40a8d80 = Biais du gyroscope + marche aléatoire angulaire (ARW) -> inclinaison -> couplage de la gravité

# text
# c1: g*theta
# c2: src/inertial/mod.rs
# c3: gyro_bias
# c4: q_arw
seg-a73e97ac4a0e = Un biais résiduel du gyroscope et l'ARW produisent une erreur d'attitude ; l'inclinaison couple la gravité (<c1/>) à l'erreur horizontale de force spécifique. <c2/> valide exactement la croissance cubique de position due au biais pur et la croissance de l'attitude due à l'ARW comme un processus de Wiener (moyenné sur les graines). Activé par capteur via <c3/> et <c4/> ; désactivé dans les scénarios cités à accéléromètre seul.

# text
seg-e68d093e952a = Instabilité de biais (plancher de scintillement en 1/f)

# text
# c1: src/inertial/mod.rs
# c2: bias_instability
seg-5ad1e7d55d07 = <c1/> : un processus de scintillement en 1/f (la même synthèse OU validée pour l'horloge) dont le plancher plat d'écart-type d'Allan se situe au coefficient d'instabilité de biais ; zéro est sans effet, un plancher non nul modifie la trajectoire, les deux sont reproductibles. Activé par capteur via <c2/>.

# text
seg-b631c1bfce05 = Marche aléatoire d'accélération (marche aléatoire de taux)

# text
# c1: src/inertial/mod.rs
# c2: Var(bias_rw(T)) = q_aa*T
# c3: q_aa
seg-4a4a70363412 = <c1/> : le biais est un processus de Wiener avec <c2/>, contrôlé en moyenne sur les graines à ~{ "20" } % près. Activé par capteur via <c3/>.

# text
seg-49c4a2532dca = Validation croisée NaveGo (coefficients de bruit de l'IMU (centrale inertielle))

# text
# c1: tests/navego_imu_crossval.rs
# c2: github.com/rodralez/NaveGo
# c3: navego_example_allan.m
# c4: ADEV(1 s) = σ·√dt
# c5: < 5%
# c6: .mat
seg-e558aa705560 = <c1/> : un contrôle croisé externe par rapport à <b>NaveGo</b> (R. Gonzalez, boîte à outils INS/GNSS open source (INS : système de navigation inertielle), <c2/>). Reproduit l'aller-retour synthétique du <c3/> de NaveGo sur son <b>profil de référence publié du Microstrain 3DM-GX3-35</b> : en pilotant notre estimateur d'ADEV avec recouvrement (validé par NBS14/Stable32) avec un bruit blanc de capteur aux niveaux à 1 σ de NaveGo, on retrouve les coefficients de marche aléatoire de vitesse et d'angle (VRW, ARW) (<c4/>) à <c5/> (réel ~{ "0.4" } %), la branche de bruit blanc étant à la pente −1/2. Confirme que notre chaîne d'Allan et les définitions VRW/ARW de NaveGo concordent. Le journal <c6/> STIM300 enregistré de { "40" } Mo n'est pas ingéré (conditionné par le format binaire).

# text
seg-171b215f0526 = Facteur d'échelle, termes d'axes croisés plus fins

# text
# c1: not modeled
seg-b690ed87f493 = <c1/> dans ce paquet à 1 DDL (un degré de liberté)

# text
# c1: gnss-ins
# c2: src/inertial/imu_errors.rs
seg-c1bd4e24c091 = Le paquet hérité à axe unique n'a ni facteur d'échelle ni erreur de couplage croisé. La bibliothèque strapdown à trois axes et le paquet <c1/> modélisent le facteur d'échelle, le désalignement, la sensibilité à g, la quantification et la rampe de vitesse (<c2/> ; voir le tableau des affirmations ci-dessous).

# text
seg-ce2b3237acfe = stabilité de biais

# text
seg-129dc6af8f10 = racine de DSP du bruit

# text
seg-7109e60b8c9b = cold-atom-quat (quantique)

# text
seg-5f5690d74918 = { "5.88e-7" } m/s^{ "2" } ({ "60" } ng, { "24" } h)

# text
seg-8e83c799fb03 = { "22" } ug/sqrtHz = { "2.16e-4" } (m/s^{ "2" })/sqrtHz

# text
seg-b52686064c43 = Templier et al. { "2022" }, Science Advances (arXiv:{ "2209.13209" })

# text
seg-09b42bed82c9 = nav-grade-quartz (classique)

# text
seg-fa9adbe58c2f = { "1.57e-3" } m/s^{ "2" } (~{ "160" } ug)

# text
seg-63f64f576abc = ~{ "20" } ug/sqrtHz = { "1.96e-4" } (m/s^{ "2" })/sqrtHz

# text
seg-8714c547449a = Honeywell QA-2000 / tutoriel Groves AESS

# text
seg-79fc524162b5 = Mise en perspective honnête : l'avantage de l'atome froid est la <b>stabilité de biais à long terme</b> (~2600 fois plus faible), qui domine lors d'une longue interruption du GNSS via { "0.5" }<em>b</em>T^{ "2" }. Le bruit à court terme est comparable (quantique ~{ "22" } contre classique ~{ "20" } ug/sqrtHz) — le capteur quantique gagne le marathon, pas le sprint. Maturité : les accéléromètres à atomes froids en sont au stade du laboratoire/des débuts (JRC122785), le quartz de qualité navigation est déployé.

# text
seg-e02e93f4f30a = Paquet { "3" } — transfert de temps (optique contre radiofréquence (RF), liaison optique inter-satellites)

# text
seg-2b87e5f0ba7e = Gigue de temps blanche -> précision de synchronisation

# text
# c1: src/timetransfer.rs
seg-229295aa1f70 = <c1/> : la RMS de synchronisation simulée reproduit la gigue de liaison sigma_j ; la moyenne d'échantillon se moyenne en sigma/sqrt(N) à <{ "20" } % près (moyenné sur les graines).

# text
seg-4325ec478bca = Synchronisation temporelle -> télémétrie unidirectionnelle

# text
seg-aa7a1f463683 = distance = c * dt, c={ "299792458" } m/s ; { "1" } ps = { "0.299792458" } mm (exact, test dérivé à la main).

# text
seg-7ad8bb95bf35 = Plancher de scintillement/TDEV, résidu de réciprocité bidirectionnelle

# text
# c1: src/twstft_budget.rs
# c2: time-transfer-budget
# c3: timetransfer
seg-5bf72778b6c2 = <c1/> (type <c2/>) : bruit de phase de scintillement (Kasdin–Walter, TDEV plat), non-réciprocité diurne et résidu de réciprocité constant sur la série bidirectionnelle ; le paquet <c3/> à gigue blanche est inchangé.

# text
seg-dae3fa0375fe = gigue d'un échantillon

# text
seg-4a141a45a8ff = source

# text
seg-ee136a1d0051 = { "1" } ps ({ "1e-12" } s)

# text
seg-c78abd60ec97 = cible crédible en orbite

# text
seg-9dfc1d4334a3 = liaison optique inter-satellites, cible de synchronisation à la picoseconde ; O-TWTFT de laboratoire (TWTFT : transfert bidirectionnel de temps et de fréquence) ~{ "1" } fs (Giorgetta { "2013" } / Deschenes { "2016" })

# text
seg-4f3d23d83190 = { "0.5" } ns ({ "5e-10" } s)

# text
seg-0e730e8e2237 = mesuré, session unique

# text
seg-b9faad47d802 = TWSTFT BIPM/PTB/NIST (BIPM : Bureau international des poids et mesures ; PTB : Physikalisch-Technische Bundesanstalt, l'institut national allemand de métrologie)

# text
seg-51e2e5782c96 = Mise en perspective honnête : le chiffre optique est une cible de synchronisation en orbite au niveau de la picoseconde (non volée). Le plancher des laboratoires optiques terrestres est d'environ { "1" } fs (bien meilleur) ; une liaison micro-onde bien conçue (la liaison micro-onde (MWL) d'ACES (Atomic Clock Ensemble in Space), ~{ "0.3" } ps) peut rivaliser avec l'optique, de sorte que la référence de base « RF = { "0.5" } ns » désigne précisément un TWSTFT ordinaire. La conversion en distance est unidirectionnelle (distance = c<em>dt) ; le bidirectionnel/aller-retour la divise par deux (distance = c</em>dt/2).

# text
seg-5fa72f18f983 = Paquet { "4" } — fusion hybride (synthèse)

# text
# c1: pnt_holdover_s
seg-3de12b094504 = Compose le paquet { "1" } (horloge), le paquet { "2" } (inertiel) et le paquet { "3" } (transfert de temps) en une seule suite PNT (positionnement, navigation et synchronisation temporelle). La suite doit maintenir À LA FOIS la synchronisation temporelle (< spécification de temps) et la position (< spécification de position) dans les limites ; <c1/> est la durée jusqu'à ce que l'une des deux soit dépassée. Un transfert de temps optique inter-satellites (ISL) facultatif resynchronise l'horloge pendant l'interruption (aide au temps seulement — la position n'est pas resynchronisée, puisque le transfert de temps donne le temps, pas la position).

# text
seg-4f7cd8f86565 = Aspect

# text
seg-19deb2a3537c = Notation PNT combinée (temps ET position)

# text
# c1: src/hybrid.rs
# c2: score_hybrid
seg-77a7595ffad7 = <c1/> test <c2/> dérivé à la main (pnt_holdover = premier dépassement entre temps et position).

# text
seg-d0e39bf123d8 = Intégrité + sécurité pour le paquet hybride

# text
# c1: src/hybrid.rs
seg-3fb63eb2b6b8 = <c1/> : un estimateur de temps de Kalman asservi à la vérité (nominal) et réancré à chaque resynchronisation optique ; l'intégrité est le confinement par la borne de protection (la borne inclut le plancher de gigue de la liaison), la sécurité est le score de détection de leurrage. Testé pour les deux suites, y compris le cas assisté par la liaison.

# text
seg-c3be96b7cb41 = Estimateur de fusion conjoint

# text
# c1: src/fusion/mod.rs
seg-e9d5448ea06c = <c1/> : un unique filtre de Kalman conjoint ([phase, fréq] ⊕ [pos, vit]) est le navigateur, asservi par le GNSS (apprenant les décalages à partir d'une covariance initiale non nulle) et assisté par le transfert de temps ; la covariance conjointe donne une intégrité conjointe testée fiable (≥{ "0.9" }) pour les deux suites avec des capteurs cohérents en bruit. Le paquet observe la position et le temps <b>séparément</b>, pour quoi le filtre optimal est bloc-diagonal ; l'estimation de biais constant à état augmenté et l'aide croisée dynamique relèvent de travaux futurs.

# text
seg-915ec766439f = Filtre couplé horloge+position (covariance inter-blocs)

# text
# c1: CoupledPntFilter
# c2: [pos, vel, phase, freq]
# c3: ρ = g·pos + c·phase + noise
# c4: P[pos,phase]
seg-fd718a51859a = <c1/> : un unique filtre de Kalman <c2/> empilé (mises à jour sous forme de Joseph) dont la mesure de <b>pseudodistance</b> <c3/> couple les blocs de position et d'horloge. Tests : une pseudodistance partagée rend <c4/> non nul (des filtres découplés le maintiennent exactement à { "0" }) ; deux géométries distinctes résolvent conjointement des décalages injectés de position et d'horloge qu'une seule distance ne peut séparer ; un correctif <b>d'horloge seule</b> affine la <b>position</b> grâce à la covariance croisée (le gain que procure le couplage et que ne procurent pas les filtres découplés) ; et un <b>NEES Monte-Carlo est cohérent avec χ²({ "4" })</b> (Bar-Shalom §{ "5.4" }, bande fondée sur les exécutions). 1 DDL (la dimensionnalité du paquet) ; pas encore raccordé au paquet exécutable, et l'extension 3D à 8 états relève de travaux futurs.

# text
seg-31ecf062b941 = Composition de sous-modèles validés

# text
seg-9b849cb4fe8d = hérite

# text
seg-4e1c8b6791f3 = les termes d'horloge/inertiel/transfert de temps sont validés dans leurs propres paquets.

# text
# c1: gnss-ins
seg-b672e5499976 = GNSS/INS à couplage lâche (paquet <c1/>)

# text
# c1: src/fusion/{gnss_ins_ekf,closed_loop,pack}.rs
# c2: closed_loop::tests::gyro_bias_coupling_predicts_the_strapdown_attitude_error
seg-277425f2cbcf = <c1/> : un EKF à état d'erreur à 15 états (δp, δv, ψ, biais d'accéléromètre/gyroscope ; Groves §{ "14" }) pilote le navigateur strapdown à trois axes avec rétroaction. Tests : une erreur de position injectée s'annule sous une aide à vérité parfaite ; la solution aidée reste bornée au mètre alors qu'un INS en marche libre diverge au-delà de { "100" } m ; et la RMS de position fusionnée sur une interruption de { "60" } s bat la navigation à l'estime sans aide selon la borne du test d'ensemble (~{ "4" }× lorsque mesuré avant { "0.27.3" } ; la marge est plus grande après la correction ci-dessous). Le couplage du biais de gyroscope est contrôlé par rapport au strapdown lui-même : un biais résiduel connu du gyroscope doit produire l'erreur d'attitude que prédit le filtre (<c2/>), et un a priori large doit apprendre un biais de gyroscope de classe contrôleur de vol tout en restant borné ; les deux échouent avec le signe d'avant la version 0.27.3. <b>Révisé dans { "0.27.3" } :</b> ce couplage avait le mauvais signe, de sorte que les estimations du biais de gyroscope allaient dans le mauvais sens et que seul un a priori serré maintenait le paquet stable ; les chiffres d'interruption publiés ont changé (CHANGELOG, Fixed). Limite honnête : le biais d'accéléromètre et l'inclinaison à couplage lâche sont faiblement séparables ; un étalonnage par biais n'est donc pas revendiqué.

# text
seg-1c9a9f76a432 = GNSS/INS à couplage serré (pseudodistance)

# text
# c1: update_tightly_coupled
# c2: closed_loop.rs
# c3: fuse_tightly_coupled
seg-b4ccc12229c4 = <c1/> + <c2/> <c3/> : l'innovation est formée dans le domaine des distances (jacobienne de la ligne de visée sur δp). Tests : quatre satellites annulent une erreur horizontale injectée de { "8" } m/−{ "5" } m à < { "0.1" } m ; <b>deux satellites</b> (aucun point position, vitesse et temps (PVT) possible) réduisent encore l'erreur horizontale de > { "5" }× ; un seul satellite au zénith n'observe que la composante le long de la ligne de visée (verticale) et laisse l'horizontale intacte ; les entrées malformées sont rejetées. Pseudodistance seule — la phase de la porteuse et un état explicite d'horloge du récepteur figurent dans la feuille de route.

# text
seg-240b681b6021 = Fidélité de l'aide croisée entre capteurs (fusion complète par Kalman/graphe de facteurs)

# text
# c1: not modeled
# c2: hybrid
seg-efe7e288276b = <c1/> dans le paquet <c2/>

# text
# c1: gnss-ins
# c2: hybrid-ukf
seg-e5371874c57d = Le paquet hybride est une composition au niveau du système + une aide au temps, et non un estimateur optimal. Des filtres existent ailleurs : l'EKF (filtre de Kalman étendu) à couplage lâche et serré du paquet <c1/> (lignes ci-dessus) et l'UKF (filtre de Kalman sans parfum) à 17 états du type <c2/>. Aucun lisseur à graphe de facteurs n'est modélisé.

# text
seg-189758709fd2 = Résultat : la suite tout-quantique tient un PNT complet pendant une interruption de { "1.8" } h ; la suite tout-classique est <b>limitée par la position</b> (l'IMU de qualité navigation dépasse sa limite en premier). Le transfert de temps optique ISL maintient verrouillée même l'HORLOGE classique, ce qui isole le capteur inertiel comme maillon faible de la suite classique — l'argument central en faveur de l'inertiel quantique et de la synchronisation optique ensemble.

# text
seg-a4c5b45ea8a5 = Géométrie — disponibilité du GNSS à partir des orbites

# text
seg-d347bb63c1fd = Propagation circulaire à deux corps

# text
# c1: src/orbit.rs
# c2: T=2 pi sqrt(r^3/mu)
seg-60c369fbbd97 = <c1/> : période <c2/> (mu = { "3.986004418e14" }), la position revient après une période, planéité équatoriale/polaire — tests dérivés à la main.

# text
seg-1260a2fef95f = Propagation excentrique (képlérienne)

# text
# c1: src/orbit.rs
# c2: M = E - e sin E
# c3: a(1∓e)
seg-49df9d526f9c = <c1/> : l'équation de Kepler <c2/> résolue par Newton (résidu < { "1e-12" }) ; rayons au périgée/apogée <c3/> ; le cas circulaire concorde avec le chemin en forme fermée à { "1e-9" }.

# text
seg-958f03424508 = Dérive séculaire nodale/apsidale due à J2

# text
# c1: src/orbit.rs
# c2: Omega_dot = -1.5 n J2 (Re/p)^2 cos i
# c3: argp_dot = 0.75 n J2 (Re/p)^2 (5cos^2 i - 1)
seg-336b9581c47c = <c1/> : <c2/>, <c3/> (Vallado) ; le nœud régresse (prograde) / avance (rétrograde) / est stationnaire (polaire), et les apsides se figent à l'inclinaison critique { "63.4" } deg — tests de signe/de zéro dérivés à la main. Deux corps + séculaire seulement, non osculateur.

# text
seg-dcba8d368326 = Visibilité en ligne de visée (occultation terrestre + masque d'élévation)

# text
seg-2eee9a8f894b = Satellite antipodal occulté, satellite radialement vers l'extérieur à { "90" } deg d'élévation, satellite tangentiel à l'horizon — tests exacts dérivés à la main.

# text
seg-f251c75eb367 = Visibilité -> état du GNSS -> ligne de temps

# text
# c1: >=4
seg-70fbb9f3cc2b = <c1/> visibles = nominal, 1-3 dégradé, { "0" } refusé ; générateur Walker-delta ; un test d'intégration pilote une exécution de holdover d'horloge à partir de la ligne de temps dérivée.

# text
seg-988d3fedb7f5 = Optimiseur de conception de constellation + géométrie en rues de couverture

# text
# c1: src/walker.rs
# c2: optimize_walker_design
# c3: {planes × sats × inclination}
# c4: DesignObjective
# c5: coverage_half_angle_rad
# c6: λ = arccos(Re/r·cos ε) − ε
# c7: street_half_width_rad
# c8: cos c = cos λ / cos(π/s)
# c9: λ < π/s ⇒ None
seg-2a636487a4e6 = <c1/> : <c2/> parcourt la grille <c3/> et renvoie la cellule qui satisfait le mieux un <c4/> (nombre minimal de satellites pour une cible de couverture / couverture maximale / PDOP (dilution de précision de position) du pire cas minimal) — un test affirme que le choix est égal à un balayage exhaustif indépendant du même balayage, et un exemple détaillé confirme qu'une conception Walker 24/6/1 du GPS (Global Positioning System) couvre au moins aussi bien qu'une version clairsemée à 18 satellites. Les formes fermées analytiques des <b>rues de couverture</b> (<c5/> <c6/> ; <c7/> <c8/>, Rider/Beste) sont vérifiées à la main par rapport à la géométrie des manuels (GPS avec un masque de { "5" }° : λ ≈ { "71.16" }°, demi-largeur de rue à 4 satellites ≈ { "62.83" }°) et détectent l'écart de sous-peuplement (<c9/>). Le solveur complet de Rider du nombre minimal de satellites pour une couverture <em>globale</em> (le nombre de plans sensible aux jointures) n'est pas encore implémenté.

# text
seg-a1c1364cc45a = Dilution de précision (GDOP/PDOP/HDOP/VDOP/TDOP (GDOP : dilution de précision géométrique ; HDOP : dilution de précision horizontale ; VDOP : dilution de précision verticale ; TDOP : dilution de précision temporelle)) -> précision de position

# text
# c1: src/orbit.rs
# c2: Q=(HᵀH)⁻¹
# c3: tests/dop_reference.rs
# c4: tests/fixtures/dop/
seg-a1706d47f895 = <c1/> : <c2/> à partir de la matrice de conception des lignes de visée. <b>Référence indépendante externe</b> (<c3/>) : les cinq facteurs DOP reproduisent ceux calculés par <b>gnss_lib_py { "1.0.4" }</b> (Stanford NAV Lab — une bibliothèque GNSS indépendante et évaluée par des pairs, utilisée ici comme ERFA (Essential Routines for Fundamental Astronomy) l'est pour les référentiels) sur <b>{ "8" } géométries</b> allant de bien conditionnées à quasi singulières (DOP de l'ordre de plusieurs centaines), à <b>{ "1e-6" }</b> en valeur relative ; provenance + régénération dans <c4/>. Comme contrôle supplémentaire en forme fermée, une géométrie en tétraèdre régulier reproduit les DOP analytiques (PDOP { "1.5" }, TDOP { "0.5" }, GDOP √{ "2.5" }, HDOP √{ "1.5" }, VDOP √{ "0.75" }) à { "1e-9" }. Sigma de position = PDOP × erreur de distance équivalente utilisateur.

# text
seg-504d5aa92cbc = Erreur de position = σ_UERE × DOP pour le point par moindres carrés propre au moteur

# text
# c1: src/dop_error_mc.rs
# c2: tests/uere_dop_monte_carlo.rs
# c3: pvt::solve_spp
# c4: tests/fixtures/dop/dop_reference.csv
# c5: orbit::dop
# c6: orbit::dop_cofactor
# c7: src/dop_error_ci.rs
# c8: tests/position_error_dop_ci.rs
seg-fc3443210358 = <c1/>, <c2/> : un Monte Carlo à graine fixe (N = { "20,000" } époques par géométrie, σ = { "1.5" } m, graine ChaCha8 { "36" } + i) de <c3/> avec des poids unitaires, résolu à partir de la position vraie, sur les <b>{ "8" } géométries de <c4/></b> (celles dont le DOP concorde avec gnss_lib_py), par rapport à σ²·Q où Q est le facteur de covariance du noyau <c5/> lui-même (<c6/>, la même arithmétique). <b>Tolérances préenregistrées</b> (commit e50c88d2, avant la première exécution, selon la note de conception de géométrie { "0.36" }, section { "5.2" }), chacune exprimée en nombre d'erreurs standard : variances est, nord, haut et horloge à { "5" } % près ; RMS H/V/P à { "2.5" } % près ; corrélation est-nord à { "0.035" } près ; moyennes à { "5" } erreurs standard près ; fraction de l'ellipse horizontale à { "95" } % dans { "0.95" } ± { "0.0077" }. Première exécution : les { "104" } contrôles passent tous (pire variance { "3.2" } %, RMS { "1.6" } %, corrélation { "0.012" }, moyenne { "2.2" } erreurs standard, ellipse { "0.0039" }). Les <b>contrôles négatifs</b> échouent comme requis : un PDOP doublé échoue sur chaque géométrie ; des erreurs croissant en 1/sin(élévation) face au Q non pondéré échouent à un contrôle de variance sur chaque géométrie dont le satellite le plus bas est sous { "20" }°. <b>Comment cela se compose avec la ligne ci-dessus :</b> cette ligne valide le DOP de ces géométries par rapport à gnss_lib_py ; celle-ci ajoute le passage de ces facteurs aux mètres par le solveur du moteur. <b>Un premier contrôle distinct est conservé à côté</b> (<c7/>, <c8/>, exécuté avant le préenregistrement et rapporté comme tel) : quatre ciels choisis à la main (dégagé, groupé, canyon, demi-ciel ; σ { "1" } m) avec des intervalles de confiance du chi carré à { "1e-6" } au total sur { "20" } contrôles ; rapports de { "0.987" } à { "1.009" }, et ses propres contrôles négatifs (une erreur de DOP de { "10" } %, des erreurs en 1/sin(élévation)) échouent comme requis. <b>Pourquoi MODELLED :</b> aucun jeu de données externe ; cela ne montre pas que l'erreur d'un récepteur réel suit le modèle, et σ_UERE est une entrée.

# text
seg-94bffbd8385b = Disponibilité multi-constellation

# text
# c1: src/orbit.rs
# c2: [[constellations]]
seg-a40eab03bbbe = <c1/> : des <c2/> supplémentaires sont fusionnées en un seul ensemble de satellites pour la visibilité/DOP ; un test de décompte combiné confirme l'union.

# text
seg-0b905100d91c = Ionosphère diffusée (Klobuchar, IS-GPS-200 (IS : Interface Specification)) → retard oblique L1

# text
# c1: src/gnss_sim.rs
# c2: klobuchar_delay_m
# c3: tests/klobuchar_reference.rs
# c4: ionmodel
# c5: src/rtkcmn.c
# c6: src/ionex.rs
# c7: parse_ionex
seg-05e278f04770 = <c1/> : <c2/>, le modèle monofréquence diffusé à huit coefficients. <b>Référence indépendante externe</b> (<c3/>) : le retard oblique L1 reproduit le <b><c4/> de RTKLIB (une bibliothèque libre de positionnement cinématique en temps réel)</b> (tomojitakasu/RTKLIB, <c5/> — la référence GNSS de fait, ouverte, compilée à partir des sources et exécutée indépendamment) sur <b>{ "10" } cas</b> couvrant élévation, azimut, heure locale et deux jeux de coefficients (celui par défaut de kshana + celui de RTKLIB), à <b>< { "1e-4" } m</b>. Le lecteur de cartes TEC (TEC : contenu électronique total) IONEX (format d'échange de cartes de l'IONosphère) pour les fichiers GIM (carte ionosphérique globale) existe maintenant (<c6/>, <c7/> avec interpolation spatiale et temporelle bilinéaire et une projection oblique, testé unitairement dans le crate) ; un contrôle croisé de cette interpolation par rapport à un véritable produit GIM du CODE (Center for Orbit Determination in Europe) reste à faire. Le modèle diffusé lui-même est validé en externe.

# text
seg-39e235557ecc = Noyau de détection RAIM/ARAIM (ARAIM : surveillance autonome avancée de l'intégrité par le récepteur) (χ² / χ² non central / normale) → seuils et multiplicateurs

# text
# c1: src/raim.rs
# c2: chi2_quantile
# c3: pbias=√λ
# c4: noncentral_chi2_cdf
# c5: normal_quantile
# c6: tests/raim_reference.rs
# c7: scipy.stats.chi2
# c8: .ncx2
# c9: .norm
# c10: optimize.brentq
# c11: (GᵀG)⁻¹
# c12: tests/araim_reference_vectors.rs
# c13: ARAIM_REFERENCE.md
seg-8906f922b9b9 = <c1/> : le seuil de détection instantané / séparation des solutions / ARAIM (<c2/>), la non-centralité de non-détection <c3/> (<c4/>) et les multiplicateurs K_fa/K_md/K_V (<c5/>) sont tous évalués à partir d'une fonction gamma incomplète régularisée sans dépendance. <b>Référence indépendante externe</b> (<c6/>) : <b>{ "171" } cas</b> reproduisent <b>SciPy { "1.17.0" }</b> (<c7/>/<c8/>/<c9/> + <c10/> — une implémentation Cephes/Boost indépendante, un algorithme différent) sur les plages de fonctionnement P_fa / P_md / redondance, à <b>≤ { "1e-6" } en valeur relative</b>. La géométrie qui enveloppe le noyau (la pente/covariance issue de <c11/>) est le noyau DOP validé par gnss_lib_py. <b>Portée :</b> cette ligne fixe le <em>noyau statistique</em>. La <em>valeur</em> du niveau de protection de l'allocation MHSS (séparation des solutions à hypothèses multiples) d'ARAIM est fixée séparément par rapport à l'exemple détaillé publié du sous-groupe technique ARAIM du WG-C (Working Group C) (<c12/>, VPL (niveau de protection vertical) { "18.2926" } m contre { "18.3" } m, HPL (niveau de protection horizontal) { "13.4063" } m contre { "13.45" } m, dans la propre tolérance de { "0.05" } m de la référence ; voir la note sur les normes ci-dessous et <a1><c13/></a1>).

# text
seg-b17f1501a267 = Niveau de protection SBAS (système d'augmentation par satellite) (DO-229E Annexe J) → niveau de protection horizontal / vertical (HPL / VPL)

# text
# c1: src/sbas.rs
# c2: sbas_protection_level
# c3: D=(GᵀWG)⁻¹
# c4: tests/sbas_reference.rs
# c5: zsiki/rtklib_ws
# c6: waasprotlevels()
# c7: rnx2rtkp -ws
# c8: core/filter.c
# c9: Φ⁻¹(1−5e-8)=5.3267
# c10: d_U
seg-abe00b67e4cb = <c1/> : <c2/>, le <c3/> des moindres carrés (LS) pondérés → grand axe de l'ellipse d'erreur horizontale + σ vertical, mis à l'échelle par les facteurs K de DO-229E. <b>Référence indépendante externe</b> (<c4/>) : le HPL de kshana reproduit la <b>variante RTKLIB SBAS-PL</b> (<c5/> <c6/>, l'implémentation « DO-229D Appendix J » de Siki & Takács { "2017" }), exécutée par <c7/> sur de <b>vraies données EGNOS (European Geostationary Navigation Overlay Service)</b> (messages diffusés par le GEO (orbite géostationnaire) PRN120 + vrai RINEX (Receiver Independent Exchange Format) BUTE/Budapest, 2017-02-19), sur <b>{ "6" } époques</b> à <b>< { "2e-3" } m</b>. Le σ par satellite est le propre budget SBAS complet de la référence indépendante (UDRE (erreur différentielle de distance utilisateur) + GIVE (erreur verticale ionosphérique de grille) iono + tropo + aéroporté). ESA gLAB { "v6.0.0" } (<c8/>) a été compilé et confirmé comme utilisant la même convention. <b>Note sur K_V :</b> les deux références indépendantes arrondissent le K_V de la MOPS (normes minimales de performance opérationnelle) à { "5.33" } ; kshana utilise la valeur exacte <c9/> (VPL ~{ "0.06" } % plus petit), de sorte que la verticale est validée sous la forme <c10/> sans facteur K (= VPL de la référence indépendante / { "5.33" }). Le HPL est mis en correspondance directement (K_H = { "6.0" } des deux côtés).

# text
seg-fd16d642cafd = Géométrie réelle de constellation à partir de TLE (ligne 2 / képlérien)

# text
# c1: validated
seg-1311ef1cb4bb = <c1/> (analyse syntaxique)

# text
# c1: src/tle.rs
seg-5117debbce89 = <c1/> : analyse les éléments képlériens moyens de la ligne 2 (demi-grand axe à partir du mouvement moyen) ; un jeu d'éléments connu de l'ISS (Station spatiale internationale) fait l'aller-retour vers les bons éléments et la bonne période. Pour un bloc à ligne 2 seule, la propagation est celle à deux corps du moteur (+ J2 facultatif) des éléments <em>moyens</em> — correcte pour un instantané à une époque commune, dérivant par rapport à SGP4 (Simplified General Perturbations { "4" }) avec le temps.

# text
seg-26d22e76e28d = Propagation SGP4 / SDP4 (Simplified Deep-space Perturbations { "4" }) (TLE complets)

# text
# c1: src/sgp4.rs
# c2: tests/sgp4_verification.rs
seg-1099f1bffa01 = <c1/> : SGP4 complet pour l'orbite proche de la Terre + SDP4 pour l'espace lointain (séculaire/périodique luni-solaire + résonance géopotentielle de { "12" } h / { "24" } h). Validé dans <c2/> par rapport aux vecteurs officiels AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 (« Revisiting Spacetrack Report #3 ») — les { "666" } états de référence (orbite proche de la Terre, espace lointain, résonants, cas de code d'erreur) concordent avec une erreur de position au pire cas d'environ { "4.1" } mm. Un jeu complet à deux lignes (ligne { "1" } + ligne { "2" }) est propagé avec SGP4 ; la ligne 2 seule reste képlérienne ; les deux peuvent être mélangés. Le référentiel est TEME (true equator, mean equinox), utilisé de façon cohérente pour l'utilisateur et les satellites (aucune réduction TEME→ECEF (ECEF : géocentrique, lié à la Terre) — suffisant pour la géométrie de disponibilité/DOP).

# text
seg-c8fc6a49d249 = Nutation IAU (Union astronomique internationale) 2000A / 2000B + réduction TEME→GCRS (GCRS : Geocentric Celestial Reference System)

# text
# c1: src/nutation.rs
# c2: nutation_iau2000a
# c3: nutation_iau2000b
# c4: eraNut00a
# c5: eraNut00b
# c6: nut00a
# c7: tools/gen_nut00a.py
# c8: nutation_iau2000a_data.rs
# c9: iauNumat
# c10: teme_to_gcrs
# c11: numat
# c12: tests/frame_reference_vectors.rs
seg-b31c49596100 = <c1/> : la série <b>IAU 2000A complète</b> ({ "678" } termes luni-solaires + { "687" } termes planétaires, <c2/>) et la troncature à 77 termes 2000B (<c3/>) sont chacune validées <b>au bit près</b> par rapport aux vecteurs de référence publiés SOFA/ERFA (SOFA : Standards of Fundamental Astronomy) à JD_TT { "2453736.5" } — <c4/> donne Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" } ; <c5/> donne Δψ = −{ "0.9632552291148363e-5" }, Δε = { "0.4063197106621160e-4" } — tous deux à <b>{ "1e-13" } rad</b>. La table 2000A est générée par machine à partir de la source ERFA <c6/> par <c7/> (reproduit <c8/> validé au bit près). La matrice de nutation (<c9/>), l'équation des équinoxes et la chaîne complète TEME→TOD→MOD→GCRS (TOD : vrai de la date ; MOD : moyen de la date) (<c10/>, Vallado AIAA-2006-6980) sont testées pour les propriétés de rotation propre / d'aller-retour / de précession plus nutation, la matrice de nutation par rapport à ERFA <c11/> élément par élément à { "1e-14" }, et toute la chaîne TEME→GCRS par rapport à l'exemple publié TEME→GCRF de Vallado (AIAA 2006-6753, 2004-04-06) à <b>{ "0.11" } m</b> (<c12/>) ; jusqu'à l'ajout de ce contrôle de bout en bout, la matrice de nutation portait Δψ avec le mauvais signe, une rotation de { "2" }·Δψ (environ { "25" }″) que les tests de propriétés ne pouvaient pas voir (voir CHANGELOG, Unreleased, Fixed) ; 2000A et 2000B concordent à < { "1" } mas comme requis. La chaîne est fondée sur l'équinoxe/GMST (GMST : temps sidéral moyen de Greenwich) ; la réduction CIO (X,Y,s) sans équinoxe et son contrôle croisé numérique indépendant ANISE/SPICE (ANISE : Attitude, Navigation, Instrument, Spacecraft, Ephemeris — une boîte à outils de géométrie planétaire en Rust pur ; SPICE : Spacecraft, Planet, Instrument, C-matrix, Events) (≤ { "3.6" } m en orbite GNSS, bien à l'intérieur de la cible < { "10" } m) figurent dans la ligne CIO ci-dessous.

# text
seg-0be3c40cc81a = Modèle du champ principal géomagnétique IGRF-14 (IGRF : International Geomagnetic Reference Field)

# text
# c1: src/igrf.rs
# c2: igrf14coeffs.txt
# c3: tools/gen_igrf.py
# c4: igrf_data.rs
# c5: (B_r,B_θ,B_φ)
# c6: < 0.02°
# c7: synthesis_matches_the_official_bgs_igrf14_values_at_2025
seg-9dbb3b1b18a1 = <c1/> : le champ en harmoniques sphériques normalisées de Schmidt de l'IAGA (Association internationale de géomagnétisme et d'aéronomie) (degré/ordre { "13" }, { "2025.0" } + variation séculaire ; coefficients générés par machine à partir du fichier officiel <c2/> par <c3/>, reproduisant <c4/> au bit près). Validé sur cinq fronts indépendants : ({ "1" }) contrôles ponctuels exacts des coefficients par rapport au fichier de l'IAGA (g₁⁰=−{ "29350.0" }, g₁¹=−{ "1410.3" }, h₁¹={ "4545.5" } nT) ; ({ "2" }) la synthèse de degré 1 reproduit le champ <b>exact du dipôle incliné en forme fermée</b> <c5/> à { "1e-6" } ; ({ "3" }) le <b>champ analytique complet de degré 13 est égal à −∇V</b> du potentiel scalaire (différences finies, à { "1e-4" }) — exerçant de bout en bout les dérivées de Legendre et le terme en 1/sinθ ; ({ "4" }) l'axe du dipôle reproduit le <b>pôle nord géomagnétique</b> connu (~{ "80.7" }°N, −{ "72.7" }°E) et l'<b>intensité du dipôle</b> (~{ "29.7" } µT), et le champ global se situe dans la bande physique de { "22" }–{ "67" } µT avec le bon signe d'inclinaison par hémisphère ; et ({ "5" }) <b>référence indépendante externe</b> — la synthèse complète reproduit les valeurs du <b>service web IGRF-14 du British Geological Survey</b> à { "2025.0" } (altitude géodésique, WGS-84 (WGS : World Geodetic System)) à <b>< { "2" } nT</b> sur X/Y/Z/F et <c6/> sur D/I en quatre points dont une altitude de { "400" } km (<c7/>).

# text
seg-c1027d5ffc44 = Réduction GCRS↔ITRS (ITRS : International Terrestrial Reference System) IAU 2006/2000A fondée sur le CIO

# text
# c1: src/cio.rs
# c2: (X, Y)
# c3: s
# c4: eraXys06a
# c5: eraC2ixys
# c6: eraEra00(2400000.5, 54388.0)
# c7: s
# c8: s06.c
# c9: tools/gen_s06.py
# c10: cio_s06_data.rs
# c11: gcrs_to_itrs_matrix
# c12: eraC2tcio
# c13: xval/anise-frames/
# c14: gcrs_to_itrs_matrix
# c15: earth_latest_high_prec.bpc
# c16: finals2000A
# c17: kshana
seg-aad81285e8cf = <c1/> : la chaîne céleste-terrestre sans équinoxe. Les coordonnées <c2/> du CIP (Celestial Intermediate Pole) et la série à 66 termes du localisateur CIO <c3/> sont validées <b>au bit près</b> par rapport au vecteur publié SOFA/ERFA <c4/> à JD_TT { "2453736.5" } — X={ "0.5791308482835292617e-3" } ({ "1e-14" }), Y={ "0.4020580099454020310e-4" } ({ "1e-15" }), s=-0.1220032294164579896e-7 ({ "1e-18" }) ; la matrice GCRS→CIRS (CIRS : Celestial Intermediate Reference System) par rapport à <c5/> (les neuf éléments à { "1e-12" }) ; l'angle de rotation de la Terre (ERA) par rapport à <c6/> = { "0.4022837240028158102" } ({ "1e-12" }). La table <c7/> est générée par machine à partir de la référence ERFA <c8/> par <c9/> (reproduit <c10/> au bit près). La <c11/> complète (CIO <c12/> = mouvement du pôle · ERA · GCRS→CIRS) est testée pour la rotation propre + l'aller-retour, et se révèle cohérente avec l'ancienne réduction TEME équinoxe/GMST-1982 à { "1" } m près à un rayon de { "7 000" } km (les conventions diffèrent d'environ { "5" } cm à cet endroit). <b>Contrôle croisé tiers indépendant (<c13/>) :</b> la même <c14/> est comparée à <b>ANISE</b> (la réimplémentation en Rust pur de NAIF/SPICE (NAIF : Navigation and Ancillary Information Facility)) effectuant la rotation GCRF→ITRF93 (GCRF : Geocentric Celestial Reference Frame ; ITRF93 : International Terrestrial Reference Frame { "1993" }) à partir du <c15/> du JPL (Jet Propulsion Laboratory), avec <b>des paramètres d'orientation de la Terre <c16/> de l'IERS (International Earth Rotation and Reference Systems Service) identiques fournis aux deux côtés</b>, sur huit époques trimestrielles { "2020" }–{ "2023" }. Les deux réalisations indépendantes du référentiel concordent à une <b>rotation relative maximale de { "0.028" }″ — ≤ { "0.86" } m au sol, ≤ { "0.93" } m en LEO (orbite terrestre basse), ≤ { "3.6" } m en orbite GNSS</b> (angle moyen { "0.023" }″). C'est le contrôle croisé de référentiel « < { "10" } m » de la feuille de route, <b>réalisé</b> ; le résidu est la différence attendue de modèle/datum entre ITRF93 et CIO IERS-2010, et non un défaut (l'ancrage au bit près reste les vecteurs SOFA/ERFA ci-dessus). ANISE est un crate sous MPL-2.0 (MPL : Mozilla Public License) / édition 2024 ; le contrôle réside donc dans un sous-crate autonome exclu de l'espace de travail, qui ne touche jamais le graphe de dépendances publié de <c17/> ni aucune barrière de CI par défaut.

# text
seg-fa5889f379d2 = Aller-retour d'export SP3 (Standard Product { "3" }, le format d'orbite précise) (constellation → SP3-c → ré-analyse)

# text
# c1: tests/sp3_export_roundtrip.rs
# c2: gps-ops
# c3: Sp3File::from_propagators
# c4: to_sp3_string
# c5: parse_sp3
# c6: --export-sp3
seg-cd53434eba3a = <c1/> : l'instantané réel <c2/> de Celestrak ({ "30" } satellites GPS) est propagé avec SGP4, exporté en SP3-c (<c3/> → <c4/>), ré-analysé (<c5/>), et les positions ECEF récupérées sont comparées à la vérité SGP4 à chaque époque sur { "24" } h — pire résidu <b>< { "0.5" } m</b> (la sérialisation millimétrique de l'écrivain ; la tolérance de { "10" } m de niveau TLE (TLE : jeu d'éléments à deux lignes) du jalon est respectée avec une grande marge). Le chemin <c6/> de la CLI (interface en ligne de commande) est aussi couvert : le scénario d'orbite fourni exporte un SP3 à 30 satellites ré-analysable, et un scénario sans orbite est rejeté.

# text
seg-fa5ee52e59aa = Géométrie réelle de la constellation GPS à partir de TLE (SGP4 → ECEF)

# text
# c1: tests/igs_real_data.rs
# c2: gps-ops
# c3: tests/fixtures/celestrak/NOTICE
seg-1329a53ca94c = <c1/> : un véritable <b>instantané <c2/> de Celestrak</b> (2021-07-28, { "30" } satellites GPS opérationnels ; provenance dans <c3/>) est analysé et chaque satellite est propagé par le noyau SGP4 validé jusqu'à un instant commun, puis pivoté de TEME vers ECEF. Affirme que toute la constellation se place sur la couche MEO (orbite terrestre moyenne) du GPS à { "1" } % près, et que depuis un site de latitude moyenne à ciel dégagé, la vue complète réelle (neuf satellites) donne un PDOP de { "1.64" } avec une dilution verticale supérieure à l'horizontale (comme il se doit pour un utilisateur au sol). Cela exerce SGP4 sur une constellation réelle, parallèlement aux chemins de données réelles SP3 (précis) et RINEX (diffusé).

# text
seg-a1b7d74bbe02 = Générateur Walker à éléments moyens SGP4

# text
# c1: src/walker.rs
seg-01f1635b75e4 = <c1/> : un motif Walker-delta conçu est émis sous forme d'éléments moyens SGP4 (mouvement moyen de Kozai choisi pour que le demi-grand axe SGP4 tombe sur la couche cible) et propagé par le noyau validé. Tests : un Walker de 24 satellites de type GPS se place sur la couche MEO à { "1" } % près, les plans sont espacés exactement de { "90" }° en RAAN (ascension droite du nœud ascendant) retrouvée à partir des normales d'orbite, et le mouvement moyen reproduit la période d'environ { "718" } min de la couche GPS.

# text
seg-6e8c472ec9fa = Balayage de PDOP de constellation + FoM (figures de mérite) de couverture/revisite

# text
# c1: validated
seg-dcdbf9c78ca5 = <c1/> (monotonie)

# text
# c1: src/walker.rs
# c2: pdop_sweep
# c3: {planes × sats × inclination}
# c4: coverage_revisit
seg-5a70f090db45 = <c1/> : <c2/> tabule la couverture et le PDOP médian/pire sur une grille <c3/> ; <c4/> rapporte la fraction de couverture et les écarts de revisite en un point du sol. Validé par les monotonies physiques qu'un compromis de conception doit respecter : ajouter des satellites n'abaisse jamais la couverture et abaisse strictement le PDOP médian (une conception complète de 24 satellites couvre en continu à un PDOP d'environ { "1.7" }), et densifier une constellation clairsemée réduit strictement le pire écart de revisite. L'écart moyen de revisite ne dépasse jamais le maximum. Ce sont des tableaux de compromis géométriques, et non un bilan de liaison/couverture certifié.

# text
# c1: orbit-gnss-challenged.toml
seg-9f0747d71ecc = Mise en perspective honnête : il s'agit d'une couche géométrique déterministe (orbites circulaires, Terre sphérique de rayon moyen { "6371" } km, ligne de visée pure). Elle établit la <em>disponibilité</em> et la précision de position <em>géométrique</em> (dilution de précision × un budget représentatif d'erreur de distance) à partir de la géométrie réelle, et non une solution de navigation à éphémérides précises. La référence <c1/> place un engin spatial à l'intérieur de la couche GNSS : il ne maintient un point que ~{ "59" } % de la journée, l'horloge quantique maintient une solution de synchronisation temporelle de { "5" } ns à travers chaque interruption (disponibilité { "1.0" }) tandis que l'horloge à l'échelle d'une puce tient ~{ "0.73" }.

# text
seg-e2c433c35ba8 = Propagateur numérique (Cowell) et modèle de forces

# text
# c1: src/propagator.rs
# c2: src/forces.rs
# c3: src/integrator.rs
# c4: tests/numerical_cowell_propagator_reference.rs
seg-20ace4e0a710 = Le propagateur numérique (<c1/>) intègre un modèle de forces hiérarchique (<c2/>) avec les intégrateurs adaptatifs (<c3/>). Chaque terme ci-dessous est validé par rapport à une vérité analytique ou à une forme fermée dérivée à la main ; les perturbations sont <b>désactivées par défaut</b>, de sorte que les références figées publiées sont intactes. Le modèle composé est aussi contrôlé de façon croisée par rapport à un autre outil : <c4/> exécute { "11" } cas LEO et GTO (orbite de transfert géostationnaire), { "275" } époques horaires, par rapport au propagateur DormandPrince853 d'Orekit { "12.2" }, et les niveaux conservatifs (deux corps → J2–J6 → Soleil/Lune → PRS boulet de canon) concordent à un pire cas de { "0.08" } m sur { "24" } h (VALIDATED dans la matrice) ; le niveau de traînée est seulement caractérisé ({ "333" } m) et reste MODELLED.

# text
seg-ec74e57ff801 = Propagateur de Cowell par rapport à la vérité képlérienne analytique

# text
# c1: src/propagator.rs
# c2: j2_secular_rates
# c3: solve_kepler_checked
# c4: Err
# c5: solve_kepler_robust
# c6: src/kepler.rs
# c7: tests/kepler_mpmath_oracle.rs
seg-8d773778ff0e = <c1/> : l'orbite non perturbée (deux corps) reproduit la <b>solution képlérienne exacte à variables universelles au niveau sub-métrique sur une orbite LEO de { "24" } h</b> (un seuil plus serré que « par rapport à une référence numérique < { "10" } m ») ; l'énergie spécifique et le moment cinétique se conservent à ~{ "1e-9" } en valeur relative ; la régression nodale due à J2 reproduit la forme fermée <c2/> à la théorie du premier ordre (à { "2" } % près, le résidu en O(J2²)). <c3/> renvoie <c4/> plutôt qu'une réponse silencieusement fausse lorsque Newton ne converge pas (près du périgée e = { "0.999" }). Le <c5/> robuste (amorce de Markley { "1995" }, <c6/>) y converge et sur { "0" } ≤ e ≤ { "0.999999" }, à { "0.9" } ε·|E| des racines mpmath à 50 chiffres (<c7/>).

# text
seg-549d15780f79 = Intégrateurs adaptatifs (RK4 (Runge–Kutta d'ordre quatre) par doublement de pas + la paire imbriquée de Dormand–Prince RK5({ "4" }), DP5({ "4" }) ci-dessous)

# text
# c1: src/integrator.rs
# c2: y' = y → e
# c3: propagate_dopri
# c4: integrate_dop853
# c5: tests/dop853_scipy_oracle.rs
seg-1fcc7553c627 = <c1/> : RK4 intègre <c2/> à < { "1e-9" }, montre la baisse d'erreur d'environ { "16" }× par pas divisé par deux (convergence d'ordre 4), et conserve l'oscillateur harmonique sur une période. L'estimation d'erreur imbriquée de DP5({ "4" }) est en <b>O(h⁵)</b> (diviser le pas par deux la réduit d'environ { "32" }×), intègre l'oscillateur sur { "50" } périodes en conservant l'énergie à < { "1e-6" }, et atteint le même point final à la même tolérance avec <b>moins d'évaluations de fonction</b> que le doublement de pas ; <c3/> franchit le même seuil képlérien sub-métrique et concorde avec le chemin RK4 à < { "1" } m sur une orbite J2..J6. <b>DOP853</b> (<c4/>) : la paire { "8" }({ "5,3" }) de Hairer avec sortie dense reproduit le DOP853 de SciPy { "1.18.1" } pas à pas (un pas unique à { "5.6e-15" } près ; nombres de pas identiques sur les exécutions e = { "0.7" } et Arenstorf, une bascule d'acceptation/rejet sur { "501" } pas dans l'exécution LEO ; états finaux à { "1.6e-12" } près) et concorde avec la solution képlérienne exacte aussi bien que SciPy (<c5/>).

# text
seg-345ae1eb05ec = Champ d'harmoniques zonales J2–J6

# text
# c1: src/forces.rs
# c2: zonal_accel
# c3: j2_accel
# c4: [J2]
# c5: J3
# c6: J2
# c7: J4..J6
# c8: z → −z
seg-a88e67186e69 = <c1/> : <c2/> est contrôlé de trois façons — il <b>se réduit à <c3/>, validé par 666 vecteurs, à la précision machine</b> lorsqu'il est restreint à <c4/> ; il <b>concorde avec le gradient numérique de son propre potentiel zonal</b> sur tout le champ J2..J6 (l'étalon-or des champs conservatifs) ; et les termes impairs <c5/> par rapport aux termes pairs <c6/>/<c7/> montrent la (anti)symétrie nord–sud caractéristique sous <c8/>. Une orbite J2..J6 propagée conserve l'énergie totale à ~{ "1e-8" } sur une journée.

# text
seg-5536986d9c8f = Gravité d'un troisième corps (Soleil et Lune)

# text
# c1: src/forces.rs
# c2: src/ephem.rs
# c3: third_body_accel
# c4: third_body_accel
seg-04388d03e696 = <c1/> + <c2/> : <c3/> <b>concorde avec le gradient exact de son potentiel perturbateur</b>, s'annule au géocentre, et atteint les ordres de grandeur LEO des manuels (~{ "5e-7" } m/s² pour le Soleil, ~{ "1.1e-6" } m/s² pour la Lune). L'éphéméride solaire de Montenbruck–Gill à basse précision atteint des repères J2000 dérivés à la main (distance au périhélie ≈ { "1.471e11" } m, déclinaison au solstice ~−{ "23" }°, mouvement de ~{ "1" }°/jour) ; l'éphéméride lunaire reste à l'intérieur de son enveloppe périgée/apogée, retrouve la distance moyenne de ~{ "384 400" } km, ne dépasse jamais l'inclinaison de { "5.3" }°, et revient à { "1" }° près après un mois sidéral. Le câblage du second membre (RHS) piloté par l'époque est <b>exact au bit près</b> (le terme du RHS égale <c4/> à la position échantillonnée à t = { "0" } et t = { "1" } jour), et un décalage d'époque d'un quart d'année produit une trajectoire différente.

# text
seg-9c8756f9d534 = Pression de radiation solaire (SRP) + ombre conique

# text
# c1: src/forces.rs
# c2: srp_accel
# c3: ν·P☉·cᵣ·(A/m)·(AU/d)²·d̂
# c4: conical_shadow
# c5: ν = 1
# c6: ν = 0
# c7: [b−a, b+a]
seg-e6110e015204 = <c1/> : <c2/> (boulet de canon <c3/>) est <b>identique au bit près</b> à la forme fermée en plein soleil, fixe la <b>pression de radiation à 1 UA (UA : unité astronomique) à ≈ { "4.5398e-6" } N/m²</b>, se situe dans la bande LEO de ~{ "1.36e-7" } m/s² en poussant à l'opposé du Soleil, est divisée par quatre lorsque la distance au Soleil double (carré inverse), et est <b>exactement nulle</b> au fond de l'ombre. <c4/> donne <c5/> en plein soleil et <c6/> en ombre totale (exact), une pénombre monotone et lisse montant de { "0" } → { "1" } sur la bande <c7/> qui <b>s'étend au-delà du cylindre d'ombre</b>.

# text
seg-17b48db4038b = Traînée atmosphérique (premier terme dépendant de la vitesse)

# text
# c1: src/forces.rs
# c2: atmospheric_density
# c3: drag_accel
seg-4e6c2d0fff55 = <c1/> : <c2/> (exponentielle par morceaux du tableau 8-4 de Vallado) <b>s'ancre à { "1.225" } kg/m³ au niveau de la mer</b>, est plafonné sous la surface, décroît de façon monotone à travers le LEO, se situe dans la bande de ~{ "1e-12" } kg/m³ à { "400" } km avec une hauteur d'échelle physique retrouvée de ~{ "58" } km ; <c3/> s'oppose à la vitesse relative de co-rotation à l'ordre de grandeur LEO de ~{ "2e-6" } m/s². Le contrôle signature : une orbite de { "300" } km perd de l'énergie spécifique <b>de façon monotone</b> et son demi-grand axe décroît d'une quantité bornée de ~km/jour, alors que la référence de base dans le vide conserve l'énergie à < { "1e-9" }.

# text
seg-133eed361425 = Correction relativiste post-newtonienne (Schwarzschild)

# text
# c1: src/forces.rs
# c2: relativistic_accel
# c3: β = γ = 1
# c4: a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}
# c5: 3μ²/(c²r³)·r̂
# c6: ≈1.9e-9
# c7: μ(4μ + 3v²r)/(c²r³)
seg-c8e26480f148 = <c1/> : <c2/> (forme <c3/> de l'IERS <c4/>) se réduit sur une orbite circulaire à la forme fermée <c5/> (composantes radiale, <b>vers l'extérieur</b>, hors axe exactement nulles), montre le <b>rapport <c6/> au deux-corps en LEO</b> des manuels, concorde avec la forme simplifiée à la main en vitesse radiale <c7/> à < { "1e-12" }, et dans le propagateur <b>perturbe l'orbite tout en maintenant le demi-grand axe à moins d'un mètre/jour</b> — l'opposé conservatif de la décroissance par traînée.

# text
# c1: ForceModel
# c2: src/gravity_sh.rs
# c3: src/tides.rs
# c4: src/precise_od.rs
# c5: ForceModel
# c6: propagator::Geopotential
# c7: HolmesFeatherstoneAttractionModel
# c8: tests/cowell_tesseral_orekit_oracle.rs
# c9: acceleration
# c10: acceleration_hf
# c11: from_gfc_file
# c12: scripts/fetch_egm2008.sh
# c13: acceleration_hf
# c14: xval/high-degree-gravity/
# c15: xval/cowell-tesseral-200-orekit/
# c16: src/nrlmsise00.rs
# c17: tests/nrlmsise00_reference.rs
# c18: forces::DensityModel
# c19: ForceModel::drag_density
# c20: ForceModel::with_ephemeris
# c21: ForceModel::srp_shadow
# c22: tests/srp_oblate_shadow_orekit_oracle.rs
# c23: tests/drag_tier_orekit_oracle.rs
seg-d39e75019595 = Portée honnête : les valeurs par défaut publiées de <c1/> intègrent le champ zonal. Le champ <b>tesséral</b> EGM2008 de haut degré (<c2/>, degré/ordre { "70" }), les <b>marées</b> solides/océaniques/atmosphériques (<c3/>) et le terme d'entraînement des référentiels de <b>Lense–Thirring</b> sont maintenant implémentés et composés dans le modèle de forces d'ajustement d'éphéméride précis (<c4/> — voir ci-dessous). Le champ tesséral est aussi un terme facultatif du <c5/> de Cowell (<c6/>, désactivé par défaut), validé par rapport à <c7/> d'Orekit { "12.2" } jusqu'au degré/ordre { "70" } ({ "6" } cas sur { "24" } h, pire |Δr| { "0.036" } m ; <c8/>). Deux évaluateurs de champ existent : l'historique <c9/> (dérivées partielles sphériques ; valide jusqu'au degré ~{ "180" } loin des pôles ; sorties figées) et <c10/> (colonne directe modifiée de Holmes–Featherstone { "2002" }, gradient sans 1/cos φ ; valide jusqu'au degré { "2190" } à toute latitude). EGM2008 jusqu'à { "2190" } se charge à l'exécution (<c11/>, <c12/>, non inclus). <c13/> concorde avec Orekit { "12.2" } à { "7.3e-17" } m/s² en huit points jusqu'au degré { "2190" } ; il reste MODELLED parce que pyshtools a manqué le seuil préenregistré près des pôles (un contrôle mpmath place l'erreur dans pyshtools ; <c14/>). Une orbite de { "200" }×{ "200" } sur { "24" } h concorde avec Orekit à { "0.13" } m, mais son contrôle de sensibilité préenregistré au degré 70 a échoué ({ "0.73" } m < { "1" } m), de sorte que les degrés { "71" }–{ "200" } sont caractérisés, et non validés, en orbite (<c15/>). La densité thermosphérique NRLMSISE-00 (NRLMSISE : Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) est portée (<c16/> : identique au bit près au portage C du domaine public sur { "720" } points, à { "1.9e-6" } en valeur relative de pymsis, les { "17" } cas de test publiés reproduits ; <c17/>) et constitue un niveau facultatif de densité de traînée (<c18/>, <c19/> ; la valeur par défaut reste le modèle statique de Vallado). Cela valide le portage, et non la précision du modèle par rapport à la densité mesurée. Le Soleil et la Lune DE440 (DE : Development Ephemeris) forment un niveau d'éphéméride facultatif (<c20/>). L'ombre SRP d'une Terre aplatie WGS-84 est facultative (<c21/>), et concorde avec le rapport d'éclairement d'Orekit { "12.2" } à { "7.4e-9" } près sur { "2400" } géométries (<c22/>) ; sa variante à assombrissement centre-bord n'a pas de référence indépendante externe (MODELLED). Le niveau de traînée NRLMSISE-00 concorde avec la propre traînée NRLMSISE-00 d'Orekit { "12.2" } sur { "24" } h à { "0.03" } m près pour jusqu'à { "142" } km de déplacement dû à la traînée (<c23/>, VALIDATED sous les conventions partagées). Un contrôle croisé GMAT (General Mission Analysis Tool) reste à faire.

# text
# c1: src/tides.rs
seg-46d06796e0e4 = Marées sur le géopotentiel (<c1/>)

# text
seg-81b18c4caad3 = Corrections variables dans le temps ΔC̄_nm, ΔS̄_nm aux coefficients de Stokes (IERS Conventions { "2010" }, chapitre { "6" }), validées par rapport aux propres nombres publiés des conventions — et non par rapport à un autre outil.

# text
seg-78dc5baf4d9d = Contribution

# text
seg-7c6c910bbf89 = Marée terrestre solide (IERS éq. { "6.6" } / 6.8b / { "6.14" })

# text
# c1: tests/tides_iers.rs
seg-ac1dbcc895f0 = <c1/> : la marée permanente (fréquence nulle) ΔC̄₂₀ tombe à { "1" } % de la valeur publiée par l'IERS de −{ "4.1736" }×{ "10" }⁻⁹ (nombres de Love anélastiques) ; l'<b>exemple détaillé K1 de l'étape 2 est reproduit au bit près</b> (amplitudes sin/cos { "470.9" } / −{ "30.2" } ×{ "10" }⁻¹² à { "0.1" }×{ "10" }⁻¹² près) ; le chemin de Legendre normalisé est fixé par des valeurs à la main en forme fermée indépendantes de la récurrence.

# text
seg-f2e2c5334721 = Marée océanique (IERS éq. { "6.15" }, FES2004 (Finite Element Solution { "2004" }, atlas de marées), { "8" } constituants)

# text
# c1: tools/gen_fes2004.py
# c2: src/fes2004_data.rs
seg-0369f153806f = Le sous-ensemble FES2004 inclus (<c1/> → <c2/>, analyse de Doodson→multiplicateur) reproduit exactement les coefficients M2 ({ "2,2" }) de la source ; la phase de Doodson de K1 est égale à θ_g + π ; l'amplitude sectorielle de degré 2 est physique et d'un ordre inférieur à la marée solide.

# text
seg-52a19a291a41 = Marée atmosphérique S2 (Ray { "2001" }, NASA (National Aeronautics and Space Administration) GSFC (Goddard Space Flight Center))

# text
seg-86b3d3a39bc7 = Les harmoniques de Ray incluses sont converties par la relation de charge de surface (éq. { "6.21" }) en un pic ΔC̄₂₂ ≈ { "4" }×{ "10" }⁻¹¹ (~{ "10" } % du terme océanique M2). Réserve honnête : <b>il n'existe aucune référence indépendante publiée de coefficients de géopotentiel pour la marée atmosphérique</b> ; elle est donc validée par l'intégrité de la source + l'ordre de grandeur, un seuil plus faible que pour les marées solide/océanique.

# text
# c1: src/maneuver.rs
seg-63ac45ba51dc = Manœuvres et conception de trajectoire (<c1/>)

# text
seg-a2ff4b0619d4 = ΔV impulsif + propagation de la covariance

# text
seg-12f469864d28 = Une discontinuité de vitesse avec une covariance { "6" }×{ "6" } reportée (poussée déterministe ⇒ STM (matrice de transition d'état) identité ; la covariance de l'erreur d'exécution pivote depuis le repère de poussée — ECI (inertiel géocentrique) ou LVLH (verticale locale, horizontale locale) — vers le bloc de vitesse).

# text
seg-f3f0e4a7ec05 = Intégration de poussée finie par rapport à Tsiolkovski

# text
seg-f7b35b7acdba = Intégration à poussée constante sur un arc de poussée (masse comme état) dont le ΔV obtenu concorde avec l'équation de fusée en forme fermée de <b>Tsiolkovski</b> à <b>mieux que { "0.01" } %</b>.

# text
seg-46ae334a0604 = Aller-retour du solveur de Lambert (Izzo { "2015" })

# text
# c1: r1
# c2: r2
# c3: v1
# c4: v2
# c5: r2
seg-3e2b483cd1b7 = La sortie de Lambert à révolution unique (<c1/>, <c2/>, temps de vol ⇒ <c3/>, <c4/>) est <b>soumise à un aller-retour par le propagateur képlérien exact à variables universelles</b> — elle doit retomber sur <c5/>.

# text
seg-04d69337acb3 = Balayage porkchop par rapport au plancher de Hohmann

# text
seg-fb5298b7983c = Le minimum de la grille C3 de lancement × V∞ d'arrivée est comparé au <b>plancher analytique de C3 du transfert de Hohmann</b> pour deux orbites circulaires coplanaires.

# text
seg-bf2eb36e3eb6 = Solveur de Lambert par rapport à une bibliothèque indépendante

# text
# c1: tests/lambert_reference.rs
# c2: izzo2015
seg-40511ea76e12 = <c1/> : { "13" } transferts à révolution unique du LEO au GEO jusqu'à l'héliocentrique, prograde et rétrograde, par rapport à lamberthub { "1.0.0" } <c2/> ; pire différence de vitesse aux bornes { "7e-12" } m/s.

# text
seg-164d7ea14d4e = Portée honnête : pas d'optimiseur de trajectoire, pas de branches de Lambert à révolutions multiples, et un modèle héliocentrique synthétique circulaire coplanaire (pas d'éphéméride planétaire DE, de sorte qu'un contrôle croisé C3 Terre–Mars par GMAT n'a pas été exécuté).

# text
# c1: src/orbit_determination.rs
# c2: src/batch_ls.rs
seg-9d2d78ad22c4 = Détermination d'orbite (OD) (<c1/>, <c2/>)

# text
seg-95d5ac7f6c29 = Correcteur par lot de Gauss–Newton

# text
# c1: gauss_newton
# c2: a·exp(b·t)
seg-3fe29c4621b2 = Le solveur générique <c1/> atteint la solution exacte des moindres carrés pondérés sur un ajustement linéaire, retrouve les vrais paramètres sur un ajustement non linéaire <c2/>, et résout une multilatération de distances 3D à partir de distances sans bruit.

# text
seg-b31d1ffa99b1 = Détermination d'orbite par lot à partir de distances

# text
# c1: determine_orbit_batch
# c2: [r, v]
seg-0b37139dffa9 = <c1/> retrouve <c2/> à partir d'un suivi de distance par station au sol (propagé sur le modèle de forces à deux corps + J2) à <b>sub-métrique / mm·s⁻¹ à partir de distances sans bruit</b>, et à <b>~{ "2" } m avec un résidu après ajustement au plancher de bruit de { "5" } m</b> — la signature d'un ajustement par moindres carrés cohérent.

# text
seg-fb29199bf8bd = OD séquentielle (filtre de Kalman sans parfum)

# text
# c1: determine_orbit_sequential
seg-3c1f33052d48 = <c1/> retrouve récursivement l'état à quelques dizaines de mètres près sur la même dynamique et le même modèle de distance.

# text
seg-7a636cc9eef0 = OD par lot et séquentielle par rapport à un estimateur indépendant

# text
# c1: tests/batch_sequential_orbit_determination_reference.rs
seg-68bf6e73c582 = <c1/> : { "8" } scénarios ({ "6" } LEO/MEO/excentriques sans bruit avec { "3" }–{ "4" } stations, { "2" } à σ = { "5" } m) par rapport aux estimateurs par moindres carrés par lot et de Kalman d'Orekit { "12.2" } sur un modèle de forces apparié ; pire cas par lot { "1e-3" } m / { "1e-6" } m/s, séquentiel { "0.9" } m.

# text
# c1: modelled
# c2: tests/od_tracking_measurements_reference.rs
# c3: xval/od-measurements-orekit/RESULTS.md
seg-55a86bc79831 = | OD par lot en vitesse de distance / azimut-élévation avec un masque d'élévation | <c1/> (comparaison externe, un seuil préenregistré manqué) | <c2/> : { "8" } scénarios par rapport aux moindres carrés par lot d'Orekit { "12.2" } avec des mesures géométriques instantanées personnalisées ; ensembles visibles identiques, valeurs de mesure à { "5.8e-8" } m / { "6.3e-10" } m/s / { "1.4e-13" } rad près, matrice de transition d'état à { "1.2e-14" } près, états bruités à { "1.74" } cm près et RMS par type à { "2.7e-4" } près ; le seuil préenregistré d'état sans bruit ≤ { "1" } cm est manqué sur { "2" } scénarios sur { "4" } ({ "1.46" } et { "1.74" } cm ; l'estimation propre d'Orekit se situe aussi loin de sa vérité simulée, celle de kshana à { "1e-8" } m près). Voir <c3/>. |

# text
seg-35a85fb744cd = Portée honnête : l'OD pédagogique utilise des stations inertielles fixes, un repère topocentrique à Terre sphérique et des mesures géométriques instantanées (sans temps de lumière, aberration, réfraction ni rotation de la Terre) ; la matrice de transition d'état du chemin vitesse de distance/angles est variationnelle (intégrée par RK4 avec des dérivées partielles analytiques à deux corps + J2), et non en forme fermée ; il n'y a pas de filtre séquentiel pour la vitesse de distance ou les angles. Le chemin à distance seule conserve sa jacobienne par différences finies. (Le moteur d'ajustement d'éphéméride à forces complètes ci-dessous porte sa propre matrice de transition d'état variationnelle.)

# text
# c1: src/precise_od.rs
seg-8f425e278f7c = Validation du modèle de forces par ajustement d'éphéméride (<c1/>)

# text
seg-9207d7139b87 = Un estimateur précis par moindres carrés par lot à observation de position et forces complètes : le géopotentiel tesséral EGM2008 (évalué dans le référentiel lié à la Terre par la réduction CIO) composé avec le troisième corps Soleil/Lune, la SRP, la traînée, la RG (relativité générale) de Schwarzschild/Lense–Thirring et les marées ci-dessus, ajusté à une piste de points de position inertiels avec une jacobienne par matrice de transition d'état variationnelle. Validé sur des données <b>synthétiques</b>, où la vérité est l'intégrateur propre de Kshana, de sorte que chaque résidu est celui de l'estimateur et non celui de la dynamique.

# text
seg-fc676106563e = Composition précise du modèle de forces

# text
# c1: tests/precise_od_synth.rs
seg-57726d970436 = <c1/> : le champ de degré 0 est exactement la masse ponctuelle à chaque époque (le terme central est invariant par rotation) ; le degré 8 ajoute l'aplatissement de la bande J2 ; le troisième corps Soleil et le terme de marée se raccordent fidèlement au bit près ; une accélération empirique radiale constante est purement radiale en RTN (radial, transverse, normal).

# text
seg-98b036354077 = Matrice de transition d'état variationnelle

# text
seg-71787d9334db = Chaque colonne de Φ sur une demi-orbite LEO (géopotentiel de degré 8 + Soleil + Lune) concorde avec une re-propagation indépendante par <b>différences finies (DF) centrales sur l'arc entier</b> à <b>< { "1" }×{ "10" }⁻⁶ en valeur relative</b> dans la réponse en position comme en vitesse — le contrôle croisé STM↔DF documenté. Φ({ "0" }) = I ; les propagateurs augmenté et simple concordent au niveau sub-millimétrique.

# text
seg-0b453776136b = Auto-récupération par moindres carrés par lot

# text
seg-c651db308332 = Un arc Kshana d'1 heure (degré 6 + Soleil + Lune) observé sans bruit est récupéré à partir d'un décalage de { "150" } m / { "0.1" } m·s⁻¹ jusqu'à l'<b>état d'époque à { "1" }×{ "10" }⁻² m près</b> avec une RMS après ajustement proche de zéro ; avec un bruit blanc de { "5" } m, la RMS 3D après ajustement se stabilise au <b>plancher de bruit ~σ</b>, sans biais. Le <b>C_R de la SRP est récupéré de { "1.0" } à { "1" } %</b> près de la vérité de { "1.4" }.

# text
seg-06bd2857f832 = Édition des valeurs aberrantes et rapport RTN

# text
seg-8b9dea5c0727 = Une erreur grossière de { "500" } m est rejetée par l'édition après ajustement à 5 σ (exactement une observation), laissant un ajustement propre au niveau du millimètre ; les résidus sont rapportés décomposés en radial/transverse/normal comme en 3D.

# text
seg-e3969a15df96 = Niveau d'accélération empirique (RTN constant + 1-CPR (CPR : cycle par révolution))

# text
seg-c46af7926511 = Les neuf paramètres empiriques contraints a priori restent sous { "1" }×{ "10" }⁻⁸ m·s⁻² sur une vérité sans terme empirique sans perturber l'ajustement ; une accélération transversale constante de { "3" }×{ "10" }⁻⁸ m·s⁻² injectée dans la vérité est récupérée à { "20" } % près.

# text
# c1: src/eop.rs
# c2: tests/agency_galileo.rs
# c3: tests/agency_swarm.rs
# c4: tests/agency_lro.rs
seg-fd79199b52d1 = Portée honnête : l'onde synthétique utilise des paramètres d'orientation de la Terre nominaux (EOP : UT1 (Universal Time { "1" }, temps de rotation de la Terre) ≈ TT (Terrestrial Time), sans mouvement du pôle) — exacts pour l'auto-récupération, puisque le même modèle génère et ajuste l'arc. Les validations par jeux de données d'agences superposent des EOP finals2000A <b>réels</b> et une vérité SP3/SPK (SPK : noyau d'éphéméride planétaire) à ce moteur par la chaîne de référentiel CIO (<c1/>, <c2/>, <c3/>, <c4/>).

# text
# c1: tests/agency_galileo.rs
# c2: tests/agency_swarm.rs
# c3: tests/agency_lro.rs
seg-934f0f8e4f5f = Orbites précises réelles d'agences (<c1/>, <c2/>, <c3/>)

# text
seg-721a27294813 = Galileo MEO — < { "5" } m GREEN

# text
# c1: ESA0MGNFIN
# c2: C_R
# c3: C_R
# c4: workflow_dispatch
# c5: tests/fixtures/agency/NOTICE.md
# c6: docs/AGENCY-ORBIT-VALIDATION.md
seg-14a2999d0739 = Le moteur à forces complètes de Kshana ajusté à une tranche verbatim de l'<b>orbite finale propre de l'ESA/ESOC (ESOC : Centre européen d'opérations spatiales)</b> (<c1/>, ITRF (International Terrestrial Reference Frame)) pour Galileo <b>E11</b> sur { "8" } h, chaque point ITRF pivoté en GCRS avec de vrais EOP finals2000A : <b>RMS 3D après ajustement de { "0.133" } m</b> en forces pures + <c2/> (RTN 0.105/0.067/0.047 m, <c3/> { "1.174" }), <b>{ "0.070" } m</b> avec le niveau empirique, à partir d'un recouvrement brut de { "78.7" } km. L'arc complet de { "24" } h donne <b>{ "0.611" } m</b>. Tous très en deçà du seuil de { "5" } m. Champ de gravité convergé dès d/o-8 (identique à d/o 8/10/12) ; la tâche <c4/> exécute le d/o-70 complet. Provenance + SHA-256 (SHA : Secure Hash Algorithm) dans <c5/> ; enregistrement complet dans <c6/>.

# text
seg-d5ed0783432e = Swarm-A LEO — < { "5" } m GREEN

# text
# c1: SW_OPER_SP3ACOM_2_
# c2: C_R
# c3: 2.522
# c4: tests/fixtures/agency/NOTICE.md
# c5: docs/AGENCY-ORBIT-VALIDATION.md
seg-403b15ec1b9b = Moteur à forces complètes (+ traînée atmosphérique) ajusté à une tranche verbatim de l'<b>orbite précise à dynamique réduite propre de Swarm-A de l'ESA</b> (<c1/>, L47, ITRF, ~{ "430" } km, ~{ "2" } cm) sur { "3" } h à d/o-70, vrais EOP finals2000A par la chaîne CIO : niveau <b>dynamique</b> (état seul, densité statique, <c2/>={ "1" }) <b>RMS 3D après ajustement de { "2.687" } m</b> (RTN 0.925/<c3/>/0.045 m — résidu ≈ traînée purement le long de la trace), niveau <b>à dynamique réduite</b> (+ accélérations empiriques CPR) <b>{ "0.098" } m</b> (RTN 0.026/0.092/0.025 m) — ~{ "10" } cm contre l'orbite de ~{ "2" } cm de l'ESA. Provenance + SHA-256 dans <c4/> ; enregistrement complet dans <c5/>.

# text
seg-3be5a6bee187 = LRO (Lunar Reconnaissance Orbiter) lunaire — validé, au-dessus de { "5" } m (en toute honnêteté)

# text
# c1: src/lunar_od.rs
# c2: src/lunar_frame.rs
# c3: atol
# c4: xval/anise-lunar-od
# c5: tests/fixtures/agency/NOTICE.md
# c6: docs/AGENCY-ORBIT-VALIDATION.md
seg-d2be90186a89 = Ajustement de modèle de forces <b>centré sur la Lune</b> (<c1/>) : le champ de gravité GRAIL <b>GRGM660PRIM</b> (d/o { "100" }) dans le référentiel lunaire lié au corps aux axes principaux (<c2/>, IAU { "2015" } Terre moyenne + le décalage fixe DE421 (Development Ephemeris { "421" }) Terre moyenne → axes principaux (ME→PA), appliqué comme SPICE le définit depuis { "0.36" } : jusque-là il était appliqué dans le mauvais sens, avec un écart d'environ { "208" }″) + troisième corps Terre/Soleil, ajusté par le <em>même</em> estimateur générique de Gauss–Newton que les jeux de données terrestres à l'orbite reconstruite réelle de <b>JPL Horizons LRO</b> (NAIF −{ "85" }), { "4" } h / { "241" } époques, ~{ "98" } km. Résultat honnête après ajustement ({ "0.36" }) : <b>dynamique { "12.05" } m</b> (RTN 2.91/10.11/5.88), <b>à dynamique réduite { "6.67" } m</b> (RTN 3.41/4.58/3.44, empirique { "1" }+2 par révolution), à partir d'un recouvrement brut de { "39.9" } m (avant la correction ME→PA : { "12.6" } m, { "6.65" } m, { "53.8" } m) — <b>au-dessus</b> du seuil < { "5" } m, et non à cause de l'estimateur (identique à d/o 100/150 et <c3/> 1e-6/1e-9). Une <b>validation croisée de niveau DE</b> (<c4/> : orientation PA lunaire DE440 (Development Ephemeris { "440" }) + éphéméride DE440 via ANISE) a <b>corrigé</b> l'affirmation sur le facteur limitant — elle a donné { "12.0" } m en dynamique et { "6.67" } m à dynamique réduite, ce que la pile analytique corrigée égale désormais aux deux niveaux (l'écart dynamique antérieur, { "12.6" } → { "12.0" } m, était l'erreur de décalage ME→PA), de sorte que le plancher opérationnel n'est <b>pas</b> l'orientation/éphéméride analytique mais un résidu irréductible du niveau empirique (le plus cohérent avec une dynamique non gravitationnelle de LRO non modélisée sur l'arc court) ; la pile analytique légère égale déjà le niveau DE pour l'orbite à dynamique réduite. Provenance + SHA-256 dans <c5/> ; enregistrement complet dans <c6/>. <b>Validé par rapport à une vraie vérité d'agence : { "3" } sur { "3" } ; respectant < { "5" } m : { "2" } sur { "3" }.</b>

# text
# c1: src/gravimeter.rs
# c2: src/mapmatch.rs
# c3: src/particle_filter.rs
# c4: src/altpnt/terrain.rs
seg-3d3cbf5f043d = Navigation par carte de gravité / PNT alternatif (<c1/>, <c2/>, <c3/>, <c4/>)

# text
seg-89f2cbf55842 = Champ d'anomalie de gravité en harmoniques sphériques

# text
# c1: src/gravimeter.rs
# c2: P̄₁₁ = √3·cosφ
# c3: P̄₂₀ = (√5/2)(3sin²φ−1)
# c4: P̄₂₂ = (√15/2)cos²φ
seg-76cae5c530f2 = <c1/> : un champ de bas degré, entièrement normalisé, contrôlé par rapport aux fonctions de Legendre en forme fermée (<c2/>, <c3/>, <c4/>) et à une anomalie à un seul terme dérivée à la main de { "1.897" } mGal.

# text
seg-f00f82b70e6e = Modèle de mesure du gravimètre à atomes froids

# text
# c1: σ = ASD/√τ
seg-49090598c525 = Le plancher de bruit blanc est dérivé de l'ASD de l'accéléromètre CAI (<c1/>), injecté comme une séquence déterministe à graine fixe (l'appariement ne reçoit jamais une vérité sans bruit, et pourtant l'exécution est reproductible au bit près).

# text
seg-0556db62c45f = Filtre à particules à ré-échantillonnage par importance séquentielle

# text
# c1: src/particle_filter.rs
seg-3df4251aedbd = <c1/> : le noyau déterministe est fixé exactement — ESS (taille effective d'échantillon) couvrant { "1" }…N, ré-échantillonnage systématique choisissant des indices proportionnellement au poids, combinaison convexe de la moyenne pondérée, une vraisemblance gaussienne ramenant l'estimation sur la mesure, et déterminisme de la prédiction à graine fixe.

# text
seg-7dca80b16a00 = Vraisemblance d'appariement de carte + récupération

# text
# c1: src/mapmatch.rs
# c2: field_likelihood
# c3: e^(−½)
seg-eb40ab2607ae = <c1/> : <c2/> culmine (= { "1" }) à un appariement parfait et tombe à <c3/> à un sigma ; un filtre à particules sur une parcelle de terrain synthétique distinctive retrouve la vraie position à { "0.1" } près.

# text
seg-446d9f03a860 = Benchmark de 60 minutes sans GPS

# text
# c1: run_gps_denied_gravity_nav
# c2: scenarios/gps-denied-gravity-nav.toml
seg-ed29fb24d9d5 = <c1/> (<c2/>) : une interruption de ~{ "700" } km / une heure où la solution inertielle dérive jusqu'à <b>≈ { "70" } km</b> est récupérée à <b>≈ { "145" } m (< { "500" } m)</b> par un appariement hiérarchique du grossier au fin — reproductible au bit près, stable sur les réalisations de bruit, et démontrablement limité par le raffinement (une seule grille grossière cale à ~{ "2" } km).

# text
# c1: .hgt
seg-81a2963c26cc = Chargeur DEM (modèle numérique d'élévation) SRTM (Shuttle Radar Topography Mission) <c1/> + échantillon bilinéaire (RÉFÉRENCE INDÉPENDANTE A)

# text
# c1: src/altpnt/terrain.rs
# c2: tests/terrain_nav_validation.rs
# c3: .hgt
# c4: tools/gen_terrain_fixture.py
# c5: tests/fixtures/terrain/N36W117_sub6.hgt
# c6: real_srtm_committed_badwater_tile_reads_real_relief
# c7: #[ignore]
seg-5e7bbf951faf = <c1/> / <c2/> : un tampon <c3/> de { "2" }×{ "2" } construit à la main avec les coins [{ "100,200" };{ "300,400" }] s'interpole bilinéairement à <b>exactement { "250.0" }</b> au centre de la cellule (référence indépendante en forme fermée), l'aller-retour en 16 bits gros-boutiste est exact, et l'inversion des lignes place la ligne de fichier la plus au nord à la latitude stockée la plus haute — le tout par rapport à la <b>spécification du pilote GDAL (Geospatial Data Abstraction Library) SRTMHGT (format de fichier d'altitude Shuttle Radar Topography Mission)</b> (16 bits signés gros-boutiste, ligne par ligne, ligne nord d'abord, vide -32768, <a1>https://gdal.org/en/stable/drivers/raster/srtmhgt.html</a1>). Un jeu de test versé de { "11" }×{ "11" } (<c4/>) exerce l'analyseur en CI ; et une <b>vraie tuile SRTM v3 NASA/USGS (USGS : United States Geological Survey) du domaine public, versée</b> (N36W117, Vallée de la Mort, décimée à 6 secondes d'arc, { "722" } Ko, <c5/>) est lue en CI (non ignorée, <c6/>), plaçant <b>Badwater Basin à ≈ −{ "78" } m dans la bande documentée [−{ "95" },−{ "70" }] m</b> (levé NGS/NOAA (NGS : National Geodetic Survey ; NOAA : National Oceanic and Atmospheric Administration) ≈ −{ "86" } m) avec le maximum de la tuile ≈ { "2161" } m — la source de vérité est le levé, le DEM est l'objet du test (non circulaire). Des cotes ponctuelles publiées plus grandes (Mount Whitney { "4421" } m) restent dans des tests de tuile complète conditionnés par <c7/>.

# text
seg-80f985ea3e11 = Convergence de la navigation par référence au terrain (TERCOM/SITAN (TERCOM : appariement de contours de terrain ; SITAN : Sandia Inertial Terrain-Aided Navigation)) (RÉFÉRENCE INDÉPENDANTE B)

# text
# c1: run_terrain_nav
# c2: scenarios/terrain-nav.toml
# c3: search_step/factor² ≈ 140 m
seg-9ad7bf3a8c3e = <c1/> (<c2/>) : une dérive INS injectée <b>dérivée à la main</b> ({ "0.5" }°N, −{ "0.4" }°E ≈ { "70" } km à ~{ "12" }° de lat., calculée comme dérive° × M_par_deg × cos lat) est récupérée à <b>< { "500" } m</b> (dans le plancher de résolution de grille <c3/>), une réduction de > { "100" }× par rapport à l'inertiel libre — contrôlée par rapport au nombre <em>injecté</em>, jamais au DEM (non circulaire), reproductible au bit près et stable sur les graines de bruit.

# text
seg-5b7c1dc72436 = Gain de fusion combinée gravité + magnétisme + terrain (RÉFÉRENCE INDÉPENDANTE C)

# text
# c1: run_combined_altpnt
# c2: scenarios/combined-altpnt.toml
seg-7e3818f2ee2b = <c1/> (<c2/>) : trois canaux scalaires (Δg · anomalie crustale de |B| · élévation) fusionnés comme une vraisemblance produit donnent un résidu <b>borné à < { "500" } m</b> sur l'interruption de 60 min qui, moyenné sur les graines, <b>n'est pas pire que le meilleur canal unique</b> (additivité de l'information / borne inférieure de Cramér–Rao (CRLB)). Se situe dans le régime « dizaines de mètres » publié du TERCOM / de la navigation par référence au terrain (TRN), en CEP (erreur circulaire probable) (<a1>https://en.wikipedia.org/wiki/TERCOM</a1> ; PeerJ { "2024" } ESKF-TERCOM (ESKF : filtre de Kalman à état d'erreur), <a2>https://peerj.com/articles/cs-3118/</a2>).

# text
# c1: .hgt
# c2: #[ignore]
# c3: kind=
# c4: gravity-map
# c5: terrain-nav
# c6: combined-altpnt
seg-fe23ff839bce = Portée honnête : le champ de gravité est de bas degré + des mascons synthétiques, et <b>non</b> le jeu complet de coefficients EGM2008/EIGEN (EIGEN : European Improved Gravity model of the Earth by New techniques) ; le canal magnétique s'appuie sur le champ principal lisse de l'IGRF plus des mascons d'anomalie crustale <b>synthétiques</b> (une vraie carte crustale à haute fréquence reste à faire) ; le champ de terrain de CI pour les benchmarks de <em>point de navigation</em> est le DEM synthétique autonome, tandis que le lecteur <c1/> lui-même est maintenant validé en CI par rapport à une vraie tuile SRTM v3 versée (ci-dessus) ; les vraies tuiles en pleine résolution restent conditionnées par <c2/>. Un Monte-Carlo de l'erreur de représentation des cartes reste à faire. Les trois navigateurs sont maintenant câblés dans le moteur de scénarios par <c3/> (<c4/>, <c5/>, <c6/>).

# text
# c1: src/inertial/
seg-d9f7e199e5d0 = Modèle d'erreur INS / IMU — validation par rapport aux fiches techniques (<c1/>)

# text
# c1: N
# c2: tests/imu_allan_spec.rs
seg-48266c2faaed = Le modèle d'erreur stochastique de l'IMU est validé par rapport à des <b>spécifications publiées de fiches techniques / jeux de données de fabricants</b> — jamais par rapport à une valeur produite par Kshana lui-même. Le passage d'une spécification en unités de terrain au modèle de bruit en SI (Système international d'unités) est l'identification standard par l'écart-type d'Allan (Riley, NIST SP { "1065" } §{ "5" } ; norme IEEE (Institute of Electrical and Electronics Engineers) { "952" }) : le coefficient de marche aléatoire <c1/> est l'ADEV avec recouvrement lu à τ = { "1" } s sur la pente en τ⁻¹ᐟ², et le coefficient d'instabilité de biais est le plateau plat d'Allan (<c2/>, hermétique — aucun téléchargement).

# text
seg-702de63000d2 = Preuve / référence indépendante

# text
seg-c3fed48b98b1 = Couche de conversion d'unités (le risque de non-circularité n°1)

# text
seg-6cdc88d36bfd = Vérifié à la main : { "0.15" } deg/√hr = { "4.3633e-5" } rad/√s ; { "3.6" } µg = { "3.5304e-5" } m/s² ; { "2.0" } deg/hr = { "9.6963e-6" } rad/s.

# text
seg-75afa5abcd08 = Marche aléatoire d'angle du gyroscope

# text
seg-d5fd60857e4d = L'ARW de l'ADIS16465 de { "0.15" } deg/√hr (fiche technique d'Analog Devices) est retrouvé à partir de l'ADEV({ "1" } s) à < { "5" } %.

# text
seg-c5e2d361b83f = Marche aléatoire de vitesse de l'accéléromètre

# text
seg-4413d3bb39b4 = Le VRW de l'ADIS16465 de { "0.1" } m/s/√hr est retrouvé à < { "5" } %.

# text
seg-ebeb0bb0e0fb = Pente d'Allan du bruit blanc

# text
seg-f674ce82dc2c = Pente log-log de la branche blanche de l'ADIS16460 −{ "0.5" } ± { "0.05" }.

# text
seg-40afd130f31d = Plateau d'instabilité de biais en fonctionnement

# text
seg-94acb18a94cb = L'instabilité de biais (BI) du gyroscope de l'ADIS16465 de { "2.0" } deg/hr est retrouvée comme le minimum plat d'Allan à < { "15" } %.

# text
seg-b359e0e92e20 = Deuxième profil d'IMU

# text
seg-1a304949bcf9 = NaveGo ADIS16488 (ARW { "0.3" } deg/√hr, VRW { "0.029" } m/s/√hr) tous deux retrouvés à < { "5" } %.

# text
# c1: tests/mars_pnt_targets.rs
seg-28da71940857 = <c1/> : les objectifs publiés des programmes MARCONI / LightShip (orbiteur < { "100" } m, surface/rover < { "15" } m) reproduits en simulation. <b>Hypothèses communes :</b> la constellation MARCONI par défaut à cinq relais ; chaque relais en vue donne une distance+Doppler unidirectionnels par époque ; un passage de station bidirectionnel cohérent toutes les <b>{ "30" } min</b> ; un bruit de classe DSN (<b>σ de distance = { "1" } m, σ Doppler = { "0.1" } mm/s</b>) ; le filtre de fusion conjoint à orbite à dynamique réduite + horloge à 3 états, amorcé à partir d'un état a priori perturbé de <b>~{ "2.7" } km</b> (resserrement { "0.1" }) ; FoM = RMS de position 3D convergée sur la seconde moitié de l'arc par rapport à la vérité synthétique. <b>Orbiteur</b> (LMO ~{ "400" } km / inclinaison { "60" }°, horloge <b>USO</b>, cadence de { "60" } s, ~{ "2" } h ≈ un arc d'une orbite) : RMS convergée obtenue <b>≈ { "0.40" } m</b> ≪ la cible de { "100" } m (moyenne de { "3.1" } relais en vue, covariance SPD tout du long). <b>Rover</b> (point de surface équatorial fixe, horloge <b>USO</b>, cadence de { "30" } s, arc de ~{ "2" } h) : RMS convergée obtenue <b>≈ { "5.1" } m</b> < la cible de { "15" } m (moyenne de { "3.0" } relais en vue, covariance SPD). <b>Les deux cibles sont atteintes sans relâcher aucune assertion</b> — l'USO est la <em>moins</em> performante des classes réalistes d'horloges embarquées (une DSAC ne ferait qu'aider) et la cadence bidirectionnelle de 30 min est prudente pour un calendrier courant de réseau de relais ; les hypothèses sont donc physiquement équitables pour un système de classe MARCONI, et non réglées pour réussir. <b>Portée honnête :</b> reproduction simulée sous les hypothèses énoncées, PAS une affirmation de vol ni un niveau de protection certifié ; la vérité synthétique en boucle fermée partage la dynamique martienne et le modèle d'observables du filtre.

# text
# c1: crate::oem::OemFile::to_oem_string
# c2: crate::oem::parse_oem
# c3: crate::interchange::Envelope
# c4: export_lunar_oem
# c5: REF_FRAME
# c6: MOON_ME
# c7: MOON_PA
# c8: TIME_SYSTEM
# c9: LTC
# c10: TCL
# c11: UTC
# c12: CENTER_NAME
# c13: MOON
# c14: crate::lunar_service::LunarSat::position_mci
# c15: export_lunar_time_metadata
# c16: crate::lunar_time::lunar_rate_breakdown
# c17: export_kif_lunar
seg-39b875078d27 = Le référentiel lunaire, l'échelle de temps lunaire et l'éphéméride lunaire sont exportés sous des <b>formes d'échange alignées sur LunaNet/IOAG (IOAG : Interagency Operations Advisory Group) et fondées sur le CCSDS</b>. Cette phase n'<b>invente pas</b> de format de transmission : elle <b>réutilise</b> l'émetteur et l'analyseur CCSDS OEM (Orbit Ephemeris Message) { "2.0" } existants du crate (<c1/> / <c2/>) et l'enveloppe du format d'échange Kshana (<c3/>), rééquipés pour le contexte lunaire. <c4/> règle le <c5/> de l'OEM sur le <b>référentiel lunaire lié au corps WGCCRE de l'IAU { "2015" }</b> (<c6/> Terre moyenne ou <c7/> axes principaux), <c8/> sur l'<b>échelle de temps lunaire</b> (<c9/> / <c10/> / <c11/>) et <c12/> sur <c13/>, sur un échantillon d'éphéméride <b>illustrative, de source publique, de classe LCNS</b> (positions issues de <c14/>, vitesse par différence finie centrale). <c15/> émet un descripteur de temps lunaire aligné sur LunaNet/IOAG (identifiant d'échelle, taux séculaire en µs/jour issu de <c16/>, la bande publiée de { "56" }–{ "59" } µs/jour, surface de référence) qui fait l'aller-retour par serde_json. <c17/> enveloppe l'OEM + le descripteur + l'étiquette de référentiel dans l'enveloppe KIF existante avec l'étiquette d'honnêteté MODELLED.

# text
# c1: oem.rs
# c2: crate::oem::parse_oem
# c3: oem_conformance
# c4: REF_FRAME
# c5: MOON_*
# c6: TIME_SYSTEM
# c7: META_START … META_STOP
# c8: TIME_SYSTEM
# c9: parse_lunar_time_metadata
# c10: Envelope::parse
seg-bbfce5323abb = La <b>référence indépendante</b> est l'aller-retour / le respect des champs. Comme <c1/> fournit <em>les deux</em> sens, l'OEM fait l'aller-retour par <c2/> (retour à un segment égal, avec le référentiel/temps lunaire et le nombre d'états préservés) <b>et</b> est vérifié indépendamment par <c3/>, qui contrôle que chaque mot-clé d'en-tête CCSDS/LunaNet requis est présent, que <c4/> porte un jeton <c5/> lunaire et que <c6/> n'est pas vide, que l'encadrement <c7/> tient, et que les lignes de données position+vitesse sont bien formées — en renvoyant un succès structuré plus la liste des champs présents/manquants, de sorte qu'un export cassé (p. ex. un <c8/> supprimé) est détecté et nommé. Les métadonnées de temps font l'aller-retour par <c9/>, et l'enveloppe KIF fait l'aller-retour par <c10/> vers des artefacts égaux portant l'étiquette MODELLED.

# text
# c1: export_lunar_oem
# c2: export_lunar_time_metadata
# c3: parse_lunar_time_metadata
# c4: export_kif_lunar
# c5: oem_conformance
# c6: LunarInteropScenario
# c7: InternalConsistency
# c8: crate::oem::parse_oem
# c9: crate::interchange::Envelope::parse
# c10: lunar_interop::tests
# c11: REF_FRAME
# c12: MOON_ME
# c13: MOON_PA
# c14: TIME_SYSTEM
# c15: LTC
# c16: TCL
# c17: CENTER_NAME = MOON
# c18: TIME_SYSTEM
# c19: oem_conformance
# c20: run_toml
seg-cb9dfbed826d = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Référence indépendante : <c7/></b> — aller-retour déterministe (CCSDS OEM par <c8/> ; KIF par <c9/> ; métadonnées de temps par serde_json) plus respect des noms de champ par rapport à la sémantique de champs publiée du CCSDS OEM + LunaNet/IOAG. Tests (<c10/>) : l'OEM exporté porte les jetons lunaires <c11/> (<c12/>/<c13/>) et <c14/> (<c15/>/<c16/>), <c17/>, l'objet et des lignes de données bien formées ; les métadonnées de temps lunaire font l'aller-retour (taux/bande/référence) et rejettent le contenu aberrant ; l'enveloppe KIF se sérialise et se désérialise en une valeur égale avec l'étiquette d'honnêteté MODELLED présente ; un OEM volontairement cassé (sans <c18/>) échoue à <c19/> et est signalé comme manquant ; le scénario est aiguillé par <c20/>. <b>Portée honnête :</b> les <b>noms/unités</b> de champs sont alignés sur des normes <b>publiques</b> (CCSDS 502.0-B OEM, référentiels lunaires WGCCRE de l'IAU { "2015" }, spécification d'interopérabilité LunaNet / architecture lunaire de l'IOAG) ; l'export est <b>MODELLED</b> — l'aller-retour déterministe + le respect des noms de champ sont la référence indépendante, ce n'est <b>PAS</b> un test certifié de respect de la norme d'interopérabilité, l'éphéméride est <b>illustrative, de source publique, non affiliée à l'ESA</b>, et aucun TRL, héritage de vol ni aval d'agence n'est revendiqué.

# text
seg-69a214b7236d = Prédictions préenregistrées

# text
# c1: docs/predictions/
# c2: tests/prediction_frozen.rs
seg-343fe86f6a50 = Une prédiction préenregistrée est un résultat MODELLED figé avant l'existence de toute donnée permettant de l'évaluer, avec le protocole d'évaluation fixé en même temps. Ce n'est pas une validation et elle n'ajoute aucune ligne au registre. Chacune se trouve dans <c1/>, avec ses entrées figées, son résultat et leurs empreintes SHA-256, et <c2/> échoue si un octet figé bouge ; une hypothèse modifiée appelle une nouvelle prédiction datée à côté de l'ancienne, jamais une modification de celle-ci.

# text
seg-e65d79893e2c = Prédiction

# text
seg-f9e2d4b52b79 = Figée

# text
seg-dd68891f75e2 = Évaluée par rapport à

# text
seg-d5a09f26a028 = Couverture d'une station de référence lunaire

# text
seg-c68f124a16e7 = c05dac1d, 2026-10-12

# text
seg-293404a9cb92 = précision, disponibilité, couverture et niveaux de protection publiés d'une station différentielle lunaire au pôle Sud, par n'importe quelle partie

# text
seg-4e7d9449a880 = pas encore évaluée (aucun résultat publié)

# text
# c1: src/representativeness.rs
seg-ad1995b3ed17 = Registre de représentativité de la démonstration et des écarts avant le vol (<c1/>)

# text
# c1: Representativeness
# c2: Anchor
# c3: Gap
# c4: verification
seg-86b70551c37f = Un résultat de simulation n'est utile comme preuve que s'il indique, sur sa face même, à quoi il est ancré, ce qu'il suppose et ce qui le sépare encore d'un système de vol. Le registre de représentativité en fait une sortie de premier rang, contrôlée par machine : un enregistrement <c1/> porte les <c2/> externes de la démonstration, ses hypothèses modélisées, ses <c3/> par rapport au vol (chacun avec la phase/activité qui le comblerait) et la bande TRL pour laquelle il est représentatif. C'est le compagnon, par résultat, de la matrice <c4/> au niveau des capacités.

# text
# c1: representativeness::tests
# c2: Validated
# c3: ExternalDataset
# c4: Modelled
# c5: PartnerOwned
seg-ccd039d5e6a4 = La <b>référence indépendante</b> est un ensemble d'invariants en forme fermée, appliqués par <c1/> : un enregistrement <c2/> doit lister au moins un ancrage <c3/> (une simulation ne peut pas être validée par rapport à elle-même) ; un enregistrement <c4/> doit lister au moins un écart avant le vol et ne peut pas revendiquer une bande TRL représentative supérieure à { "4" } (une maturation au-delà exige une preuve matérielle/de vol, qui est un écart, et non une sortie de simulation) ; la bande TRL doit être bien formée ; et un enregistrement <c5/> ne doit rien affirmer. Ces invariants rendent opérationnelle la discipline « représentativité justifiée + écarts restants vers le vol clairement identifiés ».

# text
seg-6b29111096ca = Registre de représentativité et des écarts avant le vol

# text
# c1: Representativeness
# c2: Anchor
# c3: Gap
# c4: check
# c5: is_valid
# c6: report
# c7: to_json
# c8: InternalConsistency
# c9: verification
# c10: representativeness::tests
# c11: verification
seg-f6b9a2c22ae6 = <c1/>/<c2/>/<c3/>, <c4/>/<c5/>/<c6/>/<c7/>. <b>Référence indépendante : <c8/></b> — invariants d'honnêteté en forme fermée liés à la frontière statut/type de référence indépendante de <c9/>. Tests (<c10/>) : un enregistrement validé sans ancrage externe échoue ; un ancrage interne (ReferenceImpl) ne suffit pas pour valider ; un enregistrement modélisé sans écart échoue ; un enregistrement modélisé au-dessus de TRL { "4" } échoue ; les bandes TRL mal formées sont détectées ; l'enregistrement se sérialise en JSON avec les champs attendus et produit un rapport lisible. <b>Portée honnête :</b> le registre contrôle la <em>classification</em> de la preuve d'un résultat — il ne prouve pas que les ancrages nommés mènent à des tests vivants (ils sont constitués à la main, exactement comme la matrice <c11/>) ; l'affirmation « contrôlé par machine » se limite aux invariants de statut/ancrage/écart/TRL.

# text
# c1: src/qtrade.rs
seg-7e9190395eb6 = Preuve unifiée du compromis quantique contre classique (<c1/>)

# text
# c1: TradeEvidence
# c2: quantum_trade
# c3: crossover
seg-534e48755e2c = Chaque domaine d'application du PNT quantique répond à la même question de la même façon : fixer un cadre de comparaison (scénario + graine + version du moteur), faire passer un candidat quantique et une référence de base classique par un seul chemin de code neutre, les noter sur des figures de mérite communes, et rapporter — avec un intervalle de confiance et une étiquette honnête validé/modélisé — où le quantique gagne et où il ne gagne pas. <c1/> donne à cette réponse une forme unique, de sorte que les verticaux de synchronisation temporelle, de navigation et de détection d'anomalies émettent tous le <b>même</b> objet reproductible et honnêtement étiqueté. Il ne réimplémente aucun compromis : les nombres par FoM proviennent des moteurs existants (<c2/>, <c3/>, et les modules verticaux) ; il s'agit du contrat plus l'enveloppe de reproductibilité/représentativité, bâtie sur le registre de représentativité et les étiquettes de vérification.

# text
# c1: qtrade::tests
# c2: >1
# c3: quantum_trade::TradeResult
# c4: Validated
seg-5a52fb6670d1 = La <b>référence indépendante</b> est constituée d'identités de bénéfice/gagnant en forme fermée plus un enrobage fidèle de la sortie de compromis existante. <c1/> : le rapport de bénéfice est correct en polarité (orienté de sorte que <c2/> signifie toujours que le côté quantique est meilleur, tant pour les FoM de holdover où plus est mieux que pour les FoM d'erreur où moins est mieux) ; un objet de preuve construit à partir d'un véritable <c3/> reproduit ses rapports de bénéfice ; une preuve malhonnête est rejetée (une représentativité modélisée sans écart, ou une FoM <c4/> dont l'enregistrement de compromis ne porte aucun ancrage externe) ; le JSON est déterministe et porte les champs cadre/graine/moteur/FoM/représentativité.

# text
seg-ae87cea429ba = Preuve du compromis quantique contre classique

# text
# c1: TradeEvidence
# c2: TradeFom
# c3: TradeFrame
# c4: Winner
# c5: InternalConsistency
# c6: quantum_trade::TradeResult
# c7: qtrade::tests
# c8: TradeEvidence
seg-6622ae19989c = <c1/>/<c2/>/<c3/>/<c4/>. <b>Référence indépendante : <c5/></b> — identités de bénéfice/gagnant en forme fermée + enrobage fidèle de <c6/> ; honnêteté liée au registre de représentativité et à la frontière statut/type de référence indépendante de la vérification. Tests (<c7/>) comme ci-dessus. <b>Portée honnête :</b> le harnais normalise <em>la façon dont</em> un compromis est rapporté et reproduit ; la physique sous-jacente par FoM est celle que fournit le moteur contributeur, portée avec sa propre étiquette validé/modélisé — <c8/> ne fait pas passer une FoM modélisée au statut de validée.

# text
# c1: src/quantum_devices.rs
seg-ce13223e04d0 = Bibliothèque de modèles d'erreur de dispositifs quantiques (<c1/>)

# text
# c1: DeviceCard
# c2: holdover::QuantumClockClass
# c3: clock_state::ClockClass
# c4: quantum_trade
# c5: crossover
# c6: timetransfer_adv
# c7: σ_t ≈ jitter/√(R·τ)
# c8: R
# c9: τ
# c10: √(1 + dark/R)
seg-c206fc7d58d6 = Un lieu unique qui expose les dispositifs de PNT quantique que le démonstrateur compare — horloges optiques / à ions piégés / à ions de mercure, horloges de référence classiques, interféromètre à atomes froids et liaisons de transfert de temps — chacun sous forme de <c1/> portant sa spécification principale et un enregistrement de représentativité. La plupart de la physique des dispositifs est <b>réutilisée</b> (stabilités d'horloge issues de <c2/> et <c3/> ; l'interféromètre à atomes froids issu de <c4/>/<c5/> ; les liaisons optiques/RF classiques issues de <c6/>). Le seul modèle réellement nouveau est la <b>liaison de transfert de temps par intrication / photon unique</b>, dont la précision de synchronisation est limitée par le bruit de grenaille : <c7/> en fonction du taux de coïncidences détectées <c8/> et de l'intégration <c9/>, dégradée par une pénalité de comptage d'obscurité <c10/> et plafonnée par une systématique irréductible.

# text
# c1: quantum_devices::tests
# c2: 1/√τ
seg-7e8f4f3a5442 = La <b>référence indépendante</b> est constituée des coefficients publiés réutilisés d'horloge/CAI plus des identités de bruit de grenaille/perte en forme fermée. <c1/> : l'ordre de stabilité d'horloge réutilisé est sain (réseau optique < ions de mercure < CSAC en σ_y({ "1" } s)) ; la précision de l'intrication s'améliore comme <c2/> (une intégration × { "4" } divise σ par deux) lorsqu'elle est limitée par le bruit de grenaille ; le taux de coïncidences détectées chute d'un facteur { "10" } par { "10" } dB de perte de liaison ; les comptages d'obscurité dégradent la précision de façon monotone ; le plancher systématique borne la précision par le bas ; chaque fiche de dispositif est un enregistrement de représentativité valide et modélisé.

# text
# c1: DeviceCard
# c2: quantum_clock_card
# c3: classical_clock_card
# c4: EntanglementTimeLink
# c5: InternalConsistency
# c6: quantum_devices::tests
seg-24dd5c3725b9 = <c1/>, <c2/>/<c3/>, <c4/>. <b>Référence indépendante : <c5/></b> — coefficients publiés d'horloge/CAI réutilisés + identités de bruit de grenaille/perte en forme fermée pour la liaison par intrication. Tests (<c6/>) comme ci-dessus. <b>Portée honnête :</b> les paramètres de dispositifs d'horloge/CAI sont réutilisés des modèles à coefficients publiés existants du moteur ; le modèle de liaison par intrication est MODELLED à partir du comportement publié de synchronisation d'horloges quantiques avec des valeurs illustratives de taux de paires/rendement/perte de source publique — il n'est <b>pas</b> validé par rapport à une liaison mesurée, et le matériel réel de source/canal/détecteur est un écart avant le vol déclaré.

# text
# c1: src/timetransfer_chain.rs
seg-f6d8e7ad6bec = Synchronisation quantique de confiance — chaîne de bout en bout, diffusion sécurisée, anomalie + compromis (<c1/>)

# text
# c1: quantum-time-transfer
# c2: tpl
# c3: 1 − P_md
# c4: detection
# c5: qtrade::TradeEvidence
seg-3160cfec0d1f = Le scénario <c1/> compose la chaîne de synchronisation temporelle dont a besoin un démonstrateur de PNT quantique : un budget de temps utilisateur de bout en bout (erreur de marche libre de l'horloge de référence et précision de synchronisation de la liaison combinées en quadrature) pour une chaîne <b>quantique</b> (horloge à réseau optique + liaison par intrication/photon unique) contre une chaîne <b>classique</b> (CSAC + liaison bidirectionnelle RF) ; un <b>niveau de protection temporel</b> (TPL, réutilisé de <c2/>) bornant l'erreur de temps non détectée ; une <b>figure de mérite de sécurité contre les attaques par retard/rejeu</b> <c3/> à un taux de fausse alarme énoncé (réutilisée de <c4/>) ; une <b>probabilité de détection d'anomalie d'horloge + latence de détection de changement par CUSUM (somme cumulée)</b> ; et la comparaison quantique contre classique sous forme de <c5/> honnête portant un enregistrement de représentativité + d'écarts avant le vol.

# text
# c1: detection::analytic_pd
# c2: analytic_pmd
# c3: timetransfer_chain::tests
# c4: is_honest()
seg-6fa095264bdc = La <b>référence indépendante</b> est un budget en quadrature en forme fermée sur des noyaux réutilisés et validés séparément (ADEV par rapport à Stable32/NIST ; la borne TPL ; <c1/>/<c2/>). <c3/> : la précision quantique s'améliore avec le temps d'intégration ; la chaîne quantique peut gagner <em>et</em> peut perdre sur la FoM de précision (honnête — pas une victoire universelle ; une liaison très perdante inverse le résultat) ; le niveau de protection est fini et positif ; la FoM de sécurité est dans [{ "0,1" }] et croît avec le retard de l'attaque ; la probabilité de détection d'anomalie est monotone en l'amplitude du défaut ; et la preuve du compromis est internement honnête (<c4/>).

# text
seg-42a7d1170cc3 = Synchronisation quantique de confiance (chaîne + diffusion sécurisée + anomalie + compromis)

# text
# c1: QuantumTimeTransferScenario
# c2: Report
# c3: to_svg
# c4: kind="quantum-time-transfer"
# c5: InternalConsistency
# c6: timetransfer_chain::tests
# c7: quantum_devices
seg-44855d0cec4f = <c1/>/<c2/>, <c3/> ; <c4/>. <b>Référence indépendante : <c5/></b> — budget en quadrature en forme fermée sur des noyaux validés réutilisés (ADEV/Stable32-NIST, borne TPL, Pd/Pmd analytiques de détection) ; honnêteté liée au registre de représentativité. Tests (<c6/>) comme ci-dessus. <b>Portée honnête :</b> les paramètres d'horloge/liaison sont illustratifs, de source publique ; la liaison par intrication est le modèle MODELLED limité par le bruit de grenaille issu de <c7/> ; cela modélise la <em>classe</em> de systèmes de synchronisation de confiance — il n'est <b>pas</b> validé par rapport à une liaison de bout en bout mesurée, et le matériel réel d'horloge/liaison/canal spatial est un écart avant le vol déclaré ; aucun TRL, héritage de vol ni certification n'est revendiqué.

# text
# c1: src/quantum_nav_od.rs
seg-c6ae292a6331 = Navigation quantique sans GNSS (<c1/>)

# text
# c1: quantum-gnss-free-nav
# c2: inertial::quantum_imu
# c3: quantum_trade
# c4: qtrade::TradeEvidence
seg-f34f784e928c = Le scénario <c1/> compare la navigation à l'estime pendant une interruption du GNSS avec un budget inertiel <b>quantique</b> (un accéléromètre à interféromètre à atomes froids, réutilisé de <c2/>/<c3/>, dont le plancher de bruit blanc du CAI est validé à ~{ "2" } ordres de grandeur près de Freier et al. { "2016" }) face à un INS <b>classique</b> de qualité navigation. Il rapporte la croissance de l'erreur de position pendant la marche libre, la durée de holdover jusqu'à un seuil de position, et le compromis quantique contre classique sous forme de <c4/> honnête. L'observabilité est énoncée honnêtement : sans point externe pendant l'interruption, le biais de l'accéléromètre est inobservable, de sorte que l'erreur de position croît sans borne (≈ ½·biais·t² plus un terme de marche aléatoire de vitesse) ; un capteur quantique à biais plus faible <em>ralentit</em> cette croissance mais ne comble pas l'écart — seul un point externe le fait.

# text
# c1: QuantumNavBudget
# c2: ClassicalInsBudget
# c3: PositionDrift
# c4: quantum_nav_od::tests
seg-4cfde3de8f94 = La <b>référence indépendante</b> est constituée des budgets inertiels réutilisés (<c1/>/<c2/>, qui implémentent tous deux le trait <c3/>) plus des identités de dérive en forme fermée. <c4/> : le budget quantique bat le classique sur une longue interruption (erreur plus faible, holdover plus long) ; l'erreur croît avec la durée de l'interruption pour les deux (l'écart d'observabilité) ; l'avantage dépend de l'interruption, ce n'est pas un facteur de gain constant (la courbe quantique est dominée par le bruit en marche libre courte, par le biais en marche libre longue) ; la preuve du compromis est internement honnête.

# text
# c1: QuantumNavOdScenario
# c2: Report
# c3: to_svg
# c4: kind="quantum-gnss-free-nav"
# c5: InternalConsistency
# c6: quantum_nav_od::tests
seg-0488b6ec9982 = <c1/>/<c2/>, <c3/> ; <c4/>. <b>Référence indépendante : <c5/></b> — budgets inertiels réutilisés (CAI validé par réutilisation à ~{ "2" } ordres de grandeur près de Freier { "2016" } ; dérive classique en forme fermée) ; honnêteté liée au registre de représentativité. Tests (<c6/>) comme ci-dessus. <b>Portée honnête :</b> une comparaison de budgets statiques de navigation à l'estime, et non un filtre dynamique sur des trajectoires réelles ; le biais inobservable sans point est énoncé ; les paramètres de dispositifs sont illustratifs, de source publique ; modélise la <em>classe</em> de la navigation quantique sans GNSS — le matériel réel d'IMU à atomes froids, une plateforme dynamique et l'environnement de vol sont des écarts avant le vol déclarés ; aucun TRL/vol/certification revendiqué.

# text
# c1: src/quantum_faults.rs
seg-e23e583ecf21 = Détection de défauts / d'anomalies pour les systèmes PNT quantiques (<c1/>)

# text
# c1: quantum-anomaly-detect
# c2: qtrade::TradeEvidence
seg-6e6df91ae779 = Le scénario <c1/> définit un catalogue étiqueté de défauts du PNT quantique (saut de fréquence d'horloge, dérive, perte d'accrochage ; saut de biais de capteur, perte de signal), note une statistique de détection sur des fenêtres nominales contre défaillantes, et rapporte la discrimination du détecteur sous forme d'AUC ROC et de défaut minimal détectable à un taux de fausse alarme fixé. L'angle quantique contre classique : une référence d'horloge quantique plus stable abaisse le bruit σ du moniteur, de sorte qu'elle détecte des défauts plus petits — émis sous forme de <c2/> honnête avec un enregistrement de représentativité.

# text
# c1: N(0,σ)
# c2: N(μ,σ)
# c3: AUC = Φ(μ/(σ√2))
# c4: eval_stats::bootstrap_auc_ci
# c5: detection
# c6: quantum_faults::tests
seg-eeb3c7d1f507 = La <b>référence indépendante</b> est une AUC en forme fermée pour la statistique de détection gaussienne (nominale <c1/>, défaut <c2/> ⇒ <c3/>) contrôlée par rapport à <c4/>, validé en externe (validé par rapport à scikit-learn), et aux seuils analytiques de <c5/>. <c6/> : l'AUC analytique concorde avec les valeurs connues ({ "0.5" } à μ={ "0" }, →{ "1" } pour de grands μ/σ, monotone) ; l'IC d'AUC par bootstrap empirique encadre la forme fermée ; le moniteur quantique a une AUC plus haute et un défaut minimal détectable plus petit ; l'avantage disparaît pour des défauts énormes (les deux détectent parfaitement — pas une marge universelle) ; le catalogue a cinq classes étiquetées ; le compromis est internement honnête.

# text
seg-9dda4ab0647a = Détection de défauts/d'anomalies pour le PNT quantique

# text
# c1: FaultKind
# c2: QuantumAnomalyScenario
# c3: Report
# c4: analytic_auc
# c5: min_detectable_fault
# c6: kind="quantum-anomaly-detect"
# c7: InternalConsistency
# c8: eval_stats
# c9: detection
# c10: quantum_faults::tests
seg-cfa7a5c43d14 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/> ; <c6/>. <b>Référence indépendante : <c7/></b> — AUC gaussienne en forme fermée contrôlée par rapport à l'AUC par bootstrap de <c8/>, validée en externe (par rapport à scikit-learn), et aux seuils analytiques de <c9/>. Tests (<c10/>) comme ci-dessus. <b>Portée honnête :</b> la statistique de détection est un modèle gaussien, et non de la télémétrie réelle ; le catalogue de défauts est synthétique étiqueté ; les niveaux de bruit des moniteurs quantique/classique sont illustratifs, de source publique ; modélise la <em>classe</em> de la détection d'anomalies du PNT quantique — la télémétrie matérielle réelle avec étiquettes de vérité terrain est un écart avant le vol déclaré ; aucun TRL/vol/certification revendiqué.

# text
seg-24ad75143bed = Respect des normes — formats d'échange, bilan de liaison et intégrité (contrôles par référence indépendante externe)

# text
seg-9d31773e0ecd = Ces normes sont validées en retrouvant les <b>exemples détaillés / valeurs de référence verbatim publiés dans les normes elles-mêmes</b> (ou dans une implémentation de référence indépendante), et non par l'aller-retour propre de Kshana. Retrouver l'exemple d'annexe d'une norme est le contrôle de respect de la norme le plus fort disponible pour un analyseur de format d'échange.

# text
seg-7ec3d508c64f = Référence indépendante externe

# text
seg-e06aa022e7e9 = <b>CCSDS OEM</b> (502.0-B Orbit Data Messages)

# text
# c1: tests/ccsds_reference.rs
# c2: parse_oem
# c3: -063.042
# c4: tests/fixtures/ccsds/oem_502_b3_figG11.oem
seg-65de0a1335d6 = <c1/> : <c2/> retrouve les époques exactes et les vecteurs d'état X/Y/Z/Ẋ/Ẏ/Ż de l'exemple OEM KVN de la <b>CCSDS 502.0-B-3, annexe G §G6, figure G-11</b> (« OEM Example with No Acceleration, No Covariance », p. G-10) — les deux segments d'éphéméride, y compris les valeurs sources à zéro initial (<c3/>). Le jeu de test <c4/> est reproduit caractère pour caractère à partir du Blue Book officiel (les marqueurs éditoriaux « < intervening data records omitted here > », qui ne sont pas des enregistrements OEM valides, ne sont pas inclus).

# text
seg-54cff1deebc7 = <b>CCSDS TDM</b> (503.0-B Tracking Data Message)

# text
# c1: tests/ccsds_reference.rs
# c2: TdmFile::parse
# c3: tests/fixtures/ccsds/tdm_503_b2_figE9.tdm
# c4: reference.tdm
# c5: src/ccsds_tdm.rs
seg-a5c6b58e0053 = <c1/> : <c2/> retrouve les { "41" } enregistrements RANGE (premier { "3198.03679519614" } km, dernier { "3270.46440460551" } km) et les métadonnées de l'exemple TDM KVN de la <b>CCSDS 503.0-B-2, annexe E, figure E-9</b> (« Range Data with TIMETAG_REF=TRANSMIT », p. E-9). Le jeu de test <c3/> est verbatim du Blue Book. (C'est la référence indépendante du Blue Book publié, à côté de l'aller-retour <c4/> écrit à la main préexistant dans <c5/>.)

# text
seg-c9a23ec7956b = <b>CCSDS { "133.0" }</b> (Space Packet Protocol)

# text
# c1: primary_header_matches_published_independent_test_vectors
# c2: spacepackets
# c3: tests/ccsds/test_space_packet.py
# c4: 18 02 40 34 00 16
# c5: 1F FF FF FF FF FF
seg-aaffd3d25c5f = <c1/> : l'encodeur reproduit les vecteurs de test de l'en-tête primaire au niveau de l'octet de la <b>bibliothèque <c2/></b> indépendante (us-irs/spacepackets-py, <c3/>) — p. ex. <c4/> et le cas tout-maximum <c5/> — plus le cas canonique de télémesure (TM) tout à un, chacun ayant fait l'aller-retour par le décodage. Largeurs/ordre des champs de bits selon la <b>CCSDS 133.0-B-2 §{ "4.1.3" }</b>.

# text
seg-e48472df251a = <b>CCSDS { "401" } / DSN</b> (bilan de liaison, DSN 810-005)

# text
# c1: link_equation_reproduces_descanso_galileo_dct
seg-c6caa639e1c6 = <c1/> : la chaîne FSPL (perte en espace libre) et C/N₀ reproduit le tableau de contrôle de conception de télémesure de l'espace lointain publié par <b>J. H. Yuen (éd.), <em>Deep Space Telecommunications Systems Engineering</em> (DESCANSO/JPL (DESCANSO : Deep Space Communications and Navigation Systems Center of Excellence) Pub. 82-76), tableau 1-1</b> — la liaison descendante Galileo en bande X ({ "8420.43" } MHz) à { "6.37" } UA : perte en espace libre <b>{ "290.54" } dB</b> (<{ "0.05" } dB) et <b>Pr/N₀ = { "54.6" } dB-Hz</b> reçu (<{ "0.2" } dB). Les centres de bande se situent à l'intérieur des allocations de liaison descendante de l'espace lointain DSN/CCSDS-401 (DSN 810-005 module { "201" }). Les <em>paramètres de mission par défaut</em> restent représentatifs (pas un transpondeur étalonné) ; c'est l'<em>équation</em> de liaison que cela fixe.

# text
seg-c2cee7d5c7b1 = Normes GNSS — statut de la référence indépendante externe et écarts restants, en toute honnêteté :

# text
seg-d8f653b3c955 = Statut et réserve honnête

# text
# c1: tests/raim_reference.rs
# c2: src/araim_reference.rs
# c3: tests/araim_reference_vectors.rs
# c4: TOL_PL
# c5: araim-reference-check
# c6: N_fault,max = 1
# c7: ARAIM_REFERENCE.md
seg-fff735bd32a1 = <b>Noyau, géométrie et niveau de protection ARAIM validés en externe.</b> Le <em>noyau</em> de détection — le seuil de détection de défaut en χ², la non-centralité de non-détection en χ² non central et les multiplicateurs K de loi normale — reproduit <b>SciPy</b> (<c1/>, { "171" } cas, ≤ { "1e-6" } rel), et la géométrie qui l'enveloppe reproduit <b>gnss_lib_py</b> (DOP). La <em>valeur</em> du niveau de protection (PL) ARAIM est maintenant elle aussi fixée : par rapport à l'« exemple numérique LPV-200 (LPV : performance du localisateur avec guidage vertical) » de l'ADD (Algorithm Description Document) de référence ARAIM v3.1 du WG-C (WG : Working Group), <c2/> / <c3/> donnent VPL { "18.2926" } m contre { "18.3" } m, HPL { "13.4063" } m contre { "13.45" } m et σ_v,acc { "1.3694" } m contre { "1.3694" } m, dans la propre <c4/> = { "0.05" } m de la référence (le type <c5/>). Portée : modes de défaut jusqu'à un satellite ou une constellation (<c6/>) ; les sous-ensembles de défauts à événements multiples et l'exclusion ne sont pas implémentés, et le RAIM classique n'a toujours <b>aucun vecteur de test publié canonique entrée→HPL</b>. Voir <a1><c7/></a1>.

# text
# c1: sbas_protection_level
# c2: zsiki/rtklib_ws
# c3: waasprotlevels()
# c4: tests/sbas_reference.rs
# c5: core/filter.c
# c6: K_H,PA=6.0
# c7: K_V=5.33
# c8: K_H,NPA≈6.18
# c9: Φ⁻¹(1−5e-8)=5.3267
# c10: d_U
seg-e6a47dfb7e54 = <b>Algorithme de niveau de protection maintenant validé en externe.</b> Étant donné (él, az, σ) par satellite, le <c1/> de kshana reproduit la <b>variante RTKLIB SBAS-PL</b> (<c2/> <c3/>, Siki & Takács { "2017" }, « DO-229D Appendix J ») — alimentée avec le <b>propre</b> σ de cet outil, calculé à partir de messages diffusés <b>EGNOS réels</b> + RINEX BUTE réel — à <b>< { "2e-3" } m de HPL</b> sur { "6" } époques (<c4/>) ; ESA gLAB { "v6.0.0" } (<c5/>) a confirmé la même convention. Les facteurs K (<c6/>, <c7/>, <c8/>) concordent avec DO-229E Appendix J. <b>Ce qui est validé et ce qui ne l'est pas :</b> cela fixe l'<em>algorithme</em> du PL (σ en entrée → HPL/VPL en sortie) ; la <em>modélisation</em> amont du σ à partir des messages bruts UDRE/GIVE est hors de la portée de kshana — c'est là que des outils indépendants de <em>chaîne complète</em> divergent encore de plusieurs mètres sur des données réelles. K_V mis en correspondance à la valeur arrondie de { "5.33" } de la référence indépendante (la valeur exacte <c9/> de kshana → VPL ~{ "0.06" } % plus petit ; la verticale est validée sans facteur K sous la forme <c10/>).

# text
# c1: ionmodel
# c2: tests/klobuchar_reference.rs
# c3: src/ionex.rs
seg-4ef39e8ea75c = <b>Modèle diffusé validé en externe.</b> Le modèle Klobuchar L1 reproduit le <b><c1/> de RTKLIB</b> (<c2/>, < { "1e-4" } m) — une <em>parité d'implémentation</em> avec la référence ouverte de fait, puisqu'il n'existe aucun exemple détaillé officiel de <em>vérité mesurée</em>. Le lecteur de cartes TEC IONEX existe maintenant (<c3/>, testé unitairement) ; l'écart restant est un contrôle croisé de celui-ci par rapport à un véritable produit GIM, et non le modèle diffusé. Voir les lignes Klobuchar dans <a1>Affirmations et réalité</a1>.

# text
seg-fa3058dffb2a = Code d'étalement GPS L1 C/A (IS-GPS-200)

# text
seg-53ac231770fb = Génération du code validée en externe.

# text
# c1: src/sdr.rs
# c2: ca_first_ten_chips_match_is_gps_200_octal
# c3: navsignal
seg-04db7c613bd5 = <c1/> (<c2/>) : le générateur de code C/A à LFSR (registre à décalage à rétroaction linéaire) G1/G2 reproduit exactement les <b>attributions de phase de code publiées dans IS-GPS-200 tableau 3-Ia</b> — l'octal des dix premiers chips pour les PRN (bruit pseudo-aléatoire) { "1" }–{ "9" } ({ "{" }{ "1440" }, { "1620" }, { "1710" }, { "1744" }, { "1133" }, { "1455" }, { "1131" }, { "1454" }, { "1626" }{ "}" }). Cela fixe la <b>séquence de chips du code d'étalement</b> par rapport à la spécification d'interface du GPS ; les éléments environnants de modulation, de séparation spectrale et de poursuite de code par DLL (boucle à verrouillage de délai) (<c3/>) restent MODELLED.

# text
seg-e5f1b960777a = Synchronisation temporelle pour les réseaux, le spectre, le système solaire, les constellations, les campagnes et le LEO-PNT

# text
# c1: VERIFICATION-MATRIX.md
seg-c5bf3b23d688 = Les capacités ajoutées dans la ligne { "0.28" } sont notées ligne par ligne dans le <a1><c1/></a1> généré ; cette section résume lesquelles portent une référence indépendante externe. Une ligne n'est VALIDATED qu'avec une référence indépendante externe ; tout le reste est MODELLED.

# text
seg-d791a48b3895 = Capacité (type)

# text
seg-d4779be2efd8 = Référence indépendante externe, ou pourquoi elle reste modélisée

# text
# c1: telecom-timing
seg-0d7bb0fc1c5e = MTIE (erreur maximale d'intervalle de temps) et TDEV (écart de temps) télécoms sur une série de holdover (<c1/>)

# text
# c1: tests/telecom_timing_reference.rs
# c2: TELECOM-TIMING.md
seg-18894b55b6c1 = <c1/> : { "17" } facteurs de moyennage MTIE et { "12" } facteurs TDEV sur une série de holdover d'horloge à l'échelle d'une puce de { "2" } 048 échantillons versée, par rapport à allantools { "2024.06" }, à < { "1e-12" } / < { "1e-9" } en valeur relative. Les verdicts de gabarit de l'UIT-T (Union internationale des télécommunications, Secteur de la normalisation des télécommunications) PASS/FAIL et les préréglages d'oscillateurs de fiches techniques restent MODELLED. Voir <a1><c2/></a1>.

# text
# c1: slot-timing
seg-ff9cb967ae08 = Prédiction de holdover à partir d'un enregistrement d'horloge mesuré (<c1/>)

# text
# c1: tests/slot_timing_cs5071a_holdout.rs
seg-7821227795d8 = <c1/> : ajustement sur le premier tiers de l'enregistrement réel d'horloge au césium 5071A, prédiction de l'instant de dépassement à un sigma pour six seuils, mesure sur les deux tiers réservés ; seuil d'un facteur { "1.5" } dans un sens comme dans l'autre, rapports observés de { "0.84" } à { "1.03" }. Le budget de garde de créneau et la cadence de correction construits dessus restent MODELLED.

# text
# c1: spectrum
seg-2667e3ddf829 = Densités spectrales de puissance en bande L en forme fermée et séparation spectrale (<c1/>)

# text
# c1: navsignal
seg-1a0c6ef49f98 = Formes fermées de <c1/> par rapport aux valeurs publiées (ligne de la matrice « Closed-form L-band signal power spectral densities… »). La cascade avec J/S (rapport brouilleur/signal) par bande et C/N0 (densité de rapport porteuse/bruit) effectif, ainsi que l'entrée/sortie SigMF (Signal Metadata Format), restent MODELLED.

# text
# c1: solar-system
seg-46278e9c03c1 = Positions des planètes à partir des éléments de Standish du JPL (Jet Propulsion Laboratory), et temps de lumière entre corps (<c1/>)

# text
# c1: tests/solar_system_standish_preregistered.rs
# c2: tests/solar_system_standish_earth_icrf_preregistered.rs
# c3: tests/solar_system_light_time_solver_preregistered.rs
# c4: tests/solar_system_horizons_reference.rs
# c5: body-pnt
seg-43cfeb9f2403 = { "0.30" }, préenregistré par rapport à JPL Horizons (DE441) : <c1/> et <c2/>, RMS par planète et par composante au plus égale à la valeur du tableau { "8.10.1" } de l'Explanatory Supplement (pire cas { "0.778" }), scission de la Terre et rotation ICRF incluses ; <c3/>, le solveur de temps de lumière sur les positions DE441 à { "1e-6" } s du temps de lumière d'Horizons (pire cas { "6.7e-9" } s). La comparaison antérieure à deux fois le nominal (<c4/>), dont le seuil a été fixé après la première comparaison, est conservée comme non-régression sans valeur bloquante. Uranus/Neptune du tableau { "1" }, Pluton, les lunes, les constantes de corps et <c5/> restent MODELLED.

# text
# c1: constellation-design
seg-b96d8ea13c87 = Géométrie Walker et créneaux publiés du GPS, de Galileo et de GLONASS (GLObal NAvigation Satellite System) ; dilution de précision globale du GPS (<c1/>)

# text
# c1: constellation::tests
seg-85c293b8d235 = <c1/> : Walker 24/3/1 reproduit le tableau de définition du service ouvert de Galileo à { "1e-9" }°, la formule de créneau du document de contrôle d'interface de GLONASS, les passages équatoriaux du GPS ; la médiane de HDOP de référence du GPS { "0.940" } par rapport au { "0.94" } de la norme de performance du service de positionnement standard. Les cartes de couverture multi-constellation arbitraires autour de n'importe quel corps restent MODELLED.

# text
# c1: campaign
seg-f0187be4b97f = Campagnes : missions enchaînées, balayages, ensembles Monte Carlo, exécutions à conditions partagées (<c1/>)

# text
# c1: tests/campaign_composition_reference.rs
seg-b5c45fc12e5f = <c1/> ({ "11" } tests) : une campagne à une phase reproduit l'exécution autonome octet pour octet, un balayage à un nœud lit le même nombre, un ensemble à graine fixe est stable à l'octet. Des identités de composition, et non une référence indépendante externe.

# text
seg-bc25d20125e7 = Physique de liaison LEO (orbite terrestre basse) : coefficients de pluie P.838 de l'UIT-R (Secteur des radiocommunications de l'UIT), affaiblissement par la pluie et scintillation P.618, perte d'entrée dans les bâtiments P.2109, ionosphère au premier ordre, Doppler maximal

# text
# c1: tests/leo_link_reference.rs
# c2: tests/leo_doppler_reference.rs
seg-b1f3bd37d169 = <c1/>, <c2/> : les propres tableaux des Recommandations de l'UIT-R et les exemples de validation de la Commission d'études { "3" } (versés avec leur source et leur date de récupération), le rapport de retard de groupe de l'IS-GPS-200 pour l'ionosphère, et le tableau publié de Doppler maximal de Leclere, Marathe et Reid (ION GNSS+ { "2025" }, arXiv { "2509.19551" }).

# text
# c1: leo-navmsg
seg-492917f11386 = Message de navigation LEO : l'algorithme utilisateur d'éphéméride diffusée de l'ICD (document de contrôle d'interface) de Galileo, le CRC-24Q (contrôle de redondance cyclique sur 24 bits), les pondérations SISRE (erreur de distance du signal dans l'espace) en moyenne globale (<c1/>)

# text
# c1: tests/leo_navmsg_reference.rs
seg-514a7da01582 = <c1/> : l'algorithme utilisateur de Galileo reproduit RTKLIB (une bibliothèque libre de positionnement cinématique en temps réel) à { "1" } mm près sur quatre véritables éphémérides diffusées de Galileo ; le CRC-24Q donne la valeur de contrôle de catalogue 0xCDE703 et les octets de contrôle de la trame d'exemple RTCM (Radio Technical Commission for Maritime Services) { "1005" } ; les pondérations SISRE reproduisent le tableau publié MEO/GEO. L'ajusteur, la mise à jour en cours de passage, le codage binaire, le texte de type RINEX-4/CSV (valeurs séparées par des virgules) et les modèles d'éphéméride sélectionnables restent MODELLED.

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-pvt
# c4: leo-ppp
# c5: ntn-positioning
seg-94bbcd43e03a = Conception de signal LEO, passage et bilan de liaison, Doppler et positionnement conjoint GNSS+LEO, convergence PPP (positionnement précis par point), positionnement 5G NTN (réseau non terrestre), transfert de temps LEO (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

# text
# c1: tests/leo_signal_reference.rs
# c2: tests/leo_fusion_scenarios.rs
seg-4c37a8cfac87 = <c1/>, <c2/> : formes fermées, cohérence des filtres (par exemple le NEES moyenné sur les exécutions du filtre PPP à l'intérieur de sa bande à { "95" } %) et comparaisons de tendances publiées ; aucune donnée de terrain.

# text
# c1: leo-pnt-chain
seg-91cf4e399f0a = Un système LEO-PNT de bout en bout (<c1/>)

# text
# c1: tests/leo_pnt_chain.rs
seg-fb947da2e8b4 = <c1/> : chaque valeur transmise est égale à la propre sortie de l'étage amont, et modifier une entrée amont déplace chaque chiffre aval qui en dépend.

# text
seg-7e230aa73770 = Résilience et verticaux LEO (leurrage par Doppler et par cohérence inter-bandes, sondage de l'ionosphère)

# text
# c1: tests/leo_resilience_verticals.rs
# c2: RESILIENCE-CROSSWALK.md
seg-ab2542cfc295 = <c1/> ({ "10" } tests). Les scénarios de résilience et de verticaux sont listés dans <a1><c2/></a1>.

# text
# c1: tests/interop_formats.rs
# c2: INTEROP.md
# c3: tests/animation.rs
# c4: tests/advanced_report.rs
# c5: tests/advanced_report_cli.rs
# c6: result.json
seg-2d3ead293658 = Les sorties qui sont des rendus, et non des preuves, ont des tests mais pas de ligne de matrice : les exports d'échange (CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, éphéméride STK (Systems Tool Kit), SigMF (Signal Metadata Format)), chacun ré-analysé par un validateur écrit à partir de la spécification du format (<c1/>, { "13" } tests ; voir <a1><c2/></a1>) ; les animations (<c3/> : réexécutions identiques à l'octet, nombres d'images exacts, SVG (Scalable Vector Graphics) bien formé, aucune adresse externe dans le lecteur HTML (HyperText Markup Language)) ; et le rapport d'exécution (<c4/>, <c5/> : chaque scénario fourni produit un rapport sans section vide ni valeur de substitution, les étiquettes concordent avec la matrice, et la commande enregistrée reproduit <c6/> et le rapport octet pour octet).

# text
seg-903e4e51dda1 = Domaine de fonctionnement

# text
# c1: tests/scenario_coverage.rs
seg-e226ad523a3d = Chaque paquet est exercé sur son domaine d'entrée déclaré par <c1/>, qui affirme que chaque sortie numérique est finie (ni NaN ni Inf (NaN : not a number)) et bornée. Le tableau liste la plage d'entrée testée par paquet, le comportement de sortie attendu et le test qui la couvre.

# text
seg-8bd4f586f3c7 = Entrée balayée

# text
seg-3ebc1201a545 = Plage testée

# text
seg-a1198518d667 = Sortie attendue

# text
seg-7bf563f5420a = Test de couverture

# text
# c1: threshold_ns
seg-4906c027a805 = <c1/> (spécification de temps)

# text
seg-d91e18ce3773 = { "1" } – { "500" } ns

# text
seg-10cf765fdd75 = FoM de holdover/synchronisation/sécurité finies

# text
seg-fe640e9c3c1e = { "1e-7" } – { "1e-2" } m/s² (atomes froids → MEMS (systèmes micro-électromécaniques) bruts)

# text
seg-456c32a126a2 = RMS/p95 de position finis et bornés

# text
# c1: mask_deg
seg-dae96fd3a01b = <c1/> (masque d'élévation)

# text
seg-a54c3c8933c6 = DOP/disponibilité finis ; borné

# text
seg-bf506e17cf81 = { "0.1" } – { "50" } ns/s

# text
seg-b6d0d587046e = P_md / sécurité finis, bornés

# text
seg-fda0b32d7784 = { "10" } – { "1000" } m

# text
seg-132fdea2270f = holdover de synchronisation/position fini

# text
seg-c9099375b99f = orbite (réelle)

# text
# c1: gps-ops
seg-952b94eda0ff = vrais TLE <c1/> de Celestrak

# text
seg-60009932477c = instantané de 30 satellites, somme de contrôle stricte

# text
seg-deb16d50741e = ne se charge qu'avec des sommes de contrôle valides ; géométrie bornée

# text
seg-c46d726e35b3 = horloge (scintillement)

# text
# c1: flicker_floor
seg-15939085bf3a = <c1/> activé/désactivé

# text
seg-504a95f55b88 = { "0" } contre { "1e-12" }

# text
seg-e1cce0c2028e = activer le plancher en 1/f <b>aggrave</b> la marche libre du p95 de synchronisation

# text
seg-bdd4e56bdef9 = fusion (réalisme)

# text
# c1: accel.bias
seg-09af9dd78fe3 = <c1/> { "0" } contre { "5.88e-7" } m/s²

# text
seg-0a6723be642c = zéro contre non nul réaliste

# text
seg-a9eb04be2b9f = le filtre converge toujours, à { "3" }× près de l'erreur à biais nul

# text
seg-2a839953aa6a = Les lignes FM de scintillement et biais de fusion comblent deux écarts précis de réalisme : les termes de bruit sont <b>désactivés par défaut mais affectent manifestement la sortie lorsqu'ils sont activés</b>, et le filtre de fusion conjoint <b>ne dépend pas de biais mis à zéro</b> — il converge aussi avec un biais résiduel réaliste de qualité atomes froids.

# text
seg-4f0e9f9d4cdf = Les exécutions quantiques et classiques utilisent maintenant des graines de RNG (générateur de nombres aléatoires) indépendantes (graine classique = graine + 0x9e3779b97f4a7c15) afin que leurs réalisations de bruit soient décorrélées — corrigé après relecture.

# text
# c1: holdover_s
seg-3b6b785f401a = <c1/> tient compte des segments : les lignes de temps d'interruption sont découpées en segments contigus aux réacquisitions du GNSS et la valeur rapportée est la marche libre du pire cas (la plus courte) parmi eux. Elle reste bornée par la résolution de la grille de temps (une borne inférieure).

# text
seg-4a830113b13d = La resynchronisation par transfert de temps ISL modélise l'incertitude résiduelle de la liaison comme une gigue fraîche à moyenne nulle par pas de mesure plus un réancrage à l'intervalle configuré.

# text
seg-30c4d89aa433 = Affirmations et réalité — référence rapide

# text
seg-27a22de7b8c0 = La liste de contrôle d'un évaluateur hostile. Pour chaque terme qui pourrait être lu comme plus qu'il n'est : ce que Kshana fait aujourd'hui, et où se situe la vraie version dans la feuille de route.

# text
seg-759eb0cfafe4 = Terme que vous pouvez rencontrer

# text
seg-6a2d3691d642 = Ce que c'est réellement aujourd'hui

# text
seg-bbd0145bfb95 = Ce que ce n'est <b>pas</b> (encore)

# text
seg-a6fdb038b003 = « simulateur PNT hybride quantique/classique »

# text
seg-4421f8bd0967 = un simulateur stochastique classique piloté par des coefficients publiés d'Allan/de bruit de capteurs quantiques

# text
# c1: QUANTUM-MODELS.md
seg-3885661aafff = de la physique quantique à partir des premiers principes (phase de Mach–Zehnder, bruit de projection, systématiques) — voir <a1><c1/></a1>

# text
seg-1d28debd0302 = « fusion de Kalman conjointe » / paquet de fusion

# text
# c1: fusion
seg-d13beba21ba7 = le paquet <c1/> exécutable observe l'horloge et la position <b>séparément</b> (un point de temps direct et un point de position direct), pour lesquels l'estimateur optimal est véritablement bloc-diagonal — deux filtres à deux états avec une FoM combinée

# text
# c1: fusion::coupled::CoupledPntFilter
# c2: [pos,vel,phase,freq]
seg-25c2fe6fa6d3 = un filtre <em>couplé</em> pour le cas de la <b>pseudodistance</b> <b>existe</b> maintenant sous le nom <c1/> (<c2/> empilé à 4 états, covariance inter-blocs non nulle, validé par NEES) mais n'est <b>pas encore raccordé au paquet exécutable</b>, et le paquet est <b>à 1 DDL (un degré de liberté)</b> — l'extension 3D à 8 états relève de travaux futurs

# text
# c1: spoof
seg-5cce1ca5b86f = FoM de sécurité (type <c1/>)

# text
# c1: 1 − P_md
# c2: P_fa
# c3: P_md
seg-d55c30f63023 = <c1/> d'un <b>détecteur stochastique de leurrage temporel</b> : un test bilatéral χ²₁ / Neyman–Pearson sur une statistique de moniteur assistée par l'horloge, seuil fixé à partir d'un <c2/> cible, <c3/> évalué <b>à l'amplitude de la spécification</b> à la fois en forme fermée et par Monte-Carlo (qui concordent à quelques ×1/√N près)

# text
# c1: INTEGRITY.md
seg-dbf2039a4a8e = un détecteur RAIM/ARAIM multisatellite — voir <a1><c1/></a1> ; la statistique du moniteur est un modèle gaussien avec le σ dérivé de la DSP de l'horloge, et non une corrélation au niveau du signal

# text
seg-32bcb801e49c = « détection de leurrage assistée par l'horloge »

# text
seg-58e4d22075e9 = un moniteur d'écart de temps à <b>horloge unique</b> (statistique gaussienne, σ issu de la DSP de l'horloge), PAS un RAIM multi-SV (SV : space vehicle, c'est-à-dire un satellite)

# text
seg-f3f6f95bc559 = RAIM multi-SV dans le domaine des distances avec niveaux de protection

# text
seg-a5faedaab13e = P_md du détecteur de leurrage (forme fermée contre Monte-Carlo)

# text
# c1: Φ
# c2: P_md
# c3: mc_runs
# c4: src/spoof.rs
# c5: src/detection.rs
seg-0362489c341a = le <c2/> analytique fondé sur <c1/> et l'estimation empirique sur <c3/> essais concordent à l'erreur d'échantillonnage près (≈ 1/√N) ; validé dans les tests de <c4/> / <c5/> à une déflexion sollicitée (μ/σ = { "2" })

# text
seg-8fa5c9468ff5 = une ROC de détecteur mesurée par rapport à des données de leurrage enregistrées

# text
# c1: gnss-sim
seg-8f895aa1c657 = modèle de pseudodistance <c1/>

# text
# c1: ρ = geometric + clocks + Klobuchar iono + Saastamoinen·Niell tropo + noise + multipath
# c2: ionmodel()
# c3: klobuchar_agrees_with_rtklib_reference_implementation
seg-a5e5e1e7a0e9 = une <b>simulation directe</b> : <c1/>. Chaque modèle d'atmosphère est testé unitairement par rapport à des valeurs calculées à la main (ZHD (retard hydrostatique zénithal) ≈ { "2.3" } m, Niell = { "1" } au zénith, obliquité de Klobuchar), et le modèle diffusé complet de Klobuchar est <b>contrôlé de façon croisée par rapport à l'implémentation de référence <c2/> de RTKLIB</b> au niveau sub-millimétrique (<c3/>, { "6.1278" } m pour le cas à coefficients par défaut de RTKLIB — aucun vecteur de test officiel publié de Klobuchar n'existe ; il s'agit donc d'une parité d'implémentation, et non d'une vérité mesurée) ; une <b>exécution sans bruit reproduit la géométrie + les corrections au niveau sub-millimétrique</b> (résidu RAIM ≈ { "0" })

# text
seg-adc8a5d89cbd = une <b>solution</b> de position à partir de signaux réels (PPP/RTK (PPP : positionnement précis par point)), combinaison bifréquence sans ionosphère, ou résolution d'ambiguïté de la phase de la porteuse — non modélisé

# text
# c1: jamming
seg-a56533528c6e = modèle de brouillage (type <c1/>)

# text
# c1: Q
seg-0a4a28fcd53a = une chaîne de <b>bilan de liaison</b> : J/S à partir de la perte en espace libre + du gain d'antenne par direction → C/N₀ effectif par l'équation antibrouillage (gain d'étalement × <c1/> de séparation spectrale) → perte d'accrochage à un seuil (Kaplan & Hegarty §{ "9.4" })

# text
# c1: [acquisition]
# c2: [front_end]
# c3: [crpa]
# c4: [terrain]
# c5: Q
seg-b53e210487fb = trajets multiples, dynamique de l'AGC (commande automatique de gain) dans le temps, la recherche d'acquisition elle-même (l'hystérésis facultative <c1/> est une paire de seuils) ; la perte de quantificateur facultative <c2/> est celle d'une entrée gaussienne, non valable pour un brouilleur CW ; le réseau facultatif <c3/> est à bande étroite et idéal (sans couplage ni désadaptation), et l'ombrage facultatif <c4/> est un seul tranchant sur une seule tuile SRTM ; <c5/> est une constante représentative par type, non dérivée de la DSP mesurée du brouilleur

# text
seg-523d66d56f97 = FoM d'intégrité (paquets d'horloge/holdover)

# text
seg-d0702ee52d37 = <b>auto-cohérence</b> du filtre (fraction des échantillons d'interruption à l'intérieur de sa propre borne k·σ)

# text
# c1: integrity
seg-b4b68065e521 = HPL/VPL, risque d'intégrité / P_HMI, limites d'alerte, DO-229E/316/ED-259A — ils sont rapportés séparément par le type <c1/> (RAIM / ARAIM) et les fonctions SBAS, jamais intégrés à cette FoM

# text
# c1: inertial
seg-d5b1f858f0e3 = FoM du <b>paquet</b> de scénario <c1/> hérité

# text
seg-e9fe365d7318 = un budget d'erreur d'accéléromètre/gyroscope à <b>axe unique (1 DDL)</b> (VRW/ARW, instabilité de biais) avec une réinitialisation à la vérité

# text
# c1: gnss-ins
seg-604e8d96c2c2 = le paquet <em>hérité</em> est à 1 DDL ; le <b>chemin à 3 axes est livré dans le paquet <c1/></b> (ligne suivante)

# text
# c1: gnss-ins
# c2: src/inertial/
# c3: src/fusion/pack.rs
seg-e2a4a1c47f2c = <b>bibliothèque</b> strapdown à 3 axes + <b>paquet</b> <c1/> (<c2/>, <c3/>)

# text
# c1: gnss-ins
# c2: [imu_*.error_model]
seg-01e5672a37a4 = un navigateur quaternion/NED (NED : nord-est-bas) vérifié avec un modèle d'erreur d'IMU déterministe — <b>facteur d'échelle, désalignement, sensibilité à g, quantification, rampe de vitesse</b> modélisés (IEEE Std 952-1997 §A.2 ; Groves { "2013" } §{ "4.3" }) — maintenant <b>piloté par le paquet de scénario <c1/></b> et <b>configurable par capteur depuis le TOML (Tom's Obvious Minimal Language, le format des scénarios)</b> (<c2/>)

# text
seg-acecd6b81859 = <b>non modélisés :</b> erreur de redressement des vibrations, dérive due au gradient de température. L'erreur de marche libre fusionnée est plafonnée par l'erreur d'attitude au passage de relais (inclinaison/biais d'accéléromètre faiblement séparables) ; un étalonnage par biais n'est donc pas revendiqué

# text
# c1: hybrid
seg-6b04fc376c0d = « Intégration PNT hybride » (paquet <c1/>)

# text
seg-cd3125081b5c = navigation à l'estime en boucle ouverte encadrée par des réinitialisations GNSS à la vérité

# text
# c1: gnss-ins
# c2: hybrid-ukf
seg-578c93c67ae7 = un mélange de Kalman GNSS–INS couplé (lâche/serré) — c'est le paquet distinct <c1/> (EKF) et le type <c2/>

# text
seg-57f603da0331 = « Performance de positionnement » (paquets d'horloge)

# text
# c1: timing_rms_ns
seg-278aafe7fadf = RMS de <b>synchronisation</b> de phase d'horloge en ns (<c1/>)

# text
seg-a6af364cbcdc = une exactitude dans le domaine de la position en RMS/CEP/SEP/pondérée par le DOP (SEP : erreur sphérique probable)

# text
# c1: pos_rms_m
seg-b68c5a4363a5 = FoM de position inertielle (<c1/>)

# text
# c1: runs = N
seg-850e030bb5e3 = une RMS/p95 de position à <b>axe unique</b> en mètres, à partir d'une seule graine sauf si <c1/> demande un ensemble (alors moyenne, dispersion et intervalle de confiance bootstrap à { "95" } % par métrique)

# text
seg-be77929afa2c = une distribution d'ensemble CEP / 2DRMS (deux fois la RMS de distance) (feuille de route : CEP par Monte-Carlo)

# text
seg-75f239679dc2 = « validé à ~{ "2" } % »

# text
seg-2d593a99a2b1 = un accord observé <em>typique</em> ; le <b>seuil appliqué est une erreur relative de { "20" }–{ "25" } %</b>

# text
seg-34cfd0e08235 = une borne d'exactitude garantie de { "2" } %

# text
seg-d3402cc1ebd5 = « reproductible / identique au bit près »

# text
# c1: tests/cross_platform_golden.rs
# c2: tests/golden.rs
seg-46ea210bcdad = réexécution identique au bit près sur le <b>même OS (système d'exploitation) + chaîne d'outils figée</b> ; sous Linux, macOS et Windows, la CI contrôle un SHA-256 versé de l'empreinte d'entrée et de la forme de chaque résultat (<c1/>) et les valeurs numériques à { "1e-6" } (<c2/>)

# text
seg-38c6528122a8 = un résultat complet identique à l'octet d'un système d'exploitation à l'autre (différences de libm au dernier chiffre)

# text
# c1: orbit-sgp4-gps.toml
seg-b0e21aea4ccd = Scénario SGP4 GPS (<c1/>)

# text
# c1: gps-ops
seg-1131aa869f1d = un véritable instantané <c1/> de Celestrak (2021-07-28, { "30" } satellites, sommes de contrôle strictes), chaque satellite propagé à partir de sa propre époque TLE

# text
# c1: scripts/fetch_tles.sh
# c2: REAL_TLE_GUIDE.md
seg-21c2f1b5d7e2 = une constellation actuelle — actualisez l'instantané avec <c1/> (voir <a1><c2/></a1>) ; les numéros de catalogue NORAD (North American Aerospace Defense Command) sont les vrais

# text
seg-6948bd06c7e5 = Contrôles croisés de l'article sur le PNT lunaire (preuves de non-régression, et non lignes de matrice)

# text
# c1: tests/validate_p*.rs
seg-9ee0faf0b359 = La suite lunaire/cislunaire (les capacités « Lunar & cislunar » et « Lunar PNT suite » du README) voit ses affirmations d'articles publiés contrôlées de façon croisée et indépendante dans <c1/>, chacune par rapport à une référence indépendante issue d'une implémentation <em>différente</em> :

# text
# c1: scipy.special.j1
seg-b4edbf832fe6 = <b>empreinte orbitale d'émission/de capture</b> par rapport à <c1/> (Bessel J1 de Cephes) ;

# text
# c1: (HᵀH)⁻¹
seg-c856d319a46e = <b>DOP de géométrie de balises de surface</b> par rapport à une résolution <c1/> indépendante de NumPy ;

# text
# c1: finals2000A
seg-33ee672d98d7 = <b>croissance de l'erreur de prédiction de persistance UT1/EOP</b> par rapport à une ré-analyse NumPy des mêmes lignes <c1/> verbatim de l'IERS ;

# text
seg-9b6e59789117 = <b>famille d'orbites rétrogrades lointaines planes</b> par rapport à la Three-Body Periodic Orbit Database de la NASA/JPL ;

# text
seg-c77384abd1cc = <b>budget de précision de télémétrie RF</b> par rapport à une référence issue des premiers principes.

# text
# c1: tests/fixtures/{p1_footprint,lunar_service,eop_prediction,rf_ranging_precision,dro_family_jpl,p2_independent_dop}/
# c2: src/verification.rs
# c3: VERIFICATION-MATRIX.md
# c4: gen_validation_artifacts
# c5: verification_matrix()
# c6: tests/verification_artifacts_doc_sync.rs
seg-a451dbe09e10 = Les jeux de test et les scripts de génération de référence indépendante se trouvent sous <c1/>. Ils renforcent la preuve derrière des capacités qui restent <b>MODELLED</b> dans la matrice contrôlée par machine (<c2/>) ; ce sont des contrôles de non-régression, et <b>non</b> de nouvelles lignes VALIDATED de la matrice, de sorte qu'ils ne modifient pas eux-mêmes le décompte de la matrice contrôlée par machine. Ce décompte n'est pas répété ici, car une copie saisie à la main dérive : la répartition en vigueur est l'en-tête généré de <a1><c3/></a1>, que <c4/> écrit à partir de <c5/> et que <c6/> fige.

# text
seg-a353a63661de = <s1>Précédent</s1>Exports et imports d'interopérabilité

# text
seg-fdae3b73ab67 = <s1>Suivant</s1>Matrice de vérification

# text
seg-59c12422e6e7 = Marées sur le géopotentiel (src/tides.rs)

# text
seg-10f0b4616abe = Manœuvres et conception de trajectoire (src/maneuver.rs)

# text
seg-56cdbd59ce5d = Détermination d'orbite (OD) (src/orbit_determination.rs, src/batch_ls.rs)

# text
seg-3a2c69fcbb86 = Validation du modèle de forces par ajustement d'éphéméride (src/precise_od.rs)

# text
seg-05a25c6ef750 = Orbites précises réelles d'agences (tests/agency_galileo.rs, tests/agency_swarm.rs, tests/agency_lro.rs)

# text
seg-279f4619bc2d = Navigation par carte de gravité / alt-PNT (src/gravimeter.rs, src/mapmatch.rs, src/particle_filter.rs, src/altpnt/terrain.rs)

# text
seg-7b512df70323 = Modèle d'erreur INS / IMU — validation référencée à la fiche technique (src/inertial/)

# text
seg-b385e665cfff = PNT en espace lointain et sur Mars — fondation D0 (src/body.rs, src/mars_frame.rs, src/ephem_provider.rs, src/radiometric.rs, src/timescales.rs)

# text
seg-5887e7e1a218 = Observables radiométriques en espace lointain et message de données de suivi CCSDS (Tracking Data Message) — D1 (src/radiometric.rs, src/ccsds_tdm.rs)

# text
seg-a9cf84a14301 = OD à dynamique réduite en espace lointain — D2 (src/deepspace_od.rs, src/clock_state.rs, src/mars_atmos.rs)

# text
seg-dc406cb825db = Scénario PNT en espace lointain et fusion aller simple + aller-retour — D3 (src/mars_pnt.rs, src/deepspace_od.rs)

# text
seg-7784f9436dd2 = Temps-coordonnée lunaire — taux d'horloge relativiste Terre-Lune (src/lunar_time.rs)

# text
seg-8a34cb900611 = VLBI géodésique lunaire — délai en champ proche pour une ligne de base terrestre observant une balise lunaire (src/lunar_vlbi.rs)

# text
seg-d47906a347b3 = OD + horloge lunaires conjointes multi-techniques — récupération simulée en boucle fermée (src/lunar_combination.rs)

# text
seg-17b9f0ae9dee = Réalisation du référentiel lunaire — ajustement du datum de Helmert à 7 paramètres (src/lunar_frame_realise.rs)

# text
seg-3cfffa3eeb79 = Volume de service de la navigation lunaire — DOP / couverture / disponibilité + PL ARAIM lunaire généralisé (src/lunar_service.rs)

# text
seg-d80bf3320a15 = PNT différentiel lunaire — annulation du mode commun + résidu croissant avec la ligne de base + niveaux de protection DGNSS (src/lunar_dpnt.rs)

# text
seg-23c3d8a79acf = Export d'interopérabilité lunaire — CCSDS OEM + KIF alignés sur LunaNet/IOAG, avec respect de la norme vérifié en aller-retour (src/lunar_interop.rs)

# text
seg-a697f4f424b8 = Représentativité de la démonstration et registre des écarts avant le vol (src/representativeness.rs)

# text
seg-4c924153299d = Preuves unifiées de l'arbitrage quantique contre classique (src/qtrade.rs)

# text
seg-bd1a5835c5db = Bibliothèque de modèles d'erreur de dispositifs quantiques (src/quantum_devices.rs)

# text
seg-6b1bb731f966 = Synchronisation temporelle quantique de confiance — chaîne de bout en bout, diffusion sécurisée, anomalie + arbitrage (src/timetransfer_chain.rs)

# text
seg-3332c6c1ae86 = Navigation quantique sans GNSS (src/quantum_nav_od.rs)

# text
seg-9b46a5add4ab = Détection de défauts / d'anomalies pour les systèmes PNT quantiques (src/quantum_faults.rs)
