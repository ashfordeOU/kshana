# docs--clock-log-formats: translations (fr)

# text
# c1: docs/CLOCK-LOG-FORMATS.md
seg-ca2fcdd60f65 = Source : <c1/>

# text
seg-0dfd1160c5d7 = Formats de journaux d'horloge

# text
# c1: src/clock_log.rs
# c2: (time_s, phase_s)
# c3: tau0
seg-f52a62872493 = <c1/> lit un journal d'horloge mesuré pour en tirer une série de phase normalisée unique : une grille uniforme d'échantillons <c2/>, avec l'intervalle d'échantillonnage <c3/> indiqué ou déterminé, chaque trou compté et les unités du journal nommées. Huit formats sont lus, chacun étant un sous-ensemble documenté. Tout ce qui sort du sous-ensemble est refusé avec une erreur qui nomme ce qui a été trouvé, plutôt que lu de façon approximative.

# text
# c1: tau0
seg-dbdbfec37ab6 = <b>Abréviations.</b> RINEX est le Receiver Independent Exchange Format. TICC est le compteur d'intervalles de temps du TAPR (Tucson Amateur Packet Radio). ADEV est l'écart-type d'Allan à recouvrement, TDEV l'écart temporel et MTIE l'erreur maximale d'intervalle de temps. <c1/> est l'intervalle d'échantillonnage en secondes.

# text
seg-1d5a6c2090af = Où un journal peut être utilisé

# text
# c1: telecom-timing
# c2: [series.clock_log]
# c3: series.samples
# c4: series.csv_path
# c5: clock_log
seg-2a391645eeeb = <b><c1/></b> : <c2/> à la place de <c3/> ou <c4/>. La phase du journal, en ns, est la série d'erreur de temps vérifiée par rapport aux gabarits, et le rapport gagne un bloc <c5/> indiquant comment il a été lu.

# text
# c1: [clock_log]
# c2: measured
# c3: input_sha256
# c4: scenario_hash
# c5: runs = 1
seg-4c2a67008451 = <b>Le type de scénario d'horloge</b> : une table <c1/> ajoute à l'exécution un bloc <c2/> : comment le journal a été lu, le SHA-256 de la table (<c3/> ; le <c4/> de l'exécution ne couvre pas la table) et des échantillons de phase, ainsi que l'ADEV à recouvrement, le TDEV et le MTIE à des facteurs de moyennage par octave. Il exige <c5/>. Le holdover simulé est inchangé.

# text
seg-2f464fe709c9 = Sans la table, les deux types de scénario sont analysés, hachés et rapportés exactement comme avant.

# text
seg-c931c5ec2f4a = Les formats

# text
# c1: timelab
# c2: tau0
# c3: time value
seg-0b758195e7eb = <b><c1/></b> : journaux ASCII de phase ou de fréquence de style TimeLab, la forme en texte brut qu'exporte TimeLab et que lisent son import ASCII et Stable32. Il y a une lecture par ligne : soit une seule colonne à un <c2/> uniforme, soit deux colonnes <c3/>. Les colonnes peuvent être séparées par des espaces, des virgules ou des points-virgules.

# text
# c1: #
# c2: ;
# c3: %
# c4: key = value
# c5: key: value
# c6: tau0
# c7: units
# c8: s
# c9: ms
# c10: us
# c11: ns
# c12: ps
# c13: data
# c14: phase
# c15: frequency
# c16: time_units
# c17: s
# c18: mjd
seg-a7ae9e712bea = Les lignes commençant par <c1/>, <c2/> ou <c3/> sont des commentaires. Un commentaire de la forme <c4/> (ou <c5/>) définit <c6/> (s), <c7/> (<c8/>, <c9/>, <c10/>, <c11/> ou <c12/>, pour la phase), <c13/> (<c14/> ou <c15/>) ou <c16/> (<c17/> ou <c18/>, pour la première de deux colonnes).

# text
seg-84cf463d5e74 = Une première ligne non numérique est prise pour un en-tête de colonne.

# text
# c1: x[i+1] = x[i] + y[i]·tau0
seg-84f4b59bcdbf = Les données de fréquence (fréquence fractionnaire) ne sont acceptées qu'en colonne unique. Elles sont intégrées en phase sous la forme <c1/> (NIST SP { "1065" }, { "2008" }, §{ "4.1" }).

# text
# c1: .tim
seg-8cc445eb84f3 = Les fichiers de projet binaires et <c1/> de TimeLab ne sont pas lus.

# text
# c1: <seconds> chA
# c2: <seconds> chB
# c3: chC
# c4: x[k] = t[k] − t[0] − n[k]·tau0
# c5: n[k]
# c6: tau0
seg-3af6e4e7bc73 = Les lignes du mode Timestamp (<c1/>, <c2/>) et le canal de pseudo-horodatage du mode TimeLab (<c3/>) sont des horodatages d'événements. La phase du canal sélectionné est son horodatage moins le tic nominal : <c4/>, où <c5/> est le nombre entier de <c6/> écoulés depuis le premier événement. Un événement manqué est un trou.

# text
# c1: <seconds> TI(A->B)
# c2: TI
# c3: tau0
# c4: tau0_s
seg-cecf9df4ff10 = Les lignes du mode Interval (<c1/>, ou toute étiquette commençant par <c2/>) sont lues directement comme phase, une lecture par <c3/>. Le scénario doit indiquer <c4/>, car la ligne ne porte aucun temps.

# text
# c1: #
# c2: <number> <label>
seg-5ec2509907dd = Les lignes commençant par <c1/>, et les lignes qui ne sont pas de la forme <c2/> (comme le menu de démarrage), sont sautées et comptées.

# text
seg-cb4b7062dd5a = Journaux linuxptp et chrony

# text
seg-c6c70813a988 = Ces cinq formats lisent ce qu'un démon de temps en fonctionnement écrit sur sa propre horloge. Ils servent à vérifier une chaîne de synchronisation temporelle après coup (une horloge limite, la PHC d'un grandmaster, un client chrony) avec les mêmes estimateurs que les autres journaux. Ils ne lisent pas la configuration d'un démon, et rien ici ne dialogue avec un démon.

# text
# c1: ptp4l
# c2: phc2sys
# c3: ts2phc
seg-e1f85ff146d2 = <b><c1/></b>, <b><c2/></b>, <b><c3/></b> : les lignes d'asservissement de linuxptp, chaque format ne lisant que les lignes de son propre programme. Une lecture est une ligne de la forme

# text
# c1: [seconds.fraction]
# c2: ptp4l[812]:
seg-e32842403b6b = L'horodatage est le premier <c1/> de la ligne (l'horloge monotone du démon). Il est aussi lu après un préfixe syslog, où un identifiant de processus tel que <c2/> n'a pas de fraction et n'est pas retenu.

# text
# c1: offset
seg-72678cd6c03e = La phase est le <c1/> consigné, en nanosecondes, converti en secondes. C'est l'erreur de temps mesurée par le démon sur son horloge esclave par rapport à sa référence, telle que consignée : positive lorsque l'esclave est en avance. C'est l'erreur restante sous asservissement, et non la dérive d'une horloge en marche libre.

# text
# c1: offset
# c2: master
# c3: eth0 master
# c4: [eth0]
# c5: CLOCK_REALTIME phc
# c6: /dev/ptp0
# c7: clock = "<that text>"
seg-f9080412572a = Les mots entre l'horodatage et <c1/> désignent la source (<c2/>, <c3/> pour un préfixe <c4/>, <c5/>, <c6/>). Un journal comportant plus d'une source exige <c7/> ; l'erreur les énumère.

# text
# c1: s2
# c2: n_skipped_lines
# c3: s0
# c4: s1
# c5: s2
seg-5bef874341f2 = Les lectures antérieures au premier signalement de <c1/> (verrouillé) par l'asservissement sont écartées et comptées dans <c2/> : <c3/> et <c4/> sont les états non verrouillé et de saut, dont les écarts sont des transitoires de convergence. Un asservissement qui n'atteint jamais <c5/> est refusé. Une ligne sans champ d'état est lue telle quelle.

# text
# c1: rms ... max ...
# c2: delay
# c3: selected best master
seg-121fbe1486cf = Les lignes de résumé (<c1/>), les messages <c2/> et <c3/>, et les lignes d'autres programmes sont sautés et comptés.

# text
seg-92164f4a56be = Les horodatages qui reculent (un démon redémarré) sont refusés ; scindez le journal.

# text
# c1: chrony-tracking
# c2: chrony-statistics
# c3: log tracking
# c4: log statistics
# c5: YYYY-MM-DD HH:MM:SS
# c6: ====
seg-d86fd2a815d8 = <b><c1/></b>, <b><c2/></b> : les fichiers <c3/> et <c4/> de chrony, lus par position de colonne. Une lecture est une ligne d'au moins { "14" } colonnes (tracking) ou { "13" } (statistics) qui commence par une date et une heure UTC <c5/>. La ligne d'en-tête des colonnes est sautée et comptée ; la règle <c6/> située dessous est sautée sans être comptée.

# text
# c1: clock
# c2: clock = "<id>"
seg-bae4f6895d14 = Tracking : colonne { "7" }, l'écart local lors de la mise à jour de l'horloge, en secondes. L'adresse IP ou l'identifiant de référence change avec la source sélectionnée ; sans <c1/>, chaque ligne est donc lue comme une seule horloge locale. <c2/> conserve un seul identifiant de référence.

# text
# c1: clock = "<address>"
seg-12b284cd7d8c = Statistics : colonne { "5" }, l'écart estimé d'une source, en secondes. Il y a une série par adresse de source, et le journal exige <c1/> lorsqu'il en contient plus d'une.

# text
# c1: tau0
# c2: tau0
# c3: n_duplicates
# c4: gaps = "refuse"
# c5: tau0_s
# c6: gaps = "linear"
seg-197645e3c7c5 = Les époques sont des secondes depuis le 1980-01-06 { "00" }:{ "00" }:{ "00" } UTC, sans gestion des secondes intercalaires. Chrony écrit une ligne par mise à jour ou par échantillon de source, de sorte que l'espacement n'est pas uniforme. <c1/> est l'espacement médian ; une lecture située à moins d'un demi-<c2/> après celle conservée avant elle est écartée et comptée dans <c3/>, et un espacement plus long est un trou, que <c4/> signale. Indiquez <c5/> et <c6/> pour un journal à intervalle d'interrogation constant.

# text
# c1: tests/fixtures/clock_log/linuxptp_chrony/
# c2: NOTICE.md
seg-61fbb0479c95 = Les colonnes de chrony et les dispositions de lignes de linuxptp sont celles de la documentation publique des démons. Les jeux d'essai de <c1/> sont écrits pour Kshana avec des valeurs inventées (voir son <c2/>) ; aucun journal réel n'a été lu, de sorte qu'une disposition qui diffère selon les versions des démons peut encore être refusée ou mal lue. Une ligne qui ne correspond pas est sautée et comptée, jamais devinée.

# text
# c1: tau0
seg-b120a37b7d60 = <c1/> et trous

# text
# c1: tau0
# c2: tau0
# c3: median-spacing
# c4: tau0_s
# c5: input
# c6: tau0
# c7: header
seg-6fd68aad2fd7 = Lorsque le journal porte des horodatages et qu'aucun <c1/> n'est donné, <c2/> est l'espacement médian des horodatages consécutifs, arrondi à quatre chiffres significatifs, et la source est indiquée comme <c3/>. L'espacement d'un compteur diffère du nominal du décalage de fréquence de la référence, soit des parties en { "10" }^{ "6" } ou moins. Un <c4/> dans le scénario l'emporte toujours (source <c5/>), puis un commentaire d'en-tête <c6/> (source <c7/>).

# text
# c1: t0 + i·tau0
# c2: tau0
seg-59e52611a7d3 = Les échantillons sont placés sur la grille <c1/>, et une époque manquante est un trou. Les lectures écartées de plus de { "1" } % de <c2/> de la grille sont écartées et comptées, de même que les doublons (le premier est conservé). La politique de traitement des trous est l'une des suivantes :

# text
# c1: refuse
seg-61b1664a7c48 = <c1/> (par défaut) : tout trou est une erreur qui compte les trous ;

# text
# c1: longest
seg-593c998b65e0 = <c1/> : conserver la plus longue séquence sans trou ;

# text
# c1: linear
seg-f184ce746389 = <c1/> : combler les trous intérieurs par interpolation linéaire, et indiquer le nombre de trous comblés.

# text
seg-1f3dc3429615 = Les estimateurs exigent un enregistrement sans trou, c'est pourquoi les trous sont traités ici.

# text
seg-0f061f726ec5 = <s1>Précédent</s1>Test de holdover et matériel de synchronisation temporelle dans la boucle

# text
seg-3c89cfcbbd04 = <s1>Suivant</s1>Sécurité du matériel

# text
seg-9b52cd5eb4be = tau0 et trous
