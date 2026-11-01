# docs--kind-mission-thread: translations (fr)

seg-f942b36a11c4 = Pas encore sur GitHub

seg-be831b52a339 = et { "4" } autres dans la matrice.

seg-936e96edf423 = <b>MODELLED</b> Le type <c1/> : un document de phases, chacune d'un des huit types enregistrés, exécutées dans l'ordre avec la covariance 6x6, l'horloge et le référentiel transmis selon une règle déclarée (<c2/> ; <c3/>, bruit d'accélération blanc sur un intervalle déclaré Tests : <a1>field_units_global.rs</a1>.

seg-795e0409fa5a = <b>MODELLED</b> La phase <c1/> : l'état moyen par le propagateur de Cowell du moteur (masse ponctuelle terrestre et J2, le Soleil et la Lune comme corps tiers, la Lune issue du noyau DE440 du fil là où il couvre le segment et le Soleil issu de la sér

seg-6a26b9ab59fe = Page thématique : <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Étiquette du résultat (celle du moteur) : MODELLED

seg-e66e2ca31e54 = Page thématique : <a1>MISSION-THREAD-LUNAR.md</a1>

seg-6ba426630d7e = Source : <c1/>

seg-e2ba596c17c6 = <c1/> (type de scénario)

seg-4816ff3c82ef = Type de scénario du moteur v{ $version }, famille <a1>Fils de mission</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

seg-1ec485468daa = Budget d'erreur de navigation et de synchronisation MODELLED d'une chaîne déclarée de phases de mission, du lancement à l'entrée : lancement et ascension, rendez-vous et amarrage en orbite basse terrestre (répétable), injection trans-lunaire et croisière cislunaire, rendez-vous en orbite lunaire, descente, séjour en surface, ascension, puis retour et entrée, chaque phase étant l'un des huit types enregistrés avec ses propres capteurs et son propre filtre. La covariance 6x6, l'horloge et le référentiel sont transmis d'une phase à l'autre selon une règle déclarée (carry, inflate ou reacquire) ; les conversions de référentiel et d'échelle de temps (GCRF, MCI, MCMF, UTC, TT, TDB, LTC) sont des lignes de budget à part, avec l'état de la Lune issu d'une découpe facultative du noyau DE440 et la série analytique comme solution de repli déclarée. Une superposition facultative du réseau au sol fixe le cycle de suivi de chaque phase. Rapporte le budget par phase (1-sigma à l'entrée, au pic et à la sortie, chaque contribution avec son unité), la marge par rapport à une exigence déclarée, le maillon le plus faible, les événements et une figure chronologique. MODELLED : chaque nombre est une entrée déclarée ; la chaîne suit un seul empilement et aucun véhicule n'est modélisé. Sources publiques seulement ; sans affiliation ni aval d'aucune agence ; logiciel à titre consultatif, et non un équipement de navigation certifié.

seg-d6eb3dbb87c7 = Une exécution de <c1/> se résume ainsi : mission-thread | { "11" } phases | Artemis-class mission thread (ILLUSTRATIVE) | weakest link descent | MODELLED

seg-9bb19202a104 = Champs obligatoires : <c1/>, <c2/>, <c3/>

seg-e1faea3151d6 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-094b47cf8ae2 = L'exemple <c1/> définit, entre autres :

seg-e5d2d8da2ec0 = gcrf

seg-2468a5014f25 = utc

seg-e92b7836bae3 = 2028-01-01T00:{ "00" }:00Z

seg-ffe559d3ff23 = cruise

seg-3be4934f4f4e = plus petite marge par rapport à une exigence déclarée

seg-f32a7f31e191 = dérive inertielle, sans aide, est

seg-9fde3fc1cb5b = descent

seg-a07521d13bb4 = Le graphique que le moteur écrit pour scenarios/mission-thread-artemis-class.toml, type de scénario mission-thread

seg-423ce11b54cd = <b>MODELLED</b> La phase <c1/> : une covariance de position et de vitesse à vitesse constante avec un bruit d'accélération blanc (le niveau de l'estime), un point GNSS de précision déclarée appliqué après l'instant d'acquisition et hors des évanouissements déclarés, une horloge à biais et

seg-f393e01ac642 = <b>MODELLED</b> La phase <c1/> : l'état relatif dans les axes LVLH de la cible avec la transition de Clohessy-Wiltshire en forme analytique, une covariance de Kalman 6x6 avec un bruit d'accélération blanc et des mises à jour de position dont la variance est celle du capteur à la dis

seg-c9ff01a17f3f = <b>MODELLED</b> Le type <c1/> : un document de phases, chacune d'un des huit types enregistrés, exécutées dans l'ordre avec la covariance 6x6, l'horloge et le référentiel transmis selon. Référence indépendante (InternalConsistency) : Calculs à la main dans les tests (la croissance de la covariance en ligne droite, la rotation sidérale moyenne, le taux séculaire de l'horloge lunaire) et, pour l'état de la Lune seulement, les découpes versionnées du noyau DE440 par rapport à des valeurs JPL Horizons épinglées (au pire { "2.6" } m et { "7e-6" } m/s). Aucune donnée de mission n'est comparée avec la chaîne ; ses phases sont des lignes à part. Le document est une chaîne déclarée avec des entrées ILLUSTRATIVE, des sources publiques seulement et sans aucune cau

seg-529c9f8e8363 = <b>MODELLED</b> La phase <c1/> : une covariance de position et de vitesse à vitesse constante avec un bruit d'accélération blanc (le niveau de l'estime), un point GNSS de précision déclarée appliqué après l'instant d'acquisition et hors des évanouissements déclarés, une horloge à biais et dérive asservie par les mêmes points. Référence indépendante (InternalConsistency) : L'état stationnaire de Riccati et le calcul à la main de la prédiction dans les tests. Rien ici ne modélise un lanceur ou un récepteur ; chaque nombre est une entrée déclarée

seg-01ef16f03f02 = <b>MODELLED</b> La phase <c1/> : l'état relatif dans les axes LVLH de la cible avec la transition de Clohessy-Wiltshire en forme analytique, une covariance de Kalman 6x6 avec un bruit d'accélération blanc. Référence indépendante (InternalConsistency) : Un calcul à la main à un axe de la prédiction et de la mise à jour dans le test ; la transition de Clohessy-Wiltshire est celle que cw_dynamics vérifie par rapport à une intégration numérique indépendante. Les capteurs sont ILLUSTRATIVE et aucun rendez-vous réel n'est comparé

seg-d9a1ea509a3c = Budget d'erreur de navigation et de synchronisation MODELLED d'une chaîne déclarée de phases de mission, du lancement à l'entrée : lancement et ascension, rendez-vous et amarrage en orbite basse terrestre (répétable), injection trans-lunaire et croisière cislunaire, rendez-vous en orbite lunaire, descente, séjour en surface, ascension, puis retour et entrée, chaque phase étant l'un des huit types enregistrés avec ses propres capteurs et son propre filtre. (catalogue des types de scénario (<c1/>))

seg-80221e9351e4 = MODELLED : chaque nombre est une entrée déclarée ; la chaîne suit un seul empilement et aucun véhicule n'est modélisé. (catalogue des types de scénario (<c1/>))

seg-637296d00802 = HONNÊTETÉ. Chaque nombre ici est ILLUSTRATIVE : un chiffre rond choisi pour faire tourner la chaîne, et non la performance d'un véhicule, d'un capteur, d'une station ou d'un réseau. La chaîne suit un seul empilement comme simplification déclarée ; les changements de véhicule, les transferts d'équipage et la station en orbite lunaire ne sont pas modélisés, les orbites lunaires sont les orbites circulaires et polaires à { "100" } km que volent les types lunaires (et non l'orbite de halo quasi rectiligne), et la poussée TLI e (commentaire du fichier de scénario, lignes { "11" } à { "17" })

seg-f6574a80a60a = Le budget d'erreur de navigation et de synchronisation d'une chaîne de phases de mission du lancement à l'entrée (<c1/>) est MODELLED, et non validé : vérifié par rapport à sa propre identité analytique / en forme fermée — il détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

seg-9faba276f210 = Le lancement et l'ascension vers une orbite de stationnement avec acquisition et évanouissement GNSS (<c1/>) est MODELLED, et non validé : vérifié par rapport à sa propre identité analytique / en forme fermée — il détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

seg-20bbe2135d61 = La navigation relative jusqu'à l'enveloppe d'amarrage en orbite basse terrestre sur des segments de capteur (<c1/>) est MODELLED, et non validée : vérifiée par rapport à sa propre identité analytique / en forme fermée — elle détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

seg-c60fd7868746 = L'injection trans-lunaire et la croisière cislunaire : état moyen et covariance propagés avec des mises à jour de suivi (<c1/>) sont MODELLED, et non validés : vérifiés par rapport à leur propre identité analytique / en forme fermée — ils détectent les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

seg-c10f77a86f4d = Page de famille : <a1>Fils de mission</a1>

seg-f3279128de3b = <s1>Précédent</s1>mars-pnt

seg-2854e6a75833 = <s1>Suivant</s1>moonlight-service-volume

seg-1e77eae03d2c = <b>MODELLED</b> La phase <c1/> : l'état moyen par le propagateur de Cowell du moteur (masse ponctuelle terrestre et J2, le Soleil et la Lune comme corps tiers, la Lune issue du fil. Référence indépendante (InternalConsistency) : Le théorème de Liouville (le déterminant de la matrice de transition d'état de la partie conservative vaut un) et une différence plus fine dans les tests ; l'état moyen est comparé à une trajectoire publique dans la ligne ci-dessous, qu'il n'atteint pas. L'erreur de poussée, les mises à jour et la covariance ne sont comparées à rien
