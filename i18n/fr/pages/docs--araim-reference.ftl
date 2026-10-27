# docs--araim-reference: translations (fr)

# text
# c1: docs/ARAIM_REFERENCE.md
seg-c316596d7ec8 = Source : <c1/>

# text
seg-4768b19aaed7 = Référence ARAIM — niveaux de protection RAIM avancés dans Kshana

# text
# c1: src/raim.rs
seg-93c83a737a43 = Cette note documente l'implémentation ouverte de Kshana de l'<b>Advanced Receiver Autonomous Integrity Monitoring (ARAIM)</b> : l'algorithme, chaque hypothèse, le message de support d'intégrité qu'elle consomme et l'état de validation. L'implémentation se trouve dans <a1><c1/></a1> ; ce document est le complément en prose qu'un auditeur (ou un évaluateur d'achats) peut lire à côté du code.

# text
seg-f5a7abecc2df = L'ARAIM est le successeur bi-constellation et multifréquence du RAIM classique que le Working Group C (WG-C) GPS (Global Positioning System)–Galileo a défini pour prendre en charge le guidage horizontal et vertical jusqu'à LPV-200 (LPV : performance du localisateur avec guidage vertical). Il répond à une seule question pour chaque époque :

# text
# c1: P_HMI
seg-252dac107a2a = Quelle doit être la taille de la borne d'erreur de position (le <em>niveau de protection</em>) pour que la probabilité résiduelle d'<em>information dangereusement trompeuse</em> — une erreur supérieure à la borne alors que la borne est encore à l'intérieur de la limite d'alerte — reste sous le budget de risque d'intégrité <c1/> ?

# text
seg-04299e9742b7 = { "1" }. Le message de support d'intégrité (ISM)

# text
# c1: IntegritySupportMessage
seg-717bea7d6bc8 = L'ISM est le jeu de paramètres par constellation que l'utilisateur applique. Il est modélisé explicitement par <a1><c1/></a1> :

# text
seg-fffbeccd4266 = Symbole

# text
seg-2247a2344710 = Signification

# text
seg-d7e49778bed2 = σ_URE / SISE (erreur du signal dans l'espace)

# text
seg-b1b5bca63e21 = RMS (root mean square) de l'erreur de distance utilisé pour la <b>précision et la continuité</b>

# text
seg-8ff2973d7f5b = σ_URA / SISA (précision du signal dans l'espace)

# text
seg-f993962a5c9b = borne de l'erreur de distance utilisée pour l'<b>intégrité</b> (≥ σ_URE)

# text
# c1: b_k = Σ_i |s_i|·b_nom
seg-727c7fbe1b01 = biais de distance nominal maximal replié d'un seul côté dans la borne d'intégrité (<c1/>) ; voir §{ "3" }

# text
seg-a79e42c29c46 = probabilité a priori d'une panne non détectée d'un seul satellite

# text
seg-78c45312d2ff = probabilité a priori d'une panne touchant toute la constellation

# text
# c1: IntegritySupportMessage::gps_galileo_reference()
seg-19cc5ff2e541 = <c1/> renvoie les valeurs de référence publiées du WG-C : <b>σ_URA = { "0.75" } m</b>, <b>σ_URE = { "0.67" } m</b>, <b>b_nom = { "0.75" } m</b>, <b>P_sat = { "1" }×{ "10" }⁻⁵</b>, <b>P_const = { "1" }×{ "10" }⁻⁴</b> sur l'intervalle d'exposition. Ce sont les valeurs utilisées pour dimensionner la disponibilité de l'ARAIM dans la littérature de référence ; l'ISM opérationnel est diffusé ou assemblé au sol et est configurable par constellation. La distinction entre σ_URA (intégrité) et σ_URE (précision) est délibérée et constitue la caractéristique définissante du concept d'ISM.

# text
# c1: .fault_priors()
# c2: .dual_fault_priors()
seg-0c1687628e67 = <c1/> et <c2/> les transmettent directement aux deux moteurs.

# text
seg-8c516e53f595 = { "2" }. Hypothèses de panne

# text
# c1: H_k
seg-b6353366ebf0 = L'ARAIM est une méthode de <em>séparation de solutions à hypothèses multiples</em> (MHSS). Pour chaque hypothèse de panne <c1/>, elle forme la solution toutes satellites en vue et la sous-solution qui exclut l'ensemble en panne, et borne l'erreur de position sous cette hypothèse :

# text
# c1: H_0
# c2: ≈ 1
seg-3b340e082b84 = <c1/> (a priori <c2/>) : la position complète par moindres carrés avec tous les satellites en vue.

# text
seg-03332e433edc = Pannes d'un seul satellite

# text
# c1: H_i
# c2: P_sat
# c3: araim_raim
seg-add4792e4e40 = <c1/> (a priori <c2/> chacune) : chaque sous-solution excluant un satellite. C'est la référence de base ARAIM classique à panne unique, <a1><c3/></a1>.

# text
seg-7e20f419e670 = Pannes touchant toute la constellation

# text
# c1: H_c
# c2: P_const
# c3: araim_dual_raim
# c4: P_const = 0
# c5: araim_raim
seg-920bd35833ff = <c1/> (a priori <c2/> chacune) : la sous-solution qui retire <em>tous</em> les satellites d'une constellation à la fois, l'extension EU (Union européenne) ARAIM TN (note technique) / DO-316 implémentée dans <a1><c3/></a1>. Avec <c4/>, elle se réduit <b>bit pour bit</b> à <c5/>.

# text
seg-323dd205d238 = { "3" }. Niveaux de protection

# text
# c1: (p_fault, threshold, σ)
# c2: K_fa = Φ⁻¹(1 − P_fa / 2N)
# c3: N
# c4: PL
seg-9ab2676d2554 = Pour chaque axe (vertical, horizontal) et chaque hypothèse, le moteur construit un mode <c1/> où le seuil est la limite de détection de séparation de solutions au multiplicateur de fausse alerte <c2/> (une répartition de Bonferroni du budget de continuité sur les <c3/> hypothèses). Le niveau de protection est la plus petite borne <c4/> dont le risque d'intégrité cumulé

# text
seg-05c0d8fc855c = Note d'implémentation.

# text
# c1: b_k = Σ_i |s_{axis,i}|·b_nom
# c2: axis_bias_sum
# c3: horiz_bias_sum
# c4: b_nom_m
# c5: b_nom = 0.75 m
# c6: b_nom = 0
# c7: integrity
# c8: sigma_ura_m
# c9: sigma_uere_m
# c10: b_nom_m
# c11: INTEGRITY.md
seg-248092fe9b94 = <c1/> est la projection unilatérale du biais nominal sur l'axe — la somme dans le pire cas des modules de gain par satellite (<a1><c2/>/<c3/></a1>) — tirée du <c4/> de l'ISM. L'ISM de référence du WG-C utilise <c5/> ; avec <c6/>, la borne se réduit à la forme MHSS à biais nominal nul. Le scénario exécutable <c7/> expose <c8/> (la borne d'intégrité utilisée pour le niveau de protection, bornée à ≥ <c9/> et prenant cette valeur par défaut) et <c10/> (valeur par défaut { "0" }), de sorte que le niveau de protection est toujours dimensionné avec la borne d'intégrité σ_URA, jamais avec la précision σ_URE plus petite. Cela reste une implémentation ARAIM <b>modélisée et non certifiée</b> — voir <a2><c11/></a2>.

# text
# c1: araim_protection_level
# c2: araim_integrity_risk
# c3: ≤
seg-f6bccff61ff5 = respecte le budget alloué ([<c1/>] / <a1><c2/></a1>). Le VPL (niveau de protection vertical) et le HPL (niveau de protection horizontal) sont les réponses verticale et horizontale. Le résultat rapporte aussi le risque d'intégrité effectivement atteint (<c3/> l'allocation) et si une sous-solution s'est séparée au-delà de son seuil.

# text
seg-b1a868221848 = C'est le contrat ARAIM explicite — « quelle doit être la taille de la borne ? » — plutôt que le risque implicite, dépendant de la géométrie, d'un RAIM classique à multiplicateur fixe.

# text
seg-c90cf313dea8 = { "4" }. Diagramme de Stanford

# text
# c1: StanfordDiagram
# c2: (error, PL)
# c3: classify_stanford
# c4: stanford_svg
# c5: PL = error
seg-b51e44c3deda = <a1><c1/></a1> accumule <c2/> par époque par rapport à une limite d'alerte (AL) fixe et <a2><c3/></a2> classe chacune comme <em>disponible</em>, <em>système indisponible</em> (PL > AL, prudent), <em>information trompeuse</em> (PL < erreur ≤ AL) ou <em>information dangereusement trompeuse</em> (erreur > AL et > PL). <a3><c4/></a3> produit le nuage de points classique — la frontière d'intégrité <c5/>, les repères de limite d'alerte et un marqueur coloré par époque — sous forme d'un SVG (Scalable Vector Graphics) autonome.

# text
seg-c902173f6acf = { "5" }. L'avantage de la bi-constellation

# text
# c1: raim::tests::dual_constellation_improves_geometry_and_tolerates_a_constellation_fault
seg-96e114a6981c = Deux effets sont démontrés dans <c1/> :

# text
seg-06c7d8d62b44 = <b>Géométrie / redondance</b> — mettre en commun les satellites d'une seconde constellation resserre le HPL à panne unique : davantage de mesures et un ensemble de sous-solutions à un seul SV (SV : space vehicle, c'est-à-dire un satellite) plus grand donnent une borne strictement plus petite.

# text
# c1: P_const
# c2: araim_dual_raim
# c3: None
seg-f788c9e07547 = <b>Tolérance aux pannes de constellation</b> — avec <c1/> actif, l'utilisateur bi-constellation reste disponible lorsqu'une constellation entière peut tomber en panne (les satellites de l'<em>autre</em> constellation survivent), alors qu'un utilisateur mono-constellation ne peut manifestement pas être protégé contre la panne de sa propre constellation (<c2/> renvoie <c3/>).

# text
seg-f52a937bad94 = Une subtilité qu'il convient d'énoncer honnêtement : comme l'hypothèse de panne de constellation exige de survivre à la perte d'une constellation <em>entière</em>, le niveau de protection <em>instantané</em> en bi-constellation est borné inférieurement par la géométrie résiduelle mono-constellation — il n'est pas automatiquement plus petit que le PL GPS seul à chaque instant. Le résultat phare de la TN ARAIM de l'UE, selon lequel GPS+Galileo donne un <b>HPL plus petit de { "15" }–{ "25" } %</b>, est un résultat de <b>disponibilité</b> cumulé sur des constellations et des positions d'utilisateur réalistes, et non une garantie par instantané.

# text
seg-b4289b877902 = { "6" }. État de la validation

# text
# c1: P_const = 0
# c2: tests/igs_real_data.rs
seg-e553de2eee63 = <b>Dans le dépôt, automatisé :</b> l'algèbre MHSS (<c1/> ⇒ panne unique bit pour bit ; une panne de constellation élargit le PL ; le budget n'est jamais dépassé), les avantages de géométrie et de panne de constellation ci-dessus, et l'exercice sur une <b>vraie géométrie d'orbite précise (SP3, Standard Product { "3" }) de l'IGS (International GNSS Service ; GNSS = système mondial de navigation par satellite)</b> (<c2/>), et pas seulement sur des constellations synthétiques.

# text
# c1: src/araim_reference.rs
# c2: tests/araim_reference_vectors.rs
# c3: tests/fixtures/araim_reference/wgc_araim_reference_vectors.txt
# c4: TOL_PL = 5 × 10⁻² m
# c5: G
# c6: K_fa,3
# c7: N_fault,max = 1
# c8: araim-reference-check
seg-633bf11af170 = <b>Référence indépendante — l'exemple traité publié du WG-C :</b> les niveaux de protection sont vérifiés par rapport à l'exemple numérique du sous-groupe technique ARAIM lui-même, dans <a1><c1/></a1>, <c2/> et le jeu d'essai versionné <c3/> (chaque vecteur porte son URL (adresse web) de récupération, sa date de récupération, le SHA-256 (SHA : Secure Hash Algorithm) du fichier source et la page). La tolérance d'acceptation est le <c4/> propre à la référence. Par rapport au Reference Airborne Algorithm Description Document v3.1 ({ "2019" }), Annexe D : <b>VPL { "18.2926" } m contre { "18.3" } m publié (Δ { "0.0074" } m)</b>, <b>HPL { "13.4063" } m contre { "13.45" } m (Δ { "0.0437" } m)</b>, EMT (seuil de moniteur effectif) { "7.2997" } m contre { "7.2998" } m, σ_v,acc { "1.3694" } m contre { "1.3694" } m, et les six intermédiaires publiés de panne de constellation (σ₃⁽ᵏ⁾, σ_ss,{ "3" }⁽ᵏ⁾, b₃⁽ᵏ⁾) à moins d'une demi-unité de leur dernière décimale imprimée. Le Milestone { "3" } Report de { "2016" } énonce le même exemple mais comporte deux défauts internes — une coquille de signe à la ligne { "3" } de <c5/>, et un <c6/> évalué à { "57" } modes de panne alors que le document énonce <c7/> ({ "12" } modes) — de sorte que ses intermédiaires de géométrie se reproduisent exactement tandis que ses niveaux de protection sont consignés comme des écarts mesurés (VPL Δ { "0.0171" } m, HPL Δ { "0.0842" } m, EMT Δ { "0.4806" } m) et exclus du chiffre d'acceptation. Le contrôle est accessible comme type de scénario <c8/>.

# text
# c1: N_fault,max = 1
seg-6d79f9836abd = <b>Résidu honnête (externe / en attente de relecture) :</b> le chiffre de disponibilité de { "15" }–{ "25" } % par rapport à un <b>instantané TLE (jeu d'éléments à deux lignes) Celestrak réel et figé en version</b>, et le dépôt des jeux d'essai ARAIM comme enregistrement <b>Zenodo</b> citable. Le contrôle de référence ci-dessus ne couvre que <c1/> (modes de panne d'un seul satellite et d'une seule constellation) ; les sous-ensembles de pannes à événements multiples simultanés, l'exclusion de panne, le contrôle de cohérence du χ² et l'étape de réallocation du double comptage de l'algorithme de référence ne sont pas implémentés, et un cas dont les a priori en auraient besoin est refusé plutôt que tronqué.

# text
# c1: integrity
# c2: araim_dual_raim
# c3: araim_dual = true
# c4: p_hmi
# c5: scenarios/araim-gps-galileo.toml
# c6: tests/araim_dual_real_data.rs
seg-b57b889dc536 = <b>Portée par fichier de scénario :</b> le type de scénario <c1/> exécute <c2/> à chaque époque lorsque son fichier TOML (Tom's Obvious Minimal Language) définit <c3/> (<c4/> facultatif) ; le fichier fourni <a1><c5/></a1> le fait sur une géométrie GPS + Galileo mise en commun, et <c6/> exécute le même moteur sur de vrais TLE Celestrak GPS et Galileo propagés à une époque commune. Sans cet indicateur, l'exécuteur utilise le RAIM classique à séparation de solutions.

# text
seg-6cb7a787ac67 = Références

# text
seg-46ca3d3cf9df = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Milestone { "3" } Report</em>, Final Version, { "25" } février { "2016" } — Annexe A (algorithme utilisateur de référence) et §A.IX (exemple numérique). <a1>https://www.gps.gov/sites/default/files/2025-09/ARAIM-milestone-3-report.pdf</a1>

# text
seg-e5e789005864 = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Reference Airborne Algorithm Description Document</em>, Version { "3.1" }, { "20" } juin { "2019" } — Annexe D (exemple numérique pour LPV-200). <a1>https://web.stanford.edu/group/scpnt/gpslab/website_files/maast/ARAIM_TSG_Reference_ADD_v3.1.pdf</a1>

# text
seg-8758a6e4f6eb = EU–US (États-Unis) Cooperation on Satellite Navigation, <em>ARAIM Technical Note</em>.

# text
seg-c4d2879b2ec4 = RTCA (anciennement Radio Technical Commission for Aeronautics) DO-316 / DO-229 MOPS (normes de performance opérationnelle minimale) ; matériel DO-316 ARAIM MASPS (normes de performance minimale des systèmes aéronautiques).

# text
seg-d5ed1c3cfb1f = Blanch et al., <em>Baseline Advanced RAIM User Algorithm and Possible Improvements</em>, IEEE (Institute of Electrical and Electronics Engineers) TAES (Transactions on Aerospace and Electronic Systems) / ION (Institute of Navigation) ITM (International Technical Meeting).

# text
seg-a33e29861372 = Walter, Enge, Blanch, Pervan, <em>Worldwide Vertical Guidance of Aircraft Based on Modernized GPS and New Integrity Augmentations</em> (méthodologie du diagramme de Stanford).

# text
seg-d4f50d307775 = <s1>Précédent</s1>Spectre et cascade

# text
seg-f05ca316fe8e = <s1>Suivant</s1>Correspondance DO-316 / DO-229E
