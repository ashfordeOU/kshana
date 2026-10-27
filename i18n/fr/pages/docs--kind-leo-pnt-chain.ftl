# docs--kind-leo-pnt-chain: translations (fr)

# text
seg-f42465f7d066 = ns

# text
seg-7f5ad6ab8c23 = GPS

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catalogue des types de scénario (<c1/>))

# text
seg-cb91473bfdda = Page thématique : <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-49964654d5f4 = Type de scénario du moteur v{ $version }, famille <a1>Navigation en orbite basse</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-c5478f572d21 = Page de famille : <a1>Navigation en orbite basse</a1>

# text
seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 section { "2.4.1" } étapes { "3" } à { "9" } (sigma de référence à partir de N_wet, longueur de trajet effective, facteur de moyennage de l'antenne, profondeur d'évanouissement pour { "0.01" } % à { "50" } % du tem. Référence indépendante (ExternalDataset) : exemples de validation du groupe d'études { "3" } de l'ITU-R (CG-3M3J-13-ValEx-Rev8.3.0) pour la scintillation P.618-14, avec le N_wet P.453-14 de chaque site tiré des mêmes exemples ; versionnés dans tests/fixtures/leo_link/p618_14_scintillation.csv avec les URL et la date de récupération. L'expression de la réfractivité humide à partir de la température et de l'humidité n'est pas couverte par cette ligne

# text
seg-ab58ab4e7dc6 = <b>VALIDATED</b> Retard de groupe { "40.3" } STEC/f^{ "2" } par bande ; les coefficients sans ionosphère f1^2/(f1^{ "2" } - f2^{ "2" }) et -f2^2/(f1^{ "2" } - f2^{ "2" }) et l'amplification du bruit sqrt(a1^{ "2" } s1^{ "2" } + a2^. Référence indépendante (ExternalDataset) : IS-GPS-200 section { "20.3.3.3.3.2" }, qui énonce le rapport de retard de groupe L1/L2 gamma = (77/60)^{ "2" } découlant de la mise à l'échelle en 1/f^{ "2" } au premier ordre, et la formule de transmission de Friis (Proc. IRE, { "1946" }). Valide les lois d'échelle, et non un TEC oblique

# text
seg-ae15d15bf151 = Page thématique : <a1>LEO-PASS.md</a1>

# text
# c1: docs/kinds/by-kind/leo-pnt-chain.md
seg-d24f2cccc926 = Source : <c1/>

# text
# c1: leo-pnt-chain
seg-3a66efa79aa2 = <c1/> (type de scénario)

# text
seg-81d1604171a5 = Un système LEO-PNT (positionnement, navigation et synchronisation temporelle depuis l'orbite terrestre basse) de bout en bout, pour toute constellation et tout signal : la conception leo-signal nommée par signal_design (un préréglage public ou une conception [signal] en ligne) fixe le centre, la largeur de bande, la cadence de chip et la répartition de PIRE d'une bande [pass], le bilan de liaison leo-pass donne le C/N0 suivi et la gigue de code limitée en bande sur le passage, une droite de C/N0 en sin(élévation) et le SISRE diffusé du message [navmsg] (ajusté à l'altitude du satellite du passage) alimentent chaque système LEO du point fixe conjoint leo-pvt de [fusion], et facultativement les cas leo-ppp de [ppp] ; chaque transmission est listée avec sa valeur et son unité. MODELLED.

# text
# c1: scenarios/leo-pnt-end-to-end.toml
seg-9dec9cd6fbfc = Une exécution de <c1/> se résume ainsi : LEO-PNT end to end, generic { "1080" } km constellation signal generic-l (<a1>https://www.itu.int/pub/R-REG-RR</a1>), tracked pilot at { "10.230" } Mchip/s, C/N0 offset -2.57 dB pass LEO-1 { "1080" } km: tracked C/N0 peak { "58.2" } dB-Hz, code jitter median { "0.050" } m; C/N0 line { "35.6" } + { "24.3" } sin(el) dB-Hz message kepler-rac { "300" } s fit / { "300" } s update: representation SISRE { "0.907" } mm RMS (orbit { "0.005" } mm), with { "0.250" } m orbit determination: { "0.250" } m handed on fused fix: GNSS only PDOP { "1.47" } RMS 3D { "1.60" } m -> GNSS + LEO PDOP { "1.06" } RMS 3D { "0.43" } m PPP convergence: GNSS only { "11.5" } min, { "240" } LEO { "7.5" } min { "11" } values handed between stages. MODELLED.

# text
# c1: signal_design
# c2: pass
# c3: fusion
seg-21babf07292a = Champs obligatoires : <c1/>, <c2/>, <c3/>

# text
# c1: name
# c2: description
# c3: seed
# c4: signal
# c5: navmsg
# c6: od_sisre_m
# c7: ppp
seg-f7bd59312f9b = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/leo-pnt-end-to-end.toml
seg-585a1b0d5950 = L'exemple <c1/> définit, entre autres :

# text
seg-be21370c2446 = joint

# text
seg-f9c560b3c318 = Galileo

# text
seg-28b34c8ae7c5 = galileo

# text
seg-0093705edf63 = Étiquette du résultat (celle du moteur) : MODELLED — la chaîne transmet la sortie de chaque étape à la suivante ; les étapes conservent leurs propres étiquettes (lignes leo-signal, leo-pass, leo-navmsg, leo-pvt et leo-ppp de la matrice de vérification).

# attr:alt
seg-abe0599498c9 = Le graphique que le moteur écrit pour scenarios/leo-pnt-end-to-end.toml, type de scénario leo-pnt-chain

# text
# c1: leo-pnt-chain
seg-d8b7c2c82566 = <b>MODELLED</b> Le type de scénario <c1/> : une conception leo-signal (préréglage public ou en ligne) fixe le centre, la largeur de bande, la cadence de chip et la répartition de PIRE d'une bande leo-pass ; le passage donne le C/N0 de la composante suivie et la gigue de code limitée en bande par époque ; un C/ Tests : <a1>leo_pnt_chain.rs</a1>.

# text
seg-59b976838ef1 = <b>VALIDATED</b> navsignal : l'intégrale sinus (sine_integral), la fraction de puissance BPSK-R à l'intérieur d'une bande bilatérale en forme fermée (bpsk_power_in_band_closed_form), la bande. Référence indépendante (ExternalDataset) : figés en externe : { "90.3" } pour cent de puissance du lobe principal, la gigue cohérente avance-retard au point de fonctionnement indiqué, les valeurs du tableau de l'intégrale sinus, et le coefficient de séparation spectrale propre du BPSK 2/({ "3" } R_c) à décalage nul. Contrôles croisés internes seulement, et non validation externe : la forme fermée de la largeur de bande de Gabor du BPSK limité en bande et son asymptote, et le coefficient de séparation spectrale du BPSK décalé à des décalages non nuls, tous deux

# text
# c1: leo-signal
seg-faf2775f3003 = <b>MODELLED</b> Le type de scénario <c1/> : conceptions de signaux paramétrées (bande, largeur de bande d'émission, attribution ITU ; composantes d'acquisition, de données et pilote avec BPSK(n), BOC(m,n), MB. Référence indépendante (InternalConsistency) : les formes fermées validées des deux lignes ci-dessus, l'identité de fausse alarme en loi quadratique P_d(snr = { "0" }) = P_fa et le temps d'acquisition moyen de Holmes, et la réduction à la propre chaîne SSC du type de scénario spectrum (le même code Jammer::ssc). Les conceptions elles-mêmes sont des entrées : les préréglages marqués REPRESENTATIVE ou WORKSHOP ne sont pas des spécifications publiées, les spectres QPSK de Feher amélioré, de modulation par déplacement de code et d'OFDM sont approchés, et la forme

# text
# c1: limitations[0]
seg-752b6d88fc9c = L'étape de positionnement modélise le C/N0 comme une droite en fonction du sinus de l'élévation entre le masque et le zénith ; la chaîne ajuste cette droite au C/N0 suivi du passage, de sorte qu'une forme propre au passage (un plateau isoflux, un bord de faisceau) est réduite à deux nombres. (résultat <c1/>)

# text
# c1: limitations[1]
seg-f609a2991c7f = Le SISRE transmis aux étapes de positionnement est l'erreur de représentation du message de navigation par rapport à une orbite de référence intégrée par Kshana, plus le od_sisre_m indiqué du scénario en racine de la somme des carrés ; l'étape de message elle-même ne modélise ni détermination d'orbite ni prédiction. (résultat <c1/>)

# text
# c1: limitations[2]
seg-f75f874cdfaa = L'étape de positionnement calcule sa propre gigue de boucle à verrouillage de retard à partir du C/N0 transmis avec une formule à largeur de bande illimitée ; le passage rapporte à côté la gigue limitée en bande de la conception réelle. (résultat <c1/>)

# text
# c1: limitations[3]
seg-174ce18ade58 = L'étape de positionnement ponctuel précis prend le SISRE du message comme erreur d'orbite et d'horloge LEO ; ses bruits de code et de phase restent les entrées propres de l'étape. (résultat <c1/>)

# text
# c1: limitations[4]
seg-0aaff940eacb = Un satellite, le premier dont la bande porte la conception, représente tout le système LEO dans les étapes de passage et de message. (résultat <c1/>)

# text
# c1: label
seg-65930be43134 = MODELLED — la chaîne transmet la sortie de chaque étape à la suivante ; les étapes conservent leurs propres étiquettes (lignes leo-signal, leo-pass, leo-navmsg, leo-pvt et leo-ppp de la matrice de vérification). (résultat <c1/>)

# text
seg-bf452e9ae07f = MODELLED : chaque étape conserve sa propre étiquette ; la chaîne n'ajoute aucune physique. (commentaire du fichier de scénario, ligne { "25" })

# text
seg-0bff72185f12 = <s1>Précédent</s1>leo-pass

# text
seg-851e55b87d01 = <s1>Suivant</s1>leo-ppp
