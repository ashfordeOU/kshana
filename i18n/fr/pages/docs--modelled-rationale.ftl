# docs--modelled-rationale: translations (fr)

# text
seg-2db69c58f694 = PNT différentiel lunaire

# text
seg-1ff1d8ebf1e7 = Cartographie de compliance vers les cadres publics

# text
seg-aab745a65e76 = Module

# text
seg-d6476863f862 = Capacité

# text
seg-60a43431ebe0 = Exigence

# text
seg-bde1b3a94a47 = Ombre de SRP à assombrissement centre-bord solaire (facultatif)

# text
seg-eaaec545dd68 = Fraction éclairée de la SRP comme fraction non occultée du flux solaire à assombrissement centre-bord (loi d'approximation d'Eddington I(mu)/I({ "1" }) = 2/5 + 3/5 mu, quadrature de Gauss-Legendre) sur une Terre sphérique ou WGS-84 (srp_shadow::limb_darkened_shadow, la variante ShadowModel OblateEarthLimbDarkened)

# text
seg-9e15970435c3 = Soleil et Lune DE440 dans le modèle de forces de Cowell (facultatif)

# text
seg-de6831cf7785 = Niveau d'éphéméride facultatif pour les termes de troisième corps et de SRP du ForceModel numérique de Cowell : le Soleil et la Lune géocentriques à partir de n'importe quel EphemerisProvider (un noyau SPK DE440 via KernelEphemeris) à TDB = TT + (TDB - TT), en refusant un fournisseur qui ne peut pas servir l'époque et en comptant tout repli sur la série analytique ; désactivé par défaut

# text
seg-057c21daf4f2 = Marée atmosphérique S1 (facultatif)

# text
seg-f600a39f297e = La marée de pression atmosphérique diurne S1 comme perturbation du géopotentiel : modèle N1 de Biancale et Bode ({ "2006" }), degrés { "2" } à { "6" }, par la formule de charge de l'éq. { "6.21" } de l'IERS { "2010" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), facultatif sur les modèles de forces de Cowell et précis (air_tide_s1, désactivé par défaut)

# text
seg-e8f5ff8c9149 = Gravité en harmoniques sphériques de haut degré (EGM2008 jusqu'à { "2190" })

# text
seg-d3b2f32dcecb = Évaluation sans dépassement inférieur et sans singularité aux pôles d'un champ complètement normalisé jusqu'au degré { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, colonne directe modifiée de Holmes-Featherstone { "2002" } avec le gradient exempt de 1/cos phi), un chargeur ICGEM .gfc en flux (from_gfc_file / from_gfc_reader ; l'EGM2008 complet est récupéré à l'exécution, non livré avec le logiciel), et l'évaluateur de Holmes-Featherstone sélectionnable sur le Geopotential de Cowell en option

# text
seg-1960804ef2f4 = Détermination d'orbite par lots à partir de la vitesse radiale et de l'azimut/élévation avec masquage de station

# text
seg-4c185244bc66 = Retrouver un état à l'époque à partir de mesures mixtes de distance, de vitesse radiale et d'azimut/élévation au-dessus d'un masque d'élévation par Gauss-Newton sur H = (dh/dx(t)) Phi(t, t0) : dérivées partielles analytiques des mesures et matrice de transition d'état variationnelle avec dérivées partielles analytiques à deux corps + J2 (intégrée par RK4, et non une matrice de transition en forme close)

# text
seg-bc3d1ee7c639 = Pondération des observations par les codes de précision SP3

# text
seg-63b1fab84f85 = Convertir les codes de précision SP3 (exposants ++ de l'en-tête en { "2" }^n mm, la base %f, écarts types par enregistrement base^n mm) en sigmas de position par observation pour le moteur de détermination précise d'orbite (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

# text
seg-ae3e8833a5ef = Associer un champ de gravité publié à un corps

# text
seg-ffb2b20e5f32 = with_gravity_field (sur Body, dans src/gravity_pds.rs) : associer tout champ d'harmoniques sphériques chargé (par exemple GMM-3 ou GL0660B) à un Body afin que le propagateur l'évalue en repère lié au corps ; en option, corps par défaut inchangés

# text
seg-9762cf428435 = Encodeurs de messages de navigation au-delà du LNAV GPS (CNAV GPS, I/NAV et F/NAV Galileo)

# text
seg-9b703b9607d8 = Messages CNAV GPS de types 10/11/30, mots I/NAV Galileo de types 1-5 en pages paires/impaires nominales et pages F/NAV Galileo de types 1-4 : empaquetage et quantification des champs de l'ICD, CRC-24Q, codage convolutif de taux 1/2 K={ "7" } (G2 inversé pour Galileo), entrelacement par blocs et motifs de synchronisation, avec des décodeurs de test correspondants

# text
seg-974d8c1f7876 = Lissage du code par la porteuse de Hatch sur des observations RINEX réelles

# text
seg-f26b5da0f52e = Filtre de Hatch sans divergence (code sans ionosphère porté par la porteuse sans ionosphère, fenêtre de N époques, redémarrage sur perte d'accrochage, saut sans géométrie ou lacune) dans l'assemblage de positionnement précis ponctuel

# text
seg-278ca396127a = Lecture de fichiers d'observation RINEX { "4" }

# text
seg-e0883aa933eb = En-têtes d'observation RINEX 4.0x (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE ; étiquettes reconnues aux colonnes 61-80 pour la version { "4" } et suivantes) et enregistrements d'époque

# text
seg-33e5c74720ff = Position de satellite BeiDou GEO par éphéméride diffusée

# text
seg-44b61449b65a = Position de satellite géostationnaire selon BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } à partir d'une éphéméride diffusée (repère quasi inertiel, puis Rz(Ω̇e·tk)·Rx(−{ "5" }°)), en option via le champ include_beidou_geo de NavParseOptions, de sorte que le lecteur par défaut ignore toujours les GEO

# text
seg-71f48628ebb2 = GNSS/INS à couplage serré sur phase de porteuse avec ambiguïtés flottantes

# text
seg-5a156aa81275 = EKF en états d'erreur sur { "15" } états INS, une horloge de récepteur à deux états et une ambiguïté de porteuse flottante par satellite suivi ; pseudodistance, phase de porteuse et vitesse radiale facultative issues d'une constellation Walker SGP4 (temps de lumière et Sagnac), corrections de Klobuchar et de Saastamoinen/Niell appliquées dans la boucle à la position propre du filtre ; détection de sauts par porteuse différenciée dans le temps avec un seuil par satellite élargi par l'incertitude de vitesse ; réinitialisation des ambiguïtés sur sauts et réacquisition

# text
seg-7d644516b1ec = Paquets GNSS/INS maritime, ferroviaire et aviation avec option de couplage serré

# text
seg-cbb03a8baf73 = Trois scénarios gnss-ins sur la bibliothèque de trajectoires (un navire zigzaguant à { "8" } m/s avec une interruption de cinq minutes ; un train traversant une tranchée à deux satellites et un tunnel ; un aéronef dont l'interruption couvre un virage incliné de 25 degrés) et la table [tight] facultative du paquet : pseudodistances d'une constellation Walker SGP4 fusionnées par le navigateur en boucle fermée, tous les satellites au-dessus du masque en nominal et les quelques plus hauts en dégradé

# text
seg-f4dab73c4eda = Filtre PNT de pseudodistance couplé avec état de biais et extension 3D dans le paquet de fusion

# text
seg-742b60089361 = Un filtre de Kalman empilé sur la position, la vitesse, la phase et la fréquence d'horloge, alimenté par des pseudodistances qui couplent position et horloge (mises à jour sous forme de Joseph portant la covariance croisée) ; une variante à 1 DOF augmentée d'un état de biais d'accéléromètre constant que le paquet de fusion exécute sous [coupled] ; et la version 3D à 8 états avec des lignes de ligne de visée

# text
seg-2db2b9dc3b45 = Bibliothèque de trajectoires GNSS/INS et import de vérité CSV

# text
seg-e1fe83c75a6c = Profils de mouvement sélectionnables pour le paquet gnss-ins (ligne droite, figure en 8, urbain avec arrêts et reprises, montée d'aéronef et virage coordonné, drone d'arpentage), définis par des commandes de vitesse d'Euler et d'accélération le long de la trajectoire bouclées sur l'état de vérité avec l'IMU cinématique (termes centripète, de gravité et de Coriolis), et vérité CSV importée transformée en l'IMU qui la reproduit ; le trajet historique inchangé lorsqu'aucun profil n'est donné

# text
seg-86f9186bb884 = NRHO CR3BP Terre-Lune { "9" }:{ "2" } par rapport à l'orbite suivie par CAPSTONE

# text
seg-d4127cf241f3 = L'orbite en halo quasi rectiligne sud L2 { "9" }:{ "2" } du problème restreint circulaire que cr3bp::differential_correct_halo corrige (la famille d'orbites de Gateway et CAPSTONE), comparée pour sa géométrie moyenne (période, rayon au périlune, rayon à l'apolune) à l'orbite que CAPSTONE a réellement suivie. Une mesure de la qualité avec laquelle le membre CR3BP décrit l'orbite réelle ; une orbite CR3BP n'est pas une orbite de modèle d'éphéméride et n'est pas comparée époque par époque

# text
seg-1a5623c81b48 = Erreur de position à partir de la géométrie : erreur RMS = sigma_UERE x DOP pour la solution des moindres carrés du moteur

# text
seg-7a94b44a8738 = dop_error_mc::run_geometry et check : une simulation Monte Carlo avec graine (N = { "20,000" } époques par géométrie, sigma = { "1.5" } m, graine ChaCha8 { "36" } + i) de la solution itérée des moindres carrés propre au moteur (pvt::solve_spp, poids unitaires, résolue à partir de la position vraie) sur les { "8" } géométries de tests/fixtures/dop/dop_reference.csv, comparant les variances d'erreur est, nord, haut et horloge, le RMS H/V/P, la corrélation est-nord, les erreurs moyennes et la fraction à l'intérieur de l'ellipse horizontale à { "95" } % avec sigma^{ "2" } Q, où Q est le facteur de covariance du noyau orbit::dop (orbit::dop_cofactor, la même arithmétique) sur la même géométrie

# text
seg-9acfde1b57f7 = Classification de confiance sensible à la géométrie : géométrie des satellites à côté du score de confiance du récepteur et une classe sur chaque déduction

# text
seg-6138c41e13ff = receiver_trust::geometry : géométrie des satellites par époque (bonne, dégradée avec les raisons few-satellites/high-pdop/high-hdop/sky-blocked, ou inconnue lorsque le journal ne donne ni GSV, ni NAV-SAT, ni GSA) dérivée des élévations et azimuts rapportés via orbit::dop ou reprise de GSA, avec une étiquette toujours rapportée et jamais notée (good, fair, poor, unknown) et le HDOP, le PDOP, le VDOP, le nombre de satellites et la perte de signal en toutes lettres ; un moniteur de géométrie du score du navire qui ne déduit rien tant que la géométrie n'est pas mauvaise (rapport max(hdop/4, pdop/6, 5/n_used) supérieur à { "1" }), puis monte en rampe jusqu'à un plafond de { "15" } points à { "1.5" } que la géométrie seule ne peut pas faire passer sous la bande dégradée (plafond, fin de rampe et plancher dans [geometry] ; aucune alarme) ; une classe sur chaque déduction (geometry, environment, inconsistency) avec la perte d'accrochage sur des satellites sous { "15" } deg classée geometry, les satellites en vue mais non suivis classés environment, et une déduction de mauvaise géométrie dont le HDOP déclaré s'écarte, au-delà de max({ "1.0" }, { "25" } % du HDOP dérivé), du ciel déclaré classée inconsistency

# text
seg-bbb1828b3db1 = Réductions de canyon urbain, de secteur et de relief en table

# text
seg-2864aec7be88 = skyline : le canyon urbain en forme close (coupure atan((h - a) / d) avec d = (w/2) / abs(sin(az - s)), extrémités ouvertes pour une longueur finie), secteurs à bords nets dans le sens horaire avec rebouclage, et points de relief réduits en table avec la chute de courbure d^2/({ "2" } * 4/3 R) ; la ligne d'horizon est leur maximum point par point avec toute table

# text
seg-3f3d657854ce = Préréglages de ligne d'horizon (rue de ville, approche portuaire, fjord, terminal à conteneurs)

# text
seg-b915c06fa3f1 = skyline::PRESETS : quatre géométries REPRÉSENTATIVES avec les dimensions énoncées de la note de conception et une ligne de provenance chacune : city-street (un canyon, rue { "0" } deg, { "20" } m entre des murs de { "30" } m, antenne { "1.5" } m), harbour-approach (secteurs : ouvert vers le large sur { "180" } deg, bâtiments de quai { "8" } deg sur { "90" } deg, la digue { "3" } deg), fjord (relief : parois à { "600" } m au-dessus de l'antenne à { "1.5" } km de part et d'autre d'un chenal nord-sud, chute de courbure appliquée), container-terminal (secteurs : piles de conteneurs { "12" } deg sur la moitié côté terre, flèches de grues { "35" } deg et { "25" } deg sur deux secteurs étroits) ; modifiables champ par champ

# text
seg-6012113b4836 = Fonctions de géométrie du ciel : visibilité, DOP, covariance, ellipse d'erreur, nuage Monte Carlo

# text
# c1: kshana sky
# c2: kshana skyline
# c3: sky_geometry
seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg ; CLI <c1/> et <c2/>, fonctions Python et WASM de mêmes noms, MCP <c3/>) : à partir d'un site, d'un instant et de préréglages de constellation (ou de satellites en azimut/élévation ou ECEF), les satellites visibles et masqués sous une ligne d'horizon, GDOP/PDOP/HDOP/VDOP/TDOP, le cofacteur à variance unitaire (H^T H)^-1 et la covariance est-nord-haut avec une horloge de récepteur par système ou une commune, l'ellipse d'erreur horizontale (demi-axes k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), orientation { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) depuis le nord), et n erreurs de moindres carrés tirées avec graine sous des erreurs de distance gaussiennes indépendantes avec leur covariance empirique, leur RMS et leur confinement à { "95" } %. Le cofacteur est orbit::cofactor_from_los, le noyau unique derrière orbit::dop et orbit::dop_cov (dop est la réduction de dop_cov) : aucune seconde implémentation du DOP

# text
seg-7f66be0f15c8 = Holdover d'horloge sans GNSS

# text
seg-4d8f87668a0f = Croissance de l'erreur de marche en forme close + holdover jusqu'au seuil ; classes d'horloges quantiques

# text
seg-29b482d88916 = Fiches d'appareil d'horloges mesurées (prédiction sur jeu réservé)

# text
seg-8c68c5b25004 = clock_library : une fiche d'appareil (bruit blanc de phase, bruit blanc, bruit de scintillement et marche aléatoire de FM plus une dérive linéaire de fréquence) ajustée sur un tiers d'un enregistrement d'horloge mesuré nommé après une passe de conditionnement consignée (lacunes, valeurs aberrantes de phase, sauts de phase, rafales supprimés ; sauts de fréquence consignés), pondérée par les degrés de liberté de type de bruit identifiés au retard 1, et son écart-type d'Allan prédit noté sur les deux tiers réservés ; lecteurs pour les fichiers d'horloge RINEX et IGS, les fichiers par laboratoire du BIPM et la section { "1" } de la Circular T ; conversion d'une fiche en modèle de bruit de synchronisation de créneau, en modèle d'horloge à filtre de Kalman étendu et en niveaux de bruit du moniteur de leurrage

# text
seg-5097a0e6460d = Fiches d'horloges GPS Block IIF mesurées avec termes par révolution (prédiction sur jeu réservé)

# text
seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic : une fiche d'appareil qui porte les termes de phase de une à quatre fois par révolution (période T/k, T = { "43 082.05" } s), ajustés conjointement avec le terme quadratique par moindres carrés sur un tiers d'un enregistrement d'horloge de satellite mesuré, avec la contribution d'Allan en forme close de chaque terme { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } dans l'écart-type d'Allan prédit

# text
seg-0d72fcc0fbea = Estimation de l'état d'horloge embarquée

# text
seg-6db5391f8ebe = Horloge de Kalman à 3 états (phase/fréq./dérive) de Van Loan, stabilisée de Joseph

# text
seg-3f0a9d7c2971 = Budgétisation des erreurs de transfert de temps

# text
seg-216f46b43860 = Bidirectionnel/TWSTFT (Sagnac), vue commune GNSS, PPP ; gigue de liaison→distance

# text
seg-157fadeb5d67 = Modulation de signal de navigation et analyse du suivi de code

# text
seg-ab633d191396 = DSP BPSK-R/BOC, séparation spectrale κ, largeur de bande de Gabor, gigue de DLL, multitrajet

# text
seg-e6c08e1e6ae3 = Performance de capteur inertiel quantique

# text
seg-d28e1f6a430f = Accéléromètre à interféromètre à atomes froids à partir des premiers principes (k_eff·T², QPN)

# text
seg-4b79d03cecf5 = Ambiguïté de frange / plage dynamique du capteur inertiel quantique

# text
seg-deb2850546d5 = Plage dynamique d'ambiguïté de frange Mach–Zehnder : la lecture de frange périodique en 2π fixe une force spécifique maximale non ambiguë a_max=π/(k_eff·T²), et la plage non ambiguë en cellules de résolution a_max/σ_a=π/σ_Φ est indépendante du facteur d'échelle optique — le gain de sensibilité en T² coûte de la plage non ambiguë en parfaite proportion (le temps d'interrogation échange résolution contre plage, laissant le nombre de cellules fixé par le bruit de phase de lecture)

# text
seg-d04bf321d4a1 = Résilience de navigation à l'estime inertielle quantique

# text
seg-c4989abb5d40 = Budget de position composé biais + facteur d'échelle + VRW + décroissance de stabilité sur le holdover

# text
seg-5692c7b936b6 = Résilience au brouillage sans GNSS

# text
seg-f4ff77caa47b = Bilan de liaison J/S géométrique, C/N₀ anti-brouillage, perte d'accrochage par satellite

# text
seg-ff90679d1de9 = Détection de leurrage

# text
seg-b843f63e77e6 = FoM de sécurité par époque fusionnant χ² aidé par l'horloge, RAIM, AGC, SQM

# text
seg-b10d07921f5e = Niveau de protection de synchronisation sous leurrage

# text
seg-2a829711b997 = Borne en forme close de l'erreur temporelle non détectée au pire cas = plancher du moniteur + σ de marche de l'oscillateur sur la latence de détection CUSUM, rapportée comme bande de plancher de bruit rouge

# text
seg-f1d49eac89f8 = PNT alternatif / complémentaire

# text
seg-023dda973f66 = Appariement de carte de gravité, navigation référencée au relief (TERCOM/SITAN), anomalie magnétique

# text
seg-791e7285c291 = Reproductibilité et assurance logicielle

# text
seg-7177355a482c = Portes déterministes, à hachage de scénario, SBOM + références d'or multiplateformes

# text
# c1: impairment-eval
seg-241f2eeaef12 = Corpus synthétique étiqueté de perturbations + banc ROC/AUC/confusion/Pfa-Pmd indépendant du détecteur ; garde contre les fuites, partition stratifiée, rapport d'optimisme sur le changement de distribution (dans le régime contre hors du régime). Exécutable depuis la CLI/les liaisons comme type de scénario <c1/> (scenarios/impairment-eval.toml)

# text
# c1: cargo run --release --example optimism_study
seg-642087659fda = Étude synthétique contrôlée de l'écart d'optimisme d'AUC entre dans-la-distribution et hors-distribution pour des détecteurs de méthodes publiées et appris (régression logistique / MLP à une couche cachée) : tendances de loi d'échelle par classe (Spearman ρ + pente sur { "1" }−gravité) et un prédicteur ridge à partir de la seule distribution d'origine qui estime l'écart à partir des seuls diagnostics dans la distribution, noté en laissant de côté un détecteur à la fois et une classe à la fois. Reproductible via <c1/>

# text
seg-fd6424213d1f = Compromis PNT quantique contre classique et résilience sans GNSS ({ "13503" })

# text
# c1: quantum-trade
seg-21b2b54200a8 = Ingestion d'ADEV mesurée (NNLS), table de compromis (holdover de synchronisation/inertiel + bénéfice), enveloppe résilience-contre-temps ; mise en garde sur le plancher portée par l'artefact. Exécutable depuis la CLI/les liaisons comme type de scénario <c1/> (scenarios/quantum-trade.toml)

# text
seg-1fa865bfddd1 = Environnement météorologique spatial et densité thermosphérique pilotée par l'activité

# text
# c1: space-weather
seg-47308f611c7e = Indices solaires/géomagnétiques (table Kp↔ap par définition), la température exosphérique de Jacchia-1971, et la densité thermosphérique de Jacchia { "1971" } (SAO Special Report { "332" } : profils de diffusion statiques reproduisant son tableau { "7" }, avec les variations diurne, géomagnétique, semi-annuelle, saisonnière-latitudinale et de l'hélium) face à l'atmosphère statique USSA76. Exécutable depuis la CLI/les liaisons comme type de scénario <c1/> (scenarios/space-weather.toml)

# text
seg-c76b8c395ef0 = Fenêtre de lancement et géométrie d'ascension (analyse de mission)

# text
# c1: launch-window
seg-6066c634faba = Azimut(s) de lancement à deux corps (sin Az = cos i / cos lat), inclinaison minimale atteignable, vitesse circulaire, bonus vers l'est de la rotation de la Terre, Δv de changement de plan en dogleg et opportunités quotidiennes, et, étant donnés une époque et des lignes IERS finals2000A, la vitesse du site autour du vrai pôle (launch::site_rotation_speed_at). Exécutable depuis la CLI/les liaisons comme type de scénario <c1/> (scenarios/launch-window.toml)

# text
seg-ff2cd766bb52 = Corridor de rentrée balistique (Allen–Eggers)

# text
# c1: reentry
seg-c3f3422f96e4 = Décélération maximale (indépendante du coefficient balistique), vitesse + altitude au pic de g, et vitesse au pic de chauffage pour une entrée balistique en atmosphère exponentielle. Exécutable depuis la CLI/les liaisons comme type de scénario <c1/> (scenarios/reentry.toml)

# text
seg-7b4a8e25c3c9 = Codage et modulation adaptatifs DVB-S2 le long d'un passage de liaison descendante LEO

# text
# c1: acm-link
seg-3912fb8ccb15 = Es/N0 de liaison descendante le long de chaque passage d'un satellite au-dessus d'une station (EIRP, perte en espace libre, perte atmosphérique en loi de cosécante, autres pertes, G/T, constante de Boltzmann, débit de symboles), le MODCOD DVB-S2 le plus efficace qui franchit son seuil de quasi-absence d'erreur du tableau { "13" } de ETSI EN { "302" } 307-1 V1.4.1 plus une marge d'implémentation à chaque pas, le volume de données ACM du passage, et la référence de base à codage constant qui se ferme au masque et à la plus longue distance. Exécutable comme type de scénario <c1/>. Entrées illustratives ; MODELLED.

# text
seg-19603a7e0fe8 = Ordonnancement de contacts sol multi-satellites et multi-stations avec résolution des conflits

# text
# c1: contact-schedule
seg-40edeae6e48b = Contacts candidats issus de chaque passage satellite-station avec son volume de données ACM ; conflits où une antenne servirait deux satellites dans son temps de retournement ou un satellite descendrait vers deux stations à la fois ; un objectif de livraison pondéré par priorité plafonné à l'arriéré de chaque satellite ; un plan glouton à valeur marginale paresseuse, une référence de base premier arrivé et un séparation-et-évaluation exact sur jusqu'à { "26" } candidats, avec l'écart d'optimalité du glouton rapporté. Exécutable comme type de scénario <c1/>. Entrées illustratives ; MODELLED.

# text
seg-3742d2aea62a = Cadrage frugal coût par couverture / ROI

# text
seg-4228311689f8 = Coût par pour cent de couverture + ROI de couverture par euro sur le moteur de dimensionnement de constellation ; le coût par satellite est un encadrement bas/nominal/haut fourni par l'appelant (aucun prix fabriqué)

# text
seg-8ba6ee9acc8a = Impact sur l'intégrité d'une détection manquée (HPL/VPL selon le contexte face à la limite d'alerte)

# text
seg-f5985399d0d5 = Fait correspondre un biais de leurrage/brouillage non détecté à une erreur effective → région de Stanford (disponible/indisponible/MI/HMI) face à des HAL/VAL propres au contexte (ciel dégagé contre urbain)

# text
seg-37d43b5b918a = Fiche de paramètres de modèle d'erreur citée du CAI ({ "13503" })

# text
seg-0b6a901f5ad2 = Performance d'interféromètre à atomes froids encadrée (meilleure/nominale/prudente) — instabilité de biais, marche aléatoire de vitesse/angle, stabilité du facteur d'échelle, cadence d'échantillonnage limitée par l'interrogation, plage dynamique d'ambiguïté de frange — chacune traçable par citation ; alimente QuantumNavBudget sans modéliser le matériel

# text
seg-c93f2d3a3167 = Banc d'essai de respect de la norme d'intégrité de synchronisation — classifieur d'époques du diagramme d'intégrité de Stanford

# text
seg-712d5c35a6a6 = Classification d'époques du diagramme d'intégrité de Stanford TIB (nominal / indisponible / MI / HMI)

# text
seg-573aa0193cb3 = Banc d'essai de respect de la norme d'intégrité de synchronisation — évaluateur de couverture d'intégrité

# text
seg-4d86f3c2d8f5 = Évaluation de couverture d'intégrité TIB (taux HMI/MI/disponibilité + verdict de couverture de surbornage)

# text
seg-372dd0fdb025 = Banc d'essai de respect de la norme d'intégrité de synchronisation — catalogue de défauts (générateurs paramétriques)

# text
seg-2604e7cf27d2 = Menu de défauts TIB (divergence de domaine, claquage d'horloge, marche en holdover, retard statique/incrémental/symétrique/asymétrique, rejeu dans la fraîcheur, sélectif par chemin, quorum k parmi N)

# text
seg-90c0eb1e7c14 = Banc d'essai de respect de la norme d'intégrité de synchronisation — verdict d'absorption de l'indétectable

# text
seg-f713acf042ff = Verdict d'absorption de l'indétectable TIB (symétrique/rejeu doivent être absorbés par le PL, jamais rapportés comme détectés)

# text
seg-8adbbd2cdb74 = Auto-description du rapport hybride optique/RF

# text
seg-2a5e48b558e1 = Le rapport hybrid-optical-rf énonce la configuration de liaison avec laquelle il s'est réellement exécuté (longueur d'onde de la porteuse, ouverture d'émission et de réception, distance, largeur d'impulsion, temps d'intégration, rendements et pertes, valeurs par défaut résolues) et porte un bloc d'unités donnant l'unité et la classe de provenance de chaque grandeur qu'un article est susceptible de citer, y compris les traces de covariance de transfert en mètres carrés

# text
seg-0691f3dee8cb = Disponibilité de la liaison hybride optique/RF côté RF

# text
seg-72ccb655caf0 = Le rapport hybrid-optical-rf énonce une disponibilité de liaison RF, composée à partir de grandeurs que le moteur calcule déjà plutôt qu'à partir d'une climatologie importée, et énonce la composition comme une règle nommée : A_rf = I_closure * I_track, où I_closure est le verdict de fermeture du bilan de liaison unidirectionnel CCSDS-401 / DSN-810-005 (linkbudget::link_budget, marge Eb/N0 >= { "0" }) à la distance propre du scénario et I_track est le verdict de la boucle de poursuite (jamming::lock_status) sur le C/N0 que CE MÊME bilan a rendu. Chaque facteur transporte la classe de provenance de son entrée jusqu'à la sortie, et les facteurs volontairement ABSENTS du produit -- visibilité géométrique, déni par interférence et climatologie des pannes RF -- sont nommés avec la raison plutôt que fixés silencieusement à { "1" }. Le segment RF résolu est repris comme son propre bloc rf_link_configuration, et les chiffres continus à côté de l'indicateur (marge de liaison, marge de C/N0, les distances de fermeture et de poursuite en forme close, et l'utilisation de la distance) sont les inversions en distance du même bilan. Le rapport énonce en toutes lettres, sur le bloc et dans l'entrée d'unités où tombe le lecteur, que ce chiffre est LIMITÉ PAR LA MARGE ET LA GÉOMÉTRIE et DÉTERMINISTE alors que la disponibilité optique est LIMITÉE PAR LA MÉTÉO ET LA CLIMATOLOGIE et probabiliste, de sorte que les deux ne peuvent jamais être cités comme un couple de pourcentages comparables

# text
seg-22c5df9b6c7c = Comparaison de télémétrie optique contre RF à conditions égales

# text
seg-70eb396f40af = Le rapport hybrid-optical-rf émet le rapport de télémétrie optique contre RF avec la configuration UNIQUE à laquelle les deux segments ont été évalués portée dans le même objet : le même trajet unidirectionnel, la même distance et le même temps d'accumulation. Le segment optique est la CRLB de ToA limitée par les photons du moteur sur le nombre de photons unidirectionnel ; le segment RF est la gigue thermique de suivi de code early-late de la DLL du moteur au C/N0 que le bilan de liaison propre du moteur rend pour cette même distance unidirectionnelle. La bande passante de bruit de boucle est dérivée, non choisie : B_L = 1/({ "2" }*integration_s) place le segment RF exactement au temps d'accumulation optique, et si un appelant la remplace de sorte que les deux temps de moyennage divergent, le rapport est REFUSED -- nul, avec l'écart et les deux temps nommés -- plutôt que cité à deux points de fonctionnement. Aucun rapport n'est formé avec le rf_position_sigma_m paramétrique CHOISI du scénario, et le refus dit pourquoi : cette entrée ne porte aucune configuration. Le chiffre phare optique bidirectionnel publié et le facteur exact qui le relie au segment de comparaison unidirectionnel sont émis à côté du rapport, de sorte que le rapport ne peut pas être lu comme portant deux sigmas optiques en désaccord

# text
seg-3f26f598e013 = Auto-description du rapport de bilan de liaison

# text
seg-b88bf41d6d4c = Le rapport de bilan de liaison énonce chaque constante absolue à partir de laquelle sa propre marge a été calculée -- la fréquence porteuse utilisée par la perte en espace libre, l'EIRP, le facteur de mérite, les pertes globales et le terme de Boltzmann -- plus le G/T requis auquel la marge est nulle, la constante de liaison (EIRP - pertes - Eb/N0 requis) qui est la seule combinaison qu'une table publiée de débit/gain puisse jamais fixer, et, lorsqu'un appelant indique une température de bruit du système, le gain d'antenne de réception que ce facteur de mérite implique

# text
seg-a7b192e27cb5 = Table de croisement du temps lunaire par classe d'horloge

# text
seg-cab605dc6ea2 = Une exécution de budget de temps lunaire émet une ligne de croisement horloge-contre-repère par classe d'horloge face à un unique terme de repère partagé, de sorte que l'horloge est la seule variable de la comparaison ; chaque ligne porte le croisement atteint de deux façons -- par bissection à partir de la courbe générale d'erreur temporelle en loi de puissance et par inversion algébrique à partir du type de bruit dominant de la ligne -- avec la différence relative entre eux

# text
seg-18c72a7565d6 = Empreinte de capture en fonction de l'altitude et de la largeur de faisceau

# text
seg-9c30a0ab5233 = Balayage à deux axes de l'empreinte de capture de surface pondérée par le diagramme et limitée par l'altitude sur l'altitude de l'émetteur et le diamètre de la parabole, émis une ligne par point de fonctionnement avec la largeur de faisceau à mi-puissance qu'implique chaque diamètre, et la capture au limbe rapportée comme un SEUIL -- par ligne le J/S au limbe, sa marge et la puissance d'émission qui le fermerait ; par grille les franchissements localisés, ou une indication explicite que le limbe n'est atteint nulle part sur la grille, avec le déficit

# text
seg-fc0a64b9a280 = Reproductibilité du budget d'erreur de temps lunaire

# text
seg-5d5970506b9c = Le scénario de budget de temps lunaire publie ses sorties de type tableau sous forme de table longue (indice de grille, temps de moyennage, terme) à côté du rapport, de sorte que les sept courbes x(tau) par terme et le total en racine de la somme des carrés sont une sortie du moteur plutôt que quelque chose qu'un lecteur reconstruit à partir de la section de méthode

# text
seg-675887733454 = Laboratoire de temps de station lunaire : holdover du miniRAFS face au LTC

# text
seg-7dfedc40da6a = Le bloc facultatif [time_lab] du scénario lunar-time-budget modélise une horloge de station de référence lunaire (par défaut la classe miniRAFS, ou toute classe nommée, ou une fiche d'appareil ajustée sur des points de stabilité énoncés) asservie au temps coordonné lunaire puis en marche libre ou réasservie toutes les N secondes : la courbe d'erreur temporelle x(t) comme racine de la somme des carrés du terme en loi de puissance de l'horloge, d'un résidu d'asservissement constant (ILLUSTRATIF), d'un résidu constant de réalisation du LTC et d'un terme de taux de hauteur de station facultatif ; le temps après un asservissement jusqu'à { "1" }, { "10" } et { "100" } ns (ou des seuils énoncés) par bissection à côté de l'inverse en forme close pour le type de bruit dominant, et le terme dominant à chaque horizon énoncé, le tout avec unités

# text
seg-af3ff120b707 = VLBI géodésique lunaire

# text
seg-cfd7d0126028 = Retard VLBI en champ proche pour une base terrestre observant une balise lunaire + dérivées partielles

# text
seg-e08e98908f3a = Earth-GNSS à distance lunaire

# text
# c1: earth-gnss-lunar
seg-dd8ce373d1f6 = Réception Earth-GNSS à distance lunaire : la couche de signal faible que nomme le tableau { "1" } de P7 et pour laquelle le moteur n'avait aucun modèle. Par satellite et par époque, il calcule l'angle hors de l'axe par rapport au nadir de l'émetteur, si la Terre occulte le trajet direct, la distance oblique et sa perte en espace libre, le gain d'émission à cet angle, la puissance reçue et la densité de porteuse sur bruit ; il agrège ensuite seulement les liaisons qui franchissent un seuil de poursuite, et balaie une révolution complète de la constellation afin que la réponse soit une DISTRIBUTION plutôt qu'un instantané. Trois faits déterminent le résultat et le rapport énonce chacun : la Terre sous-tend { "13.90" } deg depuis le rayon de la constellation, de sorte que le PIC du faisceau est géométriquement indisponible à tout rayon à destination de la Lune ; ce qui reste est le bord du lobe principal et les lobes secondaires, le régime dans lequel LuGRE a opéré à la Lune en { "2025" } ; et la perte de propagation en L1 est d'environ { "208" } dB, quelque { "25" } dB de plus que ce que paie un utilisateur terrestre. MESURÉ sur la géométrie intégrée de classe GPS à 24 satellites sur { "64" } époques d'une période orbitale : disponibilité du SIGNAL { "0.375" } avec une meilleure liaison de { "30.93" } dB-Hz, et disponibilité de la SOLUTION { "0.000" } - au plus deux liaisons poursuivables simultanées, jamais les quatre qu'exige une position. La séparation de ces deux disponibilités est le point essentiel, et le rapport refuse de les laisser confondre : Earth-GNSS à distance lunaire est une couche de qualité SYNCHRONISATION, non de qualité position, et un a priori de résilience en couches doit prendre la disponibilité de la solution. Le conditionnement est émis pour la même raison - chaque satellite visible se trouve dans un cône large de quelques degrés vu depuis la Lune, de sorte que les lignes de visée sont quasi parallèles par construction. Exécutable comme type <c1/> Reformulé selon D7 : l'affirmation à distance lunaire porte sur la densité de porteuse sur bruit RELATIVE entre satellites à une même époque, à partir de diagrammes d'émission bidimensionnels mesurés (NAVCEN Block IIR/IIR-M), plus la visibilité géométrique ; le C/N0 absolu n'est pas revendiqué (Parker et al. rapportent une perte commune de { "7" } à { "12" } dB).

# text
seg-29df5b40a3f9 = Détermination d'orbite lunaire : Earth-GNSS contre radiométrie au sol

# text
seg-647902ebcee3 = Détermination d'orbite sur une orbite en halo quasi rectiligne (ou une orbite gelée elliptique) à partir de deux types de données indépendants : pseudodistances Earth-GNSS reçues à bord (la règle de liaison de la ligne Earth-GNSS à distance lunaire, plus l'occultation par la Lune) et distance et vitesse radiale bidirectionnelles au sol depuis trois stations du Deep Space Network. Chacune est un lot de moindres carrés à un pas autour de l'orbite de référence avec sa covariance formelle ; une simulation Monte Carlo avec graine de la différence entre les deux estimations teste si les deux covariances l'expliquent (q = d' (P_G + P_R)^-1 d, khi-deux à six degrés de liberté lorsque les modèles concordent) et ce qu'une accélération non modélisée fait à la statistique.

# text
seg-652bdc29deea = Résolution d'ambiguïté de phase de porteuse lunaire : surface et orbiteur

# text
seg-02496f9e9af2 = Phase de porteuse et code Earth-GNSS en simples différences entre récepteurs à une station de surface lunaire et à un orbiteur, avec la différence d'horloge par époque éliminée par profilage, une ambiguïté par passage continu et le plus long passage comme jauge. La covariance d'ambiguïté flottante est un complément de Schur ; LAMBDA résout les entiers, le taux d'amorçage est rapporté à côté d'un taux de réussite des moindres carrés entiers par Monte Carlo avec graine et des sigmas de position flottante et fixée. Rapporté tel que trouvé : au gain enregistré de { "12" } dBi le problème des doubles différences n'est pas formable (l'amendement { "1" } a déplacé la valeur par défaut à { "25" } dBi après que seuls des décomptes de disponibilité ont été vus), et à { "25" } dBi la fixation d'entiers n'est PAS atteinte - hors de portée (quelques pour cent au plus) bien que la solution flottante s'améliore avec l'arc.

# text
seg-11dd1bb8e4e1 = Co-estimation du repère lunaire : stations de surface et orbiteurs

# text
seg-a38c8d95e6c9 = Information de Fisher du datum de repère lunaire à sept paramètres à partir de la télémétrie laser de stations terrestres vers les cinq réflecteurs seule et avec des distances orbiteur-station de surface ajoutées : la matrice d'information, le rang, les sigmas de Cramer-Rao, la métrique de dégénérescence du module d'identifiabilité lunaire et des ensembles de stations aléatoires avec graine. L'orbite est tenue pour connue dans les axes lunaires (son erreur est portée par le sigma de distance de l'orbiteur).

# text
seg-862977c4bb01 = Précision de rattachement de repères par liaison spatiale : GNSS, VLBI et télémétrie laser colocalisés

# text
seg-a9ae8e99f00d = Précision de Cramer-Rao des décalages de translation, d'échelle et de rotation inter-techniques entre repères GNSS, VLBI et télémétrie laser lorsqu'un seul vaisseau spatial porte les trois, avec la position du vaisseau éliminée à chaque époque et neuf paramètres de nuisance de rattachement local portant un a priori, balayés sur la précision du rattachement local. Covariances par la voie de la racine carrée (les équations normales perdent les chiffres lorsque les techniques sont presque parfaites).

# text
seg-ae627996875e = Sensibilité aux nombres de Love et à la libration lunaires

# text
seg-28780d07c4a7 = Information de Fisher de h2, k2, l2 et des amplitudes de libration physique à partir de la télémétrie laser (déplacement de marée radial et horizontal, rotation des réflecteurs), du suivi d'orbiteur (l'accélération k2 de degré 2 intégrée le long de la ligne de visée, tendance retirée), d'un gravimètre de surface (facteur gravimétrique { "1" } + h2 - { "1.5" } k2) et d'une horloge de surface (taux fractionnaire ({ "1" } + k2 - h2) W2/c2, lié aux constantes du temps lunaire). Les valeurs nominales de h2 et l2 sont des points de linéarisation ; l'étude dit ce qui est sensible à quoi, non ce que valent les nombres.

# text
seg-da712b740519 = Augmentation du DOP par balises de surface lunaire

# text
# c1: lunar-beacon
seg-83e6341e01b1 = Dilution de précision augmentée par balises pour un utilisateur de surface lunaire : les lignes de ligne de visée des satellites visibles et les lignes de télémétrie des balises de surface visibles sont concaténées en une seule matrice de conception et évaluées par le noyau DOP partagé, et le DOP obtenu est converti en précision réalisée à 1 sigma EN MÈTRES par une erreur de télémétrie équivalente utilisateur par balise assemblée comme la racine de la somme des carrés des termes de synchronisation d'horloge, de multitrajet et de levé. La visibilité d'une balise est l'horizon géométrique à deux hauteurs d'une Lune sans atmosphère, qui n'a pas d'extension réfractive et est donc exact plutôt qu'approché. Exécutable comme type de scénario <c1/>, qui rapporte les satellites seuls, les satellites plus les balises, et une constellation plus grande comme voie concurrente vers la même géométrie. MESURÉ sur la géométrie d'or intégrée (utilisateur à -80 deg, trois balises relevées, LCNS illustratif à six satellites à t={ "0" }, masque de { "5" } deg) : { "5" } satellites visibles donnent un PDOP de { "9.6941" } et un 1-sigma 3-D de { "11.222" } m ; ajouter les balises qui franchissent réellement l'horizon donne un PDOP de { "4.1160" } et { "4.765" } m, un facteur de { "2.355" } ; le service à 24 satellites donne plutôt un PDOP de { "2.4226" } et { "2.804" } m, un facteur de { "4.002" }. Le rapport imprime le nombre de balises VISIBLES plutôt que le nombre configuré, et sur cette géométrie UNE SEULE des trois balises franchit l'horizon : les deux sites latéraux se trouvent à environ { "333" } km de l'utilisateur pour un horizon de { "86" } km avec une antenne de { "2" } m, de sorte qu'un lecteur n'est jamais laissé à supposer que les trois ont contribué

# text
seg-845e9f5eec81 = Niveau de protection en mode commun et enveloppe d'intégrité totale

# text
seg-e4ec41d0f5e1 = Observabilité d'une station lunaire absolue (défaut de datum)

# text
seg-b3e4160042d2 = Observabilité par information de Fisher de la résolution lunaire conjointe : sans lignes de base terrestres, le datum du référentiel absolu se trouve dans l'espace nul de HᵀWH (la position de la station est inobservable) ; ≥{ "3" } lignes de base rétablissent le rang plein et bornent l'erreur de Cramér–Rao de la station, que l'estimateur atteint

# text
seg-2ed7181c97dd = Génération des codes d'étalement LunaNet AFS (LSIS V1.0)

# text
seg-13ff6c381275 = Les codes de l'Augmented Forward Signal de LSIS V1.0 ({ "29" } janvier { "2025" }) : le code primaire AFS-Q de 10230 chips généré à partir de la construction du pilote L1C d'IS-GPS-800 avec les indices d'IS-GPS-800J (les mêmes { "210" } affectations qu'imprime l'annexe D de LSIS), les codes de Gold AFS-I de 2046 chips générés à partir de g1 = x^{ "11" } + x^{ "2" } + { "1" } et g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" } avec le retard G2 de chaque PRN retrouvé dans le fichier de l'annexe { "3" } de la norme, les quatre codes secondaires, les codes tertiaires de 1500 chips, l'affectation des nœuds du tableau { "11" } provisoire et le code pilote hiérarchisé. Le contenu de LSIS est lu à l'exécution depuis un cache local vérifié par SHA-256, rempli à partir du PDF hébergé par la NASA, et jamais redistribué

# text
seg-56c7aeac59c1 = Décodabilité en boucle fermée de LunaNet AFS par un récepteur indépendant (LSIS V1.0)

# text
seg-da2d29d437b0 = Un enregistrement AFS de Kshana acquis, poursuivi et décodé par un récepteur logiciel indépendant, et comparé aux étiquettes de vérité propres à l'enregistrement. Cela ne prouve que le respect de la norme et la cohérence des étiquettes ; ce n'est pas une affirmation sur la physique du canal, la propagation, la puissance reçue ou les bilans de liaison, dont les valeurs dans l'enregistrement sont des entrées choisies

# text
seg-780369fb9a54 = Concordance inter-générateurs du GPS L1 C/A

# text
seg-ee47b60515f1 = Codes d'étalement GPS L1 C/A (sdr::CaCode) et sous-trames LNAV 1-3 (gps_lnav : quantification des champs d'IS-GPS-200 avec le pi de la spécification, mise en paquets en complément à deux, mots TLM et HOW, parité du tableau 20-XIV avec inversion D29*/D30*, bits de résolution de parité des mots { "2" } et { "10" }) comparés bit à bit avec gps-sdr-sim sur son brdc0010.22n fourni ({ "32" } satellites)

# text
seg-bf429c8f00fb = Acquisition IQ GNSS sur des échantillons I/Q générés de façon indépendante

# text
seg-9a0c52bfb06e = iq::acq::acquire (recherche parallèle de phase de code par FFT avec le seuil de Marcum-Q à loi quadratique) avec la réplique GpsL1Ca, sur { "20" } ms de la propre sortie I/Q 8 bits de gps-sdr-sim décodée par le décodeur d'échantillons iq::io (ci8, { "2.6" } MHz, { "11" } satellites, sans bruit) : chaque PRN de { "1" } à { "32" } recherché dans deux fenêtres de { "10" } ms, le résultat comparé à la phase de code et au Doppler modulés par gps-sdr-sim

# text
seg-f40dc3dac990 = Moniteurs IQ évalués dans des campagnes de rejeu en laboratoire : détections, non-détections, fausses alarmes et chiffres de fausses alarmes en forme close

# text
seg-93fb3109728c = iq::campaign::detect et l'exécuteur de campagne : une table [monitors] facultative fait tourner les moniteurs IQ sur chaque cellule dans l'unique passe de l'exécuteur. Les moniteurs de puissance et de spectre voient les échantillons après chaque chaîne de front-end ; les moniteurs de C/N0, de SQM et de verrouillage voient les mises à jour de boucle de chaque canal poursuivi. Chaque alarme est évaluée par rapport aux événements indiqués : détecté ou manqué par (événement, type d'alarme, canal), délai de détection, et fausses alarmes hors des événements rapportées à leur exposition. Le chiffre de fausses alarmes en forme close de chaque test est indiqué : puissance par bloc (queue Gamma exacte), excès spectral par bloc (approximation), kurtosis (gaussienne unilatérale), impulsions (plafond binomial), SQM par mise à jour moyennée (2Q(k) = Q(1/2, k^2/2), nouveau), et ARL0 du CUSUM de C/N0 (Siegmund). Sans la table, les cellules, les clés et les empreintes sont inchangées. Aucune forme d'onde d'interférence n'est synthétisée

# text
seg-5b7eb7ddb474 = ROC de détection des moniteurs IQ issue d'une campagne de rejeu en laboratoire évaluée

# text
seg-57fe85965c9c = iq::campaign::detect (windows, roc) et iq::campaign::report::rocs : chaque cellule d'une campagne avec moniteurs conserve, par type d'alarme et par canal, le maximum de la propre statistique de test du moniteur sur chaque fenêtre d'événement indiquée (positif) et sur des fenêtres roc_window_s juxtaposées hors des événements (négatif). Les statistiques sont l'écart de puissance de bloc, l'excès de DSP, le kurtosis z, le |z| SQM de la métrique moyennée, et le CUSUM de C/N0. Le rapport les regroupe par type dans une ROC empirique au niveau des fenêtres, avec son AUC et le point de fonctionnement au seuil configuré, écrite dans roc.json (kshana.campaign-roc/1) et une section ROC de détection de report.html. Une campagne sans moniteurs n'écrit ni l'un ni l'autre

# text
seg-3a3cfa322f01 = Étalonnage des modèles de C/N0 et de verrouillage du récepteur ouvert sur les résultats de campagnes IQ, avec erreur de prédiction indiquée

# text
# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) et <c1/> sur <c2/>, le <c3/> Python et l'outil MCP labfit (dossiers de campagne à l'intérieur de son seul répertoire de travail) : lit un dossier de sortie <c4/> par son DIGEST et regroupe les cellules évaluées en unités d'ajustement (signal x conception de boucle x chaîne de front-end x type de brouilleur, jamais regroupées). Par unité, il ajuste le C/N0 mesuré en fonction du J/S indiqué avec la forme de séparation spectrale. Q_eff n'est pas identifiable à partir des données de C/N0 sans une mesure indépendante des puissances du brouilleur et du signal, de sorte que Q est indiqué, jamais ajusté (le tableau des types, le q de l'événement, ou, pour un type inconnu, la valeur indiquée la plus défavorable, cw Q = { "1" }). Le paramètre ajusté est le décalage identifiable delta_eff = delta - { "10" } log10 Q, la garde de corrélation signalant la dégénérescence. Les classes de C/N0 verrouillées à moins de { "90" } % sont censurées et listées. Le J/S de seuil est donné directement et par la forme close ; les modèles de boucle de poursuite et de verrouillage empirique sont couplés par le modèle de C/N0, avec des durées de décrochage et de reverrouillage. Un bootstrap par grappes à graine fixée sur les enregistrements ({ "1000" } réplicats) donne des intervalles percentiles ; les intervalles de prédiction à { "90" } % viennent de tirages des résidus ; les jeux réservés par exclusion d'un enregistrement à la fois sont répartis en interpolation et extrapolation ; une table [validation] préenregistrée est hachée et chaque seuil est jugé PASS/FAIL. Rapport kshana.labfit-iq/1 en JSON, CSV et Markdown généré, avec un bloc d'unités. Synthétique seulement (aucun enregistrement tiers, aucune forme d'onde de brouilleur). Le chemin labfit à partir du journal du récepteur est inchangé

# text
seg-9537d301c95e = Encodage GPS LNAV décodé par une bibliothèque de récepteur indépendante

# text
seg-909415621881 = Les sous-trames LNAV 1-3 de Kshana (gps_lnav::encode_subframes) pour les { "32" } éphémérides brdc0010.22n fournies à decode_word et decode_frame de RTKLIB : parité de chaque mot, décodage des sous-trames avec émission cohérente des données, et chaque paramètre décodé comparé à l'entier de Kshana et à la valeur d'entrée

# text
seg-f66855e35c53 = Encodage du message de navigation GPS LNAV

# text
seg-8caf8366e2f8 = Sous-trames LNAV 1-3 d'IS-GPS-200 (gps_lnav::encode_subframes : quantification à l'arrondi au plus proche de chaque paramètre d'horloge et d'orbite aux facteurs d'échelle et à la valeur de pi de la spécification, mise en paquets en complément à deux, mots TLM et HOW, parité du tableau 20-XIV avec inversion D29*/D30*, bits de résolution de parité des mots { "2" } et { "10" }), le message qu'émet un générateur de signal GPS L1 C/A

# text
seg-c5c944357643 = Acquisition et estimation du C/N0 sur de l'IQ lunaire réel

# text
seg-f5dcb5e06bf4 = Recherche parallèle de phase de code (acquisition::pcps_acquire : FFT portable, repliement cohérent, accumulation non cohérente, seuil du khi-deux pour une probabilité de fausse alarme sur toute la recherche), affinement, corrélation prompt en boucle ouverte avec Doppler de code et estimateur de C/N0 M2M4, exécutés sur les lots IQ L1 à 4 bits de LuGRE lus par realdata::ion_sdr

# text
seg-709626569a5c = Acquisition sur de l'IQ lunaire réel face au Doppler prédit par l'orbite (décision par puissance d'échantillon)

# text
seg-784ebd80c425 = acquisition::pcps_acquire avec sa décision par puissance d'échantillon sur les neuf lots L1 LuGRE hors surface à niveaux mid-rise ; différences de Doppler entre satellites acquis comparées aux différences prédites à partir des orbites finales de l'ESA et de la trajectoire de Blue Ghost reconstruite par Firefly

# text
seg-89875d67b253 = Acquisition sur de l'IQ lunaire réel évaluée par le Doppler prédit par l'orbite

# text
seg-956bcfeaf319 = acquisition::pcps_acquire avec la décision à moyennage de cellules (pic sur la cellule moyenne de la grille, robuste au bruit à bande limitée) sur les neuf lots L1 LuGRE hors surface à niveaux mid-rise ; différences de Doppler entre satellites acquis comparées aux différences prédites à partir des orbites finales de l'ESA et de la trajectoire de Blue Ghost reconstruite par Firefly

# text
seg-8fa779dd1788 = Acquisition sur de l'IQ lunaire réel réservé face au Doppler prédit par l'orbite

# text
seg-484868771231 = acquisition::pcps_acquire (décision à moyennage de cellules, probabilité de fausse alarme { "1e-7" }) avec refine_doppler_coherent sur les lots L1 LuGRE enregistrés à la surface lunaire (I dans le quartet haut, niveaux mid-rise) ; différences de Doppler entre satellites acquis face aux différences prédites à partir des orbites finales de l'ESA et du noyau du site d'atterrissage de Firefly

# text
seg-10af60b488b9 = Station de référence différentielle de classe NovaMoon : annulation du mode commun + résidu croissant avec la ligne de base + niveaux de protection DGNSS

# text
seg-c04a3591074c = Export d'interopérabilité lunaire

# text
seg-91f4a066b3c0 = Export de référentiel, de temps et d'éphéméride lunaires aligné sur LunaNet/IOAG (CCSDS OEM + KIF) avec aller-retour de vérification

# text
seg-8ab65cbefb75 = Notation alignée sur des cadres de résilience PNT

# text
seg-c48198f31d63 = Sous-scores par dimension sur les sept catégories de résilience propres à Kshana (et non les termes du DHS), les fonctions RDRR de RethinkPNT et les critères de Yang, chacun étiqueté modélisé avec son facteur déterminant ; niveau RPCF provisoire avec une porte de dégradation bornée. Auto-évaluation issue de la simulation, jamais une certification.

# text
seg-d7bdb6fe186e = Étude d'instabilité de décision du score de résilience

# text
seg-5fcf18a68bb1 = Quantifie comment un score composite unique / un niveau RPCF réordonne les architectures sous un simplexe de pondération défendable et un ensemble de menaces (taux d'inversion du top-1, dispersion du tau de Kendall, taux d'inversion de niveau, plages de rangs) ; analyses déclaré-contre-mesuré et d'effondrement de la diversité.

# text
seg-1bf03544a010 = Représentativité de la démonstration et écarts avant le vol

# text
seg-db24d16d38c9 = Registre d'honnêteté par résultat qualifiant une sortie de démonstration : ses ancrages externes, ses hypothèses modélisées, ses écarts avant le vol et sa fourchette TRL représentative, avec des invariants imposés (validé exige un ancrage externe ; modélisé exige un écart et ne peut pas prétendre au-delà du TRL { "4" }).

# text
seg-52ab936eb5f5 = Preuves de compromis quantique contre classique (forme commune)

# text
seg-a6679ed5bed7 = Un objet TradeEvidence reproductible (cadre fixe : scénario+graine+moteur ; valeurs quantique-contre-classique communes par FoM, avec un bénéfice à la polarité correcte, un IC à { "95" } % facultatif, une étiquette validé/modélisé) portant un enregistrement de représentativité, de sorte que chaque filière quantique-PNT rapporte le compromis de la même façon honnête.

# text
seg-20fee61b3107 = Bibliothèque de modèles d'erreur de dispositifs quantiques

# text
seg-e42eabe9bc2a = Fiches de dispositifs (horloges optique/à ions piégés/à ions mercure + horloges classiques réutilisées de holdover/clock_state ; interféromètre à atomes froids ; liaisons de transfert de temps classique + à intrication/photon unique), chacune portant un enregistrement de représentativité ; la liaison à intrication ajoute un modèle de précision temporelle limitée par le bruit de grenaille (~gigue/sqrt(R*tau), pénalité de coups d'obscurité, plancher systématique).

# text
seg-86d71fd89f26 = Temps quantique de confiance (transfert de temps + diffusion sécurisée + anomalie)

# text
seg-d2a3d37825ef = Chaîne de transfert de temps quantique contre classique de bout en bout (marche libre de l'horloge + précision de liaison en quadrature), un niveau de protection de synchronisation réutilisé, une FoM de sécurité contre les attaques par retard/rejeu (1-P_md) et une probabilité de détection d'anomalie d'horloge + latence CUSUM, émis comme TradeEvidence honnête avec un enregistrement de représentativité.

# text
seg-eaf341ff4522 = Navigation quantique sans GNSS

# text
seg-908a44a9f7c7 = Navigation à l'estime quantique (interféromètre à atomes froids) contre INS classique de qualité navigation lors d'une panne GNSS : croissance de l'erreur de position, holdover jusqu'à un seuil de position, et compromis quantique-contre-classique comme TradeEvidence honnête ; note d'observabilité honnête (biais inobservable sans point fixe, donc l'erreur croît).

# text
seg-914132833f5a = Détection de défauts/anomalies pour les systèmes PNT quantiques

# text
seg-f20392820b9d = Catalogue de défauts quantiques étiquetés (horloge : saut de fréquence/dérive/perte de verrouillage ; capteur : saut de biais/perte de données), une AUC ROC de la statistique de détection avec un IC par bootstrap, et un défaut minimal détectable à un taux de fausses alarmes fixé ; un moniteur assisté par horloge quantique détecte des défauts plus petits qu'un moniteur classique, émis comme TradeEvidence honnête.

# text
seg-d31be81dfd8f = Géolocalisation passive d'émetteur par TDOA/FDOA

# text
seg-aa870cee16f6 = Localiser un émetteur (brouilleur/leurreur, ou source opportuniste pour du PNT inversé) à partir de la différence de temps d'arrivée sur un réseau de récepteurs — l'intersection d'hyperboloïdes τᵢ=(Rᵢ−R₀)/c résolue par moindres carrés de Gauss–Newton — et, en ajoutant la différence de fréquence d'arrivée (différences de vitesse radiale) avec des récepteurs mobiles, retrouver conjointement position et vitesse ; avec la borne inférieure de Cramér–Rao sur la covariance de position à partir de la géométrie des mesures

# text
seg-5bd3882531b6 = Échauffement convectif d'entrée au point d'arrêt (Sutton-Graves) sur une entrée à 3 DDL

# text
seg-4f97036ed72f = Flux thermique convectif au point d'arrêt q = k sqrt(rho/R_n) V^{ "3" } avec les constantes de Sutton-Graves pour l'air terrestre et l'atmosphère de Mars (NASA TR R-376, { "1971" }), son maximum et la charge thermique intégrée le long d'une entrée à 3 DDL, balistique ou portante à inclinaison constante, sur Terre ou sur Mars.

# text
seg-1b96577665fc = Radiométrie d'imageur électro-optique, FTM, réponse de bord relative et NIIRS GIQE { "4" }

# text
# c1: eo-radiometry
seg-38902593e841 = Budget de rapport signal sur bruit d'un imageur au nadir (luminance de scène lambertienne, équation de la caméra, bruits de grenaille, d'obscurité, de lecture et de quantification), la FTM du système à Nyquist comme produit de la diffraction d'ouverture non obstruée, de l'ouverture du détecteur, du filé linéaire et de la gigue gaussienne, la réponse de bord et la réponse de bord relative intégrées à partir de cette FTM, Q = lambda F / p, et la NIIRS GIQE version { "4" } sans compensation de FTM. Exécutable comme type de scénario <c1/>.

# text
seg-07ca77a67207 = Pertes de gravité, de traînée, de pilotage et de contre-pression à l'ascension d'un lanceur

# text
# c1: ascent-losses
seg-7a1802cf2c80 = Ascension plane en virage gravitationnel d'un véhicule multi-étage au-dessus d'une Terre sphérique non tournante à travers l'atmosphère standard américaine { "1976" } (densité et pression), avec un coup de tangage, une poussée réduite par la contre-pression à la tuyère, des extinctions d'étage aux limites exactes de pas, et les pertes de gravité, de traînée, de pilotage et de contre-pression intégrées à côté de l'état. Exécutable comme type de scénario <c1/>.

# text
seg-55e8345def8b = Équation bidirectionnelle TWSTFT, budget d'incertitude et stabilité de liaison avec non-réciprocité de scintillation et diurne

# text
# c1: time-transfer-budget
seg-5ca5226c24ec = L'équation bidirectionnelle TWSTFT résolue pour T_A - T_B avec les retards d'émission et de réception des stations, l'asymétrie ionosphérique montante/descendante en bande Ku, la différence de retard des transpondeurs et les termes de Sagnac, face à son modèle direct exact ; un budget d'incertitude en quadrature avec la TDEV de liaison comme terme de type A ; une série bidirectionnelle avec bruit de phase blanc et de scintillation (Kasdin-Walter), une non-réciprocité diurne et un résidu de réciprocité constant ; et la pente, le RMS résiduel, la TDEV et l'ADEV de séries d'horloge de station fournies au format Circular T, MJD-CSV ou RINEX IGS. Exécutable comme type de scénario <c1/>.

# text
seg-2f9be02c92bc = Numérique de l'atmosphère optique en trajet oblique : variance de Rytov, scintillation, probabilité d'évanouissement gamma-gamma, moyennage d'ouverture, épaisseur optique des nuages et de l'air clair

# text
# c1: optical-atmosphere
seg-032cf76c2ec0 = Cn2 de Hufnagel-Valley intégré le long d'un trajet oblique pour la variance de Rytov en onde plane et sphérique (liaison montante et descendante), l'indice de scintillation d'Andrews-Phillips et les paramètres gamma-gamma, la probabilité d'évanouissement gamma-gamma et la marge d'évanouissement, le facteur de moyennage d'ouverture en turbulence faible, l'épaisseur optique nuageuse d'une colonne d'eau liquide et l'épaisseur optique d'air clair de Kim (visibilité) plus Rayleigh, remplaçant la perte atmosphérique globale du bilan de liaison optique lorsqu'une atmosphère est fournie. Exécutable dans le type de scénario <c1/>.

# text
seg-a2faab92e760 = Disponibilité d'un site optique au sol dépendant de la météo et diversité de sites corrélée à la distance

# text
# c1: optical-atmosphere
seg-7f4e4e763d62 = Disponibilité d'une liaison optique face à une marge de liaison indiquée à partir d'un climat log-normal d'eau liquide nuageuse (quantité ITU-R P.840, extinction en optique géométrique) et de l'évanouissement de turbulence gamma-gamma indépendant, la marge de liaison nécessaire pour des disponibilités cibles et le plafond qu'aucune marge ne relève, des durées d'indisponibilité log-normales, des scénarios hypothétiques de techniques d'amélioration, et une disponibilité de réseau à copule gaussienne à un facteur dont la corrélation de paire est exp(-distance/longueur de décorrélation). Exécutable comme type de scénario <c1/>.

# text
seg-043ece801e72 = Continuité de synchronisation et de télémétrie lors des coupures optiques

# text
# c1: optical-atmosphere
seg-bb9cb3fe4180 = La distribution des durées de coupure d'un site optique couplée à la variance de marche libre en forme close du modèle de holdover d'horloge : erreur de synchronisation et de télémétrie à des quantiles de coupure indiqués, le holdover jusqu'à un seuil de synchronisation, la fraction des coupures et du temps de coupure qui y reste et la disponibilité de synchronisation A + U E[min(D, T_h)]/E[D], pour les classes d'horloge classique et quantique. Exécutable dans le type de scénario <c1/>.

# text
seg-b119df65d2a7 = Marge de liaison optique dans le temps : une réalisation à graine fixée de la météo d'un site

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-06125f3cae90 = Une table <c1/> facultative (durée, pas, graine) fait écrire aussi au type <c2/>, par site, une réalisation à graine fixée du modèle de site indiqué dans le temps : épisodes nuageux (éclaircies exponentielles, coupures nuageuses log-normales de moyenne et dispersion indiquées, la part de temps sous nuage fixée à la probabilité de nuage indiquée), une colonne d'eau liquide log-normale par épisode nuageux, un échantillon de scintillation gamma-gamma par pas, et à partir d'eux la marge de liaison, les évanouissements dus aux nuages et à la scintillation et l'indicateur de liaison active, avec la disponibilité réalisée, la fraction nuageuse, le nombre de coupures et la plus longue coupure. Sans la table, le résultat est le document { "0.37" }. Les tirages passent par les routes portables de distribution et de calcul, de sorte que natif et wasm32 donnent les mêmes octets.

# text
seg-58cbf576c959 = Lecteur de fichiers de données d'orbite TRK-2-18 et modèle Doppler à rampe à 2 voies pour Mars

# text
seg-d1055650a77f = Un lecteur de fichiers de données d'orbite DSN (TRK-2-18) : les groupes d'enregistrements de 36 octets (étiquette de fichier, identifiant, données d'orbite, rampes par station, décalages d'horloge, résumé, fin de fichier), et dans chaque enregistrement de données d'orbite l'étiquette de temps depuis { "1950" }, les retards descendants et montants, l'observable, les stations, le type de données, les bandes, la validité, le canal, l'engin spatial, la fréquence de référence sur 46 bits et le temps de compression ; heures de début et de fin, taux et fréquences de départ des rampes. Par-dessus, un modèle Doppler à rampe à 2 voies en bande X (rampes montantes intégrées, temps de lumière aller-retour avec Shapiro et troposphère, stations DSN par la chaîne CIO IAU 2006/2000A et les EOP de l'IERS, temps de station) et une détermination d'orbite par lots d'un orbiteur martien (champ GMM-3, tiers corps, SRP, traînée).

# text
seg-455dc946c965 = Estimation d'attitude par EKF multiplicatif à partir d'un gyroscope et d'un viseur d'étoiles

# text
# c1: aocs
seg-553d043438b4 = L'EKF multiplicatif de Lefferts-Markley-Shuster : états d'erreur d'attitude dans le repère du corps et de biais du gyroscope, propagation avec la vitesse du gyroscope moins l'estimation du biais et le bruit de processus discret de Farrenkopf (marche aléatoire d'angle et de vitesse), mises à jour du viseur d'étoiles avec le résidu { "2" } vec(q^-1 q_st) sous forme de Joseph, et la réinitialisation multiplicative ; un simulateur discret de Farrenkopf du gyroscope et du viseur d'étoiles. Le type <c1/> peut fermer la boucle de commande sur son estimation.

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
seg-43cd7aa7ab53 = Brouillage RF de la navigation de surface lunaire (J/S par satellite)

# text
# c1: jamming
# c2: lunar-jamming
seg-e0566f37ad8f = Rapport brouilleur sur signal propre à la Lune, C/N₀ effectif et perte de verrouillage pour un utilisateur de surface sélénographique sous un brouilleur à la surface lunaire (ou surélevé), sur la constellation illustrative de classe Moonlight/LCNS à sources publiques. Compose la chaîne de brouillage ouverte (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) avec la géométrie de ciel lunaire ouverte (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf) ; aucune géométrie ni radiométrie n'est redérivée. Contrairement au type terrestre <c1/>, la branche signal n'est pas une puissance reçue fixe : la puissance isotrope reçue de chaque satellite est sa propre PIRE de bilan de liaison − FSPL(distance oblique), de sorte que le J/S varie d'un satellite à l'autre avec la distance et l'élévation lunaires. Émet UNE LIGNE PAR LIAISON (époque, satellite) VISIBLE en JSON et sous forme d'artefact *.table.csv, avec les deux puissances reçues dont le J/S est la différence imprimées à côté ; les chiffres de mérite agrégés figurent à côté de ce tableau, jamais à sa place. Exécutable comme type de scénario <c2/>

# text
seg-4c116e25c5c5 = Contour de déni lunaire avec une bande d'incertitude issue de la dispersion mesurée du C/N₀

# text
# c1: lunar-jamming
# c2: denial
seg-77828c25f3ab = Le rapport <c1/> ne fonde plus son contour de déni sur un seul scalaire. Il émet la distribution complète mesurée du C/N₀ du signal utile sur le tableau par satellite — n, min, p05, p25, médiane, p75, p95, max, moyenne, écart type d'échantillon, et l'asymétrie propre à l'échantillon (p95 − médiane) − (médiane − p05) — à côté des lignes par liaison, qui sont inchangées. Le contour est ensuite rapporté à chacune de ces statistiques d'ordre selon LES DEUX critères de déni que reconnaît le moteur, jamais l'un à la place de l'autre : le critère en vigueur de rapport de puissance (J/S = { "30" } dB, le même seuil qu'utilisent attack_surface et tracking_loop, et le critère derrière la colonne <c2/> du tableau publié de brouillage de liaison lunaire), et le critère de perte de verrouillage (le C/N₀ effectif tombant à tracking_threshold_dbhz), qui est le critère avec lequel la propre colonne links[].status de ce rapport est évaluée. Chaque point du contour est donné sur les deux axes du plan de déni — la PIRE de brouilleur requise à la distance du scénario, et la distance de déni à la PIRE du scénario — de sorte que la bande est un intervalle sur les mêmes axes que ceux d'un tracé de contour. Les bords de la bande SONT contour(p05) et contour(p95) : la même application en forme close appliquée aux quantiles propres de l'échantillon, non un sigma ajusté à l'échantillon et non médiane ± k·écart type, et le rapport le dit dans une chaîne band_definition à côté des nombres. L'écart type est émis par continuité et n'est utilisé par rien. Un quantile dont le C/N₀ est déjà au niveau du seuil de poursuite ou en dessous n'a aucun J/S de déni fini ; ces colonnes sont émises comme null avec une raison comptée plutôt que comme un infini ou un rayon écrêté

# text
seg-2d3944107ba0 = Puissance de détection du moniteur d'intégrité intermodalités

# text
seg-38bc7c0bfe57 = Le rapport hybrid-optical-rf indique ce que le moniteur du khi-deux intermodalités peut réellement DÉTECTER, et pas seulement qu'il réussit sur un cas sans défaut : le biais minimal détectable par axe surveillé (est, nord, haut, horloge) aux probabilités de fausse alarme et de détection manquée indiquées par le scénario, la courbe de puissance de détection de part et d'autre, le multiple de biais sans bruit auquel la statistique réalisée franchit pour la première fois le seuil, et le délai de détection pour une rampe de biais à une vitesse indiquée. Des défauts sont aussi injectés à travers le vrai moniteur et la statistique qu'il renvoie est rapportée à côté de la prédiction analytique

# text
seg-38cabd4921c1 = Recroissance de la covariance après transfert face à la limite d'alerte

# text
seg-9287268bbada = Le rapport hybrid-optical-rf expose le modèle de bruit de processus du filtre et indique combien de temps la solution après transfert reste dans la limite d'alerte : pour les deux sens de transfert, il porte la covariance par axe que le transfert a laissée, la propage vers l'avant sous un bruit de processus à marche aléatoire indiqué, et rapporte l'instant où le 1σ mis à l'échelle de la couverture atteint les limites d'alerte horizontale, verticale et de synchronisation, la limite qui est atteinte en premier, la constante de temps de doublement de la variance, et un profil de marche libre échantillonné qui encadre le franchissement. Les DSP de bruit de processus, le facteur de couverture et les limites d'alerte sont tous des entrées avec des valeurs par défaut documentées

# text
seg-a3b8272862aa = Diagramme d'antenne hors axe dans l'export de géométrie lunaire

# text
seg-27d246503a48 = L'export de géométrie par satellite porte, par (époque, satellite), l'angle hors axe AU SATELLITE et le gain d'émission vers le site issu du vrai diagramme (d'Airy) d'ouverture circulaire à éclairement uniforme, et rapporte le nombre de satellites dans le faisceau sous ce diagramme À CÔTÉ du nombre sous l'approximation symétrique gain-largeur de faisceau (θ_3dB[deg] = √(31000/G_lin)), la différence étant émise comme correction explicite dans links, en satellites par époque, et comme pire époque isolée. Les deux rendements d'ouverture implicites de l'approximation sont émis ({ "0.641" } face à la règle de { "70" }·λ/D degrés avec laquelle elle est citée, { "0.920" } face à une ouverture circulaire uniforme), de sorte que le rendement qu'elle suppose en silence est indiqué plutôt que déduit. Désactivé par défaut : le bloc n'apparaît que lorsqu'un site d'export et une ouverture sont tous deux donnés

# text
seg-6fbfa234ef3e = Perte de verrouillage de la boucle de poursuite et capture par leurrage sous interférence

# text
# c1: tracking-loop
seg-f78c1f28a3f7 = Perte de verrouillage calculée à partir de la dynamique des boucles plutôt que d'un rapport de puissance : gigue thermique 1σ de la porteuse (Costas) et du code (avance/retard non cohérent) en fonction du C/N₀ avec la perte de quadrature, face aux règles indiquées 3σ_PLL + θ_e ≤ { "45" }° et 3σ_DLL + retard de rampe ≤ d/2 chips ; seuils de C/N₀ de décrochage et de reverrouillage avec la boucle déterminante nommée et l'hystérésis DÉRIVÉE de la bande de capture plus large plutôt qu'affirmée ; le délai déclaré de perte de verrouillage d'un détecteur de verrouillage à deux seuils avec durées de confirmation, rapporté séparément du temps physique d'échappée de phase (temps moyen de Viterbi entre sauts de cycle, en log₁₀ s parce qu'il couvre des centaines de décades) ; la plus grande dérive de code et le plus grand taux Doppler de porteuse que les boucles de la victime peuvent suivre ; et le RAYON DE DÉNI qu'impliquent les dynamiques de boucle, rapporté à côté du rayon en rapport de puissance existant, leur différence signée formant son propre champ nommé. Exécutable comme type de scénario <c1/>

# text
seg-0f4d023fe2d4 = Covariance des coordonnées d'un point de la surface lunaire à partir d'un plan de retards VLBI, distincte de celle des stations terrestres

# text
# c1: all-stations-fixed
# c2: beacon_link
# c3: datum = "all-stations-fixed"
# c4: estimate_beacon = true
seg-47352405133b = Un troisième choix de datum, <c1/>, qui tient toutes les stations terrestres et estime seules les coordonnées de la BALISE liées au corps lunaire — la configuration pour laquelle on cite réellement une incertitude de point de surface lunaire, puisque les coordonnées des stations terrestres sont une entrée du modèle de retard et non une inconnue. Il existe parce que la covariance au niveau des stations et la covariance du point de surface sont des GRANDEURS DIFFÉRENTES séparées par le bras de levier ρ/B, et que rien n'empêchait jusque-là de citer l'une face à l'autre. Le bloc <c2/> émis porte ρ, la plus longue ligne de base, le bras de levier, la forme point de surface du lien d'équipartition c·σ_τ·(ρ/B)·√(g/N), le sigma de balise par coordonnée calculé et leur rapport — le rapport étant null plutôt que trompeur chaque fois que la balise n'est pas estimée ou que la matrice est de rang déficient. B est pris comme la PLUS LONGUE ligne de base présente, la plus favorable, de sorte que le rapport ne peut que sous-estimer. Exécutable comme <c3/> avec <c4/>, ce qui est refusé avec un message nommant l'entrée manquante lorsque la balise n'est pas estimée

# text
seg-0315968c8214 = PNT différentiel lunaire — budget résiduel du lien de correction

# text
seg-c6785166a44c = Les trois termes qu'une correction différentielle acquiert entre l'époque où elle est calculée et l'époque où elle est utilisée, chacun jusque-là laissé comme marge non modélisée : erreur de levé de la station de référence (corrélée entre satellites, indépendante de la ligne de base, transfert de position ~{ "1" }:{ "1" } et, de façon démontrée, non amplifiée par le DOP), vieillissement de la correction (le vecteur d'erreur d'orbite figé reprojeté sur la ligne de visée sur laquelle le propre propagateur du moteur place le satellite une latence plus tard, plus la dérive d'horloge c·σ_y(τ)·τ issue de la loi de puissance étalonnée), et quantification uniforme du lien sur une pleine échelle exacte ±(orbit_err + clock_err) avec une variance step²/12. Rapportés dans les domaines de la distance et de la position, à côté — jamais à la place — du résidu et du niveau de protection existants, avec une courbe de latence à côté du chiffre unique

# text
seg-c42646ae4707 = Carte de couverture et de précision d'une station de référence lunaire

# text
# c1: lunar-station-coverage
seg-1f9834b32629 = Balayage Monte-Carlo du modèle de PNT différentiel lunaire sur une grille d'utilisateurs du pôle sud et un jour d'époques (le type <c1/>) : pour une station de référence différentielle en un site connu du pôle sud, par point et sur la région, l'erreur de position corrigée et non corrigée en percentiles (3D, horizontale, verticale), la disponibilité avec une raison pour chaque époque indisponible (user_lt4, station_missing_sat), la couverture face à un seuil indiqué avant l'exécution, les niveaux de protection DO-229E, le rayon de couverture par secteur d'azimut, et le budget du lien de correction à la station et au pire point. Pas une déclaration sur la performance d'un système réel ; ni affilié à un organisme ni approuvé par lui

# text
seg-7ecf4b0038b0 = Masques d'horizon du terrain lunaire à partir d'un profil indiqué ou d'un MNT polaire

# text
seg-7102948907bc = Masques d'horizon par site dépendant de l'azimut pour le type lunar-station-coverage (la station de référence et chaque point utilisateur) et la grille moonlight-service-volume et son site d'export par satellite (chaque ligne d'export gagne clears_terrain), au format de table d'horizon { "0.36" } (skyline::Skyline, linéaire en azimut avec bouclage à { "360" } deg ; un profil indiqué et un horizon de MNT en un site se combinent par leur maximum point à point) : un station_horizon ou user_horizon de [terrain] indiqué, étiqueté avec sa source, et/ou un horizon obtenu par lancer de rayons sur un MNT stéréographique polaire sud (la disposition polaire en grille LRO LOLA, lue depuis un descripteur qui fixe sa taille et son SHA-256, ou une tuile realdata::lola_dem en latitude/longitude avec dem_tile_path de [terrain], reprise avec son SHA-256) le long de grands cercles de la sphère lunaire avec courbure exacte, depuis une hauteur de mât indiquée, à un pas d'azimut et une portée indiqués. Un satellite compte en un site lorsqu'il dépasse le mask_deg plat et l'horizon à son azimut (lunar_service::topocentric) ; une époque que l'horizon laisse à moins de quatre satellites en un point, là où le masque plat en donne quatre, est comptée dans la raison d'indisponibilité terrain_masked. Le MNT fourni est un recadrage du produit LOLA LDEM_75S_240M du domaine public, rééchantillonné par moyenne de blocs { "5" } x { "5" } à { "1200" } m (data/lunar-dem/NOTICE.md). En son absence, chaque site garde le masque plat et chaque document est identique octet pour octet

# text
seg-d37bb01e270b = Termes de multitrajet et de matériel récepteur d'une station de référence lunaire

# text
seg-03796cb741b6 = Croissance de l'erreur d'éphéméride d'une station de référence lunaire sur la latence de correction

# text
seg-90307f07e0ef = Modes de solution d'une station de référence lunaire : contrainte de hauteur, trois satellites, fenêtre d'utilisateur statique

# text
seg-366c7ad03fb2 = La section facultative [solution] de lunar-station-coverage (LRS-06) : une ligne de pseudo-mesure de hauteur up . dx = e_h de 1-sigma indiqué pondérée face aux lignes de distance, un minimum de trois satellites autorisé seulement avec elle, et une résolution aux moindres carrés pondérés sur les window_epochs dernières époques avec une position statique partagée et une horloge par époque (la réponse d'un filtre pour une position statique sans bruit de processus sur les mêmes données ; les erreurs des époques sont traitées comme indépendantes). En son absence, la résolution instantanée et chaque document sont inchangés. Un additif à la comparaison aux affirmations publiées avec le style de solution des sources, préenregistré seul

# text
seg-611ba369ed00 = Précision et couverture d'une station de référence lunaire face aux affirmations publiées

# text
seg-4fe4f1cffa2b = Le type lunar-station-coverage exécuté sous les hypothèses publiques de la documentation publiée sur une station de référence différentielle lunaire (quatre satellites de navigation sur des orbites elliptiques figées de { "24" } h, SISE à { "95" } % de { "10" } m, bruit de code de { "0.30" } m, latence de correction de { "1" } s et de { "600" } s, un levé de station sub-décimétrique, le site d'exemple de station publié, les cercles polaires sud de { "300" } km et { "600" } km) et évalué face aux affirmations numériques des sources selon six seuils unilatéraux préenregistrés avant l'exécution : couverture de tout le pôle sud à un p95 sub-métrique (K1, K2), p95 corrigé sub-métrique et décimétrique (K3, K4), sub-métrique maintenu à { "600" } s de latence (K5), et précision maintenue de { "10" } km à { "500" } km de ligne de base (K6)

# text
seg-7bfcb5c6a985 = ARAIM avec hypothèses de défaut simultané de plusieurs satellites

# text
seg-15043111e437 = araim_reference::add_v42_subset_plan : la règle de détermination des sous-ensembles de l'ADD v4.2 (P_THRES, FC_THRES, sous-ensembles surveillés en retirant le moins d'éléments d'abord) généralisée des paires à des combinaisons simultanées d'au plus max_order événements de satellite et de constellation, avec l'a priori exact P_no fault prod q_e ; add_v42_protection_levels_to_order exécute dessus le chemin de niveau de protection de l'ADD v4.2 (l'ordre { "2" } est exactement le chemin existant). raim::araim_subset_raim (facultatif) : RAIM avancé sur cet ensemble d'hypothèses, chaque sous-ensemble surveillé étant un mode (p_fault, T, b, sigma) dans la somme de risque d'intégrité, les sous-ensembles inobservables reportés dans le risque non surveillé, le budget mis à l'échelle par l'allocation de l'ADD du risque non surveillé, et le sous-ensemble de plus grande séparation normalisée rapporté lorsqu'un défaut est détecté. Les a priori exigeant des sous-ensembles plus profonds que max_order sont refusés, jamais tronqués

# text
seg-48ca01332f8f = RAIM à côté des chiffres de mérite du holdover d'horloge

# text
seg-890f1006a75d = La section facultative [integrity] du type clock (clock_integrity::run) : à partir d'un site indiqué et de préréglages de constellation (geometry::sky_geometry), à chaque époque d'intégrité tant que la chronologie GNSS n'est pas refusée, RAIM instantané (raim::snapshot_raim : test du khi-deux de parité, niveaux de protection de pente) sur les satellites au-dessus du masque avec des résidus gaussiens à graine fixée de sigma indiqué et un biais indiqué facultatif ; un bloc séparé integrity_fom avec les verdicts par époque, les niveaux de protection et la disponibilité. Les époques refusées sont rapportées indisponibles, jamais extrapolées ; les chiffres de mérite du holdover sont inchangés et, sans la section, la sortie est identique octet pour octet

# text
seg-9cbb4ee7588a = Observabilité de longueur d'arc cislunaire spatiale, bruitée, multi-familles

# text
seg-5ebd771deef8 = Le seuil d'observabilité de longueur d'arc cislunaire dans le CR3BP SPATIAL à six états plutôt que planaire à quatre états, à travers les familles DRO, halo L2 et halo quasi rectiligne L2, avec le bruit de mesure entrant dans le gramien et DEUX critères rapportés parce qu'il n'y en a pas un seul d'honnête : le critère de rang publié, qui est démontrablement invariant à un sigma de mesure homoscédastique (le blanchiment multiplie la matrice d'observabilité par un scalaire, laissant inchangés le spectre relatif des valeurs singulières et donc le rang, le défaut et le conditionnement), et un critère d'estimabilité — le premier arc auquel l'incertitude formelle 1σ de position de l'état initial du chef passe sous une borne indiquée — qui est celui qui évolue bien avec le bruit. Chaque seuil porte l'encadrement de grille d'époques dans lequel il se situe ; un critère non atteint est null avec une raison. Le mode planaire reste le défaut et les familles hors plan y sont refusées plutôt qu'aplaties en un état qui ne peut pas les représenter

# text
seg-e250321394bc = Erreur de prédiction d'orientation de la Terre de style opérationnel, mesurée prédit contre final

# text
seg-0e443d241460 = Un ajustement aux moindres carrés biais-plus-pente sur une fenêtre glissante plus les principaux termes périodiques — annuel, semi-annuel et les deux principales marées zonales pour UT1 ; Chandler, annuel et semi-annuel pour le pôle — extrapolé avec le dernier résidu de la fenêtre reporté : la classe qu'utilise le Bulletin A de l'IERS, à la place du prédicteur de persistance sur lequel reposait l'horizon publié. Évalué de la seule façon honnête : une prévision pour T+h construite à partir de lignes rapides du Bulletin A à T ou avant, mesurée face au final du Bulletin B PUBLIÉ PLUS TARD à T+h, la persistance étant évaluée à côté sur le même ensemble d'époques face aux mêmes finals. Une époque cible sans final publié est écartée plutôt que réévaluée face à la colonne rapide ; un terme périodique que la fenêtre ne peut pas contraindre est rapporté comme rejeté avec les cycles qu'elle couvre réellement ; une fenêtre incomplète est refusée plutôt que raccourcie discrètement

# text
seg-f4efd94dd746 = Datum du référentiel lunaire issu d'une campagne d'observation

# text
# c1: lunar-frame-campaign
seg-a6972eb89d7d = Le datum de Helmert à sept paramètres propagé à partir d'une CAMPAGNE D'OBSERVATION SIMULÉE plutôt que retrouvé à partir d'une transformation injectée. Des stations terrestres observent un catalogue sourcé de balises de surface lunaire selon un plan explicite ; les dérivées partielles de retard VLBI lunaire sont accumulées en une matrice d'information de Fisher des coordonnées de balise et poussées à travers la conception de Helmert A = [I₃ | [p]ₓ | p] dans H = AᵀM_bA, de sorte que la précision de datum rapportée est une fonction du programme d'observation — exactement linéaire en le sigma de retard et monotone en l'arc via la libration que le rapport MESURE. Le défaut de datum est le sujet plutôt qu'une note de bas de page : rang, défaut, nombre de conditionnement, spectre, directions inobservables dans la base à sept paramètres, la direction la plus faible même à rang plein et la part de chaque paramètre dans celle-ci sont émis à chaque exécution, et tout paramètre que la campagne ne contraint pas est publié comme NULL avec un statut. La corrélation d'erreur de balise est MESURÉE, non supposée — exactement nulle avec les stations tenues fixes, et imprimée avec son coût lorsqu'elles sont estimées. Exécutable comme type de scénario <c1/>

# text
seg-ca481f2d8f9e = Corroboration par un estimateur indépendant du seuil de longueur d'arc cislunaire

# text
# c1: cislunar-arc-recovery
seg-3d5fbf896209 = Un estimateur aux moindres carrés par lots qui RETROUVE l'état initial du chef à partir de mesures inter-satellites simulées sur des préfixes croissants de la même grille d'époques que celle du tableau rang-contre-arc, avec les dérivées partielles de mesure prises comme différences finies centrales du modèle direct composé. Il ne consomme rien de la mécanique avec laquelle le seuil a été mesuré — aucune ligne de jacobien analytique, aucune matrice de transition d'état variationnelle, aucune décomposition en valeurs singulières ou propres, aucune tolérance de rang, aucun filtre d'information en racine carrée — et ne partage que la dynamique, les conditions initiales, l'observable scalaire et la grille d'époques, chacun nommé dans le document émis. Deux critères, tous deux balayés : la récupération sans bruit (l'analogue du rang) et l'estimabilité Monte-Carlo (l'analogue de l'estimabilité, mesurée face à une vérité connue plutôt que prédite à partir d'une covariance). Exécutable comme type de scénario <c1/>

# text
seg-f839285852d9 = Volume de service lunaire à partir d'une géométrie de constellation réelle, récupérée

# text
# c1: ephemeris_path
seg-c3059fcced49 = Accepte une éphéméride d'état tabulée centrée sur la Lune (l'évaluation d'un noyau SPK/BSP) ou une définition de constellation publiée derrière <c1/>, exécute le même balayage de couverture / DOP / niveau de protection sur elle, et émet l'exigence de télémétrie σ_URE qu'elle implique À CÔTÉ des résultats képlériens illustratifs et perturbés inchangés, la différence formant sa propre grandeur nommée. Chaque chiffre porte une classe de provenance qui distingue ce qui est issu d'un noyau, ce qui est issu d'éléments publiés et ce qui est modélisé, de sorte que les uns et les autres ne puissent jamais être confondus dans une citation en aval

# text
seg-36a6cfaf5afa = Unité et provenance déclarées pour chaque grandeur rapportée

# text
# c1: inherits-scenario-label
# c2: depends-on-input
seg-12460501e82b = Un schéma lisible par machine donnant l'unité, la classe de provenance et la définition de chaque champ numérique de chaque rapport de scénario, plus une porte globale unique qui exécute chaque type de scénario enregistré et échoue si un champ numérique émis manque de l'un ou de l'autre. Le vocabulaire de provenance est fermé et chaque classe porte un niveau de preuve, deux classes étant volontairement associées à <c1/> et <c2/> plutôt que de se voir attribuer un niveau que la classe ne détermine pas

# text
seg-c815cb90dcde = Géodésie d'une station de référence lunaire : rétroréflecteur et balise VLBI ajoutés face au datum à cinq réseaux

# text
seg-103cf21173ac = Les entrées facultatives extra_reflectors et extra_beacons du scénario lunar-llr-datum ajoutent un bloc station_geodesy : l'information de Helmert à cinq réseaux issue de la tranche archivée de télémétrie laser lunaire plus l'information qu'un rétroréflecteur ajouté (visé aux époques de points normaux archivés où la station de télémétrie est au-dessus de son horizon, chacune avec le poids archivé de ce point normal) et une balise VLBI ajoutée (observée par le réseau et le plan de lunar-frame-campaign avec les stations terrestres fixes, par les dérivées partielles de retard de lunar-vlbi-fim) à des sites indiqués apportent au datum à sept paramètres, résolue à nouveau, avec le 1-sigma de chaque paramètre de Helmert avant et après, leur rapport, les normes avant et après, et les valeurs propres extrêmes de la différence de Fisher. Absent ou vide, le rapport est inchangé

# text
seg-44f582b17fa9 = Intégrité de la porte — un vert qui veut dire ce qu'il dit

# text
# c1: cargo test --all
seg-43fbcfbe990c = Trois gardes structurelles sur le processus de vérification lui-même, chacune fermant une classe de défaut qui avait atteint la porte canonique sous forme de rouge intermittent ou parasite. ({ "1" }) Tout chemin temporaire construit dans les sources Rust doit porter un composant unique par appel ; un identifiant de processus est rejeté, parce que cargo exécute les tests de bibliothèque comme fils parallèles d'UN seul processus et que le pid leur est commun à tous. ({ "2" }) Toute épingle octet pour octet ou de hachage doit déclarer, à côté d'elle ou dans l'en-tête de son module, ce qu'elle couvre et ce qu'elle exclut délibérément — afin qu'un changement transversal puisse voir d'un coup d'œil quelles épingles sont concernées et lesquelles sont devenues en silence des détecteurs de changement à l'échelle du dépôt. ({ "3" }) Un vert n'est revendicable qu'à partir de la suite COMPLÈTE : scripts/gate.sh exécute <c1/>, capture le vrai code de sortie sans tube sur le chemin, et écrit un reçu nommant le commit, le nombre de binaires d'intégration, le nombre de tests et la durée ; le contrôle pré-push refuse un push dont le commit n'est nommé par aucun reçu valide, sur un arbre propre. La répétabilité est échantillonnée séparément par scripts/check-repeatability.sh, qui exécute N fois la suite de bibliothèque et échoue si l'ensemble des tests réussis diffère.

# text
seg-b7cd952ff133 = PL de synchronisation composé — traversée de holdover amorcée par P0

# text
seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)) ; semi-continu inférieurement PL({ "0" }+)≥PL({ "0" }−) ; K(IR/2) maximum courant ; exposants de phase τ/τ³/τ⁵

# text
seg-096b6cdfe2dc = PL de synchronisation composé — enveloppe p.s. de la LIL (impossibilité + cohérence)

# text
seg-1671add2210d = Aucun holdover au pire cas fini (le sup brownien diverge) ; HPL alloué par IR cohérent avec l'enveloppe de Hartman-Wintner lorsque IR→{ "0" }

# text
seg-5a27c9f0a67d = Majoration d'intégrité du biais de traçabilité UTC(k) hétérogène

# text
seg-fd09ab2adbf6 = Majoration de biais par source b = (U/k_cov)·Phi^-1(1-tail/2) + vieillissement, gonflant une incertitude élargie de type B publiée jusqu'à une queue d'intégrité allouée ; relié à tpl_scalar comme bias_s

# text
seg-d75b900ad25f = Covariance croisée de biais de traçabilité corrélés (allocation dangereuse en mode commun)

# text
seg-0641f6d38c23 = Covariance croisée de biais N×N avec hors-diagonales rho·b_i·b_j pour les sources partageant un réalisateur UTC(k) ; DÉMONTRÉ biais fusionné corrélé >= biais fusionné indépendant (l'allocation indépendante naïve sous-borne le biais fusionné -> optimiste -> dangereux)

# text
seg-1a3bb032960f = Statistique de cohérence en mode commun (défaut de référence partagée aveugle à la séparation)

# text
seg-1b03f522b8fc = Statistique de score ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 pour un décalage en mode commun que la séparation des solutions (contrastes orthogonaux à { "1" }) ne peut pas voir ; un décalage en mode commun la gonfle alors que les séparations deux à deux restent plates

# text
seg-3359eee713a5 = Classification de l'espace nul du référentiel lunaire (additivité des rangs LLR + relèvement du défaut par la libration)

# text
seg-6d722c176052 = Classification du problème de référentiel en télémétrie interne : une seule observation de distance apporte un rang { "1" } (espace nul de dimension 6) ; le couple origine-X et échelle est quasi nul et la libration physique DE440 ramène le défaut à zéro tandis que le couple reste quasi dégénéré

# text
seg-3fd19007ea67 = Information multi-techniques sur le référentiel lunaire (LLR + VLBI lunaire + distance d'orbiteur)

# text
seg-23d0dd7d0666 = Lignes jacobiennes du référentiel pour la distance LLR vers un réflecteur terrestre, le retard différentiel VLBI lunaire à deux stations et la distance orbiteur-balise, sur le référentiel à 7 paramètres, combinées en une seule matrice de Fisher préconditionnée de façon cohérente ; montre que le suivi hors radial (orbiteur / diversité en profondeur) lève la dégénérescence entre origine-X et échelle, alors que le VLBI transverse n'aide qu'indirectement

# text
seg-ab96cfc8d48c = Substrat géométrique du référentiel LLR lunaire (réflecteurs aux axes principaux, stations au sol, dérivées partielles analytiques de la distance)

# text
seg-40e91288f81a = Les cinq réseaux de rétroréflecteurs de la face visible en mètres dans le repère propre PA et les stations au sol LLR en coordonnées géodésiques ; placement des réflecteurs du repère propre vers l'inertiel via l'orientation PA de DE440 ; dérivées partielles analytiques de la distance Terre-réflecteur par rapport au référentiel à 4 paramètres ; et matrice de Fisher LLR seule présentant la dégénérescence sélénocentre-X / échelle qui motive l'analyse à 7 paramètres

# text
seg-63a8571f8eb0 = Dégénérescence entre distance et décalage d'horloge en télémétrie lunaire aller simple, et loi de conception de la diversité géométrique

# text
seg-cdd70f56051a = La dégénérescence entre distance radiale par nœud et décalage d'horloge du récepteur est exacte à { "1" } m pour { "3.336" } ns (l'inverse de c). La marginale par complément de Schur { "{" }échelle, décalage{ "}" } (coupled_marginal_fisher) montre que, dans un réseau géométriquement diversifié, la télémétrie aller-retour relève la marginale d'à peu près le même facteur qu'un nombre égal de données aller simple supplémentaires, alors que dans le régime idéalisé à nœud unique le gain de l'aller-retour est supérieur de plusieurs ordres de grandeur. La loi de conception qui en découle : c'est la diversité géométrique, et non la télémétrie aller-retour en tant que telle, qui sépare l'échelle du référentiel lunaire du décalage de l'échelle de temps en télémétrie aller simple ; un lien de temps aller-retour ou externe n'est nécessaire que dans le régime à faible diversité ou à utilisateur unique.

# text
seg-2c074d6260ba = Menu représentatif de mesures multi-techniques et règle additive de combinaison de Fisher

# text
seg-beefac5c1b13 = MeasurementBlock représente une campagne de mesure candidate sous la forme d'une contribution d'information de Fisher 7x7 plus un coût relatif scalaire ; block_from_rows en construit une à partir de lignes jacobiennes brutes du référentiel, de sorte que chaque bloc est préconditionné de manière identique via lunar_identifiability::assemble_multi_info ; combine somme l'information d'un sous-ensemble choisi, ce qui est la règle correcte parce que l'information de Fisher est additive sur des mesures indépendantes ; representative_lunar_menu fournit un menu déterministe de quatre blocs (LLR, une balise de limbe VLBI transverse, un orbiteur de la face visible et un orbiteur de la face cachée). L'optimiseur de conception sous contrainte de budget qui consomme ce menu ne fait pas partie de ce crate.

# text
seg-2d3347bcb15e = Tolérance de cohérence inter-fournisseurs pour un utilisateur à fournisseurs mixtes

# text
seg-9decf2cb6b0c = consistency_tolerance : inverse un budget de position de l'utilisateur en une exigence d'accord de Helmert inter-fournisseurs par paramètre (origine/échelle/rotation) à un bras de levier de référence, éventuellement gonflée par la CRLB de réalisation à fournisseur unique P1

# text
seg-5450d921dfc9 = Budget d'erreur d'interopérabilité lunaire multi-fournisseurs et loi de conception référentiel contre éphéméride

# text
seg-e1e30f5c17a6 = interop_budget : partage réductible (lien de référentiel commun) contre irréductible (dynamique) selon les conventions PerProvider / CommonFrameTie / CommonEphemeris, avec la mesure de loi de conception de la fraction irréductible (~{ "0.69" } sur les vraies DE440/INPOP/EPM : une étiquette de référentiel commune seule laisse subsister le plancher dominant)

# text
seg-ebb827739614 = Borne de détection/identification par étincelle de bloc byzantine sur le réseau lunaire autonome par nœud (T3)

# text
seg-4fb935e6193d = byzantine_bound instancie la borne de codage d'estimation d'état sécurisée / d'observabilité parcimonieuse sur la géométrie du réseau par nœud : un pair byzantin injecte une combinaison linéaire arbitraire des mesures auxquelles il participe, et le réseau DÉTECTE toute coalition de ≤ f = block_spark − { "1" } pairs et IDENTIFIE de façon unique toute coalition de ≤ ⌊(block_spark − { "1" })/2⌋, où block_spark est la plus petite coalition de pairs dont les signatures effectives empilées P⊥·B_T sont de rang de colonnes déficient. La détectabilité d'un pair est le RANG DE COLONNES PLEIN de P⊥·B_j (un bloc non nul mais de rang déficient est une attaque non nulle qui tombe dans range(G) et ne laisse aucun résidu), et pas seulement P⊥·B_j ≠ { "0" }

# text
seg-4f57f586cf82 = Plancher de jauge temporelle en holdover autonome pour la constellation lunaire autoréférentielle (T4)

# text
seg-eb690e8f5c9b = holdover_floor établit que, dans un ensemble de nœuds autonomes reliés uniquement par des mesures inter-nœuds, la dérive d'horloge commune (δα_j += { "1" } ∀j) est un paramètre libre du temps d'ensemble situé dans N(GᵀWG) : aucune quantité de télémétrie inter-nœuds supplémentaire ne peut l'observer (rate_in_gauge = true, temporal_gauge_dim = { "2" } avec le décalage commun). C'est le véritable plancher de holdover — l'analogue temporel de la jauge de position du référentiel rigide. L'ajout d'un lien externe de dérive absolue (un lien direct vers une référence hors réseau) expulse la dérive commune de l'espace nul (rate_in_gauge = false, temporal_gauge_dim = { "1" }), ce qui prouve que le plancher est une véritable jauge et non un artefact du modèle d'oscillateur

# text
seg-25ffd6e1979c = Partage commun/différentiel par fournisseur, unification par déficience d'un rang et pente de l'écart de protection (T5 / §{ "0" } / g7)

# text
seg-72c7ec3724bf = Trois facettes de la décomposition unique ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG), avec la jauge à 8 dimensions référentiel⊕échelle de temps comme N(G) et les state_dim − { "8" } = { "32" } directions observables comme range(G) : (T5) provider_mismatch_split classe un biais commun multi-fournisseurs (∈ range(G)) comme INDÉTECTABLE — nécessitant un lien externe — et un biais différentiel (∉ range(G)) comme autosurveillé / DÉTECTABLE ; (§{ "0" }) l'unification tient à ce que le MÊME sous-espace aveugle range(G) gouverne la classe de fautes indétectables, de sorte que la jauge du référentiel N(G) et le sous-espace aveugle aux fautes range(G) forment une seule géométrie, et non deux ; (g7) slope renvoie la pente d'écart de protection de Brown ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ pour une faute b ∈ range(G) (estimateur corrompu avec une parité nulle) et finie pour une faute détectable

# text
seg-632add2dbd3c = Masques de synchronisation télécom ITU-T avec PASS/FAIL et marge

# text
# c1: telecom-timing
seg-47687529aee7 = Limites transcrites de l'ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC verrouillé et holdover ePRTC-A (y compris l'enveloppe d'erreur de temps du tableau { "3" }), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) classes T-BC/T-TSC A-D et G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) point de référence C, chaque intervalle ouvert ou fermé comme l'énonce le tableau, toute entrée « pour étude ultérieure » étant omise ; un verdict et une marge au point limitant par vérification, et le temps de dépassement de chaque budget. Exécutable comme type de scénario <c1/>

# text
seg-165ed2bc771a = Masques de génération de dérive lente de synchronisation de fréquence ITU-T (G.811, G.812, G.8262, G.8262.1)

# text
# c1: telecom-timing
# c2: 8 τ^0.5
seg-953793d4446a = Sept masques de génération de dérive lente MTIE et TDEV à température constante pour le type <c1/> : G.811 (09/1997) PRC (autonome), G.812 (06/2004) types I, II et III, G.8262 (10/2024) EEC options { "1" } et { "2" } et G.8262.1 (11/2025) eEEC (mode verrouillé), y compris les morceaux en loi de puissance que les tableaux écrivent (<c2/> et semblables), chaque intervalle ouvert ou fermé comme imprimé, mesurés à travers le filtre de { "10" } Hz qu'indiquent les paragraphes (pris comme appliqué avant l'échantillonnage) ; le scénario de référence scenarios/telecom-synce-eec.toml oppose un OCXO en fonctionnement libre aux trois masques EEC. Non implémentés : les tolérances en température variable, le holdover, les transitoires, la gigue et la précision de fréquence de G.811

# text
seg-5fc2ad88faf0 = Formats de journaux d'horloge (horloge RINEX, ASCII TimeLab, TAPR TICC) lus sous forme de série de phase normalisée

# text
# c1: [series.clock_log]
# c2: clock_log
# c3: [clock_log]
# c4: measured
seg-5b5bcbdea166 = clock_log::read_input : une couche d'analyse unique qui transforme un fichier d'horloge RINEX (enregistrements AS/AR d'une horloge nommée, versions { "2" } et { "3.00" } à { "3.04" }), un journal ASCII de phase ou de fréquence de type TimeLab, ou un journal d'horodatages ou d'intervalles TAPR TICC en une grille de phase uniforme, avec tau0 indiqué, issu d'un en-tête, ou l'espacement médian, chaque trou, lecture hors grille et doublon étant comptés, et une politique de trous refuse, plus-longue-série ou linéaire ; branchée en option dans la série de synchronisation télécom (<c1/>, ajoutant un bloc <c2/>) et dans le type horloge (<c3/>, ajoutant un bloc <c4/> avec ADEV, TDEV et MTIE, le SHA-256 de la table et le SHA-256 de la phase ; runs = { "1" }). Sans la table, les deux types sont identiques octet pour octet

# text
seg-acdb0337bce7 = Formats de journaux linuxptp (ptp4l, phc2sys, ts2phc) et chrony (tracking, statistics) lus sous forme de série de phase normalisée

# text
# c1: clock
seg-e87b3dba2072 = clock_log::read_input avec les formats ptp4l, phc2sys, ts2phc, chrony-tracking et chrony-statistics : le décalage journalisé d'une ligne d'asservissement linuxptp (ns, l'horodatage entre crochets propre à la ligne, les lectures antérieures au premier rapport de l'asservissement en s2 étant omises et comptées) ou d'un journal tracking ou statistics de chrony (s, par position de colonne, date et heure UTC) devient une grille de phase uniforme grâce aux mêmes politiques de trous que les autres formats ; un sélecteur de source (<c1/>) désigne l'une de plusieurs interfaces, horloges ou adresses ; les journaux alimentent la série de synchronisation télécom, le type horloge et le type d'essai de holdover

# text
seg-97aebb84576e = Essai de holdover noté à partir d'un enregistrement d'erreur de temps fourni par l'opérateur

# text
# c1: holdover-test
seg-ab533cf99c56 = Le type <c1/> : un enregistrement d'erreur de temps (un journal d'horloge linuxptp, chrony, TICC, TimeLab ou RINEX, ou des paires time_s,time_error_ns) est découpé aux deux instants que l'opérateur indique pour la suppression et le rétablissement du GNSS en une étape de référence de base, une de holdover et une de récupération ; la référence de base est mesurée par rapport aux masques ITU-T écrits pour une horloge verrouillée et le holdover par rapport à ceux écrits pour le holdover ou une horloge autonome, l'enveloppe de holdover ePRTC-A et les budgets d'erreur de temps ; le holdover rapporte le décalage de fréquence par moindres carrés que le système a tenu, et la récupération indique si et quand |TE| est entrée dans une bande donnée et y est restée pendant une durée donnée, avec le pic et le plus grand saut. Chaque limite est celle que transcrit le type de synchronisation télécom ; les deux instants sont la déclaration de l'opérateur et ne sont pas vérifiés

# text
seg-94cbac97a1aa = Disponibilité des signaux GNSS dans le volume de service spatial et au-delà, comparée au livret ICG SSV

# text
# c1: gnss-ssv
seg-c59e349fdc9e = Les balayages de disponibilité du type <c1/> : par constellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) et combinées, la part des paires (utilisateur, époque) avec au moins un et au moins quatre signaux et la plus longue interruption, pour un utilisateur sur une sphère (la coquille mondiale de 2,562 points du livret, { "14" } jours à { "1" } minute) ou sur une trajectoire (GEO, HEO, transfert lunaire), à partir des orbites képlériennes de l'annexe C du livret, d'une puissance rayonnée minimale constante à l'intérieur de l'angle hors axe de référence, d'un blocage par la Terre assimilée à la sphère plus { "50" } km et d'un seuil de C/N0 ; antennes utilisateur d'après le tableau B10 du livret

# text
# c1: gnss-ssv
seg-d2f04991c8a4 = Effets de l'ionosphère, de la plasmasphère et de l'atmosphère sur les signaux GNSS rasants le long du rayon au limbe, et conception du récepteur pour signaux faibles, dans le type <c1/>

# text
seg-1a1786ba90b6 = Une ionosphère de Chapman, une plasmasphère de type Gallagher et une atmosphère neutre (courbure par réfractivité, absorption par l'oxygène, défocalisation) intégrées le long du rayon rectiligne entre l'émetteur et l'utilisateur : contenu électronique total oblique, sa part plasmasphérique, retard excédentaire, altitude de tangence et perte sur les liaisons rasantes ; et une conception de récepteur pour signaux faibles (intégration cohérente et non cohérente, limite de bit de données, aide, recherche Doppler) qui fixe le seuil de C/N0 à partir des modèles d'acquisition et de boucle de poursuite

# text
seg-6b8f9f3ca2a3 = Filtre de navigation GNSS embarqué pour engins spatiaux en orbite haute et en transfert lunaire

# text
# c1: gnss-ssv
# c2: [navigation]
seg-39ddc494f103 = Le mode <c2/> du type <c1/> : un filtre de Kalman étendu à neuf états (position, vitesse, biais et dérive d'horloge du récepteur, une échelle de pression de radiation solaire) sur des pseudodistances dont la disponibilité, le bruit et le C/N0 proviennent de la même géométrie de liaison que les balayages ; la vérité terrain est intégrée avec J2, les perturbations du Soleil et de la Lune comme troisièmes corps et la pression de radiation avec ombre, le filtre modélise J2 et les troisièmes corps et estime la pression de radiation ; rapporte les erreurs de position et de vitesse à l'intérieur et au-dessus des orbites GNSS, le plus long trou de mesure et la NEES moyenne

# text
seg-5fc242476828 = Navigation relative d'une formation de plusieurs engins spatiaux en orbite très elliptique à partir du GNSS

# text
# c1: gnss-ssv
# c2: [formation]
seg-f67eb29d4483 = Le mode <c2/> du type <c1/> : un chef et des adjoints exécutent chacun le filtre absolu ; la position de l'adjoint par rapport au chef est estimée par soustraction des estimations absolues et par un filtre relatif sur des pseudodistances à simple différence des signaux que les deux engins poursuivent, la dynamique relative étant la différence de deux trajectoires non linéaires

# text
seg-7038f6902820 = Termes d'erreur de l'interféromètre à atomes froids : bruit de phase du laser Raman, biais de courbure du front d'onde et résolution de l'ambiguïté de frange

# text
seg-4d9690207607 = inertial::cai_error_terms (fonctions de bibliothèque, pas encore accessibles depuis un type de scénario) : la fonction de pondération de phase Raman d'un interféromètre à trois impulsions carrées (Cheinet et al. { "2008" }, éq. { "8" }) avec la forme close de phase blanche (pi/2)^{ "2" } S_phi0/tau_R et une voie numérique pour tout spectre ; le bruit de fréquence du laser que le retard de rétroréflexion n'annule pas (Le Gouet et al. { "2007" }, éq. { "9" } à { "11" }) ; le biais de front d'onde par pure défocalisation sigma_v^2/R d'un nuage thermique et sa réduction par un rayon de détection ; la probabilité d'indice de frange erroné erfc(pi/(sqrt({ "2" }) s)) pour une aide par accéléromètre classique et pour deux temps d'interrogation, et son inverse

# text
seg-363705e03bac = Préréglages de holdover d'oscillateur d'après des fiches techniques publiques

# text
seg-9750d9e0ec7a = Quatre préréglages — OCXO (Microchip OX-208), rubidium (Microchip 8040C), césium (Microchip 5071A tube haute performance) et CSAC (Microchip SA.45s) — chacun portant les maxima d'écart d'Allan, le vieillissement et la borne de température de sa fiche technique ; un ajustement par moindres carrés non négatifs du bruit de fréquence blanc + scintillation + marche aléatoire, mis à l'échelle pour envelopper chaque point de la fiche technique, un plancher de scintillation jamais inférieur au chiffre du τ le plus long, un vieillissement linéaire et un terme de température sinusoïdal, synthétisés comme un holdover généré avec une graine après une perte de GNSS

# text
seg-d7e03158b972 = Secondes avant qu'une horloge en fonctionnement libre ne quitte la garde d'un créneau indexé dans le temps, et cadence de recalage qui la maintient à l'intérieur

# text
# c1: slot-timing
seg-0b4d8815f756 = Le type <c1/> : l'erreur prédite E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² inversée pour le dépassement, le temps restant, l'intervalle de resynchronisation net de la latence de recalage et les recalages par jour, chaque terme détaillé avec le terme dominant nommé ; horloges issues des six valeurs par défaut de ClockClass (TCXO, OCXO et RAFS ajoutés, chacun citant une fiche technique), des préréglages de synchronisation télécom, d'une fiche technique en ligne ou d'un enregistrement mesuré ; un dépassement au-delà du temps de moyennage le plus long de la source étant signalé comme extrapolé

# text
seg-2797643153dc = Niveau de protection de la synchronisation temporelle pour un récepteur en orbite soumis au leurrage GNSS

# text
# c1: slot-timing
seg-cb412a2ffadf = orbital_timing::orbital_timing, accessible comme section de leurrage du type <c1/> : vitesse et période d'une orbite circulaire, plus longue durée pendant laquelle un leurreur au sol peut atteindre le satellite par passage, plancher du moniteur assisté par horloge et latence de détection CUSUM, niveau de protection conditionnel (plancher plus marche libre sur la latence), dérive qu'accumule un leurreur à une vitesse de rampe maximale donnée avant que le satellite ne quitte son empreinte ou qu'un contrôle indépendant ne s'exécute, et indication de l'indépendance de chaque contrôle de contact sol ou de liaison croisée vis-à-vis d'un leurreur au sol unique

# text
seg-f134975d4ffa = Cascade du spectre en bande L avec J/S par bande et C/N0 effectif sous un calendrier de brouilleurs scénarisé

# text
# c1: spectrum
# c2: jamming
seg-86ad8f89a822 = Le type <c1/> : une grille fréquence par temps de la densité spectrale de puissance en bande L (plancher thermique k T_sys avec T_sys = T_ant + { "290" } K (F - { "1" }), les signaux à leurs puissances reçues minimales de spécification d'interface, et des brouilleurs à onde continue, à bande étroite, à chirp et à bruit adapté avec leurs instants de marche/arrêt), chaque cellule étant moyennée sur sa case et sa ligne (les chirps exactement sur des balayages entiers et partiels, les brouilleurs selon leur rapport cyclique), C/N0 effectif par bande = [1/(C/N0) + sum (J/S) kappa]^-1 par ligne, J/S par bande, J/S en bande, et une cascade SVG avec des barres de C/N0. Le rapport comporte une vérification croisée avec la chaîne du type <c2/> sur les mêmes entrées de liaison

# text
seg-6e0b9687e8ee = Uranus et Neptune d'après le tableau { "1" } de Standish, Pluton, et vitesses planétaires

# text
seg-df3bf502dfe9 = Positions d'Uranus et de Neptune d'après le tableau { "1" } de Standish (le choix par défaut entre { "1800" } apr. J.-C. et { "2050" } apr. J.-C.), de Pluton d'après la ligne du tableau { "1" } de { "1992" } que la page JPL actuelle ne répertorie plus, et vitesse héliocentrique de chaque planète : la dérivée à deux corps avec le moyen mouvement qu'impliquent les éléments plus la rotation de l'ellipse due aux taux de périhélie, d'inclinaison et de nœud

# text
seg-a50be56f605a = Positions de la Lune et de sept lunes principales (Phobos, Deimos, les lunes galiléennes, Titan)

# text
seg-2cfbe5a1eece = La Lune géocentrique d'après la série de Montenbruck & Gill (dont le terme de -1.3972 deg par siècle la rapporte déjà à l'équinoxe J2000), et les positions et vitesses planétocentriques de Phobos, Deimos, Io, Europe, Ganymède et Callisto d'après les éléments moyens du JPL Solar System Dynamics dans le plan de Laplace de chaque lune, avec le taux de longitude moyenne tiré du taux de rotation synchrone de l'IAU (le tableau imprime la période avec trop peu de chiffres pour tenir la phase), et de Titan d'après le modèle de rotation de l'IAU (la lune sur moins l'axe x solidaire du corps à la distance moyenne), parce que la ligne imprimée du plan de Laplace de Titan ne reproduit pas Horizons, même à sa propre époque

# text
seg-8b8c8e28ece9 = Constantes physiques de chaque corps du système solaire et rapport sur l'ensemble du système

# text
# c1: solar-system
seg-d225a30de35c = Body ajoute Mercure, Vénus, Jupiter, Saturne, Uranus, Neptune, Pluton, Phobos, Deimos, Io, Europe, Ganymède, Callisto et Titan (paramètre gravitationnel, rayon de référence, J2 lorsqu'il est publié avec le rayon auquel il se rapporte, pôle et méridien origine de l'IAU), une recherche par nom et un enregistrement BodyFacts (code NAIF, classe, parent, rayon équatorial et moyen) ; le type <c1/> les rapporte pour les dix-huit corps avec les positions, les temps de lumière et une trace d'orbite sur une révolution, chaque corps étant étiqueté VALIDATED ou MODELLED

# text
seg-87ab655f8270 = Positionnement autour de tout corps du système solaire avec une constellation locale et une liaison en espace lointain depuis la Terre

# text
# c1: body-pnt
seg-d9b1b0ac97d3 = Le type <c1/> : un orbiteur ou un atterrisseur de surface autour d'un corps choisi par son nom navigue avec des pseudodistances aller simple d'une constellation de navigation Walker autour du corps (orbites à deux corps avec la dérive séculaire J2 du corps, une horloge utilisateur inconnue) et une distance aller-retour facultative, sans horloge, depuis la Terre, la direction et la distance de la Terre étant tirées de l'éphéméride analytique à chaque époque ; des lignes de visée bloquées par la sphère du corps et un masque d'élévation de surface ; par époque, le GDOP et le PDOP de la constellation seule (orbit::dop), l'incertitude formelle de position avec et sans la ligne de la Terre, et des positions de Gauss-Newton générées avec une graine (batch_ls::gauss_newton) dans chaque cas, avec le temps de lumière et l'aller-retour corps-vers-Terre

# text
seg-7d4d7200cbca = Cartes de couverture et de dilution de précision pour des conceptions multi-constellations arbitraires à grande échelle, autour de tout corps central

# text
# c1: constellation-design
seg-b78b79e9fae4 = Le type <c1/> au-delà des deux cas figés : conceptions explicites et multi-coques, plusieurs constellations par exécution avec une horloge de récepteur par constellation, la Terre, la Lune et Mars d'après les constantes de corps, le préréglage BeiDou (phase en orbite moyenne et franchissement géosynchrone incliné à { "118" } deg E modélisés), satellites en vue par cellule, GDOP, PDOP, HDOP, VDOP et disponibilité, traces au sol sous-échantillonnées, et un préfiltre de visibilité par latitude du point subsatellite qui exécute une conception de { "5" } 000 satellites sur une grille de { "10" } deg en une fraction de seconde

# text
seg-278c77438493 = Une mission enchaînée à travers des types de scénario sur une seule chronologie partagée

# text
# c1: campaign
seg-3dcfb26f6234 = Les phases du type <c1/> : chaque phase exécute un ou plusieurs scénarios de types existants via run_toml, lit leurs sorties dans des canaux nommés (erreur de temps de l'horloge et garde, rapport moyen effectif porteuse sur densité de bruit et plancher de poursuite, niveau de protection vertical et limite d'alerte, erreur de position, satellites en poursuite, indicateurs d'alarme) par des préréglages par type ou des chemins de résultat explicites, les place au début de la phase et les maintient sur une grille commune, avec les limites de phase et les événements ; l'état est transmis par carry (un canal se poursuit à partir de la valeur finale de la phase précédente), handoff (un nombre d'une phase précédente écrit dans le scénario suivant) et end_at (une phase se termine à un instant calculé par une exécution, comme l'instant de détection d'un moniteur de leurrage) ; un hachage de campagne et un condensé sur chaque résultat de membre

# text
seg-ad6105af464c = Balayages de paramètres et ensembles Monte Carlo avec graine sur tout type de scénario

# text
# c1: campaign
seg-95921611839e = Les sections sweep du type <c1/> (une à trois clés pointées de n'importe quel type, sur les valeurs d'axe du balayage générique, avec facultativement un ensemble à chaque nœud) et monte_carlo : la réalisation k s'exécute à base_seed + k ; chaque métrique rapporte la moyenne, l'écart type, les percentiles 5e/50e/95e au rang le plus proche et un intervalle de confiance à { "95" } % par bootstrap percentile à graine fixe sur la moyenne (inertial::metric_stat) ; les unités des métriques sont lues dans le propre bloc d'unités du type balayé

# text
seg-24327a0ed82e = Plusieurs scénarios sous des conditions partagées, avec un résumé combiné

# text
# c1: campaign
seg-5833fb3b06e3 = La section compose du type <c1/> : des valeurs partagées nommées (par exemple la puissance et la position d'un brouilleur) écrites dans chaque membre aux clés auxquelles il les lie, chaque membre exécuté, et par métrique la plus petite, la plus grande et la moyenne des valeurs sur les membres, le membre étant nommé ; les unités des métriques doivent concorder entre les membres

# text
seg-0bc866720bde = Optimisation bornée d'une métrique sur des paramètres de campagne

# text
# c1: campaign
seg-f9bdb89c2b4f = La section optimize du type <c1/> (CAP-32) : une à trois clés pointées de scénario bornées à [lo, hi] sur une échelle lin ou log, une métrique lue par chemin de résultat, objectif minimize, maximize ou target ; méthode grille (les valeurs d'axe du balayage) ou simplexe de Nelder-Mead déterministe en coordonnées normalisées avec projection sur la boîte et les coefficients standard ; une métrique manquante ou non finie obtient le pire score et reste dans la trace ; avec runs > { "1" }, la métrique est la moyenne sur des graines communes ; chaque évaluation est une exécution réelle du type nommé, listée dans trace et comptée dans le condensé de reproductibilité

# text
seg-652e28dfa10f = Conceptions de signaux de positionnement, navigation et synchronisation en orbite terrestre basse : poursuite de code, acquisition, compatibilité GNSS et compromis de bande pour tout système

# text
# c1: leo-signal
seg-c0ba5c7e708e = Le type <c1/> : conceptions de signaux paramétrées (bande, largeur de bande d'émission, allocation UIT ; composantes d'acquisition, de données et pilote avec spectres BPSK(n), BOC(m,n), MBOC ou plats, parts de puissance, sous-porteuses FDMA, longueurs de code et débits de données) à partir de fichiers de préréglages publics compilés (Xona Pulsar, Iridium STL, signal d'opportunité Starlink, CentiSpace, une conception générique en bande C et des conceptions génériques UHF/L/S/C/C large, chacune avec l'URL de sa source et les valeurs non publiées étiquetées REPRESENTATIVE) ou écrites en ligne ; par signal, la densité spectrale de puissance à bande limitée, les fractions de puissance dans la bande, la largeur de bande de Gabor, la gigue de code en fonction de C/N0 et de l'espacement et l'exactitude de télémétrie, l'espace de recherche d'acquisition, la probabilité de détection en loi quadratique et le temps moyen d'acquisition série et parallèle sur le code, le coefficient de séparation spectrale vers et depuis GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b et AltBOC avec la dégradation de C/N0, et la tolérance J/S CW, large bande et adaptée issue de la chaîne SSC du type spectre ; un compromis de bande entre retard ionosphérique, perte en espace libre, exactitude de télémétrie à C/N0 égal et à PIRE égale et tolérance au brouilleur ; et des vérifications qualitatives de forme d'une conception par rapport à une mesure décrite

# text
seg-c2b9c8e4a364 = Cascade de spectre multibande (UHF, L, S, C) avec signaux conçus et brouilleurs par bande

# text
# c1: spectrum
seg-609df4e0a085 = Le type <c1/> étendu au-delà de la bande L : bandes données comme conception de signal prédéfinie (tracée avec chaque composante, à bande limitée à la largeur de bande d'émission, C/N0 et J/S rapportés à la composante poursuivie) ou comme porteuse et modulation personnalisées ; panneaux de cascade supplémentaires sur toute plage de fréquences, sur la même chronologie et la même échelle de couleurs ; un brouilleur à large bande (barrage) à côté des bruits CW, à bande étroite, à chirp et adapté ; J/S par bande et C/N0 effectif issus de la chaîne inchangée du coefficient de séparation spectrale

# text
seg-d9eb3e7e69c2 = Un passage LEO-PNT et son bilan de liaison par bande face aux satellites GNSS MEO en vue

# text
# c1: leo-pass
seg-d986e44443dd = Le type <c1/> : satellites issus d'un passage conçu, d'éléments, d'un TLE via SGP4 ou d'une constellation Walker de constellation-design ; par bande et par époque, les angles de visée, la distance, le taux de variation de distance et l'accélération de distance sous forme close (vérifiés à chaque exécution par rapport à des différences centrales et rapportés), la perte en espace libre, la PIRE avec un diagramme isoflux, gaussien ou plat, une antenne utilisateur à plaque, hémisphérique ou isotrope, l'affaiblissement gazeux de l'UIT-R P.676-10 annexe { "2" }, la pluie et la scintillation P.618, l'affaiblissement de pénétration dans les bâtiments P.2109, le désaccord de polarisation, la température de bruit du système, C/N0, le Doppler et le taux Doppler, et le retard du premier ordre issu d'un TEC oblique de Klobuchar ou de TEC vertical mis à l'échelle par la fraction de Chapman sous le satellite ; paires sans ionosphère avec bruit de code au sommet du passage ; porteuses Galileo ou GPS d'après les puissances reçues de leurs documents d'interface via le même récepteur

# text
seg-95a077a980b6 = Préréglages de systèmes LEO-PNT nommés avec sources indiquées, et un moteur indépendant du système

# text
seg-4b47033cda24 = leo_link::presets : multibande générique (UHF, L, S, C), bande C générique, Xona Pulsar X1/X5, Iridium STL, Starlink comme signal d'opportunité Doppler seul, CentiSpace et un préréglage Celeste IOD facultatif, chacun avec sa source marquée PUBLIC (avec URL), REPRESENTATIVE ou WORKSHOP, celle de l'atelier se trouvant dans le fichier de préréglage Celeste IOD facultatif, compilé seulement si ce fichier existe ; chaque bande et chaque orbite peut être redéfinie dans un scénario, et un scénario peut ne nommer aucun préréglage

# text
seg-a39f34973373 = Positionnement à faible énergie : temps avant la première position et énergie par position en fonction du rapport cyclique

# text
# c1: leo-pass
seg-f3b9b669a76f = leo_link::energy et la section [iot] du type <c1/> : intégration cohérente plafonnée par le taux Doppler, sommes non cohérentes en loi quadratique jusqu'à un seuil de détection, recherche par cases Doppler sur l'enveloppe d'utilisateur statique de l'orbite (à froid) ou une fenêtre assistée (à chaud), recherche de code parallèle ou série, durée du message de navigation à un démarrage à froid, énergie par position et autonomie de batterie selon les intervalles de position, pour chaque bande LEO et le signal GNSS

# text
seg-8121e7db3db3 = Mise à jour en milieu de passage du message de navigation LEO avec contrôle de continuité à la bascule

# text
# c1: leo-navmsg
seg-34c310d85c42 = L'analyse midpass-update du type <c1/> : le passage le plus haut au-dessus d'un utilisateur dans une plage de recherche, des messages sur un calendrier global avec des périodes d'utilisation centrées dans leurs fenêtres d'ajustement, et à chaque bascule le saut de position 3D, le saut d'horloge, le saut de pseudodistance de l'utilisateur, le plus grand saut sur toute ligne de visée visible (forme close sur le cône du nadir), l'erreur de distance avant et après, et PASS/FAIL par rapport à un seuil

# text
seg-7635a8339e78 = Codage binaire documenté du message de navigation LEO avec budget d'erreur de quantification

# text
seg-e4d9b16a2dc4 = leo_navmsg::codec : la trame propre à Kshana (préambule, version, modèle, longueur, charge utile, CRC-24Q) pour les quatre modèles d'éphéméride, le polynôme d'horloge, SVID, âge des données, bande, santé, un ensemble de Klobuchar, des coefficients NeQuick-G et des paramètres UTC, chaque champ avec une largeur et un pas indiqués (field_table), quantification avec refus hors plage, et un budget du plus grand changement de position et d'horloge qu'un changement d'un demi-pas de chaque champ produit sur la fenêtre de validité

# text
seg-17ca41d7fd71 = Exports de style RINEX-4 et CSV des messages de navigation LEO

# text
seg-185e12ccef0d = leo_navmsg::text : un bloc de style RINEX-4 (en-tête d'enregistrement > EPH, ligne de satellite et d'époque avec trois termes d'horloge, lignes d'orbite diffusée D19.12) avec la lettre de système L et les types d'enregistrement KP16, KRAC, LU22 et APOL, étiqueté dans chaque en-tête comme une extension de Kshana ne faisant pas partie de RINEX { "4.02" }, et un tableau CSV avec un schéma de colonnes par défaut et des schémas prédéfinis, chacun avec un importateur

# text
seg-e79047fc95af = Polynôme ECEF ATOMIC à horloge nulle et comparaison synthétique de modèles LEO à cinq altitudes

# text
seg-e261843e35b1 = la variante EcefPoly de leo_navmsg::elements::EphemerisModel : un polynôme ECEF par axe sans termes d'horloge, le terme relativiste issu de -2 r.v/c^{ "2" }, noté par rapport à une horloge pilotée. Ainsi que l'analyse de comparaison de modèles (liu_comparison sur LIU2025_TABLE), qui ajuste le modèle à 22 paramètres aux cinq altitudes de l'article sur des arcs de 20 minutes d'une orbite intégrée par Kshana et imprime le résultat à côté du SISRE publié

# text
seg-d2e18c8bdc14 = Positionnement à partir du Doppler LEO, à un ou plusieurs satellites, avec états de dérive d'horloge et de vitesse

# text
# c1: leo-pvt
seg-de6cb3c06490 = Positionnement par Gauss-Newton par lots à partir du taux de variation de distance avec dérivées partielles analytiques (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), une vitesse d'utilisateur constante en option, une pseudo-mesure de hauteur pour un utilisateur de surface, des pas amortis ; la covariance formelle à la vérité terrain ; projections along-track, cross-track et verticale ; l'exactitude sur un seul passage en fonction du décalage cross-track de l'utilisateur ; l'instant de plus courte distance. Le mode doppler du type <c1/> ajoute l'erreur en fonction de la longueur de fenêtre et un mode de signaux d'opportunité à Doppler seul (le préréglage starlink-sop)

# text
seg-7f462969d2d4 = Positionnement conjoint par pseudodistances GNSS et LEO avec biais inter-systèmes et modèles d'erreur par signal

# text
# c1: leo-pvt
seg-b9b5298e3408 = Positions de Gauss-Newton par moindres carrés pondérés sur tout mélange de systèmes, une horloge de récepteur par système (le biais inter-systèmes estimé avec la position) ou un décalage diffusé connu sur l'échelle de temps de référence ; sigmas par mesure fournis par l'appelant, par défaut le bruit thermique de la boucle à verrouillage de retard du moteur (navsignal::dll_code_jitter_chips) au C/N0 de l'élévation combiné à l'erreur de distance du signal dans l'espace ; DOP non pondéré (GDOP, PDOP, HDOP, VDOP, TDOP) dans le repère géodésique local, sigmas formels est-nord-haut et sigmas de biais ; le mode joint de <c1/> compare des positions GNSS seul, LEO seul et fusionnées et balaie le DOP en fonction du nombre de satellites LEO ajoutés

# text
seg-ee9a4a0cb530 = Convergence du positionnement précis par point avec GNSS seul et avec augmentation LEO

# text
# c1: leo-ppp
seg-a54f36c27d90 = Un filtre de Kalman étendu PPP flottant sur code et phase sans ionosphère : coordonnées statiques, une horloge de récepteur blanche, un biais inter-systèmes par système supplémentaire, un retard humide zénithal en marche aléatoire projeté par 1/sin(élévation), une ambiguïté flottante par arc de satellite ajoutée au lever et retirée au coucher, et l'erreur d'orbite et d'horloge précises commune au code et à la phase d'un satellite, traitée comme une seule mise à jour corrélée à deux lignes sous forme stabilisée de Joseph ; mesures simulées à partir du même modèle ; temps de convergence (erreurs sous les seuils jusqu'à la fin de l'exécution), courbes d'erreur et NEES de position moyennée sur l'exécution pour GNSS seul et chaque cas LEO, exécutés comme le type <c1/>

# text
seg-9306f1c06081 = Transfert de temps vers UTC assisté par LEO en fonction du C/N0 et de l'oscillateur du récepteur

# text
# c1: leo-pvt
seg-c618feb01476 = Mesures d'horloge de chaque satellite LEO en vue à une position connue, combinées par variance inverse à partir du modèle de bruit de pseudodistance, filtrées par un filtre de Kalman à deux états (phase, fréquence) dont le bruit de processus est le bruit de fréquence blanc et de marche aléatoire de la classe d'oscillateur (slot_timing::ClockNoise, clock_state::ClockClass ; la variance de marche libre de holdover::coast_phase_variance), une horloge vraie générée avec une graine aux mêmes niveaux, et l'expression temps système vers UTC de la section { "20.3.3.5.2.4" } de IS-GPS-200 avec une incertitude de décalage diffusé ajoutée comme biais par exécution ; le mode timing de <c1/> balaie les oscillateurs et les décalages de C/N0

# text
seg-d92777401093 = Systèmes LEO PNT nommés comme préréglages de données facultatifs, chacun avec sa source

# text
seg-5130bfe2410c = Entrées indépendantes du système : chaque système est constitué de coques Walker, d'éléments explicites ou d'un préréglage GNSS, d'un signal (porteuse, débit de code, largeur de bande, puissance reçue ou plage de C/N0), d'un SISRE, d'un sigma Doppler et d'un modèle d'horloge ; les préréglages ne remplissent que ce qu'un scénario laisse de côté, un fichier chacun avec des sources marquées PUBLIC (avec une URL), WORKSHOP ou DERIVED et les valeurs non publiées indiquées comme représentatives : Xona Pulsar X1/X5, Iridium STL, signaux d'opportunité Starlink, CentiSpace, un système représentatif en bande C, le modèle d'éphéméride à horloge nulle ATOMIC, et un préréglage dérivé de l'atelier dans le fichier de préréglage Celeste IOD facultatif, retenu en supprimant ce fichier et ses scénarios

# text
seg-dec52b5b9cd6 = Un système LEO-PNT de bout en bout : conception du signal, bilan de liaison de passage, message de navigation et positionnement fusionné, la sortie de chaque étape étant transmise à la suivante

# text
# c1: leo-pnt-chain
seg-39443b31d418 = Le type <c1/> : une conception leo-signal (préréglage public ou en ligne) fixe le centre, la largeur de bande, le débit de code et la répartition de PIRE d'une bande leo-pass ; le passage donne le C/N0 de la composante poursuivie et la gigue de code à bande limitée par époque ; une droite de C/N0 par moindres carrés en sin(élévation), le SISRE du message leo-navmsg (ajusté à l'orbite du satellite du passage, plus un terme de détermination d'orbite indiqué en somme quadratique) et la porteuse et le débit de code de la conception vont à chaque système LEO d'une position conjointe leo-pvt et, facultativement, aux cas LEO de leo-ppp ; chaque transmission est rapportée avec sa valeur et son unité

# text
seg-55ca63edff02 = Détection du leurrage par le Doppler LEO et la cohérence de la géométrie de passage

# text
# c1: leo-pass
# c2: [spoofer]
seg-b12fc1728220 = La section <c2/> du type <c1/> : un leurreur contrefait, de façon autocohérente en distance et en taux de variation de distance, les signaux vus à une position déclarée qui saute et/ou est écartée de la position vraie après un début (par bande LEO et pour le signal GNSS MEO) ; le récepteur prédit chaque taux de variation de distance à partir de l'orbite diffusée et d'une position et d'une vitesse a priori indépendantes, et teste les taux de variation de distance mesurés avec une statistique du chi-deux des moindres carrés généralisés sur une fenêtre d'époques (dérive d'horloge comme paramètre de nuisance ou avec un a priori), sur les voies GNSS, les voies LEO et toutes les voies, avec le bruit thermique de la boucle à verrouillage de fréquence issu du C/N0 (Kaplan & Hegarty { "2006" }, section { "5.6.2" }) ; probabilité de détection issue de la loi du chi-deux non centrée à une probabilité de fausse alarme donnée, la détection étant déclarée à une probabilité de non-détection donnée

# text
seg-5f341f85ac07 = Détection du leurrage par la cohérence inter-bandes d'un signal LEO multibande

# text
# c1: [spoofer]
seg-2f9c4d351b0f = Pour chaque satellite LEO et chaque paire de bandes de télémétrie, la section <c1/> forme la combinaison de pseudodistances sans géométrie, retire le modèle ionosphérique du récepteur et teste son saut d'époque à époque par rapport au bruit de code des deux bandes et à un taux ionosphérique non modélisé toléré indiqué (gaussien bilatéral, probabilité de détection exacte) ; un leurreur qui contrefait certaines bandes et pas d'autres, ou chaque bande sans l'ionosphère, est vu à son début ; un leurreur qui contrefait chaque bande et simule l'ionosphère ne l'est pas, ce que le résultat indique

# text
seg-97dbcd5f2728 = Sondage de l'ionosphère : TEC oblique à partir du retard bibande d'un passage LEO

# text
# c1: leo-pass
seg-844de34fd2f3 = Pour chaque paire de bandes d'un satellite <c1/>, le rapport donne le contenu électronique total oblique que la combinaison de codes sans géométrie retrouve au sommet du passage, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), et son 1-sigma issu du bruit thermique de code des deux bandes, de sorte que toute conception LEO-PNT multibande peut être arbitrée comme sondeur d'ionosphère

# text
seg-1fdbb476c8ab = Score de confiance maritime : l'agrégation des preuves des moniteurs en un score de 0 à 100 et ses trois bandes

# text
seg-0d76b33144f1 = Chaque moniteur ramène ses preuves à un rapport de la statistique au seuil ; le score est { "100" } moins la somme sur les moniteurs du poids multiplié par une rampe linéaire bornée du rapport ({ "0" } jusqu'à { "0.5" }, { "1" } à { "1.5" }), borné de { "0" } à { "100" } et arrondi à { "0.1" }, avec des bandes à { "90" } et { "55" } ; chaque époque liste les moniteurs qui ont déduit et leurs points.

# text
seg-51640405c9b7 = Événements SIEM de la télémétrie de confiance : Log Event Extended Format (LEEF) sur syslog

# text
seg-1b3245506847 = Événements de changement de bande (ou par époque) sous forme de charges utiles Log Event Extended Format { "2.0" } dans une enveloppe RFC { "5424" } sur UDP ou TCP, avec une correspondance de champs documentée.

# text
seg-c04042b0270a = Seuils d'interférence de la confiance du récepteur calibrés sur le jeu de données JammerTest { "2024" }

# text
seg-32ad0b0da818 = receiver_trust::calibration::run_dataset : la calibration préenregistrée des moniteurs de chute de C/N0, de AGC et d'indicateur de brouillage sur le jeu de données public JammerTest { "2024" } (Zenodo { "15911589" }, GPL-3.0-or-later, récupéré à l'exécution, jamais intégré) : par dossier une chronologie de { "1" } s issue de mon_rf.csv et rinex.csv, les moniteurs exécutés une fois, chaque époque postérieure à la calibration étiquetée propre ou brouillage d'après l'attack_log du dossier (décalé de CEST à UTC, garde de { "60" } s), chaque seuil balayé sur une grille fixe, le plus petit seuil dont la probabilité de fausse alarme propre cumulée est d'au plus { "0.01" } retenu, et des comptes réservés en laissant un dossier de côté ; un recoupement avec un lecteur UBX. La sélection n'est livrée que comme profil facultatif [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }) ; la règle par défaut et chaque sortie sans lui sont inchangées

# text
seg-65a8361b4a22 = Notation Jammertest : un journal de récepteur noté par essai planifié (latence de détection, alarmes manquées, fausses alarmes, délai de rétablissement) par rapport au plan d'essai publié

# text
seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score) : le catalogue d'essais et le plan de transmission de la NPRA (MIT, récupérés avec un SHA-256 épinglé, jamais intégrés au dépôt) lus comme vérité planifiée, avec les identifiants du catalogue conservés ; une exécution receiver-trust notée par essai (première alarme moins début prévu, détecté/tardif/manqué par rapport à une tolérance, délai jusqu'à la première période sans alarme, alarmes en dehors de chaque créneau et de sa marge de garde), avec un paquet de preuves signé qui porte la fiche de résultats. Le calendrier est constitué de créneaux planifiés, et non d'heures d'émission réelles enregistrées

# text
seg-ee99388f7b15 = compliance (kshana compliance-report) : une correspondance entre les sorties de Kshana et des clauses de cadres publics, par numéro uniquement, remplie à partir des exécutions fournies ; un résultat ne compte pour une capacité que s'il porte les preuves que la correspondance nomme, un ensemble vide ne prouve rien, et la formulation est « apporte des éléments de preuve en faveur de » ; le rapport n'est pas un constat qu'un cadre quelconque est satisfait, ni une évaluation ou une approbation par qui que ce soit.

# text
seg-98c360d82d56 = Intégrations marines : greffon Signal K, flux de barrière et panneau de score OpenCPN, construction de référence

# text
seg-7af9ce566646 = Le score de confiance, la bande, les raisons, l'état de la barrière et la position rapportée par le récepteur, publiés sous navigation.gnss.kshana dans un serveur Signal K avec une notification d'avertissement, d'alarme et normale (integrations/signalk) ; le flux NMEA filtré par la barrière, avec le point marqué invalide tant que la confiance est effondrée et une phrase PKSHT par cycle, servi à OpenCPN en TCP par la barrière elle-même ou par un petit relais, et un panneau de score OpenCPN natif qui lit la phrase PKSHT (integrations/opencpn) ; ainsi que des unités systemd et un conteneur qui exécutent la barrière (deploy/reference-build). Là où elles affichent une sortie, elles portent l'énoncé à titre consultatif : Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) : l'opérateur reste responsable de la navigation du navire.

# text
seg-89ab9ef155eb = Suivi BOC({ "1,1" }) : mise à l'échelle du DLL et résolution d'ambiguïté par saut de bosse (optionnel)

# text
seg-ef24be9b5917 = Le champ boc de iq::track::LoopConfig (optionnel, None par défaut) : les trois discriminateurs du DLL remis à l'échelle pour lire l'erreur de code en chips avec une pente unitaire sur le pic principal du BOC({ "1,1" }) en sinus, et un moniteur de saut de bosse sur les corrélateurs très en avance et très en retard à une demi-période de sous-porteuse ({ "0.5" } chip) qui fait sauter le NCO de code vers le pic principal lorsqu'un compteur haut/bas atteint N ({ "8" } par défaut). Sans l'option, toutes les sorties sont inchangées.

# text
seg-2c32955cbfb3 = Canal de scintillation ionosphérique IQ (modèle de Cornell) par rapport à une scintillation GPS L1 mesurée à { "50" } Hz

# text
seg-2fdcb373ab25 = iq::channel::scint, le modèle de scintillation de Cornell (intensité de Rice, spectre de Butterworth du second ordre, phase arg z) piloté au S4 et au temps de décorrélation de l'intensité d'une fenêtre mesurée, comparé sur ce qu'il génère au-delà de ces deux entrées ; realdata::scint50 lit le journal mesuré, en retire la tendance et exécute la comparaison.

# text
seg-160507ac3702 = Option CFAR à moyennage de cellules dans l'acquisition IQ

# text
seg-7c0a1adc9ae6 = iq::acq::ca_cfar et ca_cfar_cells (optionnel) : une cellule d'une grille d'acquisition est comparée à la moyenne de cellules de référence de sa rangée Doppler (retards de garde et de pas, avec rebouclage sur la période), à un facteur alpha fixé à partir de la probabilité de fausse alarme CA-CFAR en forme close pour M blocs non cohérents (ca_cfar_pfa, ca_cfar_alpha). Le détecteur à puissance d'échantillon reste le choix par défaut et toutes les sorties existantes sont inchangées.

# text
seg-5bd3bf0c22a7 = Modèle de spectre : bandes GLONASS, BeiDou et Galileo E6 (optionnel)

# text
seg-9c16189c63ac = spectrum::default_band résout, par le nom seulement (MORE_BAND_NAMES), GLONASS L1OF et L2OF sur chaque canal FDMA K = -7 à { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a et B3I (BPSK({ "10" })) et Galileo E6 (BPSK({ "5" })), avec les porteuses et les puissances reçues minimales de leurs documents de contrôle d'interface ; l'ensemble de bandes par défaut et toutes les sorties existantes sont inchangés.

# text
seg-7b1ae0c7ca28 = Codes tertiaires LunaNet AFS et couche de messages (SB1 BCH, CRC-24Q, entrelaceur) par rapport à la LSIS-AFS V1.0

# text
seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered ; iq::lunanet_afs : motif de synchronisation, codeur SB1 BCH({ "51,8" }) et décodeur à 256 hypothèses, CRC-24Q, l'entrelaceur par blocs { "60" } x { "98" }, un vérificateur de flux de symboles (kshana lunanet-afs-check) et un générateur de flux de test avec des sous-trames de remplacement. Le codage LDPC de rendement 1/2 des sous-trames { "2" } à { "4" } n'est pas implémenté (ses matrices figurent dans une annexe séparée).

# text
seg-0d7b17524c04 = Paquets de normes : scénarios notés par rapport à des seuils énoncés avant l'exécution

# text
seg-6e5c04fd4531 = standards_pack (kshana standards-pack) : les profils d'essai du cadre DHS Resilient PNT pour les niveaux { "1" } à { "4" }, les niveaux de précision et l'évaluation de l'intégrité de l'IMO MSC.1/Circ.1575, et les paquets surveiller, évaluer et atténuer de l'ICAO Doc { "9849" } Appendix F : chaque essai exécute un type de scénario fourni et compare les champs de résultat à des seuils énoncés dans le paquet, et les essais qui exigent un journal de récepteur sont listés comme NEEDS INPUT et non notés.

# text
seg-8a8f2c85e0c3 = Paquet de preuves d'aller-retour en laboratoire (scénario, conditions d'essai, journal de récepteur, score)

# text
seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) et l'export de journal de récepteur kshana.test-conditions/1 de kshana bench-export : un paquet signé qui consigne le hachage du scénario, le hachage des conditions énoncées, le hachage du journal et le score par rapport aux événements énoncés, et qui refuse des conditions en désaccord avec les événements de notation ou un journal dont le hachage n'est pas celui énoncé. Aucun signal n'est écrit, rejoué ni planifié.

# text
seg-a9189e4fe413 = Moteur de suivi IQ par rapport à GNSS-SDR { "0.0.19" } sur des enregistrements indépendants

# text
seg-364de05e5b1b = Le moteur de suivi complet de la couche IQ (iq::track via kshana iq track : passation d'acquisition, corrélateurs, NCO, PLL de Costas du second ordre à { "15" } Hz, DLL à enveloppe EML du premier ordre à { "2" } Hz asservi à la porteuse, indicateur de verrouillage et estimateurs de C/N0) sur GPS L1 C/A de { "30" } à { "45" } dB-Hz.

# text
seg-259d201c2ff8 = Gains d'antenne CRPA dans le type de scénario jamming par rapport à un recalcul numpy indépendant

# text
seg-192144c57783 = La section facultative [crpa] du type de scénario jamming : un faisceau par canal vers chaque satellite (annulation dirigée avec le brouilleur comme nul, ou MVDR sur sigma^{ "2" } I + P_j a_j a_j^H), mettant à l'échelle le bruit de chaque liaison par ||w||^{ "2" } et le brouilleur par |w^H a_j|^{ "2" } avant l'équation C/N0 anti-brouillage existante.

# text
seg-a2f34cff9338 = Masquage du brouilleur par le relief dans le type de scénario jamming par rapport à un recalcul numpy indépendant sur une vraie tuile SRTM

# text
seg-334c569d9cae = La section facultative [terrain] du type de scénario jamming : le profil de terrain le long du grand cercle entre le brouilleur et le récepteur sur une tuile SRTM .hgt avec un bombement terrestre à facteur k, l'arête en lame de couteau dominante (plus grand nu de Fresnel-Kirchhoff) et la perte d'une seule arête en lame de couteau de l'ITU-R P.526-15 section { "4.1" }, soustraite de la puissance reçue du brouilleur.

# text
seg-825c121c7512 = Hystérésis d'acquisition et quantificateur de la chaîne d'entrée dans le type de scénario jamming par rapport à des recalculs indépendants

# text
seg-f7207263d881 = La section facultative [acquisition] du type de scénario jamming (un satellite est acquis à un seuil d'acquisition ou au-delà après un délai de réacquisition et conservé tant qu'il est au seuil de poursuite ou au-delà) et sa section [front_end] (la lecture AGC { "10" } log10({ "1" } + J/N) et la perte du quantificateur du CAN pour une entrée gaussienne retirées de chaque liaison, signalées comme non valides pour les brouilleurs non gaussiens).

# text
seg-9c46f1c76486 = Accrochage FLL plafonné en dessous du plancher de passation FLL vers PLL de la conception par défaut (optionnel)

# text
seg-efa1d1a9e904 = L'option carrier.fll_pull_in_max_s de iq::track (le champ fll_pull_in_max_s de iq::track::LoopConfig) : avec fll_assist = pull-in, la FLL passe la main à la PLL après une durée d'accrochage fixe quel que soit le PLI, avec un temps de retour correspondant jusqu'à ce que le PLI atteigne pour la première fois fll_off_pli.

# text
seg-ac0f97e945a7 = Lecteur de solutions RTKLIB .pos pour receiver-trust

# text
seg-0b8bc2c89de4 = Lit un fichier de solution RTKLIB (heure calendaire ou semaine GPS/TOW, position latitude/longitude ou ECEF, satellites utilisés) dans la chronologie receiver-trust (receiver_trust::machines::rtklib).

# text
seg-849393517c04 = Journaux NovAtel OEM7 ASCII et binaires (BESTPOS, RANGE, RXSTATUS) pour receiver-trust

# text
seg-7e0021922025 = Lit BESTPOS (position), RANGE (C/No par signal) et RXSTATUS (l'indicateur de brouilleur du récepteur, comme auto-déclaration de l'époque) à partir de journaux OEM7 ASCII et binaires, avec contrôle CRC, en lecture seule (receiver_trust::machines::novatel).

# text
seg-a45c53a9deb3 = Lecteur de rapport porteuse sur bruit RTCM { "3" } MSM4 et MSM7 pour receiver-trust

# text
seg-0a0c9976236f = Lit le C/N0 de chaque cellule de signal des messages RTCM { "3" } MSM4 et MSM7 (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) à partir d'un flux de trames, avec contrôle CRC-24Q (receiver_trust::machines::rtcm3). Dispositions tirées des tables pyrtcm sous licence BSD, et non du texte de la norme RTCM.

# text
seg-cd554a7c1649 = Adaptateur de moniteur GNSS-SDR pour receiver-trust

# text
seg-22b587ac642d = Lit les messages GNSS-SDR Monitor (Gnss_Synchro) et PVT-monitor, relayés en lignes JSON avec les noms de champs proto, dans le C/N0 par canal, le point, les satellites utilisés, le HDOP et le ciel (receiver_trust::machines::gnss_sdr ; integrations/gnss-sdr/relay.py).

# text
seg-217e5953c128 = Ingestion de journaux IMU, entrée de cap par gyromètre et ajustement d'Allan des paramètres de capteurs hybrides

# text
seg-9dadc819daef = Lit un CSV d'IMU (colonnes documentées, ou disposition EuRoC) ; intègre la vitesse de lacet en le cap que lit le moniteur cap-route ([log.imu]) ; et ajuste les paramètres de bruit de l'accéléromètre et du gyromètre des scénarios hybrides et de fusion à partir d'un journal à l'arrêt par déviation d'Allan à recouvrement (imu-fit).

# text
seg-15a852a2dcb0 = Découverte MQTT Home Assistant et exportateur d'état pour la télémétrie de confiance

# text
seg-6d6b07b26966 = Un document d'état JSON et des messages de découverte MQTT Home Assistant pour le flux de confiance, imprimés en texte sur chaque surface et publiés en MQTT { "3.1.1" } QoS { "0" } par la CLI (telemetry::mqtt ; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

# text
seg-68caf86157c2 = Paquet ROS { "2" } receiver-trust et passerelle gnss_lib_py

# text
seg-e7d7d99fe538 = Une passerelle sans ROS qui écrit des messages de point et de satellites en NMEA et les note par la liaison Python (integrations/ros2/kshana_trust), et une passerelle de NavData gnss_lib_py vers receiver-trust par le format rtklib-pos (integrations/gnss_lib_py).

# text
seg-c3c260b7063e = Tests

# text
# c1: docs/MODELLED-RATIONALE.md
seg-b24486eee0fb = Source : <c1/>

# text
seg-34d1304c9555 = Capacités modélisées : justification

# text
# c1: ExternalDataset
seg-144f441bf52b = Ces capacités sont implémentées à partir de physique publiée ou de premiers principes, avec des tests, mais sont <b>honnêtement étiquetées MODELLED</b> : non vérifiées par rapport à une référence indépendante externe avec une tolérance déclarée. Les tests d'invariants de la matrice imposent que seules les lignes adossées à <c1/> puissent être VALIDATED, de sorte que rien ici ne peut être promu en silence. Chaque ligne indique pourquoi elle reste modélisée.

# text
seg-0630e39b4de3 = Type de référence indépendante

# text
seg-bb023086bbe3 = Pourquoi elle reste modélisée

# text
seg-dd6ba97ce971 = InternalConsistency

# text
seg-bac242dada9c = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Aucune externe : Orekit { "12.2" } n'a pas de rapport d'éclairement avec assombrissement centre-bord. Vérifiée seulement par rapport à des formes fermées de la même loi

# text
seg-33d506570c1b = srp_shadow::tests (la forme fermée annulaire, la loi uniforme reproduisant l'ombre conique, les limites de plein soleil et d'ombre)

# text
seg-91fe516eabd4 = ExternalDataset

# text
seg-cb2cbb31b091 = une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée : Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 avec ThirdBodyAttraction et SolarRadiationPressure sur le propre lecteur DE440 d'Orekit (orekit-data lnxp1990.440), exécuté comme programme distinct ; kshana lit une coupe de NAIF de440s.bsp identique bit à bit et vérifiée par SPICE. Seuils préenregistrés dans xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). Le seuil d'orbite ({ "0.5" } m) et le contrôle de sensibilité sont atteints, mais le seuil de position du Soleil/de la Lune ({ "3" } m / { "0.2" } m) est manqué à { "6.39" } m / { "0.244" } m. SPICE lisant le même noyau à son TDB exact manque Orekit de la même quantité ({ "6.25" } m / { "0.240" } m), de sorte que l'écart se situe entre le chemin de440s de NAIF et le lecteur DE440 ou l'échelle de temps d'Orekit ; cause non isolée. Consigné et figé, de sorte que la ligne reste MODELLED

# text
seg-13f8f557c721 = propagator (ForceModel::with_ephemeris, ForceEphemeris), ephem_provider

# text
seg-20f163c0cb8f = tests/propagator_de440_orekit_oracle.rs ({ "5" } cas x { "25" } états horaires sur { "24" } h, LEO, GEO et HEO, troisième corps et troisième corps + SRP : pire |dr| { "0.0170" } m, |dv| { "1.84e-5" } m/s ; le contrôle à série analytique manque de { "9.96" } m ; Soleil { "6.39" } m et Lune { "0.244" } m par rapport aux positions DE440 d'Orekit, un manque consigné) ; tests unitaires du propagateur (refus du fournisseur, comptage des replis partagé entre les clones)

# text
seg-b55bcab6f986 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Aucune externe pour l'effet géopotentiel. Les { "24" } coefficients sont transcrits de GFZ STR06/01 Tableau { "1" } modèle N1 et ont été revérifiés ligne par ligne par rapport au rapport (SHA-256 890865ae) ; les degrés { "0" }, { "1" }, { "7" } et { "8" } ne sont pas utilisés. Ray et Ponte ({ "2003" }) n'impriment aucun tableau d'harmoniques sphériques, de sorte qu'aucune seconde source n'a été comparée

# text
seg-448f4acf5c7b = tides, propagator, precise_od

# text
seg-4014447d4bcc = tides::tests (le terme S1 est diurne, tourne de { "90" } deg en un quart de jour, et a l'amplitude du facteur de charge de chaque ligne ; ordre de grandeur physique en LEO) ; propagator::tests::the_s1_air_tide_flag_adds_exactly_the_s1_acceleration

# text
seg-a192b0f512cb = une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée : Orekit { "12.2" } (Apache-2.0) HolmesFeatherstoneAttractionModel et pyshtools { "4.14.1" } (BSD-3-Clause) MakeGravGridPoint, exécutés comme programmes distincts ; seuils préenregistrés dans xval/high-degree-gravity/PREREGISTRATION.md (276c869f) et xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). Orekit concorde partout où il est défini, mais pyshtools manque son seuil préenregistré aux deux points proches du pôle (jusqu'à { "7.3e-10" } m/s^{ "2" } ; une vérification mpmath à 50 chiffres place l'erreur dans pyshtools), il n'existe aucune valeur de référence indépendante exactement sur l'axe polaire, et le contrôle de sensibilité préenregistré de degré 70 pour l'orbite de { "24" } h a été manqué ({ "0.726" } m contre > { "1" } m). Chaque manque est consigné, non corrigé par réglage, de sorte que la ligne reste MODELLED

# text
seg-8fda2ee90583 = gravity_sh, propagator (FieldEvaluator)

# text
seg-3f7d3003656e = tests/gravity_sh_high_degree.rs (Orekit en { "8" } points hors axe : max |da| { "2.2e-17" } m/s^{ "2" } à N = { "70" }, toujours exécuté ; { "3.5e-17" }, { "3.9e-17" } et { "7.3e-17" } m/s^{ "2" } à N = { "200" }, { "360" }, { "2190" }, conditionné par les données sur KSHANA_EGM2008_GFC) ; tests/cowell_tesseral_200_orekit_oracle.rs (orbite de { "24" } h 200x200, conditionnée par les données : pire |dr| { "0.1317" } m, |dv| { "1.45e-4" } m/s ; contrôle de degré 70 { "0.726" } m) ; tests unitaires de gravity_sh (concordance avec l'évaluateur classique à { "1e-13" } au degré { "70" }, différence finie et continuité au pôle sur un champ de degré 2190, un terme de degré 2190 en sous-dépassement par rapport à un calcul à exposant étendu)

# text
seg-84a9851b838c = une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée : Orekit { "12.2" } (Apache-2.0) BatchLSEstimator avec des mesures géométriques instantanées personnalisées RangeRate et AzEl (recoupées avec le TopocentricFrame d'Orekit), exécuté comme programme distinct sur des observations identiques masquées et à graine. Seuils préenregistrés dans xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Tous les seuils sont atteints sauf B4, la concordance d'état sans bruit de { "1" } cm, manquée sur { "2" } des { "4" } scénarios ({ "1.46" }, { "1.74" } cm) : l'estimation sans bruit d'Orekit lui-même s'écarte autant de sa vérité simulée (cause du côté d'Orekit non isolée). Consigné et figé, de sorte que la ligne reste MODELLED. Non modélisés : temps de lumière, aberration, réfraction, rotation de la Terre, un filtre séquentiel pour ces types de mesure

# text
seg-296a6fe8585b = orbit_determination (determine_orbit_batch_tracking, propagate_with_stm, is_visible), batch_ls (gauss_newton_analytic)

# text
seg-9493e02e3cd1 = tests/od_tracking_measurements_reference.rs ({ "8" } scénarios : taux de distance, az/el et mixte, LEO et MEO, sans bruit et sigma à graine { "5" } m / { "5" } mm/s / { "1e-4" } rad, masques de { "5" } et { "10" } deg, par rapport à Orekit { "12.2" } : ensembles visibles identiques ; valeurs de mesure à { "5.84e-8" } m, { "6.30e-10" } m/s, { "1.44e-13" } rad près ; STM à { "1.2e-14" } relatif près ; états bruités à { "1.74" } cm et { "1.14e-5" } m/s près ; RMS post-ajustement par type à { "2.7e-4" } relatif près ; kshana sans bruit par rapport à la vérité { "1.06e-8" } m ; kshana sans bruit par rapport à Orekit { "1.464" } et { "1.740" } cm sur deux scénarios, un manque consigné du seuil de { "1" } cm) ; tests unitaires d'orbit_determination et de batch_ls

# text
seg-a5554f29b2d7 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Aucune externe : les pondérations sont un choix de modélisation (le format SP3 ne définit le code que comme indicateur d'exactitude du producteur ; il est lu ici comme un écart-type à un sigma par axe). Les exécutions d'agences déjà consignées sont inchangées

# text
seg-f5a76ae1fcaa = sp3, precise_od

# text
seg-39a552abfcab = tests unitaires de src/sp3.rs ; tests/agency_galileo.rs::galileo_e11_sp3_accuracy_weighted_fit (jeu d'essai ESOC de { "8" } h versionné, sigma { "0.032" } m d'après l'exposant d'en-tête { "5" } : RMS 3D de Tier-1 { "0.132" } m inchangé, Tier-2 { "0.035" } m contre { "0.070" } m à un sigma de { "1" } m, le changement venant de la contrainte a priori empirique rééquilibrée) ; tests/agency_swarm.rs (le produit Swarm ne porte aucun code d'exactitude et se rabat, figé)

# text
seg-a5ad470a4816 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Cohérence interne seulement. Chaque champ publié est défini dans le référentiel lié au corps de son producteur (GMM-3 dans le référentiel de Mars de Konopliv et al. { "2006" }, GL0660B dans le référentiel des axes principaux lunaires DE421), alors que le champ est évalué dans le référentiel IAU ; le décalage n'est pas modélisé

# text
seg-409f709cceb3 = gravity_pds, body, propagator, mars_frame

# text
seg-0fe6532ca74d = tests/planetary_gravity_pds.rs::a_shadr_field_attached_to_a_body_drives_the_propagator ; gravity_pds::tests::with_gravity_field_is_opt_in

# text
seg-eff90f999826 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Aller-retour interne et réponses connues de l'ICD ; aucun décodeur tiers n'a été exécuté (le dispositif RTKLIB/GNSS-SDR qui lit KSHANA_NAVMSG_ORACLE_JSON est conditionné par les données). MODELLED

# text
seg-e3d75762b979 = gnss_navmsg (gps_cnav, gal_inav, gal_fnav, fec)

# text
seg-dbe0dd5dcf47 = gnss_navmsg::tests (valeur de contrôle CRC-24Q 0xCDE703 ; réponse impulsionnelle convolutive ; Viterbi corrige les erreurs injectées ; largeurs de la disposition) ; tests/gnss_navmsg_roundtrip.rs (les bits de début de champ égalent les numéros de bits de l'ICD ; encode -> FEC -> entrelacement -> Viterbi -> décodage fait l'aller-retour à un demi-LSB près) ; tests/gnss_navmsg_galileo_brdc_grid.rs (enregistrements Galileo IGS BRDC 2018-133 sur la grille LSB, pire { "3.6e-3" } LSB ; le seuil préenregistré du nombre de satellites est manqué, { "15" } sur { "20" }, FINDING)

# text
seg-81b76a6d1bcd = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. FINDING par rapport à la coordonnée ITRF2020 publiée de WTZR : les seuils préenregistrés (médiane lissée et p95 au plus { "0.6" } x brut ; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) ont été manqués, rapports { "0.718" } et { "0.923" } ; l'erreur résiduelle de l'ordre du mètre est de type biais (biais de code C1C, antenne, marée, multitrajet à longue période), non le bruit blanc que le lissage supprime. MODELLED : les statistiques du filtre sont vérifiées en interne

# text
seg-b81cd9204f64 = hatch (HatchFilter), pvt (assemble_epoch_precise_smoothed, CarrierSmoother)

# text
seg-e892fffaaf07 = hatch::tests (traversée sans bruit ; variance du bruit blanc 1/(2N-1) ; redémarrages) ; tests/hatch_wettzell_oracle.rs::hatch_finding_is_pinned (WTZR 2025-02-24 01-06 h, { "600" } époques, N = { "100" } : erreur 3D médiane { "1.553" } -> { "1.116" } m, p95 { "3.473" } -> { "3.207" } m)

# text
seg-1bbd39c17347 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Concordance de format sur un véritable fichier RINEX { "4.00" } publié (les valeurs relues égalent les littéraux imprimés du fichier) et un en-tête dérivé de la spécification ; aucun lecteur indépendant n'a été exécuté, donc MODELLED

# text
seg-bdda05057c91 = rinex_obs (parse_obs)

# text
seg-44b76c5cb13e = tests/rinex4_obs_mao0.rs (les { "4" } premières époques du fichier RINEX { "4.00" } MGEX de l'IGS MAO000USA_R_20231980000_01D_30S_MO, { "58" } satellites, { "7" } systèmes : les enregistrements d'en-tête et les valeurs de la première époque égalent les littéraux publiés) ; rinex_obs::tests::parses_a_rinex_4_header_with_its_new_records (en-tête synthétique { "4.02" } issu de la spécification)

# text
seg-5afb3c4bf171 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Préenregistrée (7aa264b, 110fef9) par rapport à une orbite précise IGS MGEX avec les GEO ; aucun produit de ce type n'était accessible depuis la session qui l'a construite, de sorte que la comparaison est en attente et que la ligne est MODELLED (vérifiée seulement par rapport aux positions GEO nominales publiées)

# text
seg-439e23a5567e = rinex (RinexEphemeris::sv_position_ecef_bds_geo, NavParseOptions)

# text
seg-8c86b4b3a731 = tests/bds_geo_broadcast_oracle.rs (véritables enregistrements C01-C04 : rayon géostationnaire, longitudes 140.02/80.04/110.55/159.99 deg aux positions publiées, |latitude| { "2.13" } deg avec l'inclinaison contre { "6.65" } sans ; la comparaison préenregistrée diffusé-contre-précis SP3 est conditionnée par les données sur KSHANA_BDS_GEO_SP3 et n'a pas été exécutée) ; rinex::tests

# text
seg-70f61250d256 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Cohérence interne : les mesures sont synthétisées à partir des modèles que le filtre utilise (χ² NEES/NIS sur des graines, une convergence sans bruit, injection de sauts). MODELLED ; aucune donnée de récepteur réel ni aucun filtre tiers n'est comparé

# text
seg-75c2ea59f607 = fusion::carrier_tc (run_carrier_tc, CarrierTcCfg), fusion::trajectory (truth_epochs)

# text
seg-e27a18b3aae9 = tests/fusion_carrier_tc.rs (trajet en 8 : RMS 3-D stable { "0.025" } m en phase porteuse contre { "0.470" } m en code sur des mesures identiques ; { "12" } graines, NIS/ddl moyen { "1.00" } et NEES/ddl stable { "0.92" } ; un saut de 1 cycle détecté à son époque sans fausse alarme et la solution intacte ; couper les corrections diffusées fait passer l'erreur de code de { "0.51" } m à { "19.6" } m (iono) et { "8.0" } m (tropo) ; l'exécution sans bruit converge à { "0.3" } mm)

# text
seg-6f3f6483690e = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Interne : les chiffres de mérite de chaque paquet par rapport à sa propre vérité et une comparaison lâche/serrée sur des entrées identiques. MODELLED ; la comparaison NaveGo de l'audit n'a pas été exécutée

# text
seg-2811d9348db2 = fusion::pack (TightCfg, [tight]), scénarios gnss-ins-maritime / gnss-ins-rail / gnss-ins-aviation

# text
seg-3f9bc3b0027f = tests/gnss_ins_packs.rs (chaque paquet : fusionné en dessous de l'INS libre pendant la panne pour les deux capteurs ; rail : serré { "5.3" } m contre lâche { "12.9" } m de classe navigation et { "15.6" } m contre { "18.8" } m de classe tactique pendant la panne, disponibilité { "0.97" } contre { "0.95" } ; table serrée validée) ; tests/gnss_ins_legacy_trajectory_pin.rs (la valeur par défaut à couplage lâche identique bit à bit)

# text
seg-2c7c37506aab = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Cohérence interne : vérité simulée à partir des propres modèles des filtres (χ² NEES sur des graines Monte Carlo, le paquet découplé sur des capteurs identiques). MODELLED

# text
seg-726b35d3e247 = fusion::coupled (CoupledPntFilter, CoupledPntBiasFilter, CoupledPnt3d), fusion (run_coupled_suite), hybrid (CoupledCfg)

# text
seg-260ef8ae3823 = tests/fusion_coupled_filters.rs (filtre 3-D sur { "60" } graines : NEES moyen de la seconde moitié { "8.12" } pour { "8" } états, somme de χ² de la dernière époque dans sa bande à { "95" } % ; un recalage d'horloge de { "0.1" } ns réduit le sigma de position 3-D de { "5.58" } m à { "3.07" } m ; filtre de biais sur { "60" } graines : somme de χ²({ "5" }) dans la bande, biais à moins de { "3" } sigma pour { "59" } sur { "60" } ; fusion-pnt-coupled avec accéléromètres biaisés : position p95 { "18.7" } m / { "90.0" } m et intégrité { "1.00" } / { "0.97" } couplé contre { "430" } m / { "4060" } m et { "0.006" } / { "0.000" } découplé) ; fusion::coupled::tests ; tests/fusion_coupled_pack.rs (fusion et hybrid sans [coupled] identiques bit à bit)

# text
seg-0866862d2264 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Interne : identités de cinématique du solide rigide, aller-retour CSV et propre covariance du filtre. MODELLED (aucun journal de conduite réel n'est comparé)

# text
seg-10d9b01f3ab2 = fusion::trajectory (TrajectoryCfg, Trajectory, kinematic_imu, parse_truth_csv), fusion::pack ([trajectory])

# text
seg-5a6b5289a473 = fusion::trajectory::tests (un virage coordonné n'a pas de force latérale et a un facteur de charge 1/cos φ ; l'import CSV reproduit un profil volé à { "1e-3" } m/s et { "1" } m près) ; tests/gnss_ins_trajectory_library.rs (chaque profil s'exécute et la fusion bat l'INS libre pendant la panne ; chacun vole son mouvement nommé ; observabilité du cap : sigma de lacet après { "240" } s { "1.27" } deg en croisière en ligne droite contre { "0.039" } deg en 8 et { "0.062" } deg en arrêt-départ) ; tests/gnss_ins_legacy_trajectory_pin.rs (résultat hérité et condensats de vérité identiques bit à bit)

# text
seg-5cb3b7bba7be = une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée : Mesurée par rapport à l'éphéméride CAPSTONE reconstruite de JPL Horizons (NAIF -1176, CAPSTONE_merged, ICRF centré sur la Lune, 2023-03-01..31 à { "10" } min), versionnée octet pour octet (tests/fixtures/capstone_horizons/, NOTICE.md), préenregistrée { "4e868170" } avant d'être récupérée, comme une mesure avec des seuils sur la géométrie moyenne. Pas une validation : le CR3BP omet le Soleil, l'excentricité de la Lune et le maintien à poste qu'a effectué CAPSTONE, de sorte que les seuils décrivent à quel point l'orbite du modèle est représentative, non une exactitude. Résultats : docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

# text
seg-5807e4274501 = cr3bp (differential_correct_halo, PeriodicOrbit)

# text
seg-adec908f7883 = tests/capstone_nrho_horizons.rs::cr3bp_nrho_matches_capstone_mean_geometry (CAPSTONE mars { "2023" }, { "4" } périlunes et { "5" } apolunes : période { "6.5004" } j contre { "6.5699" } j ({ "1.07" } %, seuil { "3" } %), apolune { "71 182" } contre { "71 215" } km ({ "0.05" } %, seuil { "5" } %), périlune { "3 385" } contre { "3 245" } km ({ "4.1" } %, seuil { "20" } %)) ; cr3bp::tests::reproduces_l2_southern_nrho_92_regime

# text
seg-30e946bde474 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Cohérence interne par rapport à une forme fermée : sous le modèle gaussien linéaire, la covariance des moindres carrés est sigma^{ "2" } (H^T H)^-1 (Kaplan et Hegarty (éd.), Understanding GPS: Principles and Applications, 2e éd., Artech House, { "2006" }, chap. { "7" }). Méthode et tolérances de la note de conception de géométrie { "0.36" }, section { "5.2" }, fixées dans un commit de préenregistrement avant la première exécution : chaque variance à { "5" } % près ({ "5" } erreurs standard d'une variance d'échantillon à N = { "20,000" }), chaque RMS à { "2.5" } % près, la corrélation est-nord à { "0.035" } près (5/sqrt(N)), chaque moyenne à { "5" } erreurs standard près, la fraction d'ellipse à { "95" } % à { "0.95" } +/- { "0.0077" } près ({ "5" } erreurs standard binomiales) ; les contrôles négatifs (PDOP doublé ; erreurs croissant comme 1/sin(élévation) par rapport à Q non pondéré) doivent échouer. COMMENT ELLE SE COMPOSE : Q est le facteur de covariance du noyau orbit::dop, VALIDATED par rapport à gnss_lib_py { "1.0.4" } sur ces mêmes { "8" } géométries dans tests/dop_reference.rs (ligne « Géométrie GNSS / dilution de précision ») ; cette ligne ajoute le passage de ces facteurs aux mètres par le solveur du moteur et n'emprunte pas le statut de cette ligne. POURQUOI MODELLED : aucun jeu de données externe n'est impliqué ; la concordance montre que l'estimateur et le bruit réalisent sigma x DOP sous le modèle de manuel, non que l'erreur d'un récepteur quelconque soit égale à UERE x DOP, et sigma_UERE est une entrée

# text
seg-d38407c0a9ab = dop_error_mc (run_geometry, check, TOLERANCES) ; dop_error_ci (run, GEOMETRIES) ; pvt (solve_spp) ; orbit (dop, dop_cofactor)

# text
seg-01d0a7046f8e = tests/uere_dop_monte_carlo.rs (position_error_is_sigma_times_dop_on_the_gnss_lib_py_geometries : les { "104" } contrôles passent à la première exécution après le préenregistrement e50c88d2, pire variance { "3.2" } %, RMS { "1.6" } %, corrélation { "0.012" }, moyenne { "2.2" } erreurs standard, fraction d'ellipse { "0.0039" } ; negative_control_a_doubled_pdop_fails_every_geometry ; negative_control_elevation_dependent_errors_fail_the_low_elevation_geometries : les deux contrôles échouent comme exigé ; position_error_is_sigma_times_dop_on_masked_skies : les deux géométries à ligne d'horizon masquée de la note de conception, le ciel 10sat-mixed sous les préréglages city-street ({ "4" } satellites, PDOP { "16.6" }) et container-terminal ({ "9" } satellites, PDOP { "2.5" }), les { "26" } contrôles passent à la première exécution après le préenregistrement 03999c11, tests/fixtures/dop/PREREGISTRATION-MASKED.md) ; tests/position_error_dop_ci.rs (un premier contrôle distinct sur quatre ciels choisis à la main (ouvert, groupé, canyon, demi-ciel ; sigma { "1" } m, graine 0x0D0B5EED) avec des intervalles de confiance du khi-deux à { "1e-6" } au total sur { "20" } contrôles : rapports de { "0.987" } à { "1.009" }, le PDOP/GDOP propre du solveur égal à celui du noyau à { "2.5e-12" } près, et des contrôles négatifs pour une erreur de DOP de { "10" } % et des erreurs en 1/sin(élévation) ; exécuté avant le préenregistrement, il est donc rapporté, non préenregistré) ; dop_error_mc::tests ; dop_error_ci::tests

# text
seg-d40d54b79e58 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Cohérence interne : la classification est vérifiée par rapport aux règles qu'elle énonce et par rapport à des rapports dérivés à la main sur des modifications synthétiques du journal de démonstration versionné, et les épinglages d'absence de changement conservent les sorties { "0.35.0" } : aucun score ne change sauf si la géométrie est mauvaise ; l'étiquette est toujours rapportée. POURQUOI MODELLED : les seuils sont choisis, non ajustés (provenance dans le geometry_model de chaque exécution ; les chiffres IEC 61108-1 et GPS SPS tels que cités, à vérifier par rapport au texte des normes), et il n'existe aucun jeu de données étiqueté externe de dégradation géométrique naturelle face à des attaques par rapport auquel valider la classification. Le DOP dérivé réutilise le noyau orbit::dop, VALIDATED par rapport à gnss_lib_py, dont cette ligne n'emprunte pas le statut. Une classe de géométrie est un énoncé sur le ciel, non un constat qu'aucune attaque n'a eu lieu

# text
seg-557c0aa72056 = receiver_trust (geometry: GeometryTracker, geometry_ratio, sky_ratio, geometry_points, GeometryLabel ; score: DeductionClass, score_with ; monitors ; live) ; telemetry (sample, prometheus, syslog, otlp)

# text
seg-fd57dab04d68 = tests/natural_degradation_trust.rs (a_stated_skyline_reads_the_fjord_as_geometry : sur le passage synthétique de fjord de scenarios/training/fjord-natural-degradation.toml, les mêmes { "624" } époques sont déduites avec et sans la [skyline] déclarée ; avec elle, sky-blocked est rapporté sur { "680" } époques ({ "0" } sans : le repli par écart d'azimut ne voit rien dans un fjord à deux côtés), open_fraction vaut { "0.758" }, et les époques de classe environment passent de { "78" } à { "33" }, le reste étant des pertes de satellites que la ligne d'horizon déclarée laisse à découvert ; en dehors de l'événement, la ligne d'horizon ne change aucun score) ; receiver_trust::geometry::tests (rapports dérivés à la main aux seuils, les bords des seuils, la rampe et le plafond, le plancher, les bords des étiquettes, les surcharges [geometry], le DOP sur le noyau validé, ciels maintenus et expirés, inconnu non deviné, perte de signal, la tolérance de mauvaise géométrie, sentinelles d'absence de point de position) ; tests/geometry_trust.rs (un ciel masqué correct étiqueté et non noté, un ciel masqué mauvais, une perte à basse élévation, une chute de puissance, un HDOP falsifié, une perte totale de signal, un entraînement de position pendant une mauvaise géométrie, une géométrie inconnue, des surcharges de session, le schéma en direct) ; tests/geometry_trust_no_change.rs (les deux sessions d'exemple identiques octet pour octet à { "0.35.0" } une fois les clés ajoutées retirées) ; tests/geometry_corpus_identity.rs (chaque corpus NMEA de navire versionné, aussi en ciel ouvert GPS seul, et les scénarios de formation d'équipage : identiques octet pour octet à { "0.35.0" } sauf les époques poor, qui diffèrent par la seule déduction de géométrie)

# text
seg-7e9cae219d72 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Interne : les formes fermées sont vérifiées par rapport à des valeurs calculées à la main (élévations du haut des murs d'une rue déclarée, la condition d'extrémité ouverte, la chute de courbure d'un point déclaré). Aucune référence indépendante externe : la note de conception cadre ces réductions comme MODELLED, et l'ElevationMask d'Orekit prend une table, de sorte que la comparaison de la ligne « Masque de ligne d'horizon dépendant de l'azimut : ensemble visible, azimut et élévation, et DOP sous le masque » lit leurs tables de 360 points comme des entrées et ne les vérifie pas

# text
seg-911ccf2cb486 = skyline (Canyon::cut_deg, Sector::contains, TerrainPoint::elevation_deg, reduce_terrain, SkylineCfg::build)

# text
seg-849ae7d82147 = skyline::tests (canyon_matches_hand_computed_wall_elevations ; terrain_takes_the_curvature_drop ; sectors_have_sharp_edges_and_wrap ; a_preset_is_overridden_or_added_to_field_by_field ; malformed_sections_are_refused)

# text
seg-7ade0dffb2d8 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Aucune : des dimensions choisies et déclarées, non un relevé d'une rue, d'un port, d'un fjord ou d'un terminal quelconque (le rapport d'aspect de la rue est dans la bande 0.5-2 d'Oke ({ "1988" }) ; le fjord est de l'ordre des fjords de l'ouest de la Norvège ; les piles utilisent la hauteur high-cube ISO { "668" }). Le test vérifie les préréglages par rapport à leurs propres dimensions déclarées, un contrôle de transcription, que la règle de validation ne compte pas

# text
seg-d5ba7b502aec = skyline (PRESETS, preset, preset_list)

# text
seg-ef3717bfca79 = skyline::tests (presets_carry_the_note_dimensions_and_provenance)

# text
seg-00884df89ab2 = ReferenceImpl

# text
seg-2ddc2b97e673 = vérifiée par rapport à une implémentation distincte de ce même code : indépendante de l'unité testée, mais sans autorité externe. Les facteurs DOP à horloge unique reposent sur le noyau validé par rapport à gnss_lib_py { "1.0.4" } (ligne « Géométrie GNSS / dilution de précision (DOP) ») ; les propres contrôles de cette ligne sont internes : sky_geometry reproduit orbit::dop et dop_cov sur la même géométrie, l'ellipse reproduit une décomposition propre 2x2 analytique, les entrées ECEF et azimut/élévation concordent, et le RMS et le confinement à { "95" } % du nuage à graine concordent avec la géométrie. La covariance ENU avec une horloge par système et l'ellipse sont VALIDATED dans la ligne « Ellipse d'erreur horizontale et cofacteur par système à partir de la covariance de géométrie » (numpy, P2) ; ce qui reste MODELLED ici est la composition : la propagation des préréglages vers un ciel représentatif, le nuage Monte Carlo (vérifié par rapport à la géométrie qu'il échantillonne, un contrôle d'autocohérence) et les surfaces. Les préréglages de constellation donnent un ciel représentatif, non un ciel daté ; le modèle d'erreur gaussien et l'UERE sont des entrées déclarées, non une exactitude mesurée ni une borne d'intégrité

# text
seg-4e6101547ab1 = geometry ; orbit (cofactor_from_los, dop_cov, dop) ; surface (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg)

# text
seg-8ee1ff6b9975 = geometry::tests (ellipse_of_an_analytic_two_by_two_case ; sky_geometry_equals_orbit_dop_on_the_same_visible_set ; ecef_input_matches_azimuth_elevation_input ; one_clock_per_system_adds_a_state_and_costs_geometry ; monte_carlo_is_seeded_and_agrees_with_the_geometry ; presets_propagate_and_are_seen_from_a_site) ; tests/dop_reference.rs (le noyau à horloge unique par rapport à gnss_lib_py)

# text
seg-0b5caf359b15 = vérifiée par rapport à une implémentation distincte de ce même code : indépendante de l'unité testée, mais sans autorité externe. Récursion de covariance clock_state à plusieurs pas (recoupement dans le même code) ; le noyau sous-jacent de variance de marche et d'inversion de holdover est validé de façon externe par rapport à scipy (voir « Variance de marche d'horloge en holdover et inversion de seuil »). Les chiffres de holdover à plancher de bruit rouge par classe restent MODELLED

# text
seg-085cbc64bab2 = holdover

# text
seg-b31ed8fc6801 = holdover::tests (par rapport à la récursion de covariance de Kalman à plusieurs pas ; FM blanc exact ; aller-retour) ; noyau de variance de marche validé de façon externe dans tests/gnss_denied_clock_holdover_reference.rs (par rapport à scipy Van-Loan/brentq)

# text
seg-8b8c97b664c2 = une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée : Enregistrements mesurés, réservés : horloges combinées finales IGS de { "30" } s des { "11" } satellites GPS Block IIF du 2026-03-01 au { "14" } (une fenêtre qu'aucun test n'avait ouverte ; IGS, ouvert avec attribution) et le récepteur u-blox ZED-F9P de JammerTest { "2024" } dans ses sessions stationnaires non notées (GPL-3.0-or-later). Comparaison externe D9 (préenregistrée 2ec76864, la déviation d'Allan prédite / mesurée de chaque fiche dans [1/1.5, { "1.5" }] à ses temps de moyennage ajustés), un constat (reste MODELLED) : { "10" } fiches GPS IIF sur { "11" } sont dans le seuil ; G27 est optimiste à l'échelle de deux heures ({ "0.662" } à { "7680" } s, pire facteur { "1.510" }), l'erreur périodique à l'échelle de l'heure qu'une fiche en loi de puissance ne porte pas. La fiche de TCXO de récepteur est bloquée : en dehors des transmissions journalisées, les autres sessions du jeu de données laissent { "167" } époques contre les { "3600" } exigées. Rapporté, non à l'aveugle (enregistrements ouverts par des lignes antérieures) : la fiche du césium 5071A est dans le seuil (pire { "1.070" } jusqu'à { "4096" } s), la fiche de l'OCXO est prudente et en dehors ({ "2.348" } à { "128" } s ; son plancher de bruit change pendant l'enregistrement), et la fiche du strontium de Norcia ajustée sur les trois points publiés les plus courts est dans le seuil aux deux points notés ({ "1.291" }, { "1.405" }). Les masers à hydrogène passifs Galileo (aucune source sans identifiant des horloges Galileo finales n'est accessible) et la Deep Space Atomic Clock (une seule valeur ouverte en vol) sont bloqués. D9 tour { "2" }, le TCXO de récepteur ZED-F9P comme classe de modèle sur { "14" } jours de { "12" } stations statiques de Wroclaw (Zenodo { "6488497" }, CC BY { "4.0" } ; préenregistré fb475550), un constat : avec le pipeline enregistré, { "11" } stations sur { "12" } n'étaient pas évaluables (le RAIM a rejeté la plupart des époques sans ionosphère) et BX14 a échoué ; une réexécution divulguée avec un pipeline corrigé (préenregistrée c9cc0d49) fait passer { "1" } station aveugle sur { "11" } (BX12, { "1.412" } ; BX07 { "1.532" } et BX13 { "1.542" } juste en dehors), parce que des horloges de récepteur en point unique issues de fichiers de { "30" } s intermittents ne sont pas un enregistrement d'oscillateur propre

# text
seg-2a3a7ee9e8f3 = clock_library (card, condition, series), realdata::clk, allan (lag1_noise_id)

# text
seg-578497ef82a5 = tests/clock_library_device_cards_oracle.rs (gps_iif_cards_reproduce_the_recorded_finding ; receiver_training_is_blocked_by_the_epoch_minimum ; non_blind_cards_are_reported ; préenregistré 2ec76864) ; clock_library::card::tests ; clock_library::condition::tests ; clock_library::series::tests ; realdata::clk::tests ; tests/clock_library_f9p_cards_oracle.rs (f9p_first_pipeline_reproduces_the_recorded_finding ; f9p_corrected_pipeline_reproduces_the_recorded_finding ; conditionné par les données)

# text
seg-a2202f0e06b2 = une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée : Enregistrements mesurés, réservés : horloges combinées finales IGS de { "30" } s des { "11" } satellites GPS Block IIF du 2026-04-01 au { "14" } (une fenêtre qu'aucun test n'avait ouverte ; IGS, ouvert avec attribution). Comparaison externe D9 (préenregistrée fb475550, la déviation d'Allan prédite / mesurée dans [1/1.5, { "1.5" }] à chaque temps de moyennage ajusté sur chaque satellite), un constat (reste MODELLED) : { "9" } fiches sur { "11" } sont dans le seuil ; G03 ({ "1.947" }) et G25 ({ "1.581" }) sont optimistes entre { "60" } s et { "2000" } s parce que leurs enregistrements réservés sont plus bruités que leurs tiers d'ajustement (la partie réservée de G25 porte { "16" } lacunes et { "29" } valeurs aberrantes de phase), un changement de l'horloge plutôt qu'un terme périodique manquant. Retirer les termes périodiques de la prédiction fait échouer les { "11" } fiches ({ "1.77" } à { "4.96" }), de sorte que les termes portent la prédiction

# text
seg-d302e2ef46ad = clock_library (card)

# text
seg-00637c1e69f0 = tests/clock_library_periodic_cards_oracle.rs (periodic_cards_reproduce_the_recorded_finding ; préenregistré fb475550) ; clock_library::card::tests (a_periodic_card_carries_the_sinusoid_a_power_law_card_cannot)

# text
seg-1c858b039ab0 = vérifiée par rapport à une implémentation distincte de ce même code : indépendante de l'unité testée, mais sans autorité externe. filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), avec F via scipy.linalg.expm et Q via la matrice par blocs de Van-Loan { "1978" } : une implémentation de référence indépendante reproduisant toute la trajectoire du filtre de kshana. Cohérence entre implémentations : la physique de l'horloge / l'étalonnage d'Allan ne sont pas validés de façon externe, de sorte que cela reste MODELLED. Comparaison externe { "0.30" }, un constat (reste MODELLED) : sur des horloges IGS finales de { "30" } s de { "11" } satellites GPS Block IIF (2025-08-17 au { "30" }), avec Q ajusté sur l'ADEV de la première moitié et le filtre noté sur la seconde moitié réservée, le filtre est cohérent à un pas d'avance ({ "0.906" } à { "0.971" } des époques dans sa bande à { "95" } %, seuil { "90" } %) mais trop confiant à une heure sur { "9" } des { "11" } horloges ({ "0.486" } à { "0.829" }) et ses sommes d'innovation tombent en dehors de [{ "2.4" }, { "3.6" }] sur { "5" }. Le bruit de phase blanc ajusté est nul sur chaque satellite, et l'erreur à l'échelle de l'heure (termes périodiques, FM flicker) n'est pas dans le modèle à 3 états. { "0.30" } tour { "2" }, un filtre étendu (FM flicker et états une et deux fois par révolution) sur de nouvelles horloges IGS réservées du 2025-09-01 au { "14" } (préenregistré 4b1a841e), un constat (reste MODELLED) : les critères de cohérence à un pas et à une heure tiennent sur les { "11" } satellites ({ "0.948" } à { "0.988" } et { "0.907" } à { "0.996" }), mais le critère de somme d'innovation échoue sur G24 ({ "0.964" }) et G30 ({ "1.929" }) par rapport à [{ "2.4" }, { "3.6" }]. D9 tour { "3" }, le filtre étendu du tour 2, réglage et critères inchangés après le détecteur de conditionnement clock_library figé, sur de nouvelles horloges IGS du 2026-04-01 au { "14" } (préenregistré fb475550), un constat (reste MODELLED) : (a) pas unique { "0.941" } à { "0.968" } et (c) moyenne du triple NIS { "2.641" } à { "3.549" } tiennent sur les { "11" } satellites ; (b) une heure échoue sur G09 ({ "0.894" }) et G26 ({ "0.876" }) par rapport à { "0.90" }

# text
seg-3016100a7015 = clock_state::tests (van-Loan Q analytique ; NEES ; positivité de la DSP) ; tests/clock_state_reference.rs (trajectoire complète de prédiction + mise à jour : état x et covariance P de { "3" }×{ "3" } sur { "1925" } pas / { "4" } jeux de paramètres par rapport à filterpy { "1.4.5" } ; pire |relΔ| { "2.8e-14" }) ; tests/clock_state_igs_holdout_oracle.rs::three_state_filter_on_held_out_igs_clocks_finding (fige le constat) ; tests/clock_state_ext_igs_fresh_oracle.rs::extended_filter_on_fresh_igs_clocks_finding ; tests/clock_state_ext_igs_conditioned_oracle.rs::conditioned_extended_filter_finding (D9 tour { "3" })

# text
seg-27554b73549b = une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée : Amplitude de Sagnac vérifiée par rapport à une VALEUR PUBLIÉE faisant autorité : N. Ashby, « Relativity in the GPS », Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), éq. { "1.29" } : un tour de l'équateur vers l'est accumule { "207.4" } ns (2ωA_E/c²) ; kshana reproduit { "207.386" } ns. Corroborée indépendamment par le geodist() de RTKLIB { "2.4.3" } (Takasu, BSD-2-Clause), qui porte la même géométrie 2Aω/c². Le budget composite BIPM TWSTFT transpondeur/vue commune/PPP n'a aucune référence indépendante externe, de sorte que la capacité reste modélisée

# text
seg-509026100595 = timetransfer, timetransfer_adv

# text
seg-a1ad8fb8537d = timetransfer::tests (annulation réciproque ; identité de Sagnac sous deux formes) ; tests/time_transfer_error_budgeting_reference.rs (Sagnac de tour de l'équateur = { "207.386" } ns contre le { "207.4" } ns publié d'Ashby à <{ "0.05" } ns près ; plus géométrie Sagnac/geodist recoupée avec le geodist() de RTKLIB { "2.4.3" } compilé à partir du source C)

# text
seg-a5714c98b299 = une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée : Corrélation croisée/autocorrélation des codes de Gold GPS C/A concordant EXACTEMENT (entiers ±65/−1/63) avec une génération de code IS-GPS-200 indépendante ; forme de la DSP BPSK-R({ "1" })/BOC({ "1,1" }) par rapport à un périodogramme scipy indépendant. Les formes fermées de modulation/SSC/DLL (Betz { "2001" } / Kaplan & Hegarty) restent analytiques, de sorte que la ligne reste MODELLED, mais la sous-affirmation de corrélation de code est concordante de façon externe. { "0.30" } tour { "2" }, par rapport aux valeurs imprimées de Betz { "2001" } et de Hein et al. { "2006" } (préenregistré 9f4f2ce8, une demi-unité imprimée), un constat (reste MODELLED) : les { "45" } cellules spectrales du Tableau { "1" }, les valeurs de corrélation à { "1" } GHz, les chiffres d'interférence MBOC et { "2" } des { "3" } décalages de la Fig. { "17" } concordent ; les premiers lobes latéraux à { "24" } MHz, le décalage BOC({ "8,4" }) de la Fig. { "17" } et chaque biais de multitrajet du pire cas des Figs. 18-21 (de { "11" } à { "15" } % trop bas) ne concordent pas. Kshana et une évaluation NumPy indépendante de la lecture préenregistrée concordent, de sorte que l'écart tient à cette lecture ou à un détail non précisé de l'article ; cause non résolue

# text
seg-10e0cb39ac3b = navsignal

# text
seg-1035f877de94 = navsignal::tests (auto-SSC BPSK = 2/3R_c ; DSP d'aire unitaire ; DLL) ; tests/nav_signal_modulation_code_tracking_reference.rs (correspondance exacte en entiers de la corrélation croisée/autocorrélation des codes de Gold GPS C/A par rapport à une génération de code IS-GPS-200 indépendante ; DSP BPSK-R({ "1" })/sine-BOC({ "1,1" }) par rapport à un périodogramme scipy indépendant) ; tests/nav_signal_betz_hein_published_oracle.rs (betz_text_correlation_values_over_1_ghz ; hein_mboc_interference_improvements ; finding_betz_side_lobes_and_multipath, figé)

# text
seg-9fe0ec8c4531 = une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée : Vecteurs numériques publiés de l'article principal CAI (fonction de transfert de Cheinet { "2008" } ; sensibilité de Peters/Freier) : k_eff·T² concordant exactement, DSA du bruit de grenaille un plancher unilatéral à ~{ "2" }× près de chaque instrument publié (les dispositifs réels portent un bruit technique au-dessus du plancher quantique). Un encadrement, non une parité. { "0.30" } tour { "2" } (préenregistré fcb9ac64), un constat (reste MODELLED) : le bruit de rotation QPN seul par rapport aux points mesurés de Gauguet et al. { "2009" } Fig. { "14" } donne des rapports de { "0.695" } à { "0.788" } aux trois points admis ({ "0.751" } au point de fonctionnement), manquant de { "0.5" } point le seuil préenregistré de { "30" } % ; le plancher QPN se situe de { "21" } à { "31" } % sous le bruit mesuré, comme on s'y attend d'un modèle sans bruit laser ni de détection. La composition en gradiomètre concorde avec la ligne du modèle QPN de Janvier et al. { "2022" } (rapport { "1.013" } à { "1.017" }, Reference). Le test mesuré ne peut pas discriminer une erreur de composition en sqrt({ "2" }) ; seule la ligne de Janvier à contraste inégal le peut

# text
seg-4e1ac3f1b4a1 = quantum_imu::tests (k_eff ; Mach-Zehnder T² ; encadrement du plancher Freier-2016) ; tests/quantum_inertial_sensor_reference.rs (fonction de transfert |H(ω)|, k_eff·T² et DSA du bruit de grenaille par rapport aux vecteurs numériques publiés de Cheinet { "2008" } / Peters / Freier) ; tests/quantum_inertial_measured_qpn.rs (gauguet_finding_qpn_floor_sits_below_the_measured_noise, figé ; gradiometer_qpn_line_matches_janvier_model)

# text
seg-0b9af8a14a54 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Autocohérence du modèle de franges de l'interféromètre : le bord de demi-frange, la structure de repliement périodique en 2π et l'annulation du facteur d'échelle dans le rapport portée/résolution sont des identités algébriques sous forme fermée vérifiées par rapport aux propres fonctions de phase et de sensibilité Mach–Zehnder du moteur : des contrôles de cohérence interne, PAS un jeu de données externe, de sorte que la ligne reste InternalConsistency. MODELLED : ambiguïté de frange idéale à trois impulsions ; aucune borne d'aberration de front d'onde ni de perte de contraste sur la portée non ambiguë

# text
seg-81802510f112 = quantum_imu::tests (a_max se situe au bord de demi-frange ±π avec la mise à l'échelle de portée en 1/T² ; la récupération de phase repliée est exacte dans [−a_max,a_max] et se replie d'exactement { "2" }·a_max en dehors ; la plage dynamique non ambiguë a_max/σ_a=π/σ_Φ est identique pour deux facteurs d'échelle longueur d'onde/T très différents ; les méthodes de CaiAccelerometer concordent avec les fonctions libres)

# text
seg-91728172ea50 = vérifiée par rapport à une implémentation distincte de ce même code : indépendante de l'unité testée, mais sans autorité externe. Intégration SDE Monte Carlo numpy indépendante d'un bruit d'accélération blanc doublement intégré (valide la variance VRW analytique par un algorithme véritablement indépendant) + un ancrage de valeur publiée de Groves { "2013" } pour les termes de biais/facteur d'échelle ; les chiffres des dispositifs CAI quantifient du matériel partenaire et restent MODELLED

# text
seg-ccc56dac1725 = inertial::quantum_imu (QuantumNavBudget)

# text
seg-60fb2adb58ce = budget_tests (biais par rapport à l'intégrateur AccelModel ; VRW par rapport à l'intégrale analytique) ; tests/quantum_inertial_dead_reckoning_reference.rs (VRW par rapport à une double intégration Monte Carlo numpy indépendante d'un bruit d'accélération blanc, pire écart { "0.42" }% dans ±{ "3" }% sur { "6" } durées de marche ; biais/facteur d'échelle par rapport à une valeur sous forme fermée de Groves { "2013" } ; allers-retours de holdover)

# text
seg-8bc5bc7d553c = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Équation de bilan de liaison de C/N₀ anti-brouillage recoupée avec une redérivation numpy indépendante (partage la même forme fermée → InternalConsistency) plus une caractérisation de la dégradation du C/N₀ de JammerTest-2024 réel. { "0.30" } tour { "2" }, bloqué (reste MODELLED) : la chute mesurée du C/N0 de JammerTest { "2024" } par rapport à une prédiction de bilan de liaison (préenregistrée 6a66994b, à { "3" } dB près) n'a pas été exécutée parce que la position et le pointage de l'antenne F8.1 à Bleik et la part L1 de la puissance de rampe multibande { "1.6.4" } ne sont documentés ni dans le catalogue d'essais ni dans le journal officiel

# text
seg-8f6825f614c7 = jamming::tests (broadband_q_equals_the_spectral_separation_closed_form et cw_q_equals_the_spectral_separation_closed_form : la table Q, CW et bande étroite { "1" }, large bande et balayé { "2" }, figée sur les formes fermées de navsignal ; a_cw_jammer_is_more_damaging_than_broadband_noise_at_equal_js) ; tests/gnss_denied_jamming_resilience_reference.rs (FSPL/J-S/C-N₀ effectif par rapport à une redérivation numpy indépendante du bilan de liaison de Kaplan & Hegarty §{ "9.4" } ; le C/N₀ réel de JammerTest chute de façon monotone en passant le seuil de { "25" } dB-Hz) ; tests/jamming_jammertest_cn0_oracle.rs (préenregistré, bloqué, non exécuté)

# text
seg-26b6c4436ca0 = une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée : Paramètres de scénario TEXBAT (Humphreys { "2012" }) : une caractérisation, non des vecteurs figés. Comparaison externe { "0.30" }, un constat (reste MODELLED) : sur JammerTest { "2024" } (Bleik ; données GPL-3.0), les moniteurs de niveau observable (khi-deux assisté par l'horloge, RAIM, échec de résolution) n'ont levé aucune alarme dans les { "10" } s suivant l'un quelconque des { "8" } débuts de leurrage publiés évaluables (là où la fenêtre précédant le début était propre, la première alarme est venue { "10.2" } à { "39" } s après le début du créneau publié), et trois fenêtres précédant le début portaient de fausses alarmes du moniteur d'horloge ({ "81" }, { "64" } et { "173" } époques). Le premier effet observable a été une perte de poursuite GPS bifréquence, non une incohérence RAIM. Les débuts publiés sont des débuts de créneau du calendrier à la résolution de la minute ; qu'ils précèdent la capture RF est une interprétation, non une mesure. { "0.30" } tour { "2" }, par rapport au journal JammerTest { "2024" } officiel des organisateurs (résolution à la seconde ; préenregistré 6a66994b avec un moniteur d'horloge à trois états calibré par Hadamard sans verrouillage), un constat (reste MODELLED) : le moniteur alarme dans les { "10" } s pour { "4" } des { "10" } débuts journalisés ; pour les six autres, il est en retard de { "18" } à { "211" } s ou lève de fausses alarmes d'horloge avant le début ({ "1" } à { "2.1.4" }, { "85" } à { "2.3.15" }). D9 tour { "3" } (une fiche de récepteur issue des autres sessions de l'unité JammerTest, préenregistrée 2ec76864) bloqué : { "167" } époques d'entraînement contre { "3600" }. D9 tours { "4" } et 4b (niveaux de bruit issus d'une fiche de classe de modèle u-blox ZED-F9P, Wroclaw { "2021" }, préenregistrés fb475550 ; 4b une réexécution divulguée avec une extraction corrigée, c9cc0d49), un constat (reste MODELLED) : zéro fausse alarme avant le début sur les { "10" } débuts journalisés et { "6" } sur { "10" } dans les { "10" } s ; { "2.1.1" }, { "2.3.5" }, { "2.3.10" } et { "2.6.1" } restent en retard (+{ "211" }, +{ "23" }, +{ "18" }, +{ "51" } s), inchangés par le niveau de bruit d'horloge

# text
seg-e3ed02029c26 = spoof, spoof_detect, spoof_monitors

# text
seg-d6db95d3aa40 = tests/spoof_texbat_validation.rs (caractérisation des paramètres TEXBAT) ; tests/spoof_detection_jammertest_oracle.rs::monitors_against_the_published_onsets_reproduce_the_recorded_disagreement (fige le constat) ; tests/spoof_detection_jammertest_log_oracle.rs::engine_monitors_against_the_logged_onsets_reproduce_the_recorded_disagreement ; tests/clock_library_tcxo_card_jammertest_oracle.rs (round_3_is_blocked_by_the_training_minimum ; round_4_reproduces_the_recorded_finding ; round_4b_reproduces_the_recorded_finding ; D9)

# text
seg-964d859381f5 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Compose des primitives validées (allan/holdover van-Loan, plancher de sécurité) ; calibrée sur le scénario JammerTest { "2024" } { "2.1.1" } (~{ "1.01" } ms de traction réelle du temps servi contre ≤{ "51" } ns annoncés). Pont au-dessus de parties validées, non une validation externe en soi. Comparaison externe { "0.30" }, un constat (reste MODELLED) : sur les scénarios de leurrage JammerTest { "2024" }, l'erreur mesurée non détectée du temps servi dépasse le TPL nominal à { "3" } des { "8" } débuts détectés : { "184.3" } contre { "34.6" } ns ({ "2.1.4" }), { "295.7" } contre { "159.3" } ns ({ "2.3.5" }) et { "143.0" } contre { "69.0" } ns ({ "2.3.11" }) ; trois des cinq à l'intérieur sont triviaux (une fausse alarme verrouillée avant le début). Cause probable : le terme de marche issu d'un étalonnage de { "60" } s sans bruit de dérive ne couvre pas la divagation de fréquence du TCXO du récepteur sur { "15" } à { "39" } s. L'erreur mesurée est l'estimation d'horloge en point unique de Kshana elle-même par rapport à une droite ajustée sur ses propres estimations précédant le début, de sorte que même une concordance n'aurait pas été entièrement indépendante. { "0.30" } tour { "2" }, par rapport aux débuts du journal JammerTest { "2024" } officiel et à l'erreur de temps mesurée du récepteur (préenregistré 6a66994b), un constat (reste MODELLED) : à { "4" } des { "10" } débuts journalisés, l'erreur non détectée dépasse le TPL à état de dérive ({ "634.7" } contre { "458.5" } ns à { "2.1.1" }, { "232.6" } contre { "16.2" } ns à { "2.3.5" }, { "41.3" } contre { "6.0" } ns à { "2.3.10" }, { "218.6" } contre { "47.4" } ns à { "2.6.3" })

# text
seg-9cb72e60e080 = tpl

# text
seg-b96e16aba41a = tpl::tests (références sous forme fermée + CUSUM) ; examples/tpl_jammertest.rs (étalonnage de leurrage réel JammerTest { "2024" }) ; tests/tpl_jammertest_coverage_oracle.rs::tpl_against_measured_time_error_reproduces_the_recorded_disagreement (fige le constat) ; tests/tpl_jammertest_log_oracle.rs::drift_state_tpl_against_the_logged_onsets_reproduces_the_recorded_disagreement

# text
seg-f2efb9b15383 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Coefficients IGRF-14 ; CRLB de filtre adapté de premiers principes. Le champ du benchmark de gravité en champ réel est vérifié de façon externe (ligne « Synthèse d'anomalie de gravité à partir d'un modèle en harmoniques sphériques »), mais son résultat de navigation n'a aucune référence indépendante externe

# text
seg-6094ed4985fc = altpnt, mapmatch, gravimeter, igrf

# text
seg-f841812dc204 = tests/alternative_complementary_pnt_reference.rs (CRLB de recalage sur carte ; champ IGRF-14) ; mapmatch::tests ; gravimeter::tests ; igrf::tests ; tests/gravity_map_real_field.rs (le benchmark de 60 min privé de GPS sur le champ réel EGM2008 de degré 70, préenregistré dans xval/icgem-egm2008/ : recalé à { "3106" } m, de sorte que le seuil < { "500" } m est NOT MET et affirmé comme manqué, et la réduction par dix de la dérive de { "70.6" } km est MET ; plus le Monte Carlo à graine de l'erreur de carte) ; altpnt::terrain::tests::emag2_format_grid_reproduces_the_synthetic_magnetic_channel et tests/emag2_real_grid.rs (lecteur EMAG2v3 conditionné par les données sur un véritable extrait ; aucun résultat de navigation n'est revendiqué dessus) ; tests/terrain_slam_rbpf.rs (estimation conjointe de la carte, un RBPF de type FastSLAM, par rapport au SITAN à carte connue sur une erreur de carte corrélée de { "15" } m sur { "20" } graines, préenregistré dans xval/terrain-slam-rbpf/ : gain moyen de { "1.5" }% et meilleur sur { "10" } des { "20" }, de sorte que les seuils de { "10" }% et de 12 sur 20 sont NOT MET et affirmés comme manqués ; aucun dommage sur une carte parfaite, MET)

# text
seg-d7fd40dc37c6 = une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée : Concordance du SBOM avec le schéma JSON CycloneDX { "1.5" } officiel (+ identifiants SPDX valides) : une norme publiée externe, zéro erreur de validation sur tout le graphe de dépendances ; la partie déterminisme des FoM / reproductibilité octet à octet reste un contrôle d'autocohérence figé, de sorte que la ligne reste MODELLED

# text
seg-4bcb7eeb020a = report, scenario ; CI (golden/determinism/SBOM)

# text
seg-3667ebf0582a = tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs ; tests/reproducibility_software_assurance_reference.rs (le SBOM généré est validé sans erreur par rapport au schéma JSON CycloneDX { "1.5" } officiel sur tout le graphe livré de 66 composants : fonctionnalités default + python + wasm, dev-dependencies exclues)

# text
seg-a014f82f28b0 = Évaluation de la détection de dégradations RF par apprentissage automatique ({ "13494" })

# text
seg-400e45e7e700 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Bornes d'AUC sous forme fermée (Mann–Whitney) + un détecteur à référence parfaite ; le corpus est SYNTHÉTIQUE (fondé sur des paramètres, ni terrain ni IQ)

# text
seg-e4edd8fd654c = impairment_eval::tests (AUC parfaite=1/identique=0.5/égalité={ "0.125" }, ROC monotone, fusionné>{ "0.8" }, séparation par couche de classe, garde contre les fuites, corpus reproductible, les indicateurs de décalage de distribution signalent l'optimisme) ; dominance_demonstrators (accessible + reproductible + MODELLED, non VALIDATED + écart d'optimisme autocohérent)

# text
seg-7566da9904ba = Étude de l'écart d'optimisme de la détection de dégradations RF par apprentissage automatique et prédicteur d'écart à identifiants seuls

# text
seg-0d7f46d20a0d = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Statistiques dérivées à la main par rapport aux formes fermées (AUC binormale Φ(d'/√{ "2" }), variance de DeLong, Spearman à rangs ex aequo, récupération MCO exacte) + validation croisée leave-one-out par rapport à la référence de base de prédiction de la moyenne. Le corpus est SYNTHÉTIQUE (fondé sur des paramètres, jamais terrain ni IQ) et l'écart d'optimisme est un décalage de sévérité synthétique→synthétique, PAS un résultat de simulation à terrain

# text
seg-28583cba1c55 = impairment_study, impairment_ml, eval_stats

# text
seg-b30ce36e7afb = impairment_study::tests (AUC de référence par classe≈{ "1" }, écart d'optimisme appris>{ "0" }, forme de grille + l'IC bootstrap encadre la moyenne + tendance d'échelle positive, caractéristiques d'identifiants finies, le prédicteur d'écart bat la prédiction de la moyenne sous les DEUX validations croisées leave-one-detector-out et leave-one-class-out + déterministe) ; impairment_ml::tests (logreg sépare + déterministe + perte↓, un MLP résout le XOR qu'un modèle linéaire ne peut pas + à graine) ; eval_stats::tests (bootstrap/DeLong/Spearman/ridge par rapport aux formes fermées)

# text
seg-590ec8589ce6 = une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée : Le noyau d'ajustement ADEV mesuré→DSP (NNLS) est concordant avec scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) : un noyau externe indépendant ; mais les CHIFFRES de l'arbitrage quantifient (sans jamais valider) une horloge/un CAI partenaire, de sorte que l'arbitrage lui-même reste MODELLED, sans halo de validation

# text
seg-e0f68f57399d = quantum_trade::tests (récupération aller-retour de l'ADEV, non-négativité NNLS, mise en garde sur le plancher présente/absente, bénéfice>{ "1" }, enveloppe monotone + borne alt-PNT) ; dominance_demonstrators (l'ADEV mesuré est piloté par les données et non supposé par le plancher, la classe supposée signale le plancher + la mise en garde, courbe malformée rejetée, MODELLED, non VALIDATED)

# text
seg-7d1d24d8f8f5 = une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée : Table définitionnelle Kp↔ap + forme fermée de la température exosphérique de Jacchia-1971 (concordante à <{ "1" } K près avec les ancrages publiés, tests/space_weather_reference.rs) ; la densité est caractérisée par rapport à pymsis NRLMSISE-00 (un modèle NRL indépendant) : l'oscillation du cycle solaire à { "800" } km est de 10.4x contre 13.6x pour NRLMSISE-00. Révision { "0.30" } : le facteur d'activité de premier ordre calibré a été remplacé par Jacchia { "1971" } (densité de scénario par défaut à { "400" } km { "4.176e-12" } -> { "6.929e-12" } kg/m3 ; reference_exospheric_temperature_k retiré, mean_exospheric_temperature_k ajouté). { "0.30" } tour { "2" }, densités d'accéléromètre TOLEOS CHAMP/GRACE/GRACE-FO mesurées (ESA Swarm DISC ; préenregistré 20eed695), un constat (reste MODELLED) : les moyennes d'orbite de { "400" } à { "500" } km sont à un facteur { "2" } près au maximum solaire hors tempêtes (CHAMP { "2001" } 521/521, GRACE-A { "2002" } 120/120, GRACE-FO { "2024" } 526/547), mais Jacchia { "1971" } est environ 1.7x trop dense au minimum solaire de { "2008" } (GRACE-A 412/544 à un facteur { "2" } près), de sorte que la densité n'est pas validée

# text
seg-550bd3cee63e = space_weather::tests (Kp↔ap exact aux points de grille + aller-retour + monotone, moyenne d'Ap quotidien, T exosphérique par rapport aux ancrages publiés de minimum/moyenne/maximum solaire + incrément de tempête, densité d'unité à la référence, oscillation du cycle solaire dans la bande observée de { "5" }–{ "10" }×, scénario reproductible + MODELLED, non VALIDATED + rejet hors plage) ; dominance_demonstrators (accessible + reproductible + T physique + MODELLED, non VALIDATED) ; tests/space_weather_density_accelerometer_oracle.rs::jacchia71_finding_is_pinned

# text
seg-83c77a559939 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Géométrie de lancement en trigonométrie sphérique sous forme fermée par rapport à des ancrages d'exemples résolus publiés (Vallado, Fundamentals of Astrodynamics 4e éd., Algorithme { "37" } d'azimut de lancement + chap. 6 changement de plan ; tests/launch_window_ascent_geometry_reference.rs). Ceux-ci réutilisent la même forme fermée que kshana implémente (une parité de valeur publiée / un contrôle de transcription, InternalConsistency) ; MODELLED à deux corps, sans modèle de triangle des vitesses en Terre tournante / d'ascension / de perte par traînée. Comparaison externe { "0.30" } avec Orekit { "12.2" } (Apache-2.0), un constat (reste MODELLED) : la géométrie concorde à l'arrondi près (inclinaison relue à partir de l'azimut de fin de combustion sur { "158" } cas, pire { "2.6e-15" } rad ; inclinaison minimale, vitesse circulaire et delta-v de dogleg à { "3e-16" } près), mais la vitesse du site due à la rotation de la Terre manque le seuil préenregistré de { "1e-6" } relatif à { "62.9" } deg de latitude ({ "1.12e-6" }). L'écart croît comme tan(lat), ce qui est cohérent avec un décalage de pôle par mouvement polaire d'environ { "5.8e-7" } rad dans le référentiel terrestre d'Orekit que le ω·R·cos(lat) sphérique omet. L'affirmation n'a pas été restreinte avant l'exécution, de sorte que la ligne ne peut pas être promue sur cette comparaison. { "0.30" } tour { "2" } (préenregistré 71bebf63) : avec une époque et des lignes IERS, la vitesse du site au pôle vrai (champ de scénario site_rotation_speed_true_pole_m_s) concorde avec Orekit à { "1e-6" } près sur { "24" } sites à quatre longitudes (pire { "4.9e-8" }), mais la vitesse nominale sans époque que le scénario émet par défaut comme gain de rotation de la Terre manque encore de { "1.12e-6" }, de sorte que la ligne reste MODELLED dans l'attente d'une décision sur la sortie par défaut

# text
seg-80847ffc93bf = launch

# text
seg-2095b880eb39 = launch::tests (un lancement vers l'est franc atteint i=latitude, KSC→ISS = { "45" }° de manuel, polaire = N/S, i<lat inatteignable, gain équatorial de { "465" } m/s, changement de plan de { "10" }° ≈ { "1.34" } km/s + { "180" }° = 2v, nombres d'occasions quotidiennes, scénario reproductible/MODELLED + trajectoire dogleg) ; dominance_demonstrators (accessible + reproductible + KSC→ISS { "45" }° + MODELLED, non VALIDATED) ; tests/launch_geometry_orekit_oracle.rs::burnout_azimuth_reproduces_the_target_inclination_in_orekit ; tests/launch_geometry_orekit_oracle.rs::earth_rotation_speed_gap_is_recorded_as_a_finding ; tests/launch_geometry_orekit_oracle.rs::true_pole_site_speed_matches_orekit_at_a_fresh_epoch_and_longitudes

# text
seg-2a0f9d168a02 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Entrée analytique d'Allen–Eggers sous forme fermée, recoupée en outre avec une intégration numérique scipy { "1.18" } solve_ivp (DOP853) de la MÊME EDO d'entrée à traînée seule (tests/ballistic_re_entry_corridor_reference.rs, { "36" } cas, pire a_max rel { "2.9e-9" }) : un contrôle intégrale numérique par rapport à sa propre forme analytique, donc toujours InternalConsistency, PAS une validation externe. MODELLED balistique (sans portance), sans aérothermique/TPS : la sortie de chauffage est une vitesse, non un flux thermique. Comparaison externe { "0.30" }, un constat (reste MODELLED) : par rapport à la reconstruction d'entrée de la SRC Stardust (Desai et Qualls, NASA NTRS { "20080008567" }), la décélération maximale d'Allen–Eggers pour l'état d'entrée inertiel imprimé ({ "12.9" } km/s, -8.2 deg, H { "7200" } m) est de { "61.8" } g contre { "32.89" } g pour la meilleure trajectoire estimée, +{ "88" } % contre une tolérance de { "15" } % : la solution à angle de trajectoire constant et sans gravité double à peu près le pic d'une entrée rasante, plus rapide que la vitesse de libération. Stardust ne portait aucun accéléromètre, de sorte que la reconstruction est une estimation de trajectoire. { "0.30" } tour { "2" }, bloqué (reste MODELLED) : une solution intégrée à masse ponctuelle plane (reentry::simulate_planar_entry, US76, gravité en inverse du carré, courbure) concorde avec les meilleures trajectoires estimées de Stardust et de Genesis à { "15" } % près (+{ "11.3" } %, +{ "5.6" } %), mais ces maxima sont des sorties de simulation d'agence, non des mesures, de sorte que ce n'est qu'un recoupement. La comparaison avec l'accéléromètre (préenregistrée a94a283d) est bloquée faute d'une copie lisible de l'analyse REMM de Hayabusa2 (doi 10.57350/jesa.16)

# text
seg-c763ac7e3cda = reentry::tests (g maximal indépendant du coefficient balistique + bande de g physique, croît avec un γ plus raide / une entrée plus rapide, vitesse du g maximal = V_e·e^(−1/2) et chauffage maximal = V_e·e^(−1/6) plus rapide, altitude du g maximal physique + plus profonde pour un B plus élevé, scénario reproductible/MODELLED + géométrie dégénérée rejetée) ; dominance_demonstrators (accessible + reproductible + fraction V_e·e^(−1/2) + MODELLED, non VALIDATED) ; tests/reentry_reconstruction_oracle.rs::reentry_overprediction_is_recorded_as_a_finding ; tests/reentry_point_mass_reconstruction_oracle.rs::point_mass_peak_deceleration_matches_reconstructed_entries (recoupement seulement) ; tests/reentry_point_mass_accelerometer_oracle.rs (bloqué, non exécuté)

# text
seg-f40cd1b25160 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Cohérence interne : l'efficacité spectrale calculée sous forme fermée à partir du K_bch du Tableau 5a et des longueurs de trame concorde avec les efficacités que le Tableau { "13" } imprime (un contrôle de transcription du tableau de seuils) ; les éléments du bilan de liaison concordent avec leurs formes fermées ; la sélection est monotone en Es/N0 et respecte la marge ; l'ACM transfère au moins le volume à codage constant. La géométrie des passages provient du prédicteur de passages apparents VALIDATED distinct. CE QUI NE L'EST PAS : aucun outil externe ni aucune liaison mesurée n'a été comparé ; les seuils sont les valeurs AWGN idéales de la norme, non celles d'un modem ; l'évanouissement par la pluie, la perte de pointage le long du passage et les pilotes ne sont pas modélisés.

# text
seg-885946a29a26 = contact_schedule (es_n0_db, select_modcod, fspl_db, atmospheric_loss_db, ccm_modcod, pass_capacity, AcmLinkScenario) ; passes::predict_passes_apparent

# text
seg-00889ed96256 = contact_schedule::tests::modcod_efficiency_closed_form_matches_the_printed_table ; contact_schedule::tests::modcod_selection_is_monotone_and_honours_the_margin ; contact_schedule::tests::link_budget_pieces_have_closed_forms ; contact_schedule::tests::acm_link_defaults_run_and_acm_beats_ccm

# text
seg-a90d5ba33c0b = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Cohérence interne : la méthode exacte par séparation et évaluation concorde avec l'énumération exhaustive sur de petits ensembles aléatoires, chaque plan est vérifié comme réalisable par rapport aux règles de conflit, et l'algorithme glouton ne bat jamais l'optimum exact. CE QUI NE L'EST PAS : aucun ordonnanceur externe ni plan opérationnel n'a été comparé ; les contacts sont pris en entier (sans découpage), l'arriéré est fixé au début de la fenêtre, le temps de pivotement au-delà du temps de retournement fixe et le stockage à bord ne sont pas modélisés.

# text
seg-dece72e58683 = contact_schedule (conflicts, objective, delivered, schedule_chronological, schedule_greedy, schedule_optimal, ContactScheduleScenario)

# text
seg-d21204ff6b58 = contact_schedule::tests::conflicts_cover_turnaround_and_one_station_per_satellite ; contact_schedule::tests::greedy_is_feasible_and_the_exact_solver_beats_or_ties_it ; contact_schedule::tests::exact_solver_matches_brute_force_and_plans_are_feasible ; contact_schedule::tests::exact_solver_declines_above_the_limit ; contact_schedule::tests::contact_schedule_defaults_run_reproducibly ; contact_schedule::tests::scenarios_reject_bad_inputs

# text
seg-7ead676849f9 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Arithmétique de coût sous forme fermée par rapport à des valeurs dérivées à la main ; un CADRAGE économique d'un chiffre de couverture modélisé, non un devis ni un modèle de coût validé

# text
seg-c6fab6332435 = frugal (over walker)

# text
seg-257dfa053c24 = frugal::tests (coût par couverture dérivé à la main 48/96={ "0.5" }, rapport de ROI { "2.667" }, ordre des encadrements + gardes de couverture nulle)

# text
seg-8204455973cc = vérifiée par rapport à une implémentation distincte de ce même code : indépendante de l'unité testée, mais sans autorité externe. Compose la classification RAIM Stanford validée de façon externe (raim::classify_stanford) ; la correspondance détection manquée→AL elle-même est modélisée, non une allocation d'intégrité certifiée

# text
seg-412105b0f541 = integrity_impact (over raim)

# text
seg-35bc1db56d2a = integrity_impact::tests (le même manque bascule Available→MI→HMI à mesure que le contexte se resserre ; PL prudent→Unavailable ; HMI par axe ; gardes d'entrée)

# text
seg-7bb58c89a1fb = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Cohérence interne : l'encadrement VRW cité recoupé avec la physique de CaiAccelerometer::accel_asd + la plage dynamique brute calculée à partir de la limite d'ambiguïté de frange ; les chiffres sont des encadrements MODELLED issus d'une étude de la littérature (needs_source_confirmation), aucun dispositif validé, aucun halo de validation

# text
seg-fd95a229bdb3 = inertial::cai_params (over inertial::quantum_imu)

# text
seg-061a65493a4a = inertial::cai_params::tests (le VRW physique tombe dans l'encadrement VRW cité aux { "3" } niveaux ; plage brute d'ambiguïté de frange calculée à partir de k_eff·T² ; le budget prudent dérive plus que le meilleur ; chaque encadrement est sourcé + marqué à confirmer ; gardes d'ordre des encadrements)

# text
seg-3f5094fa7a30 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Réimplémentation numpy indépendante de la règle à quatre régions (scripts/gen_tib_scorer_reference.py) sur le même ensemble d'échantillons ; méthode Cited d'après le diagramme d'intégrité Stanford–ESA (Tossaint et al., ION GNSS { "2007" }) et RTCA DO-229 WAAS MOPS. PAS une référence indépendante de précision ExternalDataset : le benchmark est honesty-immune.

# text
seg-07ef7fe3d770 = src/benchmark/stanford.rs::tests (quatre régions + bornes inclusives + |erreur| + indisponibilité PL>AL) ; tests/tib_scorer_reference.rs (comptes de classification par rapport à numpy indépendant sur un ensemble synthétique fixe)

# text
seg-10befbc6faae = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Recomptage de régions numpy indépendant dans tests/fixtures/tib/reference.json ; recoupement de la mécanique de notation seulement, aucune affirmation de précision.

# text
seg-60f627e001ad = src/benchmark/coverage.rs::tests (propre/sous-borné/tout indisponible/vide) ; tests/tib_scorer_reference.rs (comptes + taux + coverage_ok par rapport à numpy à { "1e-12" } près)

# text
seg-cee919e2058e = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Générateurs de fautes paramétriques représentatifs (modélisés) ; l'ensemble indétectable (retard symétrique, rejeu dans la fraîcheur) est Cited d'après Mizrahi RFC { "7384" } et Narula & Humphreys (IEEE JSTSP { "2018" }). Aucune référence indépendante externe : un catalogue de fautes ne fait aucune affirmation mesurée.

# text
seg-6b48be996d76 = src/benchmark/faults.rs::tests (profils de décalage, marche monotone, marquage de l'ensemble indétectable, cohérence de max_offset, exactement deux classes indétectables)

# text
seg-0cc84aedee42 = vérifiée par rapport à sa propre identité analytique / sous forme fermée : détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. Contrôle de propriété établissant que l'énumération Verdict ne peut structurellement pas rapporter une faute indétectable comme détectée (Mizrahi RFC { "7384" }) ; absorbé ⟺ PL ≥ offset. Aucune référence indépendante de précision.

# text
seg-b19cbd364dea = src/benchmark/scorecard.rs::tests (la PL de référence absorbe ; la PL défaillante n'est jamais détectée et n'est pas absorbée ; verdict de couverture détectable ; la propriété d'honnêteté selon laquelle aucun verdict de couverture ou de détection n'est accessible pour un scénario indétectable)

# text
# c1: variance
seg-350aaf43f349 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Aucune référence externe indépendante, et aucune n'est possible : il s'agit d'une auto-description, non d'une mesure. Elle est consignée parce que son absence était un défaut -- P5 a dû citer la longueur d'onde de la porteuse et l'ouverture d'émission à partir des valeurs par défaut du code source, et déduire, par un contrôle de cohérence interne, qu'un simple <c1/> était en mètres carrés. La déduction était correcte, et c'est précisément pour cela qu'elle importait : rien n'aurait détecté qu'elle soit fausse

# text
seg-6d963d838eed = hybrid_integrity::tests (la configuration résolue est renvoyée en écho pour les valeurs par défaut et pour les surcharges, sans passer la longueur d'onde par un aller-retour en mètres ; chaque entrée d'unités porte à la fois une unité et une classe de provenance ; chaque champ que le bloc d'unités nomme est effectivement émis, de sorte qu'il ne peut pas documenter un champ fantôme)

# text
seg-cbd0ee1c1e97 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Aucune référence externe indépendante, et ExternalDataset est écarté. Les deux entrées sont une marge Eb/N0 et un franchissement de seuil C/N0, tous deux fonctions d'une EIRP MODELLED, d'un facteur de mérite et d'une allocation de pertes globales ; il n'existe aucun relevé de disponibilité mesuré pour un service hybride optique/RF Terre-Lune auquel comparer le chiffre composé. Les contrôles existants sont internes et présentés comme tels : la composition est recalculée à partir des marges publiées dans le rapport lui-même plutôt qu'à partir des éléments internes de l'émetteur, et la portée de fermeture est vérifiée en réexécutant l'équation de liaison À cette portée et en exigeant que la marge s'annule -- un aller-retour d'inversion, et non une implémentation indépendante. La limite honnête du chiffre est consignée sur le rapport lui-même : c'est un indicateur déterministe 0/1, non une probabilité, car rien dans ce moteur ne mesure une distribution des coupures de liaison RF à cette bande et à cette géométrie. Cette entrée manquante est nommée dans rf_availability.factors_not_included plutôt qu'inventée, et la fournir est ce dont une disponibilité RF probabiliste aurait besoin

# text
seg-55f2385bbe8a = hybrid_integrity, linkbudget, jamming

# text
seg-188ab5b1b2e9 = hybrid_integrity::tests (la disponibilité est égale au produit des deux indicateurs recalculés à partir des marges du rapport lui-même, et ces marges sont elles-mêmes reconstituées à partir de l'EIRP, de la perte en espace libre, de la perte globale, du facteur de mérite, du terme de Boltzmann, du débit de données et de l'exigence du rapport, à { "1e-9" } dB près ; la valeur est mesurée égale à { "0" } ou à { "1" } alors que la disponibilité optique au même passage est mesurée strictement comprise entre les deux ; chaque ligne de facteur porte une classe de provenance issue du vocabulaire fermé de field_schema ; la portée de fermeture rapportée, repassée dans le bilan de liaison, renvoie une marge de { "0" } à { "1e-9" } dB près et est mesurée comme indépendante de la portée à laquelle le passage se situait sur quatre décades, tandis que l'utilisation de la portée varie exactement du rapport des portées ; une liaison de -40 dBW rapporte une disponibilité de { "0" }, LOST, et une utilisation supérieure à { "1" } plutôt qu'une fraction ; la note remplacée « aucun équivalent de disponibilité RF n'est calculé par ce moteur » est vérifiée comme supprimée et son remplacement est vérifié comme nommant le nouveau champ ; une entrée RF mal formée est refusée plutôt que tronquée)

# text
seg-6471f38fc505 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Aucune référence externe indépendante pour le RAPPORT, et ExternalDataset est écarté délibérément. La chaîne RF sous-jacente en possède une -- tests/validate_p5_rf_ranging_precision.rs vérifie linkbudget::link_budget et navsignal::dll_code_jitter_chips par rapport à un jeu de référence Python/NumPy indépendant et par rapport à la valeur calculée de Kaplan & Hegarty codée en dur ({ "2.814e-3" } chip / { "0.825" } m à { "45" } dB-Hz) -- et la CRLB optique a sa propre ligne en forme close. Revendiquer l'un ou l'autre de ces points d'ancrage pour cette ligne serait une validation empruntée, ce que les invariants de la matrice existent pour empêcher : la grandeur ici est un RAPPORT à une configuration avec une EIRP, un facteur de mérite, une puissance d'émission et une ouverture MODELLED, et il n'existe aucune comparaison mesurée de télémétrie optique et RF à un point de fonctionnement commun à laquelle la comparer. Ce qui est vérifié en interne est ce sur quoi le rapport peut réellement se tromper : que les deux branches se situent au même point de fonctionnement. Cela est mesuré en changeant d'échelle le temps d'accumulation commun et en exigeant que les deux branches évoluent selon la même loi de racine carrée et que le rapport reste en place, et cela est imposé en refusant purement et simplement le rapport lorsque les temps de moyennage diffèrent. Les deux branches sont des bornes de bruit thermique/de grenaille et excluent toutes deux le retard du milieu, l'erreur d'horloge et l'ambiguïté, de sorte que l'exclusion est identique de chaque côté ; le rapport le dit plutôt que de le laisser déduire

# text
seg-616d297a3190 = hybrid_integrity, optical_linkbudget, linkbudget, navsignal

# text
seg-d3a72a60b237 = hybrid_integrity::tests (le rapport est égal aux deux branches émises divisées, à { "1e-15" } près en relatif, et son inverse et ses formes en décibels concordent ; la portée et l'écart-type temporel de chaque branche sont liés exactement par c ; la configuration commune émise est vérifiée égale à la portée et au temps d'intégration propres au scénario, et la portée de la branche RF est vérifiée égale à celle de la branche optique ; le C/N0 de la branche RF est identique bit à bit à celui du bloc de disponibilité, issu d'un seul bilan de liaison, et non d'une nouvelle dérivation ; la propriété LIKE-FOR-LIKE est MESURÉE plutôt qu'affirmée -- quadrupler le temps d'accumulation commun divise par deux la branche optique à { "1e-12" } près et la branche RF à { "1e-7" } près et laisse le rapport inchangé à { "3.19e-9" } près en relatif, ce qu'une branche qui moyennerait secrètement sur autre chose ne pourrait pas faire ; une surcharge rf_dll_bandwidth_hz qui rompt le temps de moyennage commun rend le rapport nul avec une raison nommant les deux temps, tandis que les deux branches restent émises ; un passage aller simple fait de la branche de comparaison l'indicateur principal publié, bit à bit, avec un facteur de pénalité d'exactement { "1" }, et un passage aller-retour reproduit la pénalité 0.5/sqrt(perte géométrique du trajet retour) recalculée à partir du geometric_loss_db du rapport lui-même à { "1e-12" } près)

# text
seg-7c14f0734623 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Aucune référence externe indépendante : il s'agit d'une auto-description portant sur une équation déjà validée par rapport à un tableau de contrôle de conception publié (voir la ligne du bilan de liaison aller simple). Elle est consignée parce que son absence était un défaut mesuré -- reproduire le d1_rate_gain_beamwidth.csv publié exigeait de résoudre à rebours une constante effective à { "0.0034" } dB à partir des trente lignes, et le moteur nomme désormais cette combinaison et prouve, par un test, qu'aucun tableau publié n'aurait jamais pu en séparer les trois composantes

# text
seg-7f3efc1e9fa0 = linkbudget

# text
seg-da19fa334661 = linkbudget::tests (sur trois bandes, quatre décades de portée et les deux verdicts de fermeture, la marge et la perte en espace libre qui la sous-tend sont recalculées à partir du seul rapport à mieux que { "1e-9" } dB ; le G/T requis assemblé à partir des termes de l'équation concorde avec la même grandeur obtenue comme G/T moins la marge, et réexécuter à cette valeur annule la marge ; trois bilans avec une EIRP, des pertes et un seuil très différents mais une constante de liaison égale donnent une exigence identique, tandis que { "1" } dB sur la constante la déplace d'exactement { "1" } dB ; la répartition du gain est absente sauf si une température de bruit est indiquée, et une température non positive est refusée ; chaque champ que le bloc d'unités nomme est effectivement émis)

# text
seg-5a05659a1cbb = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Deux calculs différents du même code source pour la même grandeur, et non un seul reformulé : la bissection sur la courbe en loi de puissance IEEE-1139 ne sait rien du type de bruit, tandis que la forme close inverse algébriquement le type dominant, de sorte qu'un type de bruit mal classé ou un encadrement erroné se manifeste par une différence relative non négligeable. Les quatre valeurs reproduisent aussi le tableau publié de l'article à la moitié de son dernier chiffre imprimé -- mais ce tableau a lui-même été reconstruit à partir de la même forme close ; c'est donc un contrôle de reproductibilité et non une référence externe indépendante, et le terme de référentiel par rapport auquel il est mesuré est une allocation modélisée

# text
seg-d9742b5a3a48 = lunar_time_budget::tests et lunar_time_budget_scenario::tests (les quatre classes sont présentes dans un même passage et dans un ordre de sous-ensemble demandé ; chaque ligne concorde avec sa propre forme close à mieux que { "1e-12" } en relatif ; multiplier l'erreur de référentiel par k multiplie le croisement par k pour une horloge à flicker FM et par k^{ "2" } pour une horloge à white FM, vérifié à k={ "2" } et k={ "3" }, ce qui sépare les deux classes de bruit ; chaque ligne reproduit le croisement à horloge unique que le bilan avait déjà rapporté ; chaque ligne retrouve l'unique terme de référentiel partagé ; un nom d'horloge inconnu est rejeté)

# text
seg-75715af43b8b = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Inclusion d'ensembles : le rapport brouilleur/signal intervient comme un décalage uniforme en décibels, de sorte que l'ensemble capturé à une puissance d'émission plus élevée contient l'ensemble à une puissance plus basse et que la fraction ne peut que croître -- propriété que le diagramme d'Airy NE donne PAS en largeur de faisceau ni en altitude, où la région capturée se brise en anneaux et où la fraction est véritablement non monotone. Aucun tableau publié ne donne la fraction de disque capturée d'un émetteur orbital lunaire en fonction de l'altitude et de la largeur de faisceau, de sorte qu'il n'y a rien d'externe auquel comparer ces cellules ; le diagramme sous-jacent est validé séparément par rapport à des valeurs de Bessel publiées et conserve sa propre ligne

# text
seg-024dfb3684f1 = antenna

# text
seg-7e64cec1882e = antenna::tests et attack_surface::tests (la grille est complète et chaque fraction capturée se situe dans [{ "0,1" }] ; la fraction capturée est non décroissante avec la puissance d'émission à chaque nœud ; elle n'est PAS monotone en largeur de faisceau ni en altitude, ce qui est figé par son propre test afin que le balayage ne puisse pas être lissé par la suite ; le nœud de référence de base reproduit bit à bit la fraction capturée existante ; l'évaluation au limbe seul est identique bit à bit au dernier point du balayage complet ; un croisement localisé se situe sur le seuil à { "1e-9" } dB près et est encadré)

# text
seg-eebb00692020 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Auto-cohérence seulement : le total publié est vérifié par rapport à la racine de la somme des carrés des termes du même fichier, et la courbe émise reproduit le p3_time_budget_curve.csv publié sur l'ensemble des { "57" } points. Les deux contrôles partagent les définitions de termes propres à ce moteur, de sorte qu'aucun n'est indépendant. Le terme d'horloge repose sur des spécifications d'horloge publiées, mais les ORDRES DE GRANDEUR des planchers de liaison, de référentiel, relativiste et d'éphéméride sont des allocations de bilan documentées sans référence externe indépendante

# text
# c1: total
seg-d804d9874191 = lunar_time_budget_scenario::tests (l'ensemble des { "57" } temps de moyennage x { "8" } termes est présent, l'indice de grille va de { "0" }..={ "56" } et porte { "8" } lignes chacun ; la ligne <c1/> est égale à la racine de la somme des carrés des sept termes qui l'accompagnent à chaque tau ; le tableau suit une grille demandée plutôt qu'une grille codée en dur ; son émission laisse le JSON du rapport identique à l'octet près)

# text
seg-61e51873ef4b = lunar_time_lab (sur clock_specs, lunar_time_budget, lunar_time)

# text
seg-73a747390b44 = lunar_time_lab::tests (free_run_clock_term_is_the_budget_clock_term : sans asservissement, le terme d'horloge est égal bit à bit au terme d'horloge du bilan pour les quatre classes ; bisection_matches_the_closed_form à { "1e-9" } près en relatif pour les deux classes de bruit ; threshold_below_the_floor_is_flagged ; steering_holds_and_resets ; height_term_is_opt_in_and_linear ; device_card_reproduces_a_named_class ; bad_inputs_are_refused) ; tests/lunar_station_time_lab.rs (the_block_is_additive : le document, le tableau et le résumé par défaut sont inchangés et le bloc n'ajoute que son propre objet et ses propres unités ; time_to_threshold_matches_the_closed_form_through_the_scenario ; clocks_are_ordered_over_the_span_where_the_model_orders_them : optique < PHM < RAFS < miniRAFS de { "1" } s à { "7e5" } s, les courbes PHM et RAFS se croisant entre { "7e5" } et { "8e5" } s, ce qui est figé comme propriété divulguée des modèles d'horloge à un seul type de bruit ; every_time_lab_field_has_a_unit ; unknown_time_lab_fields_and_clocks_are_refused)

# text
seg-5b1e2e05b9c8 = vérifié par rapport à une implémentation distincte dans ce même code source — indépendante de l'unité testée, mais sans autorité externe — delta_dor à onde plane (même code source) dans la limite du champ lointain ; dérivées partielles par différences finies. { "0.30" } comparaison externe, un constat (reste MODELLED) : par rapport aux temps de lumière convergés d'ANISE { "0.10" } via DE440 ({ "75" } retards au 2024-01-01 sur trois lignes de base DSN, générés par xval/anise-lunar-od sans code Kshana), aucun retard n'est dans la tolérance de { "1" } ps. Le plus grand écart est de { "24" } µs, dû au centre analytique de la Lune (à environ { "200" } km de DE440), à la géométrie instantanée unique sans itération du temps de lumière ({ "3.6" } µs) et au mouvement polaire négligé ; les dérivées partielles des balises diffèrent jusqu'à { "2.9e-3" } en relatif contre { "1e-6" }. L'affirmation de la documentation du module selon laquelle les approximations de référentiel sont inférieures à la fidélité du modèle ne tient pas à ce niveau. { "0.30" } tour { "2" } : le chemin par noyau (lunar_vlbi::KernelGeometry) est validé par rapport aux temps de lumière NAIF SPICE dans sa propre ligne, VLBI géodésique lunaire, chemin par noyau ; la comparaison ANISE de ce chemin (75/75 à { "1" } ps près, pire cas { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) n'est qu'un contrôle croisé de l'évaluation du noyau, car la résolution du temps de lumière dans ce dispositif de test est celle de ce projet. Cette ligne (le chemin analytique par défaut) reste MODELLED avec le constat ci-dessus

# text
seg-71c4fb3e4d08 = lunar_vlbi::tests (la limite du champ lointain concorde avec delta_dor ; correction de champ proche ; dérivées partielles par différences finies) ; tests/lunar_vlbi_anise_oracle.rs::near_field_delay_disagrees_with_the_anise_light_time_difference

# text
seg-ed40da9bdfae = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Identités en forme close et cohérence interne ; AUCUNE référence externe indépendante n'est revendiquée. L'angle de demi-ouverture au limbe est vérifié par rapport à asin(R_earth/r_orbit) et la géométrie par rapport à lui ; la perte en espace libre, le noyau DOP et la propagation SGP4 qu'elle compose sont chacun validés en externe dans leurs propres lignes et cette ligne n'emprunte pas leur statut. POURQUOI MODELLED, et c'est le diagramme d'émission : le gain en fonction de l'angle est celui d'une ouverture circulaire uniformément éclairée, le diagramme d'Airy, alors qu'une antenne GPS L1 réelle est un réseau hélicoïdal de douze éléments avec un lobe principal façonné dont le pic est hors de l'axe pour égaliser la puissance sur le disque terrestre et des lobes secondaires qui ne sont pas d'Airy. Des diagrammes mesurés publiés existent et ne sont pas inclus ici, de sorte que les ordres et les ordres de grandeur sont fiables, alors que les dB d'un satellite pris isolément ne le sont pas. UNE PREMIÈRE IMPLÉMENTATION DE CETTE LIGNE ÉTAIT FAUSSE D'UNE MANIÈRE QUI MÉRITE D'ÊTRE CONSIGNÉE : l'expression d'Airy n'est valable que dans l'hémisphère avant, son argument varie en sin(theta), et à theta voisin de { "180" } deg elle se replie et renvoie le GAIN PLEIN AXE derrière l'ouverture - de sorte que les deux liaisons les plus fortes du premier rapport étaient des satellites pointant leurs antennes à l'opposé de la Lune, et c'étaient les deux seuls à franchir le seuil. Derrière l'ouverture, le modèle applique désormais un plancher plat de lobe arrière, énoncé comme une borne plutôt que comme une forme de diagramme fabriquée. Délibérément absents, chacun rendant le bilan OPTIMISTE : aucune perte ionosphérique ou troposphérique sur les rayons rasant le limbe, aucune perte de polarisation, de pointage ou d'implémentation, et une Terre sphérique sans extension réfractive. La position de la Lune est une ENTRÉE, et non une consultation d'éphéméride, parce que la grandeur testée est la liaison et la géométrie du faisceau. Faire passer cette ligne à validé exige un diagramme d'émission mesuré et des points normaux LuGRE auxquels comparer ; aucun des deux n'est dans le dépôt et aucun n'est inventé ici. { "0.30" } tour { "2" }, un constat (reste MODELLED) : un chemin de liaison à entrées mesurées (positions SP3 réelles, puissance d'émission par bloc, diagrammes d'émission et de réception tabulés, hystérésis d'acquisition et de poursuite) a été vérifié par rapport à Montenbruck et al. { "2023" } Tableau { "3" } pour GENESIS à { "6000" } km (préenregistré 5b414f0a) : les moyennes d'antenne au zénith concordent pour { "5" } cas sur { "6" } à moins d'un dB de la sensibilité de l'article ; les moyennes d'antenne au nadir sont supérieures de { "1.0" } à { "2.4" } satellites à celles imprimées, vraisemblablement parce que l'article a utilisé des diagrammes de lobes secondaires GPS dépendant de l'azimut qui ne sont pas publiés. Les chiffres à distance lunaire de cette ligne utilisent toujours le substitut d'Airy. { "0.30" }+ D7, un constat (reste MODELLED) : la grandeur reformulée, la DIFFÉRENCE de C/N0 entre des satellites Block IIR/IIR-M suivis à une même époque, prédite avec les diagrammes L1 mesurés par SVN de NAVCEN (bidimensionnels, repère à pilotage en lacet) par rapport au C/N0 en vol de LuGRE (préenregistré 768cb62b : { "99" } % visibles, RMS des paires <= { "3.0" } dB, médiane <= { "2.0" } dB, au moins { "50" } enregistrements et { "30" } paires) dispose de trop peu de données : les { "26" } époques de transit et d'orbite lunaire qualifiantes contiennent { "15" } enregistrements IIR/IIR-M suivis (ce sont surtout des IIF et III qui sont suivis) et une paire. Les { "15" } sont prédits visibles et le résiduel de l'unique paire est de -0.06 dB ; rien n'est revendiqué

# text
seg-1755ed282a7d = earth_gnss_lunar::tests ({ "11" } tests de bibliothèque : l'angle de demi-ouverture au limbe terrestre par rapport à sa forme close asin(R/r), avec une assertion supplémentaire que CHAQUE liaison non occultée se situe hors de ce cône, de sorte que le test d'occultation et l'angle au limbe ne peuvent pas être en désaccord ; le prédicat d'occultation vérifié du côté proche, du côté éloigné et dans le cas où le corps se trouve DERRIÈRE l'émetteur ; l'affaiblissement de propagation borné à la bande plausible des distances lunaires sur chaque liaison ; l'ensemble poursuivable montré comme un sous-ensemble de l'ensemble géométriquement visible et disjoint de l'ensemble occulté ; monotonie dans les deux sens - plus de gain en réception ne réduit jamais le compte, un seuil plus strict ne l'augmente jamais ; aucune liaison créditée de plus que le gain dans l'axe ; un récepteur à l'intérieur de la Terre refusé ; le balayage vérifié comme VARIANT effectivement avec l'époque ; et la disponibilité du signal par rapport à celle de la solution vérifiée comme distincte, correctement ordonnée et cohérente avec les lignes par époque) ; tests/earth_gnss_measured_montenbruck_oracle.rs::finding_genesis_nadir_counts_exceed_the_paper (figé) ; tests/lugre_relative_cn0_visibility.rs::too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar (constat figé)

# text
seg-e9a23134de45 = lunar_infra::{ "{" }orbit, gnss, od{ "}" }

# text
seg-13dceb4f0d7b = tests/lunar_infra_od_consistency.rs (seuil O1 : la matrice de transition d'état enchaînée sur trois jours et sur une période est égale à scipy DOP853 à { "1e-6" } près en relatif ; seuil C1 : q moyen et fraction dans l'intervalle à 95 % ; seuil C2 : échantillon sur trace formelle de chaque estimateur ; seuil C3, NOT MET et figé : avec { "3e-10" } m/s2 d'accélération non modélisée, le dépassement de l'intervalle à 95 % est de { "0.0525" }, et non d'au moins { "0.5" } - l'estimation embarquée n'est connue qu'à quelques centaines de mètres près, de sorte qu'environ dix mètres de déplacement se cachent à l'intérieur de sa covariance) ; lunar_infra::orbit::tests, lunar_infra::gnss::tests, lunar_infra::od::tests, lunar_infra::la::tests

# text
seg-a5f9d7981f42 = vérifié par rapport à une implémentation distincte dans ce même code source — indépendante de l'unité testée, mais sans autorité externe — Une résolution numpy indépendante des mêmes équations normales à partir des lignes exportées (Q3) et une énumération entière exhaustive (Q4). Aucune mesure de phase de la porteuse GNSS ou lunaire n'est comparée. MODELLED.

# text
seg-2d4d23841d56 = lunar_infra::phase ; lambda

# text
seg-0b34672f668b = tests/lunar_infra_carrier_phase.rs (seuil Q1 : succès Monte Carlo au moins égal à la borne bootstrap moins trois erreurs standard ; Q2 : pas de chute avec la longueur d'arc au-delà de trois erreurs standard ; Q4 : LAMBDA est égal à l'énumération exhaustive pour { "200" } tirages de dimension jusqu'à cinq ; Q3 : la conception flottante est égale à une résolution numpy indépendante à { "1e-9" } près pour les covariances d'ambiguïté et de position, et le taux bootstrap est NOT MET à { "1e-9" }, figé : il diffère d'un relatif { "1.7e-6" } parce que la fonction de répartition normale de LAMBDA est une approximation d'Abramowitz et Stegun)

# text
seg-ee535014d898 = vérifié par rapport à une implémentation distincte dans ce même code source — indépendante de l'unité testée, mais sans autorité externe — Une différence finie numpy indépendante du modèle direct (F2). Rien n'est comparé à de véritables solutions de référentiel lunaire. Le facteur est conditionnel à l'orbite connue supposée et à l'écart-type de portée de { "1" } m. MODELLED.

# text
seg-0abe3b27addf = lunar_infra::frame ; lunar_datum ; lunar_identifiability ; lunar_llr_geometry

# text
seg-30c57d85abc1 = tests/lunar_infra_studies_3_5.rs (seuil F1 : la trace de la CRLB ne monte pas et la plus petite valeur propre ne baisse pas avec les liaisons d'orbiteur, dans l'exemple et dans { "20" } ensembles aléatoires à graine ; seuil F2 : les dérivées partielles de portée sont égales à une différence finie numpy longdouble indépendante du modèle direct de Rodrigues sur { "50" } géométries ; seuil F3 : la plus petite valeur propre augmente d'au moins 2.0x, constatée à environ 111x)

# text
seg-8d70ea5318fa = vérifié par rapport à une implémentation distincte dans ce même code source — indépendante de l'unité testée, mais sans autorité externe — Un système empilé numpy indépendant avec les inconnues de position éliminées par des compléments de Schur explicites (T3). Aucune donnée de mission GRASP, Genesis ou autre n'est comparée. MODELLED.

# text
seg-0e7813b34509 = lunar_infra::tie ; fim::crlb_srif

# text
seg-58f77b27cde3 = tests/lunar_infra_studies_3_5.rs (seuil T1 : les écarts-types de translation ne baissent pas quand le lien local se relâche ; T2 : avec les écarts-types des techniques mis à l'échelle de { "1e-6" }, l'écart-type de translation de chaque paire est à moins de { "1" } % de sqrt({ "2" }) fois l'écart-type du lien local, constaté à { "3e-7" } près ; T3 : la matrice d'information est égale à un assemblage empilé numpy indépendant à { "1e-9" } près). Le premier passage de T2 avec inversion des équations normales a échoué ({ "1.3" } % pour un lien de { "0.1" } m, valeurs sous le plancher à { "1" } m) ; la cause était numérique et la covariance est passée à la voie de la racine carrée avant que le seuil ne soit rescoré.

# text
seg-6c1a6dc96a6a = vérifié par rapport à une implémentation distincte dans ce même code source — indépendante de l'unité testée, mais sans autorité externe — Un assemblage numpy indépendant par différences finies (G2) et une évaluation en forme close (G4). La sensibilité à k2 de la famille de l'orbiteur est un chiffre de borne haute (l'état orbital n'absorbe ici qu'une constante et une tendance). Aucune mesure de marée ou de libration lunaire n'est comparée ; k2 est cité d'après Lemoine et al. { "2014" } comme valeur nominale. MODELLED.

# text
seg-8e55bf5a6a8f = lunar_infra::geodesy ; lunar_od::degree2_tide_accel ; lunar_time

# text
seg-4b42d4f76a35 = tests/lunar_infra_studies_3_5.rs (seuil G1 : les dérivées partielles analytiques sont égales à une différence finie centrale de chaque modèle direct à { "1e-8" } près ; G2 : l'information 5x5 est égale à un assemblage numpy indépendant à { "1e-6" } près ; G4 : l'amplitude de la marée d'horloge et ses sensibilités à k2 et h2 sont égales à une évaluation indépendante à { "1e-9" } près ; seuil G3 NOT MET dans sa moitié portant sur la trace, figé : ajouter une famille n'abaisse jamais la plus petite valeur propre ({ "28" } sur { "28" }) mais la trace de la pseudo-inverse a augmenté dans { "12" } ajouts sur { "28" } parce que la famille ajoutée a augmenté le rang)

# text
seg-3ead905e6a5c = vérifié par rapport à une implémentation distincte dans ce même code source — indépendante de l'unité testée, mais sans autorité externe — L'arithmétique DOP est le noyau crate::orbit::dop, validé séparément en externe par rapport à gnss_lib_py dans tests/dop_reference.rs ; cette ligne n'emprunte pas à nouveau le statut de celle-là. L'horizon de visibilité des balises est la forme close L01, et sigma = DOP x sigma_URE est la relation GNSS standard (Kaplan et Hegarty, Understanding GPS/GNSS, section { "7" }). Dans cette ligne, l'augmentation elle-même est vérifiée par rapport à un chemin DOP indépendant du dépôt et figée sur une référence d'or commise. POURQUOI MODELLED : la conception de la constellation, le placement des balises, les hauteurs d'antenne et les trois grandeurs du bilan d'erreur sont des entrées illustratives plutôt qu'un relevé sur le terrain ou une liaison mesurée, de sorte que les mètres rapportés sont une propriété d'un scénario choisi et non d'un service déployé. REMARQUE SUR LA PROVENANCE : cette capacité était annoncée dans le README et exercée par deux tests de validation, mais elle ne portait AUCUNE ligne de matrice et aucun type de scénario, de sorte qu'elle ne pouvait pas du tout être atteinte à partir d'un passage. Elle était revendiquée en prose, absente du registre et inaccessible dans le moteur à la fois. La ligne et le type ont été ajoutés ensemble. { "0.30" } tour { "2" } (préenregistré db0eb9ec), bloqué (reste MODELLED) : la visibilité ANISE { "0.10.6" } et un DOP numpy sur la géométrie de la ligne concordent (ensembles visibles exacts, y compris { "72" } cas proches de l'horizon et { "48" } cas proches du masque ; DOP à { "7.2e-13" } près), mais les mètres rapportés sont le DOP multiplié par une erreur de mesure de distance en racine de la somme des carrés illustrative de { "1.158" } m sans référence indépendante ; la délimitation qui les exclurait attend une décision du propriétaire

# text
seg-2e097e952eb5 = lunar_beacon::tests (visibilité à l'horizon par rapport à la forme close L01 ; le DOP augmenté par balise par rapport au DOP simple ; la racine de la somme des carrés du bilan d'erreur ; la relation DOP-mètres) ; tests/validate_p2_beacon_before_after_table.rs (tout le tableau avant/après figé sur une référence d'or commise à { "1e-9" } en relatif) ; tests/validate_p2_beacon_before_after_independent_dop.rs (la même géométrie par un chemin DOP INDÉPENDANT, de sorte que l'augmentation n'est pas vérifiée par rapport au noyau qui l'a produite) ; tests/validate_lunar_beacon_anise_visibility_dop.rs::beacon_visibility_and_augmented_dop_match_anise_and_numpy

# text
seg-f8ac8be96a63 = cmpl_horizontal borne l'erreur de position horizontale à k écarts-types apportée par la classe aveugle de mode commun, en formant blind_position_covariance = S<em>Cov</em>S^T et en la projetant dans ENU ; integrity_envelope rapporte hpl_total = hpl_araim + cmpl. La distinction que cette paire existe pour établir : le test sur le RÉSIDU de RAIM/ARAIM est démontrablement aveugle aux erreurs dans range(G), mais pas le NIVEAU DE PROTECTION d'ARAIM - son terme sans défaut les borne déjà à une URA du fournisseur plus un biais nominal près. Le CMPL n'est donc que l'EXCÈS inter-fournisseurs que l'URA/ISM propre à un seul fournisseur ne surborne pas, et la somme est une borne par inégalité triangulaire, conservatrice, plutôt qu'une RSS, valable seulement là où cet excès n'est pas déjà inclus dans l'URA.

# text
seg-753412b4c8f3 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Algèbre analytique des projecteurs vérifiée par rapport à elle-même : une covariance confinée à range(G) doit donner un CMPL positif, une covariance confinée à l'espace de parité doit donner un CMPL approximativement nul, et l'enveloppe doit sommer deux contributions orthogonales dans l'espace de mesure. La covariance de mode commun, la géométrie de la constellation et k sont des entrées modélisées représentatives, et NON un budget certifié, et il n'est fait aucune affirmation que la borne triangulaire soit serrée. REMARQUE SUR LA PROVENANCE : cmpl_horizontal, blind_position_covariance et integrity_envelope sont publics et livrés, et leurs tests unitaires étaient déjà cités par la ligne sur l'aveuglement au mode commun, mais l'AFFIRMATION SUR L'ENVELOPPE elle-même ne portait aucune ligne - de sorte que la seule réserve qui la maintient honnête, à savoir que la somme est une borne triangulaire et non une RSS, n'était énoncée nulle part dans le registre. La ligne enregistre l'affirmation et la réserve ensemble.

# text
seg-9e4affc02b0b = lunar_common_mode::tests (common_mode_covariance_gives_positive_cmpl, parity_only_covariance_gives_near_zero_cmpl, envelope_sums_the_two_classes, state_map_matches_split)

# text
seg-a4d8fdc530e4 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Structure analytique du défaut de datum — le mode absolu non observable du référentiel se trouve dans le noyau de l'information de Fisher (forme close), le seuil de rang concorde avec la justification publiée de la conception à 3 stations, et l'estimateur atteint la CRLB qui en résulte en Monte-Carlo. La géométrie lunaire elle-même est un réseau représentatif (et non une éphéméride volée), de sorte que la ligne reste MODELLED ; le moteur FIM/CRLB sous-jacent est vérifié séparément par rapport aux formes closes de Kay ({ "1993" }). { "0.30" } tour { "2" } (préenregistré fab02df9), bloqué (reste MODELLED) : NumPy/SciPy recalculent le rang et le défaut au seuil indiqué de { "1e-9" }, la part des axes de station dans le noyau (à { "8.4e-10" } près) et la CRLB de station (à { "1.2e-10" } près) sur { "17" } configurations validées générées par Kshana (P2). Non promu : l'affirmation que l'estimateur atteint la borne (efficacité Monte Carlo d'environ { "0.98" }) n'a pas de référence indépendante, et la délimitation qui la laisserait MODELLED attend une décision du propriétaire

# text
seg-4f3b4fe41736 = lunar_combination (lunar_observability) + fim

# text
seg-e927515cc210 = lunar_combination::tests (déficient en rang sans lignes de base terrestres ; trois lignes de base rétablissent le rang plein — le seuil de 3 stations vient du rang de l'information, non d'une erreur de résolution ; CRLB de station atteinte par l'estimateur à une efficacité de { "0.98" } ; la CRLB se resserre de façon monotone avec les lignes de base) ; tests/lunar_observability_numpy_oracle.rs::lunar_observability_matches_numpy_on_the_committed_jacobians

# text
seg-5fda3995c3fb = une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée — Référence : les valeurs que LSIS V1.0 imprime pour la validation (Tableaux C-1 à C-5, D-1 à D-6, E-1 à E-6) et ses fichiers de code électronique de l'Annexe { "3" }, selon un critère de zéro écart fixé avant la comparaison. Le critère est manqué à cause d'une cellule imprimée, incohérente en interne avec le propre fichier de l'Annexe { "3" } de la norme, de sorte que la ligne reste MODELLED ; une note d'erratum est rédigée. Les mêmes chips sont aussi égaux à ceux de LANS-AFS-SIM (ligne « rendu en bande de base LunaNet AFS par rapport à un générateur indépendant, étant donné son état de canal »)

# text
seg-84ece56ff3e9 = lunar_afs::codes, lunar_afs::lsis, lunar_afs::params (indices IS-GPS-800J)

# text
seg-d111b6550515 = lunar_afs::codes::tests (registres à longueur maximale, équilibre de Legendre, aller-retour du retard G2, composition des niveaux) ; tests/lunar_afs_codes_lsis_reference.rs::afs_codes_finding_one_misprinted_table_cell (sans le cache LSIS : quatre nombres cités figent le constat ; avec lui : { "2 937 232" } chips et bits par rapport aux fichiers de l'Annexe { "3" } de LSIS, premiers/derniers { "24" } chips imprimés, Tableaux de Legendre D-1 et E-1 et initialisations G2 donnent exactement un élément différent, la cellule « derniers { "24" } chips » du PRN { "147" } du Tableau E-5, qui duplique celle du PRN { "151" } alors que le fichier de l'Annexe { "3" } concorde avec le générateur) ; le test strict préenregistré afs_codes_match_lsis_v1_tables_and_annex3_bit_exact est ignoré avec cet écart

# text
seg-f30130dca525 = une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée — Bibliothèque : PocketSDR-AFS (T. Ebinuma d'après le PocketSDR { "0.13" } de T. Takasu, BSD-2-Clause, commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, version en bande S, copie à niveau de journalisation en impression seule), selon des critères fixés avant chaque passage. La troisième comparaison préenregistrée satisfait en totalité ses seuils de décodage et de poursuite C1 et C2 mais pas sa garde G0 telle qu'écrite (deux passages du récepteur non modifié diffèrent sur les quatre mêmes enregistrements d'acquisition), et la deuxième a manqué de { "5" } violations, de sorte que la ligne reste MODELLED. LANS-AFS-SIM et PocketSDR-AFS partagent un auteur et comptent comme une seule implémentation indépendante ; les contrôles de vecteurs imprimés de la ligne de codage de trame protègent contre une lecture erronée partagée

# text
seg-8cd700abad59 = lunar_afs::waveform (enregistrement et étiquettes de vérité), xval/lunar-afs/run_pocketsdr.sh

# text
seg-22dbd05adf9c = tests/lunar_afs_decodability_pocketsdr_v3_oracle.rs::third_run_finding_c1_c2_hold_g0_is_receiver_nondeterminism (troisième préenregistrement : { "2" } nœuds, { "4" } canaux poursuivis, pire erreur Doppler { "0.57" } Hz, pire erreur de décalage de code { "0.008" } chip, les { "6" } trames décodées avec le bon TOI à travers le repli { "99" } -> { "0" } et une sous-trame { "2" } concordante ; G0 non satisfaite telle qu'écrite, la variation propre du récepteur d'un passage à l'autre dans ses enregistrements d'acquisition) ; tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs::decodability_finding_five_violations (deuxième : { "5" } violations) ; tests/lunar_afs_decodability_pocketsdr_oracle.rs::first_run_finding_no_acquisition_outside_the_receivers_4_bit_range (premier : nul) ; les tests stricts des trois fichiers sont ignorés avec leurs écarts

# text
seg-2f05d26e8be6 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — gps-sdr-sim (MIT, commit 28ca29a6, exécuté comme programme distinct par un dispositif commité), préenregistré f88f2969 avec un seuil exact au bit près sur (A) les chips C/A, (B) chaque champ LNAV calculé, (C) chaque bit de parité. CONSTAT : (A) { "0" } chips sur { "32 736" } diffèrent, (C) la parité de { "0" } mots sur { "1 920" } diffère, (B) { "230" } champs calculés sur { "1 152" } diffèrent d'une unité : l'eph2sbf de gps-sdr-sim tronque vers zéro avec des conversions C là où l'entier diffusé exige un arrondi (chaque valeur différente se situe à { "0.01" } d'une unité de l'entier arrondi de Kshana). Reste MODELLED : le seuil enregistré était la conjonction

# text
seg-9b511cb035c0 = gps_lnav, sdr

# text
seg-83c50906fe74 = tests/gps_l1ca_gpssdrsim_cross_generator.rs::gps_sdr_sim_truncates_where_the_broadcast_integer_needs_rounding (constat figé) ; tests/gps_l1ca_gpssdrsim_cross_generator.rs::ca_codes_lnav_fields_and_parity_match_gps_sdr_sim_bit_exactly (strict, ignoré avec l'écart) ; gps_lnav::tests

# text
seg-d61a6fd7896c = une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée — Échantillons I/Q de gps-sdr-sim (MIT, commit 28ca29a6) et son propre état de canal, préenregistré 7777da53 : (B1) chaque PRN simulé est acquis, (B2) aucun autre PRN n'est acquis, (B3) phase de code à { "0.5" } chip près, (B4) Doppler à { "125" } Hz près. CONSTAT : B1, B3 et B4 tiennent dans les deux fenêtres (pire cas { "0.195" } chip, { "72" } Hz), mais B2 échoue : les { "21" } PRN que gps-sdr-sim n'a pas simulés franchissent aussi le seuil (statistique de { "151" } à { "206" } contre { "79.5" } ; PRN simulés { "1 300" } et plus). Le seuil est fixé pour un bruit gaussien de la puissance d'échantillon mesurée ; gps-sdr-sim n'ajoute aucun bruit, de sorte que les cellules d'un PRN absent contiennent l'intercorrélation des autres satellites. Reste MODELLED : le seuil enregistré était la conjonction

# text
seg-7b32ce65d953 = iq::acq (acquire, AcqConfig) ; iq::io (decode_samples) ; iq::scene (GpsL1Ca)

# text
seg-538f0f38481a = tests/iq_gpssdrsim_cross_generator.rs::acquisition_threshold_is_crossed_on_gps_sdr_sim_noise_free_samples (constat figé) ; tests/iq_gpssdrsim_cross_generator.rs::acquisition_finds_gps_sdr_sim_satellites_in_its_samples (strict, ignoré avec l'écart)

# text
seg-9f9b58158cde = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Les formes closes propres aux moniteurs sur les scènes GPS L1 C/A propres à Kshana (bruit et signaux légitimes ; événements d'atténuation des signaux propres des satellites), par rapport à des seuils préenregistrés dans docs/design/MONITORS-IN-CAMPAIGN.md (382ab2f4). CONSTAT : M1, M2 et M4 atteints. M3 atteint sur la détection ({ "18" } atténuations sur { "18" }, P_md { "0" }) et NOT MET sur sa clause de délai : le temps médian de détection est de { "1.001" } s contre { "2" } x ARL1 échantillons = { "0.433" } s. Le CUSUM voit une estimation par fenêtre de { "1" } s, de sorte que la borne en nombre d'échantillons est inférieure à un échantillon. Cohérence interne seulement : aucun récepteur réel ni brouillage enregistré n'est vérifié

# text
seg-ee030053dc63 = iq::campaign (detect, runner, spec) ; iq::monitor (stats::gaussian_two_sided_pfa, sqm)

# text
seg-1663be50baf6 = tests/iq_campaign_monitors.rs : m1_power_test_false_alarm_rate_matches_the_closed_form ({ "73" } blocs sur { "5900" } par rapport à l'intervalle binomial à { "99" } % [{ "40" }, { "80" }] de P_fa { "0.01" }), m2_sqm_false_alarm_fraction_is_within_a_factor_of_2_of_2q_k (delta { "0.0160" }, rapport { "0.0131" } contre { "0.01" }), m4_cn0_false_alarms_stay_within_the_poisson_bound_of_arl0 ({ "0" } contre { "0" }), the_monitors_table_parses_and_validates ; m3_every_attenuation_is_detected_within_twice_the_arl1 (strict, ignoré avec l'écart) ; tests de iq::campaign::detect ; tests de iq::monitor::stats (gaussian_two_sided_tail_matches_known_values) ; tests/iq_campaign.rs (les empreintes figées sont inchangées sans le tableau)

# text
seg-491de717dd05 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Campagnes synthétiques à partir des scènes GPS L1 C/A propres à Kshana (atténuations des signaux propres des satellites), par rapport à des seuils préenregistrés dans docs/design/DETECTION-ROC.md (b47e358d). CONSTAT : R2 atteint (niveau du hasard quand il n'y a rien à détecter). R1 NOT MET : AUC de cn0_drop { "0.7855" } contre { "0.95" }, parce que chaque fenêtre négative après un événement hérite de la décroissance du CUSUM depuis la détection (les { "18" } négatifs postérieurs à l'événement atteignent tous { "81" } ou plus ; les { "18" } antérieurs à l'événement restent tous à { "0" }). Cohérence interne seulement : aucun récepteur réel ni brouillage enregistré n'est vérifié

# text
seg-e214fbcbf22e = iq::campaign (detect, report, runner) ; iq::monitor::spectral (kurtosis_reference)

# text
seg-c7d9da2a1afd = tests/iq_campaign_roc.rs : r2_with_nothing_to_detect_the_roc_sits_at_chance (AUC cn0_drop { "0.500" }, sqm_delta { "0.566" }, power_drop { "0.639" } sur des événements indiqués qui n'atténuent rien) ; r1_the_cn0_drop_roc_separates_6_db_attenuations (strict, ignoré avec l'écart) ; tests de iq::campaign::detect (the_roc_of_separated_and_of_identical_samples, windows_tile_the_time_outside_the_events)

# text
seg-e40884e4fef7 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Récupération synthétique de paramètres sur les scènes GPS L1 C/A propres à Kshana avec un profil C/N0 connu imposé à partir de la formule de la section { "3.1" }, poursuivi et noté par kshana iq campaign, par rapport à des seuils préenregistrés dans docs/design/LABFIT-FROM-IQ.md (section { "5.1" }, amendée le 2026-10-12 dans b7117bf, section { "13" }). L'estimateur de C/N0 des campagnes (M2M4) a été fixé dans 5b13e3c2, poussé avant la première évaluation d'un seuil (commité avec le code d'ajustement, et non seul), après un passage diagnostique de poursuite divulgué. CONSTAT sur la campagne de seuils à 18 événements : (c) PASS ; (a') NOT MET, erreur de delta_eff de -1.097 dB contre { "0.5" } dB (toujours -0.89 dB sur les classes à { "38" } dB-Hz et plus) ; (b') NOT MET, { "0" } campagnes sur { "50" } couvrent la vérité (erreur -1.189 +/- { "0.093" } dB, intervalle d'environ { "0.3" } dB) ; (d) NOT MET, forme close inférieure de { "2.20" } dB au J/S direct à la perte, environ le temps de séjour de la chute ajustée multiplié par la vitesse de rampe ({ "2.09" } dB) ; les clauses Q d'origine de (a) et (b) sont NOT MET parce que Q n'est pas identifiable. SUITE (seuils préenregistrés dans 1e532f84, docs/design/evidence/labfit-followup/RESULTS.md) : sur une campagne à J/S par paliers, delta_eff est retrouvé à +{ "0.185" } dB près (S1 MET : l'erreur de rampe est un retard de l'estimateur) ; (d) tel qu'écrit y est satisfait par le modèle de boucle de poursuite ({ "0.45" } dB) mais pas par le modèle empirique ({ "6.42" } dB), de sorte que S2 est NOT MET ; sur une nouvelle campagne à rampe, (d) avec les temps de séjour de la chute ajustée augmentés de la vitesse de rampe de chaque événement est à { "1" } dB près pour les deux modèles (R1 MET), et (a') et (d) tels qu'écrits sont de nouveau manqués (-1.25 dB ; { "2.32" } et { "9.47" } dB). La méthode est vérifiée, non un récepteur : elle ne peut pas être VALIDATED à partir de données synthétiques

# text
seg-f1371f2a4da4 = iq::labfit (campaign, cn0, iqfit, iqreport, schema, mod) ; iq::cli::labfit

# text
seg-27c989c6bdde = tests/iq_labfit_campaign.rs : bar_c_holdout_prediction_intervals_cover_between_80_and_98_percent (couverture PI90 de { "0.891" } sur { "558" } classes, { "0.900" } sur { "10" } événements de temps jusqu'à la perte sous chaque modèle de verrouillage), the_report_carries_its_inputs_censoring_validation_and_labels (entrées, censure, hachage et verdicts de [validation], audit du bloc d'unités), the_cluster_bootstrap_reproduces_from_the_campaign_and_seed, a_validation_mode_fit_refuses_to_start_without_its_table ; bar_a_prime_delta_eff_is_recovered_and_q_is_stated_not_fitted, bar_d_closed_form_threshold_matches_the_direct_estimate_within_1_db et bar_b_prime_ci_subset (stricts, ignorés avec l'écart) ; bar_b_prime_full_set_of_50_campaigns (ignoré, exécuté avant la publication) ; tests de iq::labfit::cn0 (dégénérescence exacte Q-delta, récupération de delta au Q indiqué, inverse du seuil en forme close) ; tests de iq::labfit::iqfit (les conditions du modèle de verrouillage reproduisent exactement le modèle de C/N0) ; tests/iq_labfit_followup.rs (la suite enregistrée dans 1e532f84 : s1_delta_eff_on_the_stepped_campaign MET, s2_d_as_written_on_the_stepped_campaign affirmant le NOT MET enregistré, r1_dwell_corrected_d_on_the_fresh_ramp_campaign MET, en release)

# text
seg-52d2a721c38a = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — decode_word/decode_frame de RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) comme programme distinct, préenregistré ca5f0142 : R1 parité et décodage, R2 valeur décodée égale à l'entier de Kshana multiplié par l'échelle IS-GPS-200 à { "2" }^-52 près en relatif, R3 à une demi-quantum près de l'entrée. CONSTAT : R1 { "960" } mots sur { "960" } et { "96" } sous-trames sur { "96" } ; R3 chaque paramètre, semaine et temps de référence exacts ; R2 échoue sur { "41" } valeurs (af1, delta-n, IDOT) de { "1" } à { "4" } unités de la dernière décimale parce que le P2_43 de RTKLIB est le décimal { "1.136868377216160E-13" }, à { "2.6e-16" } en relatif de { "2" }^-43 ; diviser par la constante de RTKLIB redonne l'entier de Kshana dans tous les cas. Reste MODELLED : le seuil R2 enregistré était trop serré pour la propre constante de la référence indépendante

# text
seg-50acb4bcdd8a = tests/gps_lnav_rtklib_decode_oracle.rs::rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43 (constat figé) ; tests/gps_lnav_rtklib_decode_oracle.rs::kshana_lnav_subframes_decode_in_rtklib_to_the_broadcast_parameters (strict, ignoré avec l'écart)

# text
seg-d0d7bf57aa68 = une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée — readrnx de RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) analysant le fichier de diffusion quotidien IGS BRDC00IGS_R_20250610000_01D_MN.rnx et decode_word/decode_frame décodant les mots de Kshana, exécutés comme programme distinct ; préenregistré d4d9eb9d avant la récupération du fichier, seuil en entiers exacts. Mutation : tronquer au lieu d'arrondir donne { "235" } échecs. Des comparaisons antérieures du même encodeur sont consignées comme constats : par rapport à gps-sdr-sim, qui tronque ({ "230" } champs), et par rapport aux valeurs mises à l'échelle de RTKLIB, dont la constante décimale { "2" }^-43 a manqué un seuil d'un ulp ({ "41" } valeurs). Post-vérification de l'intégrateur (reste MODELLED) : la comparaison concorde et une mutation de l'ensemble de parité la fait aussi virer au rouge, mais le préenregistrement d4d9eb9d est arrivé sur la branche publique à { "20" }:{ "02" }:{ "29" } UTC, deux secondes après le commit de résultat 1783f904 ({ "20" }:{ "02" }:{ "27" } UTC) qui contient déjà la sortie de RTKLIB pour le fichier, de sorte que l'ordre « enregistré avant la récupération du fichier » ne peut pas être démontré ; un nouvel enregistrement poussé avant la récupération d'un fichier de diffusion non vu le trancherait

# text
seg-90748b60b720 = tests/gps_lnav_rtklib_integer_oracle.rs::kshana_lnav_integers_decode_in_rtklib_from_an_unseen_broadcast_file ({ "32" } satellites du fichier de diffusion IGS du { "2" } mars { "2025" } : { "960" } mots sur { "960" } passent la parité RTKLIB, { "96" } sous-trames sur { "96" } se décodent, { "608" } entiers diffusés décodés sur { "608" } sont égaux à ceux de Kshana, chaque entrée à une demi-quantum près, semaine et temps exacts) ; gps_lnav::tests

# text
seg-407f33fff57c = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — GNSS-SDR { "0.0.19" } (GPL-3.0, programme distinct, configuration figée) sur les neuf lots L1 hors surface et le C/N0 BRUT du récepteur en vol (données de mission LuGRE, Zenodo { "16411687" }, CC BY { "4.0" }), préenregistré 768cb62b. CONSTAT : le lecteur de Kshana décode identiquement les { "288" } plages comparées à un convertisseur indépendant ; GNSS-SDR déclare { "266" } recherches positives sur { "288" } et Kshana est d'accord sur les { "266" } décisions, mais seules { "250" } sont localisées sur la cellule de GNSS-SDR (A2 échoue) ; la branche C/N0 est vide, aucune époque BRUTE en vol ne se trouvant à moins de { "30" } s d'un lot (la plus proche à { "141" } s). La plupart des positifs sont des artefacts : les niveaux bruts en complément à deux portent une moyenne de -0.5 sur I et Q, une raie à fréquence nulle { "32" } dB au-dessus du bruit dans une classe de { "1" } kHz, que les deux récepteurs acquièrent. Deux lots (OP5, OP12) ont été exclus par erreur : une lecture de leurs métadonnées dépouillée de ses chiffres a été prise pour une contradiction avec leurs en-têtes ; la vraie cause était que le lecteur ne pouvait pas lire un échantillon plus large qu'un mot (corrigé depuis). Reste MODELLED

# text
seg-c20f6fc678c5 = acquisition, portable_math, realdata::ion_sdr, realdata::lugre

# text
seg-6bf9cba81288 = tests/lugre_acquisition_gnss_sdr_oracle.rs::finding_dc_artefacts_and_no_contemporaneous_flight_cn0 (constat figé, conditionné aux données) ; tests/lugre_acquisition_gnss_sdr_oracle.rs::acquisition_and_relative_cn0_on_lugre_iq_match_gnss_sdr_and_the_flight_receiver (strict, ignoré avec l'écart) ; acquisition::tests ; realdata::ion_sdr::tests ; realdata::lugre::tests

# text
seg-90535435d10d = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Doppler prédit à partir des orbites finales ESA/ESOC et de la trajectoire reconstruite NAIF CLPS (xval/lugre-predicted-doppler/predict.py, indépendant de Kshana), préenregistré 0d1839d2. CONSTAT : les { "288" } recherches franchissent toutes le seuil sur du bruit (statistiques de puissance d'échantillon d'environ { "430" } à { "520" } contre { "346.3" }), de sorte que P1 tient trivialement et que P3 tient ({ "274" } sur { "288" } prédits visibles) alors que P2 échoue sur { "4033" } paires sur { "4036" }. Le front-end à bande limitée augmente le bruit de chaque cellule d'environ { "1.46" } fois (figé : plancher de bruit { "292" } contre le bruit blanc { "200" } sur OP2 PRN { "1" }), ce que la statistique de puissance d'échantillon ne voit pas. Reste MODELLED

# text
seg-709106f38b9d = acquisition, realdata::ion_sdr

# text
seg-cfefde0dbf55 = tests/lugre_acquisition_predicted_doppler_oracle.rs::noise_alone_crosses_the_sample_power_threshold_on_lugre_iq (constat figé, conditionné aux données) ; tests/lugre_acquisition_predicted_doppler_oracle.rs::acquired_doppler_differences_on_lugre_iq_match_the_orbit_prediction (strict, ignoré avec l'écart)

# text
seg-46dbb16e2ba8 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Doppler prédit à partir des orbites finales ESA/ESOC et de la trajectoire reconstruite NAIF CLPS (xval/lugre-predicted-doppler/predict.py, indépendant de Kshana), préenregistré a81a9a4e. CONSTAT : P1 et P3 tiennent ({ "4" } lots, { "12" } acquisitions sur { "12" } prédites visibles) mais P2 échoue sur { "8" } paires sur { "8" }. Les deux paires les plus fortes concordent avec la prédiction en amplitude mais avec le signe inversé (OP2 PRN 18/24 : +{ "7670.0" } Hz mesuré, -7693.9 prédit ; OP17 PRN 11/30 : +{ "11155.0" }, -11114.4), de sorte que l'ordre enregistré I-dans-le-quartet-bas est le conjugué de celui des lots ; les six détections juste au-dessus du seuil ne concordent avec aucun des deux signes. La dispersion Doppler de l'affinement ({ "30" } à { "50" } Hz entre deux passages) a aussi été sous-estimée par l'enregistrement. Reste MODELLED

# text
seg-b93425830963 = tests/lugre_acquisition_cell_average_doppler_oracle.rs::strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed (constat figé, conditionné aux données) ; tests/lugre_acquisition_cell_average_doppler_oracle.rs::cell_average_acquisitions_on_lugre_iq_match_the_orbit_predicted_doppler (strict, ignoré avec l'écart)

# text
seg-e10ffc7f4280 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Doppler prédit à partir des orbites finales ESA/ESOC et du noyau du site d'atterrissage Firefly NAIF CLPS (xval/lugre-predicted-doppler/predict_surface.py, indépendant de Kshana), préenregistré 2108e6ff sur des lots jamais ouverts auparavant. CONSTAT : la non-vacuité échoue ; aucun lot ne contient deux acquisitions. OP40 exclu (les métadonnées nomment un fichier manquant) ; OP38, OP73, OP77_0, OP77_1 n'acquièrent rien et ne montrent aucune fausse alarme à { "1e-7" } (statistiques maximales de { "325" } à { "356" } contre { "385.9" }) ; OP74 et OP76 acquièrent le PRN { "31" } et OP78_0 et OP78_1 le PRN { "12" }, chacun seul, tous prédits visibles. Reste MODELLED. Écarts divulgués : le seuil Doppler enregistré de { "10" } Hz repose sur un Monte Carlo synthétique de l'affinement cohérent, et non sur la dispersion des lots déjà vus que l'intégrateur avait demandée ; OP40 a été exclu avant le passage parce que ses métadonnées nomment un fichier d'échantillons que le jeu de données ne fournit pas

# text
seg-a6cce9d1c2fc = acquisition, realdata::ion_sdr, realdata::lugre

# text
seg-e953a0bb294b = tests/lugre_surface_acquisition_doppler_oracle.rs::each_surface_acquisition_is_a_single_predicted_visible_satellite (constat figé, conditionné aux données) ; tests/lugre_surface_acquisition_doppler_oracle.rs::surface_acquisitions_match_the_orbit_predicted_doppler (strict, ignoré avec l'écart)

# text
seg-9b89d7ff555a = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Identité d'annulation différentielle des erreurs + réutilisation de la machinerie PL SBAS DO-229E ; la solution à simple différence + WLS est en outre recoupée avec lsq()/matinv() de RTKLIB (Takasu, BSD-2-Clause, C compilé) — code de résolution indépendant, mais la même algèbre au premier ordre des différences de ligne de visée, donc toujours InternalConsistency

# text
seg-b4e5e57515cc = lunar_dpnt::tests (le mode commun d'horloge s'annule exactement ; le résiduel croît avec la ligne de base ; réutilise la PL SBAS ; le nombre de satellites est respecté jusqu'à la limite de { "24" } du constructeur, de sorte qu'une constellation plus grande ne peut pas silencieusement en renvoyer une plus petite) ; tests/lunar_differential_pnt_reference.rs (résiduel à simple différence + solution de position WLS par rapport à lsq() de RTKLIB compilé à partir du code source C)

# text
# c1: oem
seg-4d32db579be8 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — l'export OEM lunaire de kshana relu par la bibliothèque tierce indépendante <c1/> (R. J. Anderson) : les jetons de référentiel/temps et l'état par époque concordent à la précision d'écriture ({ "1" } mm / { "1e-9" } km/s) et un export sans TIME_SYSTEM est rejeté — un aller-retour d'interchange structurel ; la sémantique physique du référentiel et du temps lunaires est validée par leurs propres lignes, de sorte que cette ligne reste MODELLED. { "0.30" } comparaison externe, un constat (reste MODELLED) : un second lecteur indépendant, l'analyseur CCSDS OEM d'Orekit { "12.2" } (Apache-2.0, valeurs par défaut strictes), refuse les deux fichiers lunaires parce qu'il n'implémente pas les systèmes de temps LTC et TCL (il décode l'OEM EME2000/UTC de la crate, et décode les fichiers lunaires une fois TIME_SYSTEM remplacé par TDB) ; oem { "0.4.5" } les décode à la précision écrite seulement en se rabattant sur le système de temps non pris en charge. L'interchange de ces fichiers lunaires avec les lecteurs CCSDS courants n'est pas établi

# text
# c1: oem
seg-6a567344f386 = lunar_interop::tests (l'OEM porte REF_FRAME/TIME_SYSTEM lunaires ; les métadonnées de temps font l'aller-retour ; enveloppe KIF) ; tests/lunar_interoperability_export_reference.rs (l'OEM lunaire émis par kshana relu par la bibliothèque Python indépendante <c1/> : jetons REF_FRAME/TIME_SYSTEM/CENTER + état par époque à la précision du format ; un export corrompu est rejeté) ; tests/lunar_interop_oem_oracle.rs::recorded_two_reader_outcome_is_for_todays_export

# text
seg-2ceda14c0a73 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Formules par métrique dérivées à la main : diversité de Simpson inverse, composite en moyenne pondérée, durées de chronologie bornées/non bornées, échelle de niveaux au maillon le plus faible

# text
seg-952626fc6feb = resilience::arch, resilience::score, resilience::diversity, resilience::timeline

# text
seg-921e4d47fd96 = resilience::score::tests (monotonie, bornes du composite, plafond de niveau, provenance modélisée) ; resilience::diversity::tests (Simpson inverse, mode commun, SPOF)

# text
seg-173a6b137751 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Identités en forme close sur les statistiques de rang (tau dans [-1,{ "1" }] avec des valeurs calculées à la main ; Dirichlet déterministe à graine) et témoins stable/instable construits

# text
seg-718240555c3c = resilience::stats, resilience::study, resilience::panel

# text
seg-0e1bd42aca5a = resilience::stats::tests (exemple manuel de tau de Kendall, simplexe de Dirichlet, taux d'inversion) ; resilience::study::tests (contrôle de stabilité, témoin d'instabilité, déclaré par rapport à mesuré, effondrement de la diversité)

# text
seg-6ee8465d60c7 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Invariants en forme close correspondant à la discipline de compliance « représentativité justifiée + écarts jusqu'au vol identifiés » ; liés à la frontière entre statut de vérification et type de référence indépendante

# text
seg-246c5acb36ac = representativeness

# text
seg-300e70ee2f22 = representativeness::tests (validated-needs-external-anchor, modelled-needs-gap, modelled-TRL-ceiling, malformed-band, champs JSON)

# text
seg-177c7c6f506a = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Identités en forme close de bénéfice et de gagnant + enveloppe fidèle du quantum_trade::TradeResult existant ; honnêteté liée au registre de représentativité et aux étiquettes de vérification

# text
seg-03c943a8f1fc = qtrade

# text
seg-2d5a97db03cb = qtrade::tests (polarité du bénéfice plus haut/plus bas est meilleur, enveloppe fidèlement un vrai TradeResult, preuve malhonnête rejetée, un FoM validé exige un ancrage externe, JSON déterministe)

# text
seg-05e779241ded = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Coefficients d'horloge/CAI réutilisés (holdover/clock_state, valeurs publiées) + identités en forme close de bruit de grenaille et de pertes pour la liaison d'intrication

# text
seg-fe77856b9e9d = quantum_devices::tests (fiches d'horloge honnêtes et ordonnées ; précision d'intrication ~1/sqrt(tau) ; taux détecté -10x/10dB ; les comptages d'obscurité dégradent ; bornes du plancher systématique ; fiche modélisée et valide)

# text
seg-06a01a48fcad = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Bilan en quadrature en forme close sur des noyaux validés réutilisés (ADEV par rapport à Stable32/NIST ; borne TPL ; détection analytic_pd/pmd) ; honnêteté liée au registre de représentativité

# text
seg-65f4bc801f94 = timetransfer_chain::tests (la précision s'améliore avec l'intégration ; le quantique peut gagner ET perdre ; PL finie et positive ; le FoM de sécurité est dans [{ "0,1" }] et croît avec le retard de l'attaque ; Pd d'anomalie monotone ; le compromis est is_honest)

# text
seg-6ccf2bd93426 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Bilans inertiels réutilisés recoupés avec une double intégration Octave indépendante de la même EDO d'estime (environnement d'exécution différent, modèle partagé → ReferenceImpl) plus le bruit à court terme publié de Freier-2016 comme ancrage unilatéral ; le composite quantique contre classique reste MODELLED

# text
seg-52d8ccc852f8 = quantum_nav_od::tests (le quantique bat le classique sur une longue interruption ; l'avantage dépend de l'interruption ; le compromis est is_honest) ; tests/gnss_free_quantum_navigation_reference.rs (croissance de la position à l'estime par rapport à une double intégration Octave indépendante + l'ancrage de bruit publié de Freier-2016)

# text
seg-a06ba11bd079 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — AUC gaussienne en forme close = Phi(mu/(sigma*sqrt2)) recoupée avec eval_stats::bootstrap_auc_ci validé en externe (par rapport à scikit-learn) + seuils analytiques de détection

# text
seg-8e49ee940482 = quantum_faults::tests (valeurs connues d'AUC analytique ; l'AUC bootstrap empirique encadre la forme close ; le quantique détecte des défauts plus petits / une AUC plus élevée ; l'avantage disparaît pour des défauts énormes ; catalogue à 5 classes ; le compromis est is_honest)

# text
seg-c38a05cc3fdb = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Auto-cohérence de l'estimateur et de la géométrie : aller-retour direct→inverse, identité de Fisher/CRLB J·CRLB=I, monotonie du GDOP, et estimateur atteignant sa propre borne de Cramér–Rao sous bruit Monte-Carlo — contrôles de cohérence interne, PAS un jeu de données externe, de sorte que la ligne reste InternalConsistency. Géolocalisation passive MODELLED — modèle de ligne de visée à source ponctuelle ; aucun terme de trajets multiples / NLOS, de biais d'horloge du récepteur ou de réfraction atmosphérique. { "0.30" } tour { "2" }, par rapport à Ho et Chan { "1993" } et Ho et Xu { "2004" } (préenregistré f89018b8, { "1" } % de chaque valeur imprimée), un constat (reste MODELLED) : la borne TDOA contrainte à la surface reproduit les { "40" } facteurs géométriques N (-0.11 %, -0.02 %) et le TDOA maximal ; la borne conjointe TDOA+FDOA reproduit la Fig. { "6" } (+{ "0.06" } %, -0.17 %) et, à la source que le propre code des auteurs nomme pour la Fig. { "7" } (amendement rédigé après avoir vu ce résultat, divulgué), la Fig. { "7" } (+{ "0.11" } %, -0.02 %) ; elle est égale à la borne du code publié des auteurs (style BSD, exécuté sous GNU Octave) à { "3e-12" } près ; le solveur du maximum de vraisemblance pondéré par la covariance atteint la borne imprimée (+{ "0.3" } à +{ "0.4" } %). Les facteurs d'Ottawa que l'article imprime à partir d'un Monte Carlo ({ "251" }, { "7.1" }) diffèrent de +{ "1.3" } % et +{ "4.4" } %, hors du seuil de { "1" } %

# text
seg-d0119a3cb762 = geolocation

# text
seg-f85f780a9859 = geolocation::tests (TDOA sans bruit direct→inverse à { "1e-6" } m près ; J·CRLB=I avec une covariance symétrique définie positive ; la trace de la variance de position de la CRLB est non croissante quand un récepteur est ajouté ; TDOA+FDOA conjoints retrouvent la position+vitesse d'un émetteur mobile ; <{ "4" } récepteurs rejetés) ; tests/geolocation_reference.rs (allers-retours sur quatre géométries avec un réseau diversifié en 3D ; l'estimateur de Gauss–Newton atteint sa borne de Cramér–Rao — la covariance d'erreur empirique suit la borne analytique sur { "4000" } essais Monte-Carlo) ; tests/geolocation_crlb_published_oracle.rs (ho_chan_1993_maximum_tdoa ; ho_xu_2004_fig7_with_the_authors_corrected_source ; ho_xu_2004_bound_matches_the_authors_code ; finding_ho_chan_ottawa_printed_values_are_not_the_bound et finding_ho_xu_fig7_printed_source_is_not_the_plotted_one, figés)

# text
seg-8ac63d14e24b = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Cohérence interne : la relation et les constantes telles qu'imprimées dans NASA TR R-376, un contrôle de convergence à demi-pas, et l'ordre attendu des pics de chauffage et de décélération. CE QUI NE L'EST PAS : aucune valeur de chauffage publiée n'a été comparée (les articles Stardust donnent une limite de conception et une estimation convective plus radiative d'environ { "1200" } W/cm2, qu'une relation uniquement convective ne peut pas égaler) ; aucune correction de chauffage radiatif, de température de paroi ou de catalycité, ni de réponse de la protection thermique.

# text
seg-47854be05818 = entry_eo_ascent::entry_heating (stagnation_heat_flux, simulate_entry)

# text
seg-067596c7a683 = entry_eo_ascent::entry_heating::tests::heat_flux_relation_has_the_published_form_and_constants; entry_eo_ascent::entry_heating::tests::lift_lowers_peak_deceleration_and_heat_flux_of_a_shallow_entry; entry_eo_ascent::entry_heating::tests::mars_entry_runs_with_the_mars_constants; tests/entry_stardust_published.rs (consigne { "746" } W/cm2 pour Stardust sans seuil)

# text
seg-1f6aec0085c2 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Formes closes : la MTF de diffraction à mi-coupure, le bord en rampe d'un pixel d'une ouverture de détecteur pure (RER { "1" }), le bord en fonction de répartition normale d'un flou gaussien (RER = erf(0.5/(sigma sqrt { "2" }))), la mise à l'échelle du bruit de grenaille, et les coefficients GIQE { "4" } tels que publiés (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). CE QUI NE L'EST PAS : aucun imageur externe, aucune MTF mesurée ni aucune image cotée n'a été comparé ; la GIQE est une régression empirique avec sa propre erreur ; ni lumière parasite, ni MTF atmosphérique, ni compensation de MTF, ni repliement.

# text
seg-b15628833cf8 = entry_eo_ascent::eo_radiometry (Imager, snr_budget, giqe4_niirs, EoRadiometryScenario)

# text
seg-86769d0258ad = entry_eo_ascent::eo_radiometry::tests::diffraction_mtf_has_its_closed_form_values; entry_eo_ascent::eo_radiometry::tests::a_pure_pixel_aperture_has_a_ramp_edge_and_rer_one; entry_eo_ascent::eo_radiometry::tests::a_gaussian_blur_has_the_normal_cdf_edge; entry_eo_ascent::eo_radiometry::tests::snr_budget_scales_as_shot_noise_when_signal_dominates; entry_eo_ascent::eo_radiometry::tests::giqe4_switches_coefficients_at_rer_0_9_and_falls_with_gsd

# text
seg-3f515354b4d2 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Cohérence interne : l'identité exacte vitesse de fin de combustion = somme Isp g0 ln(m0/mf) moins les quatre pertes intégrées (résiduel inférieur à { "1e-6" } m/s), l'équation de Tsiolkovski sur une combustion verticale dans le vide où la gravité est la seule perte, et les pressions US76 au niveau de la mer et à la tropopause. CE QUI NE L'EST PAS : les pertes d'aucun véhicule publié n'ont été comparées ; ni rotation terrestre, ni phase balistique, ni étranglement, ni guidage au-delà du basculement ; C_D constant ; ce n'est pas un optimiseur de trajectoire.

# text
seg-4e91b2b5c9e1 = entry_eo_ascent::ascent (simulate_ascent, AscentScenario) ; reentry::us76_pressure

# text
seg-a5f4b59e7ca1 = entry_eo_ascent::ascent::tests::the_loss_identity_holds_to_integration_error; entry_eo_ascent::ascent::tests::vertical_vacuum_burn_has_only_gravity_loss_and_stays_vertical; entry_eo_ascent::ascent::tests::us76_pressure_has_the_standard_values; entry_eo_ascent::ascent::tests::a_larger_kick_lowers_burnout_flight_path_angle

# text
seg-55a57682f26d = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Cohérence interne : le modèle direct et l'équation résolue concordent à { "1e-15" } s près, le terme de Sagnac est égal à la forme en boucle BIPM 2A omega/c^{ "2" } indépendante du module, le terme ionosphérique est { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, et les processus de bruit montrent leurs formes de TDEV attendues. CE QUI NE L'EST PAS : aucune mesure TWSTFT réelle ni aucun rapport d'étalonnage n'a été comparé ; les retards et incertitudes indiqués sont des entrées, non mesurées ; les stabilités des séries fournies sont rapportées, non validées.

# text
seg-70ffbdec1a87 = twstft_budget (counter_readings, solve_offset, combined_uncertainty, flicker_phase, two_way_series, series_stability) ; time_transfer_budget (TimeTransferBudgetScenario, read_series)

# text
seg-998c0585be86 = twstft_budget::tests (l'équation bidirectionnelle retrouve exactement le décalage ; le terme de Sagnac est égal à la forme close en boucle BIPM ; le terme ionosphérique suit l'écart de fréquence et la troposphère s'annule ; la phase de scintillation a un TDEV plat ; un résiduel diurne relève le TDEV près d'une demi-journée ; un biais de réciprocité décale le décalage et non le TDEV ; la stabilité de la série retire un taux) ; time_transfer_budget::tests

# text
seg-4ca4b46b128c = une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée — La numérique est comparée à un programme indépendant (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } à { "30" } chiffres, quadrature tanh-sinh sur la variable de hauteur d'origine et densités gamma-gamma de Bessel-K) qui ne partage aucun code avec Kshana, selon des seuils fixés avant que toute implémentation n'existe (xval/optical-atmosphere/PREREGISTRATION.md). POURQUOI MODELLED : cette référence indépendante évalue les mêmes formules publiées, de sorte qu'elle vérifie l'implémentation des formules énoncées et non l'atmosphère ; aucun exemple de validation UIT-R et aucun relevé mesuré de scintillation ou d'extinction sur trajet oblique n'est utilisé (les valeurs UIT sont une décision de licence ouverte et sont tenues hors du dépôt). Le niveau du profil Cn2, la visibilité, les hauteurs d'échelle des aérosols et des molécules, la longueur de trajet de moyennage d'ouverture et l'appariement des moments utilisé pour appliquer le moyennage d'ouverture aux paramètres gamma-gamma sont des entrées ou des conventions indiquées. Une ligne de source dans le module consigne qu'une étude largement recopiée imprime le second exposant de scintillation comme 7/6 là où Andrews et Phillips donnent 5/6 ; la forme 5/6 est celle qui est implémentée

# text
seg-d36d667bfa06 = optical_atmosphere (rytov_variance, scintillation, gamma_gamma_cdf, fade_margin_db, aperture_averaging_factor, cloud_optical_depth, clear_air_optical_depth) ; optical_linkbudget (optical_link_budget_atmosphere)

# text
seg-eb08517c6ca2 = tests/optical_atmosphere_reference.rs (seuils préenregistrés A1-A3 par rapport à la référence mpmath indépendante : { "216" } points de grille de Rytov, pire erreur relative { "3.4e-7" } contre un seuil de { "1e-6" }, scintillation pire cas { "4.5e-16" }, facteur d'ouverture pire cas { "5.7e-16" }, { "96" } probabilités d'évanouissement gamma-gamma pire cas { "1.3e-12" } en log10, épaisseur optique des nuages et de l'air clair pire cas { "6.6e-16" }) ; tests/optical_atmosphere_no_moved_output.rs (seuil A5 : le bilan de liaison à pertes globales et les sorties existantes de disponibilité de site sont identiques bit à bit au commit de base sur { "1,000" } jeux de paramètres)

# text
seg-70e033b9dcab = optical_weather; optical_sitediv; optical_techniques; optical_atmosphere_scenario

# text
seg-66ac747dbe38 = tests/optical_atmosphere_identities.rs (seuil A4 : rho = { "0" } est égal à l'union indépendante et rho = { "1" } au meilleur site unique à { "1e-12" } près, et zéro violation de monotonie dans le nombre de sites et dans la corrélation ; le premier passage de ce seuil a échoué de { "3e-9" } parce que la fonction de répartition normale utilisée était la forme d'Abramowitz-Stegun à { "1.5e-7" }, un défaut d'implémentation remplacé par la fonction de répartition de la gamma incomplète, le seuil restant inchangé) ; optical_weather::tests et optical_sitediv::tests (marge monotone, le plafond nuageux comme forme close, les identités de durée de coupure, inversion de la recherche de marge)

# text
seg-1d817d8409d3 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Cohérence interne avec le module de holdover, bit à bit ; AUCUNE référence externe indépendante n'est revendiquée. Les DSP de classe sont les planchers synthétisés à long tau que le module de holdover porte déjà, de sorte que les chiffres héritent de sa réserve énoncée selon laquelle le holdover jusqu'à un seuil serré est gouverné par le plancher de bruit rouge supposé et non par l'écart-type d'Allan cité. Les durées de coupure sont un modèle log-normal à paramètres indiqués, non un relevé mesuré de durée de présence de nuages

# text
seg-95a61b2025cb = optical_outage_holdover (couple, clock_psds) ; holdover (coast_phase_sigma, holdover_seconds, phase_to_range_m)

# text
seg-b47fe3bc618f = tests/optical_atmosphere_identities.rs (seuil A6 : l'erreur de synchronisation par coupure est égale à holdover::coast_phase_sigma et l'erreur de distance à phase_to_range_m bit à bit sur { "9" } horloges, { "3" } durées moyennes, { "3" } dispersions et { "4" } quantiles) ; optical_outage_holdover::tests

# text
seg-55ce1b6d2dfd = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Cohérence interne seulement ; AUCUNE référence externe indépendante n'est revendiquée et il n'en existe aucune pour une réalisation météorologique. Les contrôles comparent un tirage à la sortie statistique du même modèle, de sorte qu'une réussite dit que le générateur échantillonne les distributions indiquées (la disponibilité et la part nuageuse du tirage se situent dans des tolérances préenregistrées des chiffres indiqués), non qu'un site réel se comporte ainsi. La série est une réalisation, non le climat : sa disponibilité diffère de celle indiquée de l'erreur d'échantillonnage du tirage, et les échantillons de scintillation à des pas différents sont indépendants, simplification indiquée d'un processus qui se décorrèle en millisecondes. Les entrées météorologiques restent les hypothèses du scénario.

# text
seg-86ae3e4b0c16 = optical_timeseries (site_series, SiteModel, SeriesSpec, Series) ; optical_atmosphere_scenario (TimeseriesSpec)

# text
seg-a19b90ab43ec = tests/optical_atmosphere_timeseries.rs (seuils T1-T6 de xval/optical-atmosphere/PREREGISTRATION-timeseries.md, fixés avant le premier passage : même graine mêmes octets et autre graine autres octets ; pas de clé sans le tableau ; sur { "8760" } h à { "600" } s, graines { "37" } et { "38" }, la disponibilité réalisée de chacun des trois sites par défaut à moins de { "6" } points de celle indiquée (pire cas { "3.3" }) et la fraction nuageuse réalisée à moins de { "5" } points de la probabilité indiquée (pire cas { "2.1" }) ; la marge est égale au bilan moins les deux évanouissements et « up » est égal à « marge non négative » à chaque pas ; aucun appel mathématique non portable dans le module ; passages trop longs et mauvais pas refusés)

# text
seg-4dfa142a94c4 = une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée — L'étiquette PDS3 que le processus de conditionnement des données de navigation du DSN a produite avec le fichier (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), vérifiée par rapport à des seuils préenregistrés dans xval/mro-odf/PREREGISTRATION.md avant que le lecteur n'existe. MODELLED parce qu'un seuil enregistré (les lignes du tableau de fin de fichier, { "121" } dans le fichier contre { "120" } dans l'étiquette) a été manqué ; l'étiquette y est incohérente en interne. Étape { "2" } (xval/mro-od/PREREGISTRATION.md, amendements A1 et A2 avant le résultat noté) : le Doppler prédit à partir de la reconstruction de l'équipe de navigation MRO (mro_psp5, NAIF) concorde avec le Doppler 2 voies à rampe observé à { "12.5" } mHz près sur des passages non utilisés en développement, seuil satisfait ; la détermination d'orbite enregistrée a échoué sur l'arc noté (matrice normale non définie positive) et n'a produit aucune orbite, de sorte que les seuils d'orbite n'ont pas été satisfaits. Le passage { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, un estimateur amorti, le même arc et les mêmes seuils, un amendement de notation R2-A1 divulgué dans docs/revisions) a convergé : l'orbite estimée est à { "0.36" } km RMS ({ "0.53" } km au maximum) de la reconstruction, seuils satisfaits, mais le RMS Doppler après ajustement est de { "48.6" } mHz contre le seuil de { "30" } mHz, non satisfait, de sorte que la ligne reste MODELLED. CE QUI NE L'EST PAS : aucune orbite estimée n'a satisfait tous les seuils enregistrés ; l'ionosphère, le plasma solaire et la plus grande part du décalage d'antenne (un décalage radial de { "1.5" } m est ajusté sur le passage de développement) ne sont pas modélisés.

# text
seg-3c8d970a385d = odf (parse_odf, Odf, OdfObservation, OdfRamp, seconds_1950) ; mars_od (DopplerModel, RampTable, compress_two_way, MarsDynamics, fit, fit_damped) ; naif_kernel (SPK type { "1" }) ; gravity_pds (SphericalHarmonicField::from_shadr)

# text
seg-09bfff22ee94 = tests/mro_odf_reader_label_oracle.rs (un vrai ODF MRO, 2007-304/305, par rapport à son étiquette PDS : nombre d'enregistrements, positions de groupes, stations, heures de début et de fin et types de données concordent ; le nombre de lignes du tableau de fin de fichier est manqué d'une unité, une incohérence de l'étiquette, figée comme constat) ; odf::tests (aller-retour d'un enregistrement construit à la main, époque { "1950" }) ; tests/mro_odf_short_arc_od_oracle.rs (conditionné aux données, entrées figées par SHA-256, CI mensuelle avec données réelles exigée : Doppler prédit à partir de la reconstruction de navigation MRO mro_psp5 sur les passages DSS { "63" } et DSS { "14" } notés, { "12.5" } mHz RMS, seuil { "30" } mHz, satisfait ; la détermination d'orbite enregistrée n'a produit aucune orbite, figé comme constat ; passage { "2" } avec un estimateur amorti, enregistré séparément : orbite à { "0.36" } km RMS et { "0.53" } km au maximum par rapport à mro_psp5, satisfait, Doppler après ajustement { "48.6" } mHz contre { "30" } mHz, non satisfait, figé comme constat ; lecteur SPK de type { "1" } par rapport à CSPICE, { "5e-7" } m) ; mars_od::tests

# text
seg-8566593647ee = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Cohérence interne : l'erreur d'estimation normalisée au carré du filtre par rapport à une vérité simulée à partir des mêmes modèles de capteurs sur des graines Monte Carlo, et convergence des estimations d'attitude et de biais. CE QUI NE L'EST PAS : aucun estimateur externe ni donnée de vol n'a été comparé (Basilisk { "2.9.1" } n'a pas de module MEKF) ; les modèles de capteurs sont ceux des manuels, sans désalignement, facteur d'échelle ni effets de champ de vue du viseur d'étoiles.

# text
seg-526efea83384 = aocs_mekf (Mekf, GyroSim, attitude_error, spd_solve6) ; aocs_kind (estimator)

# text
seg-1650d00d45ad = aocs_mekf::tests::mekf_is_consistent_over_monte_carlo_seeds ({ "40" } graines, NEES moyen à six degrés de liberté sur la seconde moitié à { "4.5" } à { "7.5" } près) ; aocs_mekf::tests::star_tracker_updates_bound_the_attitude_error; aocs_mekf::tests::attitude_error_is_the_body_frame_small_angle; aocs_kind::tests::estimator_loop_runs_and_reports_consistency

# text
# c1: passes::predict_passes
seg-3085ca73a5f1 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Cohérence interne, à partir de trois grandeurs calculées par des expressions différentes dans le même balayage puis exigées de se refermer. Les secondes d'ouverture de navigation, les secondes d'ouverture de communications et les secondes d'ouverture inactives sont cumulées séparément — l'inactivité à partir de (ouvertures − |servies|) par intervalle élémentaire, jamais comme un reste — et leur somme est vérifiée par rapport à ouvertures × horizon_s, ce qu'une frontière mal encadrée, un intervalle compté deux fois ou un intervalle perdu rompt immédiatement ; les temps servis par session sont en outre exigés de se rajouter aux deux totaux de service. Les propriétés structurelles du planificateur sont mesurées plutôt que supposées : le temps servi est vérifié non décroissant avec le nombre d'ouvertures sur { "200" } plans pseudo-aléatoires pour les trois politiques (non évident pour la politique non préemptive, où une ouverture supplémentaire change qui détient quoi à chaque frontière ultérieure), et l'arithmétique des frontières est figée à la paire contiguë/à recouvrement d'une seconde où une erreur d'un cran se cacherait autrement. Le pont du prédicteur de passages est vérifié par rapport à la sortie de <c1/> : avec une ouverture et aucun service concurrent, les secondes d'ouverture de navigation sont égales à la somme des durées de passage propres au prédicteur. Aucune référence externe indépendante n'est revendiquée et il n'en existe aucune : la capacité remplace l'arithmétique à la main plutôt que d'être vérifiée par rapport à elle, le plan de contacts fourni est illustratif et non volé, et aucun planificateur opérationnel ne publie une paire plan-plus-réponse avec sa règle d'arbitrage énoncée — un taux d'utilisation calculé sous une politique non énoncée n'est pas comparable à un taux calculé sous une politique énoncée, et la dépendance à la politique est mesurée (taux de navigation de 100/150 contre 50/150 sur le plan identique). Le temps de pointage et de changement, le volume de données, l'état des tampons, l'énergie et la fermeture de liaison sont exclus dans l'étiquette du rapport plutôt que modélisés silencieusement

# text
seg-4da98593fe6a = aperture_duty::tests (une fenêtre qui se termine exactement quand la suivante commence n'entre pas en contention, et la déplacer d'une seconde plus tôt coûte exactement une seconde — la garde contre l'erreur d'un cran ; des fenêtres qui se recouvrent au-delà du nombre d'ouvertures mettent la session de rang inférieur en coupure, l'intervalle de contention étant figé ; la politique d'arbitrage décide quel service détient l'ouverture, les chiffres des trois politiques étant figés sur un même plan ; le premier arrivé premier servi ne préempte pas une session qui détient déjà une ouverture ; une session qui perd l'arbitrage à son début acquiert une ouverture quand une se libère ; les trois taux d'utilisation rendent compte de chaque seconde d'ouverture disponible sur { "3" } politiques × { "4" } nombres d'ouvertures ; ajouter une ouverture n'augmente jamais la coupure d'aucune session, mesuré sur { "200" } plans pseudo-aléatoires × { "3" } politiques × chaque nombre d'ouvertures ; assez d'ouvertures pour chaque session ne laissent aucune coupure ; l'horizon de rapport tronque le plan et fixe le dénominateur du taux d'utilisation ; une liste de passages prédits devient un plan de contacts sans second type de fenêtre ; les chiffres de taux d'utilisation du plan fourni sont des sorties du moteur pour une et deux ouvertures ; le rapport énonce la politique qui a produit les chiffres ; chaque chiffre rapporté porte une unité et une classe de provenance ; le scénario est reproductible et se déclare MODELLED ; le scénario rejette un plan qu'il ne peut pas planifier) ; api::tests::aperture_duty_cycle_kind_round_trips_through_the_dispatch

# text
seg-cd818ac01de7 = vérifié par rapport à une implémentation distincte dans ce même code source — indépendante de l'unité testée, mais sans autorité externe — Recoupement de composition avec un chemin de code indépendant du dépôt : chaque J/S par liaison est redérivé comme la différence de deux bilans de liaison calculés avec linkbudget::received_signal_power_dbw, dont la perte en espace libre est l'unique expression { "20" }·log10(4πRf/c) plutôt que la somme à trois termes qu'utilise jamming::free_space_path_loss_db — les deux concordent à < { "1e-9" } dB sur chaque ligne (pire cas mesuré { "7.11e-14" } dB, c'est-à-dire de l'arrondi en virgule flottante). La chaîne d'interférence sous-jacente qu'elle compose est ancrée séparément en externe dans tests/gnss_denied_jamming_resilience_reference.rs (redérivation numpy/scipy indépendante du J/S et du C/N₀ effectif figée sur Kaplan & Hegarty §{ "9.4" }, plus le C/N₀ mesuré de JammerTest { "2024" }, Zenodo 10.5281/zenodo.15910563) ; la géométrie lunaire qu'elle compose est la géométrie lunar_service/lunar avec ses propres références indépendantes. Identités en forme close vérifiées ici : un éloignement du brouilleur divisé par deux ajoute exactement { "20" }·log10({ "2" }) dB à chaque ligne ; le J/S est exactement invariant au gain dans l'axe de l'antenne de l'utilisateur alors que le C/N₀ varie exactement de ce gain ; un masque d'élévation ne change aucune ligne survivante bit à bit. La ligne elle-même reste ReferenceImpl/modélisée : il n'existe aucune campagne de brouillage lunaire mesurée par rapport à laquelle valider, et la constellation est une géométrie illustrative de classe Moonlight/LCNS à source publique, non une éphéméride de vol

# text
seg-875ebc4e1cc4 = lunar_jamming (composant jamming, lunar_service, lunar)

# text
seg-d206adbe8e04 = lunar_jamming::tests ({ "17" } tests de bibliothèque : j_over_s_equals_the_difference_of_two_independent_link_budget_runs; the_report_prints_both_link_budget_legs_so_the_difference_is_checkable_from_it; the_scenario_reports_one_j_over_s_row_per_visible_satellite_and_never_a_median; a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports; a_closer_jammer_raises_j_over_s_by_exactly_the_free_space_loss_difference; a_more_distant_satellite_is_the_weaker_signal_so_it_carries_the_higher_j_over_s; j_over_s_is_invariant_to_the_user_antenna_boresight_gain; a_narrowband_jammer_leaves_no_higher_effective_cn0_than_broadband_at_equal_js; a_selenographic_jammer_gets_its_range_from_the_shared_lunar_geometry; a_strong_enough_jammer_takes_every_lunar_link_below_the_tracking_threshold; no_jammer_is_a_clean_sky_lunar_baseline_with_an_undefined_j_over_s; raising_the_elevation_mask_can_only_remove_rows_never_change_the_ones_that_remain; every_emitted_numeric_field_has_a_unit_and_a_provenance_class; the_csv_table_carries_every_row_of_the_json_table; the_run_is_deterministic_and_the_dispatch_surface_is_populated; bad_inputs_are_rejected_rather_than_producing_a_number) ; api::tests::lunar_jamming_kind_round_trips_through_the_dispatch_with_a_per_satellite_table

# text
seg-4dd2b99376b2 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Cohérence interne par rapport aux propres fonctions directes du moteur, ce qui est tout ce que cette capacité peut honnêtement revendiquer. Chaque point du contour est une inversion en forme close, et chaque inversion est vérifiée en repassant sa réponse par la fonction DIRECTE avec laquelle les propres lignes du rapport ont été notées : la colonne J/S par jamming::effective_cn0_dbhz (qui doit renvoyer tracking_threshold_dbhz à < { "1e-9" } dB-Hz), la colonne d'éloignement par jamming::free_space_path_loss_db et jamming::j_over_s_db (le même J/S à < { "1e-9" } dB), la colonne EIRP par jamming::j_over_s_db à l'éloignement propre du scénario. Le contour est en outre vérifié comme étant la FRONTIÈRE de l'ensemble de déni plutôt qu'un point à l'intérieur : lock_status perd l'accrochage sur une inégalité stricte, de sorte que le verdict est mesuré comme basculant de DEGRADED à LOST sur { "1e-4" } dB de J/S de part et d'autre du contour, ce qu'un contour décalé d'un epsilon ferait échouer. Le contrôle le plus fort est par liaison plutôt que par quantile : appliquer la même application au C/N₀ propre de chaque ligne reproduit exactement la colonne d'état du rapport — { "0" } désaccord sur { "38" } lignes sur { "38" } au point de fonctionnement documenté (kind = lunar-jamming, chaque entrée par défaut sauf jammer.range_m = { "25 000" } m), où { "26" } lignes sont LOST et { "12" } ne le sont pas. La monotonie est mesurée, non supposée : { "20 001" } échantillons sur [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } violation d'un éloignement strictement décroissant et d'une puissance requise strictement croissante, de sorte que l'ordre des quantiles de la bande est démontré plutôt qu'affirmé. ExternalDataset est écarté et validé avec lui : il n'existe aucune campagne de brouillage lunaire mesurée à laquelle comparer un rayon de déni, la constellation est une géométrie illustrative de classe Moonlight/LCNS à source publique plutôt qu'une éphéméride de vol, et les entrées du contour (EIRP, puissance du brouilleur, gains d'antenne, température de bruit) sont des ordres de grandeur représentatifs. ReferenceImpl a aussi été envisagé et écarté — l'inverse et l'expression directe sont la MÊME algèbre lue dans deux sens, de sorte que l'aller-retour détecte les erreurs de transcription et de signe mais n'est pas une implémentation indépendante ; l'appeler un recoupement serait le geste d'indépendance empruntée que les invariants de la matrice existent pour empêcher. Ce que la bande apporte est mesuré et cité plutôt qu'affirmé : à ce point de fonctionnement, le contour à scalaire unique est de { "27.402916" } km et place { "25" } km du côté nié pour les { "38" } lignes, alors que la bande { "21.256108" } .. { "29.921360" } km contient le point de fonctionnement et rapporte donc la répartition que le tableau montre réellement. Les deux critères sont aussi mesurés comme étant en désaccord — la bande de rapport de puissance ({ "38.186527" } .. { "53.691675" } km) ne contient pas du tout { "25" } km — ce qui est la raison pour laquelle les deux sont imprimées

# text
seg-ec5736cbb3b4 = lunar_jamming (denial_js_db, range_for_free_space_path_loss_m, Cn0Distribution, DenialContourPoint, ContourBand, DenialContour ; inversion de jamming::effective_cn0_dbhz, jamming::j_over_s_db et jamming::free_space_path_loss_db)

# text
seg-cdcfbbc52ae5 = lunar_jamming::tests ({ "10" } tests de bibliothèque : the_contour_is_the_exact_inverse_of_the_functions_the_rows_were_scored_with; the_band_is_the_measured_quantiles_pushed_through_the_contour_not_a_sigma; the_asymmetry_the_band_carries_is_the_samples_own_shape_bent_by_the_criterion; the_contour_is_monotone_in_cn0_measured_over_a_dense_sweep_not_assumed; the_band_recovers_the_split_verdict_the_single_scalar_contour_lost; the_distribution_is_the_tables_own_order_statistics_and_keeps_the_rows; a_link_already_below_the_threshold_gets_a_null_contour_point_not_a_number; a_clean_sky_run_has_no_contour_at_all_rather_than_an_empty_one; the_denial_threshold_is_the_same_thirty_decibels_the_rest_of_the_engine_uses; the_units_block_describes_the_contour_and_names_nothing_the_report_omits)

# text
seg-88d196f13afa = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Deux références internes, aucun jeu de données externe. ({ "1" }) Aller-retour en forme close : le biais minimal détectable est produit en inversant la queue du khi-deux non centré sur le paramètre de non-centralité (raim::pbias) et est vérifié en réinjectant la non-centralité obtenue dans raim::noncentral_chi2_cdf au seuil propre du moniteur, qui doit renvoyer P_md. ({ "2" }) Injection par rapport à l'analyse : un biais est écrit dans l'estimation RF d'un axe et cross_raim::run_cross_raim est réexécuté, de sorte que la statistique comparée à la non-centralité analytique est celle que le moniteur a calculée, et non une redérivation. Un Monte-Carlo à graine de la statistique elle-même figure dans les tests comme troisième contrôle ; il n'est délibérément PAS dans le rapport, car une estimation échantillonnée serait plus lente et non reproductible bit à bit. ExternalDataset est écarté : la grandeur est la puissance de détection de CE moniteur à l'allocation de sigma de CE scénario, et les ordres de grandeur de sigma par lesquels le MDB est mis à l'échelle sont des entrées représentatives modélisées, non des mesures. ReferenceImpl a aussi été envisagé et écarté — le Monte-Carlo échantillonne la même statistique que l'analyse décrit, de sorte qu'il détecte les erreurs de transcription et de coefficients mais n'est pas une implémentation indépendante du moniteur. { "0.30" } tour { "2" } (préenregistré 0135a9e4), bloqué (reste MODELLED) : SciPy { "1.18.1" } chi2/ncx2/brentq reproduisent le seuil du rapport (à { "5.4e-12" } près), le MDB par axe, la courbe de puissance, le multiple de croisement et le temps de détection en rampe (à { "5.3e-10" } près) sur cinq configurations ; les statistiques de défauts injectés n'ont pas de référence indépendante et les ordres de grandeur de sigma sont des entrées modélisées, de sorte que la délimitation attend une décision du propriétaire

# text
seg-83724a2a8e06 = hybrid_integrity::tests (la courbe de puissance de détection va du taux de fausse alarme à défaut nul jusqu'à { "1" } − P_md au biais minimal détectable ; le biais minimal détectable réinjecté dans noncentral_chi2_cdf au seuil que le moniteur lui-même a appliqué renvoie P_md à { "1e-9" } près, sur chaque axe et par l'assistant public ; un biais effectivement injecté dans l'estimation RF décale la statistique propre du moniteur d'exactement b²/(σ_rf² + σ_opt²) calculé à la main ; un biais sans bruit est détecté au-dessus de √(T/λ*)×MDB et manqué en dessous, l'échelle injectée encadrant ce croisement ; la puissance de détection est monotone avec l'amplitude du défaut et identique sur les quatre axes en multiples de MDB ; un Monte-Carlo à graine de 200,000 échantillons de la statistique du moniteur reproduit la puissance analytique à 4σ près en quatre points de la courbe ; le MDB de synchronisation temporelle est figé au-dessus de la limite d'alerte de synchronisation temporelle, ce qui est une faiblesse mesurée et non une fonctionnalité ; le quantile de Wilson-Hilferty est mesuré comme différant du seuil exact du moniteur d'environ { "4" } %, ce qui consigne pourquoi il n'a pas été utilisé ; le chiffre en rampe est exactement MDB/taux et varie en sens inverse du taux, et un taux non positif rapporte null plutôt que zéro) ; tests/hybrid_fault_power_scipy_oracle.rs (report_detection_power_matches_scipy_chi2_and_ncx2 ; report_detection_power_matches_scipy_with_comparable_sigmas)

# text
seg-df134052a2d9 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Aucune référence externe indépendante. Le croisement est une solution en forme close de la croissance de variance en marche aléatoire, et les tests le recalculent indépendamment à partir des valeurs que le rapport lui-même publie plutôt qu'à partir des éléments internes de l'émetteur. La covariance de départ est figée bit à bit sur la trace que le bloc de transfert existant avait déjà rapportée, de sorte que l'inertie ne peut pas propager une covariance que personne d'autre n'a vue. Les DSP de bruit de processus sont des entrées représentatives MODELLED et les temps de croisement varient directement avec elles, ce que le test de mise à l'échelle énonce comme une propriété mesurée plutôt que comme une affirmation. ExternalDataset est écarté délibérément : le temps d'inertie est une fonction directe de deux DSP modélisées et de limites d'alerte elles-mêmes représentatives, et il n'existe aucune inertie de transfert optique/RF lunaire mesurée à laquelle comparer. Une référence externe indépendante exigerait ici une courbe publiée de croissance de covariance après transfert ou de précision de holdover pour un récepteur comparable avec son modèle de bruit de processus énoncé, vérifiée à une tolérance

# text
seg-f9767a6109d5 = hybrid_integrity::tests (l'inertie part exactement de la trace de covariance que le bloc de transfert rapporte, dans les deux sens, de sorte que la diagonale rejouée ne peut pas dériver du transfert rapporté ; le temps de croisement rapporté est recalculé à partir du sigma de transfert, de la DSP de bruit de processus et du facteur de couverture propres au rapport, et la borne est à l'intérieur de la limite d'alerte juste avant lui et à l'extérieur juste après ; le temps d'inertie varie exactement en sens inverse de la DSP de bruit de processus et raccourcit quand la limite d'alerte se resserre ; une inertie à DSP nulle rapporte null plutôt qu'un temps nul, parce que jamais n'est pas immédiatement ; le profil émis croise exactement une fois et encadre le croisement rapporté ; le temps de doublement de la variance et le temps de croisement de la limite d'alerte sont figés séparément, étant différents de huit ordres de grandeur après l'étage optique serré et à moins d'un ordre de grandeur après l'étage RF lâche ; quitter la modalité optique achète plus de temps d'inertie que quitter la RF, exactement de la différence de covariance divisée par le taux de croissance horizontal ; et random_walk_time_to_limit distingue déjà-à-l'extérieur, croise-à-t et ne-croise-jamais)

# text
seg-903acaa666a9 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Mixte, et séparé plutôt que groupé. Le DIAGRAMME sous-jacent est validé en externe et conserve sa propre ligne (un jeu de référence scipy.special.j1 à < { "0.05" } dB dans tests/validate_p1_orbital_footprint.rs, plus ici l'abscisse de demi-puissance d'Airy publiée x = { "1.61634" } localisée par bissection plutôt que supposée). La GÉOMÉTRIE est vérifiée par rapport à de la trigonométrie des triangles en forme close écrite comme une expression différente du produit scalaire testé. L'INCLUSION du faisceau réel dans le cône approché est de l'algèbre dérivée (28.019/√η contre { "29.479" } degrés par λ/D), de sorte que la correction ne peut être que non positive pour η ≤ { "0.9035" }. Mais les COMPTAGES dans le faisceau eux-mêmes n'ont pas de référence externe indépendante : aucun tableau publié ne donne combien de satellites d'une coquille de classe Moonlight/LCNS tiennent un site polaire sud à l'intérieur du faisceau à mi-puissance d'une parabole donnée, et la constellation est une approximation illustrative à source publique, non une éphéméride de vol. Le désaccord mesuré au point de travail documenté — { "0" } liaison dans le faisceau sous le diagramme réel contre { "28" } sous l'approximation, −{ "2.33" } satellites par époque, pire époque { "3" }, sur { "76" } liaisons évaluées — est donc un constat MODELLED sur l'approximation, figé comme littéral de régression (la ligne la plus proche se situe à { "0.069" }° de l'un ou l'autre bord du faisceau, quatre ordres de grandeur au-dessus de tout désaccord sur le dernier chiffre), et non un chiffre de couverture validé en externe. Étiqueter la ligne ExternalDataset en s'appuyant sur l'ancrage externe propre au diagramme serait une validation empruntée, ce que les invariants de la matrice existent pour empêcher. { "0.30" } tour { "2" } (préenregistré d9755d28), bloqué (reste MODELLED) : la géométrie SPICE et les fonctions de Bessel de SciPy reproduisent l'angle hors axe (pire cas { "3.0e-5" } deg), le gain d'Airy et les indicateurs dans le faisceau sur { "6 336" } lignes d'états d'orbiteurs en vol et du point de travail documenté ; mais sur géométrie de vol les indicateurs se répartissent selon l'identité du satellite (la liaison la plus proche est à { "1.66" } deg du bord du faisceau), la visibilité à { "5" } deg est vérifiée comme un indicateur et non comme une élévation numérique, l'indicateur d'approximation symétrique applique la règle empirique 31000/G à un angle validé sans valider la règle, et les efficacités implicites n'ont pas de référence indépendante ; la délimitation attend une décision du propriétaire

# text
seg-6d2b55212f40 = lunar_service, antenna

# text
seg-730b359e2c3f = antenna::tests et lunar_service::tests (le croisement à mi-puissance localisé par bissection sur le diagramme concorde avec x = { "1.61634" } d'Airy publié et donne la largeur exacte de { "1.02899" }·λ/D, ce qui consigne que le coefficient conventionnel { "1.02" } se situe à −{ "2.955" } dB et non −{ "3.010" } dB ; le diagramme est strictement décroissant sur { "400" } points de l'axe au premier zéro ; l'algèbre d'efficacité implicite fait l'aller-retour à { "1e-12" } près et reproduit { "0.641" } / { "0.920" } ; l'angle hors axe concorde avec tan θ = R·sin γ/(r − R·cos γ) en { "20" } points et les deux limites à { "1e-12" } près ; le cône approché contient le faisceau réel ligne par ligne ; les comptages principaux sont égaux aux indicateurs par ligne qu'ils résument et la correction est égale à leur différence ; chaque verdict de ligne est recalculable à partir du seul rapport émis ; chaque champ numérique et booléen émis porte une unité et une classe de provenance ; une ouverture impossible n'émet aucun bloc ; sans antenne configurée, l'export conserve exactement ses six clés préexistantes, { "0" } feuille modifiée et { "0" } supprimée) ; tests/validate_lunar_export_offboresight_spice.rs (flown_orbiter_export_matches_spice_geometry_and_scipy_pattern ; documented_working_point_matches_anise_propagation_and_scipy_pattern)

# text
seg-7319e667db2e = vérifié par rapport à une implémentation distincte dans ce même code source — indépendante de l'unité testée, mais sans autorité externe — Le propre corrélateur sdr du moteur (sdr::correlate / synth_if / CaCode) avancé pas à pas sur une IF synthétique à graine à un C/N₀ étalonné — un chemin de code distinct atteignant les mêmes nombres par corrélation numérique d'IQ échantillonné plutôt que par une expression algébrique de gigue, de sorte que c'est une voie différente et non une reformulation — plus des valeurs tabulées standard de I₀ de Bessel modifiée pour le terme de saut de cycle. Théorie de boucle selon Kaplan & Hegarty ch. { "8" } et Viterbi/Gardner pour le temps de saut. La ligne reste ReferenceImpl/MODELLED : le recoupement vit dans ce même code source, et le contrôle de bessel_i0 valide une fonction spéciale plutôt que le modèle de poursuite, de sorte que promouvoir la ligne sur cette base serait un étiquetage intéressé. ExternalDataset exigerait un jeu de données IF brutes enregistrées avec un C/N₀ de vérité terrain et un instant annoté de perte d'accrochage (classe TEXBAT/OAKBAT) ; aucun n'est livré dans cet arbre, et même avec l'IQ ces jeux de données ne publient aucune vérité d'état de boucle par époque, de sorte qu'un temps de perte d'accrochage déclaré ne pourrait être validé que par rapport au détecteur d'accrochage d'un autre récepteur, ce qui est un choix modélisé et non une référence indépendante. Les largeurs de bande de boucle, le temps d'intégration, l'espacement des corrélateurs, le rapport de capture, les temps de séjour, la puissance du brouilleur et les gains d'antenne sont des chiffres de bande représentatifs, non une fiche technique. { "0.30" } tour { "2" }, GNSS-SDR { "0.0.19" } (GPL-3.0, exécuté comme programme) sur de l'IF générée indépendamment (préenregistré 6ef7698c, amendements de la méthode de mesure divulgués), un constat (reste MODELLED) : la gigue PLL et DLL en boucle fermée concorde à { "8" } % près à { "35" } à { "45" } dB-Hz, la contrainte dynamique de { "10" } Hz/s à { "1" } % près et le retard de rampe de code du premier ordre à { "2" } % près ; à { "30" } dB-Hz la gigue PLL est supérieure de { "21" } % et la gigue DLL inférieure de { "32" } %, les seuils mesurés de la règle des 15 degrés se situent { "1.5" } dB au-dessus du moteur, et la boucle du second ordre saute { "0.5" } à { "2" } décades plus souvent que la borne du temps de saut du premier ordre. { "0.30" } révision : le temps de saut de Costas utilise désormais le SNR de boucle rho/4 (sauts d'un demi-cycle) ; le jitter_table par défaut log10_mean_time_to_cycle_slip_s passe de { "11.58" } à { "2.10" } au seuil de { "25.47" } dB-Hz

# text
seg-9910640b7886 = tracking_loop (composant sdr, jamming)

# text
seg-a3538a1ff1f4 = tracking_loop::tests (gigue du discriminateur de Costas en boucle ouverte par rapport à sdr::correlate avancé pas à pas sur une IF synthétique à graine, { "3" } réalisations de bruit groupées × { "900" } époques, concordant à { "0.63" } % sur 35-45 dB-Hz, le terme de perte de quadrature devant s'ajuster au moins { "3" }× mieux que la forme sans perte de quadrature partout où il est résoluble ; la saturation du discriminateur atan à ~{ "32" } dB-Hz affirmée plutôt que simplement énoncée, de sorte que la limite de validité est figée ; σ en boucle fermée par rapport à une boucle de Costas sdr avancée pas à pas sur { "4000" } époques à { "3.7" } % ; retard de rampe de la DLL du premier ordre par rapport à une DLL sdr avancée pas à pas à { "0.17" } % ; bessel_i0 par rapport à I₀ tabulée à { "7.4e-8" } ; la largeur d'hystérésis devant tomber dans [{ "5" }·log₁₀ r, { "10" }·log₁₀ r] sur { "4" } rapports × { "2" } temps d'intégration × { "3" } largeurs de bande) ; api::tests::tracking_loop_kind_round_trips_through_the_dispatch ; tests/tracking_loop_gnss_sdr_oracle.rs::finding_is_pinned

# text
seg-63ab7261e10e = vérifié par rapport à une implémentation distincte dans ce même code source — indépendante de l'unité testée, mais sans autorité externe — Identités en forme close, sans référence externe indépendante revendiquée ni disponible. Le bras de levier est vérifié par rapport à ρ/B et les deux formes d'équipartition l'une par rapport à l'autre à { "1e-15" } près — identités algébriques, de sorte qu'elles détectent une erreur de câblage et rien d'autre, et sont étiquetées comme telles. Le résultat de fond est MESURÉ plutôt qu'affirmé : un retard issu d'une ligne de base fixe contraint la DIRECTION de la balise, de sorte que la composante de ligne de visée n'atteint la matrice d'information que par le terme de portée en champ proche, et le test lit l'anisotropie qui en résulte dans le spectre émis plutôt que de la dériver. AM-HM fait de √(p/trace(M)) un plancher strict, de sorte qu'une liaison à équipartition isotrope ne peut jamais que SOUS-ESTIMER, et le rapport calculé sur équipartition est exactement l'anisotropie qu'elle a écartée. MESURÉ sur la paire de type Goldstone/de type Canberra dont la corde est de { "10726.748" } km : sur { "112" } jours échantillonnés, { "36" } n'admettent aucune époque mutuellement visible à un masque de { "10" }°, le maximum jamais mutuellement visible est de { "17" } sur un calendrier de 49 échantillons, et sur les { "73" } jours viables le rapport à trois composantes va de { "113.9" }× à quatre ordres de grandeur de plus, médiane { "1513" }×, tandis que la restriction aux deux directions transverses que la ligne de visée n'affame pas donne de { "3.94" }× à { "25.8" }×, médiane { "7.8" }×. CE QUE CETTE LIGNE NE REVENDIQUE PAS : aucun de ces chiffres comme propriété d'une campagne réelle. Elle établit que la grandeur au point de surface est désormais CALCULÉE plutôt que supposée, et qu'elle ne peut pas être silencieusement échangée avec celle au niveau de la station. Reste ReferenceImpl/MODELLED : il n'existe aucune covariance publiée de point de surface en VLBI lunaire par rapport à laquelle valider, les stations et le site de balise sont illustratifs plutôt que levés, et l'éphéméride, les horloges, la troposphère et les paramètres d'orientation de la Terre sont tenus FIXES, de sorte que c'est une borne de Cramér-Rao pour un jeu de paramètres réduit et optimiste à part entière. La même grandeur sur le chemin par noyau (balise sur la Lune DE440) est validée dans sa propre ligne, « …, chemin par noyau » ; sur ce chemin analytique le plus petit sigma de balise est inférieur de { "3.9" } % à la référence SPICE de cette ligne, ce qui est la raison pour laquelle cette ligne reste MODELLED

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
seg-f4648485be52 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Cohérence interne (InternalConsistency) : la réduction d'ordre 2 vers le chemin ADD v4.2 vérifié par MAAST, redérivation indépendante des a priori, et un défaut construit à deux satellites. Aucun passage MAAST ou RTKLIB au-delà des paires n'a été fait, de sorte que les ensembles d'hypothèses plus profonds et les niveaux de protection du RAIM par sous-ensembles ne sont pas vérifiés en externe. araim_subset_raim partage les simplifications d'araim_dual_raim (un sigma pour l'intégrité et la précision, une horloge, la queue normale simple) : il n'est pas conforme à l'ADD

# text
seg-9b655d02dc39 = araim_reference (add_v42_subset_plan, add_v42_protection_levels_to_order) ; raim (araim_subset_raim, SubsetRule)

# text
seg-feaea6cb2b12 = tests/raim_multi_sv_subsets.rs (deeper_orders_change_nothing_when_pairs_suffice ; triples_are_refused_at_order_two_and_planned_deeper : N_fault,max >= { "3" }, le risque non surveillé dans P_THRES, un sous-ensemble retirant trois satellites ou plus surveillé, et plus de dix a priori surveillés redérivés indépendamment comme P_no fault q^k à { "1e-12" } près ; a_two_satellite_fault_is_found_as_a_pair : aucune alarme sans défaut, et un biais de { "30" } m sur deux satellites détecté avec la paire comme sous-ensemble de plus grande séparation normalisée) ; tests/araim_reference_vectors.rs et tests/integrity_araim_stanford_oracle.rs inchangés (le chemin d'ordre 2 est celui vérifié par MAAST)

# text
seg-a2b978f8bb5a = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Cohérence interne (InternalConsistency) : les niveaux de protection sont ceux de snapshot_raim, validé par rapport à RTKLIB dans sa propre ligne, recalculés sur la même géométrie ; comportement sans défaut et avec défaut injecté. Le ciel est une géométrie prédéfinie représentative (et non un almanach daté), les résidus sont synthétiques et sigma, les limites d'alerte et les probabilités sont des entrées indiquées ; rien ici ne constitue une déclaration sur la disponibilité d'un récepteur réel

# text
seg-7fa54ce845e3 = clock_integrity (run, sky_at, IntegrityCfg) ; scenario (Scenario::integrity) ; report (RunResult::integrity_fom) ; api (répartition clock)

# text
seg-b9a184f14d5a = tests/clock_integrity.rs (the_block_is_separate_and_absent_by_default : chiffres de holdover inchangés, { "111" } époques refusées indisponibles sans niveau de protection, refusé avec runs > { "1" } ; protection_levels_are_the_snapshot_raims_on_the_same_sky : le HPL et le VPL de chaque époque échantillonnée sont exactement égaux à un snapshot_raim à résidu nul sur le même ciel prédéfini, et le passage sans défaut ne lève aucune alarme ; a_stated_bias_is_detected_while_it_lasts : un biais de { "60" } m alarme exactement sur les { "10" } époques qu'il couvre ; every_integrity_field_has_a_unit) ; clock_integrity::tests ; les références d'or de clock inchangées

# text
seg-6a7d171f880f = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Un rang indépendant par échelonnement de lignes (élimination de Gauss avec pivot partiel) confirme chaque verdict de rang à six états — un algorithme différent ne partageant aucun code avec la voie valeurs propres/SVD testée. La matrice de transition d'état CR3BP { "6" }×{ "6" } qu'elle compose porte sa propre référence ReferenceImpl par rapport à l'intégration variationnelle de SciPy, et les conditions initiales halo/NRHO proviennent d'un correcteur qui reproduit l'orbite Gateway L2 sud { "9" }:{ "2" } publiée. La branche existante du filtre d'information en racine carrée n'est explicitement PAS comptée comme corroboration : elle consomme les mêmes jacobiennes et se réduit à la même matrice normale, de sorte que c'est un contrôle de cohérence entre deux machines numériques, et l'étiquette d'extension émise le dit. PAS ancré en externe, et ExternalDataset est donc écarté plutôt qu'emprunté à la ligne de la STM : les longueurs d'arc de seuil elles-mêmes dépendent de la conception de constellation MODELLED, de la grille d'époques et — de façon mesurable, jusqu'à { "40" }× — de la tolérance sur les valeurs singulières. Le { "2.09" } h planaire publié est reproduit exactement à rel_tol = { "1e-6" } et dépend lui-même de la tolérance ({ "10.25" } h à { "1e-4" }, { "0.42" } h à { "1e-8" }), ce qui est une propriété du critère plutôt que de l'orbite. Aucun jeu de données public ne publie de seuil d'observabilité en longueur d'arc pour une constellation cislunaire choisie. RÉSULTAT MESURÉ : le seuil spatial à six états est de { "22.17" } h pour la NRHO L2 et de { "40.42" } h pour le halo L2, et N'EXISTE PAS pour la famille DRO planaire sur laquelle l'affirmation publiée a été établie — rang { "4" } sur { "6" } avec un défaut de datum de { "2" } et deux valeurs propres exactement nulles, un défaut structurel qu'aucune longueur d'arc ne rétablit

# text
seg-3ba62864dd31 = cislunar_observability, observability_gramian, intersat_range, cislunar_srif

# text
# c1: units
seg-02de44e48cf6 = cislunar_observability::tests et observability_gramian::tests (le document par défaut figé bit à bit par FNV-1a de son JSON, de son résumé et de son SVG, avec des valeurs par défaut explicites affirmées sans effet et les huit clés d'extension affirmées ABSENTES afin que la capture ne puisse pas être régénérée en auto-comparaison ; le bloc additif <c1/> exclu du gel en étant retiré puis rehaché par rapport à la constante figée avant qu'il n'existe, ce qui prouve plutôt que suppose que rien de ce qui a été publié n'a bougé ; invariance du rang sous un sigma homoscédastique affirmée à σ = { "0" }, { "0.1" }, { "1" }, { "10" }, { "100" } m ; σ_pos affirmé varier exactement linéairement avec σ à { "1e-6" } près en relatif ; l'espace nul de la DRO affirmé être exactement les axes de coordonnées z et ż avec les deux causes séparées — une ligne de portée entre engins coplanaires a û_z = { "0" }, et le bloc hors plan de la CR3BP se découple exactement à z = { "0" } ; jacobiennes spatiales par rapport à des différences finies centrales et par rapport à l'observable 3-D de vitesse de portée indépendant de la crate ; familles hors plan refusées en mode planaire)

# text
seg-d1770a478184 = vérifié par rapport à une implémentation distincte dans ce même code source — indépendante de l'unité testée, mais sans autorité externe — Trois voies indépendantes, aucune n'étant un chiffre publié de précision de prédiction. ({ "1" }) Un signal analytique à coefficients connus — la seule façon d'exercer la machinerie périodique, puisqu'aucune série commitée n'est assez longue pour admettre un terme annuel. ({ "2" }) La solution des moindres carrés en forme close des manuels, algèbre différente de la résolution matricielle testée, sur des lignes réelles. ({ "3" }) Les véritables lignes de prédiction archivées du Bulletin A que le produit réel de { "2026" } publie, comparées par échéance comme statistique de CONCORDANCE et explicitement non comme une erreur : { "0.256" } ms à { "1" } jour, { "0.695" } ms à { "2" } jours, { "1.252" } ms à { "3" } jours, dérivant jusqu'à { "3.885" } ms à { "9" } jours. Il s'agit donc de la CLASSE du Bulletin A, proche à courte échéance, et non du Bulletin A. Les résiduels prédit-contre-final sont des grandeurs mesurées réelles sur de vraies lignes de l'IERS, mais leur amplitude n'est vérifiée que par rapport à la DIRECTION de la comparaison, jamais par rapport à un chiffre de précision publié par l'IERS — lire un produit réel relève de la provenance, non d'une référence indépendante. MESURÉ : au jour { "1" } le prédicteur opérationnel donne { "3.78" } m d'erreur dans le référentiel lunaire contre { "11.39" } m pour la persistance ({ "3.01" }×), au jour { "2" } { "10.23" } m contre { "21.72" } m ({ "2.12" }×), au jour { "3" } { "20.33" } m contre { "30.57" } m ({ "1.50" }×) — et il est PIRE au-delà de trois jours ({ "0.87" }× à { "5" } jours, { "0.43" }× à { "10" }), ce que le rapport émet plutôt que de ne montrer que les horizons qui le flattent. NON reproduits : le filtre résiduel autorégressif et la réduction tabulée des marées zonales, la fenêtre opérationnelle de 365 jours est inaccessible avec les données commitées, et AUCUN millésime archivé antérieur de la série n'existe dans ce dépôt — de sorte que le tableau de millésimes archivés ne rapporte aucune ligne plutôt que de noter une ligne synthétisée. { "0.30" } comparaison externe, un constat (reste MODELLED) : noté par rapport aux mêmes finals sur { "178" } émissions archivées du Bulletin A avec la fenêtre de 15 jours par défaut de la crate, le MAE UT1 du prédicteur est de 2.4x à 12.6x celui du Bulletin A de { "1" } à { "10" } jours (seuil 1.5x) et de { "5.32" } ms à { "10" } jours, hors de la plage de { "0.36" } à { "3.13" } ms de la 2e EOP PCC ; le pôle est de 1.5x à 1.85x celui du Bulletin A (à l'intérieur de 1.5x seulement à { "6" } et { "7" } jours) ; { "19" } conditions préenregistrées sur { "21" } échouent. Correction à la voie ({ "3" }) : les lignes du produit de { "2026" } auxquelles elle a été comparée portent le drapeau IERS I (mesuré), non P, de sorte que ces chiffres de concordance sont par rapport à des valeurs rapides mesurées, non à des prédictions du Bulletin A. { "0.30" } tour { "2" }, un prédicteur par moindres carrés plus autorégressif avec les marées zonales retirées analytiquement, par rapport à { "178" } émissions archivées du Bulletin A au seuil du tour 1 (préenregistré c93605b4), un constat (reste MODELLED) : { "12" } conditions sur { "21" } tiennent ; le MAE UT1 est de { "1.73" } à 2.11x celui du Bulletin A de { "2" } à { "10" } jours (seuil 1.5x) tandis que le pôle est à moins de 1.27x à chaque échéance. { "0.30" } révision : l'entrée hors ligne étant désormais classée par drapeau IERS, les chiffres de concordance de la voie ({ "3" }) sont par rapport à de vraies prédictions du Bulletin A (0.256/0.695/1.252/3.885 ms à 1/2/3/9 jours par rapport aux lignes rapides -> 0.133/0.421/0.839/2.786 ms)

# text
seg-455bea44de27 = frame_eop, realtime_frame_eop

# text
seg-faacca83ed58 = frame_eop::tests, realtime_frame_eop::tests et tests/operational_eop_predictor_reference.rs (récupération des coefficients du signal analytique à { "1e-9" } près sur une fenêtre de 365 jours ; un ajustement biais-plus-taux égal à la pente et à l'ordonnée à l'origine des moindres carrés ordinaires en forme close à { "1e-12" } près sur des lignes réelles ; DEUX détecteurs d'anticipation qui sabotent les colonnes UT1 rapide et pôle de chaque ligne après l'époque d'émission — en laissant intacts les finals du Bulletin B — et exigent une sortie identique bit à bit, vérifiés par mutation pour faire virer { "10" } tests au rouge quand la barrière d'ajustement est desserrée d'exactement un jour ; une liste d'époques reconstruite indépendamment ; le bloc Bulletin B d'une cible blanchi et l'époque montrée comme quittant le tableau ; admission des termes vérifiée à des fenêtres de { "6" }, { "15" }, { "150" } et 365 jours ; nombres de lignes monotones ; et une capture gelée du rapport par défaut avant le changement, affirmée champ par champ sans tolérance, qui affirme en outre que la capture ne contient pas les nouvelles clés afin qu'elle ne puisse pas être régénérée silencieusement en auto-comparaison) ; tests/operational_eop_predictor_bulletin_a_oracle.rs::predictor_mae_against_bulletin_a_and_the_pcc_range_finding ; tests/operational_eop_ls_ar_bulletin_a_oracle.rs::ls_ar_predictor_against_bulletin_a_finding ; tests/eop_prediction_beyond_table.rs (l'extension optionnelle EopSeries::with_ls_ar_prediction au-delà de la dernière ligne : réponses dans le tableau identiques bit à bit, lignes de prévision égales à ls_ar_predict, arguments de référentiel au-delà du tableau suivant la prévision au lieu d'être tronqués ; cohérence interne)

# text
seg-c77bd56a0619 = lunar_frame_campaign (composant lunar_vlbi, lunar_vlbi_fim, fim, lunar, lunar_frame_realise, frames, cio, lunar_frame)

# text
seg-98fa9786f0c9 = lunar_frame_campaign::tests ({ "21" } tests de bibliothèque : la conception de Helmert par rapport à une différence finie centrale de lunar_frame_realise::apply_helmert — le module POUR lequel le datum existe, qui ne calcule aucune dérivée et fige donc la convention de signe de [p]ₓ — les { "84" } entrées de conception concordant toutes à < { "1e-6" } ; une translation pure du réseau relue comme une translation pure avec une fuite < { "1e-6" } vers les six autres paramètres ; le sigma de datum exactement linéaire avec le sigma de retard à { "1e-8" } près sur un changement d'un facteur { "3" } sur les sept paramètres ; un arc de { "16" } h mesuré pire et un arc de { "48" } h mesuré meilleur que { "24" } h, avec le balayage de libration émis ordonné de la même façon ; l'axe de translation le pire affirmé ÊTRE l'axe dominant de la direction solidaire du corps vers la Terre mesurée séparément et pire que les autres de > { "5" }×, une référence de physique dont rien dans le solveur n'a été informé ; trois balises colinéaires produisant un défaut avec chaque sigma de datum NULL et les directions nulles émises dans la base à sept paramètres ; offblock_fraction et corrélation inter-balises exactement { "0.0" } avec les stations fixes et toutes deux > { "0" } avec elles estimées ; les chiffres de transformation injectée du bloc de comparaison montrés égaux à un passage indépendant de ce scénario à { "1e-14" } près en relatif plutôt que transcrits ; une garde qu'aucun datum injecté/récupéré n'apparaît où que ce soit dans le document ; l'émission de la réalisation du référentiel lunaire figée octet par octet par FNV-1a-64 sur json‖summary‖svg pour trois formes d'entrée, empreintes prises avant le début du travail) ; tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_frame_campaign_finding_stations_estimated_p2_precision (conditionné ; le test strict lunar_frame_campaign_matches_spice_geometry_and_numpy reste ignoré) ; tests/lunar_frame_campaign_mpmath_oracle.rs::lunar_frame_campaign_datum_matches_mpmath_extended_precision (constat ; décision du fondateur 2026-10-02, option A : cette ligne reste MODELLED et n'emprunte pas le statut de la ligne distincte ; par rapport à une référence mpmath à 50 chiffres, préenregistrée 804662d5, les sigmas de datum à stations estimées du moteur sont dans leur borne d'erreur inverse a priori, à { "9.7e-6" } près le 2024-01-01, et le seuil de { "1e-9" } était en dessous de ce que toute voie en double précision atteint, la meilleure, une projection QR NumPy, étant à { "5.5e-9" } ; les preuves appuient la ligne distincte « Covariance de datum du référentiel lunaire avec les stations estimées, par rapport à la précision étendue à 50 chiffres ») ; tests/lunar_frame_campaign_pinv_fallback.rs::finding_step0_fresh_beacon_information_falls_back (figé) ; tests/lunar_frame_campaign_cond_bar_oracle.rs::finding_p2_condition_scaled_bar_not_met_on_the_estimated_scenarios (figé)

# text
seg-114007ecc9fe = vérifié par rapport à une implémentation distincte dans ce même code source — indépendante de l'unité testée, mais sans autorité externe — Un estimateur distinct dans ce code source, sur un algorithme différent et un chemin de code disjoint : Gauss-Newton pondéré non linéaire avec dérivées partielles par différences finies, son verdict lu comme une erreur de récupération d'état mesurée en km et mm/s. Il n'a aucune expression en commun avec la voie rang-et-covariance du Gramien, et la séparation est IMPOSÉE par une garde sur le texte source plutôt qu'affirmée. MESURÉ sur la grille DRO planaire publiée : le critère d'ESTIMABILITÉ est CORROBORATED — la frontière Monte-Carlo mesurée est de { "5.739130" } h contre { "5.739130" } h formel (rapport { "1.0000" }), et le RMS mesuré reproduit le 1σ formel sur { "21" } longueurs d'arc à un rapport en moyenne géométrique de { "0.9804" }. Le critère de RANG n'est PAS corroboré comme frontière de récupérabilité : l'estimateur récupère à partir de { "0.782609" } h contre { "2.086957" } h pour le Gramien, rapport { "0.375" }, et à { "1.826087" } h — le dernier préfixe que la lecture du rang note { "3" } sur { "4" } — récupère à { "1.96e-5" } du déplacement a priori. La frontière de récupération est inchangée sur trois décades de sa propre borne alors que le seuil de rang va de « jamais » à { "0.782609" } h sur quatre décades de rel_tol, et les deux coïncident exactement à rel_tol = { "1e-8" }. Cette étendue avait d'abord été consignée comme atteignant { "0.260870" } h ; ce chiffre était un ARTEFACT, produit par une lecture du rang qui comptait { "4" } directions à partir de { "2" } lignes de mesure sous le plancher de bruit f64, et il est corrigé ici plutôt que laissé en place. La lecture du rang est désormais bornée par l'inégalité de Sylvester avec la raison émise, et l'étendue corrigée sature exactement à l'arc où l'estimateur indépendant récupère, ce qui renforce la validation croisée de cette ligne plutôt que de l'affaiblir : le { "1e-6" } publié est une CONVENTION prudente sur les valeurs singulières, non une déclaration sur la récupérabilité. Même schéma dans l'espace : NRHO { "9.290323" } h contre { "21.677419" } h, halo { "22.978723" } h contre { "39.829787" } h, l'estimabilité concordant exactement dans les deux cas. Le DRO planaire à six états ne récupère à aucun arc, reproduisant indépendamment le défaut structurel de datum de cette famille à partir d'un estimateur qui n'en sait rien. PAS ancré en externe — la dynamique et les conditions initiales sont partagées avec l'analyse testée et aucun jeu de données public ne publie un tel seuil — de sorte que ExternalDataset est écarté

# text
seg-f3fcc6b9e10a = cislunar_arc_recovery, batch_ls

# text
seg-457a19842691 = cislunar_arc_recovery::tests et tests/cislunar_arc_recovery_reference.rs (les deux frontières et leurs rapports figés sur la grille publiée ; la courbe d'erreur mesurée comparée à la covariance formelle ligne par ligne avec une borne d'un facteur deux par ligne et une borne en moyenne géométrique ; un TÉMOIN NÉGATIF — le DRO planaire à six états — affirmant que le critère PEUT échouer et que l'estimateur non régularisé diverge au-delà de { "1e6" } km plutôt que de renvoyer une petite erreur plausible ; l'invariance de la paramétrisation affirmée sur chaque préfixe à { "1e-3" } près en relatif ; une garde sur le texte source qui retire les commentaires, les littéraux de chaîne et le module de test puis échoue à toute mention de la jacobienne, de la STM, du rang SVD ou de la machinerie SRIF, vérifiée par mutation en injectant un appel interdit ; un contrôle réservé aux tests que les différences finies sont égales aux lignes analytiques, de sorte que la linéarisation est connue pour être bonne alors que la voie analytique reste absente de l'estimateur ; déterminisme affirmé octet par octet ; le document cislunar-observability publié figé par son ensemble de clés, son empreinte canonique et sa ligne de résumé)

# text
seg-03751f09c5c9 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — La GÉOMÉTRIE est externe et hachée : trois jeux d'essai dont les nombres proviennent uniquement de documents récupérés avec URL, date de récupération et SHA-256, régénérables par des générateurs commités qui vérifient le hachage amont et ABANDONNENT plutôt que d'émettre un nombre — la constellation de référence de la démonstration d'interopérabilité LANS (NASA NTRS { "20250009447" }, SHA-256 d1b916be…), les études de cas LNCSS (NAVIGATION { "70" }({ "4" }) navi.613, CC BY, SHA-256 { "4e294687" }…), et une véritable éphéméride de vaisseaux en vol pour LRO, Danuri, Chandrayaan-2 et CAPSTONE évaluée à partir des propres noyaux reconstruits du JPL via Horizons. AUCUN noyau de constellation de navigation lunaire n'existe publiquement — Moonlight/LCNS, LCRNS et LNSS ne volent pas et NAIF ne publie rien pour eux — et aucun n'a été inventé. L'exigence DÉRIVÉE de σ_URE n'a AUCUNE référence externe indépendante (personne ne publie la précision de mesure de distance qu'un HPL lunaire de { "50" } m exige sur ce volume de service), de sorte qu'elle est vérifiée par rapport à sa propre identité algébrique et, indépendamment, en réexécutant tout le balayage à l'exigence calculée et en confirmant que la disponibilité y bascule. MESURÉ : la conception publiée à 8 satellites exige un σ_URE de { "2.9044" } m à { "100" } % de couverture contre { "0.3591" } m à { "37.85" } % pour la constellation illustrative — une révision d'un facteur { "8.09" } d'un nombre publié selon la règle R4 du programme. La conclusion qualitative subsiste (la classe LNIS de { "30" } m ne ferme toujours pas un HPL polaire sud de { "50" } m) mais le déficit était surestimé huit fois. La démo LANS à 5 satellites donne ZÉRO échantillon de niveau de protection — cinq satellites ne peuvent pas donner les six en vue qu'un ensemble d'hypothèses à défaut unique exige — et le champ d'exigence est ABSENT plutôt que fabriqué ; de même pour les quatre vaisseaux réels à { "0" } % de couverture. InternalConsistency est la variété honnête : les données d'ENTRÉE sont externes et hachées, mais la grandeur dont cette ligne traite n'est validée que par rapport à elle-même. { "0.30" } comparaison externe, un constat (reste MODELLED) : par rapport aux statistiques de l'étude de cas LNCSS de navi.613 sur { "346" } points de grille, { "4" } statistiques de disponibilité sur { "12" } tombent hors des { "2" } points de pourcentage préenregistrés (cas A : -4.0, +{ "22.5" } et -3.6 pp ; cas B : -12.1 pp). Causes probables : éléments lus dans le mauvais référentiel, képlérien à deux corps sur { "15" } jours contre le modèle de forces non indiqué de l'article, et une grille non reproductible à partir du texte. La moitié PDOP n'était pas évaluable (LANS n'imprime aucune statistique numérique) ; le test de comparaison est commité ignoré. { "0.30" } tour { "2" }, un constat (reste MODELLED) : par rapport à une référence Orekit { "12.2" } / Hipparchus { "3.1" } calculant tout le rapport (propagation Orekit, visibilité et DOP de DOPComputer, niveaux de protection MHSS composés avec Hipparchus, l'exigence résolue par échantillon ; préenregistré d3ce97b2) sur les cinq géométries récupérées et deux grilles, { "155" } valeurs sur { "160" } concordent dans les seuils préenregistrés ({ "2" } pp, { "5" } %, { "1" } %), y compris l'exigence sigma_URE pour LNCSS A et C ({ "3.879072208" } m des deux côtés pour le cas A) et l'exigence absente pour LANS et les orbiteurs. LNCSS B sur la grille dense échoue sur ses statistiques du pire échantillon (sigma_required { "0.000923" } contre { "0.001511" } m, hpl_max { "1.63e6" } contre { "0.99e6" } m) où des géométries quasi singulières (PDOP d'environ { "1e6" }) amplifient la concordance de position à l'échelle du mètre ; son exigence p95 concorde ({ "1.6343" } contre { "1.6357" } m). L'exigence du pire échantillon est mal posée sur une géométrie dégénérée. Par rapport à navi.613 : { "4" } sur { "12" } restent hors de { "2" } pp (figé)

# text
seg-b6b73589032f = lunar_ephemeris, lunar_service

# text
# c1: ephemeris_path
seg-4cab37e82f00 = lunar_ephemeris::tests (analyse du format et du référentiel ; interpolation de Lagrange exacte aux nœuds et sur une trace linéaire hors nœud ; les éléments ICRF suivent la réduction IAU { "2015" } et sont égaux à l'octet à une application explicite d'icrf_to_iau_moon ; aller-retour anomalie vraie↔moyenne par rapport à une résolution de Kepler directe ; fichiers mal formés refusés avec la raison nommée). lunar_service::tests (avec <c1/> non défini, l'ensemble de clés du rapport et son SHA-256 sont figés ; la ligne képlérienne est égale au passage képlérien autonome champ par champ ; l'identité σ_required · HPL_max / σ_URE = AL, puis un nouveau passage DE BOUT EN BOUT à l'exigence calculée atteignant { "100" } % de disponibilité du niveau de protection et un nouveau passage à { "1" } % au-dessus ne l'atteignant pas ; chaque champ numérique émis des deux nouveaux blocs parcouru depuis le JSON produit pour une unité et une classe de provenance ; les jeux d'essai commités rapprochés de leurs tableaux sources satellite par satellite ; un horizon au-delà de la fin d'un tableau refusé) ; tests/lunar_service_requirement_orekit_oracle.rs::lncss_b_dense_finding_is_unchanged ; tests/lunar_service_volume_orekit_oracle.rs::service_volume_matches_orekit_on_identical_ephemeris_and_grid

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
seg-1e414b2a33b2 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Le document émis lui-même : chaque feuille numérique doit se résoudre en une entrée du propre bloc d'unités de ce document. Il n'existe aucun registre d'unités externe par rapport auquel vérifier une unité DÉCLARÉE, de sorte qu'une unité déclarée est une assertion relue et non vérifiée — la barrière vérifie l'EXHAUSTIVITÉ et la BONNE FORMATION, non la vérité, et validé serait inexact parce que rien d'externe ne confirme que <c1/> est la bonne unité pour un champ nommé <c2/>. Un recoupement indépendant par suffixe de nom a été exécuté sur les { "1,434" } champs décrits À CE MOMENT-LÀ : sur les { "691" } portant un suffixe indicatif d'unité, { "40" } sont en désaccord avec l'unité déclarée et les { "40" } sont tous expliqués (suffixes par seconde, minima, secondes d'ouverture, newtons-mètres face à un suffixe d'apparence nanométrique), de sorte qu'aucune unité erronée n'a émergé. Ce recoupement n'a pas été réexécuté depuis, et la couverture a dépassé son périmètre — le chiffre est laissé à ce qui a effectivement été mesuré plutôt que reformulé au total actuel. Au moment de ce changement ({ "0.27.0" }), la couverture est passée de { "7" } types de scénario sur { "56" } à { "60" } sur { "61" }, et de { "389" } champs sur { "1354" } à { "1,742" } sur { "1,744" } (docs/field-units-schema.json, qu'un contrôle d'obsolescence tient à jour). AUCUN type de scénario ne reste non couvert (plafond { "0" }, FUT-28, { "0.36" }) : le dernier était <c3/>, dont deux colonnes sont indexées par l'appelant de sorte que leurs unités sont des données ; elles sont désormais décrites comme <c4/> et l'unité de chaque position est lue dans le propre tableau d'unités du paquet BALAYÉ dans <c5/> et <c6/> (ou prise de l'<c7/> déclarée de l'axe, qui doit concorder avec celle du paquet quand les deux existent ; null quand aucune n'existe, énoncé plutôt que deviné). <c8/> était l'avant-dernier, et est sorti de la liste quand son document publié a gagné un bloc d'unités : l'épingle d'additivité qui avait nommé <c9/> comme clé interdite PROUVE désormais que l'ajout est additif — retirez de nouveau le bloc et le document se hache toujours aux deux constantes figées avant qu'il n'existe, de sorte qu'une valeur publiée qui aurait bougé sous l'ajout échoue encore. Le travail a aussi fait apparaître douze défauts d'unités ou de documentation dans le code existant, rapportés plutôt que corrigés selon R1

# text
seg-34bff3218a01 = tests/field_units_global.rs (les { "61" } types de scénario enregistrés s'exécutent tous, une forme de document chacun : chaque feuille numérique doit se résoudre en une entrée du propre bloc d'unités de ce document ; une entrée mal formée compte comme manquante pour CHAQUE type de scénario, exempté ou non, de sorte qu'un substitut n'achète aucune couverture ; la liste d'exemption ne peut pas dépasser son plafond figé, un type de scénario listé qui se révèle entièrement couvert FAIT ÉCHOUER la barrière afin que la liste ne puisse pas être gonflée, et un type de scénario enregistré absent du tableau du lanceur échoue afin qu'un nouveau paquet ne puisse pas se glisser sans examen — ce qui s'est produit, attrapant les deux types ajoutés après le début de ce travail ; un cliquet à sens unique sur l'arriéré décrit-mais-non-défini ; et un contrôle d'obsolescence sur le document de schéma commité) ; field_schema::tests

# text
seg-926c069f8a2e = lunar_llr (sur lunar_frame_campaign::beacon_information, schedule_for et solve_datum_information, lunar_vlbi_fim)

# text
seg-9c29f0e9a061 = tests/lunar_station_geodesy.rs (empty_or_absent_extra_lists_are_bit_identical : des listes vides et l'exemple de référence de base donnent le rapport et le résumé par défaut octet par octet ; an_added_site_never_increases_any_variance : la plus petite valeur propre de H_after - H_before est non négative à { "1e-9" } de la plus grande, chaque rapport de sigma après/avant est au plus un, et les deux sites ajoutés sont observés ; the_rest_of_the_report_is_the_five_array_result ; every_station_geodesy_field_has_a_unit ; a_beacon_list_inside_the_campaign_block_is_refused) ; scenarios/lunar-station-geodesy-baseline.toml et scenarios/lunar-station-geodesy-with-station.toml (même calendrier archivé et même bloc de campagne VLBI)

# text
seg-cc6113ce33c0 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Forme close : chaque garde est exécutée sur un extrait fixe connu comme défectueux qui doit se déclencher et un extrait fixe connu comme correct qui doit rester silencieux, les deux étant des constantes littérales que le détecteur ne peut pas influencer. Les deux extraits défectueux sont les défauts F22 et F25 dans leur forme d'origine. C'est une référence INTERNE et la ligne est MODELLED en conséquence : elle prouve que les gardes distinguent le défaut de son correctif, non que les classes qu'elles décrivent soient exhaustives. Leurs angles morts énoncés — un état partagé qui n'est pas un chemin, une épingle tenue dans une courte constante nommée, une rare course critique que trois passages n'échantillonnent pas, et un reçu que quiconque peut écrire le fichier peut falsifier — sont consignés dans la documentation du module de tests/source_guards.rs et dans l'en-tête de chaque script plutôt que laissés à découvrir.

# text
seg-c56512172ce5 = scripts/gate.sh, scripts/check-gate-receipt.sh, scripts/check-repeatability.sh, scripts/install-gate-hook.sh

# text
seg-94641c011229 = tests/source_guards.rs ({ "9" } tests : les deux gardes sur tout l'arbre source, plus des jeux de mutation qui notent chaque garde dans les deux sens — le motif F22 signalé sur les deux chemins en collision, le correctif de séquence atomique livré accepté, un demi-correctif signalé sur exactement le chemin qui a perdu son composant unique, un descripteur de fichier temporaire et un répertoire unique hérité acceptés, une horloge murale rejetée ; une épingle non déclarée signalée, une déclarée acceptée, une portée sans exclusion rejetée, une déclaration dans le commentaire de documentation du test englobant acceptée et montrée comme ne débordant pas sur le test suivant ; et chaque graphie d'épingle — hexadécimal, décimal, chaîne de condensat, longueur en octets, nombre d'octets nommé, fichier de référence d'or — vue alors que les constantes d'algorithme, les graines de générateur aléatoire et les petits contrôles de cardinalité ne le sont pas)

# text
seg-b99e60173863 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Tests de propriétés (monotonie, absence de chute au transfert) + contrôle des exposants par rapport à holdover::coast_phase_variance

# text
seg-416def055790 = integrity::composed_pl::tests (monotone, plancher P0, K(IR/2), exposants, semi-continuité inférieure)

# text
seg-5b20d21462cb = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Identité de l'enveloppe presque sûre en forme close √(2Dt·lnln t) + contrôle de dominance du HPL ; couture d'impossibilité de Baweja arXiv:{ "2606.24210" }

# text
seg-3d4a4ed81148 = integrity::lil_envelope::tests (divergence, seuil, dominance du resserrement IR)

# text
seg-b286777831de = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Reproduction indépendante par numpy + statistics de la bibliothèque standard de la forme close de la surborne (InternalConsistency). La série BIPM Circulaire T [UTC-UTC(USNO)] est une entrée CITÉE seulement — c'est la MÊME série déjà validée pour la ligne de couverture de holdover R4 et elle n'est PAS revalidée ici ; reproduire ses valeurs ne prouve rien sur R2. La queue profonde de l'intégrité est modélisée. { "0.30" } comparaison externe, un constat (reste MODELLED) : sur les fichiers UTC-UTC(k) par laboratoire du BIPM ({ "102" } laboratoires, { "105 024" } lignes avec incertitudes publiées) la surborne b = { "2.576" } u à la queue de { "1e-2" } est dépassée par { "50.8" } % des lignes (Clopper-Pearson { "95" } % : { "50.4" } à { "51.1" } %) et par plus de { "1" } % dans { "101" } laboratoires sur { "102" }. L'incertitude publiée u est l'incertitude de la détermination par le BIPM de UTC-UTC(k), non une borne sur le décalage, qui atteint couramment plusieurs fois u ; la surborne telle que spécifiée ne borne pas le biais de traçabilité réel de UTC(k). { "0.30" } tour { "2" }, une surborne des décalages UTC-UTC(k) réalisés entraînée sur 2015-2022 et testée sur les données de la Circulaire T du BIPM 2023-2026 (préenregistré ca0921a4, dépassement groupé d'au plus { "1e-2" }), un constat (reste MODELLED) : le dépassement groupé est de { "0.0333" } ({ "694" } lignes sur { "20 826" } sur { "82" } laboratoires ; { "0.0127" } sans les { "430" } lignes qui n'ont pas de borne par règle). D9 tour { "3" }, une borne de vieillissement hiérarchique groupée (utck_bound), préenregistrée fb475550 et notée prospectivement sur les émissions de la Circulaire T à partir de { "465" } : pas encore exécutée (l'émission { "465" } a été publiée le 2026-10-12 avec environ { "285" } valeurs de test ; la règle préenregistrée de 1000 valeurs exige des émissions jusqu'à environ { "468" }, et le passage exige les fichiers par laboratoire archivés du 2026-09-30, puisque le BIPM a depuis réécrit { "87" } des { "113" })

# text
seg-0a2804cefee1 = integrity::hetero_budget::tests + tests/hetero_budget_reference.rs ; tests/hetero_budget_utc_k_oracle.rs::overbound_exceedance_on_real_utc_k_finding (conditionné aux données : ignoré avec un message quand la série BIPM est absente) ; tests/hetero_budget_utc_k_realised_overbound_oracle.rs::realised_offset_overbound_finding ; tests/utck_bound_prospective_oracle.rs (D9 tour { "3" }, prospectif, pas encore exécuté : la Circulaire T { "465" } est parue le 2026-10-12, et la règle préenregistrée de 1000 valeurs exige des émissions jusqu'à environ { "468" })

# text
seg-98b92da9ce83 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Reproduction indépendante par numpy de la covariance croisée et de l'inégalité de biais fusionné corrélé contre indépendant (InternalConsistency). Jeu de sources représentatif ; scénario modélisé.

# text
seg-477c4bbb36ab = integrity::hetero_budget::tests (correlated_fused_bias_dominates_independent_when_correlated, rho_one_single_realizer_recovers_linear_sum) + tests/hetero_budget_reference.rs

# text
seg-b14204d97c55 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Reproduction indépendante par numpy de la statistique + test de propriété qu'une injection de mode commun la gonfle (InternalConsistency). Scénario modélisé. { "0.30" } tour { "2" } (préenregistré f9aa360d), bloqué (reste MODELLED) : gesv de LAPACK dans numpy { "2.3.5" } reproduit la valeur de la statistique sur { "261" } cas commités (à { "3.5e-15" } près bien conditionné, { "1.2e-9" } jusqu'à un conditionnement de { "6.1e7" }) ; la loi nulle du khi-deux({ "1" }) est un théorème cité et les séparations deux à deux plates une identité sans sortie du moteur à comparer, de sorte que la délimitation attend une décision du propriétaire

# text
seg-75e4936b4c2d = integrity::gls_commonmode::tests (common_mode_shift_inflates_statistic_but_not_contrasts, post_fit_common_mode_statistic_is_zero) + tests/gls_reference.rs ; tests/gls_common_mode_statistic_numpy_oracle.rs::common_mode_statistic_matches_numpy_lapack

# text
seg-4d3104f6bc80 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Structure géométrique reproduite par le moteur plus l'identité de Schur 2x2 en forme close ; cohérent en STRUCTURE avec Sosnica et al. { "2025" } (arXiv:{ "2510.15484" }), dont les ordres de grandeur rapportés ne sont PAS reproduits ici. La classification est structurelle ; les ordres de grandeur de corrélation/CRLB sous géométrie réelle sont MODELLED (coordonnées et orientation des réflecteurs tenues fixes). { "0.30" } comparaison externe, un constat (reste MODELLED) : par rapport à Sosnica et al. { "2025" }, la corrélation origine-échelle de la Fisher de distance (-0.993 / -0.988) est à { "0.05" } près du -0.97 publié, mais sur la propre géométrie à cinq réflecteurs de l'article la corrélation de Helmert à 7 paramètres à poids égaux est de -0.78 (la valeur publiée repose sur des erreurs par réflecteur que l'article n'imprime pas), et la CRLB de l'origine ({ "0.6" } à { "1.2" } mm pour un bruit de distance de { "3" } mm) est inférieure de { "96" } à { "98" } % au { "3.07" } cm de l'article, contre une tolérance de { "20" } %. Ordres de grandeur non reproduits

# text
seg-7bbbfeb6e7b9 = lunar_identifiability, lunar_datum

# text
seg-6ac21ece8e3d = tests/lunar_datum_identifiability_reference.rs (single_internal_range_row_has_six_dim_datum_null_space ; extending_the_librating_arc_lifts_the_origin_scale_degeneracy) ; tests/lunar_datum_sosnica_oracle.rs::origin_scale_correlation_and_crlb_disagree_with_the_published_geometry

# text
seg-21d912943641 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Recoupements analytique par rapport aux différences finies des dérivées partielles de chaque technique (interne) ; la DIRECTION de l'amélioration est un fait géométrique. Les emplacements des balises, les calendriers et le bruit sont MODELLED/représentatifs (voir tests/fixtures/llr_geometry/NOTICE.md).

# text
seg-36da2dd8d3db = lunar_datum, lunar_identifiability

# text
seg-12c2f3ad1982 = lunar_datum::tests (dérivées partielles analytiques LLR/VLBI/orbiteur par rapport aux différences finies) ; lunar_identifiability::tests (adding_an_offradial_technique_collapses_the_origin_scale_degeneracy ; transversal contre radial via crlb_diag)

# text
seg-b5169f1f17d9 = une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée — Le calcul est vérifié en interne : chaque dérivée partielle analytique par rapport à une différence finie, et le cas de datum nul par rapport à la distance nominale. Le CATALOGUE est vérifié en externe et indépendamment - les coordonnées en axes principaux DE440 (Park et al. { "2021" }, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) sont recoupées avec le Tableau { "6" } du mémorandum des coordonnées de surface DE430 (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, extrait automatiquement d'un PDF vérifié par SHA-256 par tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) et concordent à { "1.12" } m près, alors que la réalisation en Terre moyenne des mêmes cinq réseaux diffère de { "672" } à { "871" } m. La STRUCTURE DE DÉGÉNÉRESCENCE est vérifiée par rapport à un résultat publié : Sosnica et al. { "2025" }, « Definition and Realization of the International Lunar Reference Frame », arXiv:{ "2510.15484" }, qui rapporte pour le référentiel lunaire en axes principaux un coefficient de corrélation entre le X du sélénocentre et l'échelle de r = -0.97, et que le LLR n'atteint pas le centre de masse réel de la Lune avec une précision meilleure que { "12" } cm à cause de cette corrélation. Ce module retrouve la même structure (|corr(t_x, scale)| entre { "0.9" } et { "0.9999" }, défaut de datum <= { "1" }) à partir d'une conception de Fisher à LLR seul. La corroboration se fait entre éphémérides, non par un aller-retour : l'article combine INPOP21a, DE430 et EPM2021, alors que ce module est piloté par la libration DE440. Ce qui n'est PAS reproduit est l'ordre de grandeur - la corrélation ici est d'environ -0.988 contre leur -0.97, et la CRLB à 4 paramètres est sub-millimétrique contre leur plancher atteint de { "12" } cm, parce que l'orientation et les coordonnées des réflecteurs sont tenues fixes ici et résolues là-bas. Structure de géométrie et de dégénérescence seulement ; aucune affirmation de précision sur un datum résolu. { "0.30" } comparaison externe : les parties à distance mesurée de ce module (reflectors(), stations_itrf(), le placement PA DE440 et le temps de lumière barycentrique llr_bcrs_one_way_m) sont validées dans leur propre ligne, modèle de distance mesurée LLR, par rapport à { "192" } points normaux de l'ILRS (RMS { "2.81" } m contre { "10" } m). Cette ligne reste MODELLED parce que la comparaison mesurée n'exerce pas le reste de son affirmation. Le catalogue de stations géodésiques stations() arrondit APOLLO à { "0.001" } deg ; avec un temps de lumière géocentrique il donne { "22.7" } m sur les mêmes points (test reflector_ranges_against_ilrs_normal_points ; { "96" } m avec l'interpolation d'orientation élément par élément antérieure). Les dérivées partielles analytiques de distance et la Fisher à LLR seul sont calculées par llr_range_m et reflector_inertial avec la série analytique de la Lune (ephem::moon_position, à environ { "0.3" } deg du GCRS) et sans temps de lumière

# text
seg-13c488ae75a6 = lunar_llr_geometry::tests (reflector_and_station_catalogs_are_well_formed, analytic_partials_match_finite_difference, llr_one_way_range_is_earth_moon_scale, zero_datum_reproduces_nominal_range, llr_only_fisher_shows_strong_com_x_scale_degeneracy) ; tests/lunar_pa_frame_realisation_guard.rs ; tests/llr_datum_degeneracy_reference.rs ; tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_against_ilrs_normal_points

# text
seg-9cfe6fa8ac17 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Fisher marginale par complément de Schur de la matrice d'information couplée, en algèbre linéaire en forme close, vérifiée par rapport aux deux régimes limites qu'elle prédit. L'équivalence de { "1" } m à { "3.336" } ns est la définition du mètre par c et n'est pas un résultat empirique. Les réseaux d'observation sont une géométrie représentative modélisée, de sorte que la loi de conception est une déclaration sur la géométrie qui lui est présentée et ne porte aucune affirmation sur un réseau lunaire déployé.

# text
seg-f741d9570b10 = lunar_gauge::tests (coupled_marginal_well_posed_network_is_psd, coupled_marginal_twoway_equals_more_oneway_in_diverse_network, coupled_marginal_twoway_lift_three_orders, oneway_range_row_has_correct_temporal_entries, twoway_range_row_has_zero_at_offset_and_rate, time_tie_row_equals_pure_offset_vector, rate_tie_row_has_correct_structure)

# text
seg-687f7edfb345 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — L'additivité de l'information de Fisher sur des mesures indépendantes est une propriété en forme close, vérifiée ici par rapport à une somme élément par élément écrite indépendamment et par rapport à l'invariance d'ordre et à la monotonie qui en découlent. REMARQUE SUR LES PREUVES : le combinateur n'avait auparavant aucun test, et l'unique test du module sommait les deux matrices d'information en ligne au lieu de l'appeler, de sorte qu'un combinateur cassé aurait laissé le module au vert ; le test passe désormais par combine et échoue quand il est muté. Tous les emplacements de balises, la géométrie d'orbiteur, les précisions par technique et les coûts relatifs sont des choix représentatifs plutôt que des valeurs de mission (voir tests/fixtures/llr_geometry/NOTICE.md), de sorte que chaque métrique de dégénérescence et chaque chiffre de CRLB atteint par ce menu hérite du statut modélisé de lunar_identifiability::decompose.

# text
seg-c4c5426a700b = lunar_techniques::tests (combine_is_additive_order_independent_and_empty_is_zero - une sélection vide donne la matrice nulle, une sélection unique est l'identité, une paire est égale à une somme élément par élément écrite indépendamment, et le résultat est invariant à l'ordre de sélection ; adding_a_block_never_reduces_the_degeneracy_metric - monotonie sous information ajoutée ; radial_diversity_beats_transverse_for_breaking_the_degeneracy - le bloc d'orbiteur de la face cachée élève davantage la métrique de dégénérescence que le bloc VLBI transversal)

# text
seg-66020d555be6 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Borne triangulaire du pire cas sur l'action de la jacobienne ponctuelle de Helmert (forme close)

# text
seg-c5ebc071ce3e = lunar_interop_budget::tests (monotonie avec le budget ; réduction du budget RSS sous une CRLB par fournisseur ; tolérance de rotation calculée au bras de levier lunaire ; terme limitant = rotation)

# text
seg-da0791f2edc4 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Agrégation RMS des répartitions par paire validées sous chaque convention (forme close)

# text
seg-f4fbaefa3a11 = lunar_interop_budget::tests (CommonEphemeris annule le budget ; CommonFrameTie < PerProvider ; irreducible_fraction > { "0.5" } sur les répartitions réelles ; ordre des conventions)

# text
seg-303947e00325 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Instanciation géométrique de la borne de spark par blocs / d'estimation d'état sûre (Fawzi–Tabuada–Diggavi { "2014" } ; Shoukry–Tabuada { "2016" } ; spark par blocs de Donoho–Elad { "2003" } ; Candès–Tao { "2005" }) — PAS le seuil de consensus 3f+{ "1" } de Lamport–Shostak–Pease (« byzantin » désigne uniquement le modèle de faute arbitraire/collusive). Le nombre précis de fautes tolérées est une propriété modélisée de la géométrie représentative du réseau, vérifiée quant à sa cohérence interne par des cas analytiques construits à la main et par les formules de dénombrement

# text
seg-0b39643e9152 = lunar_faultobs::tests — byzantine_c3_rank_deficient_but_nonzero_is_undetectable (bloc non nul mais de rang déficient ⇒ block_spark { "1" }, f_detect { "0" } ; colonnes indépendantes ⇒ block_spark { "2" }, f_detect { "1" }), byzantine_real_network_uniform_bias_is_clock_offset (un pair possédant toutes les mesures d'un nœud = une erreur de décalage d'horloge ∈ range(G), indétectable, avec un net écart spectral de Gram), byzantine_redundant_net_identifies_at_least_one (six pairs indépendants à mesure unique ⇒ block_spark { "7" }, f_identify { "3" }), byzantine_analytic_spark_identity_projector + byzantine_detect_identify_relations (les cas manuels P⊥ = I fixent f_detect = block_spark − { "1" }, f_identify = ⌊(block_spark − { "1" })/2⌋)

# text
seg-c4b1731814f5 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Argument des paramètres libres en temps d'ensemble (Percival { "1978" } ; Lewandowski & Thomas { "1991" }) instancié sur le réseau représentatif par nœud fondé sur DE440 réel : un test de nullité du résidu relatif du générateur analytique de taux commun par rapport à GᵀWG, le contraste départagé distinguant la véritable jauge d'un artefact du modèle d'oscillateur. Géométrie représentative modélisée, et non un budget de synchronisation temporelle certifié

# text
seg-70a340255eb6 = lunar_faultobs::tests — holdover_floor_self_ref_and_anchored (réseau auto-référencé : le taux commun se trouve dans N(GᵀWG), temporal_gauge_dim { "2" } ; après une ligne d'attache de taux externe : le taux est expulsé de la jauge, temporal_gauge_dim { "1" } et le décalage commun subsiste)

# text
seg-1b1f761bd9a9 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Algèbre en forme close du projecteur de parité et de la pseudo-inverse sur le réseau représentatif par nœud fondé sur DE440 réel : la séparation commun/différentiel, l'unification N(G) ⊕ range(G) et la pente de l'écart de protection de Brown ({ "1992" }) découlent toutes de l'annihilation de l'image P⊥·G = { "0" }. Géométrie représentative modélisée, et non un niveau de protection certifié

# text
seg-11fe79ac46b3 = lunar_faultobs::tests — provider_mismatch_split_common_undetectable_differential_detectable (biais commun indétectable, différentiel détectable), slope_infinity_in_range_finite_detectable (g7 : pente ∞ pour b ∈ range(G), finie pour b ∉ range(G)), pernode_rank_is_state_dim_minus_eight (§{ "0" } : rang(GᵀWG) = state_dim − { "8" }, la jauge de dimension 8 constitue tout l'espace nul, avec un écart spectral >{ "1e6" })

# text
seg-1ac1dc1c053d = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Transcription des Recommandations citées (téléchargeables librement sur itu.int), chaque limite portant son tableau ou son article, listée avec chaque élément non confirmé ou non implémenté dans docs/TELECOM-TIMING.md ; les identités de continuité aux points de rupture que les tableaux impliquent sont vérifiées dans les tests. Une transcription de normes avec des vérifications de cohérence interne, et non un test de respect de la norme ni une validation externe. { "0.30" } tour { "2" } (préenregistré 970003ee), bloqué (reste MODELLED) : les dix valeurs de masque et les treize valeurs de holdover ePRTC-A que les Recommandations impriment comme exemples chiffrés (G.8272 fig. 1-2, G.8272.1 Amd.1 art. { "8.2.1" } et fig. V.1-V.3, G.8271.1 Amd.3 fig. 7-2 à 7-4) sont reproduites à moins d'une demi-unité imprimée près, la plupart étant des constantes de tableau ou des points de rupture ; la fig. 7-2 de G.8271.1 indique { "200" } ns à { "1.3" } s, contre son propre tableau 7-1 ({ "197.5" } ns). Les limites de classe A-D de G.8273.2 n'ont aucune valeur chiffrée imprimée, et les étiquettes de points de rupture ePRTC verrouillé de G.8272.1 (sur des lignes de construction pleines) ont été exclues par la règle de sélection préenregistrée ; elles restent donc des transcriptions

# text
seg-95c049581604 = telecom_timing (MASKS, eprtc_a_holdover_limit_ns, check_curve, check_mask)

# text
seg-35e253f27caa = telecom_timing::tests (mask_boundaries_follow_the_tables_exactly — extrémités ouvertes et fermées, l'intervalle τ = { "400" } s du tableau 7-3 de G.8271.1, continuité à chaque point de rupture que les tableaux impliquent ; a_curve_exactly_on_the_limit_passes_and_just_above_fails ; eprtc_a_holdover_envelope_follows_table_3 ; a_coarse_record_is_not_evaluated_against_a_filtered_mask) ; tests/telecom_timing_reference.rs (telecom_timing_kind_round_trips_through_the_dispatch) ; tests/telecom_masks_itu_printed_values.rs (mask_values_match_the_numbers_the_recommendations_print ; figure_7_2_label_at_1_3_s_is_not_its_own_table_value)

# text
seg-7af5107287ea = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Transcription des Recommandations citées (téléchargées sur itu.int le 2026-10-13), chaque ligne relue par rapport au texte, la continuité aux points de rupture qu'impliquent les coefficients imprimés étant bornée dans les tests (par exemple { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns contre le plateau de { "100" } ns du tableau { "4" } de G.812). Une transcription de normes avec des vérifications de cohérence interne, et non un test de respect de la norme ni une validation externe. G.812 (06/2004) est indiquée comme remplacée par une édition pré-publiée 08/2026 et G.811 a un Amd. { "1" } (04/2016) ; aucune des deux n'a pu être lue, donc aucune n'est vérifiée. Le scénario d'OCXO en marche libre surestime la contribution de l'oscillateur aux intervalles d'observation longs par rapport à la constante de temps d'une boucle ; il ne dit rien d'une horloge d'équipement quelconque

# text
seg-f8b7bc046be6 = telecom_timing (MASKS, Segment::tau_exponent, MeasurementFilter::LowPass10HzAtSource, MaskCondition::Autonomous)

# text
seg-3ae5550f6aaa = telecom_timing::tests (g811_prc_masks_follow_clause_6_1; g812_masks_follow_tables_3_4_6_and_7; g8262_masks_follow_tables_1_3_4_and_5; g8262_1_eeec_masks_follow_tables_1_and_3; a_linear_piece_is_evaluated_without_powf; wander_masks_pass_a_quiet_white_fm_flicker_series; wander_masks_fail_the_same_series_scaled_up)

# text
seg-53210f1b0709 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Préenregistré dans tests/fixtures/clock_log/PREREGISTRATION.md (versionné seul, 159334f2, avant l'existence du jeu de test) ; consigné dans RESULTS.md. Trois journaux synthétiques générés avec une graine, un par format (un trou de trois époques pour TICC, une seconde horloge RINEX à ignorer), relus par un lecteur indépendant écrit à partir de docs/CLOCK-LOG-FORMATS.md par le même auteur : grille, trous et nombres de remplissages égaux et plus grande différence de phase { "0" } s (seuil { "1e-13" } s). L'oadev, le tdev et le mtie d'allantools { "2024.6" } sur cette phase concordent à { "2.5e-14" } relatif près (seuil { "1e-10" }) pour chaque facteur de moyennage qu'il évalue ; il n'évalue pas le MTIE sur l'ensemble de l'enregistrement, que le moteur rapporte, de sorte que ce point par journal n'a pas de valeur de référence indépendante et que le seuil tel que formulé n'est pas atteint à cet endroit. MODELLED : journaux synthétiques, et la référence du lecteur partage son auteur ; de vrais fichiers d'horloge TimeLab, TICC et RINEX issus d'instruments n'ont pas été comparés

# text
seg-82af02048968 = clock_log (read_input, MeasuredPhaseReport, MEASURED_UNITS, TELECOM_LOG_UNITS) ; telecom_timing (SeriesInput::clock_log) ; api (type clock [clock_log])

# text
seg-df411365b9ab = clock_log::tests (journaux écrits à la main par format : en-têtes, séparateurs, unités, intégration de fréquence, canaux et modes TICC, trous et politiques, refus) ; tests/clock_log_allantools.rs (la comparaison préenregistrée : b1_each_log_reads_to_the_reference_phase ; b2_adev_tdev_and_mtie_agree_with_allantools ; b3_a_telecom_series_read_from_a_log_equals_the_same_samples ; b3_the_clock_kind_measured_block_is_opt_in)

# text
seg-1517b58a40f3 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Jeux de test écrits pour Kshana à partir des structures de lignes publiques des démons, avec des valeurs inventées (NOTICE.md dans le dossier du jeu de test) ; aucun journal d'une installation réelle n'a été lu et aucune référence indépendante ne compare l'analyse à un autre lecteur, de sorte qu'une structure qui diffère selon les versions du démon peut encore être refusée ou mal lue. Les estimateurs alimentés par la série de phase sont ceux validés par rapport à allantools dans les lignes ci-dessus

# text
seg-0a789b9f3db1 = clock_log (parse_linuxptp, parse_chrony, grid_timed_offsets)

# text
seg-b1a8738d620b = clock_log::tests (ptp4l_reads_the_locked_offsets_in_ns; linuxptp_reads_only_the_named_program; ts2phc_gap_is_refused_or_filled; linuxptp_reads_syslog_prefixed_lines_and_picks_an_interface; linuxptp_refuses_a_servo_that_never_locks_and_backwards_stamps; chrony_tracking_reads_the_local_offset_in_seconds; chrony_statistics_needs_a_source_when_there_are_two; chrony_columns_of_the_other_log_are_not_read; clock_selector_is_refused_for_timelab_and_ticc_only) sur les jeux de test de tests/fixtures/clock_log/linuxptp_chrony/

# text
seg-d0e0353e588f = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Calcul manuel sur des enregistrements construits à partir de formules dont la pente, l'échelon, l'extremum et le temps de rétablissement sont connus avant l'exécution (les tests les énoncent), ainsi que les masques, l'enveloppe et les budgets des lignes de synchronisation télécom ci-dessus. Aucune mesure de laboratoire d'un véritable holdover n'a été évaluée et aucune référence indépendante n'a été comparée ; le type de scénario ne revendique donc rien sur une horloge ou un système quelconque ; un partenaire de laboratoire de synchronisation temporelle est nécessaire avant qu'un chiffre par classe d'horloge puisse être promu

# text
seg-5fb2f4812479 = holdover_test (HoldoverTestScenario, recovery, linear_fit) ; telecom_timing (check_mask, check_envelope, budget_results)

# text
seg-d028f2b41fe8 = holdover_test::tests (the_record_is_split_at_the_stated_times; holdover_figures_match_a_hand_computation; recovery_is_timed_from_the_restoration; masks_are_measured_on_the_step_their_condition_names; a_record_with_no_baseline_says_so; bad_inputs_are_refused_with_the_reason; the_report_carries_the_label_the_units_and_no_conformance_word; a_ptp4l_log_is_scored_end_to_end)

# text
seg-ab6aea7075d0 = une sous-affirmation est vérifiée de façon externe, mais la capacité dans son ensemble compose des éléments modélisés, de sorte que la capacité reste modélisée — Le livret ICG Space Service Volume (UN OOSA ST/SPACE/75, { "2018" }), lui-même une simulation, comparé dans le cadre d'un préenregistrement versionné avant l'exécution (xval/gnss-ssv/PREREGISTRATION.md ; résultats dans xval/gnss-ssv/RESULTS.md, figés par tests/ssv_booklet_results.rs, échecs compris). Exécution { "1" } sur la lecture préenregistrée : les constantes de puissance rayonnée minimale et le seuil lunaire concordent (S0, S6 atteints) ; les seuils SSV supérieur et inférieur, de seuil RF, GEO et HEO sont NOT MET, presque tous à cause de GLONASS, pour lequel le livret donne { "20" } et { "28" } degrés dans les tableaux B2 et B6 et { "26" } et { "34" } degrés dans le tableau { "4.2" }. Une variante de diagnostic avec les angles du tableau { "4.2" } concorde dans chaque cellule du SSV supérieur, du SSV inférieur et des six missions GEO (elle ne remplace pas l'exécution { "1" } ; les cellules RF, HEO et lunaires échouent encore). Les diagrammes mesurés du panneau GPS L1 ne sont pas reproduits par le substitut paramétrique (RMS { "6" } à { "9" } dB contre un seuil de { "3" } dB). La concordance montre que la méthode énoncée par le livret est reproduite, et non que les signaux GNSS se comportent ainsi

# text
seg-ea770cfea799 = ssv (constellations, geom, sweep, pattern, check)

# text
seg-9a49009f27cd = ssv::geom::tests (the_grid_has_the_booklets_2562_points_on_the_unit_sphere; the_interval_form_equals_the_general_predicate; a_user_behind_the_earth_is_blocked_and_one_beside_the_limb_is_not) ; ssv::sweep::tests (a_small_shell_run_is_internally_consistent; pdop_of_a_regular_tetrahedron_like_set_is_finite_and_a_flat_set_is_not) ; ssv::pattern::tests (table_b10_antenna_reads_as_gain_against_angle_from_the_boresight)

# text
seg-1ba52ce8daa7 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Formes closes et grandeurs publiées dans les tests (le pic d'une couche de Chapman et la déviation du limbe de surface, quelques TECU de plasmasphère sur un rayon GPS-vers-GEO) ; la conception du récepteur réutilise les modèles d'acquisition et de boucle de poursuite et leurs tests. Aucune donnée mesurée de sondage au limbe ni de réception de signaux faibles n'y est comparée

# text
seg-05a12f571867 = ssv (limb, weak)

# text
seg-4b5cbdee9714 = ssv::limb::tests (the_chapman_layer_peaks_at_its_height_with_its_density; the_surface_limb_bends_about_one_and_a_third_degrees; plasmaspheric_tec_is_a_few_tecu_for_an_equatorial_gps_to_geo_ray) ; ssv::weak::tests (longer_integration_lowers_the_acquisition_threshold; aiding_narrows_the_search_and_the_loop; a_conventional_receiver_is_far_above_the_ssv_signal_levels) ; ssv::scenario::tests (the_limb_medium_adds_statistics_and_can_cost_signals; a_weak_signal_receiver_replaces_the_fixed_threshold)

# text
seg-3fc3d17949eb = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Vérité simulée par rapport à l'estimation propre du filtre (l'erreur d'estimation quadratique normalisée moyenne d'un filtre cohérent vaut environ { "3" } pour la position) et déterminisme pour une graine fixée. Aucune donnée GNSS en vol ou enregistrée en orbite haute n'est comparée ; le Soleil et la Lune sont des substituts circulaires de faible précision

# text
seg-89cac0893981 = ssv::nav (run_nav, Ekf)

# text
seg-18bbbb4578fc = ssv::nav::tests (the_filter_converges_where_signals_are_plentiful_and_is_deterministic; the_covariance_is_consistent_with_the_error; without_signals_the_filter_coasts_and_the_gap_is_reported) ; ssv::scenario::tests (navigation_and_formation_run_and_report)

# text
seg-49de2f2c1b32 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — La même vérité simulée que le filtre absolu : l'erreur du filtre relatif par rapport au véritable état relatif, et la vérification qu'il fait au moins aussi bien que la soustraction de deux positions absolues indépendantes. Aucune donnée de vol en formation n'est comparée

# text
seg-59bd0b502622 = ssv::formation (run_formation, RelEkf)

# text
seg-70f8b2a10f03 = ssv::formation::tests (differencing_beats_subtracting_absolute_estimates_and_is_deterministic) ; ssv::scenario::tests (navigation_and_formation_run_and_report; formation_needs_navigation_and_one_mode_only)

# text
seg-8abc8cdf5f0c = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Chaque forme close par rapport à une voie numérique indépendante dans les tests (quadrature dans le domaine fréquentiel de la fonction de transfert exacte et du filtre à retard, une simulation de Monte-Carlo sur les atomes pour le biais de front d'onde, une simulation de Monte-Carlo sur les tirs pour l'indice de frange) et ses cas limites. Une valeur publiée chiffrée : Cheinet et al. { "2008" } (arXiv:physics/0510197, sect. IV) indiquent qu'à tau_R = { "20" } us, un bruit de phase Raman blanc inférieur à -111 dB rad^2/Hz est nécessaire pour { "1" } mrad par tir ; le seul terme blanc donne { "0.99" } mrad (l'article déduit ce niveau avec son éq. { "17" }, scintillation plus blanc). Cohérence interne et une valeur chiffrée, et non une validation externe ; les aberrations d'ordre supérieur et le bruit d'un laser particulier ne sont pas modélisés

# text
seg-9f89545da2ca = inertial::cai_error_terms::tests (raman_transfer_short_pulse_limit_matches_the_acceleration_transfer_function; white_raman_phase_closed_form_matches_quadrature; short_pulse_band_limited_closed_form_matches_quadrature; cheinet_2008_white_phase_noise_requirement_is_reproduced; delay_term_closed_form_matches_exact_filter_quadrature; defocus_phase_is_position_independent_and_tilt_cancels; curvature_bias_monte_carlo_matches_closed_form; curvature_bias_limiting_cases; classical_aided_resolution_monte_carlo_matches_closed_form; multi_t_resolution_monte_carlo_matches_closed_form; ambiguity_limits_and_inverse)

# text
seg-81b9d7ec3df6 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Les quatre fiches techniques Microchip citées (numéros de document et URL dans chaque préréglage et dans docs/TELECOM-TIMING.md) pour les valeurs d'entrée ; la rampe de vieillissement en forme close et la propriété d'enveloppe de l'ajustement comme vérifications internes. La façon dont les valeurs deviennent un modèle de bruit — l'ajustement, la règle de plancher, le mois de 30 jours, la lecture linéaire de la température — est un choix de modélisation ; aucun préréglage n'est une mesure d'un exemplaire. { "0.30" } tour { "2" }, seuils unilatéraux par rapport à des exemplaires mesurés (préenregistré a01c491c), un constat (reste MODELLED) : la station IGS THU2 Symmetricom 8040C dans les horloges finales ESA MGEX présente un écart-type d'Allan de { "0.35" } à { "0.87" } de celui du préréglage rubidium, mais une erreur de holdover de { "1.07" } à { "1.60" } de la sienne ; l'enregistrement du 5071A se situe hors du préréglage césium jusqu'à { "1000" } s (bruit de phase blanc de mesure, 30x à { "1" } s) et en holdover ({ "1.15" } à { "8.74" }) ; le pire SA.45s de production { "2011" } vaut 1.26x le préréglage CSAC à { "1" } s ; l'OX-208 n'a aucun enregistrement mesuré (bloqué)

# text
seg-869454221ef4 = telecom_timing (PRESETS, fit_noise, with_flicker_floor, synthesize_holdover) ; models (ClockModel)

# text
seg-2fb7b4c2396c = telecom_timing::tests (every_preset_carries_a_named_datasheet_and_figures; the_noise_fit_envelopes_every_datasheet_point; pure_aging_matches_its_closed_form — la rampe de vieillissement discrète à { "0.1" } % près de (1/2)·D·t² sur un jour ; same_seed_same_series_and_hash_different_seed_different_series) ; tests/oscillator_presets_measured.rs (caesium_finding_pinned; rubidium_finding_pinned; csac_finding_pinned; ocxo_preset_has_no_measured_record)

# text
seg-30e6d79a47c2 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Formes closes pour chaque terme isolé et la recherche de racine indépendante holdover::holdover_seconds ; les valeurs des fiches techniques sont celles des documents cités (docs/SLOT-TIMING.md). Une valeur par défaut de classe repose sur un plancher de bruit rouge supposé et une source de fiche technique est une enveloppe de maxima, de sorte qu'aucune n'est une mesure d'un exemplaire

# text
seg-d31b872adcb6 = slot_timing (predicted_error_s, breach_after_sync_s, terms_at, slot_budget, ClockNoise::from_datasheet, SlotTimingScenario) ; clock_state (ClockClass::Tcxo, Ocxo, Rafs, source)

# text
seg-8eba4f60f78e = tests/slot_timing_igs_holdout.rs ({ "10" } horloges de satellites GPS Block IIF, { "14" } jours d'horloges finales IGS : { "8" } dans le seuil de { "1.5" }, G25 et G30 optimistes jusqu'à environ 2x, figés) ; tests/slot_timing_ocxo_holdout.rs (un OCXO mesuré : la prédiction sur jeu réservé n'est jamais optimiste, de { "0.59" } à { "0.70" } de la violation mesurée ; dans l'échantillon, de { "0.98" } à { "1.17" } ; sans le terme de fréquence de recalage, la prédiction dans l'échantillon est optimiste à chaque seuil) ; slot_timing::tests (fix_frequency_uncertainty_alone_is_linear_in_time; reduces_to_the_holdover_inversion — chaque classe par rapport à holdover::holdover_seconds à { "1e-9" } près ; white_fm_with_fix_error_has_its_closed_form; flicker_floor_alone_is_linear_in_time; ageing_alone_is_quadratic_in_time; frequency_offsets_add_in_magnitude; the_error_at_the_breach_is_the_guard; datasheet_fit_envelopes_every_point; datasheet_classes_match_their_presets_at_one_second; a_breach_beyond_the_datasheet_is_flagged_as_extrapolated; the_report_carries_the_result_and_a_unit_for_each_field)

# text
seg-4dedb9508666 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Réduction au niveau de protection de synchronisation temporelle existant et aux formes closes de visibilité pour orbite circulaire et Terre sphérique. Conditionnel à la détection, un seul leurre terrestre à une vitesse de rampe donnée, un passage au zénith sur une Terre non tournante ; non validé sur un récepteur leurré en orbite

# text
seg-a1318b5603cd = orbital_timing (orbital_timing, visibility_half_angle_rad, max_pass_s, crosslink_neighbour_is_outside_footprint)

# text
seg-4c4e4d92c416 = orbital_timing::tests (reduces_to_the_terrestrial_tpl — exactement tpl::timing_protection_level_ns lorsque l'horloge n'a aucun terme de scintillation, de phase blanche ou de marche aléatoire ; leo_geometry_matches_its_closed_forms; crosslink_independence_follows_the_footprint; an_independent_check_caps_the_ramp_before_the_pass_ends; a_crosslink_inside_the_footprint_does_not_count; a_ramp_below_the_reference_is_never_detected)

# text
# c1: jamming
# c2: jamming
seg-d097f485ef9e = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Réduction à l'équation anti-brouillage et au bilan de liaison du type de scénario <c1/> existant (le même code, appelé sur les mêmes entrées), et à la forme close du plancher de bruit k T0 F. Les spectres de signal sous-jacents sont ceux de la ligne validée ci-dessus ; les puissances de brouilleur, la chronologie et les largeurs de bande des étages d'entrée sont des entrées du scénario, les spectres sont continus (sans raies de code d'étalement), et aucun contrôle automatique de gain, aucun blanking ni aucun diagramme d'antenne n'agit sur le brouilleur. Aucun spectre brouillé mesuré ne figure dans le dépôt pour y vérifier le composite. La table Q du type de scénario <c2/> (CW et bande étroite { "1" }, large bande et balayé { "2" } depuis { "0.36" } : les valeurs de manuel, figées sur les formes closes de navsignal) concorde avec la valeur CW de ce modèle et diffère de ce qu'il déduit pour un bruit adapté au C/A ({ "1.5" }) et pour un bruit plat d'un zéro à l'autre sans normalisation dans la bande ({ "2.2" }) ; le rapport imprime les deux

# text
seg-06c475d7eb73 = spectrum (SpectrumScenario, SpectrumModel::bin_psd_w_per_hz, SpectrumModel::band_state, effective_cn0_multi_dbhz, system_temp_k, Jammer::power_fraction_in, Jammer::duty)

# text
seg-266d9c05d9be = spectrum::tests (agrees_with_the_jamming_kind_chain — J/S égal à jamming::j_over_s_db et C/N0 effectif égal à jamming::effective_cn0_dbhz avec Q = 1/(R_c kappa) à { "1e-9" } dB près, et l'ancrage de { "32.105" } dB du test propre au type de scénario de brouillage ; noise_floor_is_kt0f; chirp_window_splits_whole_and_partial_sweeps; duty_weights_partial_rows; demo_scenario_runs_and_denies_l1_while_l5_survives; defaults_run_with_no_jammer; bad_inputs_are_refused)

# text
seg-821d327efdbf = une sous-affirmation est vérifiée de façon externe, mais la capacité dans son ensemble compose des éléments modélisés, de sorte que la capacité reste modélisée — Mesuré par rapport à JPL Horizons DE441 (les mêmes jeux de test versionnés), mais non validé : les valeurs indiquées au tableau { "1" } pour Uranus et Neptune sont dépassées jusqu'à { "2.0" } et { "5.2" } fois par rapport aux positions héliocentriques DE441 (Neptune les respecte par rapport aux positions barycentriques, ce qui suggère que l'ajustement n'était pas héliocentrique), la page n'indique aucune erreur pour Pluton, et aucune borne publiée n'existe pour les vitesses. Les tableaux 2a/2b respectent leurs propres valeurs pour Uranus et Neptune et sont couverts par la ligne validée

# text
seg-1d43f89b7a30 = ephem (standish_state, StandishElements::state_at_mean_anomaly, Planet::Pluto) ; solar_system (position_label)

# text
seg-1af48aec2408 = tests/solar_system_horizons_reference.rs (standish_table1_uranus_and_neptune_exceed_the_nominal_error : figé à { "2.04" } et { "5.16" } fois l'erreur nominale de longitude, sous six fois ; pluto_from_the_1992_row_is_measured_not_validated : à moins de { "39" } arcsec et { "1.14e9" } m ; standish_velocities_track_horizons_to_one_percent : pire cas { "3.7e-3" } de la vitesse) ; ephem::tests (standish_velocity_is_the_derivative_of_the_position; pluto_has_no_table2_row_and_no_stated_error)

# text
seg-f17a412271b6 = une sous-affirmation est vérifiée de façon externe, mais la capacité dans son ensemble compose des éléments modélisés, de sorte que la capacité reste modélisée — Mesuré par rapport aux éphémérides de satellites JPL Horizons (DE441, MAR099, JUP365, SAT441) versionnées dans tests/fixtures/solar_system/horizons_satellites_icrf.csv avec la requête et la date de récupération ; il n'existe aucune précision publiée pour les éléments moyens ni pour le placement par modèle de rotation, de sorte que les seuils figés détectent les régressions et ne valident pas. Les éléments moyens omettent les perturbations résonantes et solaires, et l'accélération séculaire de Phobos n'est pas modélisée

# text
seg-de8a26ea4d61 = ephem (satellite_state, Satellite, SatelliteMethod, moon_icrf, moon_icrf_velocity) ; ephem_provider (AnalyticSolarSystem)

# text
seg-06601f6fb837 = tests/solar_system_horizons_reference.rs (moons_track_horizons_to_the_measured_angles : pire erreur angulaire vue depuis la planète sur { "2000" } à { "2040" }, Phobos { "5.65" } deg, Deimos { "0.38" }, Io { "0.40" }, Europe { "1.63" }, Ganymède { "0.22" }, Callisto { "0.27" }, Titan { "3.31" } ; geocentric_moon_tracks_horizons : { "0.046" } deg) ; ephem::tests (moons_sit_at_their_mean_distance_and_move_at_their_mean_speed) ; ephem_provider::tests (earth_and_moon_balance_about_their_barycentre)

# text
seg-d0dd931332c8 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Transcription de constantes publiées, chacune citée là où elle est définie : paramètres gravitationnels issus des fiches de corps JPL Horizons et de la table des paramètres physiques des satellites JPL, rayons issus des tables de paramètres physiques JPL (IAU WGCCRE { "2015" }), pôles et méridiens origine issus du Groupe de travail de l'IAU sur les coordonnées cartographiques et les éléments de rotation (valeurs moyennes, sans les termes de taux T ni les termes périodiques), J2 d'après Smith et al. { "2012" }, Iess et al. { "2018" } et { "2019" }, et Jacobson { "2009" } et { "2014" }. Vérifié pour la cohérence interne (la période de rotation de Jupiter par rapport au taux du Système III, chaque J2 par rapport à son rayon de référence), et non par rapport à une référence indépendante. { "0.30" } tour { "2" } : les valeurs de GM ont été adoptées depuis gm_de440 et les éléments de Phobos et Deimos depuis pck00011, de sorte que { "0" } constantes sur { "84" } des quatorze corps ajoutés diffèrent désormais de NAIF (contre { "12" }), ce qui est une vérification de transcription et n'est pas comptabilisé. { "0.36" } : l'orientation solidaire du corps selon l'IAU et le GM des quatorze corps ajoutés sont séparés dans leur propre ligne VALIDATED (« Orientation des corps selon l'IAU et paramètre gravitationnel des quatorze corps du système solaire ajoutés ») ; cette ligne conserve ce qui reste. J2 et le rayon moyen sont cités, non validés ; les positions du rapport reposent sur leurs propres lignes ; et le prime_meridian_deg du rapport pour la Terre, la Lune et Mars reste sur des constantes conventionnelles (jusqu'à { "6.6e-3" }, { "2.8e-2" } et { "9.6e-4" } rad de IAU_<BODY>). Révisions { "0.30" } : GM de Phobos { "7.087e5" } -> { "7.087546066894452e5" }, Deimos { "9.62e4" } -> { "9.615569648120313e4" }, Uranus { "5.7939506103e15" } -> { "5.793951256527211e15" }, Neptune { "6.83509997e15" } -> { "6.835103145462294e15" }, Pluton { "8.69326e11" } -> { "8.696138177608748e11" } m³/s² ; rayon équatorial de Phobos { "13.1" } -> { "13.0" } km ; prime_meridian_deg inclut désormais les termes quadratiques et périodiques

# text
seg-24749f350eb2 = body (Body::by_name, Body::facts, Body::prime_meridian, SOLAR_SYSTEM, BodyFacts) ; solar_system (SolarSystemScenario, position_label)

# text
seg-a2ffe20b07aa = body::tests (every_catalogue_body_resolves_by_name_and_carries_its_record; a_zonal_field_is_referenced_to_its_sources_radius; retrograde_rotators_have_negative_rates_and_periods_match_the_iau_rate) ; solar_system::tests (defaults_report_all_eighteen_bodies_with_tracks; earth_heliocentric_distance_is_one_au_and_period_one_year; a_planet_track_closes_on_its_orbit_and_starts_at_the_epoch_position; moons_orbit_their_planets_at_their_mean_distance; pluto_outside_its_table_is_an_error_not_a_guess; every_emitted_number_has_a_unit) ; tests/body_constants_naif_oracle.rs::only_the_conventional_constants_of_other_rows_differ

# text
seg-d3a6bc01842e = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Formes closes et auto-cohérence : troisième loi de Kepler pour la période du relais, rayon d'orbite et rayon de surface maintenus pendant l'exécution, l'ajout d'une mesure n'augmentant jamais l'incertitude formelle, et les erreurs générées avec une graine concordant avec la covariance. Les orbites des relais ignorent les corps tiers (l'attraction de Jupiter sur les relais autour d'Europe n'est pas modélisée), le bruit est gaussien aux niveaux indiqués et le modèle de mesure est instantané ; ce n'est donc pas validé par rapport aux données de navigation d'une mission quelconque

# text
seg-0de56af96b3e = body_pnt (BodyPntScenario, formal_sigma, fix_error) ; orbit (dop) ; batch_ls (gauss_newton) ; mars_pnt (chord_clears_sphere) ; mars_frame (bodyfixed_to_inertial)

# text
seg-92943f4850b5 = body_pnt::tests (relay_period_is_keplers_third_law_for_the_body; an_orbiter_keeps_its_radius_and_a_lander_sits_on_the_surface; the_earth_range_never_worsens_the_formal_uncertainty; seeded_fix_errors_are_consistent_with_the_formal_sigma : la racine de la moyenne quadratique de chaque erreur de positionnement rapportée à son propre sigma formel dans [{ "0.6" }, { "1.5" }] ; earth_light_time_is_minutes_at_mars_and_the_run_is_deterministic; defaults_run_around_mars_and_every_number_has_a_unit)

# text
seg-d57372871f5e = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Cohérence interne : le balayage d'élévation par force brute, les réductions calculées à la main et par orbit::dop, et la géométrie en forme close de Walker et géosynchrone. Orbites à deux corps avec un J2 séculaire facultatif, un corps sphérique avec la verticale locale suivant le rayon, visibilité géométrique seulement (ni puissance de signal, ni état de santé des satellites, ni relief, ni perturbation de corps tiers), et la phase relative entre systèmes prise à partir de références d'époque différentes, de sorte que ce n'est l'instantané d'aucune date. Revue { "0.30" }, un constat (reste MODELLED) : les préréglages respectent les planchers unilatéraux publiés de disponibilité DOP (norme de performance du service ouvert BeiDou { "3.0" }, SDD du service ouvert Galileo) à { "100" } %, mais avec le PDOP du moteur doublé dans une copie de travail ils les respectent encore (pire point { "99.36" } %), de sorte que les planchers ne peuvent détecter même une erreur de { "100" } % sur la grandeur que calcule cette ligne ; les resserrer après l'exécution serait une tolérance a posteriori. Une promotion nécessite une comparaison bilatérale des valeurs de DOP sur une géométrie identique avec une tolérance fixée à l'avance. Tour { "2" } { "0.30" } (tests/coverage_dop_full_oracle.rs, préenregistré add671d6), un constat (reste MODELLED) : les positions, l'élévation, l'azimut et les traces au sol d'Orekit { "12.2" } avec les GDOP/PDOP/HDOP/VDOP de gnss_lib_py { "1.0.4" } (horloge commune) et une inverse numpy (une horloge par constellation) concordent sur chaque seuil pour Galileo, GPS, BeiDou, Galileo+GPS (une horloge chacun) et une conception terrestre de 1584 satellites (DOP à { "2e-14" } relatif près, position calculée, disponibilité et nombres de satellites visibles identiques). Sur les conceptions pour la Lune et Mars, les éléments, positions, visibilité et traces concordent, mais le DOP dépasse le seuil relatif fixé à l'avance de { "1e-9" } dans les cellules dont le plus grand PDOP vaut { "1434" } ou plus (jusqu'à { "8e-6" }), et { "4" } cellules diffèrent d'une époque de positionnement sur une géométrie numériquement singulière (pivot du moteur { "1e-10" } contre le rang numpy), de sorte que la ligne n'est pas validée. Révisions { "0.30" } : l'horloge de référence TDOP/GDOP est désormais la constellation de plus bas numéro en vue (constellation-multi-gnss-coverage GDOP global max { "2.2236" } -> { "2.1205" }, moyenne { "1.122" } -> { "1.131" }), et les nombres de satellites visibles par constellation sont additionnés comme des entiers

# text
seg-17bf1df86b49 = constellation (coverage, ConstellationDesignScenario, beidou_slots, body_by_name)

# text
seg-4d15849bdf7c = constellation::tests (prefilter_matches_brute_force_exactly — chaque carte et chaque compteur égale un balayage avec le test d'élévation direct ; five_thousand_satellites_on_a_coarse_grid — { "5 000" } satellites, affiche le temps d'exécution et les tests de paires conservés ; a_clock_per_constellation_needs_one_more_satellite; beidou_geo_and_igso_geometry; lunar_shell_runs_around_the_moon; presets_are_earth_only_and_errors_are_clear; preset_counts) ; tests/constellation_availability_published_spec_oracle.rs::presets_meet_the_published_dop_availability (contrôle de régression seulement) ; tests/coverage_dop_full_oracle.rs::finding_is_pinned ; tests/coverage_dop_gnss_lib_py_oracle.rs (régression)

# text
seg-41b300bb888a = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Identités de composition par rapport aux exécutions autonomes des mêmes types de scénario : une campagne à une phase reproduit la sortie autonome bit pour bit, le décalage reporté égale le dernier échantillon propre de l'exécution précédente, et la phase terminée par end_at a exactement le temps de détection de l'exécution pour durée. Le report additif à travers une frontière de phase et le maintien d'ordre zéro sont des choix de modélisation, et chaque phase vaut ce que vaut le type de scénario qui l'a exécutée ; aucune mission enchaînée n'a été comparée à une mission mesurée

# text
seg-fde8247097c3 = campaign (run_campaign_detailed, run_chain, presets, extract, to_svg)

# text
seg-d8d3a3893423 = tests/campaign_composition_reference.rs (a_one_phase_clock_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_integrity_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_jamming_campaign_reproduces_the_standalone_run_bit_for_bit — le résultat du membre identique octet pour octet à l'exécution autonome et chaque valeur alignée égale à la série autonome ; the_chained_mission_hands_state_on_and_ends_the_spoofing_phase_on_detection; a_handoff_writes_the_previous_phase_number_into_the_next_scenario; malformed_campaigns_fail_loudly)

# text
seg-fca7ec328ea6 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — La forme close de la marche aléatoire de phase sous bruit blanc de fréquence, de variance q_wf tau (NIST Technical Note { "1337" }), pour la machinerie statistique, et l'égalité octet pour octet avec les exécutions autonomes pour l'amorçage par graine. Elle vérifie l'arithmétique d'ensemble sur le modèle d'horloge propre au moteur, et non un jeu de données externe

# text
seg-59eda109a298 = campaign (run_sweep, run_monte_carlo, ensemble) ; sweep (GenericAxis, coords_of, set_dotted_value) ; inertial (metric_stat)

# text
seg-3b9aa486bb66 = tests/campaign_composition_reference.rs (a_fixed_seed_ensemble_is_byte_stable_and_each_realisation_is_the_standalone_run; the_ensemble_mean_and_spread_match_the_white_fm_closed_form — { "200" } graines d'une horloge à bruit blanc de fréquence en marche libre tau = { "3010" } s : la vraie moyenne { "0" } à l'intérieur de l'intervalle rapporté, la demi-largeur de l'intervalle à moins de { "25" } % de { "1.96" } sigma/sqrt(n), et la variance d'échantillon à l'intérieur de l'intervalle bilatéral du khi-deux à { "99" } % de sigma = sqrt(q_wf tau) = { "16.459" } ns ; ensemble d'étalonnage (CAP-10, préenregistré ea451cb5, docs/CALIBRATION-ENSEMBLES.md, tests/calibration_ensembles.rs) : sur { "200" } ensembles indépendants, l'intervalle couvre la vraie moyenne sur { "192" } (à l'intérieur de la région à { "99" } % de la loi Binomial({ "200" }, { "0.95" }) [{ "181" }, { "197" }]) et le contrôle du khi-deux est réussi sur { "196" }, tandis que la tolérance en percentiles à graine unique (p05 et p95 à moins de { "0.3" } sigma) n'est réussie que sur { "183" } des { "200" }, NOT MET par rapport aux { "190" } préenregistrés, un contrôle fragile vis-à-vis de la graine, consigné plutôt qu'assoupli ; a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number)

# text
seg-3dcca86d0869 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Identité de composition par rapport à l'exécution autonome. L'arithmétique des conditions partagées relève de la comptabilité ; la physique est celle des types de scénario membres, chacun avec sa propre ligne

# text
seg-c0c2439ee1f6 = campaign (run_compose)

# text
seg-b238a6b2bbdd = tests/campaign_composition_reference.rs (a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number — une composition à un membre lit le nombre autonome et l'empreinte du résultat)

# text
seg-ef402841914e = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Interne seulement : la forme close exacte en -20 log10(distance) de l'équation de liaison, une grille indépendante par force brute sur le même type de scénario, et la fonction de Rosenbrock. Le seuil 1-D du tour { "1" } est NOT MET (le domaine préenregistré excluait la solution à { "3" } dB ; l'optimiseur s'est arrêté à la borne), consigné dans docs/design/evidence/cap32-optimize/RESULTS.md et non réévalué. L'optimum est local au domaine et au point de départ ; aucune affirmation d'optimum global

# text
seg-a032de3144fe = campaign::optimize (run_optimize, nelder_mead)

# text
seg-94a984382eee = tests/campaign_optimize_reference.rs (préenregistré fbe6c8b3 et, après un échec de protocole au tour 1, 441f31bc : p2_prime_interior_target_range_matches_the_closed_form — résolution de cible 1-D à { "6.1e-15" } de r* = r0 { "10" }^((m(r0) - { "3" })/20) en { "96" } évaluations ; p3_prime_contour_target_grid_and_nelder_mead et p3_grid_matches_brute_force_and_nelder_mead_does_at_least_as_well — le meilleur de la méthode par grille égal bit à bit à une boucle indépendante par force brute { "41" } x { "41" } sur run_toml, Nelder-Mead au moins aussi bon en { "177" } et { "161" } évaluations ; p4_nelder_mead_reaches_the_corner_maximum; p5_the_document_is_byte_stable_and_counts_agree; p2_round1_not_met_the_box_excludes_the_closed_form, qui fige l'échec consigné du tour 1) ; campaign::optimize::tests (nelder_mead_meets_the_preregistered_rosenbrock_bar : f* = { "1.7e-20" } en { "234" } évaluations ; a_non_finite_score_is_never_the_best; the_grid_mapping_is_the_sweeps)

# text
seg-c235cf7a1f0d = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Les formes closes validées des deux lignes ci-dessus, l'identité de fausse alarme en loi quadratique P_d(snr = { "0" }) = P_fa et le temps moyen d'acquisition de Holmes, et la réduction à la chaîne SSC propre du type de scénario spectrum (le même code Jammer::ssc). Les conceptions elles-mêmes sont des entrées : les préréglages marqués REPRESENTATIVE ou WORKSHOP ne sont pas des spécifications publiées, les spectres QPSK de Feher amélioré, de modulation par déplacement de code et d'OFDM sont approchés, et les contrôles de forme comparent des formes, et non des niveaux étalonnés.

# text
seg-a0c6fa7dbb46 = leo_signal (LeoSignalScenario, SignalDesign, Component, Shape, code_jitter_m, gabor_bandwidth_hz, detection_probability, threshold_for_pfa, mean_acquisition_time_s, ssc_leo_into_gnss, ssc_gnss_into_leo, jammer_tolerance, gnss_victim, preset, public_signal)

# text
seg-6d9eb1dc2a11 = leo_signal::tests (every_public_preset_parses_and_cites_a_url; detector_reduces_to_pfa_and_grows_with_snr; detection_probability_with_several_looks_matches_the_noncentral_chi_square; mean_time_of_a_perfect_detector_is_half_the_cells; compatibility_ssc_magnitudes_match_independent_quadrature; to_spectrum_band_is_consistent_with_the_design; jammer_tolerance_orders_cw_matched_wideband; e5_centred_signal_hits_e5a_and_e5b_equally; defaults_run_on_the_generic_band_preset; inline_signal_and_bad_inputs) ; tests/leo_signal_reference.rs (chaque scénario fourni indépendant du système s'exécute sans données d'atelier, les rapports ionosphériques de l'arbitrage de bande égalent (f_ref/f)^{ "2" } et ses différences en espace libre { "20" } log10(f/f_ref), la gigue au C/N0 de référence se situe entre sa borne de Gabor et sa forme en bande illimitée, les contrôles de forme E5 du scénario à paramètres d'atelier sont cohérents lorsque ce fichier est présent, et aucun fichier source ne compile ce fichier)

# text
seg-c83f81eb8726 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Réduction à la chaîne de spectre existante et à l'équation anti-brouillage du type de scénario de brouillage (une bande à composante unique donne les mêmes nombres qu'avant l'extension) et aux spectres de signal des lignes validées. Les puissances de brouilleur, la chronologie, les largeurs de bande des étages d'entrée et les signaux conçus sont des entrées, et un signal conçu est tronqué à sa bande d'émission (aucune émission hors bande).

# text
seg-e31094573516 = spectrum (Band::unit_psd, Band::tracked_power_dbw, BandDesign, BandCfg, PanelCfg, SpectrumScenario, Waveform, multi_band_svg) ; leo_signal (SignalDesign::to_spectrum_band)

# text
seg-17f462b8768d = tests/leo_signal_reference.rs (la cascade multibande s'exécute avec quatre panneaux, les brouilleurs UHF, bande L5, S et C ne privent chacun que leur propre bande, et une exécution à bande simple est inchangée par l'extension) ; leo_signal::tests::to_spectrum_band_is_consistent_with_the_design ; spectrum::tests (agrees_with_the_jamming_kind_chain)

# text
seg-cee2cbdad6d6 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Formes closes et auto-cohérence : les identités de vitesse radiale et d'accélération radiale par rapport aux dérivées numériques, le gain isoflux compensant la croissance de la distance, les limites de perte de polarisation des manuels, l'observation qualitative LEO par rapport à GNSS (un passage en cloche de quelques minutes culminant plusieurs dB au-dessus de porteuses GNSS plates à 44-51 dB-Hz). Les EIRP et les diagrammes sont des puissances reçues publiées converties en EIRP ou des choix représentatifs, le terme gazeux est la méthode simplifiée P.676-10 remplacée, et rien n'est comparé à un C/N0 LEO mesuré

# text
seg-8749534ecbbb = leo_pass (LeoPassScenario) ; leo_link::geometry (design_pass, link_geometry, numerical_check, SatMotion, UserMotion) ; leo_link::antenna ; leo_link::itu (p676_gaseous_attenuation_db) ; leo_link (system_noise_temperature_k, cn0_dbhz)

# text
seg-eec596b8749d = leo_pass::tests (the_leo_pass_is_a_bell_above_flat_gnss; closed_form_doppler_agrees_with_the_numerical_derivative : sous { "0.01" } Hz et { "0.01" } Hz/s ; indoor_uhf_suffers_less_building_loss_than_c_band; rain_attenuates_c_band_more_than_s_band; iono_delay_scales_as_one_over_f_squared_across_bands; a_fully_custom_band_needs_no_preset; a_walker_constellation_and_a_tle_satellite_both_run; defaults_run_with_no_preset_named_and_every_number_has_a_unit) ; leo_link::geometry::tests (kepler_velocity_is_the_derivative_of_the_position; a_designed_pass_reaches_the_requested_elevation; closed_form_range_rate_and_accel_match_central_differences_for_two_body_motion) ; leo_link::antenna::tests

# text
seg-d9e965c108ea = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Transcription des valeurs publiques citées et contrôle de cohérence : une EIRP fixée à partir d'une puissance reçue minimale publiée prédit le maximum publié à { "0.5" } dB près avec un diagramme plat. C'est un contrôle de l'étalement des distances, et non une validation de l'antenne d'un satellite quelconque ; les préréglages représentatifs ne revendiquent rien sur un système réel

# text
seg-a6cfe1d09891 = leo_link::presets (SystemPreset, BandPreset, all, by_id, gnss_meo) ; leo_pass (resolve_bands)

# text
seg-09ebe92cc5c1 = leo_link::presets::tests (every_preset_is_sourced_and_self_consistent; only_the_celeste_preset_is_sourced_from_the_workshop) ; leo_link::presets::xona_pulsar::tests (the_eirps_reproduce_the_published_minimum_power_at_ten_degrees; a_flat_pattern_lands_the_zenith_power_near_the_published_maximum : à { "0.5" } dB de -139.1 et -136.2 dBW) ; leo_link::presets::iridium::tests ; leo_pass::tests (a_fully_custom_band_needs_no_preset)

# text
seg-cfa2e7e53eed = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Cohérence interne d'un modèle de conception énoncé : chaque puissance, seuil et choix de recherche est une entrée, et le modèle ignore l'ambiguïté de front de bit, la non-détection et la ré-acquisition. Non comparé à un récepteur mesuré

# text
seg-8c33a02f0aa9 = leo_link::energy (fix_budget, duty_curve, IotReceiver, IotSignal) ; leo_pass (iot_section)

# text
seg-981819c1af62 = leo_link::energy::tests (stronger_signals_and_smaller_doppler_windows_fix_faster; the_doppler_rate_caps_the_coherent_time; battery_life_grows_with_the_fix_interval_toward_the_sleep_floor) ; leo_pass::tests (the_run_is_deterministic_and_bad_inputs_are_rejected)

# text
seg-d8b2e149d5cf = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Cohérence interne (l'identité de saut et la borne du cône par rapport à un échantillonnage par force brute). Le seuil est une entrée ; aucune exigence publiée de continuité LEO n'est figée

# text
seg-a8d152bb385d = leo_navmsg (LeoNavmsgScenario::midpass, worst_case_jump, elevation, geodetic_to_ecef)

# text
seg-af0e339c4fae = leo_navmsg::tests::a_mid_pass_update_is_continuous (le saut de distance de chaque commutation égale la variation de l'erreur de distance, et un ajustement corrigé de { "300" } s mis à jour toutes les { "150" } s passe un seuil de { "5" } cm) ; leo_navmsg::tests::a_keplerian_only_update_over_a_long_interval_is_flagged ; leo_navmsg::tests::worst_case_jump_bounds_every_line_of_sight (la forme close borne un échantillonnage dense du cône)

# text
seg-bae9c4665c45 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Identités d'aller-retour et le budget lui-même. Le format est propre à Kshana, modélisé sur les composantes de message publiées et le jeu de champs de l'ICD Galileo ; ce n'est pas la disposition binaire de Celeste ni d'aucun autre système (aucune n'est publique), de sorte qu'il n'existe aucune disposition externe par rapport à laquelle valider

# text
seg-d8d04f2ffd50 = leo_navmsg::codec (encode, decode, write_payload, read_payload, field_table, quantisation_budget)

# text
seg-4040a549f1c1 = leo_navmsg::codec::tests (signed_fields_round_trip_through_the_bit_packer; week8_resolves_near_the_reference) ; leo_navmsg::tests::every_model_round_trips_through_the_binary_frame (chaque modèle à { "2" } mm du message exact après décodage, ré-encodage identique bit à bit, un bit inversé rejeté par le CRC) ; leo_navmsg::tests::every_field_of_the_budget_stays_under_a_millimetre

# text
seg-2fe510f389d1 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Allers-retours et arithmétique du calendrier. RINEX { "4.02" } ne définit aucun enregistrement de navigation LEO (IGS RINEX { "4.02" }), de sorte que la disposition est une extension documentée, arXiv { "2401.17767" } étant cité comme antériorité ; il n'existe aucun lecteur externe de celle-ci par rapport auquel vérifier

# text
seg-a6f36f62a02d = leo_navmsg::text (rinex_export, rinex_import, csv_export, csv_import, calendar, from_calendar)

# text
seg-14ee5fa96ce7 = leo_navmsg::text::tests (calendar_round_trips_and_knows_the_gps_origin; d19_is_rinex_shaped) ; leo_navmsg::tests::rinex_and_csv_round_trips (chaque modèle à { "0.1" } mm après le bloc de texte, le CSV exact)

# text
seg-9c1e46397382 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Faits de modèle ATOMIC issus d'InsideGNSS (polynôme d'ordre 6, environ une minute de validité, rafraîchissement toutes les { "30" } s, horloge pilotée, erreur d'horloge de { "24" } cm). Ce sont des faits descriptifs sans nombres publiés auxquels comparer. Le tableau à cinq altitudes imprime la SISRE de Liu et al. { "2025" } ({ "8.88" }, { "6.21" }, { "2.87" }, { "2.11" } et { "0.75" } cm à { "320" }, { "475" }, { "786" }, { "966" } et { "1336" } km sur un arc de 20 minutes) à côté de l'ajustement de Kshana sur sa propre orbite intégrée ({ "4.25" }, { "2.87" }, { "2.20" }, { "1.25" } et { "0.51" } cm ; rapports { "0.46" } à { "0.77" }), non figé, car l'article a ajusté de vraies orbites précises et les vérités diffèrent. Le modèle à 22 paramètres et son ajustement sont eux-mêmes validés par rapport à des orbites réelles dans la ligne Modèle d'éphéméride LEO à 22 paramètres de Liu et al. { "2025" } et son ajustement sur de vraies orbites précises. Révision { "0.30" } : les valeurs du tableau ont évolué avec l'ajustement selon la convention de l'article (GRACE-A { "5.40" } -> { "4.25" } cm, GRACE-C { "4.12" } -> { "2.87" }, Sentinel-2A { "2.95" } -> { "2.20" }, HY-2A { "2.38" } -> { "1.25" }, Sentinel-6A { "0.70" } -> { "0.51" })

# text
seg-3f5b07cc8c81 = leo_navmsg::elements (EcefPoly, ephemeris_at) ; leo_navmsg (liu_comparison, LIU2025_TABLE)

# text
seg-1ffa5a792c36 = leo_navmsg::tests::liu22_beats_the_16_parameter_set_over_a_20_minute_arc ; leo_navmsg::tests::the_ecef_polynomial_fits_a_minute_to_millimetres ; leo_navmsg::tests::every_preset_resolves_and_the_atomic_preset_selects_the_zero_clock_polynomial

# text
seg-3adf09cf2ed5 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Cohérence interne : récupération sans bruit, l'identité cinématique rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho dérivée numériquement, Doppler nul au plus près, la solution miroir d'un passage unique, et les erreurs générées avec une graine par rapport à la covariance formelle. Le chiffre Starlink de Kozhaya, Saroufim et Kassas (NAVIGATION { "72" }({ "1" }), { "2025" } : environ { "2" } m en { "20" } s avec trois satellites) n'est qu'une comparaison : le récepteur modélisé, avec une éphéméride parfaite et toute l'erreur dans un sigma Doppler de { "30" } Hz, est plusieurs fois moins précis sur la même fenêtre, et le récepteur et la cadence de mesure de l'article ne sont pas reproduits

# text
seg-fc9c5d5b1511 = leo_fusion::doppler (solve, formal_covariance, single_pass_geometry, offset_site, closest_approach) ; leo_fusion::pvt_kind (run_doppler)

# text
seg-6cb8d56c57d6 = leo_fusion::doppler::tests (range_acceleration_obeys_the_kinematic_identity_and_vanishes_doppler_at_closest_approach; noise_free_multi_satellite_doppler_recovers_the_user : à { "1" } mm et la dérive à { "1e-6" } m/s ; a_single_pass_has_a_mirror_solution_across_the_ground_track; the_cross_track_error_grows_as_the_pass_goes_overhead; velocity_states_are_recovered_for_a_moving_user) ; leo_fusion::pvt_kind::tests (doppler_positioning_improves_with_the_window_and_is_deterministic : le RMS pondéré des résidus dans [{ "0.8" }, { "1.2" }] et l'erreur sous quatre sigmas formels) ; tests/leo_fusion_scenarios.rs (leo_doppler_positioning_forms_a_fix_and_the_cross_track_error_explodes_overhead; starlink_doppler_only_mode_runs_without_ranging) ; tests/starlink_doppler_published_proxy.rs (un substitut préenregistré par rapport aux percentiles publiés du jeu de données 3 de « Unveiling Starlink for PNT », doi:10.33012/navi.685 : avec { "3" } satellites (masque de { "47" } deg), sans aide d'altitude et { "30" } Hz, l'erreur 3-D au p90 est de { "92.2" } m à { "20" } s et de { "870" } m à { "8" } s contre { "2" } m et { "10" } m publiés, de sorte que les deux seuils d'un facteur deux sont NOT MET, du côté haut, et affirmés comme manqués ; docs/design/evidence/cap11-starlink-doppler-proxy/)

# text
seg-54aea757feb2 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Un DOP à quatre satellites dérivé à la main (un satellite au zénith et trois à l'horizon espacés de { "120" } deg, dont la matrice normale s'inverse à la main), l'identité structurelle selon laquelle un système avec sa propre horloge et un seul satellite n'ajoute aucune géométrie, la récupération sans bruit de la position, de l'horloge et du biais, et les erreurs générées avec une graine par rapport à la covariance. Contrôles internes seulement ; non comparé à la sortie d'un récepteur. Comparaison externe { "0.30" }, un constat (reste MODELLED) : sur un jour IGS multi-GNSS (ABMF 2018-05-13, GPS et Galileo C1C, éphéméride diffusée, Klobuchar), le biais inter-systèmes concorde avec RTKLIB v2.4.2-p13 rnx2rtkp (différence médiane -0.11 ns après la correction { "0.30" } du délai de groupe diffusé, -0.35 ns avant ; seuil { "1" } ns), mais seulement { "93.6" } % des { "280" } époques ({ "93.2" } % avant la correction) se trouvent à moins de { "3" } m de la coordonnée ITRF2020, contre les { "95" } % préenregistrés. RTKLIB atteint lui-même { "88.2" } % sur les mêmes données, de sorte que le seuil dépasse ce que permet le positionnement par diffusion monofréquence à cette station et ce jour-là, plutôt qu'un écart du solveur ; le test de comparaison est versionné mais marqué ignoré. Tour { "2" } { "0.30" }, entrées plus strictes au seuil inchangé de { "3" } m / { "95" } % / { "1" } ns, un constat (reste MODELLED) : avec la paire sans ionosphère Galileo E1/E5a (préenregistré { "6927e039" }), { "79.9" } % des époques sont à moins de { "3" } m (RTKLIB { "67.9" } %) ; avec les orbites précises CODE MGEX, les horloges, les décalages d'antenne des satellites et les biais de code (préenregistré 7d8c3597), { "94.2" } % (RTKLIB { "94.1" } %), et le biais inter-systèmes diffère de RTKLIB de -1.03 ns parce que le mode simple de RTKLIB ignore les décalages d'antenne des satellites (+{ "0.04" } ns lorsque les deux les omettent)

# text
seg-95f8dcd6247e = leo_fusion::joint_pvt (solve, dop, code_sigma_dll_m, SystemClock) ; leo_fusion::system (SystemCfg, System) ; leo_fusion::pvt_kind (run_joint)

# text
seg-7a8b0b7b8a37 = leo_fusion::joint_pvt::tests (dop_matches_the_hand_derived_zenith_plus_three_horizon_case : HDOP = VDOP = sqrt(4/3), TDOP = sqrt(1/3), PDOP = sqrt(8/3), GDOP = sqrt({ "3" }) à { "1e-9" } près ; a_lone_satellite_with_its_own_clock_adds_nothing_and_a_known_offset_does; a_noise_free_fix_recovers_position_clock_and_inter_system_bias; seeded_fixes_agree_with_their_formal_covariance; dll_noise_is_the_textbook_figure_for_gps_l1_ca) ; leo_fusion::pvt_kind::tests (fusing_leo_never_worsens_the_median_pdop_and_the_isb_is_recovered) ; tests/leo_fusion_scenarios.rs (meo_leo_fusion_beats_gnss_alone_and_recovers_the_leo_bias) ; tests/joint_pvt_dual_freq_itrf_rtklib_oracle.rs::dual_frequency_finding_is_pinned ; tests/joint_pvt_precise_itrf_rtklib_oracle.rs::precise_product_finding_is_pinned

# text
seg-e86eb864ba1a = une sous-affirmation est vérifiée de façon externe, mais la capacité dans son ensemble compose des éléments modélisés, de sorte que la capacité reste modélisée — Le test du khi-deux NEES est un contrôle de cohérence interne (la vérité et le filtre partagent le modèle). La tendance est comparée à Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2 : le multi-GNSS à { "9.6" } min est raccourci à { "7.0" }, { "3.2" }, { "2.1" } et { "1.3" } min avec { "60" }, { "96" }, { "192" } et { "288" } satellites LEO. Le scénario fourni donne { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } et { "2.3" } min avec ses propres coques représentatives de { "1000" } km, { "60" } deg, son bruit et ses stations ; les constellations, le bruit et la définition de convergence de l'article ne sont pas reproduits, de sorte qu'il s'agit d'une cohérence MODELLED de la tendance (raccourcissement monotone, la plus grande constellation sous un tiers du temps GNSS seul), et non d'une validation

# text
seg-d98c7b399230 = leo_fusion::ppp (run, PppScenario, LI_2019)

# text
seg-51a43af7f6b5 = leo_fusion::ppp::tests (the_filter_is_consistent_over_monte_carlo_seeds : { "24" } graines, moyenne NEES moyennée sur l'exécution dans [{ "2.4" }, { "3.6" }] et au moins { "75" } % des époques à l'intérieur de la bande bilatérale du khi-deux à { "95" } % ; mesuré avec { "150" } graines, moyenne { "2.84" } GNSS seul et { "2.87" } avec LEO ; leo_augmentation_shortens_convergence; same_seed_same_answer_and_every_number_has_a_unit) ; tests/leo_fusion_scenarios.rs (ppp_convergence_of_the_bundled_scenario_shortens_monotonically)

# text
seg-91df984eb133 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Cohérence interne : l'expression publiée du décalage évaluée à la main, l'erreur normalisée sur { "40" } graines, et le plancher fixé par l'incertitude du décalage. Le chiffre du NIST pour les récepteurs de synchronisation temporelle Iridium avec une horloge atomique miniature (moins de { "40" } ns par rapport à UTC(NIST) sur { "40" } jours) n'est qu'une comparaison ; le scénario Iridium fourni donne { "10" } à { "11" } ns RMS à puissance nominale avec son erreur de distance représentative de { "5" } m. Le bruit de fréquence de scintillation et le retard ionosphérique ne sont pas simulés

# text
seg-c42e3bd4a4c1 = leo_fusion::timing (simulate, utc_offset_s, system_to_utc_s) ; leo_fusion::pvt_kind (run_timing)

# text
seg-061a0510c35c = leo_fusion::timing::tests (the_utc_offset_follows_the_is_gps_200_expression; continuous_tracking_approaches_the_measurement_floor_and_gaps_cost_time; the_filter_is_consistent_over_seeds; the_utc_offset_uncertainty_sets_a_floor) ; tests/leo_fusion_scenarios.rs (leo_timing_error_grows_as_the_c_n0_falls)

# text
seg-7472a819bf01 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Transcription des valeurs publiques citées, vérifiée quant à la structure (chaque source publique a une URL, les motifs de Walker se divisent exactement, le C/N0 à partir de la puissance reçue sur kT à { "290" } K), et non par rapport à une référence indépendante. Les valeurs représentatives sont nommées dans chaque préréglage et sont illustratives

# text
seg-16fa5fabfb50 = leo_fusion::presets (all, by_id, cn0_range_dbhz, noise_density_dbw_hz) ; leo_fusion::system (SystemCfg::build)

# text
seg-df22b3cb00fa = leo_fusion::presets::tests (every_preset_has_a_source_and_every_public_source_a_url; only_one_preset_uses_workshop_material; noise_density_at_290_k_is_minus_204_dbw_per_hz) ; tests/workshop_preset_isolation.rs (only_the_listed_files_name_the_workshop_preset; workshop_numbers_live_only_in_the_preset_file_and_its_scenarios : analyses de texte source de src, des scénarios et des tests) ; leo_fusion::system::tests (a_preset_fills_what_the_scenario_leaves_out; a_system_needs_no_preset; pseudorange_sigma_falls_with_elevation_and_never_below_the_sisre)

# text
seg-2e45cedea59a = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Auto-cohérence des transmissions : chaque valeur transmise égale la sortie propre de l'étape amont, et la modification d'une entrée amont déplace chaque valeur aval qui en dépend. Les étapes conservent leurs propres libellés ; la chaîne n'ajoute aucune physique ni aucune référence indépendante

# text
seg-6478ad7d09eb = leo_pnt_chain (LeoPntChainScenario) ; leo_pass (BandCfg::signal, design_tracking) ; leo_navmsg (LeoNavmsgScenario::broadcast_sisre) ; leo_fusion::pvt_kind ; leo_fusion::ppp

# text
seg-02ef52ba69f0 = leo_pnt_chain::tests (a_sine_line_fit_recovers_its_line) ; tests/leo_pnt_chain.rs (every_upstream_change_moves_the_downstream_figures : une EIRP plus forte, un intervalle d'ajustement plus long et un terme de détermination d'orbite plus grand déplacent chacun la valeur transmise et la position fusionnée ; the_handed_on_values_are_the_stage_outputs; a_band_design_splits_the_eirp_and_reports_the_design_jitter; the_pass_export_reproduces_the_engine_range)

# text
seg-7d9265f54059 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Formes closes et identités, et non une mesure externe : le gradient de vitesse radiale par rapport à une différence centrée, la statistique sous forme d'information par rapport à la forme de covariance dense, une dérive d'horloge pure donnant zéro, une poussée expliquée par l'a priori donnant au plus |dx|^2/sigma_p^{ "2" }, la statistique quadratique en fonction d'un saut. Aucun chiffre de détection n'est comparé à une attaque mesurée ; le leurre est idéalisé (aucune signature de puissance, d'angle d'arrivée ou de pic de corrélation)

# text
seg-4070df5af5e4 = leo_link::spoof (range_rate_position_gradient, line_of_sight, fll_frequency_jitter_hz, doppler_consistency_window, doppler_consistency) ; leo_pass (SpooferCfg, spoof_section)

# text
seg-0a123a80693f = leo_link::spoof::tests (the_gradient_is_the_derivative_of_the_range_rate; fll_jitter_matches_the_formula_by_hand; a_common_mode_residual_is_a_clock_drift_and_is_not_detected; with_no_prior_and_equal_noise_the_statistic_is_the_scatter_about_the_mean; a_push_the_prior_explains_is_not_detected; a_velocity_push_is_hidden_by_a_loose_velocity_prior_only; the_information_form_equals_the_covariance_form) ; tests/leo_resilience_verticals.rs (the_monitors_are_silent_before_the_onset; the_doppler_statistic_is_quadratic_in_the_jump; leo_range_rates_see_a_jump_that_gnss_range_rates_do_not)

# text
seg-38269e21c514 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Identités : l'échelon d'apparition d'un leurre sans ionosphère égale la différence de retard ionosphérique modélisée de la paire, le seuil est le quantile normal bilatéral multiplié par l'écart-type de l'échelon plus la borne de vitesse. Le modèle ionosphérique du récepteur est celui du moteur, de sorte que le résidu authentique est nul en moyenne par construction ; aucune référence indépendante

# text
seg-8fbcf1ccbe16 = leo_link::spoof (cross_band_step) ; leo_pass (spoof_section: pairs, cross_band)

# text
seg-aa91bdc483b1 = leo_link::spoof::tests (the_cross_band_threshold_and_power) ; tests/leo_resilience_verticals.rs (a_ground_spoofer_leaves_the_ionospheric_step_and_an_ionosphere_aware_one_does_not; a_one_band_spoofer_is_seen_by_the_cross_band_monitor_at_the_onset; the_monitors_are_silent_before_the_onset)

# text
seg-3deb19ed1dc7 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — L'identité de dispersion au premier ordre, exacte par construction par rapport au retard au premier ordre propre au moteur (dont la mise à l'échelle en 1/f^{ "2" } est VALIDATED par rapport à IS-GPS-200 dans sa propre ligne) ; la précision est celle du seul bruit de code thermique, sans multitrajet ni biais inter-fréquences. Tour { "2" } { "0.30" }, mesuré (préenregistré 5e795f93), un constat (reste MODELLED) : la carte ionosphérique globale CODE CODG1330.18I par rapport au code C1C/C2W d'ABMF avec les biais CODE donne { "33" } moyennes d'arc sur { "36" } à moins de { "3" } TECU (pire +{ "6.84" } TECU sur un arc de soirée ; RMS par époque { "3.95" } TECU), contre un seuil portant sur chaque arc ; non validé

# text
seg-b91ca5a2bd9c = leo_pass (IonoFreePair::geometry_free_stec_tecu, geometry_free_stec_sigma_tecu) ; leo_link::iono::geometry_free_stec_tecu

# text
seg-5d00a19cfac2 = tests/leo_resilience_verticals.rs (the_geometry_free_tec_is_the_pass_slant_tec : égale le TEC oblique du passage au sommet à { "1e-9" } près et son sigma égale le bruit de code RSS sur { "40.3" } (1/f1^{ "2" } - 1/f2^{ "2" })) ; tests/geometry_free_tec_gim_oracle.rs::geometry_free_finding_is_pinned

# text
seg-6c6a0c044754 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Implémentation par rapport à la spécification, PAS une référence indépendante : une ré-implémentation Python en salle blanche (scripts/maritime_score_cleanroom.py), écrite par un lecteur n'ayant eu que docs/RECEIVER-TRUST.md et docs/MARITIME-TRUST.md et non le source Rust, concorde avec score_from_ratios sur { "600" } vecteurs de rapports (score, bande, points et ordre des déductions, différence { "0" }), après que la documentation a été complétée là où le premier lecteur l'a trouvée muette ou incohérente (ordre des égalités, arrondi, rapport d'un moniteur réussite-ou-échec, deux exemples dont les nombres ne correspondaient pas à la formule). Cela montre que la documentation est suffisante et que le code fait ce qu'elle dit. CE QUI N'EST PAS VÉRIFIÉ, et pourquoi la ligne reste MODELLED : la règle elle-même (les pondérations, la rampe, les bornes des bandes, le maintien des preuves) est propre à ce projet, préenregistrée mais sans source externe, et rien ici ne montre qu'un score de { "80" } ou de { "40" } signifie ce qu'un navigateur voudrait qu'il signifie en cas d'interférence réelle ; aucun chiffre de ce type n'est donné. Les seuils des moniteurs sont de même propres à ce projet (la ligne A ne vérifie que leur arithmétique).

# text
seg-aa2667aa0296 = receiver_trust (score, monitors, live)

# text
seg-58fcb2ec63c5 = tests/maritime_trust_reference.rs::t5_score_matches_the_clean_room_reading_of_the_documented_rule ; receiver_trust::score::tests (monotone en chaque statistique, l'ajout d'un moniteur ne relève jamais le score, des statistiques saines restent à { "100" })

# text
seg-26753cc49103 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — CE QUI EST VÉRIFIÉ : les propres tests de chaînes exactes de ce crate sur la correspondance documentée des champs LEEF, et les champs d'enveloppe RFC { "5424" } ; il n'existe aucun analyseur LEEF open source maintenu (une recherche dans l'index des paquets Python n'en a trouvé aucun), de sorte que le format est vérifié par rapport à sa propre spécification lue par le même auteur, et non par rapport à une référence indépendante. CE QUI NE L'EST PAS : si les charges LEEF sont acceptées par l'analyseur ou le SIEM d'un fournisseur quelconque ; les règles d'échappement au-delà de celles documentées ; le comportement d'un véritable collecteur syslog.

# text
seg-7adaa23ce920 = telemetry (syslog: leef, rfc5424, SyslogSink; time)

# text
seg-fe08580cd8d3 = telemetry::syslog::tests (chaînes LEEF exactes, échappement, gravité, enveloppe RFC { "5424" }, délais de livraison et reconnexion) ; tests/telemetry_cli.rs

# text
seg-3b7d744f5fd2 = une sous-affirmation est vérifiée de façon externe, mais la capacité dans son ensemble compose des éléments modélisés, de sorte que la capacité reste modélisée — Les journaux d'événements publiés du jeu de données (fenêtres attack_log), comme vérité d'événement, sous le préenregistrement xval/jammertest-trust/PREREGISTRATION.md (versionné seul, 0fa012b, avant l'exécution du harnais de test). Première et unique exécution (xval/jammertest-trust/RESULTS.md) : { "14" } dossiers sur { "24" } évaluables ({ "7" } avec brouillage), { "3,502" } époques sans brouillage et { "9,560" } avec brouillage. Probabilité de fausse alarme sur jeu réservé sans brouillage : cn0_drop_db { "0.0231" } (81/3502) contre un seuil de { "0.02" }, FAIL ; agc_k_sigma { "0.0003" }, réussi ; jam_ind_threshold { "0.0094" }, réussi ; union des trois : fausses alarmes { "0.0328" }, détection { "0.807" } contre { "0.05" } et { "0.50" }, réussi. Selon la règle enregistrée, la ligne est MODELLED (un seuil a échoué). Étroit : un seul type de récepteur (u-blox ZED-F9P), un seul événement, des créneaux planifiés d'une minute comme vérité (la détection est une borne inférieure ; sans brouillage signifie hors des fenêtres journalisées) ; calibré sur les journaux CSV, et le lecteur UBX donne plus de fausses alarmes sur deux dossiers. Les bandes du score de confiance maritime ne sont pas calibrées

# text
seg-3b0543727850 = receiver_trust::calibration (run_dataset) ; receiver_trust::monitors (MonitorConfig::profile, JAMMERTEST_2024_CALIBRATED) ; realdata::jammertest ; examples/jammertest_trust_calibration.rs

# text
seg-1a452a47b9d0 = tests/receiver_trust_jammertest_calibration.rs::the_recorded_calibration_reproduces (ignoré, conditionné aux données par KSHANA_JAMMERTEST_DIR : la sélection enregistrée, les comptes sur jeu réservé, les verdicts de seuil et le verdict) ; receiver_trust::calibration::tests (horodatages, appariement des fenêtres et décalage de fuseau horaire, étiquettes, bandes de garde, exclusion, sélection) ; receiver_trust::monitors::tests::threshold_profile_is_opt_in

# text
seg-b0810b04ec30 = une sous-affirmation est vérifiée de façon externe, mais la capacité dans son ensemble compose des éléments modélisés, de sorte que la capacité reste modélisée — Les nombres de créneaux du plan par domaine d'essai (créneaux { "76" }, { "77" } et { "45" }, dont { "61" }, { "63" } et { "32" } émettent) ont été comptés indépendamment avec un script sur le même JSON ; les fenêtres attack_log du jeu de données { "2024" } comme vérité d'événement, sous xval/jammertest-score/PREREGISTRATION.md (versionné seul, c2e6d3b, avant l'exécution de l'évaluateur). Première et unique exécution (xval/jammertest-score/RESULTS.md) : la règle enregistrée de données minimales FAILED ({ "4" } fenêtres de brouillage évaluables provenant de { "4" } dossiers UBX sur { "12" }, contre un minimum de { "10" } fenêtres provenant de { "2" } dossiers : { "5" } dossiers écartés par la règle de référence de base, { "3" } journaux UBX ne portent que le temps GPS de la semaine), de sorte que les seuils B1 à B4 ne sont pas évaluables ; rien n'a été assoupli ni ré-exécuté. v2 (xval/jammertest-score/PREREGISTRATION-v2.md, versionné seul, traitement des données uniquement : journaux à temps GPS seul placés à partir de la date, les { "12" } dossiers CSV seuls, une session de plateforme mobile pour les rovers mobiles ; mêmes seuils et même règle de données minimales) : { "14" } dossiers sur { "24" } conservés mais { "7" } fenêtres de brouillage évaluables, règle de données minimales échouée de nouveau, aucun seuil évaluable (RESULTS-v2.md). Vérité planifiée : un créneau prévu n'est pas un enregistrement d'émission, un échec peut être un test qui ne s'est jamais exécuté, une latence est comptée depuis le début prévu, et sans brouillage signifie hors des créneaux prévus. La détection par des moniteurs du domaine des mesures ne dit rien d'un leurre de faible puissance. Un seul type de récepteur (u-blox ZED-F9P). Le jeu de données NMEA SimulaMet { "2025" } n'est pas utilisé (aucune licence indiquée, accès sur abonnement)

# text
seg-bf0fa5e2343c = jammertest::plan (parse_catalog, parse_plan, import, import_attack_log, events_toml) ; jammertest::score (score_run) ; jammertest::dataset (run_dataset) ; jammertest (score_log, score_pack) ; examples/jammertest_score_2024.rs

# text
seg-cf2f1a572c34 = tests/jammertest_plan_roundtrip.rs (conditionné aux données par KSHANA_JAMMERTEST_PLAN_DIR : nombres de créneaux par domaine d'essai du plan { "2025" }, identifiants de catalogue, aller-retour TOML) ; tests/jammertest_score.rs (un journal synthétique avec une chute connue : détectée, manquée, non évaluable, exécution à fausse alarme, paquet signé portant la fiche de score) ; jammertest::plan::tests ; tests/jammertest_score_2024.rs (conditionné aux données par KSHANA_JAMMERTEST_DIR : l'exécution enregistrée)

# text
seg-c70f3f97d479 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Références vérifiées par rapport à un index de titres extrait par script des documents publics cités, lus le 2026-10-10 (tests/compliance_references.rs). CE QUI EST VÉRIFIÉ : { "49" } références citées à une clause, section, un paragraphe ou un titre existent dans le document cité, et { "7" } URL citées ont abouti à la date enregistrée ({ "2" } par une seconde voie) ; les contrôles négatifs échouent. CE QUI NE L'EST PAS : qu'une paraphrase, une correspondance ou un écart soit correct ; les clauses d'EN { "16803" } (payantes, texte de catalogue seulement) ; les révisions ultérieures ; l'index n'est pas une implémentation indépendante.

# text
seg-bf1156de0226 = compliance

# text
seg-af47f52e5c9e = tests/compliance_report.rs::mapping_is_well_formed ; tests/compliance_report.rs::wording_rule_holds_in_mapping_report_and_docs ; tests/compliance_report.rs::empty_set_evidences_nothing ; tests/compliance_report.rs::statuses_follow_the_runs_present ; tests/compliance_references.rs

# text
seg-ce743c3eca62 = IntegrationRun

# text
seg-1729005fdd5c = exercé contre une véritable application hôte ; une exécution d'intégration n'est pas une référence indépendante — CE QUI EST VÉRIFIÉ, énoncé étroitement : que ces intégrations fonctionnent avec les véritables logiciels pour lesquels elles sont écrites. Les PREUVES sont versionnées dans integrations/signalk/evidence/README.md (avec ses fichiers JSON) et integrations/opencpn/evidence/README.md (avec ses captures d'écran et journaux), chacune avec le script qui la reproduit. ({ "1" }) Signal K : le greffon chargé dans le paquet npm signalk-server { "2.33.0" } figé, dans un espace de noms réseau privé en bouclage seul, alimenté par des données synthétiques. Les propres interfaces REST et WebSocket du serveur ont montré les chemins publiés, les métadonnées de score, et une notification qui est passée par absente, warn, alarm, normal (après le maintien) puis de nouveau warn lorsque les données se sont arrêtées. Avec le véritable kshana exécuté par le greffon sur le NMEA reçu par le serveur lui-même, la notification est passée de warn à alarm et la position rapportée a été publiée ; le navigation.position propre au serveur était écrit par son fournisseur NMEA, jamais par le greffon. Ré-exécuté avec le schéma JSON live { "1.2" }. ({ "2" }) OpenCPN : le greffon compilé avec l'en-tête de l'API de greffons d'OpenCPN et wxWidgets { "3.2.4" }, chargé dans le paquet Ubuntu { "24.04" } d'OpenCPN { "5.8.4" } sous un affichage virtuel ; OpenCPN l'a chargé, a exécuté son initialisation et lui a transmis les phrases PKSHT du flux filtré, et le panneau est devenu rouge sur la bande non fiable. Dans une exécution propre, la position propre du navire d'OpenCPN a cessé de se mettre à jour, et son indicateur de position a chuté, lorsque le filtre a marqué la position comme invalide. Une seconde exécution alimentée directement par l'écouteur TCP du filtre a montré une livraison au greffon mais pas un avant-après net. ({ "3" }) Les tests du relais rejouent un extrait enregistré du flux filtré à travers un véritable socket TCP et vérifient ce que reçoit un consommateur (les octets inchangés, des sommes de contrôle valides sur chaque phrase y compris celles réécrites, GGA et RMC concordants, un PKSHT par cycle avec le champ du filtre là où la position est invalide), et le script de bout en bout vérifie qu'un consommateur de l'écouteur du filtre reçoit exactement les octets que le même filtre écrit sur la sortie standard. ({ "4" }) Les analyseurs PKSHT (JavaScript et C++) sont exécutés sur des phrases enregistrées à partir de la sortie de kshana et rejettent une somme de contrôle erronée, une version erronée ou un score hors de { "0" } à { "100" }. ({ "5" }) Les unités systemd sont vérifiées avec systemd-analyze verify (systemd { "255" }, binaires remplacés par des bouchons) et avec des garde-fous contre un shell dans ExecStart, la politique de redémarrage et les clés du bac à sable ; la gestion des arguments du point d'entrée du conteneur est vérifiée avec un binaire bouchon. CE QUI NE L'EST PAS : il n'existe aucune référence indépendante pour aucune valeur que ces intégrations montrent. Les valeurs de confiance elles-mêmes sont les lignes ci-dessus, et une exécution d'intégration montre seulement que la plomberie les transporte ; c'est pourquoi cette ligne est MODELLED et non VALIDATED (docs/VALIDATION.md). Aucun navire réel, récepteur, exécution longue, autre version d'un des deux hôtes, autre système d'exploitation ou bureau n'a été utilisé ; toutes les données sont du texte synthétique et rien ici n'est une mesure. Le traitement sonore et visuel de la notification par un véritable client Signal K, le bouton de barre d'outils d'OpenCPN, les préférences et l'état obsolète, et le paquetage pour le gestionnaire de greffons d'OpenCPN n'ont pas été exercés. Les clés du bac à sable systemd n'ont été vérifiées que pour la syntaxe, sans exécution sous un systemd actif, et la construction de l'image de conteneur et son contrôle de santé n'ont ici aucune preuve versionnée. Aucun chiffre de détection ou de fausse alarme n'est revendiqué. Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) : l'opérateur reste responsable de la navigation du navire.

# text
seg-5614947f4e8e = receiver_trust (live: the gate, its TCP listener, PKSHT) ; en dehors du crate : integrations/signalk (JavaScript), integrations/opencpn (relais JavaScript, greffon natif C++), deploy/reference-build (unités systemd, conteneur)

# text
seg-e917651d5c45 = tests/receiver_trust_live_cli.rs (le filtre et son écouteur TCP, côté Rust) ; integrations/signalk/test/adapter.test.js, integrations/signalk/test/model.test.js et integrations/signalk/test/plugin.test.js ({ "24" } tests Node sur une sortie synthétique enregistrée) ; integrations/opencpn/test/relay.test.mjs ({ "5" } tests Node) ; integrations/opencpn/test/e2e-live.mjs (le véritable binaire vers un consommateur TCP, exécuté à la main et en CI) ; integrations/opencpn/plugin/test/pksht_test.cpp et integrations/opencpn/plugin/test/trust_state_test.cpp (contrôles C++ de l'analyseur PKSHT et de l'état du panneau) ; deploy/reference-build/check-units.sh et deploy/reference-build/test-entrypoint.sh

# text
seg-efccd283c368 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Cohérence interne par rapport à une vérité injectée et à des formes closes, sous des seuils préenregistrés à 6b68f6cc (docs/design/evidence/boc-bump-jump/). Un signal de données BeiDou B1C (PRN { "19" }, { "5" } MS/s) généré par iq::scene : avec l'option désactivée, un départ sur pic latéral reste faussement verrouillé au ±({ "0.5" } + d/4) chip prédit (mesuré ±{ "0.549" }) ; avec elle activée, un saut vers le pic principal à { "0.08" } s et un RMS de fenêtre tardive de { "0.0008" } chip à { "45" } dB-Hz et de { "0.0048" } chip à { "35" } dB-Hz ; aucun saut depuis le pic principal à { "35" }, { "40" } et { "45" } dB-Hz sur { "4" } s ; la pente EMLP mise à l'échelle de { "0.94" } à { "0.99" } sur le signal échantillonné (non mise à l'échelle de { "3.6" } à { "3.8" }). Le détecteur de saut de bosse seul, sur des triplets de corrélateurs avec la covariance de bruit exacte de BOC({ "1,1" }), n'a produit aucun faux saut en { "100 000" } mises à jour de { "25" } à { "45" } dB-Hz et a détecté { "1000" } départs sur pic latéral sur { "1000" } à { "35" } dB-Hz. NOT MET (constat F1) : la grille préenregistrée de tests unitaires pour la mise à l'échelle comprend des décalages hors du domaine linéaire des discriminateurs, où les lectures mises à l'échelle manquent le décalage jusqu'à { "48" } %. CE QUI N'EST PAS VÉRIFIÉ : IQ de terrain, étages d'entrée à bande limitée, répliques composites MBOC/QMBOC et tout récepteur externe.

# text
seg-729d14cb230a = iq::track::boc (BocKind, BocTracking, BumpJump, boc11_dll_scale) ; iq::track::channel (les prises de saut de bosse et Channel::bump_jumps)

# text
seg-ac14fcbe3119 = tests/iq_boc_bump_jump.rs (b1_b2_b3_side_peak_and_false_jumps_on_the_iq_chain, b4_scaling_on_the_sampled_signal, b5_false_jump_rate_and_detection_at_correlator_level) ; tests unitaires de iq::track::boc (b4_unit_grid_misses_are_the_recorded_ones : le seuil B4 de test unitaire préenregistré conservé tel qu'écrit, ses échecs enregistrés affirmés comme constat F1)

# text
seg-d2d08312c05d = une sous-affirmation est vérifiée de façon externe, mais la capacité dans son ensemble compose des éléments modélisés, de sorte que la capacité reste modélisée — Données mesurées sous des seuils préenregistrés à b6ccb499 (xval/scint-malindi/) : enregistrement Zenodo { "16941224" } (INGV, Malindi, { "18" } mars { "2023" }, GPS PRN { "26" }, intensité et phase de porteuse à { "50" } Hz, CC BY { "4.0" }, SHA-256 vérifié). { "22" } fenêtres de { "60" } s admissibles (N1 atteint). MET : la distribution d'intensité (Kolmogorov-Smirnov D { "0.0415" }, seuil { "0.05" }) et la scintillation de phase liée à S4 (sigma-phi mesuré/modèle médian { "0.779" }, seuil 2/3 à 3/2). NOT MET (constat F1) : la fraction d'évanouissements profonds du modèle est { "2.38" } fois la mesurée (seuil { "0.5" } à { "2" }) et son évanouissement moyen { "3.51" } fois plus long (seuil 2/3 à 3/2). Constat F2 : le traitement enregistré lit la phase enroulée du modèle, ce qu'un contrôle interne a révélé ; B3 répété a posteriori avec la phase déroulée donne { "0.804" }. CE QUI N'EST PAS VÉRIFIÉ : d'autres nuits, stations, latitudes ou signaux ; le bruit du récepteur dans le modèle. La ligne reste MODELLED.

# text
seg-371e708b8b8f = iq::channel::scint (Scintillation, ScintParams) ; realdata::scint50 (parse_log, segments, measured_windows, model_windows, compare)

# text
seg-0e1032d7c879 = tests/iq_scint_malindi_measured.rs (cornell_model_verdict_is_the_recorded_one, le verdict enregistré affirmé tel qu'enregistré, constat F1 ; finding_model_fades_are_deeper_and_longer_than_measured ; posthoc_b3_with_the_model_phase_unwrapped, rapporté seulement ; conditionné aux données, récupérées par scripts/fetch_scint_malindi.sh) ; tests unitaires de realdata::scint50 (model_data_through_the_harness_shows_the_wrapped_phase_finding, constat F2)

# text
seg-16578e7dd2fe = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Forme close, sous des seuils préenregistrés à 3724aefa (docs/design/evidence/acq-cfar/). La probabilité de fausse alarme CA-CFAR pour des cellules Gamma(M), par rapport à une simulation de Monte-Carlo du modèle exact : { "18" } cas sur { "18" } à moins de { "3" } sigma binomiaux. Sur chaque cellule des recherches iq::acq (GPS L1 C/A, { "2.5" } MS/s, { "210 000" } cellules chacune) à { "1" } % de conception : { "0.977" } % et { "0.969" } % sur bruit gaussien et { "1.006" } % et { "0.999" } % sur bruit quantifié sur 2 bits (M = { "1" } et { "4" } ; seuil plus ou moins { "20" } %) ; décisions inchangées lorsque l'entrée est mise à l'échelle. NOT MET (constat F1) : sur un signal sans bruit quantifié sur 2 bits, la détection et sa cellule sont correctes, mais { "1.28" } % des cellules hors pic de la ligne du pic (seuil { "1" } %) dépassent le seuil, aux lobes secondaires de corrélation déterministes du code. CE QUI N'EST PAS VÉRIFIÉ : d'autres variantes de CFAR, des fenêtres bidimensionnelles, des étages d'entrée à bande limitée, des données de terrain.

# text
seg-98c86c10352b = iq::acq (CfarConfig, ca_cfar, ca_cfar_cells, ca_cfar_pfa, ca_cfar_alpha)

# text
seg-7b8247a4ca76 = tests/iq_acq_cfar.rs (c1_closed_form_matches_monte_carlo_of_the_exact_model, c2_false_alarm_rate_on_gaussian_noise, c3_false_alarm_rate_on_two_bit_noise, c5_decisions_do_not_depend_on_the_input_scale ; c4_noise_free_two_bit_signal_verdict_is_the_recorded_one, le verdict enregistré affirmé tel qu'enregistré, constat F1, figé par finding_noise_free_sidelobes_exceed_the_cfar_rate) ; test unitaire de iq::acq ca_cfar_closed_form_reduces_to_the_textbook_case_and_inverts

# text
seg-7bd7522eabed = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Documents de contrôle d'interface publiés et formes closes, sous des seuils préenregistrés à 5806f28b (docs/design/evidence/spectrum-bands/) : GLONASS ICD édition { "5.1" }, BDS-SIS-ICD B1I { "3.0" }, B1C { "1.0" }, B2a { "1.0" } et B3I { "1.0" }, Galileo OS SIS ICD numéro { "2.1" }. MET : chaque porteuse, cadence de code et puissance reçue tels que transcrits ({ "28" } canaux GLONASS), premiers zéros du BPSK à la cadence de code, le composite B1C égal à MBOC(6,1,1/11) comme le donne le tableau de puissance de son ICD, l'identité du chemin C/N0, et des scénarios de spectre identiques octet pour octet. NOT MET : le seuil d'aire unitaire, qui était inatteignable tel qu'écrit (constat F1 ; les aires égalent la fraction en bande en forme close), et la concordance par intervalle des formes d'onde B1I et B1C de la couche IQ avec l'enveloppe du modèle ({ "1.26" } et { "1.56" } dB contre { "0.5" } dB, constat F2 ; GLONASS { "0.07" } dB), parce que les codes de Gold et de Weil ont des spectres de raies inégaux ; moyennés sur la bande, les lobes principaux concordent à { "0.25" } dB près. CE QUI N'EST PAS VÉRIFIÉ : IQ enregistré, autres signaux, interférence intra-système.

# text
seg-3e8c364433b7 = spectrum (default_band, MORE_BAND_NAMES, GLONASS_CHANNELS)

# text
seg-e24276b8b422 = tests/spectrum_more_bands.rs (s1_new_bands_carry_their_icd_values, s2_nulls_and_b1c_parts, s4_cn0_paths_agree_on_the_new_bands ; s2_closed_form_densities_verdict_is_the_recorded_one, constat F1, figé par finding_s2_areas_are_the_closed_form_in_band_fraction ; s3_iq_layer_verdict_is_the_recorded_one, constat F2, figé par finding_s3_per_bin_errors_follow_the_code_line_spectrum ; posthoc_s3_band_averaged_shape, rapporté seulement)

# text
seg-07554505b56b = une sous-affirmation est vérifiée de façon externe, mais la capacité dans son ensemble compose des éléments modélisés, de sorte que la capacité reste modélisée — LSIS-AFS V1.0 (comme ci-dessus) : la séquence de Legendre de longueur 1499 (tableau E-1, identique) et les { "24" } premiers et derniers chips tertiaires (tableaux E-2 à E-6 : { "419" } colonnes sur { "420" } identiques ; le document imprime les mêmes { "24" } derniers chips, A14850, pour PRN { "147" } et PRN { "151" } et le générateur reproduit ceux de PRN { "151" }, de sorte que l'entrée de PRN { "147" } est très probablement une coquille ; le seuil de { "420" } sur { "420" } est NOT MET et l'échec est figé) ; l'exemple chiffré de la figure { "8" } du code SB1 (un seul exemple : 0x045 s'encode en 0x229F61DBB84A0) ; CRC-24Q par rapport à la valeur de contrôle du catalogue 0xCDE703 pour l'ASCII { "123456789" } ; l'arithmétique de trame propre au document. Seuils préenregistrés à b3ba5d5. Un échec enregistré et un seul exemple chiffré pour la couche de message, de sorte que la ligne reste MODELLED. CE QUI N'EST PAS VÉRIFIÉ : LDPC et les mots CRC dans les sous-trames { "2" } à { "4" }, le contenu des messages, et tout flux enregistré

# text
seg-010ad441a092 = iq::lunanet_afs; iq::signals::lunanet (afs_q_tertiary_bits, afs_q_overlay_bits, afs_q_tiered); surface (lunanet_afs_check_spec, lunanet_afs_check_symbols, lunanet_afs_generate)

# text
seg-2d72ec7c3695 = tests/lunanet_afs_codes.rs (b4_legendre_1499_matches_and_tertiary_codes_match_except_one_printed_column, the_spec_check_reports_every_bar_and_pins_the_b4_miss) ; iq::lunanet_afs::tests (sb1_round_trips_every_field_and_corrects_flipped_symbols, generated_streams_pass_and_damage_is_found) ; tests/lunanet_afs_cli.rs

# text
seg-3a9a9d15186c = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Aucune référence externe pour les résultats de scénario : chaque test du paquet exécute un type de scénario MODELLED. Les seuils sont le profil énoncé par l'auteur du paquet (le cadre du DHS n'énonce aucune valeur ; les limites de précision de l'OMI sont le tableau C-1 de MSC.1/Circ.1575, lu en entier ; le paquet de l'OACI suit la présentation du plan d'atténuation des RFI de l'OACI elle-même, car le Doc { "9849" } est une publication payante et n'a pas été lu), versionnés avant toute exécution évaluée dans des fichiers PREREGISTRATION.md de style xval sous standards/. Un seuil MET dit qu'un scénario modélisé a atteint un seuil énoncé, et rien sur un produit

# text
seg-662887e17adb = standards_pack ; compliance (faits du paquet de normes dans compliance-report)

# text
seg-e2d8a0f6daa5 = tests/standards_packs.rs (pinned_outcomes : l'état de chaque test, y compris les échecs L4-T1 et les quatre tests de précision de l'OMI) ; standards_pack::tests

# text
seg-37b0efd0a7e5 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Aucune référence externe : le paquet relie des empreintes et un score de journal de récepteur MODELLED, vérifié sur des données synthétiques (le NMEA exporté d'un scénario fourni traité comme le journal du récepteur). Aucune exécution en laboratoire n'est revendiquée

# text
seg-012acc12567b = evidence::roundtrip, evidence::assemble, interop::testbench (write_conditions_json), iq::campaign::conditions

# text
seg-b92c6dde9c2b = tests/round_trip_pack.rs (pack_links_scenario_conditions_log_and_score_and_verifies, conditions_that_disagree_with_the_scoring_events_are_refused, a_stated_log_hash_that_does_not_match_is_refused, published_schema_names_every_field_the_engine_writes)

# text
seg-e9bde2e0a342 = une sous-affirmation est vérifiée de façon externe, mais la capacité dans son ensemble compose des éléments modélisés, de sorte que la capacité reste modélisée — GNSS-SDR { "0.0.19" } (GPL-3.0-or-later, le paquet Ubuntu { "24.04" }, exécuté comme un programme distinct ; seuls les nombres dérivés sont versionnés) poursuivant les mêmes enregistrements numpy (indépendants du moteur), les deux mesurés par rapport à la vérité analytique. Seuils préenregistrés à 48edd4a5, modifiés avant tout enregistrement de test à 1e4288c4 (un FLL de { "10" } Hz pendant l'accrochage seulement dans les deux récepteurs, après l'échec de l'étalonnage enregistré sur une mauvaise transmission de GNSS-SDR, constat F3). MET à { "30" }, { "35" }, { "40" } et { "45" } dB-Hz : gigue de porteuse à { "4.3" } % près, gigue de code à { "4.6" } % près et moyenne et dispersion Doppler de ceux de GNSS-SDR. NOT MET : le C/N0 NWPR du moteur se lit { "2.3" } à { "7.1" } dB sous le SNV de GNSS-SDR (constat F4, la limite connue du NWPR ; son M2M4 est à { "0.06" } dB de la vérité) ; les indicateurs de verrouillage de phase diffèrent par définition (F5) ; à { "30" } dB-Hz, GNSS-SDR a décroché deux fois et le moteur non (F6). La propre transmission de GNSS-SDR s'est verrouillée sur une mauvaise fréquence dans { "3" } exécutions d'étalonnage sur { "30" }. CE QUI N'EST PAS VÉRIFIÉ : d'autres signaux, l'effacement des bits de données, la ré-acquisition, les enregistrements de terrain. La ligne reste MODELLED.

# text
seg-d9eab5e90d10 = iq::track (Channel, LoopCore, design) ; iq::cli::track

# text
seg-a99bb0c28b00 = tests/iq_track_gnss_sdr_oracle.rs (calibration_passes_for_both_receivers, registered_bars_give_the_recorded_verdict, recorded_numbers_are_pinned), sur des nombres dérivés par tests/fixtures/iq_track_gnss_sdr_oracle/make_fixture.py

# text
seg-5d76e6627df0 = vérifié par rapport à une implémentation distincte de ce même code source — indépendante de l'unité testée, mais sans autorité externe — Un recalcul numpy indépendant (xval/crpa-jamming/oracle.py, sans code partagé : vecteurs de pointage numpy, numpy.linalg.solve et inv) de chaque maillon de la géométrie de la démonstration de brouillage avec un réseau carré à 4 éléments, sous les deux pondérations. Seuils préenregistrés à 08d83b4d. MET : A1 (les { "150" } résultats de scénario identiques octet pour octet sans la section, après une correction : la première version avait ajouté les unités crpa au tableau d'unités de chaque exécution de brouillage), A2 (un élément égale l'absence de réseau à { "1e-12" } dB près), A3 sur le gain de bruit du réseau et le C/N0 effectif ({ "912" } pondérations de liaison à { "1e-9" } dB près, pire { "2.1e-14" } dB) et sur le nul du brouilleur en annulation dirigée (sous -200 dB des deux côtés), A4 (MVDR à { "0.1" } dB de l'annulation dirigée à un JNR de { "80" } dB). NOT MET : A3 sur le gain de brouilleur MVDR, { "194" } liaisons sur { "456" } au-delà de { "1e-9" } dB avec les mathématiques portables { "0.36" } ({ "202" } avec les mathématiques de l'hôte ; docs/revisions/STUDIO15-batch4-rebaseline.md) (pire { "1.7e-6" } dB) sur des résidus de -100 à -188 dB, où l'annulation en float64 limite les deux implémentations (inv et solve de numpy sont en désaccord entre eux sur { "169" } liaisons, pire { "7.9e-7" } dB) ; le C/N0 effectif qu'elles alimentent n'est pas affecté. CE QUI N'EST PAS VÉRIFIÉ : le couplage mutuel, la disparité des éléments, le traitement large bande, les brouilleurs multiples, tout matériel d'antenne. Un recalcul des mêmes équations, et non une référence indépendante ; la ligne reste MODELLED.

# text
seg-6c01cedc4ca7 = jamming (CrpaCfg, crpa_weights, run_jamming) ; crpa (null_steering_weights, mvdr_weights, covariance)

# text
seg-efdc3da9e0ad = tests/jamming_crpa.rs (a1_crpa_units_only_with_the_section, a2_one_element_is_no_array, a3_verdict_is_the_recorded_one, a4_mvdr_tends_to_the_null_at_high_jnr), par rapport à xval/crpa-jamming/expected.json issu de xval/crpa-jamming/oracle.py

# text
seg-400cb0737968 = vérifié par rapport à une implémentation distincte de ce même code source — indépendante de l'unité testée, mais sans autorité externe — Un recalcul numpy indépendant (xval/jamming-terrain/oracle.py, sans code partagé : sa propre lecture de .hgt, interpolation bilinéaire, aller-retour WGS { "84" }, profil, bombement, nu et J(nu)) de dix placements de brouilleur autour d'un récepteur au bassin de Badwater sur la tuile SRTM réelle versionnée tests/fixtures/terrain/N36W117_sub6.hgt. Seuils et placements préenregistrés à 92cd2bfd. Tous MET : additivité (les { "150" } résultats de scénario identiques octet pour octet sans la section) ; les points de profil et l'obstacle de chaque placement égaux et nu et perte à { "1.6e-10" } près (seuil { "1e-9" }) ; la perte ne monte jamais quand le brouilleur s'élève de { "2" } à { "4902" } m ; la perte abaisse chaque J/S exactement de sa valeur et de rien d'autre ; J(nu) à { "1e-12" } dB de celui de la référence. Constats : les placements de l'autre côté des monts Black et Funeral perdent de { "44" } à { "48" } dB ; deux placements au fond de la vallée perdent { "8" } et { "15" } dB par le seul bombement de la Terre à des hauteurs d'antenne de { "2" } m, le cas rasant du modèle à une seule arête. CE QUI N'EST PAS VÉRIFIÉ : toute propagation mesurée, la diffraction à arêtes multiples, la réflexion au sol, l'encombrement, l'erreur propre du MNT. Un recalcul du même modèle, et non une référence indépendante ; la ligne reste MODELLED.

# text
seg-05b174fab8a1 = jamming_terrain (TerrainCfg, jammer_terrain, knife_edge_loss_db) ; jamming (run_jamming_sky)

# text
seg-5adec86a588b = tests/jamming_terrain.rs (b1_terrain_units_only_with_the_section, b2_every_placement_matches_the_independent_numpy_recomputation, b3_the_loss_never_rises_as_the_jammer_rises, b4_the_loss_reaches_every_js_and_nothing_else, b5_the_knife_edge_function_matches_the_reference_expression), par rapport à xval/jamming-terrain/expected.json issu de xval/jamming-terrain/oracle.py

# text
seg-db6e518a15d1 = vérifié par rapport à une implémentation distincte de ce même code source — indépendante de l'unité testée, mais sans autorité externe — Un recalcul Python indépendant de chaque indicateur d'acquisition (xval/jamming-acq-agc/hysteresis.py) à partir du C/N0 effectif par époque du moteur, une simulation de Monte-Carlo numpy indépendante de la perte du quantificateur (xval/jamming-acq-agc/quantiser_mc.py, sa propre recherche du pas optimal, { "2" }^{ "22" } échantillons), et la boucle de CAG de la couche IQ. Seuils préenregistrés à 70c72fcc, avec un jeu d'exécutions supplémentaire fixé à { "37793290" }. MET : additivité (les { "150" } résultats de scénario identiques octet pour octet sans les sections) ; chaque indicateur égal sur les exécutions supplémentaires ({ "1824" } liaisons, dont { "732" } montrant l'hystérésis) ; monotone en fonction du seuil ; la perte du quantificateur à { "0.0007" } dB de la simulation de Monte-Carlo de { "1" } à { "4" } bits (seuil { "0.02" } dB) ; la lecture de CAG à { "0.012" } dB de la boucle de CAG (seuil { "0.05" } dB). NOT MET : les exécutions d'hystérésis enregistrées (démonstration de brouillage de { "10" } à { "30" } dBW) n'étaient pas informatives, toutes les liaisons étant perdues, et leurs H2 et H4 ne sont atteints que trivialement. Constat : avec un brouilleur CW, un CAN à 1 bit perd environ { "5" } dB de plus que la valeur gaussienne que le moteur applique, et est signalé comme non valide. CE QUI N'EST PAS VÉRIFIÉ : la recherche d'acquisition elle-même, la dynamique de CAG dans le temps, tout matériel de récepteur. Des recalculs du même modèle, et non une référence indépendante ; la ligne reste MODELLED.

# text
seg-0417fac0e7e2 = jamming_rx (AcquisitionCfg, AcqState, FrontEndCfg, front_end) ; jamming (run_jamming_sky) ; iq::frontend::quant (optimum_step_sigma)

# text
seg-ca7aa6592c0d = tests/jamming_acq_agc.rs (h1_g1_units_only_with_their_section, h2_no_hysteresis_is_no_hysteresis, h2s_no_hysteresis_is_no_hysteresis_on_the_supplementary_runs, h3_flags_match_the_independent_recomputation, h3s_flags_match_the_independent_recomputation_on_the_supplementary_runs, h4_monotone_in_the_acquisition_threshold, h4s_monotone_in_the_acquisition_threshold_on_the_supplementary_runs, g2_quantiser_loss_matches_the_independent_monte_carlo, g3_agc_reading_matches_the_iq_layer_agc_loop), par rapport à xval/jamming-acq-agc/expected_hysteresis.json, expected_hysteresis_s1.json et expected_quantiser.json

# text
seg-19788df00e45 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Cohérence interne par rapport à une vérité injectée : une source GPS L1 C/A synthétique sans données (PRN { "13" }, { "1500" } Hz, { "4.1" } MHz, { "8" } s, dix graines de bruit) dont la phase de porteuse est connue, sous des seuils préenregistrés à 58789af0 (docs/design/evidence/fll-handover-floor/). MET : le témoin (la valeur par défaut sans plafond ne transmet jamais la main dans { "9" } graines sur { "10" } à { "33" } dB-Hz) ; additivité (empreinte par défaut et tests de poursuite existants inchangés) ; accrochage d'une transmission décalée de { "100" } Hz à { "45" } dB-Hz. NOT MET : avec un plafond de { "1.0" } s, transmission et maintien dans chaque exécution ({ "16" } sur { "20" } à { "33" } dB-Hz, { "8" } sur { "20" } à { "31" } dB-Hz ; les autres alternent entre transmissions forcées et retour du FLL) et gigue de phase à { "25" } % de celle du PLL seul ({ "10.8" } contre { "6.1" } degrés à { "33" } dB-Hz). CE QUI N'EST PAS VÉRIFIÉ : les bits de données, d'autres signaux et fréquences d'échantillonnage, les enregistrements de terrain. La valeur par défaut est inchangée ; la ligne reste MODELLED.

# text
seg-80753cdc89bc = iq::track (LoopConfig, FllGate, design) ; iq::track::channel (la porte du FLL)

# text
seg-96b2276484ed = tests/iq_fll_handover_floor.rs (registered_bars_give_the_recorded_verdict, d1_the_key_is_part_of_the_hash_only_when_set, d4_the_capped_design_pulls_in_a_100_hz_handoff_error), sur tests/fixtures/fll_handover_floor/results.csv

# text
seg-0718b0c21f9b = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Aucune référence externe : aucun fichier produit par RTKLIB n'a été lu, et la disposition des colonnes provient du manuel de RTKLIB. Vérifié sur des fichiers écrits par nos soins seulement ; la conversion ECEF réutilise frames::ecef_to_geodetic, qui a ses propres lignes

# text
seg-e322b10ec19c = receiver_trust::machines::rtklib (read_rtklib_pos) ; receiver_trust::LogFormat::RtklibPos

# text
seg-b5f5f47b5608 = receiver_trust::machines::rtklib::tests (époques lat/lon, semaine/TOW et ECEF, dms refusé, entrée hostile) ; tests/receiver_trust_machines.rs::rtklib_pos_runs_as_a_receiver_log ; integrations/gnss_lib_py/test_bridge.py

# text
seg-32c8918c596c = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Aucune référence externe comme seuil de réussite. Les dispositions de champs et le CRC suivent la documentation publique OEM7 (docs.novatel.com) ; la routine de CRC a été vérifiée une fois par rapport au CRC que la documentation indique pour son propre exemple BESTPOSA (cité, non reproduit). Les jeux de test sont écrits par nos soins ; aucun journal d'un récepteur réel n'a été lu

# text
seg-97eac8ec4604 = receiver_trust::machines::novatel (read_novatel, novatel_crc32) ; receiver_trust::LogFormat::Novatel

# text
seg-d935af6c8c6a = receiver_trust::machines::novatel::tests (CRC figé, enregistrements ASCII et binaires, mauvais CRC ignoré, entrée hostile) ; tests/receiver_trust_machines.rs::novatel_jammer_flag_reaches_the_receiver_self_report

# text
seg-9fd8d7111160 = vérifié par rapport à une implémentation distincte de ce même code source — indépendante de l'unité testée, mais sans autorité externe — ReferenceImpl dans un contrôle ponctuel, et non un test de la suite : le décodeur de pyrtcm { "1.2.0" } lit les mêmes trames écrites par nos soins jusqu'au même C/N0 et au même temps d'époque. Il partage la source de ses tables avec ce lecteur, de sorte qu'il vérifie le traitement des bits, et non la disposition. Aucune capture d'un récepteur réel ou d'une station de base n'a été lue

# text
seg-d151880c7268 = receiver_trust::machines::rtcm3 (read_rtcm3, crc24q) ; receiver_trust::LogFormat::Rtcm3

# text
seg-68a47a4f7e3f = receiver_trust::machines::rtcm3::tests (valeur de contrôle du catalogue CRC-24Q, C/N0 MSM4/MSM7 et fusion d'époques, temps GLONASS et correspondance des identifiants SBAS, mauvais CRC et autres messages)

# text
seg-15841bb986fe = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Aucune référence externe : les noms de champs proviennent de la documentation de GNSS-SDR ; ni le lecteur ni relay.py n'ont été exécutés avec un GNSS-SDR actif ou une capture réelle

# text
seg-a2c51966ce9e = receiver_trust::machines::gnss_sdr (read_gnss_sdr_monitor) ; receiver_trust::LogFormat::GnssSdr

# text
seg-696b76cdaf9a = receiver_trust::machines::gnss_sdr::tests ; integrations/gnss-sdr/example.jsonl

# text
seg-b101c8376109 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Aucune référence externe : l'ajustement est vérifié sur des journaux synthétiques à bruit blanc de coefficients connus, le cap sur des journaux à vitesse de lacet constante. Aucun journal d'IMU réel n'a été ajusté, et q_aa n'est pas ajusté

# text
seg-2977aaca1688 = receiver_trust::machines::imu, imu_fit ; surface::imu_fit ; scenario [log.imu]

# text
seg-10715c98eaae = receiver_trust::machines::imu::tests ; receiver_trust::machines::imu_fit::tests (coefficients de bruit blanc connus retrouvés à { "10" } % près, refus, le TOML s'analyse comme AccelCfg) ; tests/receiver_trust_machines.rs (accord et désaccord du cap, porteuse en ligne, imu_fit)

# text
seg-93283b08d1f9 = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Aucune référence externe : les paquets ont été lus par un écouteur en bouclage écrit pour le test, et non par un véritable courtier, et Home Assistant n'a pas été exécuté

# text
seg-6ad9867cec5c = telemetry::mqtt (discovery, state_json, connect_packet, publish_packet, MqttSink) ; surface::TelemetryFormat::Mqtt

# text
seg-21059291ea8b = telemetry::mqtt::tests (octets des paquets, courtier en bouclage, courtier mort compté) ; tests/receiver_trust_machines.rs::trust_telemetry_mqtt_text_has_discovery_then_state

# text
seg-4f354fdb164b = vérifié par rapport à sa propre identité analytique en forme close — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante — Aucune référence externe : le nœud ROS n'a pas été exécuté sur un graphe ROS { "2" } actif, et les noms de champs de ublox_ubx_msgs n'ont pas été vérifiés avec un pilote en fonctionnement. gnss_lib_py (MIT) a été exécuté pour le test du pont

# text
seg-f94e58f3479b = integrations/ros2/kshana_trust (bridge.py, trust_node.py) ; integrations/gnss_lib_py/kshana_gnss_lib_py.py

# text
seg-8c92f36d0227 = tests/receiver_trust_machines.rs (rtklib_pos_runs_as_a_receiver_log : le format qu'écrit le pont gnss_lib_py, passé par receiver-trust) ; les tests Python des ponts sont integrations/ros2/kshana_trust/test/test_bridge.py (pont avec un moteur factice), integrations/ros2/kshana_trust/test/test_engine_integration.py (la véritable roue évalue une position stable comme nominale et un saut de { "1.1" } km comme non fiable) et integrations/gnss_lib_py/test_bridge.py (véritable gnss_lib_py { "1.1.0" } et la roue), exécutés avec pytest, et non par cargo

# text
seg-e7d71a9d77a6 = { "208" } capacités étiquetées MODELLED.

# text
seg-7a0503f925c1 = <s1>Précédent</s1>Référence des capacités

# text
seg-b5832e94f926 = <s1>Suivant</s1>Affirmations face à la réalité

# text
seg-1103199f019b = La section facultative [receiver] de lunar-station-coverage (LRS-02) : sigma de multitrajet dépendant de l'élévation sigma(el) = a + b exp(-el / el0) à l'utilisateur et à la station (la forme fonctionnelle aéroportée RTCA DO-229, ses a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } deg comme valeurs par défaut ; sur la Lune chaque valeur est ILLUSTRATIVE), blanc à l'utilisateur et de Gauss-Markov du premier ordre sur les époques à la station (rho = exp(-dt / tau)) ; bruit thermique de code de DLL avance-moins-retard sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))) ; biais inter-canaux par canal constants sur un essai, à l'utilisateur et à la station. Les termes de station entrent dans ses corrections, les termes utilisateur dans les mesures brutes et corrigées, chacun sur son propre flux à graine fixée. En son absence, chaque document est inchangé

# text
seg-13b0ae9a874a = L'entrée facultative orbit_err_growth_m_per_s de lunar-station-coverage (LRS-03) : une correction appliquée latency_s après son calcul manque la croissance g latency_s de l'erreur d'orbite diffusée, g isotrope de taux RMS 3D, tirée par satellite et par essai sur son propre flux à graine fixée (taux 1-sigma en distance tau / sqrt({ "3" })), en plus de la reprojection de l'erreur figée sur la ligne de visée. En son absence, chaque document est inchangé. Un additif K5 à la comparaison aux affirmations publiées, préenregistré seul, exécute K5 à { "0.001" }, { "0.01" } et { "0.1" } m/s (ILLUSTRATIFS)

# text
seg-27b8c06d7d01 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Identités en forme close et auto-cohérence : la variance du quantificateur uniforme step²/12, la propagation exacte de covariance (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ se réduisant à σ·PDOP pour des σ égaux, le transfert { "1" }:{ "1" } du terme de levé comme conséquence de û_user ≈ û_ref, et la fermeture en quadrature à la désactivation. Le recoupement PDOP avec orbit::dop partage la matrice normale [−û, { "1" }], de sorte que c'est un contrôle de cohérence, étiqueté comme tel plutôt que comme une référence indépendante. Aucun ExternalDataset n'est disponible ni revendiqué : aucune station de surface lunaire n'a de précision de levé publiée, aucune liaison de correction différentielle lunaire n'a de latence ou de format de message publiés, et le résultat de quantification est une forme close plutôt qu'une mesure. RTKLIB — déjà la référence indépendante de code externe pour le noyau à simple différence et aux moindres carrés pondérés — pourrait être piloté avec une base délibérément mal levée pour confirmer le transfert { "1" }:{ "1" } du levé, mais c'est du code indépendant sur la même algèbre de ligne de visée au premier ordre. LES ORDRES DE GRANDEUR SONT MODELLED : la valeur par défaut du levé est l'allocation de réalisation du référentiel lunaire propre à cette crate plutôt qu'une station mesurée, la latence et le nombre de bits sont des entrées ILLUSTRATIVES, et la croissance du VECTEUR d'erreur d'éphéméride diffusée lui-même n'est pas du tout modélisée — énoncé dans la chaîne de la loi de vieillissement émise, parce que c'est le terme le plus susceptible de dominer une liaison réelle

# text
seg-37f07885bbf0 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Arithmétique recalculée par un script numpy indépendant sur des cas exportés (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" } ; préenregistré dans tests/fixtures/lunar_station/PREREGISTRATION.md, commité seul dans 9caedf97 avant le premier passage) : sur { "20" } cas avec chaque terme d'erreur activé, les ensembles visibles et l'état sont identiques, les erreurs de distance brutes concordent à { "1.4e-14" } m près, les vecteurs et amplitudes d'erreur de position à { "1.4e-9" } m près contre un seuil de { "1e-6" } m, et le p95 de chaque point est égal à numpy.percentile bit à bit ; les corrections de station ont MANQUÉ leur seuil de { "1e-9" } m (pire cas { "3.73e-9" } m, { "15" } cas sur { "20" }), et avec elles les erreurs de distance corrigées : vérifié en arithmétique à 60 chiffres, les deux côtés sont à l'arrondi en double précision de la valeur exacte, le terme de levé étant une différence de deux distances de { "1e7" } m dont l'unité de dernier rang est { "1.86e-9" } m ; consigné, non ajusté. Le type de scénario se réduit exactement au type de scénario lunar-differential-pnt à un point, une époque et un essai. Le modèle d'erreur, le modèle de décorrélation et chaque seuil sont propres à ce projet ou ILLUSTRATIFS ; rien ici ne constitue une déclaration sur un système réel

# text
seg-3c6a533c15dc = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Le sigma en forme close du terme de croissance et le contrôle de propagation au premier ordre (InternalConsistency). L'addendum K5 (tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md, préenregistré seul dans 59d88248) : K5 échoue à chaque taux, p95 corrigé en 3-D { "369.8" } m, { "2315" } m et { "22797" } m contre un seuil de { "1.5" } m ({ "292.96" } m consigné sans croissance), comme énoncé avant le passage. Aucune source publique ne donne de taux de croissance lunaire : ILLUSTRATIF

# text
seg-5242a1ecb1f9 = vérifié par rapport à une implémentation distincte dans ce même code source — indépendante de l'unité testée, mais sans autorité externe — Un programme scipy/numpy indépendant intègre les mêmes équations variationnelles (seuil O1). Rien n'est comparé à une mesure d'une orbite lunaire. La référence indépendante vérifie la numérique de formules énoncées, non la physique, de sorte que la ligne reste MODELLED. Modèle restreint à trois corps : pas de Soleil, pas d'harmoniques lunaires, l'axe de rotation de la Terre le long de la normale à l'orbite, entrées de récepteur et de station ILLUSTRATIVES.

# text
seg-546d8034c488 = vérifié par rapport à une implémentation distincte dans ce même code source — indépendante de l'unité testée, mais sans autorité externe — Identités en forme close et voie indépendante du dépôt, sans référence externe indépendante revendiquée. La conception de Helmert — la seule nouvelle dérivée du module — est redérivée par différence finie centrale de lunar_frame_realise::apply_helmert, un chemin ne partageant aucune expression avec la forme analytique. L'accumulation qu'elle compose est celle de lunar-vlbi-fim, dont la jacobienne est différenciée par différences finies par rapport à lunar_vlbi::vlbi_delay_s là-bas, et dont le noyau d'algèbre linéaire est ancré séparément en externe par rapport à numpy dans tests/fim_observability_reference.rs — cette ligne n'emprunte aucun de ces statuts. La référence de physique est structurelle plutôt que numérique : une dérivée partielle de retard de balise est la DIFFÉRENCE en champ proche de deux vecteurs unitaires quasi parallèles, de sorte que la direction de translation la moins bien déterminée DOIT être la direction solidaire du corps vers la Terre, et le test vérifie la réponse calculée par rapport à la direction mesurée séparément. MESURÉ : sigma de translation issu de la campagne { "6.3975" } m contre l'erreur de récupération de { "0.3125" } m du scénario à transformation injectée (plus serré de { "20.5" }×), alors que la rotation et l'échelle vont dans l'AUTRE sens, plus lâches de { "2.32" }× et { "13.5" }× — le chemin injecté suppose un seul sigma isotrope et répartit donc son erreur uniformément sur sept paramètres, ce que l'observable de retard ne fait pas. Rang 7/7 mais conditionnement de { "3.8e5" }, avec une direction { "99.57" } % de translation pure vers la Terre et quarante fois pire que toute autre. CE QUE CETTE LIGNE NE REVENDIQUE PAS : que le chiffre de campagne soit juste en valeur absolue. Elle établit que le chiffre DÉRIVE désormais d'un calendrier, d'une géométrie et d'un modèle d'erreur plutôt que d'une réponse plantée. Reste ReferenceImpl/MODELLED : il n'existe aucun couple publié campagne-plus-covariance de datum en VLBI lunaire, le réseau de stations et le sigma de retard sont des entrées ILLUSTRATIVES (le catalogue de balises est sourcé, la campagne ne l'est pas), les observations sont traitées comme indépendantes alors que la troposphère et l'horloge d'une session réelle sont corrélées entre balayages voisins, et l'éphéméride, les horloges, la troposphère et les paramètres d'orientation de la Terre sont tenus FIXES. { "0.30" } comparaison externe, un constat (reste MODELLED) : avec chaque ligne de jacobienne de balise reconstruite à partir des temps de lumière NAIF SPICE (DE440, ITRF93, MOON_ME ; préenregistré { "50863551" }), le calendrier, le rang de Helmert, les sigmas de datum (à { "4.7e-3" } près), le conditionnement, la direction la plus faible ({ "0.07" } deg), le balayage de libration et l'ordre des arcs concordent sur six scénarios à { "1" } % / { "0.2" } / { "0.05" } deg préenregistrés près. NumPy sur la jacobienne du moteur commitée concorde à { "3e-14" } près là où les stations sont fixes. Avec les stations estimées, il diffère de { "6.8e-6" } contre un { "1e-9" } préenregistré, dont la prémisse sur le conditionnement était fausse (conditionnement de Helmert { "2.1e8" } ; les voies NumPy indépendantes divergent de { "3e-6" } ; une contribution du repli sur pseudo-inverse de { "1e-9" } du moteur n'est pas exclue), de sorte que la ligne n'est pas promue sur ce préenregistrement. { "0.36" } renouvellement d'enregistrement à un seuil mis à l'échelle du conditionnement (préenregistré b887eb05 ; t = max({ "1e-12" }, { "10" } kappa { "2" }^-53) à partir du conditionnement de l'information conjointe et de sa réduction de Helmert), un constat (reste MODELLED, NOT MET) : l'étape { "0" } exclut le repli sur pseudo-inverse comme cause de l'écart de { "6.8e-6" } (aucune matrice en amont de la matrice de Helmert ne se replie sur les six scénarios d'origine, marge la plus serrée d'un facteur { "2.6" }), la branche SPICE tient toujours sur les six, et NumPy concorde dans le seuil sur six scénarios sur huit (défaut, les deux arcs, le sigma de retard 3x, le défaut colinéaire et le nouveau passage à stations fixes au 2026-12-01 ; pire cas { "0.13" } de son seuil). Il échoue sur stations_estimated (sigmas de datum jusqu'à { "6.8e-6" }, conditionnement { "9.1e-6" }, norme de l'indépendance écartée { "3.5e-6" }, contre t = { "5.9e-7" }), et à la nouvelle date la balise du pôle sud n'a aucune observation, de sorte que l'information de balise est déficiente en rang (repli sur pseudo-inverse en amont de la matrice de Helmert dans les deux nouveaux scénarios) et que la référence NumPy inchangée ne peut pas évaluer stations_estimated_fresh (matrice singulière). Résultats : docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md

# text
seg-6613341c6bc0 = une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée — Référence : les affirmations numériques de cinq sources publiques enregistrées avec URL, date de récupération, SHA-256 et licence dans tests/fixtures/lunar_station/SOURCES.md (arXiv:2602.08432v3 ; diapositives de l'IOAG Cislunar PNT Workshop { "2025" } et { "2026" } ; UNOOSA ICG WG-B Lunar PNT, juin { "2024" }), transcrites avec références de pages dans tests/fixtures/lunar_station_published/CLAIMS.md. Les seuils, les cas et les entrées ont été préenregistrés dans tests/fixtures/lunar_station_published/PREREGISTRATION.md (révision { "2" }, 05bf9a19, commité seul avant le passage). { "0.36" } premier passage, un constat (reste MODELLED) : { "1" } seuil sur { "6" } est satisfait. La couverture est de { "0.00" } sur les deux cercles contre >= { "0.95" }, et l'erreur p95 corrigée en 3-D est de { "280.6" } m ({ "300" } km), et de { "293.0" } m à une latence de { "600" } s, contre <= { "1.5" } m. Le seuil décimétrique (K4) ne pouvait pas être satisfait au bruit de code de { "0.30" } m des sources, ce qui reflète un conflit entre les sources plutôt qu'un résultat du modèle. K6 est satisfait (rapport { "1.39" } contre <= { "1.5" }), mais comme rapport de deux chiffres dominés par la géométrie, il ne constitue un élément de preuve sur la décorrélation dans aucun sens. Cause : les éléments orbitaux des satellites ne sont pas publics, et sur les éléments ILLUSTRATIFS du dépôt, un utilisateur et la station partagent quatre satellites au-dessus de { "5" } deg dans seulement { "8.2" } % ({ "300" } km) et { "6.3" } % ({ "600" } km) des époques, à une géométrie quasi singulière (p95 non corrigé de { "3.8" } km contre < { "10" } m pour les sources). Les simulations des sources utilisaient un filtre, une contrainte de hauteur et trois satellites en vue commune, ce que le type de scénario instantané ne modélise pas. La comparaison ne confirme donc ni ne réfute le « sub-métrique sur tout le pôle sud » publié. Elle montre que le résultat de ce modèle dépend d'orbites qui ne sont pas publiées. Ne constitue pas une déclaration sur un système réel ; sans affiliation ni aval d'aucune agence

# text
seg-6cf381ac2e3d = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Cohérence interne : limites en forme close et monotonie du modèle de diversité, forme close du plafond nuageux, et identités de coupure log-normales. AUCUNE référence externe indépendante n'est revendiquée et aucune n'a été comparée : aucun relevé mesuré de disponibilité de station sol optique ou de ligne de visée sans nuage n'est utilisé. POURQUOI MODELLED : le climat nuageux (probabilité de nuage, médiane et dispersion de la colonne d'eau liquide, durées de coupure), l'indépendance des nuages et de la turbulence, la forme de copule gaussienne, la longueur de décorrélation et chaque gain de technique sont des hypothèses ; les scénarios fournis énoncent des climats ILLUSTRATIFS, non un jeu de données. Faire passer cette ligne à un statut supérieur exige un relevé de disponibilité mesuré cité et un seuil enregistré avant la comparaison

# text
seg-8efc76b4ee1d = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Cohérence interne seulement : chaque site ajouté est un point distinct et une mesure laser de distance ou un retard VLBI de station fixe touche un seul point, de sorte que son information A_p^T M_p A_p est semi-définie positive et s'ajoute ; le test vérifie la différence de Fisher et chaque variance par rapport à cela. Le résultat à cinq réseaux est la ligne de données réelles existante et est inchangé. Le réflecteur ajouté réutilise des époques planifiées pour les cinq réseaux existants, un calendrier ILLUSTRATIF, et le réseau, le calendrier et le sigma de retard de la balise ajoutée sont les entrées ILLUSTRATIVES de la campagne de référentiel lunaire ; le site est une position polaire sud ILLUSTRATIVE. Un site polaire sud voit la Terre bas sur son horizon ou pas du tout, ce que les tests d'angles de visée existants expriment ; aucun des deux sites n'est télémétré en continu. Les chiffres sont des bornes de Cramér-Rao pour un jeu de paramètres réduit, non un datum résolu et non une déclaration sur une station réelle

# text
seg-af88df24ce81 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Cohérence interne seulement : le temps jusqu'au seuil obtenu par bissection est vérifié par rapport à l'inverse en forme close du type de bruit dominant de l'horloge, et le terme d'horloge libre par rapport au terme d'horloge propre du bilan. Les classes d'horloge reposent sur des spécifications publiées à un jour (leurs propres lignes) ; le taux du LTC n'est pas redérivé ici et conserve sa propre ligne VALIDATED (Temps coordonné lunaire) ; le résiduel d'asservissement est ILLUSTRATIF, le résiduel de réalisation est une allocation de bilan et aucun modèle thermique n'est inclus. L'objectif de l'ordre de la nanoseconde décrit dans la documentation Lunar PNT de l'ICG WG-B de juin { "2024" } est cité comme une déclaration de source, non adopté comme une affirmation ; rien ici ne constitue une déclaration sur une horloge de station réelle

# text
seg-bfee8a9a8b64 = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Surfaces en forme close (InternalConsistency) : le creux de la sphère nue, un cratère dans un plateau sur la sphère avec un observateur sur son centre et hors de son centre, et un cône analytique par rapport à sa propre rastérisation. Sur le recadrage réel, un lancer de rayons numpy indépendant (scripts/gen_lunar_terrain_ref.py, numpy { "2.5.3" } ; préenregistré dans tests/fixtures/lunar_terrain/PREREGISTRATION.md, commité seul dans edbb9b02 avant que le script n'existe) concorde sur cinq sites : hauteurs de site à { "1.0e-11" } m près et les { "1800" } élévations d'horizon à { "5.5e-10" } deg près contre des seuils de { "1e-6" }, comptes de rayons tronqués exacts ; cela vérifie l'arithmétique, non le terrain. Aucun chiffre publié d'horizon ou d'éclairement polaire n'a été reproduit : le recadrage fourni de { "1200" } m lisse le relief sous-kilométrique que les études d'éclairement publiées résolvent, de sorte que les horizons du MNT sont une ligne de visée MODELLED sur un MNT réel rééchantillonné, non un horizon validé. Le site de la station et la constellation restent ILLUSTRATIVES ; rien ici ne constitue une déclaration sur un système réel

# text
seg-f55331e7b5af = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — La réduction instantanée et les cas en forme close du solveur (InternalConsistency). L'addendum (tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md, préenregistré seul dans 001ca100) avec une contrainte de hauteur de { "1" } m, trois satellites et une fenêtre de 6 époques (réglages ILLUSTRATIFS ; les sources indiquent un filtre, une contrainte de hauteur et trois satellites mais pas leurs réglages) : K1 à K5 échouent et K6 est satisfait, { "1" } sur { "6" } comme dans le passage consigné ; l'erreur p95 corrigée en 3-D de R300 passe de { "280.6" } m à { "2.11" } m (horizontale { "0.90" } m, non notée) et la couverture reste à { "0" }. L'hypothèse d'indépendance de la fenêtre la favorise. Ne constitue pas une déclaration sur un système réel

# text
seg-f7719057f56b = vérifié par rapport à sa propre identité analytique (en forme close) — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe indépendante — Formes closes et statistiques des propres tirages du modèle (InternalConsistency) : la formule du DLL par rapport à un calcul à la main, la forme DO-229, la différence à ligne de base nulle de deux récepteurs, la corrélation de décalage 1 de Gauss-Markov. Il n'existe aucune mesure de trajets multiples lunaires ou de récepteur à laquelle comparer ; les valeurs sont ILLUSTRATIVES et rien ici ne constitue une déclaration sur un récepteur réel
