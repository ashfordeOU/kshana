# docs--kind-leo-signal: translations (fr)

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-cb91473bfdda = Page thématique : <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-a3697ad561db = Hz

# text
seg-1918189ac2bf = ppm

# text
seg-49964654d5f4 = Type de scénario du moteur v{ $version }, famille <a1>Navigation en orbite basse</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-c5478f572d21 = Page de famille : <a1>Navigation en orbite basse</a1>

# text
seg-ae15d15bf151 = Page thématique : <a1>LEO-PASS.md</a1>

# text
seg-59b976838ef1 = <b>VALIDATED</b> navsignal : l'intégrale sinus (sine_integral), la fraction de puissance BPSK-R à l'intérieur d'une bande bilatérale en forme fermée (bpsk_power_in_band_closed_form), la bande. Référence indépendante (ExternalDataset) : figés en externe : { "90.3" } pour cent de puissance du lobe principal, la gigue cohérente avance-retard au point de fonctionnement indiqué, les valeurs du tableau de l'intégrale sinus, et le coefficient de séparation spectrale propre du BPSK 2/({ "3" } R_c) à décalage nul. Contrôles croisés internes seulement, et non validation externe : la forme fermée de la largeur de bande de Gabor du BPSK limité en bande et son asymptote, et le coefficient de séparation spectrale du BPSK décalé à des décalages non nuls, tous deux

# text
# c1: leo-signal
seg-faf2775f3003 = <b>MODELLED</b> Le type de scénario <c1/> : conceptions de signaux paramétrées (bande, largeur de bande d'émission, attribution ITU ; composantes d'acquisition, de données et pilote avec BPSK(n), BOC(m,n), MB. Référence indépendante (InternalConsistency) : les formes fermées validées des deux lignes ci-dessus, l'identité de fausse alarme en loi quadratique P_d(snr = { "0" }) = P_fa et le temps d'acquisition moyen de Holmes, et la réduction à la propre chaîne SSC du type de scénario spectrum (le même code Jammer::ssc). Les conceptions elles-mêmes sont des entrées : les préréglages marqués REPRESENTATIVE ou WORKSHOP ne sont pas des spécifications publiées, les spectres QPSK de Feher amélioré, de modulation par déplacement de code et d'OFDM sont approchés, et la forme

# text
# c1: docs/kinds/by-kind/leo-signal.md
seg-051999733048 = Source : <c1/>

# text
# c1: leo-signal
seg-16ae2a08d3c8 = <c1/> (type de scénario)

# text
seg-97b8d07150d4 = Conceptions de signaux LEO-PNT : signaux paramétrés de positionnement, navigation et synchronisation temporelle (PNT) en orbite terrestre basse (LEO), pour tout système, toute bande et toute structure. Un SIGNAL est une bande (fréquence centrale, largeur de bande d'émission, attribution UIT RNSS/RDSS/MSS/EESS/non-RNSS/autre) et des composantes (acquisition, données, pilote ; tout sous-ensemble), chacune avec une modulation (BPSK(n) avec n fractionnaire, BOC(m,n), MBOC({ "6,1" },p) ou une bande plate de type OFDM), une part de puissance, des décalages de sous-porteuses FDMA facultatifs, une longueur de code et un débit de données. Les signaux proviennent de fichiers de préréglages publics compilés dans le logiciel (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands ; chacun avec l'URL de sa source et chaque valeur non publiée étiquetée REPRESENTATIVE) ou sont écrits en ligne. PAR SIGNAL : la densité spectrale de puissance limitée en bande et la fraction de la puissance de chaque composante que la bande d'émission laisse passer (forme close BPSK à côté de la valeur numérique), la largeur de bande efficace (de Gabor), la gigue thermique de suivi de code de la boucle à verrouillage de retard en fonction du C/N0 et de l'espacement avance-retard, d'après la formule avance-retard cohérente (ou non cohérente) limitée en bande de Betz & Kolodziejski { "2009" }, avec sa forme de manuel en bande illimitée et sa borne de Gabor à espacement tendant vers zéro, la précision de mesure de distance en mètres, l'espace de recherche d'acquisition (cases Doppler issues du Doppler maximal de l'orbite plus les termes d'oscillateur et d'utilisateur, multipliées par les cases de code), la probabilité de détection à loi quadratique et le temps moyen d'acquisition série et parallèle sur le code, le coefficient de séparation spectrale du signal vers le GPS L1 C/A, le Galileo E1, le GPS L5, le Galileo E5a, E5b et E5 AltBOC et de chacun vers le signal, avec la dégradation du C/N0, ainsi que les J/S en onde continue, large bande et adapté que la composante suivie tolère, d'après le mécanisme SSC propre au type de scénario spectrum. UN ÉCHANGE DE BANDE : retard ionosphérique du premier ordre ({ "40.3" } TEC/f^{ "2" }), affaiblissement en espace libre, précision de mesure de distance à C/N0 égal et à PIRE égale, et tolérance au brouilleur. Des CONTRÔLES DE FORME facultatifs confrontent le spectre d'une conception à une mesure décrite (cohérence MODELLED). VALIDATED : les formes closes de la puissance dans la bande BPSK ({ "90.3" } % dans le lobe principal) et de la largeur de bande de Gabor, la gigue limitée en bande qui se réduit à la forme de manuel avance-retard cohérente et à sa borne de Gabor, le coefficient de séparation spectrale BPSK décalé par rapport à sa forme close de Parseval, l'aire unité du spectre AltBOC, et le Doppler maximal en LEO par rapport aux valeurs publiées de Xona Pulsar (32-34 kHz) et d'Iridium ({ "36" } kHz). MODELLED : chaque conception, répartition de puissance, C/N0 et niveau de brouilleur ; les spectres EFQPSK, CSK et OFDM sont approchés.

# text
# c1: scenarios/leo-band-trade.toml
seg-37e5fdff9d4d = Une exécution de <c1/> se résume ainsi : scenario leo-signal | { "5" } signals | noise floor -202.0 dBW/Hz | finest ranging generic-c-wide { "0.022" } m at { "45.0" } dB-Hz

# text
# c1: presets
# c2: signals
# c3: receiver
# c4: acquisition
# c5: compatibility
# c6: trade
# c7: shape_checks
# c8: psd_points
seg-b538d3ff9fdb = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/leo-band-trade.toml
seg-6aaf62f55e65 = L'exemple <c1/> définit, entre autres :

# text
seg-9fd02351d844 = ms

# text
seg-05e8854de548 = chip

# text
seg-d12bc1d2b815 = cohérent

# text
seg-0f29946fe4fb = Libellé du résultat (celui du moteur) : MODELLED : conceptions de signaux de positionnement, navigation et synchronisation temporelle (PNT) paramétrés en orbite terrestre basse (LEO), limités en bande à leur largeur de bande d'émission. Les formes closes sous-jacentes sont VALIDATED (puissance BPSK dans la bande et largeur de bande de Gabor, la gigue de suivi de code avance-retard limitée en bande qui se réduit à la forme de manuel

# attr:alt
seg-8bf45b6989d1 = Le graphique que le moteur écrit pour scenarios/leo-band-trade.toml, type de scénario leo-signal

# text
seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-0c30354c18f6 = <b>VALIDATED</b> navsignal : l'intégrale sinus (sine_integral), la fraction de puissance BPSK-R contenue dans une bande bilatérale en forme close (bpsk_power_in_band_closed_form), la largeur de bande de Gabor BPSK limitée en bande en forme close (bpsk_gabor_bandwidth_closed_form_hz

# text
# c1: leo-signal
seg-09cb975b430d = <b>VALIDATED</b> leo_signal::max_doppler_hz : le plus grand Doppler d'un satellite lors d'un passage au zénith au masque d'élévation, pour une orbite circulaire, v R_E cos(el) / (R_E + h) fois f / c, à partir de la porteuse et de l'altitude d'orbite propres à chaque préréglage ; le type de scénario <c1/> ajoute o

# text
# c1: leo-signal
seg-e0a4f53c5a96 = <b>MODELLED</b> Le type de scénario <c1/> : conceptions de signaux paramétrées (bande, largeur de bande d'émission, attribution UIT ; composantes d'acquisition, de données et pilote avec spectres BPSK(n), BOC(m,n), MBOC ou plats, parts de puissance, sous-porteuses FDMA, longueurs de code et débits de données Tests : <a1>leo_signal_reference.rs</a1>.

# text
# c1: spectrum
seg-9ca82c79430e = <b>MODELLED</b> Le type de scénario <c1/> étendu au-delà de la bande L : bandes données sous forme de conception de signal préréglée (tracée avec chaque composante, limitée en bande à la largeur de bande d'émission, C/N0 et J/S rapportés à la composante suivie) ou sous forme de porteuse et de modulation personnalisées Tests : <a1>leo_signal_reference.rs</a1>.

# text
seg-eb0a671fe1da = <b>VALIDATED</b> leo_signal::max_doppler_hz : le plus grand Doppler d'un satellite lors d'un passage au zénith au masque d'élévation, pour une orbite circulaire, v R_E cos(el) / (R_E + h) fois f / c,. Référence indépendante (ExternalDataset) : valeurs publiées : Doppler maximal de Xona Pulsar X1 de { "32" } à { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>) ; Doppler d'Iridium jusqu'à +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). La rotation de la Terre est omise, ce qui déplace la valeur d'environ { "2.3" } kHz au plus ; les deux valeurs publiées sont atteintes sans elle.

# text
# c1: not_modelled[0]
seg-1ab79cdbd269 = les spectres exacts du QPSK de Feher amélioré, de la modulation par déplacement de code et de l'OFDM : une enveloppe BPSK à chips rectangulaires ou une bande plate en tient lieu, comme chaque préréglage l'indique (résultat <c1/>)

# text
# c1: not_modelled[1]
seg-0561c3ed88fb = structure en raies des codes d'étalement et intercorrélation d'accès multiple entre codes (résultat <c1/>)

# text
# c1: not_modelled[2]
seg-8b4df054a7b3 = les filtres d'émission et de réception au-delà d'un mur de briques idéal à la largeur de bande d'émission : pas d'émission hors bande, pas de temps de propagation de groupe du filtre (résultat <c1/>)

# text
# c1: not_modelled[3]
seg-ad5f7cc4a439 = multitrajets, quantification du récepteur et commande automatique de gain (résultat <c1/>)

# text
# c1: not_modelled[4]
seg-e38fc1a121ab = rotation de la Terre dans la borne Doppler (jusqu'à environ { "0.46" } km/s de vitesse de variation de distance à l'équateur) (résultat <c1/>)

# text
# c1: not_modelled[5]
seg-32a132809a9b = retard ionosphérique au-delà du premier ordre, et répartition du contenu électronique au-dessus et au-dessous d'un satellite LEO : le TEC oblique est une entrée (résultat <c1/>)

# text
# c1: not_modelled[6]
seg-8189e06f4a56 = pertes atmosphériques, dues à la pluie et à la polarisation : seul l'affaiblissement en espace libre est comparé (la pluie compte en bande C) (résultat <c1/>)

# text
# c1: not_modelled[7]
seg-445cecb7370c = acquisition au-delà d'un seul temps d'intégration avec pénalité de fausse alarme : pas de logique de vérification à intégrations multiples, un a priori uniforme sur la phase de code, le cas le plus défavorable de chevauchement (résultat <c1/>)

# text
seg-8eefe4197d7f = <s1>Précédent</s1>leo-pvt

# text
seg-60423e1ed0ca = <s1>Suivant</s1>link-budget
