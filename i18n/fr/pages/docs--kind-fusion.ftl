# docs--kind-fusion: translations (fr)

# text
seg-03442e4be82d = Fiche technique CSAC Microchip SA65 / SA.45s sigma_y(1s)={ "3e-10" }

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } scénarios fournis utilisent ce type de scénario ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-f4cf8b629797 = Page thématique : <a1>INTEGRITY.md</a1>

# text
seg-98151954f217 = false

# text
seg-be831b52a339 = et { "4" } autres dans la matrice.

# text
seg-f70076ea4a77 = <b>VALIDATED</b> Écart-type d'Allan / modifié / d'Hadamard + identification du bruit en loi de puissance avec intervalles de confiance en χ². Référence indépendante (ExternalDataset) : NIST SP { "1065" } (Riley) / écarts-types de référence de Stable32 sur NBS14

# text
seg-5278ccdaf16f = <b>MODELLED</b> Croissance de l'erreur de dérive en forme fermée + holdover jusqu'au seuil ; classes d'horloges quantiques. Référence indépendante (ReferenceImpl) : récurrence de covariance multi-pas de clock_state (recoupement au sein de la même base de code) ; le noyau sous-jacent de variance de dérive et d'inversion du holdover est validé en externe par rapport à scipy (voir « Clock-holdover coast-variance & threshold inversion »). Les chiffres de holdover par classe au plancher de bruit rouge restent MODELLED

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> Horloge de Kalman de van Loan à 3 états (phase/fréquence/dérive), stabilisée de Joseph. Référence indépendante (ReferenceImpl) : filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), avec F via scipy.linalg.expm et Q via la matrice par blocs de Van Loan { "1978" } — une implémentation de référence indépendante qui reproduit toute la trajectoire du filtre de kshana. Cohérence entre implémentations : la physique de l'horloge et l'étalonnage d'Allan ne sont pas validés en externe, ce qui laisse cela MODELLED. { "0.30" } comparaison externe, un constat (reste MODELLED) : sur les horloges IGS finales de { "30" } s de { "11" } GPS Blo

# text
seg-e12f672ae71d = Le holdover d'horloge sans GNSS est MODELLED, et non validé : vérifié par rapport à une implémentation distincte de cette même base de code — indépendante de l'unité testée, mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-8de95b3a9229 = L'estimation de l'état de l'horloge embarquée est MODELLED, et non validée : vérifiée par rapport à une implémentation distincte de cette même base de code — indépendante de l'unité testée, mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-e4b64d7277da = La détection du leurrage est MODELLED, et non validée : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
# c1: docs/kinds/by-kind/fusion.md
seg-4de09fe367df = Source : <c1/>

# text
# c1: fusion
seg-53e498cffeba = <c1/> (type de scénario)

# text
seg-7b2721b7588d = Type de scénario du moteur v{ $version }, famille <a1>Capteurs inertiels, de fusion et quantiques</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-ec26df467b88 = PNT par fusion de capteurs à filtre de Kalman conjoint sur les mêmes entrées hybrides.

# text
# c1: scenarios/fusion-pnt.toml
seg-25708bf88728 = Une exécution de <c1/> se résume ainsi : scenario c8eac911bbe0 | fused | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "1.000" } security n/a (no attack) | classical PNT-holdover 1330s (t 1330s/p 6600s) integrity { "0.973" } security n/a (no attack)

# text
# c1: seed
# c2: timing_spec_ns
# c3: position_spec_m
# c4: time
# c5: gnss
# c6: resync
# c7: clock_quantum
# c8: clock_classical
# c9: accel_quantum
# c10: accel_classical
seg-dba20bb12cda = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: coupled
seg-3d5cae65f093 = Champs facultatifs : <c1/>

# text
# c1: scenarios/fusion-pnt.toml
seg-56bca36cabba = L'exemple <c1/> définit, entre autres :

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-5d3f15c0688a = Navigation-grade quartz accelerometer; illustrative noise-dr

# text
seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

# text
seg-6ddd8a067e26 = Cold-atom accelerometer, low long-tau velocity-random-walk;

# text
seg-cc7a61264c3f = (m/s^{ "2" })^2/s

# text
seg-e79eecc14bea = Navigation-grade quartz accelerometer; i

# attr:alt
seg-c8a1c797f4b1 = Le graphique que le moteur écrit pour scenarios/fusion-pnt.toml, type de scénario fusion

# text
seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-46c0903ff7b5 = <b>VALIDATED</b> Retrouver un état d'époque [r,v] à partir des distances de stations sol au moyen d'un correcteur différentiel par lots de Gauss–Newton et d'un filtre séquentiel, sur un modèle de forces à deux corps+J2 Tests : <a1>batch_sequential_orbit_determination_reference.rs</a1>.

# text
seg-44f77aaf9d7e = <b>MODELLED</b> EKF à état d'erreur sur { "15" } états INS, une horloge de récepteur à deux états et une ambiguïté de phase de la porteuse flottante par satellite suivi ; pseudodistance, phase de la porteuse et taux de variation de distance facultatif d'une constellation Walker SGP4 (temps de lumière et Sagnac), Klobuchar et Tests : <a1>fusion_carrier_tc.rs</a1>.

# text
seg-509f93c7e9ce = <b>MODELLED</b> Trois scénarios gnss-ins sur la bibliothèque de trajectoires (un navire zigzaguant à { "8" } m/s avec une interruption de cinq minutes ; un train traversant une tranchée à deux satellites et un tunnel ; un aéronef dont l'interruption couvre un virage incliné de 25 degrés) et le facultatif du paquet Tests : <a1>gnss_ins_packs.rs</a1>.

# text
seg-e0633b308e4e = <b>MODELLED</b> Un filtre de Kalman empilé unique sur la position, la vitesse, la phase et la fréquence de l'horloge, alimenté par des pseudodistances qui couplent position et horloge (mises à jour sous forme de Joseph portant la covariance croisée) ; une variante à 1 DOF augmentée d'un biais d'accéléromètre constant s Tests : <a1>fusion_coupled_filters.rs</a1>.

# text
seg-451a304052c4 = <b>MODELLED</b> Accéléromètre à interféromètre à atomes froids à partir des premiers principes (k_eff·T², QPN). Référence indépendante (ExternalDataset) : vecteurs numériques publiés d'articles primaires sur le CAI (fonction de transfert de Cheinet { "2008" } ; sensibilité de Peters/Freier) : k_eff·T² concorde exactement, ASD du bruit de grenaille un plancher unilatéral à ~{ "2" }× de chaque instrument publié (les dispositifs réels portent un bruit technique au-dessus du plancher quantique). Un encadrement, et non une parité. { "0.30" } tour { "2" } (préenregistré fcb9ac64), un constat (reste MODELLED) : le bruit de rotation limité au seul QPN face au Gauguet et al. mesuré.

# text
seg-7e95210bcc48 = <b>MODELLED</b> Budget de position composé biais + facteur d'échelle + VRW + décroissance de stabilité sur le holdover. Référence indépendante (ReferenceImpl) : intégration SDE Monte-Carlo numpy indépendante d'un bruit d'accélération blanc doublement intégré (valide la variance VRW analytique par un algorithme réellement indépendant) + un point d'ancrage de valeur publiée de Groves { "2013" } pour les termes de biais/facteur d'échelle ; les chiffres du dispositif CAI quantifient du matériel partenaire et restent MODELLED

# text
seg-9955b1b1c018 = La performance des capteurs inertiels quantiques est MODELLED, et non validée : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-5fef5e8cc64e = La résilience de l'estime inertielle quantique est MODELLED, et non validée : vérifiée par rapport à une implémentation distincte de cette même base de code — indépendante de l'unité testée, mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Page de famille : <a1>Capteurs inertiels, de fusion et quantiques</a1>

# text
seg-a849735fcc6e = Page thématique : <a1>LEO-PNT-FUSION.md</a1>

# text
seg-c894aa7d9585 = <s1>Précédent</s1>ephemeris

# text
seg-d14a7850df1c = <s1>Suivant</s1>gnss-ins
