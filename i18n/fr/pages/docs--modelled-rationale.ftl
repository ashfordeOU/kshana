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
seg-c93f2d3a3167 = Banc d'essai de conformité d'intégrité de synchronisation — classifieur d'époques du diagramme d'intégrité de Stanford

# text
seg-712d5c35a6a6 = Classification d'époques du diagramme d'intégrité de Stanford TIB (nominal / indisponible / MI / HMI)

# text
seg-573aa0193cb3 = Banc d'essai de conformité d'intégrité de synchronisation — évaluateur de couverture d'intégrité

# text
seg-4d86f3c2d8f5 = Évaluation de couverture d'intégrité TIB (taux HMI/MI/disponibilité + verdict de couverture de surbornage)

# text
seg-372dd0fdb025 = Banc d'essai de conformité d'intégrité de synchronisation — catalogue de défauts (générateurs paramétriques)

# text
seg-2604e7cf27d2 = Menu de défauts TIB (divergence de domaine, claquage d'horloge, marche en holdover, retard statique/incrémental/symétrique/asymétrique, rejeu dans la fraîcheur, sélectif par chemin, quorum k parmi N)

# text
seg-90c0eb1e7c14 = Banc d'essai de conformité d'intégrité de synchronisation — verdict d'absorption de l'indétectable

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
seg-1103199f019b = La section facultative [receiver] de lunar-station-coverage (LRS-02) : sigma de multitrajet dépendant de l'élévation sigma(el) = a + b exp(-el / el0) à l'utilisateur et à la station (la forme fonctionnelle aéroportée RTCA DO-229, ses a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } deg comme valeurs par défaut ; sur la Lune chaque valeur est ILLUSTRATIVE), blanc à l'utilisateur et de Gauss-Markov du premier ordre sur les époques à la station (rho = exp(-dt / tau)) ; bruit thermique de code de DLL avance-moins-retard sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))) ; biais inter-canaux par canal constants sur un essai, à l'utilisateur et à la station. Les termes de station entrent dans ses corrections, les termes utilisateur dans les mesures brutes et corrigées, chacun sur son propre flux à graine fixée. En son absence, chaque document est inchangé

# text
seg-03796cb741b6 = Croissance de l'erreur d'éphéméride d'une station de référence lunaire sur la latence de correction

# text
seg-13b0ae9a874a = L'entrée facultative orbit_err_growth_m_per_s de lunar-station-coverage (LRS-03) : une correction appliquée latency_s après son calcul manque la croissance g latency_s de l'erreur d'orbite diffusée, g isotrope de taux RMS 3D, tirée par satellite et par essai sur son propre flux à graine fixée (taux 1-sigma en distance tau / sqrt({ "3" })), en plus de la reprojection de l'erreur figée sur la ligne de visée. En son absence, chaque document est inchangé. Un additif K5 à la comparaison aux affirmations publiées, préenregistré seul, exécute K5 à { "0.001" }, { "0.01" } et { "0.1" } m/s (ILLUSTRATIVE)

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
