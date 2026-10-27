# docs--machine-inputs: translations (fr)

# text
seg-e9650a618b38 = ID

# text
# c1: docs/MACHINE-INPUTS.md
seg-b9f561201fda = Source : <c1/>

# text
seg-536f71da4541 = Entrées de machines et de capteurs ({ "0.38" })

# text
# c1: receiver-trust
seg-1a91f96f22ab = Lecteurs qui amènent d'autres récepteurs, solveurs et capteurs dans le type de scénario <c1/>. Chacun est en lecture seule : des fonctions pures sur des octets ou du texte qui renvoient la même chronologie que les lecteurs UBX, RINEX, Android et NMEA, en ignorant et en comptant les enregistrements corrompus au lieu d'échouer. Tout ici est MODELLED : les formats sont lus d'après la documentation publique, et aucun résultat n'est validé par rapport à une référence indépendante externe au-delà de ce qui est indiqué.

# text
seg-3176ffff1e44 = <b>Logiciel à titre consultatif.</b> Pas un équipement de navigation homologué. L'opérateur reste responsable de la navigation en toute sécurité du navire.

# attr:alt
seg-367ac9b4a8a6 = Ce que `kshana imu-fit` lit dans un journal d'IMU à l'arrêt, à partir d'une exécution réelle du moteur v{ $version } sur un journal fictif ({ "20,000" } échantillons à { "100" } Hz, { "200" } s) : la marche aléatoire de vitesse de l'accéléromètre q_va = { "4.02e-06" }, la marche aléatoire d'angle du gyromètre q_arw = { "9e-08" }, l'instabilité de biais { "0.00296" } et les premières pentes d'Allan (-0.51 et -0.49 ; environ -0.5 là où le bruit blanc domine). Le tableau à côté est le TOML qu'affiche la commande. L'estimateur n'est vérifié que sur des journaux synthétiques. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sécurité de la vie humaine.

# text
# c1: .pos
# c2: format = "rtklib-pos"
seg-a048ba8ff88e = RTKLIB <c1/> (<c2/>)

# text
# c1: rnx2rtkp
# c2: yyyy/mm/dd hh:mm:ss.sss
# c3: GPST
# c4: UTC
# c5: JST
# c6: %
seg-3ba911ed9541 = Le fichier de solution qu'écrivent <c1/> de RTKLIB et RTKPOST. Lus : l'heure (calendrier <c2/>, ou semaine GPS et secondes de la semaine), la position (latitude et longitude en degrés avec la hauteur, ou ECEF X/Y/Z converti en géodésique) et le nombre de satellites. L'échelle de temps de l'en-tête de colonne (<c3/>, <c4/>, <c5/>) est reportée dans l'étiquette. Les fichiers en degrés-minutes-secondes sont refusés. Les lignes commençant par <c6/> sont des lignes d'en-tête.

# text
# c1: format = "novatel"
seg-24ebc9ea6e4e = NovAtel OEM7 (<c1/>)

# text
# c1: #BESTPOSA,...*crc
# c2: AA 44 12
seg-b73d1465ed67 = Journaux ASCII (<c1/>) et binaires (en-tête <c2/>), mélangés librement. Les dispositions suivent la documentation publique d'OEM7 (docs.novatel.com) : les en-têtes de message, le CRC sur 32 bits et les tables de champs de trois journaux. Les enregistrements dont le CRC ne correspond pas sont ignorés et comptés.

# text
seg-078e047b9f82 = Journal

# text
seg-5b59f661e68b = Utilisé

# text
# c1: SOL_COMPUTED
seg-286c3fb8ac5c = état de la solution (seul <c1/> donne une position), latitude, longitude, hauteur au-dessus du niveau moyen de la mer plus l'ondulation (la hauteur de la position est ellipsoïdale), satellites utilisés

# text
seg-3edaffed5d65 = C/No par signal (dB-Hz) ; système d'après les bits 16-18 de l'état de suivi, type de signal d'après les bits 21-25

# text
# c1: self_report
# c2: receiver-self-report
# c3: NovatelRead.status
seg-5663c6812797 = le bit { "15" } de l'état du récepteur (brouilleur détecté) devient le <c1/> de l'époque (brouillage { "2" } signalé, { "1" } non ; RXSTATUS n'a pas d'indicateur de leurrage), comparé aux alarmes de Kshana par <c2/> ; les { "1" } bits de brouilleur auxiliaires (RF1-RF6) sont renvoyés dans <c3/>

# text
# c1: BESTPOSA
seg-61d8ec169a17 = La routine CRC a été vérifiée par rapport au CRC que la documentation indique pour son propre exemple <c1/> (cité, non reproduit) ; les tests utilisent des lignes écrites par nos soins. Non lus : l'ASCII abrégé, les autres journaux. L'indicateur de brouilleur est le propre rapport du récepteur, non une conclusion de Kshana ; la concordance avec les moniteurs de Kshana n'est pas une validation.

# text
# c1: format = "gnss-sdr"
seg-b6c3919c87ad = GNSS-SDR (<c1/>)

# text
# c1: integrations/gnss-sdr/README.md
# c2: nmea
# c3: rinex
# c4: relay.py
# c5: gnss-sdr
seg-0cc992f8d61b = Voir <a1><c1/></a1>. Les sorties NMEA et RINEX de GNSS-SDR se lisent déjà avec <c2/> et <c3/> ; les flux UDP Monitor et PVT-monitor (Protocol Buffers) sont relayés en lignes JSON par <c4/> et lus avec <c5/>.

# text
# c1: [log.imu]
seg-cf1bf4944f6a = IMU (<c1/>)

# text
# c1: format = "csv"
# c2: t_s
# c3: gx
# c4: gy
# c5: gz
# c6: ax
# c7: ay
# c8: az
# c9: format = "euroc"
# c10: imu0
# c11: data.csv
# c12: #timestamp [ns]
# c13: w_RS_S_x/y/z [rad s^-1]
# c14: a_RS_S_x/y/z [m s^-2]
# c15: t_s = 0
# c16: RECEIVER-TRUST.md
seg-ab64a0754907 = <c1/> : une ligne d'en-tête nommant les colonnes, puis un échantillon par ligne. Colonnes (dans n'importe quel ordre, noms insensibles à la casse) : <c2/> secondes sur l'horloge du journal du récepteur, <c3/>, <c4/>, <c5/> vitesse angulaire en rad/s, <c6/>, <c7/>, <c8/> force spécifique en m/s². <c9/> : la disposition EuRoC MAV <c10/> <c11/> (<c12/>, <c13/>, <c14/>) ; le premier échantillon est <c15/>. Les lignes qui ne s'analysent pas, et celles dont le temps n'augmente pas, sont ignorées. Voir <a1><c16/></a1> pour l'utilisation du cap gyroscopique.

# text
# c1: kshana imu-fit
seg-f7007cf35f53 = L'IMU dans les scénarios hybrid et fusion (<c1/>)

# text
# c1: hybrid
# c2: fusion
# c3: [accel_quantum]
# c4: [accel_classical]
# c5: bias
# c6: q_va
# c7: gyro_bias
# c8: q_arw
# c9: bias_instability
# c10: imu-fit
seg-3fc254763f67 = Les scénarios <c1/> et <c2/> (filtre de Kalman sans parfum à 17 états) sont des simulations : ils prennent des paramètres de bruit de capteur (<c3/>, <c4/> : <c5/>, <c6/>, <c7/>, <c8/>, <c9/>), et non une série mesurée. <c10/> lit ces paramètres sur un journal d'IMU immobile, de sorte qu'un scénario peut être exécuté avec le capteur dont vous disposez réellement :

# text
# c1: allan::overlapping_adev_curve
# c2: q_va = (sigma(tau0) sqrt(tau0))^2
# c3: q_arw
# c4: bias
# c5: gyro_bias
# c6: bias_instability
# c7: q_aa
# c8: imu_fit
# c9: imu_fit
# c10: fit_imu_log
# c11: /kshana-fit-imu
seg-86efab73b2e6 = Méthode : l'écart-type d'Allan avec recouvrement du signal intégré (<c1/>) : <c2/>, de même pour le gyroscope z (<c3/>), <c4/> et <c5/> comme moyennes, et <c6/> comme minimum de la courbe lorsque celle-ci remonte ensuite. <c7/> n'est pas ajusté (il faudrait un journal bien plus long que le plancher). Le rapport indique la cadence et la durée du journal ainsi que la pente d'Allan initiale de chaque canal (environ -0.5 là où le bruit blanc domine) ; un journal qui n'est pas immobile, ou qui est trop court (moins de { "2000" } échantillons) ou échantillonné de façon irrégulière, est refusé ou donne des paramètres que les pentes signalent. La provenance du tableau nomme le SHA-256 du journal. MODELLED : l'estimateur est vérifié sur des journaux synthétiques de bruit blanc à coefficients connus (retrouvés à { "10" } % près), et non par rapport à une référence indépendante externe. Disponible en CLI, en Python (<c8/>), en WebAssembly (<c9/>), en MCP (<c10/>) et dans le module d'extension (<c11/>).

# text
# c1: format = "rtcm3"
seg-b3c592f63798 = RTCM { "3" } MSM4 et MSM7 (<c1/>)

# text
seg-0f8b986cff40 = Un flux d'octets de trames RTCM { "3" } (la sortie d'observation d'une station de base ou d'un récepteur). Lus : les messages MSM4 et MSM7 (GPS 1074/1077, GLONASS 1084/1087, Galileo 1094/1097, SBAS 1104/1107, QZSS 1114/1117, BeiDou 1124/1127, NavIC 1134/1137) : l'époque, et le rapport porteuse sur bruit de chaque cellule de signal (MSM4 : { "6" } bits, dB-Hz ; MSM7 : { "10" } bits, 1/16 dB-Hz), ce dont les moniteurs C/N0 ont besoin. Les champs de pseudodistance et de phase sont enjambés, non utilisés ; RTCM ne donne donc aux moniteurs de confiance que le C/N0 et rien d'autre ; il n'y a pas de position dans MSM. Les trames dont le CRC-24Q est erroné sont ignorées et comptées.

# text
# c1: NOTICE
# c2: GPS TOW <s>
seg-d70038a737dc = <b>D'où vient la disposition.</b> Pas de la norme RTCM (un document payant, non consulté) : du décodeur open source pyrtcm { "1.2.0" }, BSD 3-Clause, dont la licence et la mention figurent dans <c1/> (décision du propriétaire du { "18" } oct. { "2026" } : « utiliser des décodeurs ouverts »). pyrtcm indique que ses tables suivent RTCM { "10403.3" } ; Kshana s'appuie sur les tables publiées sous la licence de pyrtcm et ne fait aucune affirmation sur la norme. Temps : MSM ne porte aucune semaine, de sorte que les étiquettes se lisent <c2/> ; les époques GLONASS (heure de Moscou) sont ramenées au temps GPS avec GPS-UTC = { "18" } s (la valeur depuis le 2017-01-01).

# text
# c1: 123456789
# c2: 0xCDE703
seg-ee04a86f8f00 = Vérifié par rapport à : la valeur de contrôle du catalogue CRC-24Q (<c1/> donne <c2/>) et, ponctuellement pendant le développement, au propre décodeur de pyrtcm sur les mêmes trames écrites par nos soins (même C/N0). Les jeux d'essai sont écrits par nos soins ; aucune capture n'a été faite sur un récepteur réel, de sorte que le lecteur est MODELLED tant qu'il n'en a pas lu une.

# text
seg-94f0e4db92df = <s1>Précédent</s1>Jammertest comme arbitre

# text
seg-8d660b4049e4 = <s1>Suivant</s1>Protocoles de récepteur lus

# text
seg-c5412c255f99 = RTKLIB .pos (format = "rtklib-pos")

# text
seg-c86a9b2ce59b = NovAtel OEM7 (format = "novatel")

# text
seg-61748cf7559e = GNSS-SDR (format = "gnss-sdr")

# text
seg-b0b5f9a66eed = IMU ([log.imu])

# text
seg-03a6e15dce0a = L'IMU dans les scénarios hybrid et fusion (kshana imu-fit)

# text
seg-53ce2c4ba434 = RTCM { "3" } MSM4 et MSM7 (format = "rtcm3")
