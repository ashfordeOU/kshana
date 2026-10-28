# docs--capability-map: translations (fr)

# text
seg-76b323512350 = Systèmes de temps

# text
seg-ee2e250497f9 = Export pour banc d'essai

# text
# c1: docs/CAPABILITY.md
seg-956cdb003ffc = Source : <c1/>

# text
seg-891eb89a8801 = Carte des capacités : ce que Kshana fait, fait partiellement et ne fait pas

# text
# c1: POSITIONING.md
seg-f9b372e8832b = Kshana est un <b>moteur de preuves de performance et de résilience PNT (positionnement, navigation et synchronisation temporelle)</b>, et non une boîte à outils complète de systèmes spatiaux. Il met en avant la synchronisation temporelle et le holdover, son domaine le mieux validé (voir <a1><c1/></a1>). Cette page est la carte honnête du périmètre : pour chaque domaine de capacité qu'un évaluateur d'achat ou de recherche pourrait contrôler, elle indique l'état, ce qui existe réellement dans le code, ce qui manque et où cela se situe dans la feuille de route. L'état est l'un des suivants :

# text
seg-1b3a49d09c7d = <b>complet</b> : mis en œuvre de bout en bout et validé à un niveau indiqué dans la ligne ;

# text
seg-0da2570a5ca3 = <b>partiel</b> : un modèle réel mais limité (périmètre explicitement borné ci-dessous) ;

# text
seg-6e02edaa8f54 = <b>aucun</b> : non modélisé (hors périmètre aujourd'hui).

# text
# c1: VERIFICATION-MATRIX.md
# c2: src/verification.rs
seg-6b5bb629bf5e = Ces trois valeurs sont les seules que prend la colonne d'état. Elles notent la <em>maturité de la capacité</em>, qui est un axe différent de la note VALIDATED / MODELLED / PARTNER de <a1><c1/></a1> : celle-ci note la <em>provenance des preuves</em>, ligne par ligne, et est contrôlée par machine à partir de <c2/>.

# text
# c1: VALIDATION.md
# c2: INTEGRITY.md
# c3: QUANTUM-MODELS.md
# c4: CLAIMS-VS-REALITY.md
seg-b5eea277511f = Rien ici n'est ambitieux : « partiel » ne signifie jamais « presque terminé », cela signifie « autant et pas plus ». Voir aussi <a1><c1/></a1>, <a2><c2/></a2>, <a3><c3/></a3> et le registre de clôture des surévaluations <a4><c4/></a4> (chaque surévaluation historique, la façon dont elle a été résolue, et une garde d'intégration continue (CI) qui la maintient résolue).

# text
seg-b55f7e5a69cc = PNT de base (là où Kshana joue réellement)

# text
seg-d6476863f862 = Capacité

# text
seg-ad856ad710eb = État

# text
seg-2ee4023e3a27 = Ce qui existe

# text
seg-25843dc03c73 = Ce qui manque

# text
seg-331d2821d43f = Feuille de route

# text
seg-724b1929b536 = Détermination d'orbite et propagation

# text
seg-9aa33b4484ca = partiel

# text
# c1: ephemeris
# c2: src/ephemeris.rs
# c3: --export-oem
# c4: src/propagator.rs
# c5: forces::zonal_accel
# c6: J2..J6
# c7: integrate_dopri
# c8: propagate_dopri
# c9: solve_kepler_checked
# c10: Err
# c11: ForceModel::third_body
# c12: accel_at
# c13: src/ephem.rs
# c14: epoch_jd_tt + t/86400
# c15: third_body_accel
# c16: forces::srp_accel
# c17: ForceModel::solar_radiation
# c18: ν·P☉·cᵣ·(A/m)·(AU/d)²·d̂
# c19: forces::conical_shadow
# c20: forces::drag_accel
# c21: ForceModel::drag
# c22: accel_rv
# c23: −½·ρ(h)·(C_D·A/m)·|v_rel|·v_rel
# c24: v_rel = v − ωₑ ẑ × r
# c25: ρ
# c26: forces::atmospheric_density
# c27: forces::relativistic_accel
# c28: ForceModel::relativity
# c29: β = γ = 1
# c30: a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}
# c31: 3μ²/(c²r³)·r̂
# c32: ≈1.9e-9
# c33: forces::lense_thirring_accel
# c34: ForceModel::lense_thirring
# c35: src/orbit_determination.rs
# c36: src/batch_ls.rs
# c37: [r, v]
seg-7f4957a488b7 = <b>SGP4/SDP4</b> sans dépendance (SGP4 : Simplified General Perturbations { "4" } ; SDP4 : Simplified Deep-space Perturbations { "4" }), validé à { "4.12" } mm par rapport aux { "666" } vecteurs AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 (position <b>et</b> vitesse, cette dernière à { "1" } mm/s) ; képlérien analytique + J2 séculaire ; vitesse inertielle exposée et présentée <b>de bout en bout</b> par le <b>scénario <c1/></b> exécutable (<c2/>, accessible depuis CLI/Python/WASM/MCP (CLI : interface en ligne de commande ; WASM : WebAssembly ; MCP : Model Context Protocol)) : à chaque pas, il émet l'état TEME (true equator, mean equinox) <b>et</b> GCRS (Geocentric Celestial Reference System) (position + vitesse), la position ITRF/ECEF (ITRF : International Terrestrial Reference Frame ; ECEF : Earth-centred, Earth-fixed), la <b>trace au sol du point subsatellite</b> WGS-84 (WGS : World Geodetic System) (lat/lon/alt), et l'azimut/élévation/distance de la station + la <b>vitesse radiale/Doppler</b> (la vitesse radiale de distance concorde avec la vraie dérivée de position, sans bruit de JD (JD : date julienne), à { "6e-9" } m/s), et par l'export d'éphéméride <b>OEM</b> (Orbit Ephemeris Message) du CCSDS (Consultative Committee for Space Data Systems) qui porte la vitesse (<c3/>). Un <b>propagateur numérique (de Cowell)</b> (<c4/>) intègre un modèle de forces de <b>gravité zonale</b> configurable, le <b>champ zonal terrestre complet jusqu'au degré { "6" }</b> (<c5/>, les <c6/> publiés d'EGM-96 (EGM : Earth Gravitational Model)), avec un choix de pilote adaptatif, soit <b>doublement de pas</b> RK4 (Runge–Kutta d'ordre quatre), soit la paire imbriquée <b>Dormand–Prince RK5({ "4" })</b> (<c7/> / <c8/>, une estimation d'erreur imbriquée à 7 évaluations, moins coûteuse, qui franchit la même barrière de Kepler et concorde avec le chemin RK4 à <{ "1" } m sur une orbite J2..J6), calé sur une <b>vérité analytique plus forte qu'une comparaison numérique entre outils</b> : l'orbite non perturbée reproduit la <b>solution képlérienne exacte à variables universelles à mieux que le mètre sur { "24" } h</b> (une barrière plus serrée que le « par rapport à la référence < { "10" } m » de l'étape), l'énergie et le moment cinétique se conservent à ~{ "1e-9" } en relatif, la régression nodale due à J2 concorde avec le taux séculaire en forme fermée de la théorie au premier ordre, l'accélération zonale est vérifiée comme étant le <b>gradient exact de son propre potentiel</b> (et se réduit à la forme fermée J2 validée sur les 666 vecteurs), et <c9/> <b>renvoie <c10/> plutôt qu'une réponse fausse</b> lorsque Newton ne converge pas (par exemple près du périgée, e = { "0.999" }). La gravité de <b>troisième corps (Soleil et Lune) pilotée par l'époque</b> est <b>câblée dans l'intégrateur variable dans le temps</b> (<c11/> / <c12/>, avec les éphémérides de basse précision du Soleil et de la Lune de Montenbruck & Gill de <c13/> : aucun noyau DE/SPK (DE : Development Ephemeris ; SPK : noyau d'éphéméride planétaire) n'est nécessaire) : chaque évaluation du second membre (RHS) échantillonne les positions des perturbateurs à l'époque avancée <c14/>, de sorte que le Soleil et la Lune se déplacent sur leurs orbites pendant l'intégration. La perturbation est vérifiée comme le gradient exact de son potentiel perturbateur, s'annule au géocentre et a les ordres de grandeur LEO (orbite terrestre basse) des manuels (~{ "5e-7" } m/s² pour le Soleil, ~{ "1.1e-6" } m/s² pour la Lune) ; l'éphéméride du Soleil atteint des repères J2000 dérivés à la main (distance au périhélie, déclinaison de solstice ~−{ "23" }°, mouvement ~{ "1" }°/jour) et celle de la Lune son enveloppe périgée/apogée, sa distance moyenne de ~{ "384 400" } km, sa borne d'inclinaison ≤ { "5.3" }° et son retour de direction au mois sidéral ; et le câblage de l'intégration est prouvé <b>exact au bit près</b> (le terme du second membre égale <c15/> à la position échantillonnée à t = { "0" } et t = { "1" } jour), un décalage d'époque d'un quart d'année donnant une trajectoire différente. La <b>pression de rayonnement solaire</b> (SRP) emprunte le même second membre piloté par l'époque (<c16/> / <c17/>) : le modèle boulet de canon <c18/> avec un facteur d'éclipse ombre + pénombre <c19/> (ν lisse ∈ [{ "0,1" }], vérifié comme s'atténuant à travers une pénombre monotone qui s'étend au-delà du cylindre d'ombre), vérifié par rapport à la pression de manuel à 1 UA (UA : unité astronomique) (≈ { "4.54e-6" } N/m²), l'ordre de grandeur LEO de ~{ "1.36e-7" } m/s² qui éloigne du Soleil, la décroissance en inverse du carré (doubler la distance au Soleil la divise par quatre), une accélération <b>exactement nulle</b> dans le cylindre d'ombre, et un déplacement propagé qui varie ~linéairement avec A/m. La <b>traînée atmosphérique</b> est le premier terme dépendant de la vitesse (<c20/> / <c21/> + le nouveau second membre <c22/> / avec passage de la vitesse) : traînée quadratique <c23/> par rapport à l'atmosphère en corotation <c24/>, avec <c25/> la <c26/> exponentielle par morceaux de Vallado, vérifiée par l'ancrage au niveau de la mer de { "1.225" } kg/m³, une décroissance LEO strictement monotone avec une hauteur d'échelle physique de ~{ "58" } km, l'ordre de grandeur de traînée de ~{ "2e-6" } m/s² qui s'oppose à la vitesse relative, et la <b>signature de dissipation</b> (une orbite à { "300" } km perd de l'énergie spécifique de façon monotone et son demi-grand axe décroît de ~km/jour de façon bornée, alors que l'orbite dans le vide conserve l'énergie). La <b>correction relativiste post-newtonienne (de Schwarzschild)</b> est le second terme dépendant de la vitesse (<c27/> / <c28/>) : la forme <c29/> de l'IERS (International Earth Rotation and Reference Systems Service) <c30/>, le principal moteur de l'avance relativiste du périgée, vérifiée par rapport à sa valeur circulaire en forme fermée <c31/> (radiale, vers l'extérieur), son rapport LEO de manuel <c32/> au problème à deux corps, la forme à vitesse radiale simplifiée à la main, et la <b>signature conservative</b> (elle perturbe l'orbite mais maintient le demi-grand axe à moins d'un mètre/jour, l'opposé structurel de la traînée). Le terme d'entraînement des référentiels de <b>Lense–Thirring</b> (<c33/> / <c34/>, IERS { "2010" } §{ "10" }) est la correction gravitomagnétique au-delà de Schwarzschild : facultatif, inférieur de ~{ "1" } à { "2" } ordres de grandeur à celui-ci en LEO, vérifié comme s'annulant sans rotation de la Terre et comme restant sous l'ordre de grandeur de Schwarzschild. La <b>détermination d'orbite</b> (OD, <c35/>) referme la boucle des observations vers un état : un correcteur <b>par lots de Gauss–Newton</b> (<c36/>) amène un <c37/> candidat sur le meilleur ajustement des distances de stations au sol propagées sur l'arc (sub-métrique / mm·s⁻¹ à partir de distances sans bruit ; ~{ "2" } m avec un résidu après ajustement au plancher de bruit de { "5" } m, la signature d'un ajustement des moindres carrés cohérent), avec une variante récursive <b>séquentielle</b> sur le filtre de Kalman sans parfum

# text
# c1: src/gravity_sh.rs
# c2: from_gfc
# c3: src/precise_od.rs
# c4: AGENCY-ORBIT-VALIDATION.md
# c5: tests/numerical_cowell_propagator_reference.rs
# c6: tests/batch_sequential_orbit_determination_reference.rs
seg-4bca83197ed6 = Le modèle de forces de Cowell par défaut ne porte que le champ zonal : le champ <b>tesséral</b> EGM2008 (Earth Gravitational Model { "2008" }) de haut degré (<c1/>, degré/ordre { "70" }, avec un chargeur <c2/> pour les fichiers ICGEM (International Centre for Global Earth Models)) n'est composé que dans le moteur d'ajustement d'éphéméride précise (<c3/> ; voir <a1><c4/></a1>) ; la densité de traînée est l'exponentielle par morceaux <b>statique</b> de Vallado (indépendante de l'activité solaire), <b>et non</b> NRLMSISE-00 (le modèle d'atmosphère Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended ; la clause de densité thermosphérique < { "5" } %) ; la SRP est le modèle <b>boulet de canon</b> avec une ombre géométrique <b>conique ombre + pénombre</b> (sans assombrissement centre-bord solaire, sans ombre d'une Terre aplatie, sans forme ni attitude du satellite) ; la relativité couvre les termes de <b>Schwarzschild et de Lense–Thirring</b> (entraînement des référentiels), tous deux facultatifs, mais sans réglage des paramètres PPN (PPN : post-newtonien paramétré) ; <b>le troisième corps et la SRP utilisent les éphémérides de basse précision (~{ "0.005" }° pour le Soleil, ~{ "0.3" }° pour la Lune), et non la précision d'un noyau DE/SPK</b>. Les niveaux conservatifs du modèle de forces (deux corps → J2–J6 → Soleil/Lune → SRP) sont <b>VALIDATED par rapport à Orekit { "12.2" }</b> (pire écart de { "0.08" } m sur { "24" } h, <c5/>), et la détermination d'orbite par lots/séquentielle est <b>VALIDATED par rapport aux estimateurs d'Orekit { "12.2" }</b> (<c6/>) ; le niveau de traînée et la fidélité absolue des entrées d'éphéméride et de densité restent MODELLED ; il n'y a pas de contrôle croisé avec GMAT (General Mission Analysis Tool)

# text
seg-c66f25447fe9 = gravité tesséral dans le modèle de Cowell par défaut + traînée NRLMSISE-00 + assombrissement centre-bord solaire + éphéméride de niveau DE + validation croisée GMAT + mesures de vitesse radiale/angles de la détermination d'orbite et STM analytique (matrice de transition d'état) : P2+

# text
# c1: src/timescales.rs
# c2: eraEra00
# c3: gstime
# c4: ephemeris
# c5: dut1_s
# c6: xp_arcsec
# c7: yp_arcsec
# c8: finals2000A
# c9: eop_finals2000a
# c10: kshana --eop <file>
# c11: EopSeries
# c12: precise_od
seg-fffd275219ff = <c1/> : API de date julienne (civil↔JD, MJD (date julienne modifiée)), UTC↔TAI (UTC : temps universel coordonné ; TAI : temps atomique international) via la table complète des secondes intercalaires de l'IERS ({ "10" }→{ "37" } s, { "1972" }→{ "2017" }), TAI→TT (TT : temps terrestre), UT1 (temps universel { "1" }, temps de rotation de la Terre) via DUT1 (le temps de rotation de la Terre moins le temps universel coordonné), et l'<b>angle de rotation de la Terre</b> IAU-2000 (IAU : Union astronomique internationale) (ERA, vérifié bit à bit par rapport au vecteur SOFA (Standards of Fundamental Astronomy) <c2/>). <b>L'approximation DUT1≈{ "0" } du chemin SGP4 est explicitement documentée</b> au site d'appel <c3/> (une erreur de GMST (temps sidéral moyen de Greenwich) ≤ ~{ "13" }″, bien à l'intérieur de l'erreur propre du modèle SGP4), et le scénario <c4/> accepte des réglages explicites <c5/>/<c6/>/<c7/> <b>ou une vraie série IERS <c8/> intégrée</b> (<c9/> / <c10/>, interpolée par le même <c11/> que celui qu'utilise <c12/>), de sorte que la trace au sol est réduite à travers le vrai UT1 et le vrai mouvement du pôle de l'IERS, et pas seulement les scalaires nominaux

# text
# c1: f64
# c2: timescales::TwoPartJd
# c3: src/jd2.rs
# c4: Jd2
# c5: Sgp4::propagate_at(Jd2)
# c6: tests/jd2_sofa_time_oracle.rs
# c7: jd2::gmst82
# c8: cio::gcrs_to_itrs_matrix_jd2
# c9: orbit::Propagator::position_in_frame_jd2
# c10: two_part_jd
# c11: tests/jd2_earth_rotation_erfa_oracle.rs
# c12: Jd2
# c13: TwoPartJd
# c14: f64
# c15: two_part_jd
# c16: f64
# c17: jd2
# c18: timescales::tai_minus_utc_on_date
# c19: tests/jd2_pre1972_sofa_oracle.rs
# c20: f64
# c21: timescales::tai_minus_utc
# c22: src/eop_ls_ar.rs
# c23: EopSeries::with_ls_ar_prediction
# c24: tests/eop_prediction_beyond_table.rs
seg-d488e9db94e9 = Les chemins en orbite terrestre utilisent encore une JD à un seul <c1/> (résolution de ~{ "50" } µs vers { "2020" } : c'est ce plancher, et non l'algorithme, qui limite un contrôle croisé par différences finies) ; une JD en deux parties existe (<c2/>, utilisée par les chemins radiométriques, CCSDS-TDM, simulateur de segment sol et système solaire, et <c3/> <c4/>) et est propagée à travers SGP4 (<c5/>), la prédiction de passages, la géométrie et les conceptions Walker (validée par rapport à SOFA, <c6/>), et à travers la rotation de la Terre sur le chemin orbital (<c7/>, <c8/>, <c9/>, le <c10/> facultatif du scénario d'éphéméride ; VALIDATED par rapport à ERFA, <c11/>), avec des conversions sans perte entre <c12/> et <c13/> ; les chemins en orbite terrestre par défaut conservent la date à un seul <c14/> sauf si <c15/> est défini, et l'époque du modèle de forces de Cowell reste volontairement à un seul <c16/> (son erreur analytique Soleil/Lune écrase un arrondi de { "40" } µs) ; l'UTC à seconde élastique d'avant 1972 ({ "1960" }–{ "1971" }) est modélisé sur le chemin en deux parties (<c17/>, <c18/>, VALIDATED par rapport à ERFA, <c19/>) mais <c21/> à un seul <c20/> plafonne encore à { "10" } s avant { "1972" } ; un prédicteur d'orientation de la Terre par moindres carrés + autorégressif (<c22/>, comparé au Bulletin A de l'IERS comme un résultat) peut désormais prolonger une série EOP au-delà de sa dernière ligne (<c23/>, facultatif ; <c24/>), de sorte que les arguments de référentiel au-delà de la table suivent la prévision au lieu de plafonner ; la série par défaut plafonne toujours et aucune clé de scénario n'active encore la prédiction

# text
seg-d59294cf367c = <b>fait</b> (fondation) ; JD en deux parties à travers la rotation de la Terre sur le chemin orbital : <b>fait</b> (facultatif dans le scénario d'éphéméride) ; prédiction EOP au-delà de la table : <b>fait</b> (bibliothèque, facultatif) ; UTC d'avant 1972 sur le chemin en deux parties : <b>fait</b>

# text
seg-798b3b5db6d6 = Référentiels

# text
seg-69930da8bc5a = complet

# text
# c1: src/frames.rs
# c2: src/precession.rs
# c3: (γ̄, φ̄, ψ̄, ε̄_A)
# c4: src/nutation.rs
# c5: nutation_iau2000a
# c6: nutation_matrix_2000a
# c7: nut00a
# c8: tools/gen_nut00a.py
# c9: iauNumat
# c10: teme_to_gcrs(r, v, jd_tt)
# c11: nut00a
# c12: nut00b
# c13: teme_to_itrf
# c14: polar_motion_matrix
# c15: iauPom00
# c16: x_p
# c17: y_p
# c18: src/cio.rs
# c19: X,Y
# c20: s
# c21: gcrs_to_cirs_matrix
# c22: gcrs_to_itrs_matrix
# c23: eraXys06a
# c24: eraC2ixys
# c25: eraEra00
# c26: tests/frame_reference_vectors.rs
# c27: ephemeris
seg-4b3fe53b3dcd = <c1/> : TEME↔ECEF fondé sur le GMST, géodésique WGS-84↔ECEF (exact + inverse itératif, à la précision machine à toutes les altitudes), et un observateur de station au sol géodésique (azimut/élévation/distance) ; <b>précession IAU { "2006" }</b> (<c2/> : les angles de Fukushima–Williams <c3/> + la matrice de biais-précession GCRS↔moyen de la date) ; <b>nutation IAU 2000A/2000B + chaîne complète TEME→GCRS</b> (<c4/> : la série <b>IAU 2000A complète</b>, { "678" } termes luni-solaires + { "687" } termes planétaires, <c5/> / <c6/>, table générée par machine à partir de la référence <c7/> d'ERFA (Essential Routines for Fundamental Astronomy) par <c8/>, à côté de la série 2000B à 77 termes, des arguments de Delaunay, de la matrice de nutation SOFA <c9/>, de l'équation des équinoxes, et de <c10/> via TEME→TOD→MOD→GCRS (vrai de la date, moyen de la date) ; les deux séries sont vérifiées <b>bit à bit</b> par rapport aux vecteurs de référence SOFA/ERFA <c11/>/<c12/>, Δψ/Δε à { "1e-13" } rad) ; <b>mouvement du pôle de l'IERS</b> PEF→ITRF (pseudo-fixe terrestre vers terrestre) (<c13/> / <c14/>, SOFA <c15/>, <c16/>/<c17/> fournis par l'appelant, un effet de plusieurs dizaines de mètres au rayon orbital) ; <b>réduction IAU 2006/2000A fondée sur le CIO (CIO : Celestial Intermediate Origin)</b> (<c18/> : la chaîne GCRS↔CIRS↔ITRS sans équinoxe (CIRS : Celestial Intermediate Reference System ; ITRS : International Terrestrial Reference System), avec le CIP (Celestial Intermediate Pole) <c19/> issu de la matrice NPB (nutation-précession-biais) 2006/2000A, la série du localisateur du CIO <c20/> à 66 termes, <c21/>, l'angle de rotation de la Terre, et le <c22/> complet, vérifiée <b>bit à bit</b> par rapport aux vecteurs SOFA <c23/>/<c24/>/<c25/>). Les transformations <b>de bout en bout</b> sont désormais calées sur un exemple détaillé publié faisant autorité, et pas seulement sur l'autocohérence : par rapport à l'état <b>Vallado</b> AIAA 2006-6753 (2004-04-06, avec ses EOP (paramètres d'orientation de la Terre) de l'IERS ; <c26/>), TEME→PEF concorde à <b>{ "0.1" } mm</b>, TEME→ITRF à <b>{ "0.6" } mm</b>, le GCRS→ITRS complet par le CIO à <b>{ "4" } mm</b>, et ECEF→géodésique reproduit latitude/longitude/altitude de l'exemple 3-3 de Vallado jusqu'au dernier chiffre publié. Toute la chaîne est <b>accessible à l'utilisateur</b> via le scénario <c27/> (position ITRF/ECEF + trace au sol du point subsatellite WGS-84 à chaque pas)

# text
# c1: nutation_matrix_2000a
# c2: src/cio.rs
# c3: xval/anise-frames/
# c4: gcrs_to_itrs_matrix
# c5: precession_matrix
# c6: teme_to_gcrs_matrix
# c7: cio::gcrs_to_cirs_matrix_with_offsets
# c8: tests/frames_erfa_vector_oracle.rs
seg-d33e9458e239 = La chaîne TEME→GCRS par défaut utilise 2000B (~{ "1" } mas, sous sa propre simplification de rotation du référentiel de vitesse) ; le chemin à < { "0.1" } mas, de la 2000A complète, est disponible via <c1/>, et la réduction rigoureuse par le <b>CIO (X, Y, s)</b> est disponible via <c2/>. Le chemin TEME historique utilise le GMST IAU-1982 (convention SGP4). Le contrôle croisé numérique indépendant ANISE/SPICE (ANISE : Attitude, Navigation, Instrument, Spacecraft, Ephemeris, une boîte à outils de géométrie planétaire en Rust pur ; SPICE : Spacecraft, Planet, Instrument, C-matrix, Events) est <b>livré</b> (<c3/> : <c4/> par rapport au GCRF→ITRF93 d'ANISE (GCRF : Geocentric Celestial Reference Frame ; ITRF93 : International Terrestrial Reference Frame { "1993" }) sur huit époques de { "2020" } à { "2023" }, ≤ { "0.86" } m au sol, ≤ { "3.6" } m en orbite GNSS (système mondial de navigation par satellite)) ; c'est un crate autonome en dehors des portes d'intégration continue par défaut. <c5/> et <c6/> sont aussi contrôlés directement par rapport à ERFA à { "40" } époques de { "1950" } à { "2100" }, et la chaîne CIO accepte les décalages du pôle céleste dX, dY de l'IERS (<c7/> ; <c8/>) ; les chemins par défaut négligent encore dX, dY. La matrice de vérification note cette ligne <b>VALIDATED</b> (vecteurs SOFA/ERFA + Vallado)

# text
seg-0713e7ed6be7 = TEME↔ECEF + géodésique : <b>fait</b> (vérifié par Vallado) ; TEME→GCRS inertiel : <b>fait</b> (2000B + 2000A complet) ; ITRF avec mouvement du pôle : <b>fait</b> (vérifié par Vallado) ; GCRS→ITRS par le CIO : <b>fait</b> (vérifié par Vallado)

# text
seg-7e3e210ca43c = Synchronisation temporelle et fréquence

# text
# c1: src/filter_health.rs
# c2: filter_health
# c3: src/allan.rs
# c4: tests/allan_reference.rs
# c5: src/timetransfer.rs
# c6: src/holdover.rs
# c7: σ_x²(t) = q_wf·t + q_rw·t³/3 + q_drift·t⁵/20
# c8: clock_state
# c9: src/tpl.rs
# c10: cargo run --example tpl_jammertest
# c11: allantools
# c12: tests/mtie_reference.rs
# c13: tests/mdev_tdev_reference.rs
# c14: tests/gnss_denied_clock_holdover_reference.rs
# c15: telecom-timing
# c16: TELECOM-TIMING.md
seg-97de2d9d9ccf = Horloge de Kalman à deux états à Q de van Loan exacte (NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }) avec une <b>mise à jour de covariance stabilisée de Joseph</b> (semi-définie positive sous des rapports Q/R extrêmes, vérifiée par Cholesky en CI) et un <b>moniteur de santé de cohérence du filtre</b> (<c1/>) : une évaluation Monte-Carlo NIS/NEES (NIS : innovation normalisée au carré ; NEES : erreur d'estimation normalisée au carré) par rapport à des bandes de confiance du χ², présentée sous <c2/> dans le JSON (JavaScript Object Notation) du résultat et dans une carte verte/ambre du bac à sable, avec un test de balayage de désaccord Q/R prouvant que le moniteur bascule sur <em>inconsistent</em> lorsque le réglage est faux (Bar-Shalom §{ "5.4" }) ; estimateurs <b>ADEV (écart-type d'Allan), MDEV (écart-type d'Allan modifié), TDEV (écart de temps), HDEV</b> (écart d'Hadamard) à recouvrement + intervalles de confiance fondés sur le χ² avec des <b>degrés de liberté effectifs propres à chaque type de bruit</b> (formes fermées du tableau { "5" } de NIST SP { "1065" } pour WPM/FPM/WFM/FFM/RWFM (WPM : modulation de phase blanche ; FPM : modulation de phase en scintillation ; WFM : modulation de fréquence blanche ; FFM : modulation de fréquence en scintillation ; RWFM : modulation de fréquence à marche aléatoire), l'ensemble qu'utilise Stable32 ; la courbe ADEV exportée identifie le type de loi de puissance de l'enregistrement à partir de sa pente MDEV et joint une bande à { "95" } % par τ, <c3/>), <b>validés numériquement par rapport aux écarts de référence de Stable32 pour le jeu de données canonique NBS14 à { "1e-4" } près</b> (<c4/>) et l'edf recoupé par un ensemble Monte-Carlo de FM (modulation de fréquence) blanche ; mesure de mérite de holdover honnêtement bornée par la grille ; ensembles d'horloges ; <b>modèle de transfert de temps bidirectionnel</b> avec annulation du retard réciproque + un plancher de retard différentiel non réciproque à marche aléatoire de FM (<c5/>, signature d'Allan rapportée) ; un <b>calculateur de holdover d'horloge en environnement sans GNSS</b> (<c6/>) exposant la croissance de l'erreur en roue libre de van Loan en forme fermée <c7/> sous forme d'une inversion <em>holdover jusqu'au seuil</em> orientée utilisateur (combien de temps une horloge dérive librement avant que son erreur de temps ne dépasse le budget), avec des classes représentatives d'horloges quantiques (réseau optique/ion piégé/ion mercure) : <b>modélisé, non validé en externe</b> : recoupé avec la récurrence de covariance multi-pas <c8/>, et indiqué honnêtement que, pour une horloge très stable, le holdover jusqu'à un seuil serré est <b>gouverné par le plancher de bruit rouge à long tau <em>supposé</em>, et non par l'ADEV cité</b> (utilisez des planchers mesurés pour obtenir un nombre défendable). Un <b>niveau de protection temporel conditionnel</b> (<c9/>) s'appuie sur la même mécanique de holdover pour le cas du <em>leurrage</em> : une borne sur l'erreur de temps <b>non détectée</b> étant donné un contrôle croisé indépendant, soit un plancher de moniteur à k σ plus la variance de van Loan en roue libre sur la latence de détection plus un délai d'alarme CUSUM (somme cumulée), étalonnée sur un <b>vrai leurrage enregistré</b> (JammerTest { "2024" }, Zenodo { "15911589" }) et reproductible via <c10/>. Composition <b>modélisée</b>, conditionnelle à la détection : il n'existe aucune borne <em>inconditionnelle</em> finie (une rampe assez lente échappe à un moniteur unique assisté par l'horloge). L'<b>erreur maximale d'intervalle de temps (MTIE)</b> et le <b>TDEV</b> sont VALIDATED par rapport à <c11/> (<c12/>, <c13/>), et l'inversion de la variance en roue libre du holdover est VALIDATED par rapport à SciPy (<c14/>) ; le type <c15/> les applique aux gabarits ITU-T (Union internationale des télécommunications, secteur de la normalisation des télécommunications) G.8272 / G.8272.1 / G.8273.2 / G.8271.1, voir <a1><c16/></a1>

# text
seg-cf16b15c0a27 = edf complet par l'algorithme de Greenhall (les formes fermées simples sont bornées en biais mais plus grossières que le BasicSum exact), et identification de mélanges de plusieurs bruits

# text
seg-d35d1a9e0ed3 = edf exact + identification de bruits mélangés : P2

# text
seg-cdfb50bca79e = Traitement GNSS / PNT

# text
# c1: gnss-sim
# c2: src/gnss_sim.rs
# c3: ρ = geometric range + c·δt_rx − c·δt_sv + I + T + noise + multipath
# c4: gnss_measurements[]
# c5: Propagator
# c6: rinex
# c7: scenarios/orbit-rinex.toml
# c8: pvt
# c9: src/pvt.rs
# c10: −TGD
# c11: tests/pvt_abmf.rs
# c12: scenarios/pvt-abmf.toml
seg-733cf51a8c5e = Une <b>simulation de pseudodistances dans le domaine des mesures</b> (type <c1/>, <c2/>) : pour chaque satellite visible, elle synthétise <c3/> et le Doppler L1, avec l'<b>ionosphère monofréquence de Klobuchar</b> (IS-GPS-200 (IS : spécification d'interface ; GPS : Global Positioning System) §{ "20.3.3.5.2.5" }) et la <b>troposphère zénithale de Saastamoinen</b> (Davis { "1985" }) projetées par la <b>fonction de projection de Niell ({ "1996" })</b>, chaque modèle étant testé unitairement par rapport à un calcul à la main, puis transmet les résidus au <b>RAIM instantané</b> (surveillance autonome de l'intégrité par le récepteur) pour obtenir HPL/VPL à chaque époque (HPL : niveau de protection horizontal ; VPL : niveau de protection vertical) et émet un tableau <c4/> (pseudodistance, Doppler, C/N₀, corrections iono/tropo par SV (véhicule spatial, c'est-à-dire un satellite)). Plus DOP/disponibilité (DOP : dilution de précision) et RAIM à séparation de solutions à partir des orbites ; <b>ingestion NAV multi-GNSS RINEX (Receiver Independent Exchange Format) { "3" }</b> (GPS/Galileo/QZSS/BeiDou (QZSS : système japonais Quasi-Zenith Satellite System) via IS-GPS-200, vecteur d'état GLONASS (système russe Global Navigation Satellite System)) analysée → position ECEF et biais d'horloge du SV, utilisable comme source <c5/> de premier rang ET comme bloc <c6/> de constellation en ligne (<c7/>) ; <b>ingestion des OBSERVATIONS RINEX { "3" }</b> (le format d'observation { "4.00" } devrait être analysé mais aucun fichier { "4.00" } n'a été éprouvé ; les fichiers de NAVIGATION RINEX { "4" } sont refusés par leur nom plutôt que mal décodés) ; un <b>solveur de positionnement par point unique</b> (type <c8/>, <c9/>) qui transforme de vraies pseudodistances de code RINEX + éphéméride diffusée en une <b>position de récepteur</b> par moindres carrés pondérés itérés : correction de Sagnac/rotation de la Terre, horloge de satellite diffusée avec <c10/>, <b>combinaison sans ionosphère bifréquence L1/L2</b> (ou Klobuchar monofréquence), troposphère de Saastamoinen/Niell, pondération par l'élévation, DOP, et RAIM instantané, <b>validé sur de vraies données IGS (International GNSS Service)</b> (station ABMF, Guadeloupe, 2018-05-13) à <b>{ "5.7" } m en RMS (racine de la moyenne des carrés) 3-D / { "1.1" } m en horizontal</b> par rapport à la coordonnée relevée de la station (<c11/>, <c12/>) ; et lecture/écriture d'orbites précises SP3 (Standard Product { "3" }, le format d'orbite précise)

# text
# c1: pvt
# c2: rtk_real::run_rtk
# c3: src/lambda.rs
# c4: tests/rtk_real_wettzell_oracle.rs
# c5: tests/ppp_real_wettzell_oracle.rs
# c6: leo-ppp
# c7: gnss-sim
seg-cc7dc902c8f5 = Un moteur de positionnement par <b>code</b> plus, depuis { "0.36" }, un traitement de la phase de la porteuse sur de vraies observations : le solveur <c1/> calcule une vraie position à partir de vraies mesures de code (positionnement par point unique, au niveau du mètre, avec la combinaison sans ionosphère bifréquence) ; <c2/> réalise du RTK à courte ligne de base sur de vrais code et phase GPS bifréquence (doubles différences, filtre de Kalman flottant, fixation de l'ambiguïté entière par LAMBDA avec test du rapport, <c3/>), et un filtre PPP statique flottant s'exécute sur de vrais code et phase avec les orbites et horloges finales de l'IGS. Les deux sont VALIDATED par rapport aux coordonnées ITRF2020 publiées de stations IGS (WTZR/WTZZ, <c4/>, <c5/>, seuils fixés à l'avance) ; ce qui reste absent, c'est la résolution de l'ambiguïté entière en PPP, le RTK cinématique ou en réseau et le fonctionnement en temps réel. Le lissage de porteuse de Hatch est un résultat MODELLED figé (ses seuils fixés à l'avance n'ont pas été atteints). Le type <c6/> exécute un filtre PPP flottant sur des mesures qu'il simule, pour des études de convergence ; le paquet direct <c7/> reste un simulateur à partir de la vérité ; BeiDou-GEO (GEO : orbite géostationnaire) exclu

# text
seg-61b43da61326 = fixation d'ambiguïtés PPP, RTK cinématique ou en réseau, fonctionnement en temps réel : utilisez RTKLIB/gLAB (RTKLIB : une bibliothèque libre de positionnement cinématique en temps réel)

# text
seg-820a5f1f7e3b = Fusion de capteurs / navigation à l'estime INS (système de navigation inertielle)

# text
# c1: src/inertial/{attitude,mechanization,imu_errors}.rs
# c2: src/fusion/pack.rs
# c3: kind = "gnss-ins"
# c4: src/fusion/{gnss_ins_ekf,closed_loop}.rs
# c5: inertial
# c6: update_tightly_coupled
# c7: fuse_tightly_coupled
# c8: src/fusion/tightly_coupled17.rs
# c9: q_va
# c10: src/fusion/hybrid_ukf.rs
# c11: kind = "hybrid-ukf"
# c12: q_va
# c13: clock_state::q_from_allan
# c14: q_wf
# c15: q_rw
# c16: gnss-ins
# c17: [imu_*.error_model]
seg-4181becfd059 = <b>Bibliothèque à composants liés 3 axes</b> (<c1/>) : attitude par quaternions avec compensation du coning/sculling, mécanisation NED (nord-est-bas) complète (vitesse de rotation de la Terre + vitesse de transport, gravité de Somigliana WGS-84), et un modèle déterministe d'erreurs d'IMU (unité de mesure inertielle) (<b>facteur d'échelle, désalignement, sensibilité à g, quantification, rampe de vitesse</b> modélisés). Le navigateur à composants liés est désormais <b>branché dans un paquet GNSS/INS à couplage lâche exécutable</b> avec une mesure de mérite (<c2/>, <c3/>) : la mécanisation à trois axes est asservie par l'<b>EKF (filtre de Kalman étendu) à état d'erreur à 15 états</b> (<c4/>, rétroaction de position/vitesse/attitude/biais) tant que le GNSS est disponible, puis poursuit en roue libre pendant la coupure, ce qui remplace la remise à la vérité par une vraie fusion, et rapporte l'erreur horizontale fusionnée par rapport à l'INS libre en boucle ouverte. Le paquet <c5/> historique distinct exécute toujours le budget <b>scalaire à 1 DOF (DOF : degré de liberté)</b> avec remise à la vérité. Une mise à jour <b>à couplage serré sur les pseudodistances</b> (<c6/> / <c7/>) est aussi mise en œuvre : elle forme l'innovation dans le domaine des distances (jacobienne de la ligne de visée sur δp) et continue de corriger avec <b>moins de quatre satellites</b>, là où une solution PVT (position, vitesse et temps) à couplage lâche n'existe pas. Un <b>UKF GNSS/INS à couplage serré complet à 17 états</b> (filtre de Kalman sans parfum) (<c8/>) porte la position, la vitesse, l'erreur d'attitude, les biais d'accéléromètre et de gyromètre, et l'horloge du récepteur (biais + dérive), avec une <b>navigation à l'estime quantique CAI (CAI : interféromètre à atomes froids)</b> : le bruit de processus de marche aléatoire de vitesse est le <c9/> dérivé de l'accéléromètre à atomes froids, qui poursuit en roue libre pendant une coupure de 120 secondes bornée à quelques centaines de mètres (contre les kilomètres d'un INS libre de qualité navigation). Cet UKF à 17 états est désormais <b>présenté comme un scénario exécutable</b> (<c10/>, <c11/>, accessible depuis CLI/Python/WASM/MCP) : les <b>{ "15" } états d'erreur de l'INS</b> sont augmentés de la <b>correction de biais d'accéléromètre dérivée du CAI</b> (l'interféromètre à atomes froids fixe le plancher de marche aléatoire de vitesse <c12/>) et d'une <b>horloge à 2 états phase + fréquence</b> dont le bruit de processus provient du <b>moteur d'horloge à paramètres q</b> (<c13/>, profil d'Allan → <c14/>/<c15/>), piloté par le modèle d'erreur CAI encadré afin que l'exécution démontre l'hybridation entre le court terme d'une IMU classique et le long terme quantique. Sa mesure de mérite est l'<b>autocohérence du filtre</b> : <b>NEES + blancheur de l'innovation (NIS)</b> regroupées sur un ensemble Monte-Carlo par rapport à leurs bandes du χ² à { "95" } % (le filtre adapté tombe dans les bandes ; un filtre mal réglé est signalé, un critère objectivement vérifiable). <b>Il s'agit d'un énoncé d'AUTOCOHÉRENCE sous le bruit modélisé, PAS d'une garantie de précision en conditions réelles</b> : les entrées CAI/horloge sont encadrées/modélisées, le matériel CAI appartient au partenaire, et rien ici n'implique un TRL (niveau de maturité technologique)>{ "3" }, un héritage de vol ou une validation externe. Le modèle déterministe d'erreurs d'IMU est <b>configurable par capteur depuis le fichier de scénario TOML (Tom's Obvious Minimal Language) <c16/></b> (<c17/> : facteur d'échelle, désalignement, sensibilité à g, quantification, rampe de vitesse), avec par défaut une source à biais constant pur lorsqu'il est omis

# text
# c1: hybrid-ukf
# c2: tests/classical_strapdown_ins_reference.rs
seg-4052714816eb = Le couplage serré se fait <b>sur les seules pseudodistances</b> (la phase de la porteuse est dans la feuille de route) ; le scénario <c1/> utilise une <b>trajectoire unique à vitesse constante, de niveau</b>, sur laquelle les états d'erreur d'attitude et de biais d'IMU ne sont que faiblement observables, de sorte que la cohérence NEES est évaluée sur le <b>sous-ensemble estimable</b> (position, vitesse, horloge = { "8" } états) ; l'observabilité complète des 17 états exige une trajectoire à manœuvres (feuille de route) ; la paire biais d'accéléromètre/inclinaison à couplage lâche est faiblement séparable, de sorte qu'un étalonnage par biais n'est pas revendiqué ; le modèle d'erreurs d'IMU omet la rectification des vibrations et la dérive due aux gradients de température ; l'UKF à 17 états et les chemins à couplage serré sont <b>auto-validés</b> (intégration analytique à vitesse constante, convergence de l'aide GNSS, récupération des biais, borne de coupure de 120 s limitée par le CAI, et critère de cohérence χ² NEES/NIS), et la <b>mécanisation</b> à composants liés elle-même est VALIDATED par rapport à NaveGo v1.4 (<c2/> : attitude identique bit à bit, vitesse/position à l'intérieur de bornes analytiques nommées), mais aucune validation croisée au niveau du filtre (NaveGo ou le jeu de données de véhicule KF-GINS) n'a été effectuée

# text
seg-5d4529365f46 = couplage serré sur la phase de la porteuse, observabilité complète des 17 états en trajectoire à manœuvres, bibliothèque de trajectoires, validation croisée au niveau du filtre avec NaveGo/KF-GINS : <b>P2</b>

# text
seg-7d33171c5e26 = <b>Intégrité / RAIM / ARAIM</b> (surveillance autonome avancée de l'intégrité par le récepteur)

# text
# c1: src/raim.rs
# c2: araim_raim
# c3: P_HMI = Σ_k p_fault,k·Q((PL−T_k)/σ_k)
# c4: araim_dual_raim
# c5: P_const = 0
# c6: araim_raim
# c7: IntegritySupportMessage
# c8: integrity
# c9: stanford_svg
# c10: PL=error
# c11: ARAIM_REFERENCE.md
seg-fd0afb948d1f = <b>Vrai RAIM instantané</b> dans <c1/> : solution des moindres carrés + détection de fautes par le χ² des résidus (seuil exact issu d'un χ² à gamma incomplète sans dépendance) et <b>HPL/VPL fondés sur la pente</b> (pbias issu d'un χ² non centré pour les P_fa/P_md configurés) ; <b>RAIM à séparation de solutions (MHSS)</b> avec détection/identification de fautes ; <b>budget de risque d'intégrité ARAIM (P_HMI)</b> (<c2/>) qui résout le plus petit HPL/VPL dont la somme <c3/> respecte une allocation explicite de risque d'intégrité, le <b>mode de faute à l'échelle de la constellation, bi-/multi-constellation</b> (<c4/>, ARAIM TN (note technique) de l'UE (Union européenne) / DO-316 ; <c5/> ⇒ <c6/> identique bit à bit), un <b>message de support d'intégrité</b> explicite (<c7/> : σ_URA/σ_URE/b_nom/P_sat/P_const, avec les valeurs de référence GPS+Galileo du WG-C (WG : groupe de travail)), plus un <b>diagramme d'intégrité de Stanford(-ESA, l'Agence spatiale européenne)</b> (le type de scénario <c8/>, et un moteur de rendu autonome <c9/> des quatre zones + de la frontière <c10/>). Documenté de bout en bout dans <a1><c11/></a1>. Plus l'autocohérence du filtre de la mesure de mérite du scénario (borne à k σ)

# text
# c1: integrity
# c2: integrity_fom
# c3: [integrity]
# c4: raim::snapshot_raim_fde
# c5: raim_fde
# c6: tests/integrity_snapshot_raim_rtklib_oracle.rs
# c7: src/araim_reference.rs
# c8: tests/integrity_araim_stanford_oracle.rs
# c9: raim::araim_raim
# c10: araim_subset_raim
# c11: add_v42_protection_levels_to_order
# c12: araim_dual_raim
# c13: araim_dual
# c14: scenarios/araim-gps-galileo.toml
# c15: araim_dual_constellation_availability
# c16: tests/igs_real_data.rs
# c17: tests/araim_dual_real_data.rs
# c18: xval/araim-m3/
seg-f5fa7c20d28d = Le RAIM est accessible via le type de scénario <c1/> et ({ "0.36" }, facultatif) à côté de la mesure de mérite d'horloge/holdover comme bloc <c2/> distinct (<c3/> : RAIM instantané sur un ciel prédéfini depuis un site indiqué, indisponible tant que le GNSS est refusé ; MODELLED), jamais fondu dans la mesure de mérite du holdover, qui rapporte toujours l'autocohérence ; le RAIM instantané comporte la <b>FDE</b> mono-satellite (détection et exclusion de fautes, <c4/>, VALIDATED par rapport à RTKLIB <c5/> dans <c6/>) ; la séparation de solutions à hypothèses multiples ARAIM ADD v4.2 avec détermination de sous-ensembles multi-satellites se trouve dans <c7/> (VALIDATED par rapport à Stanford MAAST, <c8/>), mais le budget <c9/> à sigma uniforme ne couvre toujours que les fautes à un seul SV et à l'échelle de la constellation et n'est pas conforme à l'ADD ({ "0.36" }, facultatif : fautes simultanées de sous-ensembles multi-SV par la règle de sous-ensemble ADD v4.2 généralisée au-delà des paires, <c10/>, <c11/> ; MODELLED, aucune exécution MAAST au-delà des paires), et l'exclusion multi-SV n'est pas modélisée ; et <c12/> est branché dans l'exécuteur de scénarios TOML via l'option <c13/> (<c14/>), avec un chemin de disponibilité par époque <c15/> ; les cœurs instantané/MHSS/ARAIM sont exercés sur la <b>vraie géométrie d'orbites précises IGS (SP3)</b> (<c16/>) et sur de <b>vrais TLE GPS+Galileo de Celestrak</b> (<c17/>, chaque satellite propagé à une même époque UTC commune, la dernière époque de TLE (jeu d'éléments à deux lignes) du jeu, 2026-06-07T07:{ "21" }:{ "04" }, pour un utilisateur à { "400" } km d'altitude incliné de { "45" }° sur { "24" } h : la disponibilité sous une VAL (limite d'alerte verticale) de { "12" } m / une HAL (limite d'alerte horizontale) de { "10" } m est de { "0.993" } en GPS seul, de { "1.000" } en GPS+Galileo regroupés, et de { "0.990" } dans le mode double robuste aux fautes de constellation ; le chiffre publié précédemment ici, { "0.21" }→{ "0.67" } avec le mode robuste « limité », provenait de la propagation de chaque satellite depuis sa propre époque de TLE, un ciel qui n'a jamais existé, et est retiré) ; la comparaison antérieure avec le « tableau A-3 d'EU-ARAIM-TN » est retirée (aucune source publique), et une reproduction des entrées d'URA maximale de l'étape { "3" } de l'ARAIM du WG-C UE-États-Unis publiée (tableaux { "5" } à { "7" }, lignes Depleted et Baseline) est tentée dans <c18/> avec des écarts déclarés (MODELLED, voir INTEGRITY.md) ; pas certifié DO-229/ARAIM

# text
# c1: raim
# c2: INTEGRITY.md
seg-9a4aff4fb863 = ARAIM multi-fautes (ADD v4.2) : <b>fait</b> ; sous-ensembles multi-SV dans <c1/> + parité gLAB dans le domaine du récepteur + branchement de la mesure de mérite : <b>P2</b> (voir <a1><c2/></a1>)

# text
seg-7244b585a932 = Modélisation des menaces de leurrage / brouillage

# text
# c1: spoof
# c2: src/spoof.rs
# c3: src/detection.rs
# c4: P_fa
# c5: P_md
# c6: 1 − P_md
# c7: jamming
# c8: src/jamming.rs
# c9: Q
# c10: availability_under_jamming
# c11: src/spoof_monitors.rs
# c12: parity_raim_test
# c13: AgcMonitor
# c14: SqmMonitor
# c15: fuse_spoof_layers
# c16: CombinedSpoofDetector
# c17: evaluate
# c18: spoof-detect
# c19: src/spoof_detect.rs
# c20: tests/spoof_texbat_validation.rs
seg-0cf86b61224c = Un <b>détecteur stochastique de leurrage temporel</b> (type <c1/>, <c2/> + <c3/>) : quatre formes d'injection (rampe linéaire, saut en échelon, meaconing, rejeu) face à un moniteur assisté par l'horloge avec un <b>test d'énergie χ²₁ / de Neyman–Pearson</b> bilatéral, le seuil de détection étant fixé à partir d'un budget cible de fausses alarmes <c4/>, et la <b>probabilité de non-détection <c5/> rapportée à la fois en forme fermée et par Monte-Carlo</b> (les deux concordent à quelques ×1/√N près) ; la mesure de mérite de sécurité est <c6/>. Plus un <b>modèle de brouillage par bilan de liaison</b> (type <c7/>, <c8/>) : rapport brouilleur sur signal à partir de la géométrie (affaiblissement en espace libre + gain de l'antenne de réception selon la direction), l'<b>équation standard du C/N₀ effectif anti-brouillage</b> (gain de traitement de désétalement + facteur de séparation spectrale <c9/> ; Kaplan & Hegarty §{ "9.4" }), la perte d'accrochage par satellite à un seuil de poursuite configurable, et une mesure de mérite <c10/> sur une constellation Walker. Plus une <b>suite de moniteurs de leurrage multicouche RF/mesures (RF : radiofréquence)</b> (<c11/>) : un test de parité de <b>cohérence RAIM multi-satellites</b> (<c12/>, SOS (somme des carrés) pondérée des résidus par rapport à un seuil χ²(m−{ "4" }), et il signale correctement qu'un biais de mode commun est invisible au RAIM), un <b>moniteur AGC (commande automatique de gain)</b> (<c13/>, excès de puissance reçue au-dessus du plancher attendu), un <b>moniteur de qualité de signal / SQM (surveillance de la qualité du signal)</b> (<c14/>, déséquilibre des corrélateurs Early/Late), et un combineur de fusion des couches (<c15/>). Ils se composent en un <b><c16/> intégré</b> dont <c17/> ingère une époque d'observables (géométrie + résidus, puissance AGC, prises Early/Late) et exécute les trois couches par la fusion pondérée en un seul appel, en renvoyant les diagnostics par couche ; il est exposé comme <b>scénario <c18/></b> exécutable (<c19/>, accessible depuis la CLI / Python / le bac à sable, JSON + SVG (Scalable Vector Graphics)) et <b>caractérisé par rapport aux paramètres publiés des scénarios TEXBAT (Texas Spoofing Test Battery)</b> (Humphreys et al., ION (Institute of Navigation) GNSS { "2012" } ; <c20/>), en reproduisant le schéma de détectabilité documenté, y compris les résultats négatifs : ds2 surpuissant détecté par AGC + SQM, ds3 à puissance égale par SQM seul, ds4 à poussée de position par RAIM, et ds7 à puissance égale aligné en phase de porteuse laissé (à juste titre) au détecteur assisté par l'horloge

# text
# c1: jamming
# c2: [crpa]
# c3: src/crpa.rs
# c4: [terrain]
# c5: src/jamming_terrain.rs
# c6: [acquisition]
# c7: [front_end]
# c8: src/jamming_rx.rs
# c9: src/iq/channel/multipath.rs
# c10: src/iq/channel/land_mobile.rs
# c11: src/iq/frontend/agc.rs
# c12: jamming
# c13: Q
# c14: navsignal
# c15: CombinedSpoofDetector
seg-e423ffff332b = Le type <c1/> est un <b>bilan de liaison</b> : il n'a ni trajets multiples ni dynamique d'AGC dans le temps. Depuis { "0.36" }, il accepte quatre sections facultatives : <c2/>, un faisceau de réseau adaptatif par canal (annulation de lobe ou MVDR issu de <c3/>, vérifié par un recalcul numpy indépendant ; MODELLED), et <c4/>, la perte par diffraction unique en lame de couteau du trajet du brouilleur au-dessus d'une tuile SRTM (<c5/>, ITU-R P.526-15 §{ "4.1" }, vérifiée par un recalcul numpy indépendant sur une vraie tuile ; MODELLED, une seule lame de couteau), <c6/>, l'hystérésis acquisition contre poursuite, et <c7/>, la lecture d'AGC stabilisée et la perte du quantificateur du CAN pour une entrée gaussienne (<c8/> ; signalée comme non valable pour les brouilleurs non gaussiens ; MODELLED). Les trajets multiples spéculaires, l'évanouissement terrestre mobile et l'AGC existent dans la couche IQ (<c9/>, <c10/>, <c11/>) et ne sont pas branchés dans le type <c12/> ; la table <c13/> de séparation spectrale contient les valeurs de manuel par type (CW et bande étroite { "1" }, large bande et balayé { "2" } depuis { "0.36" }), <b>calée sur les coefficients dérivés des densités spectrales de puissance (DSP)</b> de <c14/> (voir la ligne du signal de navigation). Le détecteur de leurrage assisté par l'horloge est à horloge unique ; les moniteurs RF/mesures sont désormais intégrés (<c15/>) et <b>caractérisés par rapport aux <em>paramètres</em> publiés des scénarios TEXBAT</b> (Humphreys et al.) ; le résiduel est la validation par rapport aux vecteurs <b>bruts</b> : échantillons IQ (en phase/en quadrature) de TEXBAT (qui exigent un frontal d'acquisition/poursuite SDR (radio logicielle) que kshana n'a pas, étant un simulateur et non un récepteur) ou un scénario Spirent sous licence, une suite documentée

# text
seg-34e1b6a6b738 = <b>détecteur combiné</b> assisté par l'horloge + cohérence RAIM multi-SV intégrée + AGC + SQM + caractérisation par les paramètres TEXBAT : <b>fait</b> ; validation sur vecteurs bruts (TEXBAT IQ / Spirent sous licence) : suite

# text
seg-557448077fb0 = Modulation du signal de navigation et performance de poursuite de code

# text
# c1: src/navsignal.rs
# c2: κ = 2/(3R_c)
# c3: κ = ∫ G_s(f)G_i(f) df
# c4: Q
# c5: jamming
# c6: Q = 1/(R_c·κ)
# c7: CodeFamily
# c8: 1/L
# c9: t(n)/L
# c10: φ(2ⁿ−1)/n
# c11: n mod 4 = 0
seg-22893b9a2c7a = <c1/> : le <b>niveau du signal</b> entre le bilan de liaison et le domaine des mesures. <b>Densités spectrales de puissance</b> d'aire unité pour <b>BPSK-R(n)</b> (modulation par déplacement de phase binaire, chips rectangulaires) et <b>sine-BOC(m,n)</b> (porteuse à décalage binaire) (vérifiées en CI à l'aire unité, à la forme fermée du coefficient d'auto-séparation spectrale (SSC) du BPSK <c2/>, et à la répartition spectrale du BOC : nulle à la porteuse, pics à ±f_s) ; le <b>coefficient de séparation spectrale</b> <c3/>, qui <b>dérive désormais le <c4/> anti-brouillage</b> utilisé par <c5/> à partir des spectres réels du signal et du brouilleur (<c6/>) au lieu d'une constante représentative (la référence à large bande est recoupée en CI) ; la <b>largeur de bande RMS (de Gabor)</b> (BOC > BPSK : la mesure de l'information de mesure de distance / de Cramér–Rao) ; la <b>gigue de bruit thermique de la poursuite de code par DLL (boucle à verrouillage de délai) cohérente early–late</b> (Kaplan & Hegarty §{ "8" } : ~sub-métrique pour le C/A à { "45" } dB-Hz, monotone en C/N₀) ; et l'<b>enveloppe d'erreur de trajets multiples</b> (EML (early-minus-late) cohérent, trouvée en localisant le zéro du discriminateur composite : suppression du corrélateur étroit vérifiée). Une couche de <b>compromis de conception des codes de télémétrie</b> (<c7/>) ajoute le lobe secondaire d'autocorrélation périodique des séquences m/Gold (<c8/> pour une séquence m) et la <b>borne d'intercorrélation de Gold <c9/></b> à trois valeurs, en reproduisant l'intercorrélation de Gold publiée du <b>GPS C/A de −{ "23.9" } dB</b> (un repère externe) et le nombre de séquences m <c10/>, plus l'inversion longueur de code↔distance non ambiguë ; les garanties de Gold renvoient honnêtement <em>None</em> là où il n'existe aucune paire préférée (<c11/>), plutôt que de rapporter une borne qui ne tient pas.

# text
# c1: src/iq/
# c2: kshana iq
# c3: design/GNSS-IQ-PLAN.md
seg-b8950c3fb79f = Depuis { "0.31.0" }, la <b>couche IQ</b> distincte (<c1/>, les commandes <c2/> ; conception dans <a1><c3/></a1>) ajoute une chaîne de récepteur logiciel : acquisition par FFT (transformée de Fourier rapide), un banc de poursuite multicanal DLL/PLL/FLL (boucles à verrouillage de délai, de phase et de fréquence), filtrage de frontal et quantification de 1 à 14 bits, et lecture en continu de jeux de données enregistrés. Un récepteur logiciel indépendant retrouve la vérité injectée de ses scènes, et les codes GPS L1 C/A et les bits LNAV (message de navigation historique) sont identiques bit à bit à gps-sdr-sim. Il manque encore : les discriminateurs de boucle supposent le triangle de corrélation BPSK idéal, il n'y a donc pas de levée de l'ambiguïté de poursuite du BOC ; les modèles de canal et de boucle sont MODELLED, contrôlés par rapport à des formes fermées et à la vérité injectée, <b>et non par rapport à de l'IQ de terrain mesuré</b> ; boucles scalaires uniquement (pas de poursuite vectorielle). La conception du <b>matériel</b> d'antenne/de charge utile RF (diagrammes de rayonnement, frontal) est délibérément hors périmètre : c'est le rôle d'un partenaire de charge utile.

# text
seg-a62a0d9aa1d0 = ambiguïté BOC + validation de la couche IQ sur de l'IQ de terrain : P2+

# text
seg-6b974aba070f = Physique des capteurs PNT quantiques

# text
# c1: src/inertial/quantum_imu.rs
# c2: Φ = k_eff·a·T²
# c3: σ_Φ = 1/(C√N)
# c4: q_va
# c5: |H(ω)|
# c6: coriolis_phase
# c7: 2Ω×v
# c8: ac_stark_phase
# c9: cai_drift_sweep
# c10: QuantumNavBudget
# c11: ½·b·t²
# c12: AccelModel
# c13: QUANTUM.md
seg-3773b241a9e5 = La plupart des capteurs sont des <b>coefficients d'Allan/de budget de bruit publiés</b> (CSAC, optique), <b>plus un accéléromètre à interféromètre à atomes froids (CAI) de premiers principes</b> dans <c1/> : la phase de Mach–Zehnder à trois impulsions <c2/>, le bruit de projection quantique (de grenaille) <c3/>, la DSP de marche aléatoire de vitesse dérivée <c4/> que consomme la pile inertielle, la décroissance du contraste, la fonction de transfert aux vibrations <c5/> + variance à DSP blanche, et désormais les systématiques de <b>Coriolis/rotation</b> (<c6/>, biais équivalent <c7/>) et de <b>déplacement lumineux AC-Stark (AC : courant alternatif)</b> (<c8/>, annulation symétrique) + un <b>balayage de dérive</b> du temps de cycle (<c9/>), et un <b>budget d'erreur composé de navigation à l'estime quantique-inertielle</b> (<c10/>) qui réunit la marche aléatoire de vitesse à bruit blanc du CAI avec le biais résiduel (<c11/>, recoupé avec l'intégrateur d'Euler indépendant <c12/>), l'erreur de facteur d'échelle et une dégradation facultative de stabilité à <b>long terme</b> (distincte de la décohérence par tir) en une seule valeur de dérive de position sur le holdover plus un holdover inertiel jusqu'au seuil, le jumeau en navigation à l'estime du holdover d'horloge. Le plancher quantique modélisé est <b>encadré (et non apparié à la parité)</b> par rapport aux { "96" } nm/s²/√Hz du gravimètre mobile de Freier et al. { "2016" } (arXiv:{ "1512.05660" }) : il se situe en dessous et à moins de ~{ "2" } ordres de grandeur. Documenté dans <a1><c13/></a1>

# text
# c1: max_unambiguous_accel
# c2: dynamic_range_cells
# c3: src/inertial/quantum_imu.rs
seg-3aafb8938d9d = Systématiques de front d'onde et de pointage du faisceau non modélisées ; la <em>limite</em> d'ambiguïté de frange de Mach–Zehnder est modélisée (<c1/>, <c2/> dans <c3/>), mais la levée de l'ambiguïté ne l'est pas ; les budgets exacts d'essais en vol CARIOQA-PMP (CARIOQA : Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry) / Boeing-AOSense (qui exigent des DSP de plateforme publiées + un SNR (rapport signal sur bruit) par tir) et un préréglage JS (JavaScript) du bac à sable restent à faire

# text
# c1: QUANTUM-MODELS.md
seg-aff11d135951 = systématiques de front d'onde + reproduction d'essais en vol : P2+ (<a1><c1/></a1>)

# text
# c1: src/walker.rs
# c2: tests/igs_real_data.rs
# c3: {planes × sats × inclination}
# c4: constellation-design
# c5: optimize_walker_design
# c6: MinSatellitesForCoverage
# c7: MaxCoverage
# c8: MinWorstPdop
# c9: coverage_half_angle_rad
# c10: street_half_width_rad
seg-59e99de860b2 = Walker synthétique (à la fois képlérien analytique <b>et éléments moyens SGP4</b>, ce dernier propagé par le cœur validé à { "4.12" } mm : <c1/>) + visibilité et DOP multi-constellation à partir de vrais TLE (GPS+Galileo à { "100" } %), validés par rapport à un <b>vrai instantané Celestrak gps-ops</b> (<c2/>) ; un <b>balayage de conception du PDOP (dilution de précision de position)</b> sur la grille <c3/> et des mesures de mérite de <b>fraction de couverture / temps de revisite</b> ; le <b>type <c4/></b> exécutable (motifs Walker delta et star dans la convention i : T/P/F, listes d'éléments explicites, conceptions multi-coques et préréglages publiés, autour de la Terre, de la Lune, de Mars ou de tout autre corps catalogué) dont la géométrie Walker et les créneaux publiés de GPS, Galileo et GLONASS sont VALIDATED par rapport aux tableaux publiés et dont la dilution de précision GPS de référence mondiale est VALIDATED par rapport à la norme de performance du service de positionnement standard GPS, tandis que les cartes de couverture pour des conceptions arbitraires restent MODELLED ; un <b>optimiseur de conception sans gradient</b> (<c5/>) qui explore la grille pour trouver la meilleure conception selon un objectif choisi (<c6/> / <c7/> / <c8/>), validé pour renvoyer le vainqueur par force brute ; et la <b>géométrie analytique des rues de couverture</b> (<c9/>, <c10/> ; formes fermées de Rider/Beste, vérifiées à la main : GPS avec un masque de { "5" }° : λ ≈ { "71.2" }°, demi-largeur de rue à 4 satellites ≈ { "62.8" }°)

# text
# c1: walker::StreetsCoverageDesign
# c2: web/studio/lib/orbit3d.mjs
# c3: --export czml
# c4: tests/dop_reference.rs
# c5: tests/coverage_dop_full_oracle.rs
seg-475e6559da9e = Un dimensionnement idéalisé en <b>nombre minimal de satellites par rues de couverture</b> existe (<c1/>) ; la correction de Rider exacte à la couture, à la frontière de plans en contre-rotation, n'est pas mise en œuvre ; le bac à sable dessine une vue 3-D d'orbites sans dépendance (<c2/>), et un export CZML (Cesium Language), <c3/>, charge la géométrie dans le globe CesiumJS ; le noyau DOP est VALIDATED par rapport à gnss_lib_py (<c4/>), et la chaîne complète de visibilité multi-constellation est recoupée de bout en bout par rapport à Orekit { "12.2" } + gnss_lib_py (<c5/>) : les conceptions terrestres concordent sur chaque seuil, mais les conceptions lunaires et martiennes manquent le seuil DOP sur une géométrie numériquement singulière, de sorte que la ligne reste MODELLED ; « haut » géodésique contre géocentrique dans le référentiel du DOP

# text
seg-3fcc2a2a90ba = dimensionnement par rues de couverture + vue d'orbites 3-D + contrôle croisé terrestre de bout en bout : <b>fait</b> ; correction de Rider exacte à la couture + DOP mal conditionné hors de la Terre : P2

# text
seg-afd5b595ee5e = Vérification et validation

# text
# c1: VERIFICATION-MATRIX.md
# c2: src/verification.rs
seg-9b04e0af2559 = Contrôles par référence externe sur tout le moteur (SGP4 par rapport à { "666" } vecteurs AIAA, la famille d'Allan par rapport à Stable32 et allantools, les référentiels par rapport à SOFA/ERFA, le modèle de forces et la détermination d'orbite par rapport à Orekit, l'ARAIM par rapport à l'exemple détaillé du WG-C, et d'autres ; le décompte à jour figure dans l'en-tête généré de <a1><c1/></a1>) ; contrôles d'Allan déterministes ; une <b>matrice de vérification contrôlée par machine</b> (<c2/>), un référencement croisé exigence→module→test→référence→état dont les invariants d'honnêteté sont <b>testés unitairement</b> : une ligne ne peut être libellée <em>validée</em> que si elle porte une référence <b>externe</b> indépendante (valeur NIST/AIAA/SOFA/IGS/publiée), de sorte qu'un contrôle interne d'autocohérence ne puisse pas se faire passer pour une validation ; produit du Markdown/CSV (valeurs séparées par des virgules) pour un référencement croisé de vérification ECSS-E-ST-10-02 (ECSS : European Cooperation for Space Standardization), et consigne comme tels les quatre manques matériels/PA (PA : assurance produit) relevant du partenaire

# text
# c1: CALIBRATION-ENSEMBLES.md
# c2: tests/verification_rows_name_a_test_that_exists.rs
# c3: tests/verification_rows_cite_evidence_that_exists.rs
# c4: tests/published_figures_still_reproduce.rs
seg-71387f67f6ad = Les ensembles d'étalonnage couvrent pour l'instant trois contrôles à graine unique (<a1><c1/></a1>, fixés à l'avance : l'intervalle bootstrap Monte Carlo couvre pour { "96" } % de { "200" } graines ; une tolérance de percentile est fragile selon la graine, NOT MET à { "91.5" } %) ; les autres lignes sont encore étalonnées sur des graines uniques. La matrice impose la <em>classification</em> des lignes, et la CI vérifie désormais aussi que chaque test, fichier et élément du crate qu'une ligne cite existe (<c2/>, <c3/>) et que les chiffres publiés se reproduisent encore (<c4/>) ; elle ne note pas la référence elle-même, qu'un relecteur lit encore

# text
seg-d3b92a831cd9 = ensembles d'étalonnage : P1

# text
seg-f382bb1b5d54 = LEO-PNT (positionnement, navigation et synchronisation temporelle depuis l'orbite terrestre basse)

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-navmsg
# c4: leo-pvt
# c5: leo-ppp
# c6: ntn-positioning
# c7: leo-pnt-chain
seg-e8ba6003d04e = Sept types, indépendants du système, avec des préréglages publics nommés : <b><c1/></b> (conceptions de signaux de toute bande et structure : composantes BPSK, BOC, MBOC (BOC multiplexé) ou plates de type OFDM (multiplexage par répartition orthogonale de la fréquence), poursuite de code, acquisition, compatibilité GNSS, compromis de bande), <b><c2/></b> (un passage conçu, par éléments, TLE ou Walker, avec un bilan de liaison par bande : pluie, scintillation et perte d'entrée dans les bâtiments de l'ITU-R (Secteur des radiocommunications de l'Union internationale des télécommunications), ionosphère, antenne, Doppler, par rapport aux satellites GNSS MEO (orbite terrestre moyenne) en vue), <b><c3/></b> (éphéméride et horloge diffusées sur la base képlérienne de l'ICD (document de contrôle d'interface) Galileo ou sur des modèles LEO sélectionnables, ajustés et codés avec un contrôle de trame CRC-24Q (contrôle de redondance cyclique sur 24 bits)), <b><c4/></b> (positionnement fusionné MEO + LEO par pseudodistance et Doppler sur n'importe quelles constellations), <b><c5/></b> (convergence du PPP avec et sans augmentation LEO, sur des mesures simulées), <b><c6/></b> (bornes de positionnement 5G NTN, réseau non terrestre, à partir de la largeur de bande du signal), et <b><c7/></b> (un système de bout en bout, la sortie de chaque étage étant transmise au suivant). Éléments VALIDATED : les termes de liaison de l'ITU-R par rapport aux tableaux et aux exemples de validation des Recommandations, le Doppler maximal par rapport à un tableau publié, l'algorithme utilisateur Galileo par rapport à RTKLIB à { "1" } mm près, le CRC-24Q, les poids du SISRE (erreur de distance du signal dans l'espace)

# text
seg-5f87d4e409d5 = Aucune donnée de terrain ni aucun signal enregistré ; les chiffres de positionnement, de PPP, de NTN et de synchronisation temporelle sont MODELLED (formes fermées, cohérence du filtre, comparaisons de tendances publiées) ; les préréglages proviennent de sources publiques ou sont dérivés, et ne sont pas des données d'opérateur

# text
seg-d29a58fe2c84 = validation sur de vrais signaux enregistrés : P3

# text
seg-4ea6f7ecc4a7 = Spectre / environnement RF

# text
# c1: spectrum
# c2: src/spectrum.rs
seg-cdf2b88d50c4 = <b>type <c1/></b> (<c2/>) : la bande L du GNSS (et les conceptions multibandes en ultra haute fréquence (UHF), bandes S et C) sous forme d'une densité spectrale de puissance, fréquence en abscisse et temps en descendant, sous une chronologie de brouilleurs scénarisée (brouilleurs à onde continue, à bande étroite, chirp et à large bande apparié), avec J/S (rapport brouilleur sur signal) et C/N₀ effectif (rapport porteuse sur densité de bruit) par bande ; enregistrements SigMF en entrée et en sortie et estimations spectrales de Welch d'échantillons complexes. Les spectres de signaux en forme fermée et les coefficients de séparation spectrale sont VALIDATED ; la cascade est MODELLED

# text
seg-970852c2e2e8 = Signaux GLONASS, BeiDou et Galileo E6 non modélisés ; ni frontal de récepteur ni validation sur IQ (en phase/en quadrature) enregistré

# text
seg-5402957c3eb5 = comparaison à des signaux enregistrés : P3

# text
seg-a5e741fa9d69 = Confiance dans le journal de récepteur (navire et général)

# text
# c1: src/receiver_trust/
# c2: $PKSHT
seg-70f0191f1cc7 = <c1/> : moniteurs sur le propre journal d'un récepteur (rapport porteuse sur densité de bruit, cohérence de position, de vitesse et de cap, temps) avec des événements et des prédictions énoncés avant l'exécution ; sur une plateforme navire, un score de 0 à 100 avec ses raisons ; mode en direct sur un flux avec la phrase <c2/> et une porte facultative. MODELLED ; à titre consultatif, pas un équipement de navigation homologué

# text
seg-810132d58fbf = Les seuils sont des valeurs par défaut indiquées, non mesurées par rapport à des récepteurs déployés ; un journal ne note que ce journal ; aucune entrée ni sortie radiofréquence ; pas un équipement de navigation homologué

# text
seg-82017a0ec045 = Paquets de preuves et télémétrie de confiance

# text
# c1: src/evidence/
# c2: src/telemetry/
seg-d141f3da7bfc = <c1/> : un paquet signé et chaîné par hachage d'une fenêtre de journal, de sa configuration et du résultat du moteur, vérifiable hors ligne, avec un jeton d'horodatage RFC { "3161" } facultatif. <c2/> : le flux de confiance sous forme de métriques Prometheus, d'événements syslog (CEF ou LEEF) et, en option, d'OpenTelemetry, avec un exemple de tableau de bord Grafana

# text
seg-9d2138e7a040 = Un paquet est un enregistrement technique, pas un avis juridique, et il n'indique pas ce qui a causé un événement ; la signature de l'autorité d'horodatage n'est pas vérifiée ; la télémétrie ne transmet que de la télémétrie

# text
seg-744f186bdf09 = Flux de formation des équipages et cartes d'interférences

# text
# c1: src/nmea_synth/
# c2: src/interference_map/
seg-a3aee0c6d9f2 = <c1/> : NMEA synthétique pour un pont, avec des événements scénarisés de brouillage, de décrochage progressif (drag-off), de leurrage temporel et de rejeu, et un journal d'instructeur (texte seul). <c2/> : cartes agrégées de navigation dégradée issues de rapports d'aéronefs et de navires sous licence ouverte et exposition d'un itinéraire, à partir de fichiers locaux

# text
seg-91174c1a81be = Les flux sont des données de formation, jamais destinées aux systèmes de navigation en direct d'un navire ; les cartes sont agrégées, ne sont pas une prévision, et dépendent des rapports fournis

# text
# c1: src/interop/testbench.rs
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
seg-1f8768df4060 = <c1/> : le mouvement du véhicule et les événements d'un scénario <c2/>, <c3/> ou <c4/> sous forme de CSV de mouvement, de NMEA, de texte de points de passage et de fichiers d'événements pour un simulateur GNSS de laboratoire

# text
seg-e5aa0f32fb2a = Aucun signal n'est écrit ; aucune performance de simulateur ou de récepteur n'est revendiquée ; les fichiers sont contrôlés tels que relus par les lecteurs de mouvement d'un simulateur libre (gps-sdr-sim), mais la physique de la trajectoire de vérité propre au scénario n'est pas contrôlée en externe

# text
# c1: src/osnma/
# c2: kshana osnma verify
# c3: osnma_verify
seg-57b9e81057b4 = <c1/> et <c2/> : lit des pages I/NAV de Galileo ou un flux UBX et indique, par satellite et par époque, si les données de navigation sont authentifiées (clé signée à racine de Merkle, chaîne TESLA, MAC), avec la raison de l'échec d'un contrôle et un temps de référence indépendant facultatif pour la fraîcheur ; aussi <c3/> en Python et en WebAssembly

# text
seg-0e782e8a2775 = Authentifie des données par rapport aux clés fournies par l'utilisateur ; ne revendique aucune performance anti-leurrage et n'est ni un service d'intégrité de navigation ni un équipement homologué ; contrôlé sur des vecteurs synthétiques, les vecteurs de test officiels de l'ICD sont un téléchargement externe

# text
seg-98d0bc6b40ce = Cartographie de compliance avec des cadres publics

# text
# c1: src/compliance/
# c2: kshana compliance-report
seg-712affa3fd05 = <c1/> et <c2/> : sorties de Kshana associées à six cadres et normes publics de résilience, avec des sources et un écart sur chaque ligne ; une exécution ne compte que si son résultat porte les champs que son type écrit

# text
seg-50652c747b6a = Une cartographie est un jugement ; le rapport indique ce qu'un ensemble d'exécutions apporte des éléments de preuve en faveur de, jamais qu'un cadre est atteint ni qu'un produit est approuvé ; EN { "16803" } n'est cité qu'à partir du texte du catalogue

# text
# c1: integrations/
# c2: deploy/
seg-9e0206b8ca6f = Un plugin Signal K, OpenCPN via du NMEA en mode passerelle sur TCP, et une version de référence pour un petit ordinateur à côté du récepteur (<c1/>, <c2/>)

# text
seg-0fbabb37bc88 = Testé sur une sortie synthétique enregistrée ; le plugin n'est pas publié sur npm ; à titre consultatif, pas un équipement de navigation homologué

# text
seg-8281218f1c7c = Domaines plus larges des systèmes spatiaux (hors périmètre aujourd'hui)

# text
# c1: partial
seg-b564e0b42adc = Plusieurs d'entre eux sont <b>aucun</b> ; d'autres sont désormais des <b>modèles <c1/> de premier ordre</b> (les types d'analyse de mission / d'environnement ajoutés dans la série { "v0.17.0" }) : listés pour que le périmètre soit sans ambiguïté, et non sous-entendu par le silence. Kshana est un simulateur PNT, pas GMAT/STK/Orekit (STK : Systems Tool Kit) ; ces modèles adjacents sont délibérément de premier ordre et MODELLED, jamais des outils de vol validés.

# text
seg-8125b00a48e4 = Note / feuille de route

# text
seg-6779cc4a0e99 = Conception de mission / optimisation de trajectoire

# text
# c1: src/maneuver.rs
# c2: maneuver::lambert_multirev
# c3: tests/lambert_multirev_oracle.rs
# c4: maneuver::porkchop_kernel
# c5: tests/porkchop_de440_oracle.rs
# c6: maneuver::optimise_transfer_kernel
# c7: tests/transfer_optimiser_oracle.rs
# c8: src/ephem_provider.rs
# c9: xval/anise-mars-od
seg-3c1a80170fd5 = <c1/> : nœuds de ΔV impulsionnels avec propagation de covariance { "6" }×{ "6" } (référentiels d'erreur d'exécution ECI/LVLH (ECI : inertiel centré sur la Terre ; LVLH : verticale locale, horizontale locale)), intégration de poussée finie contrôlée par rapport à l'équation de <b>Tsiolkovski</b> en forme fermée à < { "0.01" } %, un solveur de <b>Lambert à une révolution d'Izzo-2015</b> + un <b>propagateur de Kepler</b> exact à variables universelles (sorties de Lambert vérifiées en aller-retour par rapport à la vérité à deux corps), et un balayage <b>porkchop</b> (lancement × arrivée) C3 / V∞ d'arrivée émis sous forme de grille de contours JSON dont le minimum est contrôlé par rapport au plancher analytique de Hohmann. <b>Pas d'optimiseur de trajectoire</b> ; un solveur de <b>Lambert multi-révolutions</b> (<c2/>, jusqu'à trois révolutions, les deux branches) est VALIDATED par rapport à pykep { "3.0.1" } (<c3/>) ; le porkchop s'exécute sur le modèle synthétique coplanaire circulaire ou, avec <c4/>, sur un SPK DE440 (VALIDATED par rapport aux états SPICE + au Lambert de pykep, <c5/>) ; <c6/> trouve l'optimum continu de date (C3 minimal ou V∞ d'arrivée minimal, type I ou II) sur DE440, VALIDATED par rapport à un optimiseur indépendant SPICE + pykep + SciPy (<c7/>) ; par rapport aux minima Terre–Mars publiés de NASA/TM-2010-216764 { "2026" }, il concorde avec les valeurs du type II et manque le C3 minimal du type I de −{ "5.18" } % (consigné). GMAT lui-même n'a pas été exécuté ; pykep est la référence de bibliothèque. Une <b>interface d'éphéméride planétaire</b> pour l'espace lointain (<c8/>) et une <b>validation croisée DE440 (Development Ephemeris { "440" })</b> (<c9/>, { "137" } m @ arc martien de 1 jour) existent désormais ; voir la ligne PNT espace lointain / interplanétaire. La couche de simulation de performance au-dessus de GMAT/Orekit, pas un remplacement. P3

# text
seg-e42e299359d6 = AOCS (système de contrôle d'attitude et d'orbite) / GNC (guidage, navigation et contrôle) / attitude

# text
# c1: attitude-budget
# c2: src/attitude_budget.rs
# c3: 1.5·(μ/R³)·ΔI
# c4: src/attitude_dynamics.rs
# c5: tests/attitude_dynamics_basilisk_oracle.rs
# c6: tests/attitude_gg_torque_basilisk_oracle.rs
# c7: src/wahba.rs
# c8: aocs
# c9: src/aocs.rs
# c10: src/aocs_kind.rs
# c11: AOCS.md
# c12: src/aocs_mekf.rs
seg-a1bccf1c2e01 = type <c1/> (<c2/>) : <b>couple de gradient de gravité</b> <c3/> au pire cas + <b>budget d'erreur de pointage RSS (racine de la somme des carrés)</b> sur des termes à 1σ par contributeur : un budget scalaire de pointage/perturbation avant matériel, MODELLED. La <b>dynamique d'attitude de corps rigide</b> sans couple, avec un état par quaternion (<c4/> : équations d'Euler + cinématique des quaternions, RK4) est VALIDATED par rapport au moyeu de vaisseau spatial de Basilisk { "2.9.1" } (<c5/>, quaternion à { "1e-9" } près sur { "1e4" } s), et le pic de couple de gradient de gravité par rapport au GravityGradientEffector de Basilisk (<c6/>) ; la détermination d'attitude de Wahba se trouve dans <c7/>. <b>Type <c8/></b> (<c9/>, <c10/>, <a1><c11/></a1>) : une manœuvre d'orientation à pointage inertiel avec des roues à réaction équilibrées sous rétroaction MRP, des couples de roues de norme minimale avec limites de moteur ; la boucle fermée est <b>VALIDATED</b> par rapport à Basilisk { "2.9.1" } sur trois cas fixés à l'avance, à l'arrondi près. Un MEKF à partir d'un gyromètre et d'un suiveur d'étoiles (<c12/>) peut fermer la boucle sur son estimation (MODELLED, cohérence du filtre). Pas de guidage de poursuite, de rétroaction intégrale, de gestion du moment cinétique, de magnétocoupleurs, de propulseurs, de frottement des roues ni de limites de vitesse ; pas d'environnement de couples externes dans la dynamique d'attitude ; pas un contrôleur de vol. P3

# text
seg-eb137d279247 = Référentiels → liés à la Terre

# text
seg-c45f5e2f4bec = <b>Fait</b> : TEME→ECEF/ITRF, le mouvement du pôle et la chaîne GCRS→ITRS fondée sur le CIO sont mis en œuvre et VALIDATED (bit à bit par rapport à SOFA/ERFA ; { "4" } mm de bout en bout par rapport à Vallado). Voir la ligne <b>Référentiels</b> ci-dessus

# text
seg-aa268d6f1635 = Communications et bilans de liaison

# text
# c1: src/linkbudget.rs
# c2: src/timetransfer*.rs
# c3: link-budget
# c4: C/N₀ = EIRP − FSPL − L_other + G/T − k
seg-411d492c4673 = <c1/> : un <b>bilan de liaison de Friis pour l'espace lointain</b> (puissance d'émission · gains d'antenne · bruit → C/N₀ · Eb/N₀ · marge) alimentant le chemin radiométrique/GSE (GSE : équipement de soutien au sol), plus les liaisons de transfert de temps optiques/RF (<c2/>), et le <b>type <c3/></b> exécutable : l'équation de liaison unidirectionnelle CCSDS-401/DSN-810-005 (DSN : Deep Space Network) <c4/> avec des entrées <b>EIRP (puissance isotrope rayonnée équivalente) / G-T</b> et la sélection de bande S/X/Ka (bilan de liaison d'ingénierie MODELLED, pas une fiche technique de terminal étalonné). Pas de planification d'accès, pas de codage adaptatif. P2

# text
seg-cd6f9d8d0dc2 = Segment sol et opérations

# text
# c1: passes
# c2: src/passes.rs
# c3: tests/pass_predictor_on_path_orekit_oracle.rs
# c4: passes::predict_passes
# c5: tests/ground_station_pass_prediction_reference.rs
seg-42b2427525e4 = type <c1/> (<c2/>) : <b>prédiction des passages de lever/coucher en station au sol</b> : AOS/TCA/LOS (AOS : acquisition du signal ; TCA : instant de rapprochement maximal ; LOS : perte du signal), élévation maximale, durée de chaque passage et accès total sur un horizon, à partir d'un jeu d'éléments SGP4 dans le référentiel terrestre IAU 2006/2000A avec la réfraction ITU-R P.834-9 et le temps de lumière, <b>VALIDATED par rapport à Orekit { "13.1.8" }</b> pour des stations au niveau de la mer ({ "60" } cas / { "1210" } passages, <c3/>) ; la fonction géométrique <c4/> est VALIDATED par rapport au détecteur d'élévation d'Orekit { "12.2" } ({ "22" } scénarios / { "129" } passages, <c5/>) ; pas d'optimiseur de planification ni de résolution de conflits. P3

# text
seg-ec6ce48c783e = Télémétrie / TT&C / CCSDS

# text
# c1: oem-interop
# c2: src/oem.rs
# c3: parse_oem
# c4: oem
# c5: src/ccsds_tdm.rs
# c6: space-packet
# c7: src/space_packet.rs
# c8: src/omm.rs
# c9: src/naif_kernel.rs
# c10: ephem_provider::KernelEphemeris
seg-4f1158386205 = TOML en entrée/JSON en sortie sur mesure ; <b>export <em>et import</em> CCSDS OEM (Orbit Ephemeris Message)</b> (502.0-B KVN (notation clé-valeur), GMAT/Orekit/STK) via le <b>type <c1/></b> exécutable (pont aller-retour <c2/> <c3/> ; l'échange d'un objet unique respectant le format est <b>VALIDATED</b> par rapport à l'analyseur indépendant <c4/> { "0.4.5" }) ; <b>analyse + émission du Tracking-Data-Message CCSDS-TDM ({ "503" })</b> (<c5/>, le format d'échange radiométrique de l'espace lointain) ; et le <b>type <c6/></b> (<c7/>) : encodage/décodage de l'en-tête primaire du <b>Space Packet CCSDS 133.0-B</b> avec un aller-retour exact au bit près. Un écrivain <b>CCSDS OMM</b> (Orbit Mean-Elements Message, 502.0-B-2, de la famille ODM) (<c8/>) publie des éléments moyens SGP4 en KVN, et un <b>lecteur de noyaux NAIF SPICE</b> en Rust pur (<c9/> : conteneur DAF, SPK de type { "2" }, PCK binaire de type { "2" }) alimente <c10/>. Les autres types de messages CCSDS (OPM, OCM, AEM (AEM : Attitude Ephemeris Message)) et l'<em>écriture</em> SPICE restent un point de la feuille de route (P2)

# text
seg-a3e6c2c5e7df = Interopérabilité et normes (RINEX/SP3/SPICE/CCSDS)

# text
# c1: Propagator::Sp3Precise
# c2: kshana <orbit.toml> --export-sp3 out.sp3
# c3: export_sp3 = true
# c4: tests/sp3_export_roundtrip.rs
# c5: kshana <orbit.toml> --export-oem out.oem
# c6: export_oem = true
# c7: tests/sp3_export_roundtrip.rs
# c8: pvt
# c9: src/ccsds_tdm.rs
# c10: --export
# c11: src/interop/
# c12: tests/interop_formats.rs
# c13: --import-route
# c14: spectrum
# c15: INTEROP.md
# c16: STANDARDS.md
# c17: oem-interop
# c18: src/omm.rs
# c19: src/naif_kernel.rs
seg-b41f3b5644a8 = RINEX { "3" } <b>NAV multi-GNSS</b> : GPS, Galileo, QZSS, BeiDou MEO/IGSO (IS-GPS-200) <b>et GLONASS</b> (RK4 sur vecteur d'état PZ-90 (PZ : Parametry Zemli, le datum géodésique russe)), ingéré + propagé + exécutable comme une constellation mixte ; <b>analyseur d'OBSERVATIONS RINEX { "3" }</b> (pseudodistance/porteuse/Doppler/SNR par code d'observation, avec les indicateurs LLI/SSI (LLI : indicateur de perte d'accrochage ; SSI : indicateur de force du signal) ; { "4.00" } devrait être analysé, non testé) ; <b>aller-retour lecture ↔ écriture</b> d'éphémérides précises SP3-c/d (analyse + export pour Ginan/RTKLIB/gLAB) <b>et propagateur de Lagrange d'ordre 10 (11 points)</b> (<c1/>) ; l'export SP3 est <b>exposé en CLI</b> (<c2/>, ou <c3/>) et <b>validé en aller-retour</b> par rapport à la vraie constellation GPS à <{ "0.5" } m sur { "24" } h (<c4/>) ; <b>écrivain d'éphémérides CCSDS OEM { "2.0" }</b>, l'export d'état TEME porteur de la vitesse pour les outils de dynamique du vol, désormais <b>exposé en CLI</b> (<c5/>, ou <c6/>) et contrôlé en aller-retour par rapport à l'état du propagateur (<c7/>). L'<b>analyseur d'observations RINEX alimente désormais une solution de positionnement par point unique</b> (<c8/>, validée sur de vraies données IGS ; voir la ligne GNSS / PNT). Plus l'<b>analyse + émission de messages de données de suivi CCSDS-TDM ({ "503" })</b> (<c9/>). Exports de géométrie pour les visualiseurs et les outils d'analyse de mission : <b>CZML, KML (Keyhole Markup Language), GeoJSON et éphémérides STK</b> (<c10/>, <c11/>), chacun relu par un validateur écrit à partir de la spécification du format (<c12/>), un import d'itinéraire GeoJSON (<c13/>), des enregistrements <b>SigMF</b> (Signal Metadata Format) en entrée et en sortie pour le type <c14/>, et du texte de style RINEX-4 / CSV pour le message de navigation LEO (<a1><c15/></a1>, <a2><c16/></a2>). Pas de BeiDou-GEO, pas de fixation d'ambiguïté entière en PPP ni de RTK cinématique (un PPP flottant statique et un RTK à courte ligne de base sur données réelles existent, voir la ligne GNSS / PNT), pas encore d'écrivain SPICE ni d'OPM/AEM (le <b>lecteur OEM</b> existe via le type <c17/>, l'<b>écrivain OMM</b> dans <c18/>, et un <b>lecteur SPICE SPK/PCK</b> dans <c19/>) : <b>P2</b> « annexer les domaines adjacents via des formats standard »

# text
seg-437dbb962136 = Météorologie spatiale / environnement (iono/atmo/rayonnement)

# text
# c1: space-weather
# c2: src/space_weather.rs
# c3: src/ionex.rs
# c4: CODG1330.18I
# c5: tests/geometry_free_tec_gim_oracle.rs
# c6: src/ionex.rs
seg-74ba8b523842 = type <c1/> (<c2/>) : indices solaires/géomagnétiques (table à 28 pas <b>Kp↔ap</b> de l'IAGA (Association internationale de géomagnétisme et d'aéronomie), Ap quotidien, <b>F10.7a</b> centré sur 81 jours), <b>température exosphérique de Jacchia-71</b>, et un <b>couplage de densité thermosphérique piloté par l'activité</b> sur une atmosphère statique : MODELLED au premier ordre, <b>PAS</b> un modèle de densité absolue NRLMSISE. Ionosphère : le modèle diffusé de Klobuchar (VALIDATED par rapport à RTKLIB) et un lecteur de cartes de TEC (contenu électronique total) IONEX (format d'échange de cartes de l'IONosphère) (<c3/>, testé unitairement). Une vraie carte ionosphérique globale CODE (<c4/>) est la référence mesurée de la ligne de TEC oblique sans géométrie (<c5/>), mais ce test évalue la carte dans son propre générateur de jeu d'essai, de sorte que le lecteur <c6/> lui-même n'est pas encore recoupé avec un vrai produit ; aucun modèle d'ionosphère fondé sur la physique ou piloté par la météorologie spatiale ; P2+

# text
seg-78a2c5a930e8 = Navigation par carte de gravité / alt-PNT

# text
# c1: src/gravimeter.rs
# c2: σ = ASD/√τ
# c3: mapmatch
# c4: particle_filter
# c5: run_gps_denied_gravity_nav
# c6: scenarios/gps-denied-gravity-nav.toml
# c7: src/igrf.rs
# c8: igrf14coeffs.txt
# c9: src/altpnt/terrain.rs
# c10: .hgt
# c11: run_terrain_nav
# c12: run_combined_altpnt
# c13: src/altpnt/sequential.rs
# c14: run_sequential_trn
# c15: particle_filter
# c16: kind=
# c17: gravity-map
# c18: terrain-nav
# c19: combined-altpnt
# c20: terrain-slam
# c21: scenarios/terrain-nav.toml
# c22: scenarios/combined-altpnt.toml
# c23: scenarios/terrain-slam.toml
# c24: gravity-map
# c25: [reference]
# c26: .gfc
# c27: xval/icgem-egm2008/
# c28: [map_error_mc]
# c29: scenarios/gravity-map-error-mc.toml
# c30: combined-altpnt
# c31: [magnetic_grid]
# c32: terrain-nav
# c33: combined-altpnt
# c34: terrain-nav
# c35: combined-altpnt
# c36: xval/srtm-ungate/
# c37: run_sequential_trn_on_map
# c38: xval/terrain-slam-rbpf/
seg-431b3f05c08c = <c1/> : un <b>modèle de mesure de gravimètre</b> à atomes froids dont le plancher de bruit blanc est dérivé de l'ASD de l'accéléromètre CAI (<c2/>), un <b>champ d'anomalie de gravité en harmoniques sphériques pleinement normalisées</b> de bas degré (validé par rapport aux fonctions de Legendre en forme fermée et à une anomalie à un seul terme dérivée à la main) plus des <b>mascons</b> synthétiques, et un <b>filtre particulaire d'appariement de cartes de gravité</b> (composant <c3/> + <c4/>) qui retrouve une trace sans GPS à partir de la séquence d'anomalies qu'il survole. Le <b>banc d'essai de 60 minutes sans GPS</b> (<c5/>, <c6/>) fait voler une coupure d'environ { "700" } km / une heure pendant laquelle la solution inertielle dérive jusqu'à <b>≈ { "70" } km</b>, et un appariement <b>hiérarchique du grossier au fin</b> avec le bruit blanc à graine déterministe du gravimètre la retrouve à <b>≈ { "145" } m (< { "500" } m)</b> : stable d'une réalisation du bruit à l'autre, et manifestement limité par le raffinement (une seule grille grossière cale à ~{ "2" } km). Plus un <b>modèle complet du champ principal géomagnétique IGRF-14 (IGRF : International Geomagnetic Reference Field)</b> (<c7/> : le champ en harmoniques sphériques normalisées de Schmidt de l'IAGA jusqu'au degré/ordre { "13" }, { "2025.0" } + variation séculaire, coefficients générés par machine à partir du <c8/> officiel ; validé par rapport au dipôle incliné en forme fermée, à une différence finie du potentiel scalaire, et au pôle/à l'intensité géomagnétiques connus), le champ magnétique qu'une plateforme peut apparier à une carte pour la navigation par anomalies magnétiques. Plus la <b>navigation par référence au terrain (TERCOM/SITAN (TERCOM : appariement de contours de terrain ; SITAN : Sandia Inertial Terrain-Aided Navigation))</b> et le <b>navigateur combiné gravité + magnétisme + terrain</b> (<c9/>) : un analyseur fait maison de modèle numérique de terrain (MNT) SRTM (Shuttle Radar Topography Mission) <c10/> (entiers signés de 16 bits gros-boutistes, ligne par ligne, rangée nord d'abord, vide -32768 ; validé par rapport à la spécification du pilote GDAL (Geospatial Data Abstraction Library) SRTMHGT (format de fichier de hauteur de la Shuttle Radar Topography Mission) et à une référence en forme fermée de point médian bilinéaire), un modèle d'<b>altimètre</b> radar/barométrique et un apparieur <c11/> qui retrouve une trace sans GPS à partir du profil d'altitude du sol par rapport au MNT, et <c12/> qui fusionne <b>trois canaux de champ scalaires</b> par point de passage (Δg mGal · |B| nT anomalie crustale · altitude m) de sorte que la distribution a posteriori conjointe est plus nette (CRLB (borne inférieure de Cramér–Rao) plus basse) que celle de n'importe quel champ seul : bornée à < { "500" } m sur la coupure de 60 min et, en espérance, pas pire que le meilleur canal seul. Plus la <b>navigation séquentielle (récursive) par référence au terrain, SITAN comme filtre continu</b> (<c13/>, <c14/>) : le même modèle de mesure altimètre/MNT exécuté <b>époque par époque</b> par le moteur SIR (rééchantillonnage par importance) de <c15/> (prédiction par l'incrément INS + bruit de processus → repondération par l'appariement au terrain → rééchantillonnage en cas de dégénérescence), de sorte qu'une dérive INS <b>variable dans le temps</b> est <em>suivie</em> le long de la trace là où l'apparieur par lots ne retrouve qu'un décalage constant unique : l'estimation récursive reste bornée et reconverge (final ≈ { "70" } m) tandis que la solution non assistée diverge sans borne jusqu'à ≈ { "5" } km, avec une erreur par époque qui suit le caractère distinctif du terrain et un moniteur de santé de la taille effective d'échantillon. Périmètre honnête : la carte est <b>connue et fixe</b> : <em>localisation</em> récursive par rapport à un MNT stocké (la moitié localisation du SLAM de terrain (localisation et cartographie simultanées)) ; l'estimation conjointe de carte est le RBPF distinct ci-dessous. Les quatre sont désormais <b>branchés dans le moteur de scénarios sous <c16/></b> (<c17/>, <c18/>, <c19/>, <c20/>) avec un graphique SVG de dérive (<c21/>, <c22/>, <c23/>). <b>{ "0.36" } (WP-10) :</b> le navigateur <c24/> accepte un vrai champ de référence facultatif (<c25/> : EGM2008 intégré jusqu'au degré { "70" }, ou un fichier ICGEM <c26/>), dont la synthèse d'anomalie concorde avec le service de calcul ICGEM à environ { "1e-8" } mGal près (VALIDATED, <c27/>) ; sur ce champ de degré 70, le banc d'essai de 60 min se termine à { "3106" } m, de sorte que le seuil < { "500" } m est NOT MET (fixé à l'avance et prédit : le degré { "70" } est trop lisse). Un Monte Carlo facultatif d'erreur de carte (<c28/>, <c29/>) montre que la solution synthétique à { "144" } m suppose une carte exacte ({ "1" } réalisation sur { "20" } à moins de { "500" } m sous une erreur corrélée de { "2" } mGal ; exploratoire). <c30/> accepte une grille magnétique crustale EMAG2v3 facultative (<c31/> ; EMAG2 est récupérée, non intégrée au dépôt, et aucun résultat de navigation n'est revendiqué sur elle). <c32/> reste volontairement limité au MNT : c'est l'apparieur TERCOM/SITAN à canal unique, et l'appariement magnétique se trouve dans <c33/>, qui fusionne le terrain avec les canaux magnétique et gravimétrique ; un canal magnétique dans <c34/> en ferait un doublon, de sorte que l'élément d'audit « EMAG2 dans terrain-nav » est couvert par le branchement de <c35/> (RM-16). Les contrôles SRTM réels s'exécutent en CI sur deux extraits pleine résolution versionnés (nœud pour nœud égaux à GDAL { "3.8.4" }, <c36/>). L'estimation conjointe de carte existe (<c37/>, un RBPF de style FastSLAM) : en un seul passage, il gagne { "1.5" } % par rapport au SITAN à carte connue sur une carte erronée, manquant son seuil de { "10" } % fixé à l'avance (<c38/>). <b>Manque encore :</b> un modèle de gravité de haut degré dans une exécution de navigation (exige un nouveau préenregistrement), un résultat de navigation magnétique sur une vraie grille, et un cas de SLAM avec revisite (fermeture de boucle). P3

# text
seg-bf09e5d705a0 = Rentrée / EDL (entrée, descente et atterrissage), analyse de lancement, EO/charge utile (EO : observation de la Terre)

# text
# c1: reentry
# c2: src/reentry.rs
# c3: launch-window
# c4: src/launch.rs
# c5: sin Az = cos i/cos lat
# c6: eo-coverage
# c7: src/eo_payload.rs
seg-6b88cf88c599 = Géométrie MODELLED au premier ordre via trois types exécutables : <b><c1/></b> (<c2/>, couloir balistique d'<b>Allen-Eggers</b> : décélération maximale, vitesses du g maximal et de l'échauffement maximal, altitude du g maximal), <b><c3/></b> (<c4/>, <b>azimut de lancement</b> à deux corps <c5/>, Δv de changement de plan, bonus de rotation du site, opportunités quotidiennes), et <b><c6/></b> (<c7/>, géométrie en triangle spatial SMAD (Space Mission Analysis and Design) de <b>fauchée / GSD (distance d'échantillonnage au sol) / accès / revisite</b> EO). <b>Pas</b> de simulation EDL/aérothermique à 6 DoF, pas d'optimiseur de trajectoire, pas de radiométrie de capteur/MTF (MTF : fonction de transfert de modulation). P3

# text
seg-439bd85c8bbc = PNT lunaire / cislunaire (LunaNet)

# text
# c1: src/lunar.rs
# c2: mci_to_mcmf
# c3: mcmf_to_mci
# c4: mcmf_to_selenographic
# c5: south_pole_hpl_pass
# c6: src/cr3bp.rs
# c7: cr3bp_jacobian
# c8: propagate_state_stm
# c9: differential_correct_halo
# c10: src/lunar_orientation.rs
# c11: moon_pa_de440
# c12: pxform
# c13: tests/lunar_pa_orientation_spice_oracle.rs
# c14: lunar::mci_to_mcmf
# c15: lunar-integrity
# c16: scenarios/lunanet-araim.toml
seg-a7a12eb111fc = <c1/> : un moteur d'<b>ARAIM lunaire</b> réutilisant le cœur MHSS côté Terre avec les paramètres LNIS (LunaNet Interoperability Specification) de LunaNet (σ_URE ≈ { "30" } m, P_sat ≈ { "1e-4" }), la <b>réduction de référentiel cislunaire MCI↔MCMF (MCI : inertiel centré sur la Lune ; MCMF : centré sur la Lune et lié à la Lune)</b> (<c2/> / <c3/>, un modèle simplifié de rotation moyenne à la vitesse sidérale) et la latitude/longitude/altitude <b>sélénographiques</b> (<c4/>), et un <b>passage de niveau de protection au pôle sud</b> (<c5/>) qui quantifie l'écart d'intégrité : avec une mesure de distance à { "30" } m, le HPL est fini mais dépasse une limite d'alerte d'opérations de surface de { "50" } m. <c6/> ajoute le <b>CR3BP</b> Terre–Lune (problème restreint circulaire à trois corps) (dynamique en référentiel tournant + propagateur RK4 + constante de Jacobi + les cinq points de Lagrange, validé par rapport aux valeurs publiées de L1/L2/L3 et aux L4/L5 exacts), le cœur à trois corps dont a besoin une vraie NRHO (orbite en halo quasi rectiligne), et un <b>correcteur différentiel à tir simple avec matrice de transition d'état</b> (<c7/>, <c8/>, <c9/>) qui produit des orbites en halo/NRHO L2 véritablement périodiques : la STM est validée par rapport à des différences finies, les halos corrigés se referment sur eux-mêmes à la précision machine (conservation de Jacobi), et l'initialisation par l'état d'apolune publié reproduit la <b>NRHO L2 australe { "9" }:{ "2" }</b> (l'orbite Gateway) à <b>période ≈ { "6.57" } j</b> et <b>périlune ≈ { "3,250" } km</b>, en accord avec les ≈ { "6.56" } j / ≈ { "3,370" } km publiés | Les CI (conditions initiales) de NRHO corrigées par différentiation sont désormais branchées, mais la <b>transformation sélénocentrique (MCI/MCMF) dé-normalisée de l'orbite corrigée</b> et la continuation de famille restent des suites ; l'orientation lunaire DE440 par axes principaux avec une vraie libration physique existe (<c10/>, issue du PCK <c11/>, contrôlée par rapport à SPICE <c12/> dans <c13/>), mais l'ancien chemin <c14/> utilise encore la rotation moyenne sans libration ni pôle en précession ; la NRHO est une solution CR3BP (circulaire, sans Soleil), <b>non</b> validée par rapport à une vraie éphéméride LANS/Gateway (LANS : Lunar Augmented Navigation Service) ; un type de scénario <c15/> exécutable (<c16/>) expose le passage au pôle sud depuis la CLI | transformation sélénocentrique + continuation de famille + interface SPICE/LunaNet : <b>P3</b>

# text
seg-e3d975b70014 = PNT espace lointain / interplanétaire (Mars, radiométrique)

# text
# c1: src/radiometric.rs
# c2: src/ccsds_tdm.rs
# c3: src/deepspace_od.rs
# c4: clock_state.rs
# c5: mars_atmos.rs
# c6: src/body.rs
# c7: src/mars_frame.rs
# c8: EphemerisProvider
# c9: src/ephem_provider.rs
# c10: mars-pnt
# c11: src/mars_pnt.rs
# c12: src/gse_sim.rs
# c13: xval/anise-mars-od
# c14: from_shadr
# c15: Body::with_gravity_field
seg-584d79a8ba08 = <b>Livré en { "v0.17.0" }.</b> Un moteur de navigation radiométrique : temps de lumière itératif + retard de Shapiro, Doppler et distance bi-/uni-/tri-directionnels (Moyer à deux trajets), retournement cohérent de transpondeur, télémétrie régénérative/PN (PN : pseudo-bruit) (CCSDS { "414" }), Δ-DOR (CCSDS { "506" }), milieux plasma solaire/tropo/iono (<c1/>) ; analyse + émission <b>CCSDS-TDM ({ "503" })</b> (<c2/>) ; un <b>SRIF à dynamique réduite</b> (filtre d'information en racine carrée) avec des accélérations empiriques RTN (radiale, transverse, normale) + une horloge embarquée à 3 états + la traînée martienne (<c3/>, <c4/>, <c5/>) réalisant une <b>DO en orbite basse martienne (LMO) ≈ { "0.2" } m</b> en boucle fermée synthétique ; fusion unidirectionnelle + bidirectionnelle ; un cœur de dynamique multicorps (<c6/>, Mars GMM-3 (GMM : Goddard Mars Model), référentiel martien IAU <c7/>, une interface <c8/> <c9/>, JD en deux parties + TT↔TDB (TDB : temps dynamique barycentrique)) ; et le scénario de PNT par relais <b><c10/></b> (constellation aréostationnaire MARCONI, <c11/>) + un simulateur de performance GSE de bout en bout (<c12/>). <b>Validé par simulation</b> (mesure de mérite en covariance/boucle fermée) ; dynamique à centre solaire recoupée par rapport à DE440 du JPL (Jet Propulsion Laboratory) ({ "137" } m @ arc de 1 jour, <c13/>). <b>Manque :</b> validation sur de vraies données de suivi DSN/ESTRACK (ESTRACK : European Space Tracking network) ; gravité martienne dans son référentiel natif (le champ GMM-3 d/o { "120" } se charge depuis la table PDS SHADR, <c14/>, VALIDATED par rapport à pyshtools, et s'attache par <c15/>, mais est évalué dans le référentiel IAU plutôt que dans le sien de Konopliv-2006) ; éphéméride de niveau DE dans le cœur (conditionnée à un noyau dans xval). P3

# text
seg-00450a6acae0 = Système solaire et PNT autour de n'importe quel corps

# text
# c1: solar-system
# c2: tests/solar_system_horizons_reference.rs
# c3: body-pnt
# c4: body-pnt
# c5: Body
# c6: src/gravity_pds.rs
seg-b999b1b54d5d = <b>type <c1/></b> : positions, vitesses et constantes physiques du Soleil, des planètes, de Pluton, de la Lune et de sept lunes majeures à une époque, avec le temps de lumière entre corps ; les positions des planètes (éléments de Standish du JPL) et le temps de lumière sont VALIDATED par rapport à JPL Horizons (<c2/>), les lunes, Pluton et la table des planètes externes restent MODELLED. <b>Type <c3/></b> : un orbiteur ou un atterrisseur autour de n'importe quel corps catalogué (Mars, la Lune, Europe, Ganymède, Titan et les autres) qui navigue sur des pseudodistances unidirectionnelles d'une constellation Walker locale plus une distance bidirectionnelle facultative depuis la Terre : MODELLED. Pas de noyau d'éphéméride planétaire dans le cœur (éléments analytiques), les orbites de relais <c4/> n'utilisent que J2 (les champs complets Mars GMM-3 d/o { "120" } et Lune GRAIL GL0660B d/o { "660" } se chargent depuis des tables PDS SHADR et s'attachent à un <c5/> pour le propagateur, <c6/>). P3

# text
seg-433128dbc8a9 = Campagnes / composition de missions

# text
# c1: campaign
# c2: src/campaign.rs
# c3: tests/campaign_composition_reference.rs
# c4: [optimize]
# c5: tests/campaign_optimize_reference.rs
seg-6102b9f4123a = <b>type <c1/></b> (<c2/>) : des types existants enchaînés sur une chronologie partagée (par exemple brouillage, puis leurrage, puis holdover avec un INS en roue libre, puis une alarme d'intégrité, puis récupération), des balayages de paramètres et des ensembles Monte Carlo à graine sur n'importe quel type, et plusieurs scénarios sous des conditions partagées avec un résumé combiné ; chaque nombre est lu dans une vraie exécution du type membre. Les identités de composition sont testées (<c3/> : une campagne à une phase reproduit l'exécution autonome octet pour octet) ; MODELLED. Une section <c4/> (grille ou Nelder–Mead borné sur une à trois clés, une métrique, minimiser, maximiser ou viser une cible) satisfait ses seuils en forme fermée et par force brute fixés à l'avance (<c5/>) ; MODELLED, une recherche locale sans affirmation d'optimum global, et sans méthode à gradient ni bayésienne. P3

# text
seg-378c53e44b92 = Rapports, animation et sorties

# text
# c1: result.json
# c2: report.html
# c3: report.json
# c4: tests/advanced_report_cli.rs
# c5: --animate
# c6: src/animation.rs
# c7: ANIMATION.md
# c8: --export
seg-7bd95909787f = Chaque exécution écrit <c1/>, un graphique et un rapport (<c2/>, <c3/>) dont les libellés sont lus dans la matrice de vérification et dont la commande enregistrée reproduit le résultat octet pour octet (<c4/>) ; <c5/> (svg, html ou images) rend une série temporelle sous forme d'animation (<c6/>, <a1><c7/></a1>) ; <c8/> écrit les formats d'échange de la ligne d'interopérabilité. Ce sont des rendus de l'exécution, pas des preuves sur la physique.

# text
seg-3c3d3427723f = Écosystème et maturité (suivis honnêtement, pas une capacité du code)

# text
seg-5770537524d3 = Domaine

# text
seg-e0426ffe2628 = Note

# text
seg-bdee8089afb0 = Liaisons de langage et empaquetage

# text
# c1: RunOutput
# c2: array
# c3: columns
# c4: series
# c5: ScenarioKind
# c6: ErrorKind
# c7: KindMeta
# c8: run_typed
# c9: RunOutput
# c10: scenario_kinds
# c11: units
seg-89fd1e232849 = Rust + Python (abi3) + WASM sur trois registres. Surfaces typées ({ "0.36" }, CAP-34) : <c1/> Python avec accesseurs NumPy (<c2/>, <c3/>, <c4/>) et <c5/> / <c6/> / <c7/> typés par stubs ; <c8/> JavaScript (un objet <c9/> typé) et <c10/>, avec le même vocabulaire dans les déclarations TypeScript. Les documents de résultats restent du JSON par type, typés seulement par leur enveloppe partagée (<c11/>, versions)

# text
seg-e1dee294d0fe = Éducation / expérience utilisateur (UX) d'accueil

# text
# c1: web/studio/lib/guided.mjs
# c2: web/studio/lib/tour.mjs
# c3: web/studio/lib/meaning.mjs
# c4: meaning-kinds.mjs
# c5: GLOSSARY.md
seg-664fb9cb4eb0 = Bac à sable du navigateur avec <b>mode guidé livré</b> : curseurs guidés adaptés au scénario (<c1/>, jusqu'à six réglages par scénario) et visite guidée interactive (<c2/>, rejouable depuis le bac à sable). Chaque exécution reçoit aussi une phrase de <b>signification</b> en langage courant et ses chiffres clés, lus dans le document de résultats (<c3/>, avec des modèles par type dans <c4/> ; un type sans modèle reçoit son premier chiffre principal énoncé simplement). Manque : des explications guidées par chiffre au-delà de cette phrase (le <a1><c5/></a1> en langage courant les couvre)

# text
seg-becc4cd71f4c = Communauté / gouvernance

# text
# c1: GOVERNANCE.md
# c2: CODE_OF_CONDUCT.md
# c3: CONTRIBUTING.md
# c4: SECURITY.md
# c5: FUNDING.yml
seg-ff4d5fc54722 = Structure de gouvernance en place : <c1/> (modèle de mainteneur bienveillant + exigence technique + frontière ouvert/fermé), <c2/>, <c3/>, <c4/>, modèles de tickets/PR (PR : demande de fusion), <c5/>, dependabot. Fondateur unique ; une <b>communauté externe active</b> (contributeurs, citations) dépend des personnes et du temps et est encore en construction (démarchage en attente de relecture)

# text
seg-5e222a61a61e = Maturité pour le financement et les achats

# text
seg-fdbb9db68f1d = aucun

# text
seg-86709f7f67c0 = TRL ~{ "3" } ; pas encore de citations ni de contrats d'agences (voir les notes de stratégie)

# text
# c1: src/impairment_eval.rs
# c2: src/quantum_trade.rs
# c3: σ_y²(τ)=q_wf/τ + q_rw·τ/3 + q_drift·τ³/20
# c4: q_from_allan
seg-ee8e0111f4d0 = Ajouts du démonstrateur FutureNAV (modélisés, recoupés en interne, <b>non</b> validés en externe) : ({ "1" }) <b>banc d'évaluation de détection d'altérations RF par apprentissage automatique</b> <c1/> : un corpus d'altérations étiqueté <b>synthétique</b> (fondé sur des paramètres, pas sur de l'IQ) + un banc ROC/AUC/confusion/Pfa-Pmd indépendant du détecteur (ROC : caractéristique de fonctionnement du récepteur ; AUC : aire sous la courbe) avec garde contre les fuites et découpage stratifié ; les détecteurs fournis sont des références transparentes de méthodes publiées, pas l'état de l'art (SOTA), et une AUC élevée ici démontre la chaîne de traitement, pas la performance sur le terrain. ({ "2" }) <b>moteur de compromis PNT quantique contre classique</b> <c2/> : ingestion d'ADEV mesurés (ajustement NNLS (moindres carrés non négatifs) de <c3/>, vérifié en aller-retour par rapport à <c4/>), un tableau de bénéfices de holdover temporel/inertiel qui porte sur l'artefact la réserve sur l'hypothèse de plancher, et une enveloppe de résilience sans GNSS en fonction du temps ; il <b>quantifie</b> le bénéfice quantique d'un partenaire, il ne valide jamais le dispositif. Les deux ont été relus de façon contradictoire (un défaut de base de dérive τ²→τ³ et une fausse affirmation de résilience « bornée indéfiniment » ont été détectés et corrigés). { "911" } tests de bibliothèque au moment de cet ajout, fmt+clippy propres.

# text
# c1: src/interchange.rs
# c2: Envelope
# c3: format
# c4: SCHEMA_VERSION
# c5: engine_version
# c6: compatibility()
# c7: Envelope::parse
# c8: wrap
# c9: to_json
# c10: parse
# c11: payload_as::<T>()
# c12: Deserialize
# c13: SCHEMA.md
seg-deb7124d3c70 = Ajout d'interchange / de format standard (<c1/>) : le <b>Kshana Interchange Format (KIF)</b>, une <c2/> neutre, versionnée et autodescriptive qui enveloppe tout artefact (scénario, résultat, étude de compromis) avec une étiquette <c3/> reconnaissable, la <c4/> source unique de vérité (la version de schéma, autrefois copiée en littéral à { "15" } endroits, est désormais détenue par une seule constante que tout le crate référence), la <c5/> productrice, et un contrat de compatibilité explicite et testé (<c6/> : même version majeure / version mineure égale ou plus ancienne est lisible selon la discipline des champs additifs ; une version mineure plus récente ou une version majeure différente est refusée à la frontière par <c7/> plutôt que mal analysée en silence). Aller-retour possible (<c8/>→<c9/>→<c10/>→<c11/>) pour toute charge utile <c12/> ; délibérément <b>sans horodatage</b> pour préserver la reproductibilité bit à bit de Kshana. Documenté dans <a1><c13/></a1> pour que le format soit <b>citable</b>, et pas seulement émis : le positionnement « standard en attente » du cœur ouvert. { "923" } tests de bibliothèque au moment de cet ajout, fmt+clippy propres.

# text
# c1: src/frugal.rs
# c2: walker
# c3: src/integrity_impact.rs
# c4: classify_stanford
# c5: src/verification.rs
# c6: VERIFICATION-MATRIX.md
# c7: src/impairment_eval.rs
# c8: stratified_split
# c9: Split::has_leakage
seg-adc959257e0b = Ajouts de la version de domination FutureNAV (modélisés, recoupés en interne, <b>non</b> validés en externe) : ({ "1" }) <b>couche frugale de coût par couverture / ROI (retour sur investissement)</b> <c1/> : une couche de cadrage des bénéfices au-dessus du moteur de dimensionnement de constellation (<c2/>) qui rapporte le coût par point de pourcentage de couverture et le ROI en couverture par euro par rapport à une référence de base ; le coût par satellite est une <b>fourchette basse/nominale/haute sourcée fournie par l'appelant</b> (aucun prix ponctuel fabriqué), de sorte que les sorties sont des plages et non de fausses valeurs ponctuelles ; un cadrage économique modélisé d'un chiffre de couverture modélisé, pas un devis. ({ "2" }) <b>cartographie de l'impact sur l'intégrité des non-détections</b> <c3/> : fait correspondre un biais de position induit par un leurrage/brouillage non détecté à son erreur effective → région de Stanford (disponible / système indisponible / trompeur / dangereusement trompeur) par rapport à des <b>limites d'alerte propres au contexte</b> (ciel dégagé contre urbain, HAL contre VAL), en composant le RAIM <c4/> ancré en externe ; le pont non-détection→limite d'alerte est modélisé, pas une allocation d'intégrité certifiée. Les deux sont reportés dans la matrice de vérification contrôlée par machine (<c5/>, invariant Validated⇒ExternalDataset intact ; le nombre de lignes à jour figure dans l'en-tête généré de <a1><c6/></a1>). La validation croisée / garde contre les fuites / découpage stratifié par paramètres pour le banc d'évaluation de l'IA était déjà livré dans <c7/> (<c8/>, <c9/>). { "951" } tests de bibliothèque au moment de cet ajout, fmt+clippy propres.

# text
# c1: src/impairment_ml.rs
# c2: ImpairmentDetector
# c3: src/eval_stats.rs
# c4: src/impairment_study.rs
# c5: (detector,class)
# c6: cargo run --release --example optimism_study
# c7: src/verification.rs
seg-f744a0c03b2c = Ajouts de l'étude de l'écart d'optimisme FutureNAV (modélisés, recoupés en interne par rapport à des formes fermées, <b>non</b> validés en externe, <b>pas</b> une affirmation de passage de la simulation au terrain) : une étude <b>synthétique</b> contrôlée de l'<b>écart d'optimisme</b> d'AUC entre en distribution et hors distribution pour les détecteurs d'altérations RF. ({ "1" }) <b>Détecteurs appris</b> <c1/> : une carte de caractéristiques fixe + un standardiseur ajusté à l'entraînement, une référence de régression logistique (descente de gradient déterministe sur lot complet), et un <b>MLP</b> (perceptron multicouche ; rétropropagation SGD (descente de gradient stochastique) à graine) à une couche cachée derrière le même trait <c2/> que celui qu'utilisent les références de méthodes publiées. ({ "2" }) <b>Statistiques dérivées à la main</b> <c3/> : intervalles de confiance (IC) par bootstrap percentile, variance/IC d'AUC de <b>DeLong</b>, ρ de <b>Spearman</b> et régression <b>ridge</b>, chacun contrôlé par rapport à une forme fermée (AUC binormale Φ(d′/√{ "2" }), une variance de DeLong calculée à la main, un ρ de manuel à rangs ex æquo, récupération exacte par MCO (moindres carrés ordinaires)). ({ "3" }) <b>L'étude</b> <c4/> : AUC par classe, la tendance de loi d'échelle par <c5/> (écart contre { "1" }−sévérité), et un <b>prédicteur d'écart ridge à partir de l'en-distribution seule</b> qui estime l'écart d'optimisme à partir des seuls diagnostics en distribution, noté par <b>exclusion d'un détecteur à la fois</b> et <b>exclusion d'une classe à la fois</b> par rapport à une référence de base qui prédit la moyenne. Artefact en une commande via <c6/>. Chaque nombre est une AUC sur des étiquettes issues du modèle d'un corpus synthétique fondé sur des paramètres ; l'écart est un décalage de sévérité synthétique→synthétique, jamais un résultat de détection sur le terrain. Reporté dans la matrice de vérification contrôlée par machine (<c7/>, invariant Validated⇒ExternalDataset intact).

# text
seg-441b67566d5a = <s1>Précédent</s1>Reproductibilité

# text
seg-861984989d07 = <s1>Suivant</s1>Normes et interopérabilité
