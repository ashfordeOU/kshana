# docs--leo-signal: translations (fr)

# text
seg-3ea93ae372ca = Ce qu'il contient

# text
seg-6cb7a787ac67 = Références

# text
seg-cbf0f9bcd2d8 = Référence indépendante

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-f63dd3d7aad4 = Source

# text
seg-587beeccaa11 = Préréglage

# text
seg-6752521002b2 = Partie

# text
seg-2b0d77219437 = Préréglages

# text
seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

# text
seg-c5ce76c91ff7 = Étiquette

# text
seg-a86ce24d81de = Bande

# text
seg-74f4e80c65cb = Composantes

# attr:title
seg-e769f0411e64 = Retiré par son éditeur ; aucune copie archivée

# text
# c1: docs/LEO-SIGNAL.md
seg-2255f9acec5b = Source : <c1/>

# text
seg-ff4c44ecdecb = Conceptions de signaux LEO-PNT et spectre multibande

# text
# c1: leo-signal
# c2: spectrum
# c3: leo-pass
# c4: leo-pnt-chain
seg-5e222f965192 = Le type de scénario <c1/> analyse les signaux de positionnement, navigation et synchronisation temporelle (PNT) en orbite terrestre basse (LEO). Il n'est lié à aucun système en particulier. Un signal est une conception paramétrée (des données, pas du code), de sorte que le même type de scénario analyse un signal commercial publié, une conception représentative pour une bande que personne n'a publiée, ou n'importe quelle conception qu'un scénario écrit en ligne. Le type de scénario <c2/> trace aussi ces conceptions, dans toute bande de la très haute fréquence (UHF) à C, chaque bande avec ses propres brouilleurs, et une bande <c3/> ou une exécution <c4/> peut porter n'importe laquelle d'entre elles (voir <a1>Où les conceptions sont utilisées</a1>).

# text
seg-caccfa826a1a = Exécutez les exemples fournis :

# text
# c1: kshana example leo-band-trade
seg-441136f32290 = <c1/> : un arbitrage de bande de l'UHF à la bande C large sur des conceptions représentatives ;

# text
# c1: kshana example xona-pulsar-signals
seg-23cea428326c = <c1/> : les signaux publiés Xona Pulsar X1 et X5 ;

# text
# c1: kshana example multi-band-jamming-waterfall
# c2: spectrum
seg-5dcfa318a4f3 = <c1/> : panneaux UHF, L, S et C sous des brouilleurs par bande (un scénario <c2/>) ;

# text
# c1: kshana scenarios/celeste-iod-classical-pilot-signals.toml
seg-0390769a8d7f = <c1/>, depuis une copie du dépôt (non fourni) : les bandes et la configuration de signal de la démonstration en orbite (IOD) Celeste présentées à l'atelier LEO-PNT du programme d'innovation et de soutien à la navigation (NAVISP) de l'Agence spatiale européenne (ESA), { "2026" } (voir <a1>Paramètres de l'atelier</a1> ci-dessous).

# text
# c1: src/leo_signal.rs
# c2: src/navsignal.rs
# c3: src/spectrum.rs
# c4: data/leo-signals/
seg-62511ee92f8a = Code : <c1/> (conceptions de signaux, le type de scénario), <c2/> (les formes closes), <c3/> (la cascade multibande), fichiers de préréglage sous <c4/>.

# text
seg-ce08de9a19de = Une conception de signal

# text
seg-fc0d265f4006 = fréquence centrale, largeur de bande d'émission (le spectre est nul en dehors) et attribution de l'Union internationale des télécommunications (UIT) : service de radionavigation par satellite (RNSS), service de radiodétermination par satellite (RDSS), service mobile par satellite (MSS), service d'exploration de la Terre par satellite (EESS), une bande hors RNSS, ou autre

# text
seg-be2d5e822342 = tout sous-ensemble d'une composante d'<b>acquisition</b> (courte et à faible débit, facile à trouver), d'une composante de <b>données</b> (le message de navigation) et d'une composante <b>pilote</b> (sans données, pour la mesure de distance)

# text
seg-e73d9832efe0 = Par composante

# text
# c1: FLAT(<MHz>)
seg-dac784d5f41a = modulation : modulation par déplacement de phase binaire BPSK(n) à n × { "1.023" } Mchip/s (n peut être une fraction, BPSK(1/3) vaut { "341" } kchip/s), porteuse à décalage binaire BOC(m,n), BOC multiplexée, ou <c1/> pour une balise à multiplexage par répartition orthogonale de la fréquence (OFDM) ; part de la puissance ; décalages de sous-porteuse de l'accès multiple par répartition en fréquence (FDMA) ; longueur du code ; débit de données

# text
seg-4ccb9e269d64 = Facultatif

# text
# c1: ranging = false
seg-4c22d21ea8f0 = puissance reçue de référence et maximale, altitude de l'orbite, <c1/> pour un signal à Doppler seul, notes sur ce qui est publié et ce qui est supposé

# text
# c1: presets = [...]
# c2: [[signals]]
# c3: generic-bands
seg-c6b46532af9a = Un scénario prend ses signaux dans <c1/> et dans des tables <c2/> en ligne. Sans l'un ni l'autre, il analyse le préréglage <c3/>.

# text
# c1: data/leo-signals/
seg-a917a5ccfb79 = Un fichier chacun sous <c1/>, compilé dans le programme, chacun citant l'URL de sa source. Une valeur que la source ne publie pas est marquée REPRESENTATIVE dans le fichier et dans le rapport.

# text
seg-7159574bf255 = Signaux

# text
seg-c2831d853b1d = Approximations indiquées

# text
# c1: xona-x1
# c2: xona-x5
seg-7816d4f1c3f1 = <c1/> ({ "1593.3225" } MHz, { "1.023" } Mchip/s), <c2/> ({ "1190.51625" } MHz, { "10.23" } Mchip/s) ; puissance reçue minimale et maximale ; { "1080" } km

# text
seg-332a08bef0de = modulation par déplacement de phase en quadrature de Feher améliorée (EFQPSK) tracée avec l'enveloppe BPSK à chips rectangulaires ; code shift keying et codes de recouvrement non modélisés ; largeur de bande d'émission = lobe principal (non publiée)

# text
# c1: iridium-stl
seg-d37420c5c9f5 = salves <c1/> Satellite Time and Location (STL), modulation par déplacement de phase en quadrature (QPSK) à { "25" } ksymboles/s, { "780" } km, Doppler et synchronisation temporelle seulement

# text
seg-a765878134e2 = PUBLIC, <a1>rapport de la Resilient Navigation and Timing Foundation (RNTF)</a1>

# text
seg-5ca54b21f017 = porteuse au milieu de { "1616" } à { "1626" } MHz ; puissance reçue déduite de la valeur publiée de { "300" } à { "2400" } fois le Global Positioning System (GPS)

# text
# c1: starlink-ku-beacon
seg-e43d1db73131 = <c1/>, une balise OFDM de { "240" } MHz, Doppler seul

# text
seg-ff9e0075e868 = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>

# text
seg-fee9a553c9ae = spectre plat ; centre du canal et altitude de la couche REPRESENTATIVE ; le rapport porteuse sur densité de bruit (C/N₀) publié, d'environ { "57" } dB-Hz, est fixé par le récepteur

# text
# c1: centispace-l1
# c2: centispace-l5
seg-f89372b5231e = <c1/>, <c2/>, BPSK à { "2.046" } Mchip/s

# text
seg-2e6475b25d55 = PUBLIC, <a1>PubMed Central PMC10301026</a1>

# text
seg-ac53cebe5303 = porteuses placées aux porteuses GPS L1 et L5 (« près de » dans la source) ; longueur de code REPRESENTATIVE

# text
# c1: generic-c-band-leo
seg-cb1420efc108 = <c1/>, { "5020" } MHz, BPSK({ "10" }) dans { "20" } MHz

# text
seg-895f6039fce2 = REPRESENTATIVE, pour les systèmes en bande C dont les paramètres ne sont pas publics (tels que TrustPoint)

# text
seg-a407aaab864c = la conception entière

# text
seg-2f679a429dae = REPRESENTATIVE, attributions tirées du <a1>Règlement des radiocommunications de l'UIT</a1> ; la porteuse UHF de { "465" } MHz tirée de l'<s1>étude publique openRECEIVER des signaux LEO-PNT</s1>

# text
seg-2054d9ce8a0d = la conception entière (y compris la largeur de bande et la modulation UHF)

# text
seg-24360342e8e6 = L'éphéméride polynomiale « horloge nulle » d'ATOMIC est un modèle de message de navigation, et non une conception de signal ; elle relève des travaux sur le message de navigation, et non d'ici.

# text
seg-ebfc032d7898 = Ce qui est calculé par signal

# text
# c1: η = (2/π)[Si(πBT_c) − sin²(πBT_c/2)/(πBT_c/2)]
seg-211f655e00fa = <b>Densité spectrale de puissance (PSD) à bande limitée</b> et, par composante, la fraction de sa puissance que laisse passer la bande d'émission. Pour une composante BPSK au centre, la forme close <c1/> figure à côté de la valeur numérique ({ "90.3" } % pour le lobe principal).

# text
# c1: β² = [B/2 − sin(πBT_c)/(2πT_c)] / (π² T_c η)
seg-05e2a7b8235a = <b>Largeur de bande quadratique moyenne (RMS, de Gabor)</b> du composant suivi dans la bande, avec la forme close BPSK <c1/>.

# text
# c1: σ² = B_L(1 − ½B_L T) ∫ G sin²(πfΔ) df / [(2π)² (C/N₀) (∫ f G sin(πfΔ) df)²]
seg-f878fd0359c9 = <b>Gigue de bruit thermique du suivi de code</b> d'une boucle à verrouillage de délai (DLL) en fonction du C/N₀ et de l'espacement des corrélateurs early-late, d'après la formule early-late à bande limitée de Betz et Kolodziejski ({ "2009" }) : <c1/>, cohérente par défaut, avec la perte par mise au carré non cohérente sur demande. Le rapport ajoute la forme de manuel à bande illimitée (Kaplan et Hegarty) et la borne d'espacement évanescent fixée par la largeur de bande de Gabor. La <b>précision de mesure de distance</b> est cette gigue en mètres au C/N₀ et à l'espacement de référence.

# text
# c1: f v R_E cos(el) / ((R_E + h) c)
# c2: 2/(3T)
seg-089e4e98af82 = <b>Acquisition</b> : le plus grand Doppler de satellite sur un passage au zénith à l'élévation du masque (<c1/>, orbite circulaire, sans rotation de la Terre) plus les termes de l'oscillateur et de l'utilisateur ; cases Doppler de <c2/> ; cases de code sur une période ; la probabilité de détection d'un détecteur quadratique (Q de Marcum généralisée) à une probabilité de fausse alarme par cellule, centrée et dans le pire cas de chevauchement ; et le temps d'acquisition moyen d'une recherche à temps d'intégration unique, série et parallèle sur le code (Holmes).

# text
seg-1e2029183bdc = <b>Compatibilité</b> : le coefficient de séparation spectrale (SSC) du signal à bande limitée dans GPS L1 coarse/acquisition (C/A), Galileo E1, GPS L5, Galileo E5a, E5b et le signal E5 à BOC alternée (AltBOC) sur chaque bande de récepteur de système mondial de navigation par satellite (GNSS), la perte de C/N₀ qu'il cause à sa puissance reçue, et le SSC et la perte de C/N₀ de chaque signal GNSS dans la composante suivie LEO.

# text
# c1: spectrum
# c2: spectrum::Jammer::ssc
seg-864f3f2a5aa1 = <b>Tolérance au brouillage</b> : le rapport de puissance brouilleur sur signal (J/S) d'une onde entretenue (CW) à la porteuse, d'un bruit plat sur la bande d'émission et d'un bruit adapté à la composante suivie qui amène la composante suivie au seuil de suivi, d'après le code SSC propre au type de scénario <c1/> (<c2/>).

# text
# c1: 10 log₁₀(s/η)
# c2: spectrum
seg-0fbea397ab93 = Convention de C/N₀ : le balayage et la référence sont le C/N₀ <b>total dans la bande</b>. La part d'une composante entre dans les formules de suivi et de brouillage sous la forme <c1/> (sa part de la puissance non filtrée rapportée à la fraction dans la bande), la même convention que celle qu'utilise le type de scénario <c2/> pour une bande simple, dont la puissance de modulation hors de la bande du récepteur est perdue de la même façon.

# text
seg-3b7d16e8873a = L'arbitrage de bande

# text
# c1: [trade]
# c2: 40.3·TEC/f²
seg-39382eb3a60c = <c1/> place chaque signal à côté d'un signal de référence : retard de groupe ionosphérique du premier ordre <c2/> pour un contenu électronique total oblique (TEC) que vous donnez ({ "1" } unité TEC, TECU, = 10¹⁶ électrons/m²), perte en espace libre (FSPL) à une distance oblique, précision de mesure de distance à <b>C/N₀ égal</b> et à <b>puissance isotrope rayonnée équivalente (PIRE) égale</b> (C/N₀ moins la différence de perte en espace libre, antennes isotropes aux deux extrémités), et tolérance au brouillage au C/N₀ à PIRE égale.

# text
# c1: scenarios/leo-band-trade.toml
seg-58ced9eba711 = <c1/> ({ "50" } TECU, { "1000" } km, { "45" } dB-Hz, espacement cohérent de 0.5 chip, boucle de { "1" } Hz, { "20" } ms) :

# text
seg-72f051e2d7e1 = Signal

# text
seg-3cfdff157be3 = Retard ionosphérique

# text
seg-b1436d1fd7a4 = ΔFSPL par rapport à L

# text
seg-b5ce20ced519 = Distance, C/N₀ égal

# text
seg-2becbee24d47 = C/N₀, PIRE égale

# text
seg-aba982013f21 = Distance, PIRE égale

# text
seg-8b292612e43e = Tolérance J/S CW

# text
seg-53c8b6059c3f = { "465" } MHz, BPSK({ "5" })

# text
seg-1ee03c5e8633 = { "93.19" } m (×{ "6.57" })

# text
seg-66e74ec8ec1f = −{ "8.17" } dB

# text
seg-4dfc4b277e46 = { "0.221" } m

# text
seg-2a67835c7ddd = { "53.17" } dB-Hz

# text
seg-b36b61eaff50 = { "0.086" } m

# text
seg-37de1532b69e = { "42.1" } dB

# text
seg-f16b26301a6b = { "1191.795" } MHz, BPSK({ "10" })

# text
seg-1cc0fc817fca = { "14.19" } m

# text
seg-c1d04452ee8f = { "0.111" } m

# text
seg-b1dccfc14bb2 = { "45.00" } dB-Hz

# text
seg-467afbc3965e = { "45.0" } dB

# text
seg-63fc45ce7ef9 = { "2492.028" } MHz, BPSK({ "5" })

# text
seg-d4b8b8837709 = { "3.24" } m (×{ "0.229" })

# text
seg-271acd87a8d6 = +{ "6.41" } dB

# text
seg-0f38ea614b7f = { "0.185" } m

# text
seg-c531dc11c01d = { "38.59" } dB-Hz

# text
seg-6edbdabf77cb = { "0.388" } m

# text
seg-b1c384a78d8c = { "41.7" } dB

# text
seg-d13c29401059 = { "5020" } MHz, BPSK({ "10" })

# text
seg-7563cf0f3ebb = { "0.80" } m (×{ "0.056" })

# text
seg-fa10d26d0f8e = +{ "12.49" } dB

# text
seg-9f6390cc903b = { "32.51" } dB-Hz

# text
seg-d04fb147c95f = { "0.465" } m

# text
seg-e825ae4d1080 = { "43.4" } dB

# text
seg-2f20b409a3df = { "5100" } MHz, BPSK({ "50" })

# text
seg-6f22870202af = { "0.77" } m (×{ "0.055" })

# text
seg-ad13cdf3955f = +{ "12.63" } dB

# text
seg-da4b72e53c18 = { "0.022" } m

# text
seg-07ba1b6b9728 = { "32.37" } dB-Hz

# text
seg-e96dfdc0d92f = { "0.093" } m

# text
seg-04a27fee9486 = { "50.3" } dB

# text
seg-edcaed830e15 = L'arbitrage se lit dans les deux sens. À C/N₀ égal, la précision de mesure de distance est fixée par la cadence de chips et par la bande (la bande C large mesure cinq fois plus finement que L). À puissance rayonnée égale, la perte en espace libre fait payer pleinement les bandes plus hautes : la bande C perd { "12.5" } dB de C/N₀ et mesure quatre fois moins bien que L, l'UHF gagne { "8.2" } dB, tout en portant { "6.6" } fois le retard ionosphérique. La bande C large rachète sa précision par la largeur de bande. Cela repose sur les conceptions représentatives et sur des antennes isotropes ; une antenne utilisateur directionnelle en bande C modifie les colonnes à PIRE égale.

# text
seg-9bb6fa0e7a95 = Xona Pulsar

# text
# c1: scenarios/xona-pulsar-signals.toml
seg-d71e8de9cdda = <c1/> aux puissances reçues minimales publiées pour une antenne de { "290" } K et un facteur de bruit de { "2" } dB (plancher −{ "201.98" } dBW/Hz) :

# text
seg-4cf70433cc54 = C/N₀ de référence

# text
seg-2a22ffc83e00 = { "53.78" } dB-Hz

# text
seg-8f274ed7feff = { "57.08" } dB-Hz

# text
seg-6be7e20ca92f = Précision de mesure de distance ({ "0.5" } chip, cohérente, { "1" } Hz)

# text
seg-60218177538e = { "0.402" } m

# text
seg-e5ccbfea146d = { "0.028" } m

# text
seg-b5a638da9ee1 = Doppler maximal du satellite, { "1080" } km

# text
seg-6917f2712acf = { "33.2" } kHz

# text
seg-895ac83e4a5b = { "24.8" } kHz

# text
seg-b4c4179a0363 = Cases Doppler × code ({ "1" } ms, { "0.5" } chip)

# text
seg-bed6ba024afe = Temps d'acquisition moyen parallèle sur le code

# text
seg-93ffb02c7c50 = { "0.15" } s

# text
seg-3671bc5f2ace = { "0.37" } s

# text
seg-7e4c190cb4ab = X5 se situe à { "1190.51625" } MHz, dans la bande Galileo E5 : son SSC est de −{ "91.2" } dB/Hz dans Galileo E5a et GPS L5, de −{ "103.2" } dB/Hz dans E5b et de −{ "86.2" } dB/Hz dans le signal AltBOC, et un satellite X5 à sa puissance minimale relève la densité de bruit d'un récepteur GNSS de { "0.0001" } à { "0.005" } dB. Le Doppler X1, { "33.2" } kHz, est dans l'intervalle de { "32" } à { "34" } kHz que signale l'article (la ligne Doppler VALIDATED ci-dessous).

# text
seg-661eefb1f346 = Le spectre multibande

# text
# c1: spectrum
# c2: [[bands]]
# c3: gps-l1ca
# c4: galileo-e1
# c5: gps-l2c
# c6: gps-l5
# c7: galileo-e5a
seg-0a8bbe2921fd = Les <c2/> du type de scénario <c1/> acceptent, outre les cinq bandes GNSS nommées (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>) :

# text
# c1: signal = "<preset signal>"
# c2: signal_power_dbw
# c3: tracked_power_dbw
seg-63bd7d8a192d = <c1/> : une conception de préréglage, tracée avec chaque composante, limitée en bande à sa largeur de bande d'émission, reçue à la puissance de référence du préréglage ou à <c2/>. Le C/N₀ et le J/S se rapportent à la composante suivie (<c3/> dans le rapport) ;

# text
# c1: centre_mhz
# c2: modulation
# c3: signal_power_dbw
seg-603a2b97e621 = <c1/> avec <c2/> et <c3/> : n'importe quelle bande personnalisée.

# text
# c1: [[panels]]
# c2: wideband
# c3: l-band-waterfall-jamming
# c4: tests/leo_signal_reference.rs
seg-b1c30f5d69cf = <c1/> ajoutent des cascades sur d'autres plages de fréquences, sur la même chronologie et la même échelle de couleurs, et un brouilleur <c2/> (à large bande) s'ajoute aux bruits CW, à bande étroite, chirp et adapté. Une bande simple se comporte exactement comme avant : l'exemple fourni <c3/> donne toujours { "43.48" } dB-Hz nominal et { "3.23" } dB-Hz minimum pour L1 C/A (figé dans <c4/>).

# text
# c1: scenarios/multi-band-jamming-waterfall.toml
seg-35151477cbc2 = <c1/> ({ "60" } s, une ligne par seconde) :

# text
seg-47408d30d095 = C/N₀ nominal

# text
seg-e618666a44d8 = Après son propre brouilleur

# text
seg-f75d3804cfe8 = Brouilleur

# text
seg-5751b2520829 = generic-uhf ({ "465" } MHz)

# text
seg-995748f9c74c = { "49.41" } dB-Hz

# text
seg-a582f1a22a07 = { "34.38" } dB-Hz à partir de { "10" } s

# text
seg-23570b8c7403 = CW à la porteuse, −{ "120" } dBW

# text
seg-5393b075ff7f = { "43.48" } dB-Hz

# text
seg-2e935ea7b90e = { "3.38" } dB-Hz à partir de { "20" } s (perdu)

# text
seg-52256ba98a99 = chirp de { "16" } MHz, { "50" } mW à { "100" } m

# text
seg-4321ccaeeca5 = { "46.73" } dB-Hz

# text
seg-71abaef6924e = { "38.51" } dB-Hz à partir de { "30" } s

# text
seg-45441a20f061 = brouillage à large bande de { "40" } MHz à { "1185" } MHz, −{ "118" } dBW

# text
seg-59fd1427d61b = { "54.51" } dB-Hz

# text
seg-430461899d82 = { "46.29" } dB-Hz à partir de { "30" } s

# text
seg-4bcace842ce1 = le même brouillage à large bande

# text
seg-472da83fd67a = generic-s ({ "2492.028" } MHz)

# text
seg-0f47178201ca = { "49.23" } dB-Hz

# text
seg-0f0cad45f636 = { "41.69" } dB-Hz à partir de { "40" } s

# text
seg-d04f42bc0567 = bruit de { "2" } MHz, −{ "128" } dBW

# text
seg-372655e7c722 = generic-c-band-leo ({ "5020" } MHz)

# text
seg-f8e6beeceedd = { "47.41" } dB-Hz

# text
seg-b27c4bc24059 = { "40.35" } dB-Hz à partir de { "50" } s

# text
seg-ab6304cf6aec = bruit adapté, −{ "124" } dBW

# text
seg-1f8a742cb215 = Chaque brouilleur n'affecte que sa propre bande ; le test maintient toutes les autres bandes à leur C/N₀ nominal jusqu'à ce que leur propre brouilleur démarre.

# text
seg-01c63dd5d11b = Où les conceptions sont utilisées

# text
seg-74f85b484b08 = Une conception est recherchée par son nom partout où une bande peut en nommer une :

# text
# c1: spectrum
# c2: signal = "<design>"
# c3: multi-band-jamming-waterfall
# c4: leo-resilience-js-margin
# c5: leo-resilience-multiband-diversity
# c6: leo-resilience-gnss-jammed-leo-carries
seg-4a7aca809ec3 = une bande <c1/> (<c2/>, ci-dessus) : <c3/>, <c4/> et les campagnes <c5/> et <c6/> ;

# text
# c1: leo-pass
# c2: signal = "<design>"
# c3: frequency_mhz
seg-1ee84efd74b3 = une bande <c1/> (<c2/>) : la bande reprend la fréquence centrale de la conception (sauf si <c3/> est donné), la largeur de bande d'émission et la cadence de chips suivie, répartit sa PIRE entre les composantes selon leurs parts de puissance, et indique à chaque époque le C/N₀ de la composante suivie et la gigue de suivi de code à bande limitée (<a1>LEO-PASS.md</a1>) ;

# text
# c1: leo-pnt-chain
# c2: leo-pnt-end-to-end
# c3: xona-pulsar-end-to-end
seg-33732550ba94 = le type de scénario <c1/>, qui transmet la répartition de puissance et la cadence de chips d'une conception au passage, et sa porteuse et sa cadence de chips à la position fusionnée (<c2/>, <c3/> ; <a1>LEO-PNT.md</a1>).

# text
seg-625f50ac3189 = Paramètres de l'atelier

# text
# c1: scenarios/celeste-iod-classical-pilot-signals.toml
# c2: src/celeste_iod.rs
# c3: scenarios/*celeste-iod*.toml
seg-9d50778efa0a = <c1/> contient les bandes de fréquences de Celeste IOD et la configuration de signal n° 1 « Classical Pilot » telles que présentées à l'atelier LEO-PNT du NAVISP de l'ESA, { "2026" }, avec un contrôle de forme d'une conception par rapport au spectre mesuré qui y était montré. C'est l'un des fichiers du préréglage Celeste IOD (les autres sont <c2/> et les autres <c3/>) ; aucune spécification du signal Celeste n'est publique. Ses composantes portent leurs hypothèses (répartitions de puissance, longueurs de code, décalages FDMA, et une modulation représentative pour les bandes dont la modulation n'a pas été présentée). Le contrôle de forme est une cohérence MODELLED : il compare des formes, non des niveaux étalonnés.

# text
# c1: src/celeste_iod.rs
# c2: scenarios/*celeste-iod*.toml
# c3: kshana example
# c4: include_str!
seg-6e259f57af91 = Il est retiré avec le reste du préréglage : supprimez <c1/> et les fichiers <c2/>. Rien ne compile le scénario dans le programme : l'interface en ligne de commande le liste comme scénario réservé au dépôt (<c3/> le nomme et l'explique, au lieu de l'afficher), et un test refuse tout <c4/> de celui-ci. Tout autre scénario, test et référence indépendante s'exécute sans lui ; le test qui le lit réussit avec une note quand il est absent, et le décompte des fichiers de scénario du README le compte toujours.

# text
seg-53a7343c076e = Affirmation

# text
seg-6e0de0f2b25f = puissance BPSK dans la bande ({ "90.3" } % dans le lobe principal) ; gigue early-late à bande limitée se réduisant aux formes de manuel cohérente et non cohérente et à sa borne de Gabor ; auto-SSC BPSK 2/({ "3" } R_c)

# text
seg-e35f7c20a976 = Kaplan & Hegarty, Betz & Kolodziejski { "2009" }, Betz { "2001" }, Abramowitz & Stegun tableau { "5.1" }

# text
seg-0ceb71e558f6 = Forme close de la largeur de bande de Gabor à bande limitée ; SSC BPSK décalée à décalage non nul ; aire unité d'AltBOC (le tout dans la ligne ci-dessus, comme recoupements)

# text
seg-b0552001e519 = cohérence interne

# text
seg-af6cff634177 = dérivé ici, vérifié par rapport à une quadrature

# text
seg-6b74bc7777c7 = Doppler LEO maximal

# text
seg-f4f4ee11749d = Xona Pulsar X1 de { "32" } à { "34" } kHz (arXiv { "2509.19551" }) ; Iridium ±{ "36" } kHz (RNTF)

# text
# c1: leo-signal
seg-08e5ec9a31a0 = conceptions, acquisition, compatibilité, tolérance au brouillage, arbitrage, contrôles de forme de <c1/>

# text
seg-64f232587c5f = les formes closes validées, l'identité du détecteur P_d({ "0" }) = P_fa, le temps moyen de Holmes, la chaîne SSC propre au type de scénario de spectre

# text
seg-a456645f97aa = Spectre multibande

# text
seg-868432ccfa09 = réduction aux chaînes de spectre et de brouillage inchangées

# text
seg-430edd66bda0 = Non modélisé

# text
seg-d3bba3714684 = Les spectres exacts de l'EFQPSK, du code shift keying et de l'OFDM.

# text
seg-53a727d317ae = La structure en raies des codes d'étalement et l'intercorrélation d'accès multiple.

# text
seg-08e229ae97e9 = Les filtres d'émission et de réception au-delà d'un mur de briques idéal : aucune émission hors bande.

# text
seg-b1fe4ce62e6a = Les trajets multiples, la quantification et le contrôle automatique de gain.

# text
seg-5d2af0802400 = La rotation de la Terre dans la borne du Doppler (jusqu'à environ { "0.46" } km/s de vitesse de distance).

# text
seg-5e5e1124fbbb = Le retard ionosphérique au-delà du premier ordre, et la répartition du contenu électronique au-dessus et au-dessous d'un satellite LEO : le TEC oblique est une entrée.

# text
seg-8c0d738304ab = Les pertes atmosphériques, de pluie et de polarisation.

# text
seg-1fc440f042cf = La logique d'acquisition à temps d'intégration multiples.

# text
seg-090a6ecf879f = Les interférences cumulées au-delà d'un décompte par satellite.

# text
seg-c4b2a79ee33d = J. W. Betz et K. R. Kolodziejski, « Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I », <em>IEEE (Institute of Electrical and Electronics Engineers) Transactions on Aerospace and Electronic Systems</em> { "45" }({ "4" }), { "2009" }.

# text
seg-52ad2f21daf4 = J. W. Betz, « Binary Offset Carrier Modulations for Radionavigation », <em>NAVIGATION</em> { "48" }({ "4" }),

# text
seg-aeeea70a0258 = E. D. Kaplan et C. J. Hegarty (dir.), <em>Understanding GPS/GNSS</em>, 3e éd., Artech House,

# text
seg-343397c21357 = J. K. Holmes, <em>Coherent Spread Spectrum Systems</em>, Wiley, { "1982" }.

# text
seg-34af310a980b = M. Abramowitz et I. A. Stegun, <em>Handbook of Mathematical Functions</em>, { "1964" }, §{ "5.2" } et tableau { "5.1" }.

# text
seg-45606af6bda2 = Galileo Open Service Signal-in-Space Interface Control Document ; IS-GPS-200 ; IS-GPS-705.

# text
seg-960fc01f0a62 = Leclère, Marathe et Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>.

# text
seg-70efdc604ab9 = Resilient Navigation and Timing Foundation, <em>Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites</em>, <a1>https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf</a1>.

# text
seg-72490fa16fd2 = Kozhaya, Saroufim et Kassas, <em>NAVIGATION</em> { "72" }({ "1" }), { "2025" }, <a1>https://navi.ion.org/content/72/1/navi.685</a1>.

# text
seg-00cfb54b28c0 = CentiSpace : <a1>https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/</a1>.

# text
seg-4d954d28b661 = Faits et chiffres sur Celeste IOD de l'ESA : <a1>https://www.esa.int/Applications/Satellite_navigation/Celeste/Celeste_IOD_-_Facts_and_figures</a1>.

# text
seg-d43b8255ba58 = Règlement des radiocommunications de l'UIT : <a1>https://www.itu.int/pub/R-REG-RR</a1>.

# text
# c1: generic-uhf
seg-3a9fe081eb89 = openRECEIVER, <em>LEO-PNT Signals: Inside CELESTE's Four Bands</em>, { "1" }er août { "2026" } (la source publique de la porteuse UHF de { "465" } MHz de <c1/>) : <s1>https://open-receiver.com/blogs/leo-pnt-signals-celeste/</s1>. La page a été retirée du site (HTTP { "404" } et disparue de l'index de son blog le 2026-09-29) ; les moteurs de recherche la listent encore sous ce titre.

# text
seg-18b16c83dd7c = <s1>Précédent</s1>Positionnement, navigation et synchronisation temporelle LEO

# text
seg-50fe3f8ae7ec = <s1>Suivant</s1>Passage LEO et bilan de liaison
