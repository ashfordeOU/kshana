# docs--kind-lunar-descent: translations (fr)

seg-f942b36a11c4 = Pas encore sur GitHub

seg-51362910dcb7 = { "2" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

seg-98151954f217 = false

seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

seg-6a26b9ab59fe = Page thématique : <a1>MISSION-THREAD.md</a1>

seg-ebc18c9bcbac = différentiel

seg-2d84b341a41f = Étiquette du résultat (celle du moteur) : MODELLED

seg-626ab55f0424 = MODELLED (résultat <c1/>)

seg-e66e2ca31e54 = Page thématique : <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1eda001180f9 = Source : <c1/>

seg-d4df5aa9b7b0 = <c1/> (type de scénario)

seg-2cd0d5385530 = Budget de dispersion à l'atterrissage MODELLED pour une descente propulsée vers un site polaire sud (classe Artemis). Par axe horizontal, un modèle d'erreur inertielle à cinq états (position, vitesse, biais d'accéléromètre, inclinaison d'assiette, biais de gyroscope) est piloté par la force spécifique de la descente ; un filtre séquentiel prend les points de position des aides activées : un point AFS issu des relais visibles d'une constellation ILLUSTRATIVE de classe LCNS (autonome, ou différentiel avec le résidu de la liaison de correction de lunar-differential-pnt, avec l'horloge aidée lorsque seuls trois relais sont visibles) et un point relatif au terrain (le comparateur TERCOM/SITAN de la crate sur un relief synthétique, ou la borne de Cramer-Rao de l'appariement d'une fenêtre d'altitude du véritable MNT polaire sud LOLA). Le temps lunaire entre par l'horloge du véhicule aux points (le décalage LTC-TT de lunar-time-offset, ou l'incertitude de sa bande publiée) et sous la forme d'une erreur d'horodatage le long de la trajectoire. Rapporte l'ellipse d'atterrissage à 3 sigma, le R95, les sources inertielles en forme analytique, la contribution de chaque aide, l'ablation de chaque combinaison d'aides, un étalonnage Monte Carlo de l'ellipse, et la covariance transmise. MODELLED : classe d'IMU, ensemble de relais, profil de descente et terme de guidage illustratifs ; la navigation sur terrain utilise un relief synthétique à une échelle en mètres terrestres ; la disponibilité AFS est d'une seule époque sur un masque plat. Sans aval d'aucune agence ; logiciel à titre consultatif, et non un équipement de navigation certifié.

seg-c6c1a8f184ed = Une exécution de <c1/> se résume ainsi : lunar-descent | -89.50 deg | inertial only 517/517 m (E/N) | with aids 7.6/4.8 m | dispersion R95 { "51" } m | 3-sigma ellipse { "64" } x { "62" } m | { "99.1" }% inside (expect { "98.9" }%) (MODELLED)

seg-dfdb7de68515 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>

seg-bff1ab352267 = L'exemple <c1/> définit, entre autres :

seg-8073ece4c900 = Le graphique que le moteur écrit pour scenarios/lunar-descent.toml, type de scénario lunar-descent

seg-d5da9ee3c152 = <b>MODELLED</b> Le type et la phase <c1/> : un modèle d'erreur inertielle à cinq états par axe (position, vitesse, biais d'accéléromètre, inclinaison, biais de gyroscope) sur une descente propulsée, aidé par des points AFS (autonomes ou différentiels, avec le cas à trois relais aidé par l'horloge

seg-bfe4c0a04288 = <b>MODELLED</b> Le type et la phase <c1/> : un modèle d'erreur inertielle à cinq états par axe (position, vitesse, biais d'accéléromètre, inclinaison, biais de gyroscope) sur une descente propulsée,. Référence indépendante (InternalConsistency) : La dérive inertielle en forme analytique, les résultats propres des types réutilisés et l'étalonnage de l'ellipse à 3 sigma (la fraction à l'intérieur concorde avec ce qui est attendu) dans les tests. Aucun atterrissage réel ou testé n'est comparé

seg-ed286f215c96 = Budget de dispersion à l'atterrissage MODELLED pour une descente propulsée vers un site polaire sud (classe Artemis). (catalogue des types de scénario (<c1/>))

seg-c1bd92ba429b = MODELLED : classe d'IMU, ensemble de relais, profil de descente et terme de guidage illustratifs ; la navigation sur terrain utilise un relief synthétique à une échelle en mètres terrestres ; la disponibilité AFS est d'une seule époque sur un masque plat. (catalogue des types de scénario (<c1/>))

seg-85714bc3cf2a = HONNÊTETÉ : MODELLED. La classe d'IMU, le profil de descente, l'ensemble de relais, l'erreur du signal dans l'espace et le terme de guidage sont des entrées ILLUSTRATIVE, et non des mesures. Le mode de navigation sur terrain utilise le relief synthétique autonome et une échelle en mètres terrestres, de sorte que le terme de terrain ici est le comportement du comparateur sur un substitut, et non un énoncé sur le relief polaire sud : la variante lola-crlb (lunar-descent-lola.toml) utilise le véritable (commentaire du fichier de scénario, lignes { "14" } à { "20" })

seg-3eb1b3b03600 = Le budget de dispersion à l'atterrissage sur un site polaire lunaire (<c1/>) est MODELLED, et non validé : vérifié par rapport à sa propre identité analytique / en forme fermée — il détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

seg-2b8455001710 = <s1>Précédent</s1>lunar-beacon

seg-ca9b68783354 = <s1>Suivant</s1>lunar-differential-pnt
