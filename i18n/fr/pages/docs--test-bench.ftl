# docs--test-bench: translations (fr)

# text
seg-245fe1f87b08 = Fichier

# text
seg-e305279d5b11 = Contenu

# text
# c1: docs/TEST-BENCH.md
seg-292871e5747d = Source : <c1/>

# text
seg-d18a29239225 = Faire fonctionner un récepteur sur un scénario exporté

# text
# c1: kshana receiver-trust
seg-aa3498c7cb16 = Un fabricant de récepteurs qui possède un simulateur GNSS de laboratoire peut y rejouer le mouvement du véhicule d'un scénario Kshana, enregistrer ce que fait le récepteur soumis à l'essai, et noter ce journal avec <c1/> par rapport à des événements énoncés avant l'exécution. Kshana fournit le mouvement, les instants des événements et la notation. Il n'écrit <b>aucun signal</b> : rien de ce qui est exporté ici ne synthétise, ne modélise ni ne transmet de forme d'onde radiofréquence ou en bande de base, et un événement exporté est un intervalle de temps étiqueté, et non une recette pour produire des interférences. Le simulateur et son opérateur fournissent les signaux, et l'opérateur est responsable de ne les exécuter que là où c'est autorisé (en conduit ou blindé, selon les consignes de sécurité propres au simulateur).

# text
seg-414c7774d133 = Cette page est une méthode. Elle ne publie aucun résultat.

# text
seg-a0ad7b35922f = { "1" }. Exporter

# text
# c1: gnss-ins
# c2: jamming
# c3: gnss-sim
# c4: jamming
# c5: --epoch
# c6: YYYY-MM-DDTHH:MM:SS
# c7: Z
seg-798d75d3b65c = S'applique au type de scénario <c1/> (un profil de conduite avec attitude ; les coupures de l'état de navigation sont les événements), et à <c2/> et <c3/> (un récepteur immobile pendant la durée du scénario ; le brouilleur d'un scénario <c4/> est un seul événement sur toute l'exécution). Les autres types de scénario disent pourquoi ils n'ont pas de trajectoire de véhicule. <c5/> est l'instant UTC du temps de mouvement zéro (par défaut 2024-01-01T00:{ "00" }:00Z) ; les scénarios ne portent aucune date calendaire propre pour le mouvement du véhicule. Ce doit être un véritable instant UTC, <c6/> (un <c7/> final est accepté), avec l'année entre { "2000" } et { "2099" } et chaque champ dans sa plage ; tout le reste est refusé. La sortie est identique octet pour octet pour le même scénario et la même époque.

# text
# c1: time_s
# c2: x_m,y_m,z_m
# c3: vx_m_s,vy_m_s,vz_m_s
# c4: lat_deg,lon_deg,h_m
# c5: heading_deg,pitch_deg,roll_deg
# c6: utc
# c7: kshana_row
seg-c153d8ef8735 = une ligne par échantillon : <c1/>, <c2/> dans le repère terrestre, <c3/>, <c4/> géodésiques, <c5/>, <c6/>, <c7/>

# text
seg-fa4c8c0d2b72 = l'époque, les référentiels, les unités, les colonnes et les tolérances d'aller-retour de ce CSV

# text
# c1: GGA
# c2: RMC
seg-8c74ca211e3a = NMEA { "0183" } phrases <c1/> et <c2/> par échantillon, avec sommes de contrôle

# text
# c1: RESOLUTION: <ms>
# c2: longitude,latitude,altitude
seg-2b0fd541f1dc = une ligne <c1/> puis des lignes <c2/> (écrit seulement lorsque tous les intervalles d'échantillonnage sont un même nombre entier de millisecondes ; en cas d'omission, la commande en donne la raison sur l'erreur standard)

# text
# c1: [[events]]
# c2: receiver-trust
seg-d09d2dab9a17 = les mêmes événements sous forme de blocs <c1/> pour un scénario <c2/>

# text
# c1: kshana.test-conditions/1
# c2: receiver-log
# c3: recording.path
# c4: recording.sha256
# c5: receiver.*
# c6: type
seg-866a3c4870af = l'exécution sous forme de document <a1><c1/></a1> pour un enregistrement <c2/> : les événements comme vérité déclarée, avec <c3/>, <c4/>, <c5/>, le <c6/> de chaque événement et la puissance laissés au laboratoire à renseigner

# text
seg-9ea6a94d4586 = Référentiels et conventions

# text
# c1: x
# c2: z
# c3: lat_deg
# c4: lon_deg
# c5: h_m
# c6: h_m
seg-8d3b7d2ef815 = <b>Position :</b> WGS { "84" }, repère terrestre (ECEF : <c1/> à travers l'équateur au méridien d'origine, <c2/> à travers le pôle) ; <c3/>, <c4/>, <c5/> donnent la même position en coordonnées géodésiques, <c6/> au-dessus de l'ellipsoïde.

# text
seg-93a2975d2a19 = <b>Vitesse :</b> axes liés à la Terre, relative à la Terre.

# text
# c1: heading_deg
# c2: pitch_deg
# c3: roll_deg
seg-be05c2278e98 = <c1/> dans le sens horaire à partir du nord vrai dans [{ "0" }, { "360" }), <c2/> positif nez vers le haut, <c3/> positif aile droite vers le bas ; lacet-tangage-roulis (3-2-1) du repère local nord-est-bas vers les axes du corps x vers l'avant, y vers la droite, z vers le bas. Une source immobile écrit des zéros. NMEA et le texte des points de passage ne portent aucune attitude.

# text
# c1: gnss-ins
# c2: automotive-urban-canyon
# c3: RMC
# c4: atan2(v_east, v_north)
seg-3c3ad1295628 = <b>Le cap est le lacet du corps, et non la direction de déplacement.</b> Dans le profil de conduite <c1/>, le corps tourne en lacet par créneaux tandis que la vitesse suit, de sorte que le cap et la route sur le fond peuvent différer de dizaines de degrés (jusqu'à environ { "77" } degrés dans le scénario <c2/> fourni). La route NMEA <c3/> est la route sur le fond, la direction du vecteur vitesse ; un simulateur qui lit le cap dans le fichier de mouvement et un autre qui lit la route dans le fichier NMEA voient donc des angles différents. La route sur le fond issue du CSV est <c4/> de sa vitesse tournée vers le nord-est-bas.

# text
# c1: gnss-ins
# c2: h_m
# c3: automotive-urban-canyon
seg-224b53995157 = <b>La hauteur suit le scénario.</b> Pour <c1/>, <c2/> est le pas de plan tangent propre au type de scénario, appliqué à sa vérité terrain, et n'est pas maintenu constant (environ { "7" } m sur les { "180" } s de <c3/>) ; c'est le mouvement du scénario, écrit tel quel.

# text
# c1: GGA
seg-f78a354f96ee = <b>Valeurs de remplissage NMEA <c1/>.</b> La qualité de la position ({ "1" }), les satellites utilisés ({ "12" }) et le HDOP ({ "1.0" }) ne sont écrits que pour que la phrase soit bien formée. Ils ne disent rien de la géométrie du scénario ni d'un état quelconque du récepteur.

# text
# c1: time_s
seg-f5cd510aac0c = <c1/> après l'époque, UTC, secondes intercalaires non modélisées.

# text
# c1: GGA
seg-d2a2f655760d = <b>Les hauteurs NMEA sont ellipsoïdales.</b> L'altitude <c1/> contient la hauteur ellipsoïdale et la séparation du géoïde est écrite comme { "0.0" }. Un simulateur qui traite l'altitude comme une hauteur au-dessus du niveau moyen de la mer placera le véhicule à côté, de l'ondulation locale du géoïde.

# text
seg-ee3a9a3ec84d = <b>Tolérances d'aller-retour</b> (testées en relisant chaque fichier) : position CSV { "0.1" } mm, latitude et longitude { "1e-9" } degré, vitesse { "0.1" } mm/s, angles { "1e-6" } degré ; NMEA position horizontale { "5" } mm, hauteur { "1" } mm, vitesse { "0.001" } nœud, route { "0.001" } degré.

# text
seg-a554992d2694 = Charger les fichiers dans un simulateur

# text
seg-757382614413 = Les simulateurs de laboratoire diffèrent, et ce dépôt ne reproduit le manuel d'aucun simulateur. Vérifiez lequel des formats ci-dessus le vôtre lit, et ses exigences déclarées :

# text
# c1: gnss-ins
# c2: [time] step_s
seg-cc49ceccea20 = De nombreux importateurs de mouvement attendent une cadence de mise à jour fixe, couramment { "10" } Hz. Le scénario <c1/> avance par pas de { "0.1" } s ; pour un scénario immobile, réglez <c2/> sur la cadence que veut votre simulateur.

# text
seg-e98bf4bf6c6e = Certains importateurs sautent les échantillons situés entre des secondes entières, ou ignorent la colonne de temps et utilisent l'ordre des lignes. Démarrez le mouvement à une seconde entière et gardez la grille régulière.

# text
# c1: run1.motion.csv
# c2: run1.motion.json
seg-3c470262eb15 = Un importateur CSV qui permet d'associer les colonnes peut lire <c1/> directement : choisissez les colonnes du repère terrestre ou géodésiques et réglez leurs unités d'après <c2/>. Tronquer les décimales produit de fausses accélérations ; conservez donc la précision écrite.

# text
# c1: run1.events.csv
seg-41a2bfe45b37 = Le fichier ne contient que le mouvement. Configurez la constellation, l'interférence et le frontal du récepteur dans le simulateur, et calez-les sur les événements de <c1/>.

# text
seg-024ab011a2e3 = Kshana n'écrit aucune interface de script propre à un fournisseur.

# text
seg-6d67d4e2cdf0 = Vérifié avec les lecteurs d'un simulateur libre

# text
# c1: tests/testbench_gpssdrsim_oracle.rs
# c2: xval/testbench-gpssdrsim/PREREGISTRATION.md
seg-e4ce0597a644 = Les lecteurs de mouvement de gps-sdr-sim (MIT, commit 28ca29a6) ont reçu les exports de huit scénarios fournis. Chaque lecteur a restitué la trajectoire exportée (<c1/>, préenregistré dans <c2/>) :

# text
seg-3caed3fc2e47 = option de gps-sdr-sim

# text
seg-ad9e78555851 = Lui donner

# text
seg-4f9be75880d3 = Pire écart par rapport au CSV

# text
# c1: -g
seg-0e86c1df1bc5 = <c1/> (NMEA GGA)

# text
# c1: run1.nmea
seg-e03dd1d45ced = <c1/> tel qu'écrit

# text
seg-8d28fbcc4c4a = { "1.2" } mm

# text
# c1: -x
seg-fd39660fcb73 = <c1/> (temps, latitude, longitude, hauteur)

# text
seg-c4e171cbf0de = { "0.15" } mm

# text
# c1: -u
seg-390b0c0fb695 = <c1/> (temps, x, y, z)

# text
seg-ff26559a85e8 = exact

# text
# c1: -u
seg-f4c13a327904 = Ne donnez pas à <c1/> le CSV de mouvement complet. Son lecteur retient { "100" } caractères par ligne, et une ligne de CSV compte environ { "160" } caractères ; chaque ligne est donc lue comme deux échantillons. La ligne d'en-tête est lue comme un échantillon de plus sans aucun nombre.

# text
# c1: gnss-ins
# c2: gnss-ins-maritime
seg-43cc6f9c50b2 = gps-sdr-sim retient au plus { "3000" } échantillons, soit { "300" } s à sa cadence fixe de { "10" } Hz, et ignore la colonne de temps. Les exports de <c1/> avancent par pas d'exactement { "0.1" } s. Les scénarios plus longs, tels que <c2/> de 20 minutes, ne sont lus que sur leurs { "300" } premières secondes.

# text
seg-500243b6e402 = Cela vérifie que les fichiers sont lus tels qu'écrits. Cela ne vérifie ni la physique du scénario ni rien de ce que le simulateur transmet.

# text
seg-a4c4514276e9 = { "2" }. Énoncer ce que vous noterez avant l'exécution

# text
# c1: run1.events.toml
# c2: receiver-trust
seg-3a3e2be36c65 = Le fichier d'événements donne les intervalles que définit le scénario. Copiez <c1/> dans un scénario <c2/>, ajoutez toute prédiction que vous voulez voir vérifiée, et fixez les seuils des moniteurs et les tolérances <b>avant</b> que le récepteur ne s'exécute. Ne les ajustez pas après avoir vu le journal ; le scénario, les seuils et le SHA-256 du journal figurent tous dans le hachage du résultat.

# text
# c1: jamming
# c2: jamming
# c3: other
# c4: kind
seg-d07b9ad8cfa9 = Les événements exportés portent le type propre au scénario : le brouilleur d'un scénario <c1/> est <c2/> ; une coupure de l'état de navigation est <c3/>, parce que le scénario énonce que le GNSS était indisponible, et non comment. Modifiez <c4/> pour qu'il corresponde à ce que vous configurez le simulateur pour faire.

# text
seg-faa87b3ba315 = { "3" }. Exécuter le récepteur

# text
seg-0a3b63cf5615 = Démarrez le récepteur et son enregistreur, démarrez le scénario du simulateur avec le fichier de mouvement, et laissez l'exécution couvrir l'intervalle d'étalonnage, chaque événement, et une marge après le dernier. Conservez le journal propre au récepteur (UBX, observations RINEX { "3" }, un CSV d'enregistreur Android, ou NMEA avec des phrases d'état des satellites). Un journal sans puissance de signal par satellite peut quand même être noté sur la position propre du récepteur, mais les moniteurs de rapport porteuse sur bruit en ont besoin.

# text
seg-fbbc12dfeb3f = { "4" }. Aligner les horloges

# text
# c1: receiver-trust
# c2: d
# c3: d
# c4: onset_s
# c5: end_s
# c6: name
seg-5828311af3d4 = <c1/> compte les instants des événements à partir de la première époque du journal du récepteur ; le fichier de mouvement compte à partir de son premier échantillon. Si le journal démarre <c2/> secondes avant le premier échantillon du mouvement, ajoutez <c3/> à chaque <c4/> et <c5/>. Consignez le décalage et la manière dont vous l'avez mesuré, et énoncez-le dans le <c6/> du scénario ou dans un commentaire, car un mauvais décalage déplace chaque note. Les instants des événements seuls ne peuvent pas vous donner le décalage ; utilisez le marqueur de début de scénario du simulateur ou les horodatages propres du récepteur.

# text
seg-22f7b68c445b = { "5" }. Noter

# text
# c1: bench-session.result.json
# c2: .trust.csv
# c3: .trust.svg
# c4: detected
# c5: late
# c6: missed
# c7: not-evaluable
seg-e024186a2874 = écrit <c1/>, <c2/> et <c3/>. Pour chaque événement, le résultat donne les fausses alarmes avant le début, la première alarme et ses moniteurs, la latence, et l'issue (<c4/>, <c5/>, <c6/>, <c7/>), plus une baisse prédite et observée du rapport porteuse sur bruit lorsque vous avez énoncé une prédiction. Un désaccord est rapporté, jamais corrigé en ajustant. Voir <a1>RECEIVER-TRUST.md</a1>.

# text
seg-5fa1e4890f91 = Pour voir en faveur de quelles lignes de cadres publics la session apporte des éléments de preuve :

# text
seg-abc6aaf44c95 = Voir <a1>compliance/README.md</a1>. Ce rapport décrit les preuves contenues dans les exécutions que vous lui donnez ; il ne conclut rien sur le récepteur ni sur un cadre quelconque.

# text
seg-69fa39640c2d = { "6" }. Lier l'aller-retour dans un seul paquet signé

# text
# c1: kshana evidence round-trip
# c2: run1.conditions.json
seg-f24e2dd64c47 = Après la notation, <c1/> relie les quatre enregistrements : le scénario que vous avez exporté, les <a1>conditions d'essai</a1> du laboratoire, le journal du récepteur et la note. Renseignez <c2/> (le chemin et le SHA-256 du journal, le récepteur soumis à l'essai, le type et la puissance déclarée de chaque événement), puis :

# text
# c1: round-trip-pack/config.json
# c2: round_trip
# c3: kshana.round-trip/1
# c4: scenario_sha256
# c5: conditions_hash
# c6: log_sha256
seg-78bed55de550 = <c1/> porte un bloc <c2/> (<c3/>) avec <c4/>, <c5/>, <c6/>, et la note (événements détectés parmi les événements évaluables, première alarme), couvert par les hachages du manifeste et par la signature. La commande refuse un paquet dont les conditions et les événements de notation sont en désaccord, ou dont le hachage de journal déclaré n'est pas celui du journal. Comme tout paquet de preuves, c'est un enregistrement technique, et non un avis juridique.

# text
seg-5fe6548911da = Exemple détaillé : gps-sdr-sim écrivant un fichier

# text
seg-eeccc823e109 = Cet exemple utilise le simulateur libre gps-sdr-sim uniquement pour <b>écrire un fichier en bande de base</b> à partir du mouvement exporté. Kshana ne transmet rien, et rien dans cette page n'automatise la lecture de ce fichier par une radio. Si votre laboratoire joue un tel fichier dans un récepteur, cela relève de la responsabilité de votre opérateur, et ne se fait que là où c'est autorisé (en câblé ou blindé, en suivant les consignes de sécurité du simulateur et de la radio), et Kshana ne le documente ni ne l'enveloppe.

# text
# c1: run1.iq
# c2: tests/round_trip_pack.rs
seg-db81fdadfd19 = Tout ce que le laboratoire fait ensuite de <c1/> se passe en dehors de Kshana. Le journal propre du récepteur, quelle que soit la façon dont il est obtenu, est ce que l'étape { "5" } note et ce que l'étape { "6" } relie. Les fichiers et les contrôles que Kshana fait sur ses propres exports sont testés sur des données synthétiques seulement (<c2/>) ; aucune exécution de laboratoire n'est revendiquée ici.

# text
seg-dffcbdb8e6c3 = Ce que cette méthode ne fait pas

# text
seg-d0b62c238953 = Elle ne produit pas de signal, et elle ne dit pas quelle interférence un simulateur doit générer. Les événements disent quand, non quoi.

# text
seg-3aa11bed60c8 = Une seule session est un seul point de données. Le résultat décrit ce journal sous cette configuration, et ne dit rien d'autres récepteurs, micrologiciels, antennes, ni d'interférences réelles.

# text
seg-b156403456e4 = Les hauteurs, les cadences et l'alignement temporel sont à vérifier par l'opérateur par rapport au simulateur ; l'export énonce ses propres conventions et tolérances, et rien de plus.

# text
seg-337ff53bc890 = <s1>Précédent</s1>kshana-bench

# text
seg-87be81f5e600 = <s1>Suivant</s1>Cartographie compliance
