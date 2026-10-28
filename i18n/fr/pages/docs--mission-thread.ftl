# docs--mission-thread: translations (fr)

seg-e27476e37522 = Terre

seg-34bdcfd66ded = Dans la branche du dépôt d'où viennent ces documents ; pas encore sur GitHub

seg-092dd691ca17 = Le rapport

seg-f942b36a11c4 = Pas encore sur GitHub

seg-b03d56f501c3 = Type

seg-2afa300864a9 = Paramètres

seg-b7cf72949a21 = Source : <c1/>

seg-32755afa0f78 = Le fil de mission

seg-d4af67363efc = Logiciel à titre consultatif, et non un équipement de navigation certifié. Sources publiques seulement ; sans affiliation ni aval d'aucune agence, et rien ici ne revendique de conformité aux exigences d'un programme quelconque.

seg-816770c97995 = <c1/> enchaîne des phases d'une mission, chacune d'un des huit types enregistrés avec ses propres capteurs et son propre filtre, et rapporte le <b>budget d'erreur de navigation et de synchronisation</b> de toute la chaîne : pour chaque phase, le 1-sigma de position, de vitesse et de biais d'horloge à l'entrée, au pic et à la sortie ; chaque contribution à celui-ci, avec son unité ; la marge par rapport à une exigence que vous déclarez ; le maillon le plus faible ; les événements datés ; et une figure chronologique. Chaque nombre est <b>MODELLED</b> : une entrée déclarée ou un modèle d'une entrée. Les seules lignes de références indépendantes externes se trouvent dans <s1><c2/></s1> et disent ce qu'elles testent.

seg-c29a19879c84 = Exécutez l'exemple depuis une copie du dépôt (il lit une découpe versionnée du noyau de la Lune) :

seg-00f84b734853 = Le document

seg-9979b2c873df = <b>Un document est refusé, et non deviné,</b> lorsqu'un identifiant de phase se répète, qu'une liste <c1/> est vide, qu'un nom est inconnu, qu'une clé de modèle n'est pas connue du type, qu'une clé de durée est en désaccord avec <c2/>, ou qu'une phase énumère une source pour laquelle son modèle ne donne pas de nombres.

seg-9b1e6ac618b5 = Ce que fait un transfert

seg-0e965f3e30fa = L'état transmis est la covariance 6x6 complète de <c1/> en unités SI, l'horloge (biais, dérive et leur covariance, étiquetés avec une échelle de temps), le référentiel, le temps de mission et une étiquette de preuve. Un transfert ne réinitialise jamais une covariance.

seg-47599d03571d = Règle

seg-023113cc5afb = transmet l'état sans changement

seg-43967d0b6dd8 = bruit d'accélération blanc de DSP <c1/> sur <c2/> avec un modèle en ligne droite ; la ligne énonce les deux

seg-2c791ab0fd0f = estime pendant <c1/>, puis un axe est ramené au plancher de la source seulement là où le plancher est plus petit ; jamais en dessous du plancher, jamais une réinitialisation

seg-36b9117f5379 = Référentiels et échelles de temps

seg-5853aaba827f = Le fil convertit au transfert, jamais à l'intérieur d'une phase, et chaque conversion est une ligne de budget à part. Référentiels : GCRF, MCI, MCMF (ITRF et LVLH sont refusés en indiquant la raison). <c1/> décale l'origine par l'état géocentrique de la Lune : l'état de niveau DE440 issu du noyau là où il couvre l'époque (substitut { "5" } m et { "1" } mm/s ; pire cas mesuré { "2.6" } m par rapport à JPL Horizons épinglé), sinon la série analytique avec ses { "195.7" } km RMS mesurés, que la ligne énonce ; un exemple lunaire doit donc porter un noyau couvrant son époque. <c2/> est la rotation sidérale moyenne avec les axes alignés à l'époque et sans libration. Les échelles de temps passent par TT : <c3/> exact, <c4/> ajoute { "14" } us, <c5/> utilise le taux séculaire de <c6/> avec sa bande de { "56" } à { "59" } us/jour comme incertitude de taux.

seg-5ee610d8ab89 = Les huit types de phase

seg-70b73f1acebf = Segment

seg-0e39a468de1d = ascension propulsée jusqu'à une orbite de stationnement : covariance à vitesse constante avec bruit d'accélération blanc, acquisition et évanouissement GNSS, holdover d'horloge

seg-d359ae5982a6 = clés <c1/> dans <c2/>

seg-57c44fd6e061 = navigation relative sur des segments de capteur : transition de Clohessy-Wiltshire en LVLH, covariance de Kalman 6x6, fenêtre d'amarrage

seg-7dce961e2c67 = ci-dessous

seg-4b233c6cdf8b = poussée TLI et croisière cislunaire : propagation de Cowell, matrice de transition d'état aux différences finies, mises à jour gnss-ssv et de suivi au sol

seg-352e27d02c86 = croisière retour jusqu'à l'interface d'entrée ; sigma de l'angle de trajectoire, probabilité de corridor, décélération maximale, empreinte

seg-95eb34012fe8 = lunaire

seg-cc72d2fc8a43 = navigation relative jusqu'à l'amarrage en orbite lunaire

seg-2cfa6846c937 = budget de dispersion à l'atterrissage sur un site polaire

seg-e9f5fc58fe12 = identique

seg-ba3c65a210dd = disponibilité du PNT et de la synchronisation temporelle en surface par site et par saison

seg-8b9c5124dd3c = ascension propulsée jusqu'à une orbite d'insertion

seg-4ce0fa85457c = Les types lunaires sont aussi des types de scénario autonomes ; la conception et les preuves se trouvent dans <a1><c1/></a1>.

seg-d16877f38793 = Le budget porte les sigmas <b>relatifs</b> ; la covariance absolue du chasseur est transmise telle quelle et une ligne le dit, parce que cette phase mesure les véhicules l'un par rapport à l'autre, et non par rapport à la Terre. La covariance relative de départ est la covariance absolue du chasseur plus les sigmas déclarés de la cible, additionnés comme s'ils étaient indépendants (prudent). Clés : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> et <c7/> facultatives, et un ou plusieurs <c8/> avec <c9/>, <c10/>, <c11/>, <c12/> (<c13/>, <c14/> ou <c15/>, paramètres ILLUSTRATIVE dans <c16/>) et <c17/> ; les durées des segments s'additionnent à celle de la phase. La fenêtre d'amarrage est le temps écoulé depuis l'instant où le sigma relatif reste dans l'enveloppe de capture jusqu'à la fin de la phase. Les répétitions sont des phases séparées avec leurs propres identifiants.

seg-088b78574ab4 = L'état moyen est celui du propagateur de Cowell du moteur avec la gravité terrestre et J2, et le Soleil et la Lune comme corps tiers. La covariance traverse chaque segment <c1/> avec une matrice de transition d'état aux différences finies progressives (l'exécution nominale et six exécutions perturbées) et un bruit d'accélération blanc. La poussée est le long de la vitesse d'entrée, avec une fraction de taille et une erreur de pointage déclarées. <b>Limite nommée :</b> les découpes versionnées du noyau de la Lune contiennent la Lune mais non le Soleil, de sorte que le propagateur prend la Lune dans le noyau et le Soleil dans la série analytique (le terme de corps tiers du Soleil est insensible à l'erreur de cette série) ; la phase dit dans un événement laquelle elle a utilisée, et là où aucun noyau ne couvre un segment, elle utilise la série analytique pour les deux. La poussée n'est <b>pas ciblée</b> : l'état nominal est là où va la poussée déclarée, et les phases lunaires ne prennent que la covariance.

seg-e5a67295a5ae = Mises à jour, utilisées seulement lorsque le document énumère la source : <c1/> (points de position avec disponibilité et PDOP issus du balayage du volume de service spatial du moteur le long d'une orbite terrestre osculatrice tenant lieu d'arc, un balayage par <c2/> ; sigma du point = PDOP médian multiplié par <c3/> ; la forme à information attendue garde l'exécution déterministe) et <c4/> (distance et vitesse radiale selon la direction géocentrique, de sorte que le plan du ciel n'est pas observé ; la variance de la mise à jour est divisée par le cycle de suivi). Clés : <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/> facultative, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-3a69ca6723ba = Le vol libre est celui de <c1/> sans poussée, et se termine à l'interface d'entrée ; ses clés sont les clés de vol libre ci-dessus. À l'interface, la phase lit l'angle de trajectoire et son sigma à partir de la covariance complète, la probabilité que l'angle soit à l'intérieur d'un corridor déclaré, la décélération maximale à l'angle nominal et aux deux bords du corridor (l'entrée balistique plane du moteur à côté de la forme analytique d'Allen-Eggers) par rapport à une limite facultative, et l'empreinte : en distance à partir d'une sensibilité déclarée, en écart latéral à partir de la covariance à l'interface dans le plan transverse de l'orbite. Clés : <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/> facultative, <c9/> et <c10/> (l'état de retour nominal, six nombres, lorsque la chaîne n'a pas de poussée trans-Terre pour en produire un). Rien ici ne modélise la portance, le guidage ou l'échauffement d'une capsule.

seg-352783ef7181 = La superposition du réseau au sol

seg-69d6ab8e93bc = Une table <c1/> facultative donne des stations et l'élévation de suivi la plus basse ; pour chaque phase qu'elle nomme, le fil calcule la fraction de la phase qu'une station peut suivre et la transmet à la phase comme le cycle qui met à l'échelle sa cadence de mise à jour du suivi au sol. Géométries : <c2/> (l'état d'entrée volé en deux corps avec J2, pour les phases en orbite basse), <c3/> (le véhicule à la position de la Lune, pour la croisière cislunaire) et <c4/> (un cycle que vous donnez). Un changement de station fait perdre <c5/> ; le budget de la phase reçoit le plus long intervalle sans station en vue et un événement donne le cycle. Rien ne modélise les antennes ou les calendriers d'un réseau.

seg-467b14d7ef59 = <c1/> : <c2/> (indice, identifiant, type, temps, étiquette, sources de navigation et de temps, source limitante, sigmas à l'entrée, au pic et à la sortie, exigence, marge, <c3/> avec une unité par ligne, <c4/>), le <c5/> (la plus petite marge par rapport à une exigence déclarée, sinon le plus grand pic de position), le <c6/>, l'<c7/> du fil (l'étiquette de la phase la plus faible), et un bloc <c8/>. La figure est le 1-sigma de position et de biais d'horloge en fonction du temps de mission, une bande par phase.

seg-a3c40c51c2ff = Ce que sont les preuves

seg-1168810d4407 = L'étiquette du fil est l'étiquette de la phase la plus faible, et chaque phase est MODELLED. Le propagateur lunaire est comparé à LRO et CAPSTONE (<s1><c1/></s1>) ; l'arc cislunaire est comparé à une trajectoire publique de Horizons (<s2><c2/></s2>). Une ligne atteint ou manque un seuil fixé dans un fichier versionné avant l'exécution, et un échec est consigné comme un échec. Rien n'est VALIDATED sauf si le registre le dit.

seg-ee3c5b58e6fa = <s1>Précédent</s1>Orbite et surface lunaires comme infrastructure

seg-b963f8a02aed = <s1>Suivant</s1>Fil de mission : le segment lunaire

seg-af81a8087ca7 = entry
