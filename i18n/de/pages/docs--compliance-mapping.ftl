# docs--compliance-mapping: translations (de)

# attr:aria-label, text
seg-6555ff9a6d8e = Ausgabe

# text
seg-2247a2344710 = Bedeutung

# text
seg-d6476863f862 = Fähigkeit

# text
seg-ad856ad710eb = Status

# text
seg-8d216d42c776 = Vertrauensbewertung von Empfänger-Logs

# text
seg-ff808ce8ec48 = Alternative und diverse PNT-Quellen

# text
seg-3621a68a508c = Reproduzierbare Herkunft des Laufs

# text
seg-50fe2a3ff712 = Integritätsüberwachung und Schutzniveaus

# text
# c1: docs/compliance/README.md
seg-554a16dc7965 = Quelle: <c1/>

# text
# c1: kshana compliance-report
seg-76db63e8d2de = Käufer und Empfängerhersteller müssen sich an öffentlichen Resilienz-Rahmenwerken messen lassen. Dieser Ordner ordnet zeilenweise zu, was Kshana berechnet und aufzeichnet, und <c1/> füllt die Zuordnung aus den Läufen, die Sie tatsächlich haben.

# text
seg-e22a3aca9550 = <b>Wortlaut.</b> Ausgaben von Kshana <em>liefern Belege für</em> eine Anforderung. Sie sind keine Bewertung oder Zulassung irgendeines Produkts, und keine dieser Dateien ist eine Aussage einer Bewertungsstelle; Kshana ist keine. Anforderungstexte werden paraphrasiert, nie wiedergegeben.

# text
seg-2602c3f5aff6 = Rahmenwerk

# text
seg-245fe1f87b08 = Datei

# text
seg-d104ce416298 = US DHS Resilient PNT Conformance Framework, v2.0

# text
seg-0f7279ffb619 = IMO-Leitlinien zu GNSS-Störungen für Schiffe

# text
seg-f318176b86de = EASA-Leitlinien zu GNSS-Störungen für die Luftfahrt

# text
seg-7939ac1eea3b = EU-Richtlinie NIS2, Artikel { "21" }

# text
seg-f2eccc9b815f = EN { "16803" } (kostenpflichtige Norm; nur nach Teilen und im Katalog sichtbaren Abschnittsnummern)

# text
seg-4970f6c15605 = NIST IR 8323r1, Foundational PNT Profile (Januar { "2023" })

# text
# c1: kshana standards-pack list
seg-499fc17fb83a = <b>Standardpakete</b> ({ "0.38" }) machen aus einem Rahmenwerk bewertete Szenarien: Jedes Paket hat Szenarien, vor dem Lauf festgelegte Zielwerte und Zeilen, für die es Belege liefert. <c1/> zeigt sie.

# text
seg-9c0eb89a2fbe = Paket

# text
seg-191baf9f2738 = DHS Resilient PNT Conformance Framework, Testprofile für die Stufen { "1" } bis { "4" }

# text
seg-13e63b993f26 = IMO MSC.1/Circ.1575, Datenverarbeitung von PNT auf Schiffen: Genauigkeitsstufen und Integrität

# text
seg-aa77ffe0acbf = ICAO Doc { "9849" } Anhang F, GNSS-Störungen überwachen, bewerten und mindern

# text
seg-b9387be0e4f1 = Jede Datei listet ihre Quelldokumente mit Version, URL, Lesedatum und dem auf, was geprüft wurde und was nicht. Die Quellen wurden am 2026-10-09 gelesen (das NIST-Profil am 2026-10-18; das EASA-Bulletin und die Katalogseiten zu EN { "16803" } wurden am 2026-10-10 erneut geprüft). Wo eine Quelle nur über eine Spiegelung oder eine Katalogseite gelesen werden konnte, steht das in der Datei.

# attr:alt
seg-e98e25897176 = Jeder Test der drei bewerteten Standardpakete aus echten Läufen der Engine v{ $version } (`kshana standards-pack run`): dhs-rpcf: { "6" } erreicht, { "1" } nicht erreicht, { "2" } benötigen eine Eingabe; imo-circ-1575: { "1" } erreicht, { "4" } nicht erreicht, { "2" } benötigen eine Eingabe; icao-doc9849-appf: { "6" } erreicht, { "0" } nicht erreicht, { "2" } benötigen eine Eingabe. Insgesamt { "13" } erreicht, { "5" } nicht erreicht und { "6" } benötigen eine Eingabe, die der Engine fehlt (ein Empfängerlog oder Ausrüstungsdokumentation). Jeder Zielwert wurde vor dem Lauf festgelegt; ein Verfehlen bleibt ein Verfehlen. Ein erreichter Zielwert besagt, dass ein modelliertes Szenario einen festgelegten Zielwert erreicht hat, nichts über ein Produkt. Die Pakete liefern Belege für die Zeilen, die sie nennen; sie sind keine Bewertung. Nur beratend: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für Menschenleben (safety of life); sie darf nicht die alleinige Grundlage einer Navigations- oder Sicherheitsentscheidung sein.

# text
seg-092dd691ca17 = Der Bericht

# text
# c1: compliance-report.compliance.md
# c2: compliance-report.compliance.json
# c3: --out <base>
# c4: <name>.result.json
# c5: <name>.toml
# c6: kshana receiver-trust
# c7: kind
# c8: kind
# c9: scenario_hash
seg-10fac3e641e0 = schreibt <c1/> und <c2/> (<c3/> ändert den Namen). Die Eingaben sind Ergebnisdateien früherer Läufe: Ein Szenariolauf schreibt <c4/> neben <c5/>, und <c6/> schreibt seine eigene. Die Art jedes Laufs wird aus der Szenariodatei neben dem Ergebnis, aus dem Inhalt eines receiver-trust-Ergebnisses oder aus einem <c7/> auf oberster Ebene gelesen und muss eine der Engine bekannte Art sein. Ein Ergebnis wird mit Begründung als nicht verwendet aufgeführt und zählt nicht, wenn seine Art nicht gefunden werden kann, keine bekannte Art ist oder das danebenliegende Szenario und das <c8/> des Ergebnisses selbst sich widersprechen. (Der <c9/> des Ergebnisses und ein Hash der Szenariodatei werden nicht verglichen: Die Engine berechnet den ersten über ihr geparstes Szenario, und ein Datei-Hash bezieht sich auf den Text, es sind also verschiedene Größen.)

# text
# c1: jamming
# c2: integrity
# c3: src/compliance/mapping.rs
# c4: KIND_FIELDS
seg-464351dcdcc3 = <b>Ein Art-Label allein ist kein Beleg.</b> Ein Lauf zählt für eine Fähigkeit nur, wenn sein Ergebnis auch die Felder trägt, die diese Art schreibt (zum Beispiel braucht ein <c1/>-Ergebnis seine Gütemaße und Zeilen je Epoche; ein <c2/>-Ergebnis braucht seine Stichprobenzahlen). Die Felder sind in <c3/> (<c4/>) aufgeführt, und ein Ergebnis, dem eines fehlt, wird nicht gezählt. Ein Hash, der nicht hexadezimal ist, wird nicht als Hash ausgewiesen. Ein receiver-trust-Ergebnis, dessen Zahlen keine ganzen Zahlen sind oder dessen Zahl erkannter oder übereinstimmender Fälle die Zahl der auswertbaren übersteigt, wird ausgeschlossen und als nicht verwendet aufgeführt.

# text
seg-5a316d97f37b = Für jede Zeile gibt der Bericht eines der folgenden an:

# text
seg-2243532bd26b = jede Fähigkeit, die die Zeile nennt, hat mindestens einen Lauf in der Menge

# text
seg-e905ae20cec1 = einige haben einen

# text
seg-e23d6dfc4a00 = keine haben einen

# text
seg-cf223ce076ce = keine Ausgabe von Kshana betrifft die Zeile

# text
# c1: --mapping
# c2: --sources
seg-ec76997fb4d4 = Die Lückenspalte wird für jede Zeile ausgegeben, auch für belegte: Ein Lauf, der Belege für eine Fähigkeit liefert, überlässt den größten Teil einer Anforderung dennoch anderen Belegen. Der Bericht wiederholt die Wortlautregel an seinem Anfang. <c1/> gibt die statischen Tabellen aus und <c2/> die Quellenliste.

# text
seg-f1c508a908ad = Receiver-trust-Läufe tragen außerdem die Zahlen bei, die sie angeben (erkannte Ereignisse von den auswertbaren, übereinstimmende Vorhersagen von den auswertbaren). Diese beschreiben dieses Log, bewertet gegen vor dem Lauf festgelegte Ereignisse und Toleranzen, und werden so berichtet, wie der Lauf sie angibt.

# text
seg-662b717575e0 = Laufarten

# text
seg-4377e24c36f5 = Vertrauenszustand je Epoche aus dem eigenen Log eines echten Empfängers, Alarmzeiten und Übereinstimmung mit vor dem Lauf festgelegten Ereignissen

# text
seg-766182e85848 = Auswirkungen von jamming auf die Link-Bilanz

# text
seg-6bee09017be6 = Träger-Rausch-Leistungsdichte und Zustand der Verriegelung je Satellit bei einer angegebenen Geometrie des Störsenders

# text
seg-213117f2877a = jamming, lunar-jamming, conflict-resilience

# text
seg-48fb757a45fc = Erkennung von spoofing und meaconing

# text
seg-2e4a3355a936 = Entscheidungen des Detektors und Trennschärfe des Detektors bei einem angegebenen spoofing-Angriff

# text
seg-6fdf939cef5c = spoof, spoof-detect, impairment-eval

# text
seg-e9a55e5a015b = Schutzniveaus, Verfügbarkeit gegenüber Alarmgrenzen und Ergebnisse der Fehlererkennung

# text
seg-8799ac418ef0 = integrity, araim-reference-check, lunar-integrity

# text
seg-6344bf03463c = Holdover und Überbrückung

# text
seg-a643345646c3 = Zunahme des Positions- oder Zeitfehlers, während GNSS verwehrt ist, gegenüber einem angegebenen Schwellwert

# text
seg-7483fbb49a12 = clock, inertial, gnss-ins, ins-trn-coast, hybrid, hybrid-ukf, fusion, timetransfer, quantum-gnss-free-nav, quantum-time-transfer

# text
seg-97e06c8a9b7f = Navigations- oder Zeitgebungsleistung aus Quellen, die vom primären GNSS-Band unabhängig sind

# text
seg-0cb972a92a4c = combined-altpnt, terrain-nav, terrain-slam, gravity-map, leo-pass, leo-pvt, leo-pnt-chain, hybrid-optical-rf, ntn-positioning, hybrid, fusion

# text
seg-25291db2798d = Resilienzbewertung über Bedrohungsensembles

# text
seg-9eef8dd0d9b9 = Überlebens- und Resilienzverhältnisse je Bedrohungsvektor über ein angegebenes Ensemble, mit angegebenen Annahmen

# text
seg-bdaa039247bd = conflict-resilience, campaign

# text
seg-e4be26a0cc63 = Szenario-Hash, Engine-Version und Seed, die in jedem Ergebnis stehen, damit ein Lauf wiederholt werden kann

# text
# c1: scenario_hash
seg-89edc36c3560 = jeder Lauf, dessen Ergebnis einen <c1/> trägt

# text
seg-488aeabdc552 = <s1>Zurück</s1>Einen Empfänger gegen ein Szenario laufen lassen

# text
seg-53a872636d5a = <s1>Weiter</s1>Rahmenwerk des US DHS für resiliente PNT
