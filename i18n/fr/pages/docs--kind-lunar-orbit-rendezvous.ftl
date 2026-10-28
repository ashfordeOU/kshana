# docs--kind-lunar-orbit-rendezvous: translations (fr)

seg-34bdcfd66ded = Dans la branche du dépôt d'où viennent ces documents ; pas encore sur GitHub

seg-f942b36a11c4 = Pas encore sur GitHub

seg-51362910dcb7 = { "2" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

seg-6a26b9ab59fe = Page thématique : <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Étiquette du résultat (celle du moteur) : MODELLED

seg-8732ad9f7e07 = <b>MODELLED</b> Le propagateur que partagent les types lunaires (GRAIL GL0660B degré et ordre { "150" }, la Terre et le Soleil comme corps tiers, relativité, orientation lunaire DE440) comparé aux trajectoires pub. Référence indépendante (ExternalDataset) : Éphémérides de véhicules spatiaux JPL Horizons pour LRO et CAPSTONE, par rapport à des seuils préenregistrés dans xval/mission-thread-lunar/PREREGISTRATION.md (amendements { "1" } à { "6" }). LRO : MET, { "33" } m de plus grand écart 3-D et { "2.4" } m RMS radial contre { "500" } m et { "60" } m. CAPSTONE : NOT MET, un écart de position finale de { "136.8" } km contre { "25" } km et un écart de périapse de { "28.4" } km contre { "10" } km, les causes n'étant pas isolées. La ligne est modélisée parce que le seuil de CAPSTON

seg-626ab55f0424 = MODELLED (résultat <c1/>)

seg-e482c9896140 = La propagation du modèle de forces lunaires par rapport à des trajectoires publiques reconstituées d'orbiteurs lunaires et cislunaires est MODELLED, et non validée : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Page thématique : <a1>MISSION-THREAD-LUNAR.md</a1>

seg-9e494e8809e5 = Source : <c1/>

seg-8beb22a0eb0b = <c1/> (type de scénario)

seg-2deefd8c547b = Navigation relative MODELLED pour un amarrage de type Orion-atterrisseur sur une orbite lunaire basse ou une orbite polaire elliptique (classe Artemis). Un chasseur et une cible volent sur la même orbite sous le modèle de forces lunaires de la crate ; une estimation conjointe par lots de Gauss-Newton à 21 paramètres sur l'arc (deux états de véhicule et des biais persistants du signal dans l'espace) fusionne un point de position absolu par véhicule issu d'un ensemble de relais ILLUSTRATIVE de classe LCNS (relais derrière la Lune écartés, quatre nécessaires, l'erreur de signal dans l'espace en mode commun s'annulant entre les véhicules) et une distance par liaison croisée, avec une précision de mesure de distance tirée de la borne de suivi de code sur le pilote AFS de LunaNet. Rapporte l'erreur de position et de vitesse relatives formelle et Monte Carlo dans les axes LVLH de la cible, la disponibilité des points, l'erreur d'estimation normalisée moyenne au carré par rapport à sa valeur attendue, et tout essai dont l'itération n'a pas convergé, la dérive due à l'omission des harmoniques de gravité, et la covariance 6x6 complète transmise. Une vérification de Hill/Clohessy-Wiltshire en forme analytique s'applique au cas circulaire. MODELLED : ensemble de relais, budget d'erreur et a priori illustratifs ; la vérité et l'estimateur partagent un même modèle de forces, de sorte que la NEES vérifie l'autocohérence et non l'erreur de modèle. Sans aval d'aucune agence ; logiciel à titre consultatif, et non un équipement de navigation certifié.

seg-a6d29fc5f19b = Une exécution de <c1/> se résume ainsi : lunar-orbit-rendezvous | llo 100x100 km | sep { "2000" } m | fixes { "74" }% | rel pos 1-sigma R/A/C 0.03/0.06/0.04 m | mean NEES { "6.51" } ({ "6" } expected) | converged at { "2000" } s (MODELLED)

seg-b7c86affeac1 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>

seg-42fe2ad9cfba = L'exemple <c1/> définit, entre autres :

seg-60bd49f09fbc = llo

seg-bf92597fdba4 = Logiciel à titre consultatif, et non un équipement de navigat

seg-4466fb6f4043 = Gauss-Newton par lots sur l'arc

seg-d97b2505ac72 = Le graphique que le moteur écrit pour scenarios/lunar-orbit-rendezvous.toml, type de scénario lunar-orbit-rendezvous

seg-7ea832b979c9 = <b>MODELLED</b> Le type et la phase <c1/> : une estimation conjointe par lots de Gauss-Newton à deux véhicules sur l'arc (vingt et un paramètres : les deux états et des biais de position persistants du signal dans l'espace, communs et indépendants), élargie sur un quart, une m Tests : <s1>mission_thread_lunar_oracles.rs</s1>.

seg-826fd7fd44b9 = <b>MODELLED</b> Le type et la phase <c1/> : une estimation conjointe par lots de Gauss-Newton à deux véhicules sur l'arc (vingt et un paramètres : les deux états et des biais de position persistants du sig. Référence indépendante (InternalConsistency) : Autocohérence sous un préenregistrement (xval/mission-thread-lunar/PREREGISTRATION.md, résultats et historique de l'estimateur dans RESULTS.md) : l'erreur d'estimation normalisée moyenne au carré de l'état relatif est de { "5.85" } à { "5.93" } contre la bande de { "5.2" } à { "6.8" } dans quatre configurations, MET à la quatrième conception d'estimateur après l'échec de trois conceptions de filtre séquentiel ; la vérité et l'estimateur partagent un même modèle de forces, ce qui ne dit donc rien de l'erreur de modèle. Le pro

seg-b2f273ea732d = Navigation relative MODELLED pour un amarrage de type Orion-atterrisseur sur une orbite lunaire basse ou une orbite polaire elliptique (classe Artemis). (catalogue des types de scénario (<c1/>))

seg-9d4f99557cc5 = MODELLED : ensemble de relais, budget d'erreur et a priori illustratifs ; la vérité et l'estimateur partagent un même modèle de forces, de sorte que la NEES vérifie l'autocohérence et non l'erreur de modèle. (catalogue des types de scénario (<c1/>))

seg-158e44d47c0b = HONNÊTETÉ : MODELLED. L'ensemble de relais, l'erreur du signal dans l'espace, la fraction de mode commun et les a priori sont des entrées ILLUSTRATIVE, et non des mesures ; la vérité et l'estimateur partagent le modèle de forces (un terme central intégré, J2 et C22). La vérification de cohérence préenregistrée B1 (NEES moyenne dans [{ "5.2" }, { "6.8" }]) est atteinte dans les quatre configurations sur la conception par lots : voir xval/mission-thread-lunar/RESULTS.md. Aucun accord avec un véhicule réel (commentaire du fichier de scénario, lignes { "10" } à { "14" })

seg-2a88a9650804 = La navigation relative jusqu'à l'amarrage en orbite lunaire (<c1/>) est MODELLED, et non validée : vérifiée par rapport à sa propre identité analytique / en forme fermée — elle détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

seg-6ac5bd1500a8 = <s1>Précédent</s1>lunar-llr-datum

seg-54b1c9200aae = <s1>Suivant</s1>lunar-station-coverage
