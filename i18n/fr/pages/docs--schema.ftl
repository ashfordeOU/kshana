# docs--schema: translations (fr)

# text
seg-2247a2344710 = Signification

# text
seg-f42465f7d066 = ns

# text
seg-f63dd3d7aad4 = Source

# text
seg-6940543aa3c0 = chaîne

# text
seg-f5e7215e6835 = objet

# text
seg-9da5d92757bd = objet, facultatif

# text
seg-c353e7bec219 = Clé

# text
seg-a129b9e613d0 = Type

# text
# c1: docs/SCHEMA.md
seg-e28387d70be0 = Source : <c1/>

# text
# c1: *.result.json
seg-49d2afecf5f1 = Schéma des résultats — lire un <c1/> de Kshana

# text
# c1: RunResult
# c2: src/report.rs
# c3: FoMScores
# c4: src/fom.rs
seg-c128455c353c = Chaque exécution écrit, à côté du scénario, un artefact JSON (JavaScript Object Notation) versionné et auto-descriptif. Cette page est le guide du lecteur, rédigé à la main, de l'enveloppe d'échange et des structures de résultats <b>d'horloge et d'orbite</b> : l'<b>unité</b> de chaque champ, l'endroit du code source où il est calculé et la manière de le lire. Le type de référence est <c1/> dans <a1><c2/></a1> ; les indicateurs de performance sont <c3/> dans <a2><c4/></a2>.

# text
seg-092ea1e33a05 = Ce n'est <b>pas</b> la référence complète des champs. Le moteur aiguille l'exécution sur beaucoup plus de types que ces deux-là, et chacun produit son propre paquet. La référence complète — unité, classe de provenance et définition de chaque champ numérique de chaque type intégré — est générée, non rédigée à la main : voir <a1>Unités et provenance, par champ, pour chaque type</a1> ci-dessous.

# text
seg-e4c4b66a2f46 = Enveloppe d'échange (KIF, le Kshana Interchange Format) — reconnaître un artefact et en vérifier la version

# text
# c1: Envelope
# c2: src/interchange.rs
seg-9b83bb817814 = Les artefacts Kshana peuvent être encapsulés dans une <b>enveloppe d'échange</b> neutre et auto-descriptive, afin qu'un outil tiers puisse reconnaître le fichier et décider s'il sait le lire <em>avant</em> de s'engager sur un schéma de charge utile. Le type de référence est <c1/> dans <a1><c2/></a1>.

# text
# c1: "kshana-interchange"
# c2: FORMAT_TAG
seg-e4fd08930644 = Toujours <c1/> (<c2/>) — c'est ainsi qu'un outil étranger reconnaît un artefact Kshana.

# text
# c1: MAJOR.MINOR
# c2: SCHEMA_VERSION
seg-abd853f2ce49 = La version de schéma <c1/> (<c2/>, la source de vérité unique pour toute la crate).

# text
# c1: "scenario"
# c2: "run-result"
# c3: "trade-study"
seg-ee9f238072f1 = Type d'artefact, p. ex. <c1/>, <c2/>, <c3/> — permet à un consommateur d'aiguiller sans analyser le corps.

# text
# c1: Cargo.toml
seg-29ad4bedd64f = Version de la crate (<c1/>) qui a produit la charge utile.

# text
# c1: Scenario
# c2: RunResult
seg-52f3e962c049 = L'artefact encapsulé, en JSON canonique (un <c1/>, un <c2/>, …).

# text
# c1: MAJOR.MINOR
# c2: #[serde(default)]
# c3: Compatible
# c4: ForwardIncompatible
# c5: MajorIncompatible
# c6: Envelope::parse
seg-6fe0d7cd4165 = <b>Contrat de compatibilité.</b> Les versions sont de la forme <c1/>. Les nouveaux champs sont ajoutés avec <c2/> (la <em>discipline additive</em>), si bien qu'un lecteur peut analyser tout artefact de la <b>même version majeure et d'une version mineure égale ou plus ancienne</b> (<c3/>). Une version <b>mineure strictement plus récente</b> (<c4/>) peut porter des champs que ce lecteur ne peut pas honorer, et une <b>version majeure différente</b> (<c5/>) constitue une rupture structurelle — les deux sont refusées par <c6/>, qui valide l'étiquette de format et la version à la frontière au lieu d'analyser de travers, sans le signaler, une entrée étrangère.

# text
# c1: scenario + seed + engine_version
# c2: engine_version
# c3: scenario_hash
seg-f7ae91002e56 = <b>Déterminisme.</b> L'enveloppe ne contient <b>aucun horodatage</b> — la promesse de reproductibilité de Kshana (<c1/> reproduit une exécution) l'exige. La provenance se trouve dans <c2/> et dans le <c3/> propre à la charge utile.

# text
# c1: Envelope::payload_as::<T>()
# c2: Deserialize
# c3: Scenario
# c4: payload
seg-bb0b742d2df8 = Une relecture typée (<c1/>) fonctionne pour toute charge utile qui implémente <c2/> (p. ex. <c3/>). Les artefacts de résultats sont en sérialisation seule par conception et se lisent comme la valeur JSON brute de <c4/>.

# text
seg-87be7aa00b17 = Niveau supérieur (paquets d'horloge et d'orbite)

# text
seg-cc22d9206eb4 = Type / unité

# text
seg-3a821855c582 = Version du schéma de résultats (indépendante de la version du moteur).

# text
# c1: Cargo.toml
seg-cc6dded799f9 = Version de la crate (<c1/>) qui a produit le fichier.

# text
seg-5a69a99b9a87 = chaîne hexadécimale

# text
# c1: scenario + seed + engine_version
seg-441eb1f43399 = SHA-256 (SHA : Secure Hash Algorithm) du JSON canonique du scénario — l'exécution est reproductible à partir de <c1/>.

# text
# c1: seed + 0x9e3779b97f4a7c15
seg-ba73ba76873e = Graine du RNG (générateur de nombres aléatoires) pour l'exécution quantique (l'exécution classique utilise <c1/>).

# text
seg-a688dd98c588 = nanosecondes

# text
# c1: threshold_ns
seg-24e0f04033fa = La spécification de synchronisation temporelle : une erreur comprise dans ±<c1/> est « dans la spécification ».

# text
seg-f52388753a1a = scénario

# text
# c1: ClockRun
seg-15b4082a6455 = objet (<c1/>)

# text
seg-7d3b92769bf5 = L'exécution du capteur quantique (voir ci-dessous).

# text
seg-aa665b955931 = L'exécution du capteur classique, à titre de comparaison.

# text
seg-152ae43896b3 = Table des unités et de la provenance par champ pour ce document, indexée par chemin de champ. Voir §Unités et provenance ci-dessous.

# text
# c1: figures
# c2: path
# c3: quantum.fom.timing_p95_ns
# c4: tier
# c5: VALIDATED
# c6: MODELLED
# c7: requirement
# c8: applicable
# c9: applicable
# c10: false
# c11: reason
# c12: security
# c13: fom.security
# c14: untiered
# c15: hybrid
# c16: fusion
# c17: clock
# c18: orbit
# c19: hybrid
# c20: fusion
# c21: fom_label::kind_figures
# c22: api::without_figure_tiers
# c23: lunar-station-coverage
# c24: docs/predictions/lunar-reference-station.md
# c25: figure_tiers
# c26: leo-ppp
# c27: solar-system
# c28: optical-atmosphere
# c29: sweep
# c30: sweep-nd
# c31: lunar-attack-surface
# c32: fom_label::KINDS_EXCLUDED_FROM_FIGURE_TIERS
seg-119bac9b3e6f = Le niveau de vérification de chaque indicateur de performance rapporté, et toujours la dernière clé du document. <c1/> liste une entrée par indicateur présent : <c2/> (p. ex. <c3/>), <c4/> (<c5/> = vérifié par rapport à une référence indépendante externe, <c6/> = issu des premiers principes, testé en interne), <c7/> (la ligne de la matrice de vérification dont le niveau est tiré) et <c8/>. <c9/> vaut <c10/>, avec un <c11/>, pour <c12/> dans tout scénario sans attaque configurée : la borne reste dans <c13/>, mais elle ne répond à aucune question posée par le scénario. <c14/> liste tout indicateur qu'aucune ligne de la matrice ne possède (les indicateurs de position <c15/> et <c16/>), au lieu de lui attribuer un niveau. Émis par les types <c17/> (exécution unique et ensemble Monte Carlo), <c18/>, <c19/> et <c20/>, qui le construisent pendant leur exécution, et ({ "0.36" }, RM-04) par tous les autres types pour leurs indicateurs principaux, ajouté après l'exécution à partir de la table par type <c21/> ; <c22/> le retire pour retrouver, octet pour octet, le document sans niveaux. Non émis par <c23/>, dont le résultat est une prédiction figée et préenregistrée (<c24/>) : ce type n'a pas de <c25/> tant qu'une nouvelle prédiction datée ne remplace pas la précédente. Également non émis par <c26/>, <c27/>, <c28/> ({ "0.37" } ; tableaux par site), <c29/> et <c30/>, qui n'ont aucun indicateur principal scalaire, ni par <c31/>, dont le document est du JSON compact (<c32/> donne chaque raison), ni par les documents de membres intégrés d'une campagne. Ne contient aucun nombre.

# text
# c1: samples_total
# c2: samples_with_fix
# c3: sigma_uere_m
# c4: best_pdop
# c5: median_pdop
# c6: best_position_sigma_m
# c7: median_position_sigma_m
# c8: sigma_uere_m
seg-1448f90f0086 = Résumé de géométrie du paquet d'orbite : <c1/>, <c2/>, <c3/> (m, le budget d'erreur de distance par satellite, issu du modèle), <c4/> / <c5/> (sans dimension) et <c6/> / <c7/> (m, PDOP (dilution de précision en position) × <c8/>). <b>Paquet d'orbite uniquement.</b>

# text
# c1: [x, y, z]
seg-ae4f8eed06ac = tableau de <c1/> km, facultatif

# text
seg-d13d827f54b0 = Trace inertielle géocentrique propagée du véhicule spatial de l'utilisateur, une entrée par instant échantillonné. <b>Paquet d'orbite uniquement</b> ; omise sinon. Sortie seule — non hachée.

# text
# c1: StudyMeta
seg-8f511d5de657 = objet (<c1/>), facultatif

# text
seg-ea152e097d6f = Métadonnées additives du rapport (titre de l'étude, horodatage de génération, auteur, avertissement). Omises en leur absence, de sorte qu'une exécution sans métadonnées est identique octet pour octet à la sortie historique. Sortie seule — non hachée.

# text
# c1: ClockRun
# c2: quantum
# c3: classical
seg-1041873fba1b = <c1/> (pour chacun de <c2/> / <c3/>)

# text
# c1: optical-sr-lattice
seg-3fa81140c10d = Identifiant du capteur (p. ex. <c1/>).

# text
# c1: clock
seg-80765d202558 = Type de modèle (p. ex. <c1/>).

# text
seg-6bf458d964fe = Citation ou source des paramètres du capteur.

# text
seg-9145f04a557f = Les paramètres bruts du modèle utilisés.

# text
# c1: {t, error_ns, gnss}
seg-697940342a28 = tableau de <c1/>

# text
# c1: t
# c2: error_ns
# c3: gnss
# c4: nominal
# c5: degraded
# c6: denied
seg-b5f4216b55a2 = Série temporelle par pas : <c1/> secondes, <c2/> l'erreur de synchronisation temporelle en <b>nanosecondes</b>, <c3/> l'un de <c4/>/<c5/>/<c6/>.

# text
# c1: FoMScores
seg-7fba0b91b75e = objet (<c1/>)

# text
seg-5c4b60012f0e = Les indicateurs de performance évalués (ci-dessous).

# text
# c1: {tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}
seg-1308a29c6a5b = tableau de <c1/>

# text
# c1: tau_s
# c2: adev
# c3: n_samples
# c4: noise
# c5: WhiteFm
# c6: edf
# c7: ci_lo
# c8: ci_hi
# c9: adev
# c10: allan.rs:overlapping_adev_curve
seg-bbd42065492c = Écart-type d'Allan avec recouvrement : <c1/> le temps de moyennage (s), <c2/> la stabilité fractionnaire de fréquence σ_y(τ), sans dimension, <c3/> le nombre de recouvrements derrière ce point, <c4/> le type de loi de puissance identifié à partir de la pente du MDEV (écart-type d'Allan modifié) (p. ex. <c5/>), <c6/> le nombre de degrés de liberté effectifs propre au type de bruit, et <c7/>/<c8/> la bande de confiance à { "95" } % fondée sur le χ² pour <c9/> à ce τ. Calculé dans <c10/>.

# text
# c1: filter_health.rs
seg-1e61fd18257f = Évaluation de la cohérence du filtre de Kalman (NIS/NEES (NIS : carré normalisé de l'innovation ; NEES : carré normalisé de l'erreur d'estimation) par rapport à leurs bandes du χ²), calculée dans <c1/> ; omise pour les exécutions qui ne l'évaluent pas.

# text
# c1: FoMScores
# c2: fom
seg-9333864652b0 = <c1/> (l'objet <c2/>)

# text
seg-ce9caeaefd87 = Réserve

# text
seg-b24de276d788 = Erreur de phase d'horloge (synchronisation temporelle) en valeur quadratique moyenne (RMS) sur la durée de la coupure.

# text
seg-53e5018ae276 = une métrique de <b>synchronisation temporelle</b>, et non de position

# text
seg-8cdec6da2072 = Erreur de synchronisation temporelle au 95e centile sur la durée de la coupure.

# text
seg-95f058adb809 = Marche libre dans la spécification, au pire cas (la plus courte), parmi les segments de coupure.

# text
seg-48babfd3bd95 = <b>borné par la grille</b> — une borne inférieure à la résolution du pas de temps

# text
seg-41c08973baa1 = Taux de croissance de |erreur| pendant la coupure, au sens des moindres carrés.

# text
seg-707ee74c5c06 = fraction [{ "0,1" }]

# text
seg-32e5fe6415f8 = Fraction de l'exécution entière disposant d'une solution dans la spécification.

# text
seg-361b3b923a45 = fraction [{ "0,1" }] ou null

# text
seg-5d55682f9349 = <b>Auto-cohérence du filtre</b> : fraction des échantillons de la coupure dont l'erreur réelle reste à l'intérieur de la borne k-σ de Kalman.

# text
# c1: INTEGRITY.md
seg-636106cb4a40 = <b>PAS</b> de l'intégrité HPL/VPL/RAIM (HPL : niveau de protection horizontal ; VPL : niveau de protection vertical ; RAIM : surveillance autonome de l'intégrité par le récepteur) — voir <a1><c1/></a1>

# text
seg-f686ade3da21 = <b>Borne analytique de détectabilité du leurrage</b> fondée sur la stabilité de l'horloge.

# text
# c1: applicable: false
# c2: figure_tiers
# c3: n/a (no attack)
seg-f8783db25141 = n'a de sens qu'avec une attaque configurée ; les paquets d'horloge et d'orbite (qui n'en configurent aucune) la marquent donc <c1/> dans <c2/> et l'impriment comme <c3/> dans le résumé ; <b>pas</b> un détecteur RAIM multisatellite

# text
seg-90e2980430b9 = À quoi ressemble un « bon » résultat

# text
# c1: adev_curve
# c2: holdover_s
# c3: security
seg-c1afc6f3c545 = Une <b>horloge plus stable</b> (<c1/> plus bas) donne un <c2/> plus long et une borne de détectabilité <c3/> plus élevée — c'est le contraste entre quantique et classique.

# text
# c1: availability
seg-0fa38207813a = <c1/> proche de { "1.0" } signifie que le système est resté dans la spécification presque toute l'exécution ; pendant une longue coupure, elle baisse pour l'horloge la plus bruitée.

# text
# c1: integrity
seg-4dcba241d5a6 = <c1/> proche de { "1.0" } signifie que la borne d'incertitude propre au filtre était honnête quant à son erreur — une affirmation d'<em>auto-cohérence</em>, et non une garantie de sauvegarde de la vie humaine.

# text
seg-3099d75a04a5 = Autres types de scénario

# text
seg-43cd9f67f384 = Chaque autre type émet sa propre structure de résultats. Quelques-uns des plus courants :

# text
# c1: pos_rms_m
# c2: pos_p95_m
# c3: CAPABILITY.md
seg-6b59ef9dfe85 = <b>inertial</b> : indicateurs de performance dans le domaine de la position, en <b>mètres</b> (<c1/>, <c2/>) — à un seul axe (1-DOF (DOF : degré de liberté)), à une seule graine (voir <a1><c3/></a1>).

# text
# c1: timing_spec_ns
# c2: position_spec_m
# c3: position_p95_m
# c4: position_holdover_s
# c5: pnt_holdover_s
# c6: figure_tiers
# c7: untiered
seg-3e3ec8985dde = <b>hybrid / fusion</b> : <c1/> et <c2/> au niveau supérieur, et, pour chaque côté, les indicateurs de synchronisation temporelle et de position d'une suite de capteurs (<c3/>, <c4/> et <c5/>, la durée jusqu'à ce que l'une ou l'autre spécification soit dépassée), avec un bloc <c6/> comme celui du paquet d'horloge, dans lequel les indicateurs de position sont listés comme <c7/>.

# text
# c1: src/spoof.rs
seg-e38e8a8adec8 = <b>spoof</b> : décalage de leurrage à chaque pas par rapport à la borne de détection de l'horloge, et indication de si le leurrage a atteint la spécification avant d'être détecté (<c1/>).

# text
# c1: orbit
# c2: integrity
# c3: user_site
# c4: gnss-sim
# c5: jamming
# c6: leo-pvt
# c7: leo-pass
# c8: [skyline]
# c9: skyline
# c10: source
# c11: preset:<name>
# c12: preset:<name>+overrides
# c13: custom
# c14: open_fraction
# c15: max(mask_deg, skyline)
# c16: provenance
# c17: masked_by_skyline
# c18: epochs[]
# c19: integrity
# c20: jamming
# c21: gnss_measurements[]
# c22: gnss-sim
# c23: joint.epochs[]
# c24: leo-pvt
# c25: leo-pass
# c26: satellites[].pass.epochs_masked_by_skyline
# c27: units
# c28: src/skyline.rs
# c29: UNITS
# c30: SKYLINE.md
seg-dfd972d160e1 = <b>skyline</b> (<c1/> et <c2/> avec <c3/>, <c4/>, <c5/>, <c6/>, <c7/> ; présent seulement lorsque le scénario comporte une section <c8/>, de sorte qu'un scénario sans elle reste inchangé) : un objet <c9/> au niveau supérieur avec <c10/> (chaîne : <c11/>, <c12/> ou <c13/>), <c14/> (fraction [{ "0,1" }] de l'angle solide de l'hémisphère supérieur au-dessus de <c15/>) et <c16/> (chaîne) ; par échantillon, <c17/> (nombre de satellites au-dessus du masque mais derrière la ligne d'horizon : <c18/> de <c19/> et <c20/>, <c21/> de <c22/>, <c23/> de <c24/>) ; et, pour <c25/>, <c26/> (nombre d'époques). Leurs unités et classes de provenance figurent dans le bloc <c27/> (<c28/> <c29/> ; <a1><c30/></a1>).

# text
# c1: field-units-schema.json
# c2: SCENARIOS.md
# c3: *Result
# c4: src/
seg-d113122b7454 = Pour l'ensemble précis des champs d'un type, lisez son entrée dans <a1><c1/></a1> (ci-dessous), la section de ce type dans <a2><c2/></a2>, ou la structure <c3/> correspondante dans <c4/>.

# text
seg-e0c63207c019 = Autres fichiers écrits par une exécution

# text
# c1: <scenario>.result.json
# c2: <scenario>.chart.svg
# c3: <scenario>.report.html
# c4: <scenario>.report.json
# c5: reproducibility
# c6: REPORTS.md
# c7: REPRODUCIBILITY.md
# c8: <scenario>.table.csv
# c9: --export
# c10: INTEROP.md
# c11: --animate
# c12: ANIMATION.md
seg-cc97989ca06b = En plus de <c1/>, la CLI (interface en ligne de commande) écrit <c2/>, un <c3/> imprimable et le même rapport sous la forme <c4/>, dont le bloc <c5/> consigne la version du moteur, le SHA-256 du fichier de scénario, la graine, la plateforme et la commande exacte (voir <a1><c6/></a1> et <a2><c7/></a2>). Les types qui publient une table de reproductibilité écrivent aussi <c8/> (CSV : valeurs séparées par des virgules). <c9/> écrit des fichiers d'échange (voir <a3><c10/></a3>) et <c11/> une animation (voir <a4><c12/></a4>).

# text
seg-489953601f3b = Unités et provenance, par champ, pour chaque type

# text
seg-61b33dbb44dd = Cette page est rédigée à la main et couvre les paquets d'horloge et d'orbite. Son pendant lisible par machine couvre <b>chaque</b> type intégré :

# text
# c1: units
# c2: {"unit", "provenance", "note"}
# c3: []
# c4: *
# c5: src/field_schema.rs
seg-1e20fcda7f0b = <b>Dans le résultat lui-même.</b> Le document de résultats de chaque scénario porte un objet <c1/> de niveau supérieur qui associe le chemin d'un champ émis à <c2/>. La grammaire des chemins (un tableau contribue un seul segment suffixé par <c3/>, partagé par ses lignes ; <c4/> est un joker d'un seul segment pour les objets dont les clés sont des données) et le vocabulaire fermé de provenance sont définis dans <a1><c5/></a1>.

# text
seg-b8256437c0b7 = En un seul fichier.

# text
# c1: field-units-schema.json
# c2: coverage
seg-ae7136e34306 = <a1><c1/></a1> est l'union recueillie : pour chaque type, chaque champ numérique qu'il émet à une source indiquée, avec son unité, sa classe de provenance, son niveau de preuve et sa définition — et, nommé plutôt qu'omis, chaque champ qui n'en a pas encore. Son bloc <c2/> porte les décomptes.

# text
# c1: tests/field_units_global.rs
# c2: UNCOVERED_KINDS
seg-66af6dc065f7 = Les deux sont imposés par <c1/>, qui exécute chaque type enregistré et échoue si un champ numérique émis n'a pas d'unité et de classe de provenance. Les types pas encore couverts sont nommés un à un dans <c2/> de ce fichier, avec la raison pour laquelle chacun reste ouvert, et leur nombre est figé afin que la liste ne puisse que diminuer.

# text
# c1: units
seg-ca49a577a07b = Régénérez le JSON après tout changement de la forme d'un rapport ou d'un bloc <c1/> :

# text
seg-ce4351cf7673 = <s1>Précédent</s1>Référence des scénarios

# text
seg-b988dcc329a4 = <s1>Suivant</s1>Utiliser de vrais TLE

# text
seg-6585c8a3643d = ClockRun (pour chacun de quantum / classical)

# text
seg-299f8a9643f1 = FoMScores (l'objet fom)

seg-d17376a1ea92 = ({ "0.40" }) L'étiquette de preuve de l'exécution : <c1/> (<c2/>, <c3/> ou <c4/> : le statut le <em>plus faible</em> parmi les lignes, de sorte qu'elle ne prétend jamais à plus que sa ligne la plus faible), <c5/> (<c6/>), <c7/> et <c8/>, un par ligne de la matrice de vérification que l'exécution a mise en jeu (les lignes que liste son rapport avancé, issues de <c9/>) : <c10/> (<c11/> et les { "8" } premiers chiffres hexadécimaux du SHA-256 du texte d'exigence de la ligne), <c12/> et <c13/>, tous lus dans la matrice, aucun saisi à la main. Ajoutée par <c14/> au résultat de chaque type, avant le bloc <c15/> final lorsqu'il y en a un (ce bloc reste la dernière clé) ; <c16/> la retire octet pour octet. Le SVG du graphique et le tableau CSV de la même exécution portent la même étiquette (<c17/> et une ligne visible sous le graphique ; lignes de commentaire <c18/> en tête du CSV). Les membres de campagne intégrés au résultat d'un autre type n'en portent aucune : le document externe en porte une. Ne porte aucun nombre.
