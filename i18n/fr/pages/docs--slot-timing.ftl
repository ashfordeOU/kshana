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

# text
# c1: docs/SLOT-TIMING.md
seg-f23c8bd5f203 = Source : <c1/>

# text
# c1: slot-timing
seg-1f2727dc4ca4 = Le type de scénario <c1/> répond à trois questions pour une horloge qui dérive librement entre deux synchronisations et doit maintenir le trafic à l'intérieur d'un <b>créneau indexé sur le temps</b> : un créneau de routage, de tâche ou de contact dont la <b>marge de garde</b> est la plus grande erreur de temps absolue, de part et d'autre, pour laquelle le créneau fonctionne encore.

# text
seg-6b39d8afeb5d = <b>Quand la marge de garde est-elle franchie ?</b> Les secondes écoulées depuis la dernière correction jusqu'à ce que l'erreur de temps prédite atteigne la marge de garde, avec chaque terme contributeur détaillé et le terme dominant nommé.

# text
seg-60476d723e1a = <b>Combien de temps reste-t-il maintenant ?</b> Le même chiffre moins le temps déjà écoulé depuis la correction.

# text
seg-84010982db35 = <b>À quelle fréquence l'horloge doit-elle prendre une correction ?</b> Le plus grand intervalle entre corrections qui maintient l'erreur dans la marge de garde, net du délai avant qu'une correction prenne effet.

# text
# c1: spoofing
seg-3388d46925f1 = Une section <c1/> facultative ajoute le niveau de protection de la synchronisation temporelle (TPL) pour un récepteur en orbite ; voir <a1>Leurrage d'un récepteur en orbite</a1>.

# text
# c1: kshana example slot-timing-ocxo-leo
seg-2eb266d992b0 = Exécutez l'exemple fourni avec <c1/>.

# text
seg-624e7a70c4f6 = Abréviations : GNSS, système mondial de navigation par satellite ; TCXO, oscillateur à quartz compensé en température ; OCXO, oscillateur à quartz thermostaté ; RAFS, étalon de fréquence atomique au rubidium ; CSAC, horloge atomique à l'échelle d'une puce ; USO, oscillateur ultra-stable ; DSAC, horloge atomique pour l'espace lointain ; ADEV, écart-type d'Allan ; FM, modulation de fréquence (ici, le bruit sur la fréquence de l'horloge) ; PM, modulation de phase (le bruit sur sa phase) ; IEEE, Institute of Electrical and Electronics Engineers ; ITU-T, secteur de la normalisation des télécommunications de l'Union internationale des télécommunications ; TIE, erreur d'intervalle de temps ; MTIE, erreur maximale d'intervalle de temps ; TDEV, écart de temps ; max|TE|, erreur de temps absolue maximale ; CUSUM, détecteur de changement par sommes cumulées ; TPL, niveau de protection de la synchronisation temporelle ; LEO, orbite terrestre basse ; NIST SP, publication spéciale du National Institute of Standards and Technology ; UFFC, Ultrasonics, Ferroelectrics, and Frequency Control (une revue de l'IEEE Transactions) ; IGS, International GNSS Service ; GPS, Global Positioning System ; Block IIF, les satellites GPS Block II Follow-on ; SHA-256, l'algorithme de hachage sécurisé (Secure Hash Algorithm) à 256 bits ; PPS, impulsion par seconde.

# text
seg-f2a0c73ef648 = Le modèle d'erreur

# text
# c1: t
seg-6bc3f9e78346 = L'erreur de temps prédite après une marche libre de <c1/> secondes depuis une correction est

# text
seg-3fbb186c716a = facteur de couverture ({ "3" } correspond à environ { "99.7" } % d'une erreur gaussienne)

# text
seg-883965151598 = erreur de temps à un sigma de la correction

# text
# c1: W
# c2: σ_y(W)
seg-b63c0447865f = erreur à un sigma de la fréquence connue lors de la correction ; une fréquence estimée sur une fenêtre <c1/> porte environ <c2/>

# text
seg-ab28fc69d3ac = variance du bruit de phase blanc : gigue de l'erreur de temps, un plancher constant

# text
# c1: holdover::coast_phase_variance
seg-8792541a7b6d = densités de FM blanche, de marche aléatoire et de course aléatoire (les termes de van Loan de <c1/>)

# text
seg-5d36b32c4de8 = plancher de FM de scintillation de la variance d'Allan

# text
seg-65da5a90685f = écart fractionnaire de fréquence résiduel laissé après la correction

# text
# c1: ΔT
# c2: c_T
seg-816e427d51f9 = écart de fréquence dû à une variation de température <c1/> par le coefficient de température <c2/>

# text
seg-e23d0ac960aa = taux de vieillissement linéaire

# text
# c1: t²·σ_y²(t)
# c2: σ_y²(τ) = 3σ_PM²/τ² + q_wf/τ + h_F + q_rw·τ/3 + q_rr·τ³/20
# c3: t
# c4: E(t) = guard
seg-43e5f75b369c = Chaque terme de FM est égal à <c1/> pour son propre type de bruit, avec <c2/> (Zucca et Tavella, IEEE Trans. UFFC { "52" }({ "2" }), { "2005" }). Pour la FM blanche, la marche aléatoire et la course aléatoire, cette relation est exacte. Pour la FM de scintillation, c'est l'estimation conventionnelle de l'erreur de prédiction du temps (Riley, NIST SP { "1065" }) : la FM de scintillation n'a pas de forme fermée sans coupure basse fréquence. Les écarts de fréquence s'ajoutent en valeur absolue parce que leurs signes sont inconnus ; la partie déterministe est donc un pire cas. Chaque terme est non négatif et non décroissant en <c3/>, si bien que <c4/> a une seule racine, trouvée par encadrement et bissection.

# text
seg-f9038fba23e2 = D'où vient l'horloge

# text
seg-5c44b2f8d015 = Clé du scénario

# text
seg-cb92ae98c231 = Valeur par défaut de la classe

# text
seg-7594664253f2 = un ADEV à une seconde cité et un plancher de bruit rouge synthétisé deux et quatre décades en dessous

# text
seg-794e4932b470 = MODELLED : la réponse pour une horloge stable est gouvernée par le plancher supposé

# text
seg-5ea820aaa69f = Préréglage de fiche technique

# text
# c1: ocxo
# c2: rubidium
# c3: caesium
# c4: csac
seg-c943490619f3 = les préréglages de synchronisation des télécommunications (<c1/>, <c2/>, <c3/>, <c4/>), chacun étant une fiche technique Microchip nommée

# text
seg-a20353d50011 = MODELLED : une enveloppe des maxima des fiches techniques

# text
seg-b543f3dcd11a = Fiche technique en ligne

# text
seg-4983ec096617 = la propre table d'ADEV du client, son vieillissement et son coefficient de température

# text
seg-b079bca8a611 = MODELLED : une enveloppe des maxima donnés

# text
seg-119d94700cab = Enregistrement mesuré

# text
seg-ae6835f0c3c5 = un enregistrement de phase ; son ADEV avec recouvrement est ajusté par les moindres carrés pondérés

# text
seg-6e1c4702186d = l'inversion est VALIDATED sur un enregistrement réel mis de côté (ci-dessous)

# text
seg-f4cc2be238b7 = Les trois classes ajoutées dans la { "0.28.0" } citent chacune une fiche technique publique :

# text
seg-47f6ddc3bd02 = ADEV à une seconde

# text
seg-5dadad28711a = EndRun Technologies, <em>Disciplined Oscillator Options</em>, colonne TCXO de base

# text
seg-becbff195fff = Fiche technique Microchip OX-208, Rev 12-1-2021

# text
seg-19d8d32203f6 = Fiche technique Microchip 8040C Rubidium Frequency Standard, DS00003047A

# text
seg-48babc170b93 = Les lignes d'EndRun aux longs temps de moyennage convergent dans l'ensemble de ce tableau ({ "4e-13" } pour tous les oscillateurs sauf le TCXO, { "8e-13" }, à { "10 000" } s, et { "6e-14" } pour tous à { "100 000" } s), ce qui laisse penser qu'elles décrivent le produit asservi plutôt que l'oscillateur en marche libre ; elles ne sont donc pas utilisées.

# text
# c1: edf
# c2: 2σ⁴/edf
# c3: √(edf/2)·(model/σ² − 1)
# c4: extrapolated
seg-85c7211bb49b = <b>L'ajustement de l'enregistrement est pondéré.</b> Une estimation de variance d'Allan avec <c1/> degrés de liberté équivalents a une variance d'environ <c2/> ; chaque point entre donc avec le résidu <c3/>. Un ajustement non pondéré laissait les courts temps de moyennage décider des termes des longs temps de moyennage : sur un enregistrement de test à FM blanche, il produisait un plancher de scintillation parasite qui raccourcissait de { "30" } % un franchissement à { "2 000" } s. Une fiche technique ou un enregistrement ne justifie que des temps de moyennage jusqu'à son point le plus long ; un franchissement au-delà est signalé par <c4/>.

# text
seg-5b61a42c76c2 = Validation : l'inversion sur une horloge réelle mise de côté

# text
# c1: tests/slot_timing_cs5071a_holdout.rs
# c2: allantools
# c3: tests/cs5071a_reference.rs
seg-2220a1490923 = <c1/> utilise l'enregistrement de { "556" } 990 échantillons d'un étalon au césium 5071A mesuré par rapport à un maser à hydrogène (A. Wallin, distribué avec <c2/> ; le même enregistrement que celui qu'utilise la référence indépendante de l'estimateur <c3/>). Avec le maser pour référence, l'enregistrement est une marche libre de 6,4 jours.
