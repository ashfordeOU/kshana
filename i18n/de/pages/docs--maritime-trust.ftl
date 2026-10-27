# docs--maritime-trust: translations (de)

# text
seg-2247a2344710 = Bedeutung

# text
seg-6940543aa3c0 = Zeichenfolge

# text
seg-abec93a4a488 = Zeichenfolge oder null

# text
seg-f5e7215e6835 = Objekt

# text
seg-b993ef559bd0 = Aus dem Code

# text
seg-c353e7bec219 = Schlüssel

# text
# c1: calibrating
# c2: nominal
# c3: degraded
# c4: untrusted
seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> oder <c4/>

# text
# c1: docs/MARITIME-TRUST.md
seg-2896f449bffb = Quelle: <c1/>

# text
seg-342f34403ac5 = Maritimes Vertrauen: Kann die Brücke dieser Lösung vertrauen?

# text
# c1: kshana receiver-trust
seg-49b609a9655c = <c1/> kann für ein <b>fahrendes Schiff</b> für jede Positionslösung einen laufenden Vertrauenswert von 0-100 berechnen, aus dem, was jeder Empfänger ohnehin auf den Bus legt (zuerst NMEA { "0183" }), und angeben, welche Prüfungen ihn gesenkt haben. Es ist eine Softwareschicht, die neben einem Empfänger sitzt. Es ist kein Empfänger, es ersetzt keinen, und es macht eine Lösung nicht genauer.

# text
seg-3c66739c9250 = <b>Beratende Software.</b> Kshana ist keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }) und wurde an keinem Leistungsstandard bewertet. Sein Wert und sein Gate sind Hilfen für das Urteil des Navigators. Der Betreiber bleibt für die sichere Navigation des Schiffes und für jede Entscheidung verantwortlich, sich auf eine Lösung zu verlassen oder sich nicht mehr auf sie zu verlassen.

# text
# c1: RECEIVER-TRUST.md
seg-a9899ca66661 = Diese Seite sagt, worauf die Prüfungen schauen, was jede erfassen kann und was nicht, wie man sie live ausführt und was das Gate tut. Die Wertzuordnung und jeder Standardwert stehen in <a1><c1/></a1>.

# text
seg-05e79b6c5a58 = Was gelesen wird

# text
seg-e784fdbe26e6 = Ein Schiff wird in der Sitzungsdatei deklariert, mit seinen vor dem Lauf angegebenen Grenzen:

# text
seg-e8e9ee2965cf = Satz

# text
seg-e127f2f26824 = Gelesen

# text
seg-5e17bb4156f1 = GGA

# text
seg-b38b8385ddcb = Position, Lösungsqualität ({ "0" } = keine Lösung), Höhe über dem mittleren Meeresspiegel, Geoidabstand, HDOP

# text
seg-870056f55c30 = RMC

# text
# c1: A
# c2: V
seg-445c02505551 = Status (<c1/> gültig, <c2/> nicht), Geschwindigkeit und Kurs über Grund, Datum, Modus

# text
seg-8a259fc7b06d = VTG

# text
seg-eb3e34f58751 = Geschwindigkeit und Kurs über Grund, wo RMC keine hat

# text
seg-add66711c27b = HDT, THS

# text
# c1: V
seg-24e36e50b0ad = Steuerkurs (THS nur, wenn sein Modus nicht <c1/> ist)

# text
seg-bcfb4cd59951 = VHW, VBW

# text
# c1: A
seg-fa0a0dae1510 = Fahrt durch das Wasser (VBW nur, wenn sein Status <c1/> ist)

# text
seg-774d1991fb0b = ZDA

# text
seg-68d981999c72 = Zeit

# text
seg-a0cc45088f5f = GSV

# text
seg-0fad368a11cb = Signalstärke je Satellit (dB-Hz), Elevation und Azimut (für die Geometrie)

# text
seg-032eafc03b42 = GSA

# text
seg-71334afb8a7d = Dilution of Precision und verwendete Satelliten (für die Geometrie, wo GSV keinen Himmel liefert; und der angegebene HDOP, den die Schutzprüfung vergleicht)

# text
# c1: A
# c2: F
# c3: N
seg-305f423d3ead = ein von einem Empfänger gemeldeter OSNMA-Status, vom Adapter, der den Empfänger liest, in diesen Satz übersetzt: <c1/> authentifiziert, <c2/> fehlgeschlagen, <c3/> kein Ergebnis

# text
# c1: V
# c2: E
# c3: M
# c4: S
# c5: N
seg-7ce1d69e710e = Epochen, die der Empfänger selbst als keine Satellitenlösung bezeichnet (GGA-Qualität { "0" } oder { "6" } bis { "8" }: geschätzt, manuell, Simulator; RMC-Status <c1/> oder Modus <c2/>, <c3/>, <c4/>, <c5/>), werden für die Positionsprüfungen nicht verwendet und tragen in keine Richtung Evidenz: Der Empfänger hat es bereits gesagt.

# text
# c1: calibration_s
seg-a0ae80781c6e = Die ersten <c1/> Sekunden bilden die Basislinie und werden nie bewertet. Jeder Monitor schaut nur auf die aktuelle und die früheren Epochen, sodass sich eine Entscheidung bei einer Epoche nicht ändert, wenn spätere Daten eintreffen, und ein Live-Strom denselben Wert liefert wie derselbe als Datei gelesene Text.

# text
seg-068593ad0a52 = Was jede Prüfung erfasst und was nicht

# text
seg-094b90f0c701 = Richtungen zwischen Lösungen (die Spurpeilung, die die Drehraten-Prüfung verwendet, der Kurs, der sich aus zwei Positionen ergibt) sind die Richtung der Sehne zwischen ihnen, also das <b>mittlere Azimut</b> der Geodäte zwischen den Lösungen, nicht das Vorwärtsazimut an der ersten Lösung; die beiden unterscheiden sich um etwa die Hälfte der Meridiankonvergenz zwischen den Lösungen ({ "0.001" } Grad bei einer Basislinie von { "260" } m auf { "59.5" } Grad Breite).

# text
seg-ed3cdfcfbff5 = Eine gefälschte Position muss mit der Physik eines Schiffes und mit den anderen Sensoren des Schiffes übereinstimmen. Jede Prüfung vergleicht die Lösung mit einem davon. Eine Prüfung ist nur so unabhängig wie ihre andere Quelle: Ein Steuerkurs von einem GNSS-Kompass oder eine "Fahrt durch das Wasser", die aus GNSS abgeleitet ist, ist vom geprüften Empfänger nicht unabhängig und trägt nichts bei.

# text
seg-9480aabf136e = Prüfung

# text
seg-20e4f746c7e1 = Erfasst

# text
seg-e7b2ebe5eabc = Nicht erfassbar

# text
seg-21ad9895f606 = einen Positionssprung; eine Spur, deren Bewegung die gemeldete Geschwindigkeit und der gemeldete Kurs nicht erklären; eine abgeleitete Geschwindigkeit, Beschleunigung oder Drehrate über den angegebenen Schiffsgrenzen

# text
seg-dcbc6d4cd17f = ein Wegziehen, dessen gemeldete Geschwindigkeit und gemeldeter Kurs der gefälschten Spur folgen und innerhalb der Grenzen bleiben (der Empfänger leitet sie aus seiner eigenen Lösung ab, sodass sie miteinander übereinstimmen); eine zu hoch angegebene Geschwindigkeitsgrenze

# text
seg-3542f83a7988 = eine Spur, die um mehr als den angegebenen Vorhaltewinkel davon abweicht, wohin das Schiff zeigt

# text
# c1: min_speed_kn
seg-75f4d659f716 = ein Wegziehen entlang des Kurses (der Kurs ändert sich nicht); einen Steuerkurs vom selben Empfänger oder von einem GNSS-Kompass; einen Querversatz über der Toleranz (Fehlalarm); Geschwindigkeiten unter <c1/>

# text
seg-09dde82be447 = ein Wegziehen, das die Geschwindigkeit über Grund gegenüber der Fahrt durch das Wasser verändert

# text
seg-6ac740e5f51c = ein Log, das aus GNSS abgeleitet ist; eine Strömung über dem Zulässigen (Fehlalarm); ein Wegziehen, das langsamer ist als das Zulässige

# text
seg-e85d5f0933b7 = eine Höhe, die nicht dort liegt, wo die Meeresoberfläche und die angegebene Antennenhöhe sie hinlegen

# text
seg-3806e1d46332 = einen Spoofer, der die Höhe plausibel hält; die Toleranz ist weit, weil der vertikale Fehler im Alleinbetrieb groß ist; der Geoidabstand wird aufgezeichnet, aber nicht geprüft, weil die Engine kein Geoidmodell hat

# text
seg-5b70bd80640e = die Signatur eines einzelnen Senders: C/N0 über die Satelliten hinweg, das gemeinsam einbricht oder gemeinsam steigt, gegenüber der Kalibrierungs-Basislinie

# text
seg-e6874a8047b1 = einen Spoofer, der die Leistung je Satellit formt; irgendetwas, solange die Basislinie selbst gespooft ist; eine GSV-Taktung, die zu langsam ist, um zu folgen

# text
seg-371b17ce936a = die Zeit des Empfängers, die unregelmäßig springt oder rückwärts läuft; gegenüber der Uhr dieses Rechners die Zeit des Empfängers, die von ihr abdriftet (nur Echtzeitströme)

# text
seg-026479cb7966 = eine gefälschte Zeit, die konsistent und stetig ist; eine Uhr, die von Anfang an falsch geht

# text
seg-906ab911b73d = einen gemeldeten Fehlschlag der OSNMA-Authentifizierung

# text
seg-a04757b7ae57 = der Status wird gelesen, nicht verifiziert; ein Spoofer, der die Meldung unterdrückt, wird nicht gesehen

# text
seg-c36c24a337b8 = Leistungsverweigerung und Verlust von Satelliten, wie im statischen Fall

# text
seg-940b39a3988a = sie sagen, dass die Umgebung feindlich ist, nicht dass die Lösung falsch ist

# text
seg-9d751e1f5938 = <b>Was reine NMEA-Monitore nicht können.</b> Ein Spoofer, der die gesamte Konstellation mit einer in sich stimmigen Position, Geschwindigkeit, einem mit dem Steuerkurs verträglichen Kurs, plausibler Leistung je Satellit und einer passenden Uhr reproduziert, ist für jede obige Prüfung unsichtbar: Nichts in den Sätzen unterscheidet seine Lösung von einer echten. Ebenso wenig ein Replay aufgezeichneter echter Signale. Authentifizierung (OSNMA oder ein Empfänger mit eigener Anti-Spoofing-Funktion) und unabhängige Navigationssensoren schließen diese Lücke; diese Schicht kann nur deren gemeldeten Status verwenden. Ein Strom, der bereits gespooft wird, während sich die Basislinie bildet, hat keine saubere Basislinie. Das Ausbleiben eines Alarms ist kein Beleg für eine gute Lösung.

# text
seg-e3e09e2412fb = Vertrauenswert

# text
# c1: nominal
# c2: degraded
# c3: untrusted
# c4: RECEIVER-TRUST.md
seg-a1c05079de2f = Jede Epoche nach der Kalibrierung erhält einen Wert von { "0" } bis { "100" } und die Gründe, warum er nicht { "100" } ist: welche Prüfungen abgezogen haben, ihre Statistik gegenüber dem Schwellenwert und ihre Punkte. Bänder (Grenzen in der Sitzung angegeben): <c1/> ab { "90" }, <c2/> ab { "55" }, <c3/> darunter. Die Zuordnung, jedes Gewicht und sein Grund stehen in <a1><c4/></a1>; sie ist deterministisch und vor der Bewertung eines Logs festgelegt, ohne Lernen und ohne etwas, das an Ereignisse angepasst wäre.

# text
# c1: advisory
# c2: #
# c3: <desc>
# c4: session.result.json
# c5: session.trust.csv
# c6: score
# c7: score_reasons
# c8: session.trust.svg
seg-d56822e82e3d = Jede Schiffsausgabe trägt die Hinweisaussage: den Schlüssel <c1/> des Ergebnis-JSON und jeder Live-Zeile, eine erste Kommentarzeile <c2/> der CSV (Leser überspringen sie mit ihrer Kommentaroption), das <c3/> und eine Fußzeile der SVG. Ausgaben eines Batch-Laufs: <c4/> (mit dem Wertmodell und den Abzügen jeder Epoche), <c5/> (mit den Spalten <c6/> und <c7/>) und <c8/>, das für ein Schiff die vom Empfänger gemeldete Spur ist, nach Vertrauensband gefärbt, über dem Wert über der Zeit.

# text
seg-918516588036 = Eine synthetische Demo

# text
# c1: examples/maritime-trust/
# c2: session.toml
seg-e6717d346ca6 = <c1/> enthält ein erfundenes NMEA-Log einer Fähre auf einer Route von Tallinn nach Helsinki (ein Auszug von 50 Minuten, etwa { "17" } kn, { "1" } Hz: GGA, RMC, VTG, ein Gyro-Steuerkurs, ein Fahrtlog, GSV mit einem plausiblen Himmel), in dem ein Wegziehen der Position die <em>gemeldete</em> Position ab { "1500" } s von der echten des Schiffes entfernt. Der Empfänger meldet durchgehend eine <b>gültige</b> Lösung; es ist der Vertrauenswert, der fällt, durch das Band degraded in das Band untrusted. <c2/> gibt vor dem Lauf jeden Schwellenwert, die Grenzen des Schiffes und jedes Wertgewicht an.

# text
# c1: cargo run --example gen_maritime_trust_demo
# c2: tests/receiver_trust_maritime_demo.rs
seg-b2f24e5091d0 = Das Log ist ein <b>in eine Datei geschriebener Text</b> von <c1/>: Es modelliert kein Funksignal und sendet nichts. Es ist keine Messung, und die Route ist illustrativ, keine Seekarte. <c2/> legt das Log und die erwartete Ausgabe als Regressionswächter auf den synthetischen Daten fest; sie sagen nichts darüber aus, wie sich ein Monitor bei echter Störung schlägt.

# attr:alt
seg-26ab8544afba = Vertrauenswert über eine synthetische Passage, aus einem echten Lauf der Engine v{ $version } auf examples/maritime-trust (ein erfundenes NMEA-Log einer Fähre auf einer Route von Tallinn nach Helsinki, { "3001" } Epochen bei { "1" } Hz). Drei Spuren teilen sich eine Zeitachse. Oben: der Abstand zwischen der vom Empfänger gemeldeten Position und der echten Position des Schiffes, der bis etwa { "1576" } s innerhalb weniger Meter bleibt, als das skriptgesteuerte Wegziehen der Position des Logs ihn vergrößert, während der Empfänger weiter eine gültige Lösung meldet. Mitte: der Vertrauenswert von { "0" } bis { "100" }, während der ersten { "300" } s der Kalibrierung nicht berechnet, im Band nominal (mindestens { "90" }) bis zum Wegziehen, dann durch das Band degraded (mindestens { "55" }) in das Band untrusted fallend. Unten: das Band jeder Epoche als farbiges Band mit seinem Namen. Der Wert ist beratend. Beratende Software, keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich. Das Log ist erfunden, um das Format und die Monitore zu zeigen; es ist keine Messung und sagt nichts darüber aus, wie sich irgendein Empfänger schlagen würde.

# text
# c1: tools/gen_readme_assets.py
# c2: kshana receiver-trust examples/maritime-trust/session.toml
seg-ed183c325c7e = Die Abbildung wird von <c1/> aus einem echten Lauf dieser Demo gezeichnet (<c2/>); der Wert ist beratend, und das Log ist erfunden.

# text
seg-8badaf0d8586 = Spezifikation der Studio-Ansicht

# text
seg-588092535a89 = Für alle, die die Studio-Ansicht eines Schiffslaufs bauen. Nichts in diesem Abschnitt ist im Studio bereits implementiert; die Engine-Seite (die Daten unten) ist es.

# text
seg-5c34f31acf1d = <b>Eingaben.</b> Eine von beiden:

# text
# c1: kshana receiver-trust <session.toml>
# c2: receiver_trust(toml)
# c3: score_model
# c4: monitors_run
# c5: states
# c6: epochs[]
# c7: t_s
# c8: state
# c9: alarms
# c10: score.{score,band,deductions[]}
# c11: marine.{position:[lat,lon], stats, ratios}
# c12: geometry
# c13: class
# c14: geometry_model
# c15: geometry_summary
seg-57ca6d9000b1 = das Ergebnis-JSON eines Batch-Laufs (<c1/> oder dasselbe über <c2/> im WebAssembly-Paket mit dem Log inline): <c3/> (Bandgrenzen, Rampe, Evidenz-Haltezeit, jedes Gewicht), <c4/>, <c5/> und <c6/>, jeweils mit <c7/>, <c8/>, <c9/>, <c10/>, <c11/> und ab { "0.36" } <c12/> und der <c13/> jedes Abzugs, mit <c14/> und <c15/> auf oberster Ebene; oder

# text
# c1: position
seg-bfab64386b6c = die Live-JSON-Zeilen (Schema oben), ein Objekt je Epoche, angehängt, während der Strom läuft. Jede Zeile trägt die vom Empfänger gemeldete <c1/> (Schema { "1.1" }).

# text
# c1: examples/maritime-trust/
# c2: session.toml
# c3: tallinn-helsinki.nmea
# c4: tallinn-helsinki.truth.csv
# c5: t_s,true_lat_deg,true_lon_deg
seg-f7c7462d315e = Der Demo-Satz ist <c1/>: <c2/>, <c3/> (das Log) und <c4/> (<c5/>: wo das Schiff wirklich war, was kein echtes Log hat). Eine Ansicht sollte die Sitzung ausführen und die Wahrheitsdatei daneben lesen.

# text
seg-c015c26cf30a = Was zu zeichnen ist.

# text
seg-92f452bdbed6 = <em>Spur</em>, Norden oben, ein Maßstab auf beiden Achsen: die vom Empfänger gemeldeten Positionen als Linie, gefärbt nach dem Band der Epoche (grau calibrating, grün nominal, bernstein degraded, rot untrusted), Anfang und Ende markiert, ein Maßstabsbalken. Für die Demo die wahre Spur als dünne neutrale Linie darunter, sodass sich das Wegziehen als Auseinanderlaufen der beiden zeigt; ein Schalter für die wahre Spur und eine Anzeige des Versatzes in Metern zur Zeit des Cursors.

# text
# c1: nominal_min
# c2: degraded_min
# c3: score_model
seg-3ba328e2188c = <em>Wertverlauf</em>: der Wert von { "0" } bis { "100" } über der Zeit, die Bandgrenzen (<c1/>, <c2/> aus <c3/>) als gestrichelte Linien, das Band als Streifen darunter und der Beginn jedes angegebenen Ereignisses als Markierung. Die Zeitachse wird mit der Spur geteilt.

# text
# c1: score_model.weights
# c2: monitors_run
# c3: geometry
# c4: score_model.weights
# c5: geometry_model.cap_in_force
seg-33447da1d56d = <em>Gründe</em>: für die Epoche unter dem Cursor die Abzüge (Monitor, Verhältnis zum Schwellenwert, Punkte) als waagerechte Balken, größte zuerst, mit dem Gewicht, das jeder Monitor aus <c1/> trägt; Monitore, die liefen und nichts kosteten, blass dargestellt, Monitore, die nicht liefen (nicht in <c2/>), als "not run" aufgeführt, nie als bestanden. Der Monitor <c3/> hat keinen Eintrag in <c4/>: Seine Obergrenze ist <c5/>.

# text
# c1: monitors_run
seg-d0379b68ea67 = <em>Monitorstreifen</em>: ein dünner Streifen je Monitor in <c1/>, der sein Verhältnis über der Zeit zeigt (Alarm bei { "1" }), sodass ein Leser sieht, welche Prüfung sich zuerst bewegte.

# text
# c1: gate
# c2: off
# c3: passed
# c4: withheld
# c5: $PKSHT
seg-83d881ce6ab0 = <em>Gate-Zustand</em>: in einer Live-Ansicht das <c1/> jeder Epoche (<c2/>, <c3/>, <c4/>) als Streifen unter dem Bandstreifen und das jeweils letzte <c5/>. In einer Batch-Ansicht sind die Epochen, die ein Gate zurückgehalten hätte, jene, deren Band untrusted ist, mit angewandter Freigabe-Haltezeit.

# text
# c1: geometry.status
# c2: class
# c3: geometry_summary
# c4: geometry.note
# c5: n_used
# c6: source
# c7: age_s
# c8: reported_derived_mismatch
# c9: unknown
# c10: [geometry]
# c11: geometry_model
seg-b96652af3a03 = <em>Geometriespur</em> ({ "0.36" }): ein Streifen unter dem Bandstreifen, gefärbt nach <c1/> (grün gut, bernstein degraded, grau schraffiert unbekannt), in einer Farbfamilie, die sich von den Spuren für Inkonsistenz und Umgebung unterscheidet, mit der Legende "geometry: the sky, not the signal". Abzüge, gefärbt nach <c2/> (geometry, environment, inconsistency) im Gründe-Panel und in den Monitorstreifen, und die Epochenzahlen je Klasse aus <c3/> neben den Bandzählungen. Für die Epoche unter dem Cursor: <c4/>, <c5/>, HDOP, PDOP, VDOP, <c6/>, <c7/> und eine Markierung, wenn <c8/> gesetzt ist (der Geometrie-Abzug ist dann eine Inkonsistenz). <c9/> wird als "geometry unknown: no GSV or GSA in the log" gezeigt, nie als gut. Die Schwellenwerte <c10/> und ihre Herkunft aus <c11/> stehen neben den Wert-Einstellungen. Der beratende Hinweis bleibt.

# text
seg-c48906d03f90 = <em>Vom Empfänger gemeldete Lösung</em>: Der Empfänger der Demo meldet durchgehend eine gültige Lösung (GGA-Qualität { "1" }, RMC-Status A); sagen Sie das in der Legende, denn das ist der Sinn der Ansicht.

# text
seg-869c8a92e2cf = <b>Interaktionen.</b> Ein Zeitcursor, den jedes Panel teilt (Ziehen, Pfeiltasten und eine Abspieltaste, die mit 1x bis 60x wiedergibt); das Überfahren der Spur oder eines Streifens bewegt ihn. Ein Klick auf einen Abzug hebt die Epochen hervor, in denen dieser Monitor über seinem Einsatzpunkt lag. Ein Bandfilter (nur Epochen mit degraded und untrusted zeigen) und ein Sprung zum ersten Abzug und zur ersten Epoche mit untrusted. Hover-Text an jedem Monitornamen mit der einzeiligen Beschreibung von dieser Seite. Die Schwellenwerte und Gewichte der Sitzung werden nur lesend neben dem Diagramm gezeigt, sodass auf dem Bildschirm steht, was der Wert verwendet hat.

# text
seg-1f97fe8ea2f1 = <b>Wortlaut, der zu bewahren ist.</b> Die Seite muss sagen, dass sie beratende Software und keine typzugelassene Navigationsausrüstung ist, dass die Demo synthetischer Text mit einem erfundenen Wegziehen ist und dass eine Lösung ohne Alarm dadurch keine gute Lösung ist (siehe die Grenzen oben). Keine Zahl auf der Seite sollte als Maß dafür gelesen werden, wie sich die Prüfungen bei echter Störung schlagen.

# text
# c1: kshana::receiver_trust::assess
seg-079ce44fd53e = Für Aufrufer, die die Sitzung und die Bytes im Speicher halten (keine Dateien, keine Uhr, keine Sockets; sicher für WebAssembly), hat <c1/>:

# text
# c1: assess_vessel_log(session_toml, log_bytes) -> Result<ReceiverTrustResult, String>
# c2: kshana receiver-trust <session.toml>
# c3: score_model
# c4: monitors_run
# c5: epochs[]
seg-e8c3172d72b8 = <c1/>: ein ganzes Log, als Batch-Lauf bewertet; dasselbe Ergebnis wie <c2/>, das zum Ergebnis-JSON serialisiert (<c3/>, <c4/>, <c5/> mit Werten und Abzügen).

# text
# c1: assess_stream_excerpt(session_toml, excerpt_bytes) -> Result<ExcerptAssessment, String>
# c2: epochs[]
# c3: $PKSHT
seg-0302b7c35fd3 = <c1/>: ein begrenzter Teil eines Stroms (höchstens { "2" } MiB und { "20,000" } Epochen, und lang genug, um das Kalibrierungsfenster zu fassen), so bewertet, wie der Live-Modus bewertet, und im Live-JSON-Zeilen-Schema zurückgegeben (<c2/>, das letzte <c3/>, eine Zusammenfassung der Bandzählungen, niedrigster und letzter Wert, erste Zeit mit untrusted). Die Zeit des Empfängers wird nicht mit einer Host-Uhr verglichen. Der lang laufende Live-Modus (Sockets, eine Datei, an die angehängt wird, das Gate) gehört der Binärdatei.

# text
# c1: [platform] kind = "vessel"
# c2: [log]
seg-d971dae93784 = Beide brauchen eine Sitzung mit <c1/>; ihre Tabelle <c2/> ist optional.

# text
seg-870fece8026e = Live ausführen

# text
# c1: session.toml
# c2: [platform]
# c3: kind = "vessel"
# c4: [log]
# c5: stty
# c6: cat
seg-c132d449414f = Die Sitzung ist dieselbe <c1/> wie bei einem Batch-Lauf, mit einer Tabelle <c2/>, die <c3/> deklariert; ihre Tabelle <c4/> wird nicht gebraucht. Serielle Ports werden noch nicht direkt geöffnet: Lesen Sie den Port mit dem Werkzeug, das Sie bereits verwenden (<c5/> und <c6/>, ein Terminalserver, ein Multiplexer), und leiten Sie ihn per Pipe oder Weiterleitung weiter. Direkte serielle Eingabe kann später kommen.

# text
seg-13a043c1ce60 = Jede abgeschlossene Epoche schreibt eine JSON-Zeile auf stdout:

# text
# c1: state
# c2: calibrating
# c3: nominal
# c4: degraded
# c5: untrusted
# c6: [score]
# c7: score
# c8: deductions
seg-b1f0c563c94d = <c1/> ist <c2/>, <c3/>, <c4/> oder <c5/> (das Band des Werts, mit den Grenzen in der Tabelle <c6/> der Sitzung); <c7/> fehlt während der Kalibrierung; <c8/> listet auf, welche Prüfungen Punkte abgezogen haben und wie viele, größte zuerst.

# text
seg-9b21238a7dc1 = JSON-Lines-Schema (Version { "1.1" })

# text
seg-79306ff2d878 = Ein JSON-Objekt je abgeschlossener Epoche, Schlüssel in dieser Reihenfolge:

# text
seg-a129b9e613d0 = Typ

# text
seg-bbcdd898d24d = Ganzzahl

# text
seg-96958263575f = Anzahl der gemeldeten Epochen, ab { "1" }

# text
seg-16022703e1c0 = Zahl

# text
seg-95dde7698840 = Sekunden seit der ersten Epoche des Stroms

# text
# c1: hh:mm:ss.mmm UTC (date not in log)
seg-dee4f7b91079 = die Zeit der Epoche, wie der Strom sie angibt (ISO-8601 UTC mit einem Datum, sobald ein RMC gesehen wurde, sonst <c1/>)

# text
seg-0361f40a8e59 = Zahl oder null

# text
# c1: note
seg-c2418289d966 = { "0" } bis { "100" }, eine Dezimalstelle; null während der Kalibrierung oder wenn <c1/> sagt, warum keiner erzeugt werden konnte

# text
seg-00575e5df2e1 = Array

# text
# c1: {"monitor": string, "ratio": number, "points": number, "class": string}
# c2: ratio
# c3: class
# c4: geometry
# c5: environment
# c6: inconsistency
seg-54c1f879643b = <c1/>, größte Punkte zuerst; <c2/> ist die Statistik über dem Schwellenwert (Alarm ab { "1" }); nur Monitore, die Punkte gekostet haben, werden aufgeführt; <c3/> <em>(hinzugefügt in { "1.3" })</em> ist <c4/>, <c5/> oder <c6/>

# text
seg-24d178dfb34f = Array von Strings

# text
seg-30948e769405 = Monitore auf oder über ihrem Schwellenwert

# text
# c1: off
# c2: passed
# c3: withheld
seg-fb08af60656f = <c1/>, <c2/> oder <c3/>

# text
seg-495aa49df7e2 = warum kein Wert erzeugt wurde (zum Beispiel ein deklarierter Steuerkurssensor, der fehlt)

# text
seg-3dabfd59cf4b = Objekt oder null

# text
# c1: {"lat_deg", "lon_deg", "height_m"}
seg-9395d2543ac0 = <em>(hinzugefügt in { "1.1" })</em> die Position, die der Empfänger in dieser Epoche gemeldet hat, <c1/> (Höhe ellipsoidisch, wo der Satz den Geoidabstand angibt, sonst über dem mittleren Meeresspiegel); null, wenn der Empfänger keine geliefert hat, einschließlich Kalibrierungsepochen ohne Lösung

# text
seg-3af4806d7d74 = <em>(hinzugefügt in { "1.2" })</em> was diese Software ist und was nicht: beratend, keine typzugelassene Navigationsausrüstung, der Betreiber bleibt verantwortlich

# text
# c1: status
# c2: good
# c3: degraded
# c4: unknown
# c5: reasons
# c6: few-satellites
# c7: high-pdop
# c8: high-hdop
# c9: sky-blocked
# c10: source
# c11: derived
# c12: reported
# c13: none
# c14: n_used
# c15: hdop
# c16: pdop
# c17: vdop
# c18: open_fraction
# c19: max_azimuth_gap_deg
# c20: age_s
# c21: reported_hdop
# c22: reported_derived_mismatch
# c23: note
# c24: in_view
# c25: signal_loss
# c26: environment
# c27: label
# c28: good
# c29: fair
# c30: poor
# c31: unknown
# c32: poor
# c33: RECEIVER-TRUST.md
seg-79adcc5ee873 = <em>(hinzugefügt in { "1.3" })</em> die Satellitengeometrie: <c1/> (<c2/>, <c3/>, <c4/>, wenn der Strom keine GSV-Elevationen und -Azimute und kein GSA hat), <c5/> (<c6/>, <c7/>, <c8/>, <c9/>), <c10/> (<c11/>, <c12/>, <c13/>), <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/> (Satelliten in Sicht, aber nicht verfolgt, während das DOP in Sicht gut ist: Der Geometrie-Abzug ist dann <c26/>), <c27/> (<c28/>, <c29/>, <c30/>, <c31/>: immer gemeldet, nie bewertet; der Wert zieht nur für <c32/> ab) (siehe <a1><c33/></a1>)

# text
# c1: cn0-drop
# c2: agc
# c3: jam-ind
# c4: loss-of-lock
# c5: position-jump
# c6: raim
# c7: clock
# c8: solve-failure
# c9: kinematic
# c10: heading-course
# c11: speed-log
# c12: sea-level
# c13: cn0-spread
# c14: cn0-rise
# c15: time-consistency
# c16: osnma
# c17: geometry
# c18: $PKSHT
# c19: position
# c20: advisory
# c21: geometry
# c22: class
seg-fc212411bf3c = Monitornamen (Kebab-Case; { "17" }): <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/> und ab { "1.3" } <c17/>. In späteren Versionen können neue Namen hinzukommen; Verbraucher sollten einen unbekannten Monitornamen als Monitor behandeln. Das unten stehende Layout <c18/> trägt in seinem ersten Feld eine Formatversion; dieses JSON-Schema hat die Version { "1.3" }: { "1.1" } fügte <c19/> hinzu, { "1.2" } <c20/>, { "1.3" } <c21/> am Ende und <c22/> in jedem Abzug, und es ändert sich nur durch Hinzufügen von Schlüsseln am Ende.

# text
seg-0019bf7fbfcd = Authentifizierungseingabe

# text
# c1: osnma
# c2: MarineObs::sat_auth
# c3: (satellite, status)
# c4: Authenticated
# c5: Failed
# c6: Unavailable
# c7: MarineObs::osnma
# c8: $PKSOS,<A|F|N>[,<sat>:<A|F|N>...]
# c9: $PKSOS,A,E11:A,E19:F
seg-39b3dfbd97cc = Der Monitor <c1/> nimmt den Authentifizierungsstatus je Satellit von einer Authentifizierungsquelle über <c2/> (eine Liste von <c3/>, Status <c4/>, <c5/> oder <c6/>), neben dem Gesamtwert <c7/>. Auf der NMEA-Seite wird dasselbe durch <c8/> getragen, zum Beispiel <c9/>. Jeder Fehlschlag, insgesamt oder bei einem Satelliten, löst den Alarm des Monitors aus und kostet sein ganzes Gewicht (er erhält das Verhältnis { "1.5" }); ein Erfolg ist kein Beleg. Kshana verifiziert hier nichts: Die Quelle, die es tut, ist für den Status verantwortlich, den sie meldet.

# text
# c1: [live] idle_flush_s
# c2: calibration_s
# c3: time-consistency
# c4: calibration_s
seg-8ffc94901796 = Eine Epoche ist abgeschlossen, wenn der nächste zeitgestempelte Satz eintrifft; Sätze langsamerer oder unsynchronisierter Instrumente (ein Gyroskop, das einige Zehntelsekunden hinter dem Empfänger liegt), die vorher eintreffen, gehören zu ihr. Stockt der Strom für <c1/> (Standard { "1.5" } s, setzen Sie es über die längste Lücke zwischen den zeitgestempelten Sätzen Ihres Empfängers), wird die Epoche so abgeschlossen, wie sie ist. Die ersten <c2/> Sekunden des Stroms bilden die Basislinie und werden nie bewertet, daher <b>hat ein Strom, der bereits gespooft wird, wenn er zum ersten Mal verbunden wird, keine saubere Basislinie</b>: Starten Sie die Schicht vor der Fahrt oder solange die Lösung bekanntermaßen gut ist. Das Kalibrierungsfenster schließt sich einmal, nach Eintreffen: Eine Epoche, deren Zeit früher ist als eine bereits gesehene Zeit (ein Zurückspulen, ein Replay des Stromanfangs), ist nie Kalibrierung, was auch immer ihre Zeit sagt; sie wird mit einem vollen Abzug <c3/> bewertet, der untrusted ist. Die Live-Engine bewertet jede Epoche über die Kalibrierungsepochen und die letzte Minute oder so des Stroms, sodass ihr Aufwand je Epoche mit <c4/> mal der Epochenrate wächst; halten Sie das Fenster bei einem schnellen Empfänger kurz. Ihre Puffer sind begrenzt (eine Flut von Zeilen ohne zeitgestempelten Satz wird alle { "5,000" } Zeilen abgeschlossen, Kalibrierung und Verlauf sind auf { "20,000" } Epochen begrenzt).

# text
# c1: --replay
# c2: --file
# c3: --follow
# c4: --file ... --follow
seg-2ef5aad7c750 = Die Zeit des Empfängers wird auch mit der monotonen Uhr dieses Rechners verglichen, was nur für einen in Echtzeit eintreffenden Strom etwas bedeutet. Ein gespeichertes Log, das mit voller Geschwindigkeit über stdin, TCP oder UDP eingespeist wird, löst diese Prüfung konstruktionsbedingt aus: Übergeben Sie <c1/>. (<c2/> ohne <c3/> impliziert es bereits.) Ein <c4/> wird als Replay gelesen, bis es bis zu seinem Ende gelesen wurde, und die Host-Uhr wird von da an einbezogen, sodass ein Rückstau nicht als Uhrfehler gelesen wird; die Prüfung braucht dann, dass das Kalibrierungsfenster noch offen ist (sonst hat sie keine Basislinie und läuft nicht).

# text
# c1: --udp <port>
# c2: --udp <addr>:<port>
seg-a06e58b2cfc8 = Stromenden und Fehler: stdin und eine bis zu ihrem Ende gelesene Datei enden normal (Exit { "0" }). Eine vom Peer geschlossene TCP-Verbindung ist für einen Strom, der weitergehen sollte, kein normales Ende: Die Schicht endet nach dem Bewerten und Schreiben alles Empfangenen ungleich null und verbindet sich nicht neu, führen Sie sie also unter einem Supervisor aus, der sie neu startet. UDP-Datagramme, die einen Satz teilen, werden zusammengefügt; die Leser von stdin, einer Datei und TCP werden von einer begrenzten Warteschlange gestützt, die auf den Sender zurückdrückt (nichts geht verloren), während UDP, das nicht zurückdrücken kann, Datagramme verwirft, die die Engine nicht annehmen kann, und dies auf stderr meldet. <c1/> bindet an die Loopback-Adresse; geben Sie <c2/> an, um anderswo zu lauschen (eine Warnung wird ausgegeben).

# text
# c1: $PKSHT
seg-0a0ed5e74ea4 = <c1/>: der proprietäre Satz

# text
# c1: --pksht <path|->
seg-71ccf4a80c99 = Jede Epoche erzeugt außerdem einen NMEA-{ "0183" }-Satz mit gültiger Prüfsumme, den <c1/> in eine Datei oder auf stdout schreibt und den das Gate in den weitergeleiteten Strom einfügt:

# text
# c1: 1
seg-df9382f4b055 = <c1/>: die Formatversion

# text
# c1: hhmmss.ss
seg-6986879f86fb = UTC-Zeit der Epoche, <c1/>; leer, wenn der Strom keine geliefert hat

# text
seg-34418696f9d2 = Vertrauenswert { "0" } bis { "100" }, eine Dezimalstelle; leer während der Kalibrierung oder wenn keiner erzeugt werden konnte

# text
# c1: C
# c2: N
# c3: D
# c4: U
seg-0b249ba73868 = Band: <c1/> calibrating, <c2/> nominal, <c3/> degraded, <c4/> untrusted

# text
# c1: -
# c2: P
# c3: W
seg-281aba68405a = Gate: <c1/> off, <c2/> passed, <c3/> withheld (die Lösung wurde im weitergeleiteten Zyklus als ungültig markiert)

# text
# c1: monitor:points
# c2: /
seg-f306c3f54a48 = bis zu zwei Gründe, <c1/>, verbunden durch <c2/>; leer, wenn nichts abgezogen wurde

# text
# c1: P
# c2: KSH
# c3: T
# c4: $PKSHT
seg-4bee29dfe578 = Die Adresse ist <c1/> + das Herstellerkürzel <c2/> + <c3/>. Ausrüstung, die einen proprietären Satz nicht kennt, ignoriert ihn. Kshana ignoriert sein eigenes <c4/> bei der Eingabe.

# text
seg-d75c9da94f37 = Gate-Modus

# text
# c1: --gate
seg-30c1f4a5706c = <c1/> stellt Kshana zwischen den Empfänger und die Ausrüstung, die seine Lösung verwendet (ein Kartensystem, ein Kursregelsystem). Der NMEA-Strom geht hinein, kommt auf stdout heraus und wird:

# text
# c1: $PKSHT
seg-aa0692146620 = <b>unverändert durchgereicht</b>, solange die Epoche nicht untrusted ist (und während der Kalibrierung), mit einem <c1/> nach jedem Satzzyklus; und

# text
# c1: 0
# c2: V
# c3: N
# c4: V
# c5: N
# c6: V
# c7: N
# c8: N
seg-bbdd68edbb17 = <b>als ungültig markiert</b>, solange sie untrusted ist: GGA-Qualität <c1/>; RMC-Status <c2/> (und sein Modusindikator <c3/> und der Navigationsstatus <c4/>, wo vorhanden); GNS-Modus <c5/> in jeder Position; GLL-Status <c6/> und Modus <c7/>; VTG-Modus <c8/>, wo es einen hat. Die Positionsfelder bleiben, wie sie waren: Der Sinn ist, dass die Ausrüstung sieht, dass der Empfänger selbst die Lösung für ungültig erklärt, und ihren eigenen Alarm auslöst. Bei jedem umgeschriebenen Satz wird die Prüfsumme neu berechnet.

# text
# c1: [live] gate_release_s
# c2: --json <path>
seg-23ee46747297 = Einmal zurückgehalten, wird die Lösung erst freigegeben, nachdem die Epochen für <c1/> (Standard { "30" } s) außerhalb des Bands untrusted waren, sodass ein Wert an der Bandgrenze die Lösung nicht flackern lassen kann. Die JSON-Zeilen gehen nur dorthin, wohin <c2/> es angibt (standardmäßig nirgendwohin, weil der Strom stdout hat).

# text
seg-6b7b557a4909 = Damit sich ein Kartenplotter direkt verbinden kann, stellen Sie den gesperrten Strom statt auf stdout über TCP bereit:

# text
# c1: --listen tcp:<port>
# c2: tcp:<addr>:<port>
# c3: --listen
# c4: --gate
# c5: --json -
seg-96ff51df9abe = <c1/> lauscht an der Loopback-Adresse; <c2/> lauscht anderswo (eine Warnung wird ausgegeben, weil jeder, der die Adresse erreichen kann, den Strom lesen kann). Beliebig viele Clients können sich verbinden; jeder erhält denselben Strom ab dem Moment, in dem er sich verbindet, und Clients lesen nur. Jeder Client hat seine eigene begrenzte Warteschlange und seinen eigenen Writer, sodass einer, der nicht mithalten kann, fallen gelassen wird (seine Verbindung wird geschlossen, eine Zeile auf stderr) und nie die anderen oder die Eingabe verzögert. <c3/> braucht <c4/>; stdout trägt dann nichts vom Strom, daher ist <c5/> frei.

# text
seg-960e0abb0466 = Was das Gate nicht tut und was Sie vor der Verwendung wissen sollten:

# text
# c1: --gate
seg-ee3f18efa84c = Es ist ein <b>Opt-in</b>. Nichts markiert eine Lösung als ungültig, es sei denn, <c1/> wird angegeben.

# text
# c1: idle_flush_s
seg-9cd8243cb437 = Es <b>fügt Latenz hinzu</b>: Ein Zyklus wird zurückgehalten, bis seine Epoche bewertet ist, also bis zum nächsten zeitgestempelten Satz (etwa ein Zyklus: eine Sekunde bei einem { "1" }-Hz-Empfänger), oder <c1/> nach dem letzten, wenn der Strom stockt. Ausrüstung, die einen Satz innerhalb einiger zehn Millisekunden nach der Ausgabe des Empfängers braucht, darf nicht dahinter sitzen.

# text
seg-ec63f8f3230b = Es ist <b>ein einzelner Punkt in der Kette</b>: Wenn es stoppt, stoppt der Strom. Führen Sie es beaufsichtigt aus und legen Sie im Voraus fest, was die nachgeschaltete Ausrüstung ohne Strom tut.

# text
# c1: note
seg-536e41a6a5e7 = Es <b>schlägt bei eigenen Fehlern geschlossen fehl</b>: Wenn die Monitore nach der Kalibrierung keinen Wert erzeugen können (ein deklarierter Steuerkurssensor, der nichts sendet, zu wenige Kalibrierungsepochen), ist die Epoche untrusted, trägt ein <c1/> und wird zurückgehalten; die Freigabe-Haltezeit wird auf der Uhr dieses Rechners gemessen, nicht auf der Zeit des Empfängers, die ein Spoofer kontrolliert (bei einem Replay gibt es nur die Zeit des Empfängers).

# text
seg-5dd62cd853c6 = Es kann <b>eine gute Lösung zurückhalten</b> (ein Fehlalarm) ebenso wie eine gespoofte durchlassen (ein Verpasser). Die Monitore prüfen eine Lösung gegen die Physik eines Schiffes und seine anderen Sensoren; eine Fälschung, die mit allen davon konsistent ist, wird nicht gesehen (siehe die Grenzen unten).

# text
# c1: $PKSHT
seg-a284a3ec9dfe = Es erwartet einen <b>reinen NMEA-{ "0183" }-Textstrom</b>. In den Strom gemischte Binärrahmen werden unverändert weitergeleitet, aber ein <c1/> kann dann zwischen den Bytes eines Rahmens landen.

# text
seg-0c919698fa92 = Es ist <b>nicht typzugelassen</b>, und nichts darin wurde gegen IEC { "61108" } oder IEC { "61162" } bewertet. Der Betreiber bleibt für die Navigation des Schiffes verantwortlich.

# text
seg-9e3ea39c38cf = <s1>Zurück</s1>Empfängervertrauen

# text
seg-136da5c10b2d = <s1>Weiter</s1>NMEA-Trainingsströme

# text
seg-990a49527516 = $PKSHT: der proprietäre Satz
