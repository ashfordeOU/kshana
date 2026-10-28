# docs--mission-thread-lunar: translations (fr)

seg-f942b36a11c4 = Pas encore sur GitHub

seg-3b01a756c305 = Ce qu'elle calcule

seg-b478421b21bb = Source : <c1/>

seg-dbd59cc01982 = Le segment lunaire du fil de mission de classe Artemis

seg-7b56ed698c30 = Quatre types de scénario, chacun aussi un type de phase de l'interface <c1/> (<c2/>) : ils font passer un budget d'erreur de navigation et de synchronisation à travers une mission lunaire polaire sud, du rendez-vous en orbite lunaire à l'atterrissage, au séjour en surface et à l'ascension de retour en orbite. <b>Chaque nombre ici est MODELLED</b> : un modèle déclaré avec des entrées ILLUSTRATIVE, dont rien n'est un énoncé sur une mission, un système ou un site. « Classe Artemis » désigne une classe de concept de mission, rien de plus ; aucune donnée, aucun produit ni aucune caution d'une agence n'est utilisé ou revendiqué, et rien ici n'est affilié à l'une d'elles. Logiciel à titre consultatif, et non un équipement de navigation certifié. { -brand } n'émet rien et ne pilote aucun matériel.

seg-5282ad2c498a = Phase et type

seg-9b927127e042 = Scénario d'exemple

seg-40f3e1b2d58b = Noyau

seg-2cfaaa8be402 = navigation relative jusqu'à l'amarrage, polaire circulaire à { "100" } km ou polaire elliptique de { "100" } km sur { "3000" } km

seg-9ee09d63fed3 = le budget de dispersion à l'atterrissage sur un site polaire sud

seg-c4568984e75c = <c1/>, <c2/> (exige le MNT, une copie du dépôt)

seg-a098e14e6a63 = disponibilité du positionnement et de la synchronisation temporelle par site et par saison

seg-8278ae655fcc = <c1/>, <c2/> (exige le MNT, une copie du dépôt)

seg-249eff5159d0 = ascension jusqu'à l'orbite de rendez-vous et covariance reportée en orbite

seg-36184e593ade = Chaque noyau est une fonction de <c1/> ; une exécution autonome construit l'entrée par défaut (une covariance inertielle centrée sur la Lune de { "100" } m et { "0.1" } m/s, une horloge LTC d'une { "1" } microseconde) et l'époque par défaut 2028-01-01, et une exécution de fil prend l'entrée de la phase précédente. C'est le fil, et non un noyau, qui convertit les référentiels et les échelles de temps et applique la règle de transfert : un enveloppeur de phase convertit l'état d'entrée vers <c2/> (ou <c3/> pour la carte de surface) et une horloge LTC par les conversions du fil, et les lignes de conversion sont ajoutées au budget de la phase. Un référentiel ou une échelle de temps que le fil ne sait pas convertir (ITRF, par exemple) est refusé avec le message du fil ; un noyau appelé directement avec un référentiel qu'il ne peut pas utiliser le refuse en indiquant la raison. Une phase ne réinitialise jamais une covariance, elle transmet seulement celle avec laquelle elle se termine.

seg-59f4a1a2684e = Ce que fait chaque phase

seg-e112a34ef118 = Deux véhicules, un chasseur et une cible, volent sur la même orbite sous le modèle de forces lunaires de la crate (un champ de gravité et la Terre et le Soleil comme corps tiers). Une estimation par lots de Gauss-Newton sur l'arc retrouve les deux états initiaux à partir de :

seg-33bb01b1e72a = un point de position absolu par véhicule issu d'un ensemble de relais ILLUSTRATIVE de classe LCNS (relais derrière la Lune écartés, quatre nécessaires), dont la part blanche est la borne de suivi de code sur le pilote AFS (BPSK({ "5" }), { "5.115" } Mchip/s) au C/N0 déclaré multiplié par le cofacteur DOP ;

seg-b061f6742a86 = une erreur du signal dans l'espace <b>persistante</b> sur chaque point : les erreurs de relais ne se moyennent pas sur un arc de plusieurs heures, elle est donc portée comme des biais de position constants, l'un commun aux deux véhicules (<c1/> de la variance, { "0.9" } par défaut, ILLUSTRATIVE) et l'autre indépendant pour chaque véhicule. Un biais constant n'apporte aucun gain de moyennage, ce qui est la lecture prudente ;

seg-437ac74b1400 = une distance par liaison croisée issue du même signal à son propre C/N0.

seg-3513a55e44e5 = Elle rapporte l'erreur de position et de vitesse relatives formelle et Monte Carlo dans les axes locaux de la cible, la fraction d'époques avec des points sur les deux véhicules, l'erreur d'estimation normalisée moyenne au carré (NEES) de l'état relatif par rapport à sa valeur attendue de { "6" }, la dérive relative due à l'omission des harmoniques de gravité, une vérification de Hill (Clohessy-Wiltshire) en forme analytique pour le cas circulaire, les modèles de capteurs relatifs terminaux du <c1/> du fil (paramètres ILLUSTRATIVE) à côté du chiffre des signaux seuls, et la covariance 6x6 du chasseur à la fin.

seg-5d3fa3e8486c = <b>Ce que dit le résultat.</b> Avec les signaux seuls, la distance par liaison croisée fixe la position relative le long de la ligne de visée, mais la position relative transversalement est limitée par l'erreur indépendante du signal dans l'espace et par ce que donne la dynamique ; l'amarrage exige un capteur relatif, et les lignes <c1/> montrent à quelle distance chacun des modèles de capteurs du fil l'emporte sur les signaux. Le résultat dépend aussi du fait que la vérité et l'estimateur partagent un modèle de forces ; l'option d'estimateur <c2/> montre le coût d'ignorer les harmoniques, et cette exécution n'est pas censée être cohérente.

seg-66c4eb27641b = La phase vole sur sa propre orbite nominale (les champs <c1/>), de sorte que le vecteur de position et de vitesse d'entrée n'est pas utilisé, seulement sa covariance, son référentiel et son horloge ; un événement du fil le signale.

seg-751f29ab7a35 = Par axe horizontal, un modèle d'erreur inertielle à cinq états (position, vitesse, biais d'accéléromètre, inclinaison d'assiette, biais de gyroscope, piloté par la force spécifique de la descente) à partir de la covariance d'entrée et de l'IMU, puis un filtre séquentiel sur les aides activées :

seg-c2eae4508a2f = <b>Point AFS</b> : à partir des relais visibles au-dessus d'un masque plat, avec le cofacteur DOP ENU multiplié par une erreur de distance de l'utilisateur. <c1/> utilise l'erreur du signal dans l'espace ; <c2/> utilise le résidu de la liaison de correction de <c3/>. Avec exactement trois relais en vue, l'horloge est aidée et non estimée, et le point porte alors <c4/> : c'est ici que le temps lunaire entre dans le point.

seg-39c938fb24e9 = <b>Point relatif au terrain</b> : <c1/> exécute le comparateur TERCOM/SITAN de la crate sur son relief synthétique et une échelle en mètres terrestres (un substitut, et non le relief polaire sud) ; <c2/> prend la borne de Cramer-Rao de l'appariement d'une fenêtre d'altitude du véritable MNT LOLA au site, <c3/>, et ne revendique aucun point là où le relief n'en contraint qu'une seule direction (le problème d'ouverture).

seg-795ef82edc61 = <b>Temps lunaire</b> : l'erreur d'horloge au point combine l'horloge d'entrée, sa croissance depuis la synchronisation et le terme LTC-TT de <c1/>. Avec <c2/>, le véhicule bat TT et le décalage accumulé est un biais non corrigé ; avec <c3/>, il ne reste que l'incertitude de la bande publiée de { "56" } à { "59" } microsecondes par jour sur l'horizon. Une erreur d'horodatage déplace un point le long de la trajectoire de <c4/>.

seg-d655c932abbf = La dispersion à l'atterrissage est l'erreur de navigation au toucher plus un terme de guidage indépendant (<c1/>, ILLUSTRATIVE, { "20" } m par axe par défaut). Le tableau <c2/> exécute chaque combinaison des aides. L'ellipse est étalonnée par Monte Carlo (la fraction d'atterrissages simulés à l'intérieur du contour à 3 sigma par rapport aux { "98.9" } % que donne une gaussienne 2-D).

seg-82b71e26bc89 = <b>À lire avec prudence.</b> La dispersion par défaut est dominée par le terme de guidage supposé, et sur chaque site polaire sud la géométrie des relais est presque la même, de sorte que les sites diffèrent peu. Le temps lunaire compte peu par l'horodatage ({ "150" } m/s multipliés par quelques microsecondes font moins d'un millimètre) ; il compte lorsque la géométrie se dégrade à trois relais.

seg-f5af0aef6649 = Pour chaque site et chaque saison (une époque et une fenêtre après elle) : positionnement par relais (quatre relais ou plus en vue au-dessus du masque et de l'horizon du terrain du site avec un PDOP sous le seuil, issus des mêmes fonctions et de la même constellation que <c1/> ; le résultat à site unique égale son chiffre au bit près), si la Terre et le Soleil sont au-dessus de l'horizon (Soleil, Lune et orientation lunaire analytiques, libration comprise), et disponibilité de la synchronisation temporelle (un relais ou la Terre en vue) avec la plus longue période sans aucun des deux. Le chiffre des relais ne change pas avec la saison dans ce modèle (ensemble képlérien, rotation moyenne) ; ceux de la Terre et du Soleil, si. La phase transmet la covariance sans changement et asservit l'horloge à un plancher de synchronisation (ILLUSTRATIVE, { "50" } ns), ne laissant que la plus longue interruption de synchronisation à couvrir en holdover.

seg-0890ec65a04e = Le modèle à cinq états de la descente sur les trois axes du site à partir de l'état de surface, un point AFS à un intervalle déclaré avec le même traitement du temps lunaire, et la covariance de position-vitesse 6x6 complète à l'insertion transmise, avec la corrélation position-vitesse de chaque axe conservée. La dispersion à la coupure des moteurs déplace l'endroit où se trouve le véhicule et est rapportée à côté de la covariance de navigation, et non reportée. Les erreurs sont tenues dans les axes du site de lancement (sans courbure en distance) et l'état de sortie nominal est un substitut ; seule la covariance est le résultat.

seg-f60b576fabcd = Comment un document énonce une phase

seg-be8e0001ed0c = Dans un fil, la table <c1/> d'une phase est la table propre du scénario autonome. La durée de la phase est le <c2/> du fil : un modèle qui énonce aussi sa propre clé de durée (<c3/>, <c4/>, <c5/>, <c6/>) doit être d'accord avec elle, sans quoi la phase est refusée, et un modèle qui omet la clé prend celle du fil. La graine est la graine de phase du fil indexée par identifiant, de sorte qu'une phase exécutée seule sous le même identifiant et la même graine de fil renvoie les nombres qu'elle renvoie dans le fil. Une clé de modèle mal orthographiée est refusée, et non ignorée. Le transfert entre phases, et les conversions de référentiel et d'échelle de temps qu'il exige (inertiel centré sur la Lune et fixe lunaire, Terre vers Lune, les paires LTC), relèvent du fil.

seg-52a6e2ec0a99 = Les conceptions, les entrées et les seuils ont été fixés dans <c1/> avant toute exécution, avec six amendements datés, chacun signalé dans le fichier ; le verdict de chaque seuil, échecs et historique de l'estimateur compris, se trouve dans <c2/>.

seg-a1cf56c505d0 = <b>A1</b> (le propagateur par rapport à la trajectoire reconstituée de LRO, { "24" } h) : MET, { "33" } m d'écart 3-D maximal contre { "500" } m, { "2.4" } m RMS radial contre { "60" } m.

seg-25464238f6bd = <b>A2</b> (le même propagateur par rapport à l'orbite de halo quasi rectiligne de CAPSTONE sur une révolution de 6,5 jours) : <b>NOT MET</b>, { "136.8" } km d'écart de position finale contre { "25" } km, et { "28.4" } km d'écart de rayon de périapse osculateur contre { "10" } km. Les causes n'ont pas été isolées (les candidates sont la pression de radiation et l'albédo omis, la sensibilité de l'orbite à l'état initial, et les séries analytiques de la Terre et du Soleil) ; la ligne reste MODELLED.

seg-e1099ad81a5d = Ces deux lignes testent le propagateur que partagent les types lunaires. <b>Elles ne testent aucun filtre de navigation, signal ou budget, et rien d'autre ici n'a de référence indépendante externe.</b>

seg-9a4b2392aa92 = Tout le reste est MODELLED, et les vérifications de cohérence des types (B1 à B8 du préenregistrement) testent une implémentation par rapport à son propre modèle déclaré, et non par rapport à la Lune.

seg-3365490b59b7 = <s1>Précédent</s1>Fil de mission : du lancement à l'entrée

seg-90932eed0074 = <s1>Suivant</s1>Navigation en orbite basse
