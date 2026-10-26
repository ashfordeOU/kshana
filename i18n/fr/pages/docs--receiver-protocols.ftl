# docs--receiver-protocols: translations (fr)

# text
seg-99427ab75a03 = champ

# text
# c1: docs/RECEIVER-PROTOCOLS.md
seg-75e6589cf544 = Source : <c1/>

# text
seg-4540630d4859 = Protocoles de récepteur lus par receiver-trust ({ "0.38" })

# text
seg-906a5f9e6cd9 = En lecture seule, partout : rien ici n'écrit un octet vers un récepteur, et il n'existe aucun chemin d'émission d'aucune sorte. Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) : l'opérateur reste responsable.

# text
seg-a44353d98d6c = Les indicateurs de leurrage et de brouillage propres au récepteur (UBX)

# text
seg-b58d3a8f292c = message

# text
seg-24c57b65b8f7 = lu comme

# text
seg-bb61c4d9a33e = UBX-NAV-STATUS (0x01 0x03), { "16" } octets

# text
# c1: flags2
# c2: spoofDetState
seg-3fb608c6c3ea = octet <c1/> au décalage { "7" }, bits { "4" }..3 : <c2/>

# text
seg-54d4cf306b49 = { "0" } inconnu ou désactivé, { "1" } aucun leurrage indiqué, { "2" } leurrage indiqué, { "3" } indications multiples de leurrage (protocole { "18" } et suivants ; description d'interface u-blox F9 HPG { "1.32" }, section { "3.15.20" })

# text
seg-36d4d1d82f3d = UBX-SEC-SIG (0x27 0x09) version { "1" }, { "12" } octets

# text
# c1: jamFlags
# c2: spfFlags
seg-e7e262087849 = <c1/> à { "4" } (bit { "0" } jamDetEnabled, bits { "2" }..1 jammingState) ; <c2/> à { "8" } (bit { "0" } spfDetEnabled, bits { "3" }..1 spoofingState)

# text
seg-3e117e319518 = les états ne sont lus que là où le détecteur est activé ; { "0" } inconnu, { "1" } aucun, { "2" } avertissement ou indiqué, { "3" } critique ou affirmé

# text
seg-8a5a59761cd0 = UBX-SEC-SIG version { "2" }

# text
# c1: sigSecFlags
# c2: jamNumCentFreqs
seg-9626adf4a5e7 = <c1/> à { "1" } (bit { "0" } jamDetEnabled, bits { "2" }..1 jammingState, bit { "3" } spfDetEnabled, bits { "6" }..4 spoofingState) ; <c2/> à { "3" } et autant de groupes de 4 octets (non utilisés)

# text
seg-e0eb14018b2c = comme ci-dessus

# text
# c1: SEC-SIG-V1
# c2: SEC-SIG-V2
# c3: tests/receiver_trust_self_report.rs
seg-b0c1eaeb4185 = <b>Source de la disposition SEC-SIG.</b> Les descriptions d'interface u-blox F9 HPG { "1.32" } et M10 SPG { "5.10" } qui ont pu être téléchargées lors de la rédaction nomment UBX-SEC-SIG mais ne la définissent pas. Les dispositions ci-dessus sont celles des descriptions d'interface u-blox ultérieures, telles que transcrites dans la bibliothèque pyubx2 (BSD-3-Clause, <c1/> et <c2/>) ; les tests de jeux d'essai de <c3/> sont construits à partir de cette disposition, non à partir de la sortie d'un véritable récepteur. Disposition issue d'une transcription ouverte, non vérifiée par rapport au guide actuel du fabricant : vérifiez-la par rapport à la description d'interface u-blox actuelle avant de vous fier à SEC-SIG.

# text
seg-6af7d45be34d = Un SEC-SIG n'a pas de temps de semaine ; il appartient à l'époque de navigation courante. Un état déjà lu à une époque est conservé, sauf si un état ultérieur est pire.

# text
# c1: receiver-self-report
seg-f1cf7ee27cb1 = La comparaison <c1/>

# text
# c1: self_report
# c2: agreement
# c3: both
# c4: receiver-only
# c5: kshana-only
# c6: neither
# c7: calibrating
# c8: receiver_self_report
# c9: epochs[].self_report
seg-f30ddb83bf99 = Lorsqu'un journal porte ces indicateurs, chaque époque du résultat a <c1/> (les deux états, si le récepteur signale, si un moniteur de Kshana a alarmé, et <c2/> : <c3/>, <c4/>, <c5/>, <c6/> ou <c7/>), et le résultat a <c8/> avec les décomptes et la première époque de chacun. Le récepteur « signale » à partir d'un état de { "2" }. Cela <b>ne déclenche aucune alarme et ne change aucun score</b>, et aucun des deux côtés n'est la vérité terrain : l'accord n'est pas une validation, et un désaccord dit seulement qu'un détecteur a vu quelque chose que l'autre n'a pas vu, rien sur celui qui avait raison. La bande de Studio lit <c9/>.

# text
# c1: format = "sbf"
seg-49ae6094c06a = Septentrio SBF (<c1/>)

# text
# c1: receiver_trust::ingest::read_sbf
# c2: sbf-tools
# c3: thiserror
# c4: deny.toml
# c5: band
# c6: L1CA
# c7: Info
# c8: rf_bands_reported
# c9: 2024-09-05T00:00:00.000 GPST
seg-4d6365d9ffd1 = <c1/> décode avec la bibliothèque <c2/> ({ "0.4" }, <b>MIT</b> ; sa seule dépendance est <c3/> ; une licence permissive que <c4/> autorise). Blocs lus : PVTGeodetic ({ "4007" }) pour la position, MeasEpoch ({ "4027" }) pour le C/N0 par satellite et par signal (<c5/> est le nom du signal, tel que <c6/>), et RFStatus ({ "4092" }) pour le nombre de bandes RF dont l'octet <c7/> est non nul (<c8/>, transmis et <b>non interprété</b> : il ne compte jamais comme un indicateur). Les époques sont indexées par temps de semaine et numéro de semaine et étiquetées en temps GPS (<c9/>). Un bloc qui échoue à son CRC ou à son analyse compte comme un enregistrement ignoré. Ce lecteur ne lit ni l'AGC ni un indicateur de brouillage, de sorte que les moniteurs de chute de C/N0 et de perte de verrouillage s'exécutent, mais pas ceux de l'AGC et de l'indicateur de brouillage.

# text
# c1: sbf-tools
# c2: tests/receiver_trust_sbf.rs
seg-f86f2c25f41a = <b>Source des dispositions.</b> Le guide de référence de Septentrio n'a pas pu être téléchargé lors de la rédaction (le serveur a refusé la requête), de sorte que les dispositions ont été tirées de la source de <c1/>, qui cite le guide, et que les jeux d'essai de <c2/> sont des blocs synthétiques construits selon cette disposition et son CRC-16-CCITT. Aucun véritable journal SBF n'a été utilisé. Disposition issue de la crate ouverte, non vérifiée par rapport au guide actuel du fabricant : vérifiez-la par rapport au guide de référence de Septentrio avant de vous y fier.

# text
# c1: receiver-trust live --serial
seg-680fa4eea3f4 = Entrée directe série et USB (<c1/>)

# text
# c1: --baud
# c2: --configure
# c3: live
# c4: tests/receiver_trust_live_serial.rs
seg-38fcf7d91b6e = Unix uniquement. Il ouvre le périphérique en lecture, règle la ligne <b>locale</b> en mode brut à <c1/> (par défaut { "4800" }, le débit NMEA { "0183" }) et lit des lignes NMEA comme toute autre source. Il n'écrit jamais vers le récepteur. <c2/> est refusé avec une explication : Kshana ne configure pas les récepteurs ; réglez le récepteur pour qu'il émette du NMEA avec l'outil propre au fabricant, puis lisez-le. Le flux est du NMEA, comme pour chaque source <c3/> (l'UBX et le SBF sont lus depuis des fichiers). Un périphérique qui disparaît met fin à la commande comme un défaut (sortie { "1" }), pour qu'un superviseur la relance ; la couche ne se reconnecte pas. Testé sur un bouclage par pseudo-terminal (<c4/>), y compris le fait que le côté maître ne reçoit aucun octet de la commande.

# text
seg-97e1ea47c2be = <s1>Précédent</s1>Entrées machine et capteur

# text
seg-55ad3fc908be = <s1>Suivant</s1>Observatoire des interférences : méthode

# text
seg-17c3203ee615 = La comparaison avec l'auto-déclaration du récepteur

# text
seg-68bc6d2e1575 = Septentrio SBF (format = "sbf")

# text
seg-8444127e7ee6 = Entrée directe série et USB (receiver-trust live --serial)
