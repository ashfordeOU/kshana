# docs--kind-leo-navmsg: translations (fr)

# text
seg-debc2f07db78 = true

# text
seg-cb91473bfdda = Page thématique : <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-1d65b71c5de0 = { "5" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/leo-navmsg.md
seg-648c27220789 = Source : <c1/>

# text
# c1: leo-navmsg
seg-087287602b47 = <c1/> (type de scénario)

# text
seg-49964654d5f4 = Type de scénario du moteur v{ $version }, famille <a1>Navigation en orbite basse</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-867f3e41b5ab = Message de navigation LEO : l'éphéméride et l'horloge diffusées d'un satellite de positionnement, de navigation et de synchronisation temporelle en orbite terrestre basse (LEO), pour toute orbite, porteuse et tout modèle, avec des préréglages nommés facultatifs (Xona Pulsar, Iridium, Starlink, CentiSpace, un système représentatif en bande C, le modèle d'horloge nulle ATOMIC, Celeste IOD). CONTENU : données auxiliaires (SVID, numéro de version des données, bande, état de santé du signal), synchronisation (semaine, temps de la semaine, un polynôme d'horloge du second ordre af0-af2 autour de toc), éphéméride selon l'un de quatre modèles -- l'ensemble képlérien à 16 paramètres de l'ICD SIS de Galileo OS ; cet ensemble plus des polynômes de correction le long de la trace, transversale et radiale ; le modèle à 22 paramètres de Liu et al. { "2025" } ; un polynôme ECEF sans terme d'horloge (horloge nulle ATOMIC) -- et d'autres services (un ensemble diffusé de Klobuchar, NeQuick-G ai0-ai2 avec le niveau d'ionisation effectif, et des paramètres de temps système vers UTC avec la logique de secondes intercalaires de l'ICD). AJUSTEUR : une orbite de référence intégrée avec la gravité zonale J2-J6 ou EGM2008 jusqu'au degré choisi et la traînée, et une horloge libre ou pilotée à graine fixe ; ajustement de Levenberg-Marquardt de l'ensemble képlérien sur des éléments non singuliers, puis polynômes de correction par moindres carrés linéaires ; horloge ajustée déduction faite du terme relativiste que l'utilisateur ajoute. ANALYSES : fit-interval-trade (erreur de distance du signal dans l'espace, SISRE, avec des poids moyennés globalement pour l'altitude d'orbite, en fonction de l'intervalle d'ajustement et de la période de mise à jour, orbite seule et avec horloge), model-comparison (quatre modèles, nombre de paramètres, bits codés, et l'ajustement de Kshana aux altitudes de Liu et al. à côté des chiffres publiés), midpass-update (le passage le plus haut au-dessus d'un utilisateur, la position, l'horloge et le saut de distance utilisateur à chaque changement de message, le saut en pire géométrie, PASS/FAIL par rapport à un seuil de continuité), encode-decode (la trame binaire documentée propre à Kshana avec CRC-24Q, un budget de quantification en demi-pas par champ, un contrôle de trame corrompue, un export et un import d'enregistrement de style RINEX-4 étiquetés extension de Kshana, et une table CSV). VALIDATED : les poids SISRE par rapport au tableau publié MEO/GEO (Montenbruck et al. { "2018" }) ; l'algorithme utilisateur de Galileo par rapport à RTKLIB sur des éphémérides diffusées réelles de Galileo ; le CRC-24Q par rapport à sa valeur de contrôle du catalogue et à la trame d'exemple RTCM { "1005" }. MODELLED : chaque chiffre d'ajustement et de SISRE est une erreur de représentation par rapport à une vérité intégrée par Kshana (sans erreur de détermination ou de prédiction d'orbite) ; la comparaison avec Liu et al. utilise des orbites différentes ; les formats d'encodage et de texte sont ceux propres à Kshana.

# text
# c1: scenarios/leo-navmsg-celeste-iod.toml
seg-e5a4f0290e9e = Une exécution de <c1/> se résume ainsi : LEO navigation message — { "510" } km, { "97.4" } deg, gravity degree { "20" }, model kepler-rac SISRE weights: w_R { "0.459" }, w_AC^{ "2" } 1/2.53 (mask { "0" } deg) encode-decode: kepler-rac model, frame { "152" } bytes ({ "1156" } payload bits, { "891" } ephemeris+clock bits), CRC-24Q 0x58ADF2 quantisation: largest position change { "0.52" } mm, clock { "0.09" } mm; SISRE exact { "0.0013" } m, quantised { "0.0013" } m corrupted frame rejected: true; RINEX round trip { "4.43e-6" } m; CSV round trip { "0.00e0" } m fit-interval trade over { "1800" } s (usage period = fit interval): kepler16 { "60" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0006" } m kepler16 { "120" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0007" } m kepler16 { "300" } s SISRE orbit RMS { "0.0036" } m max { "0.0141" } m with clock RMS { "0.0037" } m kepler16 { "600" } s SISRE orbit RMS { "0.0293" } m max { "0.1023" } m with clock RMS { "0.0293" } m kepler16 { "900" } s SISRE orbit RMS { "0.1073" } m max { "0.3812" } m with clock RMS { "0.1075" } m kepler-rac { "60" } s SISRE orbit RMS { "0.0000" } m max { "0.0000" } m with clock RMS { "0.0005" } m kepler-rac { "120" } s SISRE orbit RMS { "0.0001" } m max { "0.0002" } m with clock RMS { "0.0007" } m kepler-rac { "300" } s SISRE orbit RMS { "0.0005" } m max { "0.0021" } m with clock RMS { "0.0012" } m kepler-rac { "600" } s SISRE orbit RMS { "0.0097" } m max { "0.0395" } m with clock RMS { "0.0096" } m kepler-rac { "900" } s SISRE orbit RMS { "0.0388" } m max { "0.1143" } m with clock RMS { "0.0390" } m L'ensemble képlérien à 16 paramètres se dégrade de { "0.0003" } m à { "60" } s à { "0.1073" } m à { "900" } s : un seul ensemble képlérien avec des harmoniques deux fois par révolution ne peut pas suivre les termes de gravité de plus haute fréquence ni la traînée d'un arc LEO sur plus de quelques minutes, et son résidu des moindres carrés oscille sur la fenêtre. Les polynômes le long de la trace/transversal/radial, d'un degré supérieur à ce que couvre l'ensemble képlérien, absorbent ce qui reste, ce qui donne { "0.0388" } m à { "900" } s.

# text
# c1: name
# c2: description
# c3: seed
# c4: analysis
# c5: preset
# c6: orbit
# c7: clock
# c8: message
# c9: trade
# c10: comparison
# c11: midpass
seg-3f299f6b20c8 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/leo-navmsg-celeste-iod.toml
seg-3adfcd7e275c = L'exemple <c1/> définit, entre autres :

# text
seg-8243db187e2f = [encode-decode, fit-interval-trade]

# text
seg-e866d042aab8 = Celeste IOD message (workshop preset)

# text
seg-c42f5a1ed964 = [kepler16, kepler-rac]

# text
seg-549a6103e711 = bit

# text
seg-fb689f03361c = byte

# text
seg-c60901596100 = Étiquette du résultat (celle du moteur) : MIXED — éléments de base VALIDATED, résultats MODELLED. Les poids SISRE reproduisent le tableau publié MEO/GEO (Montenbruck et al. { "2018" }), l'algorithme utilisateur de l'ICD Galileo reproduit RTKLIB sur des éphémérides diffusées réelles de Galileo, et le CRC-24Q reproduit sa valeur de contrôle du catalogue et la trame d'exemple RTCM { "1005" }

# attr:alt
seg-35e92abc6a23 = Le graphique que le moteur écrit pour scenarios/leo-navmsg-celeste-iod.toml, type de scénario leo-navmsg

# text
seg-43c1d9c81ccf = MODELLED { "5" } · VALIDATED { "6" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-efbe11be7ca1 = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights : le poids radial w_R et le poids transversal au carré w_AC^{ "2" } comme moyennes de cos^{ "2" } et de la moitié de sin^{ "2" } de l'angle de nadir de la ligne de visée sur des utilisateurs uniformément répartis sur la calotte terrestre visible au-dessus d'une élévation

# text
seg-b27c5fe8e179 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point : l'évaluation képlérienne de l'ICD SIS de Galileo OS (équation de Kepler, corrections du second harmonique, nœud fixé à la Terre) écrite séparément de l'évaluateur RINEX du moteur, renvoyant la position avec l'argument Tests : <a1>leo_navmsg_reference.rs</a1>.

# text
seg-3a53131dc9a4 = <b>VALIDATED</b> leo_navmsg::codec::crc24q : polynôme générateur 0x1864CFB, valeur initiale { "0" }, sans réflexion, sans XOR final, le contrôle que la trame LEO de Kshana porte sur chaque octet précédent

# text
# c1: leo-navmsg
seg-2b24c2669c23 = <b>VALIDATED</b> L'ajusteur et le compromis du type de scénario <c1/> : une orbite de référence intégrée avec la gravité zonale J2-J6 ou EGM2008 jusqu'au degré choisi et la traînée, et une horloge libre ou pilotée à graine fixe ; un ajustement de Levenberg-Marquardt de l'ensemble képlérien de Galileo sur des éléments non singuliers

# text
seg-ddb27b07b9af = et { "7" } autres dans la matrice.

# text
seg-053dae66c1be = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights : le poids radial w_R et le poids transversal au carré w_AC^{ "2" } comme moyennes de cos^{ "2" } et de la moitié de sin^{ "2" } de l'angle de nadir de la ligne de. Référence indépendante (ExternalDataset) : le tableau publié des facteurs de pondération SISRE de Montenbruck, Steigenberger et Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041 : GPS { "0.98" } et 1/49, GLONASS { "0.98" } et 1/45, Galileo { "0.98" } et 1/61, BeiDou MEO { "0.98" } et 1/54, BeiDou IGSO/GEO { "0.99" } et 1/126. La même moyenne évaluée aux rayons LEO donne le

# text
seg-5b43ffde4634 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point : l'évaluation képlérienne de l'ICD SIS de Galileo OS (équation de Kepler, corrections du second harmonique, nœud fixé à la Terre) écrite séparé. Référence indépendante (ExternalDataset) : positions ECEF eph2pos de RTKLIB 2.4.2-p13 (une implémentation indépendante du même algorithme de l'ICD) pour de vrais enregistrements de diffusion BKG/IGS du 2024-09-10, tous deux versionnés avec leur provenance dans tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Cela valide l'algorithme utilisateur képlérien ; les corrections le long de la trace/transversales/radiales ajoutées par-dessus sont couvertes par leurs propres lignes, et les termes de Liu b

# text
seg-5b4f1e63795f = <b>VALIDATED</b> leo_navmsg::codec::crc24q : polynôme générateur 0x1864CFB, valeur initiale { "0" }, sans réflexion, sans XOR final, le contrôle que la trame LEO de Kshana porte sur chaque octet préc. Référence indépendante (ExternalDataset) : la valeur de contrôle du catalogue CRC pour ces paramètres (catalogue CRC de reveng.sourceforge.io, CRC-24/LTE-A : largeur { "24" }, poly 0x864CFB, init { "0" }, contrôle 0xCDE703), qui sont les paramètres CRC-24Q de RTCM { "10403" } et de l'ICD SIS de Galileo OS, et la trame d'exemple de type de message { "1005" } imprimée dans RTCM { "10403" }

# text
# c1: leo-navmsg
seg-6e2719a28884 = <b>VALIDATED</b> L'ajusteur et le compromis du type de scénario <c1/> : une orbite de référence intégrée avec la gravité zonale J2-J6 ou EGM2008 jusqu'au degré choisi et la traînée, et une horloge à graine fixe, libre ou pilot. Référence indépendante (ExternalDataset) : de vraies orbites scientifiques précises comme vérité (orbites opérationnelles à dynamique réduite de TU Graz IfG/ITSG, libres pour tout usage avec mention de la source ; valeurs SHA-256 dans le NOTICE de la fixture) ajustées par l'ensemble à 16 paramètres sur des arcs de { "20" } et { "30" } min, par rapport aux statistiques que Liu et al. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) publient pour les mêmes satellites et les mêmes jours : RMS le long de la trace, transversal et radial chacun à moins de 1,5x (mesuré { "0.804" } à { "1.087" }), SISR

# text
# c1: limitations[0]
seg-0c26ec09bf16 = Le SISRE est l'erreur de représentation du message par rapport à la vérité à laquelle il a été ajusté ; l'erreur de détermination d'orbite et l'erreur de prédiction d'orbite ne sont pas modélisées. (résultat <c1/>)

# text
# c1: limitations[1]
seg-3762de39de07 = L'orbite de référence est une intégration numérique de Kshana (gravité zonale ou EGM2008, traînée exponentielle statique), et non l'orbite précise d'un satellite réel ; ni troisième corps, ni pression de radiation solaire, ni marées. (résultat <c1/>)

# text
# c1: limitations[2]
seg-4486dd350b57 = Le format binaire est un encodage documenté propre à Kshana, modélisé sur les composantes de message publiées ; ce n'est pas la disposition des bits de Celeste ni d'aucun autre système (aucune n'est publique). (résultat <c1/>)

# text
# c1: limitations[3]
seg-2a5c1bce8320 = Le bloc de style RINEX est une extension documentée de Kshana ; RINEX { "4.02" } ne définit aucun enregistrement de navigation LEO. (résultat <c1/>)

# text
# c1: limitations[4]
seg-642d8f4d60e7 = Les coefficients NeQuick-G sont portés et le niveau d'ionisation effectif est calculé, mais l'intégration de la densité électronique de NeQuick qui le transforme en retard n'est pas implémentée ; le retard de Klobuchar l'est, mis à l'échelle de la porteuse par 1/f^{ "2" } sans correction pour un satellite volant à l'intérieur de l'ionosphère. (résultat <c1/>)

# text
# c1: limitations[5]
seg-8ba04a3147bd = Les termes à 22 paramètres de Liu et al. { "2025" } suivent l'algorithme utilisateur de l'article (éq. 1-7) et sa stratégie d'ajustement (section { "2.3" }) ; ses chiffres de SISRE en fonction de l'altitude utilisaient de vraies orbites précises, de sorte que cette comparaison sur une orbite intégrée par Kshana est MODELLED, et non VALIDATED (la comparaison sur orbite réelle est tests/leo_navmsg_fit_real_orbit_oracle.rs). (résultat <c1/>)

# text
# c1: label
seg-b3585c7feb4e = MIXED — éléments de base VALIDATED, résultats MODELLED. Les poids SISRE reproduisent le tableau publié MEO/GEO (Montenbruck et al. { "2018" }), l'algorithme utilisateur de l'ICD Galileo reproduit RTKLIB sur des éphémérides diffusées réelles de Galileo, et le CRC-24Q reproduit sa valeur de contrôle du catalogue et la trame d'exemple RTCM { "1005" }. Chaque chiffre d'ajustement, de SISRE, de continuité et de quantification est MODELLED : l'erreur de représentation d'un message par rapport à une (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-d6e412aab1b4 = MODELLED : chaque chiffre d'ajustement et de SISRE est une erreur de représentation par rapport à une vérité intégrée par Kshana (sans erreur de détermination ou de prédiction d'orbite) ; la comparaison avec Liu et al. (catalogue des types de scénario (<c1/>))

# text
seg-c5478f572d21 = Page de famille : <a1>Navigation en orbite basse</a1>

# text
seg-d9257241d523 = Page thématique : <a1>LEO-NAVMSG.md</a1>

# text
seg-b0dcad22aed6 = <s1>Précédent</s1>launch-window

# text
seg-2984c4c69850 = <s1>Suivant</s1>leo-pass
