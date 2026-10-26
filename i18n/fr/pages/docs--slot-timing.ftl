# docs--slot-timing: translations (fr)

# text
seg-f917e7fcac09 = Ce que c'est

# text
seg-adc34608c46b = Classe

# text
seg-3a0e724a8a2b = Niveau

# text
seg-fffbeccd4266 = Symbole

# text
seg-2247a2344710 = Signification

# text
seg-f63dd3d7aad4 = Source

# text
seg-1ff32b87e030 = Satellites

# text
seg-582fd72f1a1a = Verdict

# text
seg-430edd66bda0 = Non modélisé

# text
seg-9bae4571f67c = Ajuster le modèle de bruit sur le <b>premier tiers</b> seulement de l'enregistrement.

# text
seg-15b2cb621db7 = Prédire, à partir de ce modèle, la durée de dérive libre à laquelle l'erreur de temps à un sigma atteint { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } et { "2.5" } ns.

# text
seg-1bd9ac435bfa = Sur les <b>deux autres tiers</b>, dériver librement à partir d'un point de synchronisation toutes les { "997" } s, avec la fréquence estimée sur le tiers précédent, et mesurer où l'erreur quadratique moyenne de dérive libre atteint chaque seuil.

# text
# c1: scripts/fetch_cs5071a.sh
# c2: realdata-clock
# c3: KSHANA_REQUIRE_REALDATA=1
seg-d7640a2ec444 = Le seuil de réussite, fixé avant la première exécution du test, est que chaque dépassement prédit se situe à moins d'un facteur { "1.5" } du dépassement mesuré. Un témoin, l'ADEV à une seconde lue comme une FM blanche, doit échouer à ce seuil, afin que le seuil sache distinguer un bon modèle d'un mauvais. Le test affiche son tableau ; une mutation qui divise par deux le niveau de FM blanche le fait échouer. L'enregistrement brut est une donnée tierce ignorée par git : <c1/> le récupère, et le workflow <c2/> exécute le test avec <c3/>, de sorte qu'un fichier manquant fait échouer le test au lieu de le faire sauter.

# text
seg-3d11f7c6d4ab = Ce que cela valide : le chemin ajustement puis inversion, sur un étalon atomique dominé par la FM blanche, pour des dérives libres allant jusqu'à environ { "50 000" } s. Ce que cela ne valide pas : les sources de fiche technique et de classe, les termes déterministes, et un oscillateur à quartz (section suivante).

# text
seg-bfcc5555ed50 = La même prédiction sur un véritable oscillateur à quartz : prudente, non validée

# text
# c1: tests/slot_timing_ocxo_holdout.rs
# c2: allantools
# c3: scripts/fetch_ocxo.sh
# c4: fix_frequency_sigma
seg-b77b3f503ca2 = <c1/> utilise un OCXO mesuré : { "19 982" } lectures de fréquence à une seconde de l'oscillateur de { "10" } MHz d'un analyseur d'impédance HP, face à un maser à hydrogène (A. Wallin, { "2015" }, distribué avec <c2/> ; <c3/>). Le modèle de bruit et une dérive linéaire sont ajustés sur le premier tiers ; chaque dérive libre sur les deux autres tiers part d'une fréquence estimée sur les { "100" } s précédentes, et le modèle porte l'incertitude de cette estimation (<c4/>, l'écart-type d'Allan propre au modèle à { "100" } s).

# text
seg-e05821406c28 = Ajusté sur

# text
seg-c70aadbd47d4 = Dépassement prédit ÷ mesuré, de { "0.2" } à { "10" } ns

# text
seg-d71582148b20 = Lecture

# text
seg-dcc3fd23bede = le premier tiers (mis de côté)

# text
seg-f9bb286f5868 = { "0.59" } à { "0.70" }

# text
seg-612784f70090 = prudent : jamais plus tardif que le mesuré, le plus souvent hors du seuil de { "1.5" }

# text
seg-121fa832c30f = le segment d'évaluation lui-même (diagnostic)

# text
seg-b4be9afa69ac = { "0.98" } à { "1.17" }

# text
seg-75e1515b970a = l'inversion est correcte ; l'écart sur le segment mis de côté vient de l'évolution de l'oscillateur

# text
seg-c91da69e9c09 = Le plancher de bruit de l'oscillateur a été divisé par deux pendant l'enregistrement : l'écart-type d'Allan du premier tiers se stabilise près de { "7.5e-12" }, celui du reste près de { "3.5e-12" }. Un modèle ajusté tôt surestime le bruit, ce qui va dans le sens sûr. <b>Le cas du quartz n'est donc pas validé et reste MODELLED.</b> Pour un quartz, ajustez sur un enregistrement stabilisé et réajustez à mesure que la pièce vieillit.

# text
# c1: fix_frequency_sigma
seg-6230fed0e164 = <b>Comment le protocole a été choisi, précisé parce qu'il n'était pas en aveugle.</b> Une première exécution exploratoire a réutilisé le protocole du césium (fréquence issue du tiers précédent, sans terme de fréquence) et a prédit des dépassements { "1.4" } à { "2.5" } fois plus tardifs que les mesurés : optimiste, le sens dangereux. La fréquence d'un quartz fluctue, donc une fréquence estimée plusieurs heures avant le point de calage est périmée, et le modèle n'avait aucun terme pour la précision avec laquelle la fréquence est connue au point de calage. Le terme <c1/> a été ajouté pour cette raison et ce protocole fixé avant l'écriture du test ; le seuil de réussite n'a pas été déplacé. Le test vérifie aussi que, sans ce terme, la prédiction sur l'échantillon d'ajustement est optimiste à chaque seuil, de sorte que le terme est déterminant.

# text
seg-88e01cac525a = La même prédiction sur des horloges atomiques en orbite : { "8" } sur { "10" }, non validée

# text
# c1: tests/slot_timing_igs_holdout.rs
# c2: scripts/fetch_igs_clocks.sh
seg-17962966b6d6 = <c1/> utilise les horloges combinées finales de l'IGS à { "30" } s pendant { "14" } jours (du { "17" } au { "30" } août { "2025" } ; <c2/>, chaque fichier épinglé par SHA-256) : l'horloge de chaque satellite GPS Block IIF face à l'échelle de temps de l'IGS. Le protocole (ensemble de satellites, règle sur les lacunes, fenêtre d'ajustement, une synchronisation toutes les { "3 570" } s avec la fréquence de l'heure précédente, seuils de { "1" } à { "20" } ns, seuil de { "1.5" }, et règle selon laquelle la classe ne réussit que si chaque satellite réussit) a été consigné avant le téléchargement de toute donnée.

# text
seg-1b5832633c87 = Dépassement prédit ÷ mesuré

# text
seg-4ae1789040de = G06, G08, G09, G10, G24, G26, G27, G32

# text
seg-9a6fac366156 = { "0.76" } à { "1.46" }

# text
seg-c14941cb5537 = dans le seuil

# text
seg-dbaaf875f1fb = { "1.51" } à { "1.99" }

# text
seg-3601e13c39b6 = optimiste

# text
seg-ea41cf6dbec2 = { "1.20" } à { "1.61" }

# text
seg-099fb000bf57 = non évalué

# text
seg-a7699b256ee1 = exclu par la règle sur les lacunes (un jour manquant)

# text
seg-eb71202e0b91 = Huit sur dix constituent un élément de preuve utile, mais deux satellites sont prédits comme tenant plus longtemps qu'ils ne l'ont fait, ce qui est le sens dangereux, et le protocole exige que chaque satellite réussisse. <b>Le cas orbital reste donc MODELLED.</b> Les satellites Block IIF embarquent à la fois des étalons au rubidium et au césium et les fichiers de l'IGS n'indiquent pas lequel est actif ; le résultat est donc énoncé pour les satellites, non pour un type d'horloge. La raison pour laquelle G25 et G30 diffèrent n'a pas été étudiée.

# text
seg-a9be8a92b6b9 = Un bench pour une pièce représentative d'un vol (défini, non réalisé)

# text
seg-43597df55508 = L'enregistrement public d'OCXO dure { "5.5" } heures, provient d'un seul instrument de laboratoire, avec un oscillateur encore en phase de stabilisation. Ce qui validerait le cas du quartz serait une marche libre mesurée plus longue d'un OCXO ou d'un CSAC représentatif d'un vol, face à une référence :

# text
seg-e2698f00a84a = un compteur d'intervalles de temps comparant le { "1" } PPS de l'oscillateur à une référence asservie au GNSS ou à un maser, pendant au moins { "10" } jours à un échantillon par seconde, avec la température consignée ;

# text
seg-c4c902ac028e = le même protocole avec jeu mis de côté : ajuster sur le premier tiers, prédire les dépassements, mesurer sur le reste, avec le même seuil et le même témoin ;

# text
seg-0faaa6279195 = l'enregistrement et son empreinte publiés à côté du test, afin que la ligne soit reproductible.

# text
seg-9b2255563582 = Cela dépend de l'accès à du matériel de référence et n'est pas promis.

# text
seg-6cb2dc94d1bf = Selon quelle métrique de dérive faut-il accepter un créneau ?

# text
seg-f6d24245dca6 = Les normes de synchronisation proposent trois familles de métriques. Pour un créneau indexé sur le temps, une seule mesure ce qui fait échouer le créneau.

# text
seg-496531d9db93 = <b>MTIE</b> (ITU-T G.810) est la plus grande amplitude crête à crête de TIE dans une fenêtre de longueur donnée. Elle est aveugle à un décalage constant : une horloge décalée de { "1" } µs mais parfaitement stable a un MTIE proche de zéro et manque chaque créneau. Elle mesure de combien l'erreur <em>change</em>, non où elle <em>se trouve</em>.

# text
seg-5bdfc694a92a = <b>TDEV</b> (ITU-T G.810) est construit à partir des différences secondes de la phase moyennée. Il supprime un décalage constant et une erreur de fréquence constante, qui sont précisément les termes qui dominent une dérive libre. Il caractérise le type de bruit ; ce n'est pas une métrique d'acceptation pour la synchronisation absolue.

# text
seg-1a9f01b0c786 = <b>max|TE|</b> (ITU-T G.8260 ; la métrique de budget de G.8271) est la plus grande erreur de temps absolue par rapport à l'échelle de temps de référence. Elle se compare directement à une garde.

# text
# c1: E(t)
# c2: t
# c3: T
# c4: E(T)
# c5: L
seg-7eefc395a118 = <b>Conclusion.</b> Acceptez un créneau selon max|TE| par rapport à l'échelle de temps de référence du réseau, évalué comme une enveloppe prédite depuis le dernier point de calage à un facteur de couverture indiqué. C'est ce qu'est <c1/> : comme chaque terme croît avec <c2/>, le maximum sur une dérive libre de durée <c3/> est <c4/>. MTIE et TDEV restent utiles comme diagnostics : TDEV pour identifier quel terme de bruit attaquer, MTIE(L) pour borner de combien l'erreur se déplace pendant un créneau de durée <c5/>.

# text
seg-51d4ee8484d7 = Deux affinements qu'implique le choix de métrique :

# text
# c1: guard/√2
# c2: guard/2
seg-a52524111ed7 = <b>La garde s'applique à l'erreur relative entre deux nœuds.</b> Si l'émetteur et le récepteur dérivent tous deux de façon indépendante, leurs erreurs stochastiques s'ajoutent en quadrature et leurs erreurs déterministes s'ajoutent en valeur absolue. Lorsque la part stochastique domine, on peut attribuer <c1/> à chaque nœud ; lorsque le vieillissement ou la température domine, <c2/>.

# text
seg-073fe7cd8e63 = Le facteur de couverture est un choix de conception, non une propriété de l'horloge.

# text
# c1: k = 3
seg-eb1cbf9fda2d = <c1/> borne environ { "99.7" } % des erreurs gaussiennes à un instant donné, et non sur tous les créneaux d'une journée ; un plan d'acheminement comportant de nombreux créneaux par jour a besoin du risque par créneau qu'il peut tolérer.

# text
seg-04734b8a115b = Leurrage d'un récepteur en orbite

# text
# c1: spoofing
# c2: orbital_timing::orbital_timing
seg-9e734bbda345 = La section <c1/> évalue <c2/> pour la même horloge :

# text
# c1: ρ
# c2: ρ
# c3: ramp_limited_pull_ns
seg-a2f21a643389 = <b>Géométrie.</b> Un leurre au sol n'atteint un satellite en orbite basse que tant que le satellite est au-dessus de son horizon : à { "550" } km, au plus environ douze minutes par passage au zénith. Un leurre qui monte en rampe au taux <c1/> peut donc tirer l'horloge d'au plus <c2/> fois cette fenêtre, ou fois l'intervalle jusqu'au prochain contrôle indépendant s'il est plus court (<c3/>).

# text
seg-ff59489b08b8 = <b>Dynamique.</b> Un décalage de temps en mode commun déplace chaque pseudo-distance de la même quantité et est absorbé dans le biais d'horloge, non dans la position ; un contrôle de position par propagateur d'orbite ne compte donc pas comme un contre-contrôle de synchronisation temporelle.

# text
# c1: tpl
seg-4302cc49b91f = <b>Contre-contrôles.</b> Un satellite dispose rarement d'un second récepteur de synchronisation temporelle indépendant. Il a la dérive libre de sa propre horloge (le moniteur de <c1/>), un transfert de temps bidirectionnel avec une station au sol pendant les contacts, et des comparaisons de temps par liaisons inter-satellites. Une liaison croisée n'est indépendante d'un leurre au sol unique que si le voisin se trouve hors de l'empreinte de ce leurre au même instant, ce que le rapport vérifie à partir du nombre de satellites par plan.

# text
# c1: tpl::timing_protection_level_ns
seg-16c15664a51c = <b>Borne conditionnelle.</b> Le plancher du moniteur plus la dérive libre de l'horloge pendant la latence de détection du CUSUM, se réduisant exactement à <c1/> lorsque l'horloge n'a aucun terme de scintillement, de bruit blanc de phase ou de marche aléatoire. Comme cette borne, elle ne vaut que sous réserve de détection.

# text
# c1: DECEIVED-TIME.md
seg-f7678693be22 = Tout cela est MODELLED : une Terre sphérique et sans rotation, un passage au zénith, un leurre terrestre unique avec un taux de rampe maximal indiqué. La direction d'arrivée des signaux sur une antenne pointée au zénith est un véritable contre-contrôle qui requiert un diagramme d'antenne et n'est pas modélisé. <a1><c1/></a1> explique pourquoi un message de commande signé ne supprime pas cette menace.

# text
# c1: fix_sigma_ns
seg-070a4e72b5ea = Les sauts de fréquence, les effets du rayonnement et les décalages de fréquence relativistes ; un modèle thermique (la variation de température est un échelon au point de calage) ; le protocole de synchronisation lui-même (un point de calage ramène l'erreur à <c1/>).

# text
seg-a2766c0f19d0 = <s1>Précédent</s1>Liaisons optiques à travers l'atmosphère

# text
seg-85ad3eb72a80 = <s1>Suivant</s1>Synchronisation des télécoms
