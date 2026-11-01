# docs--kind-hybrid: translations (fr)

# text
seg-03442e4be82d = Fiche technique CSAC Microchip SA65 / SA.45s sigma_y(1s)={ "3e-10" }

# text
seg-f4cf8b629797 = Page thématique : <a1>INTEGRITY.md</a1>

# text
seg-98151954f217 = false

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
seg-7b2721b7588d = Type de scénario du moteur v{ $version }, famille <a1>Capteurs inertiels, de fusion et quantiques</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

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
seg-195347c63a8a = m/s^{ "2" }

# text
seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

# text
seg-cc7a61264c3f = (m/s^{ "2" })^2/s

# text
seg-e0633b308e4e = <b>MODELLED</b> Un filtre de Kalman empilé unique sur la position, la vitesse, la phase et la fréquence de l'horloge, alimenté par des pseudodistances qui couplent position et horloge (mises à jour sous forme de Joseph portant la covariance croisée) ; une variante à 1 DOF augmentée d'un biais d'accéléromètre constant s Tests : <a1>fusion_coupled_filters.rs</a1>.

# text
seg-451a304052c4 = <b>MODELLED</b> Accéléromètre à interféromètre à atomes froids à partir des premiers principes (k_eff·T², QPN). Référence indépendante (ExternalDataset) : vecteurs numériques publiés d'articles primaires sur le CAI (fonction de transfert de Cheinet { "2008" } ; sensibilité de Peters/Freier) : k_eff·T² concorde exactement, ASD du bruit de grenaille un plancher unilatéral à ~{ "2" }× de chaque instrument publié (les dispositifs réels portent un bruit technique au-dessus du plancher quantique). Un encadrement, et non une parité. { "0.30" } tour { "2" } (préenregistré fcb9ac64), un constat (reste MODELLED) : le bruit de rotation limité au seul QPN face au Gauguet et al. mesuré.

# text
seg-9955b1b1c018 = La performance des capteurs inertiels quantiques est MODELLED, et non validée : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-5fef5e8cc64e = La résilience de l'estime inertielle quantique est MODELLED, et non validée : vérifiée par rapport à une implémentation distincte de cette même base de code — indépendante de l'unité testée, mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Page de famille : <a1>Capteurs inertiels, de fusion et quantiques</a1>

# text
# c1: docs/kinds/by-kind/hybrid.md
seg-d91dc5633e67 = Source : <c1/>

# text
# c1: hybrid
seg-3b43d9c5624d = <c1/> (type de scénario)

# text
seg-22cd963c7042 = Pierre angulaire du PNT hybride : horloge + IMU + aide par transfert de temps.

# text
# c1: scenarios/hybrid-pnt.toml
seg-166be08d5276 = Une exécution de <c1/> se résume ainsi : scenario f33d734ecc51 | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "0.998" } security n/a (no attack) | classical PNT-holdover 350s (t 6600s/p 350s) integrity { "1.000" } security n/a (no attack)

# text
seg-5a70fcb097dc = Champs facultatifs : aucun

# text
# c1: scenarios/hybrid-pnt.toml
seg-f33278986879 = L'exemple <c1/> définit, entre autres :

# text
seg-7bebd09c614b = Navigation-grade quartz accelerometer (Honeywell QA-2000 / G

# text
seg-4f5fd1bc8a4e = Exail hybrid quantum accelerometer triad, bias stability { "5.8" }

# text
seg-49bff8dc860e = Navigation-grade quartz accelerometer (H

# attr:alt
seg-52378a7b074c = Le graphique que le moteur écrit pour scenarios/hybrid-pnt.toml, type de scénario hybrid

# text
seg-a1810bbca337 = <b>MODELLED</b> Aller-retour/TWSTFT (Sagnac), vue commune GNSS, PPP ; gigue de liaison→distance. Référence indépendante (ExternalDataset) : amplitude de Sagnac vérifiée par rapport à une VALEUR PUBLIÉE faisant autorité — N. Ashby, « Relativity in the GPS », Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), éq. { "1.29" } : un tour de l'équateur vers l'est accumule { "207.4" } ns (2ωA_E/c²) ; kshana reproduit { "207.386" } ns. Corroboré indépendamment par geodist() de RTKLIB { "2.4.3" } (Takasu, BSD-2-Clause), qui porte la même géométrie 2Aω/c². Le BIPM TWSTFT composite transpondeur/vue commune/

# text
seg-a8beb8dfc757 = Le budget d'erreur du transfert de temps est MODELLED, et non validé : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-a9c56fc9608a = Page thématique : <a1>MACHINE-INPUTS.md</a1>

# text
seg-cc86939900fe = <s1>Précédent</s1>hybrid-ukf

# text
seg-53b95026bf54 = <s1>Suivant</s1>impairment-eval
