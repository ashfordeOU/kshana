# docs--leo-navmsg: translations (fr)

# text
seg-cc651d9cef3b = Code

# text
seg-cbf0f9bcd2d8 = Référence indépendante

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-35f8f623ea28 = { "30" } s

# text
seg-f63dd3d7aad4 = Source

# text
seg-e305279d5b11 = Contenu

# text
seg-4d208b6c0eb8 = jour

# text
seg-a7d59ba6e225 = rad

# text
seg-02dc0d42fb21 = sfu

# text
# c1: docs/LEO-NAVMSG.md
seg-0f2d3faa9934 = Source : <c1/>

# text
# c1: leo-navmsg
seg-d8aaee95aa44 = Le type de scénario <c1/> construit le message d'éphéméride et d'horloge diffusé d'un satellite de positionnement, navigation et synchronisation temporelle (PNT) en orbite terrestre basse (LEO), et répond aux questions que se pose un concepteur de message : combien de temps un message peut-il couvrir, qu'apporte chaque paramètre supplémentaire, que voit un utilisateur lorsque le message change en milieu de passage, et combien de bits faut-il pour le porter au centimètre.

# text
seg-e61283b1e1a5 = Il est indépendant du système. N'importe quelle orbite, n'importe quelle porteuse et n'importe lequel des quatre modèles d'éphéméride s'exécutent sans aucun préréglage ; les préréglages nommés sont des données facultatives (voir <a1>Préréglages</a1>).

# text
# c1: kshana example <name>
# c2: kshana scenarios/<name>.toml
# c3: leo-navmsg-fit-interval-trade
# c4: leo-navmsg-model-comparison
# c5: leo-navmsg-midpass-update
# c6: leo-navmsg-encode-decode
# c7: leo-pnt-chain
# c8: leo-focus-data-services
seg-1271cd4ad822 = Affichez un exemple fourni avec <c1/> (un nom par appel) et exécutez-le avec <c2/> : <c3/>, <c4/>, <c5/> et <c6/>. Le type est aussi l'étape de message du type <c7/> (<a1>LEO-PNT.md</a1>) et le membre de la campagne <c8/>, qui compose quatre configurations de message et rapporte la longueur de trame de chacune ({ "146" }, { "154" }, { "159" } et { "171" } octets).

# text
# c1: src/leo_navmsg/
# c2: elements.rs
# c3: truth.rs
# c4: fit.rs
# c5: sisre.rs
# c6: services.rs
# c7: codec.rs
# c8: text.rs
# c9: presets/
# c10: mod.rs
seg-51da9ffaa0ec = Code : <c1/> — <c2/> (enregistrements et algorithme utilisateur), <c3/> (orbite et horloge de référence), <c4/> (ajusteur), <c5/> (erreur de distance du signal dans l'espace), <c6/> (ionosphère et temps universel coordonné (UTC)), <c7/> (format binaire), <c8/> (exports de type Receiver Independent Exchange Format (RINEX) et de valeurs séparées par des virgules (CSV)), <c9/> (un fichier par préréglage), <c10/> (le type).

# text
seg-0505113a62e3 = Ce que porte un message

# text
seg-6752521002b2 = Partie

# text
seg-cf6ae60eea4f = Auxiliaire

# text
seg-00eae74cb1e6 = identifiant du véhicule spatial (SVID), numéro de version des données (IOD), identifiant de bande, état de santé du signal (convention Galileo : { "0" } OK, { "1" } hors service, { "2" } opérations étendues, { "3" } en test)

# text
seg-0bdbdd2c923b = Synchronisation

# text
# c1: af0 + af1·(t − toc) + af2·(t − toc)²
seg-8120237b02ea = numéro de semaine, temps de semaine (TOW) de l'émission, et un polynôme d'horloge du second ordre <c1/>

# text
seg-b09dc4b322d3 = Éphéméride

# text
seg-bbb3225e1d19 = l'un des quatre modèles ci-dessous

# text
seg-3a835a49b43f = Autres services

# text
# c1: ai0, ai1, ai2
# c2: A0, A1, ΔtLS, t0t, WNot, WNLSF, DN, ΔtLSF
seg-2a13461cb60c = un jeu ionosphérique diffusé de Klobuchar, des coefficients Galileo NeQuick-G <c1/> avec cinq indicateurs de tempête, et des paramètres du temps système vers l'UTC <c2/>

# text
seg-6b899ef63047 = Modèles d'éphéméride

# text
seg-60cd077d82a7 = Modèle

# text
seg-2afa300864a9 = Paramètres

# text
# c1: √A, e, i0, Ω0, ω, M0, Δn, Ω̇, i̇, Cuc, Cus, Crc, Crs, Cic, Cis, toe
seg-3e8a1cf183cc = le jeu képlérien du document de contrôle d'interface du signal dans l'espace du service ouvert Galileo (OS SIS ICD) : <c1/>

# text
# c1: a0…
# c2: c0…
# c3: r0…
# c4: τ = tk / tau_s
# c5: tau_s
# c6: rac_degrees
seg-b1416ba3472f = le même, plus des polynômes de correction sur la trace, transverse et radiale (RAC) <c1/>, <c2/>, <c3/> en <c4/>, coefficients en mètres, <c5/> la puissance de deux supérieure ou égale à la moitié de l'intervalle d'ajustement (transmise), degrés fixés par <c6/> (par défaut { "7" }, { "5" }, { "6" })

# text
seg-9c0643152bbf = { "16" } + { "21" } par défaut, plus l'échelle de temps

# text
# c1: ȧ, ṅ, Crs3, Crc3, Crs1, Crc1
seg-e0afd541d64c = le modèle à 22 paramètres de Liu, Su, Xie, Zhou et Qu ({ "2025" }, <em>Remote Sensing</em> { "17" }({ "16" }) : { "2894" }, doi <a1>10.3390/rs17162894</a1>) : les { "16" } plus <c1/>

# text
# c1: τ = (t − t_ref) / 64 s
seg-a6042071a03f = le modèle « zéro horloge » ATOMIC (Autonomous Time and Orbit Determination for Microsatellite Constellations) : un polynôme dans un repère centré sur la Terre et fixe par rapport à elle (ECEF) par axe en <c1/> (degré { "6" } par défaut), sans termes d'horloge car l'horloge du satellite est asservie au temps système (<a1>InsideGNSS</a1>)

# text
seg-5869d6f65796 = { "22" } par défaut

# text
# c1: elements::sat_state
# c2: kepler-rac
# c3: F·e·√A·sin E
# c4: ecef-poly
# c5: −2 r·v / c²
seg-6663aa3eeebc = L'algorithme utilisateur (<c1/>) est la séquence de l'ICD Galileo (équation de Kepler, corrections du second harmonique, nœud fixe par rapport à la Terre) suivie, pour <c2/>, des trois polynômes le long du propre repère de l'orbite képlérienne : radial le long de la position évaluée, transverse le long de la normale à l'orbite à partir de l'inclinaison et du nœud corrigés, sur la trace complétant le trièdre. L'horloge ajoute le terme relativiste de l'ICD <c3/> ; pour <c4/>, c'est la forme générale <c5/> à partir du polynôme et de sa dérivée.

# text
# c1: A = A0 + ȧ·tk
# c2: n = √(μ/A0³) + Δn + ṅ·tk
# c3: ½·ṅ·tk
# c4: ṅ
# c5: Crs1·sin Φ + Crc1·cos Φ + Crs3·sin 3Φ + Crc3·cos 3Φ
# c6: Φ
# c7: ṅ
# c8: ṅ
# c9: nDot
seg-b3935a85a7b2 = Les termes de Liu et al. suivent l'algorithme utilisateur de l'article (Section { "2.2" }, Éq. 1-7) : <c1/>, <c2/> (les versions antérieures à { "0.30" } utilisaient la convention de navigation civile du Global Positioning System (GPS) <c3/>, de sorte qu'un <c4/> qu'elles écrivaient valait le double de celui de l'article), et <c5/> ajouté au rayon, <c6/> l'argument de latitude non corrigé. La convention d'échelle de <c7/> est transcrite de l'Éq. { "1" } de l'article ; la comparaison avec l'article sur des orbites réelles n'en dépend pas (un facteur ½ sur <c8/> laisse inchangée chaque valeur ajustée), de sorte que la signification d'une valeur <c9/> transmise n'y est pas validée.

# text
seg-9a83292bffcf = Deux lectures sont propres à Kshana et sont présentées comme telles :

# text
# c1: τ = tk / tau_s
seg-0e42fd0d5cf9 = Le repère RAC et la normalisation <c1/>. Aucun document public ne définit de repère de correction LEO pour un message diffusé.

# text
seg-1b8aaed09de8 = L'horloge d'un message à zéro horloge est nulle au total : la boucle d'asservissement est supposée maintenir l'horloge apparente, terme relativiste compris, au temps système.

# text
seg-3472ce139588 = L'ajusteur

# text
# c1: truth.rs
# c2: θ(t) = θ0 + Ω̇e·t
# c3: gravity_degree = 0
seg-4404a677d185 = <c1/> intègre l'orbite avec un Runge–Kutta du quatrième ordre à pas fixe dans un repère qui se transforme en axes fixes par rapport à la Terre par une seule rotation, <c2/>, la même rotation unique qu'applique un algorithme utilisateur de diffusion. La gravité est à deux corps (<c3/>), les harmoniques zonaux J2 à J6 ({ "2" } à { "6" }), ou le champ du Earth Gravitational Model { "2008" } (EGM2008) jusqu'au degré et à l'ordre { "7" } à { "70" }, dont les termes tesséraux portent la signature à courte période qui rend difficile un ajustement en LEO. La traînée est facultative (densité exponentielle statique). L'horloge est en marche libre (biais, dérive, taux de dérive et bruit de fréquence blanc à un écart-type d'Allan à une seconde indiqué, plus le terme relativiste périodique) ou asservie (un résidu de Gauss–Markov du premier ordre).

# text
# c1: fit.rs
# c2: e·cos ω
# c3: e·sin ω
# c4: λ0 = M0 + ω
# c5: ω
# c6: M0
# c7: toe
# c8: liu22
seg-ae3052e66b2a = <c1/> ajuste le jeu képlérien par Levenberg–Marquardt sur des éléments non singuliers (<c2/>, <c3/>, <c4/>) : une orbite LEO est presque circulaire, de sorte que <c5/> et <c6/> seuls sont presque indiscernables. Il part de l'état osculateur à <c7/> avec le taux de nœud dû à J2. Des a priori faibles centrés sur zéro bornent les taux et les harmoniques qu'un arc court ne peut résoudre ; avec un poids d'observation de { "1" } cm, ils n'agissent que dans ces directions nulles. L'ajustement <c8/> adopte en revanche le départ et l'estimateur de la Section { "2.3" } de l'article : il part avec chaque terme de correction à zéro, sans a priori (moindres carrés simples) et conserve le plafond de 100 itérations de l'article. Il s'arrête selon la propre règle de convergence des paramètres de Kshana, lorsque chaque pas de paramètre est inférieur à { "1e-3" } de son écart-type formel ; l'article s'arrête plutôt lorsque le RMS varie de moins de { "0.1" } mm. Les polynômes RAC sont ensuite ajustés aux résidus sur la trace/transverse/radial par moindres carrés linéaires, et le polynôme d'horloge à l'horloge de référence moins le terme relativiste que l'utilisateur rajoutera.

# text
# c1: src/celeste_iod.rs
# c2: toe
# c3: toc
seg-020f45edcae1 = Un constat que les valeurs par défaut encodent : après un ajustement képlérien par moindres carrés, le résidu est par construction ce que les { "16" } paramètres ne peuvent pas couvrir, de sorte qu'il oscille sur la fenêtre (plusieurs passages par zéro dans chaque composante) au lieu de dériver. Un polynôme de correction ne l'élimine que si son degré dépasse ce que le jeu képlérien couvre déjà : { "7" } sur la trace, { "5" } transverse et { "6" } radial ramènent un résidu de 15 minutes de quelques centimètres à environ un millimètre, tandis que des degrés transverses plus faibles n'éliminent presque rien (le résidu transverse est impair par rapport au centre de la fenêtre). Un système qui dérive sa partie képlérienne d'une autre façon laisse un résidu de forme différente, et les degrés dont il a besoin en découlent. Les propres degrés de correction du préréglage Celeste (plus bas que ceux-ci ; ils n'existent que dans le fichier de préréglage, <c1/>) s'exécutent ici sur la base de moindres carrés de Kshana, ce qui explique que ses termes transverses contribuent peu dans ce moteur : une affirmation sur l'ajusteur de Kshana, et non sur un système réel. <c2/> et <c3/> sont des secondes entières, comme les porte le format binaire.

# text
seg-f3538e6651fa = Chaque message est utilisé sur une période centrée dans sa fenêtre d'ajustement (le premier tableau de compromis utilise la fenêtre entière). Ce que mesurent les valeurs d'erreur de distance du signal dans l'espace (SISRE) est l'<b>erreur de représentation</b> du message par rapport à la référence sur laquelle il a été ajusté, sous forme de valeur quadratique moyenne (RMS) et de maximum sur l'intervalle. L'erreur de détermination d'orbite et de prédiction d'orbite, qu'un vrai segment sol ou embarqué ajoute en plus, n'est pas modélisée.

# text
seg-c2b181269367 = Erreur de distance du signal dans l'espace

# text
# c1: sisre.rs
seg-63462a1abc95 = <c1/> utilise le SISRE moyen global de Montenbruck, Steigenberger et Hauschild ({ "2018" }, <em>Advances in Space Research</em> { "61" }({ "12" }) : { "3020" }–{ "3038" }, doi <a1>10.1016/j.asr.2018.03.041</a1>) :

# text
# c1: cos² η
# c2: ½ sin² η
# c3: η
seg-c4f654264c42 = Les poids sont les moyennes sur des utilisateurs répartis uniformément sur la calotte terrestre visible de <c1/> et <c2/>, avec <c3/> l'angle au nadir de la ligne de visée au satellite, calculés pour le rayon propre de l'orbite et le masque d'élévation. À un masque de { "0" }°, le calcul reproduit le tableau de l'article pour l'orbite terrestre moyenne (GPS { "0.98" } et 1/49, GLONASS 1/45, Galileo 1/61, BeiDou 1/54) et l'orbite géostationnaire ({ "0.99" } et 1/126) : c'est la vérification <b>VALIDATED</b>. En LEO, la même moyenne donne

# text
seg-66b488889b10 = Altitude

# text
seg-c07128592d7b = angle au nadir de l'horizon

# text
seg-a4e04d9a23a5 = { "320" } km

# text
seg-002adc24471f = { "510" } km

# text
seg-fe2f70c29806 = { "550" } km

# text
seg-4dee38ff0811 = { "786" } km

# text
seg-cfc3c6939861 = { "1080" } km

# text
seg-102de0413553 = { "1336" } km

# text
seg-1b11819c8b2f = de sorte qu'un utilisateur LEO, qui voit le satellite loin du nadir, ressent beaucoup plus les erreurs sur la trace et transverses qu'un utilisateur en orbite moyenne.

# text
seg-b7a844ab6135 = Analyses

# text
# c1: analysis = [...]
seg-17111fe25e04 = <c1/> choisit l'une des quatre (toutes par défaut).

# text
seg-d0c1b335af73 = Compromis sur l'intervalle d'ajustement

# text
# c1: [trade]
# c2: scenarios/leo-navmsg-fit-interval-trade.toml
seg-f65e99c0d8b2 = <c1/> fixe l'intervalle, les intervalles d'ajustement, les périodes de mise à jour et les modèles. <c2/> ({ "550" } km, { "97.6" }°, EGM2008 jusqu'au degré { "20" } et traînée, { "30" } minutes de messages) donne, avec une période d'utilisation égale à l'intervalle d'ajustement :

# text
seg-f1a94c795c18 = Intervalle d'ajustement

# text
seg-c6b034712788 = RMS SISRE d'orbite

# text
seg-55c287c93940 = Max SISRE d'orbite

# text
seg-ad604a608329 = RMS SISRE avec horloge

# text
seg-28723ab60ae0 = RMS radial / sur la trace / transverse

# text
seg-911a62245e80 = { "60" } s

# text
seg-1a35a89c1a34 = { "0.041" } cm

# text
seg-7cf9e6e3178f = { "0.179" } cm

# text
seg-d8a7f4c080dd = { "0.069" } cm

# text
seg-93773d45092a = { "0.09" } / { "0.01" } / { "0.00" } cm

# text
seg-64015edf42d8 = { "120" } s

# text
seg-a1070c338686 = { "0.032" } cm

# text
seg-cdacf90f8ce8 = { "0.160" } cm

# text
seg-29aeee696ad2 = { "0.079" } cm

# text
seg-1d2d7b57af6b = { "0.06" } / { "0.01" } / { "0.01" } cm

# text
seg-8fa4e4ccc5cc = { "180" } s

# text
seg-13182ae6d536 = { "0.093" } cm

# text
seg-fc692062aaa8 = { "0.540" } cm

# text
seg-9ef760f0777c = { "0.134" } cm

# text
seg-9a7db44eb20e = { "0.18" } / { "0.06" } / { "0.00" } cm

# text
seg-bbd4f2685bee = { "300" } s

# text
seg-93410318239b = { "0.310" } cm

# text
seg-4af8f1c977eb = { "1.033" } cm

# text
seg-0921a535896a = { "0.329" } cm

# text
seg-d50195d4cbea = { "0.09" } / { "0.49" } / { "0.02" } cm

# text
seg-8de43db30454 = { "450" } s

# text
seg-ec7f9ca7654b = { "1.690" } cm

# text
seg-1ad55674fab9 = { "7.542" } cm

# text
seg-a022913c956d = { "1.696" } cm

# text
seg-31564c73398d = { "0.72" } / { "2.65" } / { "0.04" } cm

# text
seg-21b0c99fbda4 = { "600" } s

# text
seg-6840aea9ff12 = { "2.875" } cm

# text
seg-798c8c1d0190 = { "10.219" } cm

# text
seg-6b3b442069d8 = { "2.866" } cm

# text
seg-8a53398e1999 = { "1.72" } / { "4.42" } / { "0.26" } cm

# text
seg-4dabf1faddfc = { "900" } s

# text
seg-d733d3fdac02 = { "9.345" } cm

# text
seg-3334d120521b = { "34.032" } cm

# text
seg-4d4a2cc180d0 = { "9.349" } cm

# text
seg-7651a43f1f33 = { "6.46" } / { "14.14" } / { "0.91" } cm

# text
seg-f1d733b03f45 = { "0.000" } cm

# text
seg-81a60d921ce9 = { "0.057" } cm

# text
seg-724c7750b1ca = { "0.00" } / { "0.00" } / { "0.00" } cm

# text
seg-c8a720a6f160 = { "0.074" } cm

# text
seg-b13f5539e4b1 = { "0.001" } cm

# text
seg-1c9d3ee30ac7 = { "0.090" } cm

# text
seg-7dd08c671dc7 = { "0.004" } cm

# text
seg-740e69fcd85e = { "0.014" } cm

# text
seg-c0db4312d8a0 = { "0.106" } cm

# text
seg-e971c2fe0bb2 = { "0.00" } / { "0.00" } / { "0.01" } cm

# text
seg-f3bda174cbef = { "0.037" } cm

# text
seg-5a5bb868e8ff = { "0.176" } cm

# text
seg-02b99fcb9fee = { "0.127" } cm

# text
seg-e6c45fda719f = { "0.05" } / { "0.01" } / { "0.04" } cm

# text
seg-ec1e77bc5be9 = { "0.214" } cm

# text
seg-d3c1ed834802 = { "0.643" } cm

# text
seg-23482e7c028f = { "0.229" } cm

# text
seg-8f71690a7139 = { "0.28" } / { "0.09" } / { "0.26" } cm

# text
seg-bfec9407ffae = { "1.015" } cm

# text
seg-f295ad6efcf4 = { "3.695" } cm

# text
seg-2cd92d16edfc = { "1.062" } cm

# text
seg-4626119411c4 = { "1.52" } / { "0.70" } / { "0.91" } cm

# text
seg-4e19f776d1b7 = Et avec un ajustement de { "300" } s, en faisant varier la fréquence à laquelle un nouveau message prend le relais :

# text
seg-89810ffbeff3 = Période de mise à jour

# text
seg-d4d1fa05e1a8 = { "0.314" } cm

# text
seg-828b7488993b = { "0.850" } cm

# text
seg-edb934c1419f = { "0.288" } cm

# text
seg-52c8f821a7d2 = { "0.859" } cm

# text
seg-e135107af135 = { "150" } s

# text
seg-e7ce46d74f3e = { "0.219" } cm

# text
seg-3391df1cf909 = { "0.830" } cm

# text
seg-d6eb4f554461 = { "0.009" } cm

# text
seg-22c68874002b = { "0.010" } cm

# text
seg-2172d9ea618e = Le jeu képlérien à 16 paramètres se dégrade de { "0.04" } cm à { "60" } s à { "9.35" } cm à { "900" } s : un seul jeu képlérien avec des harmoniques deux fois par révolution ne peut pas suivre les termes de gravité de plus haute fréquence ni la traînée d'un arc LEO pendant plus de quelques minutes, et son résidu de moindres carrés oscille sur la fenêtre. Les polynômes sur la trace/transverse/radial (degrés { "7" }, { "5" }, { "6" }) absorbent ce qui reste : { "1.01" } cm à { "900" } s, { "0.21" } cm à { "600" } s. Aux intervalles les plus courts, les valeurs képlériennes sont sub-millimétriques et ne sont plus strictement ordonnées (l'ajustement est alors limité par le conditionnement, et non par le modèle).

# text
seg-aca262796570 = Comparaison de modèles

# text
# c1: scenarios/leo-navmsg-model-comparison.toml
seg-fdf2368d0210 = <c1/> exécute les quatre modèles à { "1" }, { "5" } et { "10" } minutes sur la même orbite, avec le nombre de paramètres et les bits d'éphéméride et d'horloge dans l'encodage de Kshana :

# text
seg-7d3c6c43390d = Bits d'éphéméride + horloge

# text
seg-f7f60c66d89e = { "0.022" } cm

# text
seg-f7bcb8a44fde = { "0.049" } cm

# text
seg-2972b631701e = { "0.230" } cm

# text
seg-cc42e8dc7238 = { "0.260" } cm

# text
seg-67e50069c6f7 = { "3.061" } cm

# text
seg-780954ab9d7f = { "3.071" } cm

# text
seg-de81d6550264 = { "0.044" } cm

# text
seg-fb171bf75f27 = { "0.005" } cm

# text
seg-c8c067631f7a = { "0.120" } cm

# text
seg-2dc41855c245 = { "0.208" } cm

# text
seg-6ef79938dd22 = { "0.046" } cm

# text
seg-7e96d7e34e63 = { "0.142" } cm

# text
seg-c43199891163 = { "0.258" } cm

# text
seg-f9a9fdebc114 = { "0.290" } cm

# text
# c1: ecef-poly
seg-f157ff5b40b1 = <c1/> (zéro horloge)

# text
seg-9474a775dc5e = { "28.784" } cm

# text
seg-5098c8b6f813 = { "0.561" } cm

# text
seg-5e7fdc441b03 = { "28.774" } cm

# text
seg-82d3fa2e27ef = La ligne à zéro horloge est évaluée par rapport à une horloge asservie avec un résidu de { "0.24" } m (la valeur d'ATOMIC), les autres par rapport à l'horloge en marche libre qu'elles ajustent.

# text
seg-769db176020f = <b>Liu et al. { "2025" }, SISRE en fonction de l'altitude (MODELLED).</b> Le même scénario ajuste le modèle à 22 paramètres de Kshana sur des arcs de 20 minutes aux cinq altitudes de l'article, à l'inclinaison de chaque satellite :

# text
seg-01e587427a7e = Satellite

# text
seg-f6bbd3d5d75c = Inclinaison

# text
seg-c54d0bd7d498 = Liu et al. { "2025" }

# text
seg-16c489b75f44 = Kshana (RMS d'orbite seule)

# text
seg-ee4816ca13c1 = rapport

# text
seg-510349500d23 = { "8.88" } cm

# text
seg-a97bde451ec2 = { "4.25" } cm

# text
seg-b6c1d48847d9 = { "475" } km

# text
seg-f79249e9bd75 = { "6.21" } cm

# text
seg-9b6757a674a5 = { "2.87" } cm

# text
seg-62008169ca69 = { "2.20" } cm

# text
seg-06a4bcde0ea3 = { "966" } km

# text
seg-9e5e06ec23c3 = { "2.11" } cm

# text
seg-41ce80bc0b62 = { "1.25" } cm

# text
seg-c9f63cd8bd07 = { "0.75" } cm

# text
seg-f11a960a1d52 = { "0.51" } cm

# text
# c1: tests/leo_navmsg_fit_real_orbit_oracle.rs
seg-0376cf5f98f0 = Ce n'est <b>pas</b> une validation. L'article a ajusté de vraies orbites scientifiques précises des satellites nommés (avec leur historique complet de gravité, de traînée et de forces non gravitationnelles) ; Kshana ajuste sa propre orbite intégrée, évalue les six paramètres ajoutés comme décrit ci-dessus, et utilise ses propres poids SISRE. La comparaison montre la tendance et l'ordre de grandeur. La comparaison sur les mêmes orbites réelles que l'article a ajustées est <c1/> (depuis { "0.30" }, l'ajustement à 22 paramètres y concorde à l'intérieur du facteur { "1.5" } préenregistré, sur les jours de l'article et sur huit jours réservés).

# text
seg-d82887c766e3 = Mise à jour en milieu de passage

# text
# c1: [midpass]
# c2: search_s
# c3: update_period_s
# c4: threshold_m
# c5: scenarios/leo-navmsg-midpass-update.toml
seg-d1104b6ea7fa = <c1/> place un utilisateur (par défaut { "45" }° N, { "10" }° E), trouve le passage le plus haut au-dessus du masque dans <c2/>, et planifie des messages toutes les <c3/>. À chaque changement pendant le passage, il rapporte le saut de position, le saut d'horloge, le saut de pseudodistance de l'utilisateur (nouveau message moins ancien), le plus grand saut que pourrait voir un utilisateur visible (forme fermée sur le cône au nadir), l'erreur de distance avant et après, et PASS ou FAIL par rapport à <c4/>. <c5/> (ajustements de { "300" } s mis à jour toutes les { "150" } s) :

# text
seg-7d91304c87e3 = Le passage le plus haut en une journée atteint { "43.7" }° et dure { "455" } s. Ses changements :

# text
seg-289e8da49cc8 = Commutation

# text
seg-e80d12ee2259 = Élévation

# text
seg-b16789d14338 = Saut de position

# text
seg-b3c252609532 = Saut d'horloge

# text
seg-8239a390ec71 = Saut de distance utilisateur

# text
seg-4153faf7969d = Saut pour la pire géométrie

# text
seg-14402c7fb332 = IOD { "270" } → { "271" }

# text
seg-7862a97ac55f = { "0.07" } mm

# text
seg-4cfe934c881f = { "0.19" } mm

# text
seg-9e9752920165 = -0.17 mm

# text
seg-4267557786be = { "0.27" } mm

# text
seg-46872e8925b2 = IOD { "271" } → { "272" }

# text
seg-4c803fd2ccc9 = { "0.14" } mm

# text
seg-cc9a8388f6bc = -0.24 mm

# text
seg-0549f7fd0633 = IOD { "272" } → { "273" }

# text
seg-ad1afcf9a466 = -0.22 mm

# text
seg-c1b30171b4f0 = { "0.35" } mm

# text
seg-f93647402fa9 = { "0.48" } mm

# text
seg-69b35182807c = Plus grand saut de distance utilisateur : { "0.35" } mm pour un seuil de { "5" } cm : <b>PASS</b>.

# text
seg-96dcb456600d = Encodage et décodage

# text
# c1: scenarios/leo-navmsg-encode-decode.toml
seg-1b3674a0e041 = <c1/> encode le premier de trois messages, le décode, vérifie le CRC et rejette une copie corrompue, affiche le budget de quantification, puis écrit et relit le bloc de type RINEX et la table CSV :

# text
# c1: 0x19105F
seg-480eb9ffc333 = trame : { "171" } octets ({ "1310" } bits de charge utile, dont { "1045" } d'éphéméride et d'horloge), contrôle de redondance cyclique sur 24 bits (CRC-24Q) <c1/> ;

# text
# c1: af0
seg-0e2a64a063fd = plus grand effet d'un demi-pas pour un champ isolé : <c1/>, { "0.545" } mm ;

# text
seg-a1875f7088b0 = message entier après quantification : position à { "1.126" } mm près et horloge à { "0.185" } mm près du message exact ; SISRE { "0.113" } cm exact, { "0.129" } cm décodé ;

# text
seg-6e818708b695 = une trame dont un bit est inversé est rejetée : vrai ;

# text
seg-31fe0f6b133d = aller-retour RINEX à { "5.0e-06" } m près, aller-retour CSV à { "0.0e+00" } m près.

# text
seg-405cf34090cc = Indépendance vis-à-vis de la plateforme

# text
# c1: libm
# c2: src/portable_math.rs
# c3: leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform
# c4: leo-navmsg
seg-7f2193f6ff06 = Une trame est transmise sous forme d'entiers : ce doivent être les mêmes entiers où et comment que le scénario s'exécute, que ce soit avec le binaire natif sur n'importe quel système d'exploitation, avec une version de débogage ou de production, ou avec la version WebAssembly (WASM) dans un navigateur. Trois obstacles se présentaient. Le sinus, le cosinus, l'arc tangente et l'exponentielle de la bibliothèque mathématique d'un hôte ne sont pas tenus d'être correctement arrondis et diffèrent d'un hôte à l'autre sur la dernière décimale. Une version optimisée sous macOS prend le sinus et le cosinus d'un même argument dans la routine combinée du système, qui ne renvoie pas toujours la valeur du sinus seul ; une version de débogage et une version de production différaient donc aussi. Et l'échantillonneur normal usuel appelle l'exponentielle et le logarithme de l'hôte dans ses branches rares. L'ajustement transforme une différence aussi minime en champs quantifiés différents. Le type de scénario entier (orbite et horloge de vérité, ajustement, algorithme utilisateur, erreur de distance du signal dans l'espace (SISRE), codec) calcule donc chacune de ces fonctions avec la bibliothèque Rust pure <c1/> par l'intermédiaire de <c2/>, les puissances entières sous forme de produits explicites, et les écarts normaux par la méthode polaire sur la sortie brute du générateur. <c3/> fige la trame de 171 octets du scénario d'encodage et de décodage ci-dessous et une valeur de contrôle par modèle d'éphéméride ; une version de débogage, une version de production et la version WASM donnent des documents de résultats identiques octet pour octet pour les cinq scénarios <c4/> fournis.

# text
seg-1ef00467df17 = Format binaire

# text
seg-af2dae9e9e7c = <b>Il s'agit de l'encodage documenté propre à Kshana.</b> Il porte les composantes que nomment les descriptions publiées des messages de navigation LEO, sur le modèle de l'ensemble de champs de l'ICD Galileo. Ce n'est <b>pas</b> la disposition binaire de Celeste ni d'aucun autre système : aucune n'est publique.

# text
# c1: 0xA7
# c2: kepler16
# c3: kepler-rac
# c4: liu22
# c5: ecef-poly
# c6: 0x1864CFB
# c7: 0xCDE703
# c8: 123456789
seg-6a730c01ad1c = Trame : préambule <c1/> ({ "8" } bits), version { "1" } ({ "4" }), modèle ({ "4" } : { "1" } <c2/>, { "2" } <c3/>, { "3" } <c4/>, { "4" } <c5/>), longueur de la charge utile en octets ({ "12" }), charge utile complétée par des zéros jusqu'à l'octet, CRC-24Q (un contrôle de redondance cyclique sur 24 bits, { "24" } bits) sur tous les octets précédents. Le CRC-24Q est le contrôle de la norme RTCM { "10403" } de la Radio Technical Commission for Maritime Services et de l'ICD Galileo (polynôme <c6/>, valeur initiale { "0" }) ; le code reproduit la valeur de contrôle du catalogue <c7/> pour <c8/> et les octets de contrôle de la trame d'exemple de type de message { "1005" } de la RTCM { "10403" } (<b>VALIDATED</b>).

# text
# c1: Crs
# c2: Cuc
# c3: af0
seg-a31d899eb435 = Les pas de l'ICD Galileo ont été choisis pour l'orbite terrestre moyenne et sont trop grossiers pour un message LEO de niveau centimétrique : <c1/> par pas de { "2" }⁻⁵ m ({ "3.1" } cm), <c2/> { "2" }⁻²⁹ rad ({ "1.3" } cm au rayon LEO), les angles { "2" }⁻³¹ demi-cercles ({ "1.0" } cm) et <c3/> { "2" }⁻³⁴ s ({ "1.7" } cm). Kshana conserve les unités de l'ICD et la convention du demi-cercle, affine les pas pour que l'erreur d'un demi-pas de chaque champ reste inférieure à { "1" } mm de position ou de distance sur une fenêtre de 15 minutes, et élargit les champs pour conserver les plages dont un ajustement LEO a besoin :

# text
seg-caddc6f5b9a7 = Bloc

# text
seg-b548b723c201 = Bits

# text
seg-d00b65801e9b = Pas

# text
seg-2085d172bec3 = auxiliaire et synchronisation

# text
seg-7e9018f82811 = semaine

# text
seg-45cbfedb6f0e = horloge (bit indicateur { "0" })

# text
seg-05d274f5ce99 = s/s^{ "2" }

# text
seg-9d6d5136e12a = képlérien (modèles 1-3)

# text
seg-3fb59c8238cb = demi-cercle

# text
seg-d173e8d7026c = m^{ "0.5" }

# text
seg-48c8bfb6e914 = corrections along/cross/radial (modèle { "2" })

# text
seg-131652f53721 = compléments de Liu et al. { "2025" } (modèle { "3" })

# text
seg-fccf37a24fc4 = demi-cercle/s^{ "2" }

# text
seg-ebde561c17ab = polynôme ECEF (modèle { "4" })

# text
seg-822c7482547c = Klobuchar (bit indicateur { "1" })

# text
seg-7dd6e8bcaf43 = s/demi-cercle^{ "2" }

# text
seg-09408b08c481 = s/demi-cercle^{ "3" }

# text
seg-734162101b2d = NeQuick-G (bit indicateur { "2" })

# text
seg-ddbb363f4593 = sfu/deg^{ "2" }

# text
seg-e2744b31e5d3 = UTC (bit indicateur { "3" })

# text
# c1: deltaN
# c2: OmegaDot
# c3: aDot
# c4: nDot
# c5: nDot
# c6: kepler-rac
# c7: quantisation_budget
seg-545755e7b26f = Une valeur hors de la plage de son champ est refusée, et non ramenée par repli modulaire. Les plages ont été vérifiées en encodant des ajustements à { "300" } jusqu'à { "2000" } km, des inclinaisons de { "0" }° à { "140" }° et des intervalles d'ajustement allant jusqu'à { "20" } minutes : <c1/> et <c2/> sont larges parce que, sur une orbite quasi équatoriale, le nœud est mal défini et que l'ajustement répartit entre eux la dérive J2 de l'argument de latitude, et <c3/> et <c4/> parce que l'ajustement à 22 paramètres sur { "20" } minutes absorbe une partie de l'oscillation à courte période du demi-grand axe. Depuis la version { "0.30" }, l'ajustement à 22 paramètres est les moindres carrés ordinaires de l'article, sans a priori, et un ajustement équatorial à { "800" } km exige alors un <c5/> d'environ { "6.3e-10" } demi-cercle/s^{ "2" }, si bien que son échelle est passée de { "2" }^-60 à { "2" }^-58. Les corrections along-track de degré 7 de <c6/> tiennent dans la plage de coefficients de 22 bits jusqu'à { "15" } minutes ; un ajustement plus long peut la dépasser et est alors refusé. <c7/> indique, pour chaque champ d'éphéméride et d'horloge, la plus grande variation de position et de distance que provoque un changement d'un demi-pas sur la période d'utilisation, ainsi que la variation du message entier après quantification.

# text
seg-1ad17f3d3643 = Exports texte

# text
# c1: text.rs
# c2: > EPH
# c3: D19.12
# c4: L
# c5: KP16
# c6: KRAC
# c7: LU22
# c8: APOL
seg-81fb376aa1e1 = <b>RINEX { "4.02" } ne définit aucun enregistrement de navigation LEO</b> (ses lettres de système sont G, R, E, J, C, I et S ; <a1>International Global Navigation Satellite System (GNSS) Service (IGS) RINEX { "4.02" }</a1>). Le bloc qu'écrit <c1/> emprunte la forme de RINEX { "4" } — un en-tête d'enregistrement <c2/>, une ligne de satellite et d'époque avec trois termes d'horloge, des lignes d'orbite diffusée de quatre champs <c3/> — et constitue une <b>extension de Kshana documentée</b> : lettre de système <c4/>, types d'enregistrement <c5/>, <c6/>, <c7/>, <c8/>, et trois commentaires d'en-tête qui le disent. Travaux antérieurs sur les orbites LEO dans des enregistrements de navigation de style RINEX-4 : <a2>arXiv { "2401.17767" }</a2>.

# text
# c1: kepler16
# c2: kepler-rac
# c3: SVID, IOD, Band, WeekNumber, ToW, Health, toc, af0, af1, af2, toe, M0, sqrtA, e, deltaN, Omega0, OmegaDot, iDot, i0, omega, Crc, Crs, Cic, Cis, Cuc, Cus, a0…, c0…, r0…, racTau
# c4: csv_schema
seg-9a3016441bce = La table CSV porte les messages <c1/> et <c2/>, un par ligne. Les colonnes par défaut utilisent les noms de l'ICD Galileo (<c3/>) ; <c4/> choisit à la place l'orthographe d'un préréglage. Les deux formats sont relus.

# text
seg-4a26902d2771 = Ionosphère et UTC

# text
# c1: gnss_sim::klobuchar_delay_m
# c2: (f_L1 / f)²
seg-c4d4dd2bac45 = <b>Klobuchar</b> : le modèle L1 du moteur (<c1/>, vérifié par rapport à RTKLIB) ramené à la porteuse par la loi du premier ordre <c2/>.

# text
# c1: effective_ionisation_level
# c2: Az = ai0 + ai1·μ + ai2·μ²
# c3: μ
# c4: Az
seg-0d3973f04ee5 = <b>NeQuick-G</b> : les coefficients voyagent dans le message et <c1/> renvoie <c2/> pour une latitude magnétique modifiée <c3/>, avec les règles de l'algorithme (des coefficients tous nuls donnent { "63.7" } unités de flux solaire, sfu ; le résultat est borné à [{ "0" }, { "400" }] sfu). Le modèle de densité électronique NeQuick et son intégration oblique, qui transforment <c4/> en un retard, ne sont <b>pas</b> implémentés.

# text
seg-66dbd447dfeb = Un satellite à quelques centaines de kilomètres vole à l'intérieur de l'ionosphère. Aucun des deux modèles diffusés ne tient compte du contenu électronique situé au-dessus du satellite, et aucune correction à ce titre n'est appliquée.

# text
# c1: system_to_utc
seg-7befd59b2ac6 = <b>UTC</b> : <c1/> applique les trois cas de l'ICD Galileo §{ "5.1.7" } (avant, dans les six heures qui entourent, et après un événement de seconde intercalaire) ; une seconde insérée se lit { "86400" }.

# text
seg-2b0d77219437 = Préréglages

# text
# c1: src/leo_navmsg/presets/
seg-d2908020db08 = Les préréglages sont des données, un fichier chacun sous <c1/>, avec leurs sources. Le moteur et tous les scénarios fournis, sauf celui de Celeste, s'exécutent sans eux.

# text
seg-c353e7bec219 = Clé

# text
seg-5566e1d71a4f = Orbite

# text
seg-33f4c7af9c53 = Porteuse

# text
seg-f4510e898031 = Modèle de message

# text
seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

# text
seg-890aa92157e4 = { "1080" } km, { "53" }°

# text
seg-1eca13ba2309 = X1 { "1593.3225" } MHz

# text
seg-ee9947222a30 = non publié

# text
seg-77af616c1f6e = PUBLIC, arXiv { "2509.19551" }

# text
seg-f016786d7755 = { "520" } km, { "97" }°

# text
seg-780e931bf88d = PUBLIC, <a1>rapport RNTF</a1>, description de la constellation

# text
seg-d5df094a5f89 = { "781" } km, { "86.4" }°

# text
seg-94bc78cee128 = { "1621" } MHz (bande de { "1616" }–{ "1626" } MHz)

# text
seg-3f5de7f74502 = aucun diffusé

# text
seg-4944294c230f = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>, description de la constellation

# text
seg-c2a2761f73b1 = { "550" } km, { "53" }°

# text
seg-2ef501f97eff = bande Ku, valeur de milieu de bande (représentative)

# text
seg-567fab40bd24 = aucun (signaux d'opportunité)

# text
seg-a76527ba66b6 = PUBLIC, <a1>Sensors { "2023" }</a1>, <a2>Satellite Navigation { "2026" }</a2>

# text
seg-f5dd5086eedd = { "700" } km, { "55" }°

# text
seg-5fa6b60f66b4 = près de B1 (masquée dans la source ; L1 en remplacement)

# text
seg-5ebbf0042d7c = REPRESENTATIVE

# text
seg-4f3e5a683682 = { "600" } km, { "97.8" }°

# text
seg-c06f62ca5173 = { "5020" } MHz (centre de la bande C du RNSS)

# text
seg-884c81e55e79 = PUBLIC, <a1>InsideGNSS</a1>

# text
seg-3b1fd041f9ba = { "500" } km (représentatif)

# text
seg-522c85402d84 = L1 (représentative)

# text
# c1: ecef-poly
seg-064b03765e4d = <c1/>, degré { "6" }, { "60" } s, rafraîchi toutes les { "30" } s, horloge nulle, résidu de pilotage de { "0.24" } m

# text
seg-5619bc61b958 = WORKSHOP et PUBLIC

# text
seg-20572d7e348d = { "510" } km, { "97.4" }°

# text
seg-a17f4b4f7fb5 = { "1191.795" } MHz

# text
# c1: kepler-rac
seg-fad0950a2d67 = <c1/>, degrés et espacement des enregistrements dans le fichier de préréglage

# text
seg-e881ffc4e14b = RNSS désigne le service de radionavigation par satellite ; RNTF la Resilient Navigation and Timing Foundation.

# text
# c1: navmsg
# c2: src/celeste_iod.rs
# c3: scenarios/leo-navmsg-celeste-iod.toml
# c4: src/celeste_iod.rs
# c5: build.rs
# c6: scenarios/*celeste-iod*.toml
seg-e9524c71636d = <b>Celeste IOD.</b> Le préréglage de la démonstration en orbite (IOD) Celeste de l'Agence spatiale européenne (ESA) est le seul à utiliser des éléments présentés à l'atelier LEO-PNT du programme d'innovation et de soutien à la navigation (NAVISP) de l'ESA, { "2026" } : la structure du message (ensemble képlérien Galileo plus polynômes de correction along/cross/radial, polynôme d'horloge, SVID, santé, IOD, paramètres ionosphériques et UTC), l'espacement des enregistrements et les noms de colonnes CSV. L'orbite ({ "510" } km, quasi polaire héliosynchrone) et la porteuse proviennent de sources publiques citées dans le fichier. La disposition binaire de Celeste n'est pas publique et n'est pas reproduite ; les phases ultérieures de Celeste et le système LEO-PNT de l'Union européenne (UE) peuvent différer. Chaque valeur issue de l'atelier se trouve dans le module <c1/> de <c2/>, utilisé par <c3/>. Comment le préréglage est tenu à l'écart : chaque nombre issu de l'atelier figure dans un seul fichier du moteur, <c4/>, que <c5/> ne compile que s'il existe, et dans les scénarios réservés au dépôt <c6/>. Supprimer ce fichier et ces scénarios retire le préréglage sans modification de source ; tous les autres tests, références indépendantes et scénarios s'exécutent sans lui, et le décompte des fichiers de scénario du README compte toujours les fichiers retirés.

# text
seg-906da2752f76 = Vérification

# text
seg-7338b6210228 = Ligne

# text
seg-c5ce76c91ff7 = Étiquette

# text
seg-cfe0d596296e = Pondérations SISRE

# text
seg-3e0059048a0d = table de Montenbruck et al. { "2018" } (GPS, GLONASS, Galileo, BeiDou, géostationnaire)

# text
seg-0f5e73171fe0 = Algorithme utilisateur de l'ICD Galileo

# text
# c1: eph2pos
# c2: tests/leo_navmsg_reference.rs
seg-29ad977ef423 = <c1/> de RTKLIB sur quatre véritables éphémérides diffusées de Galileo, { "1" } mm par axe (<c2/>)

# text
# c1: 0xCDE703
seg-ecec254e8219 = valeur de contrôle du catalogue <c1/> ; trame d'exemple { "1005" } de la RTCM { "10403" }

# text
seg-388633e4e785 = Ajusteur et compromis SISRE

# text
seg-8b85c3277e66 = vérité à deux corps retrouvée à { "1" } mm ; ajustement J2–J6 corrigé à { "1" } mm ; croissance monotone avec l'intervalle

# text
seg-4de7f2b173c5 = Continuité en milieu de passage

# text
seg-bdbd2771c7f5 = identité de saut ; borne de cône en forme close comparée à l'échantillonnage

# text
seg-468a92a2caf7 = Format binaire et budget

# text
seg-ba26f5f63172 = allers-retours ; demi-pas de chaque champ inférieur à { "1" } mm

# text
seg-9be43cbef131 = Type RINEX et CSV

# text
seg-a7748156fd6e = allers-retours

# text
seg-88b5cda10923 = Modèle et ajustement à 22 paramètres de Liu et al. { "2025" }

# text
# c1: tests/leo_navmsg_fit_real_orbit_oracle.rs
seg-7272ebdc1fec = orbites précises ITSG de TU Graz de quatre satellites comparées aux tableaux { "4" }, { "5" }, { "6" } et { "8" } de l'article : rapports along, cross, radial et SISRE de { "0.755" } à { "1.138" } sur les jours de l'article et de { "0.683" } à { "1.186" } sur huit jours réservés, dans la limite de 1.5x (<c1/>)

# text
seg-94066142a642 = Polynôme ATOMIC à horloge nulle et table des cinq altitudes

# text
seg-205cdc6a3696 = faits ATOMIC tirés d'InsideGNSS ; la table de Liu publiée imprimée à côté de l'ajustement par orbite intégrée de Kshana, non figée

# text
seg-8c00ed11609c = formes closes de l'ICD ; le modèle de Klobuchar vérifié par RTKLIB

# text
seg-d5653e0958b5 = Le SISRE n'est qu'une erreur de représentation : il ne contient aucune erreur de détermination ou de prédiction d'orbite.

# text
seg-4968d9fcbc19 = La vérité est une intégration de Kshana (sans troisième corps, pression de radiation solaire ni marées), et non l'orbite précise d'un satellite réel.

# text
seg-6a4a1bf21b50 = Le format binaire et le bloc de type RINEX sont propres à Kshana.

# text
seg-26c0a2693081 = NeQuick-G est transporté, non intégré en un retard ; aucune correction pour un satellite situé à l'intérieur de l'ionosphère.

# text
seg-2a0c8190c38e = La comparaison avec Liu et al. diffère par les orbites, la lecture des paramètres et les pondérations.

# text
seg-4abe216f987a = <s1>Précédent</s1>Passage LEO et bilan de liaison

# text
seg-59d9bf4735d8 = <s1>Suivant</s1>Positionnement fusionné MEO et LEO
