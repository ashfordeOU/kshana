# docs--spectrum: translations (fr)

# text
seg-6cb7a787ac67 = Références

# text
seg-cbf0f9bcd2d8 = Référence indépendante

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-33f4c7af9c53 = Porteuse

# text
seg-c5ce76c91ff7 = Étiquette

# text
seg-a86ce24d81de = Bande

# text
seg-ea152d84aabc = { "465" } MHz

# text
seg-278d0b375f6f = { "20.46" } MHz

# text
seg-39e207bee75b = { "2492.028" } MHz

# text
seg-48fabff33863 = { "5020" } MHz

# text
seg-72f051e2d7e1 = Signal

# text
seg-47408d30d095 = C/N₀ nominal

# text
seg-995748f9c74c = { "49.41" } dB-Hz

# text
seg-5393b075ff7f = { "43.48" } dB-Hz

# text
seg-4321ccaeeca5 = { "46.73" } dB-Hz

# text
seg-59fd1427d61b = { "54.51" } dB-Hz

# text
seg-0f47178201ca = { "49.23" } dB-Hz

# text
seg-f8e6beeceedd = { "47.41" } dB-Hz

# text
seg-53a7343c076e = Affirmation

# text
seg-430edd66bda0 = Non modélisé

# text
# c1: docs/SPECTRUM.md
seg-f07519ff8071 = Source : <c1/>

# text
seg-901c3e032de7 = Modèle de spectre et diagramme en cascade

# text
# c1: spectrum
seg-eac92092dd34 = Le type de scénario <c1/> construit la bande L du système mondial de navigation par satellite (GNSS), et toute autre bande qu'occupe un signal conçu (ultra haute fréquence (UHF), bande S, bande C), sous la forme d'une seule densité spectrale de puissance (PSD), la laisse évoluer selon une chronologie de brouilleurs scriptée, et la réduit à ce qui importe à une boucle de poursuite : le rapport brouilleur sur signal (J/S) et le rapport effectif porteuse sur densité de bruit (C/N₀) de chaque bande. Il présente le résultat sous forme de diagramme en cascade (fréquence en abscisse, temps en ordonnée, couleur pour la puissance) à côté de barres de C/N₀ par bande, et il lit et écrit des enregistrements au format Signal Metadata Format (SigMF), de sorte qu'une capture réelle puisse être estimée et tracée à côté du modèle.

# text
seg-0007b6ba97ca = Écrivez l'exemple fourni dans un fichier et exécutez-le :

# text
# c1: kshana scenarios/l-band-waterfall-jamming.toml
seg-5e205b189b26 = Dans une copie de travail, <c1/> exécute le même fichier.

# text
# c1: src/spectrum.rs
# c2: src/sigmf.rs
# c3: src/navsignal.rs
# c4: src/leo_signal.rs
seg-261deb22b4fa = Code : <c1/> (le modèle, le type, l'estimateur de Welch), <c2/> (le codec d'enregistrement), <c3/> (les spectres de signal d'aire unité et le coefficient de séparation spectrale) et <c4/> (les préréglages de conception de signal qu'une bande peut nommer).

# text
seg-bb1153873209 = Modulation

# text
seg-9758b36b554c = Puissance reçue par défaut

# text
seg-a1a68286b809 = Largeur de bande du récepteur par défaut

# text
seg-27a2cdc8183f = { "1575.42" } MHz

# text
seg-66a103496266 = modulation par déplacement de phase binaire, BPSK({ "1" })

# text
seg-f386c2e2e352 = −{ "158.5" } dBW (IS-GPS-200)

# text
seg-50112ba8867d = { "2.046" } MHz

# text
seg-b7755cb9a384 = porteuse à décalage binaire multiplexée, MBOC(6,1,1/11), ou porteuse à décalage binaire BOC({ "1,1" })

# text
seg-6043a4ef45ca = −{ "157.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

# text
seg-6dc5e3668a78 = { "14.322" } MHz

# text
seg-f03380403a2a = { "1227.60" } MHz

# text
seg-06c245582533 = BPSK({ "1" }) (codes CM et CL multiplexés dans le temps)

# text
seg-fa56c0085dbc = −{ "160.0" } dBW (IS-GPS-200)

# text
seg-1982a811e1ef = { "1176.45" } MHz

# text
seg-dd074e33242e = BPSK({ "10" })

# text
seg-f30f2e48a3bf = −{ "157.9" } dBW (IS-GPS-705)

# text
seg-898ae19a946b = −{ "155.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

# text
# c1: [[bands]]
seg-3216d5cd918d = GPS (Global Positioning System) L1 C/A est le code d'acquisition grossière ; L2C est le signal civil L2 ; IS-GPS-200 et IS-GPS-705 sont les spécifications d'interface du GPS ; Galileo OS SIS ICD est le document de contrôle d'interface du signal dans l'espace du service ouvert de Galileo. Les puissances reçues sont les minimums de spécification ; les largeurs de bande sont des choix de modélisation. Les deux peuvent être remplacées par bande. Sans table <c1/>, l'exécution utilise ces cinq. GLONASS G1/G2, BeiDou B1/B2 et Galileo E6 ne figurent <b>pas</b> parmi les bandes nommées.

# text
# c1: [[bands]]
seg-79cc2ed8195b = Une entrée <c1/> prend l'une de trois formes :

# text
# c1: signal_power_dbw
# c2: rx_bandwidth_mhz
# c3: galileo-e1
# c4: modulation = "boc11"
seg-67d0591c69d8 = un nom du tableau ci-dessus, avec <c1/> et <c2/> facultatifs et, pour <c3/>, <c4/> ;

# text
# c1: signal = "<preset>"
# c2: leo-signal
# c3: name
# c4: xona-x1
# c5: xona-x5
# c6: iridium-stl
# c7: starlink-ku-beacon
# c8: centispace-l1
# c9: centispace-l5
# c10: generic-c-band-leo
# c11: generic-uhf
# c12: generic-l
# c13: generic-s
# c14: generic-c
# c15: generic-c-wide
seg-8596194c81f2 = <c1/> : une conception de signal en orbite terrestre basse (LEO) ou représentative, tirée de la bibliothèque de préréglages du type <c2/> (<a1>LEO-SIGNAL.md</a1>), dans n'importe quelle bande, tracée avec chaque composante (acquisition, données, pilote, sous-porteuses à répartition en fréquence) et limitée en bande à sa largeur de bande d'émission ; C/N₀ et J/S se rapportent à la composante poursuivie, et <c3/> ne fait que l'étiqueter. Les préréglages sont <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/> et <c15/> ;

# text
# c1: name
# c2: centre_mhz
# c3: modulation
# c4: BPSK(n)
# c5: BOC(m,n)
# c6: MBOC(6,1,p)
# c7: signal_power_dbw
seg-2ca46a7f2949 = une bande personnalisée : tout <c1/> avec <c2/>, <c3/> (<c4/>, <c5/> ou <c6/>) et <c7/>.

# text
# c1: [[jammers]]
# c2: waveform
seg-fcb0f9fcffbf = Les brouilleurs (<c1/>) prennent un <c2/> :

# text
# c1: cw
# c2: centre_mhz
seg-457e5e95c677 = <c1/> — une tonalité à onde continue (CW) à <c2/> ;

# text
# c1: narrowband
# c2: bandwidth_mhz
seg-3120ac4f6710 = <c1/> — bruit plat sur <c2/> ;

# text
# c1: wideband
# c2: bandwidth_mhz
# c3: narrowband
# c4: jamming
seg-7d975838a2e6 = <c1/> — bruit plat sur un <c2/> large (un brouilleur à large bande de type barrage) : la même densité que <c3/>, nommé à part parce que le type <c4/> le note comme à large bande ;

# text
# c1: chirp
# c2: bandwidth_mhz
# c3: sweep_period_us
seg-d13b177946d2 = <c1/> — un balayage linéaire en dents de scie de <c2/> toutes les <c3/> ;

# text
# c1: matched
# c2: matched_to
seg-675fb74a89e4 = <c1/> — bruit à large bande dont le spectre est la modulation propre de la bande <c2/>.

# text
# c1: received_power_dbw
# c2: eirp_dbw
# c3: range_m
# c4: rx_gain_dbi
# c5: jamming
# c6: on_s
# c7: off_s
seg-64d7a14a198e = Chacun donne soit <c1/>, soit une puissance isotrope rayonnée équivalente <c2/> avec une <c3/> (et facultativement <c4/>), qui passe par l'affaiblissement de propagation en espace libre du type <c5/>. <c6/> et <c7/> pilotent la chronologie par script.

# text
# c1: [receiver]
# c2: N₀ = k·T_sys
# c3: T_sys = T_ant + 290 K × (F − 1)
# c4: T_ant
# c5: F
seg-8e718c09f7d8 = Le récepteur (<c1/>) fixe le plancher de bruit, <c2/> avec <c3/> pour une température d'antenne <c4/> et un facteur de bruit <c5/>, ainsi que le seuil de poursuite.

# text
# c1: [grid]
# c2: [[panels]]
# c3: name
# c4: f_min_mhz
# c5: f_max_mhz
# c6: n_freq
seg-9b8078bd0df3 = Le diagramme en cascade principal couvre <c1/> (par défaut de { "1160" } à { "1590" } MHz en { "430" } cases). Chaque entrée <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, par défaut { "200" } cases) ajoute un autre diagramme en cascade sur sa propre plage de fréquences, sur la même chronologie, pour un spectre qui couvre plusieurs bandes.

# text
seg-a550e89c2907 = La chaîne d'interférence

# text
# c1: G_s
# c2: G_j
# c3: B
# c4: κ = ∫_B G_s(f) G_j(f) df
seg-12a2c08191c0 = Pour un signal de spectre d'aire unité <c1/> et un brouilleur de spectre de puissance unité <c2/>, le coefficient de séparation spectrale (SSC) sur la bande du récepteur <c3/> est <c4/>, et la densité effective porteuse sur bruit avec plusieurs brouilleurs est

# text
# c1: jamming
# c2: Q = 1/(R_c κ)
# c3: jamming_kind_cross_check
# c4: jamming
seg-5c556163af62 = (Betz { "2001" } ; Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3e éd., §{ "9.4" }). Pour un brouilleur, c'est exactement l'équation anti-brouillage du type <c1/> avec <c2/> ; le bloc <c3/> du rapport exécute les fonctions propres du type <c4/> sur les mêmes entrées de liaison et affiche la différence, qui est nulle à l'arrondi près.

# text
# c1: jamming
seg-c11d0cb8e670 = Le rapport affiche aussi le C/N₀ que donne le type <c1/> avec sa table de Q. La table contient les valeurs de manuel, épinglées dans les tests sur les formes fermées :

# text
# c1: Q = 1
# c2: κ = T_c
# c3: Q = 1
seg-5c21df11e35b = <b>CW et bande étroite : <c1/>.</b> Une tonalité CW sur la porteuse C/A a <c2/>, donc <c3/>, et la table et les spectres concordent. Dans l'exemple fourni, la tonalité donne { "17.98" } dB-Hz des deux côtés (la table donnait { "19.74" } lorsqu'elle contenait { "1.5" }).

# text
# c1: Q = 2
# c2: κ = 1/(2R_c)
# c3: xval/jammer-q/PREREGISTRATION.md
seg-647e209b1efc = <b>Large bande et balayé : <c1/>, depuis { "0.36" }.</b> C'est un bruit blanc sur le lobe principal avec la puissance du signal dans la bande normalisée à un, <c2/>. La table contenait { "1" } jusqu'à { "0.36" }, soit environ { "3" } dB de pessimisme (<c3/>).

# text
seg-cd03b9c900e1 = Le modèle de spectre tire ses propres valeurs des spectres :

# text
# c1: Q = 1.5
# c2: κ = 2/(3R_c)
seg-b1327e66260b = <c1/> pour un bruit adapté au C/A (<c2/>) ;

# text
# c1: Q = 2.2
# c2: 2/0.9028
seg-45b2cf032a11 = <c1/> pour un bruit plat de zéro à zéro sans la normalisation (<c2/>).

# text
seg-6c2187f0e32b = Ainsi, pour ces brouilleurs, les deux valeurs de C/N₀ affichées diffèrent encore, par construction.

# text
# c1: Q
seg-73dfbeabcac2 = Chaque cellule du diagramme en cascade est la PSD moyennée sur sa case de fréquence et sa ligne. Un chirp est moyenné exactement sur la ligne, balayages entiers plus le balayage partiel ; un brouilleur qui s'allume ou s'éteint au milieu d'une ligne est pondéré par son rapport cyclique. La chronologie de C/N₀ utilise les mêmes moyennes, de sorte que l'image et les nombres concordent. Par bande, la chronologie rapporte le J/S dans la bande (puissance du brouilleur dans la largeur de bande du récepteur sur la puissance du signal). Par brouilleur et par bande, le rapport donne le SSC, <c1/>, le J/S total, le J/S dans la bande et le C/N₀ en régime établi.

# text
seg-2c214a0a30be = L'exemple fourni

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-4adc00a3ca10 = <c1/> : une chronologie de { "60" } s, une ligne par seconde, une antenne de { "290" } K et un facteur de bruit de { "2" } dB (plancher −{ "201.98" } dBW/Hz).

# text
seg-94d1cebc134d = De { "10" } s à { "40" } s : un chirp de { "16" } MHz autour de L1, balayages de { "9" } µs, { "50" } mW à { "100" } m.

# text
seg-b85319af4f85 = À partir de { "30" } s : une tonalité CW sur la porteuse L1, { "10" } mW à { "1" } km.

# text
seg-21e2b4e76832 = À partir de { "45" } s : bruit plat de { "2" } MHz sur L2, reçu à −{ "135" } dBW.

# text
seg-45dd378c692c = Ce que calcule l'exécution :

# text
seg-eecd7d7530bf = C/N₀ minimal

# text
seg-1ead35e1aad5 = Première perte

# text
seg-bfb55a322ece = Lignes en poursuite

# text
seg-863ea3f1fbe9 = { "3.23" } dB-Hz

# text
seg-9aa0239a3a0c = { "10" } s

# text
seg-9979940d2359 = { "44.73" } dB-Hz

# text
seg-25364ef39455 = { "4.44" } dB-Hz

# text
seg-c8d0bc71cccd = { "41.98" } dB-Hz

# text
seg-c945914c444c = { "36.86" } dB-Hz

# text
seg-9ff066fb53a6 = jamais

# text
seg-63d4f00f622d = { "44.08" } dB-Hz

# text
seg-58b097691919 = La tonalité CW explique pourquoi les deux signaux L1 se séparent à { "40" } s. Elle tombe sur le pic du spectre C/A et maintient le C/A à { "17.98" } dB-Hz, sous le seuil de { "25" } dB-Hz. Elle tombe dans le creux du spectre MBOC, de sorte que Galileo E1 retrouve son C/N₀ nominal quand le chirp s'arrête.

# text
seg-064579d5fbac = Les signaux eux-mêmes se situent environ { "20" } dB sous le plancher de bruit, de sorte que le diagramme en cascade montre le plancher et les brouilleurs ; les barres de C/N₀ montrent ce que récupère le désétalement.

# text
# c1: scenarios/campaign-spectrum-holdover-integrity.toml
seg-023a7f163106 = Les mêmes brouilleurs pilotent une mission enchaînée dans <c1/> (voir <a1>CAMPAIGNS.md</a1>) : l'horloge tient en holdover pendant que le chirp est actif, et le récepteur bascule sur Galileo E1 sous la tonalité CW.

# text
seg-6b0edbfca134 = Au-delà de la bande L

# text
# c1: scenarios/multi-band-jamming-waterfall.toml
# c2: [grid]
# c3: [[panels]]
seg-63d1fd8043ed = <c1/> place des signaux de positionnement, navigation et synchronisation temporelle (PNT) en LEO dans quatre bandes à côté de GPS L1 C/A et de Galileo E5a, chaque bande avec son propre brouilleur, sur une chronologie de { "60" } s. Le diagramme en cascade <c2/> est la bande L ; trois <c3/> ajoutent l'UHF ({ "455" } à { "475" } MHz), la bande S ({ "2482" } à { "2502" } MHz) et la bande C ({ "5005" } à { "5035" } MHz).

# text
seg-6818247b5863 = { "10" } s : une tonalité CW sur la porteuse UHF, −{ "120" } dBW reçus.

# text
seg-02de8390de31 = { "20" } s : le chirp de l'exemple en bande L ({ "16" } MHz autour de L1, balayages de { "9" } µs, { "50" } mW à { "100" } m).

# text
seg-47e55dfd4e0d = { "30" } s : bruit à large bande, { "40" } MHz autour de { "1185" } MHz, −{ "118" } dBW.

# text
seg-dfa416032770 = { "40" } s : bruit à bande étroite, { "2" } MHz sur la porteuse S, −{ "128" } dBW.

# text
seg-1d119727a749 = { "50" } s : bruit adapté au spectre propre du signal en bande C, −{ "124" } dBW.

# text
seg-abacb60b16a3 = Ce que calcule l'exécution (le C/N₀ des signaux conçus est celui de la composante poursuivie, de sorte que la valeur nominale se situe sous la puissance totale reçue de la part de la composante poursuivie) :

# text
seg-1c921b6299e4 = représentatif, BPSK({ "5" }), −{ "150" } dBW

# text
seg-5331cde832fb = { "34.38" } dB-Hz

# text
seg-35588b19fd72 = minimum de spécification

# text
seg-7d3639369444 = { "3.38" } dB-Hz

# text
seg-9eef1ec7858f = { "38.51" } dB-Hz

# text
seg-c6743d980e6b = conception publiée, −{ "144.9" } dBW

# text
seg-245bf7d080b3 = { "1190.51625" } MHz

# text
seg-f2aed7e062bf = { "46.29" } dB-Hz

# text
seg-c6a19eb8e0b9 = { "41.69" } dB-Hz

# text
seg-a6f2bb955ca2 = représentatif, BPSK({ "10" }), −{ "152" } dBW

# text
seg-b9312cc881d2 = { "40.35" } dB-Hz

# text
seg-03bb124d45d2 = Seul le chirp prive d'un signal (GPS L1 C/A, à partir de { "20" } s). Chacun des autres brouilleurs ne dégrade que la bande que son spectre atteint : le bruit adapté en bande C, par exemple, a un SSC de −{ "71.87" } dB/Hz avec le signal en bande C et inférieur à −{ "133" } dB/Hz avec chacune des autres bandes.

# text
seg-a8bea652a85d = La même mécanique pilote les scénarios de résilience LEO-PNT (<a1>LEO-PNT.md</a1>) :

# text
# c1: scenarios/leo-resilience-js-margin.toml
seg-cf7bc2f52cad = <c1/> fait croître par paliers un brouilleur à large bande de { "40" } MHz à { "1185" } MHz de { "5" } dB toutes les { "10" } s à partir de −{ "125" } dBW. GPS L5 est perdu au palier de −{ "105" } dBW, Galileo E5a à −{ "100" } dBW et Xona X5 à −{ "95" } dBW, alors qu'un signal LEO représentatif en bande L reçu à −{ "135" } dBW poursuit encore à −{ "90" } dBW : la puissance reçue achète de la marge de J/S dB pour dB.

# text
# c1: scenarios/leo-resilience-multiband-diversity.toml
# c2: spectrum
seg-94b65c0e6087 = <c1/> est un balayage de campagne d'une exécution <c2/> sur la puissance d'un brouilleur à large bande en bande L5 (<a1>CAMPAIGNS.md</a1>).

# text
# c1: scenarios/leo-resilience-gnss-jammed-leo-carries.toml
# c2: spectrum
seg-67279a0780e4 = <c1/> est une campagne enchaînée dont les phases lisent le C/N₀ du GNSS et du LEO à partir d'exécutions <c2/>, avec des panneaux en bandes S et C.

# text
seg-42b00ae14ffe = IQ, SigMF et Welch

# text
# c1: [iq]
# c2: cf32_le
# c3: ci16_le
seg-3418c31c4318 = <c1/> trace le modèle à un instant donné sous forme d'échantillons complexes en phase et en quadrature (IQ), les écrit comme un enregistrement SigMF (<c2/> ou <c3/>), relit l'enregistrement et estime sa PSD par la méthode de Welch (fenêtre de Hann, recouvrement de { "50" } %, périodogrammes moyennés, mise à l'échelle en densité). Le bruit thermique, les signaux et les brouilleurs de type bruit sont tirés case par case à partir de la densité propre du modèle ; une tonalité et un chirp sont tracés comme des formes d'onde réelles. Avec seulement des brouilleurs de type bruit, l'estimation de Welch se situe à moins de { "0.1" } dB du modèle (médiane). Un chirp périodique est un spectre de raies à sa fréquence de balayage, avec une ondulation et des queues au-delà de ses bords de bande que le modèle lisse omet : dans l'exemple fourni, la puissance totale concorde à { "0.02" } % près et la case médiane diffère de { "0.5" } dB. L'instantané est un fichier écrit pour l'analyse ; rien n'est émis et aucun matériel radio n'est piloté.

# text
# c1: [recording]
# c2: meta_path
# c3: .sigmf-data
seg-a3b0a61b5efe = <c1/> (builds natifs seulement) lit un véritable enregistrement SigMF depuis <c2/> (le fichier de données prend par défaut le même radical avec <c3/>), estime sa PSD et l'affiche à côté du modèle aux fréquences de l'enregistrement. Un fichier SigMF n'a pas d'étalonnage de puissance absolue ; le rapport donne donc le décalage médian et la forme, non un niveau.

# text
# c1: kshana::sigmf::read
# c2: kshana::spectrum::welch_psd
seg-04b08e06811d = Dans le build WebAssembly, les lectures de fichiers ne sont pas disponibles ; <c1/> et <c2/> travaillent sur des octets fournis par la page.

# text
seg-69b384afe05d = PSD et SSC des signaux

# text
# c1: jamming
seg-a65b87c51f05 = lobe principal de BPSK(n) 2n × { "1.023" } MHz de zéro à zéro ; lobes de BOC({ "1,1" }) centrés à ±{ "1.023" } MHz (Betz { "2001" }) ; SSC de −{ "61.86" } / −{ "64.87" } / −{ "67.88" } dB/Hz pour C/A×C/A, BOC({ "1,1" })×BOC({ "1,1" }), C/A×BOC({ "1,1" }) à partir de leurs formes fermées de Parseval, les valeurs derrière les −{ "61.8" } / −{ "64.8" } / −{ "67.8" } dB/Hz publiés ; Q = { "1" } (CW) et { "1.5" } (adapté) (Kaplan & Hegarty §{ "9.4" }) ; les entrées de la table du type <c1/> égalent les formes fermées : CW et bande étroite Q = { "1" }, large bande et balayé Q = { "2" } (bruit blanc sur le lobe principal, puissance dans la bande normalisée ; { "1" } jusqu'à { "0.36" })

# text
seg-d2afc6e05969 = Diagramme en cascade, J/S et chronologie de C/N₀

# text
# c1: jamming
seg-c44413d5a060 = Se réduit exactement à la chaîne du type <c1/> ; les puissances des brouilleurs, la chronologie et les largeurs de bande sont des entrées

# text
seg-304f4aeaf4cb = Codec SigMF et estimation de Welch

# text
seg-7a642dd02e5c = Allers-retours, transformée de Fourier discrète directe, identités du bruit blanc et de Parseval ; aucun enregistrement tiers n'est dans le dépôt

# text
seg-1138c9e62a21 = Diagramme en cascade multibande avec signaux conçus et brouilleurs par bande

# text
seg-ac38681004e9 = Se réduit à la chaîne en bande L (une bande à composante unique donne les mêmes nombres qu'avant l'extension) et aux spectres de signal validés ; les signaux conçus, les brouilleurs et les largeurs de bande sont des entrées

# text
# c1: tan y = 2y
# c2: y = πf/(2R_c)
seg-0c0c625a8ff5 = Une correction à un raccourci courant : les lobes du spectre BOC({ "1,1" }) sont <em>centrés</em> à ±{ "1.023" } MHz (entre le creux de la porteuse et le creux à { "2.046" } MHz), mais le maximum de la PSD se trouve à ±{ "0.759" } MHz, où <c1/> avec <c2/>. Les tests épinglent les deux.

# text
seg-6ab6e241f7e5 = La structure de raies du code d'étalement (les raies de { "1" } kHz du C/A) : une tonalité est notée par rapport à l'enveloppe lisse, non à la raie de code la plus proche.

# text
seg-4be08100a707 = Le contrôle automatique de gain, la quantification, la suppression d'impulsions et le filtrage réjecteur.

# text
seg-0f195ea4126e = Le diagramme de l'antenne de réception en direction du brouilleur au-delà d'un seul chiffre de gain.

# text
seg-d3d03da9c962 = L'interférence d'accès multiple entre satellites d'une même bande.

# text
seg-db5c7566f49e = Les émissions d'un signal conçu en dehors de sa largeur de bande d'émission : son spectre y est tronqué, si bien qu'aucune émission hors bande n'atteint une bande voisine.

# text
seg-9cbea7151036 = L'effet d'un chirp sur la boucle pour des vitesses de balayage comparables à la largeur de bande de la boucle : son C/N₀ utilise le spectre moyenné par ligne.

# text
seg-d19ed16f451c = J. W. Betz, "Binary Offset Carrier Modulations for Radionavigation", <em>NAVIGATION</em> { "48" }({ "4" }), { "2001" }.

# text
seg-e2225151c10b = E. D. Kaplan et C. J. Hegarty (dir.), <em>Understanding GPS/GNSS: Principles and Applications</em>, 3e éd., Artech House, { "2017" }, §{ "9.4" }.

# text
seg-85b2d251a221 = G. W. Hein et al., "MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C", <em>Inside GNSS</em>, mai/juin { "2006" }.

# text
seg-b091f7c36ab9 = P. D. Welch, "The Use of Fast Fourier Transform for the Estimation of Power Spectra", <em>IEEE Transactions on Audio and Electroacoustics</em> { "15" }({ "2" }), { "1967" }.

# text
seg-b65142371229 = IS-GPS-200, IS-GPS-705 ; Galileo OS SIS ICD.

# text
seg-d28b74d8c755 = Spécification SigMF, <a1>https://sigmf.org/</a1> (source : <a2>https://github.com/sigmf/SigMF</a2>).

# text
seg-a9b968473b2a = <s1>Précédent</s1>Intégrité et sécurité

# text
seg-d5264da8bf65 = <s1>Suivant</s1>Référence ARAIM

# text
seg-64509c048541 = Ce qui est modélisé
