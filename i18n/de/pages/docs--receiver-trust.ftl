# docs--receiver-trust: translations (de)

# text
seg-adc34608c46b = Klasse

# text
seg-2247a2344710 = Bedeutung

# text
seg-fdbb9db68f1d = keine

# text
seg-f63dd3d7aad4 = Quelle

# text
seg-98151954f217 = false

# text
seg-c353e7bec219 = Schlüssel

# text
seg-cc38b40eb7a5 = Monitor

# text
seg-7670cf4ceda3 = Standard

# text
seg-a0cc45088f5f = GSV

# attr:alt
seg-26ab8544afba = Vertrauenswert über eine synthetische Passage, aus einem echten Lauf der Engine v{ $version } auf examples/maritime-trust (ein erfundenes NMEA-Log einer Fähre auf einer Route von Tallinn nach Helsinki, { "3001" } Epochen bei { "1" } Hz). Drei Spuren teilen sich eine Zeitachse. Oben: der Abstand zwischen der vom Empfänger gemeldeten Position und der echten Position des Schiffes, der bis etwa { "1576" } s innerhalb weniger Meter bleibt, als das skriptgesteuerte Wegziehen der Position des Logs ihn vergrößert, während der Empfänger weiter eine gültige Lösung meldet. Mitte: der Vertrauenswert von { "0" } bis { "100" }, während der ersten { "300" } s der Kalibrierung nicht berechnet, im Band nominal (mindestens { "90" }) bis zum Wegziehen, dann durch das Band degraded (mindestens { "55" }) in das Band untrusted fallend. Unten: das Band jeder Epoche als farbiges Band mit seinem Namen. Der Wert ist beratend. Beratende Software, keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich. Das Log ist erfunden, um das Format und die Monitore zu zeigen; es ist keine Messung und sagt nichts darüber aus, wie sich irgendein Empfänger schlagen würde.

# attr:alt
seg-7000c522cc93 = Das eigene Spoofing-Flag des Empfängers gegen die Alarme von Kshana, aus einem echten Lauf der Engine v{ $version } auf einem erfundenen UBX-Protokoll ({ "200" } Epochen bei { "1" } Hz). C/N0 fällt bei { "80" } bis { "90" } s und { "120" } bis { "130" } s um { "20" } dB; der Empfänger markiert { "120" } bis { "130" } s und { "160" } bis { "165" } s. Von { "140" } nach der Kalibrierung verglichenen Epochen markierten { "11" } beide, { "6" } nur der Empfänger, { "11" } nur Kshana und { "112" } keiner. Keine der beiden Seiten ist Referenzwahrheit, und Übereinstimmung ist keine Validierung. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben.

# text
# c1: docs/RECEIVER-TRUST.md
seg-caadaad98cf6 = Quelle: <c1/>

# text
seg-4f10c2397fcc = Empfängervertrauen: ein reales GNSS-Empfänger-Log bewerten

# text
# c1: kshana receiver-trust
seg-2596bdcdaf8e = <c1/> liest ein Log eines realen Empfängers eines globalen Satellitennavigationssystems (GNSS), lässt Vertrauensmonitore Epoche für Epoche darüber laufen und sagt, wann und warum die Lösung des Empfängers aufhörte, vertrauenswürdig zu sein. Es kann das Log auch gegen Ereignisse und Vorhersagen bewerten, die Sie <b>vor</b> dem Lauf angeben: ob jedes Ereignis rechtzeitig erkannt wurde und ob ein modellierter Abfall der Träger-zu-Rauschleistungsdichte (C/N0) mit dem übereinstimmt, was der Empfänger gemessen hat.

# text
seg-63f24d5f2d5e = Die Observablen sind die des Empfängers selbst; die Monitore und ihre Schwellen sind die der Engine und Ihre. Jedes Ergebnis trägt diese Kennzeichnung, den SHA-256 des Logs und jede Schwelle, mit der es lief, sodass ein Lauf wiederholt und geprüft werden kann.

# text
# c1: MARITIME-TRUST.md
seg-6f5014b93fbc = Für ein Schiff unterwegs, mit einer Live-Bewertung und einem optionalen Gate vor einem Kartensystem, siehe <a1><c1/></a1>.

# text
# c1: session.result.json
# c2: session.trust.csv
# c3: session.trust.svg
# c4: path
seg-82cdabb6086f = Das schreibt <c1/>, <c2/> (eine Zeile je Epoche) und <c3/> (mittleres C/N0 über der Zeit mit dem Vertrauenszustand darunter) neben das Szenario und gibt ein einzeiliges Urteil aus. Das Beispiel-Log ist synthetisch und soll das Format zeigen; richten Sie <c4/> auf das Log Ihres eigenen Empfängers.

# text
# c1: MARITIME-TRUST.md
seg-ec2be1ea73f5 = Die Abbildung oben ist die Schiffsdemo aus <a1><c1/></a1>: ein erfundenes Log, eine beratende Bewertung.

# text
# c1: kshana.receiver_trust(toml)
# c2: receiver_trust(toml)
# c3: assess_receiver_log
seg-0f24c5cf4b9b = Dasselbe Szenario läuft aus Python (<c1/>), aus dem WebAssembly-Paket (<c2/>, mit dem Log inline) und aus dem Werkzeug <c3/> des Model-Context-Protocol-(MCP-)Servers.

# text
seg-1f3cc12b6230 = Logs, die es liest

# text
seg-23fd4a5bf5dd = Was gelesen wird

# text
seg-2e1a655cf846 = u-blox binär

# text
# c1: jamInd
# c2: spoofDetState
# c3: self_report
seg-cb31da7b7d88 = NAV-SAT: C/N0, Elevation und Azimut je Satellit; NAV-PVT: Position; MON-RF: automatische Verstärkungsregelung (AGC) und der Jamming-Indikator <c1/>; NAV-TIMEGPS: Woche; und die eigenen Kennzeichen des Empfängers: NAV-STATUS <c2/> und SEC-SIG (<c3/>, siehe <a1>RECEIVER-PROTOCOLS.md</a1>)

# text
seg-cec582f4afa5 = RINEX-{ "3" }-Beobachtungsdatei

# text
# c1: S
# c2: nav
seg-57708a636148 = Codes <c1/> (C/N0) je Satellit und Signal; mit einer Broadcast-Navigationsdatei (<c2/>) die Pseudoentfernungen für die eigene Lösung der Engine

# text
seg-176c2493782e = Android-GnssLogger-CSV

# text
# c1: Raw
# c2: AgcDb
# c3: Fix
seg-d69b9dd6ebad = Zeilen <c1/>: C/N0 und <c2/> je Satellit; Zeilen <c3/>: Position

# text
seg-d390120374a9 = NMEA-{ "0183" }-Text

# text
seg-9eb885aa79af = GSV: Signal-Rausch-Verhältnis je Satellit (dB-Hz, mit oder ohne die Signal-ID { "4.10" }) und seine Elevation und sein Azimut; GSA: Dilution of Precision und verwendete Satelliten; GGA und RMC: Zeit und Position

# text
seg-7864926ce37e = Septentrio binär ({ "0.38" }, nur lesend)

# text
seg-44675c4bdf40 = PVTGeodetic: Position; MeasEpoch: C/N0 je Satellit und Signal; RFStatus: Zahl der Bänder; siehe <a1>RECEIVER-PROTOCOLS.md</a1>

# text
# c1: .pos
seg-a5367d75c5ee = RTKLIB-Lösungsdatei (<c1/>)

# text
seg-37d28ca5ed00 = Zeit, Position (Breite/Länge oder ECEF, umgerechnet) und verwendete Satelliten je Epoche; Dateien in Grad-Minuten-Sekunden werden mit einer Meldung zurückgewiesen

# text
seg-5e10ecb93f96 = NovAtel-OEM7-ASCII- oder Binär-Logs

# text
# c1: BESTPOS
# c2: RANGE
# c3: RXSTATUS
# c4: self_report
# c5: receiver-self-report
seg-a630fbcf7425 = Position <c1/> (nur berechnete Lösung), C/No <c2/> je Satellit und Signal; Störsender-Kennzeichen <c3/> werden zum <c4/> der Epoche (Jamming-Zustand { "2" }, wenn der Empfänger einen Störsender kennzeichnet, { "1" }, wenn nicht; in RXSTATUS gibt es kein Spoofing-Kennzeichen), gegen die Alarme von Kshana gehalten durch den Vergleich <c5/>

# text
seg-d4735b581cbf = GNSS-SDR-Monitor- und PVT-Monitor-Ströme als JSON-Zeilen

# text
# c1: integrations/gnss-sdr/relay.py
seg-053235d67fb3 = C/N0 je Kanal, Lösung, verwendete Satelliten, HDOP, Azimut und Elevation; erzeugt von <c1/>

# text
# c1: MACHINE-INPUTS.md
seg-2e9033aa4e9d = Einzelheiten, Quellen und Grenzen dieser drei: <a1><c1/></a1>.

# text
# c1: source_span
# c2: [start, end)
# c3: >
# c4: Raw
# c5: Fix
# c6: Raw
seg-8987b2c46eb0 = Jede von den Lesern erzeugte Epoche trägt außerdem <c1/>, <c2/> Byte-Offsets in die Eingabe: der kleinste zusammenhängende Bereich, der die zu ihr beitragenden Datensätze enthält, sodass das genaue Roh-Stück für ein Ereignisfenster gehasht werden kann. NMEA: jede Zeile, die gelesen wird, solange die Epoche aktuell ist (eine Obermenge, wo eine fremde Zeile zwischen ihren Sätzen steht). UBX: die Frames der Epoche. RINEX { "3" }: die Epochendatensätze von jeder Zeile <c3/> bis zur nächsten. Android: die Zeilen <c4/> der Epoche (eine Zeile <c5/> nur für eine Epoche ohne Zeilen <c6/>). Fehlt bei einem Live-Strom und überall, wo er nicht wohldefiniert ist (RINEX { "2" }).

# text
# c1: path
# c2: text
# c3: base64
seg-cea9532b57a2 = Die Datei kommt über <c1/> hinein (aufgelöst relativ zum eigenen Ordner des Szenarios) oder inline als <c2/> oder <c3/> (die einzigen Möglichkeiten in einem Browser).

# text
seg-3bc4f9c91950 = Ein IMU-Log als zweiter Sensor

# text
# c1: [log.imu]
seg-49b10ad5928e = <c1/> fügt ein Inertial-Log auf derselben Uhr hinzu:

# text
# c1: heading0_deg
# c2: heading-course
# c3: heading_sensor = true
# c4: hdg_cog_tol_deg
# c5: csv
# c6: MACHINE-INPUTS.md
# c7: text
# c8: base64
# c9: path
seg-9e0560b09f5a = Die Gierrate wird ab <c1/> integriert und füllt den Kurs überall dort, wo das Empfänger-Log keinen enthält, sodass der Monitor <c2/> (der <c3/> an der Plattform braucht) den Kreiselkurs mit dem Kurs über Grund vergleicht. Ein Kreisel driftet: Der Kurs ist nur so gut wie das Integrationsfenster, und <c4/> entscheidet, was als Abweichung zählt. Das Layout <c5/> ist in <c6/> dokumentiert. Die IMU-Bytes sind Teil des Szenario-Hashs und des Szenario-Hashs eines Nachweispakets. Inline (<c7/>/<c8/>) funktioniert auf jeder Oberfläche; ein <c9/> wird dort zurückgewiesen, wo keine Dateien gelesen werden.

# text
seg-fd3e6ef1cd93 = Plattform: statisch oder Schiff

# text
# c1: [platform]
# c2: static
seg-b67c0d57dc1d = Die obigen Monitore gehen von einer festen Antenne aus. Ein Szenario gibt die Plattform vor dem Lauf in einer Tabelle <c1/> auf oberster Ebene an; ohne sie ist die Plattform <c2/>, und nichts ändert sich.

# text
seg-3d6bc18bd83e = Warum dieser Wert

# text
seg-32f339f63acf = Über der Dienstgeschwindigkeit von Handelsschiffen und den meisten Passagierfahrzeugen, sodass ein reales Schiff sie nie erreicht; weit unter der Geschwindigkeit, die ein Wegziehen der Position impliziert. Ein langsameres Schiff sollte eine niedrigere Grenze angeben: Je niedriger die Grenze, desto früher wird ein Wegziehen bemerkt.

# text
seg-9506e8601857 = Ein großes Schiff ändert seine Geschwindigkeit um weit weniger als { "0.1" } m/s²; ein kleines schnelles Fahrzeug erreicht bei einer harten Gasänderung einige Zehntel.

# text
seg-b0b6baaee456 = Ein großes Schiff dreht mit weit weniger als { "1" } Grad/s und ein kleines Fahrzeug in einer harten Kurve mit einigen.

# text
seg-53d0fffb3c09 = Eine Eigenschaft der Installation; eine Schätzung wäre eine versteckte Schwelle.

# text
# c1: true
seg-ac48403443f9 = Als <c1/> deklariert und im Log nicht vorhanden ist ein Fehler, sodass ein fehlender Sensor nicht als saubere Prüfung durchgehen kann.

# text
# c1: kind = "static"
# c2: position-jump
# c3: monitor_config
seg-8266739dc26b = Die Schiffsschlüssel werden unter <c1/> zurückgewiesen. Für ein Schiff läuft der Monitor <c2/> nicht, weil er den Abstand vom Kalibriermittel misst, was bei einer bewegten Antenne falsch ist; das <c3/> des Ergebnisses hält die Plattform und die verwendeten Grenzen fest.

# text
# c1: kshana nmea-scenario
seg-7551792a0cb4 = Die synthetischen NMEA-Ströme aus <a1><c1/></a1>, für die Besatzungsschulung erzeugt, werden vom NMEA-Leser akzeptiert und können wie jedes NMEA-Log durch diese Art laufen.

# text
seg-18d7538bc56d = Monitore

# text
# c1: monitors_run
# c2: calibration_s
seg-e5c1cb89f0b3 = Jeder Monitor braucht seine Daten; ein Monitor, dessen Daten nicht im Log stehen, läuft nicht und wird nicht in <c1/> aufgeführt. Die ersten <c2/> Sekunden (Standard { "60" }) legen die Basislinie fest und lösen nie Alarm aus.

# text
seg-3be9ee05f087 = Alarm, wenn

# text
seg-98ead58c671d = Benötigt

# text
# c1: cn0_drop_db
seg-f6e6df453260 = das mittlere C/N0 über die mit der Basislinie gemeinsamen Satelliten um <c1/> oder mehr fällt (Standard { "6" } dB)

# text
# c1: sats_lost
seg-d9bf6efc6835 = die verfolgten Satelliten um <c1/> oder mehr unter den Median der Basislinie fallen (Standard { "4" })

# text
# c1: agc_k_sigma
seg-60c7a99f9819 = der AGC-Wert um mehr als <c1/> Standardabweichungen von seiner Basislinie abweicht (Standard { "5" })

# text
# c1: AgcDb
seg-7c1c65e64418 = UBX MON-RF oder Android <c1/>

# text
# c1: jamInd
# c2: jam_ind_threshold
seg-a5a5252417cb = u-blox <c1/> <c2/> überschreitet (Standard { "80" } von { "255" })

# text
seg-8bca191bf4c4 = UBX MON-RF

# text
# c1: position_jump_m
seg-0ac4898d81cf = die eigene Lösung des Empfängers mehr als <c1/> von ihrem Kalibriermittel entfernt ist (Standard { "50" } m)

# text
seg-6a3fec1214b9 = eine gemeldete Position

# text
seg-4c05faf783eb = die Paritäts-RAIM (empfängerautonome Integritätsüberwachung) auf der eigenen Einzelpunktlösung der Engine den Messsatz zurückweist

# text
# c1: nav
seg-037ab193613c = RINEX-Log mit <c1/>

# text
seg-8890a4ebf231 = die Einzelpunktlösung der Engine mit fünf oder mehr Satelliten fehlschlägt

# text
seg-0a5a708ac75b = die Empfängeruhr um mehr als den kleinsten erkennbaren Versatz ihres Kalibrierrauschens von ihrer vorhergesagten Geraden abweicht

# text
seg-31b64b635261 = Kalibriertes Profil (optional).

# text
# c1: [monitors] profile = "jammertest-2024-calibrated"
# c2: cn0_drop_db = 1.5
# c3: agc_k_sigma = 3.5
# c4: jam_ind_threshold = 29
# c5: xval/jammertest-trust/PREREGISTRATION.md
# c6: cn0_drop_db
# c7: xval/jammertest-trust/RESULTS.md
# c8: profile_note
seg-a73f2c2dfc9a = <c1/> ersetzt die drei Interferenzschwellen durch Werte, die am öffentlichen JammerTest-{ "2024" }-Datensatz kalibriert wurden (ein u-blox ZED-F9P je Szenario; Zenodo { "15911589" }): <c2/>, <c3/>, <c4/>. Die Kalibrierung war vorregistriert (<c5/>), und das Profil ist MODELLED, angepasst an eine öffentliche Kampagne: Seine Schwelle <c6/> hat den vorregistrierten Zielwert für Fehlalarme im zurückgehaltenen Datensatz <b>verfehlt</b> ({ "0.0231" } gegenüber { "0.02" }); die Zielwerte für AGC und Jamming-Indikator und der Vereinigungs-Zielwert (Fehlalarme { "0.033" }, Erkennung { "0.81" }) wurden erreicht (<c7/>). Es gilt für diesen Empfängertyp bei diesem Ereignis, gegenüber planmäßigen Angriffsfenstern, und wurde an den CSV-Logs des Datensatzes kalibriert (seine UBX-Logs ergeben in zwei Ordnern mehr Fehlalarme). Ein mit dem Profil ausgeführtes Ergebnis gibt die angewendeten Schwellen wieder und trägt eine <c8/>, die all dies sagt. Ohne das Profil gelten die obigen Standardwerte, und jede Ausgabe bleibt unverändert.

# text
# c1: vessel
# c2: [maritime]
# c3: src/receiver_trust/maritime.rs
# c4: monitors_run
seg-1fa8c4bd1a18 = Für eine Plattform <c1/> laufen auch die Monitore für bewegte Plattformen (Schwellen in einer Tabelle <c2/> auf oberster Ebene, jeder Standardwert dokumentiert in <c3/>); jeder braucht seine Daten und wird in <c4/> nur aufgeführt, wenn er entschieden hat:

# text
seg-4b2840d9d0af = die Positionsänderung widerspricht der gemeldeten Geschwindigkeit und dem gemeldeten Kurs, oder sie impliziert eine Geschwindigkeit, Beschleunigung oder Drehrate über den Grenzen des Schiffs

# text
seg-656c19cb5b52 = Lösungen; Geschwindigkeit und Kurs (RMC oder VTG) für den Koppelnavigationsteil

# text
# c1: hdg_cog_tol_deg
# c2: min_speed_kn
seg-cedefd52998d = Kreiselkurs und Kurs über Grund um mehr als <c1/> abweichen (Geschwindigkeit über <c2/>)

# text
# c1: heading_sensor = true
seg-c66704cbdd02 = Kurs HDT, THS oder VHW, <c1/>

# text
# c1: stw_sog_tol_kn
seg-1bbbf0033234 = Fahrt durchs Wasser und Fahrt über Grund um mehr als <c1/> abweichen

# text
seg-c9101740b235 = VHW oder VBW und Fahrt über Grund

# text
# c1: antenna_height_m
# c2: sea_level_tol_m
seg-42ac59072099 = die GGA-Höhe um mehr als <c2/> von <c1/> abweicht

# text
# c1: antenna_height_m
seg-811ec460249c = GGA-Höhe, <c1/>

# text
# c1: cn0_spread_frac
seg-854ea9c26df4 = die Streuung des C/N0 über die Satelliten auf <c1/> ihres Kalibriermedians fällt

# text
# c1: cn0_rise_db
# c2: cn0_rise_frac
seg-837fc4cb832c = das C/N0 der gemeinsamen Satelliten im Mittel um <c1/> stieg und <c2/> von ihnen stiegen

# text
seg-faae07674361 = aufeinanderfolgende Epochenzeiten unregelmäßig springen, rückwärts laufen oder die Hostuhr verlassen

# text
seg-f799a53897ed = NMEA-Zeit; Hostuhr für den letzten Teil

# text
seg-ee4913c9f2ed = der Empfänger einen OSNMA-Authentifizierungsfehler meldet (ein gemeldeter Status wird gelesen; nichts wird verifiziert; um OSNMA aus den I/NAV-Seiten selbst zu verifizieren, siehe <a1>docs/OSNMA.md</a1>)

# text
# c1: $PKSOS
seg-3fad5fcde4dc = Statussatz <c1/>

# text
seg-ce072f2ebb6c = Eine Epoche ist <b>nicht vertrauenswürdig</b>, wenn RAIM, der Uhrenmonitor, ein Lösungsfehler oder ein Positionssprung Alarm auslöst oder der C/N0-Abfall das Doppelte seiner Schwelle erreicht; <b>beeinträchtigt</b> bei jedem anderen Alarm; und sonst <b>nominal</b>.

# text
# c1: raim
# c2: solve-failure
# c3: clock
# c4: tests/jammertest_spoof_oracle_support
# c5: tests/receiver_trust_jammertest.rs
seg-4124ff6013a0 = Der Engine-Pfad (<c1/>, <c2/>, <c3/>) ist dieselbe Berechnung wie die unabhängige Referenz für Spoofing aus JammerTest { "2024" } in <c4/>: <c5/> prüft, dass bei allen acht veröffentlichten Einsetzzeitpunkten der erste Alarm auf dieselbe Epoche fällt und von derselben Art ist.

# text
seg-83be3c22a577 = Vertrauenswert (Plattform Schiff)

# text
# c1: statistic / threshold
seg-812991f245cd = Für ein Schiff erhält jede Epoche nach der Kalibrierung außerdem eine Bewertung von { "0" } bis { "100" } und die Gründe, warum sie nicht { "100" } ist. Die Abbildung ist deterministisch und wird festgelegt, bevor ein Log bewertet wird: kein Lernen, nichts an Ereignisse angepasst. Jeder Monitor reduziert seine Evidenz auf ein Verhältnis <c1/> (ein Alarm bei { "1" } oder mehr); ein Verhältnis kostet die Bewertung

# text
# c1: onset_ratio
# c2: full_ratio
# c3: evidence_hold_s
seg-ada5a0a52315 = sodass ein Monitor nichts kostet, solange er unter <c1/> seiner Schwelle liegt (Standard { "0.5" }), sein halbes Gewicht an seiner Schwelle und sein ganzes beim <c2/>-Fachen der Schwelle (Standard { "1.5" }); die Bewertung ist in jeder Statistik nicht steigend. Eine Quelle, die in einer Epoche nicht meldet, behält ihre letzte Statistik für <c3/> (Standard { "10" } s: zwei Zyklen eines C/N0-Satzes, der alle { "5" } s gesendet wird), sowohl als Alarm als auch als Abzug.

# text
# c1: floor(x * 10 + 0.5) / 10
# c2: cn0-drop
# c3: agc
# c4: jam-ind
# c5: loss-of-lock
# c6: position-jump
# c7: raim
# c8: clock
# c9: solve-failure
# c10: kinematic
# c11: heading-course
# c12: speed-log
# c13: sea-level
# c14: cn0-spread
# c15: cn0-rise
# c16: time-consistency
# c17: osnma
# c18: geometry
seg-6c06de24ebfe = Die Rundung ist kaufmännisch (<c1/>), das Band ist das der gerundeten Bewertung, und die Begrenzung kommt vor der Rundung. Nur Monitore, deren Punkte über null liegen, werden in den Abzügen aufgeführt, mit ihrem Verhältnis und ihren ungerundeten Punkten, die größten Punkte zuerst; Abzüge mit gleichen Punkten werden in der Reihenfolge der Monitornamen <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/> aufgeführt. Ein Monitor, dessen Test bestanden oder nicht bestanden lautet (eine fehlgeschlagene Lösung, eine fehlgeschlagene Authentifizierung), erhält das Verhältnis { "1.5" }, das volle Gewicht. Die aufgeführten Punkte sind die vor der Begrenzung bei { "0" }.

# text
seg-e36961d46c41 = Gewicht (Punkte)

# text
seg-673f6adcd681 = Warum

# text
seg-399be3301faf = ein Authentifizierungsfehler ist eine Aussage, keine Statistik

# text
seg-69cfc61477d6 = eine gefälschte Position muss der Physik oder den eigenen Prüfungen des Empfängers widersprechen, und die Zeit kann nicht rückwärts laufen; eine Verletzung in voller Stärke (das { "1.5" }-Fache ihrer Schwelle: { "60" } Punkte, Bewertung { "40" }) ist nicht vertrauenswürdig, und an ihrer Schwelle ({ "30" } Punkte, Bewertung { "70" }) beeinträchtigt

# text
seg-7fa1e6e67411 = ein unabhängiger Sensor, der widerspricht, ist beeinträchtigt; zwei in voller Stärke sind nicht vertrauenswürdig

# text
seg-4c4825d2957a = die Signalumgebung oder eine wenig aussagekräftige Prüfung

# text
seg-b5a364a03714 = die Umgebung ist feindlich; das allein zeigt nicht, dass die Lösung falsch ist

# text
# c1: [geometry]
seg-4e3749965405 = bis zu { "15" }, <c1/>

# text
# c1: cap_points
seg-1e595dbcf96f = kein Gewicht auf dieser Rampe: nichts, außer der Himmel ist schlecht, dann bis zu <c1/> ({ "15" }); Geometrie allein erreicht beeinträchtigt, nie nicht vertrauenswürdig, und löst keinen Alarm aus (siehe „Geometrie“ unten)

# text
# c1: score_model
# c2: score.deductions
seg-9902ca062070 = Die Bandgrenzen ergeben sich aus den Gewichten: Der leichteste Monitor, der Alarm auslöst, kostet an seiner Schwelle { "12.5" } Punkte, sodass jeder Alarm das nominale Band verlässt; kein einzelner Monitor unter { "60" } Punkten kann allein das Band „nicht vertrauenswürdig“ erreichen (mehrere zusammen können es). Das Ergebnis hält das Bewertungsmodell fest (<c1/>), und jede Epoche trägt <c2/>: welche Monitore abgezogen haben, ihre Verhältnisse und ihre Punkte. Bei einem Schiff ist der Zustand der Epoche das Band ihrer Bewertung.

# text
seg-6f620668ee85 = Geometrie: natürliche Verschlechterung abseits angriffsähnlicher Inkonsistenz

# text
# c1: docs/design/2026-10-12-geometry-and-skyline-design.md
# c2: geometry
# c3: environment
# c4: inconsistency
seg-93257d87e0d4 = Ein Empfänger neben einem Kaikran, in einer Schleuse oder unter einem hohen Rumpf verliert Satelliten, und seine Lösung wird aus einem Grund schlechter, der kein Angriff ist. Ab { "0.36" }, gemäß der Entwurfsnotiz zur Geometrie (<c1/>, Abschnitt { "4" }), trägt jede Epoche ihre <b>Satellitengeometrie</b>, die Bewertung eines Schiffs hat einen <b>Geometriemonitor</b>, und jeder Abzug trägt eine <b>Klasse</b>: <c2/> (der Himmel), <c3/> (die Signalumgebung) oder <c4/> (angriffsähnliche Evidenz).

# text
# c1: orbit::dop
# c2: source = derived
# c3: source = reported
# c4: evidence_hold_s
# c5: unknown
seg-17d13c39b5aa = <b>Woher die Geometrie kommt.</b> Elevation und Azimut jedes verfolgten Satelliten (NMEA GSV, UBX NAV-SAT), aus denen die Dilution of Precision (DOP) mit dem einen DOP-Kernel der Engine abgeleitet wird (<c1/>, VALIDATED gegen gnss_lib_py): <c2/>. Ersatzweise die vom Empfänger angegebene DOP und die verwendeten Satelliten (NMEA GSA): <c3/>. Himmelspositionen und GSA zählen für das <c4/> der Bewertung (Standard { "10" } s), weil viele Busse GSV nur alle paar Sekunden senden; ein in einer Epoche unvollständiger GSV-Satz (das Ende eines Ausschnitts, ein verlorener Satz) wird nicht verwendet. Ein Log mit keinem von beiden, etwa NMEA nur mit GGA und RMC, oder derzeit Android- und RINEX-Logs, erhält den Status <b><c5/></b> mit dem Hinweis „geometry unknown“: Die Engine rät keine Geometrie, die ihr nicht gegeben wurde, und der Geometriemonitor läuft nicht.

# text
seg-a267da42ac3d = genug Satelliten und DOP innerhalb der Schwellen

# text
# c1: few-satellites
# c2: high-pdop
# c3: high-hdop
# c4: sky-blocked
seg-dabcd392914a = ein oder mehrere Gründe: <c1/>, <c2/>, <c3/> und (informativ, nicht in der Bewertung) <c4/>, wenn jeder verfolgte Satellit in einer Hälfte des Horizonts sitzt

# text
seg-c255a66d3813 = das Log liefert für diese Epoche keine Satellitengeometrie

# text
# c1: degraded
# c2: sky-blocked
# c3: poor
seg-0a50145c2bfa = Der Status ist beschreibend, und für die Bewertung zählt die Bezeichnung (unten): <c1/> schließt den informativen Fall <c2/> ein, der mit guter oder mittlerer DOP einhergehen kann, und nur eine Bezeichnung <c3/> wird bewertet.

# text
# c1: geometry.label
# c2: good
# c3: hdop_good
# c4: pdop_good
# c5: used_good
# c6: poor
# c7: hdop_max
# c8: pdop_max
# c9: min_used
# c10: fair
# c11: unknown
seg-93e49a562493 = <b>Die Bezeichnung</b> (immer gemeldet, nie bewertet). Das <c1/> jeder Epoche ist <c2/> (HDOP höchstens <c3/> { "2" }, PDOP höchstens <c4/> { "3" } und mindestens <c5/> { "6" } Satelliten), <c6/> (HDOP über <c7/> { "4" }, PDOP über <c8/> { "6" } oder weniger als <c9/> { "5" } Satelliten), <c10/> dazwischen, oder <c11/>. Der Hinweis der Epoche beginnt immer mit der Bezeichnung und den Zahlen, zum Beispiel „geometry fair: HDOP { "1.105" }, PDOP { "1.831" }, VDOP { "1.410" }, { "8" } satellites; not scored (the score deducts only above HDOP { "4" }, PDOP { "6" } or below { "5" } satellites)“, und fügt „, signal loss“ an, wenn das zutrifft.

# text
# c1: max(hdop / hdop_max, pdop / pdop_max, min_used / n_used)
# c2: cap_points
# c3: full_ratio
# c4: floor
# c5: degraded_min
# c6: min(cap_points, 100 - floor)
# c7: [score]
# c8: degraded_min
# c9: degraded_min
# c10: 100 - degraded_min
# c11: floor
# c12: degraded_min
# c13: monitors_run
# c14: [score.weights]
# c15: geometry_model.cap_in_force
# c16: geometry_model.floor_in_force
seg-13838e036fae = <b>Der Geometriemonitor</b> (Schiffsbewertung). Er zieht <b>nichts ab, außer die Geometrie ist schlecht</b>: Sein Verhältnis ist <c1/>, und solange dieses höchstens { "1" } beträgt (gute oder mittlere Geometrie, ein offener Himmel mit nur GPS und { "8" } Satelliten eingeschlossen), kostet er nichts, sodass ein solches Log genau wie in { "0.35" } bewertet wird. Über { "1" } steigt der Abzug linear auf <c2/> ({ "15" }) bei <c3/> (das { "1.5" }-Fache der Schwellen: HDOP { "6" }, PDOP { "9" }, { "3" } Satelliten): { "7.5" } Punkte bei Verhältnis { "1.25" } (HDOP { "5" } oder { "4" } Satelliten), { "15" } ab { "1.5" } (Bewertung { "85" }, beeinträchtigt). Für sich allein kann er die Bewertung nie unter <c4/> drücken (Standard: das <c5/> der Bewertung, { "55" }), sodass Geometrie allein höchstens das Band „beeinträchtigt“ erreicht und nie das Band „nicht vertrauenswürdig“: Die geltende Obergrenze ist <c6/>, sodass eine Tabelle <c7/>, die <c8/> anhebt (etwa eine aus { "0.35" } mit <c9/> { "90" }), die Obergrenze auf <c10/> senkt, statt zurückgewiesen zu werden, und ein unter <c12/> gesetztes <c11/> zurückgewiesen wird. Der Monitor löst keinen Alarm aus; er wird in <c13/> zuletzt aufgeführt, wenn er in irgendeiner Epoche entschieden hat (ein Schiff, dessen Log die Geometrie liefert), und wird in der Identität mit { "0.35" } nicht mitgezählt; er ist kein Eintrag von <c14/> (einen zu setzen wird zurückgewiesen), und die geltende Obergrenze und Untergrenze werden in <c15/> und <c16/> festgehalten. Der Hinweis einer schlechten Epoche sagt, warum, zum Beispiel „geometry poor: HDOP { "5.200" }, PDOP { "7.900" }, VDOP { "4.100" }, { "7" } satellites; degraded by geometry: HDOP { "5.200" } above { "4" } (derived from { "7" } logged satellites); not an inconsistency“.

# text
# c1: score.deductions[].class
seg-2082f4ccb250 = <b>Klassen.</b> Jeder Abzug (<c1/>):

# text
# c1: geometry
# c2: loss-of-lock
# c3: low_elev_deg
seg-4197bc517f73 = <c1/> (schlechte Geometrie); <c2/>, wenn jeder gegenüber der Kalibrier-Basislinie verlorene Satellit bei seiner letzten Meldung unter <c3/> lag

# text
# c1: cn0-drop
# c2: cn0-spread
# c3: cn0-rise
# c4: agc
# c5: jam-ind
# c6: loss-of-lock
# c7: geometry
seg-e06597696553 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, sonst <c6/>; <c7/> bei Signalverlust (unten)

# text
# c1: kinematic
# c2: heading-course
# c3: speed-log
# c4: sea-level
# c5: time-consistency
# c6: clock
# c7: raim
# c8: position-jump
# c9: osnma
# c10: solve-failure
# c11: geometry
seg-5fc0eb79c51b = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; und <c11/>, wenn die Geometrie schlecht ist und die angegebene HDOP dem angegebenen Himmel widerspricht (unten)

# text
# c1: max(reported_vs_derived_tol, reported_vs_derived_rel × derived HDOP)
# c2: reported_derived_mismatch: true
# c3: inconsistency
# c4: reported_derived_mismatch
# c5: geometry_summary.hdop_mismatch
# c6: geometry
seg-1b5e88a4aae4 = <b>Der Schutz gegen einen gefälschten schlechten Himmel.</b> Ein Spoofer könnte ein dünnes GSV senden oder eine hohe HDOP melden, um sich Toleranz zu erkaufen. Die Engine kennzeichnet und verzeiht nicht: Keine andere Prüfung wird durch eine schlechte Geometrie aufgeweitet, und die HDOP, die der Empfänger angibt (GSA innerhalb des Haltefensters, sonst GGA), wird mit der HDOP verglichen, die aus dem von ihm angegebenen Himmel abgeleitet wird. Weichen sie um mehr als <c1/> ab ({ "1.0" } oder { "25" } % der abgeleiteten HDOP, je nachdem, was größer ist), trägt die Epoche <c2/>, und bei schlechter Geometrie wird ihr Abzug als <c3/> klassifiziert. Bei guter oder mittlerer Geometrie wird die Abweichung gemeldet und nicht bewertet: Es wird nichts abgezogen, außer die Geometrie ist schlecht. Das ist eine bewusste Entscheidung ({ "0.36" }): „null, außer schlecht“ gilt für jede Epoche, sodass gute und mittlere Geometrie genau wie in { "0.35" } bewertet werden und eine gefälschte HDOP nie unbemerkt bleibt. Das Kennzeichen (<c4/>) steht in jeder Epoche des Ergebnisses und jeder Live-Zeile, der Hinweis lautet „…beyond the tolerance: reported, not scored (the geometry is not poor)“ oder „…: the geometry deduction is classed an inconsistency“, <c5/> zählt die Epochen, und die Evidenz-Zusammenfassungsseite zeigt die Zahl, auch null. Die { "25" } % sind eine <b>REPRESENTATIVE</b> Ingenieurentscheidung, keine gemessene oder normierte Zahl: Ein Empfänger, der je Konstellation eine Uhr löst oder mit einer Teilmenge der von ihm verfolgten Satelliten rechnet (eine Elevationsmaske, ein C/N0-Schnitt, ein RAIM-Ausschluss), gibt eine HDOP an, die sich von der Einzeluhr-HDOP aller verfolgten Satelliten um einen mit der HDOP wachsenden Betrag unterscheidet, sodass eine feste Toleranz allein natürliche schlechte Geometrie als Inkonsistenz lesen würde. Ein größerer Unterschied wird weiterhin als solche gelesen. Ein als <c6/> klassifizierter Abzug ist eine Aussage über den Himmel, kein Befund, dass kein Angriff stattfand.

# text
# c1: low_elev_deg
# c2: signal_loss: true
# c3: environment
seg-0e729ad96db9 = <b>Signalverlust ist nicht der Himmel.</b> Wenn Satelliten, die der Empfänger als sichtbar (über <c1/>) auflistet, nicht verfolgt werden, leitet die Engine zusätzlich die DOP aller sichtbaren Satelliten ab. Liegt diese DOP der sichtbaren Satelliten innerhalb der Schwellen und wird entweder nichts verfolgt oder sind die nicht verfolgten Satelliten über den Horizont verteilt (nicht auf eine Hälfte beschränkt), dann war der Himmel da und das Signal nicht: Die Epoche trägt <c2/>, den Hinweis „satellites in view but not tracked: signal environment, not geometry“, und der Geometrie-Abzug wird als <c3/> klassifiziert. Nicht verfolgte Satelliten, die auf eine Hälfte des Horizonts beschränkt sind, werden weiterhin als blockierter Himmel gelesen (eine Wand, eine Klippe, ein Kai). Eine beidseitige Abschattung (eine Schlucht oder ein enger Fjord) wird als Signalverlust gelesen, bis ein Horizontprofil konfiguriert ist. Die Kein-Fix-Sentinelwerte des Empfängers sind keine DOP: Eine angegebene HDOP oder PDOP von { "99" } oder mehr, GGA-Qualität { "0" } und GSA-Modus { "1" } ergeben keine angegebene DOP.

# text
# c1: [geometry]
seg-0f218d21843b = Schlüssel <c1/>

# text
# c1: sigma_uere_m
# c2: kin_pos_tol_m
seg-e5ec84abd61b = gewählt (Entwurfsnotiz { "4.2" }): bei <c1/> { "1.5" } m ist HDOP { "4" } ein 2drms von { "12" } m, dem <c2/> der kinematischen Prüfung. IEC 61108-1 wird häufig so zitiert, dass sie ihre Genauigkeitsanforderungen für HDOP ≤ { "4" } (oder PDOP ≤ { "6" }) angibt: aus der sekundären GNSS-Empfängerliteratur erinnert, keine bestimmte Sekundärquelle eingesehen und die Norm nicht gelesen; gegen den Text der Norm zu prüfen

# text
# c1: scenarios/polar-arctic-leo-coverage.toml
# c2: tests/constellation_availability_published_spec_oracle.rs
seg-d99dc0fd090a = die PDOP-Verfügbarkeitsschwelle von <c1/>; GPS SPS Performance Standard, 5. Ausgabe ({ "2020" }), PDOP ≤ { "6" }, wie in <c2/> zitiert; gegen den Text der Norm zu prüfen

# text
seg-2fffa47378ec = einer mehr, als eine Lösung braucht, sodass ein einzelner Verlust die Lösung nicht beendet; die wenigsten mit einer redundanten Messung für RAIM

# text
# c1: hdop_max
seg-7dc0baed2bc4 = eine angegebene Eingabe für die 2drms-Verknüpfung von <c1/>; setzen Sie den eigenen Wert des Empfängers

# text
seg-7b5778d93d40 = { "1.0" } HDOP

# text
seg-093cff5d1150 = gewählt (Entwurfsnotiz { "4.2" }): der absolute Teil der Toleranz; eine Abweichung jenseits der Toleranz ist keine Geometrie

# text
seg-be5c3aefd942 = REPRESENTATIVE Ingenieurentscheidung: der relative Teil, für Empfänger mit Uhren je Konstellation oder Teilmengenlösungen

# text
seg-e71c6876114b = Entwurfsnotiz { "4.3" }: Satelliten, die darunter verloren gehen, gehen an den Himmel verloren; ein Horizontprofil ({ "0.36" } Punkt { "1" }) wird dies erweitern

# text
seg-bebe291ca1c0 = geometrisch, informativ: jeder Satellit in einer Hälfte des Horizonts

# text
seg-06519582227b = Entwurfsnotiz { "4.2" }: Geometrie allein bewegt die Bewertung von nominal nach beeinträchtigt und nie nach nicht vertrauenswürdig; nur abgezogen, wenn die Geometrie schlecht ist (Gründerentscheidung B1, { "0.36" })

# text
# c1: full_ratio
# c2: cap_points
seg-be21b5a31382 = das eigene <c1/> der Bewertung: Die Rampe erreicht <c2/> beim { "1.5" }-Fachen der Schwellen für schlecht

# text
# c1: degraded_min
seg-e922a5342a3c = das <c1/> der Bewertung ({ "55" })

# text
# c1: min(cap_points, 100 - floor)
# c2: degraded_min
seg-09fe8c435ece = Geometrie allein erreicht nie das Band „nicht vertrauenswürdig“; die geltende Obergrenze ist <c1/>; ein Wert unter <c2/> wird zurückgewiesen

# text
# c1: hdop_max
seg-a07e6ce67371 = REPRESENTATIVE, nur die Bezeichnung: die Hälfte von <c1/> (das Einsetzverhältnis der Bewertung aus { "0.35" })

# text
# c1: pdop_max
seg-06db7e7af59c = REPRESENTATIVE, nur die Bezeichnung: die Hälfte von <c1/>

# text
# c1: min_used
seg-7e7f17d36ea4 = REPRESENTATIVE, nur die Bezeichnung: einer mehr als <c1/>, sodass ein einzelner Verlust noch eine redundante Messung übrig lässt

# text
# c1: epochs[].geometry
# c2: status
# c3: reasons
# c4: source
# c5: n_used
# c6: hdop
# c7: pdop
# c8: vdop
# c9: open_fraction
# c10: max_azimuth_gap_deg
# c11: age_s
# c12: reported_hdop
# c13: reported_derived_mismatch
# c14: note
# c15: in_view
# c16: low_elev_deg
# c17: signal_loss
# c18: label
# c19: class
# c20: geometry_model
# c21: geometry_summary
# c22: score_model.weights
# c23: docs/revisions/STUDIO15-portable-math-rebaseline.md
# c24: tests/geometry_trust_no_change.rs
# c25: $PKSHT
# c26: tests/geometry_corpus_identity.rs
# c27: $PKSHT
# c28: inconsistency
# c29: tests/geometry_trust.rs
# c30: environment
# c31: geometry
# c32: inconsistency
seg-ef7a4c24e870 = <b>Was sich in den Ausgaben geändert hat und was nicht.</b> Keine Bewertung ändert sich, außer die Geometrie ist schlecht; die Bezeichnung wird immer gemeldet. Angehängte Schlüssel: <c1/> (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/> gerundet auf { "0.001" }, <c9/> (null, bis ein Horizontprofil konfiguriert ist), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/> (Satelliten, die über <c16/> aufgelistet sind), <c17/>, <c18/>), <c19/> bei jedem Abzug und am Ende <c20/> (Schwellen, Haltefenster, die geltende Obergrenze und Untergrenze, Herkunft, Klassenregeln) und <c21/> (Epochen nach Status, nach Bezeichnung und nach Abzugsklasse sowie die Epochen mit einer Abweichung der angegebenen HDOP); <c22/> ist wie in { "0.35" }. Zwei Tests halten dies auf die Bytes der Basislinie „{ "0.36" } portable“ fest, sobald diese Schlüssel entfernt sind (die Hashes von { "0.35.0" }, neu aufgesetzt, als die Engine auf portable Mathematik umgestellt wurde, und in den Tests als Aufzeichnung dessen behalten, was { "0.35.0" } veröffentlichte: <c23/>). <c24/> hält jede Ausgabe beider Beispielsitzungen fest (Ergebnis-JSON, CSV, SVG, Urteil, wiedergegebene Live-Zeilen, <c25/>, Prometheus, CEF, LEEF). <c26/> hält das Batch-Ergebnis, die Zusammenfassung, die Live-Zeilen und <c27/> jedes eingecheckten NMEA-Korpus für Schiffe fest (die Demo und die maritimen Referenz-Fixtures, jeweils auch als offener Himmel nur mit GPS und { "8" } Satelliten, und die aus ihren Seeds erzeugten Szenarien für die Besatzungsschulung); in den beiden Schulungsszenarien, deren Jamming die Geometrie schlecht macht, ist jede nicht schlechte Epoche identisch und jede schlechte unterscheidet sich allein durch den Geometrie-Abzug. Ein Log mit schlechter Geometrie verliert bis zu { "15" } Punkte, die es in { "0.35" } nicht verlor; das ist die beabsichtigte Änderung. In der Demo wird das Wegziehen als <c28/> gelesen; <c29/> bearbeitet das Log, um den westlichen Himmel zu maskieren (mittel: gekennzeichnet, nicht bewertet), ihn und zwei östliche Satelliten zu maskieren (schlecht: Geometrie-Abzüge, Lock-Verlust <c30/>, weil auch hohe Satelliten verloren gingen), nur Satelliten unter { "15" }° zu verlieren (Lock-Verlust <c31/>) und eine HDOP anzugeben, die der Himmel nicht erklärt (der Abzug für schlechte Geometrie wird zu <c32/>). Die Schwellen sind MODELLED: gewählt, an kein Log angepasst; nichts hier behauptet, wie oft natürliche Verschlechterung und Angriffe an realen Daten unterschieden werden.

# text
seg-8ddaf82ba00b = Ereignisse und Vorhersagen angeben

# text
# c1: detected
# c2: late
# c3: missed
# c4: not-evaluable
# c5: agree
# c6: disagree
# c7: no-prediction
# c8: not-evaluable
seg-c52c285aa308 = Für jedes Ereignis gibt das Ergebnis die Fehlalarme zwischen Kalibrierung und Einsetzen an, den ersten Alarm und seine Monitore, die Latenz, den Ausgang (<c1/>, <c2/>, <c3/> oder <c4/>) und den beobachteten medianen C/N0-Abfall gegenüber der Vorhersage (<c5/>, <c6/>, <c7/> oder <c8/>). Abweichung wird gemeldet, nie weggestimmt: Die Toleranzen stehen im Szenario, und das Szenario steckt im Hash des Ergebnisses.

# text
seg-3715df3fd8f7 = Was dies nicht behauptet

# text
# c1: VERIFICATION-MATRIX.md
seg-21a4b903e179 = Die Vertrauensmonitore sind MODELLED: Ihre Schwellen sind Eingaben, und ihre Erkennungsleistung bei realer Interferenz ist das, was die Ereignisbewertung misst, nicht etwas, das diese Art behauptet. Bei den Spoofing-Sitzungen von JammerTest { "2024" } erfassen die Monitore des Engine-Pfads einige Einsetzzeitpunkte innerhalb von { "10" } s und sind bei anderen spät; die Zahlen siehe die Zeile „Clock-aided χ², RAIM, AGC, SQM fused per-epoch security FoM“ in <a1><c1/></a1>. Eine Vorhersage, die mit einem Log übereinstimmt, ist ein Datenpunkt, keine Validierung.

# text
seg-0c413c1a491c = <s1>Zurück</s1>Resilienz-Querverweis

# text
seg-63fc2b340fd1 = <s1>Weiter</s1>Maritimes Vertrauen
