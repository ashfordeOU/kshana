# docs--lunar-infrastructure: translations (fr)

# text
seg-cae10fb9bff8 = Scénario

# text
seg-61817375c8ea = Orbite et surface lunaires comme infrastructure de navigation et de géodésie

# text
seg-9872e31ebd72 = Sources

# text
# c1: docs/LUNAR-INFRASTRUCTURE.md
seg-922905241a6b = Source : <c1/>

# text
# c1: lunar-infrastructure
# c2: study
seg-bfb9c5efbe57 = Type de scénario <c1/>, cinq études choisies par <c2/>. <b>MODELLED</b> : un modèle restreint à trois corps avec des simplifications indiquées et des entrées ILLUSTRATIVE. Les calculs numériques sont vérifiés par rapport à des programmes numpy/scipy indépendants ; rien n'est comparé à une mesure d'une grandeur lunaire et rien ici n'est une affirmation sur une mission ou un système quelconque. Sans affiliation à aucune agence ni soutien de la part d'aucune. Logiciel à titre consultatif, et non un équipement homologué. Kshana ne transmet rien et ne pilote aucun matériel.

# text
# c1: xval/lunar-infra/PREREGISTRATION.md
# c2: PREREGISTRATION-amendment-1.md
# c3: xval/lunar-infra/RESULTS.md
seg-7908583855a2 = Les conceptions, les entrées et les seuils ont été fixés dans <c1/> (enregistré avant qu'aucune étude ne soit notée) et dans deux amendements divulgués (<c2/>). Le verdict de chaque seuil figure dans <c3/>.

# text
seg-d9d9d0864ae0 = Étude

# text
seg-3b01a756c305 = Ce qu'elle calcule

# text
# c1: family = "elfo"
seg-a4ef7c81b35f = Détermination d'orbite embarquée par GNSS terrestre dans une NRHO (ou <c1/>) comparée à une détermination d'orbite indépendante au sol par distance et vitesse de distance depuis trois stations DSN ; covariance formelle de chaque estimation ; un Monte-Carlo à graine fixe pour savoir si les deux covariances expliquent leur différence (q, khi-deux à { "6" } degrés de liberté) ; une accélération non modélisée injectée

# text
# c1: lunar-infrastructure-carrier-phase.toml
# c2: xval/lunar-infra/scenarios/carrier-phase-scored.toml
seg-849c67471e69 = <c1/> (rapide), <c2/> (noté, environ huit minutes)

# text
seg-b9c6eb8d778c = Phase de la porteuse à doubles différences conjointe d'une station de surface et d'un orbiteur ; covariance de l'ambiguïté flottante ; LAMBDA ; réussite par bootstrap et Monte-Carlo ; sigma de position flottante et fixée

# text
seg-74c347e0bc69 = Information de Fisher du référentiel lunaire à 7 paramètres à partir de la mesure de distance depuis des stations terrestres, avec et sans mesures de distance entre l'orbiteur et les stations de surface ; jeux de stations aléatoires à graine fixe

# text
seg-4ed875c39781 = GNSS, VLBI et télémétrie laser sur un seul engin spatial : précision de Cramér-Rao des décalages inter-techniques par rapport à l'erreur de liaison locale

# text
seg-de25104c09a2 = Information sur h2, k2, l2 et la libration physique à partir de la télémétrie laser, du suivi de l'orbiteur, d'un gravimètre et d'une horloge de surface (constantes partagées avec les modules de temps lunaire)

# attr:alt
seg-18fc4ba766df = Cohérence d'une détermination d'orbite embarquée par GNSS terrestre sur une orbite de halo quasi rectiligne avec une détermination d'orbite indépendante au sol, à partir d'exécutions réelles du moteur v{ $version } sur scenarios/lunar-infrastructure-od-consistency.toml et sa variante avec erreur de modèle ({ "400" } essais chacune). La différence normalisée moyenne q est de { "5.81" } sans erreur de modèle et de { "5.95" } avec une erreur d'accélération injectée de { "3e-10" } m/s2, pour { "6" } attendu : les deux solutions d'orbite sont cohérentes (seuil C1 MET). La part des essais au-dessus du point à { "95" } % est de { "0.040" } et { "0.052" } ; le seuil de détection de l'erreur injectée était d'au moins { "0.5" }, il est donc NOT MET (C3) : la solution embarquée est connue à environ { "352" } m contre { "23" } m pour celle du sol, de sorte qu'un déplacement de dix mètres se cache dans sa covariance. MODELLED : un modèle restreint à trois corps avec des simplifications indiquées et des entrées illustratives, non une mesure d'une grandeur lunaire. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sécurité de la vie humaine.

# attr:alt
seg-4c08262e2556 = Fixation de l'ambiguïté entière de la phase de la porteuse entre des stations de surface lunaire et un orbiteur, à partir du résultat enregistré de l'exécution notée du moteur v{ $version } (tests/fixtures/lunar_infra/phase_full_run.json : { "3" } durées d'arc, un Monte-Carlo de { "400" } tirages chacune, écrit par scenarios/carrier-phase-scored.toml). { "1" } jour : réussite { "1.0" } % (erreur type { "0.5" } %), { "134" } ambiguïtés, sigma de position de l'orbiteur { "45.6" } m flottant et { "18.5" } m fixé ; { "2" } jours : réussite { "0.5" } % (erreur type { "0.4" } %), { "259" } ambiguïtés, sigma de position de l'orbiteur { "21.5" } m flottant et { "8.7" } m fixé ; { "3" } jours : réussite { "2.8" } % (erreur type { "0.8" } %), { "375" } ambiguïtés, sigma de position de l'orbiteur { "6.3" } m flottant et { "2.1" } m fixé. La fixation entière n'est pas atteinte : la réussite reste entre { "1" } % et { "3" } % à { "25" } dBi, et à { "12" } dBi enregistré le problème ne peut pas être formé. MODELLED : un modèle restreint à trois corps avec des simplifications indiquées et des entrées illustratives, non une mesure d'une grandeur lunaire. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sécurité de la vie humaine.

# attr:alt
seg-7e5b10641b20 = Précision du référentiel lunaire à sept paramètres (trois translations, une échelle et trois rotations) à partir de la mesure de distance depuis des stations terrestres, avec et sans mesures de distance entre l'orbiteur et les stations de surface, à partir d'une exécution réelle du moteur v{ $version } sur scenarios/lunar-infrastructure-frame-coestimation.toml. Le sigma de Cramér-Rao des translations et des rotations diminue avec les liaisons de l'orbiteur (par exemple t_z de { "0.98" } m à { "0.046" } m) ; la plus petite valeur propre d'information est multipliée par 111 et la trace de la CRLB tombe à { "1.0" } % (seuil F3 MET). Cela suppose que l'orbite est connue dans les axes lunaires, son erreur étant portée par le sigma de distance de l'orbiteur de { "1" } m. MODELLED : un modèle restreint à trois corps avec des simplifications indiquées et des entrées illustratives, non une mesure d'une grandeur lunaire. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sécurité de la vie humaine.

# attr:alt
seg-377d29dcc6e8 = Précision des décalages entre les positions par télémétrie laser, VLBI et GNSS d'un même engin spatial, par rapport à l'erreur de la liaison locale au sol, à partir d'une exécution réelle du moteur v{ $version } sur scenarios/lunar-infrastructure-space-tie.toml (un arc de 6.56 jours, sigmas par technique GNSS { "10" } m, VLBI { "1" } m, laser { "0.1" } m). Avec une liaison locale de { "1" } mm à { "1" } m, le sigma de translation laser moins GNSS reste proche de { "1.04" } m jusqu'à ce que la liaison atteigne { "1" } m : il est limité par le bruit de mesure des techniques, non par la liaison locale. Le plancher fixé par la liaison seule est la racine carrée de deux fois son sigma. MODELLED : un modèle restreint à trois corps avec des simplifications indiquées et des entrées illustratives, non une mesure d'une grandeur lunaire. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sécurité de la vie humaine.

# attr:alt
seg-9d507a371319 = Quelle famille d'observables est sensible aux nombres de Love lunaires h2, k2 et l2, à partir d'une exécution réelle du moteur v{ $version } sur scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Chaque cellule est la dérivée partielle quadratique moyenne des observations d'une famille par rapport à un paramètre, dans les unités propres à cette famille (les cellules se comparent donc le long d'une ligne, non d'une colonne) ; un tiret signifie que la famille n'a aucune sensibilité. Télémétrie laser : h2 { "7.6" }, k2 aucune, l2 { "9.8" }. Suivi de l'orbiteur : h2 aucune, k2 { "0.00086" }, l2 aucune. Gravimètre de surface : h2 { "2.9e+03" }, k2 { "4.3e+03" }, l2 aucune. Horloge de surface : h2 { "2.8e-17" }, k2 { "2.8e-17" }, l2 aucune. Avec les quatre familles, le sigma de Cramér-Rao est de { "0.36" } % du h2 nominal, { "0.52" } % du k2 et { "1.16" } % du l2. L'ajout d'une famille n'a jamais abaissé la plus petite valeur propre ({ "28" } ajouts sur { "28" }), mais la trace de la pseudo-inverse n'était pas plus grande dans seulement { "16" } cas sur { "28" } : cette moitié du seuil G3 est NOT MET. La famille de l'orbiteur voit l'intégrale le long de la ligne de visée de l'accélération en k2, un chiffre de borne haute. MODELLED : un modèle restreint à trois corps avec des simplifications indiquées et des entrées illustratives, non une mesure d'une grandeur lunaire. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sécurité de la vie humaine.

# text
seg-570b9276834b = Simplifications indiquées

# text
# c1: geodesy-sensitivity
# c2: frame-coestimation
# c3: geodesy-sensitivity
seg-ab053aadb65d = Masses ponctuelles de la Terre et de la Lune sur une orbite circulaire, sans Soleil, sans harmoniques du champ de gravité lunaire ; l'axe de rotation de la Terre est la normale à l'orbite ; le référentiel inertiel est égal au référentiel tournant à t = { "0" } ; une Lune sphérique ; un référentiel lunaire synchrone (sans libration) sauf dans <c1/> ; l'orbite est tenue pour connue dans les axes lunaires dans <c2/> (son erreur est portée par le sigma de distance de l'orbiteur) ; la famille de l'orbiteur de <c3/> voit l'intégrale le long de la ligne de visée de l'accélération en k2 après retrait d'une constante et d'une tendance linéaire, un chiffre de borne haute.

# text
seg-fd644b1f33ec = Forme du rapport

# text
# c1: kind
# c2: study
# c3: label
# c4: scenario_hash
# c5: units
# c6: units
# c7: docs/field-units-schema.json
seg-03efc65cbb0e = Chaque rapport porte <c1/>, <c2/>, <c3/>, <c4/>, les champs de l'étude et un bloc <c5/> (une unité et une classe de provenance pour chaque champ numérique). Aucune série par instant n'est émise. Listes de champs : le bloc <c6/> de chaque rapport, et <c7/>.

# text
# c1: earthstns_fx
seg-bc9bb4f545e2 = k2 = { "0.024116" } +/- { "0.000108" } (Lemoine et al., Geophys. Res. Lett. { "41" }({ "10" }), 3382-3389, { "2014" }, doi 10.1002/2014GL060027), utilisé comme valeur nominale. h2 et l2 sont des points de linéarisation, non des valeurs vérifiées. Les coordonnées des stations DSN sont les valeurs ITRF93 des commentaires du noyau NAIF <c1/> ; les bandes de précision DSN n'ont été lues que dans des résumés de recherche. Le concept de liaison spatiale suit les descriptions publiques de GRASP et de Genesis de l'ESA. Le tableau complet, avec la façon dont chaque valeur a été lue, est dans le préenregistrement.

# text
seg-6cd670ae6eea = Résultats en un coup d'œil (voir RESULTS.md)

# text
seg-6334f82991d3 = Non atteints, et figés par des tests qui affirment l'échec : C3 (la mesure de l'erreur injectée ne se déclenche pas à { "3e-10" } m/s2), la moitié de Q3 portant sur le taux par bootstrap à { "1e-9" }, et la moitié de G3 portant sur la trace de la CRLB. La fixation de l'ambiguïté entière n'est pas atteinte aux entrées enregistrées. Rien n'est VALIDATED.

# text
seg-1d3bffc2fd02 = <s1>Précédent</s1>Navigation des utilisateurs de l'espace (gnss-ssv)

# text
seg-90932eed0074 = <s1>Suivant</s1>Positionnement, navigation et synchronisation temporelle LEO
