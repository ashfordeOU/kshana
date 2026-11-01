# docs--quantum-models: translations (fr)

# text
seg-638b8d451550 = Capteur

# text
seg-c35a20fa2529 = Maturité

# text
# c1: docs/QUANTUM-MODELS.md
seg-2f51722ab9d4 = Source : <c1/>

# text
seg-39ab7752d86d = Modèles de capteurs quantiques : ce que Kshana modélise, et ce qu'il ne modélise pas

# text
seg-daf0e0c0b16f = Kshana est un <b>simulateur de résilience PNT (PNT : positionnement, navigation et synchronisation temporelle) avec des modèles de performance de capteurs quantiques</b>. Ce n'est <em>pas</em> un simulateur de physique quantique à partir des premiers principes. Cette page énonce exactement ce que cela signifie, afin que le cadrage « quantique » ne soit pas pris pour plus que ce qu'il est.

# text
seg-6e504d97c41e = Ce qui EST modélisé

# text
seg-7884c9a7d883 = Chaque capteur quantique (et classique) est un <b>modèle d'erreur</b> piloté par des paramètres de budget de bruit publiés :

# text
# c1: ClockClass
# c2: VALIDATION.md
# c3: VERIFICATION-MATRIX.md
seg-cad22f39d579 = <b>Horloges</b> — DSP (densités spectrales de puissance) de bruit blanc de fréquence et de marche aléatoire de fréquence, plancher d'Allan de scintillation (1/f) et dérive linéaire, issus de fiches techniques et d'articles : la CSAC (horloge atomique à l'échelle d'une puce) Microchip SA.45s ; l'horloge à réseau optique de strontium d'Origlia et al. (arXiv:{ "1503.08457" }), un objectif spatial ; et les six valeurs par défaut de <c1/> (CSAC ; USO, oscillateur ultra-stable ; DSAC, Deep Space Atomic Clock ; TCXO, oscillateur à quartz compensé en température ; OCXO, oscillateur à quartz thermostaté ; RAFS, étalon de fréquence atomique au rubidium), chacune citant une source. La déviation d'Allan qu'elles produisent est validée par rapport aux pentes standard des types de bruit (voir <a1><c2/></a1>). Une courbe d'horloge optique est réelle : la déviation d'Allan mesurée de l'horloge à pince ⁸⁸Sr de Norcia et al. (<em>Science</em> { "2019" }) est reproduite par l'ajustement du bruit, une ligne VALIDATED dans <a2><c3/></a2> ; les chiffres de holdover construits sur la classe optique restent MODELLED.

# text
# c1: inertial
# c2: gnss-ins
# c3: hybrid-ukf
# c4: src/inertial/
seg-13c3340e773b = <b>Capteurs inertiels</b> — dans les paquets <c1/> et hybrides, un budget d'erreur d'accéléromètre/gyroscope à un seul axe (1-DOF, un degré de liberté) : marche aléatoire de vitesse, marche aléatoire angulaire, marche aléatoire d'accélération et un plancher d'Allan d'instabilité de biais. Les types de scénario <c2/> et <c3/> exécutent en revanche la mécanisation à composantes liées à trois axes de <c4/> (attitude par quaternions, équations de navigation nord-est-bas, un modèle d'erreur d'IMU déterministe).

# text
# c1: quantum-trade
# c2: quantum-time-transfer
# c3: quantum-anomaly-detect
# c4: quantum-gnss-free-nav
# c5: hybrid-ukf
# c6: quantum-time-transfer
# c7: quantum-anomaly-detect
# c8: quantum-gnss-free-nav
seg-f361d586b348 = Les types de scénario quantiques — <c1/>, <c2/>, <c3/>, <c4/> et <c5/> — sont construits à partir de ces modèles d'erreur et sont MODELLED ; <c6/>, <c7/> et <c8/> rapportent aussi un relevé de représentativité avec les écarts jusqu'au vol.

# text
seg-05bbaddd4df6 = Le moteur est <b>neutre</b> : « quantique » et « classique » sont le même chemin de code avec des coefficients différents. Le contraste dans les indicateurs de performance vient entièrement des paramètres de bruit en entrée, chacun rattaché à une source citée.

# text
seg-a1a067588520 = Ce qui N'EST PAS modélisé

# text
seg-49a656243210 = Pour les capteurs d'horloge et de transfert de temps, aucune physique quantique sous-jacente n'est simulée — seulement la contribution d'Allan nette, fournie sous forme de coefficient. Pour l'<b>accéléromètre à atomes froids</b>, une couche de premiers principes existe désormais (voir ci-dessous) ; les systématiques restantes sont encore au niveau des coefficients ou non modélisées :

# text
# c1: Φ = k_eff·a·T²
# c2: σ_Φ = 1/(C·√N)
# c3: |H(ω)| = (4/ω²)sin²(ωT/2)
# c4: σ_Φ² = k_eff²·S_a·T³/3
# c5: src/inertial/quantum_imu.rs
# c6: q_va
# c7: a_max = π/(k_eff·T²)
# c8: QUANTUM.md
seg-844e65d52572 = la <b>phase de Mach–Zehnder</b> de l'interféromètre atomique (<c1/>), le <b>bruit de projection quantique / de grenaille</b> (<c2/>), la décroissance du <b>contraste</b> de l'interféromètre, le <b>temps de cycle</b> et la <b>fonction de transfert de couplage aux vibrations</b> (<c3/>, variance de DSP blanche <c4/>) <em>sont désormais modélisés à partir des premiers principes</em> pour l'accéléromètre CAI (interféromètre à atomes froids) (<c5/>), en déduisant la DSP d'accélération blanche <c6/> que consomme le modèle classique, avec la <b>plage dynamique d'ambiguïté de frange</b> (<c7/>) — voir <a1><c8/></a1> ;

# text
# c1: coriolis_phase
# c2: coriolis_accel_bias
# c3: 2·v⊥·Ω
# c4: ac_stark_phase
# c5: src/inertial/quantum_imu.rs
seg-71a782041b89 = la systématique de <b>Coriolis</b> (<c1/> / <c2/>, le couplage croisé <c3/>) et la systématique d'<b>effet Stark alternatif (AC : courant alternatif) / déplacement lumineux</b> (<c4/>, qui s'annule sous un désaccord à deux photons symétrique) <em>sont désormais modélisées et testées unitairement</em> dans <c5/> ;

# text
# c1: src/inertial/cai_error_terms.rs
seg-00c510117abc = trois autres termes d'erreur du CAI <em>sont désormais modélisés</em> sous forme de fonctions de bibliothèque dans <c1/> ({ "0.36" } ; MODELLED ; pas encore accessibles depuis un type de scénario) :

# text
# c1: σ_Φ² = (π/2)²·S_φ⁰/τ_R
# c2: t_d = 2L/c
seg-fcaf6ff00974 = le <b>bruit de phase du laser Raman</b> : la pondération par la fonction de sensibilité de Cheinet et al. ({ "2008" }), éq. { "8" }, avec la forme close de bruit de phase blanc <c1/> (éq. { "18" } à un cycle) et une voie numérique pour tout spectre de bruit de phase, plus le bruit de fréquence du laser que le retard de rétroréflexion <c2/> n'annule pas (Le Gouët et al. { "2007" }, éq. { "9" } à { "11" }) ;

# text
# c1: δg = σ_v²/R
# c2: R
seg-6e2236c81db8 = la <b>courbure du front d'onde</b> (défocalisation pure seulement) : le biais <c1/> d'un nuage thermique sur un faisceau de rayon de courbure <c2/>, et sa réduction lorsque seuls les atomes situés dans un rayon de détection sont comptés (d'après Louchet-Chauvet et al. { "2011" } et Schkolnik et al. { "2015" }) ; les aberrations d'ordre supérieur ne sont pas modélisées ;

# text
# c1: erfc(π/(√2·s))
seg-92295ad17228 = la <b>résolution de l'ambiguïté de frange</b> : la probabilité d'un indice de frange erroné, <c1/>, pour une aide par accéléromètre classique (Lautier et al. { "2014" }) et pour deux temps d'interrogation (d'après Bonnin et al. { "2018" }), avec l'inverse qui donne le plus grand bruit classique pour une probabilité d'échec donnée.

# text
# c1: τ_R
seg-f383678fb806 = Chaque forme close est vérifiée par rapport à une voie numérique indépendante (quadrature dans le domaine fréquentiel, ou Monte Carlo sur des atomes ou des tirs) et à ses cas limites. Le seul chiffre publié reproduit est le niveau de bruit de phase blanc de Cheinet et al. : −{ "111" } dB·rad²/Hz à <c1/> = { "20" } µs donne environ { "1" } mrad par tir ({ "0.99" } mrad ; l'article dérive ce niveau avec son éq. { "17" }, scintillation plus blanc). Rien de cela n'est une mesure d'un instrument quelconque ;

# text
seg-150f8b9dfea4 = toujours <b>non</b> modélisés : les aberrations de front d'onde d'ordre supérieur, le bruit de phase d'un système laser précis et la physique de premiers principes côté horloge ;

# text
# c1: inertial
# c2: gnss-ins
# c3: hybrid-ukf
# c4: VALIDATION.md
seg-643109601eba = le paquet <c1/> quantique contre classique est à un seul axe ; le chemin à composantes liées à trois axes ne s'exécute que dans <c2/> et <c3/> (voir la note sur l'IMU, unité de mesure inertielle, dans le README et <a1><c4/></a1>).

# text
# c1: ROADMAP.md
seg-1ff01ab9f92d = Compléter la couche de physique quantique (atteindre les termes d'erreur du CAI depuis un type de scénario, les aberrations de front d'onde d'ordre supérieur et la physique de premiers principes côté horloge) est le travail P2 restant dans <c1/>.

# text
seg-f09a31b33faa = Chiffres de laboratoire au sol contre chiffres qualifiés pour le vol

# text
seg-dcef4579d2a9 = Les tableaux de paramètres mêlent des niveaux de maturité ; traitez-les en conséquence :

# text
seg-4f25895df32f = Chiffre source

# text
seg-cef61e912cd0 = CSAC (p. ex. SA.45s)

# text
seg-4a016be9bca9 = fiche technique σ_y({ "1" } s) ≈ { "3e-10" }

# text
seg-38cc72b2405c = composant commercial <b>déployé</b> (des variantes spatiales tolérantes aux rayonnements existent)

# text
seg-d38d20629ed6 = Horloge à réseau optique de strontium

# text
seg-1f0d3ec00922 = objectif σ_y({ "1" } s) ≈ { "1e-15" } (arXiv:{ "1503.08457" })

# text
seg-1496e0c42086 = <b>laboratoire au sol</b> — Kshana ne connaît aucune performance publiée en orbite pour une telle horloge

# text
seg-ce1d7994188b = Accéléromètre à atomes froids

# text
seg-b07fa6b8cebc = chiffres d'Allan de laboratoire publiés

# text
seg-60864f168701 = laboratoire au sol / fusée-sonde

# text
seg-84a68aeb467d = Les chiffres d'horloge optique dans Kshana sont des <em>objectifs spatiaux sur matériel au sol</em>. Aucune horloge optique n'a volé ; le README et la provenance des résultats le disent explicitement.

# text
seg-a204c1b854fa = Benchmark : ACES/PHARAO sur l'ISS (opérationnel depuis avril { "2025" })

# text
seg-fb88de1257bd = La charge utile <b>ACES/PHARAO</b> de l'ESA (Agence spatiale européenne) (ACES : Atomic Clock Ensemble in Space ; PHARAO : Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite) — une horloge au césium refroidie par laser plus un maser à hydrogène actif, en fonctionnement sur l'ISS (Station spatiale internationale) depuis avril { "2025" } — est le benchmark opérationnel actuel de stabilité d'horloge en orbite (stabilité fractionnaire visée de l'ordre de { "1e-16" } après quelques jours d'intégration). Le modèle d'horloge optique de Kshana représente un objectif de laboratoire au sol <em>plus ambitieux</em> que les performances césium/maser en vol d'ACES ; lorsqu'on compare les chiffres optiques de Kshana à « ce qui a réellement volé », ACES/PHARAO est le point de référence honnête, et c'est un système à micro-ondes/maser, non une horloge à réseau optique.

# text
seg-9d2e850cb986 = Les chiffres exacts de performance d'ACES en orbite doivent être cités d'après les résultats publiés de l'ESA à mesure qu'ils sont diffusés ; le point ici est l'<em>écart de maturité</em>, non un chiffre précis — les chiffres optiques de Kshana sont des objectifs, non des performances en vol.

# text
# c1: VALIDATION.md
# c2: validated
# c3: not modeled
seg-4b373686adf8 = <a1><c1/></a1> — étiquettes <c2/> / <c3/> par paramètre.

# text
# c1: GLOSSARY.md
seg-3f0c1048aea9 = <a1><c1/></a1> — définitions des indicateurs de performance (FoM) et de chaque abréviation.

# text
# c1: INTEGRITY.md
seg-a360cd4997e2 = <a1><c1/></a1> — ce que sont et ce que ne sont pas les FoM d'intégrité et de sécurité.

# text
# c1: QUANTUM.md
seg-0ac025397b23 = <a1><c1/></a1> — l'accéléromètre à atomes froids de premiers principes.

# text
seg-41ba2c8f70fe = <s1>Précédent</s1>Conception de constellations

# text
seg-136fa589fed5 = <s1>Suivant</s1>Interféromètre à atomes froids
