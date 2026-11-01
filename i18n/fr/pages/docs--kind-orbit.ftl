# docs--kind-orbit: translations (fr)

# text
seg-debc2f07db78 = true

# text
seg-11e8c29ecb45 = Type de scénario du moteur v{ $version }, famille <a1>Constellations, couverture et géométrie</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-a4f1e7d2041e = Page de famille : <a1>Constellations, couverture et géométrie</a1>

# text
seg-be831b52a339 = et { "4" } autres dans la matrice.

# text
seg-a8d92406e428 = Strontium optical lattice clock, space-oriented goal sigma_y

# text
seg-f70076ea4a77 = <b>VALIDATED</b> Écart-type d'Allan / modifié / d'Hadamard + identification du bruit en loi de puissance avec intervalles de confiance en χ². Référence indépendante (ExternalDataset) : NIST SP { "1065" } (Riley) / écarts-types de référence de Stable32 sur NBS14

# text
seg-5278ccdaf16f = <b>MODELLED</b> Croissance de l'erreur de dérive en forme fermée + holdover jusqu'au seuil ; classes d'horloges quantiques. Référence indépendante (ReferenceImpl) : récurrence de covariance multi-pas de clock_state (recoupement au sein de la même base de code) ; le noyau sous-jacent de variance de dérive et d'inversion du holdover est validé en externe par rapport à scipy (voir « Clock-holdover coast-variance & threshold inversion »). Les chiffres de holdover par classe au plancher de bruit rouge restent MODELLED

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> Horloge de Kalman de van Loan à 3 états (phase/fréquence/dérive), stabilisée de Joseph. Référence indépendante (ReferenceImpl) : filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), avec F via scipy.linalg.expm et Q via la matrice par blocs de Van Loan { "1978" } — une implémentation de référence indépendante qui reproduit toute la trajectoire du filtre de kshana. Cohérence entre implémentations : la physique de l'horloge et l'étalonnage d'Allan ne sont pas validés en externe, ce qui laisse cela MODELLED. { "0.30" } comparaison externe, un constat (reste MODELLED) : sur les horloges IGS finales de { "30" } s de { "11" } GPS Blo

# text
seg-b9174c70772f = <b>MODELLED</b> χ² assisté par l'horloge, RAIM, AGC, SQM fusionnés en un indice de mérite de sécurité par époque. Référence indépendante (ExternalDataset) : paramètres de scénario TEXBAT (Humphreys { "2012" }) — caractérisation, et non vecteurs figés. { "0.30" } comparaison externe, un constat (reste MODELLED) : sur JammerTest { "2024" } (Bleik ; données GPL-3.0) les moniteurs de niveau observable (khi-deux assisté par l'horloge, RAIM, échec de résolution) n'ont déclenché aucune alarme dans les { "10" } s suivant l'un des { "8" } débuts de leurrage publiés évaluables (là où la fenêtre précédant le début était propre, la première alarme est venue { "10.2" } à { "39" } s après le pu

# text
seg-e12f672ae71d = Le holdover d'horloge sans GNSS est MODELLED, et non validé : vérifié par rapport à une implémentation distincte de cette même base de code — indépendante de l'unité testée, mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-8de95b3a9229 = L'estimation de l'état de l'horloge embarquée est MODELLED, et non validée : vérifiée par rapport à une implémentation distincte de cette même base de code — indépendante de l'unité testée, mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-e4b64d7277da = La détection du leurrage est MODELLED, et non validée : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-d291f20074f0 = <b>VALIDATED</b> Rotation de la Terre à partir d'une date julienne UT1 en deux parties sur le chemin orbital, de sorte que la position dans le référentiel terrestre conserve la microseconde qu'une date en f64 simple perd (environ { "3e-9" } rad vers { "2020" }) : jd2::gmst82 (GMST de l'IAU { "1982" }, la convention TEME, sur les deux parties), cio:

# text
seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP à partir de la géométrie des lignes de visée via Q=(HᵀH)⁻¹ avec une séparation ENU locale. Référence indépendante (ExternalDataset) : DOP de gnss_lib_py { "1.0.4" } (Stanford NAV Lab) — bibliothèque indépendante, concordance à { "1e-6" } en relatif

# text
seg-53a78e98af12 = Page thématique : <a1>SKYLINE.md</a1>

# text
seg-ae15d15bf151 = Page thématique : <a1>LEO-PASS.md</a1>

# text
# c1: scenarios/
seg-99a3c57c7926 = { "7" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/orbit.md
seg-0e3518dc3ddb = Source : <c1/>

# text
# c1: orbit
seg-1428025a91e1 = <c1/> (type de scénario)

# text
seg-cb4262b66b8f = Disponibilité GNSS + DOP à partir d'une constellation orbitale (Walker / TLE / RINEX).

# text
# c1: scenarios/orbit-rinex.toml
seg-97680b4587c8 = Une exécution de <c1/> se résume ainsi : scenario bffc887db977 | 77/361 samples GNSS-nominal | best PDOP { "2.53" } pos 2.53m | quantum holdover 0s p95 6.49e-5ns integrity { "1.000" } security n/a (no attack) | classical holdover 0s p95 25.0ns integrity { "1.000" } security n/a (no attack)

# text
# c1: seed
# c2: threshold_ns
# c3: mask_deg
# c4: time
# c5: user|user_site
# c6: constellation
# c7: clock_quantum
# c8: clock_classical
seg-b3a080b98bd9 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: sigma_uere_m
# c2: constellations
# c3: epoch
# c4: export_sp3
# c5: export_omm
# c6: export_oem
# c7: skyline
seg-c818cc4f87da = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/orbit-rinex.toml
seg-364139ff447d = L'exemple <c1/> définit, entre autres :

# text
seg-d5063dda3971 = Horloge atomique à l'échelle de la puce Microchip SA.45s / SA65, sigma_y(1s)

# text
seg-799fe1216562 = { "3.04" } N: GNSS NAV DATA G: GPS

# attr:alt
seg-3b652c0da6de = Le graphique que le moteur écrit pour scenarios/orbit-rinex.toml, type de scénario orbit

# text
seg-a150aaacf072 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP à partir de la géométrie des lignes de visée via Q=(HᵀH)⁻¹ avec une décomposition ENU locale Tests : <a1>dop_reference.rs</a1>.

# text
seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry et check : une simulation de Monte-Carlo initialisée par une graine (N = { "20,000" } époques par géométrie, sigma = { "1.5" } m, graine ChaCha8 { "36" } + i) de la propre position calculée par moindres carrés itérés du moteur (pvt::solve_spp, poids unitaires, résolue à partir de la vraie position) sur Tests : <a1>uere_dop_monte_carlo.rs</a1>.

# text
seg-a3d71dd306b3 = <b>VALIDATED</b> skyline + frames::look_angles + geometry::sky_geometry : l'azimut et l'élévation géodésiques (WGS-84) d'un satellite depuis un site au sol, une table de masque azimut/élévation interpolée linéairement en azimut avec bouclage à { "360" } deg, l'ensemble visible el Tests : <a1>skyline_orekit_oracle.rs</a1>.

# text
seg-d86884be3f98 = <s1>Précédent</s1>optical-atmosphere

# text
seg-da202333ae8d = <s1>Suivant</s1>passes
