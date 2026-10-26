# docs--verification-matrix: translations (fr)

# text
seg-619f89bf160c = Réalisation du référentiel lunaire

# text
seg-2db69c58f694 = PNT différentiel lunaire

# text
seg-1ff1d8ebf1e7 = Cartographie de compliance vers les cadres publics

# text
seg-aab745a65e76 = Module

# text
seg-d6476863f862 = Capacité

# text
seg-ad856ad710eb = État

# text
seg-60a43431ebe0 = Exigence

# text
seg-cbf0f9bcd2d8 = Référence indépendante

# text
seg-1603e76bcf66 = Identification du bruit en loi de puissance par autocorrélation de retard 1

# text
seg-d95fe5878ee3 = allan::lag1_noise_id : l'identificateur de bruit par autocorrélation de retard 1 de Riley et Greenhall ({ "2004" }) (phase décimée dont la partie quadratique est retirée, ou fréquence moyennée par groupes dont la droite est retirée ; différences premières répétées jusqu'à delta = r1/({ "1" }+r1) < { "0.25" } ou d = dmax), renvoyant l'exposant alpha de loi de puissance entier et non arrondi (+{ "2" } pour la PM blanche jusqu'à -2 pour la FM à marche aléatoire) à n'importe quel facteur de moyennage ; il fixe les degrés de liberté propres au type de bruit des fiches d'appareils de la bibliothèque d'horloges mesurées

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-4d820e75cd4f = allantools { "2024.6" } autocorr_noise_id (A. Wallin et contributeurs, LGPL-3.0-or-later, exécuté comme programme distinct par le générateur de jeux d'essai) : une mise en œuvre indépendante de l'algorithme publié de Riley-Greenhall, une grandeur définie de façon unique sous les conventions indiquées. Valide l'identificateur, pas le contenu en bruit d'une horloge réelle

# text
seg-aedf395f3597 = Authentification des données de navigation Galileo OSNMA côté récepteur

# text
# c1: kshana osnma verify
seg-1e6e62438dad = osnma + <c1/> : un vérificateur ouvert en Rust pur, côté récepteur, pour Galileo OSNMA (SIS ICD édition { "1.1" }, Receiver Guidelines édition { "1.3" }) à partir de pages I/NAV ou d'un flux u-blox UBX-RXM-SFRBX : clés publiques à arbre de Merkle (DSM-PKR), signature ECDSA P-256/P-521 du DSM-KROOT, vérification de la chaîne de clés TESLA (SHA-256 ou SHA3-256), vérification de MACSEQ et des étiquettes (HMAC-SHA-256 ou CMAC-AES) pour ADKD { "0" }, { "4" } et { "12" } avec authentification croisée, fin de chaîne/révocation/renouvellement, renouvellement et révocation de la clé publique, et le message d'alerte ; état par satellite Authenticated/Failed/Unavailable avec une raison pour chaque échec ou retard. À titre consultatif : pas un équipement de navigation homologué et pas un service d'intégrité de navigation ; aucune performance anti-leurrage n'est revendiquée

# text
seg-a6bd60ed728f = Les vecteurs de test officiels Galileo OSNMA publiés par le European GNSS Service Centre en annexe des Receiver Guidelines (Test_vectors.zip, sha256 ef9b9afc6ef9e1c57393415cf2a1dc80c4035e7c06123907ea0bb97dd3ccf370) : { "18" } jeux sur { "18" }, { "186,382" } étiquettes authentifiées, { "0" } en échec, exécutés hors ligne le 2026-10-10 (fiche de preuves dans kshana-pro docs/evidence). Périmètre : les vecteurs valident la vérification cryptographique (Merkle, KROOT/ECDSA, chaîne TESLA, étiquettes MACK, ADKD 0/4/12) et ses résultats sur les scénarios publiés ; ils n'utilisent que HMAC-SHA-256, une chaîne SHA-256, des clés de 128 bits, des étiquettes de 40 bits et les entrées de table { "33" } et { "34" }, de sorte que CMAC-AES, les chaînes SHA3-256 et les autres paramètres ne sont couverts que par des tests à réponses connues de primitives publiés et des tests synthétiques. Le durcissement du temps de confiance, de la liaison des données, de l'expiration et de la confirmation d'en-tête est testé par les tests d'attaque synthétiques, pas par une référence externe. Non contrôlé : listes de révocation de certificats, signaux réels ou récepteur réel (la disposition des mots UBX n'est contrôlée que sur des trames synthétiques), arbres de Merkle SHA3-256, fraîcheur sans temps indépendant. Pas un service de l'UE

# text
seg-27a61718eb95 = Caractérisation de la stabilité en fréquence

# text
seg-56174d771190 = Écart d'Allan/modifié/d'Hadamard + identification du bruit en loi de puissance avec IC du χ²

# text
seg-ed01b2ab3481 = Écarts de référence de NIST SP { "1065" } (Riley) / Stable32 sur NBS14

# text
seg-25b78672c194 = Stabilité en fréquence sur une horloge réelle mesurée

# text
seg-fd378f5fe04a = Écart d'Allan à recouvrement + écart d'Hadamard à recouvrement sur un étalon réel au césium

# text
seg-64fd49d58394 = ADEV/HDEV à recouvrement de Stable32 sur la série de phase mesurée du césium 5071A (allantools)

# text
seg-f305dbc83f2b = Parité des estimateurs d'Allan sur la série de référence canonique de Stable32

# text
seg-5bfca5dcfb7c = Écart d'Allan à recouvrement + écart d'Allan modifié + écart de temps sur toute l'échelle de AF

# text
seg-327ab6dcf16a = Écarts de référence de Stable32 pour PHASE.DAT (Riley ; la série standard de régression)

# text
seg-96c4275f5a89 = Stabilité en fréquence à portée étendue (Theo1 / TOTDEV)

# text
seg-7f59c3631ca4 = Theo1 et écart total (TOTVAR) : estimateurs de stabilité à long tau à portée étendue atteignant ~{ "75" } % de l'enregistrement là où l'écart d'Allan s'épuise vers ~{ "50" } % ; l'hybride ThêoH à biais retiré (allan::theoh_curve) construit sur eux reste MODELLED

# text
seg-a38edc2526f5 = allantools { "2024.06" }, une bibliothèque indépendante tierce de stabilité en fréquence : theo1 (NIST SP { "1065" } éq. { "30" }) et totdev (NIST SP { "1065" } éq. { "25" }) sur le jeu de données LCG hermétique de NIST SP { "1065" } §{ "12.4" } ; régénérable hors ligne via tests/fixtures/theo1_totvar/generate_theo1_totvar_reference.py

# text
seg-cc40472fbcbf = Erreur maximale d'intervalle de temps (MTIE) : métrique de dérive de télécommunications

# text
seg-5c54ba2748f7 = MTIE(τ) : l'excursion crête à crête maximale de l'erreur de temps sur toute fenêtre glissante de τ = m·tau0, la statistique de dérive ITU-T G.810/G.823/G.8261 par rapport à laquelle sont écrites les limites (gabarits MTIE) des réseaux de synchronisation : une valeur extrémale (max/min) distincte de la famille RMS d'Allan

# text
seg-300fd3f945a0 = allantools { "2024.06" }, une bibliothèque indépendante tierce de stabilité en fréquence : mtie() sur la série de phase LCG hermétique de NIST SP { "1065" } §{ "12.4" } ; la MTIE est une pure statistique max/min, de sorte que la sortie de l'estimateur est exacte au bit près par rapport à allantools sur le tableau de phase construit à l'identique (les constantes de référence versionnées à 15 chiffres significatifs se situent à { "1" } ULP). Régénérable hors ligne via tests/fixtures/mtie/generate_mtie_reference.py

# text
seg-67d73f3ca14d = Écart d'Allan modifié / écart de temps (MDEV / TDEV)

# text
seg-9ac9d2b0bdf8 = MDEV(τ) : l'écart d'Allan modifié à recouvrement (estimateur à fenêtre glissante de différence seconde qui sépare le bruit de phase blanc du bruit de phase en scintillation), et TDEV(τ) = τ/√{ "3" }·MDEV(τ), la statistique de dérive dans le domaine temporel ITU-T G.811/G.812/G.823 par rapport à laquelle sont écrits les gabarits de synchronisation

# text
seg-24a441f32375 = allantools { "2024.06" }, une bibliothèque indépendante tierce de stabilité en fréquence : mdev() et tdev() sur la série de phase LCG hermétique de NIST SP { "1065" } §{ "12.4" } (même série que les lignes Theo1/TOTDEV/MTIE), calculant les mêmes estimateurs définis de façon unique ; concordance à <{ "1e-9" } en relatif. Régénérable hors ligne via tests/fixtures/mdev_tdev/generate_mdev_tdev_reference.py. (Le phasedat_reference.rs conditionné par les données les contrôle aussi par rapport à Stable32 à { "1e-3" } ; ceci est le contrôle croisé hermétique, serré et toujours actif)

# text
seg-e4b6d707cbf5 = Stabilité en fréquence d'une horloge optique sur une courbe réelle mesurée

# text
seg-e9077554a08f = Récupération NNLS en loi de puissance (FM blanche + plancher de bruit rouge) à partir d'un écart d'Allan mesuré et publié de la transition d'horloge optique du ⁸⁸Sr : reproduction de σ_y(τ) et de la mise à l'échelle principale de 4.7e-16/√τ à court τ avec un vrai plancher mesuré à long τ, plutôt que le plancher synthétisé de classe optique que holdover.rs suppose par ailleurs

# text
seg-4eaf0c102678 = Norcia, Young, Eckner, Oelker, Ye, Kaufman, Science { "366" }:{ "93" } ({ "2019" }), fig. { "4" } ADEV mesurée ; courbe reprise telle quelle de Zenodo 10.5281/zenodo.3382347 (CC-BY-4.0). Limité à la reproduction de la courbe de stabilité mesurée publiée : les chiffres de holdover jusqu'au seuil par classe d'horloge restent MODELLED

# text
seg-cc95c8615d39 = Intégrité (RAIM/ARAIM/SBAS)

# text
seg-d4ad9cfa4f9b = Séparation de solutions à hypothèses multiples ARAIM selon l'ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels et add_v42_protection_levels_ecef : détermination de sous-ensembles par les règles P_THRES et FC_THRES, VPL, HPL, le seuil effectif du moniteur EMT et sigma_acc) ; détection de fautes RAIM instantanée par χ² avec exclusion d'un seul satellite (raim::snapshot_raim, raim::snapshot_raim_fde) et HPL/VPL fondés sur la pente au niveau local géodésique ; et la combinaison de niveaux de protection SBAS DO-229E (sbas::sbas_protection_level) sur le service L1. NON couvert, dit sans détour : les fonctions de commodité à sigma uniforme raim::araim_raim et raim::araim_dual_raim ne sont PAS conformes à l'ADD (sur des entrées appariées, elles manquent Stanford MAAST de { "0.75" } m en VPL / { "4.04" } m en HPL et de { "0.39" } m en VPL / { "1.93" } m en HPL, un résultat) ; la comparaison SBAS L5 bifréquence multi-constellation (DFMC) est un résultat ({ "308" } paires utilisateur-époque sans GEO en vue sont protégées par Kshana et non par MAAST, dont la porte de réception GEO n'est pas modélisée par Kshana) ; raim::solution_separation_raim n'a aucune comparaison externe

# text
seg-a83c68500982 = Trois outils indépendants, fixés à l'avance (0123cee1) avant qu'existe le moindre jeu d'essai ou sortie de référence, tolérances fixées alors. ({ "1" }) ARAIM : Stanford MAAST pour ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, exécuté comme programme distinct sous GNU Octave { "8.4" } avec une cale de compatibilité unique() côté pilote (déclarée, sans changement d'algorithme), au TOL_PL de l'ADD de { "0.05" } m : le Rust reproduit la mise en œuvre de référence de l'ADD sur { "270" } cas réels. Déclaré : le chemin ADD de Kshana a été écrit après le préenregistrement, en suivant l'ADD tel que MAAST le met en œuvre ; un jeu réservé indépendant du relecteur ({ "270" } nouvelles géométries d'utilisateur et un second message de support d'intégrité, MAAST relancé sur le code figé) a réussi au même seuil. ({ "2" }) RAIM instantané : RTKLIB v2.4.2-p13 (BSD-2) estpos/valsol/raim_fde dans un banc C distinct pour la détection et l'exclusion ; le PL à pente à partir de matinv/xyz2enu de RTKLIB plus chi2/ncx2 de SciPy { "1.18.1" }, où les deux côtés évaluent la même forme fermée (Brown ; Parkinson et Axelrad), de sorte que le contrôle du PL couvre la mise en œuvre et non la formule. ({ "3" }) SBAS : Stanford MAAST (commit 7d32b049) usr_vhpl, non modifié, sur les diffusions WAAS enregistrées propres à MAAST : niveaux L1 à { "1e-4" } m près après remise à l'échelle de K et un ensemble protégé égal. Les mêmes comparaisons ont produit les résultats indiqués dans la capacité : les fonctions ARAIM à sigma uniforme ne sont pas conformes à l'ADD, et l'égalité d'ensembles L5 échoue sur { "308" } paires sans GEO en vue (les niveaux sur les { "3267" } paires que les deux outils protègent concordent à { "1e-13" } m près). Les facteurs K de DO-229E/DO-316 sont des constantes transcrites et la géométrie réelle est une entrée ; aucun des deux n'est compté comme référence. Révision { "0.30" } : les niveaux de protection de snapshot_raim sont passés du niveau local radial au niveau local géodésique (jusqu'à { "0.31" } m de HPL et { "0.14" } m de VPL à { "16" } deg N)

# text
seg-1c37702cc5f2 = Propagation et détermination d'orbite

# text
seg-4d8ef6c0aa45 = SGP4/SDP4, Cowell à 6 DOF + perturbations, DO par lots/séquentielle

# text
seg-c84585f43297 = Vecteurs de vérification SGP4 AIAA 2006-6753

# text
seg-50c545872e4f = Propagateur numérique de Cowell et modèle de forces

# text
seg-74f8c585bcfd = Propagateur numérique de Cowell avec un modèle de forces hiérarchique (deux corps, zonal J2–J6, troisième corps Soleil/Lune, SRP boulet de canon, traînée exponentielle) ; doublement de pas RK4 / DP5({ "4" }) / DOP853

# text
seg-c9b486609293 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 : une bibliothèque indépendante, un autre intégrateur et une autre récursion d'harmoniques sphériques. Les niveaux conservatifs (deux corps → zonal J2–J6 → troisième corps Soleil/Lune → SRP boulet de canon) concordent à mieux que le mètre sur un arc de { "24" } h, ce qui valide l'intégrateur + l'algèbre des forces ; le niveau de traînée et la fidélité absolue des entrées d'éphéméride Soleil/Lune / de densité restent MODELLED (caractérisation seulement)

# text
seg-d38c4be472ac = Ombre de SRP d'une Terre aplatie (facultatif)

# text
seg-ab8247c6b4d2 = Fraction éclairée de la SRP avec l'ellipsoïde WGS-84 comme corps occultant (rayon apparent de la Terre depuis le limbe de l'ellipsoïde vers le Soleil, formule de lentille à deux disques ; srp_shadow::oblate_conical_shadow), facultatif sur le modèle de forces de Cowell via propagator::ForceModel::srp_shadow (par défaut : l'ombre conique sphérique, inchangée)

# text
seg-26c2db527cec = Orekit { "12.2" } (Apache-2.0) SolarRadiationPressure.getLightingRatio avec un corps occultant OneAxisEllipsoid WGS-84 et un sphérique, exécuté comme programme distinct avec le Soleil fixé à la même position inertielle. Seuils fixés à l'avance dans xval/srp-oblate-shadow-orekit/PREREGISTRATION.md (6d6d269c) : { "1e-6" } sur les deux, et un écart ellipsoïde-contre-sphère > { "1e-2" } ; tous atteints. L'axe de l'ellipsoïde est l'axe z inertiel des deux côtés (sans précession-nutation)

# text
seg-01066d639b39 = Pression de rayonnement solaire en boîte et ailes et ECOM2, avec dérivées partielles (facultatif)

# text
seg-2a5fc9708bd0 = SRP non boulet de canon : un modèle de plaques planes en boîte et ailes (Vallado éq. 8-44 ; panneaux de corps à face unique, ailes pointées vers le Soleil) avec les tables Galileo FOC, IOV et IOV en fin de vie des métadonnées de satellites du GSC, en pilotage de lacet GNSS nominal, avec des dérivées partielles analytiques pour le facteur de rayonnement et les coefficients spéculaire et diffus de chaque panneau ; et le modèle empirique ECOM2 (D2/B1) avec ses dérivées partielles. Le modèle en boîte et ailes est facultatif sur le propagateur de Cowell (propagator::ForceModel::box_wing_srp, qui renseigne son champ srp_boxwing) et sur le modèle de détermination d'orbite précise (precise_od::PreciseForceModel::box_wing_srp), en remplaçant le terme boulet de canon avec cr comme facteur de rayonnement ; les deux valent None par défaut, ce qui laisse chaque chemin existant identique octet pour octet. ECOM2 n'est branché dans aucun modèle de forces

# text
seg-8f1d7126375c = Orekit { "12.2" } (Apache-2.0) BoxAndSolarArraySpacecraft avec FixedPanel et PointingPanel, SolarRadiationPressure(dRef = { "1" } ua, pRef = 1361/c), lacet nominal GenericGNSS et ECOM2(nD = { "2" }, nB = { "1" }), exécutés comme programme distinct avec le Soleil à des positions inertielles fixes ; la dérivée du facteur de rayonnement par Hipparchus Gradient, les dérivées par panneau en différences centrées d'Orekit (Orekit n'en a pas). Seuils fixés à l'avance dans xval/srp-boxwing-orekit/PREREGISTRATION.md (e59df6bf), avant l'existence de toute sortie d'Orekit : { "1e-12" } en relatif ({ "1e-11" } de bout en bout, { "1e-9" } pour les différences) ; tous atteints (RESULTS.md). VALIDATED ne couvre que l'évaluation du modèle : les tables du GSC sont des entrées transcrites, et l'adéquation d'un modèle en boîte et ailes aux vraies orbites Galileo, la réémission thermique, la loi de lacet modifiée à faible bêta et les virages d'éclipse ne sont pas couvertes ; la prédiction de SRP de Galileo reste MODELLED

# text
seg-bde1b3a94a47 = Ombre de SRP à assombrissement centre-bord solaire (facultatif)

# text
seg-eaaec545dd68 = Fraction éclairée de la SRP comme fraction non occultée du flux solaire à assombrissement centre-bord (loi d'approximation d'Eddington I(mu)/I({ "1" }) = 2/5 + 3/5 mu, quadrature de Gauss-Legendre) sur une Terre sphérique ou WGS-84 (srp_shadow::limb_darkened_shadow, la variante ShadowModel OblateEarthLimbDarkened)

# text
seg-76cb4b668ad5 = Aucune référence externe : Orekit { "12.2" } n'a pas de rapport d'éclairement à assombrissement centre-bord. Contrôlé uniquement par rapport à des formes fermées de la même loi

# text
seg-673b17e9dcf7 = Densité thermosphérique NRLMSISE-00

# text
seg-09e997231de8 = Un portage de la thermosphère empirique NRLMSISE-00 (gtd7 et gtd7d : densités par espèce, densité massique totale avec oxygène anormal, températures ; les { "24" } commutateurs ; modes Ap quotidien et tableau ap à 3 heures) à partir de la version C du domaine public du Fortran du NRL

# text
seg-80963ee0de61 = pymsis { "0.13.0" } (MIT) version={ "0" }, qui exécute le GTD7D Fortran du NRL en simple précision, et le portage C de NRLMSISE-00 (version { "20190709" }, domaine public) compilé comme programme distinct, plus les { "17" } sorties de test publiées de la distribution C. Seuils fixés à l'avance dans xval/nrlmsise00-pymsis/PREREGISTRATION.md (e90ae26a) avant l'existence du portage ; tous atteints (RESULTS.md). Valide le portage, pas l'exactitude du modèle par rapport à la densité mesurée

# text
seg-12977f65b2ea = Niveau de densité de traînée NRLMSISE-00 (facultatif)

# text
seg-17aec847b675 = forces::DensityModel (Exponential par défaut, Nrlmsise00 { "{" } f107a, f107, ap { "}" }) et propagator::ForceModel::drag_density : traînée quadratique par rapport à l'atmosphère en corotation avec la densité NRLMSISE-00 au point géodésique WGS-84 (angle de rotation de la Terre avec UT1 = TT, heure solaire locale UT + lon/15), météorologie spatiale constante par modèle ; désactivé par défaut et identique bit à bit

# text
seg-3878bf3b62d7 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 avec DragForce sur la propre mise en œuvre NRLMSISE00 d'Orekit, exécuté comme programme distinct avec le même référentiel d'angle de rotation de la Terre, la même forme WGS-84, la même convention d'heure solaire locale (un Soleil moyen) et TT comme UT ; la configuration des conventions a été contrôlée référence contre référence (Orekit contre pymsis, { "5.2e-5" } en densité). Seuils fixés à l'avance dans xval/drag-tier-orekit/PREREGISTRATION.md ({ "21647478" }) : { "0.5" } m + { "1e-3" } du déplacement dû à la traînée, et deux contrôles de sensibilité > { "100" } m ; tous atteints. Non couvert : l'exactitude du modèle par rapport à la densité mesurée, la météorologie spatiale variable dans le temps, une branche GMAT

# text
seg-1ac7430e88fc = Traînée exponentielle par défaut face à une mise en œuvre indépendante (équatoriale)

# text
seg-a9c41b03f2ca = La traînée par défaut du propagateur de Cowell : traînée quadratique par rapport à l'atmosphère en corotation avec forces::atmospheric_density, la table exponentielle par morceaux du tableau 8-4 de Vallado à l'altitude sphérique (propagator::ForceModel::drag avec la variante Exponential par défaut de forces::DensityModel)

# text
seg-e2e177761b30 = GMAT R2022a (NASA GSFC, Apache-2.0) GmatConsole avec l'atmosphère Exponential (la même table à 28 bandes), Terre à masse ponctuelle et PrinceDormand78, exécuté, jamais intégré au dépôt. Seuils fixés à l'avance dans xval/drag-exponential-gmat/PREREGISTRATION.md (640c85c1) sur le déplacement dû à la traînée de chaque côté (exécution avec traînée moins exécution sans traînée), ce qui annule les deux valeurs de mu de la Terre et les intégrateurs ; tous atteints (RESULTS.md). GMAT prend la hauteur géodésique et kshana l'altitude sphérique : elles ne coïncident qu'à l'équateur, de sorte que VALIDATED couvre les orbites équatoriales ; hors de l'équateur, les modèles diffèrent par conception ({ "10.4" } % du déplacement sur { "24" } h à { "51.6" } deg, { "400" } km). La version publique de GMAT n'a pas de NRLMSISE-00 (greffon absent), de sorte que le niveau NRLMSISE-00 n'a que la référence Orekit. L'exactitude de la table par rapport à la densité mesurée n'est pas couverte

# text
seg-9e15970435c3 = Soleil et Lune DE440 dans le modèle de forces de Cowell (facultatif)

# text
seg-de6831cf7785 = Niveau d'éphéméride facultatif pour les termes de troisième corps et de SRP du ForceModel numérique de Cowell : le Soleil et la Lune géocentriques à partir de n'importe quel EphemerisProvider (un noyau SPK DE440 via KernelEphemeris) à TDB = TT + (TDB - TT), en refusant un fournisseur qui ne peut pas servir l'époque et en comptant tout repli sur la série analytique ; désactivé par défaut

# text
seg-50027b9f4251 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 avec ThirdBodyAttraction et SolarRadiationPressure sur le propre lecteur DE440 d'Orekit (orekit-data lnxp1990.440), exécuté comme programme distinct ; kshana lit un extrait de NAIF de440s.bsp identique bit à bit et contrôlé par SPICE. Seuils fixés à l'avance dans xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). Le seuil d'orbite ({ "0.5" } m) et le contrôle de sensibilité sont atteints, mais le seuil de position du Soleil/de la Lune ({ "3" } m / { "0.2" } m) est manqué à { "6.39" } m / { "0.244" } m. SPICE, qui lit le même noyau à son TDB exact, manque Orekit du même écart ({ "6.25" } m / { "0.240" } m), de sorte que l'écart se situe entre le chemin de de440s de NAIF et le lecteur DE440 ou l'échelle de temps d'Orekit ; cause non isolée. Consigné et figé, de sorte que la ligne reste MODELLED

# text
seg-057c21daf4f2 = Marée atmosphérique S1 (facultatif)

# text
seg-f600a39f297e = La marée de pression atmosphérique diurne S1 comme perturbation du géopotentiel : modèle N1 de Biancale et Bode ({ "2006" }), degrés { "2" } à { "6" }, par la formule de charge de l'éq. { "6.21" } de l'IERS { "2010" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), facultatif sur les modèles de forces de Cowell et précis (air_tide_s1, désactivé par défaut)

# text
seg-7dd9fccac779 = Aucune référence externe pour l'effet sur le géopotentiel. Les { "24" } coefficients sont transcrits du tableau { "1" } du modèle N1 de GFZ STR06/01 et ont été revérifiés ligne par ligne par rapport au rapport (SHA-256 890865ae) ; les degrés { "0" }, { "1" }, { "7" } et { "8" } ne sont pas utilisés. Ray et Ponte ({ "2003" }) n'impriment aucune table d'harmoniques sphériques, de sorte qu'aucune seconde source n'a été comparée

# text
seg-b150b1bdb599 = Coefficients de marée atmosphérique S2 dans la convention de l'IERS

# text
seg-87e9238b8c53 = Harmoniques de pression atmosphérique S2 de Ray ({ "2001" }) (n <= { "4" }, progrades et rétrogrades) converties à la forme pleinement normalisée, à avance de sinus, des éq. 6.20-6.21 de l'IERS { "2010" } (amplitude divisée par N_nm, epsilon = { "90" } deg - psi) et appliquées comme terme S2 de tides::atmospheric_tide

# text
seg-4745148b6c60 = Biancale et Bode, GFZ Scientific Technical Report STR06/01 ({ "2006" }), tableau { "5" }, modèle A2 : Ray ({ "2001" }) publié en harmoniques pleinement normalisées avec des phases à avance de sinus, un rendu indépendant du même modèle. Fixé à l'avance dans xval/s2-air-tide-fix/PREREGISTRATION.md (5e31c37a) avec la correction qu'il valide. Ne couvre que la conversion des coefficients ; l'effet de la marée atmosphérique sur le géopotentiel n'a pas de référence externe

# text
seg-444f0a65b6fd = Géopotentiel tesséral dans le propagateur de Cowell

# text
seg-ad475816bc78 = Champ tesséral EGM2008 en option (jusqu'au degré/ordre { "70" }) comme gravité centrale du ForceModel numérique de Cowell, évalué dans un repère lié à la Terre tourné par l'angle de rotation terrestre IAU { "2000" } (ou par la chaîne CIO GCRS vers ITRS) ; désactivé par défaut, de sorte qu'aucune sortie existante ne bouge

# text
seg-e6db530c96c7 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 avec HolmesFeatherstoneAttractionModel sur les mêmes coefficients (tools/egm2008_to70.gfc) dans un repère du corps tourné par la même formule d'angle de rotation terrestre, exécuté comme programme distinct. Seuils fixés à l'avance (f0e0e65, amendés avant toute comparaison dans 2da899a) : |dr| <= { "0.5" } m et |dv| <= { "5e-4" } m/s, et les deux contrôles négatifs manquant de > { "100" } m ; tous atteints, puis seuils resserrés à { "0.1" } m et { "1e-4" } m/s. Non validé : la fidélité de l'orientation de la Terre (les deux côtés utilisent UT1 = TT sans précession-nutation dans le repère Era), l'option de repère Cio (vérification interne seulement), les degrés supérieurs à { "70" }

# text
seg-e8f5ff8c9149 = Gravité en harmoniques sphériques de haut degré (EGM2008 jusqu'à { "2190" })

# text
seg-d3b2f32dcecb = Évaluation sans dépassement inférieur et sans singularité aux pôles d'un champ complètement normalisé jusqu'au degré { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, colonne directe modifiée de Holmes-Featherstone { "2002" } avec le gradient exempt de 1/cos phi), un chargeur ICGEM .gfc en flux (from_gfc_file / from_gfc_reader ; l'EGM2008 complet est récupéré à l'exécution, non livré avec le logiciel), et l'évaluateur de Holmes-Featherstone sélectionnable sur le Geopotential de Cowell en option

# text
seg-8651532685f3 = Orekit { "12.2" } (Apache-2.0) HolmesFeatherstoneAttractionModel et pyshtools { "4.14.1" } (BSD-3-Clause) MakeGravGridPoint, exécutés comme programmes distincts ; seuils fixés à l'avance dans xval/high-degree-gravity/PREREGISTRATION.md (276c869f) et xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). Orekit concorde partout où il est défini, mais pyshtools manque son seuil fixé à l'avance aux deux points proches du pôle (jusqu'à { "7.3e-10" } m/s^{ "2" } ; une vérification mpmath à 50 chiffres place l'erreur dans pyshtools), il n'existe aucune valeur de référence indépendante exactement sur l'axe polaire, et le contrôle de sensibilité au degré 70, fixé à l'avance, de l'orbite de { "24" } h a manqué ({ "0.726" } m contre > { "1" } m). Chaque manquement est consigné, non corrigé par réglage, de sorte que la ligne reste MODELLED

# text
seg-e81b7418c382 = Intégrateur DOP853

# text
seg-e6e3638aa68e = Runge-Kutta explicite de Hairer DOP853 { "8" }({ "5,3" }) avec l'estimateur d'erreur combiné d'ordre 5/3, le contrôleur de pas de SciPy/Hairer, un pas initial automatique, une garde de pas à échec fermé et une sortie dense d'ordre 7 ; sélectionnable comme variante Dop853 de l'Integrator du propagateur / propagator::propagate_dop853

# text
seg-6ea79a5b89e9 = SciPy { "1.18.1" } (BSD-3-Clause) solve_ivp(method=DOP853) et ses routines de pas unique, de norme d'erreur, de sortie dense et de pas initial, une implémentation indépendante ; états exacts à deux corps issus de mpmath { "1.3.0" } à { "40" } chiffres. Seuils fixés à l'avance dans xval/dop853-scipy/PREREGISTRATION.md (ae1b25e) avant la première comparaison ; tous atteints (xval/dop853-scipy/RESULTS.md). Le premier pas de SciPy est donné aux deux solveurs dans les exécutions complètes ; la routine de pas initial est comparée séparément. Non couvert : RKF7({ "8" }), détection de raideur, localisation d'événements

# text
seg-9ad7c1f4da77 = Solveur robuste de l'équation de Kepler

# text
seg-4b9d812fd13e = Solveur de Kepler elliptique pour tout { "0" } <= e < { "1" } et toutes les anomalies moyennes : amorce cubique de Markley ({ "1995" }) et correction du cinquième ordre, résidu sans annulation (1-e)E + e(E - sin E) - M, et affinage de Newton protégé (kepler::solve_kepler_markley, propagator::solve_kepler_robust)

# text
seg-6fedaf34608d = Racines à 50 chiffres de mpmath { "1.3.0" } (BSD-3-Clause) à partir des entrées binaires exactes. Seuils fixés à l'avance dans xval/kepler-mpmath/PREREGISTRATION.md (df22174), exprimés relativement à |E| avec l'argument de conditionnement e -> { "1" }, M -> { "0" } ; tous atteints (xval/kepler-mpmath/RESULTS.md). Les solveurs hérités (solve_kepler_checked, orbit::solve_kepler, ephem::solve_kepler) sont numériquement inchangés, car des sorties archivées en dépendent, et ne sont pas couverts par cette ligne

# text
seg-1960804ef2f4 = Détermination d'orbite par lots à partir de la vitesse radiale et de l'azimut/élévation avec masquage de station

# text
seg-4c185244bc66 = Retrouver un état à l'époque à partir de mesures mixtes de distance, de vitesse radiale et d'azimut/élévation au-dessus d'un masque d'élévation par Gauss-Newton sur H = (dh/dx(t)) Phi(t, t0) : dérivées partielles analytiques des mesures et matrice de transition d'état variationnelle avec dérivées partielles analytiques à deux corps + J2 (intégrée par RK4, et non une matrice de transition en forme close)

# text
seg-6c6a42c25433 = Orekit { "12.2" } (Apache-2.0) BatchLSEstimator avec des mesures géométriques instantanées personnalisées RangeRate et AzEl (recoupées avec le TopocentricFrame d'Orekit), exécuté comme programme distinct sur des observations identiques, masquées et tirées avec une graine. Seuils fixés à l'avance dans xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Tous les seuils atteints sauf B4, l'accord d'état sans bruit de { "1" } cm, manqué sur { "2" } scénarios sur { "4" } ({ "1.46" }, { "1.74" } cm) : l'estimation sans bruit d'Orekit lui-même se situe à cette distance de sa vérité simulée (cause côté Orekit non isolée). Consigné et figé, de sorte que la ligne reste MODELLED. Non modélisé : temps de lumière, aberration, réfraction, rotation de la Terre, filtre séquentiel pour ces types de mesure

# text
seg-bc3d1ee7c639 = Pondération des observations par les codes de précision SP3

# text
seg-63b1fab84f85 = Convertir les codes de précision SP3 (exposants ++ de l'en-tête en { "2" }^n mm, la base %f, écarts types par enregistrement base^n mm) en sigmas de position par observation pour le moteur de détermination précise d'orbite (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

# text
seg-ebecb8906506 = Aucune externe : les pondérations sont un choix de modélisation (le format SP3 ne définit le code que comme l'indicateur de précision du producteur ; il est lu ici comme un écart type à un sigma par axe). Les exécutions d'agence déjà consignées sont inchangées

# text
seg-e35df6881c80 = Champs de gravité planétaires à partir des tables PDS SHADR

# text
seg-f78b73ae8742 = Lire les tables d'harmoniques sphériques PDS SHADR (from_shadr, sur SphericalHarmonicField dans src/gravity_pds.rs : conversion d'unités, C00 = { "1" } fourni, contrôles de complétude et de normalisation) et évaluer la gravité en repère lié au corps de Mars GMM-3 (d/o { "120" }) et du champ lunaire GRAIL GL0660B (d/o { "660" })

# text
seg-08590d67a7d3 = pyshtools { "4.14.1" } (BSD-3-Clause) lisant les mêmes fichiers PDS et évaluant la gravité ponctuelle, exécuté comme programme distinct, ainsi que les en-têtes et étiquettes publiés des produits PDS. Seuils fixés à l'avance dans xval/planetary-gravity-pyshtools/PREREGISTRATION.md (32c5b50) ; tous atteints (RESULTS.md). Données : NASA PDS Geosciences Node, domaine public ; recadrages au degré 20 livrés avec NOTICE, fichiers complets récupérés au moment du test

# text
seg-ae3e8833a5ef = Associer un champ de gravité publié à un corps

# text
seg-ffb2b20e5f32 = with_gravity_field (sur Body, dans src/gravity_pds.rs) : associer tout champ d'harmoniques sphériques chargé (par exemple GMM-3 ou GL0660B) à un Body afin que le propagateur l'évalue en repère lié au corps ; en option, corps par défaut inchangés

# text
seg-bcb731f7a9b5 = Cohérence interne seulement. Chaque champ publié est défini dans le repère lié au corps de son producteur (GMM-3 dans le repère martien de Konopliv et al. { "2006" }, GL0660B dans le repère lunaire des axes principaux de DE421), alors que le champ est évalué dans le repère IAU ; le décalage n'est pas modélisé

# text
seg-659bfeba459c = Détermination d'orbite par lots et séquentielle

# text
seg-dbc98f498941 = Retrouver un état à l'époque [r,v] à partir de distances de stations au sol par un correcteur différentiel par lots de Gauss–Newton et un filtre séquentiel, sur un modèle de forces à deux corps+J2

# text
seg-ecfce82a4e3d = Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — une bibliothèque d'estimation tierce indépendante sur un modèle de forces apparié ; l'état à l'époque retrouvé et le RMS des résidus après ajustement concordent à <{ "1e-3" } m sans bruit et <{ "3" } m avec un plancher de bruit de { "5" } m

# text
seg-acdac055acb9 = Solveur de temps de lumière radiométrique pour l'espace lointain

# text
seg-62a478e40850 = Solution de temps de lumière retardé (trajet descendant) à sens unique τ = |r_rx − r_target(t−τ)|/c pour la navigation radiométrique dans l'espace lointain (Terre→Mars/Soleil/Lune)

# text
seg-a38690bb69fa = ANISE { "0.10" } (Nyx Space, MPL-2.0) temps de lumière par aberration newtonienne convergée (Aberration::CN ; équivalent de spkapo de SPICE) sur JPL DE440 — une implémentation SPICE en Rust indépendante ; le solveur retardé à point fixe de kshana concorde à moins d'une nanoseconde. Les chiffres plus larges de Doppler / Shapiro / DO à dynamique réduite restent MODELLED

# text
seg-c69ef9342160 = Position de satellite par éphéméride diffusée (RINEX multi-GNSS)

# text
seg-62702fc6f242 = Position ECEF de satellite à partir de l'éphéméride diffusée IS-GPS-200 / Galileo-OS / BeiDou-OS (képlérienne → ECEF) à partir d'un enregistrement de navigation RINEX-3 analysé

# text
seg-cb66d33b7ba7 = RTKLIB v2.4.2-p13 eph2pos() compilé à partir du source C (T. Takasu, BSD-2-Clause) — une implémentation indépendante IS-GPS-200/SIS-ICD, alimentée par les mêmes enregistrements de navigation RINEX-3 ; position ECEF du satellite concordante à ~{ "62" } nm. (L'interpolation d'éphéméride précise SP3 est validée séparément — voir 'Interpolation d'éphéméride précise SP3')

# text
seg-c807a782b20e = Interpolation d'éphéméride précise SP3

# text
seg-238de70daab9 = Interpolation de Lagrange standard IGS des positions de satellites d'éphéméride précise SP3 avec la correction de rotation de la Terre par nœud (faire tourner chaque nœud de ω⊕·(t_node−t) dans le repère terrestre de l'instant demandé avant l'ajustement du polynôme)

# text
seg-e9249ae44a11 = RTKLIB peph2pos() compilé à partir du source C (preceph.c ; T. Takasu, BSD-2-Clause) — la référence IGS de fait, une implémentation indépendante ; l'interpolateur de kshana (portant désormais la même correction de rotation de la Terre par nœud) concorde à ~{ "15" } nm sur un produit SP3 réel, contre ~{ "5.5" } cm avant la correction

# text
seg-9762cf428435 = Encodeurs de messages de navigation au-delà du LNAV GPS (CNAV GPS, I/NAV et F/NAV Galileo)

# text
seg-9b703b9607d8 = Messages CNAV GPS de types 10/11/30, mots I/NAV Galileo de types 1-5 en pages paires/impaires nominales et pages F/NAV Galileo de types 1-4 : empaquetage et quantification des champs de l'ICD, CRC-24Q, codage convolutif de taux 1/2 K={ "7" } (G2 inversé pour Galileo), entrelacement par blocs et motifs de synchronisation, avec des décodeurs de test correspondants

# text
seg-7939b210e83c = Aller-retour interne et réponses connues de l'ICD ; aucun décodeur tiers n'a été exécuté (le banc RTKLIB/GNSS-SDR lisant KSHANA_NAVMSG_ORACLE_JSON est conditionné par les données). MODELLED

# text
seg-5ce7cd3d6011 = Lecteur de cartes mondiales de l'ionosphère IONEX et interpolation sur un GIM CODE réel

# text
seg-502656556ddf = Lecteur IONEX { "1.0" } (en-tête, valeurs I5 en colonnes fixes, cartes TEC et RMS, époques absolues, valeurs manquantes) avec interpolation spatiale bilinéaire, interpolation temporelle du format par carte la plus proche / consécutive / tournée (éqs. 1-3) et TEC oblique en couche mince

# text
seg-1575dc4cfb4a = Les valeurs imprimées du GIM CODE (exactes à chaque nœud ; la carte est récupérée au moment du test, non fournie avec le dépôt, sa licence n'étant pas confirmée) et une réimplémentation indépendante en bibliothèque standard Python des formules d'interpolation IONEX { "1.0" } archivée avec le jeu de test (seuils fixés à l'avance e4d8b1f, { "1e-9" } TECU). Vérification par un tiers (B6, fixée à l'avance, première exécution) : RTKLIB v2.4.2-p13 iontec (BSD-2-Clause, exécuté comme outil distinct) sur { "6885" } points de requête concorde avec IonexFile::vtec_at à { "3.6e-13" } TECU dans les deux modes d'interpolation face à un seuil de { "1e-5" } TECU. Conditionné par les données : GIM CODE récupéré au moment du test, SHA épinglé ; RTKLIB lit le fichier complet parce que son getindex rejette le recadrage en latitude. tests/fixtures/ionex_code_gim/fetch.sh le récupère et vérifie le SHA-256, le test échoue sur tout autre contenu, et run_rtklib.sh est la voie de reproduction documentée (accès réseau requis). Promu à VALIDATED par décision du propriétaire sur des preuves conditionnées par les données (2026-10-13)

# text
seg-974d8c1f7876 = Lissage du code par la porteuse de Hatch sur des observations RINEX réelles

# text
seg-f26b5da0f52e = Filtre de Hatch sans divergence (code sans ionosphère porté par la porteuse sans ionosphère, fenêtre de N époques, redémarrage sur perte d'accrochage, saut sans géométrie ou lacune) dans l'assemblage de positionnement précis ponctuel

# text
seg-fac84cb9b256 = CONSTAT par rapport à la coordonnée ITRF2020 publiée de WTZR : les seuils fixés à l'avance (médiane et p95 lissées au plus { "0.6" } x brutes ; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) ont été manqués, rapports { "0.718" } et { "0.923" } ; l'erreur résiduelle de l'ordre du mètre est de type biais (biais de code C1C, antenne, marée, multitrajet à longue période), et non le bruit blanc que le lissage supprime. MODELLED : les statistiques du filtre sont vérifiées en interne

# text
seg-2eec513ae8c8 = Doubles différences RTK avec fixation d'entiers LAMBDA sur des observations RINEX réelles

# text
seg-6571676bf918 = Positionnement relatif sur courte base à partir de code et de phase de porteuse GPS bifréquence réels : doubles différences par rapport au satellite le plus haut avec leur covariance complète, un filtre de Kalman flottant sur la base et les ambiguïtés en simples différences avec réinitialisation sur saut, moindres carrés entiers LAMBDA avec test de rapport, et base conditionnée par les entiers fixés

# text
seg-e50c5d4b65c7 = Coordonnées ITRF2020 publiées de WTZR et WTZZ (IGN ITRF2020_GNSS.SSC, solution { "3" }, avec les hauteurs d'antenne RINEX) donnant la base de référence ; seuils fixés à l'avance dans tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_RTK.md avant l'écriture du code. Courte base seulement : aucune double différence ionosphérique ou troposphérique n'est modélisée

# text
seg-f9aa0c529393 = Solution de temps d'horloge de récepteur PPP par rapport à l'horloge de station finale IGS

# text
seg-83ad9e893db9 = L'horloge du récepteur estimée par le filtre PPP flottant statique sur du code et de la phase GPS bifréquence réels avec les orbites et horloges finales IGS : un transfert de temps du récepteur vers le temps IGS, la solution de temps PPP sans ionosphère.

# text
seg-91a882dd71e8 = L'horloge combinée finale IGS pour la station WTZR (enregistrements AR de IGS0OPSFIN_20250550000_01D_05M_CLK, SHA-256 d19f3d45...993d, une combinaison de solutions de réseau de plusieurs centres d'analyse ; produits IGS, usage libre avec attribution) ; seuils fixés à l'avance dans xval/ppp-time/PREREGISTRATION.md avant toute comparaison ; tous tenus dès la première exécution. CE QUI NE L'EST PAS : une station et une fenêtre convergée de deux heures ; le temps IGS, et non UTC(k) ; le décalage constant inclut les biais de code du récepteur et est borné, non étalonné ; aucune traçabilité Circular T.

# text
seg-a9b2a93401a3 = Positionnement ponctuel précis flottant sur des observations RINEX réelles

# text
seg-cc991ccec112 = Filtre de Kalman étendu PPP flottant statique sur du code et de la phase de porteuse GPS bifréquence réels avec les orbites et horloges finales IGS : combinaison sans ionosphère, décalages d'antenne de satellite et de récepteur (variations du récepteur), marée terrestre solide, enroulement de phase, retard de Shapiro, retard humide zénithal estimé, ambiguïtés flottantes par arc avec détection de sauts par géométrie nulle / Melbourne-Wübbena

# text
seg-36e7c9286af7 = Coordonnée ITRF2020 publiée de WTZR (IGN ITRF2020_GNSS.SSC, solution { "3" }, propagée avec sa vitesse) — seuils fixés à l'avance dans tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_PPP.md avant l'écriture du filtre ; développement sur la seule station colocalisée WTZZ. Non modélisé : charge océanique, PCV du satellite, résolution des ambiguïtés entières

# text
seg-c8d87abed330 = Lecture de fichiers de navigation RINEX { "4" }

# text
# c1: > EPH
seg-28913a01af00 = Fichiers de navigation RINEX 4.00-4.02 : enregistrements <c1/> de GPS LNAV, Galileo I/NAV et F/NAV, BeiDou D1/D2 et QZSS LNAV décodés dans le type d'éphéméride diffusée ; enregistrements CNAV, CNV1-3, FDMA, SBAS, STO, EOP et ION ignorés jusqu'à l'en-tête d'enregistrement suivant ; un enregistrement dont l'en-tête désigne un autre satellite, ou un enregistrement tronqué, est refusé

# text
seg-687b3b159691 = Le fichier de diffusion fusionné RINEX { "3" } de l'IGS du même jour (données publiées, écrites par un autre générateur de fichiers à partir des mêmes messages diffusés) ; seuils fixés à l'avance dans tests/fixtures/brdc_rinex4_2026200/PREREGISTRATION.md (7aa264b) avant la première exécution

# text
seg-278ca396127a = Lecture de fichiers d'observation RINEX { "4" }

# text
seg-e0883aa933eb = En-têtes d'observation RINEX 4.0x (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE ; étiquettes reconnues aux colonnes 61-80 pour la version { "4" } et suivantes) et enregistrements d'époque

# text
seg-971fb1203a6d = Respect du format sur un fichier RINEX { "4.00" } réel publié (les valeurs relues sont égales aux littéraux imprimés du fichier) et sur un en-tête dérivé de la spécification ; aucun lecteur indépendant n'a été exécuté, donc MODELLED

# text
seg-33e5c74720ff = Position de satellite BeiDou GEO par éphéméride diffusée

# text
seg-44b61449b65a = Position de satellite géostationnaire selon BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } à partir d'une éphéméride diffusée (repère quasi inertiel, puis Rz(Ω̇e·tk)·Rx(−{ "5" }°)), en option via le champ include_beidou_geo de NavParseOptions, de sorte que le lecteur par défaut ignore toujours les GEO

# text
seg-06d500099814 = Fixé à l'avance (7aa264b, 110fef9) par rapport à une orbite précise IGS MGEX avec les GEO ; aucun produit de ce type n'était accessible depuis la session qui l'a construit, de sorte que la comparaison est en attente et que la ligne est MODELLED (vérifiée seulement par rapport aux positions GEO nominales publiées)

# text
seg-559814996a4c = Interpolation d'horloge précise SP3

# text
seg-8e7a0dbd1755 = Décalage d'horloge de satellite entre les nœuds d'horloge SP3 tabulés par interpolation linéaire sur les deux nœuds valides qui l'encadrent (le schéma pephclk de RTKLIB ; sentinelle de mauvaise horloge ignorée), et les mêmes nœuds fournis à la chaîne de produits précis comme enregistrements équivalents d'horloge RINEX

# text
seg-1f4f0f841802 = Combinaison finale IGS des horloges de satellite à { "30" } s (IGS0OPSFIN 30S CLK, 2025-02-24) : estimations d'horloge publiées aux instants demandés, non interpolées à partir du SP3 ; seuils fixés à l'avance dans tests/fixtures/sp3_clock_igs_oracle/PREREGISTRATION.md avant la première exécution (RMS { "0.15" } ns, p95 { "0.30" } ns, médiane des nœuds { "1e-12" } s, discrimination 2x)

# text
seg-71f48628ebb2 = GNSS/INS à couplage serré sur phase de porteuse avec ambiguïtés flottantes

# text
seg-5a156aa81275 = EKF en états d'erreur sur { "15" } états INS, une horloge de récepteur à deux états et une ambiguïté de porteuse flottante par satellite suivi ; pseudodistance, phase de porteuse et vitesse radiale facultative issues d'une constellation Walker SGP4 (temps de lumière et Sagnac), corrections de Klobuchar et de Saastamoinen/Niell appliquées dans la boucle à la position propre du filtre ; détection de sauts par porteuse différenciée dans le temps avec un seuil par satellite élargi par l'incertitude de vitesse ; réinitialisation des ambiguïtés sur sauts et réacquisition

# text
seg-00576e8c1032 = Cohérence interne : les mesures sont synthétisées à partir des modèles que le filtre utilise (χ² NEES/NIS sur des graines, une convergence sans bruit, injection de sauts). MODELLED ; aucune donnée de récepteur réel ni filtre tiers n'est comparé

# text
seg-7d644516b1ec = Paquets GNSS/INS maritime, ferroviaire et aviation avec option de couplage serré

# text
seg-cbb03a8baf73 = Trois scénarios gnss-ins sur la bibliothèque de trajectoires (un navire zigzaguant à { "8" } m/s avec une interruption de cinq minutes ; un train traversant une tranchée à deux satellites et un tunnel ; un aéronef dont l'interruption couvre un virage incliné de 25 degrés) et la table [tight] facultative du paquet : pseudodistances d'une constellation Walker SGP4 fusionnées par le navigateur en boucle fermée, tous les satellites au-dessus du masque en nominal et les quelques plus hauts en dégradé

# text
seg-273c14256d4c = Interne : les chiffres de mérite de chaque paquet par rapport à sa propre vérité et une comparaison lâche/serrée sur des entrées identiques. MODELLED ; la comparaison NaveGo de l'audit n'a pas été exécutée

# text
seg-f4dab73c4eda = Filtre PNT de pseudodistance couplé avec état de biais et extension 3D dans le paquet de fusion

# text
seg-742b60089361 = Un filtre de Kalman empilé sur la position, la vitesse, la phase et la fréquence d'horloge, alimenté par des pseudodistances qui couplent position et horloge (mises à jour sous forme de Joseph portant la covariance croisée) ; une variante à 1 DOF augmentée d'un état de biais d'accéléromètre constant que le paquet de fusion exécute sous [coupled] ; et la version 3D à 8 états avec des lignes de ligne de visée

# text
seg-9558d7aad3af = Cohérence interne : vérité simulée à partir des propres modèles des filtres (χ² NEES sur des graines Monte Carlo, le paquet découplé sur des capteurs identiques). MODELLED

# text
seg-4a64aa1fe3ca = EKF GNSS/INS à couplage lâche avec bras de levier sur le jeu de données KF-GINS

# text
seg-30f503856ac5 = L'EKF en états d'erreur à 15 états en boucle fermée piloté par des incréments IMU avec des positions d'antenne GNSS fusionnées par le modèle de bras de levier H = [I { "0" } −[(C_b^n l_b)×] { "0" } { "0" }], configuré à partir d'un fichier YAML KF-GINS (état initial et sigmas, ARW/VRW, biais de Gauss-Markov)

# text
seg-b01d28a09abe = La trajectoire de référence publiée du jeu de données et le programme C++ KF-GINS (GPL-3.0, commit 8291a93e, exécuté comme outil distinct) ; seuils fixés à l'avance dans xval/kfgins/PREREGISTRATION.md, et KF-GINS n'a pas été exécuté sur ces données avant ce préenregistrement (vérifié dans ses Results). Les six seuils ont été tenus dès la première exécution. CONDITIONNÉ PAR LES DONNÉES : le jeu de données de démonstration KF-GINS (IMU Leador-A15 réelle et GNSS RTK avec une trajectoire de référence) ne porte aucune licence, il n'est donc pas fourni avec le dépôt ; xval/kfgins/fetch.sh le récupère au moment du test avec le SHA-256 de chaque fichier épinglé, et le test échoue en cas de différence ; la voie de reproduction, qui exige un accès réseau, figure dans xval/kfgins/PREREGISTRATION.md. Promu à VALIDATED par décision du propriétaire sur des preuves conditionnées par les données (2026-10-13)

# text
seg-e6b6c605564c = Export de banc d'essai lu par les lecteurs de fichiers de mouvement d'un simulateur (gps-sdr-sim)

# text
seg-a07429aa1998 = Les fichiers de mouvement d'export de bench fournis aux propres lecteurs d'un simulateur GNSS libre redonnent la trajectoire exportée : le fichier NMEA GGA (-g), la coupe temps/latitude/longitude/hauteur du CSV de mouvement (-x) et sa coupe temps/x/y/z (-u), sur { "6" } scénarios gnss-ins (dont les paquets maritime, ferroviaire et aviation, lus jusqu'au plafond de 3000 échantillons du simulateur) et { "2" } scénarios stationnaires. Mouvement seulement ; aucun signal n'est écrit ni généré.

# text
seg-07b5f46a900f = CE QUI EST VÉRIFIÉ EXTERNEMENT, énoncé étroitement : gps-sdr-sim (MIT, commit 28ca29a6) readNmeaGGA, readUserMotion et readUserMotionLLH avec son propre llh2xyz WGS { "84" }, appelés via xval/testbench-gpssdrsim/driver.c (aucune fonction de signal appelée), par rapport aux colonnes terrestres du CSV de mouvement ligne par ligne, avec des seuils fixés à l'avance dans xval/testbench-gpssdrsim/PREREGISTRATION.md avant toute exécution : chaque échantillon lu sur les { "8" } scénarios ; NMEA pire cas { "1.21" } mm (seuil { "1" } cm) ; coupe LLH pire cas { "0.145" } mm (seuil { "1" } mm) ; coupe terrestre à quatre colonnes exacte (seuil { "1" } um, amendement { "1" }) ; lignes gnss-ins sur la grille de { "10" } Hz du simulateur à { "2.3e-13" } s. CONSTAT (exécution { "1" }, figé) : le CSV pleine largeur sans en-tête n'est pas lisible par -u, parce que le tampon de ligne de 100 caractères du lecteur scinde chaque ligne de 161 caractères en deux échantillons ; docs/TEST-BENCH.md donne la coupe à quatre colonnes. CE QUI NE L'EST PAS : la physique de la trajectoire de vérité du scénario ; la sortie de signal de gps-sdr-sim ; le lecteur de tout autre simulateur ; tout récepteur.

# text
seg-2db2b9dc3b45 = Bibliothèque de trajectoires GNSS/INS et import de vérité CSV

# text
seg-e1fe83c75a6c = Profils de mouvement sélectionnables pour le paquet gnss-ins (ligne droite, figure en 8, urbain avec arrêts et reprises, montée d'aéronef et virage coordonné, drone d'arpentage), définis par des commandes de vitesse d'Euler et d'accélération le long de la trajectoire bouclées sur l'état de vérité avec l'IMU cinématique (termes centripète, de gravité et de Coriolis), et vérité CSV importée transformée en l'IMU qui la reproduit ; le trajet historique inchangé lorsqu'aucun profil n'est donné

# text
seg-30ea002a06a0 = Interne : identités de cinématique du corps rigide, aller-retour CSV et covariance propre du filtre. MODELLED (aucun journal de conduite réel n'est comparé)

# text
seg-8685fd899e3c = Mécanisation INS à composantes liées

# text
seg-ba942e322f8a = Mécanisation inertielle à composantes liées WGS-84 NED à attitude par quaternion (avec compensation du coning/sculling) propageant un état de navigation à partir d'incréments (Δθ, Δv)

# text
seg-5cfcb186d59e = NaveGo v1.4 (R. Gonzalez et al., LGPL-3) exécuté sous Octave — une boîte à outils INS publiée indépendante pilotée par le flux d'incréments (Δθ,Δv) identique. L'attitude concorde bit à bit (mêmes conventions NED / quaternion scalaire en premier / vitesse de rotation terrestre / vitesse de transport) ; vitesse/position concordent à deux différences documentées près — le terme de gravité nord de déviation de la verticale que NaveGo inclut et que kshana omet par conception (gravité du fil à plomb ; concordant avec la forme close de Groves à chaque chiffre, avec une assertion de plancher de cohérence) et des différences d'intégrateur en O(dt²) — non des erreurs de mécanisation

# text
seg-d1a5c8e7ca74 = Synthèse de fonctionnelles du champ de gravité (carte de navigation assistée par la gravité / sans GNSS)

# text
seg-8336eb12eb7b = Magnitude de gravité en harmoniques sphériques + perturbation (mGal) à partir de tout modèle ICGEM .gfc ; gravité normale GRS80

# text
seg-b5a7fc986751 = Gravité normale de Somigliana GRS80 (Moritz { "1980" }, IAG) + γ_e/γ_p publiés ; champ réel ICGEM EGM2008

# text
seg-86f9186bb884 = NRHO CR3BP Terre-Lune { "9" }:{ "2" } par rapport à l'orbite suivie par CAPSTONE

# text
seg-d4127cf241f3 = L'orbite en halo quasi rectiligne sud L2 { "9" }:{ "2" } du problème restreint circulaire que cr3bp::differential_correct_halo corrige (la famille d'orbites de Gateway et CAPSTONE), comparée pour sa géométrie moyenne (période, rayon au périlune, rayon à l'apolune) à l'orbite que CAPSTONE a réellement suivie. Une mesure de la qualité avec laquelle le membre CR3BP décrit l'orbite réelle ; une orbite CR3BP n'est pas une orbite de modèle d'éphéméride et n'est pas comparée époque par époque

# text
seg-e0cc33dfb10b = Mesuré par rapport à l'éphéméride CAPSTONE reconstruite de JPL Horizons (NAIF -1176, CAPSTONE_merged, ICRF centré sur la Lune, 2023-03-01..31 à { "10" } min), archivée octet pour octet (tests/fixtures/capstone_horizons/, NOTICE.md), fixée à l'avance { "4e868170" } avant sa récupération, comme une mesure avec des seuils sur la géométrie moyenne. Pas une validation : le CR3BP omet le Soleil, l'excentricité de la Lune et le maintien à poste effectué par CAPSTONE, de sorte que les seuils décrivent la représentativité de l'orbite du modèle, et non une précision. Résultats : docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

# text
seg-c866a5bd4318 = États tournants CR3BP transformés en ICRF centré sur la Lune sur la ligne Terre-Lune de DE440

# text
seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf transforme un état tournant CR3BP Terre-Lune adimensionnel en position et vitesse ICRF centrées sur la Lune sur la ligne Terre-Lune instantanée (unité de longueur la distance Terre-Lune, unité de temps l'inverse du taux orbital, la vitesse angulaire complète du repère y compris son taux hors plan dû à l'accélération de la Lune), avec l'inverse from_moon_centred_icrf, et cr3bp::to_moon_centred_icrf_de440 lit l'état lunaire géocentrique à partir d'un SPK DE440. Elle transforme des états ; elle ne fait pas d'une orbite CR3BP une orbite de modèle d'éphéméride

# text
seg-d91ce10ea439 = NAIF SPICE Toolkit (CSPICE N0067 via spiceypy { "8.3.0" }) sxform d'un repère dynamique à deux vecteurs (primaire +X le long de la position de la Lune par rapport à la Terre, secondaire +Y le long de sa vitesse, de440s), appliqué à l'état tournant dimensionnel construit à partir de l'état lunaire propre de SPICE, par un programme distinct qui n'appelle aucun code Kshana (tests/fixtures/cr3bp_to_mci_spice/, NOTICE.md). Fixé à l'avance 2313eb1b, amendé avant toute exécution dans d5ef79b3 pour inclure la vitesse angulaire hors plan du repère (sans elle la vitesse serait décalée jusqu'à { "8e-2" } m/s). Une vérification de bibliothèque de la transformation seulement. Résultats : docs/design/evidence/rm34-cr3bp-to-mci/RESULTS.md

# text
seg-d543e3e84f36 = Type système solaire sur un noyau JPL (planetary_kernel_path)

# text
# c1: solar-system
seg-e8a96f29afc7 = Le type <c1/> avec planetary_kernel_path : chaque corps rapporté dont le SPK contient le code NAIF propre prend sa position et sa vitesse héliocentriques J2000 dans le noyau par le lecteur propre du moteur (étiquette KERNEL), une liaison dont les deux extrémités figurent dans le noyau est calculée sur celui-ci, les barycentres ne sont jamais substitués à une planète, et tout autre corps reste analytique avec sa propre étiquette ; le rapport gagne un bloc noyau (chemin, SHA-256, les corps et les liaisons qui en proviennent) seulement lorsque l'option est activée. Avec de440s.bsp, il s'agit de Mercure, Vénus, la Terre et la Lune

# text
seg-05cc6642285b = NAIF SPICE Toolkit (CSPICE N0067 via spiceypy { "8.3.0" }) spkezr, états héliocentriques sur le de440s.bsp complet, un programme distinct qui n'appelle aucun code Kshana (tests/fixtures/solar_system_kernel/, NOTICE.md) ; le moteur lit des extraits de de440s bit à bit. Fixé à l'avance f8e946ea. Une vérification de bibliothèque du câblage : DE440 lui-même et les corps analytiques ne sont pas validés ici. Résultats : docs/design/evidence/cap31-solar-system-kernel/RESULTS.md

# text
seg-7f3d53b4e8d1 = Porkchop sur l'éphéméride DE440

# text
seg-bd813d7e0b58 = maneuver::porkchop_kernel : le balayage date de lancement x date d'arrivée du C3 de départ (km²/s²) et de la V-infinity d'arrivée (km/s) avec le solveur de Lambert à une révolution prograde et la garde de colinéarité de { "0.5" } deg, sur les états héliocentriques J2000 de deux corps NAIF quelconques lus dans un SPK JPL DE440 par le lecteur propre du crate. Une révolution, prograde, sans contrainte de lanceur ni d'arrivée : un balayage, non une conception de mission

# text
seg-bd19ca214f29 = NAIF SPICE Toolkit (CSPICE N0067 via spiceypy { "8.3.0" }) états héliocentriques sur de440s.bsp et pykep { "3.0.1" } lambert_problem (ESA, le noyau C++ kep3, MPL-2.0), un solveur de Lambert indépendant, exécuté comme programme distinct qui n'appelle aucun code Kshana (tests/fixtures/porkchop_de440/, NOTICE.md) ; le moteur lit un extrait de de440s bit à bit. Fixé à l'avance 2d857fb1. Une vérification de bibliothèque du balayage. Résultats : docs/design/evidence/cap20b-porkchop-de440/RESULTS.md

# text
seg-b1401bed5da8 = Optimiseur de transfert impulsif sur l'éphéméride DE440

# text
seg-eb98d6b8805e = maneuver::optimise_transfer_kernel : les dates de départ et d'arrivée d'un transfert balistique à deux impulsions à une révolution qui minimisent le C3 de départ ou la V-infinity d'arrivée au sein du Type I ou du Type II, comme optimum continu (une grille de 2 jours sur les deux fenêtres, puis Nelder-Mead 2-D), sur les états héliocentriques du SPK DE440. Un optimiseur de dates pour un tronçon, non une conception de mission : aucune option de lanceur, d'orbite de parking, de manœuvre en espace lointain ni de multi-révolution

# text
seg-6c695aef043b = Un optimiseur indépendant : NAIF SPICE Toolkit (CSPICE N0067 via spiceypy { "8.3.0" }) états héliocentriques sur le même extrait de440s, pykep { "3.0.1" } lambert_problem (ESA, MPL-2.0) et SciPy { "1.18.1" } Nelder-Mead, n'appelant aucun code Kshana. Le manuel NASA Terre-Mars (MIDAS, éphéméride non précisée, grille de dates de 2 jours) est une référence publiée secondaire et ne détermine pas le statut

# text
seg-93f3cdbb7297 = Solveur de transfert de Lambert multi-révolution

# text
seg-995a6a995b78 = Toutes les solutions du problème de Lambert jusqu'à trois révolutions complètes (maneuver::lambert_multirev : la solution à une révolution, puis les branches gauche et droite de chaque nombre de révolutions, Izzo { "2015" }), avec les vitesses aux bornes v1 et v2, pour des transferts progrades et rétrogrades, en unités canoniques et en unités SI héliocentriques, y compris les transferts à moins de { "1" } % du temps de vol minimal d'un nombre de révolutions et les géométries proches de 180 deg. Un solveur à deux corps seulement (sans perturbations)

# text
seg-77c43836cafe = pykep { "3.0.1" } lambert_problem (ESA, le noyau C++ kep3, MPL-2.0), une bibliothèque indépendante, exécutée comme programme distinct par scripts/gen_lambert_multirev_ref.py ; seule sa sortie numérique est archivée. Fixé à l'avance a75de851 (jeu de cas, seuils, règle de résultat) avant toute comparaison ; la référence a été régénérée indépendamment et est identique octet pour octet. Résultats : docs/design/evidence/lambert-multirev/RESULTS.md

# text
seg-ff9c6140fe1c = Solveur de transfert à deux corps de Lambert

# text
seg-d8c39ced64b2 = Solveur de Lambert d'Izzo-2015 à une révolution (r1, r2, temps de vol → vitesses aux bornes) sur des transferts LEO→GEO→héliocentrique, progrades et rétrogrades

# text
seg-d0470acf4f29 = lamberthub { "1.0.0" } izzo2015 (J. Martínez Garrido, MIT) — un solveur de Lambert tiers indépendant. Le problème de Lambert à une révolution (M={ "0" }) a une solution unique, de sorte que la concordance bibliothèque contre bibliothèque est une véritable vérification externe ; concordance à <{ "1e-4" } m/s (observé ~{ "1e-11" }), le même type de validation que celle obtenue par DOP face à gnss_lib_py

# text
seg-347cece5df63 = Référentiels et échelles de temps

# text
seg-5a4bc2c15eaa = Précession-nutation IAU 2006/2000A, CIO GCRS↔ITRS, échelles de temps à secondes intercalaires

# text
seg-51d28ab9d256 = Vecteurs de référence IAU SOFA / ERFA ; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

# text
seg-c3d4b9bef817 = Dates juliennes en deux parties et secondes intercalaires sur le chemin temporel de l'orbite terrestre

# text
seg-5e859e3aa613 = Une date et heure calendaires UTC vers une date julienne UTC en deux parties avec la convention SOFA dtf2d pour les jours qui se terminent par une seconde intercalaire (de { "86 401" } s de long, { "23" }:{ "59" }:{ "60" }.x valide), UTC vers TAI et retour, et UT1 à partir de UTC via TAI, sur des dates en deux parties à partir de 1972-01-01 : le chemin temporel que prennent SGP4 (Sgp4::propagate_at, mesuré à partir d'une époque en deux parties) et la rotation terrestre IAU 2006/2000A (sgp4::teme_to_itrs_matrix_eop avec l'angle de rotation terrestre en deux parties)

# text
seg-ec12724c3c04 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause ; les algorithmes SOFA tels que publiés par le projet ERFA), une bibliothèque indépendante : erfa.dtf2d("UTC"), erfa.utctai et erfa.taiutc sur les instants archivés, l'écart formé partie par partie sur les dates en deux parties, seuil { "1e-6" } s fixé avant l'exécution (fixé à l'avance e947e69d). Pire écart { "9.6e-12" } s (dtf2d) et { "1.9e-11" } s (utctai, taiutc). Tout jour UTC pris comme { "86 400" } s, ou la fraction du jour intercalaire laissée non mise à l'échelle, fait passer le test au rouge. UT1 via TAI (iauUtcut1) est vérifié par le volet ERFA de la ligne du chemin d'orbite terrestre. Portée : UTC à partir de 1972-01-01 ; l'UTC antérieur à taux dérivant n'est pas modélisé

# text
seg-f1c7bc235a6b = Dates juliennes en deux parties jusqu'à la rotation terrestre sur le chemin de l'orbite

# text
seg-cee11d4bad08 = Rotation terrestre à partir d'une date julienne UT1 en deux parties sur le chemin de l'orbite, de sorte que la position liée à la Terre conserve la microseconde qu'une date en f64 unique perd (environ { "3e-9" } rad vers { "2020" }) : jd2::gmst82 (GMST IAU { "1982" }, la convention TEME, sur les deux parties), cio::gcrs_to_itrs_matrix_jd2 (la matrice CIO GCRS vers ITRS avec l'angle de rotation terrestre issu des deux parties), et, construits dessus et vérifiés en interne, frames::teme_to_itrf_jd2 / itrf_to_teme_jd2, orbit::Propagator::position_in_frame_jd2 et own_jd2_utc, l'option two_part_jd du scénario d'éphéméride (la position ECEF, la trace au sol et la vue de la station ; désactivée par défaut, inchangée), et des conversions From sans perte entre jd2::Jd2 et timescales::TwoPartJd. La précession-nutation et l'époque du modèle de forces de Cowell restent en f64 unique, où un arrondi de { "40" } us est inférieur à { "1e-15" } rad ou très inférieur à l'erreur de l'éphéméride analytique du Soleil et de la Lune

# text
seg-a658c7b16d6d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause ; les algorithmes SOFA tels que publiés par le projet ERFA), une bibliothèque indépendante : gmst82 et c2t06a sur les dates en deux parties archivées, mouvement du pôle { "0.1" } et { "0.3" } arcsec. Fixé à l'avance b10475ee (dates, seuils) avant l'écriture des fonctions et avant l'exécution de la référence. Les tests internes (l'option de scénario, l'aller-retour TEME/ITRF, les conversions de types) sont une autocohérence de soutien

# text
seg-096df3971f5f = Matrices de repère par rapport aux vecteurs ERFA : biais-précession IAU { "2006" }, TEME vers GCRS, et chaîne CIO avec décalages du pôle céleste

# text
seg-731a5ed967b3 = Trois matrices de repère comparées élément par élément ou par angle de rotation avec ERFA à des époques arbitraires : precession::precession_matrix (biais-précession IAU { "2006" } par les angles de Fukushima-Williams), nutation::teme_to_gcrs_matrix (la rotation TEME vers GCRS P^T N^T Rz(-EE) avec la précession IAU { "2006" }, la nutation IAU 2000B et l'équation des équinoxes avec ses deux premiers termes complémentaires), et cio::gcrs_to_cirs_matrix_with_offsets (la rotation GCRS vers CIRS avec les décalages du pôle céleste IERS dX, dY ajoutés au CIP X, Y du modèle avant la rotation, la convention du livre de recettes SOFA ; nouveau). Les choix de modèle eux-mêmes (nutation 2000B sur le chemin TEME, la série complémentaire à deux termes) ne sont pas validés, seulement leur implémentation

# text
seg-411cd8622b4d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause ; les algorithmes SOFA tels que publiés par le projet ERFA), une bibliothèque indépendante : pmat06 ; numat(obl06, nut00b) avec l'équation des équinoxes issue de eect00 (la série complémentaire complète), composée en P^T N^T Rz(-EE) ; xys06a puis c2ixys(X + dX, Y + dY, s). Fixé à l'avance 979c1e39 (époques, décalages et seuils) avant l'exécution de la référence. Le résidu TEME de { "1.1e-10" } rad est l'effet prévu de la conservation de deux termes complémentaires (environ { "3" } mm sur une orbite GNSS)

# text
seg-4e2fe2e3dabb = UTC antérieur à 1972 (ère du taux dérivant) sur le chemin temporel de la date julienne en deux parties

# text
seg-1d086e669f09 = UTC de 1960-01-01 à 1971-12-31, lorsque l'UTC s'écoulait avec un taux décalé par rapport au TAI et procédait par pas de fractions de seconde, sur le chemin de la date julienne en deux parties : TAI - UTC à partir de la table de dérive de chaque période (timescales::tai_minus_utc_on_date), la date calendaire UTC vers une date julienne UTC en deux parties avec la durée du jour { "86 400" } s + dleap (Jd2::from_utc_calendar), UTC vers TAI avec la fraction du jour mise à l'échelle de l'UTC aux secondes SI (jd2::utc_to_tai) et TAI vers UTC (jd2::tai_to_utc), selon SOFA dtf2d, utctai et taiutc. Avant { "1960" }, TAI - UTC est pris égal à { "0" } (la valeur de SOFA ; UTC non défini) et sort du périmètre de l'affirmation. La fonction timescales::tai_minus_utc en f64 unique plafonne encore à { "10" } s avant { "1972" } et n'est pas couverte

# text
seg-036d5b0b4f51 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause ; les algorithmes SOFA tels que publiés par le projet ERFA), une bibliothèque indépendante : erfa.dtf2d("UTC"), erfa.utctai et erfa.taiutc sur les instants archivés, l'écart formé partie par partie. Fixé à l'avance 23c40661 (instants, tolérance et la somme de contrôle { "1972" }+) avant la modification du moteur et avant l'exécution de la référence. La table de dérive est transcrite de la même table SOFA iauDat que celle qu'utilise la référence, de sorte que la comparaison couvre l'arithmétique de conversion (durée du jour, mise à l'échelle UTC vers secondes SI, itération), et non la table historique elle-même

# text
seg-efacec095051 = Horloge de satellite GLONASS diffusée et propagation d'orbite diffusée

# text
seg-821b9c01b56e = Le biais d'horloge de satellite GLONASS diffusé -tau_n + gamma_n (t - t_b) à un instant lu sur l'horloge du satellite (glonass::GlonassEphemeris::sv_clock_bias_s, le décalage corrigé du biais d'horloge par deux itérations à point fixe), et la position PZ-90 liée à la Terre du vecteur d'état diffusé propagé par RK4 selon les équations du mouvement de l'ICD GLONASS à +/-15 min de l'époque de référence (GlonassEphemeris::position_ecef), à partir d'enregistrements de navigation GLONASS RINEX { "3" } réels. Aucune transformation PZ-90.11 vers ITRF n'est appliquée (ils concordent au niveau du centimètre depuis { "2014" } ; RTKLIB n'en applique pas non plus). Non câblé dans une sortie de scénario : fonction de bibliothèque

# text
seg-4478a2518341 = RTKLIB v2.4.2-p13 (T. Takasu, BSD-2-Clause, commit 71db0ffa) geph2clk et geph2pos, compilés à partir du source C dans un banc distinct (xval/rtklib-glonass) qui lit le même fichier RINEX avec le lecteur propre de RTKLIB, de sorte que l'analyse, le signe de -tau_n, les unités et l'itération sont comparés en plus de l'horloge et de l'orbite. Fixé à l'avance e099c42a avant l'existence de la fonction et avant la construction du banc. Les deux côtés évaluent la même forme close d'horloge, de sorte que la comparaison d'horloge couvre l'implémentation, non la formule. Les intégrateurs d'orbite diffèrent (RTKLIB avance par pas de { "60" } s puis le reste, Kshana par pas égaux d'au plus { "60" } s) et les constantes aussi (RTKLIB mu { "3.9860044e14" }, Kshana le PZ-90.11 { "3.986004418e14" }) ; le pire cas de { "1.1" } mm est cette différence, comme prévu avant l'exécution. Portée : l'éphéméride diffusée dans son intervalle de validité, non l'orbite ou l'horloge vraie (aucune comparaison avec des produits précis)

# text
seg-d3b72a6fbb18 = Un seul chemin d'orbite terrestre : jeux d'éléments SGP4 vers le GCRS et l'ITRS sur la chaîne IAU 2006/2000A avec paramètres d'orientation de la Terre

# text
seg-e4eca7205b5e = Le chemin de propagation et de repère que partage tout type d'orbite terrestre routé : un jeu d'éléments moyens SGP4 avec une époque UTC en deux parties (sgp4::MeanElementSet, lu à partir des éléments de conception de constellation par MeanElementSet::from_earth_fixed) propagé par SGP4/SDP4 vers TEME (sgp4::SgpOrbit), et les rotations TEME -> ITRS et GCRS -> ITRS de la chaîne IAU 2006/2000A avec UT1 - UTC et mouvement du pôle (sgp4::teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop, les formes à zéro paramètre teme_to_itrs_matrix et gcrs_to_itrs_matrix). TEME est l'équateur vrai de la date avec l'équinoxe moyen, atteint depuis le GCRS par le biais-précession IAU { "2006" }, la nutation IAU 2000B et l'équation des équinoxes

# text
seg-44f28276f859 = Volet { "1" } : python-sgp4 { "2.24" } (licence MIT ; le SGP4 C++ de référence de D. Vallado, le code qui a produit les vecteurs de vérification AIAA 2006-6753), WGS-72, mode amélioré. Volet { "2" } : pyerfa { "2.0.1.5" } (ERFA, BSD-3-Clause, les routines SOFA) : c2t06a avec TT issu de utctai/taitt et UT1 issu de utcut1, et pour TEME c2t06a . pnm06a^T . rz(-ee06a). Seuils fixés avant l'exécution (fixés à l'avance 72ea9eb0). Divulgué : la première exécution a échoué au volet { "2" } à 2016-12-31T23:{ "59" }:{ "59.5" } d'une seconde de rotation (UT1 pris à partir de la date quasi julienne UTC un jour de seconde intercalaire) ; le moteur a été corrigé (jd2::utc_to_ut1) et la seconde exécution concorde avec les seuils inchangés. Le mouvement du pôle supprimé ({ "46" } échecs) ou des constantes WGS-84 à la place de WGS-72 ({ "4432" } échecs) font passer le test au rouge. Cette conception à trois volets a remplacé une comparaison de bout en bout avec Orekit qui échouait sur le SDP4 d'Orekit à e = { "0" } et sur son TEME IERS { "1996" } (le constat reste figé dans tests/leo_polar_coverage_full_claim_orekit_oracle.rs)

# text
seg-f650a11458b8 = Compromis de conception du code de télémétrie

# text
seg-071e552a7179 = Bornes de lobes secondaires et d'intercorrélation des m-séquences/Gold, longueur↔ambiguïté

# text
seg-65b7902a2d8f = Intercorrélation de Gold du C/A GPS publiée (−{ "23.9" } dB) ; borne de Gold { "1967" }

# text
seg-5ec4c0730280 = Géométrie GNSS / dilution de précision (DOP)

# text
seg-edcd694d2b3c = GDOP/PDOP/HDOP/VDOP/TDOP à partir de la géométrie de ligne de visée via Q=(HᵀH)⁻¹ avec une séparation ENU locale

# text
seg-cecd882ec4e4 = gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — bibliothèque indépendante, concordance à { "1e-6" } relatif

# text
seg-1a5623c81b48 = Erreur de position à partir de la géométrie : erreur RMS = sigma_UERE x DOP pour la solution des moindres carrés du moteur

# text
seg-7a94b44a8738 = dop_error_mc::run_geometry et check : une simulation Monte Carlo avec graine (N = { "20,000" } époques par géométrie, sigma = { "1.5" } m, graine ChaCha8 { "36" } + i) de la solution itérée des moindres carrés propre au moteur (pvt::solve_spp, poids unitaires, résolue à partir de la position vraie) sur les { "8" } géométries de tests/fixtures/dop/dop_reference.csv, comparant les variances d'erreur est, nord, haut et horloge, le RMS H/V/P, la corrélation est-nord, les erreurs moyennes et la fraction à l'intérieur de l'ellipse horizontale à { "95" } % avec sigma^{ "2" } Q, où Q est le facteur de covariance du noyau orbit::dop (orbit::dop_cofactor, la même arithmétique) sur la même géométrie

# text
seg-90f18c774d57 = Cohérence interne par rapport à une forme close : sous le modèle gaussien linéaire, la covariance des moindres carrés est sigma^{ "2" } (H^T H)^-1 (Kaplan et Hegarty (éd.), Understanding GPS: Principles and Applications, 2e éd., Artech House, { "2006" }, ch. { "7" }). Méthode et tolérances de la note de conception de géométrie { "0.36" }, section { "5.2" }, fixées dans un commit de préenregistrement avant la première exécution : chaque variance à { "5" } % près ({ "5" } erreurs standard d'une variance d'échantillon à N = { "20,000" }), chaque RMS à { "2.5" } % près, la corrélation est-nord à { "0.035" } près (5/sqrt(N)), chaque moyenne à { "5" } erreurs standard près, la fraction de l'ellipse à { "95" } % à { "0.95" } +/- { "0.0077" } près ({ "5" } erreurs standard binomiales) ; les contrôles négatifs (PDOP doublé ; erreurs croissant en 1/sin(élévation) face au Q non pondéré) doivent échouer. COMMENT ELLE SE COMPOSE : Q est le facteur de covariance du noyau orbit::dop, VALIDATED face à gnss_lib_py { "1.0.4" } sur ces mêmes { "8" } géométries dans tests/dop_reference.rs (ligne 'Géométrie GNSS / dilution de précision') ; cette ligne ajoute le passage de ces facteurs aux mètres par le solveur du moteur et n'emprunte pas le statut de cette ligne. POURQUOI MODELLED : aucun jeu de données externe n'intervient ; la concordance montre que l'estimateur et le bruit réalisent sigma x DOP sous le modèle de manuel, et non que l'erreur d'un récepteur quelconque égale UERE x DOP, et sigma_UERE est une entrée

# text
seg-9acfde1b57f7 = Classification de confiance sensible à la géométrie : géométrie des satellites à côté du score de confiance du récepteur et une classe sur chaque déduction

# text
seg-6138c41e13ff = receiver_trust::geometry : géométrie des satellites par époque (bonne, dégradée avec les raisons few-satellites/high-pdop/high-hdop/sky-blocked, ou inconnue lorsque le journal ne donne ni GSV, ni NAV-SAT, ni GSA) dérivée des élévations et azimuts rapportés via orbit::dop ou reprise de GSA, avec une étiquette toujours rapportée et jamais notée (good, fair, poor, unknown) et le HDOP, le PDOP, le VDOP, le nombre de satellites et la perte de signal en toutes lettres ; un moniteur de géométrie du score du navire qui ne déduit rien tant que la géométrie n'est pas mauvaise (rapport max(hdop/4, pdop/6, 5/n_used) supérieur à { "1" }), puis monte en rampe jusqu'à un plafond de { "15" } points à { "1.5" } que la géométrie seule ne peut pas faire passer sous la bande dégradée (plafond, fin de rampe et plancher dans [geometry] ; aucune alarme) ; une classe sur chaque déduction (geometry, environment, inconsistency) avec la perte d'accrochage sur des satellites sous { "15" } deg classée geometry, les satellites en vue mais non suivis classés environment, et une déduction de mauvaise géométrie dont le HDOP déclaré s'écarte, au-delà de max({ "1.0" }, { "25" } % du HDOP dérivé), du ciel déclaré classée inconsistency

# text
seg-6987737c5fe4 = Cohérence interne : la classification est vérifiée par rapport aux règles qu'elle énonce et par rapport à des rapports dérivés à la main sur des modifications synthétiques du journal de démonstration archivé, et les épinglages sans changement conservent les sorties { "0.35.0" } : aucun score ne change sauf si la géométrie est mauvaise ; l'étiquette est toujours rapportée. POURQUOI MODELLED : les seuils sont choisis, non ajustés (provenance dans le geometry_model de chaque exécution ; les chiffres IEC 61108-1 et GPS SPS tels que cités, à vérifier par rapport au texte des normes), et il n'existe aucun jeu de données étiqueté externe de dégradation naturelle de la géométrie par opposition aux attaques pour valider la classification. Le DOP dérivé réutilise le noyau orbit::dop, VALIDATED face à gnss_lib_py, dont cette ligne n'emprunte pas le statut. Une classe de géométrie est un énoncé sur le ciel, non un constat qu'aucune attaque n'a eu lieu

# text
seg-540420863a5a = Modèle d'ionosphère diffusé (Klobuchar, IS-GPS-200)

# text
seg-fd157c537502 = Retard de groupe ionosphérique oblique Klobuchar monofréquence L1 à partir des huit coefficients α/β diffusés

# text
seg-0b0b02e8b0b8 = RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c) — implémentation de référence indépendante compilée à partir du source ; concordance à < { "1e-4" } m

# text
seg-0af6b1a073ce = Noyau statistique d'intégrité RAIM/ARAIM (lois χ² / χ² non centrée / normale)

# text
seg-224a6c4200cd = Le cœur distributionnel sur lequel repose tout niveau de protection : le seuil instantané de détection de défaut χ²₁₋ₚfₐ(dof), la non-centralité de détection manquée pbias=√λ, et les multiplicateurs de séparation de solutions K_fa/K_md/K_V

# text
seg-03578217425f = Niveau de protection SBAS (HPL/VPL DO-229E aux moindres carrés pondérés)

# text
seg-df640d6c7a5d = Niveaux de protection aux moindres carrés pondérés de l'annexe J de DO-229E : D=(GᵀWG)⁻¹ à partir de l'élévation/azimut par satellite et du budget d'erreur, grand axe de l'ellipse d'erreur horizontale et σ vertical, mis à l'échelle par les facteurs K publiés

# text
seg-39aed7b4bffd = Dérivé SBAS-PL de RTKLIB — zsiki/rtklib_ws waasprotlevels() (Siki & Takács { "2017" }, "DO-229D Appendix J"), exécuté par rnx2rtkp -ws sur de vrais messages EGNOS GEO-PRN120 + un vrai RINEX BUTE/Budapest ; implémentation tierce indépendante, HPL concordant à < { "2e-3" } m. gLAB { "v6.0.0" } (core/filter.c) a confirmé une convention identique. Les deux références arrondissent K_V→{ "5.33" } contre le Φ⁻¹({ "1" }−{ "5e-8" })={ "5.3267" } exact de Kshana (~{ "0.06" }%), de sorte que le vertical est vérifié comme le d_U sans facteur K

# text
seg-8f32eb9c8167 = Métriques d'évaluation de détecteurs ML (ROC/AUC/confusion/Pfa-Pmd)

# text
seg-b0d8e1b45bf9 = AUC (Mann-Whitney, ex æquo ½), matrice de confusion au seuil, P_d/P_md/P_fa/précision/exactitude/F1

# text
seg-d87c8bae7c5e = scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — bibliothèque indépendante, concordance exacte

# text
seg-e7af87ce5e72 = Notation de détection d'anomalies sur de la télémétrie réelle de vaisseau spatial

# text
seg-9659b33fca5b = AUC ROC + IC bootstrap séparant de vraies anomalies étiquetées ; détecteur transparent (reproduit les étiquettes)

# text
seg-b4ed67ce7e7e = scikit-learn roc_auc_score sur la partition de test OPSSAT-AD (Ruszczak et al. { "2025" }, CC BY { "4.0" }) — vraie télémétrie OPS-SAT

# text
seg-5c3f1057c6cc = Noyaux numériques du compromis quantique (NNLS / bandes χ² / Q de van Loan)

# text
seg-f82113ccb30b = Ajustement NNLS de l'ADEV mesurée, bandes de cohérence χ² NEES/NIS, et covariance de bruit de processus discrète de van Loan de l'horloge (marche en holdover) — l'ossature de calcul du moteur de compromis

# text
seg-823da1deb3af = scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm ; NNLS+Q exacts, χ² <{ "5e-4" } aux degrés de liberté de fonctionnement. Noyaux seulement — les chiffres de performance des dispositifs restent modélisés (ligne suivante)

# text
seg-6f3099e7562c = Champ géomagnétique de référence (synthèse IGRF-14)

# text
seg-e9534723cb34 = Synthèse en harmoniques sphériques du champ principal IGRF-14 — composantes X/Y/Z/F, déclinaison et inclinaison — alimentant la couche alt-PNT d'anomalie magnétique

# text
seg-b1431734301a = ppigrf { "2.1.0" } (K. M. Laundal, MIT) — l'implémentation de référence IGRF en Python pur de l'IAGA-VMOD, livrée avec les coefficients officiels IGRF14.shc (14e génération de l'IAGA, Zenodo 10.5281/zenodo.14012302) ; une base de code tierce indépendante calculant le champ IGRF-14 défini de façon unique, concordance sur une grille mondiale

# text
seg-cb3fea409de7 = Statistiques de détection — AUC gaussienne et défaut minimal détectable

# text
seg-ca677becb465 = AUC ROC binormale analytique = Φ(μ/(σ√{ "2" })) et défaut minimal détectable σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)) sous-tendant les détecteurs de défauts quantiques et d'anomalies

# text
seg-7d296e4199af = scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), tous deux BSD-3-Clause — bibliothèques indépendantes calculant les mêmes grandeurs de queue gaussienne / d'AUC définies de façon unique, concordance au plancher de l'erf d'A&S (~{ "7e-8" }). L'avantage quantique contre classique construit dessus reste MODELLED

# text
seg-1ed12110fb74 = Noyau de statistiques d'ordre (Kendall-τ / Dirichlet / centile)

# text
seg-0fb003404a5b = Noyaux de corrélation de rang et de rééchantillonnage sous l'étude d'instabilité de décision de résilience : τ-b de Kendall, moyenne de Dirichlet, classement de compétition et intervalles de confiance par centiles

# text
seg-396602ddeef4 = scipy { "1.18" } (stats.kendalltau variant='b', rankdata) + numpy.percentile (BSD-3-Clause) — implémentations indépendantes (τ par tri fusion) des statistiques d'ordre définies de façon unique, concordance à { "1e-12" }. L'étude d'instabilité de décision construite sur ces noyaux reste MODELLED

# text
seg-fdd2ba203d5b = Noyau de dérivation de priorités MCDA (vecteur propre AHP / rapport de cohérence)

# text
seg-d01c155fbddf = Poids de priorité de l'Analytic Hierarchy Process = vecteur propre principal (de Perron) normalisé d'une matrice de comparaisons par paires réciproque par itération de puissance, avec l'indice de cohérence / le rapport de cohérence de Saaty et la porte d'acceptation CR<{ "0.10" }

# text
seg-d1947f2f2b3b = Table canonique de l'indice aléatoire de Saaty ({ "1980" }) (RI({ "5" })={ "1.12" }) reproduite exactement + SciPy/LAPACK scipy.linalg.eig (BSD-3-Clause) comme solveur propre indépendant calculant le même vecteur/valeur propre de Perron défini de façon unique, concordance à <{ "1e-9" }. La couche de décision Pareto / sensibilité / MAUT construite sur ce noyau reste MODELLED (les agrégateurs WSM/WPM/TOPSIS/VIKOR/PROMETHEE/ELECTRE sont validés séparément par des références externes — voir les lignes ci-dessous)

# text
seg-73e933220afb = Noyaux d'agrégation pondérée MCDA (WSM / WPM)

# text
seg-c436cdc991a2 = Weighted Sum Model (agrégat additif normalisé min–max + classement) et Weighted Product Model (agrégat multiplicatif normalisé par la somme, inverse pour les coûts) — les deux évaluateurs d'agrégation de valeur de l'étude de compromis

# text
seg-1b5b9abcca69 = pymcdm (methods.WSM + normalizations.minmax_normalization ; methods.WPM + normalizations.sum_normalization) — une bibliothèque MCDA Python tierce indépendante et très utilisée calculant les mêmes agrégats pondérés définis de façon unique ; concordance à <{ "1e-9" }. Régénérable hors ligne via tests/fixtures/mcda_wsm/ et tests/fixtures/mcda_wpm/. Garbage-in-garbage-out sur les entrées ; la couche de sensibilité/robustesse reste MODELLED

# text
seg-f00bdb66a052 = Classement MCDA par distance à l'idéal (TOPSIS)

# text
seg-631578cb1259 = Technique for Order of Preference by Similarity to Ideal Solution — normalisation min–max, solutions idéales positive/négative pondérées, proximité relative Cᵢ = d⁻/(d⁺+d⁻) et classement

# text
seg-68265fb0034c = pymcdm methods.TOPSIS + normalizations.minmax_normalization — une bibliothèque MCDA tierce indépendante calculant les mêmes coefficients de proximité définis de façon unique ; concordance à <{ "1e-9" }. Régénérable hors ligne via tests/fixtures/mcda_topsis/generate_topsis_reference.py

# text
seg-ef33d848c985 = Classement MCDA de compromis (VIKOR)

# text
seg-cf879fb770f2 = VlseKriterijumska Optimizacija — utilité de groupe Sᵢ, regret individuel Rᵢ et indice de compromis Qᵢ au poids de stratégie v={ "0.5" }, avec le classement où le plus bas est le meilleur

# text
seg-c1bc14b93848 = pymcdm methods.VIKOR(v={ "0.5" }) — une bibliothèque MCDA tierce indépendante calculant la même agrégation S/R/Q normalisée par l'étendue et définie de façon unique ; concordance à <{ "1e-9" }. Régénérable hors ligne via tests/fixtures/mcda_vikor/generate_vikor_reference.py

# text
seg-790176ba8196 = Classement MCDA par flux net de surclassement (PROMETHEE II)

# text
seg-b25cedf6da6e = Preference Ranking Organization METHod — indice de préférence par paires avec les six formes standard de critère généralisé, flux de surclassement positif/négatif et classement complet par flux net (critère usuel validé)

# text
seg-fce0a2733809 = pymcdm methods.PROMETHEE_II('usual') — une bibliothèque MCDA tierce indépendante calculant le même flux net de surclassement défini de façon unique ; concordance à <{ "1e-9" }. Régénérable hors ligne via tests/fixtures/mcda_promethee/generate_promethee_reference.py. Les formes de préférence à seuils (q/p/σ) se réduisent à la même algèbre de critère généralisé et restent vérifiées par propriétés

# text
seg-72248291c388 = Noyau de choix par surclassement MCDA (ELECTRE I)

# text
seg-a40e985d369d = ELimination Et Choix Traduisant la REalité — matrices de concordance / discordance, la relation de dominance par concordance et non-veto et le noyau de choix par surclassement (convention tout-bénéfice, poids normalisés par la somme, échelle globale unique)

# text
seg-bd625ceb90cc = pyDecision algorithm.electre_i (Valdecy Pereira) — une bibliothèque de décision multicritère tierce indépendante calculant la même concordance/discordance/dominance/noyau défini de façon unique ; concordance élément par élément à <{ "1e-9" }. Régénérable hors ligne via tests/fixtures/mcda_electre/generate_electre_reference.py. Les choix de seuils ĉ/d̂ sont des entrées de l'analyste (la sensibilité reste MODELLED)

# text
seg-95942c6a2689 = Noyaux d'agrégation MCDA (WASPAS / MOORA)

# text
seg-97ac71b01656 = Weighted Aggregated Sum Product ASSessment (mélange convexe à normalisation linéaire λ·WSM+({ "1" }−λ)·WPM à λ={ "0.5" }) et le système de rapports MOORA (total des bénéfices pondérés normalisés vectoriellement moins total des coûts pondérés) — le mélange de valeurs renforcé en stabilité et l'évaluateur signé par système de rapports

# text
seg-7727f311faa3 = pymcdm (methods.WASPAS + normalizations.linear_normalization, l={ "0.5" } ; methods.MOORA ratio system, normalisation vectorielle) — une bibliothèque MCDA Python tierce indépendante et très utilisée calculant les mêmes agrégats définis de façon unique ; concordance à <{ "1e-9" }. Régénérable hors ligne via tests/fixtures/mcda_waspas/ et tests/fixtures/mcda_moora/. Garbage-in-garbage-out sur les entrées ; la couche de sensibilité/robustesse reste MODELLED

# text
seg-7de67fedc1da = Classement MCDA proportionnel (COPRAS)

# text
seg-e8f5cc5c8bb2 = COmplex PRoportional ASsessment — signification des bénéfices S⁺ normalisée par la somme de colonne plus le terme de signification inverse des coûts, la signification relative Q et le degré d'utilité U = Q/max Q (meilleure alternative = { "1" })

# text
seg-49aeef0b79e4 = pyDecision algorithm.copras_method (Valdecy Pereira) — une bibliothèque MCDA tierce indépendante calculant la même signification relative/utilité COPRAS définie de façon unique. pyDecision est utilisé délibérément : le COPRAS de pymcdm { "1.4.0" } se réduit algébriquement au trivial S⁺+S⁻ et n'est pas une référence fidèle, alors que pyDecision implémente le Q canonique = S⁺+(min(S⁻)·ΣS⁻)/(S⁻·Σ(min(S⁻)/S⁻)). Concordance à <{ "1e-9" } ; régénérable hors ligne via tests/fixtures/mcda_copras/generate_copras_reference.py

# text
seg-bdb2917a2520 = Latence de détection de changement CUSUM et ARL

# text
seg-302f5db625df = Latence de détection au pire cas du détecteur CUSUM tabulaire (⌊h/(z−k)⌋+{ "1" }) et longueur moyenne de séquence hors contrôle, utilisées par le niveau de protection de synchronisation et par les moniteurs de leurrage

# text
seg-691a506ce13f = ARL du CUSUM tabulaire publiée : approximation par mouvement brownien de Siegmund ({ "1985" }) (Hawkins & Olwell { "1998" }, éq. { "3.7" }) recoupée avec les tables d'ARL de Montgomery, Introduction to Statistical Quality Control (Wiley) pour k=½, h∈{ "{" }{ "4,5" }{ "}" } ; latence déterministe concordant exactement avec une référence de premier passage. La borne TPL composée reste MODELLED

# text
seg-d923a77bd31a = Variance de marche d'horloge en holdover et inversion de seuil

# text
seg-4fafaf5f919d = Croissance de la variance d'erreur de phase en marche q_wf·t + q_rw·t³/3 + q_drift·t⁵/20 et son inversion monotone en seuil de holdover sur l'erreur de synchronisation

# text
seg-8993c7d8b080 = scipy { "1.18" } (BSD-3-Clause) : linalg.expm calculant le bruit de processus discret de Van-Loan { "1978" } Q₀₀ = ∫₀ᵗ ΦQcΦᵀds par mise à l'échelle et élévation au carré de Padé sur la matrice augmentée { "6" }×{ "6" } — une voie indépendante qui ne voit jamais les coefficients polynomiaux de kshana ; plus optimize.brentq inversant la même courbe monotone face à la bisection de kshana. Les chiffres de plancher de bruit rouge par classe (ClockClass) restent MODELLED

# text
seg-eb3cd9e92d8d = Noyau de diversité de Simpson inverse

# text
seg-244d57819f2b = Diversité architecturale effective = nombre de Simpson inverse / de Hill d'ordre 2 1/Σpᵢ² sur les qualités de source par groupe d'indépendance (le terme de diversité du score de résilience)

# text
seg-17d84876c2f5 = scikit-bio { "0.7.3" } skbio.diversity.alpha.inv_simpson (McDonald et al., BSD-3-Clause) — une bibliothèque tierce indépendante calculant l'indice de Simpson inverse défini de façon unique ; reproduit octet pour octet. Le cadre de notation DHS-RPCF (poids/niveaux) construit dessus reste MODELLED

# text
seg-c14b8fe46517 = Masque de ligne d'horizon dépendant de l'azimut : ensemble visible, azimut et élévation, et DOP sous le masque

# text
seg-56fbe6858a4e = skyline + frames::look_angles + geometry::sky_geometry : l'azimut et l'élévation géodésiques (WGS-84) d'un satellite depuis un site au sol, une table de masque azimut/élévation interpolée linéairement en azimut avec rebouclage à { "360" } deg, l'ensemble visible el >= max(mask_deg, mask(az)), et le DOP à horloge commune et la matrice de cofacteurs ENU-et-horloge de cet ensemble (le noyau derrière orbit::dop). C'est ainsi que la section [skyline] décide de la visibilité dans les types gnss-sim, jamming, leo-pvt, leo-pass et nmea-scenario et, avec le site au sol user_site, dans orbit et integrity

# text
seg-578d7acd3288 = Orekit { "12.2" } (Apache-2.0) : un TopocentricFrame sur un OneAxisEllipsoid WGS-84 pour les angles de visée et un ElevationMask par table, exécuté par xval/orekit-skyline/OrekitSkyline.java sur des états terrestres archivés (la propagation n'est pas comparée), avec gnss_lib_py { "1.0.4" } (métadonnées de la roue MIT) get_dop pour le DOP et la matrice DOP ENU-et-horloge des ensembles qu'Orekit trouve visibles. Fixé à l'avance (xval/orekit-skyline/PREREGISTRATION.md, commit e4b9d912) avant l'exécution de l'une ou l'autre référence sur les entrées de comparaison ; l'interpolation linéaire avec rebouclage d'Orekit a été confirmée au préalable sur une sonde synthétique. Portée : masques en table, angles de visée géodésiques, l'ensemble visible masqué et son DOP à horloge commune et son cofacteur. NON vérifiés ici : les réductions de canyon, de secteur et de relief et les préréglages (leurs tables de 360 points entrées comme données ; lignes 'Réductions de canyon urbain, de secteur et de relief en table' et 'Préréglages de ligne d'horizon'), les états d'horloge par système et l'ellipse d'erreur (ligne 'Ellipse d'erreur horizontale et cofacteur par système à partir de la covariance de géométrie'), la rotation GMST du site au sol user_site dans orbit/integrity et la datation de chaque propagateur à un instant unique (Orekit reçoit des états liés à la Terre), et toute obstruction réelle (ligne de visée seulement)

# text
seg-bbb1828b3db1 = Réductions de canyon urbain, de secteur et de relief en table

# text
seg-2864aec7be88 = skyline : le canyon urbain en forme close (coupure atan((h - a) / d) avec d = (w/2) / abs(sin(az - s)), extrémités ouvertes pour une longueur finie), secteurs à bords nets dans le sens horaire avec rebouclage, et points de relief réduits en table avec la chute de courbure d^2/({ "2" } * 4/3 R) ; la ligne d'horizon est leur maximum point par point avec toute table

# text
seg-50f1df206b30 = Interne : les formes closes sont vérifiées par rapport à des valeurs calculées à la main (élévations du sommet de mur d'une rue donnée, la condition d'extrémité ouverte, la chute de courbure d'un point donné). Aucune référence externe : la note de conception classe ces réductions comme MODELLED, et l'ElevationMask d'Orekit prend une table, de sorte que la comparaison de la ligne 'Masque de ligne d'horizon dépendant de l'azimut : ensemble visible, azimut et élévation, et DOP sous le masque' lit leurs tables de 360 points comme entrées et ne les vérifie pas

# text
seg-3f3d657854ce = Préréglages de ligne d'horizon (rue de ville, approche portuaire, fjord, terminal à conteneurs)

# text
seg-44ae9b6289d9 = Aucune : dimensions choisies et énoncées, et non un relevé d'une rue, d'un port, d'un fjord ou d'un terminal quelconque (le rapport d'aspect de la rue est dans la bande 0.5-2 d'Oke ({ "1988" }) ; le fjord est de l'ordre des fjords de l'ouest de la Norvège ; les piles utilisent la hauteur high-cube ISO { "668" }). Le test vérifie les préréglages par rapport à leurs propres dimensions énoncées, une vérification de transcription, que la règle de validation ne compte pas

# text
seg-2c53381d48ae = Ellipse d'erreur horizontale et cofacteur par système à partir de la covariance de géométrie

# text
seg-15fea5c05cbd = geometry::sky_geometry : le cofacteur ENU-et-horloge (H^T H)^-1 avec une horloge de récepteur commune ou une par système (le noyau orbit::cofactor_from_los), et l'ellipse d'erreur horizontale à partir de son bloc est-nord (demi-axes k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), l'azimut du grand axe depuis le nord)

# text
seg-1982bafa3466 = numpy { "2.5.4" } (BSD-3-Clause), xval/numpy-ellipse/ellipse.py : numpy.linalg.inv de G^T G et numpy.linalg.eigh de son bloc horizontal sur les entrées archivées, une bibliothèque numérique indépendante effectuant l'inverse et la décomposition en valeurs propres par ses propres algorithmes (P2 standard). Fixé à l'avance dans xval/numpy-ellipse/PREREGISTRATION.md (commit 0bbeeaee) avant l'exécution ; le formatage de sortie du pilote a été corrigé une fois après le préenregistrement (un scalaire numpy écrit np.float64(...)), sans changement du protocole ni des tolérances. L'affirmation validée est l'algèbre linéaire sur ces entrées ; le modèle d'erreur gaussien et l'UERE sont des entrées énoncées, non une précision mesurée ni une borne d'intégrité

# text
seg-6012113b4836 = Fonctions de géométrie du ciel : visibilité, DOP, covariance, ellipse d'erreur, nuage Monte Carlo

# text
# c1: kshana sky
# c2: kshana skyline
# c3: sky_geometry
seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg ; CLI <c1/> et <c2/>, fonctions Python et WASM de mêmes noms, MCP <c3/>) : à partir d'un site, d'un instant et de préréglages de constellation (ou de satellites en azimut/élévation ou ECEF), les satellites visibles et masqués sous une ligne d'horizon, GDOP/PDOP/HDOP/VDOP/TDOP, le cofacteur à variance unitaire (H^T H)^-1 et la covariance est-nord-haut avec une horloge de récepteur par système ou une commune, l'ellipse d'erreur horizontale (demi-axes k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), orientation { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) depuis le nord), et n erreurs de moindres carrés tirées avec graine sous des erreurs de distance gaussiennes indépendantes avec leur covariance empirique, leur RMS et leur confinement à { "95" } %. Le cofacteur est orbit::cofactor_from_los, le noyau unique derrière orbit::dop et orbit::dop_cov (dop est la réduction de dop_cov) : aucune seconde implémentation du DOP

# text
seg-aa0da1028636 = Les facteurs DOP à horloge unique reposent sur le noyau validé face à gnss_lib_py { "1.0.4" } (ligne 'Géométrie GNSS / dilution de précision (DOP)') ; les vérifications propres à cette ligne sont internes : sky_geometry reproduit orbit::dop et dop_cov sur la même géométrie, l'ellipse reproduit une décomposition en valeurs propres 2x2 analytique, les entrées ECEF et azimut/élévation concordent, et le RMS et le confinement à { "95" } % du nuage tiré avec graine concordent avec la géométrie. La covariance ENU avec une horloge par système et l'ellipse sont VALIDATED dans la ligne 'Ellipse d'erreur horizontale et cofacteur par système à partir de la covariance de géométrie' (numpy, P2) ; ce qui reste MODELLED ici est la composition : la propagation des préréglages vers un ciel représentatif, le nuage Monte Carlo (vérifié par rapport à la géométrie qu'il échantillonne, une vérification d'autocohérence) et les surfaces. Les préréglages de constellation donnent un ciel représentatif, non daté ; le modèle d'erreur gaussien et l'UERE sont des entrées énoncées, non une précision mesurée ni une borne d'intégrité

# text
seg-7f66be0f15c8 = Holdover d'horloge sans GNSS

# text
seg-4d8f87668a0f = Croissance de l'erreur de marche en forme close + holdover jusqu'au seuil ; classes d'horloges quantiques

# text
seg-2d260626e3d2 = Récursion de covariance clock_state à plusieurs pas (recoupement au sein de la même base de code) ; le noyau sous-jacent de variance de marche et d'inversion de holdover est validé par une référence externe face à scipy (voir 'Variance de marche d'horloge en holdover et inversion de seuil'). Les chiffres de holdover par plancher de bruit rouge de chaque classe restent MODELLED

# text
seg-29b482d88916 = Fiches d'appareil d'horloges mesurées (prédiction sur jeu réservé)

# text
seg-8c68c5b25004 = clock_library : une fiche d'appareil (bruit blanc de phase, bruit blanc, bruit de scintillement et marche aléatoire de FM plus une dérive linéaire de fréquence) ajustée sur un tiers d'un enregistrement d'horloge mesuré nommé après une passe de conditionnement consignée (lacunes, valeurs aberrantes de phase, sauts de phase, rafales supprimés ; sauts de fréquence consignés), pondérée par les degrés de liberté de type de bruit identifiés au retard 1, et son écart-type d'Allan prédit noté sur les deux tiers réservés ; lecteurs pour les fichiers d'horloge RINEX et IGS, les fichiers par laboratoire du BIPM et la section { "1" } de la Circular T ; conversion d'une fiche en modèle de bruit de synchronisation de créneau, en modèle d'horloge à filtre de Kalman étendu et en niveaux de bruit du moniteur de leurrage

# text
seg-af2d78e2986c = Enregistrements mesurés, réservés : horloges combinées finales IGS à { "30" } s des { "11" } satellites GPS Block IIF du 2026-03-01 au { "14" } (une fenêtre qu'aucun test n'avait ouverte ; IGS, libre avec attribution) et le récepteur u-blox ZED-F9P de JammerTest { "2024" } dans ses sessions stationnaires non notées (GPL-3.0-or-later). Comparaison externe D9 (fixée à l'avance 2ec76864, écart-type d'Allan prédit / mesuré de chaque fiche dans [1/1.5, { "1.5" }] à ses temps de moyennage ajustés), un constat (reste MODELLED) : { "10" } fiches GPS IIF sur { "11" } sont dans le seuil ; G27 est optimiste à l'échelle de deux heures ({ "0.662" } à { "7680" } s, pire facteur { "1.510" }), l'erreur périodique à l'échelle de l'heure qu'une fiche en loi de puissance ne porte pas. La fiche du TCXO du récepteur est bloquée : hors des transmissions consignées, les autres sessions du jeu de données laissent { "167" } époques contre les { "3600" } requises. Rapporté, non en aveugle (enregistrements ouverts par des lignes antérieures) : la fiche du césium 5071A est dans le seuil (pire { "1.070" } jusqu'à { "4096" } s), la fiche de l'OCXO est prudente et hors du seuil ({ "2.348" } à { "128" } s ; son plancher de bruit change au cours de l'enregistrement), et la fiche du strontium de Norcia ajustée sur les trois points publiés les plus courts est dans le seuil aux deux points notés ({ "1.291" }, { "1.405" }). Les masers à hydrogène passifs Galileo (aucune source sans connexion préalable des horloges finales Galileo accessible) et la Deep Space Atomic Clock (une seule valeur ouverte en vol spatial) sont bloqués. D9 tour { "2" }, le TCXO du récepteur ZED-F9P comme classe de modèle sur { "14" } jours de { "12" } stations statiques de Wroclaw (Zenodo { "6488497" }, CC BY { "4.0" } ; fixé à l'avance fb475550), un constat : avec le pipeline enregistré, { "11" } stations sur { "12" } n'étaient pas évaluables (RAIM a rejeté la plupart des époques sans ionosphère) et BX14 a échoué ; une nouvelle exécution divulguée avec un pipeline corrigé (fixée à l'avance c9cc0d49) fait passer { "1" } station sur { "11" } en aveugle (BX12, { "1.412" } ; BX07 { "1.532" } et BX13 { "1.542" } juste en dehors), parce que les horloges de récepteur à point unique issues de fichiers à { "30" } s intermittents ne sont pas un enregistrement d'oscillateur propre

# text
seg-5097a0e6460d = Fiches d'horloges GPS Block IIF mesurées avec termes par révolution (prédiction sur jeu réservé)

# text
seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic : une fiche d'appareil qui porte les termes de phase de une à quatre fois par révolution (période T/k, T = { "43 082.05" } s), ajustés conjointement avec le terme quadratique par moindres carrés sur un tiers d'un enregistrement d'horloge de satellite mesuré, avec la contribution d'Allan en forme close de chaque terme { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } dans l'écart-type d'Allan prédit

# text
seg-83981cd13a17 = Enregistrements mesurés, réservés : horloges combinées finales IGS à { "30" } s des { "11" } satellites GPS Block IIF du 2026-04-01 au { "14" } (une fenêtre qu'aucun test n'avait ouverte ; IGS, libre avec attribution). Comparaison externe D9 (fixée à l'avance fb475550, écart-type d'Allan prédit / mesuré dans [1/1.5, { "1.5" }] à chaque temps de moyennage ajusté sur chaque satellite), un constat (reste MODELLED) : { "9" } fiches sur { "11" } sont dans le seuil ; G03 ({ "1.947" }) et G25 ({ "1.581" }) sont optimistes entre { "60" } s et { "2000" } s parce que leurs enregistrements réservés sont plus bruités que leurs tiers d'ajustement (la partie réservée de G25 porte { "16" } lacunes et { "29" } valeurs aberrantes de phase), un changement de l'horloge plutôt qu'un terme périodique manquant. Retirer les termes périodiques de la prédiction fait échouer les { "11" } fiches ({ "1.77" } à { "4.96" }), de sorte que les termes portent la prédiction

# text
seg-0d72fcc0fbea = Estimation de l'état d'horloge embarquée

# text
seg-6db5391f8ebe = Horloge de Kalman à 3 états (phase/fréq./dérive) de Van Loan, stabilisée de Joseph

# text
seg-f41b4c81df2a = filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), avec F via scipy.linalg.expm et Q via la matrice par blocs de Van-Loan { "1978" } — une implémentation de référence indépendante reproduisant la trajectoire complète du filtre de kshana. Cohérence entre implémentations : la physique de l'horloge / l'étalonnage d'Allan ne sont pas validés de façon externe, donc cette ligne reste MODELLED. Comparaison externe { "0.30" }, un constat (reste MODELLED) : sur les horloges finales IGS à { "30" } s de { "11" } satellites GPS Block IIF (2025-08-17 au { "30" }), avec Q ajusté sur l'ADEV de la première moitié et le filtre noté sur la seconde moitié réservée, le filtre est cohérent à un pas ({ "0.906" } à { "0.971" } des époques dans sa bande à { "95" } %, seuil { "90" } %) mais trop confiant à une heure sur { "9" } horloges sur { "11" } ({ "0.486" } à { "0.829" }) et ses sommes d'innovation sortent de [{ "2.4" }, { "3.6" }] sur { "5" }. Le bruit blanc de phase ajusté est nul sur chaque satellite, et l'erreur à l'échelle de l'heure (termes périodiques, FM de scintillement) n'est pas dans le modèle à 3 états. { "0.30" } tour { "2" }, un filtre étendu (FM de scintillement et états à une et deux fois par révolution) sur de nouvelles horloges IGS réservées du 2025-09-01 au { "14" } (fixé à l'avance 4b1a841e), un constat (reste MODELLED) : les critères de cohérence à un pas et à une heure sont tenus sur les { "11" } satellites ({ "0.948" } à { "0.988" } et { "0.907" } à { "0.996" }), mais le critère de somme d'innovation échoue sur G24 ({ "0.964" }) et G30 ({ "1.929" }) face à [{ "2.4" }, { "3.6" }]. D9 tour { "3" }, le filtre étendu du tour 2, réglage et critères inchangés après le détecteur de conditionnement figé de clock_library, sur de nouvelles horloges IGS du 2026-04-01 au { "14" } (fixé à l'avance fb475550), un constat (reste MODELLED) : (a) un pas { "0.941" } à { "0.968" } et (c) moyenne du triple NIS { "2.641" } à { "3.549" } sont tenus sur les { "11" } satellites ; (b) une heure échoue sur G09 ({ "0.894" }) et G26 ({ "0.876" }) face à { "0.90" }

# text
seg-3f0a9d7c2971 = Budgétisation des erreurs de transfert de temps

# text
seg-216f46b43860 = Bidirectionnel/TWSTFT (Sagnac), vue commune GNSS, PPP ; gigue de liaison→distance

# text
seg-e7b6aac2ec58 = Magnitude de Sagnac vérifiée par rapport à une VALEUR PUBLIÉE faisant autorité — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), éq. { "1.29" } : un tour de l'équateur vers l'est accumule { "207.4" } ns (2ωA_E/c²) ; kshana reproduit { "207.386" } ns. Corroboré indépendamment par RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), qui porte la même géométrie 2Aω/c². Le budget composite BIPM transpondeur TWSTFT/vue commune/PPP n'a aucune référence externe, de sorte que la capacité reste modélisée

# text
seg-157fadeb5d67 = Modulation de signal de navigation et analyse du suivi de code

# text
seg-ab633d191396 = DSP BPSK-R/BOC, séparation spectrale κ, largeur de bande de Gabor, gigue de DLL, multitrajet

# text
seg-94f0c4fc2930 = Intercorrélation/autocorrélation de Gold du C/A GPS concordant EXACTEMENT (entier ±65/−1/63) avec une génération de code IS-GPS-200 indépendante ; forme de DSP BPSK-R({ "1" })/BOC({ "1,1" }) face à un périodogramme scipy indépendant. Les formes closes de modulation/SSC/DLL (Betz { "2001" } / Kaplan & Hegarty) restent analytiques, de sorte que la ligne reste MODELLED — mais la sous-affirmation de corrélation de code concorde avec une référence externe. { "0.30" } tour { "2" }, face aux valeurs imprimées de Betz { "2001" } et de Hein et al. { "2006" } (fixé à l'avance 9f4f2ce8, une demi-unité imprimée), un constat (reste MODELLED) : les { "45" } cellules spectrales du tableau { "1" }, les valeurs de corrélation à { "1" } GHz, les chiffres d'interférence MBOC et { "2" } décalages sur { "3" } de la fig. { "17" } concordent ; les premiers lobes latéraux à { "24" } MHz, le décalage BOC({ "8,4" }) de la fig. { "17" } et chaque biais de multitrajet au pire cas des fig. 18-21 ({ "11" } à { "15" } % trop bas) ne concordent pas. Kshana et une évaluation NumPy indépendante de la lecture fixée à l'avance concordent, de sorte que l'écart tient à cette lecture ou à un détail non énoncé de l'article ; cause non résolue

# text
seg-589e0053e3e8 = Génération du code d'étalement GPS L1 C/A

# text
seg-782d4da75b59 = Générateur de code C/A à LFSR G1/G2 reproduisant les vecteurs de vérification octaux des 10 premiers chips publiés dans IS-GPS-200 pour les PRN { "1" }–{ "9" } (plus la longueur de 1023 chips, l'équilibre de 512 uns, l'autocorrélation périodique à trois valeurs)

# text
seg-473f24d4e06a = IS-GPS-200 Table 3-Ia 'Code Phase Assignments' — les vecteurs de vérification OCTAUX des 10 premiers chips publiés, faisant autorité, du domaine public du gouvernement des États-Unis (GPS Directorate, navcen.uscg.gov) ; le LFSR G1/G2 propre de kshana régénère exactement chaque vecteur des PRN { "1" }–{ "9" }. Les formes closes de modulation/SSC/DLL en aval restent modélisées (ligne distincte)

# text
seg-e6c08e1e6ae3 = Performance de capteur inertiel quantique

# text
seg-d28e1f6a430f = Accéléromètre à interféromètre à atomes froids à partir des premiers principes (k_eff·T², QPN)

# text
seg-57fd0a6e5d72 = Vecteurs numériques publiés des articles primaires sur le CAI (fonction de transfert de Cheinet { "2008" } ; sensibilité de Peters/Freier) : k_eff·T² concordant exactement, DSA du bruit de grenaille un plancher unilatéral à environ { "2" }× de chaque instrument publié (les appareils réels portent un bruit technique au-dessus du plancher quantique). Un encadrement, non une parité. { "0.30" } tour { "2" } (fixé à l'avance fcb9ac64), un constat (reste MODELLED) : le bruit de rotation QPN seul face aux points mesurés de la fig. { "14" } de Gauguet et al. { "2009" } donne des rapports de { "0.695" } à { "0.788" } aux trois points admis ({ "0.751" } au point de fonctionnement), manquant le seuil de { "30" } % fixé à l'avance de { "0.5" } point ; le plancher QPN se situe { "21" } à { "31" } % sous le bruit mesuré, comme attendu d'un modèle sans bruit de laser ni de détection. La composition en gradiomètre concorde avec la ligne de modèle QPN de Janvier et al. { "2022" } (rapport { "1.013" } à { "1.017" }, Reference). Le test mesuré ne peut pas discriminer une erreur de composition en sqrt({ "2" }) ; seule la ligne de Janvier à contrastes inégaux le peut

# text
seg-4b79d03cecf5 = Ambiguïté de frange / plage dynamique du capteur inertiel quantique

# text
seg-deb2850546d5 = Plage dynamique d'ambiguïté de frange Mach–Zehnder : la lecture de frange périodique en 2π fixe une force spécifique maximale non ambiguë a_max=π/(k_eff·T²), et la plage non ambiguë en cellules de résolution a_max/σ_a=π/σ_Φ est indépendante du facteur d'échelle optique — le gain de sensibilité en T² coûte de la plage non ambiguë en parfaite proportion (le temps d'interrogation échange résolution contre plage, laissant le nombre de cellules fixé par le bruit de phase de lecture)

# text
seg-7603ff7a7693 = Autocohérence du modèle de franges de l'interféromètre : le bord de demi-frange, la structure de repliement périodique en 2π et l'annulation du facteur d'échelle dans le rapport plage/résolution sont des identités algébriques en forme close vérifiées par rapport aux propres fonctions de phase et de sensibilité Mach–Zehnder du moteur — des vérifications de cohérence interne, PAS un jeu de données externe, de sorte que la ligne reste InternalConsistency. Ambiguïté de frange idéale à trois impulsions MODELLED ; aucune borne d'aberration de front d'onde ni de perte de contraste sur la plage non ambiguë

# text
seg-d04bf321d4a1 = Résilience de navigation à l'estime inertielle quantique

# text
seg-c4989abb5d40 = Budget de position composé biais + facteur d'échelle + VRW + décroissance de stabilité sur le holdover

# text
seg-bfe4085115c1 = Intégration SDE Monte-Carlo numpy indépendante du bruit d'accélération blanc doublement intégré (valide la variance VRW analytique par un algorithme véritablement indépendant) + un ancrage sur valeur publiée de Groves { "2013" } pour les termes de biais/facteur d'échelle ; les chiffres d'appareils CAI quantifient du matériel partenaire et restent MODELLED

# text
seg-bc6e733c39b3 = Fusion de capteurs GNSS/INS

# text
seg-16514286bb51 = EKF en états d'erreur à 15 états, à couplage lâche (validé sur un trajet réel IMU/GNSS face à NaveGo) ; un UKF pseudodistance/Doppler à couplage serré et un filtre couplé horloge+position (cohérence seulement, hors de l'affirmation validée)

# text
seg-4a9bf6adeb45 = NaveGo v1.4 (R. Gonzalez, LGPL-3.0, exécuté comme outil sous GNU Octave, jamais lié) : son ins_gnss à couplage lâche sur son propre trajet réel de véhicule terrestre Ekinox IMU/GNSS, les deux solutions notées par rapport à la trajectoire de référence Ekinox. Les deux filtres lisent la même entrée float32 à { "20" } Hz, et la configuration de Kshana est mappée mécaniquement à partir des paramètres publiés du jeu de données. Le RMS de position horizontale et verticale de Kshana et son RMS d'innovation de position sont à moins de 1.2x de ceux de NaveGo (mesurés { "0.912" }, { "0.940" } et { "0.861" }) et son innovation normalisée moyenne est d'au plus { "1.5" } (mesurée { "0.395" } : environ 2.5x sous-confiant, compte tenu des sigmas GNSS énoncés du jeu de données) ; tolérances fixées avant la comparaison. Portée : le GNSS est présent à { "5" } Hz sur tout le trajet, de sorte qu'aucune interruption ni marche n'est testée et que la vérification détecte des défauts grossiers du filtre plutôt qu'un réglage fin (des positions brutes corrigées du bras de levier tomberaient près du seuil vertical) ; la transformation du bras de levier est calculée dans le banc de test. L'UKF à couplage serré et le filtre couplé horloge+position conservent leurs vérifications de cohérence filterpy { "1.4.5" } (postérieures linéaires à { "2.4e-12" }) et restent hors de l'affirmation validée

# text
seg-5692c7b936b6 = Résilience au brouillage sans GNSS

# text
seg-f4ff77caa47b = Bilan de liaison J/S géométrique, C/N₀ anti-brouillage, perte d'accrochage par satellite

# text
seg-daf317735edb = Équation du bilan de liaison C/N₀ anti-brouillage recoupée avec une redérivation numpy indépendante (partage la même forme close → InternalConsistency) plus une caractérisation de dégradation du C/N₀ de JammerTest-2024 réel. { "0.30" } tour { "2" }, bloqué (reste MODELLED) : la baisse mesurée du C/N0 de JammerTest { "2024" } face à une prédiction par bilan de liaison (fixée à l'avance 6a66994b, à { "3" } dB près) n'a pas été exécutée parce que la position et le pointage de l'antenne F8.1 à Bleik et la part L1 de la puissance de la rampe multibande { "1.6.4" } ne sont documentés ni dans le catalogue d'essais ni dans le journal officiel

# text
seg-ff90679d1de9 = Détection de leurrage

# text
seg-b843f63e77e6 = FoM de sécurité par époque fusionnant χ² aidé par l'horloge, RAIM, AGC, SQM

# text
seg-baeb1c3db11f = Paramètres de scénario TEXBAT (Humphreys { "2012" }) — caractérisation, non vecteurs épinglés. Comparaison externe { "0.30" }, un constat (reste MODELLED) : sur JammerTest { "2024" } (Bleik ; données GPL-3.0), les moniteurs au niveau des observables (khi-deux aidé par l'horloge, RAIM, échec de résolution) n'ont levé aucune alarme dans les { "10" } s suivant l'un quelconque des { "8" } débuts de leurrage publiés évaluables (là où la fenêtre précédant le début était propre, la première alarme est venue { "10.2" } à { "39" } s après le début du créneau publié), et trois fenêtres précédant le début portaient de fausses alarmes du moniteur d'horloge ({ "81" }, { "64" } et { "173" } époques). Le premier effet observable a été une perte de suivi GPS bifréquence, et non une incohérence RAIM. Les débuts publiés sont des débuts de créneaux d'un calendrier à la résolution de la minute ; qu'ils précèdent la capture RF est une interprétation, non une mesure. { "0.30" } tour { "2" }, face au journal officiel des organisateurs de JammerTest { "2024" } (résolution de la seconde ; fixé à l'avance 6a66994b avec un moniteur d'horloge à trois états calibré par Hadamard sans verrouillage), un constat (reste MODELLED) : le moniteur alarme dans les { "10" } s à { "4" } des { "10" } débuts consignés ; aux six autres il est en retard de { "18" } à { "211" } s ou lève de fausses alarmes d'horloge avant le début ({ "1" } à { "2.1.4" }, { "85" } à { "2.3.15" }). D9 tour { "3" } (une fiche de récepteur issue des autres sessions de l'unité JammerTest, fixée à l'avance 2ec76864) bloqué : { "167" } époques d'apprentissage contre { "3600" }. D9 tours { "4" } et 4b (niveaux de bruit issus d'une fiche de classe de modèle u-blox ZED-F9P, Wroclaw { "2021" }, fixés à l'avance fb475550 ; 4b une nouvelle exécution divulguée avec une extraction corrigée, c9cc0d49), un constat (reste MODELLED) : zéro fausse alarme avant le début sur les { "10" } débuts consignés et { "6" } sur { "10" } dans les { "10" } s ; { "2.1.1" }, { "2.3.5" }, { "2.3.10" } et { "2.6.1" } restent en retard (+{ "211" }, +{ "23" }, +{ "18" }, +{ "51" } s), sans changement avec le niveau de bruit d'horloge

# text
seg-b10d07921f5e = Niveau de protection de synchronisation sous leurrage

# text
seg-2a829711b997 = Borne en forme close de l'erreur temporelle non détectée au pire cas = plancher du moniteur + σ de marche de l'oscillateur sur la latence de détection CUSUM, rapportée comme bande de plancher de bruit rouge

# text
seg-682251b2e3c7 = Compose des primitives validées (allan/holdover de Van Loan, plancher de sécurité) ; calibré sur le scénario { "2.1.1" } de JammerTest { "2024" } (~{ "1.01" } ms de dérive réelle du temps servi contre ≤{ "51" } ns revendiquées). Pont au-dessus de parties validées — pas en soi une validation externe. Comparaison externe { "0.30" }, un constat (reste MODELLED) : sur les scénarios de leurrage de JammerTest { "2024" }, l'erreur mesurée non détectée sur le temps servi dépasse le TPL nominal à { "3" } des { "8" } débuts détectés : { "184.3" } contre { "34.6" } ns ({ "2.1.4" }), { "295.7" } contre { "159.3" } ns ({ "2.3.5" }) et { "143.0" } contre { "69.0" } ns ({ "2.3.11" }) ; trois des cinq dans la borne sont triviaux (une fausse alarme verrouillée avant le début). Cause probable : le terme de marche issu d'un étalonnage de { "60" } s sans bruit de dérive ne couvre pas la dérive de fréquence du TCXO du récepteur sur { "15" } à { "39" } s. L'erreur mesurée est l'estimation d'horloge à point unique propre à Kshana face à une droite ajustée sur ses propres estimations avant le début, de sorte que même une concordance n'aurait pas été entièrement indépendante. { "0.30" } tour { "2" }, face aux débuts du journal officiel de JammerTest { "2024" } et à l'erreur de temps mesurée du récepteur (fixé à l'avance 6a66994b), un constat (reste MODELLED) : à { "4" } des { "10" } débuts consignés, l'erreur non détectée dépasse le TPL à état de dérive ({ "634.7" } contre { "458.5" } ns à { "2.1.1" }, { "232.6" } contre { "16.2" } ns à { "2.3.5" }, { "41.3" } contre { "6.0" } ns à { "2.3.10" }, { "218.6" } contre { "47.4" } ns à { "2.6.3" })

# text
seg-0ec37553bbc4 = Analyse de mission cislunaire

# text
seg-a47465f682ba = STM CR3BP + correcteur différentiel à tir simple ; NRHO sud L2

# text
seg-9acd64de4abc = Base de données NASA/JPL des orbites périodiques à trois corps (SSD, periodic_orbits.api ; famille de halos sud Terre–Lune L2, méthodologie de Howell/Davis) — période T, constante de Jacobi C et conditions initiales de croisement perpendiculaire publiées de façon externe ; le correcteur STM à tir simple de kshana, amorcé avec la condition initiale du catalogue et perturbé, reconverge vers les membres du catalogue

# text
seg-f1d49eac89f8 = PNT alternatif / complémentaire

# text
seg-023dda973f66 = Appariement de carte de gravité, navigation référencée au relief (TERCOM/SITAN), anomalie magnétique

# text
seg-da869d48e505 = Coefficients IGRF-14 ; CRLB de filtre adapté issue des premiers principes. Le champ de l'étalon de gravité en champ réel est vérifié de façon externe (ligne 'Synthèse d'anomalie de gravité à partir d'un modèle en harmoniques sphériques'), mais son résultat de navigation n'a aucune référence externe

# text
seg-db7767ab661d = Synthèse d'anomalie de gravité à partir d'un modèle en harmoniques sphériques

# text
seg-2db367c4a473 = Anomalie de gravité en approximation sphérique (Barthelmes STR09/02 éq. { "126" }, ICGEM gravity_anomaly_sa) à partir de coefficients complètement normalisés par rapport à un ellipsoïde de niveau en forme close (WGS84/GRS80), avec le terme de degré zéro, mise en grille pour l'apparieur de cartes de gravité

# text
seg-abcb0965dd2b = ICGEM Calculation Service (GFZ Potsdam), une implémentation indépendante : EGM2008 tronqué au degré { "70" }, gravity_anomaly_sa, WGS84, sans marée, terme de degré zéro, h = { "0" }. La sortie du service ne porte aucune licence explicite, de sorte que les grilles sont récupérées au moment du test avec un SHA-256 épinglé (tools/fetch_icgem_grid.sh) et que seules dix valeurs sont citées avec attribution

# text
seg-31f51d4998cb = Lecteur d'altitude numérique SRTM sur du relief réel

# text
seg-08ea4ae0b671 = Analyseur SRTM .hgt écrit à la main (16 bits gros-boutiste, rangée nord d'abord, attentif aux vides) + échantillonneur bilinéaire lisant une vraie tuile MNT du domaine public et résolvant un repère de levé documenté

# text
seg-aae487789add = Tuile NASA/USGS SRTM v3 (1 seconde d'arc) N36W117 — données d'altitude du DOMAINE PUBLIC du gouvernement des États-Unis issues du miroir ouvert AWS elevation-tiles-prod, décimées à 6 secondes d'arc et archivées sous tests/fixtures/terrain/ (voir NOTICE.md), plus des recadrages pleine résolution de N36W117 et N36W119 recoupés nœud par nœud avec le lecteur SRTMHGT indépendant de GDAL et les repères de levé du mont Whitney ({ "4421" } m) et de Badwater (−{ "86" } m). Le repère documenté du bassin de Badwater (−{ "86" } m, le point le plus bas d'Amérique du Nord) ancre la lecture géoréférencée. Le calage de navigation par appariement de relief/TERCOM qui consomme le MNT reste modélisé (ligne distincte PNT alternatif/complémentaire)

# text
seg-791e7285c291 = Reproductibilité et assurance logicielle

# text
seg-7177355a482c = Portes déterministes, à hachage de scénario, SBOM + références d'or multiplateformes

# text
seg-6cf9d570cc51 = Respect du schéma JSON CycloneDX { "1.5" } officiel par le SBOM (+ identifiants SPDX valides) — une norme publiée externe, zéro erreur de validation sur tout le graphe de dépendances ; la partie déterminisme des FoM / reproductibilité à l'octet reste une vérification d'autocohérence épinglée, de sorte que la ligne reste MODELLED

# text
seg-89b2114542bb = Évaluation de la détection de perturbations RF par IA/ML ({ "13494" })

# text
# c1: impairment-eval
seg-241f2eeaef12 = Corpus synthétique étiqueté de perturbations + banc ROC/AUC/confusion/Pfa-Pmd indépendant du détecteur ; garde contre les fuites, partition stratifiée, rapport d'optimisme sur le changement de distribution (dans le régime contre hors du régime). Exécutable depuis la CLI/les liaisons comme type de scénario <c1/> (scenarios/impairment-eval.toml)

# text
seg-72a3c97ef04b = Bornes d'AUC en forme close (Mann–Whitney) + un détecteur à référence parfaite ; le corpus est SYNTHÉTIQUE (fondé sur des paramètres, ni de terrain ni IQ)

# text
seg-c38ebee794b3 = Étude de l'écart d'optimisme de perturbations RF par IA/ML et prédicteur d'écart à partir de la seule distribution d'origine

# text
# c1: cargo run --release --example optimism_study
seg-642087659fda = Étude synthétique contrôlée de l'écart d'optimisme d'AUC entre dans-la-distribution et hors-distribution pour des détecteurs de méthodes publiées et appris (régression logistique / MLP à une couche cachée) : tendances de loi d'échelle par classe (Spearman ρ + pente sur { "1" }−gravité) et un prédicteur ridge à partir de la seule distribution d'origine qui estime l'écart à partir des seuls diagnostics dans la distribution, noté en laissant de côté un détecteur à la fois et une classe à la fois. Reproductible via <c1/>

# text
seg-c46973920f5b = Statistiques dérivées à la main face à des formes closes (AUC binormale Φ(d'/√{ "2" }), variance de DeLong, Spearman à rangs ex æquo, récupération exacte par MCO) + validation croisée en laissant un de côté face à la référence de base qui prédit la moyenne. Le corpus est SYNTHÉTIQUE (fondé sur des paramètres, jamais de terrain ni IQ) et l'écart d'optimisme est un décalage de gravité synthétique→synthétique, PAS un résultat de simulation vers le terrain

# text
seg-fd6424213d1f = Compromis PNT quantique contre classique et résilience sans GNSS ({ "13503" })

# text
# c1: quantum-trade
seg-21b2b54200a8 = Ingestion d'ADEV mesurée (NNLS), table de compromis (holdover de synchronisation/inertiel + bénéfice), enveloppe résilience-contre-temps ; mise en garde sur le plancher portée par l'artefact. Exécutable depuis la CLI/les liaisons comme type de scénario <c1/> (scenarios/quantum-trade.toml)

# text
seg-37d11937c966 = Le noyau d'ajustement ADEV mesurée→DSP (NNLS) concorde avec scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — un noyau externe indépendant ; mais les CHIFFRES du compromis quantifient (sans jamais valider) une horloge/un CAI partenaire, de sorte que le compromis lui-même reste MODELLED, sans halo de validation

# text
seg-1fa865bfddd1 = Environnement météorologique spatial et densité thermosphérique pilotée par l'activité

# text
# c1: space-weather
seg-47308f611c7e = Indices solaires/géomagnétiques (table Kp↔ap par définition), la température exosphérique de Jacchia-1971, et la densité thermosphérique de Jacchia { "1971" } (SAO Special Report { "332" } : profils de diffusion statiques reproduisant son tableau { "7" }, avec les variations diurne, géomagnétique, semi-annuelle, saisonnière-latitudinale et de l'hélium) face à l'atmosphère statique USSA76. Exécutable depuis la CLI/les liaisons comme type de scénario <c1/> (scenarios/space-weather.toml)

# text
seg-1cad4329e226 = Table Kp↔ap par définition + forme close de la température exosphérique de Jacchia-1971 (concordance à <{ "1" } K face aux ancrages publiés, tests/space_weather_reference.rs) ; la densité est caractérisée face à pymsis NRLMSISE-00 (un modèle NRL indépendant) : l'amplitude du cycle solaire à { "800" } km est de 10.4x face à NRLMSISE-00 13.6x. Révision { "0.30" } : le facteur d'activité du premier ordre calibré a été remplacé par Jacchia { "1971" } (densité du scénario par défaut à { "400" } km { "4.176e-12" } -> { "6.929e-12" } kg/m3 ; reference_exospheric_temperature_k retiré, mean_exospheric_temperature_k ajouté). { "0.30" } tour { "2" }, densités mesurées par accéléromètre TOLEOS CHAMP/GRACE/GRACE-FO (ESA Swarm DISC ; fixé à l'avance 20eed695), un constat (reste MODELLED) : les moyennes d'orbite à { "400" } à { "500" } km sont à moins d'un facteur { "2" } au maximum solaire hors tempêtes (CHAMP { "2001" } 521/521, GRACE-A { "2002" } 120/120, GRACE-FO { "2024" } 526/547), mais Jacchia { "1971" } est environ 1.7x trop dense au minimum solaire de { "2008" } (GRACE-A 412/544 à moins d'un facteur { "2" }), de sorte que la densité n'est pas validée

# text
seg-29bedb28c34f = Interopérabilité CCSDS OEM (import d'éphémérides GMAT/Orekit/STK)

# text
# c1: oem-interop
seg-edb58ffbbb5b = Importeur CCSDS { "502.0" } OEM (parse_oem), tolérant aux lignes COMMENT / mots-clés de métadonnées supplémentaires / blocs de covariance et inverse exact de l'écrivain ; aller-retour + ingestion de fichier externe avec contrôle de cohérence des vitesses. Exécutable depuis la CLI/les liaisons comme type de scénario <c1/> (scenarios/oem-interop.toml)

# text
seg-c76b8c395ef0 = Fenêtre de lancement et géométrie d'ascension (analyse de mission)

# text
# c1: launch-window
seg-6066c634faba = Azimut(s) de lancement à deux corps (sin Az = cos i / cos lat), inclinaison minimale atteignable, vitesse circulaire, bonus vers l'est de la rotation de la Terre, Δv de changement de plan en dogleg et opportunités quotidiennes, et, étant donnés une époque et des lignes IERS finals2000A, la vitesse du site autour du vrai pôle (launch::site_rotation_speed_at). Exécutable depuis la CLI/les liaisons comme type de scénario <c1/> (scenarios/launch-window.toml)

# text
seg-2515ab37f99b = Géométrie de lancement en trigonométrie sphérique en forme close face à des ancrages d'exemples travaillés publiés (Vallado, Fundamentals of Astrodynamics 4e éd., Algorithm { "37" } azimut de lancement + chap. 6 changement de plan ; tests/launch_window_ascent_geometry_reference.rs). Ils réutilisent la même forme close que kshana implémente (une vérification de parité avec une valeur publiée / de transcription, InternalConsistency) ; MODELLED à deux corps, sans modèle de triangle de vitesses de Terre en rotation / d'ascension / de pertes par traînée. Comparaison externe { "0.30" } avec Orekit { "12.2" } (Apache-2.0), un constat (reste MODELLED) : la géométrie concorde à l'arrondi près (inclinaison relue à partir de l'azimut de fin de combustion sur { "158" } cas, pire { "2.6e-15" } rad ; inclinaison minimale, vitesse circulaire et delta-v de dogleg à { "3e-16" }), mais la vitesse de site due à la rotation de la Terre manque le seuil relatif de { "1e-6" } fixé à l'avance à { "62.9" } deg de latitude ({ "1.12e-6" }). L'écart croît comme tan(lat), en accord avec un décalage de pôle par mouvement du pôle d'environ { "5.8e-7" } rad dans le repère terrestre d'Orekit que le ω·R·cos(lat) sphérique omet. L'affirmation n'a pas été restreinte avant l'exécution, de sorte que la ligne ne peut pas être promue sur cette comparaison. { "0.30" } tour { "2" } (fixé à l'avance 71bebf63) : avec une époque et des lignes IERS, la vitesse de site au vrai pôle (champ de scénario site_rotation_speed_true_pole_m_s) concorde avec Orekit à { "1e-6" } près à { "24" } sites sur quatre longitudes (pire { "4.9e-8" }), mais la vitesse nominale sans époque que le scénario émet par défaut comme bonus de rotation de la Terre manque encore de { "1.12e-6" }, de sorte que la ligne reste MODELLED dans l'attente d'une décision sur la sortie par défaut

# text
seg-ff2cd766bb52 = Corridor de rentrée balistique (Allen–Eggers)

# text
# c1: reentry
seg-c3f3422f96e4 = Décélération maximale (indépendante du coefficient balistique), vitesse + altitude au pic de g, et vitesse au pic de chauffage pour une entrée balistique en atmosphère exponentielle. Exécutable depuis la CLI/les liaisons comme type de scénario <c1/> (scenarios/reentry.toml)

# text
seg-121f02d79ae0 = Entrée analytique d'Allen–Eggers en forme close, en outre recoupée avec une intégration numérique scipy { "1.18" } solve_ivp (DOP853) de la MÊME EDO d'entrée à traînée seule (tests/ballistic_re_entry_corridor_reference.rs, { "36" } cas, pire a_max rel { "2.9e-9" }) — une vérification intégrale numérique contre forme analytique propre, donc toujours InternalConsistency, PAS une validation externe. MODELLED balistique (sans portance), sans aérothermie/TPS — la sortie de chauffage est une vitesse, non un flux thermique. Comparaison externe { "0.30" }, un constat (reste MODELLED) : face à la reconstruction de l'entrée de la SRC Stardust (Desai et Qualls, NASA NTRS { "20080008567" }), la décélération maximale d'Allen–Eggers pour l'état d'entrée inertiel imprimé ({ "12.9" } km/s, -8.2 deg, H { "7200" } m) est de { "61.8" } g contre { "32.89" } g pour la meilleure trajectoire estimée, +{ "88" } % face à une tolérance de { "15" } % : la solution à angle de trajectoire constant et sans gravité double à peu près le pic d'une entrée rasante et plus rapide que la vitesse de libération. Stardust ne portait aucun accéléromètre, de sorte que la reconstruction est une estimation de trajectoire. { "0.30" } tour { "2" }, bloqué (reste MODELLED) : une solution de point matériel plane intégrée (reentry::simulate_planar_entry, US76, gravité en carré inverse, courbure) concorde avec les meilleures trajectoires estimées de Stardust et de Genesis à { "15" } % près (+{ "11.3" } %, +{ "5.6" } %), mais ces maxima sont des sorties de simulation d'agence, non des mesures, de sorte qu'il ne s'agit que d'un recoupement. La comparaison avec l'accéléromètre (fixée à l'avance a94a283d) est bloquée faute d'une copie lisible de l'analyse REMM de Hayabusa2 (doi 10.57350/jesa.16)

# text
seg-8c10b50407d3 = Empreinte de charge utile EO et géométrie de couverture

# text
# c1: eo-coverage
seg-45c1e799c87c = Géométrie du triangle spatial de SMAD : rayon angulaire de la Terre, largeur de fauchée, GSD au nadir, accès hors nadir maximal et période circulaire, plus la période nodale J2 du premier ordre (eo_payload::j2_nodal_period) et l'espacement des traces au sol à l'équateur R_e (omega_E - dOmega/dt) T_nodal (eo_payload::ground_track_spacing_equator_j2) avec un indicateur de couverture contiguë, pour une altitude d'orbite, une inclinaison et un FOV/IFOV de capteur. Exécutable depuis la CLI/les liaisons comme type de scénario <c1/> (scenarios/eo-coverage.toml) ; son inclinaison par défaut est l'héliosynchrone issue de eo_payload::sun_synchronous_inclination, une valeur par défaut de commodité qui ne fait pas partie de l'affirmation validée

# text
seg-42411e7c37c9 = Orekit { "12.2" } (Apache-2.0) et GeographicLib { "2.1" } (MIT), tous deux exécutés comme programmes distincts, fixés à l'avance (766823f3) avant la modification du moteur et toute exécution de référence : grandeurs sphériques à { "1e-9" } relatif près (pire : rayon angulaire { "5.4e-16" }, fauchée { "7.0e-13" }, accès { "1.9e-14" }), période { "1e-12" } ({ "1.6e-16" }), GSD au nadir { "1e-7" } ({ "2.9e-10" }), la période nodale J2 et l'espacement des nœuds à { "0.1" } % près d'une propagation J2 numérique d'Orekit avec détecteur de nœud ({ "1.2e-5" } et { "6.7e-5" }), l'indicateur de contiguïté exact (168/168), et face à l'ellipsoïde WGS-84 le limbe à { "0.3" } deg près ({ "0.186" } deg) et la portée maximale au sol à { "0.5" } % près ({ "3.2e-3" }). Retirer le terme de régression nodale fait échouer { "35" } des { "42" } points de nœud. Portée MODELLED : empreinte en Terre sphérique ; ni radiométrie, ni FTM, ni atmosphère, ni gigue, ni éblouissement ; l'inclinaison héliosynchrone par défaut n'est pas comparée. Le recoupement antérieur Skyfield/SGP4 est conservé comme régression. Révision { "0.30" } : l'espacement porte désormais la régression nodale J2 (scénario par défaut { "2756.37" } -> { "2752.17" } km)

# text
seg-940692c550f3 = Cadrage TM/TC du CCSDS Space Packet ({ "133.0" })

# text
# c1: space-packet
seg-bf06c7ffa875 = Encodage/décodage de l'en-tête primaire du CCSDS 133.0-B Space Packet (version/type/en-tête secondaire/APID/indicateurs de séquence/compteur/longueur de données) + un scénario de cadrage. Exécutable depuis la CLI/les liaisons comme type de scénario <c1/> (scenarios/space-packet.toml)

# text
seg-6bec79623cc8 = spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — une implémentation tierce indépendante du CCSDS 133.0-B-2 ; encode_packet/decode_packet de kshana concordent à l'octet près (l'en-tête primaire de 6 octets pour { "33" } cas + le paquet encodé complet pour { "12" })

# text
seg-5510c82f671a = En-tête secondaire, contrôle d'erreur de paquet et segmentation du CCSDS Space Packet

# text
seg-7503bf761df9 = Extensions du CCSDS 133.0-B-2 Space Packet à côté de l'en-tête primaire : un en-tête secondaire portant un code temporel CCSDS 301.0-B (CUC ou CDS, champ P explicite ou implicite) et des données auxiliaires, le champ de contrôle d'erreur de paquet CRC-16, la segmentation d'une grande unité de données utilisateur et son réassemblage, le décodage de flux avec contrôles de trou de séquence et d'ordre, et les paquets PUS-TM. La sortie de l'en-tête primaire est identique à l'octet près à celle d'avant

# text
seg-4123d600477a = Fixé à l'avance (003ef3eb) avant toute comparaison ; quatre implémentations indépendantes, aucune GPL, rien d'intégré au dépôt : ccsdspy { "2.0.1" } (BSD-3-Clause) décode { "34" } paquets écrits par Kshana en { "5" } flux (en-tête primaire, champ P, temps grossier et fin, champs CDS, données auxiliaires, données utilisateur, PEC) et les deux unités segmentées de 1000 octets sont reconstruites à partir de ses données utilisateur avec { "0" } écart, et il signale les flux au paquet perdu et au paquet permuté que Kshana rejette ; le CRC de { "8" } messages et de { "57" } champs PEC égale celui de CPython binascii.crc_hqx et de spacepackets-rs { "0.18.0" } (valeur de contrôle 0x29B1) ; { "66" } cas de codes temporels CUC et CDS égalent l'écriture et la lecture de spacepackets-rs { "0.18.0" } octet pour octet ({ "3" } cas CDS aussi avec spacepackets-py { "0.32.0" }) ; { "4" } paquets PusTm de spacepackets-py { "0.32.0" } sont identiques à l'octet près à ceux de Kshana. Non couvert : codes temporels à époque d'agence ({ "7" } cas reposent sur des tests unitaires), trames de transfert TC et toute couche de liaison sous le paquet

# text
seg-7c61da52b8f8 = Export SPICE SPK (types { "9" } et { "13" })

# text
seg-582ce23522f6 = Écrivain et lecteur de noyaux NAIF SPICE SPK des types { "9" } (Lagrange, pas de temps inégaux) et { "13" } (Hermite, pas de temps inégaux), avec la disposition DAF, les descripteurs de segment et les répertoires d'époques, et l'export d'un OEM CCSDS vers un noyau SPK (époques UTC ou TDB vers temps des éphémérides)

# text
seg-194c37ac787f = CSPICE N0067 via spiceypy { "8.3.0" }, noyau de secondes intercalaires naif0012.tls, fixé à l'avance (5059fd2a) avant que SPICE ne lise un noyau Kshana : l'inventaire par SPICE des quatre noyaux de Kshana est exact ; spkpvn et spkgeo à { "5 516" } époques et { "690" } évaluations de chaîne égalent l'évaluation propre de Kshana bit à bit et restent dans le seuil à chaque nœud (pire { "0.022" } de celui-ci) ; Kshana lit à l'identique bit à bit les noyaux écrits par SPICE ; pour les mêmes entrées, les noyaux de Kshana sont identiques octet pour octet à ceux de SPICE ({ "0" } octet différent dans quatre fichiers) ; les époques OEM sont converties en temps des éphémérides à { "6.0e-8" } s près de str2et (seuil { "1e-6" } s) et SPICE évalue l'export OEM dans le seuil (pire { "0.060" }). Arcs de Kepler synthétiques : rien sur la précision physique. Les autres types de SPK ne sont pas écrits

# text
seg-d699104fc2af = SPICE SPK types { "3" } et { "21" } (Tchebychev, lignes de différences étendues)

# text
seg-7d3e8b5b40af = Écrivain et lecteur de segments NAIF SPICE SPK de type { "3" } (polynômes de Tchebychev pour la position et la vitesse sur des intervalles fixes, degré { "0" } à { "27" }) et de type { "21" } (tableaux de différences modifiées étendues, les lignes de différences des intégrateurs JPL, MAXDIM { "15" } à { "25" }), à partir d'enregistrements donnés, dans des fichiers qui contiennent aussi des segments de types { "9" } et { "13" } ; sélection d'enregistrement et évaluation dans l'ordre des lecteurs SPICE. Kshana n'ajuste pas de coefficients de Tchebychev et ne produit pas de lignes de différences

# text
seg-40323a2adce1 = CSPICE N0067 via spiceypy { "8.3.0" } (spkw03, spkw13 et, de la même bibliothèque par son symbole f2c, spkw21 ; spkpvn, spkgeo), fixé à l'avance (e1cf80d8) avant l'existence du code, les enregistrements synthétiques tirés du SHA-1 de ce commit : pour trois fichiers (type { "3" } degrés { "0" }, { "12" } et { "27" } avec { "3" } à { "150" } enregistrements ; type { "21" } MAXDIM { "15" }, { "20" } et { "25" } avec { "1" } à { "250" } lignes, zéro à deux entrées de répertoire et une chaîne de centres ; types { "3" }, { "21" } et { "13" } dans un même fichier avec commentaires) l'inventaire par SPICE des noyaux de Kshana est exact, les noyaux de Kshana sont identiques octet pour octet à ceux que SPICE écrit à partir des mêmes enregistrements, et spkpvn et spkgeo égalent le lecteur de Kshana bit à bit sur les fichiers de Kshana et sur ceux de SPICE ({ "48 876" } composantes dans chaque sens, seuil { "1e-12" } relatif). Enregistrements synthétiques : rien sur la précision physique ; de vrais noyaux de type { "21" } produits par JPL ne figurent pas dans le jeu de cas

# text
seg-39517faae95c = Messages de données d'attitude CCSDS (AEM, APM)

# text
seg-f88f6ea002c8 = Écrivain et lecteur des messages de données d'attitude CCSDS 504.0-B-2 en KVN et NDM/XML : AEM version { "2.0" } (et { "1.0" } en KVN, avec ses ATTITUDE_DIR, QUATERNION_TYPE et séquences de rotation numériques) avec types d'attitude par quaternion, angles d'Euler et spin et leurs variantes de dérivée, de vitesse angulaire et de nutation, plusieurs segments ; APM version { "2.0" } avec blocs de quaternion, d'Euler, de vitesse angulaire, de spin, d'inertie et de manœuvre ; le quaternion de A vers B d'un enregistrement (504.0-B-2 annexe F)

# text
seg-8853058de1f3 = Analyseurs et écrivains Orekit { "13.1.8" } (Apache-2.0), exécutés comme programme distinct (xval/adm-orekit), fixés à l'avance (7a6a05fe) avant toute comparaison : Orekit analyse chaque message écrit par Kshana ({ "14" } AEM KVN, { "11" } AEM XML, { "4" } APM KVN, { "4" } APM XML) et chaque valeur est dans son seuil (quaternions { "1e-14" }, angles { "1e-9" } deg ; pire { "0.054" } d'un seuil) ; Kshana analyse les { "31" } messages qu'Orekit écrit à partir des mêmes entrées dans chaque seuil ; la rotation de chacun de { "135" } enregistrements de quaternion, d'Euler et de spin égale AemSegment.getAngularCoordinates à { "1e-12" } près (pire { "0.0071" } du seuil). Les { "15" } messages XML de Kshana valident tous face au schéma NDM/XML { "4.0.0" } (conditionné par les données, récupéré avec un SHA-256 épinglé). Constat : l'écrivain APM d'Orekit refuse une manœuvre sans MAN_DELTA_MASS (facultatif dans la norme), de sorte que les manœuvres APM ne sont couvertes que dans le sens où Kshana écrit. Hors du jeu de cas : types */RATE et XML d'AEM { "1.0" }, blocs APM répétés

# text
seg-5f26f879037e = Messages de données d'orbite CCSDS (OPM, OMM, OCM)

# text
seg-eaddfd311fea = Écrivain et lecteur des messages de données d'orbite CCSDS 502.0-B-3 en KVN et NDM/XML : OPM { "3.0" } et { "2.0" } (vecteur d'état, éléments képlériens osculateurs, paramètres du vaisseau spatial, covariance, manœuvres, paramètres définis par l'utilisateur), OMM { "3.0" } et { "2.0" } (éléments moyens par mouvement moyen ou demi-grand axe, paramètres liés aux TLE avec BSTAR ou BTERM et AGOM, covariance), et OCM { "3.0" } avec trajectoire (CARTP, CARTPV, CARTPVA ; époques absolues ou relatives), propriétés physiques, covariance (CARTP, CARTPV en ordre LTM), manœuvre et blocs définis par l'utilisateur ; un OMM en pleine précision à partir d'un jeu d'éléments SGP4 à côté de OmmFile::to_omm_kvn inchangé

# text
seg-d4c7896b5963 = Analyseurs et écrivains Orekit { "13.1.8" } (Apache-2.0) OPM, OMM et OCM, exécutés comme programme distinct (xval/odm-orekit), fixés à l'avance (cc6841da) avant toute comparaison : { "27" } des { "30" } messages écrits par Kshana ({ "6" } cas OPM, { "5" } OMM et { "5" } OCM en KVN, et XML pour la version { "3.0" }) s'analysent dans Orekit avec chaque valeur à { "1e-14" } relatif près et chaque époque à { "1e-9" } s près ({ "904" } valeurs, pire { "0.021" } d'un seuil), et Kshana relit les { "25" } messages qu'Orekit réécrit dans les mêmes seuils ({ "858" } valeurs, pire { "0.020" }) ; les { "14" } messages XML de Kshana valident tous face au schéma NDM/XML { "4.0.0" } (conditionné par les données). Constats, épinglés, restreignant l'affirmation : Orekit exige ELEMENT_SET_NO (facultatif dans 502.0-B-3), refuse COMMENT dans les paramètres XML définis par l'utilisateur (le schéma l'autorise), n'écrit pas BTERM sans BSTAR (de sorte que BTERM et AGOM ne sont couverts que dans le sens où Kshana écrit), et ajoute les époques relatives d'OCM comme secondes SI, de sorte que sous TDB elles diffèrent de la lecture calendaire TDB d'environ { "1.9e-10" } s/s (UTC, TAI et TT concordent). La sortie héritée OmmFile::to_omm_kvn, qui enveloppe les métadonnées OMM dans META_START/META_STOP, est refusée par Orekit (consigné). Hors périmètre : blocs OCM PERT et OD, jeux d'éléments non cartésiens, autres ordres de covariance

# text
seg-1e5ea1d9918d = Budget d'erreur d'attitude à 3 DDL et de pointage (AOCS)

# text
# c1: attitude-budget
seg-21f2f8efcf19 = Couple perturbateur de gradient de gravité au pire cas ((3/2)(μ/R³)ΔI) comme pic sur l'attitude (l'affirmation validée), plus un budget d'erreur de pointage en somme quadratique (RSS) sur des contributeurs 1σ nommés avec le terme dominant (une somme en quadrature de nombres fournis par l'appelant, hors de l'affirmation validée). Exécutable depuis la CLI/les liaisons comme type de scénario <c1/> (scenarios/attitude-budget.toml)

# text
seg-296ed0074521 = Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), une implémentation C++ indépendante du couple de gradient de gravité à tenseur complet : le pic (3/2)(μ/R³)ΔI de Kshana égale le couple de Basilisk à l'attitude de { "45" } deg à { "1e-12" } relatif près (pire { "2.1e-15" }) sur { "5" } altitudes et { "8" } tenseurs d'inertie, et borne le couple de Basilisk sur { "2000" } attitudes aléatoires par cas ; tolérance fixée avant la comparaison. Affirmation validée : le pic de couple de gradient de gravité. Le budget de pointage RSS est une somme en quadrature de nombres fournis par l'appelant sans vérité externe et reste en dehors de celle-ci ; la maximisation à tenseur complet de Hipparchus codée à la main subsiste comme autocohérence de soutien. Aucune simulation de boucle de contrôle/6 DDL/modes flexibles

# text
seg-1461aa14a7ff = Prédiction de passages sur station sol (segment sol)

# text
# c1: passes
seg-e1cf1ec4f005 = Passages de visibilité dans le domaine temporel (AOS/TCA/LOS, élévation maximale, durée) d'un propagateur du moteur au-dessus d'une station au-dessus d'un masque d'élévation, avec franchissements de lever/coucher interpolés et accès total : passes::predict_passes, l'ordonnanceur géométrique (sans réfraction ni temps de lumière). Le type de scénario <c1/> exécute le prédicteur apparent de la ligne 'Prédiction apparente de passages sur station sol avec réfraction et temps de lumière'

# text
seg-b351cd4245dd = Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — une bibliothèque de dynamique de vol indépendante : ElevationDetector (chercheur de racine de Brent) + EventsLogger sur une éphéméride ITRF, station comme TopocentricFrame WGS-84. AOS/LOS/élévation maximale/nombre de passages/accès total concordants sur une orbite+station+masque+fenêtre identiques (jeu de test archivé ; pilote xval/orekit-passes)

# text
seg-1dd8b2655b18 = Prédiction apparente de passages sur station sol avec réfraction et temps de lumière

# text
# c1: passes
seg-46f93d3c24d2 = Passages de visibilité (AOS, TCA, LOS, élévation apparente maximale, durée) d'un jeu d'éléments SGP4 au-dessus d'une station WGS-84 sur le chemin d'orbite terrestre validé (IAU 2006/2000A, paramètres d'orientation de la Terre facultatifs), avec la réfraction troposphérique UIT-R P.834-9 (équations { "9" } à { "14" }, les coefficients imprimés de la Recommandation) et le temps de lumière de la liaison descendante, chacun activable ; franchissements résolus par bissection à { "1e-7" } s et culmination par recherche par section dorée. Exécutable depuis la CLI/les liaisons comme type de scénario <c1/> (scenarios/passes.toml), les deux corrections activées par défaut

# text
seg-19d166cb653f = Orekit { "13.1.8" } (CS GROUP, Apache-2.0) avec Hipparchus { "4.0.3" } : TLEPropagator sur les mêmes jeux d'éléments dans un TEME qu'Orekit construit selon la définition énoncée (son TOD IERS { "2010" } tourné de GAST - GMST), ElevationDetector et ElevationExtremumDetector avec et sans ITURP834AtmosphericRefraction, et AngularAzEl avec AngularRadioRefractionModifier pour le cas du temps de lumière, franchissements et maximum résolus par Hipparchus ; { "60" } cas (quatre orbites, cinq stations au niveau de la mer, masques { "0" }, { "5" } et { "10" } deg, { "24" } heures). Seuils fixés avant l'exécution (fixés à l'avance e947e69d, volet { "3" } de 72ea9eb0). Le temps de lumière ignoré ({ "9777" } échecs) ou la constante P.834 { "1.728" } changée en { "1.828" } ({ "7883" } échecs) fait passer le test au rouge. Portée : stations au niveau de la mer ; le coefficient h*theta0^{ "2" } de P.834 d'Orekit vaut { "0.011380" } là où la Recommandation imprime { "0.01380" } (épinglé), de sorte que les altitudes au-dessus du niveau de la mer ne sont pas comparées. Tour { "1" }, face au TEME IERS { "1996" } par défaut d'Orekit, tous les seuils de passage tenus mais seuil de direction manqué du fait de l'écart de convention TEME de { "72" } mas (épinglé)

# text
seg-7b4a8e25c3c9 = Codage et modulation adaptatifs DVB-S2 le long d'un passage de liaison descendante LEO

# text
# c1: acm-link
seg-3912fb8ccb15 = Es/N0 de liaison descendante le long de chaque passage d'un satellite au-dessus d'une station (EIRP, perte en espace libre, perte atmosphérique en loi de cosécante, autres pertes, G/T, constante de Boltzmann, débit de symboles), le MODCOD DVB-S2 le plus efficace qui franchit son seuil de quasi-absence d'erreur du tableau { "13" } de ETSI EN { "302" } 307-1 V1.4.1 plus une marge d'implémentation à chaque pas, le volume de données ACM du passage, et la référence de base à codage constant qui se ferme au masque et à la plus longue distance. Exécutable comme type de scénario <c1/>. Entrées illustratives ; MODELLED.

# text
seg-a7f26e3a6030 = Cohérence interne : l'efficacité spectrale calculée en forme close à partir de K_bch du tableau 5a et des longueurs de trame concorde avec les efficacités qu'imprime le tableau { "13" } (une vérification de transcription de la table de seuils) ; les éléments du bilan de liaison concordent avec leurs formes closes ; la sélection est monotone en Es/N0 et respecte la marge ; l'ACM déplace au moins le volume du codage constant. La géométrie de passage provient du prédicteur apparent de passages séparément VALIDATED. CE QUI NE L'EST PAS : aucun outil externe ni liaison mesurée n'a été comparé ; les seuils sont les valeurs AWGN idéales de la norme, non celles d'un modem ; l'évanouissement dû à la pluie, la perte de pointage le long du passage et les pilotes ne sont pas modélisés.

# text
seg-19603a7e0fe8 = Ordonnancement de contacts sol multi-satellites et multi-stations avec résolution des conflits

# text
# c1: contact-schedule
seg-40edeae6e48b = Contacts candidats issus de chaque passage satellite-station avec son volume de données ACM ; conflits où une antenne servirait deux satellites dans son temps de retournement ou un satellite descendrait vers deux stations à la fois ; un objectif de livraison pondéré par priorité plafonné à l'arriéré de chaque satellite ; un plan glouton à valeur marginale paresseuse, une référence de base premier arrivé et un séparation-et-évaluation exact sur jusqu'à { "26" } candidats, avec l'écart d'optimalité du glouton rapporté. Exécutable comme type de scénario <c1/>. Entrées illustratives ; MODELLED.

# text
seg-bc520db98f9a = Cohérence interne : le séparation-et-évaluation exact concorde avec l'énumération exhaustive sur de petits ensembles aléatoires, chaque plan est vérifié réalisable face aux règles de conflit, et le glouton ne bat jamais l'optimum exact. CE QUI NE L'EST PAS : aucun ordonnanceur externe ni plan opérationnel n'a été comparé ; les contacts sont pris entiers (sans découpage), l'arriéré est fixé au début de la fenêtre, le temps de pivotement au-delà du temps de retournement fixe et le stockage embarqué ne sont pas modélisés.

# text
seg-ddf2bc2f13a9 = Bilan de liaison unidirectionnel (communications / conception de liaison)

# text
# c1: link-budget
seg-83331f513dba = Perte de propagation en espace libre, C/N₀, Eb/N₀, marge et fermeture selon l'équation de liaison CCSDS { "401" } / DSN 810-005 pour EIRP/G·T/distance/débit/bande face à un Eb/N₀ requis. Exécutable depuis la CLI/les liaisons comme type de scénario <c1/> (scenarios/link-budget.toml)

# text
seg-195bf7e31f24 = Table publiée de contrôle de conception de télécommunications en espace lointain comme vecteurs numériques épinglés : DESCANSO / J. H. Yuen (éd.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, tableau 1-1 (Galileo bande X) — kshana réassemble les lignes de la table et reproduit son L_fs de bout en bout publié { "290.54" } dB et son Pr/N0 { "54.6" } dB-Hz ; la perte en espace libre est aussi vérifiée face à UIT-R P.525

# text
seg-3742d2aea62a = Cadrage frugal coût par couverture / ROI

# text
seg-4228311689f8 = Coût par pour cent de couverture + ROI de couverture par euro sur le moteur de dimensionnement de constellation ; le coût par satellite est un encadrement bas/nominal/haut fourni par l'appelant (aucun prix fabriqué)

# text
seg-d542ac64c31c = Arithmétique de coût en forme close face à des valeurs dérivées à la main ; un CADRAGE économique d'un chiffre de couverture modélisé, non un devis ni un modèle de coût validé

# text
seg-8ba6ee9acc8a = Impact sur l'intégrité d'une détection manquée (HPL/VPL selon le contexte face à la limite d'alerte)

# text
seg-f5985399d0d5 = Fait correspondre un biais de leurrage/brouillage non détecté à une erreur effective → région de Stanford (disponible/indisponible/MI/HMI) face à des HAL/VAL propres au contexte (ciel dégagé contre urbain)

# text
seg-124d0ffe959e = Compose la classification de Stanford RAIM validée de façon externe (raim::classify_stanford) ; la correspondance détection manquée→AL elle-même est modélisée, et non une allocation d'intégrité certifiée

# text
seg-37d43b5b918a = Fiche de paramètres de modèle d'erreur citée du CAI ({ "13503" })

# text
seg-0b6a901f5ad2 = Performance d'interféromètre à atomes froids encadrée (meilleure/nominale/prudente) — instabilité de biais, marche aléatoire de vitesse/angle, stabilité du facteur d'échelle, cadence d'échantillonnage limitée par l'interrogation, plage dynamique d'ambiguïté de frange — chacune traçable par citation ; alimente QuantumNavBudget sans modéliser le matériel

# text
seg-4b66096727b8 = Cohérence interne : l'encadrement de VRW cité recoupé avec la physique de CaiAccelerometer::accel_asd + plage dynamique brute calculée à partir de la limite d'ambiguïté de frange ; les nombres sont des encadrements MODELLED issus d'une revue de littérature (needs_source_confirmation), aucun appareil validé, aucun halo de validation

# text
seg-c93f2d3a3167 = Banc d'essai de respect de la norme d'intégrité de synchronisation — classifieur d'époques du diagramme d'intégrité de Stanford

# text
seg-712d5c35a6a6 = Classification d'époques du diagramme d'intégrité de Stanford TIB (nominal / indisponible / MI / HMI)

# text
seg-93b913e60063 = Réimplémentation numpy indépendante de la règle à quatre régions (scripts/gen_tib_scorer_reference.py) sur le même jeu d'échantillons ; méthode Cited à partir du diagramme d'intégrité Stanford–ESA (Tossaint et al., ION GNSS { "2007" }) et du MOPS WAAS RTCA DO-229. PAS une référence de précision ExternalDataset — le banc d'essai est immunisé contre l'honnêteté.

# text
seg-573aa0193cb3 = Banc d'essai de respect de la norme d'intégrité de synchronisation — évaluateur de couverture d'intégrité

# text
seg-4d86f3c2d8f5 = Évaluation de couverture d'intégrité TIB (taux HMI/MI/disponibilité + verdict de couverture de surbornage)

# text
seg-645eb084ae8e = Recomptage de régions numpy indépendant dans tests/fixtures/tib/reference.json ; recoupement de la mécanique de l'évaluateur seulement, aucune affirmation de précision.

# text
seg-372dd0fdb025 = Banc d'essai de respect de la norme d'intégrité de synchronisation — catalogue de défauts (générateurs paramétriques)

# text
seg-2604e7cf27d2 = Menu de défauts TIB (divergence de domaine, claquage d'horloge, marche en holdover, retard statique/incrémental/symétrique/asymétrique, rejeu dans la fraîcheur, sélectif par chemin, quorum k parmi N)

# text
seg-b907aecaccd0 = Générateurs de défauts paramétriques représentatifs (Modelled) ; l'ensemble indétectable (retard symétrique, rejeu dans la fraîcheur) est Cited à partir de Mizrahi RFC { "7384" } et Narula & Humphreys (IEEE JSTSP { "2018" }). Aucune référence externe — un catalogue de défauts n'énonce aucune affirmation mesurée.

# text
seg-90c0eb1e7c14 = Banc d'essai de respect de la norme d'intégrité de synchronisation — verdict d'absorption de l'indétectable

# text
seg-f713acf042ff = Verdict d'absorption de l'indétectable TIB (symétrique/rejeu doivent être absorbés par le PL, jamais rapportés comme détectés)

# text
seg-6840c2467c63 = Contrôle de propriété établissant que l'énumération Verdict ne peut structurellement pas rapporter un défaut indétectable comme détecté (Mizrahi RFC { "7384" }) ; absorbé ⟺ PL ≥ décalage. Aucune référence de précision.

# text
seg-3652a591eefc = Ingénierie de plateforme de vaisseau spatial (AOCS/thermique/structures/propulsion/énergie)

# text
seg-50a9c1c7dff0 = Non fourni — Kshana est un simulateur de performance de navigation, et non un maître d'œuvre de plateforme

# text
seg-a349aa76b0ed = PARTNER

# text
seg-b28dd62dca1c = Conception matérielle de la charge utile RF de navigation et des antennes

# text
seg-76c983a23e7b = Non fourni — Kshana modélise la performance du signal, et non le matériel de charge utile/d'antenne

# text
seg-7bba3b35214c = Conception et maturation du matériel de charge utile quantique

# text
seg-15fcc200b859 = Non fourni — modèles de performance seulement ; le matériel à atomes froids/horloge relève d'un partenaire

# text
seg-d69dd4c5167b = Assurance produit du matériel de vol (radiation/EEE/MAIT)

# text
seg-b1540f78ffd4 = Non fourni — Kshana ne traite que l'assurance produit logicielle ; l'assurance produit de vol relève d'un partenaire

# text
seg-1f200f8efc71 = Temps coordonné lunaire

# text
seg-2e6961dbffe9 = Taux d'horloge relativiste Terre-Lune (LTC/TCL) + chaînage TT/TAI/UTC + ensemble

# text
seg-3f52d6e04361 = Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST ; base du LTC IAU/IAG LunaNet) : autopotentiel de la surface lunaire L_m = { "3.13881e-11" } et total séculaire { "56.02" } µs/jour concordant comme valeurs numériques publiées ; vitesse géocentrique de la Lune recoupée avec JPL DE440 (de440s.bsp via SPICE)

# text
seg-8adbbd2cdb74 = Auto-description du rapport hybride optique/RF

# text
seg-2a5e48b558e1 = Le rapport hybrid-optical-rf énonce la configuration de liaison avec laquelle il s'est réellement exécuté (longueur d'onde de la porteuse, ouverture d'émission et de réception, distance, largeur d'impulsion, temps d'intégration, rendements et pertes, valeurs par défaut résolues) et porte un bloc d'unités donnant l'unité et la classe de provenance de chaque grandeur qu'un article est susceptible de citer, y compris les traces de covariance de transfert en mètres carrés

# text
# c1: variance
seg-23f0c10237f4 = Aucune référence externe, et aucune n'est possible : il s'agit d'auto-description, non d'une mesure. Elle est consignée parce que son absence était un défaut -- P5 a dû citer la longueur d'onde de la porteuse et l'ouverture d'émission à partir des valeurs par défaut du source, et déduire qu'un <c1/> nu était en mètres carrés à partir d'une vérification de cohérence interne. La déduction était correcte, ce qui est précisément la raison pour laquelle cela importait : rien n'aurait détecté qu'elle était fausse

# text
seg-0691f3dee8cb = Disponibilité de la liaison hybride optique/RF côté RF

# text
seg-72ccb655caf0 = Le rapport hybrid-optical-rf énonce une disponibilité de liaison RF, composée à partir de grandeurs que le moteur calcule déjà plutôt qu'à partir d'une climatologie importée, et énonce la composition comme une règle nommée : A_rf = I_closure * I_track, où I_closure est le verdict de fermeture du bilan de liaison unidirectionnel CCSDS-401 / DSN-810-005 (linkbudget::link_budget, marge Eb/N0 >= { "0" }) à la distance propre du scénario et I_track est le verdict de la boucle de poursuite (jamming::lock_status) sur le C/N0 que CE MÊME bilan a rendu. Chaque facteur transporte la classe de provenance de son entrée jusqu'à la sortie, et les facteurs volontairement ABSENTS du produit -- visibilité géométrique, déni par interférence et climatologie des pannes RF -- sont nommés avec la raison plutôt que fixés silencieusement à { "1" }. Le segment RF résolu est repris comme son propre bloc rf_link_configuration, et les chiffres continus à côté de l'indicateur (marge de liaison, marge de C/N0, les distances de fermeture et de poursuite en forme close, et l'utilisation de la distance) sont les inversions en distance du même bilan. Le rapport énonce en toutes lettres, sur le bloc et dans l'entrée d'unités où tombe le lecteur, que ce chiffre est LIMITÉ PAR LA MARGE ET LA GÉOMÉTRIE et DÉTERMINISTE alors que la disponibilité optique est LIMITÉE PAR LA MÉTÉO ET LA CLIMATOLOGIE et probabiliste, de sorte que les deux ne peuvent jamais être cités comme un couple de pourcentages comparables

# text
seg-319705ea0166 = Aucune référence externe, et ExternalDataset est écarté. Les deux entrées sont une marge d'Eb/N0 et un franchissement de seuil de C/N0, toutes deux fonctions d'une allocation MODELLED d'EIRP, de facteur de mérite et de pertes globales ; il n'existe aucun enregistrement mesuré de disponibilité pour un service hybride optique/RF Terre-Lune face auquel vérifier le chiffre composé. Les vérifications qui existent sont internes et sont présentées comme telles : la composition est recalculée à partir des marges publiées du rapport lui-même plutôt qu'à partir des éléments internes de l'émetteur, et la distance de fermeture est vérifiée en relançant l'équation de liaison À cette distance et en exigeant que la marge s'annule -- un aller-retour d'inversion, non une implémentation indépendante. La limite honnête du chiffre est consignée sur le rapport lui-même : c'est un indicateur déterministe 0/1, non une probabilité, parce que rien dans ce moteur ne mesure une distribution de pannes de liaison RF à cette bande et cette géométrie. Cette entrée manquante est nommée dans rf_availability.factors_not_included plutôt qu'inventée, et la fournir est ce qu'exigerait une disponibilité RF probabiliste

# text
seg-22c5df9b6c7c = Comparaison de télémétrie optique contre RF à conditions égales

# text
seg-70eb396f40af = Le rapport hybrid-optical-rf émet le rapport de télémétrie optique contre RF avec la configuration UNIQUE à laquelle les deux segments ont été évalués portée dans le même objet : le même trajet unidirectionnel, la même distance et le même temps d'accumulation. Le segment optique est la CRLB de ToA limitée par les photons du moteur sur le nombre de photons unidirectionnel ; le segment RF est la gigue thermique de suivi de code early-late de la DLL du moteur au C/N0 que le bilan de liaison propre du moteur rend pour cette même distance unidirectionnelle. La bande passante de bruit de boucle est dérivée, non choisie : B_L = 1/({ "2" }*integration_s) place le segment RF exactement au temps d'accumulation optique, et si un appelant la remplace de sorte que les deux temps de moyennage divergent, le rapport est REFUSED -- nul, avec l'écart et les deux temps nommés -- plutôt que cité à deux points de fonctionnement. Aucun rapport n'est formé avec le rf_position_sigma_m paramétrique CHOISI du scénario, et le refus dit pourquoi : cette entrée ne porte aucune configuration. Le chiffre phare optique bidirectionnel publié et le facteur exact qui le relie au segment de comparaison unidirectionnel sont émis à côté du rapport, de sorte que le rapport ne peut pas être lu comme portant deux sigmas optiques en désaccord

# text
seg-acbb3ac98ee3 = Aucune référence externe pour le RAPPORT, et ExternalDataset est écarté délibérément. La chaîne RF sous-jacente en a une -- tests/validate_p5_rf_ranging_precision.rs vérifie linkbudget::link_budget et navsignal::dll_code_jitter_chips face à un jeu de test Python/NumPy indépendant et face à la valeur travaillée codée en dur de Kaplan & Hegarty ({ "2.814e-3" } chip / { "0.825" } m à { "45" } dB-Hz) -- et la CRLB optique a sa propre ligne en forme close. Revendiquer l'un ou l'autre de ces ancrages pour cette ligne serait une validation empruntée, ce que les invariants de la matrice existent pour empêcher : la grandeur ici est un RAPPORT à une configuration avec un EIRP, un facteur de mérite, une puissance d'émission et une ouverture MODELLED, et il n'existe aucune comparaison mesurée de télémétrie optique contre RF à un point de fonctionnement commun face à laquelle le vérifier. Ce qui est vérifié en interne est ce sur quoi le rapport peut réellement se tromper : que les deux segments se trouvent à un seul point de fonctionnement. Cela est mesuré en mettant à l'échelle le temps d'accumulation commun et en exigeant que les deux segments évoluent selon la même loi en racine carrée et que le rapport reste en place, et c'est imposé en refusant purement et simplement le rapport lorsque les temps de moyennage divergent. Les deux segments sont des bornes de bruit thermique/de grenaille et excluent tous deux le retard du milieu, l'erreur d'horloge et l'ambiguïté, de sorte que l'exclusion est identique de chaque côté ; le rapport le dit plutôt que de le laisser déduire

# text
seg-3f26f598e013 = Auto-description du rapport de bilan de liaison

# text
seg-b88bf41d6d4c = Le rapport de bilan de liaison énonce chaque constante absolue à partir de laquelle sa propre marge a été calculée -- la fréquence porteuse utilisée par la perte en espace libre, l'EIRP, le facteur de mérite, les pertes globales et le terme de Boltzmann -- plus le G/T requis auquel la marge est nulle, la constante de liaison (EIRP - pertes - Eb/N0 requis) qui est la seule combinaison qu'une table publiée de débit/gain puisse jamais fixer, et, lorsqu'un appelant indique une température de bruit du système, le gain d'antenne de réception que ce facteur de mérite implique

# text
seg-52f98f50522f = Aucune référence externe : il s'agit d'auto-description sur une équation déjà validée face à une table publiée de contrôle de conception (voir la ligne du bilan de liaison unidirectionnel). Elle est consignée parce que son absence était un défaut mesuré -- reproduire le d1_rate_gain_beamwidth.csv publié exigeait de résoudre à rebours une constante effective à { "0.0034" } dB à partir des trente lignes, et le moteur à présent nomme cette combinaison et prouve, par test, qu'aucune table publiée n'aurait jamais pu séparer ses trois composantes

# text
seg-a7b192e27cb5 = Table de croisement du temps lunaire par classe d'horloge

# text
seg-cab605dc6ea2 = Une exécution de budget de temps lunaire émet une ligne de croisement horloge-contre-repère par classe d'horloge face à un unique terme de repère partagé, de sorte que l'horloge est la seule variable de la comparaison ; chaque ligne porte le croisement atteint de deux façons -- par bissection à partir de la courbe générale d'erreur temporelle en loi de puissance et par inversion algébrique à partir du type de bruit dominant de la ligne -- avec la différence relative entre eux

# text
seg-ccec15f0b125 = Deux calculs différents dans la base de code de la même grandeur, et non un seul reformulé : la bissection sur la courbe en loi de puissance IEEE-1139 ne connaît rien du type de bruit, alors que la forme close inverse algébriquement le type dominant, de sorte qu'un type de bruit mal classé ou un mauvais encadrement apparaît comme une différence relative non négligeable. Les quatre valeurs reproduisent aussi la table publiée de l'article à la moitié de son dernier chiffre imprimé -- mais cette table avait elle-même été reconstruite à partir de la même forme close, de sorte que c'est une vérification de reproductibilité et non une référence externe, et le terme de repère face auquel elle est mesurée est une allocation modélisée

# text
seg-ff32b78acb8c = Erreur conjointe d'UT1 et de mouvement du pôle sur un ensemble de lignes commun

# text
seg-561e588153af = Une table rapporte l'erreur de prédiction d'UT1, l'erreur de pôle du mouvement du pôle et leur combinaison en quadrature à la Lune sur un ensemble d'époques IDENTIQUE par horizon, en émettant les époques auxquelles chaque composante a été mesurée. Séparément, le scénario nomme l'entrée EOP en vigueur et décompose son recensement de lignes, et émet toujours la table prédit-contre-final par horizon avec une indication explicite de la raison pour laquelle elle est vide lorsqu'elle l'est

# text
seg-093191c1ddce = astropy { "8.0.1" } utils.iers (BSD-3) lisant le produit IERS finals2000A avec sa propre règle Bulletin-B-sinon-A, et pyerfa { "2.0.1.5" } (SOFA) rotations complètes céleste-vers-terrestre (c2i06a, sp00, pom00, c2tcio ; l'angle de rotation terrestre selon IERS { "2010" } éq. { "5.15" } en arithmétique exacte), exécutés comme programmes distincts sur des lignes textuelles du finals2000A.all figé du 2026-09-30 ; fixé à l'avance (455b8fb5) avec les amendements A1 et A2 ne fixant que la précision numérique de la référence (tous deux divulgués avec les exécutions qu'ils ont suivies) : chaque liste d'époques du tableau { "3" } égale, statistiques d'UT1 et de pôle à { "6e-16" } près, la combinaison à { "1.9e-7" } près, 12/12 cas prédit-contre-final. La vérification de la combinaison ne peut pas résoudre des erreurs du terme de pôle inférieures à environ { "1e-4" } relatif parce qu'UT1 la domine ; la précision du pôle repose sur la vérification de statistique de pôle à { "1e-9" }. Les règles d'ensemble d'époques et de repli sont le générateur reflétant les définitions de Kshana, et les statuts de table vide sont un comportement de conception sans vérité externe. Magnitudes : tableau 3a du Rapport annuel IERS { "2019" } erreurs de prédiction réalisées, Kshana/IERS { "1.001" } à { "1.100" } à { "1" } à { "90" } jours (seuil [{ "0.8" }, { "1.25" }], Measured). Recensement de lignes : astropy (ligne d'entrée hors ligne). Tour { "1" } (conservé comme régression) : face à la formule de précision imprimée dans { "178" } bulletins A, le pôle concorde à 1.5x près et UT1 non, ce qui teste la formule de l'IERS face à son erreur réalisée

# text
seg-3692f1fc89e6 = L'entrée d'orientation de la Terre par défaut hors ligne est un vrai produit IERS

# text
# c1: realtime-frame-eop
seg-f9a9d385fd26 = La valeur par défaut d'exécution <c1/> est la copie embarquée propre à la bibliothèque d'un extrait textuel IERS finals2000A (tools/finals2000A_20260930.txt : { "174" } lignes quotidiennes consécutives, MJD 61224-61397, découpées dans le finals2000A.all du 2026-09-30) portant les trois millésimes de lignes que définit le format, classés par les drapeaux I/P de l'IERS (eop::row_vintage) : { "30" } finals du Bulletin B, { "54" } lignes mesurées rapides (drapeau I sans bloc Bulletin B) et { "90" } prédictions du Bulletin A (drapeau P). Une exécution nue sans argument de fichier et sans réseau émet une table par horizon renseignée, le recensement rows = final_rows + rapid_rows + prediction_rows ({ "174" } = { "30" } + { "54" } + { "90" }) et predicted_rows.n = { "90" } sur MJD 61308-61397 ; la coupure telle que publiée des comparaisons prédit-contre-final est la dernière ligne mesurée. L'extrait antérieur de 32 lignes (tools/finals2000A_2026.txt, chaque ligne au drapeau I) et l'extrait de cinq lignes à finals seuls restent livrés et exercés : sur eux predicted_rows.n vaut { "0" }, propriété du fichier d'entrée et non résultat de l'analyseur

# text
seg-1683dc91fd68 = astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), lisant les mêmes octets avec son propre lecteur, et la table du Bulletin A de l'IERS Vol. XXXIX No. { "039" }, copiée nombre pour nombre ; fixé à l'avance (6fdae01b) avec six critères exacts avant l'exécution d'astropy. Les six tiennent : { "30" } lignes finales, { "54" } rapides et { "90" } prédites avec des listes de MJD égales, chaque ligne prédite au drapeau P, le recensement de l'exécution par défaut égal, et les prédictions égales au Bulletin A au dernier chiffre imprimé près. Divulgué : la découpe a été choisie avec une simple tranche de colonnes des drapeaux et du bloc Bulletin B, qui montrait 30/54/90, avant le commit ; l'extrait est une tranche textuelle que ce dépôt a découpée dans un produit IERS (SHA-256 dans le NOTICE du jeu de test). L'affirmation validée est la classification par millésime et le recensement de l'entrée par défaut livrée et de ses lignes prédites ; les entrées utilisateur arbitraires sont classées par la même règle de drapeau mais ne font pas partie de la comparaison. { "0.30" } tour { "1" } (remplacé) : la valeur par défaut antérieure appelait { "12" } lignes au drapeau I des prédictions du Bulletin A ; le moteur classe désormais par drapeau. RÉVISIONS : les cellules de l'exécution par défaut qui ont bougé sont listées ancien-vers-nouveau dans docs/revisions/M035-default-eop-recut-cell-changes.md (predicted_rows { "12" } -> { "90" }, le plancher de pôle { "0.06776" } -> { "0.05550" } mas, le terme d'orientation de la Terre { "14.01601" } -> { "14.01583" } m, le total { "20.09759" } -> { "20.09746" } m et { "67.03834" } -> { "67.03790" } ns, les lignes du tableau { "2" } de tests/golden/realtime-frame-eop.csv, et les chiffres de concordance du prédicteur opérationnel) ; les plus anciennes dans docs/revisions/G12-default-eop-cell-changes.md

# text
seg-18c72a7565d6 = Empreinte de capture en fonction de l'altitude et de la largeur de faisceau

# text
seg-9c30a0ab5233 = Balayage à deux axes de l'empreinte de capture de surface pondérée par le diagramme et limitée par l'altitude sur l'altitude de l'émetteur et le diamètre de la parabole, émis une ligne par point de fonctionnement avec la largeur de faisceau à mi-puissance qu'implique chaque diamètre, et la capture au limbe rapportée comme un SEUIL -- par ligne le J/S au limbe, sa marge et la puissance d'émission qui le fermerait ; par grille les franchissements localisés, ou une indication explicite que le limbe n'est atteint nulle part sur la grille, avec le déficit

# text
seg-4d866b62d4f7 = Inclusion d'ensembles : le rapport brouilleur-sur-signal entre comme un décalage uniforme en décibels, de sorte que l'ensemble capturé à une puissance d'émission plus élevée contient l'ensemble à une puissance plus basse et que la fraction ne peut que croître -- une propriété que le diagramme d'Airy NE donne PAS en largeur de faisceau ni en altitude, où la région capturée se brise en anneaux et où la fraction est véritablement non monotone. Aucune table publiée ne donne la fraction de disque capturée d'un émetteur orbital lunaire en fonction de l'altitude et de la largeur de faisceau, de sorte qu'il n'y a rien d'externe face à quoi vérifier ces cellules ; le diagramme sous-jacent est séparément validé face à des valeurs de Bessel publiées et garde sa propre ligne

# text
seg-fc0a64b9a280 = Reproductibilité du budget d'erreur de temps lunaire

# text
seg-5d5970506b9c = Le scénario de budget de temps lunaire publie ses sorties de type tableau sous forme de table longue (indice de grille, temps de moyennage, terme) à côté du rapport, de sorte que les sept courbes x(tau) par terme et le total en racine de la somme des carrés sont une sortie du moteur plutôt que quelque chose qu'un lecteur reconstruit à partir de la section de méthode

# text
seg-62df6258bc62 = Autocohérence seulement : le total publié est vérifié face à la racine de la somme des carrés des termes du même fichier, et la courbe émise reproduit le p3_time_budget_curve.csv publié sur les { "57" } points. Les deux vérifications partagent les définitions de termes propres à ce moteur, de sorte qu'aucune n'est indépendante. Le terme d'horloge repose sur des spécifications d'horloge publiées, mais les MAGNITUDES des planchers de liaison, de repère, relativiste et d'éphéméride sont des allocations de budget documentées sans référence externe

# text
seg-675887733454 = Laboratoire de temps de station lunaire : holdover du miniRAFS face au LTC

# text
seg-af3ff120b707 = VLBI géodésique lunaire

# text
seg-cfd7d0126028 = Retard VLBI en champ proche pour une base terrestre observant une balise lunaire + dérivées partielles

# text
seg-d1943f9932af = delta_dor en onde plane (au sein de la même base de code) à la limite du champ lointain ; dérivées partielles par différences finies. Comparaison externe { "0.30" }, un constat (reste MODELLED) : face aux temps de lumière convergés d'ANISE { "0.10" } via DE440 ({ "75" } retards au 2024-01-01 sur trois bases DSN, générés par xval/anise-lunar-od sans code Kshana), aucun retard n'est dans la tolérance de { "1" } ps. Le plus grand écart est de { "24" } µs, dû au centre analytique de la Lune (à environ { "200" } km de DE440), à la géométrie instantanée unique sans itération de temps de lumière ({ "3.6" } µs) et au mouvement du pôle négligé ; les dérivées partielles de balise diffèrent jusqu'à { "2.9e-3" } relatif contre { "1e-6" }. L'affirmation de la documentation du module selon laquelle les approximations de repère sont inférieures à la fidélité du modèle ne tient pas à ce niveau. { "0.30" } tour { "2" } : le chemin par noyau (lunar_vlbi::KernelGeometry) est validé face aux temps de lumière de NAIF SPICE dans sa propre ligne, VLBI géodésique lunaire, chemin par noyau ; la comparaison ANISE de ce chemin (75/75 à { "1" } ps près, pire { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) n'est qu'un recoupement d'évaluation de noyau, parce que la résolution du temps de lumière dans ce banc est propre à ce projet. Cette ligne (le chemin analytique par défaut) reste MODELLED avec le constat ci-dessus

# text
seg-d12d4565b01d = VLBI géodésique lunaire, chemin par noyau

# text
# c1: lunar-vlbi
seg-11e1c942e41c = Retard VLBI en champ proche pour une base terrestre observant une balise lunaire, avec dérivées partielles de balise et de station, sur le chemin par noyau (lunar_vlbi::KernelGeometry) : Terre et Lune DE440, axes principaux lunaires DE440, orientation de la Terre ITRF93 avec UT1 et mouvement du pôle, chaque temps de lumière convergé dans le repère barycentrique, dérivées partielles avec le facteur de temps de lumière 1/(c - u.V). Exécutable comme scénario <c1/> avec planetary_kernel_path, earth_orientation_kernel_path et moon_orientation_kernel_path définis ; les sorties validées sont la série geometric_delay_s du chemin par noyau et epoch_partials. Sur le chemin par noyau, delay_s ajoute le terme de Shapiro différencié analytique, qui n'est pas comparé, et delay_rate et near_field_correction_us ne sont pas comparés

# text
seg-c7f6842b6019 = NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) temps de lumière newtoniens convergés (spkcpt/spkcpo, CN) d'une balise fixe dans MOON_PA_DE440 vers les stations DSN DSS-14, DSS-43 et DSS-63 à partir du noyau de stations NAIF earthstns_itrf93_260814.bsp, avec de440s, moon_pa_de440_200625, moon_de440_250416.tf, earth_latest_high_prec et naif0012 ; les dérivées partielles sont des différences centrées à cinq points des temps de lumière de SPICE, et non la formule 1/(c - u.V) de Kshana. Fixé à l'avance (a689c797, époques { "2024" }) avec des seuils de { "1" } ps sur chaque retard et { "1e-6" } relatif sur chaque dérivée partielle. Cette première exécution a échoué (17/75 retards à { "1" } ps près, pire { "1.03e-11" } s) : SPICE porte l'ET comme un seul double, dont l'espacement en { "2024" } arrondit l'époque d'émission jusqu'à { "6e-8" } s, soit environ { "6" } ps de temps de lumière, et le résidu concorde avec cet arrondi à une corrélation de { "0.99999" } (épinglé ; le relecteur l'a reproduit indépendamment). L'amendement 66e365d4, écrit après ce résultat et avant l'existence de son jeu de test, a déplacé la même référence et les mêmes seuils vers { "25" } époques horaires près de J2000, où l'espacement de l'ET est d'au plus { "1.5e-11" } s : 75/75 retards à { "1" } ps près (pire { "6.2e-14" } s), 75/75 dérivées partielles de balise (pire { "7.4e-9" }), 150/150 dérivées partielles de station (pire { "3.8e-11" }). Hors de l'affirmation : le chemin analytique par défaut (Lune en série et repère lunaire moyen, { "24" } µs d'ANISE via DE440, ligne VLBI géodésique lunaire), le terme de Shapiro différencié que le scénario ajoute analytiquement, les milieux, et l'échelle barycentrique-vers-géocentrique

# text
seg-1f10810131be = Lecteur de noyaux NAIF : conteneur DAF, SPK de type { "2" } et PCK binaire de type { "2" }

# text
seg-7da4847e7a28 = Le lecteur propre du moteur, en Rust pur, des noyaux binaires NAIF (naif_kernel) : le conteneur DAF (les deux ordres d'octets, enregistrements de résumé chaînés), les segments de position de Tchebychev SPK de type 2 chaînés par leurs centres jusqu'à un plus proche ancêtre commun, et les segments d'angles d'Euler PCK binaire de type 2 transformés en rotation J2000-vers-corps, avec les époques prises comme ET en deux parties de sorte qu'un décalage inférieur à la microseconde garde sa précision. C'est par lui que KernelEphemeris (ephem_provider) et les chemins par noyau de lunar_vlbi, lunar_llr et lunar_vlbi_fim lisent DE440. L'affirmation est qu'il lit correctement les noyaux JPL ; ce n'est pas une affirmation que DE440, ou les séries analytiques du Soleil et de la Lune du moteur, soient précis

# text
seg-09773b73d785 = Deux lecteurs de noyaux indépendants sur les mêmes fichiers NAIF : NAIF SPICE Toolkit N0067 (CSPICE via spiceypy { "8.2.0" }, MIT ; spkezr et pxform) et ANISE { "0.10.6" } (Nyx Space, MPL-2.0 ; Almanac.translate et Almanac.rotate), tous deux exécutés comme programmes distincts sur de440s.bsp et moon_pa_de440_200625.bpc. Fixé à l'avance (abcd9133) avant l'existence de tout jeu de test ou valeur de référence : la graine de la grille est constituée des { "16" } premiers chiffres hexadécimaux du hachage de ce commit, de sorte que ni les { "200" } époques ni les paires de corps n'ont pu être choisies en vue du résultat ; chaque époque porte aussi la Lune et le Soleil par rapport à la Terre. Seuils fixés d'avance à partir de l'évaluation de Tchebychev en double précision (au plus { "15" } coefficients, n^{ "2" } u = { "2.5e-14" } par évaluation, deux évaluations et jusqu'à deux sauts par côté) : position { "1e-13" } R + { "1e-5" } m, vitesse { "1e-13" } V + { "1e-10" } m/s, R et V la plus grande magnitude relative au plus proche ancêtre commun ; élément de rotation { "1e-13" } W + { "1e-15" }, W la somme des coefficients de l'enregistrement couvrant ; ANISE ajoute { "2" } ns de mouvement relatif pour ses époques à la nanoseconde. Résultat : chacun des { "600" } états et des { "200" } rotations dans son seuil face aux deux références, sur l'extrait et sur les noyaux complets ; pire { "6.0e-3" } du seuil (position), { "5.9e-3" } (vitesse), { "3.7e-3" } (rotation). Mutation : évaluer chaque enregistrement à -s fait échouer { "3597" } comparaisons. Divulgué : une vérification antérieure sur 25 époques face à SPICE ({ "4.6e-5" } m, tests/naif_kernel_reader_check.rs) a été vue avant cette ligne et n'en est pas la preuve ; la première exécution du générateur de jeu de test s'est interrompue sur un intervalle de grille vide avant de produire une valeur et a été corrigée. Les deux côtés lisent DE440, de sorte que la concordance valide le lecteur, non l'éphéméride

# text
seg-e08e98908f3a = Earth-GNSS à distance lunaire

# text
# c1: earth-gnss-lunar
seg-dd8ce373d1f6 = Réception Earth-GNSS à distance lunaire : la couche de signal faible que nomme le tableau { "1" } de P7 et pour laquelle le moteur n'avait aucun modèle. Par satellite et par époque, il calcule l'angle hors de l'axe par rapport au nadir de l'émetteur, si la Terre occulte le trajet direct, la distance oblique et sa perte en espace libre, le gain d'émission à cet angle, la puissance reçue et la densité de porteuse sur bruit ; il agrège ensuite seulement les liaisons qui franchissent un seuil de poursuite, et balaie une révolution complète de la constellation afin que la réponse soit une DISTRIBUTION plutôt qu'un instantané. Trois faits déterminent le résultat et le rapport énonce chacun : la Terre sous-tend { "13.90" } deg depuis le rayon de la constellation, de sorte que le PIC du faisceau est géométriquement indisponible à tout rayon à destination de la Lune ; ce qui reste est le bord du lobe principal et les lobes secondaires, le régime dans lequel LuGRE a opéré à la Lune en { "2025" } ; et la perte de propagation en L1 est d'environ { "208" } dB, quelque { "25" } dB de plus que ce que paie un utilisateur terrestre. MESURÉ sur la géométrie intégrée de classe GPS à 24 satellites sur { "64" } époques d'une période orbitale : disponibilité du SIGNAL { "0.375" } avec une meilleure liaison de { "30.93" } dB-Hz, et disponibilité de la SOLUTION { "0.000" } - au plus deux liaisons poursuivables simultanées, jamais les quatre qu'exige une position. La séparation de ces deux disponibilités est le point essentiel, et le rapport refuse de les laisser confondre : Earth-GNSS à distance lunaire est une couche de qualité SYNCHRONISATION, non de qualité position, et un a priori de résilience en couches doit prendre la disponibilité de la solution. Le conditionnement est émis pour la même raison - chaque satellite visible se trouve dans un cône large de quelques degrés vu depuis la Lune, de sorte que les lignes de visée sont quasi parallèles par construction. Exécutable comme type <c1/> Reformulé selon D7 : l'affirmation à distance lunaire porte sur la densité de porteuse sur bruit RELATIVE entre satellites à une même époque, à partir de diagrammes d'émission bidimensionnels mesurés (NAVCEN Block IIR/IIR-M), plus la visibilité géométrique ; le C/N0 absolu n'est pas revendiqué (Parker et al. rapportent une perte commune de { "7" } à { "12" } dB).

# text
seg-bed2679f88e5 = Identités en forme close et cohérence interne ; AUCUNE référence externe n'est revendiquée. Le demi-angle du limbe est vérifié face à asin(R_earth/r_orbit) et la géométrie face à lui ; la perte en espace libre, le noyau DOP et la propagation SGP4 que cela compose sont chacun validés de façon externe dans leurs propres lignes et cette ligne n'emprunte pas leur statut. POURQUOI MODELLED, et c'est le diagramme d'émission : le gain en fonction de l'angle est celui d'une ouverture circulaire uniformément éclairée, le diagramme d'Airy, alors qu'une vraie antenne GPS L1 est un réseau hélicoïdal à douze éléments avec un lobe principal façonné culminant hors de l'axe pour égaliser la puissance sur le disque terrestre et des lobes secondaires qui ne sont pas d'Airy. Des diagrammes mesurés publiés existent et ne sont pas fournis avec le dépôt ici, de sorte que les ordres et les ordres de grandeur tiennent, alors que les dB d'un satellite pris isolément non. UNE PREMIÈRE IMPLÉMENTATION DE CETTE LIGNE ÉTAIT FAUSSE D'UNE MANIÈRE QUI MÉRITE D'ÊTRE CONSIGNÉE : l'expression d'Airy n'est valable que dans l'hémisphère avant, son argument varie comme sin(theta), et à theta proche de { "180" } deg elle reboucle et rend le GAIN PLEIN AXE derrière l'ouverture - de sorte que les deux liaisons les plus fortes du premier rapport étaient des satellites pointant leurs antennes à l'opposé de la Lune, et c'étaient les deux seules à franchir le seuil. Derrière l'ouverture, le modèle applique désormais un plancher plat de lobe arrière, énoncé comme une borne plutôt que comme une forme de diagramme fabriquée. Délibérément absents, chacun rendant le budget OPTIMISTE : aucune perte ionosphérique ou troposphérique sur les rayons rasant le limbe, aucune perte de polarisation, de pointage ou d'implémentation, et une Terre sphérique sans extension réfractive. La position de la Lune est une ENTRÉE, non une consultation d'éphéméride, parce que la grandeur testée est la liaison et la géométrie du faisceau. Faire passer cette ligne à validée exige un diagramme d'émission mesuré et des points normaux LuGRE face auxquels la vérifier ; aucun des deux n'est dans le dépôt et aucun n'est inventé ici. { "0.30" } tour { "2" }, un constat (reste MODELLED) : un chemin de liaison à entrées mesurées (vraies positions SP3, puissance d'émission par bloc, diagrammes d'émission et de réception tabulés, hystérésis d'acquisition et de poursuite) a été vérifié face au tableau { "3" } de Montenbruck et al. { "2023" } pour GENESIS à { "6000" } km (fixé à l'avance 5b414f0a) : les moyennes avec antenne au zénith concordent sur { "5" } sur { "6" } à moins d'un dB de la sensibilité de l'article ; les moyennes avec antenne au nadir sont de { "1.0" } à { "2.4" } satellites plus élevées que celles imprimées, vraisemblablement parce que l'article a utilisé des diagrammes de lobes secondaires GPS dépendant de l'azimut qui ne sont pas publiés. Les chiffres à distance lunaire de cette ligne utilisent toujours le substitut d'Airy. { "0.30" }+ D7, un constat (reste MODELLED) : la grandeur reformulée, la DIFFÉRENCE de C/N0 entre satellites Block IIR/IIR-M poursuivis à une même époque, prédite avec les diagrammes L1 mesurés par SVN de NAVCEN (bidimensionnels, repère à orientation de lacet) face au C/N0 de vol de LuGRE (fixé à l'avance 768cb62b : { "99" } % visibles, RMS de paires <= { "3.0" } dB, médiane <= { "2.0" } dB, au moins { "50" } enregistrements et { "30" } paires) dispose de trop peu de données : les { "26" } époques qualifiantes de transit et d'orbite lunaire contiennent { "15" } enregistrements IIR/IIR-M poursuivis (surtout IIF et III sont poursuivis) et une paire. Les { "15" } sont prédits visibles et le résidu de l'unique paire est de -0.06 dB ; rien n'est revendiqué

# text
seg-29df5b40a3f9 = Détermination d'orbite lunaire : Earth-GNSS contre radiométrie au sol

# text
seg-647902ebcee3 = Détermination d'orbite sur une orbite en halo quasi rectiligne (ou une orbite gelée elliptique) à partir de deux types de données indépendants : pseudodistances Earth-GNSS reçues à bord (la règle de liaison de la ligne Earth-GNSS à distance lunaire, plus l'occultation par la Lune) et distance et vitesse radiale bidirectionnelles au sol depuis trois stations du Deep Space Network. Chacune est un lot de moindres carrés à un pas autour de l'orbite de référence avec sa covariance formelle ; une simulation Monte Carlo avec graine de la différence entre les deux estimations teste si les deux covariances l'expliquent (q = d' (P_G + P_R)^-1 d, khi-deux à six degrés de liberté lorsque les modèles concordent) et ce qu'une accélération non modélisée fait à la statistique.

# text
seg-652bdc29deea = Résolution d'ambiguïté de phase de porteuse lunaire : surface et orbiteur

# text
seg-02496f9e9af2 = Phase de porteuse et code Earth-GNSS en simples différences entre récepteurs à une station de surface lunaire et à un orbiteur, avec la différence d'horloge par époque éliminée par profilage, une ambiguïté par passage continu et le plus long passage comme jauge. La covariance d'ambiguïté flottante est un complément de Schur ; LAMBDA résout les entiers, le taux d'amorçage est rapporté à côté d'un taux de réussite des moindres carrés entiers par Monte Carlo avec graine et des sigmas de position flottante et fixée. Rapporté tel que trouvé : au gain enregistré de { "12" } dBi le problème des doubles différences n'est pas formable (l'amendement { "1" } a déplacé la valeur par défaut à { "25" } dBi après que seuls des décomptes de disponibilité ont été vus), et à { "25" } dBi la fixation d'entiers n'est PAS atteinte - hors de portée (quelques pour cent au plus) bien que la solution flottante s'améliore avec l'arc.

# text
seg-8d8296752eb8 = Une résolution numpy indépendante des mêmes équations normales à partir des lignes exportées (Q3) et une énumération entière par force brute (Q4). Aucune mesure de phase de porteuse GNSS ou lunaire n'est comparée. MODELLED.

# text
seg-11dd1bb8e4e1 = Co-estimation du repère lunaire : stations de surface et orbiteurs

# text
seg-a38c8d95e6c9 = Information de Fisher du datum de repère lunaire à sept paramètres à partir de la télémétrie laser de stations terrestres vers les cinq réflecteurs seule et avec des distances orbiteur-station de surface ajoutées : la matrice d'information, le rang, les sigmas de Cramer-Rao, la métrique de dégénérescence du module d'identifiabilité lunaire et des ensembles de stations aléatoires avec graine. L'orbite est tenue pour connue dans les axes lunaires (son erreur est portée par le sigma de distance de l'orbiteur).

# text
seg-47d2afc53b3d = Une différence finie numpy indépendante du modèle direct (F2). Rien n'est comparé à de véritables solutions de repère lunaire. Le facteur est conditionnel à l'orbite supposée connue et au sigma de distance de { "1" } m. MODELLED.

# text
seg-862977c4bb01 = Précision de rattachement de repères par liaison spatiale : GNSS, VLBI et télémétrie laser colocalisés

# text
seg-a9ae8e99f00d = Précision de Cramer-Rao des décalages de translation, d'échelle et de rotation inter-techniques entre repères GNSS, VLBI et télémétrie laser lorsqu'un seul vaisseau spatial porte les trois, avec la position du vaisseau éliminée à chaque époque et neuf paramètres de nuisance de rattachement local portant un a priori, balayés sur la précision du rattachement local. Covariances par la voie de la racine carrée (les équations normales perdent les chiffres lorsque les techniques sont presque parfaites).

# text
seg-b37ac7294112 = Un système empilé numpy indépendant avec les inconnues de position éliminées par compléments de Schur explicites (T3). Aucune donnée GRASP, Genesis ou d'une autre mission n'est comparée. MODELLED.

# text
seg-ae627996875e = Sensibilité aux nombres de Love et à la libration lunaires

# text
seg-28780d07c4a7 = Information de Fisher de h2, k2, l2 et des amplitudes de libration physique à partir de la télémétrie laser (déplacement de marée radial et horizontal, rotation des réflecteurs), du suivi d'orbiteur (l'accélération k2 de degré 2 intégrée le long de la ligne de visée, tendance retirée), d'un gravimètre de surface (facteur gravimétrique { "1" } + h2 - { "1.5" } k2) et d'une horloge de surface (taux fractionnaire ({ "1" } + k2 - h2) W2/c2, lié aux constantes du temps lunaire). Les valeurs nominales de h2 et l2 sont des points de linéarisation ; l'étude dit ce qui est sensible à quoi, non ce que valent les nombres.

# text
seg-180d74388339 = Un assemblage numpy indépendant par différences finies (G2) et une évaluation en forme close (G4). La sensibilité à k2 de la famille d'orbiteurs est un chiffre de borne haute (l'état d'orbite n'absorbe ici qu'une constante et une tendance). Aucune mesure de marée ou de libration lunaire n'est comparée ; k2 est cité d'après Lemoine et al. { "2014" } comme valeur nominale. MODELLED.

# text
seg-da712b740519 = Augmentation du DOP par balises de surface lunaire

# text
# c1: lunar-beacon
seg-83e6341e01b1 = Dilution de précision augmentée par balises pour un utilisateur de surface lunaire : les lignes de ligne de visée des satellites visibles et les lignes de télémétrie des balises de surface visibles sont concaténées en une seule matrice de conception et évaluées par le noyau DOP partagé, et le DOP obtenu est converti en précision réalisée à 1 sigma EN MÈTRES par une erreur de télémétrie équivalente utilisateur par balise assemblée comme la racine de la somme des carrés des termes de synchronisation d'horloge, de multitrajet et de levé. La visibilité d'une balise est l'horizon géométrique à deux hauteurs d'une Lune sans atmosphère, qui n'a pas d'extension réfractive et est donc exact plutôt qu'approché. Exécutable comme type de scénario <c1/>, qui rapporte les satellites seuls, les satellites plus les balises, et une constellation plus grande comme voie concurrente vers la même géométrie. MESURÉ sur la géométrie d'or intégrée (utilisateur à -80 deg, trois balises relevées, LCNS illustratif à six satellites à t={ "0" }, masque de { "5" } deg) : { "5" } satellites visibles donnent un PDOP de { "9.6941" } et un 1-sigma 3-D de { "11.222" } m ; ajouter les balises qui franchissent réellement l'horizon donne un PDOP de { "4.1160" } et { "4.765" } m, un facteur de { "2.355" } ; le service à 24 satellites donne plutôt un PDOP de { "2.4226" } et { "2.804" } m, un facteur de { "4.002" }. Le rapport imprime le nombre de balises VISIBLES plutôt que le nombre configuré, et sur cette géométrie UNE SEULE des trois balises franchit l'horizon : les deux sites latéraux se trouvent à environ { "333" } km de l'utilisateur pour un horizon de { "86" } km avec une antenne de { "2" } m, de sorte qu'un lecteur n'est jamais laissé à supposer que les trois ont contribué

# text
seg-179fb996fc72 = L'arithmétique du DOP est le noyau crate::orbit::dop, séparément validé de façon externe face à gnss_lib_py dans tests/dop_reference.rs ; cette ligne n'emprunte pas de nouveau le statut de cette ligne. L'horizon de visibilité des balises est la forme close L01, et sigma = DOP x sigma_URE est la relation GNSS standard (Kaplan et Hegarty, Understanding GPS/GNSS, section { "7" }). Au sein de cette ligne, l'augmentation elle-même est vérifiée face à un chemin DOP indépendant du dépôt et épinglée à une référence d'or archivée. POURQUOI MODELLED : la conception de la constellation, le placement des balises, les hauteurs d'antenne et les trois magnitudes du budget d'erreur sont des entrées illustratives plutôt qu'un levé déployé ou une liaison mesurée, de sorte que les mètres rapportés sont une propriété d'un scénario choisi et non d'un service déployé. NOTE SUR LA PROVENANCE : cette capacité était annoncée dans le README et exercée par deux tests de validation, mais ne portait AUCUNE ligne de matrice et aucun type de scénario, de sorte qu'elle n'était pas atteignable depuis une exécution. Elle était revendiquée en prose, absente du registre et inatteignable dans le moteur à la fois. La ligne et le type ont été ajoutés ensemble. { "0.30" } tour { "2" } (fixé à l'avance db0eb9ec), bloqué (reste MODELLED) : la visibilité ANISE { "0.10.6" } et un DOP numpy sur la géométrie de la ligne concordent (ensembles visibles exacts y compris { "72" } cas proches de l'horizon et { "48" } proches du masque ; DOP à { "7.2e-13" } près), mais les mètres rapportés sont le DOP multiplié par une erreur de télémétrie en racine de la somme des carrés illustrative de { "1.158" } m sans référence ; la restriction de portée qui les exclurait attend une décision du propriétaire

# text
seg-b0b618abf402 = Cécité d'intégrité en mode commun

# text
seg-e732ac99a9ae = Séparation exacte en sous-espaces de parité d'une erreur de mesure en la part que RAIM ne peut pas voir et la part qu'il peut voir. Pour le modèle instantané linéarisé y = G·x + e, toute erreur dy se décompose de façon unique en une composante AVEUGLE dans range(G) — absorbée comme une erreur d'état S·dy et annihilée par le projecteur de résidu Pperp = I − G·S, donc invisible à TOUT test de résidu, et non seulement à un seuil particulier — et une composante DÉTECTABLE dans l'espace de parité. Le module rend le projecteur, la séparation et la fraction aveugle, de sorte qu'un appelant peut quantifier quelle part d'une erreur précise un moniteur instantané est structurellement incapable de signaler. Appliqué au plancher réel inter-éphémérides : le désaccord de l'ordre du mètre DE440-contre-INPOP21a et DE440-contre-EPM2021 sur la position géocentrique de la Lune est absorbé presque entièrement comme erreur de position de l'utilisateur (fraction aveugle médiane { "1.000000" } ; erreur de position aveugle médiane { "2.3955" } m et { "2.0050" } m) face à un résidu de parité au niveau de { "1e-15" } m

# text
seg-077303e9dd72 = P2 : numpy linalg.lstsq (LAPACK gelsd SVD, BSD-3) recalcule la séparation aux moindres carrés sur des entrées archivées AVEC une vraie part de parité (dy = E·Δs + w, w ~ N({ "0" }, { "1" } m), graine { "20261001" }) sur la géométrie à 8 satellites et un sous-ensemble à 6 satellites, { "1464" } cas sur les deux vraies paires inter-éphémérides, fixé à l'avance (f672a314) : blind_dx, residual, blind_norm et detectable_norm à { "1e-12" } relatif à |dy| près et blind_fraction à { "1e-12" } absolu près (pire blind_dx { "1.06e-14" }, residual { "4.4e-15" }, blind_fraction { "3.1e-15" }). numpy construit G lui-même à partir des positions archivées, alors que le moteur utilise les équations normales avec Gauss-Jordan ; une inverse à gauche oblique fait passer le test au rouge à { "5.5e-2" } |dy|. L'amendement { "1" } (86c53301, après une première exécution, divulgué) n'a relâché qu'une précondition d'entrée sur la fraction de parité (chaque cas au moins { "1e-3" } et { "95" } % de chaque géométrie au moins { "0.05" }), non le seuil de concordance. Affirmation validée, comme P2 le permet : l'algèbre linéaire de la séparation sur ces entrées ; les magnitudes du plancher inter-éphémérides et la géométrie lunaire illustrative ({ "8" } nœuds de type LCNS à { "5000" } km) sont des entrées, non validées, et la cécité est une propriété connue de tout RAIM instantané. La comparaison numpy du tour 1 (tests/lunar_common_mode_integrity_reference.rs) ne vérifiait que l'identité S·G = I parce que ses entrées se trouvaient dans range(G) ; elle est conservée comme régression. Provenance des éphémérides : tests/fixtures/inter_ephemeris/NOTICE.md (JPL, IMCCE, IAA RAS)

# text
seg-845e9f5eec81 = Niveau de protection en mode commun et enveloppe d'intégrité totale

# text
seg-ffc59a7ed497 = Algèbre analytique de projecteurs vérifiée face à elle-même : une covariance confinée à range(G) doit donner un CMPL positif, une covariance confinée à l'espace de parité doit donner approximativement zéro, et l'enveloppe doit sommer deux contributions orthogonales dans l'espace de mesure. La covariance de mode commun, la géométrie de la constellation et k sont des entrées modélisées représentatives, PAS un budget certifié, et aucune affirmation n'est faite que la borne triangulaire soit serrée. NOTE SUR LA PROVENANCE : cmpl_horizontal, blind_position_covariance et integrity_envelope sont publics et livrés, et leurs tests unitaires étaient déjà cités par la ligne de cécité en mode commun, mais l'AFFIRMATION D'ENVELOPPE elle-même ne portait aucune ligne - de sorte que la seule réserve qui la garde honnête, à savoir que la somme est une borne triangulaire et non une RSS, n'était énoncée nulle part dans le registre. La ligne enregistre l'affirmation et la réserve ensemble.

# text
seg-5ed34a5b402e = OD multi-technique conjointe lunaire + horloge

# text
seg-5ace1caff5a9 = Fusion par lots de VLBI + distance locale lunaire + distance inter-satellites pour retrouver les positions et horloges des stations et de la constellation

# text
seg-82824963aef7 = P2 : numpy { "2.4.6" } (numpy.linalg.lstsq avec LAPACK gelsd, numpy.linalg.inv ; BSD-3) recalcule chaque pas de Gauss-Newton, la solution convergée des moindres carrés pondérés, les sigmas formels et l'erreur de station sur les jacobiennes et observations archivées de six réseaux simulés, fixé à l'avance (5094bc31) à max({ "1e-8" }, { "100" } kappa eps) relatif. La première exécution a fait échouer le réseau sans VLBI ({ "6.1e-7" } contre { "1e-8" }, une inverse des équations normales à un conditionnement de { "1.4e5" }) ; la correction du moteur écrite après ce résultat (batch_ls::gauss_newton_qr, un pas QR de Householder utilisé par estimate et formal_covariance) a été relancée au seuil inchangé : pas de { "1.1e-14" } à { "2.4e-11" }, sigmas au plus { "1.3e-11" }. L'affirmation validée est l'algèbre linéaire de la résolution de fusion sur ces entrées, non les magnitudes physiques du réseau simulé ni ses modèles d'observation : la ligne du retard VLBI géodésique lunaire reste MODELLED (son chemin analytique diffère d'ANISE jusqu'à { "24" } µs), et les repères ont leurs propres lignes. La récupération d'une vérité simulée injectée et la cohérence NEES restent des vérifications internes ; le recoupement antérieur Orekit { "12.2" } / Hipparchus Levenberg-Marquardt (tests/lunar_joint_multi_technique_od_reference.rs) exerce batch_ls::gauss_newton, que estimate n'appelle plus, et est conservé comme vérification de cette primitive. Révision { "0.30" } : les erreurs de station par défaut de lunar-joint-od-clock { "3.541344" } -> { "3.541350" } m avec VLBI et { "2183.119" } -> { "2183.558" } m sans (résolution QR). Révision { "0.36" } (STUDIO-15, mathématiques portables ; docs/revisions/STUDIO15-portable-math-rebaseline.md) : { "3.541350" } -> { "3.536885" } m avec VLBI et { "2183.558" } -> { "2184.021" } m sans, et la résolution sans VLBI s'arrête après { "5" } itérations, et non { "2" } (un arrêt limité par les erreurs d'arrondi sur le réseau mal conditionné) ; la comparaison fixée à l'avance a été relancée sur des entrées réexportées au seuil inchangé (numpy { "2.4.6" }, les six réseaux passent)

# text
seg-69fbe488dec5 = Information de Fisher et observabilité de Cramér–Rao

# text
seg-043d4c7a2d6a = Information de Fisher M=HᵀWH, borne inférieure de Cramér–Rao, rang d'observabilité / espace nul du défaut de datum (pseudo-inverse de Moore–Penrose), et scalaires D/A/E/T-optimaux de plan d'expériences issus d'un solveur propre de Jacobi symétrique

# text
seg-4035d9a23e64 = NumPy { "2.4.1" } (numpy.linalg.eigh / .inv ; BSD-3-Clause, reposant sur LAPACK) — une autorité tierce indépendante qui calcule les mêmes valeurs propres définies de façon unique, la covariance de Cramér–Rao σ²(XᵀX)⁻¹ et les facteurs de dilution de précision GNSS par un algorithme différent (diviser pour régner de LAPACK + LU) de celui du balayage de Jacobi cyclique et du pseudo-inverse spectral de Kshana ; concordance à { "1e-9" }. La même classe de bibliothèque externe valide déjà le moteur DOP (face à gnss_lib_py) et les noyaux χ²/erf (face à SciPy). Recoupé en outre avec les CRLB en forme close de Kay ({ "1993" }) et avec l'atteinte de la CRLB par Monte-Carlo (interne)

# text
seg-e4ec41d0f5e1 = Observabilité d'une station lunaire absolue (défaut de datum)

# text
seg-b3e4160042d2 = Observabilité par information de Fisher de la résolution lunaire conjointe : sans lignes de base terrestres, le datum du référentiel absolu se trouve dans l'espace nul de HᵀWH (la position de la station est inobservable) ; ≥{ "3" } lignes de base rétablissent le rang plein et bornent l'erreur de Cramér–Rao de la station, que l'estimateur atteint

# text
seg-238597f6aa01 = Structure analytique du défaut de datum — le mode inobservable du référentiel absolu se trouve dans l'espace nul de l'information de Fisher (forme close), le seuil de rang correspond à la justification publiée du schéma à 3 stations, et l'estimateur atteint la CRLB qui en résulte en Monte-Carlo. La géométrie lunaire elle-même est un réseau représentatif (et non une éphéméride réellement volée), si bien que la ligne reste MODELLED ; le moteur FIM/CRLB sous-jacent est vérifié séparément par rapport aux formes closes de Kay ({ "1993" }). { "0.30" } tour { "2" } (préenregistré fab02df9), bloqué (reste MODELLED) : NumPy/SciPy recalculent le rang et le défaut au seuil indiqué de { "1e-9" }, la part des axes de la station dans l'espace nul (à { "8.4e-10" } près) et la CRLB de la station (à { "1.2e-10" } près) sur { "17" } configurations validées générées par Kshana (P2). Non promu : l'affirmation selon laquelle l'estimateur atteint la borne (efficacité Monte-Carlo d'environ { "0.98" }) n'a pas de référence indépendante, et la délimitation qui la laisserait MODELLED attend une décision du responsable

# text
seg-ae4b71d54dfa = Ajustement de datum de Helmert à 7 paramètres et rattachement d'orientation ICRF à partir d'un réseau de points

# text
seg-9e434924b34c = Solveur indépendant de transformation de similitude d'Umeyama (Horn) pondérée en forme close (fondé sur la SVD de numpy/scipy ; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — un algorithme différent de l'ajustement itératif de Gauss–Newton de kshana, qui atteint le même optimum des moindres carrés pondérés défini de façon unique sur des réseaux de points identiques octet pour octet

# text
seg-4bcec6e2dd9f = Volume de service de navigation lunaire

# text
seg-dba98ad5df1c = DOP lunaire de classe Moonlight, couverture, disponibilité, et niveaux de protection ARAIM lunaires généralisés sur un volume de service

# text
seg-7e981d90a806 = Autorité tierce indépendante : propagateur képlérien ANISE { "0.10.2" } astro::Orbit (Nyx Space, MPL-2.0) — un chemin de code à deux corps équinoxial distinct du Kepler de Newton-Raphson de kshana ; la position MCI de chaque satellite concorde à moins de { "1e-3" } m et le nombre et l'ensemble des satellites visibles dérivés concordent exactement en chaque point de la grille. Le noyau DOP est validé par gnss_lib_py ; l'intégrité utilise les paramètres publiés de LunaNet/LCNS

# text
seg-2ed7181c97dd = Génération des codes d'étalement LunaNet AFS (LSIS V1.0)

# text
seg-13ff6c381275 = Les codes de l'Augmented Forward Signal de LSIS V1.0 ({ "29" } janvier { "2025" }) : le code primaire AFS-Q de 10230 chips généré à partir de la construction du pilote L1C d'IS-GPS-800 avec les indices d'IS-GPS-800J (les mêmes { "210" } affectations qu'imprime l'annexe D de LSIS), les codes de Gold AFS-I de 2046 chips générés à partir de g1 = x^{ "11" } + x^{ "2" } + { "1" } et g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" } avec le retard G2 de chaque PRN retrouvé dans le fichier de l'annexe { "3" } de la norme, les quatre codes secondaires, les codes tertiaires de 1500 chips, l'affectation des nœuds du tableau { "11" } provisoire et le code pilote hiérarchisé. Le contenu de LSIS est lu à l'exécution depuis un cache local vérifié par SHA-256, rempli à partir du PDF hébergé par la NASA, et jamais redistribué

# text
seg-dc1dd144b107 = Référence : les valeurs qu'imprime LSIS V1.0 à des fins de validation (tableaux C-1 à C-5, D-1 à D-6, E-1 à E-6) et ses fichiers électroniques de codes de l'annexe { "3" }, selon un critère de zéro écart fixé avant la comparaison. Le critère n'est pas atteint à cause d'une cellule imprimée, incohérente en elle-même avec le fichier de l'annexe { "3" } de la norme, si bien que la ligne reste MODELLED ; une note d'erratum est rédigée. Les mêmes chips sont aussi égaux à ceux de LANS-AFS-SIM (ligne « Rendu en bande de base de LunaNet AFS face à un générateur indépendant, à état de canal donné »)

# text
seg-ea20909686ea = Rendu en bande de base de LunaNet AFS face à un générateur indépendant, à état de canal donné (LSIS V1.0)

# text
seg-c0f021c38842 = Le cœur de rendu de la bande de base AFS (LSIS-130 : enveloppe complexe I + jQ, I = le code de Gold AFS-I multiplié par la trame de { "500" } symboles/s à { "1.023" } Mchip/s, Q = le pilote AFS-Q hiérarchisé à { "5.115" } Mchip/s, rotation de la porteuse, alignement des chips et des symboles) reproduit les échantillons d'un générateur indépendant lorsqu'il est piloté par l'état de canal enregistré de ce générateur (phases et fréquences de code, phase et fréquence de la porteuse, amplitude par canal). Non couverts : le modèle de nœud qui déduit cet état d'un Doppler, d'un retard et d'une densité porteuse sur bruit, la répartition de puissance 50/50 calculée à partir de la densité porteuse sur bruit (les amplitudes sont reprises du simulateur), ainsi que les métadonnées SigMF et l'écriture des échantillons sur 8 bits

# text
seg-dd1142957a05 = Bibliothèque : LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae, version bande S, exécutée comme programme séparé) ; les échantillons de Kshana sont pilotés uniquement par l'état de canal enregistré du simulateur, et une version à trace seule est vérifiée identique octet pour octet à la version non modifiée. Seuils fixés avant l'exécution : zéro écart de chip et de symbole, |rho| >= { "0.999" } sur l'exécution et >= { "0.99" } par bloc de { "2" } ms, phase à { "0.05" } rad près. Des amplitudes I et Q égales sont une entrée de la comparaison, de sorte que la répartition de puissance n'est pas testée par elle. LANS-AFS-SIM lit ses codes tertiaires dans le fichier de l'annexe { "3" } de LSIS, de sorte que cette partie n'est pas indépendante de la ligne des codes. LANS-AFS-SIM et PocketSDR-AFS ont le même auteur et comptent pour une seule implémentation indépendante. Conditionné aux données : la comparaison avec LANS-AFS-SIM exige le cache local LSIS V1.0 (xval/lunar-afs/fetch_lsis.sh, vérifié par SHA-256) et est ignorée, avec un avertissement, en son absence

# text
seg-5d79da539912 = Codage de canal de la trame AFS LunaNet, FID { "0" } (LSIS V1.0)

# text
seg-6ed2b4c792e6 = La trame FID { "0" } de { "12" } s et 6000 symboles de LSIS V1.0 : motif de synchronisation de 68 symboles, sous-trame { "1" } BCH ({ "51" }, { "8" }) (générateur octal 763), CRC-24 (({ "1" } + X)·P(X)) sur les sous-trames 2-4, codage LDPC de rythme 1/2 avec les A, B^-1, C, D imprimés (annexe { "1" } de LSIS, lue à l'exécution depuis le cache local vérifié par SHA-256) et le poinçonnage de la norme, entrelaceur par blocs de { "60" } x { "98" } ; un décodeur exhaustif de sous-trame 1 qui signale un TOI hors de { "0" }..99, et un décodeur LDPC min-sum normalisé écrit à partir de H = [[A, B, { "0" }], [C, D, I]] seul

# text
seg-46879e2e8ab5 = Bibliothèque : LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae), dont les propres BCH, CRC, LDPC et entrelaceur produisent, pour le même contenu, des trames identiques symbole pour symbole à celles de Kshana (zéro écart, seuil fixé avant l'exécution). Corroboré par des valeurs de référence : l'exemple traité de BCH de la figure { "8" } de LSIS V1.0 et la valeur de contrôle CRC-24/LTE-A (catalogue d'algorithmes CRC paramétrés de Greg Cook), toutes deux exactes au bit près ; et par PocketSDR-AFS, qui décode chaque sous-trame des trames qu'il a synchronisées en trois exécutions, avec un CRC correct et des bits de sous-trame 2 concordants. Le test de contrôle de parité est proche d'une identité interne (il confirme que le B^-1 imprimé est l'inverse du B imprimé) et n'est pas compté comme une référence indépendante. Conditionné aux données : la comparaison avec LANS-AFS-SIM exige le cache local LSIS V1.0 (xval/lunar-afs/fetch_lsis.sh, vérifié par SHA-256) et est ignorée, avec un avertissement, en son absence

# text
seg-56c7aeac59c1 = Décodabilité en boucle fermée de LunaNet AFS par un récepteur indépendant (LSIS V1.0)

# text
seg-da2d29d437b0 = Un enregistrement AFS de Kshana acquis, poursuivi et décodé par un récepteur logiciel indépendant, et comparé aux étiquettes de vérité propres à l'enregistrement. Cela ne prouve que le respect de la norme et la cohérence des étiquettes ; ce n'est pas une affirmation sur la physique du canal, la propagation, la puissance reçue ou les bilans de liaison, dont les valeurs dans l'enregistrement sont des entrées choisies

# text
seg-8211583afc64 = Bibliothèque : PocketSDR-AFS (T. Ebinuma d'après le PocketSDR { "0.13" } de T. Takasu, BSD-2-Clause, commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, version bande S, copie à niveau de journalisation en impression seule), selon des critères fixés avant chaque exécution. La troisième comparaison préenregistrée atteint intégralement ses seuils de décodage et de poursuite C1 et C2, mais pas sa garde G0 telle qu'écrite (deux exécutions du récepteur non modifié diffèrent sur les mêmes quatre enregistrements d'acquisition), et la deuxième a manqué le seuil de { "5" } violations, si bien que la ligne reste MODELLED. LANS-AFS-SIM et PocketSDR-AFS ont le même auteur et comptent pour une seule implémentation indépendante ; les vérifications de vecteurs imprimés de la ligne du codage de trame protègent contre une même erreur de lecture partagée

# text
seg-780369fb9a54 = Concordance inter-générateurs du GPS L1 C/A

# text
seg-ee47b60515f1 = Codes d'étalement GPS L1 C/A (sdr::CaCode) et sous-trames LNAV 1-3 (gps_lnav : quantification des champs d'IS-GPS-200 avec le pi de la spécification, mise en paquets en complément à deux, mots TLM et HOW, parité du tableau 20-XIV avec inversion D29*/D30*, bits de résolution de parité des mots { "2" } et { "10" }) comparés bit à bit avec gps-sdr-sim sur son brdc0010.22n fourni ({ "32" } satellites)

# text
seg-39b0d6a58d29 = gps-sdr-sim (MIT, commit 28ca29a6, exécuté comme programme séparé par un banc de test versionné), préenregistré f88f2969 avec un seuil exact au bit sur (A) les chips C/A, (B) chaque champ LNAV calculé, (C) chaque bit de parité. CONSTAT : (A) { "0" } chip sur { "32 736" } diffère, (C) la parité de { "0" } mot sur { "1 920" } diffère, (B) { "230" } champs calculés sur { "1 152" } diffèrent d'une unité : l'eph2sbf de gps-sdr-sim tronque vers zéro avec des conversions C là où l'entier diffusé exige un arrondi (toute valeur divergente se trouve à moins de { "0.01" } d'une unité de l'entier arrondi de Kshana). Reste MODELLED : le seuil enregistré était la conjonction

# text
seg-325900ed59ea = Géométrie des signaux d'une scène IQ GNSS face à un générateur de bande de base indépendant

# text
seg-ee5625b30ff2 = La vérité par satellite du générateur de scène IQ pour une scène GPS L1 C/A à éphéméride diffusée (iq::scene : une SatGeometry à éphéméride diffusée, générée en enregistrements de vérité TruthRecord) : quels satellites sont au-dessus de l'horizon, la pseudodistance, la phase de code au premier échantillon, le Doppler de porteuse et les angles de visée, pour un récepteur statique, comparée à l'état de canal à partir duquel gps-sdr-sim construit le premier bloc de sa propre sortie I/Q, pour la même éphéméride, le même récepteur et la même heure de départ (ionosphère désactivée des deux côtés)

# text
seg-59c06411d647 = gps-sdr-sim (T. Ebinuma, MIT, commit 28ca29a6), un générateur de bande de base GPS L1 C/A indépendant, construit avec son propre Makefile et exécuté comme programme séparé sur son brdc0010.22n fourni, au lieu d'exemple de son texte d'usage (scripts/gen_iq_gpssdrsim_ref.sh) ; un banc de test versionné, lié à la même version, imprime l'état de canal (computeRange, computeCodePhase) à l'origine du premier bloc du programme. Seuils fixés avant l'exécution du générateur (préenregistré 7777da53). Périmètre : géométrie GPS L1 C/A pour un récepteur statique sans ionosphère, troposphère ni horloge de récepteur ; les modèles de canal, le bruit et le contenu des données de navigation de la scène ne font pas partie de cette ligne

# text
seg-bf429c8f00fb = Acquisition IQ GNSS sur des échantillons I/Q générés de façon indépendante

# text
seg-9a0c52bfb06e = iq::acq::acquire (recherche parallèle de phase de code par FFT avec le seuil de Marcum-Q à loi quadratique) avec la réplique GpsL1Ca, sur { "20" } ms de la propre sortie I/Q 8 bits de gps-sdr-sim décodée par le décodeur d'échantillons iq::io (ci8, { "2.6" } MHz, { "11" } satellites, sans bruit) : chaque PRN de { "1" } à { "32" } recherché dans deux fenêtres de { "10" } ms, le résultat comparé à la phase de code et au Doppler modulés par gps-sdr-sim

# text
seg-fb96290003e1 = Échantillons I/Q de gps-sdr-sim (MIT, commit 28ca29a6) et son propre état de canal, préenregistré 7777da53 : (B1) chaque PRN simulé acquis, (B2) aucun autre PRN acquis, (B3) phase de code à { "0.5" } chip près, (B4) Doppler à { "125" } Hz près. CONSTAT : B1, B3 et B4 tiennent dans les deux fenêtres (au pire { "0.195" } chip, { "72" } Hz), mais B2 échoue : les { "21" } PRN que gps-sdr-sim n'a pas simulés franchissent aussi le seuil (statistique de { "151" } à { "206" } contre { "79.5" } ; PRN simulés { "1 300" } et plus). Le seuil est fixé pour un bruit gaussien de la puissance d'échantillon mesurée ; gps-sdr-sim n'ajoute aucun bruit, de sorte que les cellules d'un PRN absent contiennent l'intercorrélation des autres satellites. Reste MODELLED : le seuil enregistré était la conjonction

# text
seg-f40dc3dac990 = Moniteurs IQ évalués dans des campagnes de rejeu en laboratoire : détections, non-détections, fausses alarmes et chiffres de fausses alarmes en forme close

# text
seg-93fb3109728c = iq::campaign::detect et l'exécuteur de campagne : une table [monitors] facultative fait tourner les moniteurs IQ sur chaque cellule dans l'unique passe de l'exécuteur. Les moniteurs de puissance et de spectre voient les échantillons après chaque chaîne de front-end ; les moniteurs de C/N0, de SQM et de verrouillage voient les mises à jour de boucle de chaque canal poursuivi. Chaque alarme est évaluée par rapport aux événements indiqués : détecté ou manqué par (événement, type d'alarme, canal), délai de détection, et fausses alarmes hors des événements rapportées à leur exposition. Le chiffre de fausses alarmes en forme close de chaque test est indiqué : puissance par bloc (queue Gamma exacte), excès spectral par bloc (approximation), kurtosis (gaussienne unilatérale), impulsions (plafond binomial), SQM par mise à jour moyennée (2Q(k) = Q(1/2, k^2/2), nouveau), et ARL0 du CUSUM de C/N0 (Siegmund). Sans la table, les cellules, les clés et les empreintes sont inchangées. Aucune forme d'onde d'interférence n'est synthétisée

# text
seg-4c4fff313585 = Les formes closes propres aux moniteurs sur les propres scènes GPS L1 C/A de Kshana (bruit et signaux légitimes ; événements d'atténuation des propres signaux des satellites), face à des seuils préenregistrés dans docs/design/MONITORS-IN-CAMPAIGN.md (382ab2f4). CONSTAT : M1, M2 et M4 atteints. M3 atteint sur la détection ({ "18" } atténuations sur { "18" }, P_md { "0" }) et NOT MET sur sa clause de délai : le délai médian de détection est de { "1.001" } s contre { "2" } x ARL1 échantillons = { "0.433" } s. Le CUSUM voit une estimation par fenêtre de { "1" } s, de sorte que la borne en nombre d'échantillons est inférieure à un échantillon. Cohérence interne seulement : aucun récepteur réel ni brouillage enregistré n'est vérifié

# text
seg-5b7eb7ddb474 = ROC de détection des moniteurs IQ issue d'une campagne de rejeu en laboratoire évaluée

# text
seg-57fe85965c9c = iq::campaign::detect (windows, roc) et iq::campaign::report::rocs : chaque cellule d'une campagne avec moniteurs conserve, par type d'alarme et par canal, le maximum de la propre statistique de test du moniteur sur chaque fenêtre d'événement indiquée (positif) et sur des fenêtres roc_window_s juxtaposées hors des événements (négatif). Les statistiques sont l'écart de puissance de bloc, l'excès de DSP, le kurtosis z, le |z| SQM de la métrique moyennée, et le CUSUM de C/N0. Le rapport les regroupe par type dans une ROC empirique au niveau des fenêtres, avec son AUC et le point de fonctionnement au seuil configuré, écrite dans roc.json (kshana.campaign-roc/1) et une section ROC de détection de report.html. Une campagne sans moniteurs n'écrit ni l'un ni l'autre

# text
seg-e882dd678998 = Campagnes synthétiques à partir des propres scènes GPS L1 C/A de Kshana (atténuations des propres signaux des satellites), face à des seuils préenregistrés dans docs/design/DETECTION-ROC.md (b47e358d). CONSTAT : R2 atteint (niveau du hasard sans rien à détecter). R1 NOT MET : AUC de cn0_drop { "0.7855" } contre { "0.95" }, parce que chaque fenêtre négative suivant un événement hérite de la décroissance du CUSUM issue de la détection (les { "18" } négatifs postérieurs à l'événement atteignent tous { "81" } ou plus ; les { "18" } antérieurs à l'événement restent tous à { "0" }). Cohérence interne seulement : aucun récepteur réel ni brouillage enregistré n'est vérifié

# text
seg-3a3cfa322f01 = Étalonnage des modèles de C/N0 et de verrouillage du récepteur ouvert sur les résultats de campagnes IQ, avec erreur de prédiction indiquée

# text
# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) et <c1/> sur <c2/>, le <c3/> Python et l'outil MCP labfit (dossiers de campagne à l'intérieur de son seul répertoire de travail) : lit un dossier de sortie <c4/> par son DIGEST et regroupe les cellules évaluées en unités d'ajustement (signal x conception de boucle x chaîne de front-end x type de brouilleur, jamais regroupées). Par unité, il ajuste le C/N0 mesuré en fonction du J/S indiqué avec la forme de séparation spectrale. Q_eff n'est pas identifiable à partir des données de C/N0 sans une mesure indépendante des puissances du brouilleur et du signal, de sorte que Q est indiqué, jamais ajusté (le tableau des types, le q de l'événement, ou, pour un type inconnu, la valeur indiquée la plus défavorable, cw Q = { "1" }). Le paramètre ajusté est le décalage identifiable delta_eff = delta - { "10" } log10 Q, la garde de corrélation signalant la dégénérescence. Les classes de C/N0 verrouillées à moins de { "90" } % sont censurées et listées. Le J/S de seuil est donné directement et par la forme close ; les modèles de boucle de poursuite et de verrouillage empirique sont couplés par le modèle de C/N0, avec des durées de décrochage et de reverrouillage. Un bootstrap par grappes à graine fixée sur les enregistrements ({ "1000" } réplicats) donne des intervalles percentiles ; les intervalles de prédiction à { "90" } % viennent de tirages des résidus ; les jeux réservés par exclusion d'un enregistrement à la fois sont répartis en interpolation et extrapolation ; une table [validation] préenregistrée est hachée et chaque seuil est jugé PASS/FAIL. Rapport kshana.labfit-iq/1 en JSON, CSV et Markdown généré, avec un bloc d'unités. Synthétique seulement (aucun enregistrement tiers, aucune forme d'onde de brouilleur). Le chemin labfit à partir du journal du récepteur est inchangé

# text
seg-f9abecb1eea6 = Récupération synthétique de paramètres sur les propres scènes GPS L1 C/A de Kshana avec un profil de C/N0 connu imposé à partir de la formule de la section { "3.1" }, poursuivi et évalué par kshana iq campaign, face à des seuils préenregistrés dans docs/design/LABFIT-FROM-IQ.md (section { "5.1" }, amendée le 2026-10-12 dans b7117bf, section { "13" }). L'estimateur de C/N0 des campagnes (M2M4) a été fixé dans 5b13e3c2, poussé avant la première évaluation d'un seuil (commité avec le code d'ajustement, et non seul), après une exécution de poursuite de diagnostic divulguée. CONSTAT sur la campagne à 18 événements : (c) PASS ; (a') NOT MET, erreur sur delta_eff de -1.097 dB contre { "0.5" } dB (encore -0.89 dB sur les classes à { "38" } dB-Hz et plus) ; (b') NOT MET, { "0" } campagne sur { "50" } couvre la vérité (erreur -1.189 +/- { "0.093" } dB, intervalle d'environ { "0.3" } dB) ; (d) NOT MET, forme close à { "2.20" } dB sous le J/S direct à la perte, environ la durée de décrochage ajustée multipliée par la vitesse de rampe ({ "2.09" } dB) ; les clauses Q d'origine de (a) et (b) sont NOT MET parce que Q n'est pas identifiable. SUIVI (seuils préenregistrés dans 1e532f84, docs/design/evidence/labfit-followup/RESULTS.md) : sur une campagne à J/S par paliers, delta_eff est retrouvé à +{ "0.185" } dB près (S1 MET : l'erreur de rampe est un retard de l'estimateur) ; (d) tel qu'écrit y est satisfait par le modèle de boucle de poursuite ({ "0.45" } dB) mais pas par le modèle empirique ({ "6.42" } dB), de sorte que S2 est NOT MET ; sur une nouvelle campagne à rampe, (d) avec les durées de décrochage ajustées multipliées par la vitesse de rampe de chaque événement est à { "1" } dB près pour les deux modèles (R1 MET), et (a') et (d) tels qu'écrits sont de nouveau manqués (-1.25 dB ; { "2.32" } et { "9.47" } dB). La méthode est vérifiée, et non un récepteur : elle ne peut pas être VALIDATED à partir de données synthétiques

# text
seg-9537d301c95e = Encodage GPS LNAV décodé par une bibliothèque de récepteur indépendante

# text
seg-909415621881 = Les sous-trames LNAV 1-3 de Kshana (gps_lnav::encode_subframes) pour les { "32" } éphémérides brdc0010.22n fournies à decode_word et decode_frame de RTKLIB : parité de chaque mot, décodage des sous-trames avec émission cohérente des données, et chaque paramètre décodé comparé à l'entier de Kshana et à la valeur d'entrée

# text
seg-9b21219e9572 = RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) decode_word/decode_frame comme programme séparé, préenregistré ca5f0142 : R1 parité et décodage, R2 valeur décodée égale à l'entier de Kshana multiplié par l'échelle d'IS-GPS-200 à { "2" }^-52 relatif près, R3 à un demi-quantum près de la valeur d'entrée. CONSTAT : R1 { "960" } mots sur { "960" } et { "96" } sous-trames sur { "96" } ; R3 chaque paramètre, semaine et temps de référence exacts ; R2 échoue sur { "41" } valeurs (af1, delta-n, IDOT) de { "1" } à { "4" } unités de la dernière décimale parce que le P2_43 de RTKLIB est le décimal { "1.136868377216160E-13" }, soit { "2.6e-16" } en relatif de { "2" }^-43 ; la division par la constante de RTKLIB redonne l'entier de Kshana dans tous les cas. Reste MODELLED : le seuil R2 enregistré était trop serré pour la propre constante de la référence indépendante

# text
seg-f66855e35c53 = Encodage du message de navigation GPS LNAV

# text
seg-8caf8366e2f8 = Sous-trames LNAV 1-3 d'IS-GPS-200 (gps_lnav::encode_subframes : quantification à l'arrondi au plus proche de chaque paramètre d'horloge et d'orbite aux facteurs d'échelle et à la valeur de pi de la spécification, mise en paquets en complément à deux, mots TLM et HOW, parité du tableau 20-XIV avec inversion D29*/D30*, bits de résolution de parité des mots { "2" } et { "10" }), le message qu'émet un générateur de signal GPS L1 C/A

# text
seg-2b71b166b9d5 = RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) readrnx analysant le fichier de diffusion quotidien IGS BRDC00IGS_R_20250610000_01D_MN.rnx et decode_word/decode_frame décodant les mots de Kshana, exécuté comme programme séparé ; préenregistré d4d9eb9d avant la récupération du fichier, seuil d'entier exact. Mutation : tronquer au lieu d'arrondir donne { "235" } échecs. Des comparaisons antérieures du même encodeur sont consignées comme constats : face à gps-sdr-sim, qui tronque ({ "230" } champs), et face aux valeurs mises à l'échelle de RTKLIB, dont la constante décimale { "2" }^-43 a manqué un seuil d'un ulp ({ "41" } valeurs). Post-vérification par l'intégrateur (reste MODELLED) : la comparaison concorde et une mutation de l'ensemble de parité la fait aussi passer au rouge, mais le préenregistrement d4d9eb9d est arrivé sur la branche publique à { "20" }:{ "02" }:{ "29" } UTC, deux secondes après le commit de résultat 1783f904 ({ "20" }:{ "02" }:{ "27" } UTC) qui contient déjà la sortie de RTKLIB pour le fichier, de sorte que l'ordre « enregistré avant la récupération du fichier » ne peut pas être démontré ; un nouvel enregistrement poussé avant la récupération d'un fichier de diffusion non vu trancherait la question

# text
seg-c5c944357643 = Acquisition et estimation du C/N0 sur de l'IQ lunaire réel

# text
seg-f5dcb5e06bf4 = Recherche parallèle de phase de code (acquisition::pcps_acquire : FFT portable, repliement cohérent, accumulation non cohérente, seuil du khi-deux pour une probabilité de fausse alarme sur toute la recherche), affinement, corrélation prompt en boucle ouverte avec Doppler de code et estimateur de C/N0 M2M4, exécutés sur les lots IQ L1 à 4 bits de LuGRE lus par realdata::ion_sdr

# text
seg-c53c795135d6 = GNSS-SDR { "0.0.19" } (GPL-3.0, programme séparé, configuration figée) sur les neuf lots L1 hors surface et le C/N0 RAW du récepteur de vol (LuGRE Mission Data, Zenodo { "16411687" }, CC BY { "4.0" }), préenregistré 768cb62b. CONSTAT : le lecteur de Kshana décode à l'identique les { "288" } plages comparées avec un convertisseur indépendant ; GNSS-SDR déclare { "266" } recherches positives sur { "288" } et Kshana concorde sur les { "266" } décisions, mais seules { "250" } sont localisées sur la cellule de GNSS-SDR (A2 échoue) ; la partie C/N0 est vide, aucune époque RAW de vol ne se situant à moins de { "30" } s d'un lot (la plus proche à { "141" } s). La plupart des positifs sont des artefacts : les niveaux bruts en complément à deux portent une moyenne de -0.5 sur I et Q, une raie à fréquence nulle { "32" } dB au-dessus du bruit dans une classe de { "1" } kHz, que les deux récepteurs acquièrent. Deux lots (OP5, OP12) ont été exclus à tort : une lecture de leurs métadonnées amputée de ses chiffres a été prise pour une contradiction avec leurs en-têtes ; la vraie cause était que le lecteur ne pouvait pas lire un échantillon plus large qu'un mot (corrigé depuis). Reste MODELLED

# text
seg-709626569a5c = Acquisition sur de l'IQ lunaire réel face au Doppler prédit par l'orbite (décision par puissance d'échantillon)

# text
seg-784ebd80c425 = acquisition::pcps_acquire avec sa décision par puissance d'échantillon sur les neuf lots L1 LuGRE hors surface à niveaux mid-rise ; différences de Doppler entre satellites acquis comparées aux différences prédites à partir des orbites finales de l'ESA et de la trajectoire de Blue Ghost reconstruite par Firefly

# text
seg-38b8127db267 = Doppler prédit à partir des orbites finales ESA/ESOC et de la trajectoire reconstruite NAIF CLPS (xval/lugre-predicted-doppler/predict.py, indépendant de Kshana), préenregistré 0d1839d2. CONSTAT : les { "288" } recherches franchissent toutes le seuil sur du bruit (statistiques de puissance d'échantillon d'environ { "430" } à { "520" } contre { "346.3" }), de sorte que P1 tient trivialement et que P3 tient ({ "274" } sur { "288" } prédits visibles) tandis que P2 échoue sur { "4033" } paires sur { "4036" }. Le front-end à bande limitée multiplie le bruit de chaque cellule par environ { "1.46" } (figé : plancher de bruit { "292" } contre { "200" } pour du bruit blanc sur OP2 PRN { "1" }), ce que la statistique de puissance d'échantillon ne voit pas. Reste MODELLED

# text
seg-89875d67b253 = Acquisition sur de l'IQ lunaire réel évaluée par le Doppler prédit par l'orbite

# text
seg-956bcfeaf319 = acquisition::pcps_acquire avec la décision à moyennage de cellules (pic sur la cellule moyenne de la grille, robuste au bruit à bande limitée) sur les neuf lots L1 LuGRE hors surface à niveaux mid-rise ; différences de Doppler entre satellites acquis comparées aux différences prédites à partir des orbites finales de l'ESA et de la trajectoire de Blue Ghost reconstruite par Firefly

# text
seg-f80a751bc49b = Doppler prédit à partir des orbites finales ESA/ESOC et de la trajectoire reconstruite NAIF CLPS (xval/lugre-predicted-doppler/predict.py, indépendant de Kshana), préenregistré a81a9a4e. CONSTAT : P1 et P3 tiennent ({ "4" } lots, { "12" } acquisitions sur { "12" } prédites visibles) mais P2 échoue sur { "8" } paires sur { "8" }. Les deux paires les plus fortes concordent avec la prédiction en grandeur, le signe inversé (OP2 PRN 18/24 : +{ "7670.0" } Hz mesuré, -7693.9 prédit ; OP17 PRN 11/30 : +{ "11155.0" }, -11114.4), de sorte que l'ordre enregistré I dans le quartet bas est le conjugué de celui des lots ; les six détections juste au-dessus du seuil ne concordent avec aucun des deux signes. La dispersion Doppler de l'affinement ({ "30" } à { "50" } Hz entre deux exécutions) a aussi été sous-estimée par l'enregistrement. Reste MODELLED

# text
seg-8fa779dd1788 = Acquisition sur de l'IQ lunaire réel réservé face au Doppler prédit par l'orbite

# text
seg-484868771231 = acquisition::pcps_acquire (décision à moyennage de cellules, probabilité de fausse alarme { "1e-7" }) avec refine_doppler_coherent sur les lots L1 LuGRE enregistrés à la surface lunaire (I dans le quartet haut, niveaux mid-rise) ; différences de Doppler entre satellites acquis face aux différences prédites à partir des orbites finales de l'ESA et du noyau du site d'atterrissage de Firefly

# text
seg-8bfd18bb6478 = Doppler prédit à partir des orbites finales ESA/ESOC et du noyau de site d'atterrissage NAIF CLPS de Firefly (xval/lugre-predicted-doppler/predict_surface.py, indépendant de Kshana), préenregistré 2108e6ff sur des lots jamais ouverts auparavant. CONSTAT : la non-vacuité échoue ; aucun lot ne contient deux acquisitions. OP40 exclu (les métadonnées nomment un fichier manquant) ; OP38, OP73, OP77_0, OP77_1 n'acquièrent rien et ne montrent aucune fausse alarme à { "1e-7" } (statistiques maximales de { "325" } à { "356" } contre { "385.9" }) ; OP74 et OP76 acquièrent le PRN { "31" } et OP78_0 et OP78_1 le PRN { "12" }, chacun seul, tous prédits visibles. Reste MODELLED. Écarts divulgués : le seuil Doppler enregistré de { "10" } Hz repose sur un Monte-Carlo synthétique de l'affinement cohérent, et non sur la dispersion des lots déjà vus que l'intégrateur avait demandée ; OP40 a été exclu avant l'exécution parce que ses métadonnées nomment un fichier d'échantillons que le jeu de données ne fournit pas

# text
seg-758af035b3ce = Géométrie conjointe de communication et de navigation lunaires

# text
seg-11f861bdc6bf = Angles de visée topocentriques par satellite (azimut dans le sens horaire depuis le nord, élévation) et distance oblique en un site sélénographique nommé, le satellite étant donné dans le référentiel lié au corps de la Lune du site (l'affirmation vérifiée). La précision de télémétrie du signal dans l'espace est exposée comme paramètre de scénario, de sorte que le balayage du volume de service produit une EXIGENCE de télémétrie plutôt qu'un verdict réussite/échec pour un sigma fixe ; ce paramètre est une donnée de conception extérieure à l'affirmation vérifiée

# text
seg-eb721568afc7 = ANISE { "0.10.2" } (Nyx Space, MPL-2.0, exécuté comme outil depuis xval/anise-service-geometry, binaire lunar-look-angles-xval, qui n'appelle aucun code de Kshana) : la propre routine d'azimut, d'élévation et de distance d'ANISE (azimuth_elevation_range_sez) à partir de sites construits par son constructeur latitude-longitude-altitude sur la Lune pck00011 (sphère { "1737.4" } km), les satellites étant tournés dans MOON_PA_DE440 par moon_pa_de440_200625.bpc. { "768" } échantillons sur { "8" } sites (les { "4" } sites nommés et { "4" } autres, au-dessus et au-dessous de l'horizon), { "12" } époques et { "8" } satellites concordent à { "1e-6" } deg près en azimut et en élévation et à { "1" } mm près en distance et en position de site (fixé avant la comparaison) ; mesuré { "2.2e-12" } deg, { "2.1e-13" } deg et { "5.6e-9" } m. Affirmation : placement des sites et angles de visée, le satellite étant donné dans le référentiel lié au corps du site. La propre réalisation par Kshana du référentiel lunaire fixe à rotation moyenne et le paramètre de précision de télémétrie en sont exclus ; les tests unitaires de géométrie en forme close demeurent comme vérifications complémentaires

# text
seg-10af60b488b9 = Station de référence différentielle de classe NovaMoon : annulation du mode commun + résidu croissant avec la ligne de base + niveaux de protection DGNSS

# text
seg-96b2627b388a = Identité d'annulation différentielle des erreurs + réutilisation de la mécanique de PL SBAS de DO-229E ; la résolution par simple différence + moindres carrés pondérés est en outre recoupée avec lsq()/matinv() de RTKLIB (Takasu, BSD-2-Clause, C compilé) — code de résolution indépendant, mais la même algèbre de différence de ligne de visée au premier ordre, donc toujours InternalConsistency

# text
seg-c04a3591074c = Export d'interopérabilité lunaire

# text
seg-91f4a066b3c0 = Export de référentiel, de temps et d'éphéméride lunaires aligné sur LunaNet/IOAG (CCSDS OEM + KIF) avec aller-retour de vérification

# text
# c1: oem
seg-f5f8ed69bea7 = L'export OEM lunaire de kshana relu par la bibliothèque tierce indépendante <c1/> (R. J. Anderson) : les jetons de référentiel et de temps et l'état à chaque époque concordent à la précision d'écriture ({ "1" } mm / { "1e-9" } km/s) et un export sans TIME_SYSTEM est rejeté — un aller-retour d'interchange structurel ; la sémantique physique du référentiel et du temps lunaires est vérifiée par leurs propres lignes, de sorte que la ligne reste MODELLED. { "0.30" } comparaison externe, un constat (reste MODELLED) : un second lecteur indépendant, l'analyseur CCSDS OEM d'Orekit { "12.2" } (Apache-2.0, valeurs par défaut strictes), refuse les deux fichiers lunaires parce qu'il n'implémente pas les échelles de temps LTC et TCL (il décode l'OEM EME2000/UTC de la crate, et décode les fichiers lunaires une fois TIME_SYSTEM remplacé par TDB) ; oem { "0.4.5" } les décode à la seule précision écrite, en se rabattant sur l'échelle de temps non prise en charge. L'échange de ces fichiers lunaires avec les lecteurs CCSDS courants n'est pas établi

# text
seg-8ab65cbefb75 = Notation alignée sur des cadres de résilience PNT

# text
seg-c48198f31d63 = Sous-scores par dimension sur les sept catégories de résilience propres à Kshana (et non les termes du DHS), les fonctions RDRR de RethinkPNT et les critères de Yang, chacun étiqueté modélisé avec son facteur déterminant ; niveau RPCF provisoire avec une porte de dégradation bornée. Auto-évaluation issue de la simulation, jamais une certification.

# text
seg-f905aeb203bb = Formules par métrique dérivées à la main : diversité de Simpson inverse, composite en moyenne pondérée, durées de chronologie bornées/non bornées, échelle de niveaux du maillon le plus faible

# text
seg-d7bdb6fe186e = Étude d'instabilité de décision du score de résilience

# text
seg-5fcf18a68bb1 = Quantifie comment un score composite unique / un niveau RPCF réordonne les architectures sous un simplexe de pondération défendable et un ensemble de menaces (taux d'inversion du top-1, dispersion du tau de Kendall, taux d'inversion de niveau, plages de rangs) ; analyses déclaré-contre-mesuré et d'effondrement de la diversité.

# text
seg-b6bf76a752a0 = Identités de statistiques de rang en forme close (tau dans [-1,{ "1" }] avec des valeurs calculées à la main ; Dirichlet déterministe à graine fixée) et témoins construits stables/instables

# text
seg-1bf03544a010 = Représentativité de la démonstration et écarts avant le vol

# text
seg-db24d16d38c9 = Registre d'honnêteté par résultat qualifiant une sortie de démonstration : ses ancrages externes, ses hypothèses modélisées, ses écarts avant le vol et sa fourchette TRL représentative, avec des invariants imposés (validé exige un ancrage externe ; modélisé exige un écart et ne peut pas prétendre au-delà du TRL { "4" }).

# text
seg-81d3adb239c5 = Invariants en forme close correspondant à la discipline de compliance « représentativité justifiée + écarts avant le vol identifiés » ; liés à la frontière entre statut de vérification et type de référence indépendante

# text
seg-52ab936eb5f5 = Preuves de compromis quantique contre classique (forme commune)

# text
seg-a6679ed5bed7 = Un objet TradeEvidence reproductible (cadre fixe : scénario+graine+moteur ; valeurs quantique-contre-classique communes par FoM, avec un bénéfice à la polarité correcte, un IC à { "95" } % facultatif, une étiquette validé/modélisé) portant un enregistrement de représentativité, de sorte que chaque filière quantique-PNT rapporte le compromis de la même façon honnête.

# text
seg-70da3e15ea8b = Identités de bénéfice/gagnant en forme close + enveloppe fidèle du quantum_trade::TradeResult existant ; honnêteté liée au registre de représentativité et aux étiquettes de vérification

# text
seg-20fee61b3107 = Bibliothèque de modèles d'erreur de dispositifs quantiques

# text
seg-e42eabe9bc2a = Fiches de dispositifs (horloges optique/à ions piégés/à ions mercure + horloges classiques réutilisées de holdover/clock_state ; interféromètre à atomes froids ; liaisons de transfert de temps classique + à intrication/photon unique), chacune portant un enregistrement de représentativité ; la liaison à intrication ajoute un modèle de précision temporelle limitée par le bruit de grenaille (~gigue/sqrt(R*tau), pénalité de coups d'obscurité, plancher systématique).

# text
seg-632600203e1f = Coefficients d'horloge/CAI réutilisés (holdover/clock_state, valeurs publiées) + identités de bruit de grenaille et de pertes en forme close pour la liaison à intrication

# text
seg-86d71fd89f26 = Temps quantique de confiance (transfert de temps + diffusion sécurisée + anomalie)

# text
seg-d2a3d37825ef = Chaîne de transfert de temps quantique contre classique de bout en bout (marche libre de l'horloge + précision de liaison en quadrature), un niveau de protection de synchronisation réutilisé, une FoM de sécurité contre les attaques par retard/rejeu (1-P_md) et une probabilité de détection d'anomalie d'horloge + latence CUSUM, émis comme TradeEvidence honnête avec un enregistrement de représentativité.

# text
seg-ac95d112a17a = Budget en quadrature en forme close sur des noyaux validés réutilisés (ADEV face à Stable32/NIST ; borne TPL ; détection analytic_pd/pmd) ; honnêteté liée au registre de représentativité

# text
seg-eaf341ff4522 = Navigation quantique sans GNSS

# text
seg-908a44a9f7c7 = Navigation à l'estime quantique (interféromètre à atomes froids) contre INS classique de qualité navigation lors d'une panne GNSS : croissance de l'erreur de position, holdover jusqu'à un seuil de position, et compromis quantique-contre-classique comme TradeEvidence honnête ; note d'observabilité honnête (biais inobservable sans point fixe, donc l'erreur croît).

# text
seg-508f2c8884e2 = Budgets inertiels réutilisés recoupés avec une double intégration Octave indépendante de la même EDO d'estime (autre environnement d'exécution, modèle partagé → ReferenceImpl) plus le bruit à court terme publié de Freier-2016 comme ancrage unilatéral ; le composite quantique-contre-classique reste MODELLED

# text
seg-914132833f5a = Détection de défauts/anomalies pour les systèmes PNT quantiques

# text
seg-f20392820b9d = Catalogue de défauts quantiques étiquetés (horloge : saut de fréquence/dérive/perte de verrouillage ; capteur : saut de biais/perte de données), une AUC ROC de la statistique de détection avec un IC par bootstrap, et un défaut minimal détectable à un taux de fausses alarmes fixé ; un moniteur assisté par horloge quantique détecte des défauts plus petits qu'un moniteur classique, émis comme TradeEvidence honnête.

# text
seg-a689ab2ebb84 = AUC gaussienne en forme close = Phi(mu/(sigma*sqrt2)) recoupée avec eval_stats::bootstrap_auc_ci, validé de façon externe (face à scikit-learn) + seuils analytiques de détection

# text
seg-0633e05d393f = Dynamique d'attitude d'un corps rigide sans couple

# text
seg-23f43007bcbf = Équations d'Euler du mouvement de rotation (I ω̇ = τ − ω × Iω, axes principaux et tenseur d'inertie général) couplées à la cinématique d'attitude par quaternion (q̇ = ½ q ⊗ ω) et propagées avec un intégrateur RK4 à pas fixe qui renormalise le quaternion à chaque pas

# text
seg-2d21a01ea132 = Propagation de corps rigide du moyeu d'engin spatial de Basilisk { "2.9.1" } (AVSLab, ISC ; attitude MRP par ses propres équations couplées du moyeu, svIntegratorRKF78 à tolérance relative { "1e-12" }), une implémentation indépendante des équations du corps rigide sans couple : le quaternion RK4 de Kshana (dt { "0.01" } s) et les vitesses angulaires du corps concordent à { "1e-9" } près sur { "1e4" } s pour deux inerties générales non diagonales (au pire { "3.3e-11" } et { "3.4e-12" } rad/s) ; tolérance fixée avant la comparaison. Affirmation vérifiée : mouvement sans couple ; le terme de couple externe n'est pas comparé. Les vérifications de lois de conservation et de toupie symétrique demeurent comme autocohérence complémentaire. Aucun environnement de corps flexible / boucle de commande / couple externe

# text
seg-93b8ba1ba0e5 = Dynamique de mouvement relatif de Clohessy–Wiltshire / Hill

# text
seg-17f27a95d009 = Mouvement relatif d'un chasseur autour d'une cible sur une orbite de référence circulaire dans le référentiel LVLH : les équations linéarisées de Clohessy–Wiltshire (ẍ−2nẏ−3n²x={ "0" }, ÿ+2nẋ={ "0" }, z̈+n²z={ "0" }) résolues par la matrice de transition d'état en forme close { "6" }×{ "6" } Φ(n,t) (Clohessy–Wiltshire { "1960" } ; Vallado Alg. { "48" }) avec la condition d'orbite relative bornée ẏ₀=−2n·x₀, et une correction du second ordre en forme close (cw_dynamics::second_order_correction, la réponse CW aux termes quadratiques des équations exactes à chef circulaire ; Karlgaard et Lutze { "2003" }, Newman, Lovell et Pratt { "2015" }) composée en cw_dynamics::propagate_second_order. La sortie vérifiée est propagate_second_order ; la seule Φ linéaire est caractérisée par rapport à la vérité non linéaire, non vérifiée

# text
seg-29adc2d68a7b = Orekit { "12.2" } (Apache-2.0) NumericalPropagator, deux corps, LOFType.QSW, exécuté comme programme séparé (montage inchangé depuis le tour { "1" }). Seuil préenregistré { "1e-3" } m sur chaque échantillon de chaque cas ; la correction du moteur au second ordre a été réexécutée face à lui sans changement (amendement 8c8e768d, écrit avant l'existence du propagateur, divulguant que les écarts du premier ordre étaient connus). propagate_second_order concorde à { "1.15e-7" } m près (C1), { "9.8e-8" }, { "5.4e-8" } et { "2.2e-8" } m ; diviser par deux le terme du second ordre échoue à { "1.85e-3" } à { "3.14e-3" } m. La seule Φ linéaire s'écarte de la vérité non linéaire de { "1.2" } à { "6.3" } mm à { "100" } m sur un tiers d'orbite (le terme du second ordre omis ; son test strict est maintenu ignoré), elle est donc caractérisée, non vérifiée. Vérifications internes conservées : Φ face à une intégration RK4 des équations de Hill, Φ(t)Φ(−t)=I, les identités d'orbite bornée et de dérive −12π·x₀, et la mise à l'échelle du résidu du troisième ordre du terme du second ordre. Périmètre : chef circulaire, séparations voisines de { "100" } m, jusqu'à un tiers d'orbite ; pas d'excentricité (Tschauner–Hempel), de J2 ni de termes de traînée différentielle ; hypothèse de petite séparation

# text
seg-d31be81dfd8f = Géolocalisation passive d'émetteur par TDOA/FDOA

# text
seg-aa870cee16f6 = Localiser un émetteur (brouilleur/leurreur, ou source opportuniste pour du PNT inversé) à partir de la différence de temps d'arrivée sur un réseau de récepteurs — l'intersection d'hyperboloïdes τᵢ=(Rᵢ−R₀)/c résolue par moindres carrés de Gauss–Newton — et, en ajoutant la différence de fréquence d'arrivée (différences de vitesse radiale) avec des récepteurs mobiles, retrouver conjointement position et vitesse ; avec la borne inférieure de Cramér–Rao sur la covariance de position à partir de la géométrie des mesures

# text
seg-17b45796fd43 = Autocohérence de l'estimateur et de la géométrie : allers-retours direct→inverse, identité de Fisher/CRLB J·CRLB=I, monotonie du GDOP, et estimateur atteignant sa propre borne de Cramér–Rao sous bruit Monte-Carlo — vérifications de cohérence interne, PAS un jeu de données externe, donc la ligne reste InternalConsistency. Géolocalisation passive MODELLED — modèle de ligne de visée à source ponctuelle ; ni trajets multiples / NLOS, ni biais d'horloge de récepteur, ni termes de réfraction atmosphérique. { "0.30" } tour { "2" }, face à Ho et Chan { "1993" } et Ho et Xu { "2004" } (préenregistré f89018b8, { "1" } % de chaque valeur imprimée), un constat (reste MODELLED) : la borne TDOA contrainte à la surface reproduit les facteurs géométriques à { "40" } N (-0.11 %, -0.02 %) et le TDOA maximal ; la borne conjointe TDOA+FDOA reproduit la Fig. { "6" } (+{ "0.06" } %, -0.17 %) et, à la source que le code propre des auteurs nomme pour la Fig. { "7" } (amendement écrit après avoir vu ce résultat, divulgué), la Fig. { "7" } (+{ "0.11" } %, -0.02 %) ; elle égale le code publié des auteurs pour la borne (style BSD, exécuté sous GNU Octave) à { "3e-12" } près ; le solveur du maximum de vraisemblance pondéré par la covariance atteint la borne imprimée (+{ "0.3" } à +{ "0.4" } %). Les facteurs d'Ottawa que l'article imprime à partir d'un Monte-Carlo ({ "251" }, { "7.1" }) diffèrent de +{ "1.3" } % et +{ "4.4" } %, hors du seuil de { "1" } %

# text
seg-36b74b49f82f = Décélération maximale d'une entrée balistique à 3 DDL face au nominal publié de Stardust

# text
# c1: entry-heating
seg-a05ca2fde6fc = Une entrée de point matériel à 3 DDL au-dessus d'une Terre sphérique en rotation à travers l'atmosphère standard américaine { "1976" }, intégrée par RK4 à partir d'un état d'entrée inertiel, donnant la décélération maximale et son altitude ; l'état d'entrée relatif à la planète est déduit de l'état inertiel. Exécutable comme type de scénario <c1/>.

# text
seg-5ab7065c0803 = Le nominal de Stardust de Desai, Mitcheltree et Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }) : décélération maximale { "33.4" } g à partir de { "12.6" } km/s relatifs à la planète avec la masse au lancement de { "45.8" } kg, une trajectoire POST à 6 DDL avec la base de données aérodynamiques complète ; interface d'entrée d'après Desai, Lyons, Tooley et Kangas (NTRS { "20090004445" }) : rayon { "6503.14" } km, { "12.9" } km/s inertiels à -8.2 deg. Seuils préenregistrés dans xval/entry-stardust/PREREGISTRATION.md avant toute exécution sur ces entrées ; les deux ont été tenus à la première exécution. CE QUI NE L'EST PAS : un seul cas publié et une seule grandeur (la décélération maximale, qui dans l'approximation balistique ne dépend pas du coefficient balistique) ; la latitude et le cap d'entrée sont supposés ; l'échauffement, la charge thermique et le point d'atterrissage ne sont pas vérifiés par rapport à lui ; point matériel à C_D constant, et non 6 DDL.

# text
seg-5bd3882531b6 = Échauffement convectif d'entrée au point d'arrêt (Sutton-Graves) sur une entrée à 3 DDL

# text
seg-4f97036ed72f = Flux thermique convectif au point d'arrêt q = k sqrt(rho/R_n) V^{ "3" } avec les constantes de Sutton-Graves pour l'air terrestre et l'atmosphère de Mars (NASA TR R-376, { "1971" }), son maximum et la charge thermique intégrée le long d'une entrée à 3 DDL, balistique ou portante à inclinaison constante, sur Terre ou sur Mars.

# text
seg-5a203ecfeaee = Cohérence interne : la relation et les constantes telles qu'imprimées dans NASA TR R-376, une vérification de convergence à demi-pas, et l'ordre attendu des maxima d'échauffement et de décélération. CE QUI NE L'EST PAS : aucune valeur d'échauffement publiée n'a été comparée (les articles Stardust donnent une limite de conception et une estimation convective plus radiative d'environ { "1200" } W/cm2, qu'une relation purement convective ne peut pas égaler) ; ni échauffement radiatif, ni correction de température de paroi ou de catalycité, ni réponse de la protection thermique.

# text
seg-1b96577665fc = Radiométrie d'imageur électro-optique, FTM, réponse de bord relative et NIIRS GIQE { "4" }

# text
# c1: eo-radiometry
seg-38902593e841 = Budget de rapport signal sur bruit d'un imageur au nadir (luminance de scène lambertienne, équation de la caméra, bruits de grenaille, d'obscurité, de lecture et de quantification), la FTM du système à Nyquist comme produit de la diffraction d'ouverture non obstruée, de l'ouverture du détecteur, du filé linéaire et de la gigue gaussienne, la réponse de bord et la réponse de bord relative intégrées à partir de cette FTM, Q = lambda F / p, et la NIIRS GIQE version { "4" } sans compensation de FTM. Exécutable comme type de scénario <c1/>.

# text
seg-bb3a01edc95d = Formes closes : la FTM de diffraction à la moitié de la coupure, le bord en rampe d'un pixel d'une ouverture de détecteur pure (RER { "1" }), le bord en fonction de répartition normale d'un flou gaussien (RER = erf(0.5/(sigma sqrt { "2" }))), la loi d'échelle du bruit de grenaille, et les coefficients GIQE { "4" } tels que publiés (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). CE QUI NE L'EST PAS : aucun imageur externe, aucune FTM mesurée ni aucune image notée n'a été comparé ; la GIQE est une régression empirique avec sa propre erreur ; ni lumière parasite, ni FTM atmosphérique, ni compensation de FTM, ni repliement.

# text
seg-07ca77a67207 = Pertes de gravité, de traînée, de pilotage et de contre-pression à l'ascension d'un lanceur

# text
# c1: ascent-losses
seg-7a1802cf2c80 = Ascension plane en virage gravitationnel d'un véhicule multi-étage au-dessus d'une Terre sphérique non tournante à travers l'atmosphère standard américaine { "1976" } (densité et pression), avec un coup de tangage, une poussée réduite par la contre-pression à la tuyère, des extinctions d'étage aux limites exactes de pas, et les pertes de gravité, de traînée, de pilotage et de contre-pression intégrées à côté de l'état. Exécutable comme type de scénario <c1/>.

# text
seg-174ed29adbbe = Cohérence interne : l'identité exacte vitesse à l'extinction = somme Isp g0 ln(m0/mf) moins les quatre pertes intégrées (résidu inférieur à { "1e-6" } m/s), l'équation de Tsiolkovski sur une combustion verticale dans le vide où la gravité est la seule perte, et les pressions US76 au niveau de la mer et à la tropopause. CE QUI NE L'EST PAS : les pertes d'aucun véhicule publié n'ont été comparées ; ni rotation terrestre, ni phase balistique, ni modulation de poussée, ni guidage au-delà du coup de tangage ; C_D constant ; ce n'est pas un optimiseur de trajectoire.

# text
seg-55e8345def8b = Équation bidirectionnelle TWSTFT, budget d'incertitude et stabilité de liaison avec non-réciprocité de scintillation et diurne

# text
# c1: time-transfer-budget
seg-5ca5226c24ec = L'équation bidirectionnelle TWSTFT résolue pour T_A - T_B avec les retards d'émission et de réception des stations, l'asymétrie ionosphérique montante/descendante en bande Ku, la différence de retard des transpondeurs et les termes de Sagnac, face à son modèle direct exact ; un budget d'incertitude en quadrature avec la TDEV de liaison comme terme de type A ; une série bidirectionnelle avec bruit de phase blanc et de scintillation (Kasdin-Walter), une non-réciprocité diurne et un résidu de réciprocité constant ; et la pente, le RMS résiduel, la TDEV et l'ADEV de séries d'horloge de station fournies au format Circular T, MJD-CSV ou RINEX IGS. Exécutable comme type de scénario <c1/>.

# text
seg-244f7396ac25 = Cohérence interne : le modèle direct et l'équation résolue concordent à { "1e-15" } s, le terme de Sagnac égale la forme en boucle BIPM 2A omega/c^{ "2" } indépendante du module, le terme ionosphérique est { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, et les processus de bruit montrent les allures de TDEV attendues. CE QUI NE L'EST PAS : aucune mesure TWSTFT réelle ni aucun rapport d'étalonnage n'a été comparé ; les retards et incertitudes indiqués sont des entrées, non mesurées ; les stabilités des séries fournies sont rapportées, non vérifiées.

# text
seg-2f9be02c92bc = Numérique de l'atmosphère optique en trajet oblique : variance de Rytov, scintillation, probabilité d'évanouissement gamma-gamma, moyennage d'ouverture, épaisseur optique des nuages et de l'air clair

# text
# c1: optical-atmosphere
seg-032cf76c2ec0 = Cn2 de Hufnagel-Valley intégré le long d'un trajet oblique pour la variance de Rytov en onde plane et sphérique (liaison montante et descendante), l'indice de scintillation d'Andrews-Phillips et les paramètres gamma-gamma, la probabilité d'évanouissement gamma-gamma et la marge d'évanouissement, le facteur de moyennage d'ouverture en turbulence faible, l'épaisseur optique nuageuse d'une colonne d'eau liquide et l'épaisseur optique d'air clair de Kim (visibilité) plus Rayleigh, remplaçant la perte atmosphérique globale du bilan de liaison optique lorsqu'une atmosphère est fournie. Exécutable dans le type de scénario <c1/>.

# text
seg-7ca512adff99 = Le numérique est comparé à un programme indépendant (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } à { "30" } chiffres, quadrature tanh-sinh sur la variable de hauteur d'origine et densités gamma-gamma à Bessel-K) qui ne partage aucun code avec Kshana, selon des seuils fixés avant l'existence de toute implémentation (xval/optical-atmosphere/PREREGISTRATION.md). POURQUOI MODELLED : cette référence indépendante évalue les mêmes formules publiées, elle vérifie donc l'implémentation des formules indiquées et non l'atmosphère ; aucun exemple de validation de l'UIT-R et aucun enregistrement mesuré de scintillation ou d'extinction en trajet oblique n'est utilisé (les valeurs de l'UIT sont une décision de licence ouverte et sont tenues hors du dépôt). Le niveau du profil de Cn2, la visibilité, les hauteurs d'échelle des aérosols et des molécules, la longueur de trajet du moyennage d'ouverture et l'appariement de moments servant à appliquer le moyennage d'ouverture aux paramètres gamma-gamma sont des entrées ou des conventions indiquées. Une ligne de source du module consigne qu'une étude largement recopiée imprime le second exposant de scintillation comme 7/6 là où Andrews et Phillips donnent 5/6 ; la forme en 5/6 est implémentée

# text
seg-a2faab92e760 = Disponibilité d'un site optique au sol dépendant de la météo et diversité de sites corrélée à la distance

# text
# c1: optical-atmosphere
seg-7f4e4e763d62 = Disponibilité d'une liaison optique face à une marge de liaison indiquée à partir d'un climat log-normal d'eau liquide nuageuse (quantité ITU-R P.840, extinction en optique géométrique) et de l'évanouissement de turbulence gamma-gamma indépendant, la marge de liaison nécessaire pour des disponibilités cibles et le plafond qu'aucune marge ne relève, des durées d'indisponibilité log-normales, des scénarios hypothétiques de techniques d'amélioration, et une disponibilité de réseau à copule gaussienne à un facteur dont la corrélation de paire est exp(-distance/longueur de décorrélation). Exécutable comme type de scénario <c1/>.

# text
seg-20eab6e9b925 = Cohérence interne : limites en forme close et monotonie du modèle de diversité, forme close du plafond nuageux, et identités log-normales des indisponibilités. AUCUNE référence indépendante externe n'est revendiquée et aucune n'a été comparée : aucun enregistrement mesuré de disponibilité de station optique au sol ni de ligne de visée sans nuage n'est utilisé. POURQUOI MODELLED : le climat nuageux (probabilité de nuage, médiane et dispersion de la colonne d'eau liquide, durées d'indisponibilité), l'indépendance du nuage et de la turbulence, la forme à copule gaussienne, la longueur de décorrélation et chaque gain de technique sont des hypothèses ; les scénarios fournis indiquent des climats ILLUSTRATIVE, non un jeu de données. Faire évoluer cette ligne exige un enregistrement de disponibilité mesuré et cité et un seuil enregistré avant la comparaison

# text
seg-043ece801e72 = Continuité de synchronisation et de télémétrie lors des coupures optiques

# text
# c1: optical-atmosphere
seg-bb9cb3fe4180 = La distribution des durées de coupure d'un site optique couplée à la variance de marche libre en forme close du modèle de holdover d'horloge : erreur de synchronisation et de télémétrie à des quantiles de coupure indiqués, le holdover jusqu'à un seuil de synchronisation, la fraction des coupures et du temps de coupure qui y reste et la disponibilité de synchronisation A + U E[min(D, T_h)]/E[D], pour les classes d'horloge classique et quantique. Exécutable dans le type de scénario <c1/>.

# text
seg-ab2a33c1b1a4 = Cohérence interne avec le module de holdover, bit pour bit ; AUCUNE référence indépendante externe n'est revendiquée. Les DSP de classe sont les planchers synthétisés à long tau que le module de holdover porte déjà, de sorte que les chiffres héritent de sa réserve indiquée : le holdover jusqu'à un seuil serré est gouverné par le plancher de bruit rouge supposé et non par l'écart d'Allan cité. Les durées de coupure sont un modèle log-normal à paramètres indiqués, non un enregistrement mesuré de durées de nuage

# text
seg-b119df65d2a7 = Marge de liaison optique dans le temps : une réalisation à graine fixée de la météo d'un site

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-06125f3cae90 = Une table <c1/> facultative (durée, pas, graine) fait écrire aussi au type <c2/>, par site, une réalisation à graine fixée du modèle de site indiqué dans le temps : épisodes nuageux (éclaircies exponentielles, coupures nuageuses log-normales de moyenne et dispersion indiquées, la part de temps sous nuage fixée à la probabilité de nuage indiquée), une colonne d'eau liquide log-normale par épisode nuageux, un échantillon de scintillation gamma-gamma par pas, et à partir d'eux la marge de liaison, les évanouissements dus aux nuages et à la scintillation et l'indicateur de liaison active, avec la disponibilité réalisée, la fraction nuageuse, le nombre de coupures et la plus longue coupure. Sans la table, le résultat est le document { "0.37" }. Les tirages passent par les routes portables de distribution et de calcul, de sorte que natif et wasm32 donnent les mêmes octets.

# text
seg-d25e5d2449bd = Cohérence interne seulement ; AUCUNE référence indépendante externe n'est revendiquée et il n'en existe pas pour une réalisation météorologique. Les vérifications comparent un tirage à la sortie statistique du même modèle, de sorte qu'un succès dit que le générateur échantillonne les distributions indiquées (la disponibilité et la part nuageuse du tirage se situent dans des tolérances préenregistrées des chiffres indiqués), non qu'un site réel se comporte ainsi. La série est une réalisation, non le climat : sa disponibilité diffère de celle indiquée de l'erreur d'échantillonnage du tirage, et les échantillons de scintillation à des pas différents sont indépendants, une simplification indiquée d'un processus qui se décorrèle en quelques millisecondes. Les entrées météorologiques restent des hypothèses du scénario.

# text
seg-58cbf576c959 = Lecteur de fichiers de données d'orbite TRK-2-18 et modèle Doppler à rampe à 2 voies pour Mars

# text
seg-d1055650a77f = Un lecteur de fichiers de données d'orbite DSN (TRK-2-18) : les groupes d'enregistrements de 36 octets (étiquette de fichier, identifiant, données d'orbite, rampes par station, décalages d'horloge, résumé, fin de fichier), et dans chaque enregistrement de données d'orbite l'étiquette de temps depuis { "1950" }, les retards descendants et montants, l'observable, les stations, le type de données, les bandes, la validité, le canal, l'engin spatial, la fréquence de référence sur 46 bits et le temps de compression ; heures de début et de fin, taux et fréquences de départ des rampes. Par-dessus, un modèle Doppler à rampe à 2 voies en bande X (rampes montantes intégrées, temps de lumière aller-retour avec Shapiro et troposphère, stations DSN par la chaîne CIO IAU 2006/2000A et les EOP de l'IERS, temps de station) et une détermination d'orbite par lots d'un orbiteur martien (champ GMM-3, tiers corps, SRP, traînée).

# text
seg-6d533149f6f0 = L'étiquette PDS3 que le processus de conditionnement des données de navigation du DSN a produite avec le fichier (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), vérifiée face à des seuils préenregistrés dans xval/mro-odf/PREREGISTRATION.md avant l'existence du lecteur. MODELLED parce qu'un seuil enregistré (les lignes du tableau de fin de fichier, { "121" } dans le fichier contre { "120" } dans l'étiquette) n'a pas été atteint ; l'étiquette est incohérente en elle-même à cet endroit. Étape { "2" } (xval/mro-od/PREREGISTRATION.md, amendements A1 et A2 avant le résultat évalué) : le Doppler prédit à partir de la reconstruction de l'équipe de navigation MRO (mro_psp5, NAIF) concorde avec le Doppler à rampe à 2 voies observé à { "12.5" } mHz près sur des passes non utilisées au développement, seuil atteint ; la détermination d'orbite enregistrée a échoué sur l'arc évalué (matrice normale non définie positive) et n'a produit aucune orbite, de sorte que les seuils d'orbite n'ont pas été atteints. L'exécution { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, un estimateur amorti, le même arc et les mêmes seuils, un amendement d'évaluation R2-A1 divulgué dans docs/revisions) a convergé : l'orbite estimée est à { "0.36" } km RMS ({ "0.53" } km au maximum) de la reconstruction, seuils atteints, mais le RMS Doppler post-ajustement est de { "48.6" } mHz contre le seuil de { "30" } mHz, non atteint, de sorte que la ligne reste MODELLED. CE QUI NE L'EST PAS : aucune orbite estimée n'a atteint tous les seuils enregistrés ; l'ionosphère, le plasma solaire et la plus grande partie du décalage d'antenne (un décalage radial de { "1.5" } m est ajusté sur la passe de développement) ne sont pas modélisés.

# text
seg-c7d292f14693 = Commande d'attitude en boucle fermée par retour MRP avec roues à réaction

# text
# c1: aocs
seg-f33781b74cc2 = Commande d'attitude à pointage inertiel d'un moyeu rigide avec trois roues à réaction équilibrées ou plus : la loi de retour MRP L_r = -K sigma_BR - P omega_BR (Schaub et Junkins), couples moteur de roue de norme minimale G_s u = -L_r écrêtés à la limite de chaque roue, la dynamique couplée du moyeu et des roues avec l'inertie du moyeu portant l'inertie de rotation propre des roues, cinématique par quaternion, RK4 avec maintien d'ordre zéro. Exécutable comme type de scénario <c1/> (boucle sur l'état vrai).

# text
seg-9563d5843891 = Basilisk { "2.9.1" } (AVSLab, ISC ; l'exécution bsk des roues comme outil séparé, jamais lié ni intégré) : moyeu d'engin spatial, reactionWheelStateEffector (BalancedWheels, limite de couple activée), simpleNav, inertial3D, attTrackingError, mrpFeedback (sans terme intégral) et rwMotorTorque à dt = { "0.1" } s avec son RK4, face à la propre implémentation de Kshana sur trois cas (trois roues orthogonales ; une pyramide de quatre roues ; un cas de quatre roues saturant), seuils préenregistrés dans xval/aocs-basilisk/PREREGISTRATION.md avant le code et l'exécution. Tous les seuils ont été tenus à la première exécution. CE QUI NE L'EST PAS : le bruit de capteur dans la boucle, le retour intégral, le guidage de poursuite, le frottement des roues, la gigue, les limites de vitesse et la puissance, les gains d'un engin spatial réel quelconque ; la comparaison vérifie l'implémentation de la loi et de la dynamique face à une implémentation indépendante, non un contrôleur de vol.

# text
seg-455dc946c965 = Estimation d'attitude par EKF multiplicatif à partir d'un gyroscope et d'un viseur d'étoiles

# text
# c1: aocs
seg-553d043438b4 = L'EKF multiplicatif de Lefferts-Markley-Shuster : états d'erreur d'attitude dans le repère du corps et de biais du gyroscope, propagation avec la vitesse du gyroscope moins l'estimation du biais et le bruit de processus discret de Farrenkopf (marche aléatoire d'angle et de vitesse), mises à jour du viseur d'étoiles avec le résidu { "2" } vec(q^-1 q_st) sous forme de Joseph, et la réinitialisation multiplicative ; un simulateur discret de Farrenkopf du gyroscope et du viseur d'étoiles. Le type <c1/> peut fermer la boucle de commande sur son estimation.

# text
seg-846cb1eeb35c = Cohérence interne : l'erreur d'estimation normalisée au carré du filtre face à une vérité simulée à partir des mêmes modèles de capteurs sur des graines Monte-Carlo, et la convergence des estimations d'attitude et de biais. CE QUI NE L'EST PAS : aucun estimateur externe ni donnée de vol n'a été comparé (Basilisk { "2.9.1" } n'a pas de module MEKF) ; les modèles de capteurs sont ceux des manuels, sans désalignement, facteur d'échelle ni effets de champ de vue du viseur d'étoiles.

# text
seg-059732bda693 = Détermination d'attitude de Wahba/TRIAD/QUEST

# text
seg-3ee6e56d790f = Attitude optimale à trois axes à partir d'observations vectorielles pondérées (directions d'étoile/de soleil/de magnétomètre) : le TRIAD déterministe à deux vecteurs, la q-méthode de Davenport (le minimiseur exact de la perte de Wahba — le quaternion optimal est le vecteur propre de plus grande valeur propre de la matrice de Davenport K de { "4" }×{ "4" }, résolue par une diagonalisation de Jacobi symétrique), et QUEST (racine de Newton/sécante de l'équation caractéristique de K initialisée à Σ poids, puis récupération du quaternion par le vecteur de Gibbs)

# text
seg-9c47484cc9d7 = scipy.spatial.transform.Rotation.align_vectors (SciPy { "1.13" } ; Virtanen et al., Nature Methods { "2020" }) — la solution SVD de Kabsch/Markley du problème de Wahba, un algorithme réellement indépendant (SVD de la matrice de profil d'attitude) et une base de code distincte de la diagonalisation de la K de Davenport / méthode de la racine caractéristique de QUEST de kshana, calculant la MÊME attitude optimale de Wahba définie de façon unique. Sur des ensembles d'observations vectorielles pondérées sans bruit, TRIAD, la q-méthode et QUEST reproduisent la rotation optimale de scipy à moins de { "1e-9" } rad (comparées par l'angle d'erreur d'attitude invariant au signe). L'affirmation statistique Monte-Carlo bruitée « l'optimal bat TRIAD » reste MODELLED (pas de référence indépendante externe) ; observations de vecteurs unitaires de direction ponctuelle seulement — pas de modélisation du champ de vue, du biais ni de la corrélation temporelle des capteurs, et QUEST est singulier à { "180" }° (la q-méthode couvre ce cas)

# text
seg-cd342cc48afc = Statistiques de détection d'acquisition GNSS à loi quadratique

# text
seg-6d97452de33e = Détecteur d'acquisition à loi quadratique (non cohérent) sur une recherche phase de code × Doppler : probabilité de fausse alarme (χ² centré à 2M ddl), le seuil atteignant une P_fa cible (fonction de répartition du χ² inversée par bissection), et la probabilité de détection (χ² non centré de non-centralité 2M·ρ pour un SNR post-corrélation par cellule ρ), avec la fonction Q de Marcum généralisée Q_M(a,b)={ "1" }−F_{ "{" }χ'²(2M,a²){ "}" }(b²)

# text
seg-f801a2bdca78 = scipy.stats.ncx2 / scipy.stats.chi2 (SciPy { "1.13" } ; Cephes/Boost) — un algorithme indépendant (χ² non centré/centré par fractions continues) de la série de gamma incomplète de kshana (raim::chi2_cdf / noncentral_chi2_cdf), calculant le même NOYAU de statistiques de détection défini de façon unique : la Q de Marcum généralisée Q_M(a,b)=ncx2.sf(b²,2M,a²), la probabilité de détection P_d, la probabilité de fausse alarme P_fa et l'inversion P_fa→seuil, concordant à ~{ "1e-6" } — la même base d'indépendance que la ligne vérifiée « noyau statistique d'intégrité RAIM/ARAIM ». NOYAU seulement : le CFAR à moyennage de cellules par cellule et la perte de chevauchement des classes de code/Doppler restent MODELLED

# text
seg-77f425a38aa2 = Résolution d'ambiguïté entière de phase de la porteuse GNSS (LAMBDA)

# text
seg-410ce8b6cebf = Fixation d'ambiguïtés par moindres carrés entiers à la manière de LAMBDA : une transformée de décorrélation entière (Z) préservant le volume (réduction de taille entière-Gauss du facteur L D Lᵀ) + une recherche exacte par moindres carrés entiers en séparation et évaluation en profondeur de Schnorr–Euchner, avec le test de rapport sur les deux meilleurs candidats (l'affirmation vérifiée) ; plus le taux de succès bootstrap en forme close P_s=∏(2Φ(1/(2σ_{ "{" }i|I{ "}" }))−{ "1" }), vérifié seulement en interne et hors de l'affirmation vérifiée

# text
seg-5aeb95f59f07 = RTKLIB v2.4.2-p13 lambda() (son fichier source lambda.c, T. Takasu, BSD-2-Clause), une réduction LAMBDA et une recherche MLAMBDA indépendantes compilées depuis C et exécutées comme outil, sur { "300" } covariances aléatoires (n { "2" } à { "10" }) : les moindres carrés entiers ont un minimiseur unique, donc les entiers fixés doivent être identiques ({ "0" } écart) et les deux meilleures normes au carré, qui alimentent le test de rapport, concordent à { "1e-9" } relatif près (mesuré { "5.6e-13" }) ; tolérance fixée avant la comparaison. Affirmation vérifiée : la solution ILS et ses deux meilleures normes. RTKLIB ne calcule pas le taux de succès bootstrap, qui reste vérifié en interne face à un Monte-Carlo du processus d'arrondi ; les invariants de la transformée Z et l'énumération exhaustive demeurent comme vérifications complémentaires. Décorrélation entière-Gauss seulement (les permutations de réordonnancement de la réduction LAMBDA complète accélèrent la recherche mais ne changent ni la réponse ILS exacte ni le taux bootstrap)

# text
seg-4ad1ec05610f = Ciblage dans le plan B et assistance gravitationnelle par coniques raccordées

# text
seg-d249aea7c3ea = Géométrie de survol hyperbolique (a=−μ/v∞², e={ "1" }+r_p·v∞²/μ, angle de déviation δ={ "2" }·asin(1/e), paramètre d'impact |B|=|a|·√(e²−{ "1" })), le repère de point de visée Ŝ/T̂/R̂ du plan B et la décomposition B·T̂/B·R̂, et une assistance gravitationnelle par coniques raccordées (module de v∞ conservé, direction déviée de δ, Δv héliocentrique={ "2" }·v∞·sin(δ/2) sans coût en ergols) avec le paramètre de Tisserand T_P=a_P/a+{ "2" }√((a/a_P)({ "1" }−e²))cos i

# text
seg-1ec7b0d8a32c = GMAT R2026a (Apache-2.0, exécuté comme programme séparé) sur { "192" } états hyperboliques terrestres : B.T, B.R et |B| à { "1e-6" } km près (au pire { "1.35e-8" } km), l'angle de déviation et les deux asymptotes à { "1e-9" } rad près (au pire { "9.3e-15" } rad) ; la variation de vitesse de l'assistance à partir du C3 et des asymptotes de GMAT à { "1e-9" } v_inf près (au pire { "5.6e-14" }) ; SMA, ECC et INC héliocentriques sur { "350" } états centrés sur le Soleil avant et après l'assistance à { "1e-9" } relatif et { "1e-12" } rad près (au pire { "2.2e-14" } et { "4.1e-14" } rad) ; le paramètre de Tisserand face à sbpy { "0.6.0" } (BSD-3) sur les éléments GMAT à { "1e-9" } près (au pire { "1.3e-15" }) et face à { "3" } - C3/v_c^{ "2" } ({ "8.9e-16" }) ; et la forme close de Tisserand face au tableau { "8.1" } de Kasuga et Jewitt ({ "2019" }) pour { "12" } objets dans la limite d'arrondi imprimé (au pire { "0.39" } de celle-ci ; une valeur traitée publiée de niveau P1). Préenregistré (436293bf ; réparation héliocentrique 6fd9f5e6) ; l'amendement 374c806b, écrit après la génération des fichiers de référence indépendante et avant toute valeur de Kshana, a élargi le filtre d'entrée d'inclinaison de { "1e-2" } à { "1e-3" } rad, conservant davantage d'états, et plus mal conditionnés. Périmètre MODELLED : survol à coniques raccordées à deux corps sur une orbite planétaire circulaire, sans transition de sphère d'influence, perturbations de rencontre ni éphéméride

# text
seg-8e82da17a463 = Formation de faisceau d'un réseau CRPA anti-brouillage

# text
seg-1744f527b4d1 = Annulation par antenne à diagramme de réception contrôlé : vecteurs de pointage complexes du réseau a(û)=exp(j·k·pₙ·û), annulation déterministe (gain unité vers le SV, nuls exacts vers jusqu'à N−{ "1" } brouilleurs par le minimum de norme w=Aᴴ(AAᴴ)⁻¹b), et poids adaptatifs MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) qui dirigent d'eux-mêmes des nuls profonds sur les fortes interférences (avec un noyau d'algèbre linéaire complexe écrit de zéro)

# text
seg-8016dae66350 = numpy.linalg / scipy.linalg (résolution complexe LAPACK zgesv) — une base de code d'algèbre linéaire indépendante du noyau complexe écrit de zéro de kshana, calculant les MÊMES poids définis de façon unique : MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) et annulation de norme minimale w=Aᴴ(AAᴴ)⁻¹b, plus les gains de réponse du réseau qui en résultent, concordant à ~{ "1e-9" } — la même classe de référence indépendante que les lignes vérifiées DOP (gnss_lib_py) et information de Fisher (numpy). Réseau MODELLED à bande étroite, en champ lointain, d'éléments isotropes identiques — pas de couplage mutuel, de désadaptation par élément, de large bande finie (STAP) ni d'erreur d'estimation du vecteur de pointage

# text
seg-f2c973f14d52 = Bruit d'horloge en loi de puissance IEEE-1139 + plancher de FM de scintillation

# text
seg-4a0159558671 = La conversion DSP↔variance d'Allan IEEE-1139 à cinq coefficients S_y(f)=Σh_α f^α → σ_y²(τ) (PM blanc/de scintillation, FM blanc/de scintillation/à marche aléatoire), le plancher de FM de scintillation σ_y=√({ "2" } ln2·h_{ "{" }-1{ "}" }) comme terme ajustable de plein droit, et un ajustement non négatif de la famille FM dans la base { "{" }(2π²/3)τ, { "2" } ln2, 1/(2τ){ "}" } qui retrouve le plancher que la base de dérive { "{" }1/τ,τ,τ³{ "}" } ne peut pas représenter

# text
seg-24f6f26046b6 = allantools { "2024.06" } (A. Wallin ; coefficients de Kasdin & Walter { "1992" } / Vernotte { "2015" }) — une base de code tierce indépendante et une lignée de citations distincte, calculant la MÊME conversion DSP→Allan IEEE-1139 définie de façon unique σ_y(τ) pour chacun des cinq types de bruit en loi de puissance. powerlaw::allan_deviation de kshana concorde avec les formes closes d'allantools (FM blanc/de scintillation, FM à marche aléatoire et PM blanc à moins de { "5e-9" } relatif ; PM de scintillation à ~{ "1e-5" } — le véritable signal d'indépendance, kshana utilisant la constante { "1.038" } tabulée de NIST-SP-1065 contre le 3γ−ln2 complet d'allantools), et le plancher de FM de scintillation √({ "2" } ln2·h_{ "{" }-1{ "}" }) concorde avec allantools sur toute l'échelle — le même seuil que franchissent les lignes vérifiées MDEV/TDEV/Theo1/MTIE. Modèle MODELLED en loi de puissance stationnaire — pas de terme de dérive déterministe (τ²) ; les coefficients par appareil / planchers mesurés restent modélisés

# text
seg-cc1ac065e684 = Interchange du bloc de covariance CCSDS OEM

# text
seg-ec4d44e7cf78 = Sérialiser et analyser le bloc COVARIANCE_START…COVARIANCE_STOP de l'OEM CCSDS { "502.0" } — la covariance position/vitesse { "6" }×{ "6" } écrite sous forme de son triangle inférieur à 21 éléments (ordre canonique CX_X … CZ_DOT_Z_DOT) avec le COV_REF_FRAME facultatif, complétant l'écriveur/analyseur existant de vecteurs d'état OEM afin que les covariances de détermination d'orbite et de filtres fassent l'aller-retour dans le format standard

# text
seg-ae061c7f082c = Croissance de l'erreur INS/TRN en marche libre et franchissements de seuil

# text
# c1: ins-trn-coast
seg-7bacdc8aa0d8 = Budget d'erreur de position en fonction de la durée de marche libre construit à partir de coefficients d'IMU, chaque source d'erreur (biais d'accéléromètre, biais de gyroscope, marche aléatoire de vitesse, marche aléatoire d'angle, facteur d'échelle en croisière et sous force spécifique soutenue) propagée par un modèle d'erreur INS à neuf états en repère local avec le retour de Schuler (inertial::coast::ErrorDynamics d'après Groves 2e éd. chap. { "14" } : erreurs d'attitude, de vitesse et de position, la voie verticale avec son gradient de gravité, les rayons WGS-84 et la pesanteur normale, une plateforme horizontale cap au nord à la vitesse configurée, latitude_deg et height_m ; termes systématiques par une exponentielle de matrice augmentée, marches aléatoires par Van Loan), les monômes en Terre plate conservés seulement comme leading_order_m ; contributions combinées selon une règle indiquée (rss / somme linéaire / somme déterministe avec rss stochastique) ; les durées de marche libre atteignant des seuils de position fournis par l'appelant ({ "10" } m et { "50" } m par défaut) repérées par un balayage vers l'avant du premier franchissement (first_crossing_s, les courbes bornées par Schuler n'étant pas monotones), avec la source dominante à chaque franchissement ; et un mode borné par TRN donnant le plus grand intervalle de recalage sur le terrain qui respecte chaque seuil. Exécutable comme type de scénario <c1/>

# text
seg-622af0bd27de = NaveGo v1.4 (commit 24d9488, LGPL-3.0), exécuté comme programme séparé sous GNU Octave { "8.4.0" } : exécutions de marche libre inertielle avec le même profil d'erreur d'IMU, avec une zone morte numérique corrigée dans sa mise à jour de quaternion (qua_update.m : la garde sur une vitesse inférieure à { "1e-8" } rad/s remplacée par wnorm == { "0" }, appliquée à une copie à l'exécution et vérifiée une fois pour concorder ; avec la garde en place, une attitude de plateforme à dérive lente se figeait et coupait le retour de Schuler). Préenregistré (4262b969) avec le générateur corrigé avant son exécution ; le moteur (440b3877) a été commité avant l'ouverture de toute sortie corrigée ; même seuil de { "5" } %, { "48" } points, termes, graines et statistique qu'au tour { "1" }. Résultat : 48/48 à { "5" } % près (au pire +{ "3.70" } % de marche aléatoire de vitesse à { "1200" } s, +{ "3.33" } % de marche aléatoire d'angle à { "1800" } s) ; à { "3600" } s NaveGo/Kshana donnent 2375.4/2376.2 m pour le biais d'accéléromètre et { "130" } 885/131 { "675" } m pour le biais de gyroscope. Mettre à zéro le retour de taux de transport de Schuler fait échouer le test (+{ "695" } % à { "3600" } s). Divulgué : les prédictions de Schuler à voie unique et les valeurs NaveGo du tour 1 étaient connues ; le modèle n'a aucun paramètre ajusté. Périmètre : les courbes d'erreur par terme au grade tactique, { "45" } deg N, à plat et cap au nord, jusqu'à { "3600" } s ; les franchissements, la règle de combinaison et le mode TRN sont des fonctions déterministes de ces courbes. Les coefficients de classe d'IMU (chiffres de bande du tableau { "4.1" } de Groves { "2013" }) et le résidu de recalage TRN restent des entrées MODELLED. Tour { "1" } (remplacé) : les monômes en Terre plate, désormais leading_order_m, surestiment au-delà de { "600" } s (2.2x à 8x à une heure). { "0.30" } révision : toutes les sorties ins-trn-coast changent (le pic TRN du scénario livré { "52.932679" } -> { "44.711834" } m)

# text
seg-a971ff07592a = Cycle d'utilisation d'ouverture entre navigation et communications

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
# c3: navigation-priority
# c4: communications-priority
# c5: first-come-first-served
# c6: aperture-duty-cycle
seg-5b0ba97379bf = Une exécution prend un plan de contacts (une liste de fenêtres aos_s/los_s, chacune demandant l'ouverture pour la navigation ou les communications — le même vocabulaire de fenêtres qu'émet <c1/>, converti par <c2/>), un nombre d'ouvertures et une politique d'arbitrage explicite, et renvoie le cycle de navigation, le cycle de communications, le cycle inactif et l'indisponibilité par session. La politique est une entrée avec une valeur par défaut documentée (<c3/> ; aussi <c4/> et <c5/> non préemptif), et le rapport porte la politique résolue, sa définition complète et les définitions de cycle et d'indisponibilité, parce qu'un chiffre de cycle cité sans sa règle d'arbitrage n'est pas reproductible. L'ordonnancement est un balayage exact d'intervalles sur les bornes des fenêtres, de sorte qu'une fenêtre qui se termine exactement là où la suivante commence n'entre jamais en conflit, et les secondes-ouverture de navigation, de communications et d'inactivité sont cumulées indépendamment dans ce seul balayage. Exécutable comme type de scénario <c6/>

# text
# c1: passes::predict_passes
seg-656fd7d44a9e = Cohérence interne, à partir de trois grandeurs calculées par des expressions différentes dans le même balayage puis tenues de se boucler. Les secondes-ouverture de navigation, de communications et d'inactivité sont cumulées séparément — l'inactivité à partir de (ouvertures − |servies|) par intervalle élémentaire, jamais comme un reste — et leur somme est vérifiée par rapport à ouvertures × horizon_s, ce qu'une borne mal encadrée, un intervalle compté deux fois ou omis rompt aussitôt ; les temps servis par session sont en outre tenus de se resommer aux deux totaux de service. Les propriétés structurelles de l'ordonnanceur sont mesurées plutôt que supposées : le temps servi est vérifié non décroissant avec le nombre d'ouvertures sur { "200" } plans pseudo-aléatoires pour les trois politiques (pas évident pour la politique non préemptive, où une ouverture supplémentaire change qui détient quoi à chaque borne ultérieure), et l'arithmétique des bornes est épinglée sur la paire contiguë/à chevauchement d'une seconde où une erreur d'un cran se cacherait autrement. Le pont avec le prédicteur de passages est vérifié par rapport à la sortie de <c1/> : avec une ouverture et aucun service concurrent, les secondes-ouverture de navigation égalent les durées de passage sommées du prédicteur lui-même. Aucune référence indépendante externe n'est revendiquée et il n'en existe pas : la capacité remplace l'arithmétique à la main plutôt que d'être vérifiée par rapport à elle, le plan de contacts fourni est illustratif et non volé, et aucun ordonnanceur opérationnel ne publie un couple plan-plus-réponse avec sa règle d'arbitrage indiquée — un cycle calculé sous une politique non indiquée n'est pas comparable à un cycle calculé sous une politique indiquée, et la dépendance à la politique est mesurée (cycles de navigation de 100/150 contre 50/150 sur le même plan). Les temps de pointage et de changement, le volume de données, l'état des tampons, l'énergie et la fermeture de liaison sont exclus dans l'étiquette du rapport plutôt que modélisés en silence

# text
seg-43cd7aa7ab53 = Brouillage RF de la navigation de surface lunaire (J/S par satellite)

# text
# c1: jamming
# c2: lunar-jamming
seg-e0566f37ad8f = Rapport brouilleur sur signal propre à la Lune, C/N₀ effectif et perte de verrouillage pour un utilisateur de surface sélénographique sous un brouilleur à la surface lunaire (ou surélevé), sur la constellation illustrative de classe Moonlight/LCNS à sources publiques. Compose la chaîne de brouillage ouverte (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) avec la géométrie de ciel lunaire ouverte (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf) ; aucune géométrie ni radiométrie n'est redérivée. Contrairement au type terrestre <c1/>, la branche signal n'est pas une puissance reçue fixe : la puissance isotrope reçue de chaque satellite est sa propre PIRE de bilan de liaison − FSPL(distance oblique), de sorte que le J/S varie d'un satellite à l'autre avec la distance et l'élévation lunaires. Émet UNE LIGNE PAR LIAISON (époque, satellite) VISIBLE en JSON et sous forme d'artefact *.table.csv, avec les deux puissances reçues dont le J/S est la différence imprimées à côté ; les chiffres de mérite agrégés figurent à côté de ce tableau, jamais à sa place. Exécutable comme type de scénario <c2/>

# text
seg-2a4393ae7c52 = Recoupement de composition avec un chemin de code indépendant du dépôt : chaque J/S par liaison est redérivé comme la différence de deux bilans de liaison calculés avec linkbudget::received_signal_power_dbw, dont la perte en espace libre est l'unique expression { "20" }·log10(4πRf/c) plutôt que la somme de trois termes qu'utilise jamming::free_space_path_loss_db — les deux concordent à moins de { "1e-9" } dB sur chaque ligne (pire cas mesuré { "7.11e-14" } dB, soit l'arrondi flottant). La chaîne d'interférence sous-jacente qu'elle compose est par ailleurs ancrée de façon externe dans tests/gnss_denied_jamming_resilience_reference.rs (redérivation numpy/scipy indépendante du J/S et du C/N₀ effectif calée sur Kaplan & Hegarty §{ "9.4" }, plus le C/N₀ mesuré de JammerTest { "2024" }, Zenodo 10.5281/zenodo.15910563) ; la géométrie lunaire qu'elle compose est la géométrie lunar_service/lunar avec ses propres références indépendantes. Identités en forme close vérifiées ici : une distance de brouilleur divisée par deux ajoute exactement { "20" }·log10({ "2" }) dB à chaque ligne ; le J/S est exactement invariant au gain de l'axe de visée de l'antenne de l'utilisateur tandis que le C/N₀ varie exactement de ce gain ; un masque d'élévation ne change aucune ligne subsistante bit pour bit. La ligne elle-même reste ReferenceImpl/modélisée : aucune campagne mesurée de brouillage lunaire n'existe pour la vérifier, et la constellation est une géométrie illustrative de classe Moonlight/LCNS à sources publiques, non une éphéméride volée

# text
seg-4c116e25c5c5 = Contour de déni lunaire avec une bande d'incertitude issue de la dispersion mesurée du C/N₀

# text
# c1: lunar-jamming
# c2: denial
seg-77828c25f3ab = Le rapport <c1/> ne fonde plus son contour de déni sur un seul scalaire. Il émet la distribution complète mesurée du C/N₀ du signal utile sur le tableau par satellite — n, min, p05, p25, médiane, p75, p95, max, moyenne, écart type d'échantillon, et l'asymétrie propre à l'échantillon (p95 − médiane) − (médiane − p05) — à côté des lignes par liaison, qui sont inchangées. Le contour est ensuite rapporté à chacune de ces statistiques d'ordre selon LES DEUX critères de déni que reconnaît le moteur, jamais l'un à la place de l'autre : le critère en vigueur de rapport de puissance (J/S = { "30" } dB, le même seuil qu'utilisent attack_surface et tracking_loop, et le critère derrière la colonne <c2/> du tableau publié de brouillage de liaison lunaire), et le critère de perte de verrouillage (le C/N₀ effectif tombant à tracking_threshold_dbhz), qui est le critère avec lequel la propre colonne links[].status de ce rapport est évaluée. Chaque point du contour est donné sur les deux axes du plan de déni — la PIRE de brouilleur requise à la distance du scénario, et la distance de déni à la PIRE du scénario — de sorte que la bande est un intervalle sur les mêmes axes que ceux d'un tracé de contour. Les bords de la bande SONT contour(p05) et contour(p95) : la même application en forme close appliquée aux quantiles propres de l'échantillon, non un sigma ajusté à l'échantillon et non médiane ± k·écart type, et le rapport le dit dans une chaîne band_definition à côté des nombres. L'écart type est émis par continuité et n'est utilisé par rien. Un quantile dont le C/N₀ est déjà au niveau du seuil de poursuite ou en dessous n'a aucun J/S de déni fini ; ces colonnes sont émises comme null avec une raison comptée plutôt que comme un infini ou un rayon écrêté

# text
seg-f7457156f960 = Cohérence interne face aux propres fonctions directes du moteur, ce qui est tout ce que cette capacité peut honnêtement revendiquer. Chaque point du contour est une inversion en forme close, et chaque inversion est vérifiée en repassant sa réponse dans la fonction DIRECTE avec laquelle les propres lignes du rapport ont été évaluées : la colonne J/S par jamming::effective_cn0_dbhz (qui doit renvoyer tracking_threshold_dbhz à moins de { "1e-9" } dB-Hz), la colonne de distance par jamming::free_space_path_loss_db et jamming::j_over_s_db (le même J/S à moins de { "1e-9" } dB), la colonne de PIRE par jamming::j_over_s_db à la distance propre du scénario. Le contour est en outre vérifié comme étant la FRONTIÈRE de l'ensemble de déni et non un point à l'intérieur — lock_status perd le verrouillage sur une inégalité stricte, de sorte que le verdict est mesuré comme basculant de DEGRADED à LOST à { "1e-4" } dB de J/S de part et d'autre du contour, ce qu'un contour décalé d'un epsilon ferait échouer. La vérification la plus forte est par liaison plutôt que par quantile : appliquer la même application au C/N₀ propre de chaque ligne reproduit exactement la colonne de statut du rapport — { "0" } désaccord sur { "38" } lignes sur { "38" } au point de fonctionnement documenté (kind = lunar-jamming, toute entrée par défaut sauf jammer.range_m = { "25 000" } m), où { "26" } lignes sont LOST et { "12" } ne le sont pas. La monotonie est mesurée, non supposée : { "20 001" } échantillons sur [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } violation d'une distance strictement décroissante et d'une puissance requise strictement croissante, de sorte que l'ordre des quantiles de la bande est démontré plutôt qu'affirmé. ExternalDataset est écarté, et avec lui le statut vérifié : aucune campagne mesurée de brouillage lunaire n'existe pour y comparer un rayon de déni, la constellation est une géométrie illustrative de classe Moonlight/LCNS à sources publiques plutôt qu'une éphéméride volée, et les entrées du contour (PIRE, puissance du brouilleur, gains d'antenne, température de bruit) sont des ordres de grandeur représentatifs. ReferenceImpl a aussi été envisagé puis écarté — l'inverse et l'expression directe sont la MÊME algèbre lue dans deux sens, de sorte que l'aller-retour attrape les erreurs de transcription et de signe mais n'est pas une implémentation indépendante ; l'appeler recoupement serait le geste d'indépendance empruntée que les invariants de la matrice existent pour empêcher. Ce que la bande apporte est mesuré et cité plutôt qu'affirmé : à ce point de fonctionnement, le contour à scalaire unique est de { "27.402916" } km et place { "25" } km du côté nié pour les { "38" } lignes, tandis que la bande { "21.256108" } .. { "29.921360" } km contient le point de fonctionnement et rapporte donc la répartition que montre réellement le tableau. Les deux critères sont aussi mesurés en désaccord — la bande en rapport de puissance ({ "38.186527" } .. { "53.691675" } km) ne contient pas du tout { "25" } km — ce qui explique que les deux soient imprimés

# text
seg-2d3944107ba0 = Puissance de détection du moniteur d'intégrité intermodalités

# text
seg-38bc7c0bfe57 = Le rapport hybrid-optical-rf indique ce que le moniteur du khi-deux intermodalités peut réellement DÉTECTER, et pas seulement qu'il réussit sur un cas sans défaut : le biais minimal détectable par axe surveillé (est, nord, haut, horloge) aux probabilités de fausse alarme et de détection manquée indiquées par le scénario, la courbe de puissance de détection de part et d'autre, le multiple de biais sans bruit auquel la statistique réalisée franchit pour la première fois le seuil, et le délai de détection pour une rampe de biais à une vitesse indiquée. Des défauts sont aussi injectés à travers le vrai moniteur et la statistique qu'il renvoie est rapportée à côté de la prédiction analytique

# text
seg-b6b8dec4dcff = Deux références internes, aucun jeu de données externe. ({ "1" }) Aller-retour en forme close : le biais minimal détectable est produit en inversant la queue du khi-deux non centré sur la non-centralité (raim::pbias) et est vérifié en réinjectant la non-centralité obtenue dans raim::noncentral_chi2_cdf au seuil propre du moniteur, qui doit renvoyer P_md. ({ "2" }) Injection contre analyse : un biais est écrit dans l'estimation RF d'un axe et cross_raim::run_cross_raim est réexécuté, de sorte que la statistique comparée à la non-centralité analytique est celle que le moniteur a calculée, et non une redérivation. Un Monte-Carlo à graine fixée de la statistique elle-même figure dans les tests comme troisième vérification ; il n'est volontairement PAS dans le rapport, parce qu'une estimation échantillonnée serait plus lente et non reproductible bit pour bit. ExternalDataset est écarté : la grandeur est la puissance de détection de CE moniteur à l'allocation de sigma de CE scénario, et les ordres de grandeur de sigma par lesquels le MDB est mis à l'échelle sont des entrées représentatives modélisées, non des mesures. ReferenceImpl a aussi été envisagé puis écarté — le Monte-Carlo échantillonne la même statistique que décrit l'analyse, de sorte qu'il attrape les erreurs de transcription et de coefficient mais n'est pas une implémentation indépendante du moniteur. { "0.30" } tour { "2" } (préenregistré 0135a9e4), bloqué (reste MODELLED) : chi2/ncx2/brentq de SciPy { "1.18.1" } reproduisent le seuil du rapport (à { "5.4e-12" } près), le MDB par axe, la courbe de puissance, le multiple de franchissement et le délai de détection de rampe (à { "5.3e-10" } près) sur cinq configurations ; les statistiques de défauts injectés n'ont pas de référence indépendante et les ordres de grandeur de sigma sont des entrées modélisées, de sorte que la délimitation attend une décision du responsable

# text
seg-38cabd4921c1 = Recroissance de la covariance après transfert face à la limite d'alerte

# text
seg-9287268bbada = Le rapport hybrid-optical-rf expose le modèle de bruit de processus du filtre et indique combien de temps la solution après transfert reste dans la limite d'alerte : pour les deux sens de transfert, il porte la covariance par axe que le transfert a laissée, la propage vers l'avant sous un bruit de processus à marche aléatoire indiqué, et rapporte l'instant où le 1σ mis à l'échelle de la couverture atteint les limites d'alerte horizontale, verticale et de synchronisation, la limite qui est atteinte en premier, la constante de temps de doublement de la variance, et un profil de marche libre échantillonné qui encadre le franchissement. Les DSP de bruit de processus, le facteur de couverture et les limites d'alerte sont tous des entrées avec des valeurs par défaut documentées

# text
seg-c85b822227f3 = Aucune référence indépendante externe. Le franchissement est une solution en forme close de la croissance de variance à marche aléatoire, et les tests le recalculent de façon indépendante à partir des valeurs que le rapport publie lui-même plutôt qu'à partir des internes de l'émetteur. La covariance de départ est épinglée bit pour bit à la trace que le bloc de transfert existant avait déjà rapportée, de sorte que la marche libre ne peut pas propager une covariance que personne d'autre n'a vue. Les DSP de bruit de processus sont des entrées représentatives MODELLED et les temps de franchissement évoluent directement avec elles, ce que le test de mise à l'échelle énonce comme une propriété mesurée et non comme une affirmation. ExternalDataset est écarté délibérément : le temps de marche libre est une fonction directe de deux DSP modélisées et de limites d'alerte elles-mêmes représentatives, et il n'existe aucune marche libre mesurée de transfert optique/RF lunaire à laquelle comparer. Une référence indépendante externe exigerait ici une courbe publiée de croissance de covariance après transfert ou de précision de holdover pour un récepteur comparable avec son modèle de bruit de processus indiqué, vérifiée à une tolérance

# text
seg-a3b8272862aa = Diagramme d'antenne hors axe dans l'export de géométrie lunaire

# text
seg-27d246503a48 = L'export de géométrie par satellite porte, par (époque, satellite), l'angle hors axe AU SATELLITE et le gain d'émission vers le site issu du vrai diagramme (d'Airy) d'ouverture circulaire à éclairement uniforme, et rapporte le nombre de satellites dans le faisceau sous ce diagramme À CÔTÉ du nombre sous l'approximation symétrique gain-largeur de faisceau (θ_3dB[deg] = √(31000/G_lin)), la différence étant émise comme correction explicite dans links, en satellites par époque, et comme pire époque isolée. Les deux rendements d'ouverture implicites de l'approximation sont émis ({ "0.641" } face à la règle de { "70" }·λ/D degrés avec laquelle elle est citée, { "0.920" } face à une ouverture circulaire uniforme), de sorte que le rendement qu'elle suppose en silence est indiqué plutôt que déduit. Désactivé par défaut : le bloc n'apparaît que lorsqu'un site d'export et une ouverture sont tous deux donnés

# text
seg-f7f79e2dd6c5 = Mixte, et séparé plutôt que regroupé. Le DIAGRAMME sous-jacent est validé de façon externe et garde sa propre ligne (un montage scipy.special.j1 à moins de { "0.05" } dB dans tests/validate_p1_orbital_footprint.rs, plus ici l'abscisse de demi-puissance d'Airy publiée x = { "1.61634" } localisée par bissection plutôt que supposée). La GÉOMÉTRIE est vérifiée face à la trigonométrie des triangles en forme close, écrite comme une expression différente du produit scalaire testé. Le CONFINEMENT du vrai faisceau par le cône approché est de l'algèbre dérivée (28.019/√η contre { "29.479" } degrés par λ/D), de sorte que la correction ne peut être que non positive pour η ≤ { "0.9035" }. Mais les DÉCOMPTES dans le faisceau eux-mêmes n'ont pas de référence indépendante externe : aucun tableau publié ne donne combien de satellites d'une couche de classe Moonlight/LCNS tiennent un site polaire sud dans le faisceau à demi-puissance d'une parabole donnée, et la constellation est une approximation illustrative à sources publiques, non une éphéméride volée. Le désaccord mesuré au point de fonctionnement documenté — { "0" } liaison dans le faisceau sous le vrai diagramme contre { "28" } sous l'approximation, −{ "2.33" } satellites par époque, pire époque { "3" }, sur { "76" } liaisons évaluées — est donc un constat MODELLED sur l'approximation, épinglé comme littéral de régression (la ligne la plus proche se trouve à { "0.069" }° de l'un ou l'autre bord du faisceau, quatre ordres de grandeur au-dessus de tout désaccord au dernier chiffre), et non un chiffre de couverture vérifié de façon externe. Étiqueter la ligne ExternalDataset en s'appuyant sur l'ancrage externe propre du diagramme serait de la validation empruntée, ce que les invariants de la matrice existent pour empêcher. { "0.30" } tour { "2" } (préenregistré d9755d28), bloqué (reste MODELLED) : la géométrie SPICE et les fonctions de Bessel de SciPy reproduisent l'angle hors axe (au pire { "3.0e-5" } deg), le gain d'Airy et les indicateurs dans le faisceau sur { "6 336" } lignes d'états d'orbiteurs réellement volés et du point de fonctionnement documenté ; mais sur la géométrie réellement volée les indicateurs se répartissent selon l'identité du satellite (la liaison la plus proche est à { "1.66" } deg du bord du faisceau), la visibilité à { "5" } deg est vérifiée comme un indicateur et non comme une élévation numérique, l'indicateur de l'approximation symétrique applique la règle empirique 31000/G à un angle validé sans valider la règle, et les rendements implicites n'ont pas de référence indépendante ; la délimitation attend une décision du responsable

# text
seg-6fbfa234ef3e = Perte de verrouillage de la boucle de poursuite et capture par leurrage sous interférence

# text
# c1: tracking-loop
seg-f78c1f28a3f7 = Perte de verrouillage calculée à partir de la dynamique des boucles plutôt que d'un rapport de puissance : gigue thermique 1σ de la porteuse (Costas) et du code (avance/retard non cohérent) en fonction du C/N₀ avec la perte de quadrature, face aux règles indiquées 3σ_PLL + θ_e ≤ { "45" }° et 3σ_DLL + retard de rampe ≤ d/2 chips ; seuils de C/N₀ de décrochage et de reverrouillage avec la boucle déterminante nommée et l'hystérésis DÉRIVÉE de la bande de capture plus large plutôt qu'affirmée ; le délai déclaré de perte de verrouillage d'un détecteur de verrouillage à deux seuils avec durées de confirmation, rapporté séparément du temps physique d'échappée de phase (temps moyen de Viterbi entre sauts de cycle, en log₁₀ s parce qu'il couvre des centaines de décades) ; la plus grande dérive de code et le plus grand taux Doppler de porteuse que les boucles de la victime peuvent suivre ; et le RAYON DE DÉNI qu'impliquent les dynamiques de boucle, rapporté à côté du rayon en rapport de puissance existant, leur différence signée formant son propre champ nommé. Exécutable comme type de scénario <c1/>

# text
seg-c3794c8d85c5 = Le propre corrélateur sdr du moteur (sdr::correlate / synth_if / CaCode) avancé pas à pas sur une FI synthétique à graine fixée à un C/N₀ étalonné — un chemin de code séparé atteignant les mêmes nombres par corrélation numérique d'IQ échantillonné plutôt que par une expression algébrique de gigue, c'est donc une voie différente et non une reformulation — plus des valeurs tabulées standard de Bessel modifiée I₀ pour le terme de saut de cycle. Théorie des boucles d'après Kaplan & Hegarty chap. { "8" } et Viterbi/Gardner pour le temps de saut. La ligne reste ReferenceImpl/MODELLED : le recoupement se trouve dans cette même base de code, et la vérification de bessel_i0 valide une fonction spéciale plutôt que le modèle de poursuite, de sorte que promouvoir la ligne sur cette base serait un étiquetage complaisant. ExternalDataset exigerait un jeu de données FI brut enregistré avec un C/N₀ de vérité et un instant de perte de verrouillage annoté (classe TEXBAT/OAKBAT) ; aucun n'est fourni dans cet arbre, et même avec l'IQ ces jeux de données ne publient aucune vérité d'état de boucle par époque, de sorte qu'un délai déclaré de perte de verrouillage ne pourrait être vérifié que face au détecteur de verrouillage d'un autre récepteur, ce qui est un choix modélisé et non une référence indépendante. Les bandes de boucle, le temps d'intégration, l'espacement des corrélateurs, le rapport de capture, les durées, la puissance du brouilleur et les gains d'antenne sont des chiffres de bande représentatifs, non une fiche technique. { "0.30" } tour { "2" }, GNSS-SDR { "0.0.19" } (GPL-3.0, exécuté comme programme) sur une FI générée de façon indépendante (préenregistré 6ef7698c, amendements de la méthode de mesure divulgués), un constat (reste MODELLED) : les gigues de PLL et de DLL en boucle fermée concordent à { "8" } % près à { "35" } à { "45" } dB-Hz, la contrainte dynamique de { "10" } Hz/s à { "1" } % près et le retard de rampe de code du premier ordre à { "2" } % près ; à { "30" } dB-Hz la gigue de PLL est supérieure de { "21" } % et la gigue de DLL inférieure de { "32" } %, les seuils mesurés de la règle des 15 degrés se situent { "1.5" } dB au-dessus du moteur, et la boucle du second ordre saute de { "0.5" } à { "2" } décades plus souvent que la borne du temps de saut du premier ordre. { "0.30" } révision : le temps de saut de Costas utilise désormais le SNR de boucle rho/4 (sauts d'un demi-cycle) ; le log10_mean_time_to_cycle_slip_s par défaut de jitter_table passe de { "11.58" } à { "2.10" } au seuil de { "25.47" } dB-Hz

# text
seg-69155fb79ebd = Covariance des coordonnées de station VLBI lunaire à partir d'un plan de poursuite

# text
# c1: lunar-vlbi-fim
seg-141285301f58 = Dérivées partielles de retard accumulées sur un plan de lignes de base × époques en une matrice d'information de Fisher, inversée en la covariance des coordonnées de station et en le sigma de station par coordonnée, remplaçant un lien d'équipartition isotrope supposé issu d'une précision de retard scalaire. L'état porte des coordonnées de station liées à la Terre (ITRS), de sorte que le jacobien est la dérivée partielle inertielle tournée par la matrice GCRS→ITRS de chaque époque, et c'est la rotation terrestre qui rend ces coordonnées observables — le rapport MESURE le balayage de la ligne de visée liée à la Terre et la déclinaison de la balise plutôt que de les supposer. Le rang, le défaut de datum, le nombre de conditionnement, le spectre d'information et l'espace nul du réseau libre sont émis à chaque exécution, et en cas de déficience de rang le sigma principal est publié comme NULL avec un statut plutôt que lu dans un inverse quasi singulier. La valeur d'équipartition c·σ_τ·√(g/N) pour le MÊME plan est imprimée à côté de la valeur calculée avec leur rapport, ainsi que la borne de trace isotrope √(p/trace(M)) que l'AM-HM rend plancher strict. Exécutable comme type de scénario <c1/>

# text
seg-b259d4d18f42 = Une voie indépendante dans le dépôt. Chaque ligne du jacobien est redérivée par différence finie centrale de lunar_vlbi::vlbi_delay_s évalué à partir des propres coordonnées de l'état liées à la Terre et au corps lunaire, tournées vers l'avant par la chaîne de référentiels — un chemin qui ne calcule aucune dérivée et ne partage aucune expression avec les dérivées partielles analytiques — et les matrices d'information que construisent les deux voies concordent à moins de { "1e-6" } de la plus grande diagonale. Le noyau d'algèbre linéaire qu'elle compose (information_matrix, crlb, sym_eig) est par ailleurs ancré de façon externe face à numpy.linalg.eigh / numpy.linalg.inv dans tests/fim_observability_reference.rs, et l'observable de retard porte la propre référence indépendante de champ lointain du delta-DOR de lunar_vlbi ; la ligne n'emprunte aucun de ces deux statuts. Identités en forme close vérifiées ici et étiquetées comme telles : mise à l'échelle en σ² et 1/N, et √(p/trace(M)) comme borne inférieure AM-HM que le sigma calculé ne peut pas battre, qui ne coïncide avec la valeur d'équipartition que sur une géométrie isotrope — c'est pourquoi le rapport mesuré est exactement l'anisotropie que l'hypothèse écartait. { "0.30" } comparaison externe (Bibliothèque : NAIF SPICE CSPICE N0067 via spiceypy { "8.2.0" }, MIT ; DE440, ITRF93 earth_latest_high_prec, MOON_PA), préenregistrée ({ "50863551" }) avec une exécution de sensibilité à l'erreur de modèle côté moteur : chaque ligne du jacobien est reconstruite par différences centrales de différences de temps de lumière newtoniennes convergées à partir de la géométrie SPICE (l'équation du temps de lumière est un court script sur les positions SPICE ; SPICE porte la géométrie), le plan étant reconstruit à partir des élévations SPICE. Le plan, le rang, le défaut, le spectre d'information, le nombre de conditionnement, les sigmas de station, le sigma principal, la borne de trace, les rapports d'équipartition, l'espace nul du réseau libre, le balayage de la ligne de visée et la déclinaison de la balise concordent à { "1" } % / { "0.1" } deg près préenregistrés, ce qui se situe au-dessus de l'erreur analytique connue de la Lune du moteur ({ "3.2e-3" } sur les sigmas, mesuré avant l'exécution). NumPy { "2.3.5" } refait l'algèbre linéaire sur le jacobien du moteur commité à { "2e-13" } près (P2). Vérifié comme borne de Cramér-Rao pour le jeu de paramètres réduit indiqué sur les entrées illustratives indiquées : l'éphéméride du centre de la Lune, les horloges, la troposphère et les paramètres d'orientation de la Terre sont tenus fixes dans les deux branches, ce n'est donc pas une précision de campagne réelle

# text
seg-0f4d023fe2d4 = Covariance des coordonnées d'un point de la surface lunaire à partir d'un plan de retards VLBI, distincte de celle des stations terrestres

# text
# c1: all-stations-fixed
# c2: beacon_link
# c3: datum = "all-stations-fixed"
# c4: estimate_beacon = true
seg-47352405133b = Un troisième choix de datum, <c1/>, qui tient toutes les stations terrestres et estime seules les coordonnées de la BALISE liées au corps lunaire — la configuration pour laquelle on cite réellement une incertitude de point de surface lunaire, puisque les coordonnées des stations terrestres sont une entrée du modèle de retard et non une inconnue. Il existe parce que la covariance au niveau des stations et la covariance du point de surface sont des GRANDEURS DIFFÉRENTES séparées par le bras de levier ρ/B, et que rien n'empêchait jusque-là de citer l'une face à l'autre. Le bloc <c2/> émis porte ρ, la plus longue ligne de base, le bras de levier, la forme point de surface du lien d'équipartition c·σ_τ·(ρ/B)·√(g/N), le sigma de balise par coordonnée calculé et leur rapport — le rapport étant null plutôt que trompeur chaque fois que la balise n'est pas estimée ou que la matrice est de rang déficient. B est pris comme la PLUS LONGUE ligne de base présente, la plus favorable, de sorte que le rapport ne peut que sous-estimer. Exécutable comme <c3/> avec <c4/>, ce qui est refusé avec un message nommant l'entrée manquante lorsque la balise n'est pas estimée

# text
seg-18096ae23d96 = Identités en forme close, sans référence indépendante externe revendiquée ni disponible. Le bras de levier est vérifié face à ρ/B et les deux formes d'équipartition entre elles à { "1e-15" } près — des identités algébriques, qui attrapent donc une erreur de câblage et rien d'autre, et sont étiquetées comme telles. Le résultat de fond est MESURÉ plutôt qu'affirmé : un retard issu d'une ligne de base fixe contraint la DIRECTION de la balise, de sorte que la composante de ligne de visée n'atteint la matrice d'information que par le terme de portée en champ proche, et le test lit l'anisotropie qui en résulte sur le spectre émis au lieu de la déduire. L'AM-HM fait de √(p/trace(M)) un plancher strict, si bien qu'un lien d'équipartition isotrope ne peut que SOUS-ESTIMER, et le rapport calculé sur équipartition est exactement l'anisotropie qu'il écartait. MESURÉ sur la paire de type Goldstone/de type Canberra dont la corde est de { "10726.748" } km : sur { "112" } jours échantillonnés, { "36" } n'admettent aucune époque de visibilité mutuelle à un masque de { "10" }°, le maximum jamais atteint de visibilité mutuelle est de { "17" } sur un plan de 49 échantillons, et sur les { "73" } jours viables le rapport à trois composantes va de { "113.9" }× à quatre ordres de grandeur de plus, médiane { "1513" }×, tandis qu'en se restreignant aux deux directions transverses que la ligne de visée n'affame pas on obtient { "3.94" }× à { "25.8" }×, médiane { "7.8" }×. CE QUE CETTE LIGNE NE REVENDIQUE PAS : l'un quelconque de ces chiffres comme propriété d'une campagne réelle. Elle établit que la grandeur de point de surface est désormais CALCULÉE plutôt que supposée, et qu'elle ne peut pas être échangée en silence avec celle du niveau des stations. Reste ReferenceImpl/MODELLED : aucune covariance publiée de point de surface en VLBI lunaire n'existe pour la vérifier, les stations et le site de la balise sont illustratifs et non levés, et l'éphéméride, les horloges, la troposphère et les paramètres d'orientation de la Terre sont tenus FIXES, c'est donc une borne de Cramér-Rao pour un jeu de paramètres réduit, optimiste en elle-même. La même grandeur sur la voie par noyaux (balise sur la Lune DE440) est vérifiée sur sa propre ligne, « …, voie par noyaux » ; sur cette voie analytique le plus petit sigma de balise est inférieur de { "3.9" } % à la référence indépendante SPICE de cette ligne, c'est pourquoi cette ligne reste MODELLED

# text
seg-8958521eedf7 = Covariance des coordonnées d'un point de la surface lunaire à partir d'un plan de retards VLBI, voie par noyaux

# text
# c1: lunar-vlbi-fim
seg-8ac12ca0f272 = La covariance de balise toutes-stations-fixes du scénario lunar-vlbi-fim (toutes les stations terrestres tenues, les coordonnées de la balise liées au corps lunaire estimées seules) avec la balise placée sur la Lune DE440 du JPL lue par le propre lecteur de noyaux du moteur (planetary_kernel_path ; lunar_vlbi_fim::epoch_geometry_with, ephem_provider::KernelEphemeris). Seul le centre de la Lune diffère de la voie analytique ; la rotation du corps IAU { "2015" }, les stations, la rotation terrestre et l'algèbre linéaire sont les mêmes. Les sorties vérifiées sont l'ensemble d'observations, le spectre d'information { "3" } x { "3" }, le rang et le nombre de conditionnement, les trois sigmas de balise liés au corps et leur RMS, le bras de levier et le rapport calculé sur équipartition, sur le plan par défaut. Exécutable comme le scénario <c1/> avec datum = "all-stations-fixed", estimate_beacon = true et planetary_kernel_path défini

# text
seg-63250578ec6b = Branche de bibliothèque contraignante : NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) sur de440s, earth_latest_high_prec (ITRF93 avec UT1 et mouvement du pôle) et les référentiels lunaires DE440, la balise fixée dans MOON_ME ; chaque ligne du jacobien est une différence centrale de { "3" } km de la différence de temps de lumière newtonienne convergée (le propre code de temps de lumière de la référence indépendante M069, importé), jamais une dérivée partielle de Kshana ; visibilité reconstruite à partir des élévations WGS-84 ; eigh et inv de NumPy { "2.3.5" } / SciPy { "1.18.1" } (BSD-3-Clause, LAPACK). Branche P2 : NumPy sur le jacobien commité du moteur. Préenregistré (4a51256) avant l'existence du montage ou de la référence indépendante, avec des seuils de { "1" } % sur les valeurs propres, le conditionnement, les sigmas, le RMS et le rapport, { "1e-4" } sur le bras de levier, ensemble d'observations et rang exacts ; P2 { "1e-9" }. Divulgué : la comparaison côté moteur seul de la Lune analytique et de la Lune par noyaux ({ "3.9" } % sur le sigma y) a été exécutée avant le préenregistrement, pour choisir la voie par noyaux, et y est indiquée. Résultat : les deux branches concordent, au pire { "1.7e-3" } (sigma y de la balise { "0.081211" } m contre { "0.081351" } m). Mutation : transposer la rotation du corps de la dérivée partielle de la balise fait échouer les deux branches. Les deux côtés lisent DE440, de sorte que la concordance vérifie la géométrie et l'algèbre linéaire sur DE440, non DE440. Hors de l'affirmation : la précision de point de surface d'une campagne réelle (horloges, troposphère et orientation de la Terre tenues fixes ; stations et site de balise illustratifs), et la voie analytique par défaut (ligne ci-dessus, qui reste MODELLED : sur la Lune analytique le sigma y est inférieur de { "3.9" } % à cette référence indépendante)

# text
seg-0315968c8214 = PNT différentiel lunaire — budget résiduel du lien de correction

# text
seg-c6785166a44c = Les trois termes qu'une correction différentielle acquiert entre l'époque où elle est calculée et l'époque où elle est utilisée, chacun jusque-là laissé comme marge non modélisée : erreur de levé de la station de référence (corrélée entre satellites, indépendante de la ligne de base, transfert de position ~{ "1" }:{ "1" } et, de façon démontrée, non amplifiée par le DOP), vieillissement de la correction (le vecteur d'erreur d'orbite figé reprojeté sur la ligne de visée sur laquelle le propre propagateur du moteur place le satellite une latence plus tard, plus la dérive d'horloge c·σ_y(τ)·τ issue de la loi de puissance étalonnée), et quantification uniforme du lien sur une pleine échelle exacte ±(orbit_err + clock_err) avec une variance step²/12. Rapportés dans les domaines de la distance et de la position, à côté — jamais à la place — du résidu et du niveau de protection existants, avec une courbe de latence à côté du chiffre unique

# text
seg-29b8e6c12471 = Identités en forme close et autocohérence : la variance step²/12 du quantificateur uniforme, la propagation exacte de covariance (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ se réduisant à σ·PDOP pour σ égaux, le transfert { "1" }:{ "1" } du terme de levé comme conséquence de û_user ≈ û_ref, et la fermeture en quadrature en désactivant les termes. Le recoupement du PDOP avec orbit::dop partage la matrice normale [−û, { "1" }], c'est donc une vérification de cohérence, étiquetée comme telle plutôt que comme référence indépendante. Aucun ExternalDataset n'est disponible ni revendiqué : aucune station de surface lunaire n'a de précision levée publiée, aucun lien de correction différentielle lunaire n'a de latence ni de format de message publiés, et le résultat de quantification est une forme close et non une mesure. RTKLIB — déjà la référence indépendante en code externe pour le noyau de simple différence et de moindres carrés pondérés — pourrait être piloté avec une base volontairement mal levée pour confirmer le transfert de levé { "1" }:{ "1" }, mais c'est du code indépendant sur la même algèbre de ligne de visée au premier ordre. LES ORDRES DE GRANDEUR SONT MODELLED : la valeur par défaut du levé est la propre allocation de réalisation du référentiel lunaire de cette crate plutôt qu'une station mesurée, la latence et le nombre de bits sont des entrées ILLUSTRATIVE, et la croissance du VECTEUR d'erreur d'éphéméride diffusée lui-même n'est pas modélisée du tout — indiqué dans la chaîne de loi de vieillissement émise, parce que c'est le terme le plus susceptible de dominer un lien réel

# text
seg-c42646ae4707 = Carte de couverture et de précision d'une station de référence lunaire

# text
# c1: lunar-station-coverage
seg-1f9834b32629 = Balayage Monte-Carlo du modèle de PNT différentiel lunaire sur une grille d'utilisateurs du pôle sud et un jour d'époques (le type <c1/>) : pour une station de référence différentielle en un site connu du pôle sud, par point et sur la région, l'erreur de position corrigée et non corrigée en percentiles (3D, horizontale, verticale), la disponibilité avec une raison pour chaque époque indisponible (user_lt4, station_missing_sat), la couverture face à un seuil indiqué avant l'exécution, les niveaux de protection DO-229E, le rayon de couverture par secteur d'azimut, et le budget du lien de correction à la station et au pire point. Pas une déclaration sur la performance d'un système réel ; ni affilié à un organisme ni approuvé par lui

# text
seg-2308d94fa25e = Arithmétique recalculée par un script numpy indépendant sur des cas exportés (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" } ; préenregistré dans tests/fixtures/lunar_station/PREREGISTRATION.md, commité seul dans 9caedf97 avant la première exécution) : sur { "20" } cas avec tous les termes d'erreur activés, les ensembles visibles et le statut sont identiques, les erreurs de distance brutes concordent à { "1.4e-14" } m, les vecteurs et grandeurs d'erreur de position à { "1.4e-9" } m face à un seuil de { "1e-6" } m, et le p95 de chaque point égale numpy.percentile bit pour bit ; les corrections de station ont MANQUÉ leur seuil de { "1e-9" } m (au pire { "3.73e-9" } m, { "15" } cas sur { "20" }), et avec elles les erreurs de distance corrigées : vérifié en arithmétique à 60 chiffres, les deux côtés sont à l'arrondi de la double précision de la valeur exacte, le terme de levé étant une différence de deux distances de { "1e7" } m dont l'unité de la dernière place est { "1.86e-9" } m ; consigné, non ajusté. Le type se réduit exactement au type lunar-differential-pnt pour un point, une époque et un essai. Le modèle d'erreur, le modèle de décorrélation et chaque seuil sont propres à ce projet ou ILLUSTRATIVE ; rien ici n'est une déclaration sur un système réel

# text
seg-7ecf4b0038b0 = Masques d'horizon du terrain lunaire à partir d'un profil indiqué ou d'un MNT polaire

# text
seg-7102948907bc = Masques d'horizon par site dépendant de l'azimut pour le type lunar-station-coverage (la station de référence et chaque point utilisateur) et la grille moonlight-service-volume et son site d'export par satellite (chaque ligne d'export gagne clears_terrain), au format de table d'horizon { "0.36" } (skyline::Skyline, linéaire en azimut avec bouclage à { "360" } deg ; un profil indiqué et un horizon de MNT en un site se combinent par leur maximum point à point) : un station_horizon ou user_horizon de [terrain] indiqué, étiqueté avec sa source, et/ou un horizon obtenu par lancer de rayons sur un MNT stéréographique polaire sud (la disposition polaire en grille LRO LOLA, lue depuis un descripteur qui fixe sa taille et son SHA-256, ou une tuile realdata::lola_dem en latitude/longitude avec dem_tile_path de [terrain], reprise avec son SHA-256) le long de grands cercles de la sphère lunaire avec courbure exacte, depuis une hauteur de mât indiquée, à un pas d'azimut et une portée indiqués. Un satellite compte en un site lorsqu'il dépasse le mask_deg plat et l'horizon à son azimut (lunar_service::topocentric) ; une époque que l'horizon laisse à moins de quatre satellites en un point, là où le masque plat en donne quatre, est comptée dans la raison d'indisponibilité terrain_masked. Le MNT fourni est un recadrage du produit LOLA LDEM_75S_240M du domaine public, rééchantillonné par moyenne de blocs { "5" } x { "5" } à { "1200" } m (data/lunar-dem/NOTICE.md). En son absence, chaque site garde le masque plat et chaque document est identique octet pour octet

# text
seg-dd838d199a0d = Surfaces en forme close (InternalConsistency) : le creux de la sphère nue, un cratère dans un plateau sur la sphère avec un observateur sur son centre et en dehors, et un cône analytique face à sa propre rastérisation. Sur le vrai recadrage, un lancer de rayons numpy indépendant (scripts/gen_lunar_terrain_ref.py, numpy { "2.5.3" } ; préenregistré dans tests/fixtures/lunar_terrain/PREREGISTRATION.md, commité seul dans edbb9b02 avant l'existence du script) concorde en cinq sites : hauteurs de site à { "1.0e-11" } m et les { "1800" } élévations d'horizon à { "5.5e-10" } deg face à des seuils de { "1e-6" }, nombres de rayons tronqués exacts ; cela vérifie l'arithmétique, non le terrain. Aucun chiffre publié d'horizon polaire ou d'éclairement n'a été reproduit : le recadrage fourni de { "1200" } m lisse le relief sous-kilométrique que résolvent les études d'éclairement publiées, de sorte que les horizons du MNT sont une ligne de visée MODELLED sur un vrai MNT rééchantillonné, non un horizon vérifié. Le site de la station et la constellation restent ILLUSTRATIVE ; rien ici n'est une déclaration sur un système réel

# text
seg-d37bb01e270b = Termes de multitrajet et de matériel récepteur d'une station de référence lunaire

# text
seg-1103199f019b = La section facultative [receiver] de lunar-station-coverage (LRS-02) : sigma de multitrajet dépendant de l'élévation sigma(el) = a + b exp(-el / el0) à l'utilisateur et à la station (la forme fonctionnelle aéroportée RTCA DO-229, ses a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } deg comme valeurs par défaut ; sur la Lune chaque valeur est ILLUSTRATIVE), blanc à l'utilisateur et de Gauss-Markov du premier ordre sur les époques à la station (rho = exp(-dt / tau)) ; bruit thermique de code de DLL avance-moins-retard sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))) ; biais inter-canaux par canal constants sur un essai, à l'utilisateur et à la station. Les termes de station entrent dans ses corrections, les termes utilisateur dans les mesures brutes et corrigées, chacun sur son propre flux à graine fixée. En son absence, chaque document est inchangé

# text
seg-4fbc7d86b491 = Formes closes et statistiques des propres tirages du modèle (InternalConsistency) : la formule de DLL face à un calcul à la main, la forme DO-229, la différence à ligne de base nulle de deux récepteurs, la corrélation de retard 1 de Gauss-Markov. Aucune mesure de multitrajet ou de récepteur lunaire n'existe à laquelle comparer ; les valeurs sont ILLUSTRATIVE et rien ici n'est une déclaration sur un récepteur réel

# text
seg-03796cb741b6 = Croissance de l'erreur d'éphéméride d'une station de référence lunaire sur la latence de correction

# text
seg-13b0ae9a874a = L'entrée facultative orbit_err_growth_m_per_s de lunar-station-coverage (LRS-03) : une correction appliquée latency_s après son calcul manque la croissance g latency_s de l'erreur d'orbite diffusée, g isotrope de taux RMS 3D, tirée par satellite et par essai sur son propre flux à graine fixée (taux 1-sigma en distance tau / sqrt({ "3" })), en plus de la reprojection de l'erreur figée sur la ligne de visée. En son absence, chaque document est inchangé. Un additif K5 à la comparaison aux affirmations publiées, préenregistré seul, exécute K5 à { "0.001" }, { "0.01" } et { "0.1" } m/s (ILLUSTRATIVE)

# text
seg-332ceb320b65 = Le sigma en forme close du terme de croissance et la vérification de propagation du premier ordre (InternalConsistency). L'additif K5 (tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md, préenregistré seul dans 59d88248) : K5 échoue à chaque taux, p95 3D corrigé { "369.8" } m, { "2315" } m et { "22797" } m face à un seuil de { "1.5" } m ({ "292.96" } m consigné sans croissance), comme indiqué avant l'exécution. Aucune source publique ne donne de taux de croissance lunaire : ILLUSTRATIVE

# text
seg-90307f07e0ef = Modes de solution d'une station de référence lunaire : contrainte de hauteur, trois satellites, fenêtre d'utilisateur statique

# text
seg-366c7ad03fb2 = La section facultative [solution] de lunar-station-coverage (LRS-06) : une ligne de pseudo-mesure de hauteur up . dx = e_h de 1-sigma indiqué pondérée face aux lignes de distance, un minimum de trois satellites autorisé seulement avec elle, et une résolution aux moindres carrés pondérés sur les window_epochs dernières époques avec une position statique partagée et une horloge par époque (la réponse d'un filtre pour une position statique sans bruit de processus sur les mêmes données ; les erreurs des époques sont traitées comme indépendantes). En son absence, la résolution instantanée et chaque document sont inchangés. Un additif à la comparaison aux affirmations publiées avec le style de solution des sources, préenregistré seul

# text
seg-bfe05379b7aa = La réduction instantanée et les cas en forme close du solveur (InternalConsistency). L'additif (tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md, préenregistré seul dans 001ca100) avec une contrainte de hauteur de { "1" } m, trois satellites et une fenêtre de 6 époques (réglages ILLUSTRATIVE ; les sources mentionnent un filtre, une contrainte de hauteur et trois satellites mais pas leurs réglages) : K1 à K5 échouent et K6 réussit, { "1" } sur { "6" } comme dans l'exécution consignée ; l'erreur 3D corrigée p95 de R300 passe de { "280.6" } m à { "2.11" } m (horizontale { "0.90" } m, non évaluée) et la couverture reste à { "0" }. L'hypothèse d'indépendance de la fenêtre la favorise. Pas une déclaration sur un système réel

# text
seg-611ba369ed00 = Précision et couverture d'une station de référence lunaire face aux affirmations publiées

# text
seg-4fe4f1cffa2b = Le type lunar-station-coverage exécuté sous les hypothèses publiques de la documentation publiée sur une station de référence différentielle lunaire (quatre satellites de navigation sur des orbites elliptiques figées de { "24" } h, SISE à { "95" } % de { "10" } m, bruit de code de { "0.30" } m, latence de correction de { "1" } s et de { "600" } s, un levé de station sub-décimétrique, le site d'exemple de station publié, les cercles polaires sud de { "300" } km et { "600" } km) et évalué face aux affirmations numériques des sources selon six seuils unilatéraux préenregistrés avant l'exécution : couverture de tout le pôle sud à un p95 sub-métrique (K1, K2), p95 corrigé sub-métrique et décimétrique (K3, K4), sub-métrique maintenu à { "600" } s de latence (K5), et précision maintenue de { "10" } km à { "500" } km de ligne de base (K6)

# text
seg-eb6d3be85fec = Référence : les affirmations numériques de cinq sources publiques consignées avec URL, date de récupération, SHA-256 et licence dans tests/fixtures/lunar_station/SOURCES.md (arXiv:2602.08432v3 ; diapositives de l'IOAG Cislunar PNT Workshop { "2025" } et { "2026" } ; UNOOSA ICG WG-B Lunar PNT, juin { "2024" }), transcrites avec références de pages dans tests/fixtures/lunar_station_published/CLAIMS.md. Les seuils, cas et entrées ont été préenregistrés dans tests/fixtures/lunar_station_published/PREREGISTRATION.md (révision { "2" }, 05bf9a19, commité seul avant l'exécution). { "0.36" } première exécution, un constat (reste MODELLED) : { "1" } seuil sur { "6" } est franchi. La couverture est de { "0.00" } sur les deux cercles contre >= { "0.95" }, et l'erreur 3D corrigée p95 est de { "280.6" } m ({ "300" } km), et de { "293.0" } m à { "600" } s de latence, contre <= { "1.5" } m. Le seuil décimétrique (K4) ne pouvait pas être franchi au bruit de code de { "0.30" } m des sources, ce qui reflète un conflit entre les sources plutôt qu'un résultat du modèle. K6 est franchi (rapport { "1.39" } contre <= { "1.5" }), mais comme rapport de deux chiffres dominés par la géométrie il ne constitue un élément de preuve sur la décorrélation dans aucun sens. Cause : les éléments orbitaux des satellites ne sont pas publics, et sur les éléments ILLUSTRATIVE de l'arbre un utilisateur et la station partagent quatre satellites au-dessus de { "5" } deg dans seulement { "8.2" } % ({ "300" } km) et { "6.3" } % ({ "600" } km) des époques, à géométrie quasi singulière (p95 non corrigé de { "3.8" } km face au < { "10" } m des sources). Les simulations des sources utilisaient un filtre, une contrainte de hauteur et trois satellites en vue commune, que le type instantané ne modélise pas. La comparaison ne confirme donc ni ne réfute le « sub-métrique sur tout le pôle sud » publié. Elle montre que le résultat de ce modèle dépend d'orbites qui ne sont pas publiées. Pas une déclaration sur un système réel ; ni affilié à un organisme ni approuvé par lui

# text
seg-478225d0a8e1 = Noyau de niveau de protection ARAIM lunaire

# text
seg-863690a44f21 = L'étape géométrie-vers-covariance du niveau de protection lunaire — (GᵀG)⁻¹ sur la géométrie tous-satellites-en-vue et chaque sous-géométrie à défaut unique, projetée sur la verticale locale et sur la trace du bloc horizontal — et son noyau statistique : le multiplicateur de détecteur de Bonferroni, la queue supérieure gaussienne de chaque hypothèse de défaut, et la résolution de racine faisant correspondre un budget de risque d'intégrité à un niveau de protection, sur un volume de service lunaire de 7 points

# text
seg-8191906fc700 = Deux implémentations tierces établies composées, toutes deux exécutées hors ligne, avec le montage régénéré de bout en bout et vérifié identique octet pour octet. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), commit 71db0ff, src/rtkcmn.c compilé depuis la source C avec -ULAPACK : lsq() → matinv() → ludcmp()/lubksb() inverse la matrice normale par LU de Crout à pivot partiel, un algorithme sans rapport avec l'invert4() de Gauss-Jordan écrit à la main de kshana ; numpy.linalg.inv (LAPACK getrf/getri) réinverse chacune comme troisième inverse indépendant, concordant avec RTKLIB à { "1.112e-12" } relatif. SciPy { "1.17.0" } / NumPy { "2.4.1" } (BSD-3-Clause) fournissent norm.isf, norm.sf (Cephes ndtri/ndtr) et optimize.brentq face à la série de gamma incomplète à la Numerical-Recipes de kshana, à son inverse par bissection et à sa bissection à 200 pas — et le sf direct de SciPy est une route numérique différente dans la queue lointaine de celle du { "1" } − Φ de kshana, de sorte que l'annulation dans la queue profonde est mesurée plutôt que reflétée. L'axe vertical est le vecteur unitaire radial (la définition de la verticale locale sur une Lune sphérique) et la variance horizontale est la trace du bloc horizontal, de sorte qu'aucune convention d'azimut Est/Nord n'est partagée. EXPLICITEMENT PAS VALIDATED PAR CETTE LIGNE : σ_URE, l'a priori de défaut par satellite et la constellation illustrative de classe Moonlight/LCNS sont des entrées MODELLED remises telles quelles à la référence indépendante ; et la FORME de l'équation d'intégrité MHSS à défaut unique est transcrite de la même borne publiée que kshana implémente — une forme close partagée est une hypothèse partagée, de sorte que cette ligne couvre une mauvaise évaluation de cette équation, non un mauvais choix de celle-ci. Aucune implémentation ARAIM MHSS tierce n'est accessible (RTKLIB n'expose aucun point d'entrée de niveau de protection, aucune distribution PyPI de ce type n'existe, Stanford MAAST est en MATLAB), ce qui est l'amélioration restante

# text
seg-0ec1699f5754 = Niveaux de protection ARAIM MHSS face à des vecteurs de référence publiés

# text
# c1: araim-reference-check
seg-fbaaf3ad7648 = L'équation de niveau de protection à séparation de solutions à hypothèses multiples elle-même : moindres carrés pondérés tous-satellites-en-vue et par mode de défaut sur une géométrie Est/Nord/Haut avec un état d'horloge par constellation, les sigmas de sous-solutions, les sigmas de séparation de solutions et les projections de biais nominaux unilatérales, les seuils K_fa de Bonferroni, l'allocation de risque des défauts non surveillés, et les VPL/HPL qui résolvent l'équation de risque d'intégrité. Exécutable comme type de scénario <c1/>

# text
seg-483b91a7aace = Groupe de travail C UE-États-Unis, sous-groupe technique ARAIM, Reference Airborne Algorithm Description Document v3.1 ({ "20" } juin { "2019" }), exemple numérique traité de l'annexe D — ENTRÉES publiées (matrice de géométrie à 10 satellites et 2 constellations, diagonales C_int/C_acc, b_nom, P_sat, P_const, constantes LPV-200) et SORTIES publiées (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" }, et six intermédiaires de défaut de constellation), récupérées le 2026-09-20, SHA-256 de la source 7f42934488c5c2261363439fabd48385e39526df34d514f395e22b6990b6bdb7. Concordance à la tolérance PROPRE indiquée de la référence TOL_PL = { "5e-2" } m : VPL { "0.0074" } m, HPL { "0.0437" } m ; EMT et σ_v_acc à leur précision imprimée. Le Milestone { "3" } Report ({ "2016" }) du même sous-groupe, annexe A §A.IX, énonce le même exemple mais est incohérent en lui-même — une faute de signe à la ligne { "3" } de G (+{ "0.7477" } là où le document de { "2019" } imprime −{ "0.7477" } ; avec le plus, le σ_v_acc propre du document ressort à { "0.8690" } m contre son { "1.47" } m publié), et un K_fa_3 évalué à { "57" } modes de défaut alors que le document indique N_fault_max = { "1" }, soit { "12" }, de sorte que son EMT suit le seuil à 57 modes et que ses VPL/HPL ne le suivent pas. Aucune implémentation fidèle ne peut reproduire toutes ses sorties à la fois. Ses intermédiaires de géométrie se reproduisent exactement et ses niveaux de protection sont consignés comme écarts mesurés (VPL { "0.0171" } m, HPL { "0.0842" } m, EMT { "0.4806" } m), exclus du chiffre d'acceptation ; la tolérance n'a pas été élargie pour les absorber. PÉRIMÈTRE : N_fault_max = { "1" } seulement — les sous-ensembles de défauts multi-événements sont refusés plutôt que tronqués, et l'exclusion, le contrôle de cohérence du khi-deux et l'étape de réallocation du double comptage restent MODELLED

# text
seg-7bfcb5c6a985 = ARAIM avec hypothèses de défaut simultané de plusieurs satellites

# text
seg-15043111e437 = araim_reference::add_v42_subset_plan : la règle de détermination des sous-ensembles de l'ADD v4.2 (P_THRES, FC_THRES, sous-ensembles surveillés en retirant le moins d'éléments d'abord) généralisée des paires à des combinaisons simultanées d'au plus max_order événements de satellite et de constellation, avec l'a priori exact P_no fault prod q_e ; add_v42_protection_levels_to_order exécute dessus le chemin de niveau de protection de l'ADD v4.2 (l'ordre { "2" } est exactement le chemin existant). raim::araim_subset_raim (facultatif) : RAIM avancé sur cet ensemble d'hypothèses, chaque sous-ensemble surveillé étant un mode (p_fault, T, b, sigma) dans la somme de risque d'intégrité, les sous-ensembles inobservables reportés dans le risque non surveillé, le budget mis à l'échelle par l'allocation de l'ADD du risque non surveillé, et le sous-ensemble de plus grande séparation normalisée rapporté lorsqu'un défaut est détecté. Les a priori exigeant des sous-ensembles plus profonds que max_order sont refusés, jamais tronqués

# text
seg-6c6076ea1eee = Cohérence interne (InternalConsistency) : la réduction à l'ordre 2 vers le chemin ADD v4.2 contrôlé par MAAST, la redérivation indépendante des a priori, et un défaut à deux satellites construit. Aucune exécution de MAAST ou de RTKLIB au-delà des paires n'a été faite, de sorte que les ensembles d'hypothèses plus profonds et les niveaux de protection du RAIM par sous-ensembles ne sont pas vérifiés de façon externe. araim_subset_raim partage les simplifications d'araim_dual_raim (un sigma pour l'intégrité et la précision, une horloge, la queue normale simple) : il n'est pas conforme à l'ADD

# text
seg-48ca01332f8f = RAIM à côté des chiffres de mérite du holdover d'horloge

# text
seg-890f1006a75d = La section facultative [integrity] du type clock (clock_integrity::run) : à partir d'un site indiqué et de préréglages de constellation (geometry::sky_geometry), à chaque époque d'intégrité tant que la chronologie GNSS n'est pas refusée, RAIM instantané (raim::snapshot_raim : test du khi-deux de parité, niveaux de protection de pente) sur les satellites au-dessus du masque avec des résidus gaussiens à graine fixée de sigma indiqué et un biais indiqué facultatif ; un bloc séparé integrity_fom avec les verdicts par époque, les niveaux de protection et la disponibilité. Les époques refusées sont rapportées indisponibles, jamais extrapolées ; les chiffres de mérite du holdover sont inchangés et, sans la section, la sortie est identique octet pour octet

# text
seg-c2860bf4b562 = Cohérence interne (InternalConsistency) : les niveaux de protection sont ceux de snapshot_raim, vérifié face à RTKLIB dans sa propre ligne, recalculés sur la même géométrie ; comportement sans défaut et avec défaut injecté. Le ciel est une géométrie de préréglage représentative (et non un almanach daté), les résidus sont synthétiques et sigma, les limites d'alerte et les probabilités sont des entrées indiquées ; rien ici n'est une déclaration sur la disponibilité d'un récepteur réel

# text
seg-9cbb4ee7588a = Observabilité de longueur d'arc cislunaire spatiale, bruitée, multi-familles

# text
seg-5ebd771deef8 = Le seuil d'observabilité de longueur d'arc cislunaire dans le CR3BP SPATIAL à six états plutôt que planaire à quatre états, à travers les familles DRO, halo L2 et halo quasi rectiligne L2, avec le bruit de mesure entrant dans le gramien et DEUX critères rapportés parce qu'il n'y en a pas un seul d'honnête : le critère de rang publié, qui est démontrablement invariant à un sigma de mesure homoscédastique (le blanchiment multiplie la matrice d'observabilité par un scalaire, laissant inchangés le spectre relatif des valeurs singulières et donc le rang, le défaut et le conditionnement), et un critère d'estimabilité — le premier arc auquel l'incertitude formelle 1σ de position de l'état initial du chef passe sous une borne indiquée — qui est celui qui évolue bien avec le bruit. Chaque seuil porte l'encadrement de grille d'époques dans lequel il se situe ; un critère non atteint est null avec une raison. Le mode planaire reste le défaut et les familles hors plan y sont refusées plutôt qu'aplaties en un état qui ne peut pas les représenter

# text
seg-046231819882 = Un rang par échelonnement de lignes indépendant, par élimination de Gauss à pivot partiel, confirme chaque verdict de rang à six états — un algorithme différent ne partageant aucun code avec la voie valeurs propres/SVD testée. La matrice de transition d'état du CR3BP { "6" }×{ "6" } qu'elle compose porte sa propre référence ReferenceImpl face à l'intégration variationnelle de SciPy, et les conditions initiales de halo/NRHO proviennent d'un correcteur qui reproduit l'orbite Gateway L2 sud { "9" }:{ "2" } publiée. La branche existante à filtre d'information en racine carrée n'est explicitement PAS comptée comme corroboration : elle consomme les mêmes jacobiens et se réduit à la même matrice normale, c'est donc une vérification de cohérence entre deux machines numériques, et l'étiquette d'extension émise le dit. PAS ancré de façon externe, et ExternalDataset est donc écarté plutôt qu'emprunté à la ligne de la STM : les longueurs d'arc de seuil elles-mêmes dépendent de la conception de constellation MODELLED, de la grille d'époques et — de façon mesurable, jusqu'à { "40" }× — de la tolérance sur les valeurs singulières. Le { "2.09" } h planaire publié est reproduit exactement à rel_tol = { "1e-6" } et dépend lui-même de la tolérance ({ "10.25" } h à { "1e-4" }, { "0.42" } h à { "1e-8" }), ce qui est une propriété du critère et non de l'orbite. Aucun jeu de données public ne publie de seuil d'observabilité de longueur d'arc pour une constellation cislunaire choisie. RÉSULTAT MESURÉ : le seuil spatial à six états est de { "22.17" } h pour la NRHO L2 et de { "40.42" } h pour le halo L2, et N'EXISTE PAS pour la famille DRO planaire sur laquelle l'affirmation publiée a été établie — rang { "4" } sur { "6" } avec défaut de datum { "2" } et deux valeurs propres exactement nulles, un défaut structurel qu'aucune longueur d'arc ne rétablit

# text
seg-e250321394bc = Erreur de prédiction d'orientation de la Terre de style opérationnel, mesurée prédit contre final

# text
seg-0e443d241460 = Un ajustement aux moindres carrés biais-plus-pente sur une fenêtre glissante plus les principaux termes périodiques — annuel, semi-annuel et les deux principales marées zonales pour UT1 ; Chandler, annuel et semi-annuel pour le pôle — extrapolé avec le dernier résidu de la fenêtre reporté : la classe qu'utilise le Bulletin A de l'IERS, à la place du prédicteur de persistance sur lequel reposait l'horizon publié. Évalué de la seule façon honnête : une prévision pour T+h construite à partir de lignes rapides du Bulletin A à T ou avant, mesurée face au final du Bulletin B PUBLIÉ PLUS TARD à T+h, la persistance étant évaluée à côté sur le même ensemble d'époques face aux mêmes finals. Une époque cible sans final publié est écartée plutôt que réévaluée face à la colonne rapide ; un terme périodique que la fenêtre ne peut pas contraindre est rapporté comme rejeté avec les cycles qu'elle couvre réellement ; une fenêtre incomplète est refusée plutôt que raccourcie discrètement

# text
seg-822a1ce99154 = Trois voies indépendantes, aucune n'étant un chiffre de précision de prédiction publié. ({ "1" }) Un signal analytique à coefficients connus — la seule façon d'exercer la mécanique périodique, puisqu'aucune série commitée n'est assez longue pour admettre un terme annuel. ({ "2" }) La solution aux moindres carrés en forme close des manuels, une algèbre différente de la résolution matricielle testée, sur des lignes réelles. ({ "3" }) Les véritables lignes de prédiction archivées du Bulletin A que publie le produit réel de { "2026" }, comparées par échéance comme statistique de CONCORDANCE et explicitement non comme erreur : { "0.256" } ms à { "1" } jour, { "0.695" } ms à { "2" } jours, { "1.252" } ms à { "3" } jours, dérivant à { "3.885" } ms à { "9" } jours. Il s'agit donc de la CLASSE du Bulletin A, proche à courte échéance, non du Bulletin A. Les résidus prédit-contre-final sont de vraies grandeurs mesurées sur de vraies lignes de l'IERS, mais leur ordre de grandeur est vérifié seulement par rapport au SENS de la comparaison, jamais par rapport à un chiffre de précision publié par l'IERS — lire un produit réel est de la provenance, non une référence indépendante. MESURÉ : au jour { "1" } le prédicteur opérationnel donne { "3.78" } m d'erreur en référentiel lunaire contre { "11.39" } m pour la persistance ({ "3.01" }×), au jour { "2" } { "10.23" } m contre { "21.72" } m ({ "2.12" }×), au jour { "3" } { "20.33" } m contre { "30.57" } m ({ "1.50" }×) — et il est PIRE au-delà de trois jours ({ "0.87" }× à { "5" } jours, { "0.43" }× à { "10" }), ce que le rapport émet plutôt que de ne montrer que les horizons qui le flattent. NON reproduits : le filtre résiduel autorégressif et la réduction tabulée des marées zonales, la fenêtre opérationnelle de 365 jours est inaccessible avec les données commitées, et AUCUN millésime antérieur archivé de la série n'existe dans ce dépôt — de sorte que le tableau des millésimes archivés ne rapporte aucune ligne plutôt que d'en évaluer une synthétisée. { "0.30" } comparaison externe, un constat (reste MODELLED) : évalué face aux mêmes finals sur { "178" } numéros archivés du Bulletin A avec la fenêtre de 15 jours par défaut de la crate, le MAE d'UT1 du prédicteur est de 2.4x à 12.6x celui du Bulletin A à { "1" } à { "10" } jours (seuil 1.5x) et de { "5.32" } ms à { "10" } jours, hors de la plage de { "0.36" } à { "3.13" } ms du 2e EOP PCC ; le pôle est de 1.5x à 1.85x celui du Bulletin A (dans 1.5x seulement à { "6" } et { "7" } jours) ; { "19" } conditions préenregistrées sur { "21" } échouent. Correction à la voie ({ "3" }) : les lignes du produit de { "2026" } auxquelles elle a été comparée portent l'indicateur I de l'IERS (mesuré), non P, de sorte que ces chiffres de concordance sont face à des valeurs rapides mesurées, non à des prédictions du Bulletin A. { "0.30" } tour { "2" }, un prédicteur aux moindres carrés plus autorégressif avec les marées zonales retirées analytiquement, face à { "178" } numéros archivés du Bulletin A au seuil du tour 1 (préenregistré c93605b4), un constat (reste MODELLED) : { "12" } conditions sur { "21" } tiennent ; le MAE d'UT1 est de { "1.73" } à 2.11x celui du Bulletin A à { "2" } à { "10" } jours (seuil 1.5x) tandis que le pôle est à 1.27x près à chaque échéance. { "0.30" } révision : l'entrée hors ligne étant désormais classée par indicateur IERS, les chiffres de concordance de la voie ({ "3" }) sont face à de vraies prédictions du Bulletin A (0.256/0.695/1.252/3.885 ms à 1/2/3/9 jours face aux lignes rapides -> 0.133/0.421/0.839/2.786 ms)

# text
seg-f4efd94dd746 = Datum du référentiel lunaire issu d'une campagne d'observation

# text
# c1: lunar-frame-campaign
seg-a6972eb89d7d = Le datum de Helmert à sept paramètres propagé à partir d'une CAMPAGNE D'OBSERVATION SIMULÉE plutôt que retrouvé à partir d'une transformation injectée. Des stations terrestres observent un catalogue sourcé de balises de surface lunaire selon un plan explicite ; les dérivées partielles de retard VLBI lunaire sont accumulées en une matrice d'information de Fisher des coordonnées de balise et poussées à travers la conception de Helmert A = [I₃ | [p]ₓ | p] dans H = AᵀM_bA, de sorte que la précision de datum rapportée est une fonction du programme d'observation — exactement linéaire en le sigma de retard et monotone en l'arc via la libration que le rapport MESURE. Le défaut de datum est le sujet plutôt qu'une note de bas de page : rang, défaut, nombre de conditionnement, spectre, directions inobservables dans la base à sept paramètres, la direction la plus faible même à rang plein et la part de chaque paramètre dans celle-ci sont émis à chaque exécution, et tout paramètre que la campagne ne contraint pas est publié comme NULL avec un statut. La corrélation d'erreur de balise est MESURÉE, non supposée — exactement nulle avec les stations tenues fixes, et imprimée avec son coût lorsqu'elles sont estimées. Exécutable comme type de scénario <c1/>

# text
seg-8eedf0240350 = Identités en forme close et une voie indépendante dans le dépôt, sans référence indépendante externe revendiquée. La conception de Helmert — la seule nouvelle dérivée du module — est redérivée par différence finie centrale de lunar_frame_realise::apply_helmert, un chemin ne partageant aucune expression avec la forme analytique. L'accumulation qu'elle compose est celle de lunar-vlbi-fim, dont le jacobien est différencié en différences finies face à lunar_vlbi::vlbi_delay_s à cet endroit, et dont le noyau d'algèbre linéaire est par ailleurs ancré de façon externe face à numpy dans tests/fim_observability_reference.rs — cette ligne n'emprunte aucun de ces deux statuts. La référence physique est structurelle plutôt que numérique : une dérivée partielle de retard de balise est la DIFFÉRENCE en champ proche de deux vecteurs unitaires presque parallèles, de sorte que la direction de translation la moins bien déterminée DOIT être la direction liée au corps vers la Terre, et le test vérifie la réponse calculée face à la direction mesurée séparément. MESURÉ : sigma de translation dérivé de la campagne { "6.3975" } m contre l'erreur de récupération de { "0.3125" } m du scénario à transformation injectée ({ "20.5" }× plus serré), tandis que la rotation et l'échelle vont dans le sens CONTRAIRE, { "2.32" }× et { "13.5" }× plus lâches — le chemin injecté suppose un seul sigma isotrope et répartit donc son erreur uniformément sur sept paramètres, ce que l'observable de retard ne fait pas. Rang 7/7 mais conditionnement { "3.8e5" }, avec une direction { "99.57" } % de pure translation vers la Terre et quarante fois pire que toute autre. CE QUE CETTE LIGNE NE REVENDIQUE PAS : que le chiffre de la campagne soit juste en valeur absolue. Elle établit que le chiffre DÉRIVE désormais d'un plan, d'une géométrie et d'un modèle d'erreur plutôt que d'une réponse plantée. Reste ReferenceImpl/MODELLED : aucun couple campagne-plus-covariance de datum de VLBI lunaire publié n'existe, le réseau de stations et le sigma de retard sont des entrées ILLUSTRATIVE (le catalogue de balises est sourcé, la campagne ne l'est pas), les observations sont traitées comme indépendantes alors que la troposphère et l'horloge d'une vraie session sont corrélées entre balayages voisins, et l'éphéméride, les horloges, la troposphère et les paramètres d'orientation de la Terre sont tenus FIXES. { "0.30" } comparaison externe, un constat (reste MODELLED) : avec chaque ligne du jacobien de balise reconstruite à partir des temps de lumière NAIF SPICE (DE440, ITRF93, MOON_ME ; préenregistré { "50863551" }), le plan, le rang de Helmert, les sigmas de datum (à { "4.7e-3" } près), le conditionnement, la direction la plus faible ({ "0.07" } deg), le balayage de libration et l'ordre des arcs concordent sur six scénarios aux seuils préenregistrés de { "1" } % / { "0.2" } / { "0.05" } deg. NumPy sur le jacobien commité du moteur concorde à { "3e-14" } près lorsque les stations sont fixes. Avec les stations estimées il diffère de { "6.8e-6" } face à un seuil préenregistré de { "1e-9" }, dont la prémisse sur le conditionnement était fausse (conditionnement de Helmert { "2.1e8" } ; des voies NumPy indépendantes divergent de { "3e-6" } ; une contribution du repli par pseudo-inverse de { "1e-9" } du moteur n'est pas exclue), de sorte que la ligne n'est pas promue sur ce préenregistrement. { "0.36" } nouvel enregistrement à un seuil mis à l'échelle du conditionnement (préenregistré b887eb05 ; t = max({ "1e-12" }, { "10" } kappa { "2" }^-53) à partir du conditionnement de l'information conjointe et de sa réduction de Helmert), un constat (reste MODELLED, NOT MET) : l'étape { "0" } écarte le repli par pseudo-inverse comme cause de l'écart de { "6.8e-6" } (aucune matrice en amont de la matrice de Helmert ne se replie sur les six scénarios d'origine, marge la plus serrée d'un facteur { "2.6" }), la branche SPICE tient toujours sur les six, et NumPy concorde dans le seuil sur six scénarios sur huit (défaut, les deux arcs, le sigma de retard 3x, le défaut colinéaire et l'exécution fraîche à stations fixes du 2026-12-01 ; au pire { "0.13" } de son seuil). Il échoue sur stations_estimated (sigmas de datum jusqu'à { "6.8e-6" }, conditionnement { "9.1e-6" }, norme avec indépendance écartée { "3.5e-6" }, face à t = { "5.9e-7" }), et à la date fraîche la balise du pôle sud n'a aucune observation, de sorte que l'information de balise est de rang déficient (repli par pseudo-inverse en amont de la matrice de Helmert dans les deux scénarios frais) et la référence NumPy inchangée ne peut pas évaluer stations_estimated_fresh (matrice singulière). Résultats : docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md

# text
seg-ca481f2d8f9e = Corroboration par un estimateur indépendant du seuil de longueur d'arc cislunaire

# text
# c1: cislunar-arc-recovery
seg-3d5fbf896209 = Un estimateur aux moindres carrés par lots qui RETROUVE l'état initial du chef à partir de mesures inter-satellites simulées sur des préfixes croissants de la même grille d'époques que celle du tableau rang-contre-arc, avec les dérivées partielles de mesure prises comme différences finies centrales du modèle direct composé. Il ne consomme rien de la mécanique avec laquelle le seuil a été mesuré — aucune ligne de jacobien analytique, aucune matrice de transition d'état variationnelle, aucune décomposition en valeurs singulières ou propres, aucune tolérance de rang, aucun filtre d'information en racine carrée — et ne partage que la dynamique, les conditions initiales, l'observable scalaire et la grille d'époques, chacun nommé dans le document émis. Deux critères, tous deux balayés : la récupération sans bruit (l'analogue du rang) et l'estimabilité Monte-Carlo (l'analogue de l'estimabilité, mesurée face à une vérité connue plutôt que prédite à partir d'une covariance). Exécutable comme type de scénario <c1/>

# text
seg-60e30948cee7 = Un estimateur séparé de cette base de code, sur un algorithme différent et un chemin de code disjoint : Gauss-Newton pondéré non linéaire à dérivées partielles par différences finies, son verdict lu comme une erreur de récupération d'état mesurée en km et mm/s. Il n'a aucune expression en commun avec la voie rang-et-covariance du gramien, et la séparation est IMPOSÉE par une garde sur le texte source plutôt qu'affirmée. MESURÉ sur la grille DRO planaire publiée : le critère d'ESTIMABILITÉ est CORROBORATED — la frontière Monte-Carlo mesurée est de { "5.739130" } h contre { "5.739130" } h formel (rapport { "1.0000" }), et le RMS mesuré reproduit le 1σ formel sur { "21" } longueurs d'arc à un rapport de moyenne géométrique de { "0.9804" }. Le critère de RANG n'est PAS corroboré comme frontière de récupérabilité : l'estimateur récupère à partir de { "0.782609" } h contre { "2.086957" } h pour le gramien, rapport { "0.375" }, et à { "1.826087" } h — le dernier préfixe que la lecture du rang note { "3" } sur { "4" } — récupère à { "1.96e-5" } du déplacement a priori. La frontière de récupération est immobile sur trois décades de sa propre borne tandis que le seuil de rang va de « jamais » à { "0.782609" } h sur quatre décades de rel_tol, et les deux coïncident exactement à rel_tol = { "1e-8" }. Cette étendue avait d'abord été consignée comme atteignant { "0.260870" } h ; ce chiffre était un ARTEFACT, produit par une lecture du rang qui comptait { "4" } directions à partir de { "2" } lignes de mesure sous le plancher de bruit f64, et il est corrigé ici plutôt que laissé en place. La lecture du rang est désormais bornée par l'inégalité de Sylvester avec la raison émise, et l'étendue corrigée sature exactement à l'arc où l'estimateur indépendant récupère, ce qui renforce la validation croisée de cette ligne plutôt que de l'affaiblir : le { "1e-6" } publié est une CONVENTION prudente sur les valeurs singulières, non une affirmation sur la récupérabilité. Même schéma dans l'espace : NRHO { "9.290323" } h contre { "21.677419" } h, halo { "22.978723" } h contre { "39.829787" } h, l'estimabilité concordant exactement dans les deux cas. Le DRO planaire à six états ne récupère à aucun arc, reproduisant de façon indépendante le défaut de datum structurel de cette famille à partir d'un estimateur à qui rien n'en a été dit. PAS ancré de façon externe — la dynamique et les conditions initiales sont partagées avec l'analyse testée et aucun jeu de données public ne publie un tel seuil — de sorte que ExternalDataset est écarté

# text
seg-f839285852d9 = Volume de service lunaire à partir d'une géométrie de constellation réelle, récupérée

# text
# c1: ephemeris_path
seg-c3059fcced49 = Accepte une éphéméride d'état tabulée centrée sur la Lune (l'évaluation d'un noyau SPK/BSP) ou une définition de constellation publiée derrière <c1/>, exécute le même balayage de couverture / DOP / niveau de protection sur elle, et émet l'exigence de télémétrie σ_URE qu'elle implique À CÔTÉ des résultats képlériens illustratifs et perturbés inchangés, la différence formant sa propre grandeur nommée. Chaque chiffre porte une classe de provenance qui distingue ce qui est issu d'un noyau, ce qui est issu d'éléments publiés et ce qui est modélisé, de sorte que les uns et les autres ne puissent jamais être confondus dans une citation en aval

# text
seg-cbe9bd6bf989 = La GÉOMÉTRIE est externe et hachée : trois montages dont les nombres proviennent seulement de documents récupérés avec URL, date de récupération et SHA-256, régénérables par des générateurs commités qui vérifient le hachage amont et ABANDONNENT plutôt que d'émettre un nombre — la constellation de référence de démonstration d'interopérabilité LANS (NASA NTRS { "20250009447" }, SHA-256 d1b916be…), les études de cas LNCSS (NAVIGATION { "70" }({ "4" }) navi.613, CC BY, SHA-256 { "4e294687" }…), et une véritable éphéméride d'engins spatiaux réellement volés pour LRO, Danuri, Chandrayaan-2 et CAPSTONE évaluée à partir des propres noyaux reconstruits du JPL via Horizons. AUCUN noyau de constellation de navigation lunaire n'existe publiquement — Moonlight/LCNS, LCRNS et LNSS ne volent pas et le NAIF n'en publie rien — et aucun n'a été inventé. L'exigence σ_URE DÉRIVÉE n'a AUCUNE référence indépendante externe (personne ne publie la précision de télémétrie qu'exige un HPL lunaire de { "50" } m sur ce volume de service), elle est donc vérifiée face à sa propre identité algébrique et, de façon indépendante, en réexécutant tout le balayage à l'exigence calculée et en confirmant que la disponibilité bascule là. MESURÉ : la conception publiée à 8 satellites exige σ_URE { "2.9044" } m à { "100" } % de couverture contre { "0.3591" } m à { "37.85" } % pour la constellation illustrative — une révision d'un facteur { "8.09" }× d'un chiffre publié selon la règle de programme R4. La conclusion qualitative subsiste (la classe LNIS de { "30" } m ne ferme toujours pas un HPL polaire sud de { "50" } m) mais le déficit était surestimé huit fois. La démonstration LANS à 5 satellites donne ZÉRO échantillon de niveau de protection — cinq satellites ne peuvent donner les six en vue qu'exige un ensemble d'hypothèses à défaut unique — et le champ d'exigence est ABSENT plutôt qu'inventé ; de même pour les quatre engins spatiaux réels à { "0" } % de couverture. InternalConsistency est le genre honnête : les données d'ENTRÉE sont externes et hachées, mais la grandeur dont traite cette ligne n'est vérifiée que face à elle-même. { "0.30" } comparaison externe, un constat (reste MODELLED) : face aux statistiques d'études de cas LNCSS de navi.613 sur { "346" } points de grille, { "4" } statistiques de disponibilité sur { "12" } tombent hors des { "2" } points de pourcentage préenregistrés (cas A : -4.0, +{ "22.5" } et -3.6 pp ; cas B : -12.1 pp). Causes probables : éléments lus dans le mauvais référentiel, Kepler à deux corps sur { "15" } jours face au modèle de forces non précisé de l'article, et grille non reproductible à partir du texte. La moitié PDOP n'était pas évaluable (LANS n'imprime aucune statistique numérique) ; le test de comparaison est commité ignoré. { "0.30" } tour { "2" }, un constat (reste MODELLED) : face à une référence indépendante Orekit { "12.2" } / Hipparchus { "3.1" } calculant tout le rapport (propagation Orekit, visibilité et DOP par DOPComputer, niveaux de protection MHSS composés avec Hipparchus, l'exigence résolue par échantillon ; préenregistré d3ce97b2) sur les cinq géométries récupérées et deux grilles, { "155" } valeurs sur { "160" } concordent aux seuils préenregistrés ({ "2" } pp, { "5" } %, { "1" } %), y compris l'exigence sigma_URE pour LNCSS A et C ({ "3.879072208" } m des deux côtés pour le cas A) et l'exigence absente pour LANS et les orbiteurs. LNCSS B sur la grille dense échoue sur ses statistiques de pire échantillon (sigma_required { "0.000923" } contre { "0.001511" } m, hpl_max { "1.63e6" } contre { "0.99e6" } m) là où des géométries quasi singulières (PDOP d'environ { "1e6" }) amplifient la concordance de position au mètre ; son exigence p95 concorde ({ "1.6343" } contre { "1.6357" } m). L'exigence au pire échantillon est mal posée sur une géométrie dégénérée. Face à navi.613 : { "4" } sur { "12" } toujours hors de { "2" } pp (épinglé)

# text
seg-36a6cfaf5afa = Unité et provenance déclarées pour chaque grandeur rapportée

# text
# c1: inherits-scenario-label
# c2: depends-on-input
seg-12460501e82b = Un schéma lisible par machine donnant l'unité, la classe de provenance et la définition de chaque champ numérique de chaque rapport de scénario, plus une porte globale unique qui exécute chaque type de scénario enregistré et échoue si un champ numérique émis manque de l'un ou de l'autre. Le vocabulaire de provenance est fermé et chaque classe porte un niveau de preuve, deux classes étant volontairement associées à <c1/> et <c2/> plutôt que de se voir attribuer un niveau que la classe ne détermine pas

# text
# c1: m
# c2: _m
# c3: sweep-nd
# c4: mixed - see note
# c5: key_units
# c6: metric_units
# c7: unit
# c8: cislunar-observability
# c9: units
seg-a8c4a6fd4989 = Le document émis lui-même : chaque feuille numérique doit se résoudre en une entrée du propre bloc d'unités de ce document. Il n'existe aucun registre d'unités externe face auquel vérifier une unité DÉCLARÉE, de sorte qu'une unité déclarée est une assertion relue et non vérifiée — la porte vérifie l'EXHAUSTIVITÉ et la BONNE FORMATION, non la vérité, et « vérifié » serait faux parce que rien d'externe ne confirme que <c1/> est la bonne unité pour un champ nommé <c2/>. Un recoupement indépendant par suffixe de nom a été exécuté sur les { "1,434" } champs décrits À CE MOMENT-LÀ : sur les { "691" } portant un suffixe porteur d'unité, { "40" } divergent de l'unité déclarée et les { "40" } sont tous expliqués (suffixes par seconde, minima, secondes-ouverture, newton-mètres face à un suffixe qui ressemble à un nanomètre), de sorte qu'aucune unité erronée n'est apparue. Ce recoupement n'a pas été réexécuté depuis, et la couverture a dépassé ce point — le chiffre est laissé à ce qui a réellement été mesuré plutôt que ré-énoncé au total actuel. Au moment de ce changement ({ "0.27.0" }), la couverture est passée de { "7" } types sur { "56" } à { "60" } sur { "61" }, et de { "389" } champs sur { "1354" } à { "1,742" } sur { "1,744" } (docs/field-units-schema.json, qu'un contrôle de péremption maintient à jour). AUCUN type ne reste non couvert (plafond { "0" }, FUT-28, { "0.36" }) : le dernier était <c3/>, dont deux colonnes sont indexées par l'appelant, si bien que leurs unités sont des données ; elles sont désormais décrites comme <c4/> et l'unité de chaque position est lue dans le propre tableau d'unités du paquet BALAYÉ dans <c5/> et <c6/> (ou prise dans l'<c7/> déclaré de l'axe, qui doit concorder avec celui du paquet lorsque les deux existent ; null lorsqu'aucun n'existe, indiqué plutôt que deviné). <c8/> était celui d'avant, et est sorti de la liste lorsque son document publié a gagné un bloc d'unités : l'épingle d'additivité qui avait nommé <c9/> comme clé interdite PROUVE désormais que l'ajout est additif — retirer le bloc et le document se hache toujours aux deux constantes figées avant son existence, de sorte qu'une valeur publiée qui aurait bougé sous l'ajout échoue toujours. Le travail a aussi fait apparaître douze défauts d'unités ou de documentation dans le code existant, rapportés plutôt que corrigés selon R1

# text
seg-cf779c468eed = Datum du référentiel lunaire issu d'une campagne d'observation RÉELLE

# text
# c1: lunar-llr-datum
seg-96151f13a92b = La covariance du datum de Helmert à sept paramètres, ses deux entrées simulées remplacées par des entrées mesurées : le plan est constitué des époques d'émission au sol de { "337" } points normaux archivés de télémétrie laser lunaire de l'ILRS (2015-04-08 à 2015-06-27, Grasse MeO { "7845" } et Matera MLRO { "7941" }, les cinq réseaux de rétroréflecteurs) et chaque poids d'observation est la propre précision archivée de ce point bin_rms/√n_raw — médiane { "5.13" } mm de distance aller, lue dans le fichier. Coordonnées de stations ITRF2020 de l'IERS, coordonnées des réflecteurs JPL DE430 tableau { "7" }. Exécutable comme type de scénario <c1/>. L'affirmation vérifiée ({ "0.36" }) est étroite : sur la voie analytique par défaut, le calcul de covariance du datum concorde avec une référence indépendante SPICE de temps de lumière et NumPy sur des points normaux mesurés frais ; ce n'est pas une précision LLR et pas un élément de preuve que la Lune analytique est précise

# text
seg-50c60fc25ded = Identités en forme close, une voie indépendante dans le dépôt et, depuis { "0.36" }, une référence indépendante de bibliothèques SPICE et NumPy sur des données mesurées fraîches (ci-dessous) ; aucun couple covariance de datum-LLR lunaire publié n'existe auquel comparer, aucune précision n'est donc revendiquée. La seule nouvelle dérivée — la dérivée partielle de la distance par rapport à la position liée au corps du réflecteur — est redérivée par différence finie centrale du temps de lumière aller-retour qu'elle différentie, un chemin ne partageant aucune expression avec la forme analytique. La référence physique est structurelle : la dérivée partielle d'une distance EST le double de la ligne de visée, de sorte que la coordonnée liée au corps le long de la direction moyenne vers la Terre doit être déterminée bien mieux que les deux coordonnées dans le plan du ciel, que seule la libration atteint — mesuré de { "50.7" }× à { "71.7" }× sur les cinq réseaux face à un balayage de libration que le rapport mesure indépendamment, la prédiction isotrope aux petits angles et l'anisotropie transverse qui explique l'écart étant toutes deux imprimées. CE QUI A CHANGÉ : le plan, le nombre d'observations et chaque poids d'observation sont désormais mesurés ; { "337" } points archivés sur { "349" } sont utilisés et les { "12" } qui ne le sont pas sont ignorés et comptés, parce que l'ITRF2020 ne porte aucune position pour Apache Point. MESURÉ : sigma de translation du datum { "1.851746e-2" } m contre { "6.3975" } m pour la campagne SIMULÉE ({ "345" }×), rotation { "36" }×, échelle { "24" }× — un rapport entre un réseau de télémétrie laser et un réseau de retards VLBI, donc un constat plutôt qu'une validation. Rang d'information des réflecteurs 15/15 avec couplage inter-réseaux exactement { "0" } ; rang de Helmert 7/7, conditionnement { "2.4e4" }. CE QUE CETTE LIGNE NE REVENDIQUE PAS : que le chiffre soit juste en valeur absolue. Une vraie solution LLR coestime l'orbite lunaire, les librations physiques, l'orientation de la Terre, les coordonnées des stations et les paramètres de marées et relativistes, et rapporte des décimètres (les 0.12-0.27 m propres du tableau { "7" } de DE430) là où cette borne est bien plus petite ; c'est une borne de Cramér-Rao pour un jeu de paramètres réduit indiqué, non une précision. Hors de l'affirmation vérifiée (modélisé, non vérifié) : l'éphéméride du centre de la Lune et l'orientation du corps IAU { "2015" } sont modélisées, et la troposphère, les marées, l'excentricité de station, le mouvement du pôle, UT1-UTC, le retard relativiste et les horloges de station sont absents. Leur taille combinée est PUBLIÉE plutôt que discutée — distance aller observée moins calculée { "156,494" } m RMS sur les { "337" } points — et leur effet sur la covariance est BORNÉ plutôt que discuté : résoudre à nouveau tout le datum avec chaque dérivée partielle inclinée de { "0.1" }° (deux fois l'inclinaison d'éphéméride mesurée à la pire époque, signe alternant) déplace le résultat livré de { "0.288" } %. CONTRÔLE EXTERNE ({ "0.30" } tour { "2" }, préenregistré 6b27964a), un constat (reste MODELLED) : un temps de lumière aller-retour SPICE (DE440, ITRF93, orientation lunaire DE440) avec dérivées partielles par différences finies, et un inverse numpy, sur les mêmes { "337" } points normaux mesurés et poids, concordent sur la comptabilité, les deux rangs, le couplage nul, le RMS résiduel ({ "2.1e-5" }) et { "15" } chiffres de covariance sur { "16" }. Le sigma de translation z est supérieur de { "1.03" } % face au seuil préenregistré de { "1" } %. Avec le centre de la Lune issu de DE440 il tombe à { "0.049" } % (c51f8b2, données vues), et sur des points normaux frais de { "2019" } le datum à Lune par noyaux tient tous les seuils (ligne « …, centre de la Lune par noyaux »), où la Lune analytique reste aussi dans les seuils (au pire { "3.8e-3" }, à titre d'information seulement), de sorte que cette comparaison ne sépare pas les modèles de Lune. EXÉCUTION SUR DONNÉES FRAÎCHES DE LA VOIE ANALYTIQUE ({ "0.36" }, préenregistré 31f5283 avant la récupération d'aucun point) : la référence indépendante SPICE et NumPy inchangée sur { "151" } points normaux EDC CRD v2 utilisés de 2025-04..06 (une année qu'aucun test n'avait utilisée ; fichiers récupérés à nouveau et référence réexécutée de façon indépendante, voir la NOTICE du montage) aux mêmes seuils : comptabilité, rangs, comptes par réseau et couplage nul égaux ; sigmas et normes au pire { "1.11e-3" } (seuil { "1" } %), conditionnement { "8.95e-4" } ({ "2" } %), rapports transversal/longitudinal au pire { "1.79e-3" } ({ "2" } %) ; O-C de SPICE { "10.79" } m. VALIDATED sur cet élément de preuve comme vérification par bibliothèque du seul calcul de covariance ; le RMS résiduel analytique sur cette tranche est de { "222" } km, de sorte que les seuils ne discriminent pas les modèles de Lune (comme sur la ligne par noyaux). Résultats : docs/design/evidence/mr06-llr-analytic-fresh/RESULTS.md

# text
seg-c815cb90dcde = Géodésie d'une station de référence lunaire : rétroréflecteur et balise VLBI ajoutés face au datum à cinq réseaux

# text
seg-103cf21173ac = Les entrées facultatives extra_reflectors et extra_beacons du scénario lunar-llr-datum ajoutent un bloc station_geodesy : l'information de Helmert à cinq réseaux issue de la tranche archivée de télémétrie laser lunaire plus l'information qu'un rétroréflecteur ajouté (visé aux époques de points normaux archivés où la station de télémétrie est au-dessus de son horizon, chacune avec le poids archivé de ce point normal) et une balise VLBI ajoutée (observée par le réseau et le plan de lunar-frame-campaign avec les stations terrestres fixes, par les dérivées partielles de retard de lunar-vlbi-fim) à des sites indiqués apportent au datum à sept paramètres, résolue à nouveau, avec le 1-sigma de chaque paramètre de Helmert avant et après, leur rapport, les normes avant et après, et les valeurs propres extrêmes de la différence de Fisher. Absent ou vide, le rapport est inchangé

# text
seg-479a7e6bbedb = Cohérence interne seulement : chaque site ajouté est un point distinct et une distance laser ou un retard VLBI à station fixe touche un seul point, de sorte que son information A_p^T M_p A_p est semi-définie positive et s'ajoute ; le test vérifie la différence de Fisher et chaque variance à cet égard. Le résultat à cinq réseaux est la ligne à données réelles existante et est inchangé. Le réflecteur ajouté réutilise des époques planifiées pour les cinq réseaux existants, un plan ILLUSTRATIVE, et le réseau, le plan et le sigma de retard de la balise ajoutée sont les entrées ILLUSTRATIVE de lunar-frame-campaign ; le site est une position polaire sud ILLUSTRATIVE. Un site polaire sud voit la Terre bas sur son horizon ou pas du tout, ce qu'expriment les tests d'angles de visée existants ; aucun des deux sites n'est visé en continu. Les chiffres sont des bornes de Cramer-Rao pour un jeu de paramètres réduit, non un datum résolu et non une déclaration sur une station réelle

# text
seg-d9f033ebf109 = Datum du référentiel lunaire issu d'une campagne d'observation RÉELLE, centre de la Lune par noyaux

# text
# c1: lunar-llr-datum
seg-6f272a06c9f3 = La covariance du datum de Helmert à sept paramètres de lunar-llr-datum à partir de points normaux ILRS archivés et de leurs poids mesurés, sur la voie par noyaux : le centre géocentrique de la Lune est lu dans le JPL DE440 par le propre lecteur de noyaux du moteur (planetary_kernel_path ; lunar_llr::llr_geometry_with, ephem_provider::KernelEphemeris). Seul le centre de la Lune diffère de la ligne analytique ; l'orientation IAU { "2015" }, le mouvement du pôle et l'UT1 absents, les catalogues, les règles de sélection, les poids et l'algèbre linéaire sont les mêmes. L'affirmation vérifiée est seulement que la covariance de datum de cette voie concorde avec une référence indépendante SPICE et NumPy sur des points normaux frais, non vus. La comparaison ne discrimine pas les modèles de Lune et ne vérifie pas le centre de la Lune : sur la même tranche la Lune analytique passe aussi tous les seuils, la mutation préenregistrée (la Lune par noyaux lue une heure trop tard) n'a pas été détectée, et un centre de la Lune erroné d'environ { "4,650" } km passe aussi (voir le texte de la référence indépendante). Ce n'est pas un élément de preuve que la Lune par noyaux améliore le datum. Exécutable comme le scénario <c1/> avec planetary_kernel_path (et normal_points_dir pour une autre tranche)

# text
seg-ec47513b1828 = NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) temps de lumière aller-retour sur DE440, orientation de la Terre ITRF93 et orientation lunaire DE440 (MOON_ME) avec dérivées partielles par différences finies de { "100" } m, et matrice d'information et inverse numpy { "2.3.5" } (BSD-3-Clause, LAPACK) : le générateur inchangé de la comparaison de la ligne analytique (6b27964a), exécuté sur une tranche fraîche (points normaux EDC CRD, 2019-04..06) préenregistrée dans 830d945a avant la récupération d'aucune partie, aux seuils de la ligne analytique ({ "1" } % sigmas et normes, { "2" } % conditionnement et rapports, comptabilité, rangs et couplage exacts) et son auto-contrôle de référence (O-C de SPICE { "10.86" } m < { "100" } m). Chaque grandeur tient, au pire { "7.6e-5" }. Mutations : le retard d'une heure de la Lune prévu n'est PAS détecté (la covariance dépend de la dispersion des lignes de visée, non de leur datation) ; une mutation structurelle choisie ensuite et divulguée comme telle, supprimant la dérivée partielle de la branche descendante, fait échouer chaque sigma. Constat : sur cette tranche la Lune analytique passe aussi (au pire { "3.8e-3" }), de sorte que le seuil ne discrimine pas les modèles de Lune et que cela vérifie la covariance sur des données fraîches, non une amélioration de la Lune par noyaux. Contrôle de l'intégrateur à la fusion (non préenregistré) : la Lune par noyaux lue relativement au barycentre Terre-Lune au lieu de la Terre (RMS résiduel { "4,649" } km) et l'époque du noyau sans TT moins UTC ({ "69" } s ; résidu { "2.6" } km) passent tous deux encore tous les seuils, tandis que retirer sqrt(n_raw) des poids mesurés fait échouer les { "16" } grandeurs à seuil ; la comparaison est sensible aux poids, aux dérivées partielles et à l'algèbre linéaire, non au centre de la Lune. Les deux côtés lisent DE440 : cela vérifie le calcul sur DE440, non DE440. Hors de l'affirmation : une précision LLR (une borne de Cramér-Rao pour un jeu de paramètres réduit)

# text
seg-bd3af378b613 = Éphéméride lunaire analytique intégrée — sa BORNE DE PRÉCISION INDIQUÉE vérifiée sur des données réelles

# text
seg-a51c4e234a4f = ephem::moon_position, la série lunaire géocentrique de basse précision sur laquelle la crate se rabat lorsqu'aucun noyau DE/SPK n'est présent, mesurée face à la télémétrie laser lunaire réelle et face à une éphéméride planétaire publiée sur la même période. Cette ligne vérifie la borne que le module énonce sur lui-même, PAS une précision : la série est confirmée n'être pas pire qu'elle ne le dit, non confirmée être bonne

# text
seg-81dff68ddd9c = DEUX jeux de données externes indépendants qui ne partagent rien. ({ "1" }) { "337" } points normaux archivés de télémétrie laser lunaire de l'ILRS (EUROLAS Data Center, DGFI-TUM, 2015-04-08 à 2015-06-27, cinq réseaux de rétroréflecteurs, commités avec SHA-256 par fichier et un script de retéléchargement et vérification) : distance aller observée moins calculée { "156,494" } m RMS, avec des coordonnées de station de l'ITRF2020 de l'IERS et des coordonnées de réflecteur du tableau { "7" } de JPL DE430, de sorte que le résidu est dominé par la série du centre de la Lune. ({ "2" }) États géométriques géocentriques de la Lune de JPL Horizons sur la même période : { "112,567" } m RMS radial, { "195,655" } m RMS vectoriel, pire époque { "360,324" } m = { "0.0536" }°. Un résidu de distance répond à la partie RADIALE d'une erreur d'éphéméride, de sorte que ({ "1" }) et ({ "2" }) sont la même grandeur atteinte de deux façons et concordent à { "1.39" }× — ce qui autorise le scénario lunar-llr-datum à attribuer son résidu à l'éphéméride. La propre documentation du module du moteur affirme ~{ "0.3" }° / ~quelques·10² km ; les deux mesures sont à l'intérieur, l'affirmation angulaire avec une marge de { "5.6" }×. PÉRIMÈTRE, énoncé pour qu'aucun lecteur ne puisse s'y tromper : cela vérifie la BORNE indiquée, non un chiffre de précision. La série reste impropre à toute application exigeant mieux que ~{ "1e5" } m, et cette limitation est le contenu de la ligne autant que la concordance. Régénérable hors ligne par les scripts commités de récupération et de vérification

# text
seg-44f582b17fa9 = Intégrité de la porte — un vert qui veut dire ce qu'il dit

# text
# c1: cargo test --all
seg-43fbcfbe990c = Trois gardes structurelles sur le processus de vérification lui-même, chacune fermant une classe de défaut qui avait atteint la porte canonique sous forme de rouge intermittent ou parasite. ({ "1" }) Tout chemin temporaire construit dans les sources Rust doit porter un composant unique par appel ; un identifiant de processus est rejeté, parce que cargo exécute les tests de bibliothèque comme fils parallèles d'UN seul processus et que le pid leur est commun à tous. ({ "2" }) Toute épingle octet pour octet ou de hachage doit déclarer, à côté d'elle ou dans l'en-tête de son module, ce qu'elle couvre et ce qu'elle exclut délibérément — afin qu'un changement transversal puisse voir d'un coup d'œil quelles épingles sont concernées et lesquelles sont devenues en silence des détecteurs de changement à l'échelle du dépôt. ({ "3" }) Un vert n'est revendicable qu'à partir de la suite COMPLÈTE : scripts/gate.sh exécute <c1/>, capture le vrai code de sortie sans tube sur le chemin, et écrit un reçu nommant le commit, le nombre de binaires d'intégration, le nombre de tests et la durée ; le contrôle pré-push refuse un push dont le commit n'est nommé par aucun reçu valide, sur un arbre propre. La répétabilité est échantillonnée séparément par scripts/check-repeatability.sh, qui exécute N fois la suite de bibliothèque et échoue si l'ensemble des tests réussis diffère.

# text
seg-17a5f9da54a4 = Forme close : chaque garde est exécutée sur un extrait défectueux connu fixe qui doit se déclencher et un extrait correct connu fixe qui doit rester silencieux, tous deux des constantes littérales que le détecteur ne peut influencer. Les deux extraits défectueux connus sont les défauts F22 et F25 dans leur forme d'origine. C'est une référence INTERNE et la ligne est MODELLED en conséquence : elle prouve que les gardes distinguent le défaut de son correctif, non que les classes qu'elles décrivent sont exhaustives. Leurs angles morts indiqués — un état partagé qui n'est pas un chemin, une épingle tenue dans une courte constante nommée, une course rare que trois exécutions n'échantillonnent pas, et un reçu que quiconque peut écrire le fichier peut falsifier — sont consignés dans la documentation de module de tests/source_guards.rs et dans l'en-tête de chaque script plutôt que laissés à la découverte.

# text
seg-178192c9c87a = PL de synchronisation composé — spécialisation MHSS scalaire (H=1_N)

# text
seg-431aaf94ec31 = TPL à séparation de solutions scalaire en temps sur des sources hétérogènes ; PL déterminé par le bruit du sous-ensemble de pire exclusion + biais UTC(k)

# text
seg-9a5ea79248c8 = P2 : numpy { "2.3.5" } linalg.lstsq et scipy { "1.18.1" } (norm.isf, norm.sf, brentq) recalculent, par leurs propres algorithmes, les estimateurs aux moindres carrés pondérés par sous-ensemble, la covariance de séparation générale sqrt(Δ Σ Δᵀ), les biais et le niveau de protection qui en découle sur { "300" } entrées commitées (tests/fixtures/tpl_scalar_numpy_oracle) ; le PL concorde à { "1e-9" } relatif près (au pire { "1.2e-10" }) et le sous-ensemble d'exclusion déterminant est identique, tolérance fixée avant la comparaison. Les multiplicateurs, les a priori et les majorations de biais sont des entrées, et la structure de l'équation du PL (liste de modes, partage ir/2, projection du biais) est une entrée indiquée, comme pour la ligne du noyau de niveau de protection ARAIM lunaire ; l'affirmation vérifiée est l'algèbre linéaire et le PL sur ces entrées, non les ordres de grandeur physiques d'un scénario de synchronisation. Lignée ARAIM Blanch { "2015" } / Joerger { "2014" }

# text
seg-b7cd952ff133 = PL de synchronisation composé — traversée de holdover amorcée par P0

# text
seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)) ; semi-continu inférieurement PL({ "0" }+)≥PL({ "0" }−) ; K(IR/2) maximum courant ; exposants de phase τ/τ³/τ⁵

# text
seg-1438193381be = Tests de propriétés (monotonie, absence de chute au transfert) + contrôle des exposants face à holdover::coast_phase_variance

# text
seg-3ab4509b62a2 = PL de synchronisation composé — couverture de l'enveloppe de holdover, régime pluriannuel (tau>=90d)

# text
seg-d9520f6c1769 = L'enveloppe à maximum courant majore (sans perçage à zéro) une vraie série métrologique à chaque décalage testé tau>=90d sur un segment disjoint ; le tau court (<=30d) est une frontière modélisée divulguée

# text
seg-086baedd33a9 = Série à 5 jours BIPM Circular-T [UTC-UTC(USNO)] MJD 56074-60429 ({ "872" } pts, API webtai) ; ajustement/test disjoints, couverture pluriannuelle sans perçage à zéro

# text
seg-096b6cdfe2dc = PL de synchronisation composé — enveloppe p.s. de la LIL (impossibilité + cohérence)

# text
seg-1671add2210d = Aucun holdover au pire cas fini (le sup brownien diverge) ; HPL alloué par IR cohérent avec l'enveloppe de Hartman-Wintner lorsque IR→{ "0" }

# text
seg-c9ed8bbede70 = Identité de l'enveloppe p.s. en forme close √(2Dt·lnln t) + vérification de dominance du HPL ; couture d'impossibilité de Baweja arXiv:{ "2606.24210" }

# text
seg-5a27c9f0a67d = Majoration d'intégrité du biais de traçabilité UTC(k) hétérogène

# text
seg-fd09ab2adbf6 = Majoration de biais par source b = (U/k_cov)·Phi^-1(1-tail/2) + vieillissement, gonflant une incertitude élargie de type B publiée jusqu'à une queue d'intégrité allouée ; relié à tpl_scalar comme bias_s

# text
seg-1fd53acf9a3f = Reproduction indépendante par numpy + statistiques de la bibliothèque standard de la forme close de la majoration (InternalConsistency). La série BIPM Circular-T [UTC-UTC(USNO)] est seulement une entrée CITÉE — c'est la MÊME série déjà vérifiée pour la ligne de couverture de holdover R4 et elle n'est PAS revérifiée ici ; reproduire ses valeurs ne prouve rien pour R2. La queue d'intégrité profonde est modélisée. { "0.30" } comparaison externe, un constat (reste MODELLED) : sur les fichiers BIPM par laboratoire UTC-UTC(k) ({ "102" } laboratoires, { "105 024" } lignes avec incertitudes publiées) la majoration b = { "2.576" } u à la queue de { "1e-2" } est dépassée par { "50.8" } % des lignes (Clopper-Pearson { "95" } % : { "50.4" } à { "51.1" } %) et par plus de { "1" } % à { "101" } laboratoires sur { "102" }. L'incertitude publiée u est l'incertitude de la détermination de UTC-UTC(k) par le BIPM, non une borne sur le décalage, qui atteint couramment plusieurs fois u ; la majoration telle que spécifiée ne borne pas le biais réel de traçabilité UTC(k). { "0.30" } tour { "2" }, une majoration des décalages UTC-UTC(k) réalisés entraînée sur 2015-2022 et testée sur les données Circular T du BIPM 2023-2026 (préenregistré ca0921a4, dépassement groupé d'au plus { "1e-2" }), un constat (reste MODELLED) : le dépassement groupé est de { "0.0333" } ({ "694" } lignes sur { "20 826" } sur { "82" } laboratoires ; { "0.0127" } sans les { "430" } lignes qui n'ont pas de borne par règle). Tour { "3" } de D9, une borne de vieillissement hiérarchique groupée (utck_bound), préenregistrée fb475550 et évaluée de façon prospective sur les numéros de Circular T à partir de { "465" } : pas encore exécuté (le numéro { "465" } a été publié le 2026-10-12 avec environ { "285" } valeurs de test ; la règle préenregistrée de 1000 valeurs exige des numéros jusqu'à environ { "468" }, et l'exécution exige les fichiers par laboratoire archivés du 2026-09-30, le BIPM ayant depuis réécrit { "87" } des { "113" })

# text
seg-d75b900ad25f = Covariance croisée de biais de traçabilité corrélés (allocation dangereuse en mode commun)

# text
seg-0641f6d38c23 = Covariance croisée de biais N×N avec hors-diagonales rho·b_i·b_j pour les sources partageant un réalisateur UTC(k) ; DÉMONTRÉ biais fusionné corrélé >= biais fusionné indépendant (l'allocation indépendante naïve sous-borne le biais fusionné -> optimiste -> dangereux)

# text
seg-72359f29aab1 = Reproduction indépendante par numpy de la covariance croisée et de l'inégalité biais fusionné corrélé contre indépendant (InternalConsistency). Ensemble de sources représentatif ; scénario modélisé.

# text
seg-0359a9194c60 = Blanchiment GLS en mode commun (Aitken) + identité de Mahalanobis

# text
seg-67b11ff6d055 = Cholesky Omega=LL^T écrit à la main et blanchiment par substitution avant z=L^-1 r (Cov(z)=I lorsque Cov(r)=Omega) ; carré de Mahalanobis z^T z = r^T Omega^-1 r

# text
seg-24cb37529637 = P2 : numpy { "2.3.5" } linalg.cholesky (LAPACK potrf), solve (gesv) et inv sur { "201" } entrées SPD versionnées (tests/fixtures/gls_whitening_numpy_oracle) vérifient le facteur écrit à la main, le résidu blanchi et l'opérateur de blanchiment ; le carré de Mahalanobis est vérifié par rapport à solve(Omega, r), qui n'utilise aucun Cholesky, de sorte que l'identité z^T z = r^T Omega^-1 r est confirmée par une voie distincte. Le tout à { "1e-12" } près en relatif (pire cas { "7.9e-16" }), tolérance fixée avant la comparaison. Le plus grand nombre de condition est { "19.3" } : les matrices mal conditionnées ne sont donc pas couvertes. Le blanchiment GLS/Aitken { "1935" } est Cité.

# text
seg-1a3bb032960f = Statistique de cohérence en mode commun (défaut de référence partagée aveugle à la séparation)

# text
seg-1b03f522b8fc = Statistique de score ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 pour un décalage en mode commun que la séparation des solutions (contrastes orthogonaux à { "1" }) ne peut pas voir ; un décalage en mode commun la gonfle alors que les séparations deux à deux restent plates

# text
seg-d79071a5d9ec = Reproduction indépendante en numpy de la statistique + test de propriété montrant qu'une injection en mode commun la gonfle (InternalConsistency). Scénario modélisé. { "0.30" } tour { "2" } (préenregistré f9aa360d), bloqué (reste MODELLED) : LAPACK gesv de numpy { "2.3.5" } reproduit la valeur de la statistique sur { "261" } cas versionnés (à { "3.5e-15" } près pour les cas bien conditionnés, à { "1.2e-9" } près pour un conditionnement allant jusqu'à { "6.1e7" }) ; la loi nulle du chi-deux({ "1" }) est un théorème cité et les séparations deux à deux plates une identité, sans sortie du moteur à comparer ; la délimitation du périmètre attend donc une décision du responsable

# text
seg-91fc18cde833 = Borne de mode commun indétectable avec résidu hors d'Omega

# text
seg-0cc2c0f033c8 = Plafond de mode commun indétectable : la plus grande amplitude de défaut selon une direction d qui échappe À LA FOIS à la séparation (alpha_ss = T_ss / norme de contraste blanchie de d) et à la statistique de mode commun (alpha_cm = sqrt(T_cm { "1" }^T Omega^-1 { "1" }) / |{ "1" }^T Omega^-1 d|), indiquée sous la forme min(alpha_ss, alpha_cm). Pour une matrice Omega définie positive, les deux directions aveugles (d proportionnelle à { "1" }, et { "1" }^T Omega^-1 d = { "0" }) sont mutuellement exclusives ; le plafond est donc FINI pour tout d non nul, et il n'est infini que pour une direction nulle ou une matrice Omega non définie positive. Une direction hors de l'axe commun modélisé n'est aveugle qu'à la statistique de mode commun et est bornée par la séparation

# text
seg-b67c71daa7de = P2 : linalg.solve de numpy { "2.3.5" } (LAPACK gesv, LU sans Cholesky) recalcule alpha_ss (le seuil rapporté à la norme de contraste blanchie de d après retrait de son coefficient de mode commun GLS), alpha_cm et leur minimum sur { "256" } entrées (Omega, d, T_ss, T_cm) versionnées (tests/fixtures/gls_outside_omega_bound_numpy_oracle), y compris les directions de mode commun pur, les directions hors de l'axe commun modélisé, ainsi que les cas de direction nulle et de matrice non définie positive qui doivent donner +inf ; préenregistré (d070699a ; amendement 8a44267b, avant toute comparaison, reformulant la forme matricielle) ; tolérances fixées avant la comparaison. Le texte de la capacité a été corrigé par décision du responsable (2026-10-02) : il indiquait que la borne est infinie pour une direction hors de l'axe commun, ce qui contredisait le code et cette comparaison. Le fait que le détecteur idéalisé à contraste unique minore l'amplitude indétectable d'un détecteur de sous-ensemble réel reste Modélisé

# text
seg-a7a33523bb1c = Identifiabilité du référentiel lunaire - algèbre linéaire de la décomposition

# text
seg-bd59cc76557a = Marginale par complément de Schur du bloc { "{" }sélénocentre-X, échelle{ "}" } de la matrice de Fisher du référentiel de Helmert à 7 paramètres : la mesure scalaire de dégénérescence lambda_min(S), la CRLB de l'origine X et la corrélation origine-échelle

# text
seg-0f7e4fb31c44 = Référence indépendante SciPy/NumPy (scripts/gen_datum_identifiability_ref.py -> tests/fixtures/datum_identifiability/scipy_ref.csv) : le complément de Schur, ses valeurs propres et l'inverse 2x2 calculés par une bibliothèque indépendante. Limité à l'ALGÈBRE LINÉAIRE de la décomposition ; les AMPLITUDES de corrélation et de CRLB lunaires issues de la géométrie réelle restent MODELLED.

# text
seg-3359eee713a5 = Classification de l'espace nul du référentiel lunaire (additivité des rangs LLR + relèvement du défaut par la libration)

# text
seg-6d722c176052 = Classification du problème de référentiel en télémétrie interne : une seule observation de distance apporte un rang { "1" } (espace nul de dimension 6) ; le couple origine-X et échelle est quasi nul et la libration physique DE440 ramène le défaut à zéro tandis que le couple reste quasi dégénéré

# text
seg-ae6dc4e6ea8b = Structure géométrique reproduite par le moteur plus identité de Schur 2x2 sous forme close ; cohérente en STRUCTURE avec Sosnica et al. { "2025" } (arXiv:{ "2510.15484" }), dont les amplitudes publiées ne sont PAS reproduites ici. La classification est structurelle ; les amplitudes de corrélation et de CRLB sous géométrie réelle sont MODELLED (coordonnées et orientation des réflecteurs maintenues fixes). { "0.30" } comparaison externe, un constat (reste MODELLED) : par rapport à Sosnica et al. { "2025" }, la corrélation origine-échelle de la matrice de Fisher des distances (-0.993 / -0.988) est à { "0.05" } près du -0.97 publié, mais sur la géométrie à cinq réflecteurs propre à l'article, la corrélation de Helmert à 7 paramètres à poids égaux est de -0.78 (la valeur publiée repose sur des erreurs par réflecteur que l'article n'imprime pas), et la CRLB de l'origine ({ "0.6" } à { "1.2" } mm pour un bruit de distance de { "3" } mm) est inférieure de { "96" } à { "98" } % aux { "3.07" } cm de l'article, pour une tolérance de { "20" } %. Amplitudes non reproduites

# text
seg-3fd19007ea67 = Information multi-techniques sur le référentiel lunaire (LLR + VLBI lunaire + distance d'orbiteur)

# text
seg-23d0dd7d0666 = Lignes jacobiennes du référentiel pour la distance LLR vers un réflecteur terrestre, le retard différentiel VLBI lunaire à deux stations et la distance orbiteur-balise, sur le référentiel à 7 paramètres, combinées en une seule matrice de Fisher préconditionnée de façon cohérente ; montre que le suivi hors radial (orbiteur / diversité en profondeur) lève la dégénérescence entre origine-X et échelle, alors que le VLBI transverse n'aide qu'indirectement

# text
seg-b2f5715c4577 = Vérifications croisées analytique / différences finies des dérivées partielles de chaque technique (interne) ; la DIRECTION de l'amélioration est un fait géométrique. Les emplacements des balises, les calendriers et le bruit sont MODELLED/représentatifs (voir tests/fixtures/llr_geometry/NOTICE.md).

# text
seg-f9796a4c9a85 = Fournisseur d'orientation des axes principaux lunaires DE440

# text
seg-ebe4519a40e4 = Rotation de MOON_PA_DE440 vers J2000 à des époques arbitraires comprises entre 2014-01-01 et 2030-12-31 TDB, par interpolation géodésique R0·Exp(f·Log(R0ᵀR1)) entre les nœuds d'une série quotidienne versionnée de { "6" } 209 lignes (les fonctions try_ renvoient OrientationSpanError en dehors de cette plage, les fonctions infaillibles paniquent ; il n'y a jamais d'écrêtage) ; intégrée à la compilation, il n'y a donc aucune E/S de système de fichiers à l'exécution et la version WASM la contient

# text
seg-3b710c49338c = NAIF SPICE Toolkit (CSPICE N0067 via spiceypy { "8.2.0" }, exécuté comme outil) : pxform de MOON_PA_DE440 vers J2000 évaluant directement le PCK binaire de JPL moon_pa_de440_200625.bpc, avec le noyau de référentiel propre à NAIF moon_de440_250416.tf, à { "2 000" } époques aléatoires hors nœuds dans la fenêtre intégrée. L'angle de rotation entre les matrices de Kshana et de SPICE est inférieur ou égal à { "1.7e-5" } rad ({ "30" } m au rayon moyen de { "1737.4" } km, fixé avant la comparaison) ; pire cas mesuré { "1.7e-6" } rad ({ "3" } m), RMS { "7.8e-7" } rad, et pire cas { "1.75e-6" } rad sur { "6 000" } époques supplémentaires tirées par le vérificateur. Les nœuds quotidiens ont eux-mêmes été extraits du même noyau (scripts/gen_de440_moon_pa.py, SHA-256 du jeu de test 3076f81ef95d83f5efa240ed4c7ccb422f109407dde841fcf28d42dc63586eb7), de sorte que cette comparaison teste l'interpolation entre eux, ce qui est l'affirmation. Trouvé par cette comparaison et corrigé : l'ancienne interpolation linéaire élément par élément avec Gram-Schmidt conservait l'axe mais pas l'angle de la rotation de { "13.2" } deg/jour et présentait une erreur allant jusqu'à { "2.0e-4" } rad ({ "340" } m) près des quarts de période ; le chiffre antérieur d'environ { "14" } m provenait d'un garde-fou qui n'échantillonne que les milieux d'intervalle. La série couvre 2014-01-01 à 2030-12-31 et renvoie une erreur en dehors (tour { "2" }) ; ses nœuds 2024-2025 se régénèrent à partir du même noyau à { "4.3e-13" } près. La comparaison hors nœuds avec SPICE ci-dessus ne couvre que 2024-2025, qui est la fenêtre vérifiée ; les nœuds étendus proviennent du même noyau et du même script mais ne sont pas comparés hors nœuds. Un substrat géométrique pour l'analyse d'identifiabilité, et non un produit d'orientation sub-métrique

# text
seg-ab96cfc8d48c = Substrat géométrique du référentiel LLR lunaire (réflecteurs aux axes principaux, stations au sol, dérivées partielles analytiques de la distance)

# text
seg-40e91288f81a = Les cinq réseaux de rétroréflecteurs de la face visible en mètres dans le repère propre PA et les stations au sol LLR en coordonnées géodésiques ; placement des réflecteurs du repère propre vers l'inertiel via l'orientation PA de DE440 ; dérivées partielles analytiques de la distance Terre-réflecteur par rapport au référentiel à 4 paramètres ; et matrice de Fisher LLR seule présentant la dégénérescence sélénocentre-X / échelle qui motive l'analyse à 7 paramètres

# text
seg-89ce1f95d9f6 = Le calcul est vérifié en interne : chaque dérivée partielle analytique par rapport à une différence finie, et le cas de référentiel nul par rapport à la distance nominale. Le CATALOGUE est vérifié en externe et de façon indépendante - les coordonnées d'axes principaux DE440 (Park et al. { "2021" }, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) sont recoupées avec le tableau { "6" } du mémorandum des coordonnées de surface DE430 (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, extrait automatiquement d'un PDF dont le SHA-256 a été vérifié par tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) et concordent à { "1.12" } m près, alors que la réalisation en Terre moyenne des mêmes cinq réseaux en diffère de { "672" } à { "871" } m. La STRUCTURE DE DÉGÉNÉRESCENCE est vérifiée par rapport à un résultat publié : Sosnica et al. { "2025" }, 'Definition and Realization of the International Lunar Reference Frame', arXiv:{ "2510.15484" }, qui rapporte pour le repère des axes principaux lunaires un coefficient de corrélation sélénocentre-X / échelle de r = -0.97, et que la LLR n'atteint pas le centre de masse réel de la Lune avec une exactitude meilleure que { "12" } cm à cause de cette corrélation. Ce module retrouve la même structure (|corr(t_x, scale)| entre { "0.9" } et { "0.9999" }, défaut de référentiel <= { "1" }) à partir d'un plan de Fisher LLR seule. La corroboration porte sur des éphémérides différentes, et non sur un aller-retour : l'article combine INPOP21a, DE430 et EPM2021, alors que ce module est piloté par la libration DE440. Ce qui n'est PAS reproduit, c'est l'amplitude - la corrélation ici est d'environ -0.988 contre -0.97 chez eux, et la CRLB à 4 paramètres est sub-millimétrique contre leur plancher atteint de { "12" } cm, parce que l'orientation et les coordonnées des réflecteurs sont maintenues fixes ici et résolues là-bas. Structure de géométrie et de dégénérescence uniquement ; aucune affirmation d'exactitude sur un référentiel résolu. { "0.30" } comparaison externe : les parties à distance mesurée de ce module (reflectors(), stations_itrf(), le placement PA de DE440 et le temps de lumière barycentrique llr_bcrs_one_way_m) sont vérifiées dans leur propre ligne, modèle de distance mesurée LLR, par rapport à { "192" } points normaux ILRS (RMS { "2.81" } m pour { "10" } m). Cette ligne reste MODELLED parce que la comparaison avec les mesures n'éprouve pas le reste de son affirmation. Le catalogue géodésique des stations stations() arrondit APOLLO à { "0.001" } deg ; avec un temps de lumière géocentrique, il donne { "22.7" } m sur les mêmes points (test reflector_ranges_against_ilrs_normal_points ; { "96" } m avec l'ancienne interpolation d'orientation élément par élément). Les dérivées partielles analytiques de la distance et la matrice de Fisher LLR seule sont calculées par llr_range_m et reflector_inertial avec la série analytique de la Lune (ephem::moon_position, à environ { "0.3" } deg du GCRS) et sans temps de lumière

# text
seg-a78ba110b64c = Modèle de distance mesurée LLR (catalogue de réflecteurs, stations ITRF2020, placement des axes principaux DE440, temps de lumière barycentrique IERS { "2010" })

# text
seg-c9827c1a427b = La distance aller simple station terrestre-réflecteur d'un point normal de télémétrie laser lunaire : les cinq réseaux de rétroréflecteurs de la face visible en mètres dans le repère propre des axes principaux (PA) DE440 (lunar_llr_geometry::reflectors) ; les stations de stations_itrf(), à savoir Grasse { "7845" } et Matera { "7941" } d'après ITRF2020 à l'époque { "2015.0" } avec leurs vitesses, placées dans le système de référence céleste géocentrique (GCRS) par la transformation IERS { "2010" } avec le mouvement du pôle du Bulletin A (lunar_vlbi::station_inertial_position_itrs), et APOLLO { "7045" } à sa position géocentrique approximative publiée par l'opérateur (sans vitesse) ; le placement des réflecteurs du repère propre vers l'inertiel via l'orientation PA de DE440 (lunar_orientation::try_de440_moon_pa_body_to_inertial, qui renvoie une erreur en dehors de 2014-2030) ; et le temps de lumière barycentrique des Conventions IERS { "2010" }, section { "11.2" } (lunar_llr_geometry::llr_bcrs_one_way_m : la transformation corps-vers-BCRS de l'éq. { "11.19" } pour la station et le réflecteur, et le retard de Shapiro de l'éq. { "11.17" } dû au Soleil, à la Terre et à la Lune). ENTRÉES, ne faisant pas partie de l'affirmation : les états et potentiels barycentriques de la Terre, de la Lune et du Soleil (DE440 via SPICE), UT1-UTC et le mouvement du pôle de l'IERS, et l'aller-retour mesuré converti de TT en TDB. CÔTÉ BANC DE TEST, ne faisant pas partie de l'affirmation : le retard zénithal de Mendes-Pavlis avec la fonction de projection FCULa, dans le test, avec l'élévation issue du catalogue géodésique stations(). Non modélisé : marées, excentricités des stations, termes thermiques des réflecteurs

# text
seg-536c75eebae3 = Mesuré : { "192" } points normaux lunaires ILRS CRD v2 (EUROLAS Data Center, DGFI-TUM, 2024-04 à 2024-06 ; Grasse { "151" }, APOLLO { "32" }, Matera { "9" } ; versionnés tels quels avec SHA256SUMS). La distance aller simple prédite est comparée à c fois la moitié de l'aller-retour mesuré en TDB. Seuil fixé avant la comparaison : RMS d'au plus { "10" } m sur l'ensemble des { "192" } points ET sur les { "160" } points des deux seules stations ITRF2020. Le seuil provient du troisième amendement de préenregistrement 3e0f5cdf, versionné avant la modification du moteur et l'exécution ; le chiffre de { "10" } m est inchangé depuis le tour { "1" }. Mesuré : { "2.81" } m (moyenne { "2.67" } m) sur tous les points ; { "2.96" } m sur les stations ITRF2020 ; APOLLO { "1.94" } m ; tranche { "2015" } ({ "349" } points, secondaire) { "3.82" } m. Mutation : mettre à zéro les branches de Shapiro du Soleil donne { "10.19" } m, ce qui échoue. Historique, divulgué : { "96" } m avec l'interpolation d'orientation élément par élément ; { "22.7" } m après interpolation géodésique avec le catalogue géodésique ; { "10.94" } m avec les stations ITRF2020 et le mouvement du pôle mais un temps de lumière géocentrique (un décalage commun de +{ "10.9" } m). Le modèle barycentrique a été écrit après que ce décalage a été constaté. C'est le modèle publié de l'IERS { "2010" } section { "11.2" }, sans paramètre libre. Le troisième amendement a remplacé une condition autoimposée tout-ITRF2020/SLRF2020 après le résultat BLOCKED. Le RMS ITRF2020 seul passe sans APOLLO, qui n'a pas de solution ITRF2020 ni SLRF2020 et dont la position est celle, approximative, indiquée par l'opérateur. Un décalage commun de +{ "2.7" } m demeure, sous le seuil et non ajusté. Le seuil est large par rapport au résultat : un terme solaire de { "7.6" } m manquant donne encore { "10.19" } m. Les termes inférieurs au seuil ne sont pas résolus un à un : avec le mouvement du pôle mis à zéro, le RMS est de { "6.15" } m (stations ITRF2020 { "5.98" } m), et avec la transformation de l'éq. { "11.19" } retirée il est de { "2.96" } m ; les deux passeraient encore. Les vitesses des stations et les termes de Shapiro de la Terre et de la Lune sont plus petits encore. La comparaison valide la distance aller simple assemblée à { "10" } m RMS et le terme de Shapiro solaire, et non chaque composante énumérée

# text
seg-9b1dfa736cb6 = Jauge couplée du référentiel et de l'échelle de temps lunaires : l'espace nul conjoint du référentiel spatial, du décalage d'horloge et de la dérive d'horloge

# text
seg-a000ef6ab2e0 = assemble_coupled_info construit la matrice de Fisher couplée à 9 paramètres sur [t_x, t_y, t_z, s, theta_x, theta_y, theta_z, d_tau, d_alpha] ; classify_null_space renvoie une décomposition de son espace nul, invariante par changement de base, en dimensions purement spatiales, purement temporelles et véritablement couplées, ainsi que la norme de couplage du projecteur spatial-vers-temporel ; coupled_marginal_eigs donne la marginale par complément de Schur { "{" }échelle, décalage{ "}" }. Sur les réseaux versionnés, le moteur indique un référentiel de rang plein (défaut { "0" }) pour le cas bien posé et un défaut exact d'une seule direction de dérive pour le cas à époque unique (temps écoulé nul, de sorte que la dérive est inobservable par construction), et calcule la marginale { "{" }s, d_tau{ "}" } dans les deux cas.

# text
seg-35eebbc8a2e9 = CE QUI EST VÉRIFIÉ EN EXTERNE, énoncé étroitement : kshana calcule la décomposition en valeurs propres avec son propre solveur de Jacobi écrit à la main (fim::sym_eig) et la marginale avec sa propre pseudo-inverse ; la référence indépendante recalcule les deux avec numpy/LAPACK (np.linalg.eigvalsh/eigh/pinv) via scripts/gen_coupled_gauge_ref.py. L'accord à rel<{ "1e-3" } est donc une vérification par une bibliothèque indépendante de L'ARITHMÉTIQUE DE CE CRATE par rapport à une implémentation standard, ce qui est l'affirmation vérifiée et toute l'affirmation. CE QUI NE L'EST PAS : l'assemblage et la classification de l'espace nul sont les règles propres de ce module, et la référence indépendante les reproduit à partir de la même spécification et non d'une source indépendante - cela corrobore l'implémentation, pas la règle. La géométrie des balises et de l'orbiteur est modélisée et représentative. Les lignes d'observation portent bien la véritable orientation PA de la Lune DE440 (lunar_datum::orbiter_range_row_datum7 -> lunar_orientation::de440_moon_pa_body_to_inertial), mais c'est une ENTRÉE que reçoivent les deux côtés, et non une preuve sur la réponse, et elle est consignée ici comme provenance et non comme justification du statut - la même distinction que main établit déjà dans la ligne d'intégrité en mode commun. Chaque flottant de ligne est arrondi à { "6" } décimales avant l'écriture de network.json, de sorte que les deux côtés lisent des doubles IEEE-754 identiques et que la seule différence restante est le solveur.

# text
seg-63a8571f8eb0 = Dégénérescence entre distance et décalage d'horloge en télémétrie lunaire aller simple, et loi de conception de la diversité géométrique

# text
seg-cdd70f56051a = La dégénérescence entre distance radiale par nœud et décalage d'horloge du récepteur est exacte à { "1" } m pour { "3.336" } ns (l'inverse de c). La marginale par complément de Schur { "{" }échelle, décalage{ "}" } (coupled_marginal_fisher) montre que, dans un réseau géométriquement diversifié, la télémétrie aller-retour relève la marginale d'à peu près le même facteur qu'un nombre égal de données aller simple supplémentaires, alors que dans le régime idéalisé à nœud unique le gain de l'aller-retour est supérieur de plusieurs ordres de grandeur. La loi de conception qui en découle : c'est la diversité géométrique, et non la télémétrie aller-retour en tant que telle, qui sépare l'échelle du référentiel lunaire du décalage de l'échelle de temps en télémétrie aller simple ; un lien de temps aller-retour ou externe n'est nécessaire que dans le régime à faible diversité ou à utilisateur unique.

# text
seg-25dd0e9134c8 = Matrice de Fisher marginale par complément de Schur de la matrice d'information couplée, en algèbre linéaire sous forme close, vérifiée par rapport aux deux régimes limites qu'elle prédit. L'équivalence { "1" } m pour { "3.336" } ns est la définition du mètre via c et n'est pas un résultat empirique. Les réseaux d'observation sont une géométrie modélisée représentative ; la loi de conception est donc un énoncé sur la géométrie qui lui est présentée et n'avance aucune affirmation sur un réseau lunaire déployé.

# text
seg-16ec8283f9b4 = Couplage relativiste entre dérive d'horloge et référentiel pour l'échelle de temps lunaire

# text
seg-d9a426dc8620 = rate_frame_jacobian(_with) donne la sensibilité de la dérive de l'échelle de temps lunaire à la réalisation du référentiel, à partir du potentiel effectif équatorial tronqué au degré { "2" } (GM, rayon équatorial, J2, rotation ; LunarSurfacePotential) : d_alpha/d_scale = L_m, environ +{ "3.1388e-11" } ; d_alpha/d_velocity = -|v_moon|/c^{ "2" }, environ -1.11e-14 (dépend du temps) ; d_alpha/d_r_radial = g_eff/c^{ "2" }, environ +{ "1.806e-17" } par mètre. Pour un décalage radial du référentiel de { "1" } m, cela représente une perturbation de dérive d'environ { "1.8e-17" } (conséquence arithmétique du terme radial), très inférieure au décalage de dérive d'environ { "1.7e-11" } d'une échelle de temps lunaire par rapport à TT

# text
seg-6fc3d01ea825 = Préenregistré (5590ab21) : L_m par rapport à Ashby et Patla { "2024" } (AJ { "167" }:{ "149" }) éq. ({ "10" }), { "3.13881" }({ "15" })e-11, à partir de GM, a_m, omega_m de l'article et du J2 des deux champs de degré 350 que l'article cite (Bertone et al. { "2021" }, AIUB-GRL350A/B), à { "1e-4" } près ; le terme radial par rapport à la gravité équatoriale de pyshtools { "4.14.1" } (BSD-3) des mêmes champs à { "1e-4" } près (mesuré { "8.3e-5" } et { "6.7e-5" }, une marge étroite) ; le terme de vitesse par rapport à la vitesse lunaire de JPL Horizons DE441 à { "4.5e-3" } près. Une forme close de degré 2 d'une valeur publiée de degré 350 (résidu de degré 3-350 ; Référence, pas P1). Divulgué : le résultat du terme 1 était connu avant le préenregistrement, et le rayon par défaut livré de { "1738.14" } km est la définition de surface de l'article, adoptée après le tour { "1" }. Les contributions de marée et la bande de comparaison restent des chiffres de surface de référence modélisés

# text
seg-a666792106d9 = Classification, invariante par changement de base, de l'espace nul couplé du référentiel et de l'échelle de temps

# text
seg-5ee36574d1b4 = classify_null_space décompose l'espace nul du référentiel en parties purement spatiale (dimension d moins rang U_T), purement temporelle (d moins rang U_S) et véritablement couplée (rang U_S plus rang U_T moins d), plus la norme de couplage du projecteur spatial-vers-temporel p_st_norm, la norme de Frobenius du bloc hors diagonale du projecteur sur l'espace nul. Chacune de ces quantités est une fonction du PROJECTEUR et non d'une base choisie ; elles sont donc invariantes par tout choix orthonormé de vecteurs nuls - ce qui rend la classification publiable en soi.

# text
seg-0608e1dc5183 = SciPy/NumPy (BSD-3-Clause ; scipy.linalg.null_space et numpy.linalg.svd, LAPACK gesdd) classent les mêmes matrices versionnées par intersection de sous-espaces, dim null([F; E_T]) et dim null([F; E_S]), et par le projecteur d'espace nul issu de la SVD, qui diffère des vecteurs propres de Jacobi et des formules de rang de Gram de Kshana ; préenregistré (d429993c) : entiers exacts, p_st_norm à { "1e-9" } près (P2, une bibliothèque numérique indépendante), avec le seuil de rang fixé à l'avance et un écart spectral d'au moins { "1e6" } vérifié par assertion. L'affirmation de la ligne est la classification d'une matrice donnée, et P2 la couvre donc entièrement. Les cas construits comprennent des espaces nuls en somme directe, couplés et mixtes ainsi que des changements de base aléatoires ; les dimensions des réseaux réels de la ligne de jauge couplée ne sont pas recomptées ici. Le test d'invariance du crate (une base nulle tournée donne des résultats identiques) est conservé

# text
seg-2c074d6260ba = Menu représentatif de mesures multi-techniques et règle additive de combinaison de Fisher

# text
seg-beefac5c1b13 = MeasurementBlock représente une campagne de mesure candidate sous la forme d'une contribution d'information de Fisher 7x7 plus un coût relatif scalaire ; block_from_rows en construit une à partir de lignes jacobiennes brutes du référentiel, de sorte que chaque bloc est préconditionné de manière identique via lunar_identifiability::assemble_multi_info ; combine somme l'information d'un sous-ensemble choisi, ce qui est la règle correcte parce que l'information de Fisher est additive sur des mesures indépendantes ; representative_lunar_menu fournit un menu déterministe de quatre blocs (LLR, une balise de limbe VLBI transverse, un orbiteur de la face visible et un orbiteur de la face cachée). L'optimiseur de conception sous contrainte de budget qui consomme ce menu ne fait pas partie de ce crate.

# text
seg-d83a9942ee72 = L'additivité de l'information de Fisher sur des mesures indépendantes est une propriété sous forme close, vérifiée ici par rapport à une somme élément par élément écrite indépendamment et par rapport à l'invariance d'ordre et à la monotonie qui en découlent. NOTE SUR LES PREUVES : le combineur n'avait auparavant aucun test, et le seul test du module sommait les deux matrices d'information en ligne au lieu de l'appeler, de sorte qu'un combineur défaillant aurait laissé le module au vert ; le test passe désormais par combine et échoue lorsqu'il est muté. Tous les emplacements de balises, la géométrie des orbiteurs, les précisions par technique et les coûts relatifs sont des choix représentatifs et non des valeurs de mission (voir tests/fixtures/llr_geometry/NOTICE.md), de sorte que chaque mesure de dégénérescence et chaque chiffre de CRLB obtenu via ce menu hérite du statut modélisé de lunar_identifiability::decompose.

# text
seg-341eedfc47da = Cohérence inter-fournisseurs du référentiel et de la dynamique lunaires (véritable inter-éphémérides)

# text
seg-f8d94c0771cc = décomposition en rotation seule (translation+rotation à 6 paramètres) du désaccord géocentrique de la Lune entre DE440/INPOP21a/EPM2021 en un lien de référentiel ICRF commun réductible et un excès irréductible d'orientation de l'orbite lunaire (l'ajustement de Helmert complet à 7 paramètres est une fonction publique distincte NON couverte par cette vérification externe : sa preuve est un test unitaire interne de récupération analytique plus tests/lunar_helmert_fit_cross_check.rs, qui le fait concorder avec l'ajustement exact de Gauss-Newton vérifié dans lunar_frame_realise et fixe la convention de signe de rotation opposé entre les deux)

# text
seg-c69fd3fc645b = Trois éphémérides de référence indépendantes - DE440 (JPL), INPOP21a (IMCCE), EPM2021 (IAA RAS) - échantillonnées via calceph de l'IMCCE, recoupées par un ajustement des moindres carrés par SVD numpy indépendant. POURQUOI C'EST vérifié ICI ALORS QUE lunar_common_mode NE L'EST PAS, sur les trois mêmes éphémérides : ici la grandeur rapportée EST une propriété des données publiées - leur désaccord mutuel - de sorte que les éphémérides sont la référence indépendante, et non une entrée. Dans lunar_common_mode, le même désaccord alimente une géométrie de constellation MODELLED et la réponse est une propriété de ce modèle, ce qui explique que cette ligne est à juste titre Modelled/ReferenceImpl.

# text
seg-2d3347bcb15e = Tolérance de cohérence inter-fournisseurs pour un utilisateur à fournisseurs mixtes

# text
seg-9decf2cb6b0c = consistency_tolerance : inverse un budget de position de l'utilisateur en une exigence d'accord de Helmert inter-fournisseurs par paramètre (origine/échelle/rotation) à un bras de levier de référence, éventuellement gonflée par la CRLB de réalisation à fournisseur unique P1

# text
seg-b8dc68eb4bda = Borne triangulaire du pire cas sur l'action jacobienne ponctuelle de Helmert (forme close)

# text
seg-5450d921dfc9 = Budget d'erreur d'interopérabilité lunaire multi-fournisseurs et loi de conception référentiel contre éphéméride

# text
seg-e1e30f5c17a6 = interop_budget : partage réductible (lien de référentiel commun) contre irréductible (dynamique) selon les conventions PerProvider / CommonFrameTie / CommonEphemeris, avec la mesure de loi de conception de la fraction irréductible (~{ "0.69" } sur les vraies DE440/INPOP/EPM : une étiquette de référentiel commune seule laisse subsister le plancher dominant)

# text
seg-46304ae1efa4 = Agrégation RMS des partages par paire vérifiés selon chaque convention (forme close)

# text
seg-a01f394a36d3 = Chaîne d'algèbre linéaire d'observabilité des défauts en réseau libre autonome (projecteur de parité, détectabilité, non-centralité MDB, étincelle de bloc byzantine)

# text
seg-b3389bb90e8d = Sur le réseau lunaire par nœud réel DE440 (chaque ligne étant une distance aller simple différentielle entre nœuds construite via pernode_range_row avec une véritable ligne de visée dans le repère PA de la Lune DE440), le moteur calcule le projecteur de parité pondéré P⊥ = I − G(GᵀWG)⁺GᵀW (la forme à pseudo-inverse de rang déficient qui survit à la jauge à 8 dimensions référentiel⊕échelle de temps), le résidu de détectabilité T1 ‖P⊥·b‖ (défauts dans l'espace image annihilés, défauts génériques détectables), la forme quadratique de non-centralité MDB de Baarda cᵀWP⊥c (la forme pondérée à P⊥ unique correcte, et NON la forme à double P⊥ cᵀP⊥WP⊥c) avec MDB = √(λ₀/cᵀWP⊥c), et les comptes de détection/identification par étincelle de bloc byzantine des signatures de pairs effectives empilées P⊥·B_T (rang de colonnes, et non simple non-nullité)

# text
seg-8cb248423fd0 = Reproduction indépendante en algèbre linéaire numpy/scipy sur de vraies lignes de visée dans le repère PA de la Lune DE440 (P⊥ à partir de la SVD de la matrice de conception blanchie W^{ "{" }1/2{ "}" }G ; la non-centralité MDB à partir de la norme au carré classique de Baarda ({ "1968" }) du sous-espace de parité ; le rang de bloc à partir d'un comptage des valeurs singulières par SVD numpy) — une voie numérique réellement différente de la décomposition en valeurs propres de Jacobi cyclique de GᵀWG employée par le crate. Périmètre (selon tests/fixtures/faultobs/NOTICE.md) : cela valide la CHAÎNE D'ALGÈBRE LINÉAIRE sur ces seules lignes. La géométrie des nœuds est modélisée. Ce n'est PAS une garantie d'intégrité opérationnelle, ni une certification de niveau de protection, ni une quelconque affirmation de disponibilité RAIM/ARAIM, et PAS une garantie de mission de tolérance aux fautes byzantines — le NOMBRE de fautes tolérées pour ce réseau est modélisé, tandis que la BORNE d'étincelle de bloc détection>f / identification>2f est Citée (Fawzi–Tabuada–Diggavi { "2014" } ; Shoukry–Tabuada { "2016" } ; étincelle par blocs de Donoho–Elad { "2003" }) et démontrée dans son instanciation en code

# text
seg-ebb827739614 = Borne de détection/identification par étincelle de bloc byzantine sur le réseau lunaire autonome par nœud (T3)

# text
seg-4fb935e6193d = byzantine_bound instancie la borne de codage d'estimation d'état sécurisée / d'observabilité parcimonieuse sur la géométrie du réseau par nœud : un pair byzantin injecte une combinaison linéaire arbitraire des mesures auxquelles il participe, et le réseau DÉTECTE toute coalition de ≤ f = block_spark − { "1" } pairs et IDENTIFIE de façon unique toute coalition de ≤ ⌊(block_spark − { "1" })/2⌋, où block_spark est la plus petite coalition de pairs dont les signatures effectives empilées P⊥·B_T sont de rang de colonnes déficient. La détectabilité d'un pair est le RANG DE COLONNES PLEIN de P⊥·B_j (un bloc non nul mais de rang déficient est une attaque non nulle qui tombe dans range(G) et ne laisse aucun résidu), et pas seulement P⊥·B_j ≠ { "0" }

# text
seg-3b8b54db475d = Instanciation géométrique de la borne d'étincelle par blocs / d'estimation d'état sécurisée (Fawzi–Tabuada–Diggavi { "2014" } ; Shoukry–Tabuada { "2016" } ; étincelle par blocs de Donoho–Elad { "2003" } ; Candès–Tao { "2005" }) — PAS le seuil de consensus 3f+{ "1" } de Lamport–Shostak–Pease (« byzantin » ne désigne que le MODÈLE de faute arbitraire/collusoire). Le nombre précis de fautes tolérées est une propriété modélisée de la géométrie représentative du réseau, vérifiée pour son autocohérence par des cas analytiques construits à la main et par les formules de comptage

# text
seg-4f57f586cf82 = Plancher de jauge temporelle en holdover autonome pour la constellation lunaire autoréférentielle (T4)

# text
seg-eb690e8f5c9b = holdover_floor établit que, dans un ensemble de nœuds autonomes reliés uniquement par des mesures inter-nœuds, la dérive d'horloge commune (δα_j += { "1" } ∀j) est un paramètre libre du temps d'ensemble situé dans N(GᵀWG) : aucune quantité de télémétrie inter-nœuds supplémentaire ne peut l'observer (rate_in_gauge = true, temporal_gauge_dim = { "2" } avec le décalage commun). C'est le véritable plancher de holdover — l'analogue temporel de la jauge de position du référentiel rigide. L'ajout d'un lien externe de dérive absolue (un lien direct vers une référence hors réseau) expulse la dérive commune de l'espace nul (rate_in_gauge = false, temporal_gauge_dim = { "1" }), ce qui prouve que le plancher est une véritable jauge et non un artefact du modèle d'oscillateur

# text
seg-097f126797bb = Argument du paramètre libre du temps d'ensemble (Percival { "1978" } ; Lewandowski & Thomas { "1991" }) instancié sur le réseau par nœud réel représentatif DE440 : un test de nullité en résidu relatif du générateur analytique de dérive commune par rapport à GᵀWG, le contraste après levée de lien distinguant la véritable jauge d'un artefact du modèle d'oscillateur. Géométrie modélisée représentative, et non un budget de synchronisation certifié

# text
seg-25ffd6e1979c = Partage commun/différentiel par fournisseur, unification par déficience d'un rang et pente de l'écart de protection (T5 / §{ "0" } / g7)

# text
seg-72c7ec3724bf = Trois facettes de la décomposition unique ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG), avec la jauge à 8 dimensions référentiel⊕échelle de temps comme N(G) et les state_dim − { "8" } = { "32" } directions observables comme range(G) : (T5) provider_mismatch_split classe un biais commun multi-fournisseurs (∈ range(G)) comme INDÉTECTABLE — nécessitant un lien externe — et un biais différentiel (∉ range(G)) comme autosurveillé / DÉTECTABLE ; (§{ "0" }) l'unification tient à ce que le MÊME sous-espace aveugle range(G) gouverne la classe de fautes indétectables, de sorte que la jauge du référentiel N(G) et le sous-espace aveugle aux fautes range(G) forment une seule géométrie, et non deux ; (g7) slope renvoie la pente d'écart de protection de Brown ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ pour une faute b ∈ range(G) (estimateur corrompu avec une parité nulle) et finie pour une faute détectable

# text
seg-e0fd3860fce9 = Algèbre sous forme close du projecteur de parité / de la pseudo-inverse sur le réseau par nœud réel représentatif DE440 : le partage commun/différentiel, l'unification N(G) ⊕ range(G) et la pente d'écart de protection de Brown ({ "1992" }) découlent toutes de l'annihilation de l'image P⊥·G = { "0" }. Géométrie modélisée représentative, et non un niveau de protection certifié

# text
seg-101b0551d987 = MTIE et TDEV de synchronisation télécom sur une série d'erreur de temps en holdover

# text
# c1: telecom-timing
seg-b4762fd3cb9d = L'erreur maximale d'intervalle de temps et l'écart temporel que le type de scénario <c1/> rapporte, sur un enregistrement de holdover à l'échelle télécom : une MTIE à fenêtre glissante en O(n) à file monotone (telecom_timing::mtie_sliding, nécessaire pour qu'une journée d'échantillons à une seconde reste rapide) et la TDEV du moteur (allan::time_deviation), évaluées sur la grille que le type rapporte et relues à partir d'une exécution complète qui ingère la série

# text
seg-59cb2711355c = allantools { "2024.06" } — une bibliothèque tierce indépendante de stabilité de fréquence — mtie() et tdev() sur tests/fixtures/telecom_timing/holdover_te_series.csv, la série étant lue à partir du même texte à 17 chiffres significatifs des deux côtés ; la référence indépendante enregistre le SHA-256 de la série et peut être régénérée hors ligne via tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Valide les ESTIMATEURS sur cet enregistrement, et non le holdover synthétique qui l'a produit

# text
seg-632add2dbd3c = Masques de synchronisation télécom ITU-T avec PASS/FAIL et marge

# text
# c1: telecom-timing
seg-47687529aee7 = Limites transcrites de l'ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC verrouillé et holdover ePRTC-A (y compris l'enveloppe d'erreur de temps du tableau { "3" }), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) classes T-BC/T-TSC A-D et G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) point de référence C, chaque intervalle ouvert ou fermé comme l'énonce le tableau, toute entrée « pour étude ultérieure » étant omise ; un verdict et une marge au point limitant par vérification, et le temps de dépassement de chaque budget. Exécutable comme type de scénario <c1/>

# text
seg-46b139a58bb0 = Transcription des Recommandations nommées (téléchargeables librement sur itu.int), chaque limite portant son tableau ou son paragraphe, avec chaque élément non confirmé ou non implémenté répertorié dans docs/TELECOM-TIMING.md ; les identités de continuité aux points de rupture que les tableaux impliquent sont vérifiées dans les tests. Une transcription de normes avec des vérifications de cohérence interne, et non un essai de respect de la norme ni une validation externe. { "0.30" } tour { "2" } (préenregistré 970003ee), bloqué (reste MODELLED) : les dix valeurs de masque et les treize valeurs de holdover ePRTC-A que les Recommandations impriment comme exemples chiffrés (G.8272 fig. 1-2, G.8272.1 Amd.1 par. { "8.2.1" } et fig. V.1-V.3, G.8271.1 Amd.3 fig. 7-2 à 7-4) sont reproduites à moins d'une demi-unité imprimée, la plupart étant des constantes de tableau ou des points de rupture ; la fig. 7-2 de G.8271.1 indique { "200" } ns à { "1.3" } s, contre son propre tableau 7-1 ({ "197.5" } ns). Les limites des classes A-D de G.8273.2 n'ont aucun exemple chiffré imprimé, et les étiquettes de points de rupture ePRTC verrouillé de G.8272.1 (sur des lignes de construction pleines) ont été exclues par la règle de sélection préenregistrée ; elles restent donc des transcriptions

# text
seg-165ed2bc771a = Masques de génération de dérive lente de synchronisation de fréquence ITU-T (G.811, G.812, G.8262, G.8262.1)

# text
# c1: telecom-timing
# c2: 8 τ^0.5
seg-953793d4446a = Sept masques de génération de dérive lente MTIE et TDEV à température constante pour le type <c1/> : G.811 (09/1997) PRC (autonome), G.812 (06/2004) types I, II et III, G.8262 (10/2024) EEC options { "1" } et { "2" } et G.8262.1 (11/2025) eEEC (mode verrouillé), y compris les morceaux en loi de puissance que les tableaux écrivent (<c2/> et semblables), chaque intervalle ouvert ou fermé comme imprimé, mesurés à travers le filtre de { "10" } Hz qu'indiquent les paragraphes (pris comme appliqué avant l'échantillonnage) ; le scénario de référence scenarios/telecom-synce-eec.toml oppose un OCXO en fonctionnement libre aux trois masques EEC. Non implémentés : les tolérances en température variable, le holdover, les transitoires, la gigue et la précision de fréquence de G.811

# text
seg-ca16d9c98dc5 = Transcription des Recommandations nommées (téléchargées sur itu.int le 2026-10-13), chaque ligne relue par rapport au texte, la continuité aux points de rupture qu'impliquent les coefficients imprimés étant bornée dans les tests (par exemple { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns contre le palier de { "100" } ns du tableau { "4" } de G.812). Une transcription de normes avec des vérifications de cohérence interne, et non un essai de respect de la norme ni une validation externe. G.812 (06/2004) est indiquée comme remplacée par une édition pré-publiée de 08/2026 et G.811 a un Amd. { "1" } (04/2016) ; aucune n'a pu être lue, et aucune n'est donc vérifiée. Le scénario d'OCXO en fonctionnement libre surestime la contribution de l'oscillateur aux intervalles d'observation longs par rapport à la constante de temps d'une boucle ; il ne dit rien d'aucune horloge d'équipement

# text
seg-5fc2ad88faf0 = Formats de journaux d'horloge (horloge RINEX, ASCII TimeLab, TAPR TICC) lus sous forme de série de phase normalisée

# text
# c1: [series.clock_log]
# c2: clock_log
# c3: [clock_log]
# c4: measured
seg-5b5bcbdea166 = clock_log::read_input : une couche d'analyse unique qui transforme un fichier d'horloge RINEX (enregistrements AS/AR d'une horloge nommée, versions { "2" } et { "3.00" } à { "3.04" }), un journal ASCII de phase ou de fréquence de type TimeLab, ou un journal d'horodatages ou d'intervalles TAPR TICC en une grille de phase uniforme, avec tau0 indiqué, issu d'un en-tête, ou l'espacement médian, chaque trou, lecture hors grille et doublon étant comptés, et une politique de trous refuse, plus-longue-série ou linéaire ; branchée en option dans la série de synchronisation télécom (<c1/>, ajoutant un bloc <c2/>) et dans le type horloge (<c3/>, ajoutant un bloc <c4/> avec ADEV, TDEV et MTIE, le SHA-256 de la table et le SHA-256 de la phase ; runs = { "1" }). Sans la table, les deux types sont identiques octet pour octet

# text
seg-1d3df655c14c = Préenregistré dans tests/fixtures/clock_log/PREREGISTRATION.md (versionné seul, 159334f2, avant l'existence du jeu de test) ; consigné dans RESULTS.md. Trois journaux synthétiques générés avec une graine, un par format (un trou TICC de trois époques, une seconde horloge RINEX à ignorer), relus par un lecteur indépendant écrit d'après docs/CLOCK-LOG-FORMATS.md par le même auteur : grille, trous et nombres de remplissage égaux, et plus grande différence de phase { "0" } s (seuil { "1e-13" } s). oadev, tdev et mtie d'allantools { "2024.6" } sur cette phase concordent à un relatif de { "2.5e-14" } près (seuil { "1e-10" }) à chaque facteur de moyennage qu'il évalue ; il n'évalue pas la MTIE sur l'ensemble de l'enregistrement, que le moteur rapporte, de sorte que ce point unique par journal n'a pas de valeur de référence indépendante et que le seuil tel que formulé n'est pas atteint à cet endroit. MODELLED : journaux synthétiques, et la référence indépendante du lecteur partage l'auteur ; de vrais fichiers d'horloge TimeLab, TICC et RINEX issus d'instruments n'ont pas été comparés

# text
seg-acdb0337bce7 = Formats de journaux linuxptp (ptp4l, phc2sys, ts2phc) et chrony (tracking, statistics) lus sous forme de série de phase normalisée

# text
# c1: clock
seg-e87b3dba2072 = clock_log::read_input avec les formats ptp4l, phc2sys, ts2phc, chrony-tracking et chrony-statistics : le décalage journalisé d'une ligne d'asservissement linuxptp (ns, l'horodatage entre crochets propre à la ligne, les lectures antérieures au premier rapport de l'asservissement en s2 étant omises et comptées) ou d'un journal tracking ou statistics de chrony (s, par position de colonne, date et heure UTC) devient une grille de phase uniforme grâce aux mêmes politiques de trous que les autres formats ; un sélecteur de source (<c1/>) désigne l'une de plusieurs interfaces, horloges ou adresses ; les journaux alimentent la série de synchronisation télécom, le type horloge et le type d'essai de holdover

# text
seg-fb9393044576 = Jeux de test écrits pour Kshana d'après les dispositions de lignes publiques des démons, avec des valeurs inventées (NOTICE.md dans le dossier du jeu de test) ; aucun journal d'une installation réelle n'a été lu et aucune référence indépendante ne compare l'analyse avec un autre lecteur, de sorte qu'une disposition qui diffère selon les versions des démons peut encore être refusée ou mal lue. Les estimateurs alimentés par la série de phase sont ceux vérifiés par rapport à allantools dans les lignes ci-dessus

# text
seg-97aebb84576e = Essai de holdover noté à partir d'un enregistrement d'erreur de temps fourni par l'opérateur

# text
# c1: holdover-test
seg-ab533cf99c56 = Le type <c1/> : un enregistrement d'erreur de temps (un journal d'horloge linuxptp, chrony, TICC, TimeLab ou RINEX, ou des paires time_s,time_error_ns) est découpé aux deux instants que l'opérateur indique pour la suppression et le rétablissement du GNSS en une étape de référence de base, une de holdover et une de récupération ; la référence de base est mesurée par rapport aux masques ITU-T écrits pour une horloge verrouillée et le holdover par rapport à ceux écrits pour le holdover ou une horloge autonome, l'enveloppe de holdover ePRTC-A et les budgets d'erreur de temps ; le holdover rapporte le décalage de fréquence par moindres carrés que le système a tenu, et la récupération indique si et quand |TE| est entrée dans une bande donnée et y est restée pendant une durée donnée, avec le pic et le plus grand saut. Chaque limite est celle que transcrit le type de synchronisation télécom ; les deux instants sont la déclaration de l'opérateur et ne sont pas vérifiés

# text
seg-a54380cf95ea = Calcul manuel sur des enregistrements construits à partir de formules dont la pente, le saut, l'extremum et le temps de récupération sont connus avant l'exécution (les tests les énoncent), et les masques, l'enveloppe et les budgets des lignes de synchronisation télécom ci-dessus. Aucune mesure en laboratoire d'un vrai holdover n'a été notée et aucune référence indépendante externe n'a été comparée, de sorte que le type n'avance aucune affirmation sur une horloge ou un système ; un partenaire de laboratoire de synchronisation est nécessaire avant qu'un chiffre par classe d'horloge puisse être promu

# text
seg-94cbac97a1aa = Disponibilité des signaux GNSS dans le volume de service spatial et au-delà, comparée au livret ICG SSV

# text
# c1: gnss-ssv
seg-c59e349fdc9e = Les balayages de disponibilité du type <c1/> : par constellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) et combinées, la part des paires (utilisateur, époque) avec au moins un et au moins quatre signaux et la plus longue interruption, pour un utilisateur sur une sphère (la coquille mondiale de 2,562 points du livret, { "14" } jours à { "1" } minute) ou sur une trajectoire (GEO, HEO, transfert lunaire), à partir des orbites képlériennes de l'annexe C du livret, d'une puissance rayonnée minimale constante à l'intérieur de l'angle hors axe de référence, d'un blocage par la Terre assimilée à la sphère plus { "50" } km et d'un seuil de C/N0 ; antennes utilisateur d'après le tableau B10 du livret

# text
seg-d71c9d361342 = Le livret ICG du volume de service spatial (UN OOSA ST/SPACE/75, { "2018" }), lui-même une simulation, comparé sous un préenregistrement versionné avant l'exécution (xval/gnss-ssv/PREREGISTRATION.md ; résultats dans xval/gnss-ssv/RESULTS.md, figés par tests/ssv_booklet_results.rs, échecs compris). Exécution { "1" } sur la lecture préenregistrée : les constantes de puissance rayonnée minimale et le seuil lunaire concordent (S0, S6 atteints) ; les seuils SSV supérieur et inférieur, de seuil RF, GEO et HEO sont NOT MET, presque tous à cause de GLONASS, pour lequel le livret donne { "20" } et { "28" } degrés dans les tableaux B2 et B6 et { "26" } et { "34" } degrés dans le tableau { "4.2" }. Une variante de diagnostic avec les angles du tableau { "4.2" } concorde dans chaque cellule du SSV supérieur, du SSV inférieur et des six missions GEO (elle ne remplace pas l'exécution { "1" } ; les cellules RF, HEO et lunaires échouent encore). Les diagrammes mesurés du panneau GPS L1 ne sont pas reproduits par le substitut paramétrique (RMS { "6" } à { "9" } dB contre un seuil de { "3" } dB). La concordance montre que la méthode énoncée du livret est reproduite, et non que les signaux GNSS se comportent ainsi

# text
# c1: gnss-ssv
seg-d2f04991c8a4 = Effets de l'ionosphère, de la plasmasphère et de l'atmosphère sur les signaux GNSS rasants le long du rayon au limbe, et conception du récepteur pour signaux faibles, dans le type <c1/>

# text
seg-1a1786ba90b6 = Une ionosphère de Chapman, une plasmasphère de type Gallagher et une atmosphère neutre (courbure par réfractivité, absorption par l'oxygène, défocalisation) intégrées le long du rayon rectiligne entre l'émetteur et l'utilisateur : contenu électronique total oblique, sa part plasmasphérique, retard excédentaire, altitude de tangence et perte sur les liaisons rasantes ; et une conception de récepteur pour signaux faibles (intégration cohérente et non cohérente, limite de bit de données, aide, recherche Doppler) qui fixe le seuil de C/N0 à partir des modèles d'acquisition et de boucle de poursuite

# text
seg-4ca1217472ab = Formes closes et amplitudes publiées dans les tests (le pic d'une couche de Chapman et la courbure du limbe de surface, quelques TECU de plasmasphère sur un rayon GPS-vers-GEO) ; la conception du récepteur réutilise les modèles d'acquisition et de boucle de poursuite et leurs tests. Aucune donnée mesurée de sondage au limbe ni de réception de signaux faibles n'est comparée avec elle

# text
seg-6b8f9f3ca2a3 = Filtre de navigation GNSS embarqué pour engins spatiaux en orbite haute et en transfert lunaire

# text
# c1: gnss-ssv
# c2: [navigation]
seg-39ddc494f103 = Le mode <c2/> du type <c1/> : un filtre de Kalman étendu à neuf états (position, vitesse, biais et dérive d'horloge du récepteur, une échelle de pression de radiation solaire) sur des pseudodistances dont la disponibilité, le bruit et le C/N0 proviennent de la même géométrie de liaison que les balayages ; la vérité terrain est intégrée avec J2, les perturbations du Soleil et de la Lune comme troisièmes corps et la pression de radiation avec ombre, le filtre modélise J2 et les troisièmes corps et estime la pression de radiation ; rapporte les erreurs de position et de vitesse à l'intérieur et au-dessus des orbites GNSS, le plus long trou de mesure et la NEES moyenne

# text
seg-469602656ab4 = Vérité terrain simulée par rapport à l'estimation propre du filtre (l'erreur d'estimation normalisée au carré moyenne d'un filtre cohérent est d'environ { "3" } pour la position) et déterminisme pour une graine fixe. Aucune donnée GNSS de vol ou enregistrée en orbite haute n'est comparée ; le Soleil et la Lune sont des substituts circulaires de faible précision

# text
seg-5fc242476828 = Navigation relative d'une formation de plusieurs engins spatiaux en orbite très elliptique à partir du GNSS

# text
# c1: gnss-ssv
# c2: [formation]
seg-f67eb29d4483 = Le mode <c2/> du type <c1/> : un chef et des adjoints exécutent chacun le filtre absolu ; la position de l'adjoint par rapport au chef est estimée par soustraction des estimations absolues et par un filtre relatif sur des pseudodistances à simple différence des signaux que les deux engins poursuivent, la dynamique relative étant la différence de deux trajectoires non linéaires

# text
seg-69c078b57fc8 = La même vérité terrain simulée que pour le filtre absolu : l'erreur du filtre relatif par rapport à l'état relatif vrai, et la vérification qu'il fait au moins aussi bien que la soustraction de deux positions absolues indépendantes. Aucune donnée de formation en vol n'est comparée

# text
seg-7038f6902820 = Termes d'erreur de l'interféromètre à atomes froids : bruit de phase du laser Raman, biais de courbure du front d'onde et résolution de l'ambiguïté de frange

# text
seg-4d9690207607 = inertial::cai_error_terms (fonctions de bibliothèque, pas encore accessibles depuis un type de scénario) : la fonction de pondération de phase Raman d'un interféromètre à trois impulsions carrées (Cheinet et al. { "2008" }, éq. { "8" }) avec la forme close de phase blanche (pi/2)^{ "2" } S_phi0/tau_R et une voie numérique pour tout spectre ; le bruit de fréquence du laser que le retard de rétroréflexion n'annule pas (Le Gouet et al. { "2007" }, éq. { "9" } à { "11" }) ; le biais de front d'onde par pure défocalisation sigma_v^2/R d'un nuage thermique et sa réduction par un rayon de détection ; la probabilité d'indice de frange erroné erfc(pi/(sqrt({ "2" }) s)) pour une aide par accéléromètre classique et pour deux temps d'interrogation, et son inverse

# text
seg-a7b220763674 = Chaque forme close par rapport à une voie numérique indépendante dans les tests (quadrature en domaine fréquentiel de la fonction de transfert exacte et du filtre de retard, un Monte Carlo sur les atomes pour le biais de front d'onde, un Monte Carlo sur les tirs pour l'indice de frange) et ses cas limites. Une valeur chiffrée publiée : Cheinet et al. { "2008" } (arXiv:physics/0510197, sec. IV) indiquent qu'à tau_R = { "20" } us un bruit de phase Raman blanc inférieur à -111 dB rad^2/Hz est nécessaire pour { "1" } mrad par tir ; le terme blanc seul donne { "0.99" } mrad (l'article déduit le niveau avec son éq. { "17" }, scintillation plus blanc). Cohérence interne et une valeur chiffrée, et non une validation externe ; les aberrations d'ordre supérieur et le bruit d'un laser particulier ne sont pas modélisés

# text
seg-c380ec16a4f8 = Degrés de liberté équivalents exacts de Greenhall et Riley des variances d'Allan, d'Allan modifiée et d'Hadamard

# text
seg-dee2a54c5019 = allan::edf_greenhall (avec les enveloppes edf_greenhall_adev, _mdev et _hdev) : l'algorithme complet de Greenhall et Riley, Proc. 35th PTTI ({ "2003" }), section { "3" } (éq. { "7" } à { "13" } et coefficients grand-J des tableaux { "1" } à { "3" }), pour les ordres de différence { "1" } à { "3" }, les exposants de bruit +{ "2" } à -4 partout où alpha + 2d > { "1" }, avec et sans recouvrement, estimateurs modifiés et non modifiés ; NaN là où il ne s'applique pas, y compris le cas de bruit blanc de phase non modifié avec ceil(M/S) <= d, dont la forme close n'est pas implémentée. assurance::uncertainty::edf partage désormais le code et conserve ses sorties bit pour bit

# text
seg-695ec24f9676 = allantools { "2024.6" } ci.edf_greenhall, une implémentation tierce de l'algorithme publié, exécutée par scripts/gen_greenhall_edf_ref.py sur la grille préenregistrée dans xval/greenhall-edf/PREREGISTRATION.md (versionnée seule, 0db0bb7a, avant toute comparaison) : en tous les { "4 876" } points où il renvoie un edf fini, kshana concorde à un relatif de { "6.0e-13" } près (seuil { "1e-9" }) ; à ses { "46" } points NotImplementedError, kshana renvoie NaN ; chaque étiquette de cas apparaît ; les enveloppes égalent le cœur bit pour bit ; uncertainty::edf est identique bit pour bit sur { "274 280" } valeurs (figé comme SHA-256 avant la refonte). En { "32" } points (alpha -4, d { "3" }, non modifié, cas { "2.2" }) allantools échoue dans sa consultation du tableau { "2" }, de sorte qu'ils n'ont pas de valeur de référence indépendante et ne sont pas comptés. Stable32 n'a pas été exécuté. { "0.36" } révision (docs/revisions/STUDIO15-greenhall-edf-portable.md) : en mathématiques portables, le noyau prend son logarithme d'une évaluation en double-double arrondie une seule fois (allan::greenhall_ln), et le seuil { "1" } inchangé tient de nouveau en tous les { "4 876" } points, pire cas relatif { "6.0e-13" } ; la garde uncertainty::edf est rebasée sur le vidage portable { "0.36" } ({ "3 746" } des { "274 280" } valeurs ont bougé, d'au plus { "1.6e-12" } en relatif, par rapport à la base en mathématiques de l'hôte)

# text
seg-363705e03bac = Préréglages de holdover d'oscillateur d'après des fiches techniques publiques

# text
seg-9750d9e0ec7a = Quatre préréglages — OCXO (Microchip OX-208), rubidium (Microchip 8040C), césium (Microchip 5071A tube haute performance) et CSAC (Microchip SA.45s) — chacun portant les maxima d'écart d'Allan, le vieillissement et la borne de température de sa fiche technique ; un ajustement par moindres carrés non négatifs du bruit de fréquence blanc + scintillation + marche aléatoire, mis à l'échelle pour envelopper chaque point de la fiche technique, un plancher de scintillation jamais inférieur au chiffre du τ le plus long, un vieillissement linéaire et un terme de température sinusoïdal, synthétisés comme un holdover généré avec une graine après une perte de GNSS

# text
seg-95aaa171864b = Les quatre fiches techniques Microchip nommées (numéros de documents et URL dans chaque préréglage et dans docs/TELECOM-TIMING.md) pour les chiffres d'entrée ; la rampe de vieillissement sous forme close et la propriété d'enveloppe de l'ajustement comme vérifications internes. La façon dont les chiffres deviennent un modèle de bruit — l'ajustement, la règle du plancher, le mois de 30 jours, la lecture linéaire de la température — est un choix de modélisation ; aucun préréglage n'est une mesure d'une unité. { "0.30" } tour { "2" }, seuils unilatéraux par rapport à des unités mesurées (préenregistré a01c491c), un constat (reste MODELLED) : la station IGS THU2 Symmetricom 8040C dans les horloges finales ESA MGEX a un écart d'Allan de { "0.35" } à { "0.87" } de celui du préréglage rubidium mais une erreur de holdover de { "1.07" } à { "1.60" } fois celle-ci ; l'enregistrement du 5071A se situe au-dehors du préréglage césium jusqu'à { "1000" } s (bruit blanc de phase de mesure, 30x à { "1" } s) et en holdover ({ "1.15" } à { "8.74" }) ; le pire SA.45s de production { "2011" } vaut 1.26x le préréglage CSAC à { "1" } s ; l'OX-208 n'a aucun enregistrement mesuré (bloqué)

# text
seg-69f93d5ec864 = Prédiction de holdover à partir d'un enregistrement d'horloge mesuré, vérifiée sur des données réservées

# text
# c1: slot-timing
seg-8bdc5a24c66d = Le chemin d'enregistrement mesuré du type <c1/> : l'écart d'Allan avec recouvrement d'un enregistrement de phase ajusté par moindres carrés non négatifs pondérés par edf dans la base de phase blanche et de modulation de fréquence de l'IEEE Std { "1139" } (slot_timing::fit_weighted), puis inversé pour obtenir le durée de marche libre auquel l'erreur de temps atteint un seuil (slot_timing::slot_budget). Le plancher de bruit rouge est mesuré à partir de l'enregistrement au lieu d'être supposé

# text
seg-c888226296fe = Une vraie horloge atomique en fonctionnement libre : { "556 990" } échantillons de phase à une seconde d'un étalon au césium 5071A mesuré par rapport à un maser à hydrogène (A. Wallin, distribué avec allantools ; commit figé et SHA-256 dans scripts/fetch_cs5071a.sh), le même enregistrement que tests/cs5071a_reference.rs utilise pour les estimateurs. Les deux tiers réservés sont une mesure externe que la prédiction n'a jamais vue. Conditionné par les données : le workflow realdata-clock récupère l'enregistrement et exécute le test avec KSHANA_REQUIRE_REALDATA={ "1" }. Valide le chemin ajustement-puis-inversion sur un étalon atomique dominé par le bruit blanc de fréquence pour des durée de marche libre allant jusqu'à environ { "50 000" } s ; pas les sources de fiche technique ou de classe, pas les termes déterministes. PAS un oscillateur à quartz : sur un enregistrement d'OCXO mesuré (tests/slot_timing_ocxo_holdout.rs, allantools, { "5.5" } h contre un maser à hydrogène), la prédiction sur données réservées est prudente, à { "0.59" } à { "0.70" } du dépassement mesuré, et en majeure partie hors du seuil, parce que le plancher de bruit de cet oscillateur a diminué de moitié au cours de l'enregistrement ; dans l'échantillon, elle se situe entre { "0.98" } et { "1.17" }. Le cas du quartz reste MODELLED. PAS non plus des horloges atomiques en orbite : sur { "10" } horloges de satellites GPS Block IIF (tests/slot_timing_igs_holdout.rs, horloges finales IGS à { "30" } s, { "14" } jours, protocole écrit avant le téléchargement) { "8" } tombent dans le seuil et { "2" } (G25, G30) sont optimistes d'un facteur pouvant atteindre environ 2, de sorte que, selon le protocole, le cas orbital reste MODELLED

# text
seg-d7e03158b972 = Secondes avant qu'une horloge en fonctionnement libre ne quitte la garde d'un créneau indexé dans le temps, et cadence de recalage qui la maintient à l'intérieur

# text
# c1: slot-timing
seg-0b4d8815f756 = Le type <c1/> : l'erreur prédite E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² inversée pour le dépassement, le temps restant, l'intervalle de resynchronisation net de la latence de recalage et les recalages par jour, chaque terme détaillé avec le terme dominant nommé ; horloges issues des six valeurs par défaut de ClockClass (TCXO, OCXO et RAFS ajoutés, chacun citant une fiche technique), des préréglages de synchronisation télécom, d'une fiche technique en ligne ou d'un enregistrement mesuré ; un dépassement au-delà du temps de moyennage le plus long de la source étant signalé comme extrapolé

# text
seg-cc0464060e58 = Formes closes pour chaque terme seul et recherche de racine indépendante holdover::holdover_seconds ; les chiffres des fiches techniques sont ceux des documents nommés (docs/SLOT-TIMING.md). Un défaut de classe repose sur un plancher de bruit rouge supposé et une source de fiche technique est une enveloppe de maxima, de sorte que ni l'une ni l'autre n'est une mesure d'une unité quelconque

# text
seg-2797643153dc = Niveau de protection de la synchronisation temporelle pour un récepteur en orbite soumis au leurrage GNSS

# text
# c1: slot-timing
seg-cb412a2ffadf = orbital_timing::orbital_timing, accessible comme section de leurrage du type <c1/> : vitesse et période d'une orbite circulaire, plus longue durée pendant laquelle un leurreur au sol peut atteindre le satellite par passage, plancher du moniteur assisté par horloge et latence de détection CUSUM, niveau de protection conditionnel (plancher plus marche libre sur la latence), dérive qu'accumule un leurreur à une vitesse de rampe maximale donnée avant que le satellite ne quitte son empreinte ou qu'un contrôle indépendant ne s'exécute, et indication de l'indépendance de chaque contrôle de contact sol ou de liaison croisée vis-à-vis d'un leurreur au sol unique

# text
seg-3d441db3a373 = Réduction au niveau de protection de synchronisation temporelle existant et aux formes closes de visibilité en orbite circulaire et Terre sphérique. Conditionnel à la détection, un seul leurreur terrestre à une vitesse de rampe donnée, un passage au zénith sur une Terre non tournante ; non vérifié sur un récepteur leurré en orbite

# text
seg-158a99d40b0d = Densités spectrales de puissance de signaux en bande L sous forme close et coefficients de séparation spectrale

# text
seg-17060c71fa54 = Densités spectrales de puissance à aire unité de GPS L1 C/A et L2C (BPSK({ "1" })), GPS L5 et Galileo E5a (BPSK({ "10" })), sine-BOC({ "1,1" }) et Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, avec une variante MBOC ajoutée), leurs zéros et maxima localisés numériquement (spectrum::psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz), et le coefficient de séparation spectrale d'un signal par rapport à un spectre quelconque à un décalage quelconque (navsignal::spectral_separation_coeff_offset) ou par rapport à une raie, à un bruit plat, à un chirp ou à un bruit adapté (spectrum::Jammer::ssc), avec le coefficient anti-brouillage Q = 1/(R_c kappa)

# text
seg-d8fadba57203 = Valeurs publiées de manuels : le lobe principal de BPSK(n) de 2n x { "1.023" } MHz de zéro à zéro et les coefficients anti-brouillage Q = { "1" } pour un brouilleur à bande étroite (CW) et Q = { "1.5" } pour un brouilleur à étalement de spectre adapté au C/A (Kaplan & Hegarty, Understanding GPS/GNSS, 3e éd., section { "9.4" }) ; les lobes principaux de BOC(m,n) centrés à plus ou moins m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }) ; les coefficients de séparation spectrale -61.8, -64.8 et -67.8 dB/Hz pour C/A avec C/A, BOC({ "1,1" }) avec BOC({ "1,1" }) et C/A avec BOC({ "1,1" }) (Betz { "2001" } ; Hein et al., MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C, Inside GNSS, mai/juin { "2006" }), reproduits ici à partir de leurs formes closes d'autocorrélation de Parseval. Le maximum de BOC({ "1,1" }) n'est pas à { "1.023" } MHz : le lobe s'étend du zéro de la porteuse à { "2.046" } MHz et culmine à { "0.759" } MHz, et le test fige les deux. Le mélange MBOC est la définition de l'ICD, vérifiée seulement pour l'aire unité et la linéarité

# text
seg-f134975d4ffa = Cascade du spectre en bande L avec J/S par bande et C/N0 effectif sous un calendrier de brouilleurs scénarisé

# text
# c1: spectrum
# c2: jamming
seg-86ad8f89a822 = Le type <c1/> : une grille fréquence par temps de la densité spectrale de puissance en bande L (plancher thermique k T_sys avec T_sys = T_ant + { "290" } K (F - { "1" }), les signaux à leurs puissances reçues minimales de spécification d'interface, et des brouilleurs à onde continue, à bande étroite, à chirp et à bruit adapté avec leurs instants de marche/arrêt), chaque cellule étant moyennée sur sa case et sa ligne (les chirps exactement sur des balayages entiers et partiels, les brouilleurs selon leur rapport cyclique), C/N0 effectif par bande = [1/(C/N0) + sum (J/S) kappa]^-1 par ligne, J/S par bande, J/S en bande, et une cascade SVG avec des barres de C/N0. Le rapport comporte une vérification croisée avec la chaîne du type <c2/> sur les mêmes entrées de liaison

# text
# c1: jamming
# c2: jamming
seg-deead3dc3c43 = Réduction à l'équation anti-brouillage et au bilan de liaison du type <c1/> existant (le même code, appelé avec les mêmes entrées), et la forme close du plancher de bruit k T0 F. Les spectres de signaux sous-jacents sont la ligne vérifiée ci-dessus ; les puissances des brouilleurs, le calendrier et les largeurs de bande des étages d'entrée sont des entrées du scénario, les spectres sont continus (sans raies de code d'étalement), et aucun contrôle automatique de gain, aucun effacement ni aucun diagramme d'antenne n'agit sur le brouilleur. Aucun spectre brouillé mesuré ne figure dans le dépôt pour vérifier le composite. La table de Q du type <c2/> (CW et bande étroite { "1" }, large bande et balayé { "2" } depuis { "0.36" } : les valeurs de manuel, figées sur les formes closes de navsignal) concorde avec la valeur CW de ce modèle et diffère de ce qu'il dérive pour un bruit adapté au C/A ({ "1.5" }) et pour un bruit plat de zéro à zéro sans normalisation en bande ({ "2.2" }) ; le rapport imprime les deux

# text
seg-1461dcaed6be = Entrée et sortie d'enregistrements SigMF, et estimations spectrales de Welch d'IQ complexe

# text
# c1: spectrum
seg-2195d95299b2 = sigmf : lecture et écriture d'enregistrements Signal Metadata Format (.sigmf-meta JSON avec les champs de base global, captures et annotations ; .sigmf-data brut en cf32_le, ci16_le ou ci8, les décodeurs d'entiers étant partagés avec realdata::iqif::load_iq), le tout sur des chaînes et des tampons d'octets. spectrum::welch_psd : périodogrammes à fenêtre de Hann, avec recouvrement, moyennés, à échelle de densité, sur une transformée radix-2 interne au crate (spectrum::fft_in_place). Ces deux éléments constituent l'affirmation vérifiée. spectrum::synthesise_iq tire le modèle sous forme d'IQ, et la section [iq] du type <c1/> exécute modèle vers IQ vers SigMF vers Welch et compare avec le modèle ; sa section [recording] estime un enregistrement réel (versions natives) ; la synthèse et ces comparaisons au modèle sont hors de l'affirmation vérifiée

# text
seg-4e51d1a77382 = scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) avec la même fenêtre de Hann périodique, le même recouvrement, la même échelle de densité, sans retrait de tendance et avec une moyenne bilatérale : chaque case à { "1e-12" } près en relatif (observé { "6.0e-14" }) sur { "27" } cas, avec des nombres de segments tirés du propre spectrogramme de scipy. sigmf-python { "1.13.0" } (LGPL-3.0, exécuté comme outil) écrit cinq enregistrements tiers (cf32_le, ci16_le, ci8, deux captures avec annotations, un premier sample_start non nul) que le crate décode bit pour bit à l'identique avec des champs de base identiques, et relit les enregistrements du crate bit pour bit à l'identique ; le schéma de métadonnées SigMF { "v1.2.6" } ne signale aucune erreur sur les métadonnées du crate. Tolérances fixées avant la première comparaison. Hors de l'affirmation : spectrum::synthesise_iq et les comparaisons [iq] et [recording] avec le modèle (une synthèse n'a pas de bonne réponse unique ; un chirp périodique montre des raies, des ondulations de Fresnel et des queues de bord que le modèle lisse omet, puissance totale à { "2" } % près), la convention de mise à l'échelle entier-vers-flottant (le crate divise par { "32767" } et { "127" }, l'autoscale de sigmf-python par { "2" }^{ "15" } et { "2" }^{ "7" }, ce que la spécification laisse ouvert ; la comparaison utilise les codes bruts), les enregistrements multivoies et les types de données que le lecteur refuse

# text
seg-bf2d02d76762 = Positions des planètes dans tout le système solaire à partir des éléments képlériens JPL de Standish

# text
# c1: solar-system
seg-c9d3549045eb = Positions héliocentriques de Mercure, Vénus, du barycentre Terre-Lune, de la Terre, de Mars, de Jupiter et de Saturne d'après le tableau { "1" } de Standish ({ "1800" } apr. J.-C. à { "2050" } apr. J.-C.), et des huit planètes d'après les tableaux 2a/2b ({ "3000" } av. J.-C. à { "3000" } apr. J.-C., avec les termes d'anomalie moyenne b, c, s, f), en suivant pas à pas l'algorithme de la page JPL et en pivotant vers l'ICRF (International Celestial Reference Frame) par l'obliquité de la page ; la Terre est séparée du barycentre par la série lunaire de Montenbruck & Gill et le rapport de masses. Composé comme ephem_provider::AnalyticSolarSystem de sorte que n'importe quel corps soit disponible par rapport à n'importe quel autre, et exécutable comme type <c1/>

# text
seg-24e058d4d094 = Vecteurs héliocentriques géométriques JPL Horizons DE441 (écliptique et ICRF), récupérés après les commits de préenregistrement { "80451866" }, 8d38a28b et 558cc807. Seuil : par planète et par composante, un RMS d'au plus 1.0x les erreurs approchées du Explanatory Supplement 3e éd. tableau { "8.10.1" } (la ligne EMB pour la Terre) ; la séparation Terre-EMB est vérifiée directement par rapport à DE441 { "399" } moins { "3" }, au plus { "0.3" } deg et { "8.1" } km à chaque époque de 1950 à 2050 (le seuil de longueur de { "8.1" } km provient de l'exactitude de la série lunaire indiquée dans la documentation d'éphémérides propre à Kshana, qui cite Montenbruck et Gill, et n'a pas été vérifié par rapport à l'ouvrage ; les { "6.09" } km mesurés en sont proches). La statistique RMS a été choisie en sachant qu'une comparaison antérieure sur 27 époques atteignait 1.87x le nominal à son maximum ; les erreurs à époque unique atteignent 3.83x (3.87x dans le cas ICRF). Le Supplement ne définit pas ses chiffres comme des RMS. Le cas B fait pivoter les deux côtés avec l'obliquité IAU { "1976" } saisie dans le test, de sorte que la rotation n'est pas vérifiée par rapport à elle-même. La sélection de table par défaut d'AnalyticSolarSystem n'est pas éprouvée (les tests imposent le tableau { "1" }). Uranus et Neptune d'après le tableau { "1" } forment une ligne MODELLED distincte

# text
seg-4ea08a296b37 = Positions du Soleil, de la Lune, de Mercure et de Vénus à partir du noyau DE440 à des époques UTC (KernelEphemeris)

# text
seg-8d47467c36e4 = Positions géométriques du Soleil, de Mercure, de Vénus, de la Terre et de la Lune les uns par rapport aux autres (axes J2000/ICRF, mètres) à partir d'un noyau JPL DE440 via ephem_provider::KernelEphemeris à des époques UTC : noms de corps associés aux codes NAIF, UTC transporté par la table des secondes intercalaires puis TT vers TDB avec la série TDB-TT à deux termes, le noyau étant lu par le propre lecteur du moteur. Un corps que le noyau ne détient que comme barycentre de système (de Mars à Neptune, Pluton dans de440s) est refusé, jamais substitué. La ligne Standish sans noyau reste le chemin pour navigateur et de repli

# text
seg-f0e09f78814a = Skyfield { "1.54" } (MIT), avec sa propre table de secondes intercalaires, son propre TDB-TT et son propre lecteur du même de440s.bsp NAIF (jplephem), exécuté comme programme distinct à des époques UTC. Préenregistré (0bfafe6d) avant l'existence du jeu de test, la grille étant tirée à partir du hachage de ce commit, avec un seuil de { "5e-5" } s fois la vitesse relative (l'exactitude à deux termes de TDB-TT indiquée par le moteur) plus { "1e-13" } de la distance barycentrique plus { "1e-5" } m, par composante. Résultat : les { "600" } à l'intérieur, pire cas { "0.66" } du seuil ({ "2.96" } m sur une paire rapide, l'erreur propre de la série TDB-TT). Mutation : TT utilisé comme TDB échoue à { "33" } fois le seuil. Les deux côtés lisent DE440 : cela vérifie le fournisseur et sa chaîne temporelle, et non DE440. Hors de l'affirmation : les planètes au-delà de Vénus comme corps (de440s ne porte que leurs barycentres), les lunes planétaires, et la précision inférieure à la série TDB-TT à deux termes (quelques mètres pour les paires les plus rapides)

# text
seg-b59153f28d69 = Temps de lumière entre corps du système solaire

# text
# c1: solar-system
# c2: body-pnt
seg-48ebe0983725 = Le temps de lumière newtonien aller simple d'un corps quelconque vers un autre, reçu à une époque, résolu par le solveur de temps de lumière à point fixe radiométrique (radiometric::light_time_solution, émetteur à sa position retardée) via solar_system::link_on sur tout EphemerisProvider ; le type solar-system l'exécute sur le système solaire analytique dans le repère héliocentrique (solar_system::link). La distance aller-retour de radiometric::two_way_range et le retard de Shapiro du Soleil de radiometric::shapiro_delay sont rapportés séparément et ne sont pas comparés en externe. Émis pour chaque corps par rapport à un observateur et pour toute liaison supplémentaire par le type <c1/>, et pour la liaison descendante corps-vers-Terre par le type <c2/>

# text
seg-0685ab1ef2d3 = Temps de lumière newtonien LT de la branche descendante aller simple de JPL Horizons DE441 (VEC_CORR=LT, observateur au centre de la Terre), préenregistré (480037d3, amendement 54d5c86f ne changeant que l'espacement des nœuds d'interpolation après que la première récupération a échoué à sa précondition de précision d'interpolation de { "10" } m, avant qu'aucun temps de lumière ne soit comparé) avec un seuil de { "1e-6" } s par temps de lumière, le solveur étant alimenté par les positions barycentriques DE441 afin que l'itération de l'émetteur retardé soit visible (un solveur à première itération se trompe jusqu'à { "0.1" } s). Sur les positions analytiques de Standish, le temps de lumière n'est aussi bon que ces positions (voir la ligne des positions planétaires) ; la liaison livrée traite le Soleil comme un centre inertiel, ce qui reste dans l'erreur de position mais n'est pas vérifié séparément. two_way_range et shapiro_delay ne sont pas comparés en externe

# text
seg-6e0b9687e8ee = Uranus et Neptune d'après le tableau { "1" } de Standish, Pluton, et vitesses planétaires

# text
seg-df3bf502dfe9 = Positions d'Uranus et de Neptune d'après le tableau { "1" } de Standish (le choix par défaut entre { "1800" } apr. J.-C. et { "2050" } apr. J.-C.), de Pluton d'après la ligne du tableau { "1" } de { "1992" } que la page JPL actuelle ne répertorie plus, et vitesse héliocentrique de chaque planète : la dérivée à deux corps avec le moyen mouvement qu'impliquent les éléments plus la rotation de l'ellipse due aux taux de périhélie, d'inclinaison et de nœud

# text
seg-f49245efe44f = Mesuré par rapport à JPL Horizons DE441 (les mêmes jeux de test versionnés), mais non vérifié : les chiffres indiqués au tableau { "1" } pour Uranus et Neptune sont dépassés jusqu'à { "2.0" } et { "5.2" } fois par rapport aux positions héliocentriques DE441 (Neptune les respecte par rapport aux positions barycentriques, ce qui suggère que l'ajustement n'était pas héliocentrique), la page n'indique aucune erreur pour Pluton, et il n'existe aucune borne publiée pour les vitesses. Les tableaux 2a/2b respectent leurs propres chiffres pour Uranus et Neptune et sont couverts par la ligne vérifiée

# text
seg-a50be56f605a = Positions de la Lune et de sept lunes principales (Phobos, Deimos, les lunes galiléennes, Titan)

# text
seg-2cfbe5a1eece = La Lune géocentrique d'après la série de Montenbruck & Gill (dont le terme de -1.3972 deg par siècle la rapporte déjà à l'équinoxe J2000), et les positions et vitesses planétocentriques de Phobos, Deimos, Io, Europe, Ganymède et Callisto d'après les éléments moyens du JPL Solar System Dynamics dans le plan de Laplace de chaque lune, avec le taux de longitude moyenne tiré du taux de rotation synchrone de l'IAU (le tableau imprime la période avec trop peu de chiffres pour tenir la phase), et de Titan d'après le modèle de rotation de l'IAU (la lune sur moins l'axe x solidaire du corps à la distance moyenne), parce que la ligne imprimée du plan de Laplace de Titan ne reproduit pas Horizons, même à sa propre époque

# text
seg-6c81bd570fe5 = Mesuré par rapport aux éphémérides de satellites JPL Horizons (DE441, MAR099, JUP365, SAT441) versionnées dans tests/fixtures/solar_system/horizons_satellites_icrf.csv avec la requête et la date de récupération ; il n'existe aucune exactitude publiée pour les éléments moyens ni pour le placement par modèle de rotation, de sorte que les seuils figés détectent les régressions et ne valident pas. Les éléments moyens omettent les perturbations résonantes et solaires, et l'accélération séculaire de Phobos n'est pas modélisée

# text
seg-8b8c8e28ece9 = Constantes physiques de chaque corps du système solaire et rapport sur l'ensemble du système

# text
# c1: solar-system
seg-d225a30de35c = Body ajoute Mercure, Vénus, Jupiter, Saturne, Uranus, Neptune, Pluton, Phobos, Deimos, Io, Europe, Ganymède, Callisto et Titan (paramètre gravitationnel, rayon de référence, J2 lorsqu'il est publié avec le rayon auquel il se rapporte, pôle et méridien origine de l'IAU), une recherche par nom et un enregistrement BodyFacts (code NAIF, classe, parent, rayon équatorial et moyen) ; le type <c1/> les rapporte pour les dix-huit corps avec les positions, les temps de lumière et une trace d'orbite sur une révolution, chaque corps étant étiqueté VALIDATED ou MODELLED

# text
seg-6adc29de51fd = Transcription de constantes publiées, chacune citée là où elle est définie : paramètres gravitationnels d'après les fiches de corps de JPL Horizons et le tableau des paramètres physiques des satellites du JPL, rayons d'après les tableaux de paramètres physiques du JPL (IAU WGCCRE { "2015" }), pôles et méridiens origines d'après le Groupe de travail de l'IAU sur les coordonnées cartographiques et les éléments de rotation (valeurs moyennes, sans les termes de taux en T et périodiques), J2 d'après Smith et al. { "2012" }, Iess et al. { "2018" } et { "2019" }, et Jacobson { "2009" } et { "2014" }. Vérifié pour la cohérence interne (la période de rotation de Jupiter par rapport au taux du Système III, chaque J2 par rapport à son rayon de référence), et non par rapport à une référence indépendante externe. { "0.30" } tour { "2" } : les valeurs de GM ont été adoptées de gm_de440 et les éléments de Phobos et Deimos de pck00011, de sorte que { "0" } des { "84" } constantes des quatorze corps ajoutés diffèrent désormais de NAIF (contre { "12" } auparavant), ce qui est une vérification de transcription et n'est pas compté. { "0.36" } : l'orientation solidaire du corps selon l'IAU et le GM des quatorze corps ajoutés sont séparés dans leur propre ligne VALIDATED (« Orientation des corps selon l'IAU et paramètre gravitationnel des quatorze corps du système solaire ajoutés ») ; cette ligne conserve ce qui reste. J2 et le rayon moyen sont cités, non vérifiés ; les positions du rapport reposent sur leurs propres lignes ; et le prime_meridian_deg du rapport pour la Terre, la Lune et Mars reste sur des constantes conventionnelles (jusqu'à { "6.6e-3" }, { "2.8e-2" } et { "9.6e-4" } rad de IAU_<BODY>). { "0.30" } révisions : GM de Phobos { "7.087e5" } -> { "7.087546066894452e5" }, Deimos { "9.62e4" } -> { "9.615569648120313e4" }, Uranus { "5.7939506103e15" } -> { "5.793951256527211e15" }, Neptune { "6.83509997e15" } -> { "6.835103145462294e15" }, Pluton { "8.69326e11" } -> { "8.696138177608748e11" } m³/s² ; rayon équatorial de Phobos { "13.1" } -> { "13.0" } km ; prime_meridian_deg inclut désormais les termes quadratiques et périodiques

# text
seg-fa8a4b082cd5 = Orientation des corps selon l'IAU et paramètre gravitationnel des quatorze corps du système solaire ajoutés

# text
seg-fc8d277aa2fd = Body::iau_rotation_et, la rotation du J2000 vers le repère solidaire du corps de l'IAU de Mercure, Vénus, Jupiter, Saturne, Uranus, Neptune, Pluton, Phobos, Deimos, Io, Europe, Ganymède, Callisto et Titan avec chaque taux séculaire, terme quadratique et terme périodique que le corps porte dans pck00011, et le champ de paramètre gravitationnel mu des mêmes quatorze corps. Le Soleil, la Terre, la Lune et Mars portent des constantes conventionnelles détenues par d'autres lignes et ne sont pas couverts

# text
seg-29bad4bd8e09 = NAIF SPICE Toolkit (CSPICE N0067 via spiceypy) pxform('J2000', 'IAU_<BODY>') sur pck00011.tpc, une implémentation indépendante du même modèle de rotation de l'IAU, et NAIF gm_de440.tpc pour GM, les jeux de test étant générés par un programme distinct qui n'appelle aucun code Kshana (tests/fixtures/body_orientation_spice_oracle/, NOTICE.md). Préenregistré 154bc54 (avec le seuil d'origine de { "1e-9" } rad de c2434204) avant l'existence du jeu de test à époques neuves ; le jeu neuf a été régénéré indépendamment et est identique octet pour octet. GM est une transcription de DE440 vérifiée par rapport au fichier publié, et non une détermination indépendante de GM. Résultats : docs/design/evidence/mr08-body-orientation/RESULTS.md

# text
seg-87ab655f8270 = Positionnement autour de tout corps du système solaire avec une constellation locale et une liaison en espace lointain depuis la Terre

# text
# c1: body-pnt
seg-d9b1b0ac97d3 = Le type <c1/> : un orbiteur ou un atterrisseur de surface autour d'un corps choisi par son nom navigue avec des pseudodistances aller simple d'une constellation de navigation Walker autour du corps (orbites à deux corps avec la dérive séculaire J2 du corps, une horloge utilisateur inconnue) et une distance aller-retour facultative, sans horloge, depuis la Terre, la direction et la distance de la Terre étant tirées de l'éphéméride analytique à chaque époque ; des lignes de visée bloquées par la sphère du corps et un masque d'élévation de surface ; par époque, le GDOP et le PDOP de la constellation seule (orbit::dop), l'incertitude formelle de position avec et sans la ligne de la Terre, et des positions de Gauss-Newton générées avec une graine (batch_ls::gauss_newton) dans chaque cas, avec le temps de lumière et l'aller-retour corps-vers-Terre

# text
seg-3538c49df107 = Formes closes et autocohérence : troisième loi de Kepler pour la période du relais, le rayon d'orbite et le rayon de surface maintenus pendant l'exécution, l'ajout d'une mesure n'augmentant jamais l'incertitude formelle, et les erreurs générées avec une graine concordant avec la covariance. Les orbites des relais ignorent les troisièmes corps (l'attraction de Jupiter sur les relais autour d'Europe n'est pas modélisée), le bruit est gaussien aux niveaux indiqués et le modèle de mesure est instantané ; ce n'est donc pas vérifié par rapport aux données de navigation d'une mission quelconque

# text
seg-281b680a9897 = Géométrie de constellation Walker et emplacements nominaux publiés de GPS, Galileo et GLONASS

# text
# c1: constellation-design
seg-cba54289b732 = Les générateurs du type <c1/> : motifs Walker delta et star selon la convention T/P/F (espacement des nœuds 360/P ou 180/P, espacement dans le plan { "360" }·P/T, décalage de phase entre plans { "360" }·F/T), et les préréglages de la référence de base GPS et extensible à 24 emplacements, de Galileo et de GLONASS construits à partir de leurs éléments nominaux publiés, placés dans un repère terrestre par l'angle horaire de Greenwich que leurs documents indiquent

# text
seg-bdf83007af50 = Documents publiés d'agences : Galileo Open Service Service Definition Document édition { "1.1" } (European GNSS Service Centre) tableaux { "1" } et { "23" }, la constellation de référence au 2016-11-21 { "00" }:{ "00" } UTC ; GLONASS Interface Control Document édition { "5.1" } ({ "2008" }) section { "5.2" }, la formule d'emplacement pour la longitude du nœud et l'argument de latitude ; GPS Standard Positioning Service Performance Standard 5e édition (avril { "2020" }) tableaux 3.2-1, 3.2-2 et 3.2-3, y compris la colonne de franchissement équatorial de la trace au sol, qui est un énoncé indépendant de la géométrie terrestre que le préréglage doit reproduire. Valide les générateurs et la transcription ; la phase en orbite moyenne de BeiDou et les nœuds géosynchrones inclinés ne sont pas publiés et ne sont pas couverts

# text
seg-0f1d49ab5d51 = Dilution globale de précision de la constellation de référence de base GPS

# text
# c1: constellation-design
seg-83775b77f5ca = Le moteur de couverture <c1/> sur le préréglage de référence de base GPS à 24 emplacements dans les conditions de l'annexe B du GPS Standard Positioning Service Performance Standard (SPS PS) (un jour sidéral, { "287" } pas de cinq minutes, une grille mondiale de { "4" } x { "4" } deg pondérée par le cosinus de la latitude, tout en vue, masque de { "5" } deg, une horloge de récepteur) : la distribution mondiale de HDOP, la médiane de PDOP et la disponibilité de PDOP d'au plus 6, globalement et sur le pire site

# text
seg-6fb3c2028c4a = GPS SPS PS 5e édition (avril { "2020" }) annexe B sections B.3.2.2 et B.3.2.3, la distribution publiée de HDOP moyen mondial de la constellation de référence de base à 24 emplacements entièrement occupée (médiane { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, moyenne { "0.96" }), tableau 3.8-1 (disponibilité de PDOP) et tableau B.3-1 (PDOP d'ensemble d'une constellation dégradée, utilisé seulement comme borne supérieure), plus une forme close dérivée à la main pour une époque. Les distributions de VDOP et de PDOP de la constellation complète ne sont publiées que sous forme de figure ; PDOP est donc figé d'un seul côté ; le pire point espace-temps (HDOP { "2.40" } et VDOP { "5.22" } ici, { "2.49" } et { "5.43" } publiés) dépend de la grille et est rapporté, non figé

# text
seg-7d4d7200cbca = Cartes de couverture et de dilution de précision pour des conceptions multi-constellations arbitraires à grande échelle, autour de tout corps central

# text
# c1: constellation-design
seg-b78b79e9fae4 = Le type <c1/> au-delà des deux cas figés : conceptions explicites et multi-coques, plusieurs constellations par exécution avec une horloge de récepteur par constellation, la Terre, la Lune et Mars d'après les constantes de corps, le préréglage BeiDou (phase en orbite moyenne et franchissement géosynchrone incliné à { "118" } deg E modélisés), satellites en vue par cellule, GDOP, PDOP, HDOP, VDOP et disponibilité, traces au sol sous-échantillonnées, et un préfiltre de visibilité par latitude du point subsatellite qui exécute une conception de { "5" } 000 satellites sur une grille de { "10" } deg en une fraction de seconde

# text
seg-2c0f28426ab9 = Cohérence interne : le balayage d'élévation par force brute, les réductions calculées à la main et par orbit::dop, et la géométrie Walker et géosynchrone sous forme close. Orbites à deux corps avec un J2 séculaire facultatif, un corps sphérique avec la verticale locale le long du rayon, visibilité géométrique seulement (ni puissance de signal, ni état de santé du satellite, ni relief, ni perturbation de troisième corps), et la phase relative entre systèmes prise à partir d'époques de référence différentes, de sorte que ce n'est pas un instantané d'une date quelconque. { "0.30" } revue, un constat (reste MODELLED) : les préréglages respectent les planchers unilatéraux publiés de disponibilité de DOP (BeiDou OS Performance Standard { "3.0" }, Galileo OS SDD) à { "100" } %, mais avec le PDOP du moteur doublé dans une copie de travail ils les respectent encore (pire point { "99.36" } %), de sorte que les planchers ne peuvent pas détecter même une erreur de { "100" } % sur la grandeur que cette ligne calcule ; les resserrer après l'exécution serait une tolérance a posteriori. La promotion exige une comparaison bilatérale des valeurs de DOP sur une géométrie identique avec une tolérance fixée à l'avance. { "0.30" } tour { "2" } (tests/coverage_dop_full_oracle.rs, préenregistré add671d6), un constat (reste MODELLED) : Orekit { "12.2" } positions, élévation, azimut et traces au sol avec GDOP/PDOP/HDOP/VDOP de gnss_lib_py { "1.0.4" } (horloge commune) et une inverse numpy (une horloge par constellation) concordent sur chaque seuil pour Galileo, GPS, BeiDou, Galileo+GPS (une horloge chacun) et une conception terrestre de 1584 satellites (DOP à { "2e-14" } près en relatif, position identique, disponibilité et comptes de visibilité identiques). Sur les conceptions Lune et Mars, les éléments, les positions, la visibilité et les traces concordent, mais le DOP dépasse le seuil relatif de { "1e-9" } fixé à l'avance dans les cellules dont le plus grand PDOP est de { "1434" } ou plus (jusqu'à { "8e-6" }), et { "4" } cellules diffèrent d'une époque de position sur une géométrie numériquement singulière (pivot du moteur { "1e-10" } contre rang numpy), de sorte que la ligne n'est pas vérifiée. { "0.30" } révisions : l'horloge de référence TDOP/GDOP est désormais la constellation de plus petit numéro en vue (constellation-multi-gnss-coverage GDOP mondial max { "2.2236" } -> { "2.1205" }, moyenne { "1.122" } -> { "1.131" }), et les comptes de satellites visibles par constellation sont additionnés comme des entiers

# text
seg-278c77438493 = Une mission enchaînée à travers des types de scénario sur une seule chronologie partagée

# text
# c1: campaign
seg-3dcfb26f6234 = Les phases du type <c1/> : chaque phase exécute un ou plusieurs scénarios de types existants via run_toml, lit leurs sorties dans des canaux nommés (erreur de temps de l'horloge et garde, rapport moyen effectif porteuse sur densité de bruit et plancher de poursuite, niveau de protection vertical et limite d'alerte, erreur de position, satellites en poursuite, indicateurs d'alarme) par des préréglages par type ou des chemins de résultat explicites, les place au début de la phase et les maintient sur une grille commune, avec les limites de phase et les événements ; l'état est transmis par carry (un canal se poursuit à partir de la valeur finale de la phase précédente), handoff (un nombre d'une phase précédente écrit dans le scénario suivant) et end_at (une phase se termine à un instant calculé par une exécution, comme l'instant de détection d'un moniteur de leurrage) ; un hachage de campagne et un condensé sur chaque résultat de membre

# text
seg-fd018ef7bc3b = Identités de composition par rapport aux exécutions autonomes des mêmes types : une campagne à une phase reproduit la sortie autonome bit pour bit, le décalage reporté égale le dernier échantillon de l'exécution précédente, et la phase terminée par end_at a exactement l'instant de détection de l'exécution comme durée. Le report additif à travers une frontière de phase et le maintien d'ordre zéro sont des choix de modélisation, et chaque phase vaut ce que vaut le type qui l'a exécutée ; aucune mission enchaînée n'a été comparée à une mission mesurée

# text
seg-ad6105af464c = Balayages de paramètres et ensembles Monte Carlo avec graine sur tout type de scénario

# text
# c1: campaign
seg-95921611839e = Les sections sweep du type <c1/> (une à trois clés pointées de n'importe quel type, sur les valeurs d'axe du balayage générique, avec facultativement un ensemble à chaque nœud) et monte_carlo : la réalisation k s'exécute à base_seed + k ; chaque métrique rapporte la moyenne, l'écart type, les percentiles 5e/50e/95e au rang le plus proche et un intervalle de confiance à { "95" } % par bootstrap percentile à graine fixe sur la moyenne (inertial::metric_stat) ; les unités des métriques sont lues dans le propre bloc d'unités du type balayé

# text
seg-03d15c27b3b9 = La forme close de la marche aléatoire de phase sous bruit blanc de fréquence, variance q_wf tau (NIST Technical Note { "1337" }), pour la mécanique statistique, et l'égalité octet pour octet avec les exécutions autonomes pour l'ensemencement. Elle vérifie l'arithmétique d'ensemble sur le propre modèle d'horloge du moteur, et non un jeu de données externe

# text
seg-24327a0ed82e = Plusieurs scénarios sous des conditions partagées, avec un résumé combiné

# text
# c1: campaign
seg-5833fb3b06e3 = La section compose du type <c1/> : des valeurs partagées nommées (par exemple la puissance et la position d'un brouilleur) écrites dans chaque membre aux clés auxquelles il les lie, chaque membre exécuté, et par métrique la plus petite, la plus grande et la moyenne des valeurs sur les membres, le membre étant nommé ; les unités des métriques doivent concorder entre les membres

# text
seg-67ffd6684b1c = Identité de composition par rapport à l'exécution autonome. L'arithmétique des conditions partagées est de la comptabilité ; la physique est celle des types membres, chacun avec sa propre ligne

# text
seg-0bc866720bde = Optimisation bornée d'une métrique sur des paramètres de campagne

# text
# c1: campaign
seg-f9bdb89c2b4f = La section optimize du type <c1/> (CAP-32) : une à trois clés pointées de scénario bornées à [lo, hi] sur une échelle lin ou log, une métrique lue par chemin de résultat, objectif minimize, maximize ou target ; méthode grille (les valeurs d'axe du balayage) ou simplexe de Nelder-Mead déterministe en coordonnées normalisées avec projection sur la boîte et les coefficients standard ; une métrique manquante ou non finie obtient le pire score et reste dans la trace ; avec runs > { "1" }, la métrique est la moyenne sur des graines communes ; chaque évaluation est une exécution réelle du type nommé, listée dans trace et comptée dans le condensé de reproductibilité

# text
seg-e3a2f80b04dc = Interne seulement : la forme close exacte en -20 log10(distance) de l'équation de liaison, une grille indépendante par force brute sur le même type, et la fonction de Rosenbrock. Le seuil 1-D du tour { "1" } est NOT MET (la boîte préenregistrée excluait la solution à { "3" } dB ; l'optimiseur s'est arrêté à la borne), consigné dans docs/design/evidence/cap32-optimize/RESULTS.md et non renoté. L'optimum est local à la boîte et au point de départ ; aucune affirmation d'optimum global

# text
seg-b9b1637d326c = Formes closes à bande limitée pour tout signal de télémétrie : puissance dans la bande et gigue de poursuite de code précoce-tardif par rapport aux valeurs publiées, avec la largeur de bande de Gabor et la séparation spectrale décalée vérifiées par recoupement

# text
# c1: leo-signal
seg-6cfdc433b120 = navsignal : l'intégrale sinus (sine_integral), la fraction de puissance BPSK-R dans une bande bilatérale sous forme close (bpsk_power_in_band_closed_form), la largeur de bande de Gabor BPSK à bande limitée sous forme close (bpsk_gabor_bandwidth_closed_form_hz), la gigue de boucle à verrouillage de retard précoce-tardif cohérente et non cohérente à bande limitée pour tout spectre d'aire unité d'après Betz & Kolodziejski { "2009" } (dll_jitter_bandlimited_s) et sa borne de Gabor à espacement évanescent (dll_jitter_small_spacing_limit_s), le coefficient de séparation spectrale BPSK décalé sous forme close (bpsk_offset_ssc_closed_form), le spectre Galileo E5 AltBOC({ "15,10" }) (altboc_15_10_psd) et un analyseur d'étiquettes de modulation (parse_modulation) ; utilisés par le type <c1/> pour chaque conception de signal

# text
seg-15d8c44be46f = Figés en externe : { "90.3" } pour cent de puissance du lobe principal, la gigue précoce-tardif cohérente au point de fonctionnement indiqué, les valeurs de la table de l'intégrale sinus, et le coefficient d'auto-séparation spectrale BPSK 2/({ "3" } R_c) à décalage nul. Vérifications croisées internes seulement, et non validation externe : la forme close de la largeur de bande de Gabor BPSK à bande limitée et son asymptote, et le coefficient de séparation spectrale BPSK décalé à des décalages non nuls, tous deux dérivés ici et vérifiés par quadrature. Formes closes publiées : le spectre BPSK-R en sinus cardinal au carré et sa puissance de lobe principal de { "90" } pour cent (Kaplan & Hegarty, Understanding GPS/GNSS, 3e éd.) ; la gigue de poursuite de code précoce-tardif cohérente sigma^{ "2" } = B_L d / ({ "2" } C/N0) chips^{ "2" } (Kaplan & Hegarty, section { "8" }) et la généralisation à bande limitée avec sa limite de largeur de bande de Gabor (Betz & Kolodziejski, Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I, IEEE Transactions on Aerospace and Electronic Systems { "45" }({ "4" }), { "2009" }) ; les tables de l'intégrale sinus d'Abramowitz & Stegun (tableau { "5.1" }) ; le coefficient de séparation spectrale comme transformée de Fourier de l'autocorrélation au carré (Betz { "2001" }). Le spectre AltBOC n'est vérifié que pour l'aire unité et la position des lobes (l'expression du Galileo Open Service Signal-in-Space Interface Control Document s'intègre à { "8" } et est divisée par cette valeur).

# text
seg-def449efa852 = Doppler maximal d'un satellite de navigation en orbite terrestre basse, qui dimensionne la recherche d'acquisition

# text
# c1: leo-signal
seg-2ff7cc7a8846 = leo_signal::max_doppler_hz : le plus grand Doppler de satellite sur un passage au zénith au masque d'élévation pour une orbite circulaire, v R_E cos(el) / (R_E + h) fois f / c, d'après la porteuse et l'altitude d'orbite propres à chaque préréglage ; le type <c1/> ajoute des termes d'oscillateur et d'utilisateur et le transforme en cases Doppler

# text
seg-652e28dfa10f = Conceptions de signaux de positionnement, navigation et synchronisation en orbite terrestre basse : poursuite de code, acquisition, compatibilité GNSS et compromis de bande pour tout système

# text
# c1: leo-signal
seg-c0ba5c7e708e = Le type <c1/> : conceptions de signaux paramétrées (bande, largeur de bande d'émission, allocation UIT ; composantes d'acquisition, de données et pilote avec spectres BPSK(n), BOC(m,n), MBOC ou plats, parts de puissance, sous-porteuses FDMA, longueurs de code et débits de données) à partir de fichiers de préréglages publics compilés (Xona Pulsar, Iridium STL, signal d'opportunité Starlink, CentiSpace, une conception générique en bande C et des conceptions génériques UHF/L/S/C/C large, chacune avec l'URL de sa source et les valeurs non publiées étiquetées REPRESENTATIVE) ou écrites en ligne ; par signal, la densité spectrale de puissance à bande limitée, les fractions de puissance dans la bande, la largeur de bande de Gabor, la gigue de code en fonction de C/N0 et de l'espacement et l'exactitude de télémétrie, l'espace de recherche d'acquisition, la probabilité de détection en loi quadratique et le temps moyen d'acquisition série et parallèle sur le code, le coefficient de séparation spectrale vers et depuis GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b et AltBOC avec la dégradation de C/N0, et la tolérance J/S CW, large bande et adaptée issue de la chaîne SSC du type spectre ; un compromis de bande entre retard ionosphérique, perte en espace libre, exactitude de télémétrie à C/N0 égal et à PIRE égale et tolérance au brouilleur ; et des vérifications qualitatives de forme d'une conception par rapport à une mesure décrite

# text
seg-040b3f5cc70e = Les formes closes vérifiées des deux lignes ci-dessus, l'identité de fausse alarme en loi quadratique P_d(snr = { "0" }) = P_fa et le temps moyen d'acquisition de Holmes, et la réduction à la propre chaîne SSC du type spectre (le même code Jammer::ssc). Les conceptions elles-mêmes sont des entrées : les préréglages marqués REPRESENTATIVE ou WORKSHOP ne sont pas des spécifications publiées, les spectres QPSK de Feher amélioré, de modulation par déplacement de code et OFDM sont approchés, et les vérifications de forme comparent des formes, et non des niveaux étalonnés.

# text
seg-c2b9c8e4a364 = Cascade de spectre multibande (UHF, L, S, C) avec signaux conçus et brouilleurs par bande

# text
# c1: spectrum
seg-609df4e0a085 = Le type <c1/> étendu au-delà de la bande L : bandes données comme conception de signal prédéfinie (tracée avec chaque composante, à bande limitée à la largeur de bande d'émission, C/N0 et J/S rapportés à la composante poursuivie) ou comme porteuse et modulation personnalisées ; panneaux de cascade supplémentaires sur toute plage de fréquences, sur la même chronologie et la même échelle de couleurs ; un brouilleur à large bande (barrage) à côté des bruits CW, à bande étroite, à chirp et adapté ; J/S par bande et C/N0 effectif issus de la chaîne inchangée du coefficient de séparation spectrale

# text
seg-a3b398f66ad3 = Réduction à la chaîne de spectre existante et à l'équation anti-brouillage du type brouillage (une bande à composante unique donne les mêmes nombres qu'avant l'extension) et aux spectres de signaux des lignes vérifiées. Les puissances des brouilleurs, le calendrier, les largeurs de bande des étages d'entrée et les signaux conçus sont des entrées, et un signal conçu est tronqué à sa bande d'émission (aucune émission hors bande).

# text
seg-f92d6cbc58d4 = Coefficients d'affaiblissement spécifique dû à la pluie pour toute bande qu'utilise une liaison LEO-PNT

# text
# c1: leo-pass
seg-96b6a118d374 = Équations ({ "1" }) à ({ "5" }) de l'UIT-R (Union internationale des télécommunications, Secteur des radiocommunications) P.838-3 : k_H, alpha_H, k_V, alpha_V d'après les ajustements de courbes des tableaux { "1" } à { "4" }, le (k, alpha) dépendant du trajet et de la polarisation et l'affaiblissement spécifique k R^alpha ; utilisés par le terme de pluie du type <c1/>

# text
seg-5c256ff404b6 = UIT-R P.838-3 (03/2005) tableau { "5" }, les k_H, alpha_H, k_V, alpha_V tabulés par la Recommandation elle-même, versionnés dans tests/fixtures/leo_link/p838_3_table5.csv avec l'URL du PDF et la date de récupération. Le tableau est arrondi à ses chiffres imprimés, de sorte que le seuil est cet arrondi

# text
seg-f4a311f936de = Affaiblissement dû à la pluie à long terme sur trajet oblique d'une liaison Terre-espace

# text
# c1: leo-pass
seg-2b2dba8bf5a7 = UIT-R P.618-14 section { "2.2.1.1" } étapes { "2" } à { "10" } (trajet oblique et horizontal sous la hauteur de pluie, facteurs de réduction horizontale et d'ajustement vertical, A0.01 et sa mise à l'échelle de { "0.001" } % à { "5" } % d'une année moyenne), avec la hauteur de pluie (P.839) et R0.01 (P.837) comme entrées parce que le moteur ne porte aucune des deux cartes numériques ; appliqué par bande et par époque par le type <c1/>

# text
seg-325d1bb9c26d = Fichier d'exemples de validation du Groupe d'études { "3" } de l'UIT-R CG-3M3J-13-ValEx-Rev8.3.0 pour P.618-14, tel que tabulé par les pages de validation d'ITU-Rpy, avec la hauteur de pluie P.839-4 de chaque site issue des mêmes exemples ; versionné dans tests/fixtures/leo_link/p618_14_rain_attenuation.csv avec les URL et la date de récupération. Valide la procédure étant donnés h_R et R0.01, et non les cartes

# text
seg-6b51ec84bdce = Scintillation d'amplitude troposphérique sur une liaison Terre-espace

# text
# c1: leo-pass
seg-869894dec004 = UIT-R P.618-14 section { "2.4.1" } étapes { "3" } à { "9" } (sigma de référence à partir de N_wet, longueur de trajet effective, facteur de moyennage d'antenne, profondeur d'évanouissement pour { "0.01" } % à { "50" } % du temps), N_wet étant une entrée ou calculé à partir de la température, de l'humidité et de la pression par les expressions de l'UIT-R P.453-14 ; en dessous de { "4" } GHz, le type <c1/> signale la valeur comme une extrapolation

# text
seg-7fc4a1e7960a = Exemples de validation du Groupe d'études { "3" } de l'UIT-R (CG-3M3J-13-ValEx-Rev8.3.0) pour la scintillation de P.618-14, avec le N_wet P.453-14 de chaque site issu des mêmes exemples ; versionnés dans tests/fixtures/leo_link/p618_14_scintillation.csv avec les URL et la date de récupération. L'expression de la réfractivité humide à partir de la température et de l'humidité n'est pas couverte par cette ligne

# text
seg-e0d40cf4ea79 = Affaiblissement de pénétration dans les bâtiments pour un utilisateur LEO-PNT en intérieur

# text
# c1: leo-pass
seg-4f06274e38ec = UIT-R P.2109-2 annexe { "1" } équations ({ "1" }) à ({ "10" }) avec le tableau { "1" } : l'affaiblissement non dépassé avec la probabilité P pour des bâtiments traditionnels et thermiquement efficaces à l'élévation du trajet au niveau de la façade, de { "80" } MHz à { "100" } GHz ; appliqué par bande et par époque à un utilisateur en intérieur par le type <c1/> (le cas UHF en intérieur)

# text
seg-99c648f9c6eb = Les valeurs du classeur de validation Clutter et BEL du Groupe d'études { "3" } de l'UIT-R, telles que transcrites dans le script de validation de l'implémentation MATLAB de référence (github.com/eeveetza/p2109), versionnées dans tests/fixtures/leo_link/p2109_bel.csv avec l'URL et la date de récupération. Le classeur imprime trois décimales

# text
seg-8c5e291c8ff8 = Retard ionosphérique du premier ordre par bande, combinaison sans ionosphère et perte en espace libre

# text
seg-89df726127f9 = Retard de groupe { "40.3" } STEC/f^{ "2" } par bande ; les coefficients sans ionosphère f1^2/(f1^{ "2" } - f2^{ "2" }) et -f2^2/(f1^{ "2" } - f2^{ "2" }) et l'amplification du bruit sqrt(a1^{ "2" } s1^{ "2" } + a2^{ "2" } s2^{ "2" }) pour toute paire de bandes ; la perte en espace libre { "20" } log10({ "4" } pi R f/c) de linkbudget::free_space_loss_db sous sa forme kilomètre-mégahertz

# text
seg-9bf00f744174 = IS-GPS-200 section { "20.3.3.3.3.2" }, qui énonce le rapport de retard de groupe L1/L2 gamma = (77/60)^{ "2" } découlant de la mise à l'échelle du premier ordre en 1/f^{ "2" }, et la formule de transmission de Friis (Proc. IRE, { "1946" }). Valide les lois d'échelle, et non un TEC oblique

# text
seg-c584a867fcda = Doppler maximal que voit un utilisateur statique depuis une orbite LEO ou MEO

# text
# c1: leo-pass
seg-e6cdaf067a65 = leo_link::geometry::max_static_user_range_rate : une recherche sur chaque position d'orbite et chaque utilisateur à l'horizon du satellite d'une orbite circulaire, la Terre tournant, du plus grand taux de variation de distance, plus les vitesses orbitale et maximale de satellite en repère terrestre ; rapportée par bande comme enveloppe Doppler par le type <c1/> et utilisée comme fenêtre de recherche de démarrage à froid de son modèle à faible énergie

# text
seg-4abd3afebad2 = Leclere, Marathe et Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, tableau { "1" } (récepteur statique sur une sphère de { "6371" } km, la rotation de la Terre étant le seul autre effet) : { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz sur L1. Couvre les orbites circulaires à deux corps

# text
seg-d9eb3e7e69c2 = Un passage LEO-PNT et son bilan de liaison par bande face aux satellites GNSS MEO en vue

# text
# c1: leo-pass
seg-d986e44443dd = Le type <c1/> : satellites issus d'un passage conçu, d'éléments, d'un TLE via SGP4 ou d'une constellation Walker de constellation-design ; par bande et par époque, les angles de visée, la distance, le taux de variation de distance et l'accélération de distance sous forme close (vérifiés à chaque exécution par rapport à des différences centrales et rapportés), la perte en espace libre, la PIRE avec un diagramme isoflux, gaussien ou plat, une antenne utilisateur à plaque, hémisphérique ou isotrope, l'affaiblissement gazeux de l'UIT-R P.676-10 annexe { "2" }, la pluie et la scintillation P.618, l'affaiblissement de pénétration dans les bâtiments P.2109, le désaccord de polarisation, la température de bruit du système, C/N0, le Doppler et le taux Doppler, et le retard du premier ordre issu d'un TEC oblique de Klobuchar ou de TEC vertical mis à l'échelle par la fraction de Chapman sous le satellite ; paires sans ionosphère avec bruit de code au sommet du passage ; porteuses Galileo ou GPS d'après les puissances reçues de leurs documents d'interface via le même récepteur

# text
seg-c558a6519038 = Formes closes et autocohérence : les identités de taux de variation de distance et d'accélération de distance par rapport à des dérivées numériques, le gain isoflux annulant la croissance de la distance, les limites de perte de polarisation des manuels, l'observation qualitative LEO contre GNSS (un passage en cloche de quelques minutes culminant plusieurs dB au-dessus de porteuses GNSS plates de 44-51 dB-Hz). Les PIRE et les diagrammes sont des puissances reçues publiées converties en PIRE ou des choix représentatifs, le terme gazeux est la méthode simplifiée P.676-10 remplacée, et rien n'est comparé à un C/N0 LEO mesuré

# text
seg-95a077a980b6 = Préréglages de systèmes LEO-PNT nommés avec sources indiquées, et un moteur indépendant du système

# text
seg-4b47033cda24 = leo_link::presets : multibande générique (UHF, L, S, C), bande C générique, Xona Pulsar X1/X5, Iridium STL, Starlink comme signal d'opportunité Doppler seul, CentiSpace et un préréglage Celeste IOD facultatif, chacun avec sa source marquée PUBLIC (avec URL), REPRESENTATIVE ou WORKSHOP, celle de l'atelier se trouvant dans le fichier de préréglage Celeste IOD facultatif, compilé seulement si ce fichier existe ; chaque bande et chaque orbite peut être redéfinie dans un scénario, et un scénario peut ne nommer aucun préréglage

# text
seg-399dc53ceafb = Transcription des chiffres publics cités et vérification de cohérence : une PIRE fixée à partir d'une puissance reçue minimale publiée prédit le maximum publié à { "0.5" } dB près avec un diagramme plat. C'est une vérification de l'étalement de distance, et non une validation de l'antenne d'un satellite quelconque ; les préréglages représentatifs n'avancent aucune affirmation sur un système réel

# text
seg-a39f34973373 = Positionnement à faible énergie : temps avant la première position et énergie par position en fonction du rapport cyclique

# text
# c1: leo-pass
seg-f3b9b669a76f = leo_link::energy et la section [iot] du type <c1/> : intégration cohérente plafonnée par le taux Doppler, sommes non cohérentes en loi quadratique jusqu'à un seuil de détection, recherche par cases Doppler sur l'enveloppe d'utilisateur statique de l'orbite (à froid) ou une fenêtre assistée (à chaud), recherche de code parallèle ou série, durée du message de navigation à un démarrage à froid, énergie par position et autonomie de batterie selon les intervalles de position, pour chaque bande LEO et le signal GNSS

# text
seg-a5fa1ef1be9b = Cohérence interne d'un modèle de conception donné : chaque puissance, seuil et choix de recherche est une entrée, et le modèle ignore l'ambiguïté de front de bit, la non-détection et la réacquisition. Non comparé à un récepteur mesuré

# text
seg-7e94f8b38cff = Poids d'erreur de distance du signal dans l'espace en moyenne globale pour toute altitude d'orbite

# text
seg-85595d0d46ce = leo_navmsg::sisre::sisre_weights : le poids radial w_R et le poids transverse au carré w_AC^{ "2" } comme moyennes de cos^{ "2" } et de la moitié de sin^{ "2" } de l'angle de nadir de la ligne de visée sur des utilisateurs uniformément répartis sur la calotte terrestre visible au-dessus d'un masque d'élévation, pour tout rayon d'orbite, par intégration de Simpson ; utilisé par chaque chiffre SISRE de leo-navmsg (à { "510" } km, w_R { "0.46" } et w_AC^{ "2" } 1/2.5)

# text
seg-b9b5fe9d3b25 = Le tableau publié des facteurs de pondération SISRE de Montenbruck, Steigenberger et Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041 : GPS { "0.98" } et 1/49, GLONASS { "0.98" } et 1/45, Galileo { "0.98" } et 1/61, BeiDou MEO { "0.98" } et 1/54, BeiDou IGSO/GEO { "0.99" } et 1/126. La même moyenne évaluée à des rayons LEO donne les poids LEO ; aucun tableau LEO publié n'est figé, de sorte que les valeurs LEO sont la méthode vérifiée appliquée, et non vérifiées séparément

# text
seg-3cbb8b6afe3c = Algorithme utilisateur d'éphéméride diffusée de l'ICD Galileo comme base d'un message de navigation LEO

# text
seg-88efbce1f836 = leo_navmsg::elements::kepler_point : l'évaluation képlérienne de l'ICD SIS Galileo OS (équation de Kepler, corrections de second harmonique, nœud en repère terrestre) écrite séparément de l'évaluateur RINEX du moteur, renvoyant la position avec l'argument de latitude, l'inclinaison et le nœud à partir desquels est construit le repère de correction along/cross/radial, et les termes d'extension de Liu et al. { "2025" }

# text
seg-6a90728fcea9 = Positions ECEF eph2pos de RTKLIB 2.4.2-p13 (une implémentation indépendante du même algorithme de l'ICD) pour de vrais enregistrements diffusés BKG/IGS du 2024-09-10, tous deux versionnés avec leur provenance dans tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Cela vérifie l'algorithme utilisateur képlérien ; les corrections along/cross/radial ajoutées par-dessus sont couvertes par leurs propres lignes, et les termes de Liu par la ligne à 22 paramètres de Liu et al. { "2025" }

# text
seg-d65102fd4a1d = Contrôle de trame CRC-24Q pour le message de navigation LEO

# text
seg-aed568016867 = leo_navmsg::codec::crc24q : polynôme générateur 0x1864CFB, valeur initiale { "0" }, sans réflexion, sans XOR final, le contrôle que la trame LEO de Kshana porte sur chaque octet précédent

# text
seg-18c79d18e4e4 = La valeur de contrôle du catalogue CRC pour ces paramètres (catalogue CRC reveng.sourceforge.io, CRC-24/LTE-A : largeur { "24" }, poly 0x864CFB, init { "0" }, contrôle 0xCDE703), qui sont les paramètres CRC-24Q de RTCM { "10403" } et de l'ICD SIS Galileo OS, et la trame d'exemple de type de message { "1005" } imprimée dans RTCM { "10403" }

# text
seg-82b9b0f7b07c = Ajusteur d'éphéméride diffusée LEO et erreur de distance du signal dans l'espace en fonction de l'intervalle d'ajustement et de la période de mise à jour

# text
# c1: leo-navmsg
seg-8c7065aa22bd = L'ajusteur et le compromis du type <c1/> : une orbite vraie intégrée avec la gravité zonale J2-J6 ou EGM2008 jusqu'au degré choisi et la traînée, et une horloge libre ou pilotée générée avec une graine ; un ajustement de Levenberg-Marquardt de l'ensemble képlérien de Galileo sur des éléments non singuliers avec des a priori faibles, puis des polynômes de correction along-track, cross-track et radiale par moindres carrés linéaires ; le polynôme d'horloge ajusté net du terme relativiste de l'utilisateur ; SISRE (orbite seule et avec horloge) sur des périodes d'utilisation centrées dans leurs fenêtres d'ajustement, en fonction de l'intervalle d'ajustement et de la période de mise à jour. Partie vérifiée : l'ajustement képlérien à 16 paramètres et son SISRE orbite seule en fonction de l'intervalle d'ajustement sur de vraies orbites précises, et l'orbite vraie intégrée J2-J6/EGM2008({ "20" }, { "70" })/traînée par rapport à Orekit { "12.2" } à { "4.6" } mm près sur { "6" } h (seuil { "2" } cm, même entrée de densité) ; les polynômes de correction, l'ajustement d'horloge (horloge libre ou pilotée générée avec une graine) et le compromis de période de mise à jour restent modélisés

# text
seg-7dfbc8297444 = De vraies orbites scientifiques précises comme vérité terrain (orbites dynamiques réduites opérationnelles de TU Graz IfG/ITSG, libres pour tout usage avec mention de la source ; valeurs SHA-256 dans la NOTICE du jeu de test) ajustées par l'ensemble à 16 paramètres sur des arcs de { "20" } et { "30" } min, par rapport aux statistiques que Liu et al. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) publient pour les mêmes satellites et jours : RMS along, cross et radial chacun à 1.5x près (mesuré { "0.804" } à { "1.087" }), SISRE à 1.5x près (mesuré { "0.716" } à { "0.809" }) et poids SISRE à { "0.005" } près de son tableau { "2" } (mesuré { "0.0007" }) ; tolérances fixées avant la comparaison. Le critère par composante donne du mordant au test : mettre à zéro le taux d'inclinaison laisse chaque rapport SISRE à moins de 1.5x mais échoue au critère cross-track. Le rapport SISRE uniforme de { "0.72" } à { "0.81" } est celui de l'article : ses valeurs SISRE imprimées utilisent les poids du tableau { "2" } non élevés au carré plutôt que sa propre éq. { "9" }, que Kshana suit (Montenbruck et al. { "2018" }). L'orbite vraie intégrée (zonale J2-J6, EGM2008 aux degrés { "20" } et { "70" }, traînée) concorde avec Orekit { "12.2" } (CS GROUP, Apache-2.0) et Hipparchus { "3.1" }, propagés à partir du même état initial dans les mêmes repères avec la même entrée de densité, à { "4.55" } mm près sur { "6" } h (seuil { "0.02" } m fixé avant l'exécution, préenregistrement 65e4d46c). Hors de l'affirmation : les polynômes de correction, l'ajustement d'horloge et le compromis de période de mise à jour, qui conservent des vérifications internes (une orbite vraie à deux corps retrouvée par l'ensemble à 16 paramètres à moins de { "1" } mm, et une vérification croisée interne par numpy des messages exportés sur GRACE-FO avec son horloge CLK1B, écrite et exécutée par ce projet et qui n'est pas une référence indépendante)

# text
seg-8121e7db3db3 = Mise à jour en milieu de passage du message de navigation LEO avec contrôle de continuité à la bascule

# text
# c1: leo-navmsg
seg-34c310d85c42 = L'analyse midpass-update du type <c1/> : le passage le plus haut au-dessus d'un utilisateur dans une plage de recherche, des messages sur un calendrier global avec des périodes d'utilisation centrées dans leurs fenêtres d'ajustement, et à chaque bascule le saut de position 3D, le saut d'horloge, le saut de pseudodistance de l'utilisateur, le plus grand saut sur toute ligne de visée visible (forme close sur le cône du nadir), l'erreur de distance avant et après, et PASS/FAIL par rapport à un seuil

# text
seg-418f2cd21141 = Cohérence interne (l'identité de saut et la borne du cône par rapport à un échantillonnage par force brute). Le seuil est une entrée ; aucune exigence de continuité LEO publiée n'est figée

# text
seg-7635a8339e78 = Codage binaire documenté du message de navigation LEO avec budget d'erreur de quantification

# text
seg-e4d9b16a2dc4 = leo_navmsg::codec : la trame propre à Kshana (préambule, version, modèle, longueur, charge utile, CRC-24Q) pour les quatre modèles d'éphéméride, le polynôme d'horloge, SVID, âge des données, bande, santé, un ensemble de Klobuchar, des coefficients NeQuick-G et des paramètres UTC, chaque champ avec une largeur et un pas indiqués (field_table), quantification avec refus hors plage, et un budget du plus grand changement de position et d'horloge qu'un changement d'un demi-pas de chaque champ produit sur la fenêtre de validité

# text
seg-4261a9fac5d9 = Identités d'aller-retour et le budget lui-même. Le format est celui de Kshana, modelé sur les composantes de message publiées et le jeu de champs de l'ICD Galileo ; ce n'est pas la disposition binaire de Celeste ni d'aucun autre système (aucune n'est publique), de sorte qu'il n'existe aucune disposition externe par rapport à laquelle valider

# text
seg-17ca41d7fd71 = Exports de style RINEX-4 et CSV des messages de navigation LEO

# text
seg-185e12ccef0d = leo_navmsg::text : un bloc de style RINEX-4 (en-tête d'enregistrement > EPH, ligne de satellite et d'époque avec trois termes d'horloge, lignes d'orbite diffusée D19.12) avec la lettre de système L et les types d'enregistrement KP16, KRAC, LU22 et APOL, étiqueté dans chaque en-tête comme une extension de Kshana ne faisant pas partie de RINEX { "4.02" }, et un tableau CSV avec un schéma de colonnes par défaut et des schémas prédéfinis, chacun avec un importateur

# text
seg-5cc5b6382437 = Allers-retours et arithmétique calendaire. RINEX { "4.02" } ne définit aucun enregistrement de navigation LEO (IGS RINEX { "4.02" }), de sorte que la disposition est une extension documentée avec arXiv { "2401.17767" } cité comme antériorité ; il n'existe aucun lecteur externe de celle-ci par rapport auquel vérifier

# text
seg-ff15935ba1b3 = Modèle d'éphéméride LEO à 22 paramètres de Liu et al. { "2025" } et son ajustement sur de vraies orbites précises

# text
seg-6af1b6f3bbd4 = la variante Liu22 de leo_navmsg::elements::EphemerisModel, évaluée par kepler_point avec Liu22Extra : l'ensemble à 16 paramètres plus un taux de demi-grand axe a_dot, un taux de moyen mouvement n_dot entrant comme n = sqrt(mu/A0^{ "3" }) + dn + n_dot tk, transcrit de l'éq. { "1" } de l'article (la comparaison d'ajustement ne dépend pas de cette convention d'échelle, de sorte que la signification d'une valeur nDot transmise n'est pas vérifiée ici), et des harmoniques de rayon à une et trois fois par révolution Crs1, Crc1, Crs3, Crc3 sur l'argument de latitude non corrigé. Son ajustement par leo_navmsg::fit::fit_message reprend le départ et l'estimateur de la section { "2.3" } de l'article (chaque correction part de zéro ; moindres carrés simples sans a priori ; le plafond de 100 itérations de l'article), mais s'arrête sur la règle de convergence des paramètres de Kshana (chaque pas inférieur à { "1e-3" } de son sigma formel) au lieu de la règle de l'article, un changement de RMS inférieur à { "0.1" } mm. Ajusté sur des arcs de { "20" } et { "30" } minutes d'une orbite précise tabulée

# text
seg-90768b99ab5f = Mesuré : les orbites dynamiques réduites opérationnelles de TU Graz IfG/ITSG (libres pour tout usage avec mention de la source ; valeurs SHA-256 dans la NOTICE du jeu de test) de GRACE-A, GRACE-C, Sentinel-2A et Sentinel-6A sont la vérité terrain, ajustées sur des arcs de { "20" } et { "30" } min, et comparées aux lignes à 22 paramètres (a_dot, n_dot, Crs3, Crc3, Crs1, Crc1) des tableaux { "4" }, { "5" }, { "6" } et { "8" } de Liu, Su, Xie, Zhou et Qu ({ "2025" }), Remote Sensing { "17" }({ "16" }):{ "2894" }, doi 10.3390/rs17162894 (CC BY { "4.0" } ; nombres cités, non intégrés). Seuils fixés avant la première comparaison : RMS along, cross et radial chacun à 1.5x près de façon bilatérale, et SISRE à 1.5x près, pour chaque satellite et les deux longueurs d'arc. La nouvelle exécution du tour 2 a été préenregistrée (aa559785) avant la modification du moteur et avant la récupération des orbites réservées : l'ajustement de l'éq. { "1" } et de la section { "2.3" } de l'article, plus deux nouveaux jours réservés par satellite par rapport aux mêmes valeurs imprimées. Mesuré : chaque rapport des jours de l'article de { "0.755" } à { "1.138" }, et chaque rapport des jours réservés de { "0.683" } à { "1.186" }. Divulgué : les rapports along-track de { "20" } min de la première exécution, { "1.71" } (Sentinel-2A) et { "1.86" } (Sentinel-6A), étaient connus avant la nouvelle exécution. Les plus bas rapports SISRE sur jours réservés se situent près de la borne inférieure de { "0.667" } parce que le SISRE imprimé de l'article utilise les poids du tableau { "2" } non élevés au carré (voir la ligne de l'ajusteur à 16 paramètres). Le préenregistrement a mal énoncé la règle d'arrêt de l'article (l'article s'arrête sur un changement de RMS inférieur à { "0.1" } mm) ; la règle de convergence des paramètres préenregistrée a été conservée. Mutation : rétablir des a priori centrés sur zéro donne pour Sentinel-6A un along-track de { "20" } min de { "1.08" } contre { "0.70" } cm ({ "1.54" }), ce qui échoue. Sonde du relecteur : la convention antérieure à 0.30 (un facteur 1/2 sur n_dot) laisse chaque chiffre inchangé, de sorte que la comparaison contraint l'espace de fonctions du modèle à 22 paramètres et la qualité de son ajustement, et non la convention de n_dot. Hors de l'affirmation : le polynôme ECEF ATOMIC et le tableau synthétique de comparaison de modèles à cinq altitudes, qui ont leur propre ligne MODELLED

# text
seg-e79047fc95af = Polynôme ECEF ATOMIC à horloge nulle et comparaison synthétique de modèles LEO à cinq altitudes

# text
seg-e261843e35b1 = la variante EcefPoly de leo_navmsg::elements::EphemerisModel : un polynôme ECEF par axe sans termes d'horloge, le terme relativiste issu de -2 r.v/c^{ "2" }, noté par rapport à une horloge pilotée. Ainsi que l'analyse de comparaison de modèles (liu_comparison sur LIU2025_TABLE), qui ajuste le modèle à 22 paramètres aux cinq altitudes de l'article sur des arcs de 20 minutes d'une orbite intégrée par Kshana et imprime le résultat à côté du SISRE publié

# text
seg-a3b92fdcc591 = Faits sur le modèle ATOMIC d'après InsideGNSS (polynôme d'ordre 6, validité d'environ une minute, rafraîchissement toutes les { "30" } s, horloge pilotée, erreur d'horloge de { "24" } cm). Ce sont des faits descriptifs sans nombres publiés auxquels comparer. Le tableau à cinq altitudes imprime le SISRE de Liu et al. { "2025" } ({ "8.88" }, { "6.21" }, { "2.87" }, { "2.11" } et { "0.75" } cm à { "320" }, { "475" }, { "786" }, { "966" } et { "1336" } km sur un arc de 20 minutes) à côté de l'ajustement de Kshana sur sa propre orbite intégrée ({ "4.25" }, { "2.87" }, { "2.20" }, { "1.25" } et { "0.51" } cm ; rapports de { "0.46" } à { "0.77" }), non figé, parce que l'article a ajusté de vraies orbites précises et que les vérités diffèrent. Le modèle à 22 paramètres et son ajustement sont eux-mêmes vérifiés par rapport à de vraies orbites dans la ligne Modèle d'éphéméride LEO à 22 paramètres de Liu et al. { "2025" } et son ajustement sur de vraies orbites précises. { "0.30" } révision : les chiffres du tableau ont bougé avec l'ajustement à la convention de l'article (GRACE-A { "5.40" } -> { "4.25" } cm, GRACE-C { "4.12" } -> { "2.87" }, Sentinel-2A { "2.95" } -> { "2.20" }, HY-2A { "2.38" } -> { "1.25" }, Sentinel-6A { "0.70" } -> { "0.51" })

# text
seg-7a9fca5166d4 = Services ionosphérique monofréquence et UTC d'un message de navigation LEO

# text
seg-bc73bfeca68e = leo_navmsg::services : le retard diffusé de Klobuchar à toute porteuse (le modèle L1 du moteur mis à l'échelle par (f_L1/f)^{ "2" }), le niveau d'ionisation effectif NeQuick-G Az = ai0 + ai1 mu + ai2 mu^{ "2" } avec les règles tout-zéro et [{ "0" }, { "400" }] sfu, et le temps système vers UTC avec les trois cas de seconde intercalaire de l'ICD

# text
seg-84500ea94d49 = GNSSTk { "15.3.1" } (ARL:UT, LGPL-3.0, commit 55ea3344, exécuté comme programme distinct au moyen d'un banc de test ; aucun code GNSSTk n'est intégré) : getIonoCorr de KlobucharIonoNavData en L1, L2 et L5, getEffIonoLevel de NeQuickIonoNavData pour Az avec les règles tout-zéro et [{ "0" }, { "400" }] sfu, et getOffset de GPSLNavTimeOffset pour la dérive UTC, à { "1e-3" } m, { "1e-6" } sfu et { "1e-9" } s près ; et ERFA via pyerfa { "2.0.1.5" } (BSD-3), qui dérive UTC de la table des secondes intercalaires de l'IERS, pour les trois cas de seconde intercalaire de l'ICD à travers les vraies secondes intercalaires du 2015-06-30 et du 2016-12-31, y compris la lecture { "23" }:{ "59" }:{ "60" }, à { "1e-9" } s près (GNSSTk n'implémente pas la règle de durée du jour du cas (b) de l'ICD, il n'a donc pas été utilisé là, comme écrit dans le préenregistrement). Les entrées sont les vrais coefficients d'en-tête IGS BRDC. Préenregistré (6a66994b ; l'amendement 88807a7e a versionné un sous-ensemble de { "21" } 602 lignes de la grille de secondes intercalaires avant qu'aucune valeur de Kshana ne soit comparée). L'intégration de densité électronique de NeQuick n'est pas implémentée, et aucune correction n'est faite pour un satellite LEO volant à l'intérieur de l'ionosphère

# text
seg-0af8030f4d21 = Doppler qu'un récepteur au sol doit gérer depuis un satellite de navigation LEO

# text
# c1: leo-pvt
seg-9714103964d6 = Taux de variation de distance exact d'un satellite dont la position et la vitesse en repère terrestre proviennent d'une orbite à deux corps avec la dérive séculaire J2 et la rotation de la Terre (leo_fusion::geom::EarthOrbit::state, la vitesse étant la dérivée temporelle exacte de la position), converti en Doppler à une porteuse ; le plus grand Doppler absolu, taux Doppler et à-coup au-dessus d'un masque d'élévation sur une fenêtre (leo_fusion::doppler::doppler_envelope), rapportés par système LEO par le type <c1/> en mode doppler

# text
seg-ebf6cee8ec4c = Chiffres publiés reproduits à partir de l'orbite et de la porteuse indiquées : Doppler d'Iridium jusqu'à plus ou moins { "36" } kHz (Resilient Navigation and Timing Foundation, Recent PNT improvements and test results based on LEO satellites) et Doppler maximal de Xona Pulsar X1 de { "32" } à { "34" } kHz (Leclère, Marathe et Reid, ION GNSS+ { "2025" }, arXiv:{ "2509.19551" }). Le chiffre d'Iridium est une borne supérieure arrondie, d'où le seuil de { "5" } %. Le taux Doppler et l'à-coup sont rapportés mais non vérifiés : l'à-coup modélisé de Pulsar X1 lors d'un passage au zénith est d'environ { "1.0" } Hz/s^{ "2" } contre { "1.26" } publié

# text
seg-d2e18c8bdc14 = Positionnement à partir du Doppler LEO, à un ou plusieurs satellites, avec états de dérive d'horloge et de vitesse

# text
# c1: leo-pvt
seg-de6cb3c06490 = Positionnement par Gauss-Newton par lots à partir du taux de variation de distance avec dérivées partielles analytiques (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), une vitesse d'utilisateur constante en option, une pseudo-mesure de hauteur pour un utilisateur de surface, des pas amortis ; la covariance formelle à la vérité terrain ; projections along-track, cross-track et verticale ; l'exactitude sur un seul passage en fonction du décalage cross-track de l'utilisateur ; l'instant de plus courte distance. Le mode doppler du type <c1/> ajoute l'erreur en fonction de la longueur de fenêtre et un mode de signaux d'opportunité à Doppler seul (le préréglage starlink-sop)

# text
seg-84e2eb636579 = Cohérence interne : récupération sans bruit, l'identité cinématique rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho dérivée numériquement, Doppler nul à la plus courte distance, la solution miroir d'un passage unique, et erreurs générées avec une graine par rapport à la covariance formelle. Le chiffre de Starlink de Kozhaya, Saroufim et Kassas (NAVIGATION { "72" }({ "1" }), { "2025" } : environ { "2" } m en { "20" } s avec trois satellites) n'est qu'une comparaison : le récepteur modélisé, avec une éphéméride parfaite et toute l'erreur dans un sigma Doppler de { "30" } Hz, est plusieurs fois moins exact sur la même fenêtre, et le récepteur et la cadence de mesure de l'article ne sont pas reproduits

# text
seg-7f462969d2d4 = Positionnement conjoint par pseudodistances GNSS et LEO avec biais inter-systèmes et modèles d'erreur par signal

# text
# c1: leo-pvt
seg-b9b5298e3408 = Positions de Gauss-Newton par moindres carrés pondérés sur tout mélange de systèmes, une horloge de récepteur par système (le biais inter-systèmes estimé avec la position) ou un décalage diffusé connu sur l'échelle de temps de référence ; sigmas par mesure fournis par l'appelant, par défaut le bruit thermique de la boucle à verrouillage de retard du moteur (navsignal::dll_code_jitter_chips) au C/N0 de l'élévation combiné à l'erreur de distance du signal dans l'espace ; DOP non pondéré (GDOP, PDOP, HDOP, VDOP, TDOP) dans le repère géodésique local, sigmas formels est-nord-haut et sigmas de biais ; le mode joint de <c1/> compare des positions GNSS seul, LEO seul et fusionnées et balaie le DOP en fonction du nombre de satellites LEO ajoutés

# text
seg-e83699418c0e = Un DOP à quatre satellites dérivé à la main (un satellite au zénith et trois à l'horizon espacés de { "120" } deg, dont la matrice normale s'inverse à la main), l'identité structurelle selon laquelle un système avec sa propre horloge et un satellite n'ajoute aucune géométrie, la récupération sans bruit de la position, de l'horloge et du biais, et des erreurs générées avec une graine par rapport à la covariance. Vérifications internes seulement ; non comparé à la sortie d'un récepteur. { "0.30" } comparaison externe, un constat (reste MODELLED) : sur une journée IGS multi-GNSS (ABMF 2018-05-13, GPS et Galileo C1C, éphéméride diffusée, Klobuchar), le biais inter-systèmes concorde avec rnx2rtkp de RTKLIB v2.4.2-p13 (différence médiane -0.11 ns après la correction du délai de groupe diffusé de { "0.30" }, -0.35 ns avant ; seuil { "1" } ns), mais seulement { "93.6" } % de { "280" } époques ({ "93.2" } % avant la correction) sont à moins de { "3" } m de la coordonnée ITRF2020, contre les { "95" } % préenregistrés. RTKLIB lui-même atteint { "88.2" } % sur les mêmes données, de sorte que le seuil dépasse ce que permet le positionnement monofréquence par éphéméride diffusée à cette station et ce jour, et ne traduit pas un écart de solveur ; le test de comparaison est versionné en étant ignoré. { "0.30" } tour { "2" }, entrées plus strictes au seuil inchangé de { "3" } m / { "95" } % / { "1" } ns, un constat (reste MODELLED) : avec la paire sans ionosphère Galileo E1/E5a (préenregistré { "6927e039" }) { "79.9" } % des époques sont à moins de { "3" } m (RTKLIB { "67.9" } %) ; avec les orbites, horloges, décalages d'antenne de satellite et biais de code précis CODE MGEX (préenregistré 7d8c3597) { "94.2" } % (RTKLIB { "94.1" } %), et le biais inter-systèmes diffère de celui de RTKLIB de -1.03 ns parce que le mode simple de RTKLIB ignore les décalages d'antenne de satellite (+{ "0.04" } ns lorsque les deux les omettent)

# text
seg-ee9a4a0cb530 = Convergence du positionnement précis par point avec GNSS seul et avec augmentation LEO

# text
# c1: leo-ppp
seg-a54f36c27d90 = Un filtre de Kalman étendu PPP flottant sur code et phase sans ionosphère : coordonnées statiques, une horloge de récepteur blanche, un biais inter-systèmes par système supplémentaire, un retard humide zénithal en marche aléatoire projeté par 1/sin(élévation), une ambiguïté flottante par arc de satellite ajoutée au lever et retirée au coucher, et l'erreur d'orbite et d'horloge précises commune au code et à la phase d'un satellite, traitée comme une seule mise à jour corrélée à deux lignes sous forme stabilisée de Joseph ; mesures simulées à partir du même modèle ; temps de convergence (erreurs sous les seuils jusqu'à la fin de l'exécution), courbes d'erreur et NEES de position moyennée sur l'exécution pour GNSS seul et chaque cas LEO, exécutés comme le type <c1/>

# text
seg-be4593802ccf = Le test du chi-deux de la NEES est une vérification de cohérence interne (la vérité terrain et le filtre partagent le modèle). La tendance est comparée à Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2 : multi-GNSS { "9.6" } min raccourci à { "7.0" }, { "3.2" }, { "2.1" } et { "1.3" } min avec { "60" }, { "96" }, { "192" } et { "288" } satellites LEO. Le scénario fourni donne { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } et { "2.3" } min avec ses propres coques représentatives de { "1000" } km, { "60" } deg, son bruit et ses stations ; les constellations, le bruit et la définition de convergence de l'article ne sont pas reproduits, de sorte qu'il s'agit d'une cohérence MODELLED de la tendance (raccourcissement monotone, la plus grande constellation sous un tiers du temps GNSS seul), et non d'une validation

# text
seg-8ef013b46d0f = Exactitude de positionnement d'un réseau non terrestre 5G en fonction de la largeur de bande du signal

# text
# c1: ntn-positioning
seg-12b1e4657370 = La borne de Cramér-Rao sur le temps d'arrivée à partir de la largeur de bande quadratique moyenne (de Gabor), c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), pour un spectre OFDM plat (beta = B/sqrt({ "12" })), un spectre BPSK à bande limitée (numérateur sous forme close) ou tout spectre par quadrature, et sur la fréquence d'un ton complexe, sqrt(3/({ "2" } pi^{ "2" } (C/N0) T^{ "3" })) ; positions par temps d'arrivée en liaison descendante avec une horloge de récepteur inconnue et une position Doppler à un seul satellite sur un passage dans la bande S MSS n256 du 3GPP, exécutées comme le type <c1/>

# text
seg-f63e1d78cfff = Valeurs chiffrées publiées (P1) : Bachl, Lei et Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), bornes à SSB unique de NR NTN reproduites à partir de la carte SSB de 3GPP TS { "38.211" } par les propres fonctions numériques de Kshana (W_rms { "1.9616" } contre { "1.96" } MHz, sigma_t { "38.755" } contre { "39" } us, sigma_f 100.79/87.28 contre 101/87 Hz, sigma_rho 0.5970/0.5831 contre 0.60/0.58 m, chacun à moins d'une demi-unité du dernier chiffre imprimé) ; largeurs de bande RMS BPSK-R du tableau { "1" } de Betz { "2001" } (1.128/3.477 contre 1.1/3.5 MHz, complémentaire) ; les covariances de position par temps d'arrivée et par Doppler concordent avec numpy.linalg.inv de numpy { "2.4.6" } sur la géométrie exportée (P2 ; { "5e-15" } et { "1.2e-5" } en relatif, seuils { "1e-5" } et { "1e-3" }). Préenregistré (9f2875db ; partie C 0d66dccd). La position du moteur joint_pvt::formal_sigma_enu (la borne évaluée à la vraie position, et non à la position bruitée) a été écrite après que la première exécution à { "200" } kHz a échoué à { "6.5e-5" } et a été relancée à la tolérance inchangée. Les formes à spectre plat et à ton complexe que le scénario exécute (gabor_bandwidth_flat_hz, doppler_crb_sigma_hz) atteignent la vérification P1 par des tests unitaires d'identité internes au crate. Des bornes sur un canal sans trajets multiples, et non une exactitude atteinte. { "0.30" } révision : ntn-5g-positioning toa_median_sigma_3d_m { "2.0903959" } -> { "2.0903962" } m (NR { "5" } MHz) et { "25.938613" } -> { "25.938839" } m (NB { "200" } kHz)

# text
seg-9306f1c06081 = Transfert de temps vers UTC assisté par LEO en fonction du C/N0 et de l'oscillateur du récepteur

# text
# c1: leo-pvt
seg-c618feb01476 = Mesures d'horloge de chaque satellite LEO en vue à une position connue, combinées par variance inverse à partir du modèle de bruit de pseudodistance, filtrées par un filtre de Kalman à deux états (phase, fréquence) dont le bruit de processus est le bruit de fréquence blanc et de marche aléatoire de la classe d'oscillateur (slot_timing::ClockNoise, clock_state::ClockClass ; la variance de marche libre de holdover::coast_phase_variance), une horloge vraie générée avec une graine aux mêmes niveaux, et l'expression temps système vers UTC de la section { "20.3.3.5.2.4" } de IS-GPS-200 avec une incertitude de décalage diffusé ajoutée comme biais par exécution ; le mode timing de <c1/> balaie les oscillateurs et les décalages de C/N0

# text
seg-4a878bd4a90f = Cohérence interne : l'expression de décalage publiée évaluée à la main, l'erreur normalisée sur { "40" } graines, et le plancher fixé par l'incertitude de décalage. Le chiffre du NIST pour des récepteurs de synchronisation Iridium avec une horloge atomique miniature (moins de { "40" } ns par rapport à UTC(NIST) sur { "40" } jours) n'est qu'une comparaison ; le scénario Iridium fourni donne { "10" } à { "11" } ns RMS à puissance nominale avec son erreur de distance représentative de { "5" } m. Le bruit de fréquence de scintillation et le retard ionosphérique ne sont pas simulés

# text
seg-cef79d82f0d4 = Couverture LEO et dilution de précision pour des utilisateurs polaires et arctiques face au GNSS MEO

# text
# c1: leo-pvt
seg-462a5e95d480 = Satellites en vue et PDOP, HDOP et VDOP médians avec disponibilité en fonction de la latitude, sur des longitudes et époques échantillonnées, pour les seuls systèmes GNSS MEO, les seuls systèmes LEO et l'ensemble, chaque système avec son propre masque et son propre modèle d'horloge, exécutés comme le mode polar de <c1/> ; les orbites sont des jeux d'éléments SGP4/SDP4 à l'époque du balayage (2026-01-01T00:{ "00" }:{ "00" } UTC dans le mode polar) portés au repère terrestre sur le chemin d'orbite terrestre vérifié (IAU 2006/2000A, UT1 = UTC, sans mouvement du pôle)

# text
seg-a16896913438 = Orekit { "13.1.8" } (Apache-2.0) avec Hipparchus { "4.0.3" } : les états GCRS du moteur pivotés vers l'ITRF par Orekit (IERS { "2010" }), visibilité WGS-84 TopocentricFrame par rapport au masque de chaque système, org.orekit.gnss.DOPComputer pour une seule inconnue d'horloge et numpy.linalg.inv de NumPy { "2.4.6" } (P2) pour plusieurs ; avec le chemin vérifié par rapport à python-sgp4 et ERFA (ligne « Un seul chemin d'orbite terrestre »). Seuils fixés avant l'exécution (préenregistré 72ea9eb0 ; T2 et T3 sont les seuils du tour 2 de { "0.30" }). L'étape TEME -> GCRS figée à J2000 fait passer le test au rouge ({ "4739" } échecs). Géométrie seulement ; ni scintillation, ni relief, ni puissance de signal. Le VDOP GNSS augmente vers le pôle ({ "1.20" } à l'équateur à { "1.51" } à { "89.9" } deg pour GPS et Galileo dans le scénario fourni) alors qu'une coque LEO quasi polaire y converge. Historique : le tour { "2" } (3254d456) concordait sur des états à deux corps tabulés ; l'affirmation complète D8 du tour 1 par rapport à la propre propagation TLE d'Orekit (e947e69d) était un constat, le SDP4 d'Orekit à e = { "0" } et son TEME IERS { "1996" }, figé

# text
seg-d92777401093 = Systèmes LEO PNT nommés comme préréglages de données facultatifs, chacun avec sa source

# text
seg-5130bfe2410c = Entrées indépendantes du système : chaque système est constitué de coques Walker, d'éléments explicites ou d'un préréglage GNSS, d'un signal (porteuse, débit de code, largeur de bande, puissance reçue ou plage de C/N0), d'un SISRE, d'un sigma Doppler et d'un modèle d'horloge ; les préréglages ne remplissent que ce qu'un scénario laisse de côté, un fichier chacun avec des sources marquées PUBLIC (avec une URL), WORKSHOP ou DERIVED et les valeurs non publiées indiquées comme représentatives : Xona Pulsar X1/X5, Iridium STL, signaux d'opportunité Starlink, CentiSpace, un système représentatif en bande C, le modèle d'éphéméride à horloge nulle ATOMIC, et un préréglage dérivé de l'atelier dans le fichier de préréglage Celeste IOD facultatif, retenu en supprimant ce fichier et ses scénarios

# text
seg-c6f71b3937cd = Transcription des valeurs publiques citées, vérifiée pour la structure (chaque source publique a une URL, les motifs Walker se divisent exactement, le C/N0 issu de la puissance reçue sur kT à { "290" } K), et non par rapport à une référence indépendante externe. Les valeurs représentatives sont nommées dans chaque préréglage et sont illustratives

# text
seg-dec52b5b9cd6 = Un système LEO-PNT de bout en bout : conception du signal, bilan de liaison de passage, message de navigation et positionnement fusionné, la sortie de chaque étape étant transmise à la suivante

# text
# c1: leo-pnt-chain
seg-39443b31d418 = Le type <c1/> : une conception leo-signal (préréglage public ou en ligne) fixe le centre, la largeur de bande, le débit de code et la répartition de PIRE d'une bande leo-pass ; le passage donne le C/N0 de la composante poursuivie et la gigue de code à bande limitée par époque ; une droite de C/N0 par moindres carrés en sin(élévation), le SISRE du message leo-navmsg (ajusté à l'orbite du satellite du passage, plus un terme de détermination d'orbite indiqué en somme quadratique) et la porteuse et le débit de code de la conception vont à chaque système LEO d'une position conjointe leo-pvt et, facultativement, aux cas LEO de leo-ppp ; chaque transmission est rapportée avec sa valeur et son unité

# text
seg-854d3c1428d0 = Autocohérence des transmissions : chaque valeur transmise égale la propre sortie de l'étape amont, et la mutation d'une entrée amont déplace chaque chiffre aval qui en dépend. Les étapes conservent leurs propres étiquettes ; la chaîne n'ajoute ni physique ni référence indépendante externe

# text
seg-55ca63edff02 = Détection du leurrage par le Doppler LEO et la cohérence de la géométrie de passage

# text
# c1: leo-pass
# c2: [spoofer]
seg-b12fc1728220 = La section <c2/> du type <c1/> : un leurreur contrefait, de façon autocohérente en distance et en taux de variation de distance, les signaux vus à une position déclarée qui saute et/ou est écartée de la position vraie après un début (par bande LEO et pour le signal GNSS MEO) ; le récepteur prédit chaque taux de variation de distance à partir de l'orbite diffusée et d'une position et d'une vitesse a priori indépendantes, et teste les taux de variation de distance mesurés avec une statistique du chi-deux des moindres carrés généralisés sur une fenêtre d'époques (dérive d'horloge comme paramètre de nuisance ou avec un a priori), sur les voies GNSS, les voies LEO et toutes les voies, avec le bruit thermique de la boucle à verrouillage de fréquence issu du C/N0 (Kaplan & Hegarty { "2006" }, section { "5.6.2" }) ; probabilité de détection issue de la loi du chi-deux non centrée à une probabilité de fausse alarme donnée, la détection étant déclarée à une probabilité de non-détection donnée

# text
seg-787c07c08c7f = Formes closes et identités, et non une mesure externe : le gradient du taux de variation de distance par rapport à une différence centrale, la statistique en forme d'information par rapport à la forme de covariance dense, une dérive d'horloge pure donnant zéro, un écart expliqué par l'a priori donnant au plus |dx|^2/sigma_p^{ "2" }, la statistique quadratique en un saut. Aucun chiffre de détection n'est comparé à une attaque mesurée ; le leurreur est idéalisé (ni puissance, ni angle d'arrivée, ni signature du pic de corrélation)

# text
seg-5f341f85ac07 = Détection du leurrage par la cohérence inter-bandes d'un signal LEO multibande

# text
# c1: [spoofer]
seg-2f9c4d351b0f = Pour chaque satellite LEO et chaque paire de bandes de télémétrie, la section <c1/> forme la combinaison de pseudodistances sans géométrie, retire le modèle ionosphérique du récepteur et teste son saut d'époque à époque par rapport au bruit de code des deux bandes et à un taux ionosphérique non modélisé toléré indiqué (gaussien bilatéral, probabilité de détection exacte) ; un leurreur qui contrefait certaines bandes et pas d'autres, ou chaque bande sans l'ionosphère, est vu à son début ; un leurreur qui contrefait chaque bande et simule l'ionosphère ne l'est pas, ce que le résultat indique

# text
seg-87fd44fa1d94 = Identités : le saut au début d'un leurreur sans ionosphère égale la différence de retard ionosphérique modélisée de la paire, le seuil est le quantile normal bilatéral multiplié par l'écart type du saut plus la borne de taux. Le modèle ionosphérique du récepteur est celui du moteur, de sorte que le résidu authentique est nul en moyenne par construction ; aucune référence indépendante externe

# text
seg-97dbcd5f2728 = Sondage de l'ionosphère : TEC oblique à partir du retard bibande d'un passage LEO

# text
# c1: leo-pass
seg-844de34fd2f3 = Pour chaque paire de bandes d'un satellite <c1/>, le rapport donne le contenu électronique total oblique que la combinaison de codes sans géométrie retrouve au sommet du passage, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), et son 1-sigma issu du bruit thermique de code des deux bandes, de sorte que toute conception LEO-PNT multibande peut être arbitrée comme sondeur d'ionosphère

# text
seg-2562ae9e6180 = L'identité de dispersion du premier ordre, exacte par construction par rapport au propre retard du premier ordre du moteur (dont la mise à l'échelle en 1/f^{ "2" } est VALIDATED par rapport à IS-GPS-200 dans sa propre ligne) ; la précision est le seul bruit thermique de code, sans trajets multiples ni biais inter-fréquences. { "0.30" } tour { "2" }, mesuré (préenregistré 5e795f93), un constat (reste MODELLED) : la carte ionosphérique globale CODE CODG1330.18I par rapport au code C1C/C2W d'ABMF avec les biais CODE donne { "33" } des { "36" } moyennes d'arc à moins de { "3" } TECU (pire cas +{ "6.84" } TECU sur un arc du soir ; RMS par époque { "3.95" } TECU), contre un seuil portant sur chaque arc ; non vérifié

# text
seg-0a63a69e181d = Covariance du référentiel lunaire avec les stations estimées, par rapport à une précision étendue à 50 chiffres

# text
seg-de2ee45f6527 = La covariance du référentiel de Helmert à sept paramètres du scénario lunar-frame-campaign avec les stations terrestres estimées (station { "1" } ancrée), telle que lunar_frame_campaign la calcule en binary64 : l'information de Fisher conjointe stations-et-balises accumulée à partir du jacobien de retard, le bloc des stations marginalisé par un complément de Schur au moyen d'un inverse spectral de Jacobi, H = AᵀSA formée avec la conception de Helmert et inversée spectralement. Le problème est mal conditionné par construction (nombre de condition de Helmert { "2.1e8" } à { "2.3e8" }, nombre de condition de l'information conjointe { "1.6e12" } à { "3.0e13" }) : une variation relative de { "1e-9" } de la correction de Schur déplace les sigmas du référentiel jusqu'à { "28" } %. Rapportés : les sept sigmas du référentiel, le nombre de condition de Helmert et la direction la plus faible. AFFIRMATION, RESTREINTE : les sigmas du référentiel et le nombre de condition du moteur se situent dans la borne d'erreur du pire cas a priori d'une chaîne en double précision rétrostable sur ce problème ; cela n'affirme pas qu'ils sont aussi exacts que la double précision le permet (une voie par factorisation est environ mille fois plus exacte sur les mêmes entrées, et le solveur à racine carrée facultatif environ dix millions de fois), et la direction la plus faible n'est vérifiée que là où son seuil est inférieur à un angle droit (le témoin à stations fixes)

# text
seg-1aab389815b3 = mpmath { "1.3.0" } (BSD-3-Clause) à { "50" } chiffres significatifs, autovérifié à { "80" } (concordance { "1.1e-38" } ou mieux), sur le jacobien, les poids et la conception de Helmert versionnés du moteur : la résolution LU propre à mpmath pour le complément de Schur, son inverse pour H et sa décomposition en valeurs propres de Jacobi (P2, une bibliothèque numérique indépendante). Préenregistré 804662d5 avant l'existence du jeu de test, avec des seuils issus d'une formule d'erreur rétrograde du premier ordre : constante (3n+{ "1" })n + m fois l'erreur d'arrondi unitaire (Higham, Accuracy and Stability of Numerical Algorithms, théorème { "10.4" }, la forme de niveau B), fois la sensibilité exacte du premier ordre de chaque grandeur à l'information conjointe, au complément de Schur et à H. Mesuré : sigmas du référentiel à { "4.8e-6" } près le 2026-03-18 (seuils { "9.6e-2" } à { "2.2e-1" }), { "9.7e-6" } le 2024-01-01 (seuils { "2.8e-2" } à { "6.9e-2" }) et { "2.0e-14" } avec les stations fixes (seuils { "1.0e-11" } à { "2.8e-7" }) ; nombre de condition à { "4.6e-6" }, { "1.3e-5" } et { "4.1e-14" } près. Sur les scénarios à stations estimées, les seuils sont ceux du pire cas et supérieurs de quatre ordres de grandeur à l'erreur mesurée, et le seuil de la direction la plus faible y dépasse un angle droit, de sorte que cette vérification n'est pas comptée ; sur le témoin à stations fixes, la direction la plus faible concorde à { "6.6e-16" } rad contre un seuil de { "9.4e-11" }, mesurée par la corde entre vecteurs unitaires (un ancien comparateur par acos ne pouvait pas résoudre des angles inférieurs à { "1.5e-8" } rad ; le seuil est inchangé). Diagnostic : les voies Cholesky et QR de NumPy { "2.3.5" } atteignent { "9e-9" } et { "5e-9" } sur les entrées du 2024-01-01, ses voies inverse et valeurs propres { "2.9e-6" } et { "6.2e-6" } : le moteur est dans sa borne mais environ mille fois moins exact qu'une voie par factorisation. Valide l'algèbre linéaire sur les entrées versionnées, et non le jacobien (c'est ce que fait la branche SPICE de la ligne de campagne) ni l'exactitude physique de la campagne illustrative

# text
seg-71b463388e80 = Solveur de référentiel à information en racine carrée par rapport à une précision étendue à 50 chiffres

# text
seg-5ec3e3c2bf19 = Un solveur à information en racine carrée facultatif (lunar-frame-campaign solver = "srif" ; défaut inchangé) qui ne forme ni n'inverse jamais de matrice d'information pour le référentiel : QR de Householder (décomposition orthogonale-triangulaire) du jacobien de retard blanchi comme mise à jour de mesure d'un filtre d'information en racine carrée, les stations terrestres marginalisées par le bloc triangulaire final (dont le produit de Gram est le complément de Schur), un second QR de R_bb A pour le référentiel de Helmert à sept paramètres, des sigmas comme normes de lignes de l'inverse triangulaire, et le spectre (nombre de condition, direction la plus faible) issu d'une décomposition en valeurs singulières de Jacobi unilatérale. Les produits scalaires sont compensés par un produit sans erreur à découpage de Dekker, de sorte que chaque opération est une opération de base IEEE-754 ou une racine carrée correctement arrondie ; des résultats identiques sur toutes les plateformes sont argumentés à partir de cela, et non testés entre plateformes

# text
seg-271cba640489 = mpmath { "1.3.0" } (BSD-3-Clause) à { "50" } chiffres significatifs, autovérifié à { "80" } (concordance { "1.4e-43" } ou mieux), sur le jacobien, les poids et la conception de Helmert versionnés du moteur (P2, une bibliothèque numérique indépendante : résolution LU, inverse, Cholesky et décomposition en valeurs propres de Jacobi propres à mpmath). Préenregistré b41908c9 avant l'écriture du solveur, avec des seuils issus d'une borne d'erreur rétrograde du premier ordre sous forme en racine carrée : constante de QR de Householder mn plus (3n+{ "1" })n fois l'erreur d'arrondi unitaire (Higham, Accuracy and Stability of Numerical Algorithms, théorème { "19.4" } et chapitre { "8" }) fois des sensibilités exactes. Mesuré : sigmas du référentiel à { "3.0e-13" } près le 2026-06-09 (seuils { "4.1e-7" } à { "5.3e-7" }), { "1.9e-15" } avec les stations fixes (seuils jusqu'à { "4.8e-12" }), { "3.8e-13" } le 2026-03-18 et { "2.3e-13" } le 2024-01-01, où le solveur spectral par défaut est en écart de { "4.8e-6" } et { "9.7e-6" } ; nombre de condition à { "4.9e-13" } près ; direction la plus faible à { "1.4e-13" } rad près (témoin { "1.7e-16" } contre { "5.1e-10" }). LIMITE DE LA VÉRIFICATION : les seuils n'établissent que des erreurs de référentiel inférieures à environ { "2e-7" } en relatif ; les chiffres mesurés de { "1e-13" } sont des observations, et non ce que les seuils établissent. La vérification rejette le solveur spectral par défaut (sigmas { "9.7e-6" } contre { "2.9e-7" } le 2024-01-01 ; à la date déterminante { "1.3e-6" } contre { "4.9e-7" }, une marge de { "1.3" } à { "2.6" }) et un inverse triangulaire mal pris (normes de colonnes : rouge), mais un signe de Householder inversé, un produit scalaire non compensé et des sigmas issus d'un inverse spectral de la matrice H formée à partir du facteur en racine carrée ({ "3.7e-9" }) passent tous, de sorte qu'elle ne montre pas que chaque étape en racine carrée est nécessaire. Valide l'algèbre linéaire du solveur facultatif sur des entrées versionnées, et non le jacobien ni le solveur par défaut ; la reproductibilité bit à bit entre plateformes est argumentée à partir des opérations utilisées et testée seulement comme identité de réexécution sur une seule plateforme

# text
seg-433b52bf0ba2 = Moniteurs de confiance maritimes : l'arithmétique sur laquelle ils reposent (décodage NMEA, décalages géodésiques, statistiques cinématiques et de résidus de capteurs)

# text
# c1: receiver_trust
# c2: maritime::en_offset_m
seg-c61c575f9c38 = Pour un navire, <c1/> décode les phrases NMEA { "0183" } qu'émettent un récepteur et ses instruments (GGA, RMC, VTG, HDT, VHW, VBW, ZDA, GSV), forme le décalage est-nord entre positions (<c2/>), et en tire les statistiques sur lesquelles ses moniteurs décident : la vitesse implicite, le résidu d'estime, l'accélération implicite et le taux de giration implicite sur des fenêtres de { "30" } s, les résidus cap-contre-route, loch-contre-vitesse-fond et altitude d'antenne (médianes sur { "10" } s), ainsi que la dispersion et la hausse du rapport signal sur bruit des satellites.

# text
seg-32fcf6956dac = CE QUI EST VÉRIFIÉ EN EXTERNE, énoncé étroitement : ({ "1" }) le décodage de chaque champ que lisent les moniteurs, par rapport à pynmea2 { "1.19.0" } (MIT) sur { "8" } journaux synthétiques ({ "1,086" } époques), à { "1e-9" } près dans l'unité du champ (latitude et longitude, altitude, séparation du géoïde, HDOP, vitesses, route, cap, rapport signal sur bruit ; entiers et dates exactement ; heure du jour à { "1e-6" } s près), les plus grandes différences se situant au niveau du dernier chiffre d'un double ; ({ "2" }) le décalage est-nord entre deux positions, en distance et en azimut, par rapport à la géodésique WGS84 de geographiclib { "2.1" } (MIT) sur { "223" } paires de positions avec des lignes de base allant jusqu'à { "2" } km, de -45 à { "70" } degrés de latitude et à travers l'antiméridien, à { "0.01" } m et { "0.001" } degré près (l'azimut par rapport à l'azimut moyen de la géodésique, la direction de la corde) ; ({ "3" }) les statistiques d'entrée des moniteurs à { "341" } époques notées d'un voyage synthétique de { "400" } s avec un virage et un saut de position, par rapport à des recalculs en Python qui utilisent geographiclib pour la distance et l'azimut, pynmea2 pour le décodage et numpy pour les médianes et les écarts types : vitesse implicite à { "0.005" } m/s près, résidu d'estime à { "0.02" } m près, accélération à { "5e-4" } m/s^{ "2" } près, taux de giration à { "1e-3" } deg/s près, les médianes de résidus et la dispersion et la hausse du rapport signal sur bruit à { "1e-6" } près. CE QUI NE L'EST PAS : les longueurs de fenêtre, les tolérances et les seuils des moniteurs sont les règles propres de ce projet ; le Python les reproduit à partir de la même documentation, de sorte que la concordance corrobore l'implémentation de l'arithmétique, et non les règles. La phrase THS n'a pas de classe pynmea2 et la phrase ROT n'est pas lue ; aucune n'est couverte. La table d'un émetteur NMEA et d'un numéro de satellite vers un identifiant de satellite de style RINEX est propre à ce projet (seuls le numéro, l'émetteur et la valeur sont comparés). Les entrées de pas de temps, d'horloge de l'hôte et d'état d'authentification n'ont pas de référence indépendante. Toutes les données sont du texte synthétique issu de receiver_trust::synth ; rien ici n'est une mesure et aucune affirmation n'est faite sur le comportement d'un moniteur face à un véritable brouillage. Azimut : comparé à l'azimut moyen de la géodésique. La comparaison préenregistrée avec l'azimut avant à la position { "1" } a échoué à { "0.001" } degré ({ "77" } paires sur { "223" }, pire cas { "8.3e-3" } degré) à cause d'un désaccord de définition, et non d'arithmétique ; l'amendement a été fait après la première exécution et les deux résultats sont consignés (la comparaison avec l'azimut avant reste dans le test comme borne descriptive, non préenregistrée, de { "0.01" } degré). Divulgué : les premières exécutions ont trouvé des entrées qui sollicitaient trop peu (l'accélération et le taux de giration étaient ramenés à zéro à chaque époque, et la trajectoire de l'antiméridien ne le franchissait jamais), un défaut du générateur synthétique (pas de repli de longitude) et, pour l'azimut, que la grandeur de référence enregistrée (l'azimut avant de la géodésique à la première position) diffère de la direction de la corde d'environ la moitié de la convergence des méridiens ({ "77" } paires sur { "223" } hors de { "0.001" } degré, pire cas { "8.3e-3" }) ; les entrées ont été corrigées et l'azimut comparé à l'azimut moyen à la même tolérance (amendements { "1" } à { "3" } du préenregistrement, faits après avoir vu les résultats et donc non à l'aveugle) ; les comparaisons de route et de cap ont été rendues circulaires ({ "360" } et { "0" } degrés sont une même route, amendement { "5" }). Mutation : une mise à l'échelle de { "1e-4" } du décalage fait échouer la comparaison géodésique.

# text
seg-1fdbb476c8ab = Score de confiance maritime : l'agrégation des preuves des moniteurs en un score de 0 à 100 et ses trois bandes

# text
seg-0d76b33144f1 = Chaque moniteur ramène ses preuves à un rapport de la statistique au seuil ; le score est { "100" } moins la somme sur les moniteurs du poids multiplié par une rampe linéaire bornée du rapport ({ "0" } jusqu'à { "0.5" }, { "1" } à { "1.5" }), borné de { "0" } à { "100" } et arrondi à { "0.1" }, avec des bandes à { "90" } et { "55" } ; chaque époque liste les moniteurs qui ont déduit et leurs points.

# text
seg-b2d3c6d6ac36 = Implémentation par rapport à la spécification, et NON une référence indépendante externe : une réimplémentation Python en salle blanche (scripts/maritime_score_cleanroom.py), écrite par un lecteur à qui l'on n'a donné que docs/RECEIVER-TRUST.md et docs/MARITIME-TRUST.md et non le source Rust, concorde avec score_from_ratios sur { "600" } vecteurs de rapports (score, bande, points et ordre des déductions, différence { "0" }), après que la documentation a été complétée là où le premier lecteur l'a trouvée muette ou incohérente (ordre des ex æquo, arrondi, rapport d'un moniteur tout-ou-rien, deux exemples dont les nombres ne correspondaient pas à la formule). Cela montre que la documentation est suffisante et que le code fait ce qu'il dit. CE QUI N'EST PAS VÉRIFIÉ, et pourquoi la ligne reste MODELLED : la règle elle-même (les poids, la rampe, les bornes des bandes, le maintien des preuves) est propre à ce projet, préenregistrée mais sans source externe, et rien ici ne montre qu'un score de { "80" } ou de { "40" } signifie ce qu'un navigateur voudrait qu'il signifie face à un véritable brouillage ; aucun chiffre de ce genre n'est donné. Les seuils des moniteurs sont de même propres à ce projet (la ligne A ne vérifie que leur arithmétique).

# text
seg-f52fceaf06ca = Respect de NMEA { "0183" } par les flux d'entraînement et valeurs décodées

# text
seg-684f86418933 = Flux NMEA { "0183" } synthétiques de passerelle pour l'entraînement des équipages (kshana nmea-scenario) : GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW et le marqueur PKSHT, générés à partir d'une trajectoire vraie avec des effets modélisés de récepteur, de ciel, de brouillage et de leurrage. Sortie texte seulement ; rien n'est transmis.

# text
seg-4591ed75149c = CE QUI EST VÉRIFIÉ EN EXTERNE, énoncé étroitement : les { "225,227" } phrases de huit flux d'entraînement synthétiques (quatre scénarios de bibliothèque, graines { "1" } et { "7" } ; GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW et le marqueur PKSHT) sont analysées par pynmea2 { "1.19.0" }, un analyseur NMEA indépendant, avec une somme de contrôle valide et l'émetteur et le type attendus. La position, la vitesse fond, la route fond, le cap, l'heure et la date UTC, l'état de position et le nombre de satellites GGA qu'il décode égalent la trajectoire vraie du générateur dans des tolérances fixées avant la première comparaison ({ "1.5e-6" } deg, { "0.06" } kn, { "0.07" } km/h, { "0.11" } deg de route, { "0.5" } deg de cap, { "0.02" } s), exécutées par scripts/gen_nmea_training_ref.py avec le jeu de test dans tests/fixtures/nmea_training_ref/. L'attente du nombre de satellites GGA a été corrigée après la première exécution selon la convention NMEA ({ "00" } sans position) ; tolérances numériques inchangées depuis le commit de préenregistrement. CE QUI NE L'EST PAS : qu'un récepteur, un traceur de cartes ou un système de passerelle accepte les flux ; le réalisme des modèles de récepteur, de ciel, de brouillage ou de leurrage (ciel nominal, bruit modélisé, profils d'entraînement et de rejeu, tous MODELLED) ; HDOP, altitude, et le contenu DOP et GSA/GSV au-delà de la syntaxe et des comptes ; le journal de l'instructeur. Rien n'est transmis, et aucune performance anti-brouillage ou anti-leurrage n'est affirmée.

# text
seg-1be1cfcb95c8 = Carte d'interférence : significations des codes d'exactitude, valeurs AIS non disponibles, affectation aux cellules de grille, longueur de route par état de cellule et masquage terrestre

# text
seg-71cff2a675e8 = La lecture des codes d'exactitude et d'intégrité de navigation ADS-B qu'utilise la carte (la borne d'EPU que représente un code NACp, la borne de rayon de confinement que représente un code NIC, et les classes basse et bonne que la méthode en dérive) ; les valeurs de position et de vitesse AIS non disponibles que le lecteur AIS écarte ; la cellule de grille fixe latitude/longitude dans laquelle tombe une position ; la longueur de route, et sa répartition par état de cellule (dégradée, non dégradée, non évaluée, non observée), que rapporte l'exposition de route ; et si une position se situe à l'intérieur des terres d'un polygone de terre de plus qu'une zone tampon. Une cellule signalée comme dégradée ou anormale est un énoncé sur des champs d'exactitude rapportés ou des positions invraisemblables, et non la constatation d'une interférence, et rien ici ne le vérifie.

# text
seg-beee15333c89 = CE QUI EST VÉRIFIÉ EN EXTERNE, énoncé étroitement : cinq implémentations indépendantes lisent les mêmes entrées synthétiques. ({ "1" }) pyModeS { "2.21" } décode des trames synthétiques DF17 d'état opérationnel et de position en vol ; les bornes d'EPU NACp de Kshana concordent à { "0.5" } m près (plus grande différence { "0.4" } m), ses bornes de confinement NIC pour les codes { "5" } à { "11" } concordent à { "1" } m près, et ses classes basse et bonne placent les { "12" } codes NACp et chaque code NIC que produit la référence indépendante ({ "0" } à { "11" }) du même côté des seuils qu'impliquent les bornes de la référence indépendante ({ "0" } désaccord). ({ "2" }) pyais { "3.3.0" } décode des phrases AIVDM de type { "1" } dont le script empaquette les bits de charge utile à partir des valeurs brutes des champs de l'UIT-R M.1371 ; Kshana refuse exactement les positions décodées non disponibles (latitude { "91" }, longitude { "181" }) et la vitesse ({ "102.3" } kn), et conserve { "0" } à { "102.2" } kn tels que décodés ({ "0" } désaccord sur { "94" } trames). ({ "3" }) covers() de shapely { "2.2.0" } sur des polygones de cellules concorde avec grid::Grid::cell_of pour { "1770" } points sur des tailles de cellule de { "0.5" }, { "0.25" }, { "1" } et { "0.07" } degré, y compris des points proches des bords, les deux pôles et l'antiméridien ({ "0" } désaccord). ({ "4" }) l'intersection route/cellule de shapely { "2.2.0" } avec les longueurs géodésiques WGS84 de GeographicLib { "2.1" } concorde avec l'exposition de route sur { "8" } routes synthétiques, dont deux qui franchissent l'antiméridien : longueur totale à { "0.6" } % près (plus grande différence { "0.49" } %, la sphère contre l'ellipsoïde) et longueur de chaque état de cellule à { "0.6" } % plus { "125" } m par morceau près (plus grande { "21" } % de cette tolérance). ({ "5" }) contains() de shapely { "2.2.0" } avec la distance équidistante azimutale de pyproj à la côte concorde avec le masque terrestre de { "2000" } m sur { "992" } points de centre de réseau autour de quatre îles synthétiques, dont une avec un lac ({ "0" } désaccord ; { "4" } points à moins de { "20" } m de la zone tampon ont été exclus et comptés). Les tolérances ont été fixées dans tests/fixtures/interference_map_ref/PREREGISTRATION.md avant toute comparaison, et non modifiées ensuite ; deux défauts des entrées synthétiques trouvés par la première exécution y sont consignés. CE QUI NE L'EST PAS : Kshana ne décode pas de trames Mode S brutes ni de phrases AIVDM, de sorte que cela vérifie sa lecture de valeurs déjà décodées, et non un décodeur. Les rayons de confinement NIC de la référence indépendante pour les codes { "1" }, { "2" } et { "4" } diffèrent de DO-260B ({ "20" }, { "8" } et { "2" } NM), de sorte que seuls les codes { "5" } à { "11" } sont comparés numériquement. La règle de position ({ "0" }, { "0" }), le plancher d'altitude, le filtre de type de source, le hachage des identifiants, les seuils et statistiques de la méthode, et le choix de taille de cellule sont propres à Kshana et ne sont vérifiés par rapport à rien. La comparaison de route utilise la même définition de trajet rectiligne en latitude et longitude des deux côtés, de sorte qu'elle vérifie les longueurs et l'affectation aux cellules, et non que ce trajet est le bon pour un navire ou un aéronef. Rien ici ne montre qu'une cellule signalée est de l'interférence. Les entrées sont synthétiques ; les jeux de référence indépendante sont écrits par scripts/gen_interference_map_ref.py (pyModeS est sous GPL-3.0 et n'est utilisé que dans ce script hors ligne ; la CI n'a besoin d'aucun Python).

# text
seg-57ace69bdf1a = Formats de transmission de la télémétrie de confiance : exposition texte Prometheus et JSON OpenTelemetry OTLP/HTTP

# text
seg-654126a9d073 = La confiance GNSS (score, bande, raisons, barrière et, sur demande, position) sous forme d'exposition texte Prometheus servie sur /metrics et de métriques JSON OTLP/HTTP, avec un plafond sur la cardinalité des étiquettes de raison.

# text
seg-9cbde962155c = CE QUI EST VÉRIFIÉ EN EXTERNE, énoncé étroitement : notre exposition texte Prometheus pour un flux synthétique de 84 lignes (valeurs d'étiquettes avec guillemets, barres obliques inverses, sauts de ligne et texte non ASCII, { "64" } séries de raisons plus un repli « other », jauges de barrière et de position) est acceptée par l'analyseur de texte de prometheus_client { "0.26.0" }, et les familles de métriques, types, textes d'aide, jeux d'étiquettes et valeurs qu'il lit égalent exactement l'état du registre (valeurs par égalité f64). Notre JSON OTLP/HTTP pour le même registre s'analyse avec json_format.Parse(ignore_unknown_fields=False) de protobuf { "7.36.2" } en ExportMetricsServiceRequest d'opentelemetry-proto { "1.45.1" }, et chaque nom de métrique, description, unité, nature, monotonie, temporalité d'agrégation, attribut, valeur, heure de début et heure égale exactement l'état du registre. Il a été montré que les deux analyseurs rejettent un champ inconnu, une valeur de mauvais type et une ligne malformée (scripts/gen_telemetry_formats_ref.py). Schéma { "1.3" } ({ "0.36" }), préenregistré (fb226057) avant qu'aucun outil ne le lise : pour un flux synthétique de schéma 1.3 de 64 lignes (états de géométrie, DOP, étiquettes et perte de signal présents, nuls, absents et inconnus ; classes de déduction ; lignes inanalysables), les deux mêmes analyseurs lisent les séries de géométrie (Prometheus kshana_trust_geometry*, OTLP kshana.geometry.*) et l'étiquette de classe sur kshana_trust_reason_active exactement comme le registre l'implique ({ "24" } familles et { "54" } échantillons ; { "12" } métriques et { "31" } points), promtool { "3.5.0" } check metrics se termine par { "0" } sans problème de lint, et l'OpenTelemetry Collector contrib { "0.135.0" } accepte le JSON OTLP/HTTP (statut { "200" }, rien rejeté) et son exportateur de fichier enregistre la requête inchangée (xval/telemetry-1.3, conditionné par les données : les archives de version sont récupérées avec SHA-256 figé et leurs sorties versionnées). CE QUI NE L'EST PAS : le point de terminaison HTTP, la livraison, les délais d'attente et la reconnexion ne sont pas vérifiés par une référence indépendante, ni le récepteur prometheus du Collector ; le registre est lu par des accesseurs, de sorte qu'une faute dans l'état du registre lui-même ne serait pas détectée ; la vérification OTLP « la sortie versionnée est à jour » ne s'exécute qu'avec la fonctionnalité otlp ; les noms de métriques et leur utilité pour un centre d'exploitation ne sont pas vérifiés ; CEF et LEEF ne sont pas couverts (voir la ligne suivante).

# text
seg-b037c999443b = Événements SIEM de la télémétrie de confiance : Common Event Format (CEF) sur syslog

# text
seg-ffd8d7062055 = Événements de changement de bande (ou par époque) sous forme de charges utiles Common Event Format dans une enveloppe RFC { "5424" } sur UDP ou TCP, avec une correspondance de champs documentée et l'échappement CEF.

# text
seg-59fd23d6607e = CE QUI EST VÉRIFIÉ EN EXTERNE, énoncé étroitement : par rapport à deux analyseurs open source indépendants (références indépendantes : pycef { "1.11" } (PyPI, MIT) ; le codec CEF de Logstash (logstash-codec-cef { "6.2.7" } dans Logstash { "8.15.3" })), sur un corpus de lignes CEF que ce crate a écrites ({ "157" } avant l'amendement { "4" } ci-dessous, { "170" } après, { "176" } après l'amendement { "5" }) : chaque changement de bande et chaque époque d'un flux de confiance synthétique versionné de 84 lignes, plus du texte adverse dans les hôtes, raisons, étiquettes de temps et noms de barrière contenant des signes égal, des barres obliques inverses, des barres obliques inverses-égal, des barres verticales, des sauts de ligne, des retours chariot, des tabulations, des suites d'espaces, des caractères multi-octets et astraux et des sosies de clés, des scores et décalages extrêmes, chaque bande avec et sans bande précédente. pycef analyse les lignes dont l'en-tête n'a pas besoin d'échappement ({ "153" } avant l'amendement { "4" }, { "166" } après, { "172" } après l'amendement { "5" }) et retrouve, exactement, les champs d'en-tête, la sévérité, l'ensemble exact des clés d'extension et chaque valeur (nombres par égalité f64), après les règles de désempaquetage de la spécification CEF, que pycef n'applique pas et que scripts/gen_cef_ref.py applique. Le codec Logstash, qui désempaquette de lui-même, analyse chaque ligne ({ "157" }, puis { "170" }, puis { "176" }), satisfait au même seuil, et retrouve aussi quatre champs d'en-tête qui nécessitent un échappement (une barre verticale, une barre oblique inverse et un signe égal dans la chaîne de version), que le motif d'en-tête de pycef ne peut pas lire, de sorte que l'échappement d'en-tête repose sur le seul codec Logstash. Le seuil de comparaison a été enregistré dans les commits { "5172e579" } (pycef) et 0a7598aa (Logstash) avant l'exécution de l'un ou l'autre analyseur, et tous deux l'ont atteint à la première comparaison. Cinq amendements sont divulgués. Les amendements ({ "1" }) à ({ "3" }) n'ont touché aucune règle de comparaison ni aucune valeur attendue : ({ "1" }) une assertion de taille de corpus a été corrigée de { "5" } à { "4" } changements de bande, une erreur de comptage, puisque le flux en comporte { "4" } ; ({ "2" }) le câblage du délimiteur de pipeline de l'exécuteur Logstash a été corrigé après une première tentative qui n'a produit aucun événement ; ({ "3" }) le score de confiance et le décalage d'époque ont été déplacés des champs entiers CEF cn1 et cn2 vers les champs à virgule flottante cfp1 et cfp2, un changement de format de transmission fait dans cette version, après quoi le corpus a été régénéré et les deux références indépendantes relancées avec le seuil inchangé, qu'elles ont de nouveau atteint. L'amendement ({ "4" }), { "0.36" }, a étendu le corpus et l'ensemble de clés attendu, enregistré dans d6331429 avant que l'un ou l'autre analyseur ne s'exécute sur les nouvelles lignes : les entrées de schéma { "1.3" } ajoutent la géométrie des satellites dans les champs personnalisés cs6 (étiquette geometry : état, puis ';' et les classes de déduction), cfp3 (geometryHdop) et cfp4 (geometryPdop) ; { "13" } cas de géométrie (le corpus passant à { "170" } lignes) et les trois nouvelles clés ; tous deux ont atteint le seuil, par ailleurs inchangé, à la première comparaison (pycef { "166" } lignes sur { "170" } analysées, les { "4" } cas d'en-tête de niveau { "2" } comme avant ; Logstash { "170" } sur { "170" }). L'amendement ({ "5" }), { "0.36" }, a ajouté { "6" } cas d'étiquette de géométrie (le corpus passant à { "176" } lignes), enregistré dans 9a8e4fa9 avant que l'un ou l'autre analyseur ne s'exécute dessus : à partir d'entrées qui portent l'étiquette de géométrie, cs6 gagne un troisième champ (';' et l'étiquette) et cn1 (geometryUsedSatellites) les satellites utilisés ; la table de correspondance du codec Logstash a été lue d'abord (pas de champs flexString, d'où cs6 plutôt que flexString1) ; tous deux ont atteint le seuil à la première comparaison (pycef { "172" } sur { "176" }, Logstash { "176" } sur { "176" }), et chaque entrée de référence antérieure a été reproduite inchangée. CE QUI NE L'EST PAS : aucun des deux analyseurs ne vérifie le type des valeurs cfp (tous deux les conservent comme texte), de sorte que l'emploi des champs à virgule flottante repose sur le dictionnaire CEF et non sur une référence indépendante ; aucun SIEM de fournisseur n'a été exécuté ; les noms de clés d'extension et leur correspondance sont un choix de ce crate, et les analyseurs montrent seulement qu'ils sont relus tels qu'écrits ; l'enveloppe RFC { "5424" }, la livraison, les délais d'attente et la reconnexion ne sont pas couverts ; pycef est un petit analyseur dont la dernière version date de { "2020" }, et le codec Logstash est la référence indépendante la plus substantielle.

# text
seg-51640405c9b7 = Événements SIEM de la télémétrie de confiance : Log Event Extended Format (LEEF) sur syslog

# text
seg-1b3245506847 = Événements de changement de bande (ou par époque) sous forme de charges utiles Log Event Extended Format { "2.0" } dans une enveloppe RFC { "5424" } sur UDP ou TCP, avec une correspondance de champs documentée.

# text
seg-563ccb0adbe5 = CE QUI EST VÉRIFIÉ : les propres tests à chaîne exacte de ce crate sur la correspondance de champs LEEF documentée et sur les champs de l'enveloppe RFC { "5424" } ; il n'existe aucun analyseur LEEF open source maintenu (une recherche dans l'index des paquets Python n'en a trouvé aucun), de sorte que le format est vérifié par rapport à sa propre spécification lue par le même auteur, et non par rapport à une référence indépendante externe. CE QUI NE L'EST PAS : si les charges utiles LEEF sont acceptées par l'analyseur ou le SIEM d'un fournisseur ; les règles d'échappement au-delà de celles documentées ; le comportement d'un véritable collecteur syslog.

# text
seg-96a95b89faa5 = Intégrité du paquet de preuves : signature, chaîne de hachage et procédure de vérification

# text
seg-943a853d8a4a = Un paquet de preuves signé et chaîné par hachage d'un événement de confiance GNSS : SHA-256 sur chaque fichier et une chaîne sur le manifeste, une signature Ed25519 sur les octets exacts du manifeste, et un vérificateur qui nomme chaque défaillance (un fichier modifié, retiré, renommé, échangé ou ajouté, un manifeste réordonné ou modifié, un manifeste re-haché sans la clé, un paquet re-signé, une mauvaise clé épinglée, et un jeton d'horodatage supprimé, remplacé, quelconque ou portant sur un autre document).

# text
# c1: kshana evidence verify --tsa-ca
seg-0699ef2074fd = CE QUI EST VÉRIFIÉ EN EXTERNE, énoncé étroitement : ({ "1" }) les fonctions Ed25519 que le paquet utilise pour signer et pour vérifier strictement (evidence::bundle::sign_detached, evidence::verify::verify_detached) reproduisent octet pour octet les clés publiques et les signatures des vecteurs de test { "1" }, { "2" }, { "3" } et { "1024" } de la section { "7.1" } de la RFC { "8032" }, les acceptent, et rejettent chaque bit inversé du vecteur { "1" } et un bit sur sept des autres et une signature S+L non canonique ; les vecteurs sont analysés à partir du texte de la RFC et reproduits par deux implémentations indépendantes (cryptography/OpenSSL et PyNaCl/libsodium) dans scripts/gen_ed25519_rfc8032_ref.py. ({ "2" }) evidence::bundle::sha256_hex, le hachage derrière chaque hachage de paquet et la chaîne, reproduit exactement les exemples SHA-256 de FIPS 180-4 (abc ; le message de 448 bits ; un million de a), le message vide et les condensés de hashlib sur une échelle d'octets de { "0" } à { "130" } à travers les frontières de remplissage. ({ "3" }) Un vérificateur écrit en Python à partir de docs/EVIDENCE-PACKS.md seul (scripts/evidence_verify_cleanroom.py : hashlib et cryptography ; son auteur n'a lu aucun code Rust) concorde avec le vérificateur Rust sur { "71" } paquets synthétiques intacts et altérés, exactement, sur le verdict, l'ensemble des défaillances avec les noms de fichiers, le verdict de signature, et la tête de chaîne recalculée à partir des fichiers et celle que consigne le manifeste. À la première exécution, { "64" } sur { "71" } concordaient ; les désaccords étaient une ambiguïté de spécification (vérifier une clé épinglée par rapport à un manifeste illisible), un écart d'interface de la référence indépendante et un cas construit de façon incomplète ; la phrase de la spécification a été clarifiée, la référence indépendante réimplémentée à partir du texte et le cas complété, sans changer aucune tolérance ni attente (consigné dans le commit d54e14c6). CE QUI NE L'EST PAS : le vérificateur en salle blanche est une implémentation indépendante d'un autre auteur, et non une autorité tierce, et il partage les choix de la spécification, de sorte qu'il corrobore cette implémentation des règles, et non les règles ; les vecteurs vérifient les primitives, et non la conception du format de paquet. Dans cette ligne, le jeton RFC { "3161" } n'est lu que pour son empreinte de message et les jetons de test sont synthétiques et non signés ; la signature et la chaîne de l'autorité sont vérifiées, en option (<c1/>), par la ligne distincte « Vérification de la signature et de la chaîne des jetons d'horodatage RFC { "3161" } ». Les cas d'altération sont synthétiques. Rien ici n'est un avis juridique sur un paquet quelconque, ni une attestation de celui-ci.

# text
seg-c15736afcbc9 = Vérification de la signature et de la chaîne des jetons d'horodatage RFC { "3161" }

# text
# c1: kshana evidence verify --tsa-ca <anchors.pem>
# c2: openssl ts -verify
seg-cd64bbf39459 = evidence::tsa::verify_token, et <c1/> en option pour le timestamp.tsr d'un paquet : une TimeStampResp RFC { "3161" } ou un TimeStampToken nu (CMS SignedData sur une TSTInfo) vérifié hors ligne par rapport à des ancres de confiance comme le fait <c2/> : le type de contenu des attributs signés et le condensé de message sur la TSTInfo ; la signature sur les attributs signés (RSA PKCS#1 v1.5, RSASSA-PSS, ECDSA P-256 et P-384 ; opérations publiques RSA sur crypto-bigint) ; le hachage ESS signing-certificate v1 (SHA-1) ou v2 nommant le certificat du signataire, trouvé parmi les certificats non fiables du jeton et de l'appelant ; l'utilisation étendue de clé timeStamping unique et critique du signataire ; la chaîne jusqu'à une ancre auto-émise de confiance avec la signature, le statut d'AC et l'usage de clé de chaque certificat, et chaque certificat valide au genTime du jeton ; et l'empreinte de message par rapport aux données. Non vérifiés : la révocation (CRL, OCSP), les contraintes de nom et de politique, le nonce

# text
# c1: openssl ts -verify -attime genTime
# c2: openssl cms -verify -cades -purpose timestampsign
seg-d305c442506d = OpenSSL { "3.0.13" } (<c1/>, et <c2/> plus l'empreinte TSTInfo pour les jetons RSA-PSS), exécuté par tests/fixtures/evidence_tsa/run_openssl.sh sur les { "27" } cas de cases.tsv : RSA PKCS#1 v1.5 avec SHA-256 et SHA-512 et ESS v1 et v2, une racine ECDSA P-384 sur un intermédiaire P-256 et des TSA P-256 et P-384, RSA-PSS, un jeton sans le certificat du signataire avec et sans sa fourniture, des jetons signés CAdES, un octet de signature inversé (trois algorithmes), une TSTInfo modifiée (deux), une signature d'intermédiaire inversée, un certificat jumeau ESS, de mauvaises ancres (quatre), un certificat de TSA expiré, une utilisation étendue de clé non critique et une erronée, et de mauvaises données (trois). Préenregistré dans tests/fixtures/evidence_tsa/PREREGISTRATION.md (versionné seul, 30ad70b2, avant l'existence du vérificateur ; les verdicts d'OpenSSL relancés ensuite, identiques octet pour octet). Première exécution : les { "27" } verdicts concordent (B1) et chaque genTime concorde à la seconde (B2). Périmètre, énoncé étroitement : certificats et jetons de test auto-générés, produits par le même OpenSSL qui les juge ; OpenSSL est une implémentation indépendante, et non une autorité d'horodatage ; aucun jeton d'une autorité publique n'est intégré (freetsa.org n'indique aucune licence). Rien ici n'atteste un horodatage réel

# text
seg-c04042b0270a = Seuils d'interférence de la confiance du récepteur calibrés sur le jeu de données JammerTest { "2024" }

# text
seg-32ad0b0da818 = receiver_trust::calibration::run_dataset : la calibration préenregistrée des moniteurs de chute de C/N0, de AGC et d'indicateur de brouillage sur le jeu de données public JammerTest { "2024" } (Zenodo { "15911589" }, GPL-3.0-or-later, récupéré à l'exécution, jamais intégré) : par dossier une chronologie de { "1" } s issue de mon_rf.csv et rinex.csv, les moniteurs exécutés une fois, chaque époque postérieure à la calibration étiquetée propre ou brouillage d'après l'attack_log du dossier (décalé de CEST à UTC, garde de { "60" } s), chaque seuil balayé sur une grille fixe, le plus petit seuil dont la probabilité de fausse alarme propre cumulée est d'au plus { "0.01" } retenu, et des comptes réservés en laissant un dossier de côté ; un recoupement avec un lecteur UBX. La sélection n'est livrée que comme profil facultatif [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }) ; la règle par défaut et chaque sortie sans lui sont inchangées

# text
seg-3ccd1b09ad09 = Les journaux d'événements publiés du jeu de données (fenêtres attack_log), comme vérité d'événement, selon le préenregistrement xval/jammertest-trust/PREREGISTRATION.md (versionné seul, 0fa012b, avant l'exécution du banc de test). Première et unique exécution (xval/jammertest-trust/RESULTS.md) : { "14" } dossiers sur { "24" } évaluables ({ "7" } avec brouillage), { "3,502" } époques propres et { "9,560" } époques de brouillage. Probabilité de fausse alarme propre sur données réservées : cn0_drop_db { "0.0231" } (81/3502) contre un seuil de { "0.02" }, FAIL ; agc_k_sigma { "0.0003" }, réussi ; jam_ind_threshold { "0.0094" }, réussi ; union des trois : fausses alarmes { "0.0328" }, détection { "0.807" } contre { "0.05" } et { "0.50" }, réussi. Selon la règle enregistrée, la ligne est MODELLED (un seuil a échoué). Étroit : un seul type de récepteur (u-blox ZED-F9P), un seul événement, des créneaux planifiés d'une minute comme vérité (détection : borne inférieure ; propre signifie hors des fenêtres journalisées) ; calibré sur les journaux CSV, et le lecteur UBX donne plus de fausses alarmes sur deux dossiers. Les bandes du score de confiance maritime ne sont pas calibrées

# text
seg-65a8361b4a22 = Notation Jammertest : un journal de récepteur noté par essai planifié (latence de détection, alarmes manquées, fausses alarmes, délai de rétablissement) par rapport au plan d'essai publié

# text
seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score) : le catalogue d'essais et le plan de transmission de la NPRA (MIT, récupérés avec un SHA-256 épinglé, jamais intégrés au dépôt) lus comme vérité planifiée, avec les identifiants du catalogue conservés ; une exécution receiver-trust notée par essai (première alarme moins début prévu, détecté/tardif/manqué par rapport à une tolérance, délai jusqu'à la première période sans alarme, alarmes en dehors de chaque créneau et de sa marge de garde), avec un paquet de preuves signé qui porte la fiche de résultats. Le calendrier est constitué de créneaux planifiés, et non d'heures d'émission réelles enregistrées

# text
seg-49b912adb7a9 = Le nombre de créneaux du plan par zone d'essai ({ "76" }, { "77" } et { "45" } créneaux, dont { "61" }, { "63" } et { "32" } émettent) a été compté indépendamment avec un script sur le même JSON ; les fenêtres attack_log du jeu de données { "2024" } servent de vérité d'événement, selon xval/jammertest-score/PREREGISTRATION.md (commité seul, c2e6d3b, avant l'exécution du calcul de score). Première et unique exécution (xval/jammertest-score/RESULTS.md) : la règle enregistrée de quantité minimale de données a FAILED ({ "4" } fenêtres de brouillage évaluables issues de { "4" } dossiers UBX sur { "12" }, contre un minimum de { "10" } fenêtres issues de { "2" } dossiers : { "5" } dossiers écartés par la règle de référence de base, { "3" } journaux UBX ne portent que la semaine GPS en secondes), de sorte que les seuils B1 à B4 ne sont pas évaluables ; rien n'a été assoupli ni ré-exécuté. v2 (xval/jammertest-score/PREREGISTRATION-v2.md, commité seul, traitement des données uniquement : journaux à heure GPS seule placés d'après la date, les { "12" } dossiers CSV seuls, une session de plateforme mobile pour les rovers en mouvement ; mêmes seuils et même règle de quantité minimale) : { "14" } dossiers sur { "24" } conservés mais seulement { "7" } fenêtres de brouillage évaluables, la règle de quantité minimale de données a de nouveau échoué, aucun seuil évaluable (RESULTS-v2.md). Vérité planifiée : un créneau planifié n'est pas un enregistrement d'émission, un échec peut être un essai qui n'a jamais eu lieu, une latence se compte depuis le début prévu, et propre signifie en dehors des créneaux planifiés. La détection par des moniteurs du domaine des mesures ne dit rien d'un leurre de faible puissance. Un seul type de récepteur (u-blox ZED-F9P). Le jeu de données NMEA SimulaMet de { "2025" } n'est pas utilisé (aucune licence indiquée, accès sur abonnement)

# text
seg-0d227bbcb5f1 = Export pour banc d'essai (kshana bench-export) : colonnes terrestres fixes, géodésiques et de vitesse locale, colonnes d'attitude et sortie NMEA { "0183" }

# text
seg-c6a6e08afadd = Les colonnes du CSV de mouvement (position terrestre fixe, position géodésique, vitesse terrestre fixe, cap/tangage/roulis et UTC) et les phrases NMEA GGA/RMC, écrites à partir de scénarios synthétiques (gnss-ins dont automotive-urban-canyon, jamming, gnss-sim). Mouvement et événements uniquement ; aucun signal n'est écrit et aucune performance de simulateur ou de récepteur n'est revendiquée.

# text
seg-f953ad11fe08 = CE QUI EST VÉRIFIÉ À L'EXTERNE, énoncé de façon restreinte : par rapport à pyproj { "3.8.0" } (PROJ { "9.8.1" }), geographiclib { "2.1" }, pynmea2 { "1.19.0" } et scipy { "1.18.1" }, exécutés par scripts/gen_testbench_ref.py sur { "4" } scénarios synthétiques, avec des tolérances fixées avant la première comparaison (chacune étant le pire cas d'arrondi de l'écriture) : les colonnes terrestres fixes égalent la conversion WGS { "84" } des colonnes géodésiques (pire { "1.3e-4" } m, seuil { "3e-4" }) et la conversion inverse ({ "1.3e-9" } deg, seuil { "2e-9" } ; hauteur { "1.3e-4" } m, seuil { "3e-4" }) sur chaque ligne ; la vitesse terrestre fixe tournée vers nord-est-bas par l'opération topocentrique de PROJ égale la vitesse NED vraie du moteur ({ "7.5e-5" } m/s, seuil { "2e-4" }) ; le cap, le tangage et le roulis égalent le lacet-tangage-roulis de scipy du quaternion vrai du moteur ({ "5.0e-7" } deg, seuil { "1e-6" }) ; chaque phrase NMEA est analysée par pynmea2 avec une somme de contrôle valide, et sa position décodée ({ "1.2e-3" } m, seuil { "5e-3" }), sa hauteur, sa vitesse, sa route ({ "5.0e-4" } deg, seuil { "1e-3" }) et son heure égalent les valeurs du mouvement ; la colonne UTC égale un calcul indépendant de date et d'heure. Le SHA-256 des octets exacts du CSV et du NMEA vérifiés est épinglé. CE QUI NE L'EST PAS : la trajectoire de vérité du scénario elle-même (le profil de conduite et son intégration) ; les conventions (le cap est le lacet du corps, et non la route, et en diffère jusqu'à environ { "77" } degrés sur automotive-urban-canyon ; la qualité GGA, le nombre de satellites et le HDOP sont des valeurs de remplacement) ; la question de savoir si un simulateur de laboratoire lit les fichiers comme prévu ; toute performance de simulateur ou de récepteur. Les références indépendantes vérifient les conversions et les encodages, et non la physique du scénario. La gestion du repère local est vérifiée uniquement par la rotation de la vitesse ainsi que par la vitesse et la route NMEA (le CSV n'a pas de colonne de position locale).

# text
seg-ee99388f7b15 = compliance (kshana compliance-report) : une correspondance entre les sorties de Kshana et des clauses de cadres publics, par numéro uniquement, remplie à partir des exécutions fournies ; un résultat ne compte pour une capacité que s'il porte les preuves que la correspondance nomme, un ensemble vide ne prouve rien, et la formulation est « apporte des éléments de preuve en faveur de » ; le rapport n'est pas un constat qu'un cadre quelconque est satisfait, ni une évaluation ou une approbation par qui que ce soit.

# text
seg-8659260fd38e = Références vérifiées par rapport à un index de titres extrait par script des documents publics cités, lus le 2026-10-10 (tests/compliance_references.rs). CE QUI EST VÉRIFIÉ : { "49" } références citées de clause, de section, de paragraphe ou de titre existent dans le document cité, et { "7" } URL citées ont abouti à la date enregistrée ({ "2" } par une seconde voie) ; les contrôles négatifs échouent. CE QUI NE L'EST PAS : qu'une paraphrase, une correspondance ou une lacune soit correcte ; les clauses de l'EN { "16803" } (payant, texte du catalogue seulement) ; les révisions ultérieures ; l'index n'est pas une implémentation indépendante.

# text
seg-98c360d82d56 = Intégrations marines : greffon Signal K, flux de barrière et panneau de score OpenCPN, construction de référence

# text
seg-7af9ce566646 = Le score de confiance, la bande, les raisons, l'état de la barrière et la position rapportée par le récepteur, publiés sous navigation.gnss.kshana dans un serveur Signal K avec une notification d'avertissement, d'alarme et normale (integrations/signalk) ; le flux NMEA filtré par la barrière, avec le point marqué invalide tant que la confiance est effondrée et une phrase PKSHT par cycle, servi à OpenCPN en TCP par la barrière elle-même ou par un petit relais, et un panneau de score OpenCPN natif qui lit la phrase PKSHT (integrations/opencpn) ; ainsi que des unités systemd et un conteneur qui exécutent la barrière (deploy/reference-build). Là où elles affichent une sortie, elles portent l'énoncé à titre consultatif : Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) : l'opérateur reste responsable de la navigation du navire.

# text
seg-00a0f52f7458 = CE QUI EST VÉRIFIÉ, énoncé de façon restreinte : que ces intégrations fonctionnent avec les vrais logiciels pour lesquels elles sont écrites. Les PREUVES sont versées dans integrations/signalk/evidence/README.md (avec ses fichiers JSON) et integrations/opencpn/evidence/README.md (avec ses captures d'écran et journaux), chacune avec le script qui la reproduit. ({ "1" }) Signal K : le greffon chargé dans le paquet npm signalk-server { "2.33.0" } épinglé, dans un espace de noms réseau privé limité à la boucle locale, alimenté par des données synthétiques. Les propres interfaces REST et WebSocket du serveur ont montré les chemins publiés, les métadonnées du score, et une notification qui est passée à absent, avertissement, alarme, normal (après le maintien) puis de nouveau avertissement lorsque les données se sont arrêtées. Avec le vrai kshana exécuté par le greffon sur le NMEA que le serveur a lui-même reçu, la notification est passée à avertissement puis à alarme et la position rapportée a été publiée ; le navigation.position propre au serveur a été écrit par son fournisseur NMEA, jamais par le greffon. Réexécuté avec le schéma JSON en direct { "1.2" }. ({ "2" }) OpenCPN : le greffon compilé avec l'en-tête de l'API de greffons d'OpenCPN et wxWidgets { "3.2.4" }, chargé dans le paquet Ubuntu { "24.04" } d'OpenCPN { "5.8.4" } sous un affichage virtuel ; OpenCPN l'a chargé, a exécuté son initialisation et lui a remis les phrases PKSHT du flux filtré, et le panneau est passé au rouge sur la bande non fiable. Dans une exécution propre, la position du navire propre à OpenCPN a cessé de se mettre à jour, et son indicateur de point est tombé, lorsque la barrière a marqué le point invalide. Une seconde exécution alimentée directement par l'écouteur TCP de la barrière a montré une livraison au greffon mais pas un avant-après net. ({ "3" }) Les tests du relais rejouent un extrait enregistré du flux filtré à travers un vrai socket TCP et vérifient ce qu'un consommateur reçoit (les octets inchangés, des sommes de contrôle valides sur chaque phrase y compris celles réécrites, GGA et RMC concordantes, un PKSHT par cycle avec le champ de barrière là où le point est invalide), et le script de bout en bout vérifie qu'un consommateur de l'écouteur de la barrière reçoit exactement les octets que cette même barrière écrit sur la sortie standard. ({ "4" }) Les analyseurs PKSHT (JavaScript et C++) sont exécutés sur des phrases enregistrées à partir de la sortie de kshana et rejettent une somme de contrôle, une version ou un score erronés hors de l'intervalle { "0" } à { "100" }. ({ "5" }) Les unités systemd sont vérifiées avec systemd-analyze verify (systemd { "255" }, binaires remplacés par des bouchons) et avec des garde-fous contre un shell dans ExecStart, sur la politique de redémarrage et sur les clés du bac à sable ; la gestion des arguments du point d'entrée du conteneur est vérifiée avec un binaire factice. CE QUI NE L'EST PAS : il n'existe aucune référence indépendante externe pour une valeur quelconque affichée par ces intégrations. Les valeurs de confiance elles-mêmes sont les lignes ci-dessus, et une exécution d'intégration montre seulement que la tuyauterie les transporte ; c'est pourquoi cette ligne est MODELLED et non VALIDATED (docs/VALIDATION.md). Aucun navire réel, aucun récepteur, aucune longue exécution, aucune autre version de l'un ou l'autre hôte, aucun autre système d'exploitation ou bureau n'a été utilisé ; toutes les données sont du texte synthétique et rien ici n'est une mesure. Le traitement sonore et visuel de la notification par un vrai client Signal K, le bouton de barre d'outils d'OpenCPN, les préférences et l'état périmé, ainsi que le paquetage pour le gestionnaire de greffons d'OpenCPN n'ont pas été exercés. Les clés du bac à sable systemd n'ont été vérifiées que pour la syntaxe, sans être exécutées sous un systemd en fonctionnement, et la construction de l'image du conteneur et son contrôle de santé n'ont ici aucune preuve versée. Aucun chiffre de détection ou de fausses alarmes n'est revendiqué. Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) : l'opérateur reste responsable de la navigation du navire.

# text
seg-89ab9ef155eb = Suivi BOC({ "1,1" }) : mise à l'échelle du DLL et résolution d'ambiguïté par saut de bosse (optionnel)

# text
seg-ef24be9b5917 = Le champ boc de iq::track::LoopConfig (optionnel, None par défaut) : les trois discriminateurs du DLL remis à l'échelle pour lire l'erreur de code en chips avec une pente unitaire sur le pic principal du BOC({ "1,1" }) en sinus, et un moniteur de saut de bosse sur les corrélateurs très en avance et très en retard à une demi-période de sous-porteuse ({ "0.5" } chip) qui fait sauter le NCO de code vers le pic principal lorsqu'un compteur haut/bas atteint N ({ "8" } par défaut). Sans l'option, toutes les sorties sont inchangées.

# text
seg-416ce4dfc6f5 = Cohérence interne par rapport à une vérité injectée et à des formes closes, sous des seuils préenregistrés à 6b68f6cc (docs/design/evidence/boc-bump-jump/). Un signal de données BeiDou B1C (PRN { "19" }, { "5" } MS/s) généré par iq::scene : avec l'option désactivée, un départ sur un pic latéral reste accroché à tort à ±({ "0.5" } + d/4) chip prédit (±{ "0.549" } mesuré) ; avec l'option activée, un saut vers le pic principal à { "0.08" } s et une RMS en fenêtre tardive de { "0.0008" } chip à { "45" } dB-Hz et de { "0.0048" } chip à { "35" } dB-Hz ; aucun saut depuis le pic principal à { "35" }, { "40" } et { "45" } dB-Hz sur { "4" } s ; la pente EMLP mise à l'échelle de { "0.94" } à { "0.99" } sur le signal échantillonné (non mise à l'échelle de { "3.6" } à { "3.8" }). Le détecteur de saut de bosse seul, sur des triplets de corrélateurs avec la covariance de bruit exacte du BOC({ "1,1" }), n'a produit aucun faux saut en { "100 000" } mises à jour de { "25" } à { "45" } dB-Hz et a détecté { "1000" } départs sur pic latéral sur { "1000" } à { "35" } dB-Hz. NOT MET (constat F1) : la grille de tests unitaires préenregistrée pour la mise à l'échelle inclut des décalages hors de la plage linéaire des discriminateurs, où les lectures mises à l'échelle manquent le décalage jusqu'à { "48" } %. CE QUI N'EST PAS VÉRIFIÉ : l'IQ de terrain, les chaînes d'entrée à bande limitée, les répliques composites MBOC/QMBOC, et tout récepteur externe.

# text
seg-2c32955cbfb3 = Canal de scintillation ionosphérique IQ (modèle de Cornell) par rapport à une scintillation GPS L1 mesurée à { "50" } Hz

# text
seg-2fdcb373ab25 = iq::channel::scint, le modèle de scintillation de Cornell (intensité de Rice, spectre de Butterworth du second ordre, phase arg z) piloté au S4 et au temps de décorrélation de l'intensité d'une fenêtre mesurée, comparé sur ce qu'il génère au-delà de ces deux entrées ; realdata::scint50 lit le journal mesuré, en retire la tendance et exécute la comparaison.

# text
seg-bdc9fe963c5c = Données mesurées sous des seuils préenregistrés à b6ccb499 (xval/scint-malindi/) : enregistrement Zenodo { "16941224" } (INGV, Malindi, { "18" } mars { "2023" }, GPS PRN { "26" }, intensité et phase de la porteuse à { "50" } Hz, CC BY { "4.0" }, SHA-256 vérifié). { "22" } fenêtres de { "60" } s éligibles (N1 atteint). MET : la distribution de l'intensité (Kolmogorov-Smirnov D { "0.0415" }, seuil { "0.05" }) et la scintillation de phase liée à S4 (sigma-phi mesuré/modèle médian { "0.779" }, seuil 2/3 à 3/2). NOT MET (constat F1) : la fraction d'évanouissements profonds du modèle vaut { "2.38" } fois la mesurée (seuil { "0.5" } à { "2" }) et son évanouissement moyen dure { "3.51" } fois plus longtemps (seuil 2/3 à 3/2). Constat F2 : le traitement enregistré lit la phase repliée du modèle, ce qu'une autovérification a révélé ; B3 répété a posteriori avec la phase dépliée donne { "0.804" }. CE QUI N'EST PAS VÉRIFIÉ : d'autres nuits, stations, latitudes ou signaux ; le bruit du récepteur dans le modèle. La ligne reste MODELLED.

# text
seg-160507ac3702 = Option CFAR à moyennage de cellules dans l'acquisition IQ

# text
seg-7c0a1adc9ae6 = iq::acq::ca_cfar et ca_cfar_cells (optionnel) : une cellule d'une grille d'acquisition est comparée à la moyenne de cellules de référence de sa rangée Doppler (retards de garde et de pas, avec rebouclage sur la période), à un facteur alpha fixé à partir de la probabilité de fausse alarme CA-CFAR en forme close pour M blocs non cohérents (ca_cfar_pfa, ca_cfar_alpha). Le détecteur à puissance d'échantillon reste le choix par défaut et toutes les sorties existantes sont inchangées.

# text
seg-ba35daac2aed = Forme close, sous des seuils préenregistrés à 3724aefa (docs/design/evidence/acq-cfar/). La probabilité de fausse alarme CA-CFAR pour des cellules Gamma(M), par rapport à un Monte Carlo du modèle exact : { "18" } cas sur { "18" } à moins de { "3" } sigma binomiaux. Sur chaque cellule des recherches iq::acq (GPS L1 C/A, { "2.5" } MS/s, { "210 000" } cellules chacune) à une valeur de conception de { "1" } % : { "0.977" } % et { "0.969" } % sur bruit gaussien et { "1.006" } % et { "0.999" } % sur bruit quantifié sur 2 bits (M = { "1" } et { "4" } ; seuil de plus ou moins { "20" } %) ; décisions inchangées lorsque l'entrée est mise à l'échelle. NOT MET (constat F1) : sur un signal sur 2 bits sans bruit, la détection et sa cellule sont correctes, mais { "1.28" } % des cellules hors pic de la rangée du pic (seuil { "1" } %) dépassent le seuil, aux lobes secondaires de corrélation déterministes du code. CE QUI N'EST PAS VÉRIFIÉ : d'autres variantes CFAR, les fenêtres bidimensionnelles, les chaînes d'entrée à bande limitée, les données de terrain.

# text
seg-5bd3bf0c22a7 = Modèle de spectre : bandes GLONASS, BeiDou et Galileo E6 (optionnel)

# text
seg-9c16189c63ac = spectrum::default_band résout, par le nom seulement (MORE_BAND_NAMES), GLONASS L1OF et L2OF sur chaque canal FDMA K = -7 à { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a et B3I (BPSK({ "10" })) et Galileo E6 (BPSK({ "5" })), avec les porteuses et les puissances reçues minimales de leurs documents de contrôle d'interface ; l'ensemble de bandes par défaut et toutes les sorties existantes sont inchangés.

# text
seg-6d674bc4b40a = Documents de contrôle d'interface publiés et formes closes, sous des seuils préenregistrés à 5806f28b (docs/design/evidence/spectrum-bands/) : GLONASS ICD Edition { "5.1" }, BDS-SIS-ICD B1I { "3.0" }, B1C { "1.0" }, B2a { "1.0" } et B3I { "1.0" }, Galileo OS SIS ICD Issue { "2.1" }. MET : chaque porteuse, chaque débit de chips et chaque puissance reçue tels que transcrits ({ "28" } canaux GLONASS), les premiers zéros du BPSK au débit de chips, le composite B1C égal à MBOC(6,1,1/11) comme le donne la table de puissance de son ICD, l'identité du chemin C/N0, et des scénarios de spectre identiques à l'octet près. NOT MET : le seuil d'aire unitaire, qui était inatteignable tel qu'écrit (constat F1 ; les aires égalent la fraction en bande en forme close), et l'accord par bin des formes d'onde B1I et B1C de la couche IQ avec l'enveloppe du modèle ({ "1.26" } et { "1.56" } dB contre { "0.5" } dB, constat F2 ; GLONASS { "0.07" } dB), parce que les codes de Gold et de Weil ont des spectres de raies inégaux ; moyennés sur la bande, les lobes principaux concordent à { "0.25" } dB près. CE QUI N'EST PAS VÉRIFIÉ : l'IQ enregistré, d'autres signaux, l'interférence intra-système.

# text
seg-63b7da996265 = Codes de télémétrie primaires BeiDou B1I par rapport à un générateur indépendant

# text
seg-64bb9bbe6629 = iq::signals::beidou::b1i_bits et b1i : les codes de Gold BDS-SIS-ICD-B1I-3.0 tronqués à { "2046" } chips, PRN { "1" } à { "63" }, tels que la couche IQ les génère, les acquiert et les suit.

# text
seg-690d6ea43d80 = GNSS-SDR { "v0.0.19" } (étiquette { "v0.0.19" }, commit 1ddd4562), une implémentation open source indépendante du même ICD : son beidou_b1i_code_gen_int, compilé de façon autonome, a généré les { "63" } codes. Seule sa sortie de programme est versée : tests/fixtures/iq_signals/beidou_b1i_gnss_sdr.txt, un préfixe de 64 chips et le SHA-256 de chaque code de 2046 chips. Cette sortie correspond aux codes PRN BeiDou B1I que définit le BDS-SIS-ICD-B1I-3.0 public ; aucun code source ni binaire de GNSS-SDR n'est dans le dépôt. Seuil préenregistré à 911106d1 (xval/beidou-b1i-gnss-sdr/) : les { "2046" } chips des { "63" } PRN tous identiques, sans inversion, décalage ni réétiquetage. Résultat : { "63" } sur { "63" } identiques ; la fixture a été régénérée à partir d'une copie neuve de { "v0.0.19" } (SHA-256 du fichier source tel qu'enregistré) et est identique à l'octet près. CE QUI N'EST PAS VÉRIFIÉ : le code secondaire NH20, la liste des PRN GEO, la porteuse et le débit de chips.

# text
seg-b4787b04338e = Codes de télémétrie et de recouvrement GPS L1C par rapport aux colonnes de contrôle imprimées de l'IS-GPS-800J

# text
seg-708967246fd8 = iq::signals::gps::l1c_p_bits, l1c_d_bits et l1c_o_bits : les codes de télémétrie de Weil L1CP et L1CD (séquence de Legendre calculée, indice de Weil, séquence d'expansion insérée avant le chip p) et les codes de recouvrement S1 L1CO, PRN { "1" } à { "63" }.

# text
seg-3f4bbdd3666b = IS-GPS-800J (01-AUG-2022, distribution statement A), les colonnes de contrôle qu'il imprime à côté des paramètres du générateur : Table 3.2-2 les { "24" } premiers et derniers chips de chaque code L1CP et L1CD, Table 3.2-3 les { "11" } premiers et derniers bits de chaque code L1CO, Table 6.2-1 la séquence de Legendre de longueur 10223 ; transcrites par scripts/extract_is_gps_800_tables.py à partir du PDF (SHA-256 c4aad710...). Seuils préenregistrés à fe372e26 (docs/design/evidence/l1c-codes/) : { "252" } colonnes sur { "252" }, { "63" } recouvrements sur { "63" } et { "10 223" } bits de Legendre sur { "10 223" } identiques ; l'extraction --check réussit ; un contrôle négatif fait échouer les codes réétiquetés, inversés et décalés. CE QUI N'EST PAS VÉRIFIÉ : les paramètres du générateur eux-mêmes (ils proviennent des mêmes tables), les chips entre les colonnes imprimées, le motif de sous-porteuse TMBOC et les codes L1CO S2.

# text
seg-5cba09089e09 = Codes primaires LunaNet AFS-I et AFS-Q par rapport aux colonnes de contrôle imprimées de la LSIS-AFS V1.0

# text
seg-c8ad32b783bd = iq::signals::lunanet::afs_i_bits et afs_q_primary_bits (noms de signaux lunanet-afs-i et lunanet-afs-q dans kshana iq) : le code de Gold AFS-I ({ "2047" } raccourci cycliquement à { "2046" }, G2 retardé par PRN) et le code primaire de Weil AFS-Q (séquence de Legendre calculée, indice de Weil, séquence d'expansion insérée avant le chip p), PRN { "1" } à { "210" }.

# text
seg-330ed84e8e78 = Par rapport aux tables imprimées de la LSIS-AFS V1.0 (marquées TBC dans la spécification) : LunaNet Interoperability Specification V5, Applicable Document { "1" } Volume A : LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS-AFS) V1.0, { "29" } janvier { "2025" } (NASA ; SHA-256 du PDF { "986e0795" }...), les colonnes de contrôle qu'elle imprime à côté des paramètres du générateur : Tables C-1 à C-5 et D-2 à D-6 les { "24" } premiers et derniers chips de chaque code AFS-I et AFS-Q, Table D-1 la séquence de Legendre de longueur 10223 ; extraites par scripts/extract_lunanet_afs_tables.py (xval/lunanet-afs/oracle/). Seuils préenregistrés à b3ba5d5 (xval/lunanet-afs/PREREGISTRATION.md) avant l'existence du générateur : B1 { "420" } sur { "420" }, B2 identique, B3 { "420" } sur { "420" }. Le document marque ses tables de codes { "{" }LSIS-TBC{ "}" } et indique qu'elles sont destinées uniquement à l'essai et à l'intégration, de sorte que cela valide la construction par rapport aux tables de cette édition, et non d'une édition ultérieure. Une affirmation préenregistrée sur l'état initial imprimé de G2 (B1b) a été énoncée avec le mauvais sens et est NOT MET ({ "0" } sur { "210" }), épinglée ; la relation corrigée ({ "2047" } moins le retard) tient pour { "210" } sur { "210" } et est consignée comme a posteriori. CE QUI N'EST PAS VÉRIFIÉ : les paramètres du générateur eux-mêmes (mêmes tables), les chips entre les colonnes imprimées, le code tertiaire, la couche de messages et le codage LDPC.

# text
seg-7b1ae0c7ca28 = Codes tertiaires LunaNet AFS et couche de messages (SB1 BCH, CRC-24Q, entrelaceur) par rapport à la LSIS-AFS V1.0

# text
seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered ; iq::lunanet_afs : motif de synchronisation, codeur SB1 BCH({ "51,8" }) et décodeur à 256 hypothèses, CRC-24Q, l'entrelaceur par blocs { "60" } x { "98" }, un vérificateur de flux de symboles (kshana lunanet-afs-check) et un générateur de flux de test avec des sous-trames de remplacement. Le codage LDPC de rendement 1/2 des sous-trames { "2" } à { "4" } n'est pas implémenté (ses matrices figurent dans une annexe séparée).

# text
seg-b6f39f180fdd = LSIS-AFS V1.0 (comme ci-dessus) : la séquence de Legendre de longueur 1499 (Table E-1, identique) et les { "24" } premiers et derniers chips tertiaires (Tables E-2 à E-6 : { "419" } colonnes sur { "420" } identiques ; le document imprime les mêmes { "24" } derniers chips, A14850, pour le PRN { "147" } et le PRN { "151" } et le générateur reproduit celui du PRN { "151" }, de sorte que l'entrée du PRN { "147" } est très probablement une coquille ; le seuil de { "420" } sur { "420" } est NOT MET et l'écart est épinglé) ; l'exemple traité de la Figure { "8" } du code SB1 (un exemple : 0x045 est encodé en 0x229F61DBB84A0) ; le CRC-24Q par rapport à la valeur de contrôle du catalogue 0xCDE703 pour l'ASCII { "123456789" } ; l'arithmétique de trame propre au document. Seuils préenregistrés à b3ba5d5. Un écart consigné et un seul exemple traité pour la couche de messages, de sorte que la ligne reste MODELLED. CE QUI N'EST PAS VÉRIFIÉ : le LDPC et les mots CRC dans les sous-trames { "2" } à { "4" }, le contenu des messages, et tout flux enregistré

# text
seg-0d7b17524c04 = Paquets de normes : scénarios notés par rapport à des seuils énoncés avant l'exécution

# text
seg-6e5c04fd4531 = standards_pack (kshana standards-pack) : les profils d'essai du cadre DHS Resilient PNT pour les niveaux { "1" } à { "4" }, les niveaux de précision et l'évaluation de l'intégrité de l'IMO MSC.1/Circ.1575, et les paquets surveiller, évaluer et atténuer de l'ICAO Doc { "9849" } Appendix F : chaque essai exécute un type de scénario fourni et compare les champs de résultat à des seuils énoncés dans le paquet, et les essais qui exigent un journal de récepteur sont listés comme NEEDS INPUT et non notés.

# text
seg-d9ea966abdd6 = Aucune référence externe pour les résultats de scénario : chaque essai du paquet exécute un type de scénario MODELLED. Les seuils sont le profil énoncé par l'auteur du paquet (le cadre DHS n'énonce aucune valeur ; les limites de précision de l'IMO sont la Table C-1 de MSC.1/Circ.1575, lue en entier ; le paquet ICAO suit la propre présentation du plan d'atténuation des RFI de l'ICAO parce que le Doc { "9849" } est une publication payante et n'a pas été lu), versés avant toute exécution notée dans des fichiers PREREGISTRATION.md de style xval sous standards/. Un seuil MET dit qu'un scénario modélisé a atteint un seuil énoncé, et rien au sujet d'un produit

# text
seg-8a8f2c85e0c3 = Paquet de preuves d'aller-retour en laboratoire (scénario, conditions d'essai, journal de récepteur, score)

# text
seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) et l'export de journal de récepteur kshana.test-conditions/1 de kshana bench-export : un paquet signé qui consigne le hachage du scénario, le hachage des conditions énoncées, le hachage du journal et le score par rapport aux événements énoncés, et qui refuse des conditions en désaccord avec les événements de notation ou un journal dont le hachage n'est pas celui énoncé. Aucun signal n'est écrit, rejoué ni planifié.

# text
seg-76da58fe670a = Aucune référence externe : le paquet relie des hachages et un score de journal de récepteur MODELLED, vérifiés sur des données synthétiques (le NMEA exporté d'un scénario fourni, traité comme le journal du récepteur). Aucune exécution en laboratoire n'est revendiquée

# text
seg-a9189e4fe413 = Moteur de suivi IQ par rapport à GNSS-SDR { "0.0.19" } sur des enregistrements indépendants

# text
seg-364de05e5b1b = Le moteur de suivi complet de la couche IQ (iq::track via kshana iq track : passation d'acquisition, corrélateurs, NCO, PLL de Costas du second ordre à { "15" } Hz, DLL à enveloppe EML du premier ordre à { "2" } Hz asservi à la porteuse, indicateur de verrouillage et estimateurs de C/N0) sur GPS L1 C/A de { "30" } à { "45" } dB-Hz.

# text
seg-c2a8434c32a8 = GNSS-SDR { "0.0.19" } (GPL-3.0-or-later, le paquet Ubuntu { "24.04" }, exécuté comme programme séparé ; seuls les nombres dérivés sont versés) suivant les mêmes enregistrements numpy (indépendants du moteur), tous deux mesurés par rapport à la vérité analytique. Seuils préenregistrés à 48edd4a5, amendés avant tout enregistrement de test à 1e4288c4 (une FLL à { "10" } Hz pendant la seule phase d'accrochage dans les deux récepteurs, après l'échec de l'étalonnage enregistré sur une passation GNSS-SDR erronée, constat F3). MET à { "30" }, { "35" }, { "40" } et { "45" } dB-Hz : gigue de porteuse à moins de { "4.3" } %, gigue de code à moins de { "4.6" } % et moyenne et dispersion Doppler à ceux de GNSS-SDR. NOT MET : le C/N0 NWPR du moteur lit de { "2.3" } à { "7.1" } dB sous le SNV de GNSS-SDR (constat F4, la limite connue du NWPR ; son M2M4 est à moins de { "0.06" } dB de la vérité) ; les indicateurs de verrouillage de phase diffèrent par définition (F5) ; à { "30" } dB-Hz GNSS-SDR a décroché deux fois et le moteur non (F6). La propre passation de GNSS-SDR s'est verrouillée sur une mauvaise fréquence dans { "3" } exécutions d'étalonnage sur { "30" }. CE QUI N'EST PAS VÉRIFIÉ : d'autres signaux, le retrait des bits de données, la réacquisition, les enregistrements de terrain. La ligne reste MODELLED.

# text
seg-259d201c2ff8 = Gains d'antenne CRPA dans le type de scénario jamming par rapport à un recalcul numpy indépendant

# text
seg-192144c57783 = La section facultative [crpa] du type de scénario jamming : un faisceau par canal vers chaque satellite (annulation dirigée avec le brouilleur comme nul, ou MVDR sur sigma^{ "2" } I + P_j a_j a_j^H), mettant à l'échelle le bruit de chaque liaison par ||w||^{ "2" } et le brouilleur par |w^H a_j|^{ "2" } avant l'équation C/N0 anti-brouillage existante.

# text
seg-232d040b575d = Un recalcul numpy indépendant (xval/crpa-jamming/oracle.py, sans code partagé : vecteurs de pointage numpy, numpy.linalg.solve et inv) de chaque liaison de la géométrie jamming-demo avec un réseau carré à 4 éléments, sous les deux pondérations. Seuils préenregistrés à 08d83b4d. MET : A1 (les { "150" } résultats de scénario identiques à l'octet près sans la section, après une correction : la première construction avait ajouté les unités crpa à la table d'unités de chaque exécution de brouillage), A2 (un élément égale l'absence de réseau à { "1e-12" } dB), A3 sur le gain de bruit du réseau et le C/N0 effectif ({ "912" } pondérations de liaison à moins de { "1e-9" } dB, pire { "2.1e-14" } dB) et sur le nul du brouilleur en annulation dirigée (sous -200 dB des deux côtés), A4 (MVDR à moins de { "0.1" } dB de l'annulation dirigée à un JNR de { "80" } dB). NOT MET : A3 sur le gain du brouilleur en MVDR, { "194" } liaisons sur { "456" } au-delà de { "1e-9" } dB sur { "0.36" } de mathématiques portables ({ "202" } sur mathématiques de l'hôte ; docs/revisions/STUDIO15-batch4-rebaseline.md) (pire { "1.7e-6" } dB) sur des résidus de -100 à -188 dB, où la perte de chiffres significatifs en float64 limite les deux implémentations (inv et solve de numpy sont en désaccord entre eux sur { "169" } liaisons, pire { "7.9e-7" } dB) ; le C/N0 effectif qu'ils alimentent n'est pas affecté. CE QUI N'EST PAS VÉRIFIÉ : le couplage mutuel, le défaut d'appariement des éléments, le traitement à large bande, les brouilleurs multiples, tout matériel d'antenne. Un recalcul des mêmes équations, et non une référence externe indépendante ; la ligne reste MODELLED.

# text
seg-a2f34cff9338 = Masquage du brouilleur par le relief dans le type de scénario jamming par rapport à un recalcul numpy indépendant sur une vraie tuile SRTM

# text
seg-334c569d9cae = La section facultative [terrain] du type de scénario jamming : le profil de terrain le long du grand cercle entre le brouilleur et le récepteur sur une tuile SRTM .hgt avec un bombement terrestre à facteur k, l'arête en lame de couteau dominante (plus grand nu de Fresnel-Kirchhoff) et la perte d'une seule arête en lame de couteau de l'ITU-R P.526-15 section { "4.1" }, soustraite de la puissance reçue du brouilleur.

# text
seg-615ea67dd756 = Un recalcul numpy indépendant (xval/jamming-terrain/oracle.py, sans code partagé : sa propre lecture .hgt, interpolation bilinéaire, aller-retour WGS { "84" }, profil, bombement, nu et J(nu)) de dix emplacements de brouilleur autour d'un récepteur à Badwater Basin sur la vraie tuile SRTM versée tests/fixtures/terrain/N36W117_sub6.hgt. Seuils et emplacements préenregistrés à 92cd2bfd. Tous MET : additivité (les { "150" } résultats de scénario identiques à l'octet près sans la section) ; les points de profil et l'obstacle de chaque emplacement égaux, et nu et perte à moins de { "1.6e-10" } (seuil { "1e-9" }) ; la perte ne croît jamais lorsque le brouilleur s'élève de { "2" } à { "4902" } m ; la perte abaisse chaque J/S exactement d'elle-même et de rien d'autre ; J(nu) à moins de { "1e-12" } dB de celui de la référence indépendante. Constats : les emplacements de l'autre côté des monts Black et Funeral perdent de { "44" } à { "48" } dB ; deux emplacements en fond de vallée perdent { "8" } et { "15" } dB par le seul bombement terrestre à des hauteurs d'antenne de { "2" } m, le cas rasant du modèle à une seule arête en lame de couteau. CE QUI N'EST PAS VÉRIFIÉ : toute propagation mesurée, la diffraction à arêtes multiples, la réflexion au sol, l'encombrement du terrain, l'erreur propre du MNT. Un recalcul du même modèle, et non une référence externe indépendante ; la ligne reste MODELLED.

# text
seg-825c121c7512 = Hystérésis d'acquisition et quantificateur de la chaîne d'entrée dans le type de scénario jamming par rapport à des recalculs indépendants

# text
seg-f7207263d881 = La section facultative [acquisition] du type de scénario jamming (un satellite est acquis à un seuil d'acquisition ou au-delà après un délai de réacquisition et conservé tant qu'il est au seuil de poursuite ou au-delà) et sa section [front_end] (la lecture AGC { "10" } log10({ "1" } + J/N) et la perte du quantificateur du CAN pour une entrée gaussienne retirées de chaque liaison, signalées comme non valides pour les brouilleurs non gaussiens).

# text
seg-6abc60ee9ec4 = Un recalcul Python indépendant de chaque indicateur d'acquisition (xval/jamming-acq-agc/hysteresis.py) à partir du C/N0 effectif par époque du moteur, un Monte Carlo numpy indépendant de la perte du quantificateur (xval/jamming-acq-agc/quantiser_mc.py, sa propre recherche du pas optimal, { "2" }^{ "22" } échantillons), et la boucle AGC de la couche IQ. Seuils préenregistrés à 70c72fcc, avec un jeu d'exécutions supplémentaire à { "37793290" }. MET : additivité (les { "150" } résultats de scénario identiques à l'octet près sans les sections) ; chaque indicateur égal sur les exécutions supplémentaires ({ "1824" } liaisons, dont { "732" } montrant l'hystérésis) ; monotone selon le seuil ; la perte du quantificateur à moins de { "0.0007" } dB du Monte Carlo de { "1" } à { "4" } bits (seuil { "0.02" } dB) ; la lecture AGC à moins de { "0.012" } dB de la boucle AGC (seuil { "0.05" } dB). NOT MET : les exécutions d'hystérésis enregistrées (jamming-demo de { "10" } à { "30" } dBW) n'étaient pas informatives, toutes les liaisons étant perdues, et leurs H2 et H4 ne sont atteints que trivialement. Constat : avec un brouilleur CW, un CAN à 1 bit perd environ { "5" } dB de plus que le chiffre gaussien que le moteur applique, et le signale comme non valide. CE QUI N'EST PAS VÉRIFIÉ : la recherche d'acquisition elle-même, la dynamique de l'AGC dans le temps, tout matériel de récepteur. Recalculs du même modèle, et non une référence externe indépendante ; la ligne reste MODELLED.

# text
seg-9c46f1c76486 = Accrochage FLL plafonné en dessous du plancher de passation FLL vers PLL de la conception par défaut (optionnel)

# text
seg-efa1d1a9e904 = L'option carrier.fll_pull_in_max_s de iq::track (le champ fll_pull_in_max_s de iq::track::LoopConfig) : avec fll_assist = pull-in, la FLL passe la main à la PLL après une durée d'accrochage fixe quel que soit le PLI, avec un temps de retour correspondant jusqu'à ce que le PLI atteigne pour la première fois fll_off_pli.

# text
seg-76cce58eaddd = Cohérence interne par rapport à une vérité injectée : une source synthétique GPS L1 C/A sans données (PRN { "13" }, { "1500" } Hz, { "4.1" } MHz, { "8" } s, dix germes de bruit) dont la phase de la porteuse est connue, sous des seuils préenregistrés à 58789af0 (docs/design/evidence/fll-handover-floor/). MET : le témoin (la valeur par défaut sans plafond ne passe jamais la main dans { "9" } germes sur { "10" } à { "33" } dB-Hz) ; additivité (hachage par défaut et tests de suivi existants inchangés) ; accrochage d'une passation décalée de { "100" } Hz à { "45" } dB-Hz. NOT MET : avec un plafond de { "1.0" } s, passation et maintien dans chaque exécution ({ "16" } sur { "20" } à { "33" } dB-Hz, { "8" } sur { "20" } à { "31" } dB-Hz ; les autres alternent entre des passations forcées et le retour de la FLL) et gigue de phase à moins de { "25" } % de la PLL seule ({ "10.8" } contre { "6.1" } degrés à { "33" } dB-Hz). CE QUI N'EST PAS VÉRIFIÉ : les bits de données, d'autres signaux et fréquences d'échantillonnage, les enregistrements de terrain. La valeur par défaut est inchangée ; la ligne reste MODELLED.

# text
seg-ac0f97e945a7 = Lecteur de solutions RTKLIB .pos pour receiver-trust

# text
seg-0b8bc2c89de4 = Lit un fichier de solution RTKLIB (heure calendaire ou semaine GPS/TOW, position latitude/longitude ou ECEF, satellites utilisés) dans la chronologie receiver-trust (receiver_trust::machines::rtklib).

# text
seg-3de364392f92 = Aucune référence externe : aucun fichier produit par RTKLIB n'a été lu, et la disposition des colonnes provient du manuel de RTKLIB. Vérifié sur des fichiers écrits par nous seulement ; la conversion ECEF réutilise frames::ecef_to_geodetic, qui a ses propres lignes

# text
seg-849393517c04 = Journaux NovAtel OEM7 ASCII et binaires (BESTPOS, RANGE, RXSTATUS) pour receiver-trust

# text
seg-7e0021922025 = Lit BESTPOS (position), RANGE (C/No par signal) et RXSTATUS (l'indicateur de brouilleur du récepteur, comme auto-déclaration de l'époque) à partir de journaux OEM7 ASCII et binaires, avec contrôle CRC, en lecture seule (receiver_trust::machines::novatel).

# text
seg-1f7c6d1009a8 = Aucune référence externe comme seuil de réussite. Les dispositions des champs et le CRC suivent la documentation publique OEM7 (docs.novatel.com) ; la routine CRC a été vérifiée une fois par rapport au CRC que la documentation indique pour son propre exemple BESTPOSA (cité, non reproduit). Les fixtures sont écrites par nous ; aucun journal d'un vrai récepteur n'a été lu

# text
seg-a45c53a9deb3 = Lecteur de rapport porteuse sur bruit RTCM { "3" } MSM4 et MSM7 pour receiver-trust

# text
seg-0a0c9976236f = Lit le C/N0 de chaque cellule de signal des messages RTCM { "3" } MSM4 et MSM7 (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) à partir d'un flux de trames, avec contrôle CRC-24Q (receiver_trust::machines::rtcm3). Dispositions tirées des tables pyrtcm sous licence BSD, et non du texte de la norme RTCM.

# text
seg-2af6fc1abe98 = ReferenceImpl dans une vérification ponctuelle, et non un test de la suite : le décodeur de pyrtcm { "1.2.0" } lit les mêmes trames écrites par nous avec le même C/N0 et la même heure d'époque. Il partage la source de ses tables avec ce lecteur, de sorte qu'il vérifie le traitement des bits, et non la disposition. Aucune capture d'un vrai récepteur ou d'une vraie station de base n'a été lue

# text
seg-cd554a7c1649 = Adaptateur de moniteur GNSS-SDR pour receiver-trust

# text
seg-22b587ac642d = Lit les messages GNSS-SDR Monitor (Gnss_Synchro) et PVT-monitor, relayés en lignes JSON avec les noms de champs proto, dans le C/N0 par canal, le point, les satellites utilisés, le HDOP et le ciel (receiver_trust::machines::gnss_sdr ; integrations/gnss-sdr/relay.py).

# text
seg-d22aed9d9a16 = Aucune référence externe : les noms de champs proviennent de la documentation de GNSS-SDR ; ni le lecteur ni relay.py n'ont été exécutés avec un GNSS-SDR en direct ou une vraie capture

# text
seg-217e5953c128 = Ingestion de journaux IMU, entrée de cap par gyromètre et ajustement d'Allan des paramètres de capteurs hybrides

# text
seg-9dadc819daef = Lit un CSV d'IMU (colonnes documentées, ou disposition EuRoC) ; intègre la vitesse de lacet en le cap que lit le moniteur cap-route ([log.imu]) ; et ajuste les paramètres de bruit de l'accéléromètre et du gyromètre des scénarios hybrides et de fusion à partir d'un journal à l'arrêt par déviation d'Allan à recouvrement (imu-fit).

# text
seg-9099f3467e9e = Aucune référence externe : l'ajustement est vérifié sur des journaux synthétiques de bruit blanc à coefficients connus, le cap sur des journaux à vitesse de lacet constante. Aucun journal d'IMU réel n'a été ajusté, et q_aa n'est pas ajusté

# text
seg-15a852a2dcb0 = Découverte MQTT Home Assistant et exportateur d'état pour la télémétrie de confiance

# text
seg-6d6b07b26966 = Un document d'état JSON et des messages de découverte MQTT Home Assistant pour le flux de confiance, imprimés en texte sur chaque surface et publiés en MQTT { "3.1.1" } QoS { "0" } par la CLI (telemetry::mqtt ; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

# text
seg-79a8f3864af3 = Aucune référence externe : les paquets ont été lus par un écouteur en boucle locale écrit pour le test, et non par un vrai courtier, et Home Assistant n'a pas été exécuté

# text
seg-68caf86157c2 = Paquet ROS { "2" } receiver-trust et passerelle gnss_lib_py

# text
seg-e7d7d99fe538 = Une passerelle sans ROS qui écrit des messages de point et de satellites en NMEA et les note par la liaison Python (integrations/ros2/kshana_trust), et une passerelle de NavData gnss_lib_py vers receiver-trust par le format rtklib-pos (integrations/gnss_lib_py).

# text
seg-05ded40b17d2 = Aucune référence externe : le nœud ROS n'a pas été exécuté sur un graphe ROS { "2" } en direct, et les noms de champs de ublox_ubx_msgs n'ont pas été vérifiés avec un pilote en fonctionnement. gnss_lib_py (MIT) a été exécuté pour le test de la passerelle

# text
seg-c3c260b7063e = Tests

# text
seg-33d506570c1b = srp_shadow::tests (la forme fermée annulaire, la loi uniforme reproduisant l'ombre conique, les limites de plein soleil et d'ombre)

# text
seg-13f8f557c721 = propagator (ForceModel::with_ephemeris, ForceEphemeris), ephem_provider

# text
seg-20f163c0cb8f = tests/propagator_de440_orekit_oracle.rs ({ "5" } cas x { "25" } états horaires sur { "24" } h, LEO, GEO et HEO, troisième corps et troisième corps + SRP : pire |dr| { "0.0170" } m, |dv| { "1.84e-5" } m/s ; le contrôle à série analytique manque de { "9.96" } m ; Soleil { "6.39" } m et Lune { "0.244" } m par rapport aux positions DE440 d'Orekit, un manque consigné) ; tests unitaires du propagateur (refus du fournisseur, comptage des replis partagé entre les clones)

# text
seg-448f4acf5c7b = tides, propagator, precise_od

# text
seg-4014447d4bcc = tides::tests (le terme S1 est diurne, tourne de { "90" } deg en un quart de jour, et a l'amplitude du facteur de charge de chaque ligne ; ordre de grandeur physique en LEO) ; propagator::tests::the_s1_air_tide_flag_adds_exactly_the_s1_acceleration

# text
seg-8fda2ee90583 = gravity_sh, propagator (FieldEvaluator)

# text
seg-3f7d3003656e = tests/gravity_sh_high_degree.rs (Orekit en { "8" } points hors axe : max |da| { "2.2e-17" } m/s^{ "2" } à N = { "70" }, toujours exécuté ; { "3.5e-17" }, { "3.9e-17" } et { "7.3e-17" } m/s^{ "2" } à N = { "200" }, { "360" }, { "2190" }, conditionné par les données sur KSHANA_EGM2008_GFC) ; tests/cowell_tesseral_200_orekit_oracle.rs (orbite de { "24" } h 200x200, conditionnée par les données : pire |dr| { "0.1317" } m, |dv| { "1.45e-4" } m/s ; contrôle de degré 70 { "0.726" } m) ; tests unitaires de gravity_sh (concordance avec l'évaluateur classique à { "1e-13" } au degré { "70" }, différence finie et continuité au pôle sur un champ de degré 2190, un terme de degré 2190 en sous-dépassement par rapport à un calcul à exposant étendu)

# text
seg-296a6fe8585b = orbit_determination (determine_orbit_batch_tracking, propagate_with_stm, is_visible), batch_ls (gauss_newton_analytic)

# text
seg-9493e02e3cd1 = tests/od_tracking_measurements_reference.rs ({ "8" } scénarios : taux de distance, az/el et mixte, LEO et MEO, sans bruit et sigma à graine { "5" } m / { "5" } mm/s / { "1e-4" } rad, masques de { "5" } et { "10" } deg, par rapport à Orekit { "12.2" } : ensembles visibles identiques ; valeurs de mesure à { "5.84e-8" } m, { "6.30e-10" } m/s, { "1.44e-13" } rad près ; STM à { "1.2e-14" } relatif près ; états bruités à { "1.74" } cm et { "1.14e-5" } m/s près ; RMS post-ajustement par type à { "2.7e-4" } relatif près ; kshana sans bruit par rapport à la vérité { "1.06e-8" } m ; kshana sans bruit par rapport à Orekit { "1.464" } et { "1.740" } cm sur deux scénarios, un manque consigné du seuil de { "1" } cm) ; tests unitaires d'orbit_determination et de batch_ls

# text
seg-f5a76ae1fcaa = sp3, precise_od

# text
seg-39a552abfcab = tests unitaires de src/sp3.rs ; tests/agency_galileo.rs::galileo_e11_sp3_accuracy_weighted_fit (jeu d'essai ESOC de { "8" } h versionné, sigma { "0.032" } m d'après l'exposant d'en-tête { "5" } : RMS 3D de Tier-1 { "0.132" } m inchangé, Tier-2 { "0.035" } m contre { "0.070" } m à un sigma de { "1" } m, le changement venant de la contrainte a priori empirique rééquilibrée) ; tests/agency_swarm.rs (le produit Swarm ne porte aucun code d'exactitude et se rabat, figé)

# text
seg-409f709cceb3 = gravity_pds, body, propagator, mars_frame

# text
seg-0fe6532ca74d = tests/planetary_gravity_pds.rs::a_shadr_field_attached_to_a_body_drives_the_propagator ; gravity_pds::tests::with_gravity_field_is_opt_in

# text
seg-e3d75762b979 = gnss_navmsg (gps_cnav, gal_inav, gal_fnav, fec)

# text
seg-dbe0dd5dcf47 = gnss_navmsg::tests (valeur de contrôle CRC-24Q 0xCDE703 ; réponse impulsionnelle convolutive ; Viterbi corrige les erreurs injectées ; largeurs de la disposition) ; tests/gnss_navmsg_roundtrip.rs (les bits de début de champ égalent les numéros de bits de l'ICD ; encode -> FEC -> entrelacement -> Viterbi -> décodage fait l'aller-retour à un demi-LSB près) ; tests/gnss_navmsg_galileo_brdc_grid.rs (enregistrements Galileo IGS BRDC 2018-133 sur la grille LSB, pire { "3.6e-3" } LSB ; le seuil préenregistré du nombre de satellites est manqué, { "15" } sur { "20" }, FINDING)

# text
seg-b81cd9204f64 = hatch (HatchFilter), pvt (assemble_epoch_precise_smoothed, CarrierSmoother)

# text
seg-e892fffaaf07 = hatch::tests (traversée sans bruit ; variance du bruit blanc 1/(2N-1) ; redémarrages) ; tests/hatch_wettzell_oracle.rs::hatch_finding_is_pinned (WTZR 2025-02-24 01-06 h, { "600" } époques, N = { "100" } : erreur 3D médiane { "1.553" } -> { "1.116" } m, p95 { "3.473" } -> { "3.207" } m)

# text
seg-bdda05057c91 = rinex_obs (parse_obs)

# text
seg-44b76c5cb13e = tests/rinex4_obs_mao0.rs (les { "4" } premières époques du fichier RINEX { "4.00" } MGEX de l'IGS MAO000USA_R_20231980000_01D_30S_MO, { "58" } satellites, { "7" } systèmes : les enregistrements d'en-tête et les valeurs de la première époque égalent les littéraux publiés) ; rinex_obs::tests::parses_a_rinex_4_header_with_its_new_records (en-tête synthétique { "4.02" } issu de la spécification)

# text
seg-439e23a5567e = rinex (RinexEphemeris::sv_position_ecef_bds_geo, NavParseOptions)

# text
seg-8c86b4b3a731 = tests/bds_geo_broadcast_oracle.rs (véritables enregistrements C01-C04 : rayon géostationnaire, longitudes 140.02/80.04/110.55/159.99 deg aux positions publiées, |latitude| { "2.13" } deg avec l'inclinaison contre { "6.65" } sans ; la comparaison préenregistrée diffusé-contre-précis SP3 est conditionnée par les données sur KSHANA_BDS_GEO_SP3 et n'a pas été exécutée) ; rinex::tests

# text
seg-75c2ea59f607 = fusion::carrier_tc (run_carrier_tc, CarrierTcCfg), fusion::trajectory (truth_epochs)

# text
seg-e27a18b3aae9 = tests/fusion_carrier_tc.rs (trajet en 8 : RMS 3-D stable { "0.025" } m en phase porteuse contre { "0.470" } m en code sur des mesures identiques ; { "12" } graines, NIS/ddl moyen { "1.00" } et NEES/ddl stable { "0.92" } ; un saut de 1 cycle détecté à son époque sans fausse alarme et la solution intacte ; couper les corrections diffusées fait passer l'erreur de code de { "0.51" } m à { "19.6" } m (iono) et { "8.0" } m (tropo) ; l'exécution sans bruit converge à { "0.3" } mm)

# text
seg-2811d9348db2 = fusion::pack (TightCfg, [tight]), scénarios gnss-ins-maritime / gnss-ins-rail / gnss-ins-aviation

# text
seg-3f9bc3b0027f = tests/gnss_ins_packs.rs (chaque paquet : fusionné en dessous de l'INS libre pendant la panne pour les deux capteurs ; rail : serré { "5.3" } m contre lâche { "12.9" } m de classe navigation et { "15.6" } m contre { "18.8" } m de classe tactique pendant la panne, disponibilité { "0.97" } contre { "0.95" } ; table serrée validée) ; tests/gnss_ins_legacy_trajectory_pin.rs (la valeur par défaut à couplage lâche identique bit à bit)

# text
seg-726b35d3e247 = fusion::coupled (CoupledPntFilter, CoupledPntBiasFilter, CoupledPnt3d), fusion (run_coupled_suite), hybrid (CoupledCfg)

# text
seg-260ef8ae3823 = tests/fusion_coupled_filters.rs (filtre 3-D sur { "60" } graines : NEES moyen de la seconde moitié { "8.12" } pour { "8" } états, somme de χ² de la dernière époque dans sa bande à { "95" } % ; un recalage d'horloge de { "0.1" } ns réduit le sigma de position 3-D de { "5.58" } m à { "3.07" } m ; filtre de biais sur { "60" } graines : somme de χ²({ "5" }) dans la bande, biais à moins de { "3" } sigma pour { "59" } sur { "60" } ; fusion-pnt-coupled avec accéléromètres biaisés : position p95 { "18.7" } m / { "90.0" } m et intégrité { "1.00" } / { "0.97" } couplé contre { "430" } m / { "4060" } m et { "0.006" } / { "0.000" } découplé) ; fusion::coupled::tests ; tests/fusion_coupled_pack.rs (fusion et hybrid sans [coupled] identiques bit à bit)

# text
seg-10d9b01f3ab2 = fusion::trajectory (TrajectoryCfg, Trajectory, kinematic_imu, parse_truth_csv), fusion::pack ([trajectory])

# text
seg-5a6b5289a473 = fusion::trajectory::tests (un virage coordonné n'a pas de force latérale et a un facteur de charge 1/cos φ ; l'import CSV reproduit un profil volé à { "1e-3" } m/s et { "1" } m près) ; tests/gnss_ins_trajectory_library.rs (chaque profil s'exécute et la fusion bat l'INS libre pendant la panne ; chacun vole son mouvement nommé ; observabilité du cap : sigma de lacet après { "240" } s { "1.27" } deg en croisière en ligne droite contre { "0.039" } deg en 8 et { "0.062" } deg en arrêt-départ) ; tests/gnss_ins_legacy_trajectory_pin.rs (résultat hérité et condensats de vérité identiques bit à bit)

# text
seg-5807e4274501 = cr3bp (differential_correct_halo, PeriodicOrbit)

# text
seg-adec908f7883 = tests/capstone_nrho_horizons.rs::cr3bp_nrho_matches_capstone_mean_geometry (CAPSTONE mars { "2023" }, { "4" } périlunes et { "5" } apolunes : période { "6.5004" } j contre { "6.5699" } j ({ "1.07" } %, seuil { "3" } %), apolune { "71 182" } contre { "71 215" } km ({ "0.05" } %, seuil { "5" } %), périlune { "3 385" } contre { "3 245" } km ({ "4.1" } %, seuil { "20" } %)) ; cr3bp::tests::reproduces_l2_southern_nrho_92_regime

# text
seg-d38407c0a9ab = dop_error_mc (run_geometry, check, TOLERANCES) ; dop_error_ci (run, GEOMETRIES) ; pvt (solve_spp) ; orbit (dop, dop_cofactor)

# text
seg-01d0a7046f8e = tests/uere_dop_monte_carlo.rs (position_error_is_sigma_times_dop_on_the_gnss_lib_py_geometries : les { "104" } contrôles passent à la première exécution après le préenregistrement e50c88d2, pire variance { "3.2" } %, RMS { "1.6" } %, corrélation { "0.012" }, moyenne { "2.2" } erreurs standard, fraction d'ellipse { "0.0039" } ; negative_control_a_doubled_pdop_fails_every_geometry ; negative_control_elevation_dependent_errors_fail_the_low_elevation_geometries : les deux contrôles échouent comme exigé ; position_error_is_sigma_times_dop_on_masked_skies : les deux géométries à ligne d'horizon masquée de la note de conception, le ciel 10sat-mixed sous les préréglages city-street ({ "4" } satellites, PDOP { "16.6" }) et container-terminal ({ "9" } satellites, PDOP { "2.5" }), les { "26" } contrôles passent à la première exécution après le préenregistrement 03999c11, tests/fixtures/dop/PREREGISTRATION-MASKED.md) ; tests/position_error_dop_ci.rs (un premier contrôle distinct sur quatre ciels choisis à la main (ouvert, groupé, canyon, demi-ciel ; sigma { "1" } m, graine 0x0D0B5EED) avec des intervalles de confiance du khi-deux à { "1e-6" } au total sur { "20" } contrôles : rapports de { "0.987" } à { "1.009" }, le PDOP/GDOP propre du solveur égal à celui du noyau à { "2.5e-12" } près, et des contrôles négatifs pour une erreur de DOP de { "10" } % et des erreurs en 1/sin(élévation) ; exécuté avant le préenregistrement, il est donc rapporté, non préenregistré) ; dop_error_mc::tests ; dop_error_ci::tests

# text
seg-557c0aa72056 = receiver_trust (geometry: GeometryTracker, geometry_ratio, sky_ratio, geometry_points, GeometryLabel ; score: DeductionClass, score_with ; monitors ; live) ; telemetry (sample, prometheus, syslog, otlp)

# text
seg-fd57dab04d68 = tests/natural_degradation_trust.rs (a_stated_skyline_reads_the_fjord_as_geometry : sur le passage synthétique de fjord de scenarios/training/fjord-natural-degradation.toml, les mêmes { "624" } époques sont déduites avec et sans la [skyline] déclarée ; avec elle, sky-blocked est rapporté sur { "680" } époques ({ "0" } sans : le repli par écart d'azimut ne voit rien dans un fjord à deux côtés), open_fraction vaut { "0.758" }, et les époques de classe environment passent de { "78" } à { "33" }, le reste étant des pertes de satellites que la ligne d'horizon déclarée laisse à découvert ; en dehors de l'événement, la ligne d'horizon ne change aucun score) ; receiver_trust::geometry::tests (rapports dérivés à la main aux seuils, les bords des seuils, la rampe et le plafond, le plancher, les bords des étiquettes, les surcharges [geometry], le DOP sur le noyau validé, ciels maintenus et expirés, inconnu non deviné, perte de signal, la tolérance de mauvaise géométrie, sentinelles d'absence de point de position) ; tests/geometry_trust.rs (un ciel masqué correct étiqueté et non noté, un ciel masqué mauvais, une perte à basse élévation, une chute de puissance, un HDOP falsifié, une perte totale de signal, un entraînement de position pendant une mauvaise géométrie, une géométrie inconnue, des surcharges de session, le schéma en direct) ; tests/geometry_trust_no_change.rs (les deux sessions d'exemple identiques octet pour octet à { "0.35.0" } une fois les clés ajoutées retirées) ; tests/geometry_corpus_identity.rs (chaque corpus NMEA de navire versionné, aussi en ciel ouvert GPS seul, et les scénarios de formation d'équipage : identiques octet pour octet à { "0.35.0" } sauf les époques poor, qui diffèrent par la seule déduction de géométrie)

# text
seg-911ccf2cb486 = skyline (Canyon::cut_deg, Sector::contains, TerrainPoint::elevation_deg, reduce_terrain, SkylineCfg::build)

# text
seg-849ae7d82147 = skyline::tests (canyon_matches_hand_computed_wall_elevations ; terrain_takes_the_curvature_drop ; sectors_have_sharp_edges_and_wrap ; a_preset_is_overridden_or_added_to_field_by_field ; malformed_sections_are_refused)

# text
seg-d5ba7b502aec = skyline (PRESETS, preset, preset_list)

# text
seg-ef3717bfca79 = skyline::tests (presets_carry_the_note_dimensions_and_provenance)

# text
seg-4e6101547ab1 = geometry ; orbit (cofactor_from_los, dop_cov, dop) ; surface (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg)

# text
seg-8ee1ff6b9975 = geometry::tests (ellipse_of_an_analytic_two_by_two_case ; sky_geometry_equals_orbit_dop_on_the_same_visible_set ; ecef_input_matches_azimuth_elevation_input ; one_clock_per_system_adds_a_state_and_costs_geometry ; monte_carlo_is_seeded_and_agrees_with_the_geometry ; presets_propagate_and_are_seen_from_a_site) ; tests/dop_reference.rs (le noyau à horloge unique par rapport à gnss_lib_py)

# text
seg-085cbc64bab2 = holdover

# text
seg-b31ed8fc6801 = holdover::tests (par rapport à la récursion de covariance de Kalman à plusieurs pas ; FM blanc exact ; aller-retour) ; noyau de variance de marche validé de façon externe dans tests/gnss_denied_clock_holdover_reference.rs (par rapport à scipy Van-Loan/brentq)

# text
seg-2a3a7ee9e8f3 = clock_library (card, condition, series), realdata::clk, allan (lag1_noise_id)

# text
seg-578497ef82a5 = tests/clock_library_device_cards_oracle.rs (gps_iif_cards_reproduce_the_recorded_finding ; receiver_training_is_blocked_by_the_epoch_minimum ; non_blind_cards_are_reported ; préenregistré 2ec76864) ; clock_library::card::tests ; clock_library::condition::tests ; clock_library::series::tests ; realdata::clk::tests ; tests/clock_library_f9p_cards_oracle.rs (f9p_first_pipeline_reproduces_the_recorded_finding ; f9p_corrected_pipeline_reproduces_the_recorded_finding ; conditionné par les données)

# text
seg-d302e2ef46ad = clock_library (card)

# text
seg-00637c1e69f0 = tests/clock_library_periodic_cards_oracle.rs (periodic_cards_reproduce_the_recorded_finding ; préenregistré fb475550) ; clock_library::card::tests (a_periodic_card_carries_the_sinusoid_a_power_law_card_cannot)

# text
seg-3016100a7015 = clock_state::tests (van-Loan Q analytique ; NEES ; positivité de la DSP) ; tests/clock_state_reference.rs (trajectoire complète de prédiction + mise à jour : état x et covariance P de { "3" }×{ "3" } sur { "1925" } pas / { "4" } jeux de paramètres par rapport à filterpy { "1.4.5" } ; pire |relΔ| { "2.8e-14" }) ; tests/clock_state_igs_holdout_oracle.rs::three_state_filter_on_held_out_igs_clocks_finding (fige le constat) ; tests/clock_state_ext_igs_fresh_oracle.rs::extended_filter_on_fresh_igs_clocks_finding ; tests/clock_state_ext_igs_conditioned_oracle.rs::conditioned_extended_filter_finding (D9 tour { "3" })

# text
seg-509026100595 = timetransfer, timetransfer_adv

# text
seg-a1ad8fb8537d = timetransfer::tests (annulation réciproque ; identité de Sagnac sous deux formes) ; tests/time_transfer_error_budgeting_reference.rs (Sagnac de tour de l'équateur = { "207.386" } ns contre le { "207.4" } ns publié d'Ashby à <{ "0.05" } ns près ; plus géométrie Sagnac/geodist recoupée avec le geodist() de RTKLIB { "2.4.3" } compilé à partir du source C)

# text
seg-10e0cb39ac3b = navsignal

# text
seg-1035f877de94 = navsignal::tests (auto-SSC BPSK = 2/3R_c ; DSP d'aire unitaire ; DLL) ; tests/nav_signal_modulation_code_tracking_reference.rs (correspondance exacte en entiers de la corrélation croisée/autocorrélation des codes de Gold GPS C/A par rapport à une génération de code IS-GPS-200 indépendante ; DSP BPSK-R({ "1" })/sine-BOC({ "1,1" }) par rapport à un périodogramme scipy indépendant) ; tests/nav_signal_betz_hein_published_oracle.rs (betz_text_correlation_values_over_1_ghz ; hein_mboc_interference_improvements ; finding_betz_side_lobes_and_multipath, figé)

# text
seg-4e1ac3f1b4a1 = quantum_imu::tests (k_eff ; Mach-Zehnder T² ; encadrement du plancher Freier-2016) ; tests/quantum_inertial_sensor_reference.rs (fonction de transfert |H(ω)|, k_eff·T² et DSA du bruit de grenaille par rapport aux vecteurs numériques publiés de Cheinet { "2008" } / Peters / Freier) ; tests/quantum_inertial_measured_qpn.rs (gauguet_finding_qpn_floor_sits_below_the_measured_noise, figé ; gradiometer_qpn_line_matches_janvier_model)

# text
seg-81802510f112 = quantum_imu::tests (a_max se situe au bord de demi-frange ±π avec la mise à l'échelle de portée en 1/T² ; la récupération de phase repliée est exacte dans [−a_max,a_max] et se replie d'exactement { "2" }·a_max en dehors ; la plage dynamique non ambiguë a_max/σ_a=π/σ_Φ est identique pour deux facteurs d'échelle longueur d'onde/T très différents ; les méthodes de CaiAccelerometer concordent avec les fonctions libres)

# text
seg-ccc56dac1725 = inertial::quantum_imu (QuantumNavBudget)

# text
seg-60fb2adb58ce = budget_tests (biais par rapport à l'intégrateur AccelModel ; VRW par rapport à l'intégrale analytique) ; tests/quantum_inertial_dead_reckoning_reference.rs (VRW par rapport à une double intégration Monte Carlo numpy indépendante d'un bruit d'accélération blanc, pire écart { "0.42" }% dans ±{ "3" }% sur { "6" } durées de marche ; biais/facteur d'échelle par rapport à une valeur sous forme fermée de Groves { "2013" } ; allers-retours de holdover)

# text
seg-8f6825f614c7 = jamming::tests (broadband_q_equals_the_spectral_separation_closed_form et cw_q_equals_the_spectral_separation_closed_form : la table Q, CW et bande étroite { "1" }, large bande et balayé { "2" }, figée sur les formes fermées de navsignal ; a_cw_jammer_is_more_damaging_than_broadband_noise_at_equal_js) ; tests/gnss_denied_jamming_resilience_reference.rs (FSPL/J-S/C-N₀ effectif par rapport à une redérivation numpy indépendante du bilan de liaison de Kaplan & Hegarty §{ "9.4" } ; le C/N₀ réel de JammerTest chute de façon monotone en passant le seuil de { "25" } dB-Hz) ; tests/jamming_jammertest_cn0_oracle.rs (préenregistré, bloqué, non exécuté)

# text
seg-e3ed02029c26 = spoof, spoof_detect, spoof_monitors

# text
seg-d6db95d3aa40 = tests/spoof_texbat_validation.rs (caractérisation des paramètres TEXBAT) ; tests/spoof_detection_jammertest_oracle.rs::monitors_against_the_published_onsets_reproduce_the_recorded_disagreement (fige le constat) ; tests/spoof_detection_jammertest_log_oracle.rs::engine_monitors_against_the_logged_onsets_reproduce_the_recorded_disagreement ; tests/clock_library_tcxo_card_jammertest_oracle.rs (round_3_is_blocked_by_the_training_minimum ; round_4_reproduces_the_recorded_finding ; round_4b_reproduces_the_recorded_finding ; D9)

# text
seg-9cb72e60e080 = tpl

# text
seg-b96e16aba41a = tpl::tests (références sous forme fermée + CUSUM) ; examples/tpl_jammertest.rs (étalonnage de leurrage réel JammerTest { "2024" }) ; tests/tpl_jammertest_coverage_oracle.rs::tpl_against_measured_time_error_reproduces_the_recorded_disagreement (fige le constat) ; tests/tpl_jammertest_log_oracle.rs::drift_state_tpl_against_the_logged_onsets_reproduces_the_recorded_disagreement

# text
seg-6094ed4985fc = altpnt, mapmatch, gravimeter, igrf

# text
seg-f841812dc204 = tests/alternative_complementary_pnt_reference.rs (CRLB de recalage sur carte ; champ IGRF-14) ; mapmatch::tests ; gravimeter::tests ; igrf::tests ; tests/gravity_map_real_field.rs (le benchmark de 60 min privé de GPS sur le champ réel EGM2008 de degré 70, préenregistré dans xval/icgem-egm2008/ : recalé à { "3106" } m, de sorte que le seuil < { "500" } m est NOT MET et affirmé comme manqué, et la réduction par dix de la dérive de { "70.6" } km est MET ; plus le Monte Carlo à graine de l'erreur de carte) ; altpnt::terrain::tests::emag2_format_grid_reproduces_the_synthetic_magnetic_channel et tests/emag2_real_grid.rs (lecteur EMAG2v3 conditionné par les données sur un véritable extrait ; aucun résultat de navigation n'est revendiqué dessus) ; tests/terrain_slam_rbpf.rs (estimation conjointe de la carte, un RBPF de type FastSLAM, par rapport au SITAN à carte connue sur une erreur de carte corrélée de { "15" } m sur { "20" } graines, préenregistré dans xval/terrain-slam-rbpf/ : gain moyen de { "1.5" }% et meilleur sur { "10" } des { "20" }, de sorte que les seuils de { "10" }% et de 12 sur 20 sont NOT MET et affirmés comme manqués ; aucun dommage sur une carte parfaite, MET)

# text
seg-4bcb7eeb020a = report, scenario ; CI (golden/determinism/SBOM)

# text
seg-3667ebf0582a = tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs ; tests/reproducibility_software_assurance_reference.rs (le SBOM généré est validé sans erreur par rapport au schéma JSON CycloneDX { "1.5" } officiel sur tout le graphe livré de 66 composants : fonctionnalités default + python + wasm, dev-dependencies exclues)

# text
seg-e4edd8fd654c = impairment_eval::tests (AUC parfaite=1/identique=0.5/égalité={ "0.125" }, ROC monotone, fusionné>{ "0.8" }, séparation par couche de classe, garde contre les fuites, corpus reproductible, les indicateurs de décalage de distribution signalent l'optimisme) ; dominance_demonstrators (accessible + reproductible + MODELLED, non VALIDATED + écart d'optimisme autocohérent)

# text
seg-28583cba1c55 = impairment_study, impairment_ml, eval_stats

# text
seg-b30ce36e7afb = impairment_study::tests (AUC de référence par classe≈{ "1" }, écart d'optimisme appris>{ "0" }, forme de grille + l'IC bootstrap encadre la moyenne + tendance d'échelle positive, caractéristiques d'identifiants finies, le prédicteur d'écart bat la prédiction de la moyenne sous les DEUX validations croisées leave-one-detector-out et leave-one-class-out + déterministe) ; impairment_ml::tests (logreg sépare + déterministe + perte↓, un MLP résout le XOR qu'un modèle linéaire ne peut pas + à graine) ; eval_stats::tests (bootstrap/DeLong/Spearman/ridge par rapport aux formes fermées)

# text
seg-e0f68f57399d = quantum_trade::tests (récupération aller-retour de l'ADEV, non-négativité NNLS, mise en garde sur le plancher présente/absente, bénéfice>{ "1" }, enveloppe monotone + borne alt-PNT) ; dominance_demonstrators (l'ADEV mesuré est piloté par les données et non supposé par le plancher, la classe supposée signale le plancher + la mise en garde, courbe malformée rejetée, MODELLED, non VALIDATED)

# text
seg-550bd3cee63e = space_weather::tests (Kp↔ap exact aux points de grille + aller-retour + monotone, moyenne d'Ap quotidien, T exosphérique par rapport aux ancrages publiés de minimum/moyenne/maximum solaire + incrément de tempête, densité d'unité à la référence, oscillation du cycle solaire dans la bande observée de { "5" }–{ "10" }×, scénario reproductible + MODELLED, non VALIDATED + rejet hors plage) ; dominance_demonstrators (accessible + reproductible + T physique + MODELLED, non VALIDATED) ; tests/space_weather_density_accelerometer_oracle.rs::jacchia71_finding_is_pinned

# text
seg-80847ffc93bf = launch

# text
seg-2095b880eb39 = launch::tests (un lancement vers l'est franc atteint i=latitude, KSC→ISS = { "45" }° de manuel, polaire = N/S, i<lat inatteignable, gain équatorial de { "465" } m/s, changement de plan de { "10" }° ≈ { "1.34" } km/s + { "180" }° = 2v, nombres d'occasions quotidiennes, scénario reproductible/MODELLED + trajectoire dogleg) ; dominance_demonstrators (accessible + reproductible + KSC→ISS { "45" }° + MODELLED, non VALIDATED) ; tests/launch_geometry_orekit_oracle.rs::burnout_azimuth_reproduces_the_target_inclination_in_orekit ; tests/launch_geometry_orekit_oracle.rs::earth_rotation_speed_gap_is_recorded_as_a_finding ; tests/launch_geometry_orekit_oracle.rs::true_pole_site_speed_matches_orekit_at_a_fresh_epoch_and_longitudes

# text
seg-c763ac7e3cda = reentry::tests (g maximal indépendant du coefficient balistique + bande de g physique, croît avec un γ plus raide / une entrée plus rapide, vitesse du g maximal = V_e·e^(−1/2) et chauffage maximal = V_e·e^(−1/6) plus rapide, altitude du g maximal physique + plus profonde pour un B plus élevé, scénario reproductible/MODELLED + géométrie dégénérée rejetée) ; dominance_demonstrators (accessible + reproductible + fraction V_e·e^(−1/2) + MODELLED, non VALIDATED) ; tests/reentry_reconstruction_oracle.rs::reentry_overprediction_is_recorded_as_a_finding ; tests/reentry_point_mass_reconstruction_oracle.rs::point_mass_peak_deceleration_matches_reconstructed_entries (recoupement seulement) ; tests/reentry_point_mass_accelerometer_oracle.rs (bloqué, non exécuté)

# text
seg-885946a29a26 = contact_schedule (es_n0_db, select_modcod, fspl_db, atmospheric_loss_db, ccm_modcod, pass_capacity, AcmLinkScenario) ; passes::predict_passes_apparent

# text
seg-00889ed96256 = contact_schedule::tests::modcod_efficiency_closed_form_matches_the_printed_table ; contact_schedule::tests::modcod_selection_is_monotone_and_honours_the_margin ; contact_schedule::tests::link_budget_pieces_have_closed_forms ; contact_schedule::tests::acm_link_defaults_run_and_acm_beats_ccm

# text
seg-dece72e58683 = contact_schedule (conflicts, objective, delivered, schedule_chronological, schedule_greedy, schedule_optimal, ContactScheduleScenario)

# text
seg-d21204ff6b58 = contact_schedule::tests::conflicts_cover_turnaround_and_one_station_per_satellite ; contact_schedule::tests::greedy_is_feasible_and_the_exact_solver_beats_or_ties_it ; contact_schedule::tests::exact_solver_matches_brute_force_and_plans_are_feasible ; contact_schedule::tests::exact_solver_declines_above_the_limit ; contact_schedule::tests::contact_schedule_defaults_run_reproducibly ; contact_schedule::tests::scenarios_reject_bad_inputs

# text
seg-c6fab6332435 = frugal (over walker)

# text
seg-257dfa053c24 = frugal::tests (coût par couverture dérivé à la main 48/96={ "0.5" }, rapport de ROI { "2.667" }, ordre des encadrements + gardes de couverture nulle)

# text
seg-412105b0f541 = integrity_impact (over raim)

# text
seg-35bc1db56d2a = integrity_impact::tests (le même manque bascule Available→MI→HMI à mesure que le contexte se resserre ; PL prudent→Unavailable ; HMI par axe ; gardes d'entrée)

# text
seg-fd95a229bdb3 = inertial::cai_params (over inertial::quantum_imu)

# text
seg-061a65493a4a = inertial::cai_params::tests (le VRW physique tombe dans l'encadrement VRW cité aux { "3" } niveaux ; plage brute d'ambiguïté de frange calculée à partir de k_eff·T² ; le budget prudent dérive plus que le meilleur ; chaque encadrement est sourcé + marqué à confirmer ; gardes d'ordre des encadrements)

# text
seg-07ef7fe3d770 = src/benchmark/stanford.rs::tests (quatre régions + bornes inclusives + |erreur| + indisponibilité PL>AL) ; tests/tib_scorer_reference.rs (comptes de classification par rapport à numpy indépendant sur un ensemble synthétique fixe)

# text
seg-60f627e001ad = src/benchmark/coverage.rs::tests (propre/sous-borné/tout indisponible/vide) ; tests/tib_scorer_reference.rs (comptes + taux + coverage_ok par rapport à numpy à { "1e-12" } près)

# text
seg-6b48be996d76 = src/benchmark/faults.rs::tests (profils de décalage, marche monotone, marquage de l'ensemble indétectable, cohérence de max_offset, exactement deux classes indétectables)

# text
seg-b19cbd364dea = src/benchmark/scorecard.rs::tests (la PL de référence absorbe ; la PL défaillante n'est jamais détectée et n'est pas absorbée ; verdict de couverture détectable ; la propriété d'honnêteté selon laquelle aucun verdict de couverture ou de détection n'est accessible pour un scénario indétectable)

# text
seg-6d963d838eed = hybrid_integrity::tests (la configuration résolue est renvoyée en écho pour les valeurs par défaut et pour les surcharges, sans passer la longueur d'onde par un aller-retour en mètres ; chaque entrée d'unités porte à la fois une unité et une classe de provenance ; chaque champ que le bloc d'unités nomme est effectivement émis, de sorte qu'il ne peut pas documenter un champ fantôme)

# text
seg-55f2385bbe8a = hybrid_integrity, linkbudget, jamming

# text
seg-188ab5b1b2e9 = hybrid_integrity::tests (la disponibilité est égale au produit des deux indicateurs recalculés à partir des marges du rapport lui-même, et ces marges sont elles-mêmes reconstituées à partir de l'EIRP, de la perte en espace libre, de la perte globale, du facteur de mérite, du terme de Boltzmann, du débit de données et de l'exigence du rapport, à { "1e-9" } dB près ; la valeur est mesurée égale à { "0" } ou à { "1" } alors que la disponibilité optique au même passage est mesurée strictement comprise entre les deux ; chaque ligne de facteur porte une classe de provenance issue du vocabulaire fermé de field_schema ; la portée de fermeture rapportée, repassée dans le bilan de liaison, renvoie une marge de { "0" } à { "1e-9" } dB près et est mesurée comme indépendante de la portée à laquelle le passage se situait sur quatre décades, tandis que l'utilisation de la portée varie exactement du rapport des portées ; une liaison de -40 dBW rapporte une disponibilité de { "0" }, LOST, et une utilisation supérieure à { "1" } plutôt qu'une fraction ; la note remplacée « aucun équivalent de disponibilité RF n'est calculé par ce moteur » est vérifiée comme supprimée et son remplacement est vérifié comme nommant le nouveau champ ; une entrée RF mal formée est refusée plutôt que tronquée)

# text
seg-616d297a3190 = hybrid_integrity, optical_linkbudget, linkbudget, navsignal

# text
seg-d3a72a60b237 = hybrid_integrity::tests (le rapport est égal aux deux branches émises divisées, à { "1e-15" } près en relatif, et son inverse et ses formes en décibels concordent ; la portée et l'écart-type temporel de chaque branche sont liés exactement par c ; la configuration commune émise est vérifiée égale à la portée et au temps d'intégration propres au scénario, et la portée de la branche RF est vérifiée égale à celle de la branche optique ; le C/N0 de la branche RF est identique bit à bit à celui du bloc de disponibilité, issu d'un seul bilan de liaison, et non d'une nouvelle dérivation ; la propriété LIKE-FOR-LIKE est MESURÉE plutôt qu'affirmée -- quadrupler le temps d'accumulation commun divise par deux la branche optique à { "1e-12" } près et la branche RF à { "1e-7" } près et laisse le rapport inchangé à { "3.19e-9" } près en relatif, ce qu'une branche qui moyennerait secrètement sur autre chose ne pourrait pas faire ; une surcharge rf_dll_bandwidth_hz qui rompt le temps de moyennage commun rend le rapport nul avec une raison nommant les deux temps, tandis que les deux branches restent émises ; un passage aller simple fait de la branche de comparaison l'indicateur principal publié, bit à bit, avec un facteur de pénalité d'exactement { "1" }, et un passage aller-retour reproduit la pénalité 0.5/sqrt(perte géométrique du trajet retour) recalculée à partir du geometric_loss_db du rapport lui-même à { "1e-12" } près)

# text
seg-7f3efc1e9fa0 = linkbudget

# text
seg-da19fa334661 = linkbudget::tests (sur trois bandes, quatre décades de portée et les deux verdicts de fermeture, la marge et la perte en espace libre qui la sous-tend sont recalculées à partir du seul rapport à mieux que { "1e-9" } dB ; le G/T requis assemblé à partir des termes de l'équation concorde avec la même grandeur obtenue comme G/T moins la marge, et réexécuter à cette valeur annule la marge ; trois bilans avec une EIRP, des pertes et un seuil très différents mais une constante de liaison égale donnent une exigence identique, tandis que { "1" } dB sur la constante la déplace d'exactement { "1" } dB ; la répartition du gain est absente sauf si une température de bruit est indiquée, et une température non positive est refusée ; chaque champ que le bloc d'unités nomme est effectivement émis)

# text
seg-d9742b5a3a48 = lunar_time_budget::tests et lunar_time_budget_scenario::tests (les quatre classes sont présentes dans un même passage et dans un ordre de sous-ensemble demandé ; chaque ligne concorde avec sa propre forme close à mieux que { "1e-12" } en relatif ; multiplier l'erreur de référentiel par k multiplie le croisement par k pour une horloge à flicker FM et par k^{ "2" } pour une horloge à white FM, vérifié à k={ "2" } et k={ "3" }, ce qui sépare les deux classes de bruit ; chaque ligne reproduit le croisement à horloge unique que le bilan avait déjà rapporté ; chaque ligne retrouve l'unique terme de référentiel partagé ; un nom d'horloge inconnu est rejeté)

# text
seg-024dfb3684f1 = antenna

# text
seg-7e64cec1882e = antenna::tests et attack_surface::tests (la grille est complète et chaque fraction capturée se situe dans [{ "0,1" }] ; la fraction capturée est non décroissante avec la puissance d'émission à chaque nœud ; elle n'est PAS monotone en largeur de faisceau ni en altitude, ce qui est figé par son propre test afin que le balayage ne puisse pas être lissé par la suite ; le nœud de référence de base reproduit bit à bit la fraction capturée existante ; l'évaluation au limbe seul est identique bit à bit au dernier point du balayage complet ; un croisement localisé se situe sur le seuil à { "1e-9" } dB près et est encadré)

# text
# c1: total
seg-d804d9874191 = lunar_time_budget_scenario::tests (l'ensemble des { "57" } temps de moyennage x { "8" } termes est présent, l'indice de grille va de { "0" }..={ "56" } et porte { "8" } lignes chacun ; la ligne <c1/> est égale à la racine de la somme des carrés des sept termes qui l'accompagnent à chaque tau ; le tableau suit une grille demandée plutôt qu'une grille codée en dur ; son émission laisse le JSON du rapport identique à l'octet près)

# text
seg-61e51873ef4b = lunar_time_lab (sur clock_specs, lunar_time_budget, lunar_time)

# text
seg-73a747390b44 = lunar_time_lab::tests (free_run_clock_term_is_the_budget_clock_term : sans asservissement, le terme d'horloge est égal bit à bit au terme d'horloge du bilan pour les quatre classes ; bisection_matches_the_closed_form à { "1e-9" } près en relatif pour les deux classes de bruit ; threshold_below_the_floor_is_flagged ; steering_holds_and_resets ; height_term_is_opt_in_and_linear ; device_card_reproduces_a_named_class ; bad_inputs_are_refused) ; tests/lunar_station_time_lab.rs (the_block_is_additive : le document, le tableau et le résumé par défaut sont inchangés et le bloc n'ajoute que son propre objet et ses propres unités ; time_to_threshold_matches_the_closed_form_through_the_scenario ; clocks_are_ordered_over_the_span_where_the_model_orders_them : optique < PHM < RAFS < miniRAFS de { "1" } s à { "7e5" } s, les courbes PHM et RAFS se croisant entre { "7e5" } et { "8e5" } s, ce qui est figé comme propriété divulguée des modèles d'horloge à un seul type de bruit ; every_time_lab_field_has_a_unit ; unknown_time_lab_fields_and_clocks_are_refused)

# text
seg-71c4fb3e4d08 = lunar_vlbi::tests (la limite du champ lointain concorde avec delta_dor ; correction de champ proche ; dérivées partielles par différences finies) ; tests/lunar_vlbi_anise_oracle.rs::near_field_delay_disagrees_with_the_anise_light_time_difference

# text
seg-1755ed282a7d = earth_gnss_lunar::tests ({ "11" } tests de bibliothèque : l'angle de demi-ouverture au limbe terrestre par rapport à sa forme close asin(R/r), avec une assertion supplémentaire que CHAQUE liaison non occultée se situe hors de ce cône, de sorte que le test d'occultation et l'angle au limbe ne peuvent pas être en désaccord ; le prédicat d'occultation vérifié du côté proche, du côté éloigné et dans le cas où le corps se trouve DERRIÈRE l'émetteur ; l'affaiblissement de propagation borné à la bande plausible des distances lunaires sur chaque liaison ; l'ensemble poursuivable montré comme un sous-ensemble de l'ensemble géométriquement visible et disjoint de l'ensemble occulté ; monotonie dans les deux sens - plus de gain en réception ne réduit jamais le compte, un seuil plus strict ne l'augmente jamais ; aucune liaison créditée de plus que le gain dans l'axe ; un récepteur à l'intérieur de la Terre refusé ; le balayage vérifié comme VARIANT effectivement avec l'époque ; et la disponibilité du signal par rapport à celle de la solution vérifiée comme distincte, correctement ordonnée et cohérente avec les lignes par époque) ; tests/earth_gnss_measured_montenbruck_oracle.rs::finding_genesis_nadir_counts_exceed_the_paper (figé) ; tests/lugre_relative_cn0_visibility.rs::too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar (constat figé)

# text
seg-e9a23134de45 = lunar_infra::{ "{" }orbit, gnss, od{ "}" }

# text
seg-13dceb4f0d7b = tests/lunar_infra_od_consistency.rs (seuil O1 : la matrice de transition d'état enchaînée sur trois jours et sur une période est égale à scipy DOP853 à { "1e-6" } près en relatif ; seuil C1 : q moyen et fraction dans l'intervalle à 95 % ; seuil C2 : échantillon sur trace formelle de chaque estimateur ; seuil C3, NOT MET et figé : avec { "3e-10" } m/s2 d'accélération non modélisée, le dépassement de l'intervalle à 95 % est de { "0.0525" }, et non d'au moins { "0.5" } - l'estimation embarquée n'est connue qu'à quelques centaines de mètres près, de sorte qu'environ dix mètres de déplacement se cachent à l'intérieur de sa covariance) ; lunar_infra::orbit::tests, lunar_infra::gnss::tests, lunar_infra::od::tests, lunar_infra::la::tests

# text
seg-2d4d23841d56 = lunar_infra::phase ; lambda

# text
seg-0b34672f668b = tests/lunar_infra_carrier_phase.rs (seuil Q1 : succès Monte Carlo au moins égal à la borne bootstrap moins trois erreurs standard ; Q2 : pas de chute avec la longueur d'arc au-delà de trois erreurs standard ; Q4 : LAMBDA est égal à l'énumération exhaustive pour { "200" } tirages de dimension jusqu'à cinq ; Q3 : la conception flottante est égale à une résolution numpy indépendante à { "1e-9" } près pour les covariances d'ambiguïté et de position, et le taux bootstrap est NOT MET à { "1e-9" }, figé : il diffère d'un relatif { "1.7e-6" } parce que la fonction de répartition normale de LAMBDA est une approximation d'Abramowitz et Stegun)

# text
seg-0abe3b27addf = lunar_infra::frame ; lunar_datum ; lunar_identifiability ; lunar_llr_geometry

# text
seg-30c57d85abc1 = tests/lunar_infra_studies_3_5.rs (seuil F1 : la trace de la CRLB ne monte pas et la plus petite valeur propre ne baisse pas avec les liaisons d'orbiteur, dans l'exemple et dans { "20" } ensembles aléatoires à graine ; seuil F2 : les dérivées partielles de portée sont égales à une différence finie numpy longdouble indépendante du modèle direct de Rodrigues sur { "50" } géométries ; seuil F3 : la plus petite valeur propre augmente d'au moins 2.0x, constatée à environ 111x)

# text
seg-0e7813b34509 = lunar_infra::tie ; fim::crlb_srif

# text
seg-58f77b27cde3 = tests/lunar_infra_studies_3_5.rs (seuil T1 : les écarts-types de translation ne baissent pas quand le lien local se relâche ; T2 : avec les écarts-types des techniques mis à l'échelle de { "1e-6" }, l'écart-type de translation de chaque paire est à moins de { "1" } % de sqrt({ "2" }) fois l'écart-type du lien local, constaté à { "3e-7" } près ; T3 : la matrice d'information est égale à un assemblage empilé numpy indépendant à { "1e-9" } près). Le premier passage de T2 avec inversion des équations normales a échoué ({ "1.3" } % pour un lien de { "0.1" } m, valeurs sous le plancher à { "1" } m) ; la cause était numérique et la covariance est passée à la voie de la racine carrée avant que le seuil ne soit rescoré.

# text
seg-8e55bf5a6a8f = lunar_infra::geodesy ; lunar_od::degree2_tide_accel ; lunar_time

# text
seg-4b42d4f76a35 = tests/lunar_infra_studies_3_5.rs (seuil G1 : les dérivées partielles analytiques sont égales à une différence finie centrale de chaque modèle direct à { "1e-8" } près ; G2 : l'information 5x5 est égale à un assemblage numpy indépendant à { "1e-6" } près ; G4 : l'amplitude de la marée d'horloge et ses sensibilités à k2 et h2 sont égales à une évaluation indépendante à { "1e-9" } près ; seuil G3 NOT MET dans sa moitié portant sur la trace, figé : ajouter une famille n'abaisse jamais la plus petite valeur propre ({ "28" } sur { "28" }) mais la trace de la pseudo-inverse a augmenté dans { "12" } ajouts sur { "28" } parce que la famille ajoutée a augmenté le rang)

# text
seg-2e097e952eb5 = lunar_beacon::tests (visibilité à l'horizon par rapport à la forme close L01 ; le DOP augmenté par balise par rapport au DOP simple ; la racine de la somme des carrés du bilan d'erreur ; la relation DOP-mètres) ; tests/validate_p2_beacon_before_after_table.rs (tout le tableau avant/après figé sur une référence d'or commise à { "1e-9" } en relatif) ; tests/validate_p2_beacon_before_after_independent_dop.rs (la même géométrie par un chemin DOP INDÉPENDANT, de sorte que l'augmentation n'est pas vérifiée par rapport au noyau qui l'a produite) ; tests/validate_lunar_beacon_anise_visibility_dop.rs::beacon_visibility_and_augmented_dop_match_anise_and_numpy

# text
seg-f8ac8be96a63 = cmpl_horizontal borne l'erreur de position horizontale à k écarts-types apportée par la classe aveugle de mode commun, en formant blind_position_covariance = S<em>Cov</em>S^T et en la projetant dans ENU ; integrity_envelope rapporte hpl_total = hpl_araim + cmpl. La distinction que cette paire existe pour établir : le test sur le RÉSIDU de RAIM/ARAIM est démontrablement aveugle aux erreurs dans range(G), mais pas le NIVEAU DE PROTECTION d'ARAIM - son terme sans défaut les borne déjà à une URA du fournisseur plus un biais nominal près. Le CMPL n'est donc que l'EXCÈS inter-fournisseurs que l'URA/ISM propre à un seul fournisseur ne surborne pas, et la somme est une borne par inégalité triangulaire, conservatrice, plutôt qu'une RSS, valable seulement là où cet excès n'est pas déjà inclus dans l'URA.

# text
seg-9e4affc02b0b = lunar_common_mode::tests (common_mode_covariance_gives_positive_cmpl, parity_only_covariance_gives_near_zero_cmpl, envelope_sums_the_two_classes, state_map_matches_split)

# text
seg-4f3b4fe41736 = lunar_combination (lunar_observability) + fim

# text
seg-e927515cc210 = lunar_combination::tests (déficient en rang sans lignes de base terrestres ; trois lignes de base rétablissent le rang plein — le seuil de 3 stations vient du rang de l'information, non d'une erreur de résolution ; CRLB de station atteinte par l'estimateur à une efficacité de { "0.98" } ; la CRLB se resserre de façon monotone avec les lignes de base) ; tests/lunar_observability_numpy_oracle.rs::lunar_observability_matches_numpy_on_the_committed_jacobians

# text
seg-84ece56ff3e9 = lunar_afs::codes, lunar_afs::lsis, lunar_afs::params (indices IS-GPS-800J)

# text
seg-d111b6550515 = lunar_afs::codes::tests (registres à longueur maximale, équilibre de Legendre, aller-retour du retard G2, composition des niveaux) ; tests/lunar_afs_codes_lsis_reference.rs::afs_codes_finding_one_misprinted_table_cell (sans le cache LSIS : quatre nombres cités figent le constat ; avec lui : { "2 937 232" } chips et bits par rapport aux fichiers de l'Annexe { "3" } de LSIS, premiers/derniers { "24" } chips imprimés, Tableaux de Legendre D-1 et E-1 et initialisations G2 donnent exactement un élément différent, la cellule « derniers { "24" } chips » du PRN { "147" } du Tableau E-5, qui duplique celle du PRN { "151" } alors que le fichier de l'Annexe { "3" } concorde avec le générateur) ; le test strict préenregistré afs_codes_match_lsis_v1_tables_and_annex3_bit_exact est ignoré avec cet écart

# text
seg-8cd700abad59 = lunar_afs::waveform (enregistrement et étiquettes de vérité), xval/lunar-afs/run_pocketsdr.sh

# text
seg-22dbd05adf9c = tests/lunar_afs_decodability_pocketsdr_v3_oracle.rs::third_run_finding_c1_c2_hold_g0_is_receiver_nondeterminism (troisième préenregistrement : { "2" } nœuds, { "4" } canaux poursuivis, pire erreur Doppler { "0.57" } Hz, pire erreur de décalage de code { "0.008" } chip, les { "6" } trames décodées avec le bon TOI à travers le repli { "99" } -> { "0" } et une sous-trame { "2" } concordante ; G0 non satisfaite telle qu'écrite, la variation propre du récepteur d'un passage à l'autre dans ses enregistrements d'acquisition) ; tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs::decodability_finding_five_violations (deuxième : { "5" } violations) ; tests/lunar_afs_decodability_pocketsdr_oracle.rs::first_run_finding_no_acquisition_outside_the_receivers_4_bit_range (premier : nul) ; les tests stricts des trois fichiers sont ignorés avec leurs écarts

# text
seg-9b511cb035c0 = gps_lnav, sdr

# text
seg-83c50906fe74 = tests/gps_l1ca_gpssdrsim_cross_generator.rs::gps_sdr_sim_truncates_where_the_broadcast_integer_needs_rounding (constat figé) ; tests/gps_l1ca_gpssdrsim_cross_generator.rs::ca_codes_lnav_fields_and_parity_match_gps_sdr_sim_bit_exactly (strict, ignoré avec l'écart) ; gps_lnav::tests

# text
seg-7b32ce65d953 = iq::acq (acquire, AcqConfig) ; iq::io (decode_samples) ; iq::scene (GpsL1Ca)

# text
seg-538f0f38481a = tests/iq_gpssdrsim_cross_generator.rs::acquisition_threshold_is_crossed_on_gps_sdr_sim_noise_free_samples (constat figé) ; tests/iq_gpssdrsim_cross_generator.rs::acquisition_finds_gps_sdr_sim_satellites_in_its_samples (strict, ignoré avec l'écart)

# text
seg-ee030053dc63 = iq::campaign (detect, runner, spec) ; iq::monitor (stats::gaussian_two_sided_pfa, sqm)

# text
seg-1663be50baf6 = tests/iq_campaign_monitors.rs : m1_power_test_false_alarm_rate_matches_the_closed_form ({ "73" } blocs sur { "5900" } par rapport à l'intervalle binomial à { "99" } % [{ "40" }, { "80" }] de P_fa { "0.01" }), m2_sqm_false_alarm_fraction_is_within_a_factor_of_2_of_2q_k (delta { "0.0160" }, rapport { "0.0131" } contre { "0.01" }), m4_cn0_false_alarms_stay_within_the_poisson_bound_of_arl0 ({ "0" } contre { "0" }), the_monitors_table_parses_and_validates ; m3_every_attenuation_is_detected_within_twice_the_arl1 (strict, ignoré avec l'écart) ; tests de iq::campaign::detect ; tests de iq::monitor::stats (gaussian_two_sided_tail_matches_known_values) ; tests/iq_campaign.rs (les empreintes figées sont inchangées sans le tableau)

# text
seg-e214fbcbf22e = iq::campaign (detect, report, runner) ; iq::monitor::spectral (kurtosis_reference)

# text
seg-c7d9da2a1afd = tests/iq_campaign_roc.rs : r2_with_nothing_to_detect_the_roc_sits_at_chance (AUC cn0_drop { "0.500" }, sqm_delta { "0.566" }, power_drop { "0.639" } sur des événements indiqués qui n'atténuent rien) ; r1_the_cn0_drop_roc_separates_6_db_attenuations (strict, ignoré avec l'écart) ; tests de iq::campaign::detect (the_roc_of_separated_and_of_identical_samples, windows_tile_the_time_outside_the_events)

# text
seg-f1371f2a4da4 = iq::labfit (campaign, cn0, iqfit, iqreport, schema, mod) ; iq::cli::labfit

# text
seg-27c989c6bdde = tests/iq_labfit_campaign.rs : bar_c_holdout_prediction_intervals_cover_between_80_and_98_percent (couverture PI90 de { "0.891" } sur { "558" } classes, { "0.900" } sur { "10" } événements de temps jusqu'à la perte sous chaque modèle de verrouillage), the_report_carries_its_inputs_censoring_validation_and_labels (entrées, censure, hachage et verdicts de [validation], audit du bloc d'unités), the_cluster_bootstrap_reproduces_from_the_campaign_and_seed, a_validation_mode_fit_refuses_to_start_without_its_table ; bar_a_prime_delta_eff_is_recovered_and_q_is_stated_not_fitted, bar_d_closed_form_threshold_matches_the_direct_estimate_within_1_db et bar_b_prime_ci_subset (stricts, ignorés avec l'écart) ; bar_b_prime_full_set_of_50_campaigns (ignoré, exécuté avant la publication) ; tests de iq::labfit::cn0 (dégénérescence exacte Q-delta, récupération de delta au Q indiqué, inverse du seuil en forme close) ; tests de iq::labfit::iqfit (les conditions du modèle de verrouillage reproduisent exactement le modèle de C/N0) ; tests/iq_labfit_followup.rs (la suite enregistrée dans 1e532f84 : s1_delta_eff_on_the_stepped_campaign MET, s2_d_as_written_on_the_stepped_campaign affirmant le NOT MET enregistré, r1_dwell_corrected_d_on_the_fresh_ramp_campaign MET, en release)

# text
seg-50acb4bcdd8a = tests/gps_lnav_rtklib_decode_oracle.rs::rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43 (constat figé) ; tests/gps_lnav_rtklib_decode_oracle.rs::kshana_lnav_subframes_decode_in_rtklib_to_the_broadcast_parameters (strict, ignoré avec l'écart)

# text
seg-90748b60b720 = tests/gps_lnav_rtklib_integer_oracle.rs::kshana_lnav_integers_decode_in_rtklib_from_an_unseen_broadcast_file ({ "32" } satellites du fichier de diffusion IGS du { "2" } mars { "2025" } : { "960" } mots sur { "960" } passent la parité RTKLIB, { "96" } sous-trames sur { "96" } se décodent, { "608" } entiers diffusés décodés sur { "608" } sont égaux à ceux de Kshana, chaque entrée à une demi-quantum près, semaine et temps exacts) ; gps_lnav::tests

# text
seg-c20f6fc678c5 = acquisition, portable_math, realdata::ion_sdr, realdata::lugre

# text
seg-6bf9cba81288 = tests/lugre_acquisition_gnss_sdr_oracle.rs::finding_dc_artefacts_and_no_contemporaneous_flight_cn0 (constat figé, conditionné aux données) ; tests/lugre_acquisition_gnss_sdr_oracle.rs::acquisition_and_relative_cn0_on_lugre_iq_match_gnss_sdr_and_the_flight_receiver (strict, ignoré avec l'écart) ; acquisition::tests ; realdata::ion_sdr::tests ; realdata::lugre::tests

# text
seg-709106f38b9d = acquisition, realdata::ion_sdr

# text
seg-cfefde0dbf55 = tests/lugre_acquisition_predicted_doppler_oracle.rs::noise_alone_crosses_the_sample_power_threshold_on_lugre_iq (constat figé, conditionné aux données) ; tests/lugre_acquisition_predicted_doppler_oracle.rs::acquired_doppler_differences_on_lugre_iq_match_the_orbit_prediction (strict, ignoré avec l'écart)

# text
seg-b93425830963 = tests/lugre_acquisition_cell_average_doppler_oracle.rs::strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed (constat figé, conditionné aux données) ; tests/lugre_acquisition_cell_average_doppler_oracle.rs::cell_average_acquisitions_on_lugre_iq_match_the_orbit_predicted_doppler (strict, ignoré avec l'écart)

# text
seg-a6cce9d1c2fc = acquisition, realdata::ion_sdr, realdata::lugre

# text
seg-e953a0bb294b = tests/lugre_surface_acquisition_doppler_oracle.rs::each_surface_acquisition_is_a_single_predicted_visible_satellite (constat figé, conditionné aux données) ; tests/lugre_surface_acquisition_doppler_oracle.rs::surface_acquisitions_match_the_orbit_predicted_doppler (strict, ignoré avec l'écart)

# text
seg-b4e5e57515cc = lunar_dpnt::tests (le mode commun d'horloge s'annule exactement ; le résiduel croît avec la ligne de base ; réutilise la PL SBAS ; le nombre de satellites est respecté jusqu'à la limite de { "24" } du constructeur, de sorte qu'une constellation plus grande ne peut pas silencieusement en renvoyer une plus petite) ; tests/lunar_differential_pnt_reference.rs (résiduel à simple différence + solution de position WLS par rapport à lsq() de RTKLIB compilé à partir du code source C)

# text
# c1: oem
seg-6a567344f386 = lunar_interop::tests (l'OEM porte REF_FRAME/TIME_SYSTEM lunaires ; les métadonnées de temps font l'aller-retour ; enveloppe KIF) ; tests/lunar_interoperability_export_reference.rs (l'OEM lunaire émis par kshana relu par la bibliothèque Python indépendante <c1/> : jetons REF_FRAME/TIME_SYSTEM/CENTER + état par époque à la précision du format ; un export corrompu est rejeté) ; tests/lunar_interop_oem_oracle.rs::recorded_two_reader_outcome_is_for_todays_export

# text
seg-952626fc6feb = resilience::arch, resilience::score, resilience::diversity, resilience::timeline

# text
seg-921e4d47fd96 = resilience::score::tests (monotonie, bornes du composite, plafond de niveau, provenance modélisée) ; resilience::diversity::tests (Simpson inverse, mode commun, SPOF)

# text
seg-718240555c3c = resilience::stats, resilience::study, resilience::panel

# text
seg-0e1bd42aca5a = resilience::stats::tests (exemple manuel de tau de Kendall, simplexe de Dirichlet, taux d'inversion) ; resilience::study::tests (contrôle de stabilité, témoin d'instabilité, déclaré par rapport à mesuré, effondrement de la diversité)

# text
seg-246c5acb36ac = representativeness

# text
seg-300e70ee2f22 = representativeness::tests (validated-needs-external-anchor, modelled-needs-gap, modelled-TRL-ceiling, malformed-band, champs JSON)

# text
seg-03c943a8f1fc = qtrade

# text
seg-2d5a97db03cb = qtrade::tests (polarité du bénéfice plus haut/plus bas est meilleur, enveloppe fidèlement un vrai TradeResult, preuve malhonnête rejetée, un FoM validé exige un ancrage externe, JSON déterministe)

# text
seg-fe77856b9e9d = quantum_devices::tests (fiches d'horloge honnêtes et ordonnées ; précision d'intrication ~1/sqrt(tau) ; taux détecté -10x/10dB ; les comptages d'obscurité dégradent ; bornes du plancher systématique ; fiche modélisée et valide)

# text
seg-65f4bc801f94 = timetransfer_chain::tests (la précision s'améliore avec l'intégration ; le quantique peut gagner ET perdre ; PL finie et positive ; le FoM de sécurité est dans [{ "0,1" }] et croît avec le retard de l'attaque ; Pd d'anomalie monotone ; le compromis est is_honest)

# text
seg-52d8ccc852f8 = quantum_nav_od::tests (le quantique bat le classique sur une longue interruption ; l'avantage dépend de l'interruption ; le compromis est is_honest) ; tests/gnss_free_quantum_navigation_reference.rs (croissance de la position à l'estime par rapport à une double intégration Octave indépendante + l'ancrage de bruit publié de Freier-2016)

# text
seg-8e49ee940482 = quantum_faults::tests (valeurs connues d'AUC analytique ; l'AUC bootstrap empirique encadre la forme close ; le quantique détecte des défauts plus petits / une AUC plus élevée ; l'avantage disparaît pour des défauts énormes ; catalogue à 5 classes ; le compromis est is_honest)

# text
seg-d0119a3cb762 = geolocation

# text
seg-f85f780a9859 = geolocation::tests (TDOA sans bruit direct→inverse à { "1e-6" } m près ; J·CRLB=I avec une covariance symétrique définie positive ; la trace de la variance de position de la CRLB est non croissante quand un récepteur est ajouté ; TDOA+FDOA conjoints retrouvent la position+vitesse d'un émetteur mobile ; <{ "4" } récepteurs rejetés) ; tests/geolocation_reference.rs (allers-retours sur quatre géométries avec un réseau diversifié en 3D ; l'estimateur de Gauss–Newton atteint sa borne de Cramér–Rao — la covariance d'erreur empirique suit la borne analytique sur { "4000" } essais Monte-Carlo) ; tests/geolocation_crlb_published_oracle.rs (ho_chan_1993_maximum_tdoa ; ho_xu_2004_fig7_with_the_authors_corrected_source ; ho_xu_2004_bound_matches_the_authors_code ; finding_ho_chan_ottawa_printed_values_are_not_the_bound et finding_ho_xu_fig7_printed_source_is_not_the_plotted_one, figés)

# text
seg-47854be05818 = entry_eo_ascent::entry_heating (stagnation_heat_flux, simulate_entry)

# text
seg-067596c7a683 = entry_eo_ascent::entry_heating::tests::heat_flux_relation_has_the_published_form_and_constants; entry_eo_ascent::entry_heating::tests::lift_lowers_peak_deceleration_and_heat_flux_of_a_shallow_entry; entry_eo_ascent::entry_heating::tests::mars_entry_runs_with_the_mars_constants; tests/entry_stardust_published.rs (consigne { "746" } W/cm2 pour Stardust sans seuil)

# text
seg-b15628833cf8 = entry_eo_ascent::eo_radiometry (Imager, snr_budget, giqe4_niirs, EoRadiometryScenario)

# text
seg-86769d0258ad = entry_eo_ascent::eo_radiometry::tests::diffraction_mtf_has_its_closed_form_values; entry_eo_ascent::eo_radiometry::tests::a_pure_pixel_aperture_has_a_ramp_edge_and_rer_one; entry_eo_ascent::eo_radiometry::tests::a_gaussian_blur_has_the_normal_cdf_edge; entry_eo_ascent::eo_radiometry::tests::snr_budget_scales_as_shot_noise_when_signal_dominates; entry_eo_ascent::eo_radiometry::tests::giqe4_switches_coefficients_at_rer_0_9_and_falls_with_gsd

# text
seg-4e91b2b5c9e1 = entry_eo_ascent::ascent (simulate_ascent, AscentScenario) ; reentry::us76_pressure

# text
seg-a5f4b59e7ca1 = entry_eo_ascent::ascent::tests::the_loss_identity_holds_to_integration_error; entry_eo_ascent::ascent::tests::vertical_vacuum_burn_has_only_gravity_loss_and_stays_vertical; entry_eo_ascent::ascent::tests::us76_pressure_has_the_standard_values; entry_eo_ascent::ascent::tests::a_larger_kick_lowers_burnout_flight_path_angle

# text
seg-70ffbdec1a87 = twstft_budget (counter_readings, solve_offset, combined_uncertainty, flicker_phase, two_way_series, series_stability) ; time_transfer_budget (TimeTransferBudgetScenario, read_series)

# text
seg-998c0585be86 = twstft_budget::tests (l'équation bidirectionnelle retrouve exactement le décalage ; le terme de Sagnac est égal à la forme close en boucle BIPM ; le terme ionosphérique suit l'écart de fréquence et la troposphère s'annule ; la phase de scintillation a un TDEV plat ; un résiduel diurne relève le TDEV près d'une demi-journée ; un biais de réciprocité décale le décalage et non le TDEV ; la stabilité de la série retire un taux) ; time_transfer_budget::tests

# text
seg-d36d667bfa06 = optical_atmosphere (rytov_variance, scintillation, gamma_gamma_cdf, fade_margin_db, aperture_averaging_factor, cloud_optical_depth, clear_air_optical_depth) ; optical_linkbudget (optical_link_budget_atmosphere)

# text
seg-eb08517c6ca2 = tests/optical_atmosphere_reference.rs (seuils préenregistrés A1-A3 par rapport à la référence mpmath indépendante : { "216" } points de grille de Rytov, pire erreur relative { "3.4e-7" } contre un seuil de { "1e-6" }, scintillation pire cas { "4.5e-16" }, facteur d'ouverture pire cas { "5.7e-16" }, { "96" } probabilités d'évanouissement gamma-gamma pire cas { "1.3e-12" } en log10, épaisseur optique des nuages et de l'air clair pire cas { "6.6e-16" }) ; tests/optical_atmosphere_no_moved_output.rs (seuil A5 : le bilan de liaison à pertes globales et les sorties existantes de disponibilité de site sont identiques bit à bit au commit de base sur { "1,000" } jeux de paramètres)

# text
seg-70e033b9dcab = optical_weather; optical_sitediv; optical_techniques; optical_atmosphere_scenario

# text
seg-66ac747dbe38 = tests/optical_atmosphere_identities.rs (seuil A4 : rho = { "0" } est égal à l'union indépendante et rho = { "1" } au meilleur site unique à { "1e-12" } près, et zéro violation de monotonie dans le nombre de sites et dans la corrélation ; le premier passage de ce seuil a échoué de { "3e-9" } parce que la fonction de répartition normale utilisée était la forme d'Abramowitz-Stegun à { "1.5e-7" }, un défaut d'implémentation remplacé par la fonction de répartition de la gamma incomplète, le seuil restant inchangé) ; optical_weather::tests et optical_sitediv::tests (marge monotone, le plafond nuageux comme forme close, les identités de durée de coupure, inversion de la recherche de marge)

# text
seg-95a61b2025cb = optical_outage_holdover (couple, clock_psds) ; holdover (coast_phase_sigma, holdover_seconds, phase_to_range_m)

# text
seg-b47fe3bc618f = tests/optical_atmosphere_identities.rs (seuil A6 : l'erreur de synchronisation par coupure est égale à holdover::coast_phase_sigma et l'erreur de distance à phase_to_range_m bit à bit sur { "9" } horloges, { "3" } durées moyennes, { "3" } dispersions et { "4" } quantiles) ; optical_outage_holdover::tests

# text
seg-86ae3e4b0c16 = optical_timeseries (site_series, SiteModel, SeriesSpec, Series) ; optical_atmosphere_scenario (TimeseriesSpec)

# text
seg-a19b90ab43ec = tests/optical_atmosphere_timeseries.rs (seuils T1-T6 de xval/optical-atmosphere/PREREGISTRATION-timeseries.md, fixés avant le premier passage : même graine mêmes octets et autre graine autres octets ; pas de clé sans le tableau ; sur { "8760" } h à { "600" } s, graines { "37" } et { "38" }, la disponibilité réalisée de chacun des trois sites par défaut à moins de { "6" } points de celle indiquée (pire cas { "3.3" }) et la fraction nuageuse réalisée à moins de { "5" } points de la probabilité indiquée (pire cas { "2.1" }) ; la marge est égale au bilan moins les deux évanouissements et « up » est égal à « marge non négative » à chaque pas ; aucun appel mathématique non portable dans le module ; passages trop longs et mauvais pas refusés)

# text
seg-3c8d970a385d = odf (parse_odf, Odf, OdfObservation, OdfRamp, seconds_1950) ; mars_od (DopplerModel, RampTable, compress_two_way, MarsDynamics, fit, fit_damped) ; naif_kernel (SPK type { "1" }) ; gravity_pds (SphericalHarmonicField::from_shadr)

# text
seg-09bfff22ee94 = tests/mro_odf_reader_label_oracle.rs (un vrai ODF MRO, 2007-304/305, par rapport à son étiquette PDS : nombre d'enregistrements, positions de groupes, stations, heures de début et de fin et types de données concordent ; le nombre de lignes du tableau de fin de fichier est manqué d'une unité, une incohérence de l'étiquette, figée comme constat) ; odf::tests (aller-retour d'un enregistrement construit à la main, époque { "1950" }) ; tests/mro_odf_short_arc_od_oracle.rs (conditionné aux données, entrées figées par SHA-256, CI mensuelle avec données réelles exigée : Doppler prédit à partir de la reconstruction de navigation MRO mro_psp5 sur les passages DSS { "63" } et DSS { "14" } notés, { "12.5" } mHz RMS, seuil { "30" } mHz, satisfait ; la détermination d'orbite enregistrée n'a produit aucune orbite, figé comme constat ; passage { "2" } avec un estimateur amorti, enregistré séparément : orbite à { "0.36" } km RMS et { "0.53" } km au maximum par rapport à mro_psp5, satisfait, Doppler après ajustement { "48.6" } mHz contre { "30" } mHz, non satisfait, figé comme constat ; lecteur SPK de type { "1" } par rapport à CSPICE, { "5e-7" } m) ; mars_od::tests

# text
seg-526efea83384 = aocs_mekf (Mekf, GyroSim, attitude_error, spd_solve6) ; aocs_kind (estimator)

# text
seg-1650d00d45ad = aocs_mekf::tests::mekf_is_consistent_over_monte_carlo_seeds ({ "40" } graines, NEES moyen à six degrés de liberté sur la seconde moitié à { "4.5" } à { "7.5" } près) ; aocs_mekf::tests::star_tracker_updates_bound_the_attitude_error; aocs_mekf::tests::attitude_error_is_the_body_frame_small_angle; aocs_kind::tests::estimator_loop_runs_and_reports_consistency

# text
seg-4da98593fe6a = aperture_duty::tests (une fenêtre qui se termine exactement quand la suivante commence n'entre pas en contention, et la déplacer d'une seconde plus tôt coûte exactement une seconde — la garde contre l'erreur d'un cran ; des fenêtres qui se recouvrent au-delà du nombre d'ouvertures mettent la session de rang inférieur en coupure, l'intervalle de contention étant figé ; la politique d'arbitrage décide quel service détient l'ouverture, les chiffres des trois politiques étant figés sur un même plan ; le premier arrivé premier servi ne préempte pas une session qui détient déjà une ouverture ; une session qui perd l'arbitrage à son début acquiert une ouverture quand une se libère ; les trois taux d'utilisation rendent compte de chaque seconde d'ouverture disponible sur { "3" } politiques × { "4" } nombres d'ouvertures ; ajouter une ouverture n'augmente jamais la coupure d'aucune session, mesuré sur { "200" } plans pseudo-aléatoires × { "3" } politiques × chaque nombre d'ouvertures ; assez d'ouvertures pour chaque session ne laissent aucune coupure ; l'horizon de rapport tronque le plan et fixe le dénominateur du taux d'utilisation ; une liste de passages prédits devient un plan de contacts sans second type de fenêtre ; les chiffres de taux d'utilisation du plan fourni sont des sorties du moteur pour une et deux ouvertures ; le rapport énonce la politique qui a produit les chiffres ; chaque chiffre rapporté porte une unité et une classe de provenance ; le scénario est reproductible et se déclare MODELLED ; le scénario rejette un plan qu'il ne peut pas planifier) ; api::tests::aperture_duty_cycle_kind_round_trips_through_the_dispatch

# text
seg-875ebc4e1cc4 = lunar_jamming (composant jamming, lunar_service, lunar)

# text
seg-d206adbe8e04 = lunar_jamming::tests ({ "17" } tests de bibliothèque : j_over_s_equals_the_difference_of_two_independent_link_budget_runs; the_report_prints_both_link_budget_legs_so_the_difference_is_checkable_from_it; the_scenario_reports_one_j_over_s_row_per_visible_satellite_and_never_a_median; a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports; a_closer_jammer_raises_j_over_s_by_exactly_the_free_space_loss_difference; a_more_distant_satellite_is_the_weaker_signal_so_it_carries_the_higher_j_over_s; j_over_s_is_invariant_to_the_user_antenna_boresight_gain; a_narrowband_jammer_leaves_no_higher_effective_cn0_than_broadband_at_equal_js; a_selenographic_jammer_gets_its_range_from_the_shared_lunar_geometry; a_strong_enough_jammer_takes_every_lunar_link_below_the_tracking_threshold; no_jammer_is_a_clean_sky_lunar_baseline_with_an_undefined_j_over_s; raising_the_elevation_mask_can_only_remove_rows_never_change_the_ones_that_remain; every_emitted_numeric_field_has_a_unit_and_a_provenance_class; the_csv_table_carries_every_row_of_the_json_table; the_run_is_deterministic_and_the_dispatch_surface_is_populated; bad_inputs_are_rejected_rather_than_producing_a_number) ; api::tests::lunar_jamming_kind_round_trips_through_the_dispatch_with_a_per_satellite_table

# text
seg-ec5736cbb3b4 = lunar_jamming (denial_js_db, range_for_free_space_path_loss_m, Cn0Distribution, DenialContourPoint, ContourBand, DenialContour ; inversion de jamming::effective_cn0_dbhz, jamming::j_over_s_db et jamming::free_space_path_loss_db)

# text
seg-cdcfbbc52ae5 = lunar_jamming::tests ({ "10" } tests de bibliothèque : the_contour_is_the_exact_inverse_of_the_functions_the_rows_were_scored_with; the_band_is_the_measured_quantiles_pushed_through_the_contour_not_a_sigma; the_asymmetry_the_band_carries_is_the_samples_own_shape_bent_by_the_criterion; the_contour_is_monotone_in_cn0_measured_over_a_dense_sweep_not_assumed; the_band_recovers_the_split_verdict_the_single_scalar_contour_lost; the_distribution_is_the_tables_own_order_statistics_and_keeps_the_rows; a_link_already_below_the_threshold_gets_a_null_contour_point_not_a_number; a_clean_sky_run_has_no_contour_at_all_rather_than_an_empty_one; the_denial_threshold_is_the_same_thirty_decibels_the_rest_of_the_engine_uses; the_units_block_describes_the_contour_and_names_nothing_the_report_omits)

# text
seg-83724a2a8e06 = hybrid_integrity::tests (la courbe de puissance de détection va du taux de fausse alarme à défaut nul jusqu'à { "1" } − P_md au biais minimal détectable ; le biais minimal détectable réinjecté dans noncentral_chi2_cdf au seuil que le moniteur lui-même a appliqué renvoie P_md à { "1e-9" } près, sur chaque axe et par l'assistant public ; un biais effectivement injecté dans l'estimation RF décale la statistique propre du moniteur d'exactement b²/(σ_rf² + σ_opt²) calculé à la main ; un biais sans bruit est détecté au-dessus de √(T/λ*)×MDB et manqué en dessous, l'échelle injectée encadrant ce croisement ; la puissance de détection est monotone avec l'amplitude du défaut et identique sur les quatre axes en multiples de MDB ; un Monte-Carlo à graine de 200,000 échantillons de la statistique du moniteur reproduit la puissance analytique à 4σ près en quatre points de la courbe ; le MDB de synchronisation temporelle est figé au-dessus de la limite d'alerte de synchronisation temporelle, ce qui est une faiblesse mesurée et non une fonctionnalité ; le quantile de Wilson-Hilferty est mesuré comme différant du seuil exact du moniteur d'environ { "4" } %, ce qui consigne pourquoi il n'a pas été utilisé ; le chiffre en rampe est exactement MDB/taux et varie en sens inverse du taux, et un taux non positif rapporte null plutôt que zéro) ; tests/hybrid_fault_power_scipy_oracle.rs (report_detection_power_matches_scipy_chi2_and_ncx2 ; report_detection_power_matches_scipy_with_comparable_sigmas)

# text
seg-f9767a6109d5 = hybrid_integrity::tests (l'inertie part exactement de la trace de covariance que le bloc de transfert rapporte, dans les deux sens, de sorte que la diagonale rejouée ne peut pas dériver du transfert rapporté ; le temps de croisement rapporté est recalculé à partir du sigma de transfert, de la DSP de bruit de processus et du facteur de couverture propres au rapport, et la borne est à l'intérieur de la limite d'alerte juste avant lui et à l'extérieur juste après ; le temps d'inertie varie exactement en sens inverse de la DSP de bruit de processus et raccourcit quand la limite d'alerte se resserre ; une inertie à DSP nulle rapporte null plutôt qu'un temps nul, parce que jamais n'est pas immédiatement ; le profil émis croise exactement une fois et encadre le croisement rapporté ; le temps de doublement de la variance et le temps de croisement de la limite d'alerte sont figés séparément, étant différents de huit ordres de grandeur après l'étage optique serré et à moins d'un ordre de grandeur après l'étage RF lâche ; quitter la modalité optique achète plus de temps d'inertie que quitter la RF, exactement de la différence de covariance divisée par le taux de croissance horizontal ; et random_walk_time_to_limit distingue déjà-à-l'extérieur, croise-à-t et ne-croise-jamais)

# text
seg-6d2b55212f40 = lunar_service, antenna

# text
seg-730b359e2c3f = antenna::tests et lunar_service::tests (le croisement à mi-puissance localisé par bissection sur le diagramme concorde avec x = { "1.61634" } d'Airy publié et donne la largeur exacte de { "1.02899" }·λ/D, ce qui consigne que le coefficient conventionnel { "1.02" } se situe à −{ "2.955" } dB et non −{ "3.010" } dB ; le diagramme est strictement décroissant sur { "400" } points de l'axe au premier zéro ; l'algèbre d'efficacité implicite fait l'aller-retour à { "1e-12" } près et reproduit { "0.641" } / { "0.920" } ; l'angle hors axe concorde avec tan θ = R·sin γ/(r − R·cos γ) en { "20" } points et les deux limites à { "1e-12" } près ; le cône approché contient le faisceau réel ligne par ligne ; les comptages principaux sont égaux aux indicateurs par ligne qu'ils résument et la correction est égale à leur différence ; chaque verdict de ligne est recalculable à partir du seul rapport émis ; chaque champ numérique et booléen émis porte une unité et une classe de provenance ; une ouverture impossible n'émet aucun bloc ; sans antenne configurée, l'export conserve exactement ses six clés préexistantes, { "0" } feuille modifiée et { "0" } supprimée) ; tests/validate_lunar_export_offboresight_spice.rs (flown_orbiter_export_matches_spice_geometry_and_scipy_pattern ; documented_working_point_matches_anise_propagation_and_scipy_pattern)

# text
seg-9910640b7886 = tracking_loop (composant sdr, jamming)

# text
seg-a3538a1ff1f4 = tracking_loop::tests (gigue du discriminateur de Costas en boucle ouverte par rapport à sdr::correlate avancé pas à pas sur une IF synthétique à graine, { "3" } réalisations de bruit groupées × { "900" } époques, concordant à { "0.63" } % sur 35-45 dB-Hz, le terme de perte de quadrature devant s'ajuster au moins { "3" }× mieux que la forme sans perte de quadrature partout où il est résoluble ; la saturation du discriminateur atan à ~{ "32" } dB-Hz affirmée plutôt que simplement énoncée, de sorte que la limite de validité est figée ; σ en boucle fermée par rapport à une boucle de Costas sdr avancée pas à pas sur { "4000" } époques à { "3.7" } % ; retard de rampe de la DLL du premier ordre par rapport à une DLL sdr avancée pas à pas à { "0.17" } % ; bessel_i0 par rapport à I₀ tabulée à { "7.4e-8" } ; la largeur d'hystérésis devant tomber dans [{ "5" }·log₁₀ r, { "10" }·log₁₀ r] sur { "4" } rapports × { "2" } temps d'intégration × { "3" } largeurs de bande) ; api::tests::tracking_loop_kind_round_trips_through_the_dispatch ; tests/tracking_loop_gnss_sdr_oracle.rs::finding_is_pinned

# text
seg-e6236f142dae = lunar_vlbi_fim (composant lunar_vlbi, fim, cio, lunar_frame, frames)

# text
# c1: estimate_beacon
seg-5744a8471387 = lunar_vlbi_fim::tests ({ "7" } tests de bibliothèque : chaque graphie de datum fait l'aller-retour par parse/as_str et une graphie inconnue est refusée ; tenir chaque station sans la balise est refusé avec une erreur nommant <c1/> ; le bras de levier est affirmé ÉGAL à ρ/B et l'équipartition de balise ÉGALE à l'équipartition de station multipliée par lui, les deux à { "1e-15" } près, avec une assertion supplémentaire que le bras de levier dépasse { "10" } de sorte que les deux bilans ne sont pas confondables sur cette géométrie ; la ligne de base publiée du jeu d'essai est figée à { "10726.748" } km et son calendrier de 49 échantillons est affirmé donner strictement moins de { "49" } observations mutuellement visibles ; le spectre de balise sur une ligne de base unique est mesuré comme couvrant au moins cinq décades et le rapport obtenu affirmé supérieur à { "1" } par AM-HM et supérieur à { "100" } en fait ; la disposition station-plus-balise est affirmée déficiente en rang avec LES DEUX champs calculés nuls alors que le comparant modélisé rapporte toujours. Plus une garde sur le jeu d'essai lui-même : une clé de niveau supérieur greffée après un tableau de tables devient à la place une donnée de station, de sorte que le point de greffe est affirmé et le scénario analysé vérifié comme portant la clé — le mode de défaillance est un passage qui utilise silencieusement une configuration différente de celle que le test nomme)

# text
seg-08708f044bb5 = lunar_dpnt::tests (une garde purement additive dont le delta d'ensemble de clés est exactement { "{" }correction_link, units{ "}" } avec chaque valeur préexistante identique bit à bit à des littéraux capturés avant le changement ; l'erreur de levé NE se décorrèle PAS avec la ligne de base alors que le terme d'orbite le fait, et survit à une ligne de base nulle où le terme d'orbite est exactement nul — le contrôle structurel qui détecte le câblage du terme au mauvais endroit ; une erreur de station de { "1" } m se transfère { "1" }:{ "1" } et est prouvée non amplifiée par le DOP ; une latence nulle reproduit le résiduel non vieilli bit à bit et le résiduel est monotone avec la latence, la courbe émise étant égale aux passages directs ; le pas de quantification se divise exactement par deux par bit et σ² = step²/12, et la pleine échelle suit les grandeurs injectées ; chaque terme désactivé tour à tour retrouve les deux autres en quadrature ; un σ égal par satellite se propage exactement en σ·PDOP et ce PDOP concorde avec orbit::dop ; chaque champ émis porte une unité et une classe de provenance, vérifié dans les deux sens)

# text
seg-810a6946b5cd = lunar_station (sur lunar_dpnt, lunar_service)

# text
seg-ef86901b5985 = tests/lunar_station_coverage_reference.rs (one_point_one_epoch_one_trial_reduces_to_lunar_differential_pnt : à { "1e-12" } m près avec et sans bruit de récepteur ; zero_baseline_floor_is_zero_in_every_trial : { "0" } à { "1e-9" } m près ; survey_floor_matches_the_survey_transfer_prediction : p95 dans la bande de { "5" } % énoncée avant le passage ; coverage_is_non_decreasing_in_the_threshold ; corrected_error_grows_with_distance_along_an_azimuth ; three_satellites_are_unavailable_with_a_reason_and_no_error ; a_satellite_the_station_does_not_see_is_reported ; deterministic_for_a_seed_and_moved_by_another ; the_work_guard_refuses_an_oversized_grid ; the_bundled_scenario_states_a_source_for_every_input ; the_result_is_labelled_modelled_with_the_honesty_statement) ; tests/lunar_station_numpy_oracle.rs (le recalcul numpy préenregistré, consigné avec son échec) ; lunar_service::tests::south_polar_ring_grid_is_the_published_comparison_grid ; tests/lunar_differential_pnt_reference.rs et les références d'or du registre et multiplateformes inchangées (additivité) ; tests/field_units_global.rs (chaque champ émis décrit, sans exemption)

# text
seg-641b41572fd9 = lunar_terrain (sur skyline, lunar_service::topocentric_basis) ; lunar_station ; lunar_service (coverage_masked, masked_visible)

# text
seg-44e74fb6a0a1 = lunar_terrain::tests (bare_sphere_horizon_is_the_dip : la progression du rayon reproduit -acos(R / (R + a)) à { "1e-3" } deg près à chaque azimut ; a_cone_on_a_lat_lon_tile_matches_the_analytic_cone : le même cône échantillonné sur une tuile de latitude/longitude de { "0.005" } deg concorde avec le cône analytique à { "0.25" } deg près ; a_lat_lon_tile_is_none_outside_and_wraps_longitude ; crater_in_plateau_matches_the_closed_form : un cratère à fond plat sur la sphère, observateur au centre et à { "4" } km et { "7" } km de celui-ci, par rapport à l'élévation de rebord en forme close atan2((R + H) cos s - (R + a), (R + H) sin s) avec s tiré de l'équation de croisement sphérique du rebord, à { "0.01" } deg près à chaque azimut ; rasterised_cone_matches_the_analytic_cone : un cône rastérisé sur une grille stéréographique polaire de { "200" } m et lu par l'échantillonneur de grille concorde avec le cône analytique à { "0.25" } deg près ; projection_round_trips_through_the_rasteriser_layout ; bilinear_reproduces_a_plane_exactly ; stated_horizon_goes_through_the_skyline_rules ; an_empty_skyline_is_exactly_the_flat_test) ; tests/lunar_station_terrain.rs (without_terrain_the_document_has_no_terrain_keys ; a_zero_horizon_under_a_positive_mask_is_the_flat_run, pour les deux types de scénario ; a_horizon_only_removes_satellites_and_a_wall_removes_everything : user_lt4 conserve son compte à plat et les époques qu'un horizon coûte sont terrain_masked (la disponibilité elle-même peut augmenter, car un horizon peut cacher un satellite que la station ne voit pas), et un horizon de { "89" } deg à la station ne laisse rien de disponible ; bad_terrain_sections_are_refused ; the_vendored_crop_loads_and_is_oriented_as_the_source : les fonds des cratères Shackleton et Haworth bas, le massif de Malapert haut, l'image miroir non ; the_station_site_horizon_from_the_crop ; service_volume_dem_points_outside_the_crop_keep_the_flat_mask ; a_lat_lon_dem_tile_gives_the_station_the_crop_horizon : une tuile rééchantillonnée à partir du recadrage fourni donne à la station l'horizon du recadrage à { "0.22" } deg près (borne { "0.5" } deg, fixée avant le passage), avec l'écho de tuile et les unités, et dem_path avec dem_tile_path refusé ; the_export_site_is_masked_by_the_terrain : chaque ligne d'export dégage le terrain exactement quand elle est visible et à ou au-dessus de l'horizon du site à son azimut, la géométrie ne bouge pas, le CSV ne gagne la colonne qu'avec le terrain ; the_horizon_matches_the_preregistered_numpy_ray_cast) ; tests/prediction_frozen.rs et les références d'or du registre et multiplateformes inchangées (additivité)

# text
seg-27acdf36c5da = lunar_receiver ; lunar_station

# text
seg-8fa2f3da879e = lunar_receiver::tests (multipath_is_the_do229_form ; dll_noise_matches_a_hand_computation : { "0.825279" } m à { "45" } dB-Hz, { "0.5" } Hz, d = { "1" }, { "20" } ms ; bad_sections_are_refused) ; tests/lunar_station_ext.rs (receiver_absent_or_silent_is_the_plain_run ; zero_baseline_multipath_is_the_difference_of_two_receivers : sigma d'échantillon sqrt({ "2" }) a à { "6" } % près ; station_multipath_is_gauss_markov : corrélation de décalage 1 exp(-dt / tau) à { "0.01" } près, variance unité à { "2" } % près ; inter_channel_biases_are_constant_over_a_trial) ; tests/prediction_frozen.rs et les références d'or inchangés (additivité)

# text
seg-304fd4238326 = lunar_station (orbit_growth_range_sigma_m)

# text
seg-c3a151ee3d10 = tests/lunar_station_ext.rs (growth_absent_or_zero_is_the_frozen_error_run ; the_growth_term_has_the_closed_form_sigma : l'erreur de liaison avec croissance moins l'erreur sans croissance a un sigma d'échantillon taux tau / sqrt({ "3" }) à { "6" } % près sur { "1600" } tirages ; linear_growth_is_the_first_order_propagated_error : une erreur de vitesse dv propagée avec l'intégrateur à deux corps du dépôt à partir de l'orbite du scénario déplace la position de dv tau à { "1" } % près à { "60" } s et { "600" } s) ; tests/lunar_station_published_oracle.rs::k5_growth_addendum_run (ignoré, l'addendum consigné)

# text
seg-a866350f7eb2 = lunar_solution ; lunar_station (solution_figures)

# text
seg-41f22cf8dd08 = lunar_solution::tests (one_epoch_without_height_is_the_snapshot_solve : égal à lunar_dpnt::position_error_vector_from_range_errors à { "1e-8" } m près, une ligne de hauteur lâche ne change rien, une serrée fige l'erreur de hauteur ; three_satellites_need_the_height_row ; a_window_shares_the_position ; bad_sections_are_refused) ; tests/lunar_station_ext.rs (the_default_solution_mode_is_the_snapshot_solve : chaque chiffre à { "1e-6" } près en relatif ; height_aiding_and_a_window_do_what_they_say) ; tests/lunar_station_published_oracle.rs::solution_style_addendum_run (ignoré, l'addendum consigné)

# text
seg-7217c3bf841e = tests/lunar_station_published_oracle.rs::recorded_finding_one_of_six_bars_passes (les chiffres consignés par rapport aux seuils enregistrés) ; tests/lunar_station_published_oracle.rs::published_claims_comparison_run (ignoré, environ { "7" } s en release : réexécute les six cas enregistrés et vérifie les chiffres consignés)

# text
seg-9b655d02dc39 = araim_reference (add_v42_subset_plan, add_v42_protection_levels_to_order) ; raim (araim_subset_raim, SubsetRule)

# text
seg-feaea6cb2b12 = tests/raim_multi_sv_subsets.rs (deeper_orders_change_nothing_when_pairs_suffice ; triples_are_refused_at_order_two_and_planned_deeper : N_fault,max >= { "3" }, le risque non surveillé dans P_THRES, un sous-ensemble retirant trois satellites ou plus surveillé, et plus de dix a priori surveillés redérivés indépendamment comme P_no fault q^k à { "1e-12" } près ; a_two_satellite_fault_is_found_as_a_pair : aucune alarme sans défaut, et un biais de { "30" } m sur deux satellites détecté avec la paire comme sous-ensemble de plus grande séparation normalisée) ; tests/araim_reference_vectors.rs et tests/integrity_araim_stanford_oracle.rs inchangés (le chemin d'ordre 2 est celui vérifié par MAAST)

# text
seg-7fa54ce845e3 = clock_integrity (run, sky_at, IntegrityCfg) ; scenario (Scenario::integrity) ; report (RunResult::integrity_fom) ; api (répartition clock)

# text
seg-b9a184f14d5a = tests/clock_integrity.rs (the_block_is_separate_and_absent_by_default : chiffres de holdover inchangés, { "111" } époques refusées indisponibles sans niveau de protection, refusé avec runs > { "1" } ; protection_levels_are_the_snapshot_raims_on_the_same_sky : le HPL et le VPL de chaque époque échantillonnée sont exactement égaux à un snapshot_raim à résidu nul sur le même ciel prédéfini, et le passage sans défaut ne lève aucune alarme ; a_stated_bias_is_detected_while_it_lasts : un biais de { "60" } m alarme exactement sur les { "10" } époques qu'il couvre ; every_integrity_field_has_a_unit) ; clock_integrity::tests ; les références d'or de clock inchangées

# text
seg-3ba62864dd31 = cislunar_observability, observability_gramian, intersat_range, cislunar_srif

# text
# c1: units
seg-02de44e48cf6 = cislunar_observability::tests et observability_gramian::tests (le document par défaut figé bit à bit par FNV-1a de son JSON, de son résumé et de son SVG, avec des valeurs par défaut explicites affirmées sans effet et les huit clés d'extension affirmées ABSENTES afin que la capture ne puisse pas être régénérée en auto-comparaison ; le bloc additif <c1/> exclu du gel en étant retiré puis rehaché par rapport à la constante figée avant qu'il n'existe, ce qui prouve plutôt que suppose que rien de ce qui a été publié n'a bougé ; invariance du rang sous un sigma homoscédastique affirmée à σ = { "0" }, { "0.1" }, { "1" }, { "10" }, { "100" } m ; σ_pos affirmé varier exactement linéairement avec σ à { "1e-6" } près en relatif ; l'espace nul de la DRO affirmé être exactement les axes de coordonnées z et ż avec les deux causes séparées — une ligne de portée entre engins coplanaires a û_z = { "0" }, et le bloc hors plan de la CR3BP se découple exactement à z = { "0" } ; jacobiennes spatiales par rapport à des différences finies centrales et par rapport à l'observable 3-D de vitesse de portée indépendant de la crate ; familles hors plan refusées en mode planaire)

# text
seg-455bea44de27 = frame_eop, realtime_frame_eop

# text
seg-faacca83ed58 = frame_eop::tests, realtime_frame_eop::tests et tests/operational_eop_predictor_reference.rs (récupération des coefficients du signal analytique à { "1e-9" } près sur une fenêtre de 365 jours ; un ajustement biais-plus-taux égal à la pente et à l'ordonnée à l'origine des moindres carrés ordinaires en forme close à { "1e-12" } près sur des lignes réelles ; DEUX détecteurs d'anticipation qui sabotent les colonnes UT1 rapide et pôle de chaque ligne après l'époque d'émission — en laissant intacts les finals du Bulletin B — et exigent une sortie identique bit à bit, vérifiés par mutation pour faire virer { "10" } tests au rouge quand la barrière d'ajustement est desserrée d'exactement un jour ; une liste d'époques reconstruite indépendamment ; le bloc Bulletin B d'une cible blanchi et l'époque montrée comme quittant le tableau ; admission des termes vérifiée à des fenêtres de { "6" }, { "15" }, { "150" } et 365 jours ; nombres de lignes monotones ; et une capture gelée du rapport par défaut avant le changement, affirmée champ par champ sans tolérance, qui affirme en outre que la capture ne contient pas les nouvelles clés afin qu'elle ne puisse pas être régénérée silencieusement en auto-comparaison) ; tests/operational_eop_predictor_bulletin_a_oracle.rs::predictor_mae_against_bulletin_a_and_the_pcc_range_finding ; tests/operational_eop_ls_ar_bulletin_a_oracle.rs::ls_ar_predictor_against_bulletin_a_finding ; tests/eop_prediction_beyond_table.rs (l'extension optionnelle EopSeries::with_ls_ar_prediction au-delà de la dernière ligne : réponses dans le tableau identiques bit à bit, lignes de prévision égales à ls_ar_predict, arguments de référentiel au-delà du tableau suivant la prévision au lieu d'être tronqués ; cohérence interne)

# text
seg-c77bd56a0619 = lunar_frame_campaign (composant lunar_vlbi, lunar_vlbi_fim, fim, lunar, lunar_frame_realise, frames, cio, lunar_frame)

# text
seg-98fa9786f0c9 = lunar_frame_campaign::tests ({ "21" } tests de bibliothèque : la conception de Helmert par rapport à une différence finie centrale de lunar_frame_realise::apply_helmert — le module POUR lequel le datum existe, qui ne calcule aucune dérivée et fige donc la convention de signe de [p]ₓ — les { "84" } entrées de conception concordant toutes à < { "1e-6" } ; une translation pure du réseau relue comme une translation pure avec une fuite < { "1e-6" } vers les six autres paramètres ; le sigma de datum exactement linéaire avec le sigma de retard à { "1e-8" } près sur un changement d'un facteur { "3" } sur les sept paramètres ; un arc de { "16" } h mesuré pire et un arc de { "48" } h mesuré meilleur que { "24" } h, avec le balayage de libration émis ordonné de la même façon ; l'axe de translation le pire affirmé ÊTRE l'axe dominant de la direction solidaire du corps vers la Terre mesurée séparément et pire que les autres de > { "5" }×, une référence de physique dont rien dans le solveur n'a été informé ; trois balises colinéaires produisant un défaut avec chaque sigma de datum NULL et les directions nulles émises dans la base à sept paramètres ; offblock_fraction et corrélation inter-balises exactement { "0.0" } avec les stations fixes et toutes deux > { "0" } avec elles estimées ; les chiffres de transformation injectée du bloc de comparaison montrés égaux à un passage indépendant de ce scénario à { "1e-14" } près en relatif plutôt que transcrits ; une garde qu'aucun datum injecté/récupéré n'apparaît où que ce soit dans le document ; l'émission de la réalisation du référentiel lunaire figée octet par octet par FNV-1a-64 sur json‖summary‖svg pour trois formes d'entrée, empreintes prises avant le début du travail) ; tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_frame_campaign_finding_stations_estimated_p2_precision (conditionné ; le test strict lunar_frame_campaign_matches_spice_geometry_and_numpy reste ignoré) ; tests/lunar_frame_campaign_mpmath_oracle.rs::lunar_frame_campaign_datum_matches_mpmath_extended_precision (constat ; décision du fondateur 2026-10-02, option A : cette ligne reste MODELLED et n'emprunte pas le statut de la ligne distincte ; par rapport à une référence mpmath à 50 chiffres, préenregistrée 804662d5, les sigmas de datum à stations estimées du moteur sont dans leur borne d'erreur inverse a priori, à { "9.7e-6" } près le 2024-01-01, et le seuil de { "1e-9" } était en dessous de ce que toute voie en double précision atteint, la meilleure, une projection QR NumPy, étant à { "5.5e-9" } ; les preuves appuient la ligne distincte « Covariance de datum du référentiel lunaire avec les stations estimées, par rapport à la précision étendue à 50 chiffres ») ; tests/lunar_frame_campaign_pinv_fallback.rs::finding_step0_fresh_beacon_information_falls_back (figé) ; tests/lunar_frame_campaign_cond_bar_oracle.rs::finding_p2_condition_scaled_bar_not_met_on_the_estimated_scenarios (figé)

# text
seg-f3fcc6b9e10a = cislunar_arc_recovery, batch_ls

# text
seg-457a19842691 = cislunar_arc_recovery::tests et tests/cislunar_arc_recovery_reference.rs (les deux frontières et leurs rapports figés sur la grille publiée ; la courbe d'erreur mesurée comparée à la covariance formelle ligne par ligne avec une borne d'un facteur deux par ligne et une borne en moyenne géométrique ; un TÉMOIN NÉGATIF — le DRO planaire à six états — affirmant que le critère PEUT échouer et que l'estimateur non régularisé diverge au-delà de { "1e6" } km plutôt que de renvoyer une petite erreur plausible ; l'invariance de la paramétrisation affirmée sur chaque préfixe à { "1e-3" } près en relatif ; une garde sur le texte source qui retire les commentaires, les littéraux de chaîne et le module de test puis échoue à toute mention de la jacobienne, de la STM, du rang SVD ou de la machinerie SRIF, vérifiée par mutation en injectant un appel interdit ; un contrôle réservé aux tests que les différences finies sont égales aux lignes analytiques, de sorte que la linéarisation est connue pour être bonne alors que la voie analytique reste absente de l'estimateur ; déterminisme affirmé octet par octet ; le document cislunar-observability publié figé par son ensemble de clés, son empreinte canonique et sa ligne de résumé)

# text
seg-b6b73589032f = lunar_ephemeris, lunar_service

# text
# c1: ephemeris_path
seg-4cab37e82f00 = lunar_ephemeris::tests (analyse du format et du référentiel ; interpolation de Lagrange exacte aux nœuds et sur une trace linéaire hors nœud ; les éléments ICRF suivent la réduction IAU { "2015" } et sont égaux à l'octet à une application explicite d'icrf_to_iau_moon ; aller-retour anomalie vraie↔moyenne par rapport à une résolution de Kepler directe ; fichiers mal formés refusés avec la raison nommée). lunar_service::tests (avec <c1/> non défini, l'ensemble de clés du rapport et son SHA-256 sont figés ; la ligne képlérienne est égale au passage képlérien autonome champ par champ ; l'identité σ_required · HPL_max / σ_URE = AL, puis un nouveau passage DE BOUT EN BOUT à l'exigence calculée atteignant { "100" } % de disponibilité du niveau de protection et un nouveau passage à { "1" } % au-dessus ne l'atteignant pas ; chaque champ numérique émis des deux nouveaux blocs parcouru depuis le JSON produit pour une unité et une classe de provenance ; les jeux d'essai commités rapprochés de leurs tableaux sources satellite par satellite ; un horizon au-delà de la fin d'un tableau refusé) ; tests/lunar_service_requirement_orekit_oracle.rs::lncss_b_dense_finding_is_unchanged ; tests/lunar_service_volume_orekit_oracle.rs::service_volume_matches_orekit_on_identical_ephemeris_and_grid

# text
seg-34bff3218a01 = tests/field_units_global.rs (les { "61" } types de scénario enregistrés s'exécutent tous, une forme de document chacun : chaque feuille numérique doit se résoudre en une entrée du propre bloc d'unités de ce document ; une entrée mal formée compte comme manquante pour CHAQUE type de scénario, exempté ou non, de sorte qu'un substitut n'achète aucune couverture ; la liste d'exemption ne peut pas dépasser son plafond figé, un type de scénario listé qui se révèle entièrement couvert FAIT ÉCHOUER la barrière afin que la liste ne puisse pas être gonflée, et un type de scénario enregistré absent du tableau du lanceur échoue afin qu'un nouveau paquet ne puisse pas se glisser sans examen — ce qui s'est produit, attrapant les deux types ajoutés après le début de ce travail ; un cliquet à sens unique sur l'arriéré décrit-mais-non-défini ; et un contrôle d'obsolescence sur le document de schéma commité) ; field_schema::tests

# text
seg-926c069f8a2e = lunar_llr (sur lunar_frame_campaign::beacon_information, schedule_for et solve_datum_information, lunar_vlbi_fim)

# text
seg-9c29f0e9a061 = tests/lunar_station_geodesy.rs (empty_or_absent_extra_lists_are_bit_identical : des listes vides et l'exemple de référence de base donnent le rapport et le résumé par défaut octet par octet ; an_added_site_never_increases_any_variance : la plus petite valeur propre de H_after - H_before est non négative à { "1e-9" } de la plus grande, chaque rapport de sigma après/avant est au plus un, et les deux sites ajoutés sont observés ; the_rest_of_the_report_is_the_five_array_result ; every_station_geodesy_field_has_a_unit ; a_beacon_list_inside_the_campaign_block_is_refused) ; scenarios/lunar-station-geodesy-baseline.toml et scenarios/lunar-station-geodesy-with-station.toml (même calendrier archivé et même bloc de campagne VLBI)

# text
seg-c56512172ce5 = scripts/gate.sh, scripts/check-gate-receipt.sh, scripts/check-repeatability.sh, scripts/install-gate-hook.sh

# text
seg-94641c011229 = tests/source_guards.rs ({ "9" } tests : les deux gardes sur tout l'arbre source, plus des jeux de mutation qui notent chaque garde dans les deux sens — le motif F22 signalé sur les deux chemins en collision, le correctif de séquence atomique livré accepté, un demi-correctif signalé sur exactement le chemin qui a perdu son composant unique, un descripteur de fichier temporaire et un répertoire unique hérité acceptés, une horloge murale rejetée ; une épingle non déclarée signalée, une déclarée acceptée, une portée sans exclusion rejetée, une déclaration dans le commentaire de documentation du test englobant acceptée et montrée comme ne débordant pas sur le test suivant ; et chaque graphie d'épingle — hexadécimal, décimal, chaîne de condensat, longueur en octets, nombre d'octets nommé, fichier de référence d'or — vue alors que les constantes d'algorithme, les graines de générateur aléatoire et les petits contrôles de cardinalité ne le sont pas)

# text
seg-416def055790 = integrity::composed_pl::tests (monotone, plancher P0, K(IR/2), exposants, semi-continuité inférieure)

# text
seg-3d4a4ed81148 = integrity::lil_envelope::tests (divergence, seuil, dominance du resserrement IR)

# text
seg-0a2804cefee1 = integrity::hetero_budget::tests + tests/hetero_budget_reference.rs ; tests/hetero_budget_utc_k_oracle.rs::overbound_exceedance_on_real_utc_k_finding (conditionné aux données : ignoré avec un message quand la série BIPM est absente) ; tests/hetero_budget_utc_k_realised_overbound_oracle.rs::realised_offset_overbound_finding ; tests/utck_bound_prospective_oracle.rs (D9 tour { "3" }, prospectif, pas encore exécuté : la Circulaire T { "465" } est parue le 2026-10-12, et la règle préenregistrée de 1000 valeurs exige des émissions jusqu'à environ { "468" })

# text
seg-477c4bbb36ab = integrity::hetero_budget::tests (correlated_fused_bias_dominates_independent_when_correlated, rho_one_single_realizer_recovers_linear_sum) + tests/hetero_budget_reference.rs

# text
seg-75e4936b4c2d = integrity::gls_commonmode::tests (common_mode_shift_inflates_statistic_but_not_contrasts, post_fit_common_mode_statistic_is_zero) + tests/gls_reference.rs ; tests/gls_common_mode_statistic_numpy_oracle.rs::common_mode_statistic_matches_numpy_lapack

# text
seg-7bbbfeb6e7b9 = lunar_identifiability, lunar_datum

# text
seg-6ac21ece8e3d = tests/lunar_datum_identifiability_reference.rs (single_internal_range_row_has_six_dim_datum_null_space ; extending_the_librating_arc_lifts_the_origin_scale_degeneracy) ; tests/lunar_datum_sosnica_oracle.rs::origin_scale_correlation_and_crlb_disagree_with_the_published_geometry

# text
seg-36da2dd8d3db = lunar_datum, lunar_identifiability

# text
seg-12c2f3ad1982 = lunar_datum::tests (dérivées partielles analytiques LLR/VLBI/orbiteur par rapport aux différences finies) ; lunar_identifiability::tests (adding_an_offradial_technique_collapses_the_origin_scale_degeneracy ; transversal contre radial via crlb_diag)

# text
seg-13c488ae75a6 = lunar_llr_geometry::tests (reflector_and_station_catalogs_are_well_formed, analytic_partials_match_finite_difference, llr_one_way_range_is_earth_moon_scale, zero_datum_reproduces_nominal_range, llr_only_fisher_shows_strong_com_x_scale_degeneracy) ; tests/lunar_pa_frame_realisation_guard.rs ; tests/llr_datum_degeneracy_reference.rs ; tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_against_ilrs_normal_points

# text
seg-f741d9570b10 = lunar_gauge::tests (coupled_marginal_well_posed_network_is_psd, coupled_marginal_twoway_equals_more_oneway_in_diverse_network, coupled_marginal_twoway_lift_three_orders, oneway_range_row_has_correct_temporal_entries, twoway_range_row_has_zero_at_offset_and_rate, time_tie_row_equals_pure_offset_vector, rate_tie_row_has_correct_structure)

# text
seg-c4c5426a700b = lunar_techniques::tests (combine_is_additive_order_independent_and_empty_is_zero - une sélection vide donne la matrice nulle, une sélection unique est l'identité, une paire est égale à une somme élément par élément écrite indépendamment, et le résultat est invariant à l'ordre de sélection ; adding_a_block_never_reduces_the_degeneracy_metric - monotonie sous information ajoutée ; radial_diversity_beats_transverse_for_breaking_the_degeneracy - le bloc d'orbiteur de la face cachée élève davantage la métrique de dégénérescence que le bloc VLBI transversal)

# text
seg-c5ebc071ce3e = lunar_interop_budget::tests (monotonie avec le budget ; réduction du budget RSS sous une CRLB par fournisseur ; tolérance de rotation calculée au bras de levier lunaire ; terme limitant = rotation)

# text
seg-f4fbaefa3a11 = lunar_interop_budget::tests (CommonEphemeris annule le budget ; CommonFrameTie < PerProvider ; irreducible_fraction > { "0.5" } sur les répartitions réelles ; ordre des conventions)

# text
seg-0b39643e9152 = lunar_faultobs::tests — byzantine_c3_rank_deficient_but_nonzero_is_undetectable (bloc non nul mais de rang déficient ⇒ block_spark { "1" }, f_detect { "0" } ; colonnes indépendantes ⇒ block_spark { "2" }, f_detect { "1" }), byzantine_real_network_uniform_bias_is_clock_offset (un pair possédant toutes les mesures d'un nœud = une erreur de décalage d'horloge ∈ range(G), indétectable, avec un net écart spectral de Gram), byzantine_redundant_net_identifies_at_least_one (six pairs indépendants à mesure unique ⇒ block_spark { "7" }, f_identify { "3" }), byzantine_analytic_spark_identity_projector + byzantine_detect_identify_relations (les cas manuels P⊥ = I fixent f_detect = block_spark − { "1" }, f_identify = ⌊(block_spark − { "1" })/2⌋)

# text
seg-70a340255eb6 = lunar_faultobs::tests — holdover_floor_self_ref_and_anchored (réseau auto-référencé : le taux commun se trouve dans N(GᵀWG), temporal_gauge_dim { "2" } ; après une ligne d'attache de taux externe : le taux est expulsé de la jauge, temporal_gauge_dim { "1" } et le décalage commun subsiste)

# text
seg-11fe79ac46b3 = lunar_faultobs::tests — provider_mismatch_split_common_undetectable_differential_detectable (biais commun indétectable, différentiel détectable), slope_infinity_in_range_finite_detectable (g7 : pente ∞ pour b ∈ range(G), finie pour b ∉ range(G)), pernode_rank_is_state_dim_minus_eight (§{ "0" } : rang(GᵀWG) = state_dim − { "8" }, la jauge de dimension 8 constitue tout l'espace nul, avec un écart spectral >{ "1e6" })

# text
seg-95c049581604 = telecom_timing (MASKS, eprtc_a_holdover_limit_ns, check_curve, check_mask)

# text
seg-35e253f27caa = telecom_timing::tests (mask_boundaries_follow_the_tables_exactly — extrémités ouvertes et fermées, l'intervalle τ = { "400" } s du tableau 7-3 de G.8271.1, continuité à chaque point de rupture que les tableaux impliquent ; a_curve_exactly_on_the_limit_passes_and_just_above_fails ; eprtc_a_holdover_envelope_follows_table_3 ; a_coarse_record_is_not_evaluated_against_a_filtered_mask) ; tests/telecom_timing_reference.rs (telecom_timing_kind_round_trips_through_the_dispatch) ; tests/telecom_masks_itu_printed_values.rs (mask_values_match_the_numbers_the_recommendations_print ; figure_7_2_label_at_1_3_s_is_not_its_own_table_value)

# text
seg-f8b7bc046be6 = telecom_timing (MASKS, Segment::tau_exponent, MeasurementFilter::LowPass10HzAtSource, MaskCondition::Autonomous)

# text
seg-3ae5550f6aaa = telecom_timing::tests (g811_prc_masks_follow_clause_6_1; g812_masks_follow_tables_3_4_6_and_7; g8262_masks_follow_tables_1_3_4_and_5; g8262_1_eeec_masks_follow_tables_1_and_3; a_linear_piece_is_evaluated_without_powf; wander_masks_pass_a_quiet_white_fm_flicker_series; wander_masks_fail_the_same_series_scaled_up)

# text
seg-82af02048968 = clock_log (read_input, MeasuredPhaseReport, MEASURED_UNITS, TELECOM_LOG_UNITS) ; telecom_timing (SeriesInput::clock_log) ; api (type clock [clock_log])

# text
seg-df411365b9ab = clock_log::tests (journaux écrits à la main par format : en-têtes, séparateurs, unités, intégration de fréquence, canaux et modes TICC, trous et politiques, refus) ; tests/clock_log_allantools.rs (la comparaison préenregistrée : b1_each_log_reads_to_the_reference_phase ; b2_adev_tdev_and_mtie_agree_with_allantools ; b3_a_telecom_series_read_from_a_log_equals_the_same_samples ; b3_the_clock_kind_measured_block_is_opt_in)

# text
seg-0a789b9f3db1 = clock_log (parse_linuxptp, parse_chrony, grid_timed_offsets)

# text
seg-b1a8738d620b = clock_log::tests (ptp4l_reads_the_locked_offsets_in_ns; linuxptp_reads_only_the_named_program; ts2phc_gap_is_refused_or_filled; linuxptp_reads_syslog_prefixed_lines_and_picks_an_interface; linuxptp_refuses_a_servo_that_never_locks_and_backwards_stamps; chrony_tracking_reads_the_local_offset_in_seconds; chrony_statistics_needs_a_source_when_there_are_two; chrony_columns_of_the_other_log_are_not_read; clock_selector_is_refused_for_timelab_and_ticc_only) sur les jeux de test de tests/fixtures/clock_log/linuxptp_chrony/

# text
seg-5fb2f4812479 = holdover_test (HoldoverTestScenario, recovery, linear_fit) ; telecom_timing (check_mask, check_envelope, budget_results)

# text
seg-d028f2b41fe8 = holdover_test::tests (the_record_is_split_at_the_stated_times; holdover_figures_match_a_hand_computation; recovery_is_timed_from_the_restoration; masks_are_measured_on_the_step_their_condition_names; a_record_with_no_baseline_says_so; bad_inputs_are_refused_with_the_reason; the_report_carries_the_label_the_units_and_no_conformance_word; a_ptp4l_log_is_scored_end_to_end)

# text
seg-ea770cfea799 = ssv (constellations, geom, sweep, pattern, check)

# text
seg-9a49009f27cd = ssv::geom::tests (the_grid_has_the_booklets_2562_points_on_the_unit_sphere; the_interval_form_equals_the_general_predicate; a_user_behind_the_earth_is_blocked_and_one_beside_the_limb_is_not) ; ssv::sweep::tests (a_small_shell_run_is_internally_consistent; pdop_of_a_regular_tetrahedron_like_set_is_finite_and_a_flat_set_is_not) ; ssv::pattern::tests (table_b10_antenna_reads_as_gain_against_angle_from_the_boresight)

# text
seg-05a12f571867 = ssv (limb, weak)

# text
seg-4b5cbdee9714 = ssv::limb::tests (the_chapman_layer_peaks_at_its_height_with_its_density; the_surface_limb_bends_about_one_and_a_third_degrees; plasmaspheric_tec_is_a_few_tecu_for_an_equatorial_gps_to_geo_ray) ; ssv::weak::tests (longer_integration_lowers_the_acquisition_threshold; aiding_narrows_the_search_and_the_loop; a_conventional_receiver_is_far_above_the_ssv_signal_levels) ; ssv::scenario::tests (the_limb_medium_adds_statistics_and_can_cost_signals; a_weak_signal_receiver_replaces_the_fixed_threshold)

# text
seg-89cac0893981 = ssv::nav (run_nav, Ekf)

# text
seg-18bbbb4578fc = ssv::nav::tests (the_filter_converges_where_signals_are_plentiful_and_is_deterministic; the_covariance_is_consistent_with_the_error; without_signals_the_filter_coasts_and_the_gap_is_reported) ; ssv::scenario::tests (navigation_and_formation_run_and_report)

# text
seg-59bd0b502622 = ssv::formation (run_formation, RelEkf)

# text
seg-70f8b2a10f03 = ssv::formation::tests (differencing_beats_subtracting_absolute_estimates_and_is_deterministic) ; ssv::scenario::tests (navigation_and_formation_run_and_report; formation_needs_navigation_and_one_mode_only)

# text
seg-9f89545da2ca = inertial::cai_error_terms::tests (raman_transfer_short_pulse_limit_matches_the_acceleration_transfer_function; white_raman_phase_closed_form_matches_quadrature; short_pulse_band_limited_closed_form_matches_quadrature; cheinet_2008_white_phase_noise_requirement_is_reproduced; delay_term_closed_form_matches_exact_filter_quadrature; defocus_phase_is_position_independent_and_tilt_cancels; curvature_bias_monte_carlo_matches_closed_form; curvature_bias_limiting_cases; classical_aided_resolution_monte_carlo_matches_closed_form; multi_t_resolution_monte_carlo_matches_closed_form; ambiguity_limits_and_inverse)

# text
seg-869454221ef4 = telecom_timing (PRESETS, fit_noise, with_flicker_floor, synthesize_holdover) ; models (ClockModel)

# text
seg-2fb7b4c2396c = telecom_timing::tests (every_preset_carries_a_named_datasheet_and_figures; the_noise_fit_envelopes_every_datasheet_point; pure_aging_matches_its_closed_form — la rampe de vieillissement discrète à { "0.1" } % près de (1/2)·D·t² sur un jour ; same_seed_same_series_and_hash_different_seed_different_series) ; tests/oscillator_presets_measured.rs (caesium_finding_pinned; rubidium_finding_pinned; csac_finding_pinned; ocxo_preset_has_no_measured_record)

# text
seg-d31b872adcb6 = slot_timing (predicted_error_s, breach_after_sync_s, terms_at, slot_budget, ClockNoise::from_datasheet, SlotTimingScenario) ; clock_state (ClockClass::Tcxo, Ocxo, Rafs, source)

# text
seg-8eba4f60f78e = tests/slot_timing_igs_holdout.rs ({ "10" } horloges de satellites GPS Block IIF, { "14" } jours d'horloges finales IGS : { "8" } dans le seuil de { "1.5" }, G25 et G30 optimistes jusqu'à environ 2x, figés) ; tests/slot_timing_ocxo_holdout.rs (un OCXO mesuré : la prédiction sur jeu réservé n'est jamais optimiste, de { "0.59" } à { "0.70" } de la violation mesurée ; dans l'échantillon, de { "0.98" } à { "1.17" } ; sans le terme de fréquence de recalage, la prédiction dans l'échantillon est optimiste à chaque seuil) ; slot_timing::tests (fix_frequency_uncertainty_alone_is_linear_in_time; reduces_to_the_holdover_inversion — chaque classe par rapport à holdover::holdover_seconds à { "1e-9" } près ; white_fm_with_fix_error_has_its_closed_form; flicker_floor_alone_is_linear_in_time; ageing_alone_is_quadratic_in_time; frequency_offsets_add_in_magnitude; the_error_at_the_breach_is_the_guard; datasheet_fit_envelopes_every_point; datasheet_classes_match_their_presets_at_one_second; a_breach_beyond_the_datasheet_is_flagged_as_extrapolated; the_report_carries_the_result_and_a_unit_for_each_field)

# text
seg-a1318b5603cd = orbital_timing (orbital_timing, visibility_half_angle_rad, max_pass_s, crosslink_neighbour_is_outside_footprint)

# text
seg-4c4e4d92c416 = orbital_timing::tests (reduces_to_the_terrestrial_tpl — exactement tpl::timing_protection_level_ns lorsque l'horloge n'a aucun terme de scintillation, de phase blanche ou de marche aléatoire ; leo_geometry_matches_its_closed_forms; crosslink_independence_follows_the_footprint; an_independent_check_caps_the_ramp_before_the_pass_ends; a_crosslink_inside_the_footprint_does_not_count; a_ramp_below_the_reference_is_never_detected)

# text
seg-06c475d7eb73 = spectrum (SpectrumScenario, SpectrumModel::bin_psd_w_per_hz, SpectrumModel::band_state, effective_cn0_multi_dbhz, system_temp_k, Jammer::power_fraction_in, Jammer::duty)

# text
seg-266d9c05d9be = spectrum::tests (agrees_with_the_jamming_kind_chain — J/S égal à jamming::j_over_s_db et C/N0 effectif égal à jamming::effective_cn0_dbhz avec Q = 1/(R_c kappa) à { "1e-9" } dB près, et l'ancrage de { "32.105" } dB du test propre au type de scénario de brouillage ; noise_floor_is_kt0f; chirp_window_splits_whole_and_partial_sweeps; duty_weights_partial_rows; demo_scenario_runs_and_denies_l1_while_l5_survives; defaults_run_with_no_jammer; bad_inputs_are_refused)

# text
seg-1d43f89b7a30 = ephem (standish_state, StandishElements::state_at_mean_anomaly, Planet::Pluto) ; solar_system (position_label)

# text
seg-1af48aec2408 = tests/solar_system_horizons_reference.rs (standish_table1_uranus_and_neptune_exceed_the_nominal_error : figé à { "2.04" } et { "5.16" } fois l'erreur nominale de longitude, sous six fois ; pluto_from_the_1992_row_is_measured_not_validated : à moins de { "39" } arcsec et { "1.14e9" } m ; standish_velocities_track_horizons_to_one_percent : pire cas { "3.7e-3" } de la vitesse) ; ephem::tests (standish_velocity_is_the_derivative_of_the_position; pluto_has_no_table2_row_and_no_stated_error)

# text
seg-de8a26ea4d61 = ephem (satellite_state, Satellite, SatelliteMethod, moon_icrf, moon_icrf_velocity) ; ephem_provider (AnalyticSolarSystem)

# text
seg-06601f6fb837 = tests/solar_system_horizons_reference.rs (moons_track_horizons_to_the_measured_angles : pire erreur angulaire vue depuis la planète sur { "2000" } à { "2040" }, Phobos { "5.65" } deg, Deimos { "0.38" }, Io { "0.40" }, Europe { "1.63" }, Ganymède { "0.22" }, Callisto { "0.27" }, Titan { "3.31" } ; geocentric_moon_tracks_horizons : { "0.046" } deg) ; ephem::tests (moons_sit_at_their_mean_distance_and_move_at_their_mean_speed) ; ephem_provider::tests (earth_and_moon_balance_about_their_barycentre)

# text
seg-24749f350eb2 = body (Body::by_name, Body::facts, Body::prime_meridian, SOLAR_SYSTEM, BodyFacts) ; solar_system (SolarSystemScenario, position_label)

# text
seg-a2ffe20b07aa = body::tests (every_catalogue_body_resolves_by_name_and_carries_its_record; a_zonal_field_is_referenced_to_its_sources_radius; retrograde_rotators_have_negative_rates_and_periods_match_the_iau_rate) ; solar_system::tests (defaults_report_all_eighteen_bodies_with_tracks; earth_heliocentric_distance_is_one_au_and_period_one_year; a_planet_track_closes_on_its_orbit_and_starts_at_the_epoch_position; moons_orbit_their_planets_at_their_mean_distance; pluto_outside_its_table_is_an_error_not_a_guess; every_emitted_number_has_a_unit) ; tests/body_constants_naif_oracle.rs::only_the_conventional_constants_of_other_rows_differ

# text
seg-0de56af96b3e = body_pnt (BodyPntScenario, formal_sigma, fix_error) ; orbit (dop) ; batch_ls (gauss_newton) ; mars_pnt (chord_clears_sphere) ; mars_frame (bodyfixed_to_inertial)

# text
seg-92943f4850b5 = body_pnt::tests (relay_period_is_keplers_third_law_for_the_body; an_orbiter_keeps_its_radius_and_a_lander_sits_on_the_surface; the_earth_range_never_worsens_the_formal_uncertainty; seeded_fix_errors_are_consistent_with_the_formal_sigma : la racine de la moyenne quadratique de chaque erreur de positionnement rapportée à son propre sigma formel dans [{ "0.6" }, { "1.5" }] ; earth_light_time_is_minutes_at_mars_and_the_run_is_deterministic; defaults_run_around_mars_and_every_number_has_a_unit)

# text
seg-17bf1df86b49 = constellation (coverage, ConstellationDesignScenario, beidou_slots, body_by_name)

# text
seg-4d15849bdf7c = constellation::tests (prefilter_matches_brute_force_exactly — chaque carte et chaque compteur égale un balayage avec le test d'élévation direct ; five_thousand_satellites_on_a_coarse_grid — { "5 000" } satellites, affiche le temps d'exécution et les tests de paires conservés ; a_clock_per_constellation_needs_one_more_satellite; beidou_geo_and_igso_geometry; lunar_shell_runs_around_the_moon; presets_are_earth_only_and_errors_are_clear; preset_counts) ; tests/constellation_availability_published_spec_oracle.rs::presets_meet_the_published_dop_availability (contrôle de régression seulement) ; tests/coverage_dop_full_oracle.rs::finding_is_pinned ; tests/coverage_dop_gnss_lib_py_oracle.rs (régression)

# text
seg-fde8247097c3 = campaign (run_campaign_detailed, run_chain, presets, extract, to_svg)

# text
seg-d8d3a3893423 = tests/campaign_composition_reference.rs (a_one_phase_clock_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_integrity_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_jamming_campaign_reproduces_the_standalone_run_bit_for_bit — le résultat du membre identique octet pour octet à l'exécution autonome et chaque valeur alignée égale à la série autonome ; the_chained_mission_hands_state_on_and_ends_the_spoofing_phase_on_detection; a_handoff_writes_the_previous_phase_number_into_the_next_scenario; malformed_campaigns_fail_loudly)

# text
seg-59eda109a298 = campaign (run_sweep, run_monte_carlo, ensemble) ; sweep (GenericAxis, coords_of, set_dotted_value) ; inertial (metric_stat)

# text
seg-3b9aa486bb66 = tests/campaign_composition_reference.rs (a_fixed_seed_ensemble_is_byte_stable_and_each_realisation_is_the_standalone_run; the_ensemble_mean_and_spread_match_the_white_fm_closed_form — { "200" } graines d'une horloge à bruit blanc de fréquence en marche libre tau = { "3010" } s : la vraie moyenne { "0" } à l'intérieur de l'intervalle rapporté, la demi-largeur de l'intervalle à moins de { "25" } % de { "1.96" } sigma/sqrt(n), et la variance d'échantillon à l'intérieur de l'intervalle bilatéral du khi-deux à { "99" } % de sigma = sqrt(q_wf tau) = { "16.459" } ns ; ensemble d'étalonnage (CAP-10, préenregistré ea451cb5, docs/CALIBRATION-ENSEMBLES.md, tests/calibration_ensembles.rs) : sur { "200" } ensembles indépendants, l'intervalle couvre la vraie moyenne sur { "192" } (à l'intérieur de la région à { "99" } % de la loi Binomial({ "200" }, { "0.95" }) [{ "181" }, { "197" }]) et le contrôle du khi-deux est réussi sur { "196" }, tandis que la tolérance en percentiles à graine unique (p05 et p95 à moins de { "0.3" } sigma) n'est réussie que sur { "183" } des { "200" }, NOT MET par rapport aux { "190" } préenregistrés, un contrôle fragile vis-à-vis de la graine, consigné plutôt qu'assoupli ; a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number)

# text
seg-c0c2439ee1f6 = campaign (run_compose)

# text
seg-b238a6b2bbdd = tests/campaign_composition_reference.rs (a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number — une composition à un membre lit le nombre autonome et l'empreinte du résultat)

# text
seg-a032de3144fe = campaign::optimize (run_optimize, nelder_mead)

# text
seg-94a984382eee = tests/campaign_optimize_reference.rs (préenregistré fbe6c8b3 et, après un échec de protocole au tour 1, 441f31bc : p2_prime_interior_target_range_matches_the_closed_form — résolution de cible 1-D à { "6.1e-15" } de r* = r0 { "10" }^((m(r0) - { "3" })/20) en { "96" } évaluations ; p3_prime_contour_target_grid_and_nelder_mead et p3_grid_matches_brute_force_and_nelder_mead_does_at_least_as_well — le meilleur de la méthode par grille égal bit à bit à une boucle indépendante par force brute { "41" } x { "41" } sur run_toml, Nelder-Mead au moins aussi bon en { "177" } et { "161" } évaluations ; p4_nelder_mead_reaches_the_corner_maximum; p5_the_document_is_byte_stable_and_counts_agree; p2_round1_not_met_the_box_excludes_the_closed_form, qui fige l'échec consigné du tour 1) ; campaign::optimize::tests (nelder_mead_meets_the_preregistered_rosenbrock_bar : f* = { "1.7e-20" } en { "234" } évaluations ; a_non_finite_score_is_never_the_best; the_grid_mapping_is_the_sweeps)

# text
seg-a0c6fa7dbb46 = leo_signal (LeoSignalScenario, SignalDesign, Component, Shape, code_jitter_m, gabor_bandwidth_hz, detection_probability, threshold_for_pfa, mean_acquisition_time_s, ssc_leo_into_gnss, ssc_gnss_into_leo, jammer_tolerance, gnss_victim, preset, public_signal)

# text
seg-6d9eb1dc2a11 = leo_signal::tests (every_public_preset_parses_and_cites_a_url; detector_reduces_to_pfa_and_grows_with_snr; detection_probability_with_several_looks_matches_the_noncentral_chi_square; mean_time_of_a_perfect_detector_is_half_the_cells; compatibility_ssc_magnitudes_match_independent_quadrature; to_spectrum_band_is_consistent_with_the_design; jammer_tolerance_orders_cw_matched_wideband; e5_centred_signal_hits_e5a_and_e5b_equally; defaults_run_on_the_generic_band_preset; inline_signal_and_bad_inputs) ; tests/leo_signal_reference.rs (chaque scénario fourni indépendant du système s'exécute sans données d'atelier, les rapports ionosphériques de l'arbitrage de bande égalent (f_ref/f)^{ "2" } et ses différences en espace libre { "20" } log10(f/f_ref), la gigue au C/N0 de référence se situe entre sa borne de Gabor et sa forme en bande illimitée, les contrôles de forme E5 du scénario à paramètres d'atelier sont cohérents lorsque ce fichier est présent, et aucun fichier source ne compile ce fichier)

# text
seg-e31094573516 = spectrum (Band::unit_psd, Band::tracked_power_dbw, BandDesign, BandCfg, PanelCfg, SpectrumScenario, Waveform, multi_band_svg) ; leo_signal (SignalDesign::to_spectrum_band)

# text
seg-17f462b8768d = tests/leo_signal_reference.rs (la cascade multibande s'exécute avec quatre panneaux, les brouilleurs UHF, bande L5, S et C ne privent chacun que leur propre bande, et une exécution à bande simple est inchangée par l'extension) ; leo_signal::tests::to_spectrum_band_is_consistent_with_the_design ; spectrum::tests (agrees_with_the_jamming_kind_chain)

# text
seg-8749534ecbbb = leo_pass (LeoPassScenario) ; leo_link::geometry (design_pass, link_geometry, numerical_check, SatMotion, UserMotion) ; leo_link::antenna ; leo_link::itu (p676_gaseous_attenuation_db) ; leo_link (system_noise_temperature_k, cn0_dbhz)

# text
seg-eec596b8749d = leo_pass::tests (the_leo_pass_is_a_bell_above_flat_gnss; closed_form_doppler_agrees_with_the_numerical_derivative : sous { "0.01" } Hz et { "0.01" } Hz/s ; indoor_uhf_suffers_less_building_loss_than_c_band; rain_attenuates_c_band_more_than_s_band; iono_delay_scales_as_one_over_f_squared_across_bands; a_fully_custom_band_needs_no_preset; a_walker_constellation_and_a_tle_satellite_both_run; defaults_run_with_no_preset_named_and_every_number_has_a_unit) ; leo_link::geometry::tests (kepler_velocity_is_the_derivative_of_the_position; a_designed_pass_reaches_the_requested_elevation; closed_form_range_rate_and_accel_match_central_differences_for_two_body_motion) ; leo_link::antenna::tests

# text
seg-a6cfe1d09891 = leo_link::presets (SystemPreset, BandPreset, all, by_id, gnss_meo) ; leo_pass (resolve_bands)

# text
seg-09ebe92cc5c1 = leo_link::presets::tests (every_preset_is_sourced_and_self_consistent; only_the_celeste_preset_is_sourced_from_the_workshop) ; leo_link::presets::xona_pulsar::tests (the_eirps_reproduce_the_published_minimum_power_at_ten_degrees; a_flat_pattern_lands_the_zenith_power_near_the_published_maximum : à { "0.5" } dB de -139.1 et -136.2 dBW) ; leo_link::presets::iridium::tests ; leo_pass::tests (a_fully_custom_band_needs_no_preset)

# text
seg-8c33a02f0aa9 = leo_link::energy (fix_budget, duty_curve, IotReceiver, IotSignal) ; leo_pass (iot_section)

# text
seg-981819c1af62 = leo_link::energy::tests (stronger_signals_and_smaller_doppler_windows_fix_faster; the_doppler_rate_caps_the_coherent_time; battery_life_grows_with_the_fix_interval_toward_the_sleep_floor) ; leo_pass::tests (the_run_is_deterministic_and_bad_inputs_are_rejected)

# text
seg-a8d152bb385d = leo_navmsg (LeoNavmsgScenario::midpass, worst_case_jump, elevation, geodetic_to_ecef)

# text
seg-af0e339c4fae = leo_navmsg::tests::a_mid_pass_update_is_continuous (le saut de distance de chaque commutation égale la variation de l'erreur de distance, et un ajustement corrigé de { "300" } s mis à jour toutes les { "150" } s passe un seuil de { "5" } cm) ; leo_navmsg::tests::a_keplerian_only_update_over_a_long_interval_is_flagged ; leo_navmsg::tests::worst_case_jump_bounds_every_line_of_sight (la forme close borne un échantillonnage dense du cône)

# text
seg-d8d04f2ffd50 = leo_navmsg::codec (encode, decode, write_payload, read_payload, field_table, quantisation_budget)

# text
seg-4040a549f1c1 = leo_navmsg::codec::tests (signed_fields_round_trip_through_the_bit_packer; week8_resolves_near_the_reference) ; leo_navmsg::tests::every_model_round_trips_through_the_binary_frame (chaque modèle à { "2" } mm du message exact après décodage, ré-encodage identique bit à bit, un bit inversé rejeté par le CRC) ; leo_navmsg::tests::every_field_of_the_budget_stays_under_a_millimetre

# text
seg-a6f36f62a02d = leo_navmsg::text (rinex_export, rinex_import, csv_export, csv_import, calendar, from_calendar)

# text
seg-14ee5fa96ce7 = leo_navmsg::text::tests (calendar_round_trips_and_knows_the_gps_origin; d19_is_rinex_shaped) ; leo_navmsg::tests::rinex_and_csv_round_trips (chaque modèle à { "0.1" } mm après le bloc de texte, le CSV exact)

# text
seg-3f5b07cc8c81 = leo_navmsg::elements (EcefPoly, ephemeris_at) ; leo_navmsg (liu_comparison, LIU2025_TABLE)

# text
seg-1ffa5a792c36 = leo_navmsg::tests::liu22_beats_the_16_parameter_set_over_a_20_minute_arc ; leo_navmsg::tests::the_ecef_polynomial_fits_a_minute_to_millimetres ; leo_navmsg::tests::every_preset_resolves_and_the_atomic_preset_selects_the_zero_clock_polynomial

# text
seg-fc9c5d5b1511 = leo_fusion::doppler (solve, formal_covariance, single_pass_geometry, offset_site, closest_approach) ; leo_fusion::pvt_kind (run_doppler)

# text
seg-6cb8d56c57d6 = leo_fusion::doppler::tests (range_acceleration_obeys_the_kinematic_identity_and_vanishes_doppler_at_closest_approach; noise_free_multi_satellite_doppler_recovers_the_user : à { "1" } mm et la dérive à { "1e-6" } m/s ; a_single_pass_has_a_mirror_solution_across_the_ground_track; the_cross_track_error_grows_as_the_pass_goes_overhead; velocity_states_are_recovered_for_a_moving_user) ; leo_fusion::pvt_kind::tests (doppler_positioning_improves_with_the_window_and_is_deterministic : le RMS pondéré des résidus dans [{ "0.8" }, { "1.2" }] et l'erreur sous quatre sigmas formels) ; tests/leo_fusion_scenarios.rs (leo_doppler_positioning_forms_a_fix_and_the_cross_track_error_explodes_overhead; starlink_doppler_only_mode_runs_without_ranging) ; tests/starlink_doppler_published_proxy.rs (un substitut préenregistré par rapport aux percentiles publiés du jeu de données 3 de « Unveiling Starlink for PNT », doi:10.33012/navi.685 : avec { "3" } satellites (masque de { "47" } deg), sans aide d'altitude et { "30" } Hz, l'erreur 3-D au p90 est de { "92.2" } m à { "20" } s et de { "870" } m à { "8" } s contre { "2" } m et { "10" } m publiés, de sorte que les deux seuils d'un facteur deux sont NOT MET, du côté haut, et affirmés comme manqués ; docs/design/evidence/cap11-starlink-doppler-proxy/)

# text
seg-95f8dcd6247e = leo_fusion::joint_pvt (solve, dop, code_sigma_dll_m, SystemClock) ; leo_fusion::system (SystemCfg, System) ; leo_fusion::pvt_kind (run_joint)

# text
seg-7a8b0b7b8a37 = leo_fusion::joint_pvt::tests (dop_matches_the_hand_derived_zenith_plus_three_horizon_case : HDOP = VDOP = sqrt(4/3), TDOP = sqrt(1/3), PDOP = sqrt(8/3), GDOP = sqrt({ "3" }) à { "1e-9" } près ; a_lone_satellite_with_its_own_clock_adds_nothing_and_a_known_offset_does; a_noise_free_fix_recovers_position_clock_and_inter_system_bias; seeded_fixes_agree_with_their_formal_covariance; dll_noise_is_the_textbook_figure_for_gps_l1_ca) ; leo_fusion::pvt_kind::tests (fusing_leo_never_worsens_the_median_pdop_and_the_isb_is_recovered) ; tests/leo_fusion_scenarios.rs (meo_leo_fusion_beats_gnss_alone_and_recovers_the_leo_bias) ; tests/joint_pvt_dual_freq_itrf_rtklib_oracle.rs::dual_frequency_finding_is_pinned ; tests/joint_pvt_precise_itrf_rtklib_oracle.rs::precise_product_finding_is_pinned

# text
seg-d98c7b399230 = leo_fusion::ppp (run, PppScenario, LI_2019)

# text
seg-51a43af7f6b5 = leo_fusion::ppp::tests (the_filter_is_consistent_over_monte_carlo_seeds : { "24" } graines, moyenne NEES moyennée sur l'exécution dans [{ "2.4" }, { "3.6" }] et au moins { "75" } % des époques à l'intérieur de la bande bilatérale du khi-deux à { "95" } % ; mesuré avec { "150" } graines, moyenne { "2.84" } GNSS seul et { "2.87" } avec LEO ; leo_augmentation_shortens_convergence; same_seed_same_answer_and_every_number_has_a_unit) ; tests/leo_fusion_scenarios.rs (ppp_convergence_of_the_bundled_scenario_shortens_monotonically)

# text
seg-c42e3bd4a4c1 = leo_fusion::timing (simulate, utc_offset_s, system_to_utc_s) ; leo_fusion::pvt_kind (run_timing)

# text
seg-061a0510c35c = leo_fusion::timing::tests (the_utc_offset_follows_the_is_gps_200_expression; continuous_tracking_approaches_the_measurement_floor_and_gaps_cost_time; the_filter_is_consistent_over_seeds; the_utc_offset_uncertainty_sets_a_floor) ; tests/leo_fusion_scenarios.rs (leo_timing_error_grows_as_the_c_n0_falls)

# text
seg-16fa5fabfb50 = leo_fusion::presets (all, by_id, cn0_range_dbhz, noise_density_dbw_hz) ; leo_fusion::system (SystemCfg::build)

# text
seg-df22b3cb00fa = leo_fusion::presets::tests (every_preset_has_a_source_and_every_public_source_a_url; only_one_preset_uses_workshop_material; noise_density_at_290_k_is_minus_204_dbw_per_hz) ; tests/workshop_preset_isolation.rs (only_the_listed_files_name_the_workshop_preset; workshop_numbers_live_only_in_the_preset_file_and_its_scenarios : analyses de texte source de src, des scénarios et des tests) ; leo_fusion::system::tests (a_preset_fills_what_the_scenario_leaves_out; a_system_needs_no_preset; pseudorange_sigma_falls_with_elevation_and_never_below_the_sisre)

# text
seg-6478ad7d09eb = leo_pnt_chain (LeoPntChainScenario) ; leo_pass (BandCfg::signal, design_tracking) ; leo_navmsg (LeoNavmsgScenario::broadcast_sisre) ; leo_fusion::pvt_kind ; leo_fusion::ppp

# text
seg-02ef52ba69f0 = leo_pnt_chain::tests (a_sine_line_fit_recovers_its_line) ; tests/leo_pnt_chain.rs (every_upstream_change_moves_the_downstream_figures : une EIRP plus forte, un intervalle d'ajustement plus long et un terme de détermination d'orbite plus grand déplacent chacun la valeur transmise et la position fusionnée ; the_handed_on_values_are_the_stage_outputs; a_band_design_splits_the_eirp_and_reports_the_design_jitter; the_pass_export_reproduces_the_engine_range)

# text
seg-4070df5af5e4 = leo_link::spoof (range_rate_position_gradient, line_of_sight, fll_frequency_jitter_hz, doppler_consistency_window, doppler_consistency) ; leo_pass (SpooferCfg, spoof_section)

# text
seg-0a123a80693f = leo_link::spoof::tests (the_gradient_is_the_derivative_of_the_range_rate; fll_jitter_matches_the_formula_by_hand; a_common_mode_residual_is_a_clock_drift_and_is_not_detected; with_no_prior_and_equal_noise_the_statistic_is_the_scatter_about_the_mean; a_push_the_prior_explains_is_not_detected; a_velocity_push_is_hidden_by_a_loose_velocity_prior_only; the_information_form_equals_the_covariance_form) ; tests/leo_resilience_verticals.rs (the_monitors_are_silent_before_the_onset; the_doppler_statistic_is_quadratic_in_the_jump; leo_range_rates_see_a_jump_that_gnss_range_rates_do_not)

# text
seg-8fbcf1ccbe16 = leo_link::spoof (cross_band_step) ; leo_pass (spoof_section: pairs, cross_band)

# text
seg-aa91bdc483b1 = leo_link::spoof::tests (the_cross_band_threshold_and_power) ; tests/leo_resilience_verticals.rs (a_ground_spoofer_leaves_the_ionospheric_step_and_an_ionosphere_aware_one_does_not; a_one_band_spoofer_is_seen_by_the_cross_band_monitor_at_the_onset; the_monitors_are_silent_before_the_onset)

# text
seg-b91ca5a2bd9c = leo_pass (IonoFreePair::geometry_free_stec_tecu, geometry_free_stec_sigma_tecu) ; leo_link::iono::geometry_free_stec_tecu

# text
seg-5d00a19cfac2 = tests/leo_resilience_verticals.rs (the_geometry_free_tec_is_the_pass_slant_tec : égale le TEC oblique du passage au sommet à { "1e-9" } près et son sigma égale le bruit de code RSS sur { "40.3" } (1/f1^{ "2" } - 1/f2^{ "2" })) ; tests/geometry_free_tec_gim_oracle.rs::geometry_free_finding_is_pinned

# text
seg-aa2667aa0296 = receiver_trust (score, monitors, live)

# text
seg-58fcb2ec63c5 = tests/maritime_trust_reference.rs::t5_score_matches_the_clean_room_reading_of_the_documented_rule ; receiver_trust::score::tests (monotone en chaque statistique, l'ajout d'un moniteur ne relève jamais le score, des statistiques saines restent à { "100" })

# text
seg-7adaa23ce920 = telemetry (syslog: leef, rfc5424, SyslogSink; time)

# text
seg-fe08580cd8d3 = telemetry::syslog::tests (chaînes LEEF exactes, échappement, gravité, enveloppe RFC { "5424" }, délais de livraison et reconnexion) ; tests/telemetry_cli.rs

# text
seg-3b0543727850 = receiver_trust::calibration (run_dataset) ; receiver_trust::monitors (MonitorConfig::profile, JAMMERTEST_2024_CALIBRATED) ; realdata::jammertest ; examples/jammertest_trust_calibration.rs

# text
seg-1a452a47b9d0 = tests/receiver_trust_jammertest_calibration.rs::the_recorded_calibration_reproduces (ignoré, conditionné aux données par KSHANA_JAMMERTEST_DIR : la sélection enregistrée, les comptes sur jeu réservé, les verdicts de seuil et le verdict) ; receiver_trust::calibration::tests (horodatages, appariement des fenêtres et décalage de fuseau horaire, étiquettes, bandes de garde, exclusion, sélection) ; receiver_trust::monitors::tests::threshold_profile_is_opt_in

# text
seg-bf0fa5e2343c = jammertest::plan (parse_catalog, parse_plan, import, import_attack_log, events_toml) ; jammertest::score (score_run) ; jammertest::dataset (run_dataset) ; jammertest (score_log, score_pack) ; examples/jammertest_score_2024.rs

# text
seg-cf2f1a572c34 = tests/jammertest_plan_roundtrip.rs (conditionné aux données par KSHANA_JAMMERTEST_PLAN_DIR : nombres de créneaux par domaine d'essai du plan { "2025" }, identifiants de catalogue, aller-retour TOML) ; tests/jammertest_score.rs (un journal synthétique avec une chute connue : détectée, manquée, non évaluable, exécution à fausse alarme, paquet signé portant la fiche de score) ; jammertest::plan::tests ; tests/jammertest_score_2024.rs (conditionné aux données par KSHANA_JAMMERTEST_DIR : l'exécution enregistrée)

# text
seg-bf1156de0226 = compliance

# text
seg-af47f52e5c9e = tests/compliance_report.rs::mapping_is_well_formed ; tests/compliance_report.rs::wording_rule_holds_in_mapping_report_and_docs ; tests/compliance_report.rs::empty_set_evidences_nothing ; tests/compliance_report.rs::statuses_follow_the_runs_present ; tests/compliance_references.rs

# text
seg-5614947f4e8e = receiver_trust (live: the gate, its TCP listener, PKSHT) ; en dehors du crate : integrations/signalk (JavaScript), integrations/opencpn (relais JavaScript, greffon natif C++), deploy/reference-build (unités systemd, conteneur)

# text
seg-e917651d5c45 = tests/receiver_trust_live_cli.rs (le filtre et son écouteur TCP, côté Rust) ; integrations/signalk/test/adapter.test.js, integrations/signalk/test/model.test.js et integrations/signalk/test/plugin.test.js ({ "24" } tests Node sur une sortie synthétique enregistrée) ; integrations/opencpn/test/relay.test.mjs ({ "5" } tests Node) ; integrations/opencpn/test/e2e-live.mjs (le véritable binaire vers un consommateur TCP, exécuté à la main et en CI) ; integrations/opencpn/plugin/test/pksht_test.cpp et integrations/opencpn/plugin/test/trust_state_test.cpp (contrôles C++ de l'analyseur PKSHT et de l'état du panneau) ; deploy/reference-build/check-units.sh et deploy/reference-build/test-entrypoint.sh

# text
seg-729d14cb230a = iq::track::boc (BocKind, BocTracking, BumpJump, boc11_dll_scale) ; iq::track::channel (les prises de saut de bosse et Channel::bump_jumps)

# text
seg-ac14fcbe3119 = tests/iq_boc_bump_jump.rs (b1_b2_b3_side_peak_and_false_jumps_on_the_iq_chain, b4_scaling_on_the_sampled_signal, b5_false_jump_rate_and_detection_at_correlator_level) ; tests unitaires de iq::track::boc (b4_unit_grid_misses_are_the_recorded_ones : le seuil B4 de test unitaire préenregistré conservé tel qu'écrit, ses échecs enregistrés affirmés comme constat F1)

# text
seg-371e708b8b8f = iq::channel::scint (Scintillation, ScintParams) ; realdata::scint50 (parse_log, segments, measured_windows, model_windows, compare)

# text
seg-0e1032d7c879 = tests/iq_scint_malindi_measured.rs (cornell_model_verdict_is_the_recorded_one, le verdict enregistré affirmé tel qu'enregistré, constat F1 ; finding_model_fades_are_deeper_and_longer_than_measured ; posthoc_b3_with_the_model_phase_unwrapped, rapporté seulement ; conditionné aux données, récupérées par scripts/fetch_scint_malindi.sh) ; tests unitaires de realdata::scint50 (model_data_through_the_harness_shows_the_wrapped_phase_finding, constat F2)

# text
seg-98c86c10352b = iq::acq (CfarConfig, ca_cfar, ca_cfar_cells, ca_cfar_pfa, ca_cfar_alpha)

# text
seg-7b8247a4ca76 = tests/iq_acq_cfar.rs (c1_closed_form_matches_monte_carlo_of_the_exact_model, c2_false_alarm_rate_on_gaussian_noise, c3_false_alarm_rate_on_two_bit_noise, c5_decisions_do_not_depend_on_the_input_scale ; c4_noise_free_two_bit_signal_verdict_is_the_recorded_one, le verdict enregistré affirmé tel qu'enregistré, constat F1, figé par finding_noise_free_sidelobes_exceed_the_cfar_rate) ; test unitaire de iq::acq ca_cfar_closed_form_reduces_to_the_textbook_case_and_inverts

# text
seg-3e8c364433b7 = spectrum (default_band, MORE_BAND_NAMES, GLONASS_CHANNELS)

# text
seg-e24276b8b422 = tests/spectrum_more_bands.rs (s1_new_bands_carry_their_icd_values, s2_nulls_and_b1c_parts, s4_cn0_paths_agree_on_the_new_bands ; s2_closed_form_densities_verdict_is_the_recorded_one, constat F1, figé par finding_s2_areas_are_the_closed_form_in_band_fraction ; s3_iq_layer_verdict_is_the_recorded_one, constat F2, figé par finding_s3_per_bin_errors_follow_the_code_line_spectrum ; posthoc_s3_band_averaged_shape, rapporté seulement)

# text
seg-010ad441a092 = iq::lunanet_afs; iq::signals::lunanet (afs_q_tertiary_bits, afs_q_overlay_bits, afs_q_tiered); surface (lunanet_afs_check_spec, lunanet_afs_check_symbols, lunanet_afs_generate)

# text
seg-2d72ec7c3695 = tests/lunanet_afs_codes.rs (b4_legendre_1499_matches_and_tertiary_codes_match_except_one_printed_column, the_spec_check_reports_every_bar_and_pins_the_b4_miss) ; iq::lunanet_afs::tests (sb1_round_trips_every_field_and_corrects_flipped_symbols, generated_streams_pass_and_damage_is_found) ; tests/lunanet_afs_cli.rs

# text
seg-662887e17adb = standards_pack ; compliance (faits du paquet de normes dans compliance-report)

# text
seg-e2d8a0f6daa5 = tests/standards_packs.rs (pinned_outcomes : l'état de chaque test, y compris les échecs L4-T1 et les quatre tests de précision de l'OMI) ; standards_pack::tests

# text
seg-012acc12567b = evidence::roundtrip, evidence::assemble, interop::testbench (write_conditions_json), iq::campaign::conditions

# text
seg-b92c6dde9c2b = tests/round_trip_pack.rs (pack_links_scenario_conditions_log_and_score_and_verifies, conditions_that_disagree_with_the_scoring_events_are_refused, a_stated_log_hash_that_does_not_match_is_refused, published_schema_names_every_field_the_engine_writes)

# text
seg-d9eab5e90d10 = iq::track (Channel, LoopCore, design) ; iq::cli::track

# text
seg-a99bb0c28b00 = tests/iq_track_gnss_sdr_oracle.rs (calibration_passes_for_both_receivers, registered_bars_give_the_recorded_verdict, recorded_numbers_are_pinned), sur des nombres dérivés par tests/fixtures/iq_track_gnss_sdr_oracle/make_fixture.py

# text
seg-6c01cedc4ca7 = jamming (CrpaCfg, crpa_weights, run_jamming) ; crpa (null_steering_weights, mvdr_weights, covariance)

# text
seg-efdc3da9e0ad = tests/jamming_crpa.rs (a1_crpa_units_only_with_the_section, a2_one_element_is_no_array, a3_verdict_is_the_recorded_one, a4_mvdr_tends_to_the_null_at_high_jnr), par rapport à xval/crpa-jamming/expected.json issu de xval/crpa-jamming/oracle.py

# text
seg-05b174fab8a1 = jamming_terrain (TerrainCfg, jammer_terrain, knife_edge_loss_db) ; jamming (run_jamming_sky)

# text
seg-5adec86a588b = tests/jamming_terrain.rs (b1_terrain_units_only_with_the_section, b2_every_placement_matches_the_independent_numpy_recomputation, b3_the_loss_never_rises_as_the_jammer_rises, b4_the_loss_reaches_every_js_and_nothing_else, b5_the_knife_edge_function_matches_the_reference_expression), par rapport à xval/jamming-terrain/expected.json issu de xval/jamming-terrain/oracle.py

# text
seg-0417fac0e7e2 = jamming_rx (AcquisitionCfg, AcqState, FrontEndCfg, front_end) ; jamming (run_jamming_sky) ; iq::frontend::quant (optimum_step_sigma)

# text
seg-ca7aa6592c0d = tests/jamming_acq_agc.rs (h1_g1_units_only_with_their_section, h2_no_hysteresis_is_no_hysteresis, h2s_no_hysteresis_is_no_hysteresis_on_the_supplementary_runs, h3_flags_match_the_independent_recomputation, h3s_flags_match_the_independent_recomputation_on_the_supplementary_runs, h4_monotone_in_the_acquisition_threshold, h4s_monotone_in_the_acquisition_threshold_on_the_supplementary_runs, g2_quantiser_loss_matches_the_independent_monte_carlo, g3_agc_reading_matches_the_iq_layer_agc_loop), par rapport à xval/jamming-acq-agc/expected_hysteresis.json, expected_hysteresis_s1.json et expected_quantiser.json

# text
seg-80753cdc89bc = iq::track (LoopConfig, FllGate, design) ; iq::track::channel (la porte du FLL)

# text
seg-96b2276484ed = tests/iq_fll_handover_floor.rs (registered_bars_give_the_recorded_verdict, d1_the_key_is_part_of_the_hash_only_when_set, d4_the_capped_design_pulls_in_a_100_hz_handoff_error), sur tests/fixtures/fll_handover_floor/results.csv

# text
seg-e322b10ec19c = receiver_trust::machines::rtklib (read_rtklib_pos) ; receiver_trust::LogFormat::RtklibPos

# text
seg-b5f5f47b5608 = receiver_trust::machines::rtklib::tests (époques lat/lon, semaine/TOW et ECEF, dms refusé, entrée hostile) ; tests/receiver_trust_machines.rs::rtklib_pos_runs_as_a_receiver_log ; integrations/gnss_lib_py/test_bridge.py

# text
seg-97eac8ec4604 = receiver_trust::machines::novatel (read_novatel, novatel_crc32) ; receiver_trust::LogFormat::Novatel

# text
seg-d935af6c8c6a = receiver_trust::machines::novatel::tests (CRC figé, enregistrements ASCII et binaires, mauvais CRC ignoré, entrée hostile) ; tests/receiver_trust_machines.rs::novatel_jammer_flag_reaches_the_receiver_self_report

# text
seg-d151880c7268 = receiver_trust::machines::rtcm3 (read_rtcm3, crc24q) ; receiver_trust::LogFormat::Rtcm3

# text
seg-68a47a4f7e3f = receiver_trust::machines::rtcm3::tests (valeur de contrôle du catalogue CRC-24Q, C/N0 MSM4/MSM7 et fusion d'époques, temps GLONASS et correspondance des identifiants SBAS, mauvais CRC et autres messages)

# text
seg-a2c51966ce9e = receiver_trust::machines::gnss_sdr (read_gnss_sdr_monitor) ; receiver_trust::LogFormat::GnssSdr

# text
seg-696b76cdaf9a = receiver_trust::machines::gnss_sdr::tests ; integrations/gnss-sdr/example.jsonl

# text
seg-2977aaca1688 = receiver_trust::machines::imu, imu_fit ; surface::imu_fit ; scenario [log.imu]

# text
seg-10715c98eaae = receiver_trust::machines::imu::tests ; receiver_trust::machines::imu_fit::tests (coefficients de bruit blanc connus retrouvés à { "10" } % près, refus, le TOML s'analyse comme AccelCfg) ; tests/receiver_trust_machines.rs (accord et désaccord du cap, porteuse en ligne, imu_fit)

# text
seg-6ad9867cec5c = telemetry::mqtt (discovery, state_json, connect_packet, publish_packet, MqttSink) ; surface::TelemetryFormat::Mqtt

# text
seg-21059291ea8b = telemetry::mqtt::tests (octets des paquets, courtier en bouclage, courtier mort compté) ; tests/receiver_trust_machines.rs::trust_telemetry_mqtt_text_has_discovery_then_state

# text
seg-f94e58f3479b = integrations/ros2/kshana_trust (bridge.py, trust_node.py) ; integrations/gnss_lib_py/kshana_gnss_lib_py.py

# text
seg-8c92f36d0227 = tests/receiver_trust_machines.rs (rtklib_pos_runs_as_a_receiver_log : le format qu'écrit le pont gnss_lib_py, passé par receiver-trust) ; les tests Python des ponts sont integrations/ros2/kshana_trust/test/test_bridge.py (pont avec un moteur factice), integrations/ros2/kshana_trust/test/test_engine_integration.py (la véritable roue évalue une position stable comme nominale et un saut de { "1.1" } km comme non fiable) et integrations/gnss_lib_py/test_bridge.py (véritable gnss_lib_py { "1.1.0" } et la roue), exécutés avec pytest, et non par cargo

# text
seg-ec141da2fe8e = wahba

# text
seg-7ece946b2cb0 = wahba::tests (A(quaternion identité)=I ; le solveur propre de Jacobi satisfait Kv=λv et conserve la trace sur une matrice symétrique connue ; K est symétrique) ; tests/wahba_reference.rs (TRIAD, la méthode q de Davenport et QUEST reproduisent la DCM optimale de scipy.spatial.transform.Rotation.align_vectors sur des jeux de vecteurs pondérés sans bruit à <{ "1e-9" } rad près, via l'angle d'erreur d'attitude indépendant du référentiel ; en outre la méthode q retrouve une rotation connue avec λ_max=Σ des poids et une perte de Wahba nulle, la solution de la méthode q minimise la perte de Wahba sous perturbation, QUEST concorde avec la méthode q optimale à <{ "1e-7" } rad près, et l'estimateur optimal bat TRIAD à deux vecteurs en erreur d'attitude RMS sur { "2000" } essais Monte-Carlo bruités)

# text
seg-e35ff28ef879 = acquisition

# text
seg-e6a7ff99874a = acquisition::tests (cas central de Marcum-Q Q_1({ "0" },b)=exp(−b²/2) ; l'identité P_d=Q_M(√(2Mρ),√γ) ; aller-retour P_fa↔seuil sur M et P_fa ; monotonie de la ROC — P_d croît avec le SNR, décroît avec le seuil, P_d→P_fa quand SNR→{ "0" } ; le gain d'intégration non cohérente augmente P_d à P_fa fixé ; Marcum-Q monotone en a et b et borné dans [{ "0,1" }]) ; tests/acquisition_reference.rs (le Marcum Q_M(a,b) généralisé, P_d, P_fa et l'inversion P_fa→seuil concordent avec scipy.stats.ncx2/chi2 sur une grille (M,a,b)/(M,P_fa)/(M,SNR) à ~{ "1e-6" } près)

# text
seg-4f480ce145f7 = lambda

# text
seg-7c55c072cfb7 = lambda::tests (L D Lᵀ reconstruit Q) ; tests/lambda_reference.rs (la transformée Z est unimodulaire |det Z|={ "1" } avec Q_z=ZᵀQZ SPD, conserve le déterminant et réduit la corrélation hors diagonale totale ; l'ILS de Schnorr–Euchner concorde avec l'énumération exhaustive sur { "300" } covariances aléatoires ; la chaîne complète décorrélation→recherche→transformation inverse égale l'ILS direct et Z⁻ᵀZᵀ reconduit les entiers ; le taux de réussite bootstrap en forme close concorde avec une simulation Monte-Carlo de 200k essais d'arrondi conditionnel séquentiel à <{ "0.01" } près) ; tests/lambda_rtklib_oracle.rs::ils_solution_matches_rtklib_lambda_on_300_covariances (les entiers fixés sont égaux à ceux de lambda() de RTKLIB v2.4.2-p13 sur { "300" } covariances aléatoires, n de { "2" } à { "10" }, dont { "226" } non résolubles par arrondi ; les deux meilleures normes au carré concordent à { "1e-9" } en relatif, mesuré { "5.6e-13" })

# text
seg-18befb9e9596 = bplane

# text
seg-5eb675d6585e = bplane::tests (les scalaires de survol satisfont les formes closes avec deux identités de |B| concordantes et |B|>r_p ; l'angle de déviation décroît avec le rayon du périapse et atteint les limites δ→{ "0" } / δ→π ; la déflexion conserve la vitesse v∞ et fait tourner exactement de δ ; la norme du Δv d'assistance égale { "2" }·v∞·sin(δ/2) et est bornée par { "2" }·v∞ ; les axes du plan B sont orthonormés et ⊥ Ŝ avec |B|²=(B·T̂)²+(B·R̂)² ; le paramètre de Tisserand est invariant à travers une déflexion qui conserve v∞ et modifie a,e,i, et égale { "3" }−(v∞/v_circ)²) ; tests/bplane_gmat_oracle.rs::bplane_matches_gmat_over_a_hyperbolic_grid ; tests/bplane_heliocentric_oracle.rs::assist_delta_v_matches_gmat_asymptotes_and_c3 ; tests/bplane_heliocentric_oracle.rs::heliocentric_elements_and_tisserand_match_gmat_and_sbpy ; tests/bplane_heliocentric_oracle.rs::tisserand_matches_kasuga_jewitt_2019_table_8_1

# text
seg-3111857b93df = crpa

# text
seg-d333f700ca8a = crpa::tests (identités de l'arithmétique complexe dont z/z={ "1" }, |exp(jθ)|={ "1" }, zᴴz=|z|² ; l'annulation déterministe de directions donne un gain exact unitaire sur le SV et des nulls de brouilleurs <{ "1e-9" } sur un ULA à 4 éléments avec { "3" } brouilleurs ; un réseau à N éléments rejette >N−{ "1" } brouilleurs et annule à norme minimale un nombre moindre ; MVDR reste sans distorsion vers le SV tandis que le null du brouilleur se creuse de façon monotone avec la puissance du brouilleur jusqu'à <{ "1e-3" } à { "60" } dB) ; tests/crpa_reference.rs (les vecteurs de poids MVDR et d'annulation à norme minimale et les gains de réponse du réseau qui en résultent concordent avec un calcul LAPACK numpy/scipy indépendant à ~{ "1e-9" } près)

# text
seg-97d39969aa50 = powerlaw

# text
seg-213c2856bc78 = powerlaw::tests (chaque type de bruit pur montre la pente log-log de son ADEV caractéristique — FM blanc −½, FM flicker { "0" }, FM à marche aléatoire +½, PM blanc −{ "1" } ; le terme FM flicker est un plancher plat égal à √({ "2" } ln2·h_{ "{" }-1{ "}" }) sur cinq décades de τ ; l'ajustement de la famille FM retrouve par aller-retour h_{ "{" }-2{ "}" },h_{ "{" }-1{ "}" },h_0 connus à partir d'une courbe synthétique à <{ "1e-6" } près ; et le plancher d'une courbe dominée par le flicker est retrouvé ici alors que l'ajustement sur base de dérive (quantum_trade::qparams_from_adev_curve) est faux de >{ "10" } % aux grands τ — comblant une lacune documentée) ; tests/powerlaw_oadev_reference.rs (σ_y(τ) comparé aux formes closes Noise.adev d'allantools { "2024.06" } sur l'échelle de τ pour les cinq types de bruit, plus une corroboration du niveau h_a par générateur de Kasdin d'allantools→estimateur oadev)

# text
seg-0a7be53acff4 = oem (covariance_block_kvn, parse_covariance_block)

# text
seg-c3f4fe461c45 = oem::tests (une covariance PD symétrique fait l'aller-retour KVN→analyse à l'arrondi f64 près et reste symétrique ; le bloc émet exactement les { "21" } entrées triangulaires inférieures — i+{ "1" } par ligne de matrice — avec/sans COV_REF_FRAME ; un bloc avec un mauvais nombre de valeurs et un bloc manquant sont tous deux rejetés) ; tests/ccsds_oem_covariance_reference.rs (la bibliothèque indépendante oem { "0.4.5" } analyse un segment OEM émis par kshana et reconstruit la matrice symétrique { "6" }×{ "6" }, concordant avec la covariance d'entrée de kshana à l'arrondi f64 près ; avec un contrôle négatif perturbé et une vérification que oem rejette la variante étiquetée CX_X)

# text
seg-5dd227be45fe = oem { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — le MÊME analyseur CCSDS-502 indépendant, auquel fait confiance la ligne Validated « CCSDS OEM interoperability », une base de code totalement distincte (son propre tokeniseur KVN, sa propre machine à états de section de covariance et son propre assemblage matriciel numpy). kshana émet un segment OEM complet portant son bloc COVARIANCE triangulaire inférieur de nombres nus non étiquetés ; oem l'analyse et reconstruit la matrice symétrique { "6" }×{ "6" }, concordant avec la covariance d'entrée de kshana élément par élément à l'arrondi f64 près — un véritable aller-retour d'échange entre bibliothèques (comparé à la reconstruction de oem, et non à une nouvelle analyse par kshana), comblant la lacune précédente de la ligne, « aucun jeu de test tiers »

# text
# c1: ins-trn-coast
seg-8fd49e7a4cc3 = inertial::coast (ErrorDynamics, ErrorSource, source_error_m, CoastModel, Contribution, Combination, TrnFixMode, first_crossing_s, InsTrnCoastScenario) ; type de scénario <c1/>

# text
seg-ece63653ae22 = tests/ins_coast_schuler_navego_oracle.rs::coast_error_model_matches_the_corrected_navego_runs ({ "48" } points, six termes d'erreur de { "30" } s à { "3600" } s, classe Tactical, { "45" } deg N, à l'horizontale et pointé vers le nord : chaque point à { "5" } % près, pire cas +{ "3.70" } % de marche aléatoire de vitesse à { "1200" } s) ; inertial::coast::tests (the_error_model_follows_the_leading_order_law_on_a_short_coast ; a_bias_error_is_schuler_bounded ; doubling_the_coast_scales_each_contribution_by_two_to_its_own_power ; every_contributions_closed_form_crossing_agrees_with_the_engines_bisection ; the_located_crossing_puts_the_model_on_the_threshold_it_searched_for ; the_bias_law_matches_the_engines_stochastic_dead_reckoner_stepped_forward ; the_velocity_random_walk_law_matches_a_monte_carlo_of_the_engines_dead_reckoner ; the_scale_factor_law_matches_a_double_integration_of_the_engines_imu_error_model ; a_full_reset_fix_makes_every_inter_fix_excursion_identical ; the_largest_fix_interval_holding_a_threshold_puts_the_peak_on_that_threshold ; an_error_free_imu_never_reaches_a_threshold_and_says_so_instead_of_reporting_zero ; every_published_field_carries_a_unit_and_a_provenance_class ; the_scenario_runs_through_the_engines_public_dispatch_and_is_reproducible) ; tests/ins_coast_navego_montecarlo_oracle.rs::finding_laws_hold_to_600_s_and_overstate_beyond (le constat du tour 1 sur les lois d'ordre dominant en Terre plate, conservé comme régression)

# text
seg-14054e77e0d4 = lunar_vlbi_fim::tests ({ "24" } tests de bibliothèque : le jacobien analytique comparé à une différence finie centrée de lunar_vlbi::vlbi_delay_s calculée par une voie qui fait pivoter vers l'avant les coordonnées propres de l'état et ne touche jamais une dérivée partielle, concordant à < { "1e-6" } de 1/c par colonne, les deux matrices d'information concordant à < { "1e-6" } de la plus grande diagonale et les covariances à < { "1e-5" } en relatif ; une géométrie unitaire orthogonale dont la covariance vaut c·σ_τ par axe en forme close à { "1e-12" } près, qui est aussi l'unique cas où le lien d'équipartition est exact ; le spectre de covariance et le sigma 3D de chaque station invariants par rotation rigide de tout le réseau à { "1e-9" } près avec C_rot = R·C·Rᵀ vérifié bloc par bloc ET une assertion explicite que les sigmas par axe ont bien bougé, de sorte que le test ne puisse pas passer à vide ; la covariance variant exactement comme σ² et comme 1/N ; la borne de trace AM-HM jamais battue ; la fermeture des délais τ_ik = τ_ij + τ_jk vérifiée à un ULA près sur les délais et sur les lignes du jacobien, une ligne de base redondante apportant de l'information mais jamais de rang ; une époque unique déclarée de rang déficient avec un indicateur principal nul ; un arc plus long mesuré comme mieux conditionné à nombre d'observations égal ; le bloc de balises montré inobservable sur ce calendrier ; la dérivée partielle négligée du Shapiro différencié mesurée par différence finie à l'exécution et émise plutôt qu'écartée d'un geste) ; tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_vlbi_fim_matches_spice_geometry_and_numpy (réseau ancré par défaut et réseau libre : jacobien construit avec SPICE, calendrier de 16 observations identique, sigmas des stations à { "2.2e-3" } près, valeurs propres { "2.3e-3" }, conditionnement { "2.4e-3" }, indicateur principal { "1.0e-3" }, ligne de visée { "0.018" } deg, déclinaison { "0.007" } deg, contre des seuils de { "1" } % et { "0.1" } deg ; réseau libre de rang 8/9 avec un indicateur principal nul, espace nul à { "0.006" } deg d'écart ; NumPy sur le jacobien enregistré à { "2e-13" } près)

# text
seg-484388449426 = lunar_vlbi_fim (epoch_geometry_with, schedule, schedule_jacobian) ; ephem_provider (KernelEphemeris) ; naif_kernel

# text
seg-d44b405dbeba = tests/lunar_vlbi_surface_point_spice_oracle.rs::surface_point_covariance_kernel_path_matches_spice_geometry_and_numpy ({ "16" } observations identiques ; rang 3/3 ; valeurs propres à { "5.9e-5" } près ; conditionnement { "5.9e-5" } ; sigmas des balises à { "1.7e-3" } près contre { "1e-2" } ; RMS { "2.9e-5" } ; bras de levier { "1.4e-8" } ; sigmas P2 { "3.9e-14" } contre { "1e-9" }) ; lunar_vlbi_fim::tests

# text
seg-30cc52d98bbd = lunar_service (lunar_protection_level, lunar_protection_level_with_sigma), lunar (lunar_araim_with_sigma), raim (araim_raim)

# text
seg-9d5628188bd8 = tests/lunar_protection_level_reference.rs ({ "7" } cas de volume de service — pôle sud, latitude moyenne, équatorial, haut plateau surélevé — de { "6" } à { "19" } satellites, σ_URE 10/30/60 m, P_HMI de { "1e-3" } à { "1e-7" }, niveaux de protection allant de { "1.7e2" } à { "6.9e3" } m : HPL/VPL contre l'oracle composé RTKLIB + SciPy, pire |Δ| { "1.061e-8" } m et { "1.044e-8" } m pour une tolérance de { "1e-6" } m ; DOP contre le (GᵀG)⁻¹ propre de RTKLIB à { "1.790e-14" } en relatif ; K_fa contre scipy.stats.norm.isf à { "2.716e-11" } en relatif ; trois contrôles négatifs — un décalage de satellite de { "5" } km, une variation relative de σ_URE de { "1e-6" } et un P_HMI plus serré de { "0.1" } % — dont chacun déplace le niveau de protection d'au moins { "171" }× la tolérance, mesuré ; et une garde contre les fixtures périmées qui fige la géométrie enregistrée bit à bit sur ce que produisent le code de constellation et de visibilité propre au moteur, de sorte qu'un succès ne puisse pas survivre à une modification sous-jacente de la constellation)

# text
seg-842722fa9e91 = araim_reference (araim_reference_protection_levels, published_vectors), raim (araim_protection_level, araim_integrity_risk, normal_quantile)

# text
seg-68b534869ac3 = tests/araim_reference_vectors.rs ({ "2" } vecteurs publiés + { "6" } contrôles négatifs, fixture tests/fixtures/araim_reference/wgc_araim_reference_vectors.txt : omettre le biais nominal fait manquer le VPL publié de { "2.6457" } m, une erreur ISM de { "10" } % de { "0.2798" } m, K_fa à { "57" } modes au lieu de { "12" } de { "0.4015" } m, une erreur de variance d'intégrité de +{ "2" } %/+{ "5" } % de 0.0750/0.1971 m — et une erreur de +{ "1" } % ne le déplace que de { "0.0339" } m, signalé comme limite de résolution de la vérification plutôt que dissimulé ; les réponses des deux documents manquent chacune celle de l'autre de plus que la tolérance, de sorte que les vecteurs ne sont pas interchangeables ; la fixture enregistrée et les constantes compilées sont deux transcriptions indépendantes dont la concordance est vérifiée par assertion, de sorte qu'un chiffre publié ne peut pas être modifié d'un côté pour faire passer une vérification ; et C_int − C_acc = σ²_URA − σ²_URE = { "0.3125" } m² est vrai pour les { "40" } variances transcrites, une identité arithmétique qu'une faute de transcription romprait)

# text
seg-7e8963a7c86f = lunar_llr, realdata::llr_crd (composant fim, cio, frames, ephem, lunar_frame, lunar_frame_campaign)

# text
seg-617e168e2460 = tests/lunar_llr_real_data.rs ({ "11" } tests : les { "15" } fichiers CRD enregistrés sont tous identiques octet à octet à leurs empreintes consignées ; les { "349" } enregistrements sont tous comptabilisés, { "337" } utilisés et { "12" } ignorés pour une raison nommée ; chaque distance archivée est dans l'enveloppe réelle périgée/apogée ; les poids montrés comme ÉTANT bin_rms/√n_raw ; la coordonnée de ligne de visée la mieux déterminée pour chaque réseau, le balayage de libration qui l'achète étant mesuré séparément ; le résidu et sa confirmation indépendante contre JPL Horizons ; la sensibilité à une inclinaison de géométrie de 0.1 degré ; la comparaison avec la campagne simulée montrée égale à une exécution indépendante de ce scénario ; un épinglage R1 bit à bit sur les trois lots de référentiels lunaires préexistants) ; lunar_llr::tests ({ "12" } : la dérivée partielle de la distance contre une différence finie centrée du temps de vol modélisé à < { "1e-6" } en relatif ; le temps de lumière d'un aller-retour lunaire convergé ; le sigma de datum exactement linéaire en l'échelle des poids à { "1e-9" } près ; la diagonalité par blocs exacte ; un répertoire de données manquant refusé plutôt que remplacé ; une ligne de catalogue modifiée détectée par sa propre colonne de rayon) ; realdata::llr_crd::tests ({ "7" } : sémantique des champs, passage de minuit, refus d'une échelle de temps non UTC et d'une version de format non prise en charge, et aucun sigma de substitution pour un intervalle vide) ; tests/validate_llr_datum_spice_oracle.rs (llr_datum_finding_tz_sigma_one_percent_gap, épinglé ; reported_residual_is_the_engine_to_spice_light_time_gap) ; tests/validate_llr_datum_analytic_fresh_2025.rs::llr_datum_analytic_moon_matches_spice_and_numpy_on_fresh_2025_normal_points ({ "151" } points normaux 2025-Q2 jamais vus ; sigmas et normes au pire { "1.11e-3" } sur { "1e-2" }, conditionnement { "8.95e-4" } sur { "2e-2" }, rapports { "1.79e-3" } sur { "2e-2" }, comptabilité, rangs et couplage exacts)

# text
seg-9e17b852f721 = lunar_llr (llr_geometry_with, LunarLlrDatumScenario) ; ephem_provider (KernelEphemeris) ; naif_kernel

# text
seg-ed8e396d7fb6 = tests/validate_llr_datum_kernel_moon_fresh.rs::llr_datum_kernel_moon_matches_spice_and_numpy_on_fresh_normal_points ({ "447" } points normaux 2019-Q2 jamais vus ; sigmas et normes à { "4.0e-5" } près sur { "1e-2" }, conditionnement { "1.6e-5" } sur { "2e-2" }, rapports { "7.6e-5" } sur { "2e-2" }, comptabilité et rangs exacts) ; tests/validate_llr_datum_kernel_moon.rs (le diagnostic sur données déjà vues de { "2015" }, { "0.049" } % sur tz ; pas une preuve pour cette ligne) ; lunar_llr::tests

# text
seg-0bd1d423f40a = ephem (moon_position), lunar_llr, realdata::llr_crd

# text
seg-e73eed7ff8b5 = tests/lunar_llr_real_data.rs::the_analytic_moon_series_disagrees_with_jpl_by_the_same_amount ({ "12" } états géocentriques hebdomadaires, angle de la pire époque affirmé < { "0.3" }° et RMS < { "5e5" } m par rapport à l'affirmation documentée du module lui-même, plus le résidu LLR affirmé concordant avec le désaccord radial à < { "5" }× près) ; ::the_measured_residual_is_the_ephemeris_error ({ "337" } vrais points normaux)

# text
seg-e6eeb246d545 = integrity::tpl_scalar::tests (rang 1, fusion/exclusion, dominance du biais, recoupement IR) ; tests/tpl_scalar_numpy_oracle.rs::scalar_mhss_pl_matches_numpy ({ "300" } cas enregistrés : estimateurs de sous-ensembles lstsq de numpy, covariance de séparation générale, PL par brentq de scipy ; PL à { "1e-9" } en relatif, pire { "1.2e-10" } ; sous-ensemble dominant exact)

# text
seg-2737758e6542 = integrity::gls_commonmode::tests + tests/gls_reference.rs + tests/gls_whitening_numpy_oracle.rs::whitening_and_mahalanobis_match_numpy_lapack ({ "201" } cas SPD enregistrés : facteur, résidu blanchi, opérateur de blanchiment et carré de Mahalanobis contre numpy LAPACK à { "1e-12" } en relatif, pire { "7.9e-16" })

# text
seg-d36e19a6e2a9 = integrity::gls_commonmode::tests (separation_alone_is_blind_to_common_mode, degenerate_direction_or_non_pd_gives_no_finite_ceiling, every_nonzero_direction_under_pd_omega_has_a_finite_ceiling) ; tests/gls_outside_omega_bound_numpy_oracle.rs::undetectable_common_mode_ceiling_matches_numpy_lapack ({ "256" } cas enregistrés : alpha_ss, alpha_cm et le minimum à { "1e-12" } en relatif sur { "210" } cas bien conditionnés et limites, pire { "3.3e-15" } ; { "40" } mal conditionnés jusqu'à un conditionnement de { "1.3e8" } dans une borne énoncée mise à l'échelle du conditionnement, pire { "1.1e-9" } ; six infinis exacts)

# text
seg-fa85ee9b1daa = tests/lunar_datum_identifiability_reference.rs::decompose_matches_scipy_reference ({ "16" } matrices SPD 7x7 synthétiques allant de bien conditionnées à quasi dégénérées à { "{" }{ "0,3" }{ "}" } ; lambda_min de Schur / CRLB d'origine / |corr| contre SciPy/NumPy à <{ "1e-9" } rel)

# text
seg-4fcff50bca2e = lunar_orientation::tests (de440_moon_pa_reproduces_fixture_rows, de440_moon_pa_shows_real_libration) ; tests/lunar_pa_frame_realisation_guard.rs::the_orientation_series_interpolation_error_is_tens_of_metres_not_sub_metre ; tests/lunar_pa_orientation_spice_oracle.rs::interpolated_rotation_matches_direct_kernel_evaluation_off_node ({ "2 000" } époques aléatoires hors nœud contre SPICE pxform sur le PCK binaire : angle de rotation à { "1.7e-5" } rad près, pire { "1.7e-6" } rad, { "3" } m au rayon moyen)

# text
seg-3e86011ef650 = lunar_llr_geometry (reflectors, stations_itrf, ItrfStation, StationCoordinates, llr_bcrs_one_way_m, body_to_bcrs_tdb, shapiro_leg_m, BcrsEvent) ; lunar_orientation (try_de440_moon_pa_body_to_inertial) ; lunar_vlbi (station_inertial_position_itrs)

# text
seg-ef1e57e7bf3d = tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_bcrs_iers2010_relativistic ({ "192" } points normaux ILRS : RMS { "2.81" } m ; les deux stations ITRF2020 seules { "2.96" } m ; les deux au plus { "10" } m) ; tests/lunar_llr_geometry_range_oracle.rs::round2_finding_is_a_common_offset_of_about_eleven_metres (le modèle de temps de lumière géocentrique remplacé, { "10.94" } m, épinglé)

# text
seg-32da421d27ef = tests/lunar_coupled_gauge_reference.rs::coupled_gauge_matches_numpy_on_real_de440_rows ({ "9" } valeurs propres, defect/dim_spatial/dim_temporal/coupled_dim/p_st_norm et la marginale de Schur { "{" }scale,offset{ "}" } pour les réseaux well_posed de 120 lignes et single_epoch de 30 lignes, à rel<{ "1e-3" } et abs<{ "1e-3" }) ; lunar_gauge::tests (coupled_marginal_fisher_is_symmetric_and_psd, oneway_spatial_equals_orbiter_range_row_datum7, twoway_spatial_equals_oneway_spatial_at_same_geometry)

# text
seg-9f0fd0918105 = lunar_gauge, lunar_time

# text
seg-abab0c3bfa30 = tests/lunar_rate_frame_coupling_preregistered.rs (entry1_d_alpha_d_scale_matches_the_published_l_m_for_both_cited_fields : L_m à { "2.8e-6" } près de Ashby et Patla { "2024" } avec J2 d'AIUB-GRL350A/B ; entry2_d_alpha_d_radial_matches_the_degree_350_equatorial_gravity_for_both_fields : l'entrée radiale à { "8.3e-5" } près de la gravité équatoriale de degré 350 de pyshtools ; entry3_d_alpha_d_velocity_matches_the_de441_lunar_speed : l'entrée de vitesse à { "2.5e-3" } près de la vitesse lunaire de DE441 à { "2000" } époques) ; lunar_gauge::tests ; régression tests/lunar_rate_frame_coupling_oracle.rs

# text
seg-57b6f02016e4 = lunar_gauge::tests (classify_is_invariant_under_null_basis_rotation - une base nulle alignée sur les axes et sa rotation de { "0.6" } rad donnent des defect, dim_spatial, dim_temporal, coupled_dim et p_st_norm identiques ; classify_direct_sum_null et classify_coupled_null - des cas construits en somme directe et réellement couplés confirment la décomposition des dimensions ; classify_basis_invariant ; index_consts_are_correct) ; tests/lunar_gauge_classification_scipy_oracle.rs::classify_null_space_matches_scipy_subspace_intersection ({ "72" } matrices de Fisher 9x9 construites sur { "18" } sous-espaces nuls, chacune dans quatre re-bases orthonormées aléatoires : defect, dim_spatial, dim_temporal et coupled_dim exacts ; p_st_norm à { "6.0e-15" } près, seuil { "1e-9" })

# text
seg-e9319e19b9f3 = tests/lunar_interop_budget_reference.rs (raw / rotation-residual / theta_moon / theta_frametie / theta_excess / reducible / irreducible pour { "3" } paires de fournisseurs contre l'ajustement lstsq SVD SciPy indépendant dans tests/fixtures/inter_ephemeris/reference.json, rel<{ "1e-3" } abs<{ "1e-3" } m ; fixtures et oracle cohérents octet à octet via scripts/gen_interop_ref.py sur les noyaux publics DE440/INPOP21a/EPM2021 par IMCCE calceph)

# text
seg-89624a7374e9 = tests/lunar_faultobs_reference.rs (faultobs_matches_numpy_scipy_on_real_de440_rows : la matrice P⊥ de { "84" }×{ "84" } élément par élément, trace(P⊥) = parity_dim = { "52" } et rang(G) = { "32" }, normes de détectabilité + indicateurs, la forme quadratique MDB cᵀWP⊥c + valeur MDB, et les décomptes de détection/identification de l'étincelle par bloc pour chaque coalition de pairs, reproduits contre un oracle numpy/scipy indépendant à rel<{ "1e-3" } abs<{ "1e-3" } avec des décomptes entiers exacts ; entrées cohérentes octet à octet via examples/gen_faultobs_rows.rs + scripts/gen_faultobs_ref.py)

# text
seg-cbdf069c7baa = telecom_timing (mtie_sliding, mtie_curve_ns, tdev_curve_ns) ; allan (mtie, time_deviation)

# text
seg-d4dfc8374544 = tests/telecom_timing_reference.rs ({ "17" } facteurs de moyennage MTIE et { "12" } TDEV sur une série de holdover d'horloge atomique à l'échelle d'une puce de { "2" } 048 échantillons enregistrée, avec vieillissement, flicker et température, contre allantools { "2024.06" } à <{ "1e-12" } / <{ "1e-9" } en relatif, observé exact / { "1.1e-15" } ; les mêmes courbes lues dans une exécution complète de synchronisation télécom qui ingère le CSV) ; telecom_timing::tests (MTIE glissant égal à allan::mtie à chaque fenêtre ; MTIE et TDEV dérivés à la main ; MTIE monotone)

# text
seg-776723e1171a = allan (edf_greenhall, greenhall_edf_core) ; assurance::uncertainty (edf)

# text
seg-d98eb984ce90 = tests/greenhall_edf_allantools.rs (bars_1_to_3_against_allantools ; bar_4_wrappers_equal_the_core) ; tests/greenhall_edf_no_moved_output.rs (uncertainty_edf_is_bit_identical_to_the_0_36_portable_baseline) ; tests/uncertainty_edf_reference.rs

# text
seg-51a5b33f0b62 = slot_timing (ClockNoise::from_phase_record, fit_weighted, slot_budget, breach_after_sync_s)

# text
seg-02d2f67a9284 = tests/slot_timing_cs5071a_holdout.rs (holdover_inversion_predicts_the_held_out_caesium_record : ajustement sur le premier tiers de l'enregistrement, prédiction de la violation à un sigma à { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } et { "2.5" } ns, mesure sur les deux autres tiers à partir d'un point de synchronisation toutes les { "997" } s ; seuil, fixé avant la première exécution, d'un facteur { "1.5" } dans les deux sens ; rapports observés de { "0.84" } à { "1.03" } ; un témoin, l'écart-type d'Allan à une seconde lu comme du FM blanc, rate d'un facteur d'environ { "1 000" } et doit échouer au seuil ; une mutation divisant par deux le niveau de FM blanc fait échouer le test) ; slot_timing::tests (a_measured_white_fm_record_recovers_its_level ; reduces_to_the_holdover_inversion ; ieee1139_conversion_matches_the_powerlaw_module)

# text
seg-83c8f23a4b53 = navsignal (Modulation::psd, spectral_separation_coeff_offset, q_from_ssc) ; spectrum (psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz, Jammer::ssc)

# text
seg-436f7a545a7b = spectrum::tests (bpsk_main_lobe_null_to_null_is_two_n_times_1_023_mhz — BPSK({ "1" }) { "2.046" } MHz et BPSK({ "10" }) { "20.46" } MHz localisés numériquement sur la forme close ; boc11_lobes_are_centred_at_plus_minus_1_023_mhz — null de porteuse, premier null à { "2.046" } MHz, centre de lobe { "1.023" } MHz, et le maximum exact à { "0.7590" } MHz contre une résolution de Newton indépendante de tan y = 2y ; ssc_matches_parseval_closed_forms — C/A x C/A 2/(3R_c) = -61.86 dB/Hz, BOC({ "1,1" }) x BOC({ "1,1" }) 1/(3R_c) = -64.87 dB/Hz, C/A x BOC({ "1,1" }) 1/(6R_c) = -67.88 dB/Hz, chacun à { "0.02" } dB près ; q_values_match_kaplan_hegarty — CW à la porteuse Q = { "1" }, bruit à spectre adapté Q = { "1.5" }, bruit plat de null à null Q = { "2.215" } ; mboc_is_a_unit_area_one_eleventh_mix)

# text
seg-500eea1d6b4a = sigmf (read, write, encode, decode, parse_meta, meta_to_json) ; spectrum (welch_psd, fft_in_place, synthesise_iq)

# text
seg-19aa57a32add = sigmf::tests (cf32_round_trip_is_exact_to_single_precision ; ci16_round_trip_is_within_half_a_code ; ci16_is_little_endian_i_then_q ; integer_encoding_counts_saturation ; metadata_uses_the_core_namespace ; unsupported_types_and_channels_are_refused ; sample_start_offsets_into_the_data) ; spectrum::tests (fft_matches_a_direct_dft ; welch_reads_white_noise_as_variance_over_fs_and_keeps_a_tone_s_power — plancher à { "2" } % près de la variance sur la fréquence d'échantillonnage, total de Parseval à { "2" } % près, largeur de bande de bruit équivalente de Hann { "1.5" } bins ; noise_like_synthesis_is_unbiased_through_welch — médiane de Welch moins modèle à { "0.1" } dB près via un aller-retour ci16_le ; synthesised_iq_through_sigmf_reproduces_the_model_spectrum) ; tests/sigmf_welch_oracle.rs::welch_and_sigmf_io_match_scipy_and_sigmf_python (PSD de Welch contre scipy { "1.18.1" } signal.welch par bin à { "1e-12" } en relatif sur { "27" } cas, observé { "6.0e-14" } ; cinq enregistrements sigmf-python { "1.13.0" } décodés à l'identique bit à bit avec des métadonnées identiques ; enregistrements écrits par la crate relus à l'identique bit à bit par sigmf-python et valides au schéma contre SigMF { "v1.2.6" })

# text
seg-390697edfd7d = ephem (standish_state, standish_elements, standish_nominal_error, ecliptic_to_icrf) ; ephem_provider (AnalyticSolarSystem) ; solar_system (SolarSystemScenario)

# text
seg-af9dc8bcbd0a = ephem_provider (KernelEphemeris::relative_position_utc, utc_to_tdb_jd2) ; naif_kernel ; timescales

# text
# c1: docs/VERIFICATION-MATRIX.md
seg-e8e0e0618afa = Source : <c1/>

# text
seg-4cb1d67922ed = Le registre de preuves complet, vérifié par machine : <b>{ "388" } lignes — { "176" } VALIDATED, { "208" } MODELLED, { "4" } PARTNER</b>. Une ligne ne peut être VALIDATED qu'avec une référence indépendante externe (les tests d'invariants de la matrice l'imposent). Les mêmes données, avec des liens cliquables par ligne vers chaque test, module et fixture versionnée, constituent le <em>registre de validation</em> sur <a1>https://kshana.dev</a1>. Voir <a2>MODELLED-RATIONALE.md</a2> pour savoir pourquoi chaque ligne modélisée n'est pas validée en externe.

# text
seg-6e5e0a1e1c99 = allan (lag1_noise_id, lag1_acf)

# text
seg-b04cb81fc402 = tests/clock_library_lag1_noise_id_allantools.rs ({ "140" } cas : dix enregistrements en loi de puissance de Kasdin, b = { "0" } à -4, en données de phase et de fréquence, af = { "1" } à { "64" } ; alpha_int et d identiques, pire |d alpha| { "9.6e-13" } et |d rho| { "4.8e-13" } contre { "1e-9" } ; préenregistré 2ec76864) ; allan::tests (lag1_identifies_white_pm_white_fm_and_random_walk_fm; lag1_is_blind_to_a_quadratic_phase_trend)

# text
seg-9c4769edcf2b = osnma (page, subframe, dsm, merkle, signature, tesla, mac, maclt, navdata, verifier, ubx, cli)

# text
seg-af088012df3f = tests/osnma_official_vectors.rs (en option, KSHANA_OSNMA_VECTORS : les { "18" } jeux de vecteurs, { "186,382" } balises authentifiées, { "0" } en échec, planchers par jeu, chaînes annoncées, ADKD 0/4/12, alerte vérifiée, authentification reprenant après la fin de chaîne, révocation de chaîne et de clé et nouvelle clé publique ; hors ligne, vecteurs non redistribués) ; tests/osnma_synthetic.rs (la suite d'attaques : sous-trames spoofées dans un futur lointain, expiration et liaison aux données, alerte et ne pas utiliser, confirmation d'en-tête, balises factices, MACSEQ, conflit de clés, KROOT périmée et rejouée, CMAC-AES/SHA3-256/P-521 via le vérificateur) ; tests unitaires osnma (RFC { "4231" }, RFC { "4493" }, FIPS { "197" }, FIPS { "202" }, RFC { "6979" } et réponses connues de CRC-24Q)

# text
seg-be26fdfb4a7c = allan

# text
seg-a59477833676 = tests/allan_reference.rs (NBS14 contre Stable32 à { "1e-4" } près) ; allan::tests

# text
seg-b8ed4780ccb7 = tests/cs5071a_reference.rs (5071A Cs réel contre maser à hydrogène, { "556 990" } points, { "16" } facteurs de moyennage contre Stable32 à { "1e-3" } près ; soumis aux données via scripts/fetch_cs5071a.sh)

# text
seg-17f05fc54f98 = tests/phasedat_reference.rs (Stable32 PHASE.DAT, { "139" } facteurs de moyennage, OADEV/MDEV/TDEV à { "1e-3" } près ; soumis aux données via scripts/fetch_phasedat.sh)

# text
seg-8c6006055d29 = tests/theo1_totvar_reference.rs (Theo1 + TOTDEV sur le jeu de données LCG de 1000 points du NIST SP { "1065" } §{ "12.4" }, { "6" } + { "6" } facteurs de moyennage contre allantools { "2024.06" } à <{ "1e-9" }) ; allan::tests (suivi de la forme close du bruit blanc de fréquence ; identité TOTVAR=ADEV à m={ "1" } ; invariance de Theo1/TOTVAR au décalage de phase/fréquence ; pente -1/2 du bruit blanc de fréquence)

# text
seg-ca3c7f74a002 = allan (mtie, mtie_curve)

# text
seg-deb9fe96d3bd = tests/mtie_reference.rs (MTIE sur la série de phase LCG de 1000 points hermétique du NIST SP { "1065" } §{ "12.4" }, { "9" } facteurs de moyennage m={ "1" }..256 contre mtie d'allantools { "2024.06" } à <{ "1e-9" }, observé ≤{ "4e-15" }) ; allan::tests (crête à crête dérivé à la main ; monotone non décroissant en τ ; a·m exact sur une rampe pure)

# text
seg-a8f98bb9ff1b = allan (modified_adev, time_deviation)

# text
seg-271a3d6ac7b1 = tests/mdev_tdev_reference.rs (MDEV + TDEV sur la série de phase LCG de 1000 points hermétique du NIST SP { "1065" } §{ "12.4" }, { "8" } facteurs de moyennage m={ "1" }..200 contre mdev/tdev d'allantools { "2024.06" } à <{ "1e-9" } en relatif, plus l'identité τ/√{ "3" } sur la série réelle) ; allan::tests (pente −1/2 du bruit blanc de fréquence ; petit cas MDEV dérivé à la main)

# text
seg-ad8d37a343f0 = quantum_trade (qparams_from_adev_curve), powerlaw

# text
seg-1df335e6eff2 = tests/optical_clock_adev_reference.rs (σ_y(τ) de l'horloge à pinces ⁸⁸Sr de Norcia et al., { "8" } temps de moyennage { "0.92" }–{ "117.76" } s repris tels quels sous CC-BY-4.0 : NNLS reconstruit la courbe à ~{ "10" } % RMS / ≤{ "21" } % au pire point ; √q_wf récupéré = { "4.33e-16" } concorde avec le 4.7e-16/√τ publié ; q_rw > { "0" } plancher de bruit rouge mesuré)

# text
seg-5efe6e680a2e = araim_reference (add_v42_protection_levels, add_v42_protection_levels_ecef); raim (snapshot_raim, snapshot_raim_fde, araim_raim, araim_dual_raim, solution_separation_raim); sbas (sbas_protection_level); lunar

# text
seg-c7fea4d91077 = tests/integrity_araim_stanford_oracle.rs::araim_mhss_matches_stanford_maast_add_v4_2 ({ "270" } cas de géométrie réelle, Celestrak GPS+Galileo et IGS SP3 : pire |dVPL| { "2.2e-3" } m, |dHPL| { "1.1e-3" } m, |dEMT| { "2.1e-10" } m contre le TOL_PL { "0.05" } m de l'ADD) ; tests/integrity_araim_stanford_oracle.rs::uniform_sigma_matched_gap_finding (les écarts à sigma uniforme, figés) ; tests/integrity_snapshot_raim_rtklib_oracle.rs::snapshot_raim_decisions_and_slope_levels_match_rtklib (IGS ABMF réel 2018-05-13, { "288" } époques, { "2016" } cas avec biais injectés de { "10" } à { "100" } m : 2016/2016 décisions de détection et 801/801 décisions d'exclusion identiques, niveaux de pente HPL/VPL à { "2.7e-12" } m près contre { "1e-6" } m) ; tests/integrity_sbas_stanford_oracle.rs::sbas_l1_protection_levels_match_stanford_maast_on_real_waas_messages ({ "2868" } paires utilisateur-époque sur des diffusions WAAS réelles, le même ensemble protégé, pire |dVPL| { "7.1e-6" } m et |dHPL| { "1.6e-5" } m contre { "1e-4" } m) ; tests/integrity_sbas_stanford_oracle.rs::sbas_l5_finding_geo_reception_gate (le constat L5, figé) ; tests/igs_real_data.rs et tests/araim_dual_real_data.rs (vraisemblance sur la géométrie réelle IGS SP3 et Celestrak, conservée comme contrôles de régression, et non comme références indépendantes)

# text
seg-a58b3968c6b7 = sgp4, propagator, orbit_determination, precise_od

# text
seg-9b9adc7d7cd4 = tests/sgp4_verification.rs ({ "666" } vecteurs de vérification AIAA, pire { "4.12" } mm) ; tests/sgp4_crate_comparison.rs (crate sgp4 indépendant)

# text
seg-1f6277967a05 = propagator, forces

# text
seg-f07882adc2a4 = tests/numerical_cowell_propagator_reference.rs ({ "275" } époques = { "11" } cas × { "25" } états horaires, LEO+GTO, contre Orekit { "12.2" } DormandPrince853 ; niveaux conservateurs T1–T5 pire |Δr| { "0.08" } m sur { "24" } h ; niveau de traînée caractérisé à { "333" } m)

# text
seg-0010700556ee = srp_shadow, forces (srp_accel_with_lit_fraction), propagator

# text
seg-2e312ba33e1b = tests/srp_oblate_shadow_orekit_oracle.rs ({ "2400" } géométries de part et d'autre du bord de l'ombre, { "884" } en pénombre, de LEO à GEO, déclinaison du Soleil { "0" } et +-23.44 deg, { "8" } azimuts : pire |dnu| { "7.41e-9" } pour WGS-84 et { "2.24e-9" } pour la référence de base sphérique ; les rapports WGS-84 et sphérique d'Orekit diffèrent jusqu'à { "0.98" }, de sorte que le jeu discrimine l'aplatissement) ; tests unitaires de srp_shadow et de propagator

# text
seg-7c521cb02ac6 = srp_boxwing, propagator, precise_od

# text
seg-2d4f28a19e1d = tests/srp_boxwing_orekit_oracle.rs ({ "252" } géométries d'orbite Galileo, { "7" } cas solaires dont les distances au périhélie et à l'aphélie, { "100" } attitudes aléatoires ; somme à plaques planes pire { "2.05e-15" } en relatif sur { "1056" } cas ; de bout en bout avec l'attitude et la pression propres d'Orekit pire { "2.39e-15" } sur { "747" } cas plein soleil, alors que les constantes de pression par défaut d'Orekit diffèrent de >= { "4.43e-3" }, de sorte que la comparaison discrimine la constante ; matrice de lacet nominal pire { "1.89e-15" } ; dérivée partielle du facteur de rayonnement pire { "1.35e-15" } ; dérivées partielles par panneau pire { "4.12e-13" } en relatif contre les différences centrales d'Orekit sur { "10836" } cas de panneaux ; accélération et dérivées partielles ECOM2 pire { "1.74e-15" }) ; tests unitaires de srp_boxwing (limites en forme close, dérivées partielles par différences finies) ; tests de câblage de propagator et de precise_od

# text
seg-d23a475337fb = tests/nrlmsise00_reference.rs ({ "720" } points de grille, { "90" } à { "1000" } km, { "4" } latitudes, { "2" } heures locales, { "3" } jours, activité faible/modérée/forte : densité à { "1.866e-6" } en relatif et température à { "1.97e-4" } K de pymsis ; identique bit à bit au portage C ; les { "17" } cas de test C publiés, { "187" } valeurs à { "0.496" } unité du 7e chiffre significatif) ; tests unitaires de nrlmsise00

# text
seg-caf1ae1b5cc2 = forces (density_at, drag_accel_with_density), propagator

# text
seg-1ac527ac9ccd = tests/drag_tier_orekit_oracle.rs ({ "4" } cas x { "25" } états horaires sur { "24" } h, circulaire { "51.6" } deg, { "400" } km à activité faible/modérée/forte et { "300" } km : pire |dr| { "0.0303" } m et |dv| { "3.36e-5" } m/s contre { "3.3" } à { "141.8" } km de déplacement dû à la traînée, pire erreur/seuil { "0.003" } ; le témoin à densité exponentielle échoue de { "119.1" } m) ; tests unitaires de forces et de propagator (défaut identique bit à bit ; le niveau évalue le portage au point géodésique fixe par rapport à la Terre)

# text
seg-7f91101322d5 = forces (atmospheric_density, drag_accel), propagator

# text
seg-751bc9c9df58 = tests/drag_exponential_gmat_oracle.rs (cas équatoriaux E400, E300 et E250x600 à J2000.0, { "25" } états horaires sur { "24" } h : le déplacement induit par la traînée concorde avec celui de GMAT à au plus { "0.016" } du seuil { "0.5" } m + { "1e-3" }|D| contre { "21.5" } à { "143.9" } km de déplacement ; une variation de +{ "1" } % de Cd*A/m atteint { "9.83" } fois le seuil ; le cas incliné I400 est rapporté, { "10.4" } % d'écart, la différence de définition de hauteur indiquée)

# text
seg-aa8686f7fb0a = tides (s2_air_waves, atmospheric_tide)

# text
seg-2143047934b5 = tests/s2_air_tide_gfz_table5.rs ({ "21" } ondes sur { "21" } concordent avec le modèle publié A2 : pire { "0.00050" } cm, { "0.050" } deg contre des seuils de { "0.0006" } cm, { "0.1" } deg) ; tests/tides_iers.rs (bande d'amplitude S2)

# text
seg-41e949982e14 = propagator (Geopotential, EarthFixedFrame), gravity_sh

# text
seg-0a12253e87b6 = tests/cowell_tesseral_orekit_oracle.rs ({ "6" } cas x { "25" } états horaires sur { "24" } h : EGM2008 8x8 et 70x70 sur LEO { "45" } deg, polaire { "89.9" } deg, héliosynchrone { "98.2" } deg, GTO, et 70x70 avec Soleil/Lune et SRP ; pire |dr| { "0.0355" } m, |dv| { "3.74e-5" } m/s ; les témoins négatifs échouent de { "6168" } m (Terre figée) et { "20871" } m (zonal seul)) ; tests unitaires de propagator (identité à la limite zonale à { "1e-12" } près, référentiel CIO identique bit à bit à precise_od, intégrale de Jacobi tenue à { "1e-9" } sur { "6" } h)

# text
seg-f75dcdead7a4 = integrator, propagator

# text
seg-a921a1135cd7 = tests/dop853_scipy_oracle.rs ({ "8" } pas simples : état à { "5.55e-15" } en relatif, dérivée FSAL { "3.46e-15" }, sortie dense { "1.99e-14" }, décisions d'acceptation/rejet identiques ; { "3" } exécutions complètes à rtol = atol = { "1e-12" } (LEO { "58000" } s, e = { "0.7" } sur { "5" } périodes, Arenstorf sur une période) : pas initial identique, pas acceptés 502/501, 390/390, 298/298 et évaluations 6025/6013, 5497/5497, 4285/4285 contre SciPy, états finaux à { "2.95e-13" } en relatif (deux corps) et { "1.58e-12" } (Arenstorf), sortie dense à { "9.5e-13" } ; précision par rapport à la solution de Kepler exacte de mpmath égale à celle de SciPy (LEO { "8.44e-5" } m, périodicité d'Arenstorf { "1.475e-9" })) ; tests unitaires de integrator et de propagator ({ "24" } h de deux corps contre Kepler exact sous { "0.1" } m)

# text
seg-c6da65825c67 = kepler, propagator

# text
seg-a8bfc307a73b = tests/kepler_mpmath_oracle.rs ({ "405" } points de grille, e de { "0" } à { "0.999999" }, M dans [-pi, pi] jusqu'à { "1e-12" } : pire |E - E_ref| { "0.898" } eps|E| contre un seuil de { "8" } eps|E| ; { "9" } points de M enroulé au pire à { "0.013" } de leur seuil ; aucune étape de polissage de Newton nécessaire à aucun des { "414" } points ; enveloppe identique bit à bit) ; tests unitaires de kepler

# text
seg-9a2263ce0872 = gravity_pds, gravity_sh

# text
seg-43b33973adff = tests/planetary_gravity_pds.rs (les découpes de degré 20 s'exécutent toujours : pire |dg|/|g| { "9.7e-16" }, relatif à la perturbation { "3.4e-11" } ; GMM-3 d/o { "120" } sur toute la sphère { "3.7e-15" } / { "6.3e-12" } et GL0660B d/o { "660" } à |lat| <= { "60" } deg { "5.0e-14" } / { "1.0e-10" }, soumis aux données ; en-têtes et coefficients choisis égaux aux produits PDS publiés, nombres d'enregistrements { "7380" } et { "218790" }) ; tests unitaires de gravity_pds

# text
seg-a7e3ecdbd2db = orbit_determination, precise_od (batch_ls::gauss_newton, fusion::ukf)

# text
seg-4adc303e81c8 = tests/batch_sequential_orbit_determination_reference.rs ({ "8" } scénarios : { "6" } sans bruit LEO/MEO/excentrique/3–4 stations + { "2" } σ={ "5" } m, contre Orekit { "12.2" } ; pire par lot |Δr| { "1e-3" } m / |Δv| { "1e-6" } m/s, séquentiel |Δr| { "0.9" } m)

# text
seg-9edf08007870 = radiometric (light_time_solution)

# text
seg-c77ce1873266 = tests/deep_space_mars_radiometric_reference.rs ({ "24" } liaisons sur { "8" } époques { "2020" }–{ "2027" } contre ANISE DE440 ; pire |Δτ| { "1.03e-9" } s, |Δrange| { "0.31" } m jusqu'à { "2.5" } AU)

# text
seg-8c4b011702b8 = rinex (parse_nav, RinexEphemeris::sv_position_ecef)

# text
seg-d202a16aba3f = tests/rinex_sp3_interop_reference.rs ({ "84" } cas satellite-époque : GPS + Galileo + BeiDou-MEO, { "12" } satellites × { "7" } décalages, contre RTKLIB eph2pos ; pire |Δ| par axe { "6.2e-8" } m)

# text
seg-8233e5fa4199 = sp3 (Sp3Interpolator::position_ecef)

# text
seg-4e11ff43fdf7 = tests/sp3_interp_reference.rs ({ "72" } cas satellite-époque hors nœud / { "6" } satellites contre RTKLIB peph2pos ; pire |Δ| par axe { "1.5e-8" } m)

# text
seg-724b7f1d8d6e = ionex (parse_ionex, parse_ionex_file, IonexFile::vtec_at, IonexFile::slant_tec_at, interpolate_tec_in_time, TecGrid::vtec_at)

# text
seg-bec58d3dc51b = tests/ionex_code_gim_oracle.rs (carte IONEX synthétique versionnée contre la référence de formule : { "20 075" } nœuds exacts, interpolation max |Δ| { "3.5e-13" } TECU ; soumis aux données sur KSHANA_IONEX_CODE_GIM_DIR, la découpe en latitude du GIM final CODE réel du 2018-05-13 récupérée par fetch.sh avec un SHA-256 figé : nœuds exacts, interpolation max |Δ| { "3.6e-13" } TECU sur { "15 795" } échantillons, TEC oblique { "5.1e-13" } TECU ; iontec RTKLIB v2.4.2-p13 soumis aux données à { "6885" } points de requête, exécuté le 2026-10-13 : max |Δ| { "3.6e-13" } TECU dans les deux modes temporels, seuil { "1e-5" } préenregistré) ; ionex::tests

# text
seg-b930d9f826c3 = rtk_real (run_rtk), lambda (resolve)

# text
seg-b182934a1bbc = tests/rtk_real_wettzell_oracle.rs (stations IGS WTZR base / WTZZ mobile, { "1.4" } m, 2025-02-24 00-03 h, { "30" } s : { "359" } époques, fixations à { "100" } % à partir de { "00" }:{ "10" }, erreur de ligne de base fixée médiane { "4.5" } mm, p95 { "5.5" } mm ; les { "10" } premières min fixées { "2.6" } mm contre flottantes { "13" } cm) ; rtk_real::tests

# text
seg-4ca93c8734ba = ppp_real (run_ppp, PppEpoch::clock_m)

# text
seg-3f5cbf55df2d = tests/ppp_time_igs_station_clock.rs (WTZR 2025-02-24, { "04" }:00-05:{ "55" }, { "24" } époques : Kshana moins IGS std { "0.075" } ns, seuil { "0.20" } ; moyenne -0.659 ns, seuil { "5.0" })

# text
seg-3f47749cb7a6 = ppp_real (run_ppp, parse_antex_receiver, solid_tide_ecef, phase_windup)

# text
seg-5e3b87bbbee5 = tests/ppp_real_wettzell_oracle.rs (station IGS WTZR, 2025-02-24 00-06 h, { "30" } s, tenue à l'écart du développement : horizontal à la dernière époque { "1.5" } mm, vertical −{ "2.9" } cm ; 04-06 h 240/240 époques à moins de { "0.10" } m en 3-D, p95 { "6.7" } cm ; code seul p95 { "1.70" } m ; RMS ZTD soumis aux données { "1.7" } cm contre EUREF) ; ppp_real::tests ; tests/ppp_parity_glab_rtklib.rs (RM-31 : PPP RTKLIB v2.4.2-p13 sur les mêmes entrées concorde à { "0.05" } m près à 240/240 époques, { "9.7" } mm à la dernière, au troisième enregistrement après deux exécutions dont la configuration RTKLIB n'avait pas la marée terrestre et plaçait l'antenne sur l'emplacement de la base, toutes deux consignées comme constats ; le seuil de parité SPP a été manqué, { "1.085" } m de médiane contre { "0.50" } m ; gLAB { "6.0.0" } à sa première exécution enregistrée, ligne de commande de l'amendement { "4" } : PPP à { "0.05" } m près à 240/240 époques et { "5.0" } mm à la dernière, seuil SPP manqué, { "1.187" } m de médiane, un constat : les solutions SPP propres aux deux outils de référence diffèrent de { "0.852" } m de médiane, de sorte que ce seuil avait été fixé plus strict que l'accord d'outil à outil)

# text
seg-285c8c81e033 = rinex (parse_nav, parse_nav_with)

# text
seg-a0832efb1056 = tests/rinex4_nav_brd400_oracle.rs (IGS BRD400DLR_S RINEX { "4.02" } contre BRDM00DLR_S RINEX { "3.04" } du 2026-07-19, tranche 00-02 h : enregistrements G { "37" } / E { "478" } / C { "72" } appariés dans les deux sens, chaque champ identique, position à Toe { "0" } m ; journée complète soumise aux données : G { "416" } / E { "5668" } / C { "865" } / J { "118" }) ; rinex::tests

# text
seg-bc1599eb4b29 = sp3 (Sp3File::clock_s, clock_nodes), precise_products (ClockRinex::from_sp3)

# text
seg-0b017f6fc258 = tests/sp3_clock_igs_oracle.rs (SP3 final IGS de { "15" } min du 2025-02-24 contre les horloges finales IGS de { "30" } s, { "32" } satellites GPS : médiane des nœuds |Δ| { "2.6e-13" } s ; { "3038" } enregistrements de point médian RMS { "0.121" } ns, p95 { "0.265" } ns ; en maintenant le nœud à la place { "4.24" } ns RMS) ; sp3::tests::clock_interpolation_is_linear_between_valid_nodes_and_exact_at_them

# text
seg-5a2ded5bd597 = fusion::kfgins (run, loaders, score), fusion::closed_loop (propagate_increments, fuse_position_lever_arm), fusion::gnss_ins_ekf (update_position_lever_arm)

# text
seg-5c5f9bc7a90a = tests/fusion_kfgins_dataset_oracle.rs (chargeurs synthétiques et tests de bras de levier de plateforme tournante toujours exécutés ; soumis aux données sur KSHANA_KFGINS_DIR, exécuté le 2026-10-13 sur le jeu de démonstration KF-GINS : RMS horizontal / vertical { "0.0109" } / { "0.0090" } m par rapport à la trajectoire de référence contre KF-GINS C++ { "0.0111" } / { "0.0083" } m, les six seuils préenregistrés tenus ; bras de levier désactivé { "0.329" } m)

# text
seg-ffaf10c69f30 = interop::testbench (write_motion_csv, write_nmea, export)

# text
seg-25ce559f870b = tests/testbench_gpssdrsim_oracle.rs ({ "6" } tests : référence indépendante et scénarios, octets d'export figés, lecteurs NMEA et LLH, coupe ECEF à quatre colonnes, CONSTAT de l'exécution-1 sur le CSV pleine largeur, grille de lignes à { "10" } Hz)

# text
seg-e93e26936fc3 = inertial::mechanization, inertial::attitude, inertial::imu_errors

# text
seg-add45d97ffaf = tests/classical_strapdown_ins_reference.rs (profils statique/virage/conique, { "30" } époques chacun, contre NaveGo : attitude identique bit à bit { "0" } rad ; vitesse/position dans des bornes analytiques nommées)

# text
seg-c7a20cc3b4ab = tests/icgem_gravity_reference.rs (la synthèse GRS80 reproduit Somigliana à { "3.5e-12" } ; carte de perturbation EGM2008 ICGEM réelle physique)

# text
seg-6e415a0f75f2 = cr3bp (to_moon_centred_icrf, from_moon_centred_icrf, to_moon_centred_icrf_de440)

# text
seg-28bd9e3f225a = tests/cr3bp_to_mci_spice_oracle.rs::cr3bp_to_mci_matches_a_spice_two_vector_frame ({ "72" } cas : { "12" } époques en janvier { "2025" } x les points L1 et L2, deux états initiaux de halo austral L2 et un de DRO de l'API Three-Body Periodic Orbits du JPL et un état générique ; pire position { "1.8e-7" } m contre { "1" } mm, vitesse { "1.2e-9" } m/s contre { "1e-6" } m/s ; inverse { "2.7e-15" }) ; cr3bp::tests::moon_centred_map_round_trips_and_sends_the_moon_to_the_origin

# text
seg-49991cf99411 = solar_system (SolarSystemScenario::planetary_kernel_path, KernelOut); ephem_provider (KernelEphemeris)

# text
seg-dca7500cee83 = tests/solar_system_kernel_oracle.rs::kernel_backed_solar_system_matches_spice (Mercure, Vénus, la Terre et la Lune au 2026-01-01, 2030-06-15 et 2040-12-31 : pire { "3.3e-5" } m et { "1.0e-11" } m/s contre { "1" } mm et { "1e-6" } m/s ; le bloc noyau et les étiquettes exacts) ; tests/solar_system_kernel_oracle.rs::without_a_kernel_the_report_has_no_kernel_block

# text
seg-7a164bdd2e29 = maneuver (porkchop_kernel, PorkchopGrid); ephem_provider (KernelEphemeris)

# text
seg-24424bbd7dd7 = tests/porkchop_de440_oracle.rs::de440_porkchop_matches_spice_and_pykep (de la Terre au barycentre de Mars, { "16" } départs 2026-09-01..2027-01-29 x { "19" } arrivées 2027-06-01..2028-02-26 : { "304" } cellules finies des deux côtés, pire C3 { "2.5e-14" } et V-infini { "2.6e-14" } en relatif contre { "1e-8" }, la même cellule de C3 minimal, { "9.1997" } km²/s²)

# text
seg-90681122a5e8 = maneuver (optimise_transfer_kernel, TransferObjective, TransferType, TransferOptimum); ephem_provider (KernelEphemeris)

# text
seg-945e4a7acbe5 = tests/transfer_optimiser_oracle.rs::transfer_optimiser_matches_spice_pykep_scipy (de la Terre au barycentre de Mars, départs 2026-09-15..2027-01-15 x arrivées 2027-05-01..2028-03-01, Type I/II x C3 min / V-infini min : pire objectif { "8.7e-13" } en relatif, dates à { "1e-5" } jour près, autre grandeur à { "2.5e-7" } en relatif, contre des seuils préenregistrés de { "1e-7" }, { "0.01" } jour et { "1e-4" } ; docs/design/evidence/cap20cd-transfer-optimiser/) ; tests/transfer_optimiser_oracle.rs::transfer_optimiser_against_the_published_2026_handbook (référence publiée secondaire NASA/TM-2010-216764 Tableau { "2" } : Type II C3 min { "9.182" } contre { "9.144" } et Type II V-infini min { "2.564" } contre { "2.565" } MET ; Type I C3 min { "10.535" } contre { "11.11" }, -5.18 %, NOT MET et affirmé comme manqué, la référence indépendante de la bibliothèque concordant avec Kshana)

# text
seg-d79a333a38ef = maneuver (lambert_multirev, LambertSolution, LambertBranch)

# text
seg-57940d590f8e = tests/lambert_multirev_oracle.rs::multirev_lambert_matches_pykep_on_the_preregistered_cases ({ "382" } cas : { "300" } 3-D aléatoires, { "18" } proches de { "180" } deg, { "24" } proches du temps minimal de M = { "1" }..3, { "40" } héliocentriques ; { "1058" } solutions ; nombres et ordre des branches égaux ; vitesses à { "1e-8" } en relatif, pire { "1.6e-13" } ; à { "1" } % du temps minimal à { "1e-6" }, pire { "7.5e-15" } ; une garde interne d'atterrissage de Kepler fait atterrir chaque solution à { "4.2e-12" } de |r2| sauf un constat figé sur un arc à e = { "0.994" }, une limitation de kepler_universal, et non du solveur)

# text
seg-67d3c2e5a311 = maneuver (lambert)

# text
seg-5965501f44b7 = tests/lambert_reference.rs ({ "13" } transferts contre lamberthub izzo2015 ; pire |Δv| { "7e-12" } m/s)

# text
seg-559cbdef5e7b = frames, precession, nutation, cio, timescales

# text
seg-3c23a80630da = tests/frame_reference_vectors.rs (Vallado de bout en bout ; vecteurs SOFA/ERFA)

# text
seg-05552ed067f9 = jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc, utc_to_ut1, tai_to_tt, earth_rotation_angle); sgp4 (Sgp4::new_at, Sgp4::propagate_at)

# text
seg-47eebaccfd86 = tests/jd2_sofa_time_oracle.rs ({ "224" } instants UTC : six autour de chacune des { "27" } secondes intercalaires 1972-2016, deux fixes, { "60" } tirés aléatoirement sur 1972-2026 ; dtf2d, utctai et taiutc chacun à { "1e-6" } s près, pire { "1.9e-11" } s) ; jd2::tests (a_leap_second_day_is_86401_seconds_long_and_tai_steps_once; tai_to_utc_inverts_utc_to_tai_to_the_microsecond_across_a_leap_second; ut1_runs_through_tai_across_a_leap_second_day; the_two_part_earth_rotation_angle_matches_the_single_f64_one) ; sgp4::tests::propagate_at_measures_time_from_the_two_part_epoch

# text
seg-5a1b94ecd89e = jd2 (gmst82, From<TwoPartJd>, From<Jd2>); cio (gcrs_to_itrs_matrix_jd2); frames (teme_to_itrf_jd2, itrf_to_teme_jd2); orbit (Propagator::position_in_frame_jd2, own_jd2_utc); ephemeris (EphemerisScenario::two_part_jd)

# text
seg-53fd1421f96e = tests/jd2_earth_rotation_erfa_oracle.rs::two_part_earth_rotation_agrees_with_erfa ({ "40" } dates UT1/TT en deux parties 1980-2050 dont des pas de +{ "1" }, +{ "10" }, +{ "50" } us à deux dates : gmst82 à { "1e-12" } rad près, pire { "0" } ; éléments GCRS vers ITRS à { "5e-12" } près, pire { "2.7e-14" } ; rotation sur +1/+10/+{ "50" } us à { "1e-13" } rad d'ERFA, pire { "1.1e-14" } rad, là où le chemin f64 simple manque entièrement les pas de +{ "1" } et +{ "10" } us) ; ephemeris::tests::two_part_jd_agrees_with_the_default_and_resolves_microsecond_steps ; frames::tests::the_two_part_teme_to_itrf_round_trips_and_resolves_a_microsecond ; jd2::tests::gmst82_matches_the_single_f64_gstime_away_from_the_floor ; jd2::tests::two_part_types_convert_without_moving_the_instant

# text
seg-dc25004c0845 = precession (precession_matrix); nutation (teme_to_gcrs_matrix); cio (gcrs_to_cirs_matrix_with_offsets)

# text
seg-c3deb78a651c = tests/frames_erfa_vector_oracle.rs::frame_matrices_agree_with_erfa_vectors ({ "40" } époques TT 1950-2100, dX et dY jusqu'à { "0.5" } mas : éléments de précession à { "1e-13" } près, pire { "0" } ; TEME vers GCRS à { "5e-10" } rad près, pire { "1.10e-10" } rad ; CIO avec décalages à { "1e-13" } près, pire { "0" } ; décalages nuls identiques bit à bit à cio::gcrs_to_cirs_matrix)

# text
seg-351739161c56 = timescales (tai_minus_utc_on_date); jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc)

# text
seg-e9e659ebde98 = tests/jd2_pre1972_sofa_oracle.rs::pre_1972_utc_conversions_agree_with_erfa ({ "117" } instants UTC : quatre autour de chacun des { "15" } débuts d'une expression TAI-UTC 1960-1972 et { "60" } tirés aléatoirement sur 1960-1971 ; dtf2d, utctai et taiutc chacun à { "1e-6" } s près, pire { "2.9e-11" } s) ; tests/jd2_pre1972_sofa_oracle.rs::post_1972_results_are_bit_identical (les { "224" } instants de la ligne { "1972" }+ inchangés bit pour bit)

# text
seg-65230d78e0c2 = glonass (GlonassEphemeris::sv_clock_bias_s, position_ecef, parse_glonass_nav)

# text
seg-6567510c9726 = tests/glonass_broadcast_rtklib_oracle.rs::glonass_broadcast_clock_and_orbit_match_rtklib ({ "292" } cas : les { "4" } enregistrements GLONASS du fichier de diffusion IGS MGEX réel du 2013-01-01 x { "73" } décalages dans +/-900 s ; horloge à { "1e-14" } s près, pire { "0" } s ; position à { "0.01" } m près, pire { "1.12e-3" } m)

# text
seg-945e951061c2 = sgp4 (MeanElementSet, SgpOrbit, Eop, teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop); jd2 (utc_to_ut1, earth_rotation_angle); nutation (teme_to_gcrs_matrix); cio (gcrs_to_cirs_matrix); frames (polar_motion_matrix)

# text
seg-f11a8313d1ec = tests/earth_orbit_path_sgp4_erfa_oracle.rs (volet { "1" } : { "4432" } positions TEME des { "232" } jeux d'éléments versionnés contre python-sgp4 { "2.24" }, pire { "6.1e-8" } m, seuil { "1" } cm ; volet { "2" } : { "108" } instants, dont { "23" } avec paramètres d'orientation de la Terre et un dans la dernière seconde d'un jour à seconde intercalaire, contre ERFA : GCRS -> ITRS pire { "2.9e-6" } mas, seuil { "0.1" } mas ; TEME -> ITRS pire { "0.41" } mas, seuil { "2" } mas) ; sgp4::tests (the_itrs_path_matches_the_orbit_module_iau_chain; an_earth_fixed_node_stays_at_its_longitude_at_the_epoch) ; tests/no_private_models.rs

# text
seg-5235d736ac3e = navsignal (CodeFamily)

# text
seg-532eb9a2900f = navsignal::code_tests (GPS C/A Gold ≈ −{ "23.9" } dB ; φ({ "1023" })/10 = { "60" })

# text
seg-6f9de921ca86 = orbit (dop)

# text
seg-b215ace86be9 = tests/dop_reference.rs ({ "8" } géométries, bien conditionnée → quasi singulière)

# text
seg-686687c1fa8d = gnss_sim (klobuchar_delay_m)

# text
seg-aee414a8d8ec = tests/klobuchar_reference.rs ({ "10" } cas en élévation/azimut/heure locale, deux jeux de coefficients)

# text
seg-1c1d27c45546 = raim (chi2_cdf, chi2_quantile, noncentral_chi2_cdf, normal_cdf, normal_quantile, pbias)

# text
seg-b3663ac963e1 = tests/raim_reference.rs ({ "171" } cas : FDR/quantile du χ², FDR/quantile normaux, FDR du χ² non centré, pbias sur les plages de P_fa/P_md/redondance)

# text
seg-afe92c4623d2 = SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — bibliothèque indépendante (Cephes/Boost), un algorithme différent de la série de la gamma incomplète de Kshana ; concordance à ≤{ "1e-6" } rel. Noyau seulement. L'<em>allocation</em> du budget P_HMI de l'ARAIM MHSS n'est plus sans référence numérique publiée indépendante — l'exemple traité du sous-groupe technique ARAIM du WG-C lui-même étaye désormais la ligne distincte « Niveaux de protection ARAIM MHSS contre des vecteurs de référence publiés », concordant au TOL_PL propre de la référence = { "5e-2" } m — de sorte que le périmètre de cette ligne est le noyau statistique et que cette autre ligne porte l'allocation (voir docs/ARAIM_REFERENCE.md)

# text
seg-116377f12c14 = sbas (sbas_protection_level)

# text
seg-f4fa833999f3 = tests/sbas_reference.rs ({ "6" } époques EGNOS réelles : HPL comparé directement, d_U vertical vérifié sans facteur K)

# text
seg-2053116957cc = impairment_eval (auc, confusion_at, roc_curve)

# text
seg-f0853f1adeaa = tests/eval_metrics_reference.rs ({ "5" } jeux de données, { "24" } seuils ; comptes exacts + <{ "1e-9" })

# text
seg-ee20bf2a4315 = impairment_eval, eval_stats

# text
seg-f546b062df87 = tests/opssat_ad_reference.rs (ESA OPS-SAT réel, l'AUC reproduit scikit-learn à { "1e-9" } près) ; tests/ai_ml_rf_impairment_detection_evaluation_reference.rs ({ "122" } cas sur la partition de test OPSSAT-AD réelle : matrice de confusion complète au point de fonctionnement + Pd/Pfa/précision/F1 contre scikit-learn, exacts sur les entiers)

# text
seg-c085cbd2a029 = quantum_trade (qparams_from_adev_curve), detection (chi2_inv_cdf), clock_state (ClockState3)

# text
seg-42b83604390f = tests/scipy_reference.rs (NNLS ; χ² à ddl de fonctionnement ≥ { "48" } ; Q de van Loan)

# text
seg-f571816b43fc = igrf, igrf_data

# text
seg-7bd357bd734a = tests/alternative_complementary_pnt_reference.rs ({ "2520" } points mondiaux × altitudes contre ppigrf à l'époque { "2025.0" } ; pire |ΔXYZF| { "3.9e-4" } nT, |ΔD| { "2.8e-6" }°, |ΔI| { "3.6e-7" }°)

# text
seg-88c8996b8e2e = quantum_faults, eval_stats, detection

# text
seg-1f37560eef48 = tests/quantum_faults_reference.rs ({ "109" } cas contre scipy { "1.17" } norm.cdf/ppf + scikit-learn roc_auc_score ; pire |Δ| AUC { "6.9e-8" }, défaut minimal détectable { "1.3e-8" }, AUC empirique { "1.1e-16" })

# text
seg-7353cfaa51c0 = tests/resilience_score_decision_instability_reference.rs ({ "124" } cas contre scipy { "1.18" } / numpy { "2.4" } : { "61" } τ-b de Kendall à { "2e-16" }, classement exact, moyenne de Dirichlet + IC par percentiles à { "1e-12" })

# text
seg-1c3ad165ae7d = tests/mcda_ahp_reference.rs (table de l'indice aléatoire de Saaty { "1980" } n={ "1" }..10 EXACTE ; vecteur de priorité + λ_max + CR contre eig de SciPy/LAPACK sur un { "3" }×{ "3" } cohérent et un { "3" }×{ "3" } / { "4" }×{ "4" } incohérent, concordance à <{ "1e-9" })

# text
seg-ffb971fd45e1 = mcda::wsm, mcda::wpm

# text
seg-f10f7b107cb9 = tests/mcda_wsm_reference.rs (scores WSM + classement) et tests/mcda_wpm_reference.rs (scores WPM + classement), chacun contre pymcdm à <{ "1e-9" } sur une matrice de décision bénéfice/coût fixe { "4" }×{ "3" }

# text
seg-3b78f01d1992 = tests/mcda_topsis_reference.rs (coefficients de proximité + classement contre pymcdm à <{ "1e-9" } sur une matrice bénéfice/coût fixe { "4" }×{ "3" })

# text
seg-863ebd5e97c5 = tests/mcda_vikor_reference.rs (indice Q + classement contre pymcdm à <{ "1e-9" } sur une matrice bénéfice/coût fixe { "4" }×{ "3" })

# text
seg-faaffee99e67 = tests/mcda_promethee_reference.rs (flux de surclassement net + classement, critère usuel, contre pymcdm à <{ "1e-9" } sur une matrice bénéfice/coût fixe { "4" }×{ "3" })

# text
seg-c3c1ab11c426 = tests/mcda_electre_reference.rs (matrices de concordance, de discordance et de dominance élément par élément + noyau/ensemble dominé contre pyDecision à <{ "1e-9" } sur un jeu de données tout-bénéfice fixe { "4" }×{ "3" })

# text
seg-08e153bbaef7 = mcda::waspas, mcda::moora

# text
seg-eafdba85247a = tests/mcda_waspas_reference.rs (préférences WASPAS + classement) et tests/mcda_moora_reference.rs (scores MOORA + classement), chacun contre pymcdm à <{ "1e-9" } sur une matrice de décision bénéfice/coût fixe { "4" }×{ "3" }

# text
seg-3d6cd006d21f = tests/mcda_copras_reference.rs (degrés d'utilité + classement contre pyDecision à <{ "1e-9" } sur une matrice bénéfice/coût fixe { "4" }×{ "3" })

# text
seg-7fb7df3cd534 = tpl (Cusum), security

# text
seg-7600ece37358 = tests/timing_protection_level_under_spoofing_reference.rs ({ "16" } cas de latence déterministe EXACTS contre une référence indépendante de premier passage ; { "8" } cas ARL₁, Monte-Carlo à 60k essais contre l'approximation de Siegmund + les tables publiées de Montgomery)

# text
seg-034d00c5844a = holdover (coast_phase_variance, holdover_seconds)

# text
seg-f41c77ef0855 = tests/gnss_denied_clock_holdover_reference.rs ({ "27" } cas contre scipy { "1.18" } : { "12" } variances en roue libre contre linalg.expm Q₀₀ de Van Loan, pire rel { "1.1e-15" } ; { "7" } inversions de holdover contre optimize.brentq, pire rel { "1.5e-16" })

# text
seg-817055dfe79a = resilience::diversity (effective_diversity)

# text
seg-9cad75e722bc = tests/resilience_diversity_reference.rs ({ "17" } cas : { "14" } contre inv_simpson de scikit-bio + { "3" } bornes à zéro figé ; pire |Δ| { "0.0" })

# text
seg-140080386c90 = skyline (Skyline::cut_deg, Skyline::visible); frames (look_angles, is_visible_skyline); orbit (UserPath, sky_view, cofactor_from_los); geometry (sky_geometry)

# text
seg-d4dabd188012 = tests/skyline_orekit_oracle.rs (skyline_masks_agree_with_orekit_and_gnss_lib_py_as_pre_registered : { "1173" } angles de visée sur six sites et quatre époques, six tables de masque, { "142" } ensembles visibles ; pire |d el| { "1.3e-13" } deg et |d az| { "2.3e-13" } deg contre { "1e-9" }, pire |d mask| { "1.1e-12" } deg contre { "1e-9" }, ensembles visibles identiques sans aucun dans la bande limite de { "1e-6" } deg, pire DOP { "3.3e-13" } en relatif et cofacteur { "6.6e-13" } de l'échelle de la matrice contre { "1e-9" } ; préenregistré e4b9d912) ; skyline::tests (table_interpolates_linearly_between_rows; table_wraps_through_north_without_a_seam) ; tests/skyline_scenarios.rs (every_wired_scenario_is_byte_identical_to_the_0_35_0_release)

# text
seg-cec96e27c310 = geometry (sky_geometry, ellipse); orbit (cofactor_from_los)

# text
seg-48069ecceb4a = tests/ellipse_numpy_oracle.rs (ellipse_and_cofactor_agree_with_numpy_as_pre_registered : { "270" } cas, les { "142" } ensembles visibles versionnés de la comparaison de la ligne d'horizon sous une horloge commune et sous une horloge par système ; pire axe { "5.1e-13" } en relatif et orientation { "5.3e-12" } deg, aucun quasi circulaire, cofacteur { "1.0e-12" } de l'échelle de la matrice, contre { "1e-9" } et { "1e-6" } deg ; préenregistré 0bbeeaee) ; geometry::tests (ellipse_of_an_analytic_two_by_two_case)

# text
seg-db663720ff55 = sdr

# text
seg-02c8f0d7ea55 = sdr::code_tests (ca_first_ten_chips_match_is_gps_200_octal — PRN { "1" }–{ "9" } : les 10 premiers chips reproduisent exactement les octaux 1440/1620/1710/1744/1133/1455/1131/1454/1626 du Tableau 3-Ia d'IS-GPS-200 ; ca_code_has_1023_chips_and_is_balanced; ca_periodic_autocorrelation_is_three_valued)

# text
seg-e8e5abbe7b58 = fusion (gnss_ins_ekf, tightly_coupled, ukf, coupled)

# text
seg-e941099918ef = fusion::tests (identité UKF==KF linéaire ; maintien en cas de coupure ; NEES) ; tests/gnss_ins_sensor_fusion_reference.rs ({ "50" } cas contre filterpy { "1.4.5" } : EKF linéaire lâche/serré + a posteriori PNT couplé à ≤{ "2.4e-12" } ; exécution UKF de 40 époques pire |Δx| { "1.9e-7" } / |ΔP| { "9.5e-6" }) ; tests/gnss_ins_navego_dataset_oracle.rs::loosely_coupled_rms_within_1p2x_of_navego (solution à couplage lâche NaveGo v1.4 sur le parcours réel IMU/GNSS Ekinox de NaveGo : RMS horizontal 0.912x, vertical 0.940x, RMS d'innovation de position 0.861x de celui de NaveGo, innovation normalisée moyenne { "0.395" } ; seuils 1.2x, 1.2x, 1.2x et { "1.5" } fixés avant l'exécution)

# text
seg-e53182bd8d30 = cr3bp::tests (STM contre différences finies) ; tests/cislunar_mission_analysis_reference.rs ({ "5" } membres NRHO JPL L2-S : les { "9" }:{ "2" } + { "4" } voisins ; pire |ΔC| { "1.5e-5" }, |ΔT|/T { "9.6e-5" }, périlune { "0.7" } km en unités de longueur du JPL)

# text
seg-4cac09f2382e = gravity_sh, altpnt::maps, gravimeter

# text
seg-d0ee49fda1e0 = tests/icgem_gravity_anomaly_oracle.rs (egm2008_n70_matches_cited_icgem_values en CI sur dix nœuds ICGEM cités ; egm2008_n70_gravity_anomaly_sa_matches_icgem sur les grilles complètes de 0.25 deg récupérées du Tchad 9-15N 19-25E et de la Vallée de la Mort 35-38N 242-245E, { "794" } nœuds : RMS { "1.3e-8" } et { "2.6e-8" } mGal, max { "2.9e-8" } mGal contre des seuils préenregistrés de { "0.005" } / { "0.02" } mGal, xval/icgem-egm2008/) ; gravity_sh::tests

# text
seg-d5b8ca2a48cc = tests/terrain_nav_validation.rs (real_srtm_committed_badwater_tile_reads_real_relief — la décimation versionnée à 6 secondes d'arc de la tuile SRTM v3 N36W117, du domaine public, place Badwater Basin, le point le plus bas d'Amérique du Nord, à −{ "78" } m dans la bande de relevé [−{ "95" },−{ "70" }] m et lit le vrai relief d'environ { "2.2" } km de la chaîne orientale de la tuile ; plus, sur deux découpes 361x361 à 1 seconde d'arc versionnées telles quelles de N36W119 et N36W117, real_srtm_tile_whitney_in_survey_band ({ "4412.1" } m dans la bande [{ "4380,4430" }] m autour du relevé de { "4421" } m), real_srtm_tile_badwater_in_survey_band (−{ "78.0" } m dans [−{ "95" },−{ "70" }] m) et gdal_cross_check (le nœud le plus proche égale gdallocationinfo de GDAL { "3.8.4" } sur les tuiles complètes, exactement aux { "8" } points préenregistrés, xval/srtm-ungate/ ; plus les références indépendantes d'analyseur construites à la main pour le point milieu bilinéaire et pour la fixture synthétique)

# text
seg-d86971b6e158 = oem

# text
# c1: oem
seg-f00dd400fa2d = tests/ccsds_oem_interop_reference.rs ({ "24" } états / { "2" } fixtures décodés à l'octet près par l'analyseur indépendant <c1/>, pos/vit Δ = { "0" }) ; oem::tests (analyse d'un OEM d'outil externe avec mots-clés/commentaires/covariance supplémentaires, aller-retour écriture→lecture de l'état complet, pos+vit+accél tolérées, position seule + métadonnées obligatoires manquantes rejetées, aller-retour de scénario haute fidélité + ingestion externe) ; dominance_demonstrators (atteignable + reproductible + aller-retour exact + MODELLED-not-VALIDATED)

# text
# c1: oem
seg-ab37fdc7a543 = Analyseur CCSDS-502 tiers indépendant <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — une base de code distincte qui décode à l'octet près l'OEM EME2000/UTC émis par kshana ({ "24" } états sur { "2" } fixtures, pos/vit Δ = { "0" }) et dont le lecteur strict confirme les jetons de métadonnées ; l'analyseur de kshana concorde de même avec lui sur un OEM externe versionné. Deux constats d'interopérabilité honnêtes (la bibliothèque oem rejette la convention multi-segments par satellite de kshana et ses lignes de covariance à entrées multiples) sont documentés dans le test — de sorte que cela valide l'échange à objet unique respectant la norme, et non le respect complet de la norme CCSDS-502 par chaque variante de kshana

# text
seg-3814a35508eb = eo_payload (j2_node_rate, j2_nodal_period, ground_track_spacing_equator_j2, sun_synchronous_inclination)

# text
seg-e26317a36469 = eo_payload::tests (rayon angulaire { "64" }° à { "700" } km + diminue avec l'altitude, nadir→zénith/portée nulle, horizon→ε=0/angle central maximal, erreurs au-delà de l'horizon, la fauchée croît avec le champ de vue / le GSD avec l'altitude, espacement des nœuds d'environ { "2750" } km, scénario reproductible/MODELLED + rejet des entrées erronées) ; dominance_demonstrators (atteignable + reproductible + rayon angulaire de { "64" }° + MODELLED-not-VALIDATED) ; tests/eo_payload_coverage_orekit_oracle.rs::eo_coverage_matches_orekit_and_geographiclib (altitudes 400-1500 km, inclinaisons 1-98 deg, demi-champ de vue 7.5-50 deg, IFOV 10-50 microrad, dépointage { "30" } et { "89" } deg : chaque grandeur dans son seuil préenregistré, indicateur de contiguïté 168/168) ; tests/eo_payload_coverage_orekit_oracle.rs::exempt_flag_points_are_the_engines ; régression tests/eo_payload_coverage_reference.rs

# text
seg-ee8ce4b84732 = space_packet::tests (les bits d'en-tête respectent la disposition CCSDS-133, l'aller-retour encodage→décodage couvre tous les champs, hors plage/tronqué rejeté) ; tests/ccsds_space_packet_reference.rs ({ "33" } cas contre spacepackets { "0.32.0" }, dont { "12" } comparaisons de paquets complets ; zéro octet différent)

# text
seg-6566a3bdb3b4 = space_packet (TimeCode, SecondaryHeader, packet error control, segmentation and reassembly, stream decoding)

# text
seg-f9c3b678f754 = tests/space_packet_ext_oracle.rs (cinq seuils préenregistrés : CRC, codes temporels, flux, écart et ordre, PUS TM ; zéro divergence) ; space_packet::tests

# text
seg-49684da520e1 = spk_writer (SpkSegment, to_bytes, from_bytes, eval, et_from_label, oem_to_spk_segments)

# text
seg-d0468ecef524 = tests/spk_writer_spice_oracle.rs (inventaire, évaluation, identité au bit et à l'octet, conversion d'époque OEM ; quatre contrôles de mutation prévus le font passer au rouge)

# text
seg-7b7d5c79bcde = spk_writer (SpkType::Chebyshev3, SpkType::DiffLines21, SpkSegment, InterpolatedSpk)

# text
seg-fa6c68bfeb74 = tests/spk_3_21_spice_oracle.rs (inventaire, évaluation dans les deux sens, identité à l'octet) ; spk_writer::tests

# text
seg-2b73bbf7fd60 = adm (AemMessage, ApmMessage, quaternion_a_to_b), ndm_xml

# text
seg-6d6d69a7117e = tests/adm_orekit_oracle.rs (L1 Orekit lit { "33" } fichiers Kshana, L2 Kshana lit { "31" } fichiers Orekit, L3 { "135" } rotations d'enregistrements ; constats figés) ; adm::tests ; ndm_xml::tests

# text
seg-4fc5845019f2 = odm (OpmMessage, OmmMessage, OcmMessage, Section, OcmBlock), ndm_xml

# text
seg-4dd013dd6b9e = tests/odm_orekit_oracle.rs (L1 Orekit lit { "30" } fichiers Kshana, L2 Kshana lit { "25" } fichiers Orekit ; constats figés et vérifiés comme récurrents) ; odm::tests

# text
seg-2e7fd9b81080 = attitude_budget::tests (le couple GG s'annule pour un corps symétrique, croît plus bas, linéaire en ΔI, somme en quadrature RSS, les fractions de variance somment à 1) ; tests/attitude_gg_torque_reference.rs ({ "20" } cas contre un couple GG indépendant à tenseur complet T=(3μ/R³)(n̂×(I·n̂)) maximisé numériquement sur l'attitude avec Hipparchus { "3.1" } linalg ; pire rel { "6e-15" }, + bande publiée Wertz/Sidi O({ "1e-6" }) s⁻²) ; tests/attitude_gg_torque_basilisk_oracle.rs::gravity_gradient_torque_matches_basilisk ({ "40" } cas contre le GravityGradientEffector de Basilisk { "2.9.1" } : pic à l'attitude de { "45" } deg à { "1e-12" } près en relatif, pire { "2.1e-15" } ; aucun couple au-dessus du pic sur { "2000" } attitudes aléatoires par cas, { "3" } tenseurs d'inertie diagonaux et { "5" } généraux, { "5" } altitudes)

# text
seg-49b30066ff1b = passes::tests (interp-cross linéaire + sûr en cas dégénéré, passages polaire→latitude moyenne, masque plus élevé ⇒ moins ou autant) ; tests/ground_station_pass_prediction_reference.rs ({ "22" } scénarios / { "129" } passages contre l'ElevationDetector d'Orekit { "12.2" } ; pire |Δ| AOS/LOS { "0.0000" } s, élévation maximale { "0.0014" }°, accès total { "0.0001" } s, nombre de passages identique)

# text
seg-302a5a17401b = passes (predict_passes_apparent, apparent_look_angles, ApparentOptions, p834_tau_s_deg, p834_tau_deg, p834_theta_m_deg, p834_apparent_elevation_deg, PassesScenario)

# text
seg-be96bc40b05d = tests/pass_predictor_on_path_orekit_oracle.rs ({ "60" } cas, { "1210" } passages : AOS/LOS à { "3.4e-6" } s près, seuil { "5" } ms ; élévation maximale à { "5.5e-7" } deg près, seuil { "1e-3" } deg ; { "8979" } directions apparentes à { "8.8e-7" } deg près, seuil { "1e-4" } deg) ; tests/earth_orbit_path_sgp4_erfa_oracle.rs (le chemin) ; passes::tests (p834_equations_9_and_14_are_consistent_and_vanish_toward_the_zenith; refraction_lengthens_passes_and_light_time_delays_them) ; tests/pass_predictor_apparent_orekit_oracle.rs (constat du tour 1, figé ; orekit_p834_coefficient_differs_from_the_recommendation_above_sea_level)

# text
seg-b985f72dcdf4 = linkbudget::tests (forme de la perte en espace libre, fermeture de l'équation de liaison) ; tests/one_way_link_budget_reference.rs (DCT en bande X de DESCANSO/JPL Galileo reproduit de bout en bout + { "6" } cas FSL de l'UIT-R P.525 sur les centres de bande DSN S/X/Ka ; pire |ΔFSL| { "4.6e-3" } dB, |Δporteuse| { "2.5e-2" } dB)

# text
seg-ca02c7483ba8 = lunar_time::tests (taux en forme close ; aller-retour) ; tests/lunar_coordinate_time_reference.rs (termes d'auto-potentiel et de taux séculaire du LTC contre les valeurs publiées d'Ashby et Patla { "2024" } + vitesse géocentrique de la Lune contre JPL DE440)

# text
seg-7ef514b90798 = frame_eop::tests et realtime_frame_eop::tests (les trois composantes portent des ensembles d'époques égaux, identiques élément par élément et strictement croissants sur les deux extraits IERS réels ; l'ensemble conjoint se réduit à l'intersection lorsque les deux blocs du Bulletin B divergent réellement, et un horizon sans ligne commune est omis plutôt que rempli de zéros ; le caractère vide du tableau prédit-contre-final est énoncé dans le document plutôt que sous-entendu par un champ manquant ; un second millésime réel le remplit, recoupé ligne à ligne ; un millésime ultérieur manquant est une erreur, et non un tableau vide silencieux) ; tests/joint_eop_table_astropy_erfa_oracle.rs::joint_table_and_predicted_vs_final_tables_match_astropy_and_erfa (Tableaux { "3" }, { "4" } et { "6" } du scénario de bout en bout : ensembles d'époques exacts, statistiques UT1 et du pôle à { "1e-9" } près, la combinaison à la Lune à { "1e-5" } d'une rotation ERFA complète, le statut énoncé de chaque cas prédit-contre-final) ; tests/joint_eop_error_iers_ar2019_oracle.rs::bulletin_a_2019_prediction_error_matches_the_iers_realised_statistics (Kshana/IERS { "1.001" } à { "1.100" } à { "1" } à { "90" } jours) ; recensement des lignes : tests/embedded_eop_vintage_astropy_preregistered.rs (ligne d'entrée hors ligne) ; régression du tour 1 : tests/joint_eop_error_bulletin_a_oracle.rs::measured_error_against_the_iers_accuracy_formula_pole_agrees_ut1_does_not

# text
seg-8d703fef00d5 = realtime_frame_eop, eop

# text
seg-41f91517a4bb = tests/embedded_eop_vintage_astropy_preregistered.rs::vintage_of_every_row_matches_astropy_and_predictions_match_bulletin_a (six critères exacts : les octets de l'extrait ; { "174" } lignes ; comptes par millésime et listes MJD complètes 30/54/90 ; indicateur P sur le mouvement polaire et sur UT1 de chaque ligne prédite ; le recensement de l'exécution par défaut nue ; chaque ligne prédite égale au Bulletin A de l'IERS Vol. XXXIX No. { "039" } au dernier chiffre imprimé près, pire { "5.0e-5" } arcsec et { "4.9e-6" } s) ; tests/embedded_eop_census_astropy_oracle.rs::vintage_census_matches_astropy (verrou de régression de l'ancien extrait de 32 lignes sous le classificateur d'indicateurs : { "20" } finales, { "12" } rapides, { "0" } prédite) ; tests/embedded_eop_census_astropy_oracle.rs::rows_called_prediction_only_are_flagged_measured_by_astropy (le constat du tour 1, conservé) ; realtime_frame_eop::tests ; tests/operational_eop_predictor_reference.rs

# text
seg-d25312c585d1 = lunar_vlbi (KernelGeometry, delay_partials_beacon_body, delay_partials_stations, LunarVlbiScenario); naif_kernel

# text
seg-1caf84a930c6 = tests/lunar_vlbi_spice_oracle.rs::kernel_delay_and_partials_match_spice_light_times_near_j2000 ({ "75" } délais à { "25" } époques près de J2000 sur DSS-14, DSS-43 et DSS-63 : délais à { "1" } ps près, pire { "0.06" } ps ; dérivées partielles de la balise en repère du corps à { "1e-6" } près, pire { "7.4e-9" } ; dérivées partielles de station ITRF93 à { "1e-6" } près, pire { "3.8e-11" }) ; tests/lunar_vlbi_spice_oracle.rs::spice_2024_epochs_finding_is_unchanged ; tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference (recoupement de l'évaluation du noyau) ; tests/naif_kernel_reader_check.rs ; lunar_vlbi::tests

# text
seg-5140b9231f4b = naif_kernel (DafFile, SpkKernel, PckKernel); ephem_provider (KernelEphemeris)

# text
seg-3747d76d3c5c = tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_post_registration_grid ({ "600" } états de de440s.bsp et { "200" } rotations MOON_PA_DE440 à { "200" } époques 1849-2150 et paires de corps aléatoires tirées du hachage propre du commit de préenregistrement, contre SPICE et ANISE sur des noyaux découpés identiques bit à bit à ceux de la NAIF : pire écart { "0.6" } % de son seuil, { "1.95e-3" } m en absolu) ; tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_full_naif_kernels_when_present (idem sur les fichiers NAIF complets, SHA-256 vérifié ; soumis aux données) ; tests/naif_kernel_reader_check.rs (garde d'ingénierie, et non preuve) ; naif_kernel::tests ; ephem_provider::tests

# text
seg-92c70de528b4 = lunar_common_mode::tests ({ "8" } tests de bibliothèque : la séparation est additive et reconstruit dy ; une covariance de mode commun donne un niveau de protection de mode commun positif tandis qu'une covariance de parité seule en donne un quasi nul ; le projecteur annihile range(G)) ; tests/lunar_common_mode_integrity_reference.rs (la séparation du moteur contre un calcul numpy indépendant sur des entrées identiques à l'octet près sur l'échantillon versionné de 366 époques, erreur relative ET absolue < { "1e-3" }) ; tests/lunar_common_mode_parity_numpy_oracle.rs::common_mode_split_matches_numpy_lstsq_on_parity_bearing_inputs ({ "1464" } cas porteurs de parité sur la géométrie à 8 satellites et un sous-ensemble à 6 satellites sur les deux paires inter-éphémérides réelles : blind_dx, résidu et normes à { "1e-12" } de |dy|, pire { "1.06e-14" })

# text
seg-5cd36a6d71b9 = lunar_combination (problem, model, estimate, formal_covariance); batch_ls (gauss_newton_qr)

# text
seg-63056b57baab = lunar_combination::tests (retrouve la vérité simulée ; le VLBI rétablit l'observabilité 3-D de la station ; déterministe) ; tests/lunar_joint_multi_technique_od_reference.rs ({ "6" } géométries × { "16" } paramètres, { "31" } observations chacune, contre Levenberg-Marquardt d'Orekit { "12.2" } / Hipparchus sur des observations identiques ; état récupéré pire |Δ| { "1.4e-8" } m) ; tests/lunar_joint_od_numpy_oracle.rs::joint_solve_linear_algebra_matches_numpy (six réseaux dont un sans VLBI : pas de Gauss-Newton à { "4.3e-11" } près, sigmas formels à { "1.9e-11" } près, erreurs de station égales ; sur les entrées mathématiques portables de { "0.36" }, { "2.4e-11" } et { "1.3e-11" } sur les entrées de { "0.30" })

# text
seg-ef4de80a0e79 = fim

# text
seg-6a5729ed13c5 = tests/fim_observability_reference.rs (valeurs propres contre numpy.linalg.eigh ; covariance CRLB contre σ²(XᵀX)⁻¹ via numpy.linalg.inv ; GDOP/PDOP/HDOP/VDOP/TDOP GNSS depuis la matrice d'information contre numpy — tous concordants à { "1e-9" }) ; fim::tests (solveur propre de Jacobi contre spectres en forme close ; CRLB contre les formes closes de Kay { "1993" } — σ²/N pour un continu dans un bruit blanc gaussien et σ²(XᵀX)⁻¹ pour l'ajustement de droite ; atteinte du CRLB par Monte-Carlo ; identité de Moore–Penrose MM⁺M=M ; espace nul du défaut de datum)

# text
seg-454f4440a5c8 = lunar_frame_realise::tests (retrouve la transformation de Helmert injectée) ; tests/lunar_reference_frame_realisation_reference.rs ({ "14" } cas contre un solveur Umeyama-SVD indépendant en forme close ; pire |Δ| translation { "2.0e-5" } m, rotation { "5.3e-12" } rad, échelle { "9.3e-2" } ppb, RMS après ajustement { "6.1e-9" } m)

# text
seg-86ded53b2aac = lunar_service::tests (le DOP réutilise le noyau validé ; le PL se réduit au cas du pôle sud) ; tests/lunar_navigation_service_volume_reference.rs (position MCI par satellite à <{ "1e-3" } m + ensemble de satellites visibles EXACT sur tout le balayage grille×époque contre ANISE { "0.10.2" })

# text
seg-01d0c0630ded = lunar_afs::waveform::render, lunar_afs::codes, lunar_afs::frame

# text
seg-38c8b9bffaf9 = tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_chips_match_lans_afs_sim (les { "210" } codes primaires AFS-Q toujours ; avec KSHANA_LANS_RUN et le cache LSIS les { "630" } codes, zéro écart de chip) ; tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim (avec le cache LSIS : { "3" } trames, zéro écart de symbole ; { "24" } fenêtres de { "2" } ms versionnées, |rho| = { "0.999990" }) ; tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_full_run_matches_lans_afs_sim (soumis aux données : exécution entière de { "23.9" } s, |rho| = { "0.999990" }, pire bloc de { "2" } ms { "0.999948" }, phase { "8e-9" } rad)

# text
seg-67eae9b2de36 = lunar_afs::frame, lunar_afs::ldpc, lunar_afs::lsis

# text
seg-e73c88408052 = tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim (avec le cache LSIS : les { "3" } trames que transmet LANS-AFS-SIM, construites à partir des mêmes FID, TOI et bits de données : zéro des { "18 000" } symboles diffère) ; tests/lunar_afs_frame_coding_oracle.rs::bch_worked_example_and_crc24_check_value_are_bit_exact (Figure { "8" } de la LSIS : 0x045 -> 0x229f61dbb84a0 ; valeur de contrôle CRC-24/LTE-A 0xCDE703 ; s'exécute toujours) ; tests/lunar_afs_frame_coding_oracle.rs::ldpc_codewords_satisfy_the_printed_parity_check_matrices ({ "100" } mots de code, zéro contrôle non satisfait du H imprimé) ; tests/lunar_afs_frame_coding_oracle.rs::decoder_from_parity_check_matrices_recovers_every_frame (décodeur à partir de H seul, sans bruit et à { "3" } dB d'Es/N0, et { "10" } trames complètes) ; lunar_afs::ldpc::tests::printed_b_inverse_inverts_printed_b ; lunar_afs::frame::tests

# text
seg-7c4e5dff6562 = iq::scene (Scene, SatGeometry, TruthRecord)

# text
seg-ba9337fe40c0 = tests/iq_gpssdrsim_cross_generator.rs::scene_geometry_matches_gps_sdr_sim_channels ({ "11" } canaux : pire pseudo-distance { "1.6e-3" } m contre { "0.05" } m, phase de code { "5.5e-6" } chip contre { "2e-4" }, Doppler { "7.4e-5" } Hz contre { "0.02" } Hz, angles de visée { "4e-9" } degré contre { "1e-4" }, ensemble visible identique) ; tests/iq_gpssdrsim_cross_generator.rs::harness_reproduces_the_gps_sdr_sim_program_channel_listing (le harnais de référence indépendante reproduit exactement la liste de canaux imprimée par le programme lui-même)

# text
seg-80e62d2d7748 = lunar_service::tests (topocentrique contre une géométrie calculée à la main : au zénith, plein nord/est/ouest, antipodal, et la direction est polaire dégénérée ; l'indicateur de visibilité exporté concorde avec le filtre de visibilité indépendant sur un balayage complet de { "6" } h ; l'export est désactivé par défaut et ne change manifestement rien d'autre ; les niveaux de protection sont exactement linéaires en le sigma exposé alors que la géométrie sous-jacente est intacte) ; tests/lunar_service_geometry_oracle.rs::look_angles_match_anise_at_selenographic_sites ({ "768" } échantillons sur { "8" } sites, { "12" } époques et { "8" } satellites contre ANISE { "0.10.2" } : azimut et élévation à { "1e-6" } deg près, distance et position du site à { "1" } mm près ; pire { "2.2e-12" } deg, { "2.1e-13" } deg, { "5.6e-9" } m)

# text
seg-5613845e8514 = attitude_dynamics::tests (inverse apply/solve, couple nul de la toupie sphérique, point fixe sur axe principal, conservation énergie+moment sur exécution courte, q̇=½q⊗ω, signe de la vitesse de la toupie symétrique + précession en cône du corps) ; tests/attitude_dynamics_reference.rs ({ "200" } 000 exécutions de pas libres de couple : |q|={ "1" } à { "1e-10" }, énergie cinétique T=½ωᵀIω conservée à { "1e-9" } rel, |Iω| et le vecteur de moment inertiel conservés à 1e-9/1e-8 rel, sur une inertie triaxiale et sur une inertie générale non diagonale ; précession en cône du corps de la toupie symétrique aplatie + allongée reproduite à { "1e-6" } contre le λ=ω₃(I_a−I_t)/I_t analytique) ; tests/attitude_dynamics_basilisk_oracle.rs::torque_free_motion_matches_basilisk (deux inerties générales non diagonales, { "1e4" } s sans couple contre le hub d'engin spatial Basilisk { "2.9.1" } avec RKF78 : quaternion à { "1e-9" } près, pire { "3.3e-11" } ; vitesses du corps à { "1e-9" } rad/s près, pire { "3.4e-12" })

# text
seg-c7acd78b6a27 = cw_dynamics (propagate, second_order_correction, propagate_second_order)

# text
seg-8edf60f6eb8c = cw_dynamics::tests (Φ({ "0" })=I, MHS de la direction transverse découplé) ; tests/cw_dynamics_reference.rs (Φ en forme close contre une intégration RK4 indépendante à pas fixe des mêmes EDO de Hill à <{ "1e-6" } sur un tiers d'orbite ; Φ(t)Φ(−t)=I à { "1e-9" } ; la condition bornée ẏ₀=−2n·x₀ referme l'état complet après une période à { "1e-9" } sans dérive séculaire le long de la trace sur { "10" } orbites ; un décalage radial pur dérive de l'analytique −12π·x₀ par orbite) ; tests/cw_dynamics_orekit_oracle.rs::cw_second_order_matches_nonlinear_orekit_within_1mm (quatre cas à { "100" } m sur un tiers d'une orbite de { "500" } km : pire { "1.15e-7" } m contre { "1e-3" } m) ; tests/cw_dynamics_orekit_oracle.rs::cw_disagreement_with_orekit_is_recorded_as_a_finding (le Φ linéaire seul : { "1.2" } à { "6.3" } mm, figé)

# text
seg-9d7e00484999 = entry_eo_ascent::entry_heating (simulate_entry, inertial_to_relative, EntryHeatingScenario)

# text
seg-e9749b2960a2 = tests/entry_stardust_published.rs (pic de { "35.44" } g contre les { "33.4" } g publiés, +{ "6.1" } %, seuil { "10" } % ; vitesse d'entrée relative à la planète { "12.551" } km/s contre { "12.6" }, seuil { "0.1" } km/s) ; entry_eo_ascent::entry_heating::tests (l'énergie en repère tournant chute exactement du travail de la traînée ; l'inertie dans le vide conserve l'énergie de Jacobi ; le cas balistique non tournant concorde avec le point matériel plan du module reentry ; la forme close d'Allen-Eggers dans son domaine)

# text
seg-c23c0440cc75 = aocs (AocsConfig, required_torque, motor_torques, rates, rk4_step, simulate, mrp_from_quaternion); aocs_kind (AocsScenario)

# text
seg-4f446e123d4e = tests/aocs_basilisk_oracle.rs ({ "3" } cas, { "601" } échantillons chacun : MRP pire { "2.4e-14" }, seuil { "1e-9" } ; vitesse du corps { "1.6e-15" } rad/s, seuil { "1e-9" } ; vitesse de roue { "2.9e-11" } rad/s, seuil { "1e-6" } ; couple moteur appliqué { "1.2e-13" } N m, seuil { "1e-9" } ; couples à t = { "0" } à { "1e-12" } N m près ; saturation atteinte dans les deux outils) ; aocs::tests (moment cinétique conservé, application à norme minimale, branche MRP, convergence sous saturation) ; aocs_kind::tests

# text
seg-0e2a03d21df4 = tests/solar_system_standish_preregistered.rs::standish_rms_errors_are_within_explanatory_supplement_table_8_10_1 (barycentres 1800-2050 du Tableau { "1" } et { "3000" } av. J.-C.-3000 apr. J.-C. du Tableau { "2" }, { "8908" } et { "21857" } époques, pire RMS { "0.778" } du chiffre du Tableau { "8.10.1" }) ; tests/solar_system_standish_earth_icrf_preregistered.rs (earth_from_the_split_barycentre_is_within_the_emb_table_8_10_1_rms : la Terre via AnalyticSolarSystem et icrf_to_ecliptic, RMS { "0.483" } du chiffre EMB ; icrf_positions_are_within_the_table_8_10_1_rms : positions ICRF des corps du Tableau { "1" } et de la Terre, pire { "0.778" } ; earth_minus_barycentre_offset_matches_de441_1950_to_2050 : la séparation par série lunaire, pire { "0.088" } deg et { "6.1" } km) ; ephem::tests (standish_periods_obey_keplers_third_law; a_planet_track_is_one_closed_ellipse). Régression non bloquante : tests/solar_system_horizons_reference.rs

# text
seg-02aaea0ff091 = tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_at_utc_epochs ({ "600" } positions à { "200" } époques UTC 1973-2026 tirées du hachage de préenregistrement ; pire { "0.66" } du seuil, { "2.96" } m) ; tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_on_the_full_kernel_when_present (soumis aux données) ; tests/kernel_ephemeris_skyfield_oracle.rs::barycentre_only_bodies_are_refused_not_substituted ; ephem_provider::tests

# text
seg-19387ac03ee7 = radiometric (light_time_solution, two_way_range, shapiro_delay); solar_system (link, link_on); ephem_provider (AnalyticSolarSystem)

# text
seg-12ea8306ca6a = tests/solar_system_light_time_solver_preregistered.rs::light_time_solver_on_de441_positions_matches_horizons_lt_within_1e_6_s (barycentres de Mercure, Vénus, Mars, Jupiter et Saturne, le Soleil et la Lune jusqu'au centre de la Terre, { "1576" } époques chacun sur des positions DE441 interpolées, pire { "6.7e-9" } s contre { "1e-6" } s) ; énoncé de précision non bloquant pour le chemin analytique : tests/solar_system_light_time_preregistered.rs (RMS c dLT { "0.17" } à { "0.30" } du seuil de position du Tableau { "8.10.1" }) ; solar_system::tests

# text
seg-2e83f70b6649 = body (Body::iau_rotation_et, Body::iau_angles_et, Body)

# text
seg-803d90c9eacb = tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_for_the_fourteen_added_bodies ({ "41" } époques { "1955" } à { "2044" }, { "574" } matrices à { "1e-9" } rad près, pire Phobos { "1.43e-10" } rad) ; tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_at_fresh_epochs ({ "41" } époques { "1961" } à { "2038" } jamais comparées auparavant, { "574" } matrices à { "1e-9" } rad près, pire Phobos { "1.38e-10" } rad) ; tests/body_constants_naif_oracle.rs::constants_match_naif_pck00011_and_gm_de440 ({ "0" } des { "84" } constantes des quatorze corps diffèrent de la NAIF)

# text
seg-cf5cfbb6b468 = constellation (WalkerSpec::elements, gps_slots, galileo_walker, glonass_slots, GPS_BASELINE_SLOTS, GPS_EXPANDABLE_SLOTS)

# text
seg-92ee79866544 = constellation::tests::walker_24_3_1_reproduces_galileo_os_sdd_table_23 (les { "24" } lignes de RAAN et d'anomalie moyenne à { "1e-9" } deg près) ; constellation::tests::glonass_icd_slot_formula_is_a_walker_24_3_1 (la formule d'emplacement de l'ICD et un Walker 24/3/1 sont les mêmes { "24" } paires nœud et argument de latitude) ; constellation::tests::gps_presets_reproduce_the_published_equatorial_crossings (le croisement équatorial de la trace au sol des { "36" } emplacements GPS à partir de la RAAN, de l'argument de latitude et de l'angle horaire de { "100.765" } deg : { "35" } à { "0.0108" } deg près contre un seuil d'arrondi de { "0.015" } deg, et E3F à { "0.06" } deg près parce que la ligne E3F propre au tableau est incohérente avec sa RAAN et son argument de latitude d'environ { "0.06" } deg ; la régression nodale séculaire à { "5" } % près du -0.0402 deg/jour du tableau) ; constellation::tests::walker_geometry_identities_are_exact (les trois identités d'espacement pour les motifs delta et étoile jusqu'à { "1 584" } satellites, à { "1e-9" } deg près)

# text
seg-0aaf33611680 = constellation (coverage, dop_at, NormalAccum)

# text
seg-7bc2428f22d9 = constellation::tests::gps_baseline_global_dop_matches_the_sps_performance_standard (HDOP médian { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" }, moyenne { "0.965" } contre { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } et { "0.96" }, seuil { "0.03" } sur chacun fixé avant la première exécution ; PDOP médian { "1.795" } au plus égal au { "1.815" } du Tableau B.3-1 pour un mélange dégradé de 20-24 satellites ; disponibilité { "100" } % globale et au pire site contre les { "98" } % et { "88" } % du Tableau 3.8-1) ; constellation::tests::single_epoch_dop_matches_the_hand_computation (zénith plus trois satellites à { "30" } deg d'élévation : HDOP 4/3, VDOP { "2.3094" }, PDOP 8/3, TDOP { "1.5275" }, GDOP { "3.0732" } à { "1e-9" } près, et égal à orbit::dop avec une horloge commune)

# text
seg-54bf21cf90d7 = navsignal (sine_integral, bpsk_power_in_band_closed_form, bpsk_gabor_bandwidth_closed_form_hz, dll_jitter_bandlimited_s, dll_jitter_small_spacing_limit_s, bpsk_offset_ssc_closed_form, altboc_15_10_psd, parse_modulation)

# text
seg-d2b3b13002dd = navsignal::band_limited_tests (sine_integral_matches_tables_and_its_limit — Si({ "1" }), Si(pi), Si({ "2" } pi) à { "1e-12" } près ; bpsk_power_in_band_closed_form_matches_textbook_and_numeric — { "0.9028" } de la puissance dans le lobe principal pour BPSK(1/3), BPSK({ "1" }), BPSK({ "5" }), BPSK({ "10" }), et la forme close égale à la quadrature à { "1e-7" } près en { "10" }, { "15" }, { "20" } et { "51.15" } MHz ; bpsk_gabor_closed_form_matches_numeric_and_asymptote — à { "1e-4" } près, et l'asymptote sqrt(B R_c / ({ "2" } pi^{ "2" })) ; bandlimited_dll_reduces_to_the_textbook_forms — BPSK({ "1" }) en avance-retard cohérent à { "45" } dB-Hz, B_L { "1" } Hz, d { "1" } chip, T { "20" } ms : { "0.0039564" } chips ({ "1.159" } m) à { "1" } % près, la forme non cohérente égale à navsignal::dll_code_jitter_chips à { "1" } % près, la limite d'espacement évanescent égale à sa forme close à { "1e-5" } près ; offset_bpsk_ssc_matches_parseval_closed_form — décalages de { "0" } à { "3.2" } R_c à { "0.01" } dB près et -71.86 dB/Hz au décalage nul pour BPSK({ "10" }) ; altboc_psd_is_unit_area_with_lobes_at_e5a_and_e5b; modulation_labels_round_trip)

# text
seg-56f381a3f611 = leo_signal (max_doppler_hz)

# text
seg-da02936f6d75 = leo_signal::tests::max_doppler_matches_published_xona_and_iridium_figures — Xona Pulsar X1 ({ "1593.3225" } MHz, { "1080" } km) { "33.2" } kHz dans l'intervalle publié de { "32" } à { "34" } kHz ; Iridium ({ "1621" } MHz, { "780" } km) à { "0.5" } kHz près des { "36" } kHz publiés

# text
seg-f1cdf8728c6b = Chiffres publiés : Doppler maximal de Xona Pulsar X1 de { "32" } à { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>) ; Doppler d'Iridium jusqu'à +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). La rotation de la Terre est omise, ce qui déplace le chiffre d'environ { "2.3" } kHz au plus ; les deux chiffres publiés sont atteints sans elle.

# text
seg-70fb5eb759aa = leo_link::itu (p838_coefficients, p838_k_alpha, rain_specific_attenuation_db_km)

# text
seg-6ef512cefe4d = tests/leo_link_reference.rs (p838_coefficients_reproduce_table5_to_its_printed_digits : les { "115" } lignes du Tableau { "5" }, de { "1" } GHz à { "1000" } GHz, chaque coefficient à { "0.6" } de son dernier chiffre imprimé ; pire observé { "0.51" })

# text
seg-53d288ecc889 = leo_link::itu (p618_rain_attenuation_db, RainPath)

# text
seg-e1ab19315242 = tests/leo_link_reference.rs (p618_rain_attenuation_matches_the_itu_validation_examples : { "56" } cas sur cinq sites, { "14.25" } et { "29" } GHz, de { "0.001" } % à { "1" } %, à { "1e-4" } dB près ; observé { "5e-6" } dB)

# text
seg-cfe59399d0a3 = leo_link::itu (p618_scintillation_db, wet_refractivity, ScintillationPath)

# text
seg-8a35d6b6f974 = tests/leo_link_reference.rs (p618_scintillation_matches_the_itu_validation_examples : { "42" } cas sur sept sites, { "14.25" } et { "20" } GHz, à { "1e-5" } dB près ; observé { "5e-7" } dB)

# text
seg-f7d2ab81d7d2 = leo_link::itu (p2109_building_entry_loss_db, BuildingClass); detection (normal_inv_cdf)

# text
seg-05bb3df0fcc5 = tests/leo_link_reference.rs (p2109_building_entry_loss_matches_the_itu_workbook : { "568" } valeurs, { "28" } GHz à { "0" } deg et { "2" } GHz à { "45" } deg, les deux classes, P de { "1e-7" } à { "0.998" }, à { "0.001" } dB près)

# text
seg-5b682a1911e5 = leo_link::iono (group_delay_m, iono_free_coefficients, iono_free_noise_amplification); leo_link (fspl_db); linkbudget (free_space_loss_db)

# text
seg-09369862fb72 = tests/leo_link_reference.rs (first_order_iono_reproduces_the_is_gps_200_group_delay_ratio : gamma = (77/60)^{ "2" } à { "1e-12" } près, amplification L1/L2 et L1/L5 { "2.978" } et { "2.588" } ; free_space_loss_is_the_friis_kilometre_megahertz_form : { "32.4478" } + { "20" } log d + { "20" } log f à { "1e-4" } dB près) ; leo_link::iono::tests (delay_scales_as_one_over_f_squared; iono_free_combination_removes_the_first_order_delay)

# text
seg-ba1455ed0740 = leo_link::geometry (max_static_user_range_rate, DopplerEnvelope, doppler_hz)

# text
seg-88f10ca1e3bc = tests/leo_link_reference.rs (doppler_envelope_reproduces_the_pulsar_paper_table_1 : Pulsar IOV { "520" } km { "97" } deg, Pulsar FOC polaire { "1080" } km { "97" } deg, Pulsar FOC inclinée { "1080" } km { "53" } deg et GPS { "20180" } km { "55" } deg ; vitesse orbitale, vitesse ECEF maximale, vitesse relative maximale et Doppler de porteuse maximal en bandes L1 et L5, { "20" } valeurs, chacune à { "0.05" } % près)

# text
seg-45309f1545cc = leo_navmsg::sisre (sisre_weights, StatsAcc)

# text
seg-64d379a46dbc = leo_navmsg::sisre::tests (weights_reproduce_the_published_meo_and_geo_table — GPS { "0.979" } et 1/48.9, GLONASS 1/45.0, Galileo { "0.984" } et 1/61.1, BeiDou MEO 1/54.2, géostationnaire { "0.992" } et 1/126.2 à un masque de { "0" } deg, chacun à { "0.005" } de w_R et { "0.5" } de 1/w_AC^{ "2" } ; leo_weights_shift_toward_the_transverse_axes — angle au nadir de l'horizon { "67.8" } deg à { "510" } km)

# text
seg-d579e3a4f58f = leo_navmsg::elements (kepler_point, kepler_frame, ephemeris_at, sat_state)

# text
seg-7bb3e4112c28 = tests/leo_navmsg_reference.rs (the_galileo_user_algorithm_reproduces_rtklib_to_a_millimetre — quatre éphémérides de diffusion Galileo réelles E10, E19, E24, E25 à tk = { "0" }, +/-600, +/-1800, +/-3600 s, chaque axe à { "1" } mm près de RTKLIB ; real_galileo_records_survive_the_binary_frame_and_the_text_block — à { "5" } mm près après la trame binaire Kshana et { "1" } mm après le bloc de type RINEX)

# text
seg-405df44dd887 = leo_navmsg::codec (crc24q, encode, decode)

# text
seg-577acdb9b84b = leo_navmsg::codec::tests (crc24q_matches_the_catalogue_check_value — 0xCDE703 pour la chaîne ASCII { "123456789" } ; crc24q_matches_the_rtcm_1005_example_frame — les trois octets de contrôle 0x360B98 de la trame d'exemple de type de message { "1005" } du RTCM { "10403" }, et zéro sur la trame entière)

# text
seg-4213f6b60bf1 = leo_navmsg::fit (fit_message, lstsq, polyfit); leo_navmsg::truth (TruthOrbit, TruthClock); leo_navmsg (sequence_stats, LeoNavmsgScenario)

# text
seg-7f4e08aeede7 = leo_navmsg::tests::a_two_body_truth_is_recovered_by_the_keplerian_fit_to_a_millimetre; leo_navmsg::tests::the_user_algorithm_reproduces_the_fitted_truth_to_a_millimetre_with_corrections; leo_navmsg::tests::the_clock_fit_returns_the_truth_clock_through_the_user_relativistic_term; leo_navmsg::tests::keplerian_sisre_grows_with_the_fit_interval_and_the_corrections_fix_it (croissance monotone de { "1" } à { "15" } minutes et amélioration d'au moins un facteur trois à { "15" } minutes) ; leo_navmsg::tests::defaults_run_encode_decode_without_any_preset_and_are_deterministic ; tests/leo_navmsg_fit_real_orbit_oracle.rs::fitted_sisre_matches_liu_2025_on_real_orbits (orbites à dynamique réduite TU Graz ITSG de GRACE-A, GRACE-C, Sentinel-2A et Sentinel-6A ajustées sur des arcs de { "20" } et { "30" } min : RMS le long de la trace, transverse et radial de { "0.804" } à { "1.087" } et SISRE de { "0.716" } à { "0.809" } de Liu et al. { "2025" }, dans 1.5x ; poids SISRE à { "0.0007" } de son Tableau { "2" }) ; tests/leo_navmsg_full_claim_oracle.rs::integrated_truth_orbit_matches_orekit_within_2_cm_over_6_h (Orekit { "12.2" } + Hipparchus { "3.1" }, même état initial et même entrée de densité : pire { "3.95" } mm à deux corps, { "3.92" } mm J2-J6 et EGM2008 jusqu'au degré { "20" } et { "70" }, { "4.55" } mm EGM2008 degré { "20" } avec traînée à { "400" } km, seuil { "0.02" } m sur { "6" } h) ; recoupement interne, et non référence indépendante : tests/leo_navmsg_full_claim_oracle.rs::corrections_clock_fit_and_update_period_trade_agree_with_an_internal_cross_check_on_grace_fo

# text
seg-4a631f12459a = leo_navmsg::elements (kepler_point, Liu22Extra); leo_navmsg::fit (fit_message, fit_kepler, initial_params, formal_sigma); leo_navmsg::truth (TruthOrbit)

# text
seg-c79d4b5fdd17 = tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_model_matches_the_published_sisre (quatre jours de l'article : rapports le long de la trace, transverse, radial et SISRE de { "0.755" } à { "1.138" } de Liu et al. { "2025" }, dans 1.5x) ; tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_holds_on_held_out_days (huit jours réservés, deux arcs chacun : { "0.683" } à { "1.186" })

# text
seg-765c69669bfa = leo_navmsg::services (klobuchar_delay_m, effective_ionisation_level, system_to_utc)

# text
seg-4693b7ddd7b2 = leo_navmsg::services::tests (klobuchar_scales_with_inverse_frequency_squared — la valeur L1 est le { "6.1278" } m de RTKLIB ; nequick_az_rules; utc_without_an_event_is_tow_minus_leap_seconds_folded_to_a_day; utc_drift_terms_follow_the_icd_formula; an_inserted_leap_second_reads_86400_at_the_end_of_the_day) ; tests/leo_navmsg_services_gnsstk_oracle.rs::services_match_gnsstk_and_erfa (Klobuchar à L1, L2 et L5 sur { "4 320" } cas, pire { "7.0e-13" } m ; Az sur { "222" } jeux de coefficients dont les règles tout-zéro et { "400" } sfu, pire { "5.7e-14" } sfu ; dérive UTC sur { "50" } cas, pire { "3.6e-15" } s ; les trois cas de seconde intercalaire sur { "21 602" } instants à travers les vraies secondes intercalaires de { "2015" } et { "2016" }, { "0" } s)

# text
seg-0111fd0b84a5 = leo_fusion::geom (EarthOrbit); leo_fusion::doppler (range_rate, doppler_envelope)

# text
seg-a8dd3751a688 = tests/leo_doppler_reference.rs (iridium_doppler_reaches_the_published_36_khz : un satellite à { "780" } km et { "86.4" } deg suivi pendant un jour à { "1621" } MHz sur quatre latitudes, maximum à { "5" } % de { "36" } kHz ; xona_pulsar_x1_doppler_lies_in_the_published_32_to_34_khz : un satellite de chaque coquille publiée, { "1080" } km à { "53" } et { "97" } deg, { "1593.3225" } MHz, le maximum de la constellation dans { "32" } à { "34" } kHz sans élargissement ({ "33.6" } kHz, fixé par la coquille de { "97" } deg ; la coquille de { "53" } deg seule culmine à { "31.8" } kHz)) ; leo_fusion::geom::tests (velocity_is_the_time_derivative_of_the_position)

# text
seg-8ac77c9b9588 = leo_fusion::ntn (gabor_bandwidth_flat_hz, gabor_bandwidth_bpsk_hz, gabor_bandwidth_numeric_hz, rms_duration_numeric_s, toa_crb_sigma_m, doppler_crb_sigma_hz, frequency_crb_sigma_hz, NtnScenario::geometry, NtnScenario); leo_fusion::joint_pvt (formal_sigma_enu)

# text
seg-50b92f3ed7eb = leo_fusion::ntn::tests (the_numerical_rms_bandwidth_matches_the_closed_forms; the_range_bound_scales_as_one_over_bandwidth_and_root_cn0 : { "0.4157" } m à la main à { "5" } MHz, { "45" } dB-Hz, { "0.1" } s ; the_frequency_bound_is_the_complex_tone_crlb; defaults_run_wider_is_better_and_every_number_has_a_unit) ; tests/leo_fusion_scenarios.rs (ntn_wide_channel_bounds_far_tighter_than_the_narrow_one) ; tests/ntn_crlb_published_value_oracle.rs (ssb_bounds_reproduce_the_published_values; ntn_fix_covariances_match_numpy; bpsk_rms_bandwidth_reproduces_betz_table_1)

# text
seg-cc3d01973493 = leo_fusion::polar (latitude_sweep, latitude_sweep_at, element_sets, satellite_states_at); leo_fusion::joint_pvt (dop); sgp4 (MeanElementSet::from_earth_fixed, SgpOrbit, teme_to_itrs_matrix)

# text
seg-e1d9acf84101 = tests/leo_polar_coverage_on_path_orekit_oracle.rs (configurations A et B, { "4040" } échantillons : positions fixes par rapport à la Terre à { "6.8e-5" } m près, seuil { "0.2" } m ; nombres de satellites en vue identiques sur 4040/4040 ; DOP médian à { "2.3e-11" } en relatif, seuil { "1e-3" } ; disponibilité et moyenne en vue identiques) ; tests/earth_orbit_path_sgp4_erfa_oracle.rs (le chemin) ; leo_fusion::polar::tests (gps_vertical_geometry_weakens_at_the_pole_and_a_polar_leo_shell_restores_it) ; tests/leo_fusion_scenarios.rs (a_polar_leo_constellation_fills_the_sky_where_gnss_vertical_geometry_weakens) ; tests/leo_polar_coverage_orekit_oracle.rs (tour { "2" }, géométrie sur des états donnés) ; tests/leo_polar_coverage_full_claim_orekit_oracle.rs (constat du tour 1 sur l'affirmation complète, figé)

# text
seg-bd265d530763 = lunar_frame_campaign, fim

# text
seg-7c8144a7376a = tests/lunar_frame_campaign_mpmath_oracle.rs (lunar_frame_campaign_datum_matches_mpmath_extended_precision : trois scénarios — stations estimées à une nouvelle date de campagne 2026-03-18 (contraignant), stations fixées à cette date (témoin), stations estimées au 2024-01-01 (le scénario de l'échec antérieur en double précision) ; chaque sigma du datum, le nombre de conditionnement et la direction la plus faible contre un seuil mis à l'échelle du conditionnement recalculé dans le test à partir des sensibilités exactes de la référence indépendante ; engine_inputs_match_the_committed_fixture : le jacobien, les poids et la conception de Helmert versionnés sont ce que le moteur construit à présent ; record_engine_accuracy_against_a_factorisation_route : la bande d'erreur du moteur et le diagnostic de Cholesky de NumPy figés)

# text
seg-691a05f06e4d = linalg_sr, lunar_frame_campaign

# text
seg-f26d99df9184 = tests/lunar_frame_campaign_srif_mpmath_oracle.rs (srif_datum_matches_mpmath_extended_precision : quatre scénarios — stations estimées à une nouvelle date de campagne 2026-06-09 (contraignant), stations fixées à cette date (témoin), et les entrées à stations estimées du 2026-03-18 et du 2024-01-01 ; chaque sigma du datum, le nombre de conditionnement et la direction la plus faible contre un seuil en forme de racine carrée recalculé dans le test à partir des ingrédients exacts de la référence indépendante ; engine_inputs_match_the_committed_fixture) ; linalg_sr::tests ({ "9" } tests de bibliothèque : le produit de Dekker égal au résidu de la multiplication-addition fusionnée sur { "20 000" } paires, sommation compensée d'une somme à annulation, R^T R égal à A^T A, mises à jour séquentielles du filtre égales à une mise à jour par lot, le bloc final égal à la racine carrée du complément de Schur, l'inverse triangulaire, la SVD de Jacobi, concordance avec le datum spectral sur un cas bien conditionné, réexécutions identiques bit à bit) ; lunar_frame_campaign::tests::the_default_solver_is_unchanged_and_an_unknown_solver_is_rejected et the_srif_solver_agrees_with_the_spectral_one_where_both_are_accurate_and_says_so

# text
seg-02fed5e55709 = receiver_trust (ingest, maritime)

# text
seg-3c5f4229618e = tests/maritime_trust_reference.rs (t1_nmea_decoding_matches_pynmea2, t2_east_north_offsets_match_the_wgs84_geodesic, t3_t4_monitor_input_statistics_match_the_oracle) contre tests/fixtures/maritime_trust/reference.json, régénéré par scripts/gen_maritime_trust_ref.py à partir du NMEA synthétique écrit par examples/gen_maritime_trust_ref_inputs.rs ; tolérances préenregistrées dans tests/fixtures/maritime_trust/PREREGISTRATION.md

# text
seg-684b87e7f358 = nmea_synth (track, sentences, scenarios); cli nmea-scenario

# text
seg-5699d8162c69 = tests/nmea_training_reference.rs (comparaison avec la référence indépendante pynmea2) ; tests/nmea_training_scenarios.rs::every_sentence_is_checksum_valid_and_the_reader_accepts_it, ::every_sentence_type_is_present_each_epoch, ::deterministic_per_seed_and_sensitive_to_it

# text
seg-87e0596369cb = interference_map (adsb::nacp_epu_bound_m, adsb::nic_rc_bound_range_m, adsb::AdsbParams::classify, ais::ais_position_is_valid, ais::ais_speed_kn, grid::Grid::cell_of, route::exposure, land::LandMask::is_inland)

# text
seg-48689d047304 = tests/interference_map_reference.rs::adsb_accuracy_and_integrity_codes_agree_with_pymodes ({ "12" } codes NACp, { "59" } lignes NIC) ; tests/interference_map_reference.rs::ais_field_rules_agree_with_pyais_decoding ({ "94" } trames) ; tests/interference_map_reference.rs::grid_cell_assignment_agrees_with_shapely ({ "1770" } points, quatre tailles de cellule) ; tests/interference_map_reference.rs::route_exposure_geometry_agrees_with_shapely_and_geographiclib ({ "8" } routes, { "420" } tronçons, { "11634" } km) ; tests/interference_map_reference.rs::land_masking_agrees_with_shapely_and_pyproj ({ "996" } points) ; tests unitaires de interference_map

# text
seg-a14a79333731 = telemetry (prometheus: Registry, render; otlp: build_payload, Exporter (feature otlp); sample)

# text
seg-bce7247612db = tests/telemetry_formats_reference.rs (prometheus_client_reads_our_exposition_as_the_registry_implies, the_official_otlp_proto_reads_our_json_as_the_registry_implies, awkward_reason_text_survives_the_parser, the_committed_outputs_are_what_this_crate_produces ; schéma { "1.3" } : prometheus_client_reads_the_schema_13_exposition_as_the_registry_implies, the_official_otlp_proto_reads_the_schema_13_json_as_the_registry_implies, promtool_accepts_the_schema_13_exposition, the_collector_receives_and_exports_the_schema_13_payload_unchanged) ; tests/telemetry_cli.rs ; telemetry::prometheus::tests (exposition de référence)

# text
seg-40e8b0a596fb = telemetry (syslog: cef, rfc5424, SyslogSink; time)

# text
seg-baadfddd02b2 = tests/cef_reference.rs (pycef_reads_every_tier_1_event_as_the_sample_implies, the_logstash_cef_codec_reads_every_event_including_escaped_headers_as_the_sample_implies, the_committed_corpus_is_what_this_crate_produces_and_covers_what_was_registered) ; telemetry::syslog::tests (chaînes CEF exactes, échappement, gravité, enveloppe RFC { "5424" }) ; tests/telemetry_cli.rs

# text
seg-66f38fc734a7 = evidence (bundle: create_bundle, sign_detached, chain_link, sha256_hex; verify: verify_bundle, verify_detached; tsr; assemble; cli)

# text
seg-d50f70b4c20a = tests/evidence_crypto_reference.rs (RFC { "8032" } section { "7.1" } vecteurs { "1" }, { "2" }, { "3" } et { "1024" } ; exemples SHA-256 de FIPS 180-4 ; exact) ; tests/evidence_pack_reference.rs::kshana_and_the_clean_room_verifier_agree_on_every_case ({ "71" } cas) ; tests/evidence_pack.rs (tests d'altération)

# text
seg-703f4b4ac682 = evidence::tsa (verify_token, pem_certificates); evidence::verify (VerifyOptions::tsa_anchors, Failure::TimestampAuthorityInvalid); evidence::cli (--tsa-ca)

# text
seg-39bc6b70440b = tests/evidence_tsa_openssl.rs::every_case_agrees_with_openssl (la comparaison préenregistrée) ; evidence::tsa::tests (dates et heures civiles, base64, l'opération publique RSA) ; evidence::verify::tests::anchors_make_the_authority_checked (un jeton non signé échoue avec des ancres ; sans elles le rapport est inchangé)

# text
seg-837193c4e1dc = interop::testbench (write_motion_csv, write_nmea, trajectory_of, export); fusion::pack::truth_trajectory

# text
seg-0094102cc5b8 = tests/testbench_reference.rs ({ "7" } tests : verrous de référence indépendante, octets d'export, pire cas sur chaque ligne, colonnes de position, vitesse locale contre vitesse NED vraie, angles d'Euler contre scipy, NMEA contre pynmea2) ; tests/interop_testbench.rs (les allers-retours propres à l'écrivain)

# text
seg-3266b898bfd2 = iq::signals::beidou (b1i_bits, b1i)

# text
seg-ba514f7e73ce = iq::signals::gps (l1c_weil, l1c_ranging_bits, l1c_p_bits, l1c_d_bits, l1co_s1_run, l1c_o_bits); iq::signals::tables

# text
seg-9e651a7f8dc9 = tests/iq_signals_gps_l1c.rs (c1_l1cp_and_l1cd_initial_and_final_24_chips_match_is_gps_800j_table_3_2_2, c2_l1co_initial_and_final_11_bits_match_is_gps_800j_table_3_2_3, c3_legendre_sequence_matches_is_gps_800j_table_6_2_1, the_column_check_rejects_relabelled_inverted_and_shifted_codes)

# text
seg-b289551b0bb5 = iq::signals::lunanet (afs_i_bits, afs_q_primary_bits, legendre_bits); iq::signals::lunanet_tables; iq::lunanet_afs::check_spec

# text
seg-176e3b9ea0e7 = tests/lunanet_afs_codes.rs (b1_afs_i_gold_codes_match_the_printed_first_and_last_24_chips_for_all_210_prns, b2_the_legendre_sequence_of_length_10223_is_the_printed_table_d1, b3_afs_q_primary_codes_match_the_printed_first_and_last_24_chips_for_all_210_prns, b1b_not_met_the_printed_g2_state_is_not_the_state_after_the_printed_delay, b1c_post_hoc_the_printed_g2_state_is_the_state_after_2047_minus_the_delay) ; tests/iq_signal_matrix.rs (lunanet_afs_i, lunanet_afs_q)

# text
seg-af826b47d00e = { "388" } lignes : { "176" } validées en externe, { "208" } modélisées, { "4" } relevant du partenaire.

# text
seg-6bb40f180cf0 = <s1>Précédent</s1>État de la validation

# text
seg-defb46c5bc80 = <s1>Suivant</s1>Référence des capacités

# text
seg-226dedaba243 = Un programme scipy/numpy indépendant intègre les mêmes équations variationnelles (seuil O1). Rien n'est comparé à une mesure d'une orbite lunaire. La référence vérifie la numérique de formules énoncées, non la physique, de sorte que la ligne reste MODELLED. Modèle restreint à trois corps : ni Soleil, ni harmoniques lunaires, l'axe de rotation de la Terre le long de la normale à l'orbite, entrées de récepteur et de station ILLUSTRATIVE.

# text
seg-3801e9b32309 = Cohérence interne seulement : le temps jusqu'au seuil par bissection est vérifié face à l'inverse en forme close du type de bruit dominant de l'horloge, et le terme d'horloge en marche libre face au terme d'horloge propre du budget. Les classes d'horloge reposent sur des spécifications publiées à un jour (leurs propres lignes) ; le taux du LTC n'est pas redérivé ici et garde sa propre ligne VALIDATED (Temps coordonné lunaire) ; le résidu d'asservissement est ILLUSTRATIVE, le résidu de réalisation est une allocation de budget et aucun modèle thermique n'est inclus. La cible de l'ordre de la nanoseconde décrite dans la documentation ICG WG-B Lunar PNT de juin { "2024" } est citée comme énoncé de la source, non adoptée comme affirmation ; rien ici n'est un énoncé sur une horloge de station réelle

# text
seg-7dfedc40da6a = Le bloc facultatif [time_lab] du scénario lunar-time-budget modélise une horloge de station de référence lunaire (par défaut la classe miniRAFS, ou toute classe nommée, ou une fiche d'appareil ajustée sur des points de stabilité énoncés) asservie au temps coordonné lunaire puis en marche libre ou réasservie toutes les N secondes : la courbe d'erreur temporelle x(t) comme racine de la somme des carrés du terme en loi de puissance de l'horloge, d'un résidu d'asservissement constant (ILLUSTRATIVE), d'un résidu constant de réalisation du LTC et d'un terme de taux de hauteur de station facultatif ; le temps après un asservissement jusqu'à { "1" }, { "10" } et { "100" } ns (ou des seuils énoncés) par bissection à côté de l'inverse en forme close pour le type de bruit dominant, et le terme dominant à chaque horizon énoncé, le tout avec unités

# text
seg-b915c06fa3f1 = skyline::PRESETS : quatre géométries REPRESENTATIVE avec les dimensions énoncées de la note de conception et une ligne de provenance chacune : city-street (un canyon, rue { "0" } deg, { "20" } m entre des murs de { "30" } m, antenne { "1.5" } m), harbour-approach (secteurs : ouvert vers le large sur { "180" } deg, bâtiments de quai { "8" } deg sur { "90" } deg, la digue { "3" } deg), fjord (relief : parois à { "600" } m au-dessus de l'antenne à { "1.5" } km de part et d'autre d'un chenal nord-sud, chute de courbure appliquée), container-terminal (secteurs : piles de conteneurs { "12" } deg sur la moitié côté terre, flèches de grues { "35" } deg et { "25" } deg sur deux secteurs étroits) ; modifiables champ par champ
