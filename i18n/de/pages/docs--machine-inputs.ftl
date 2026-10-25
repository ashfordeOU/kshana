# docs--machine-inputs: translations (de)

# text
seg-e9650a618b38 = ID

# text
# c1: docs/MACHINE-INPUTS.md
seg-b9f561201fda = Quelle: <c1/>

# text
seg-536f71da4541 = Maschinen- und Sensoreingaben ({ "0.38" })

# text
# c1: receiver-trust
seg-1a91f96f22ab = Leser, die weitere Empfänger, Löser und Sensoren in die Art <c1/> einbringen. Jeder ist nur lesend: reine Funktionen auf Bytes oder Text, die dieselbe Zeitleiste zurückgeben wie die Leser für UBX, RINEX, Android und NMEA und beschädigte Datensätze überspringen und zählen, statt zu scheitern. Alles hier ist MODELLED: Die Formate werden aus öffentlicher Dokumentation gelesen, und kein Ergebnis ist über das Angegebene hinaus gegen eine externe unabhängige Referenz validiert.

# text
seg-3176ffff1e44 = <b>Beratende Software.</b> Keine typzugelassene Navigationsausrüstung. Der Betreiber bleibt für die sichere Navigation des Schiffes verantwortlich.

# attr:alt
seg-367ac9b4a8a6 = Was `kshana imu-fit` aus einem Log einer ruhenden IMU abliest, aus einem echten Lauf der Engine v{ $version } auf einem erfundenen Log ({ "20,000" } Samples bei { "100" } Hz, { "200" } s): der Geschwindigkeits-Random-Walk des Beschleunigungsmessers q_va = { "4.02e-06" }, der Winkel-Random-Walk des Gyroskops q_arw = { "9e-08" }, die Bias-Instabilität { "0.00296" } und die frühen Allan-Steigungen (-0.51 und -0.49; etwa -0.5, wo weißes Rauschen dominiert). Die Tabelle daneben ist das TOML, das der Befehl ausgibt. Der Schätzer wird nur an synthetischen Logs geprüft. Beratend: Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.

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
seg-3ba911ed9541 = Die Lösungsdatei, die <c1/> und RTKPOST von RTKLIB schreiben. Gelesen werden: die Zeit (Kalender <c2/> oder GPS-Woche und Sekunden der Woche), die Position (Breite und Länge in Grad mit Höhe oder ECEF X/Y/Z, in geodätische Koordinaten umgerechnet) und die Anzahl der Satelliten. Die Zeitskala im Spaltenkopf (<c3/>, <c4/>, <c5/>) wird in der Bezeichnung mitgeführt. Dateien in Grad-Minuten-Sekunden werden abgelehnt. Zeilen, die mit <c6/> beginnen, sind Kopfzeilen.

# text
# c1: format = "novatel"
seg-24ebc9ea6e4e = NovAtel OEM7 (<c1/>)

# text
# c1: #BESTPOSA,...*crc
# c2: AA 44 12
seg-b73d1465ed67 = ASCII-Logs (<c1/>) und Binär-Logs (Kopf <c2/>), frei gemischt. Die Layouts folgen der öffentlichen OEM7-Dokumentation (docs.novatel.com): die Nachrichtenköpfe, die 32-Bit-CRC und die Feldtabellen von drei Logs. Datensätze, deren CRC nicht stimmt, werden übersprungen und gezählt.

# text
seg-078e047b9f82 = Log

# text
seg-5b59f661e68b = Verwendet

# text
# c1: SOL_COMPUTED
seg-286c3fb8ac5c = Lösungsstatus (nur <c1/> ergibt eine Lösung), Breite, Länge, Höhe über dem mittleren Meeresspiegel plus Undulation (die Höhe der Lösung ist ellipsoidisch), verwendete Satelliten

# text
seg-3edaffed5d65 = C/No je Signal (dB-Hz); System aus den Tracking-Status-Bits 16-18, Signaltyp aus den Bits 21-25

# text
# c1: self_report
# c2: receiver-self-report
# c3: NovatelRead.status
seg-5663c6812797 = Empfängerstatus-Bit { "15" } (Störsender erkannt) wird zum <c1/> der Epoche (Jamming { "2" } markiert, { "1" } nicht; RXSTATUS hat kein Spoofing-Flag), von <c2/> mit den Alarmen von Kshana verglichen; die { "1" } zusätzlichen Störsender-Bits (RF1-RF6) werden in <c3/> zurückgegeben

# text
# c1: BESTPOSA
seg-61d8ec169a17 = Die CRC-Routine wurde gegen die CRC geprüft, die die Dokumentation für ihr eigenes <c1/>-Beispiel angibt (zitiert, nicht wörtlich wiedergegeben); die Tests verwenden selbst geschriebene Zeilen. Nicht gelesen: abgekürztes ASCII, andere Logs. Das Störsender-Flag ist die eigene Meldung des Empfängers, nicht der Befund von Kshana; die Übereinstimmung mit den Monitoren von Kshana ist keine Validierung.

# text
# c1: format = "gnss-sdr"
seg-b6c3919c87ad = GNSS-SDR (<c1/>)

# text
# c1: integrations/gnss-sdr/README.md
# c2: nmea
# c3: rinex
# c4: relay.py
# c5: gnss-sdr
seg-0cc992f8d61b = Siehe <a1><c1/></a1>. NMEA- und RINEX-Ausgaben von GNSS-SDR werden bereits mit <c2/> und <c3/> gelesen; die UDP-Ströme von Monitor und PVT-Monitor (Protocol Buffers) werden von <c4/> in JSON-Zeilen weitergereicht und mit <c5/> gelesen.

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
seg-ab64a0754907 = <c1/>: eine Kopfzeile, die die Spalten benennt, dann ein Sample je Zeile. Spalten (beliebige Reihenfolge, Namen ohne Beachtung der Groß- und Kleinschreibung): <c2/> Sekunden auf der Uhr des Empfänger-Logs, <c3/>, <c4/>, <c5/> Winkelrate in rad/s, <c6/>, <c7/>, <c8/> spezifische Kraft in m/s². <c9/>: das Layout <c10/> <c11/> von EuRoC MAV (<c12/>, <c13/>, <c14/>); das erste Sample ist <c15/>. Zeilen, die sich nicht parsen lassen, und Zeilen, deren Zeit nicht zunimmt, werden übersprungen. Wie der Gyro-Kurs verwendet wird, steht in <a1><c16/></a1>.

# text
# c1: kshana imu-fit
seg-f7007cf35f53 = IMU in die Hybrid- und Fusionsszenarien (<c1/>)

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
seg-3fc254763f67 = Die Szenarien <c1/> und <c2/> (UKF mit 17 Zuständen) sind Simulationen: Sie nehmen Sensorrauschparameter (<c3/>, <c4/>: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>), keine gemessene Reihe. <c10/> liest diese Parameter aus einem Log einer ruhenden IMU ab, sodass ein Szenario mit dem Sensor ausgeführt werden kann, den Sie tatsächlich haben:

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
seg-86efab73b2e6 = Methode: die überlappende Allan-Abweichung des integrierten Signals (<c1/>): <c2/>, dasselbe für das z-Gyroskop (<c3/>), <c4/> und <c5/> als Mittelwerte und <c6/> als Kurvenminimum, wenn die Kurve danach ansteigt. <c7/> wird nicht angepasst (es braucht ein Log, das weit länger ist als die Untergrenze). Der Bericht trägt Rate und Zeitspanne des Logs und die frühe Allan-Steigung jedes Kanals (etwa -0.5, wo weißes Rauschen dominiert); ein Log, das nicht ruhig ist oder zu kurz (unter { "2000" } Samples) oder ungleichmäßig abgetastet ist, wird abgelehnt oder liefert Parameter, die die Steigungen markieren. Die Herkunft der Tabelle nennt den SHA-256 des Logs. MODELLED: Der Schätzer wird an synthetischen Weißrausch-Logs mit bekannten Koeffizienten geprüft (innerhalb von { "10" } % wiedergefunden), nicht gegen eine externe unabhängige Referenz. Verfügbar in der CLI, in Python (<c8/>), WebAssembly (<c9/>), MCP (<c10/>) und im Plugin (<c11/>).

# text
# c1: format = "rtcm3"
seg-b3c592f63798 = RTCM { "3" } MSM4 und MSM7 (<c1/>)

# text
seg-0f8b986cff40 = Ein Bytestrom aus RTCM-{ "3" }-Rahmen (die Beobachtungsausgabe einer Basisstation oder eines Empfängers). Gelesen werden: MSM4- und MSM7-Nachrichten (GPS 1074/1077, GLONASS 1084/1087, Galileo 1094/1097, SBAS 1104/1107, QZSS 1114/1117, BeiDou 1124/1127, NavIC 1134/1137): die Epoche und das Träger-Rausch-Verhältnis jeder Signalzelle (MSM4: { "6" } Bit, dB-Hz; MSM7: { "10" } Bit, 1/16 dB-Hz), was die C/N0-Monitore brauchen. Pseudorange- und Phasenfelder werden übersprungen, nicht verwendet, sodass RTCM den Vertrauensmonitoren C/N0 und sonst nichts liefert; in MSM gibt es keine Position. Rahmen mit fehlerhaftem CRC-24Q werden übersprungen und gezählt.

# text
# c1: NOTICE
# c2: GPS TOW <s>
seg-d70038a737dc = <b>Woher das Layout stammt.</b> Nicht aus dem RTCM-Standard (ein kostenpflichtiges Dokument, nicht herangezogen): aus dem quelloffenen Dekoder pyrtcm { "1.2.0" }, BSD 3-Clause, dessen Lizenz und Hinweis in <c1/> stehen (Entscheidung des Eigentümers vom { "18" }. Okt. { "2026" }: "use open decoders"). pyrtcm gibt an, dass seine Tabellen RTCM { "10403.3" } folgen; Kshana stützt sich auf die veröffentlichten Tabellen unter der Lizenz von pyrtcm und erhebt keinen Anspruch auf den Standard. Zeit: MSM trägt keine Woche, daher lauten die Bezeichnungen <c2/>; GLONASS-Epochen (Moskauer Zeit) werden mit GPS-UTC = { "18" } s (der Wert seit 2017-01-01) in GPS-Zeit verschoben.

# text
# c1: 123456789
# c2: 0xCDE703
seg-ee04a86f8f00 = Geprüft gegen: den Katalog-Prüfwert von CRC-24Q (<c1/> ergibt <c2/>) und, einmalig während der Entwicklung, den eigenen Dekoder von pyrtcm auf denselben selbst geschriebenen Rahmen (gleiches C/N0). Die Fixtures sind selbst geschrieben; es wurde keine Aufzeichnung von einem echten Empfänger genommen, daher ist der Leser MODELLED, bis er eine gelesen hat.

# text
seg-94f0e4db92df = <s1>Zurück</s1>Jammertest als Schiedsrichter

# text
seg-8d660b4049e4 = <s1>Weiter</s1>Gelesene Empfängerprotokolle

# text
seg-c5412c255f99 = RTKLIB .pos (format = "rtklib-pos")

# text
seg-c86a9b2ce59b = NovAtel OEM7 (format = "novatel")

# text
seg-61748cf7559e = GNSS-SDR (format = "gnss-sdr")

# text
seg-b0b5f9a66eed = IMU ([log.imu])

# text
seg-03a6e15dce0a = IMU in die Hybrid- und Fusionsszenarien (kshana imu-fit)

# text
seg-53ce2c4ba434 = RTCM { "3" } MSM4 und MSM7 (format = "rtcm3")
