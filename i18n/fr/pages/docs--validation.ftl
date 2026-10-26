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
