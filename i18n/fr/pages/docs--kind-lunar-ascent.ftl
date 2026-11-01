# docs--kind-lunar-ascent: translations (fr)

seg-f942b36a11c4 = Pas encore sur GitHub

seg-98151954f217 = false

seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

seg-6a26b9ab59fe = Page thématique : <a1>MISSION-THREAD.md</a1>

seg-f4b0bdb93d10 = Source : <c1/>

seg-b8ef47331221 = <c1/> (type de scénario)

seg-ae3053a1f6c8 = Ascension propulsée MODELLED depuis un site de surface polaire sud jusqu'à l'orbite de rendez-vous, et la covariance de position et de vitesse qu'elle reporte en orbite (classe Artemis). Le modèle d'erreur inertielle à cinq états par axe de lunar-descent (position, vitesse, biais d'accéléromètre, inclinaison d'assiette, biais de gyroscope, piloté par la force spécifique) s'exécute sur les trois axes du site à partir de l'état de surface avec lequel la phase commence ; un point de position AFS issu des relais visibles d'une constellation ILLUSTRATIVE de classe LCNS (autonome, ou différentiel avec le résidu de la liaison de correction de lunar-differential-pnt, avec l'horloge aidée lorsque seuls trois relais sont visibles) est pris à un intervalle déclaré, le temps lunaire entrant par l'horloge du véhicule et une erreur d'horodatage le long de la trajectoire. Rapporte les sources inertielles en forme analytique, la contribution de l'aide, l'ablation, les 1-sigma de navigation sur l'ascension, la dispersion à la coupure des moteurs à côté de la connaissance de navigation, et la covariance MCI 6x6 complète à l'insertion avec la corrélation position-vitesse conservée. MODELLED : classe d'IMU illustrative, force spécifique, ensemble de relais et dispersion à la coupure illustratifs ; erreurs tenues dans les axes du site de lancement ; l'état de sortie nominal est un substitut. Sans aval d'aucune agence ; logiciel à titre consultatif, et non un équipement de navigation certifié.

seg-fc4d2ba3f99e = Une exécution de <c1/> se résume ainsi : lunar-ascent | -89.50 deg | inertial only { "785" } m / { "3.49" } m/s | with AFS { "11.4" } m / { "0.071" } m/s | insertion dispersion { "1.73" } m/s (MODELLED)

seg-9fcdb15c21eb = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-a1c3e374f512 = L'exemple <c1/> définit, entre autres :

seg-ebc18c9bcbac = différentiel

seg-3843825d0733 = us

seg-2d84b341a41f = Étiquette du résultat (celle du moteur) : MODELLED

seg-463a919e84d5 = Le graphique que le moteur écrit pour scenarios/lunar-ascent.toml, type lunar-ascent

seg-52ee53bc1cd6 = <b>MODELLED</b> Le type et la phase <c1/> : le modèle d'erreur inertielle à cinq états par axe exécuté sur une ascension propulsée avec une force spécifique le long de la trajectoire, aidé par des points AFS et le temps lunaire, qui rapporte la covariance de position et de vitesse à l'insertion trans

seg-4e0c4b02eac0 = <b>MODELLED</b> Le type et la phase <c1/> : le modèle d'erreur inertielle à cinq états par axe exécuté sur une ascension propulsée avec une force spécifique le long de la trajectoire, aidé par des points AFS. Référence indépendante (InternalConsistency) : La dérive inertielle en forme analytique et des vérifications de monotonie dans les tests. Aucune ascension réellement effectuée en vol n'est comparée

seg-8732ad9f7e07 = <b>MODELLED</b> Le propagateur que partagent les types lunaires (GRAIL GL0660B degré et ordre { "150" }, la Terre et le Soleil comme corps tiers, relativité, orientation lunaire DE440) comparé aux trajectoires pub. Référence indépendante (ExternalDataset) : Éphémérides de véhicules spatiaux JPL Horizons pour LRO et CAPSTONE, par rapport à des seuils préenregistrés dans xval/mission-thread-lunar/PREREGISTRATION.md (amendements { "1" } à { "6" }). LRO : MET, { "33" } m de plus grand écart 3-D et { "2.4" } m RMS radial contre { "500" } m et { "60" } m. CAPSTONE : NOT MET, un écart de position finale de { "136.8" } km contre { "25" } km et un écart de périapse de { "28.4" } km contre { "10" } km, les causes n'étant pas isolées. La ligne est modélisée parce que le seuil de CAPSTON

seg-626ab55f0424 = MODELLED (résultat <c1/>)

seg-745dfc03a929 = Ascension propulsée MODELLED depuis un site de surface polaire sud jusqu'à l'orbite de rendez-vous, et la covariance de position et de vitesse qu'elle reporte en orbite (classe Artemis). (catalogue des types de scénario (<c1/>))

seg-3fd0cca78937 = MODELLED : classe d'IMU illustrative, force spécifique, ensemble de relais et dispersion à la coupure illustratifs ; erreurs tenues dans les axes du site de lancement ; l'état de sortie nominal est un substitut. (catalogue des types de scénario (<c1/>))

seg-2cfb37d39847 = HONNÊTETÉ : MODELLED. La classe d'IMU, l'alignement, la force spécifique et la dispersion à la coupure sont des entrées ILLUSTRATIVE, et non des mesures. Les erreurs sont tenues dans les axes est-nord-haut du site de lancement, sans la courbure en distance de la trajectoire, et l'état de sortie nominal est un substitut à la verticale locale du site : seule la covariance est le résultat. Aucun accord avec un véhicule réel n'est affirmé. Logiciel à titre consultatif, et non un équ (commentaire du fichier de scénario, lignes { "11" } à { "15" })

seg-6faf49cac41a = L'ascension propulsée depuis un site polaire lunaire jusqu'à une orbite d'insertion (<c1/>) est MODELLED, et non validée : vérifiée par rapport à sa propre identité analytique / en forme fermée — elle détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

seg-e482c9896140 = La propagation du modèle de forces lunaires par rapport à des trajectoires publiques reconstituées d'orbiteurs lunaires et cislunaires est MODELLED, et non validée : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Page thématique : <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1a1799e01ac4 = <s1>Précédent</s1>link-budget

seg-59d4cb995cb9 = <s1>Suivant</s1>lunar-attack-surface
