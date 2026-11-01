# docs--hardware-safety: translations (de)

# text
seg-fdbb9db68f1d = keine

# text
# c1: docs/HARDWARE-SAFETY.md
seg-2015f437e669 = Quelle: <c1/>

# text
seg-10c7eaab58c5 = Hardwaresicherheit: was Kshana mit Hardware tut und was nie

# text
seg-fe4873962140 = <b>Status: rechtliche Prüfung durch den Eigentümer steht aus.</b> Die rechtlichen Hinweise unten sind die Lesart öffentlicher Quellen durch die Maintainer, aufgeschrieben, damit ein Nutzer weiß, wo die Grenzen liegen. Sie sind keine Rechtsberatung, sie wurden nicht von einem Rechtsbeistand geprüft, und das Recht unterscheidet sich je nach Land. Lesen Sie sie als Anlass, einen Juristen zu fragen, nicht als Erlaubnis.

# text
seg-bd2fbb355834 = Kshana ist beratende Software für Forschung, Simulation und Test. Sie ist kein typzugelassenes Gerät und bewertet oder genehmigt weder einen Empfänger noch eine Uhr noch ein Labor. Siehe die Hinweiserklärung in der README.

# text
seg-f27c286787b1 = Die Regel

# text
seg-88638e41faab = Empfangen ist das Produkt. Senden gehört nie in die offene Engine.

# text
seg-614d381dd0d0 = Kshana enthält keinen Code, der einen Sender ansteuert. Es gibt keinen Sendepfad für SDR (keinen Sendeaufruf von UHD, HackRF, bladeRF oder Soapy), und keine Wellenform für jamming oder spoofing wird in eine Datei geschrieben, die zur Wiedergabe gedacht ist.

# text
# c1: .sdrx
# c2: kshana iq scene
# c3: .sdrx
seg-2e370a1c6c4c = Dateien, die Kshana schreibt (IQ-Szenen, SigMF- und ION-<c1/>-Aufzeichnungen, NMEA- und bench-Exporte), beschreiben <b>simulierte, rechtmäßige</b> Signale oder Bewegung, und die Metadaten, die Kshana für eine Szene schreibt, sagen, dass sie von <c2/> geschrieben wurde (der ION-<c3/>-Kommentar sagt, dass es eine simulierte Szene ist, keine Aufzeichnung).

# text
seg-8ce652bc1af6 = Wo ein Experiment HF auf einer bench braucht, erzeugt die <b>eigene Ausrüstung des Betreibers</b> sie, im eigenen Gehäuse des Betreibers, unter der eigenen Genehmigung des Betreibers. Kshana zeichnet auf, was der Betreiber sagt, getan zu haben, und schließt es nie selbst.

# text
seg-c74fc5d82071 = Stufen

# text
seg-01e7633921dc = Jede Stufe nennt, was Kshana tut, welche Hardware beteiligt ist, wer HF aussendet (falls jemand), und das Gate, das gelten muss, bevor Kshana das Ergebnis als Beleg behandelt.

# text
seg-324e16b11186 = Stufe

# text
seg-bb269645d988 = Rolle von Kshana

# text
seg-76c0861cbe83 = Hardware

# text
seg-92ab27525ed1 = HF-Aussendung

# text
seg-c822f981cfcf = Gate

# text
seg-00727bb577f9 = Stand in { "0.38" }

# text
seg-1c566ec98a03 = Dateien: Replay-Logs, IQ, bench-Exporte, Live-NMEA oder UBX über stdin, TCP oder UDP

# text
seg-0435986aa760 = ausgeliefert

# text
# c1: iq monitor --follow
seg-56b9a4399108 = Passiver Empfang: Empfänger nur lesend; Zeitgebungslogs (linuxptp, chrony, TICC); IMU-CSV; <c1/> auf einer wachsenden SigMF-Datei

# text
seg-608fc0a99107 = die Empfänger, der Grandmaster und das SDR im Empfang des Nutzers

# text
# c1: --configure
seg-786d9e5ccf93 = jeder Konfigurationsschreibzugriff auf einen Empfänger braucht ein ausdrückliches <c1/>; der Standard ist nur lesend

# text
# c1: holdover-test
# c2: iq monitor --follow
seg-ab8874046283 = teilweise ausgeliefert: Formate für Zeitgebungslogs, <c1/>, <c2/>; serielle Empfängereingabe ist geplant

# text
seg-6b0a194d3f64 = Laborsteuerung ohne HF von Kshana: eine Spezifikation der Testbedingungen, Schritte des Betreibers (Antenne abziehen, Simulator starten) angefragt und mit Zeitstempel versehen, Bewertung im Rundlauf und Nachweis

# text
seg-8e2847bce9ac = laboreigene Simulatoren, abgeschirmte Boxen

# text
seg-121fe22c92ec = nur durch den Simulator des <b>Labors</b>, leitungsgebunden

# text
# c1: lab-attestation
seg-0a704c5443c5 = eine signierte <c1/> (unten), im Nachweispaket aufgezeichnet; Kshana verweigert die Bewertung eines Laborlaufs ohne sie

# text
seg-9e94d44cd197 = die Aufzeichnung ist in Nachweispaketen umgesetzt; die Verweigerung der Bewertung ohne sie noch nicht (es gibt keinen Befehl für Laborläufe)

# text
seg-ee5333e346ad = Leitungsgebundene Wiedergabe <b>rechtmäßiger</b> GNSS-IQ-Szenen: Kshana schreibt die Szenendatei, und der Nutzer spielt sie mit seinem eigenen Werkzeug über ein Kabel mit Dämpfungsgliedern auf ein zu prüfendes Gerät in einem HF-Gehäuse ab

# text
seg-fa5b0f1b41f7 = das SDR, die Dämpfungsglieder und das Gehäuse des Nutzers

# text
seg-9049203a2a6e = nur leitungsgebunden, in der Verantwortung des Nutzers

# text
seg-b4392e583cb8 = kein Sendecode in der offenen Engine; Wellenformen für Störung und spoofing bleiben außerhalb des Umfangs; Prüfung der Exportkontrolle; Rechtsbeistand

# text
seg-ced2afbf108f = nicht in der offenen Engine; ein Punkt der kommerziellen Ausgabe, der mit einem Rechtsbeistand zu erledigen ist

# text
seg-0f8a0fce4d20 = Geschlossene HF-Hardware-in-the-Loop-Regelung in Echtzeit

# text
seg-d109f8e36ce8 = Ausrüstung von Partnern

# text
seg-fb26b352f56e = Partner

# text
seg-38c768d5faa7 = stattdessen über die Spezifikation der Stufe { "2" } integrieren

# text
seg-458f37b807ba = nicht geplant

# text
seg-2e59d363e31b = „Ausgeliefert“ heißt, der Code ist in diesem Release. Nichts in dieser Tabelle sagt, dass irgendeine Stufe mit irgendeinem Partner, Labor oder einer Behörde verwendet wurde; keine wurde es.

# text
seg-1524fb5b0aba = Grundsätze

# text
seg-82b8ed15bbe6 = Empfangen ist das Produkt, und Senden gehört nie in den offenen Code.

# text
seg-63c000eccfc2 = Jede Hardware-Sitzung liefert ein Nachweispaket mit Hashes der Eingaben, der Bedingungen und der verwendeten Schwellwerte.

# text
seg-63cc5d9513ff = Eine Bestätigung für leitungsgebundenen oder abgeschirmten Betrieb wird aufgezeichnet, nie geschlossen.

# text
seg-da1e4f5da956 = Zahlen, die aus Hardware stammen, bleiben <b>MODELLED</b>, bis eine unabhängige externe Referenz übereinstimmt (zum Beispiel eine Wahrheitstrajektorie des Labors oder eine Referenzuhr). Ein vorab festgelegter Zielwert wird nach einem Lauf nicht gelockert.

# text
seg-d8e445427d02 = Antennen mit gesteuerten Charakteristiken, Inertialeinheiten und chipgroße Atomuhren werden als Datenquellen behandelt (Charakteristiken, Logs, veröffentlichte Stabilitätskurven), nicht als Geräte, die Kshana ansteuert.

# text
seg-7a22a9591fa3 = Wortlaut: Ein Ergebnis ist „gegen die Maske gemessen“ oder „liefert Belege für“ eine Anforderung. Kshana sagt nicht, dass ein Gerät eine Norm erfüllt, und niemand hat es bewertet oder zugelassen.

# text
seg-913509e5d6b2 = Rechtliche Hinweise (rechtliche Prüfung durch den Eigentümer steht aus)

# text
seg-c18b68936406 = GNSS-Signale zu empfangen ist fast überall legal. In GNSS-Bändern zu senden ist es nicht.

# text
seg-070d8a8d5494 = <b>Vereinigte Staaten.</b> Vorsätzliche Störung von Funkverkehr ist nach { "47" } U.S.C. §{ "333" } untersagt, und die FCC geht gegen Störsender vor (<a1>https://www.fcc.gov/general/jammer-enforcement</a1>). Eine Aussendung von einer bench kann über die bench hinausreichen.

# text
seg-336b48c6f5f2 = <b>Anderswo.</b> Die Maintainer haben das Recht anderer Länder nicht geprüft. Die Gemeinschaft um gps-sdr-sim gibt an, dass das Senden seiner Ausgabe in den meisten Ländern gesetzlich verboten ist; behandeln Sie das als Arbeitsannahme, wo ein Rechtsbeistand nichts anderes gesagt hat.

# text
seg-8d31cbd38718 = <b>Ein abgeschirmter oder leitungsgebundener Aufbau ist eine Schutzmaßnahme, keine Erlaubnis.</b> Die Bestätigung unten zeichnet die Schutzmaßnahme auf, die nach Angabe des Betreibers bestand. Sie macht eine Aussendung nicht rechtmäßig.

# text
# c1: iq monitor --follow
seg-7373bfd21035 = <b>Aufzeichnen.</b> Das Aufzeichnen von Funksignalen kann an manchen Orten Fragen zu Datenschutz und Rechtmäßigkeit aufwerfen. <c1/> und jedes Rezept für Aufnahmen sind nur empfangend, und der Betreiber ist dafür verantwortlich, wo und was er aufzeichnet.

# text
seg-2edf9b14e62c = <b>Exportkontrolle.</b> Hardware-in-the-Loop-Software, die Signalgeneratoren ansteuert, kann unter Exportkontrollregeln fallen. Deshalb liegt Stufe { "3" } außerhalb der offenen Engine.

# text
seg-bcd59f201022 = <b>Nichts hier ist eine Befürwortung oder eine Vereinbarung.</b> Keine Regulierungsbehörde, kein Testgelände, kein Labor und kein Hersteller wurde zu diesem Dokument befragt oder hat irgendetwas darin zugestimmt.

# text
# c1: lab-attestation
seg-81091020e648 = Das Feld <c1/>

# text
# c1: lab-attestation
seg-64918fd6895d = Für Stufe { "2" } und höher trägt ein Lauf, an dem Laborausrüstung beteiligt war, ein Objekt <c1/>, im Nachweispaket neben den Hashes der Eingaben aufgezeichnet. Es ist eine Aussage eines benannten Betreibers, keine Messung, und Kshana überprüft sie nicht.

# text
seg-3bf153c63fa3 = Was in { "0.38" } umgesetzt ist:

# text
# c1: kshana receiver-trust evidence ... --lab-attestation <file.toml>
# c2: manifest.json
# c3: lab_attestation
# c4: evidence_create
# c5: lab_attestation_toml
# c6: create_evidence_pack
seg-bf212e141046 = <c1/> validiert die Datei und zeichnet die Bestätigung in der <c2/> des Pakets auf. Das Manifest wird von der Ed25519-Signatur des Pakets abgedeckt, die Aufzeichnung kann also nicht bearbeitet werden, ohne die Verifikation zu brechen. Dasselbe gibt es als Argument <c3/> des Python-<c4/> und als Argument <c5/> des MCP-Werkzeugs <c6/> (der Browser-Build erstellt keine Pakete).

# text
seg-431036f13a37 = Ein Paket, das ohne Bestätigung erstellt wird, ist Byte für Byte so wie zuvor.

# text
# c1: kshana evidence verify
seg-4360b8fbdafb = <c1/> meldet die Bestätigung und sagt „vom benannten Betreiber bestätigt; von Kshana nicht überprüft“.

# text
# c1: setup
# c2: conducted
# c3: shielded
seg-438bbe788314 = Eine Bestätigung, die unvollständig ist oder deren <c1/> weder <c2/> noch <c3/> ist (ein Aufbau über die Luft wird nicht als Laborlauf akzeptiert), wird abgelehnt, und es wird kein Paket erstellt.

# text
seg-c8c40ed88dde = Was <b>noch nicht</b> umgesetzt ist: die Regel der Stufe { "2" }, dass Kshana die <em>Bewertung</em> eines Laborlaufs ohne Bestätigung verweigert. Kein Befehl nimmt in { "0.38" } ein Flag für Laborläufe, also gibt es nichts zu verweigern; die Regel kommt mit den Befehlen zur Laborsteuerung. Eine Bestätigung zeichnet die Aussage des Betreibers zu einer Schutzmaßnahme auf. Sie macht keine Aussendung rechtmäßig und ändert nicht das Label eines Ergebnisses: Ein bewerteter Laborlauf ist MODELLED, solange keine externe Referenz übereinstimmt.

# text
seg-b0db377bce58 = Was das für Mitwirkende bedeutet

# text
seg-c2e215edd86c = Fügen Sie der offenen Engine keinen Sendepfad, keine Sendeabhängigkeit und kein Sendebeispiel hinzu.

# text
seg-452b44a9ca8a = Fügen Sie keinen Wellenformgenerator hinzu, dessen Ausgabe ein Signal für jamming oder spoofing zur Wiedergabe ist.

# text
seg-4df4d15a5f1c = Neue Hardware-Eingaben sind standardmäßig nur lesend; ein Schreibzugriff braucht ein ausdrückliches Flag und eine Zeile in dieser Datei.

# text
# c1: SURFACES.md
seg-ee5f1fa9b822 = Ein neuer Befehl, der Hardware berührt, kommt auf jede Oberfläche oder wird mit einer Begründung in <a1><c1/></a1> als N/A markiert und nennt hier seine Stufe.

# text
seg-7d65c3565acd = <s1>Zurück</s1>Formate für Uhrenlogs

# text
seg-82eb53d4efbd = <s1>Weiter</s1>Integrität und Sicherheit

# text
seg-8a78e520fc9e = Das Feld lab-attestation
