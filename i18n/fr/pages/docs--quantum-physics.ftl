# docs--quantum-physics: translations (fr)

# text
seg-5ad814c7ef9e = Notes

# text
seg-ad856ad710eb = État

# text
# c1: docs/QUANTUM.md
seg-f2f359447cd9 = Source : <c1/>

# text
seg-5df810623ef1 = Physique des capteurs inertiels quantiques (interféromètre à atomes froids)

# text
# c1: QUANTUM-MODELS.md
# c2: PROVENANCE.md
# c3: src/inertial/quantum_imu.rs
seg-b2915c3652a1 = L'essentiel de Kshana pilote ses capteurs quantiques à partir de <b>coefficients d'Allan/de bruit publiés</b> — des valeurs relevées sur fiche technique (voir <a1><c1/></a1> et <a2><c2/></a2>). Ce document couvre le seul endroit où le moteur calcule au contraire la performance du capteur <b>à partir des premiers principes</b> : le modèle d'accéléromètre à interféromètre à atomes froids (CAI) de <a3><c3/></a3>.

# text
seg-9ae4b2dc84ba = C'est délibérément une couche de physique <em>minimale et honnête</em> — le plancher de bruit de projection quantique et le facteur d'échelle de l'interféromètre — et non un simulateur d'instrument complet. Les sections ci-dessous énoncent exactement ce qui est et n'est pas modélisé.

# text
seg-64509c048541 = Ce qui est modélisé

# text
seg-9fa6211c962e = Un interféromètre atomique de Mach–Zehnder à trois impulsions (π/2–π–π/2) (Kasevich & Chu { "1991" } ; Peters, Chung & Chu { "2001" }), la géométrie standard d'un accéléromètre à atomes froids :

# text
seg-3c513ef2fd3b = Grandeur

# text
seg-c0a13eeb346d = Formule

# text
seg-f838cd800e16 = Vecteur d'onde effectif

# text
# c1: k_eff ≈ 1.611×10⁷ rad/m
seg-79e00267b79f = Raman à deux photons ; Rb-87 D2 ({ "780.241" } nm) → <c1/>.

# text
seg-5c0a84157352 = Phase de l'interféromètre

# text
# c1: a
# c2: k_eff
# c3: T
# c4: T²
# c5: T
seg-31f4f718d896 = Force spécifique uniforme <c1/> le long de <c2/>, séparation des impulsions <c3/>. La variation en <c4/> est le principal levier de sensibilité (la microgravité permet un <c5/> long).

# text
seg-f5b8b6c35dce = Bruit de projection quantique

# text
# c1: C
# c2: N
seg-8902ae6f313c = Par tir, contraste des franges <c1/>, nombre d'atomes <c2/> — la limite de bruit de grenaille d'une lecture de population à deux ports.

# text
seg-b95d4d1e45f0 = Sensibilité en accélération par tir

# text
seg-c97f2fd35d48 = Bruit de phase ramené à l'accélération.

# text
seg-cda09ac79409 = DSA (densité spectrale d'amplitude) limitée par le bruit de grenaille

# text
# c1: T_c
seg-4d84800a3adb = Échantillonnage à chaque temps de cycle <c1/> ; unités (m/s²)/√Hz.

# text
seg-707ee648d1d5 = DSP (densité spectrale de puissance) de marche aléatoire de vitesse

# text
# c1: AccelModel
seg-be0ac61054db = <b>Le coefficient que consomme le <c1/> classique</b> — désormais <em>dérivé</em>, non fourni.

# text
seg-939e12a62637 = Décroissance du contraste

# text
seg-05b0e7130b78 = Décohérence pendant l'interrogation.

# text
seg-e64f748b35ab = Fonction de transfert des vibrations

# text
# c1: T²
seg-1754ac375452 = Réponse accélération→phase de la géométrie idéale à trois impulsions (Cheinet et al. { "2008" }) ; limite continue (fréquence nulle) <c1/>.

# text
seg-a710cfe4f533 = Phase limitée par les vibrations

# text
# c1: S_a
# c2: ∫₀^∞|H|²dω = (2π/3)T³
seg-f5d2223218c8 = DSP d'accélération plate <c1/> le long de l'axe Raman ; <c2/>.

# text
seg-13109dcfc52b = Accélération limitée par les vibrations

# text
# c1: k_eff
seg-812990a8f058 = Par tir ; notez que <c1/> s'annule — fixée uniquement par la DSP de la plateforme et le temps d'interrogation.

# text
seg-1c2764469718 = Ambiguïté de frange

# text
# c1: a_max = π/(k_eff·T²)
# c2: a_max/σ_a = π/σ_Φ
seg-e9cf2dcc0274 = <c1/>, plage en cellules <c2/>

# text
# c1: a_max
# c2: 2·a_max
# c3: k_eff
# c4: T
seg-817e06834263 = La phase de frange est lue modulo 2π, de sorte qu'une lecture unique n'est non ambiguë qu'à l'intérieur de ±<c1/> et se replie tous les <c2/> au-delà ; le nombre de cellules ne dépend ni de <c3/> ni de <c4/>.

# text
seg-14bbedf1cd0d = Projection sur l'axe

# text
seg-1ac2d4904b8a = Le couplage au premier ordre est de rang 1 : seule la composante le long du faisceau entre dans la phase.

# text
seg-7200f91fa19a = Phase de Coriolis / de rotation

# text
# c1: 2·v_⊥·Ω
seg-f8b407b3b2fb = Systématique de rotation pour un véhicule en mouvement (Lan et al. { "2012" }) ; biais équivalent <c1/> = le terme de Coriolis classique.

# text
seg-9eaff8d90a83 = Phase d'effet Stark alternatif (déplacement lumineux) (AC : courant alternatif)

# text
seg-62630dc178e6 = Déplacement lumineux à un photon ; un déplacement <em>constant</em> s'annule par la symétrie π/2–π–π/2 (Peters { "2001" } ; Gauguet { "2008" }).

# text
# c1: CaiAccelerometer::q_va()
seg-bcb9cb9c6219 = Le bouclage est l'essentiel : <c1/> produit exactement la DSP d'accélération blanche que le reste de la pile inertielle intègre déjà en erreur de vitesse/de position — de sorte que le bruit d'un capteur quantique peut être rattaché à son nombre d'atomes, à son temps d'interrogation et à son contraste plutôt qu'à une ligne de fiche technique.

# text
# c1: T = 10 ms
# c2: N = 10⁶
# c3: C = 0.5
# c4: T_c = 0.5 s
# c5: Φ(1 g) ≈ 1.58×10⁴ rad
# c6: σ_Φ = 2×10⁻³ rad
# c7: σ_a ≈ 1.24×10⁻⁶ m/s²
# c8: n_a ≈ 0.09 µg/√Hz
# c9: S_a = 10⁻¹⁰ (m/s²)²/Hz
# c10: σ_a ≈ 5.8×10⁻⁵ m/s²
# c11: a_max ≈ 1.95×10⁻³ m/s²
# c12: Φ(1 g)
seg-e2363d639ccc = Un chiffre résolu (Rb-87, <c1/>, <c2/>, <c3/>, <c4/>) : <c5/>, <c6/>, <c7/> (≈ { "0.13" } µg) par tir, et un plancher de bruit de grenaille <c8/>. Avec une DSP de vibration de plateforme modeste <c9/>, le plancher par tir <b>limité par les vibrations</b> est <c10/> (≈ { "5.9" } µg) — environ { "46" }× le plancher de bruit de grenaille, ce qui montre pourquoi les dispositifs réels sont limités par les vibrations, et non par la projection. Le même interféromètre ne lit la force spécifique sans ambiguïté qu'à l'intérieur de <c11/> (≈ { "199" } µg), soit environ { "1 571" } cellules de résolution : <c12/> représente des milliers de franges, de sorte qu'une lecture unique de { "1" } g est repliée.

# text
seg-c209b86f41d8 = Ce qui N'EST PAS modélisé (et pourquoi le plancher est optimiste)

# text
# c1: scenarios/imu-deadreckoning.toml
# c2: max_unambiguous_accel
# c3: wrap_phase
# c4: accel_from_wrapped_phase
# c5: dynamic_range_cells
seg-964c5f546c2a = Le plancher de bruit de grenaille ci-dessus est une <b>borne inférieure fondamentale</b>. Les instruments CAI réels se situent au-dessus : un gravimètre de laboratoire statique (Freier et al. { "2016" }, { "96" } nm/s²/√Hz) environ { "60" }× au-dessus du plancher calculé pour ses paramètres, et une triade d'accéléromètres déployée bien plus loin (le dispositif d'Exail cité dans <c1/> annonce { "22" } µg/√Hz). Le terme dominant — le <b>couplage aux vibrations</b> — et les deux principales systématiques déterministes — la <b>rotation de Coriolis</b> et le <b>déplacement lumineux d'effet Stark alternatif</b> — sont modélisés (les lignes ci-dessus de la fonction de transfert, de Coriolis et du déplacement lumineux), de même que la <b>plage dynamique d'ambiguïté de frange</b> (<c2/>, <c3/>, <c4/>, <c5/>). L'écart restant est ce que cette couche n'inclut toujours pas :

# text
seg-c56d85817bc6 = Les <b>aberrations de front d'onde</b> et les systématiques de pointage de faisceau d'ordre supérieur — <b>non modélisées</b>.

# text
# c1: a_max
seg-525c382e813b = <b>Résolution de l'ambiguïté de frange</b> — le modèle énonce la plage non ambiguë et renvoie la phase repliée ; il ne déplie pas une lecture située en dehors de ±<c1/> (par exemple avec un accéléromètre classique ou plusieurs temps d'interrogation), et il borne la plage pour une frange idéale à trois impulsions, sans termes de front d'onde ni de perte de contraste.

# text
seg-7555132ef2c6 = Correspondance avec la littérature : Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems</em> §{ "12.5" } (technologie quantique ; GNSS : système mondial de navigation par satellite) ; Cheinet et al., <em>IEEE Trans. Instrum. Meas.</em> { "57" } ({ "2008" }) pour la sensibilité et la fonction de transfert de l'interféromètre (IEEE : Institute of Electrical and Electronics Engineers) ; Freier et al., <em>J. Phys.: Conf. Ser.</em> { "723" } ({ "2016" }) pour le budget d'erreur du gravimètre mobile ; CARIOQA-PMP (Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation) pour le régime de paramètres de l'accéléromètre spatial.

# text
# c1: ROADMAP.md
# c2: q_va
# c3: T³
seg-c50f3befe165 = Il s'agit de l'élément <b>couche de physique quantique P2</b> de <c1/> : la phase de Mach–Zehnder, le bruit de projection, le facteur d'échelle, le <c2/> dérivé, la décroissance du contraste, <b>et la fonction de transfert de couplage aux vibrations / la variance de DSP blanche</b> sont implémentés et testés unitairement par rapport à un calcul manuel (y compris un recoupement numérique par intégrale de bande de la fonction de transfert avec son résultat analytique en <c3/>).

# text
# c1: ImuKind::QuantumCai
# c2: cai
# c3: [accel_quantum.cai]
# c4: [accel_classical.cai]
# c5: inertial
# c6: [accel.cai]
# c7: hybrid-ukf
# c8: scenarios/hybrid-ukf.toml
# c9: scenarios/quantum-cai-coast.toml
# c10: wavelength_m
# c11: pulse_sep_t
# c12: T
# c13: atom_number
# c14: N
# c15: contrast
# c16: C
# c17: cycle_time_s
# c18: T_c
# c19: vibration_psd
# c20: q_va
# c21: [cai]
seg-42e8dc204be9 = Le modèle est aussi <b>câblé dans des scénarios exécutables</b> : un accéléromètre se résout en <c1/> lorsqu'il porte une table <c2/> — <c3/> ou <c4/> dans un scénario <c5/>, <c6/> dans un scénario <c7/> (<c8/> en fournit un, et le préréglage fourni <c9/> oppose un CAI défini par la physique à un accéléromètre à quartz de classe navigation lors d'une interruption du GNSS) — avec les champs <c10/>, <c11/> (<c12/>), <c13/> (<c14/>), <c15/> (<c16/>), <c17/> (<c18/>) et une <c19/> de plateforme facultative. Sa DSP de marche aléatoire de vitesse <c20/> est alors <b>dérivée</b> de la physique de l'interféromètre — le plancher de bruit de grenaille plus, lorsqu'une DSP de vibration est donnée, la contribution limitée par les vibrations en quadrature — plutôt que fournie comme coefficient de fiche technique. Les scénarios sans bloc <c21/> sont classiques et inchangés octet pour octet.

# text
# c1: coriolis_phase
# c2: coriolis_accel_bias
# c3: ac_stark_phase
# c4: 2·Ω×v
# c5: cai_drift_sweep
# c6: quantum-gnss-free-nav
# c7: QuantumNavBudget
# c8: src/inertial/cai_params.rs
seg-51da20726ade = Les systématiques de Coriolis (<c1/> / <c2/>) et de déplacement lumineux d'effet Stark alternatif (<c3/>) sont implémentées et testées unitairement (le biais équivalent de Coriolis est vérifié par rapport au terme classique <c4/> ; la phase d'effet Stark alternatif par rapport à son annulation symétrique). Un balayage de dérive en fonction du temps de cycle (<c5/>) rapporte la dérive de position à l'estime du CAI quantique en fonction du temps de cycle — le cœur de calcul d'une comparaison quantique-classique. Le type de scénario <c6/> réutilise le même accéléromètre par <c7/>, et <c8/> porte une fiche de paramètres encadrée (meilleur, nominal, prudent) avec une citation par chiffre.

# text
seg-e2acbef44395 = Ce que montrent les vérifications externes.

# text
# c1: tests/quantum_inertial_sensor_reference.rs
# c2: k_eff
# c3: |2Ω×v|
seg-353a2b2e1434 = <c1/> vérifie la fonction de transfert par rapport à une intégrale numérique dans le domaine temporel de la fonction de sensibilité de Cheinet, <c2/> par rapport à des longueurs d'onde de raies publiées, et le biais de Coriolis par rapport à <c3/> — des concordances exactes avec les formes publiées. Le plancher de bruit de grenaille est un encadrement unilatéral : pour les paramètres publiés du gravimètre au césium de Peters et al. { "2001" } et du gravimètre au rubidium GAIN de Freier et al. { "2016" } (arXiv:{ "1512.05660" }), le plancher modélisé se situe au niveau du bruit atteint par chaque dispositif ou en dessous, et à moins de trois ordres de grandeur de celui-ci (pour GAIN, le plancher est de { "1.53" }×{ "10" }⁻⁹ m/s²/√Hz contre { "9.6" }×{ "10" }⁻⁸ atteints, un facteur d'environ { "63" }). Cela est cohérent avec des dispositifs réels limités par les vibrations ou par la technique, mais c'est un encadrement, non une validation d'un modèle de bruit d'instrument, de sorte que la ligne de la matrice reste MODELLED.

# text
# c1: cai_drift_sweep
seg-82dffa95c0e8 = Les suites restantes sont les systématiques de front d'onde et de pointage de faisceau, la résolution de l'ambiguïté de frange, une reproduction numériquement exacte des budgets Monte Carlo de CARIOQA-PMP et des budgets d'essais en vol sans GPS (GPS : Global Positioning System) de Boeing/AOSense (qui exigent les DSP de plateforme publiées et le SNR par tir, le rapport signal sur bruit), et un préréglage de comparaison quantique-classique dans le bac à sable du navigateur, au-dessus de <c1/>.

# text
seg-2452f58aedf0 = <s1>Précédent</s1>Modèles de capteurs quantiques

# text
seg-206d5a9704f0 = <s1>Suivant</s1>API Python
