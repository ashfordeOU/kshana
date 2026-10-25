# docs--receiver-protocols: translations (de)

# text
seg-99427ab75a03 = Feld

# text
# c1: docs/RECEIVER-PROTOCOLS.md
seg-75e6589cf544 = Quelle: <c1/>

# text
seg-4540630d4859 = Von receiver-trust gelesene Empfängerprotokolle ({ "0.38" })

# text
seg-906a5f9e6cd9 = Durchgehend nur lesend: Nichts hier schreibt ein Byte an einen Empfänger, und es gibt keinen Sendepfad irgendeiner Art. Beratende Software, keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }): Der Betreiber bleibt verantwortlich.

# text
seg-a44353d98d6c = Die eigenen Spoofing- und Jamming-Kennzeichen des Empfängers (UBX)

# text
seg-b58d3a8f292c = Nachricht

# text
seg-24c57b65b8f7 = gelesen als

# text
seg-bb61c4d9a33e = UBX-NAV-STATUS (0x01 0x03), { "16" } Bytes

# text
# c1: flags2
# c2: spoofDetState
seg-3fb608c6c3ea = Byte <c1/> bei Offset { "7" }, Bits { "4" }..3: <c2/>

# text
seg-54d4cf306b49 = { "0" } unbekannt oder deaktiviert, { "1" } kein Spoofing angezeigt, { "2" } Spoofing angezeigt, { "3" } mehrere Spoofing-Anzeigen (Protokoll { "18" } und später; Schnittstellenbeschreibung u-blox F9 HPG { "1.32" }, Abschnitt { "3.15.20" })

# text
seg-36d4d1d82f3d = UBX-SEC-SIG (0x27 0x09) Version { "1" }, { "12" } Bytes

# text
# c1: jamFlags
# c2: spfFlags
seg-e7e262087849 = <c1/> bei { "4" } (Bit { "0" } jamDetEnabled, Bits { "2" }..1 jammingState); <c2/> bei { "8" } (Bit { "0" } spfDetEnabled, Bits { "3" }..1 spoofingState)

# text
seg-3e117e319518 = Zustände werden nur gelesen, wo der Detektor aktiviert ist; { "0" } unbekannt, { "1" } keiner, { "2" } Warnung oder angezeigt, { "3" } kritisch oder bestätigt

# text
seg-8a5a59761cd0 = UBX-SEC-SIG Version { "2" }

# text
# c1: sigSecFlags
# c2: jamNumCentFreqs
seg-9626adf4a5e7 = <c1/> bei { "1" } (Bit { "0" } jamDetEnabled, Bits { "2" }..1 jammingState, Bit { "3" } spfDetEnabled, Bits { "6" }..4 spoofingState); <c2/> bei { "3" } und so viele 4-Byte-Gruppen (nicht verwendet)

# text
seg-e0eb14018b2c = wie oben

# text
# c1: SEC-SIG-V1
# c2: SEC-SIG-V2
# c3: tests/receiver_trust_self_report.rs
seg-b0c1eaeb4185 = <b>Quelle des SEC-SIG-Layouts.</b> Die Schnittstellenbeschreibungen u-blox F9 HPG { "1.32" } und M10 SPG { "5.10" }, die beim Verfassen heruntergeladen werden konnten, nennen UBX-SEC-SIG, definieren es aber nicht. Die obigen Layouts sind die der späteren u-blox-Schnittstellenbeschreibungen, wie sie in der Bibliothek pyubx2 übernommen wurden (BSD-3-Clause, <c1/> und <c2/>); die Fixture-Tests in <c3/> sind aus diesem Layout aufgebaut, nicht aus der Ausgabe eines echten Empfängers. Layout aus offener Übernahme, nicht gegen den aktuellen Herstellerleitfaden geprüft: Prüfen Sie es gegen die aktuelle u-blox-Schnittstellenbeschreibung, bevor Sie sich auf SEC-SIG verlassen.

# text
seg-6af7d45be34d = Ein SEC-SIG hat keine Wochenzeit; es gehört zur aktuellen Navigationsepoche. Ein bereits in einer Epoche gelesener Zustand bleibt erhalten, außer ein späterer ist schlechter.

# text
# c1: receiver-self-report
seg-f1cf7ee27cb1 = Der Vergleich <c1/>

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
seg-f30ddb83bf99 = Wo ein Log diese Kennzeichen enthält, hat jede Epoche des Ergebnisses <c1/> (die beiden Zustände, ob der Empfänger kennzeichnet, ob ein Kshana-Monitor Alarm ausgelöst hat, und <c2/>: <c3/>, <c4/>, <c5/>, <c6/> oder <c7/>), und das Ergebnis hat <c8/> mit den Zählungen und der ersten Epoche von jeder. Der Empfänger „kennzeichnet“ ab einem Zustand von { "2" } oder mehr. Es <b>löst keinen Alarm aus und ändert keine Bewertung</b>, und keine der beiden Seiten ist die Grundwahrheit: Übereinstimmung ist keine Validierung, und eine Abweichung besagt, dass ein Detektor etwas gesehen hat, das der andere nicht sah, nichts darüber, welcher recht hatte. Der Streifen in Studio liest <c9/>.

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
seg-4d6365d9ffd1 = <c1/> dekodiert mit dem Crate <c2/> ({ "0.4" }, <b>MIT</b>; seine einzige Abhängigkeit ist <c3/>; eine permissive Lizenz, die <c4/> zulässt). Gelesene Blöcke: PVTGeodetic ({ "4007" }) für die Lösung, MeasEpoch ({ "4027" }) für C/N0 je Satellit und Signal (<c5/> ist der Name des Signals, etwa <c6/>) und RFStatus ({ "4092" }) für die Zahl der HF-Bänder, deren Byte <c7/> ungleich null ist (<c8/>, übernommen und <b>nicht interpretiert</b>: es zählt nie als Kennzeichen). Epochen werden nach Wochenzeit und Wochennummer geschlüsselt und in GPS-Zeit beschriftet (<c9/>). Ein Block, dessen CRC oder Parsing fehlschlägt, zählt als übersprungener Datensatz. Dieser Leser liest weder AGC noch einen Jamming-Indikator, daher laufen die Monitore für C/N0-Abfall und Lock-Verlust, die Monitore für AGC und Jamming-Indikator jedoch nicht.

# text
# c1: sbf-tools
# c2: tests/receiver_trust_sbf.rs
seg-f86f2c25f41a = <b>Quelle der Layouts.</b> Der Referenzleitfaden von Septentrio konnte beim Verfassen nicht heruntergeladen werden (der Server hat die Anfrage abgelehnt), daher wurden die Layouts aus dem Quelltext von <c1/> übernommen, der den Leitfaden zitiert, und die Fixtures in <c2/> sind synthetische Blöcke, die nach diesem Layout und seinem CRC-16-CCITT aufgebaut sind. Es wurde kein echtes SBF-Log verwendet. Layout aus dem Open-Source-Crate, nicht gegen den aktuellen Herstellerleitfaden geprüft: Prüfen Sie es gegen den Referenzleitfaden von Septentrio, bevor Sie sich darauf verlassen.

# text
# c1: receiver-trust live --serial
seg-680fa4eea3f4 = Direkte serielle und USB-Eingabe (<c1/>)

# text
# c1: --baud
# c2: --configure
# c3: live
# c4: tests/receiver_trust_live_serial.rs
seg-38fcf7d91b6e = Nur Unix. Es öffnet das Gerät zum Lesen, setzt die <b>lokale</b> Leitung auf Rohmodus bei <c1/> (Standard { "4800" }, die NMEA-{ "0183" }-Rate) und liest NMEA-Zeilen wie jede andere Quelle. Es schreibt nie an den Empfänger. <c2/> wird mit einer Erklärung zurückgewiesen: Kshana konfiguriert keine Empfänger; stellen Sie den Empfänger mit dem Werkzeug des Herstellers auf NMEA-Ausgabe ein und lesen Sie ihn dann. Der Eingang ist NMEA, wie bei jeder Quelle von <c3/> (UBX und SBF werden aus Dateien gelesen). Ein Gerät, das verschwindet, beendet den Befehl als Fehler (Exit { "1" }), damit ein Supervisor ihn neu startet; die Schicht verbindet sich nicht neu. Getestet an einer Pseudo-Terminal-Schleife (<c4/>), einschließlich dessen, dass die Master-Seite vom Befehl kein Byte erhält.

# text
seg-97e1ea47c2be = <s1>Zurück</s1>Maschinen- und Sensoreingaben

# text
seg-55ad3fc908be = <s1>Weiter</s1>Interferenz-Observatorium: Methode

# text
seg-17c3203ee615 = Der Vergleich mit der Selbstauskunft des Empfängers

# text
seg-68bc6d2e1575 = Septentrio SBF (format = "sbf")

# text
seg-8444127e7ee6 = Direkte serielle und USB-Eingabe (receiver-trust live --serial)
