# docs--jammertest: translations (de)

# text
seg-f8cf777c0caa = Oberflächen

# text
seg-45425f378b61 = Bedeutung

# text
# c1: docs/JAMMERTEST.md
seg-9367b8736d36 = Quelle: <c1/>

# text
seg-c2a40cd73d0e = Jammertest-Bewertung: der veröffentlichte Plan als geplante Wahrheit

# text
# c1: kshana jammertest import
# c2: [[events]]
# c3: kshana jammertest score
seg-a560942cbd27 = <c1/> liest den Jammertest-Testkatalog und den Sendeplan und macht aus den Slots eines Testgebiets receiver-trust-<c2/>. <c3/> lässt ein Empfängerprotokoll durch die Vertrauensmonitore laufen und bewertet es Test für Test gegen diesen Zeitplan. Jedes Ergebnis ist <b>MODELLED</b>: Der Zeitplan sagt, wann ein Test <em>geplant</em> war, nicht, wann ein Sender eingeschaltet war.

# text
seg-bc4e7285c38a = Beratende Software, keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich. Nichts hiervon wird von der norwegischen Straßenverwaltung, der Nkom oder den Veranstaltern gebilligt; eine Vereinbarung mit ihnen wird nicht behauptet.

# attr:alt
seg-af0edceb1503 = Bewertung eines synthetischen Empfängerprotokolls gegen einen Zeitplan mit drei Tests, aus einem echten Lauf der Engine v{ $version } (`kshana jammertest score`). Das Protokoll ist erfunden: { "1800" } s NMEA mit einem Abfall von { "20" } dB C/N0 über zwei Intervalle. Der Zeitplan listet drei Slots; im mittleren Slot gibt es im Protokoll keinen Jammer. Die Bewertung markiert { "2" } von { "3" } Tests als erkannt (mediane Latenz { "0" } s) und { "1" } als verpasst, mit { "0" } Fehlalarm-Läufen über { "0.25" } h sauberer Zeit. Nichts hiervon sagt etwas über einen echten Empfänger aus. Beratende Software, keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich.

# text
seg-ceaa46bdcb7e = Der Plan und der Katalog

# text
# c1: NPRA/jammertest-plan
# c2: xval/jammertest-plan/MANIFEST.tsv
seg-73a5899de383 = Quelle: das Repository <c1/> der norwegischen Straßenverwaltung (<a1>https://github.com/NPRA/jammertest-plan</a1>), <b>MIT-Lizenz</b> (Copyright { "2024" } Norwegian Public Roads Administration; der Lizenztext wird in <c2/> geprüft). Die Dateien werden abgerufen, nie mitgeliefert:

# text
# c1: 75c0b2ceea10e470c3799d14a8ef18842d8375a7
# c2: xval/jammertest-plan/MANIFEST.tsv
seg-2a4967d30c3a = Es lädt die Kataloge und die Plandateien von { "2025" } beim festgelegten Commit <c1/> herunter und weist jede Datei zurück, deren SHA-256 von <c2/> abweicht.

# text
# c1: type.group.test
# c2: 1.2.5
# c3: --local-offset-h
seg-7826929c89f6 = Ein Katalogtest hat eine gepunktete Kennung, <c1/> (zum Beispiel <c2/>: Typ { "1" } Jamming, Gruppe { "2" }, Test { "5" }). Der Plan listet je Testgebiet und Zeitslot auf, welche Kennung geplant ist. Die Typen { "1" } (Jamming), { "2" } (Spoofing) und { "3" } (Meaconing) senden; Typ { "0" } (Briefings, Karenzzeit, Buchungs- und Ad-hoc-Slots) tut es nicht und wird übersprungen. Planzeiten sind lokale Uhrzeit; <c3/> (Standard { "2" }, CEST) gibt an, wie weit sie von UTC entfernt sind. Die Plandateien tragen ein Testkontakt-Feld mit dem Namen einer Person: Es wird nie gelesen, und nichts, was daraus abgeleitet ist, wird geschrieben.

# text
seg-3eab33a0c38f = Import

# text
# c1: --log-start <UTC time>
# c2: --log
# c3: --format
# c4: [[events]]
# c5: scheduled truth:
# c6: --attack-log <scenario.json>
# c7: attack_log
# c8: --time-shift-h
# c9: Z
seg-91fddde78691 = <c1/> ersetzt <c2/>/<c3/>, wenn das Protokoll seinen Beginn nicht nennt. Die Ausgabe ist TOML <c4/>, das an ein receiver-trust-Szenario anzuhängen ist; jede Bezeichnung beginnt mit <c5/> und trägt das Jahr der Ausgabe, die Katalogkennung und das Gebiet, und der Kopf hält das SHA-256 jeder Quelldatei fest. <c6/> liest stattdessen die Ereigniswahrheit eines Ordners des Datensatzes JammerTest { "2024" } (sein <c7/>, Zeitstempel verschoben um <c8/>, Standard -2: Sie sagen <c9/>, sind aber Ortszeit).

# text
seg-6ed6415a6f52 = Bewertung

# text
# c1: session.toml
# c2: [log] format/path
# c3: [monitors]
# c4: [compare]
# c5: [[events]]
seg-1e72a977f7ad = <c1/> ist ein receiver-trust-Szenario (<c2/>, optional <c3/>, <c4/>). Seine eigenen <c5/> werden durch den importierten Zeitplan ersetzt. Je geplantem Test:

# text
seg-99427ab75a03 = Feld

# text
# c1: detected
# c2: compare.detect_tol_s
# c3: late
# c4: missed
# c5: not-evaluable
seg-d2681be37798 = <c1/> (ein Alarm innerhalb von <c2/>, Standard { "10" } s, nach dem geplanten Beginn), <c3/> (später, innerhalb des Slots), <c4/> (keiner), <c5/>

# text
seg-01a977f18700 = erster Alarm minus geplanter Beginn

# text
# c1: --recover-hold-s
seg-b83d1f0a1fb7 = vom Slot-Ende bis zum Beginn der ersten Strecke von mindestens <c1/> ({ "10" } s) ohne Alarm, vor dem nächsten Test

# text
# c1: calibration_s + guard_s
# c2: baseline_contaminated
# c3: --guard-s
# c4: --key
# c5: --out
# c6: docs/EVIDENCE-PACKS.md
# c7: config.json
seg-84a34f13e93b = Ein Test ist nur bewertbar, wenn er mindestens <c1/> nach dem Beginn des Protokolls startet; ein Protokoll mit einem früheren Test wird mit <c2/> markiert (die Basislinie wurde möglicherweise unter Störung gebildet). <b>Fehlalarme</b> sind alarmierende Epochen nach der Kalibrierung außerhalb jedes Slots, der um <c3/> ({ "60" } s) davor und danach verlängert ist (oder nach dem Erholungspunkt), gezählt als Epochen und als Läufe, mit Läufen je Stunde sauberer Zeit. Mit <c4/> und <c5/> wird der Lauf als signiertes Nachweispaket geschrieben (<c6/>): Die Auswertungskarte und der importierte Zeitplan liegen in <c7/>, also innerhalb der Hash-Kette und der Signatur. Ein Paket ist ein technischer Nachweis, keine Rechtsauskunft.

# text
seg-382613112d5d = Was ein Ergebnis nicht aussagt

# text
seg-f1cb12a89001 = Ein geplanter Slot ist keine Aufzeichnung der Sendezeit. Ein Sender kann spät begonnen, früh aufgehört oder nie gelaufen sein; ein „missed“-Test kann ein Test sein, der nicht gesendet hat, und eine Latenz wird ab dem geplanten Beginn gerechnet.

# text
seg-32baa4a4b9f0 = Eine „saubere“ Epoche ist „außerhalb der geplanten Slots“, nicht „nachweislich störungsfrei“.

# text
seg-95cc22bbacc5 = Die Erkennung durch Monitore im Messraum sagt nichts über die Erkennung eines kohärenten Spoofers mit geringer Leistung aus.

# text
seg-2e91813cf9d7 = Keine unabhängige externe Referenz gibt die wahren Sendezeiten an, daher ist hier nichts VALIDATED.

# text
seg-cfdf09e38e6e = Der Lauf mit dem Datensatz { "2024" } (vorab registriert)

# text
# c1: xval/jammertest-score/PREREGISTRATION.md
# c2: xval/jammertest-score/RESULTS.md
# c3: .ubx
# c4: PREREGISTRATION-v2.md
# c5: RESULTS-v2.md
# c6: 7
# c7: xval/oracles/setup.sh
# c8: tests/jammertest_score_2024.rs
# c9: KSHANA_JAMMERTEST_DIR
seg-473ed6ca71e5 = <c1/> legte die Population, die Definitionen und die Zielwerte vor dem ersten bewerteten Lauf fest; <c2/> hält diesen Lauf fest. Ergebnis: <b>die registrierte Mindestdatenregel schlug fehl</b> ({ "4" } bewertbare Jamming-Fenster aus { "4" } der { "12" } <c3/>-Ordner: { "5" } Ordner wurden durch die Basislinienregel verworfen, und { "3" } UBX-Protokolle nennen ihren Beginn nur als GPS-Wochenzeit), sodass <b>kein Zielwert beurteilbar ist</b>. Nichts wurde gelockert oder erneut ausgeführt. <b>v2</b> (<c4/>, allein vor seinem Lauf eingecheckt; nur Datenbehandlung, dieselben Zielwerte und dieselbe Mindestdatenregel) ordnete die Protokolle nur mit GPS-Zeit anhand des Ordnerdatums ein, bewertete die { "12" } Ordner nur mit CSV und verwendete für die bewegten Rover eine Sitzung mit bewegter Plattform. Ergebnis (<c5/>): { "14" } von { "24" } Ordnern behalten, aber nur <c6/> bewertbare Jamming-Fenster, sodass die Mindestdatenregel erneut fehlschlug und <b>kein Zielwert beurteilbar ist</b>. Das Ergebnis von v1 bleibt unverändert. Nur beschreibend: { "3" } von { "7" } Jamming-Fenstern lösten innerhalb von { "10" } s Alarm aus, { "4" } später, keines wurde verpasst; mediane Latenz { "18" } s; Alarmrate im sauberen Zeitraum { "0.089" }. Die bindende Grenze ist jetzt die Basislinienregel, die { "10" } Ordner entfernt; eine weitere Registrierung bräuchte für frühe Fenster eine andere Regel. Der Datensatz (JammerTest { "2024" }, Zenodo { "15911589" }, GPL-3.0-or-later) wird von <c7/> abgerufen und nie mitgeliefert; der Test <c8/> legt den aufgezeichneten Lauf fest, wenn <c9/> auf den entpackten Datensatz zeigt.

# text
seg-cd75b60bd0db = Der NMEA-Datensatz { "2025" } von SimulaMet

# text
seg-87bc2544154b = Der aus NMEA abgeleitete Datensatz Jammertest { "2025" } von SimulaMet (IEEE DataPort, DOI 10.21227/a7v4-xw11) ist in { "0.38" } <b>nicht</b> angebunden. Seine Seite nennt keine Lizenz und sagt „This dataset requires an IEEE DataPort Subscription to access“: Die Bedingungen erlauben die Weitergabe oder einen automatisierten Abruf nicht eindeutig, daher wurde kein Adapter und kein Abrufskript geschrieben. Seine Verwendung braucht die Entscheidung des Eigentümers und idealerweise die schriftliche Zustimmung der Autoren.

# text
# c1: kshana::jammertest
# c2: jammertest_import
# c3: jammertest_score
# c4: /kshana-jammertest
# c5: jammertest
# c6: docs/SURFACES.md
seg-aa8d3fe2adf3 = CLI, Rust (<c1/>), Python (<c2/>, <c3/>), WebAssembly (dieselben Namen), MCP-Werkzeuge mit denselben Namen sowie der Befehl <c4/> und der Skill <c5/>. Das signierte Paket gibt es nur auf der Kommandozeile (es braucht einen Signierschlüssel). Siehe <c6/>.

# text
seg-82aab597103a = <s1>Zurück</s1>LunaNet Augmented Forward Signal

# text
seg-fb9e48a04566 = <s1>Weiter</s1>Maschinen- und Sensoreingaben
