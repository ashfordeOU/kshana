# docs--leo-pass: translations (fr)

# text
seg-cae10fb9bff8 = Scénario

# text
seg-cbf0f9bcd2d8 = Référence indépendante

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-f63dd3d7aad4 = Source

# text
seg-587beeccaa11 = Préréglage

# text
seg-1ff32b87e030 = Satellites

# text
seg-a6c63abeb7e6 = Scénarios fournis

# text
seg-60cd077d82a7 = Modèle

# text
seg-2b0d77219437 = Préréglages

# text
seg-5566e1d71a4f = Orbite

# text
seg-c2a2761f73b1 = { "550" } km, { "53" }°

# text
seg-c5ce76c91ff7 = Étiquette

# text
# c1: docs/LEO-PASS.md
seg-813d372bda81 = Source : <c1/>

# text
# c1: leo-pass
seg-0bd4af67ffdb = Passage LEO et bilan de liaison (<c1/>)

# text
# c1: leo-pass
seg-30417c63c48e = LEO-PNT désigne le positionnement, la navigation et la synchronisation temporelle (PNT) à partir de satellites en orbite terrestre basse (LEO). Le type de scénario <c1/> simule un ou plusieurs passages de satellites LEO au-dessus d'un utilisateur et établit le bilan de liaison bande par bande, à côté des satellites GNSS (système mondial de navigation par satellite) en orbite terrestre moyenne (MEO) en vue. Le moteur est <b>indépendant du système</b> : toute constellation, toute conception de signal et toute bande, écrites directement dans un scénario. Les systèmes nommés sont des préréglages facultatifs, chacun dans son propre fichier avec sa source.

# text
# c1: src/leo_pass.rs
# c2: src/leo_link/
seg-242c84daecb0 = Code : <a1><c1/></a1> (le type de scénario) et <a2><c2/></a2> (briques publiques que d'autres modules peuvent appeler).

# text
# c1: leo-pass-vs-gnss-cn0
# c2: leo-indoor-uhf
# c3: leo-iot-energy
# c4: leo-pass-xona-pulsar
# c5: leo-pass-iridium
# c6: leo-resilience-spoof-doppler
# c7: leo-focus-science-iono-sounding
# c8: leo-pass-celeste-iod-multiband
# c9: leo-resilience-spoof-monitors
# c10: leo-focus-iot-eirp
# c11: leo-focus-indoor-uhf
# c12: leo-vertical-*
# c13: leo-pnt-chain
seg-0e6b09e372f5 = Scénarios : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, et le facultatif <c8/> (résultats dans <a1>Scénarios fournis</a1>). Ce type de scénario est aussi membre des campagnes <c9/>, <c10/>, <c11/> et de chaque scénario <c12/>, ainsi que l'étape de passage du type de scénario <c13/>.

# text
seg-59cebed2f589 = Vue d'ensemble de chaque type de scénario et de chaque scénario LEO-PNT : <a1>LEO-PNT.md</a1>.

# text
# c1: tests/leo_link_reference.rs
# c2: tests/fixtures/leo_link/
seg-9646ce17cddf = Références indépendantes : <a1><c1/></a1>, jeux de données dans <c2/> avec leurs URL sources.

# text
seg-c1020ac47091 = Ce que calcule une exécution

# text
seg-10dedc607eac = Pour chaque satellite LEO, chaque bande et chaque époque :

# text
seg-35bf9a48e566 = Terme

# text
seg-b0f12ee05fe9 = Élévation, azimut, distance

# text
seg-24ad909c4fb8 = utilisateur en WGS-84 (World Geodetic System { "1984" }), satellite dans un référentiel inertiel aligné sur le référentiel terrestre à l'époque

# text
seg-c9f61c3348ef = calculé

# text
# c1: ρ̇ = d·Δv/ρ
# c2: ρ̈ = (|Δv|² − ρ̇² + d·Δa)/ρ
seg-ebd800ec3d47 = Vitesse de distance <c1/>, accélération de distance <c2/>

# text
seg-232b42b71f03 = forme close ; chaque exécution vérifie les deux par rapport aux différences centrales de la distance propagée et indique la plus grande différence

# text
seg-b3a55e868346 = forme close

# text
# c1: −f·ρ̇/c
# c2: −f·ρ̈/c
seg-3f1f90a57c2f = Doppler <c1/>, taux de Doppler <c2/>

# text
seg-852b6c351ce4 = premier ordre, par bande

# text
seg-4eb4b779679b = Affaiblissement en espace libre

# text
# c1: 20·log10(4πRf/c)
seg-31f67bcd2d50 = Friis, <c1/>

# text
seg-fb5f06a91de1 = PIRE du satellite (puissance isotrope rayonnée équivalente) et diagramme

# text
# c1: −12(η/θ₃)²
seg-883702244778 = isoflux jusqu'à une élévation limite, lobe principal gaussien <c1/> dB, ou plat

# text
seg-b6e91c5252d3 = Antenne de l'utilisateur

# text
# c1: G_z + 10·q·log10(sin el)
seg-ed92a0abf62f = patch <c1/> dBic, hémisphérique ou isotrope

# text
seg-0ac54d232e0a = Atténuation gazeuse

# text
seg-30fb5b0a0bc7 = expressions simplifiées de l'annexe { "2" } de l'UIT-R (Union internationale des télécommunications, secteur des radiocommunications) P.676-10 (remplacée par la P.676-13, dont le moteur ne reprend pas les coefficients tabulés)

# text
seg-58d58478e9eb = Atténuation par la pluie

# text
seg-4c1e413d5fc3 = coefficients de l'UIT-R P.838-3 et procédure du § { "2.2.1.1" } de la P.618-14, à partir d'une intensité de pluie R0.01 et d'une hauteur de pluie

# text
seg-dab78c0552b6 = Scintillation troposphérique

# text
seg-8e5ca14cbf08 = UIT-R P.618-14 § { "2.4.1" } ; en dessous de { "4" } GHz, une extrapolation, signalée dans le rapport

# text
seg-788516420351 = VALIDATED ({ "4" }–{ "55" } GHz)

# text
seg-32dddfdba584 = Perte de pénétration dans les bâtiments (utilisateur en intérieur)

# text
seg-ef9025622e81 = UIT-R P.2109-2, traditionnel ou à efficacité thermique, à l'élévation du trajet au niveau de la façade

# text
seg-c7d1bccd4d51 = Désadaptation de polarisation

# text
seg-f4aaea269382 = facteur de perte de polarisation à partir des rapports axiaux et des sens, moyenné sur l'orientation de l'ellipse

# text
seg-96601850a9d5 = Température de bruit du système

# text
# c1: 290(10^(NF/10) − 1)
seg-82735c7f3ea5 = plancher de l'antenne + émission du ciel du trajet absorbant ({ "275" } K) + cosmique { "2.7" } K + récepteur <c1/>

# text
seg-53ce973b0ee7 = C/N0 (densité porteuse sur bruit)

# text
seg-fa01d060cf1a = Retard de groupe ionosphérique

# text
# c1: 40.3·STEC/f²
seg-33f2113dea70 = <c1/>, STEC (contenu électronique total oblique) issu du modèle de Klobuchar ou d'un contenu électronique total (TEC) vertical, mis à l'échelle par la fraction d'une couche de Chapman située sous le satellite

# text
seg-431dfeb5edba = mise à l'échelle VALIDATED, TEC MODELLED

# text
# c1: √(a₁² + a₂²)
# c2: [iot]
seg-56df31449434 = Par paire de bandes : les coefficients sans ionosphère, l'amplification du bruit <c1/> et le bruit de code thermique de chaque bande et de la combinaison au sommet du passage. La comparaison avec les GNSS en MEO utilise la même antenne utilisateur et le même récepteur, avec la puissance reçue minimale du document d'interface de chaque signal (Galileo Open Service Signal-in-Space Interface Control Document, OS SIS ICD, édition { "2.1" } tableau { "12" } ; GPS d'après IS-GPS-200 et IS-GPS-705), plus un excédent indiqué, ramené à l'échelle de la distance. La section facultative <c2/> (Internet des objets) donne le temps jusqu'à la première position, l'énergie par position et l'autonomie de la batterie en fonction du rapport cyclique pour un budget de puissance du récepteur donné (MODELLED, chaque hypothèse étant une entrée et listée dans le rapport).

# text
# c1: orbit = "pass"
seg-7132ede02109 = <c1/> (par défaut) : une orbite circulaire placée de sorte que l'utilisateur voie un passage d'élévation maximale choisie à un moment choisi, ascendant ou descendant, à l'est ou à l'ouest de l'utilisateur ; l'inclinaison peut être héliosynchrone.

# text
# c1: orbit = "elements"
seg-688307acbf0d = <c1/> : éléments képlériens explicites.

# text
# c1: orbit = "tle"
seg-e9085739bcb8 = <c1/> : un jeu d'éléments à deux lignes (TLE) passé dans le propagateur Simplified General Perturbations { "4" } (SGP4) du moteur.

# text
# c1: [[leo_constellation]]
# c2: constellation-design
# c3: ConstellationCfg
seg-7dcc5fdbc249 = <c1/> : une constellation de Walker construite par le code <c2/> (son <c3/>, ou les couches du préréglage) ; les passages les plus hauts de la fenêtre sont indiqués.

# text
seg-ec7e163dd073 = Bandes et conceptions de signal

# text
# c1: system = "<preset>"
# c2: bands
# c3: [[satellite.band]]
# c4: system = "none"
# c5: [[satellite.band]]
seg-4d49743b3544 = Bandes : <c1/> avec un sous-ensemble <c2/> facultatif, et des entrées <c3/> qui ajoutent une bande ou remplacent n'importe quel champ d'une bande de préréglage. <c4/> avec seulement des entrées <c5/> n'utilise aucun préréglage.

# text
# c1: leo-signal
# c2: signal = "xona-x5"
# c3: data/leo-signals/
# c4: leo-pnt-chain
# c5: frequency_mhz
# c6: leo-signal
seg-bd1e114aaea6 = Une bande peut aussi nommer une conception <c1/> (<c2/>, toute conception sous <c3/>, ou une conception que transmet le type de scénario <c4/> ; voir <a1>LEO-SIGNAL.md</a1>). La bande reprend alors la fréquence centrale de la conception (sauf si <c5/> est donné), la largeur de bande d'émission et la cadence de chips du composant suivi, répartit sa PIRE entre les composantes de la conception selon leurs parts de puissance, et indique à chaque époque le C/N0 du composant suivi et sa gigue de suivi de code early-late à bande limitée (Betz et Kolodziejski { "2009" }, la formule du type de scénario <c6/>) comme erreur de distance.

# text
seg-1d96501bb12d = Chaque préréglage marque ses nombres PUBLIC (avec URL), REPRESENTATIVE (un choix de conception documenté, jamais une affirmation sur un système réel) ou WORKSHOP.

# text
seg-f708914fed48 = Bandes

# text
# c1: generic-leo
seg-6459abcaeebe = <c1/> (par défaut)

# text
seg-a0dab2ebeb1b = REPRESENTATIVE ; porteuses L, S et C issues de documents publics

# text
seg-cd0075385395 = UHF { "450" } MHz (représentatif), L { "1191.795" } MHz (centre de Galileo E5), S { "2492.028" } MHz (NavIC S, la porteuse en bande S de Navigation with Indian Constellation), C { "5020" } MHz (centre de l'attribution de { "5010" }–{ "5030" } MHz au RNSS, le service de radionavigation par satellite), chacune à { "0" } dBW

# text
seg-3f0de4312fcb = { "550" } km héliosynchrone, Walker 240/12/1

# text
seg-486f17197d4d = REPRESENTATIVE, pour les systèmes en bande C dont les paramètres ne sont pas publics (par exemple TrustPoint)

# text
seg-f6696b70591c = C { "5020" } MHz, BPSK({ "10" }) (modulation par déplacement de phase binaire à { "10" } × { "1.023" } Mchip/s), isoflux

# text
seg-4ae6741795f9 = PUBLIC, <a1>arXiv { "2509.19551" }</a1> tableaux { "1" }–{ "2" }

# text
seg-a1be637cda63 = X1 { "1593.3225" } MHz, X5 { "1190.51625" } MHz ; PIRE d'après la puissance reçue minimale publiée à { "10" }°

# text
seg-cb74283148d7 = { "1080" } km, { "53" }° ({ "192" }) et { "97" }° ({ "66" })

# text
seg-5ae1331b91f8 = PUBLIC, <a1>Resilient Navigation and Timing Foundation (RNTF)</a1> et l'orbite publiée

# text
seg-c995dade5aa6 = Satellite Time and Location (STL) à { "1621" } MHz (milieu de { "1616" }–{ "1626" } MHz) ; PIRE d'après « { "300" } fois le GPS »

# text
seg-dd6322466888 = { "781" } km, { "86.4" }°, { "66" } sur { "6" } plans

# text
seg-ad0ba129439b = chiffres de signal PUBLIC (<a1>NAVIGATION { "72" }({ "1" })</a1>), orbite et PIRE REPRESENTATIVE

# text
seg-1931203a036c = balise Ku { "240" } MHz, Doppler seul

# text
seg-0533710bbbe1 = structure de signal PUBLIC (<a1>PMC10301026</a1>), orbite et PIRE REPRESENTATIVE

# text
seg-cee286338f01 = BPSK { "2.046" } Mchip/s près de L1 et L5

# text
seg-fe3cdce92b31 = { "1000" } km, { "55" }°

# text
# c1: celeste-iod
seg-03d5ae448705 = <c1/> (facultatif)

# text
seg-800f173f2b20 = paramètres de signal WORKSHOP, orbite PUBLIC

# text
seg-e8626249e708 = sept bandes de la configuration #1

# text
seg-cb29553176c7 = { "510" } km héliosynchrone

# text
# c1: link
# c2: src/celeste_iod.rs
# c3: scenarios/leo-pass-celeste-iod-multiband.toml
# c4: src/celeste_iod.rs
# c5: build.rs
# c6: scenarios/*celeste-iod*.toml
seg-10f79909a5bc = <b>Le préréglage Celeste IOD (démonstration en orbite) est facultatif.</b> Ses paramètres de signal ont été présentés à l'atelier LEO-PNT du programme d'innovation et de soutien à la navigation (NAVISP) de l'Agence spatiale européenne (ESA), { "2026" }, et n'ont pas encore de source publique ; ils se trouvent dans le module <c1/> de <c2/>, utilisé par <c3/>. Comment le préréglage est tenu à l'écart : chaque nombre issu de l'atelier figure dans un seul fichier du moteur, <c4/>, que <c5/> ne compile que s'il existe, et dans les scénarios réservés au dépôt <c6/>. Supprimer ce fichier et ces scénarios retire le préréglage sans modification de source ; tous les autres tests, références indépendantes et scénarios s'exécutent sans lui, et le décompte des fichiers de scénario du README compte toujours les fichiers retirés. Sa PIRE et son faisceau sont étalonnés sur une trace de C/N0 montrée à l'atelier, de sorte que ce scénario reproduit la trace par construction.

# text
seg-9f9ff4fe18f8 = Le modèle d'éphéméride diffusée par polynôme « horloge nulle » d'ATOMIC est un préréglage de message de navigation et ne fait pas partie de ce type de scénario.

# text
seg-dc496b16046b = L'observation LEO contre GNSS

# text
# c1: scenarios/leo-pass-vs-gnss-cn0.toml
seg-6be559b1ac29 = <c1/> reproduit qualitativement ce que montrent les démonstrations LEO-PNT : le C/N0 LEO monte et descend en cloche, reste au-dessus du masque pendant { "590" } s et culmine à { "56.8" } dB-Hz, soit { "8.9" } dB au-dessus de la médiane des porteuses GNSS MEO plates (Galileo E1, de { "40.5" } à { "52.0" } dB-Hz, médiane { "47.8" } dB-Hz). La marge vient de la distance, non d'un émetteur plus puissant : au sommet du passage, le satellite est à { "569" } km, soit environ { "40" } fois plus près qu'un satellite Galileo au zénith ({ "23 222" } km), ce qui représente { "32" } dB de perte en espace libre en moins ; le préréglage générique rayonne { "0" } dBW ({ "1" } W).

# text
# c1: kshana scenarios/<name>.toml
seg-08debab7c94a = Chaque ligne correspond à une exécution de <c1/> (moteur { $version }) :

# text
seg-9a60f0bf803e = Configuration

# text
seg-fde146239f5d = Résultat d'une exécution

# text
# c1: generic-leo
seg-41455a3f15b6 = <c1/> bande L, { "550" } km, passage à { "80" }° au-dessus de Munich

# text
seg-9d5c154eceb1 = pic L à { "56.8" } dB-Hz, médiane de { "42.2" } dB-Hz ; médiane de Galileo E1 à { "47.8" } dB-Hz

# text
# c1: xona-pulsar
seg-9423b1184fb0 = <c1/>, un passage conçu à { "70" }° et quatre satellites en couche inclinée, utilisateur maritime

# text
seg-63bf0b8f7f3a = pic de X1 à { "65.6" } dB-Hz et de X5 à { "68.9" } dB-Hz sur le passage conçu ; plus grand Doppler X1 : { "31.4" } kHz

# text
# c1: iridium-stl
seg-8a3383072765 = <c1/>, passage à { "65" }°, utilisateur aéroporté

# text
seg-d2fea8542638 = pic STL à { "80.5" } dB-Hz, soit { "34.3" } dB au-dessus de la médiane de GPS L1 ; plus grand Doppler : { "35.4" } kHz

# text
# c1: generic-leo
seg-d837a8a7648b = <c1/>, utilisateur en intérieur à Rome (bâtiment traditionnel)

# text
seg-4fbead0588d2 = pics UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "8.5" } dB-Hz ; médiane de Galileo E1 à { "22.4" } dB-Hz

# text
# c1: generic-leo
# c2: [iot]
seg-954e16842d59 = <c1/> UHF et L avec la section <c2/>

# text
seg-9aa81f6f4929 = première position à chaud { "0.90" } s et { "18.0" } mJ sur chaque signal ; à froid UHF { "19.0" } s ({ "381" } mJ), L { "47.0" } s ({ "939" } mJ), GPS L1 { "38.1" } s ({ "762" } mJ)

# text
# c1: generic-leo
seg-97476f9d4212 = <c1/>, quatre bandes, passage à { "70" }° au-dessus de Tromsø

# text
seg-fd1463da9965 = voir <a1>Sondage de l'ionosphère</a1>

# text
seg-1ad5bde12b4f = { "16" } satellites d'une couche générique à { "1080" } km, L et C, un saut de { "30" } m

# text
seg-25cf36cf0de3 = voir <a1>Moniteurs de leurrage</a1>

# text
# c1: kshana scenarios/<name>.toml --animate html --export all
# c2: .animation.html
seg-6cdf9830433e = <c1/> écrit aussi le lecteur interactif (<c2/>, les époques du passage) et des fichiers d'éphéméride CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON et STK (Systems Tool Kit) de la géométrie du passage (<a1>ANIMATION.md</a1>, <a2>INTEROP.md</a2>).

# text
seg-d3a0fc36329a = Sondage de l'ionosphère

# text
# c1: STEC = (P₂ − P₁)·f₁²f₂² / (40.3·(f₁² − f₂²))
# c2: geometry_free_stec_tecu
# c3: geometry_free_stec_sigma_tecu
# c4: scenarios/leo-focus-science-iono-sounding.toml
seg-1e64715af2ff = Chaque paire de bandes donne aussi le TEC oblique que sa combinaison de codes sans géométrie retrouve au sommet du passage, <c1/>, et l'écart-type à 1 sigma de cette estimation à partir du bruit de code des deux bandes au sommet (<c2/>, <c3/>). L'estimation est égale par construction au TEC oblique du modèle : la combinaison est exacte au premier ordre. Le sigma est ce qui fait d'un plan de bandes un meilleur ou un moins bon sondeur : <c4/> (quatre bandes au-dessus de Tromsø) retrouve { "18.85" } unités TEC à partir de chaque paire, avec un 1 sigma de { "0.017" } unité TEC pour UHF avec L et de { "2.9" } pour S avec C. Bruit de code thermique seulement ; ni trajets multiples ni biais inter-fréquences. MODELLED.

# text
# c1: [spoofer]
seg-8f59acefb2b3 = Moniteurs de leurrage (<c1/>)

# text
# c1: [spoofer]
# c2: onset_s
# c3: offset_m
# c4: push_rate_m_s
# c5: push_azimuth_deg
# c6: bands
# c7: gnss = false
# c8: simulate_iono
seg-91941393400a = La section facultative <c1/> contrefait les signaux qu'un récepteur verrait à une position déclarée. À partir de <c2/>, la position déclarée saute de <c3/> puis se déplace horizontalement à <c4/> vers <c5/> ; la distance et la vitesse de distance contrefaites sont exactement celles de la position déclarée, sur les bandes LEO nommées dans <c6/> (toutes par défaut) et sur le signal GNSS MEO, sauf si <c7/>. <c8/> indique si les pseudodistances contrefaites portent le retard ionosphérique (ce n'est pas le cas pour un émetteur au sol).

# text
# c1: src/leo_link/spoof.rs
# c2: p_fa
# c3: 1 − p_md
seg-845f6840d92d = Le récepteur exécute deux moniteurs (<a1><c1/></a1>), chacun à une probabilité de fausse alarme indiquée par époque (<c2/>, { "1e-5" } par défaut), et déclare la détection à la première époque où sa probabilité de détection atteint <c3/> ({ "0.999" } par défaut). Les probabilités de détection sont exactes pour le bruit gaussien indiqué, évaluées sur le résidu moyen sans bruit ; aucun bruit n'est tiré.

# text
seg-cc38b40eb7a5 = Moniteur

# text
seg-8b34ac584c3d = Statistique

# text
seg-7b158594c4d9 = Ce qu'il voit

# text
seg-89756d80bc29 = Cohérence du Doppler et de la géométrie du passage

# text
# c1: prior_sigma_m
# c2: prior_velocity_sigma_m_s
# c3: window_s
# c4: drift_sigma_m_s
seg-2174c7725e48 = vitesses de distance mesurées comparées à celles prédites à partir des orbites et d'une position et d'une vitesse a priori indépendantes (<c1/>, <c2/>) ; un khi-deux des moindres carrés généralisés sur une fenêtre de <c3/> (un pas par défaut), la dérive d'horloge étant un paramètre de nuisance (ou donnée par <c4/>) ; bruit de la boucle à verrouillage de fréquence issu du C/N0 (Kaplan et Hegarty { "2006" }, § { "5.6.2" }), sur les canaux GNSS, les canaux LEO et tous les canaux

# text
# c1: δx
# c2: g·δx
# c3: g = −(Δv − ρ̇u)/ρ
seg-14eab06a47d5 = une erreur de position <c1/> déplace une vitesse de distance de <c2/>, <c3/> : la vitesse transversale d'un satellite LEO rapportée à sa distance est environ { "25" } fois celle d'un satellite MEO, de sorte que la même erreur est environ { "25" } fois plus grande dans le Doppler LEO

# text
seg-390ac49b3c09 = Cohérence entre bandes

# text
# c1: √(2(σ₁² + σ₂²))
# c2: iono_rate_bound_m_s
seg-986d501c2b01 = le pas d'une époque à l'autre de la combinaison sans géométrie des pseudodistances de chaque paire de bandes LEO, le modèle ionosphérique du récepteur étant retiré, comparé à un bruit de code <c1/> et à une vitesse ionosphérique non modélisée tolérée (<c2/>)

# text
seg-389187df55d7 = un leurreur qui contrefait certaines bandes et pas d'autres, ou toutes les bandes sans l'ionosphère, à son déclenchement ; pas un leurreur qui contrefait toutes les bandes et simule l'ionosphère

# text
# c1: scenarios/leo-resilience-spoof-doppler.toml
# c2: scenarios/leo-resilience-spoof-monitors.toml
seg-4dd44d7fa566 = <c1/> : un saut de { "30" } m sur un site relevé à Francfort modifie les vitesses de distance GNSS d'environ { "4" } mm/s et celles LEO d'environ { "10" } cm/s (gradients médians de { "1.4e-4" } et { "3.5e-3" } par seconde). Le test GNSS seul ne le détecte jamais (plus grande non-centralité : { "0.06" }) ; le test sur tous les canaux le détecte { "105" } s après le déclenchement. <c2/> exécute quatre leurreurs contre les deux moniteurs.

# text
seg-1b64098e01f3 = Limites, indiquées dans chaque résultat : le leurreur est une poussée de position idéalisée et cohérente en elle-même, qui compense son propre trajet (aucune signature de puissance, d'angle d'arrivée ou de pic de corrélation) ; l'a priori est indépendant des positions leurrées ; le modèle ionosphérique du récepteur est celui du moteur, de sorte que le résidu inter-bandes authentique est nul en moyenne. MODELLED (deux lignes dans <a1>VERIFICATION-MATRIX.md</a1>).

# text
seg-edb7b16b6c0e = Validation

# text
seg-051b8cd1849d = Test

# text
seg-609c537a9dfd = UIT-R P.838-3 tableau { "5" }, { "115" } fréquences

# text
seg-5bf24bec38f2 = chaque coefficient à { "0.6" } près de son dernier chiffre imprimé (pire cas observé : { "0.51" })

# text
seg-86204b023d44 = exemples de validation de la Commission d'études { "3" } de l'UIT-R (CG-3M3J-13-ValEx-Rev8.3.0), pluie P.618-14

# text
seg-13180d4097d1 = { "56" } cas à { "1e-4" } dB près (observé : { "5e-6" } dB)

# text
seg-84161e5f97f8 = Mêmes exemples, scintillation P.618-14

# text
seg-0a4305c867ff = { "42" } cas à { "1e-5" } dB près

# text
seg-054f8dbe2792 = classeur Clutter and BEL de la Commission d'études { "3" } de l'UIT-R, P.2109

# text
seg-8ae2eeed4be4 = { "568" } valeurs à { "0.001" } dB près

# text
# c1: γ = (77/60)²
seg-6df2eded9f19 = rapport de retard de groupe d'IS-GPS-200 <c1/>

# text
seg-d0b293230f91 = à { "1e-12" } près ; amplification L1/L2 et L1/L5 de { "2.978" } et { "2.588" }

# text
seg-f9a0e24c00a7 = forme de Friis en kilomètres et mégahertz

# text
seg-4e94a67f40f6 = à { "1e-4" } dB près

# text
seg-ee59b4c520eb = arXiv { "2509.19551" } tableau { "1" } (validation en orbite (IOV) de Pulsar, capacité opérationnelle complète (FOC) polaire, FOC inclinée, GPS)

# text
seg-345998ca457c = { "20" } vitesses et maxima Doppler à { "0.05" } % près

# text
seg-30e34076f4a7 = Les références indépendantes de pluie et de scintillation prennent la hauteur de pluie et la réfractivité humide telles que les donnent les exemples de validation : le moteur ne contient ni la carte P.839 ni la carte P.453 de l'UIT-R.

# text
seg-d2d1075a0b67 = Les PIRE et les diagrammes sont des puissances reçues publiées converties en PIRE, ou des choix représentatifs ; aucun diagramme mesuré de satellite n'est utilisé et aucun C/N0 LEO n'est comparé à une mesure.

# text
seg-915a9564608d = Le terme gazeux est la méthode simplifiée P.676-10, remplacée ; en dessous de { "1" } GHz, c'est la valeur à { "1" } GHz mise à l'échelle par f², et la pluie y est prise comme nulle.

# text
seg-cdd9faf5b61d = La fraction du TEC située sous un satellite LEO provient d'une seule couche de Chapman (sans plasmasphère), qu'une fraction indiquée peut remplacer.

# text
seg-4b72218497e7 = Les orbites du passage conçu et de Walker sont à deux corps avec un J2 séculaire facultatif (le deuxième harmonique zonal de la Terre) ; le chemin TLE utilise SGP4. L'accélération propre de l'utilisateur est laissée de côté dans le taux de Doppler en forme close (la vérification numérique indique ce que cela coûte pour un utilisateur en mouvement).

# text
seg-9fc2cd6d38e9 = RINEX (Receiver Independent Exchange Format) { "4.02" } n'a aucun enregistrement de navigation LEO ; tout export de type RINEX pour LEO relève du code du message de navigation et constitue une extension de Kshana documentée (travaux antérieurs : arXiv { "2401.17767" }).

# text
seg-593081243d8c = <s1>Précédent</s1>Conceptions de signaux LEO

# text
seg-468e70f9a669 = <s1>Suivant</s1>Message de navigation LEO

# text
seg-072d0d8f618c = Moniteurs de leurrage ([spoofer])
