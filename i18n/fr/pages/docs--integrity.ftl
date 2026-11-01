# docs--integrity: translations (fr)

# text
# c1: docs/INTEGRITY.md
seg-668241606715 = Source : <c1/>

# text
seg-9a8c218ce054 = Intégrité et sécurité : ce que Kshana modélise, et ce qu'il ne modélise pas

# text
seg-52038c93765d = Kshana rapporte deux indicateurs de performance (FoM) — <b>Intégrité</b> et <b>Sécurité</b> — que l'on confond facilement avec les grandeurs de même nom de niveau aéronautique. Cette page indique clairement ce qu'ils sont aujourd'hui, ce qu'ils ne sont <em>pas</em>, et ce qu'ajoute la feuille de route. Si vous évaluez Kshana pour un contexte de sauvegarde de la vie humaine ou de certification, lisez ceci en premier.

# text
seg-fb6e93a107e7 = Aujourd'hui ({ "v0.37.0" })

# text
seg-ecd20ae1a05d = FoM d'intégrité — autocohérence du filtre

# text
seg-153391e55508 = Le FoM d'intégrité est la fraction des échantillons de la perte de signal dont l'erreur de synchronisation réelle reste à l'intérieur de la limite de protection à k sigma propre au filtre de Kalman :

# text
seg-ac2413a97a7b = Il mesure si l'incertitude <em>déclarée par le filtre lui-même</em> est honnête quant à <em>sa propre</em> erreur pendant une perte de signal GNSS (système mondial de navigation par satellite). C'est un contrôle de cohérence interne utile.

# text
seg-c9f80760ea53 = Ce n'est <b>pas</b> :

# text
seg-8899525ad177 = un <b>niveau de protection horizontal/vertical (HPL/VPL)</b> — il n'existe aucun niveau de protection dans le domaine de la position (les paquets d'horloge relèvent du domaine temporel) ;

# text
seg-dd9a3e58e10b = un <b>risque d'intégrité / une probabilité d'information dangereusement trompeuse (P_HMI)</b> ;

# text
seg-31fa92b3271d = une comparaison à une <b>limite d'alerte</b> ;

# text
seg-ee998b974e6f = conforme à <b>RTCA DO-229E / DO-316</b> ou <b>EUROCAE ED-259A</b> (RTCA : Radio Technical Commission for Aeronautics ; EUROCAE : Organisation européenne pour l'équipement de l'aviation civile) ni à aucune autre norme de certification.

# text
seg-f84a56b6fe10 = FoM de sécurité — borne analytique de détectabilité du leurrage

# text
seg-e532288ed262 = Le FoM de sécurité est une <b>borne de détectabilité du leurrage fondée sur la stabilité de l'horloge</b> : à partir du bruit d'une horloge (DSP (densités spectrales de puissance) de bruit blanc de fréquence et de marche aléatoire) et d'une fenêtre de surveillance, c'est la marge de détection analytique d'un moniteur de cohérence à horloge unique face à un leurrage de fausse heure à rampe lente. Une horloge plus silencieuse (par ex. une horloge optique) détecte un leurrage plus faible et plus lent qu'une horloge plus bruyante (par ex. une CSAC (horloge atomique à puce)) — ce contraste est l'objet du démonstrateur.

# text
# c1: spoof
seg-fc718a805b28 = Ce n'est <b>pas</b> un détecteur RAIM (surveillance autonome de l'intégrité par le récepteur) multisatellite. Il n'y a ni résidus de pseudodistance inter-satellites, ni niveau de protection, ni P_HMI. Le test innovation contre sigma a la même forme mathématique que la détection de défaut RAIM classique (Brown), mais le nombre est une borne analytique pour une horloge donnée, et non une mise en œuvre du RAIM, et il n'a de sens que dans le contexte d'un scénario de leurrage configuré (voir le type de scénario <c1/>, qui injecte une véritable attaque à rampe).

# text
# c1: clock
# c2: orbit
# c3: hybrid
# c4: fusion
# c5: security n/a (no attack)
# c6: fom.security
# c7: applicable: false
# c8: figure_tiers
seg-ae770e25031e = La sortie le dit. Les types <c1/>, <c2/>, <c3/> et <c4/> ne configurent aucune attaque ; leur résumé d'une ligne affiche donc <c5/> au lieu d'un nombre, et leur document de résultat marque <c6/> comme <c7/>, avec la raison, dans son bloc <c8/>. La valeur elle-même reste dans le document pour qui veut la borne.

# text
# c1: src/raim.rs
seg-960bd91a2b3a = RAIM réel par instantané, par séparation de solutions, et ARAIM (<c1/>)

# text
# c1: src/raim.rs
seg-3d31ec251ac0 = Un véritable RAIM dans le domaine de la position est mis en œuvre dans <c1/>, distinct du FoM d'autocohérence ci-dessus :

# text
seg-0e8240812c16 = <b>Surveillance des résidus multisatellite</b> — il construit la matrice de géométrie des lignes de visée vers les satellites visibles, forme la solution de position/horloge par moindres carrés, et teste la somme des carrés des résidus.

# text
# c1: SSE/σ²
# c2: chi2_{1-P_fa}(n-4)
seg-69f1535596e0 = <b>Détection de défaut par χ²</b> — <c1/> (SSE : somme des carrés des résidus) suit une loi χ²(n−{ "4" }) sous l'hypothèse d'absence de défaut ; un défaut est déclaré au-dessus de <c2/>. Les seuils du χ² proviennent d'une évaluation de la fonction gamma incomplète régularisée, sans dépendance (exacte, sans tables).

# text
# c1: max_i(slope_i)·pbias·σ
# c2: slope_i
# c3: pbias
# c4: P_md
seg-6721779048f5 = <b>HPL / VPL fondés sur la pente</b> — <c1/>, où <c2/> est la sensibilité de l'erreur de position à chaque satellite, tirée de la matrice chapeau, et <c3/> est le biais du χ² non centré qui respecte la probabilité de non-détection configurée <c4/>.

# text
# c1: Δ_k = x_k − x₀
seg-8dd60e98088d = <b>RAIM par séparation de solutions (MHSS : séparation de solutions à hypothèses multiples)</b> — pour la solution avec tous les satellites en vue et chaque sous-solution excluant un seul satellite, la séparation d'estimateurs imbriqués <c1/> <b>détecte et identifie</b> à la fois le satellite défaillant et alimente la borne du niveau de protection.

# text
# c1: araim_raim
# c2: P_HMI = Σ_k p_fault,k · Q((PL − T_k)/σ_k)
# c3: K_md
seg-719e27fdd2c1 = <b>Budget de risque d'intégrité (P_HMI) ARAIM (surveillance autonome avancée de l'intégrité par le récepteur)</b> — <c1/> résout le plus petit HPL/VPL dont la probabilité cumulée d'information dangereusement trompeuse <c2/> (Blanch et al., <em>Baseline ARAIM</em>) respecte une allocation explicite de risque d'intégrité, et rapporte le risque qu'atteignent les niveaux — de sorte que l'intégrité peut être arbitrée directement contre la limite d'alerte, au lieu d'être laissée implicite dans un multiplicateur fixe <c3/>.

# text
# c1: (error, PL)
seg-2f99acf45203 = <b>Diagramme d'intégrité Stanford–ESA</b> (ESA : Agence spatiale européenne) — un accumulateur par époque classe <c1/> dans les régions Disponible / Système indisponible / Trompeur / Dangereusement trompeur, pour un résumé de disponibilité.

# text
# c1: integrity
# c2: scenarios/integrity-raim.toml
# c3: scenarios/integrity-raim.toml
seg-33d01969fb0f = <b>Accessible de bout en bout</b> — le type de scénario <c1/> exécute ce qui précède sur une constellation SGP4 (Simplified General Perturbations { "4" }) ou képlérienne, ou lue à partir de véritables TLE (jeux d'éléments à deux lignes) ou d'un fichier de navigation RINEX (Receiver Independent Exchange Format), et produit une carte de disponibilité HPL/VPL par époque par rapport aux limites d'alerte configurées (<c2/>). La même exécution <b>exporte un diagramme de Stanford vertical</b> : à chaque époque protégée, un tirage reproductible, initialisé, d'erreur de distance sans défaut est projeté par la géométrie en une erreur verticale réelle et classé par rapport au VPL et à la limite d'alerte verticale, de sorte que le résultat JSON (JavaScript Object Notation) et le résumé de l'interface en ligne de commande (CLI) portent les effectifs par région (événements d'intégrité, et HMI : information dangereusement trompeuse) — et pas seulement une fraction de disponibilité. Sur le fichier <c3/> fourni, l'exécution rapporte { "344" } époques disponibles sur { "361" } ({ "95.3" } %) avec une limite d'alerte de { "40" } m à l'horizontale et { "50" } m à la verticale, avec { "0" } événement d'intégrité et { "0" } HMI.

# text
# c1: araim_dual_raim
# c2: P_const
# c3: IntegritySupportMessage
# c4: σ_URA
# c5: σ_URE
# c6: b_nom
# c7: P_sat
# c8: P_const
# c9: P_const = 0
# c10: araim_raim
# c11: integrity
# c12: araim_dual = true
# c13: scenarios/araim-gps-galileo.toml
seg-54e778eceef4 = <b>ARAIM à double constellation avec message de support d'intégrité</b> — <c1/> ajoute le <b>mode de défaut à l'échelle de la constellation</b> : outre les hypothèses sans défaut et de défaut d'un seul satellite, chaque constellation apporte une hypothèse qui retire tous ses satellites, avec l'a priori <c2/>, à la même somme de risque d'intégrité MHSS. Le <c3/> (ISM) porte la précision de distance de l'utilisateur pour l'intégrité (<c4/>), la valeur efficace de la précision (<c5/>), le biais nominal maximal <c6/> intégré unilatéralement dans chaque mode, et les a priori <c7/> et <c8/> ; son jeu de référence WG-C (Working Group C de la coopération Union européenne–États-Unis sur la navigation par satellite, dont le sous-groupe technique ARAIM publie la référence) est σ_URA = { "0.75" } m, σ_URE = { "0.67" } m, b_nom = { "0.75" } m, P_sat = { "1e-5" } et P_const = { "1e-4" }. <c9/> reproduit à l'identique, bit pour bit, le résultat de <c10/> à défaut unique. Le type <c11/> emprunte ce chemin avec <c12/> (<c13/> : GPS + Galileo, { "48" } satellites, { "145" } époques disponibles sur { "145" } aux mêmes limites d'alerte).

# text
# c1: araim-reference-check
# c2: araim_protection_level
# c3: araim_integrity_risk
# c4: VERIFICATION-MATRIX.md
seg-1f06bc1976bd = <b>Niveaux de protection par rapport à des vecteurs de référence publiés</b> — le type <c1/> exécute <c2/> et <c3/> du moteur sur les exemples traités du sous-groupe ARAIM du WG-C (le Reference Airborne Algorithm Description Document v3.1, { "2019" }, annexe D, et le rapport du jalon { "3" }, { "2016" }, annexe A). L'écart le plus défavorable de niveau de protection vertical/horizontal sur le vecteur d'acceptation est de { "0.0437" } m, pour une tolérance propre aux documents de { "0.05" } m. Cette ligne est VALIDATED dans <a1><c4/></a1> : elle vérifie l'équation du niveau de protection, et non un ISM opérationnel ni un récepteur.

# text
seg-1dda7b318c5f = L'écart restant (feuille de route)

# text
# c1: raim.rs
seg-e27215296e1a = Ce que <c1/> ne fait <b>pas</b> encore :

# text
seg-964c0634eae0 = il n'est <b>pas intégré au FoM des scénarios d'horloge/holdover</b> — ces paquets rapportent toujours le chiffre d'intégrité d'autocohérence du filtre ci-dessus, et non un HPL/VPL ;

# text
seg-eecf2f9f181e = les hypothèses de défaut sont le cas sans défaut, les <b>satellites individuels</b> et les <b>constellations entières</b> — les défauts simultanés sur des <b>sous-ensembles de deux satellites ou plus (SV : space vehicle, c'est-à-dire un satellite)</b> ne sont pas modélisés ;

# text
seg-fd0f9fb2de83 = l'ISM est un jeu de paramètres configurable (avec les valeurs de référence du WG-C), et non un message opérationnel diffusé ni un modèle de menace validé ;

# text
# c1: snapshot_raim_fde
# c2: integrity
seg-88f5242b0809 = la <b>détection et exclusion de défaut (FDE)</b> ne porte que sur un seul satellite et sur l'instantané : la séparation de solutions désigne le satellite défaillant, et <c1/> résout de nouveau chaque exclusion d'un seul satellite et renvoie le satellite exclu avec le test du khi-deux et les niveaux de protection du sous-ensemble restant, mais aucune position protégée après exclusion n'est rapportée, et le type de scénario <c2/> n'exécute pas l'étape d'exclusion.

# text
# c1: tests/igs_real_data.rs
# c2: P_HMI
# c3: tests/araim_dual_real_data.rs
# c4: REAL_TLE_GUIDE.md
# c5: pvt
seg-c85aa5dedc86 = Les noyaux par instantané, par séparation de solutions et ARAIM sont éprouvés sur une <b>géométrie réelle d'orbites précises IGS (International GNSS Service) (SP3 : Standard Product { "3" })</b>, et pas seulement sur des constellations synthétiques : <c1/> forme la géométrie des lignes de visée à partir de la première époque d'un véritable produit SP3 de l'IGS à une station au sol réelle, et vérifie que les niveaux de protection sont finis et à l'intérieur des limites d'alerte APV-I (approche avec guidage vertical) de { "40" } m à l'horizontale et { "50" } m à la verticale, qu'un biais de pseudodistance de { "60" } m fait déclencher le moniteur χ², que la séparation de solutions <b>identifie</b> le satellite défaillant, et que les niveaux de l'ARAIM respectent le <c2/> alloué. <c3/> exécute le chemin à double constellation sur les véritables catalogues Celestrak GPS et Galileo du 2026-06-07, propagés à une époque commune (voir <a1><c4/></a1> §{ "3" }). Un contrôle croisé plus poussé — comparer les niveaux de protection époque par époque avec gLAB (le GNSS-Lab Tool, une suite de traitement de données GNSS distribuée par l'ESA) sur un arc complet d'observations RINEX — ajouterait une parité dans le domaine du récepteur. Il n'est pas fait : le type <c5/> calcule une position ponctuelle par le code à partir d'observations RINEX réelles, mais aucun niveau de protection issu de cette solution n'a été comparé à celui de gLAB.

# text
# c1: raim.rs
# c2: integrity
# c3: araim-reference-check
seg-f5fac2e836a6 = <c1/> est donc un véritable noyau de niveau de protection et de risque d'intégrité, accessible depuis les types de scénario <c2/> et <c3/>, éprouvé sur une géométrie d'orbites de référence réelles, et vérifié par rapport aux vecteurs de référence du WG-C. Les défauts sur des sous-ensembles de plusieurs satellites, la parité gLAB dans le domaine du récepteur et l'intégration au FoM d'horloge restent des éléments de la feuille de route, et rien de tout cela ne constitue une preuve de certification.

# text
# c1: GLOSSARY.md
seg-487f24ed92d8 = <a1><c1/></a1> — définitions en une ligne de chaque FoM et abréviation.

# text
# c1: ARAIM_REFERENCE.md
seg-7d3c12cf802e = <a1><c1/></a1> — les paramètres de l'ISM et les vecteurs de référence du WG-C.

# text
# c1: SLOT-TIMING.md
seg-04532ba5288f = <a1><c1/></a1> — le niveau de protection de synchronisation (TPL) d'une horloge en roue libre, qui est conditionnel à la détection.

# text
# c1: VALIDATION.md
seg-43cea496da93 = <a1><c1/></a1> — quelles grandeurs sont validées par rapport à une référence et lesquelles sont des contrôles d'autocohérence.

# text
# c1: src/security.rs
seg-3037dde8135f = <c1/> — la dérivation de la borne de détectabilité du leurrage.

# text
seg-04d63778ca7f = RAIM à côté des FoM de holdover d'horloge ({ "0.36" }, sur option)

# text
# c1: [integrity]
# c2: src/clock_integrity.rs
# c3: lat_deg
# c4: lon_deg
# c5: height_m
# c6: systems
# c7: gps-baseline
# c8: integrity_fom
# c9: available
# c10: alarm
# c11: unavailable-pl-above-al
# c12: unavailable-too-few-satellites
# c13: unavailable-gnss-denied
# c14: runs = 1
seg-744e95749978 = Un scénario d'horloge peut comporter une section <c1/> (<c2/>) : un site (<c3/>, <c4/>, <c5/>), des préréglages de constellation (<c6/>, par défaut <c7/>), un masque, un sigma de résidu de distance, les probabilités de fausse alarme et de non-détection, les limites d'alerte horizontale et verticale, un espacement des époques et un biais déclaré facultatif sur un satellite. L'exécution rapporte alors un bloc <c8/> distinct : par époque, les satellites en vue, les niveaux de protection RAIM par instantané et un verdict (<c9/>, <c10/>, <c11/>, <c12/>, <c13/>), ainsi que les effectifs et la disponibilité sur l'exécution. Tant que la chronologie indique que le GNSS est refusé, le RAIM est indisponible et rien n'est extrapolé ; une fenêtre dégradée est évaluée comme nominale. Les FoM de holdover sont inchangés, et sans la section la sortie est identique octet pour octet. MODELLED : un ciel préréglé représentatif, des résidus synthétiques et des limites déclarées. Elle nécessite <c14/>.

# text
seg-139639263c90 = La reproduction de l'URA maximale du jalon { "3" } de l'ARAIM du WG-C UE–États-Unis (CAP-05c)

# text
seg-97906754d4c8 = Un plan antérieur promettait une comparaison avec le « Table A-3 » d'une note technique EU-ARAIM. Aucune source publique de ce tableau n'a pu être trouvée (les rapports publics des jalons { "1" } à { "3" } du sous-groupe technique ARAIM du Working Group C UE–États-Unis n'ont pas de Table A-3) ; cette comparaison est donc <b>retirée</b> et rien n'est promis sous ce nom.

# text
# c1: 156147e1...13d8
# c2: sigma_URA
# c3: xval/araim-m3/PREREGISTRATION.md
# c4: src/bin/gen_araim_m3_study.rs
# c5: xval/araim-m3/results.json
# c6: tests/araim_m3_reproduction.rs
seg-b61607c477f2 = Ce qui est tenté à la place, c'est le rapport qui est public : le <b>rapport du jalon { "3" }</b> ({ "25" } février { "2016" }, copie de GPS.gov, SHA-256 <c1/>), tableaux { "5" }, { "6" } et { "7" }, qui impriment, pour chaque configuration de constellation et pour chacun de RNP { "0.1" } et RNP { "0.3" }, le plus grand <c2/> pour lequel { "90" } % des utilisateurs ont { "99.5" } % de disponibilité. Douze entrées imprimées (les lignes Depleted et Baseline des tableaux bifréquence) sont vérifiées, selon des seuils préenregistrés dans <a1><c3/></a1> avant toute exécution notée, avec les écarts impossibles à supprimer qui y sont déclarés : pas de fichiers d'almanach, des couches de Walker au lieu des créneaux réels, une grille et un pas plus grossiers, et le chemin horizontal ADD v4.2 du moteur à la place du texte propre au rapport. Les tableaux { "8" } à { "13" } (monofréquence) et les lignes Optimistic ne sont pas tentés, pour les raisons qui y sont données. <b>Résultat : { "8" } entrées sur { "12" } reproduites, { "4" } NOT MET (épinglées) :</b> les entrées à double constellation et toutes les entrées Galileo seul concordent (y compris les lignes N/A), l'entrée double Depleted RNP { "0.1" } atteint une couverture de { "0.847" } à { "9" } m contre les { "9" } m imprimés (il faut { "0.90" }), et trois entrées GPS seul échouent largement (couverture { "0.70" } à { "4" } m, { "0.58" } à { "6" } m, { "0.65" } à { "10" } m contre { "4" } m, { "6" } m et « >{ "10" } m » imprimés). Les écarts du GPS seul peuvent provenir de la couche de Walker uniforme tenant lieu des véritables créneaux GPS (D1) ; c'est une hypothèse, et non un constat. Le résultat reste MODELLED quel qu'il soit. L'étude est <c4/> ; ses couvertures mesurées sont dans <c5/> et notées par <c6/>. Le rapport lui-même est cité, non intégré.

# text
seg-0e98826cedcc = <s1>Précédent</s1>Sécurité matérielle

# text
seg-e6f1e38977b7 = <s1>Suivant</s1>Spectre et cascade

# text
seg-38ab3bb65327 = RAIM réel par instantané, par séparation de solutions, et ARAIM (src/raim.rs)
