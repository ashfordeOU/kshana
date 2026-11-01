# docs--real-tle-guide: translations (de)

# text
seg-a6da23b43f90 = <s1>Weiter</s1>Kampagnen

# text
# c1: docs/REAL_TLE_GUIDE.md
seg-bc9ae2eda129 = Quelle: <c1/>

# text
seg-68b27f011ced = Echte Konstellations-TLEs verwenden

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: gps-ops
# c3: strict_checksum = true
# c4: tests/fixtures/celestrak/gps-ops_2021-07-28.txt
# c5: scripts/fetch_tles.sh
seg-109e8a920fc2 = Die mitgelieferte Datei <c1/> enthält bereits <b>echte TLEs</b> (Zwei-Zeilen-Elementsätze): den Celestrak-Schnappschuss <c2/> der betriebsbereiten GPS-Konstellation (Global Positioning System), katalogisiert am 2021-07-28, { "30" } Satelliten, mit <c3/>. Jeder Satellit wird mit SGP4/SDP4 propagiert (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }), das gegen die offiziellen Vektoren AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 validiert ist. Derselbe Schnappschuss liegt als <c4/> mit im Repository, und <c5/> holt einen frischen. Lesen Sie Abschnitt { "3" }, bevor Sie daraus eine Geometriezahl zitieren: Dieses Szenario propagiert jeden Satelliten ab seiner eigenen Epoche.

# text
# c1: scenarios/orbit-real-tle.toml
# c2: orbit
# c3: tle
seg-faed28835cb2 = Für ein synthetisches, in sich geschlossenes Beispiel liefert <c1/> sechs GPS-ähnliche Satelliten als reine Zeile-2-Datensätze, propagiert als analytische Kepler-Elemente, und jedes Szenario <c2/> ohne einen Block <c3/> baut eine Walker-Konstellation auf.

# text
seg-1c9b96a07f5b = Um die <b>aktuelle</b> GPS-Konstellation (oder eine andere) zu untersuchen, spielen Sie einen frischen Schnappschuss ein.

# text
seg-95bb71044de0 = { "1" }. Einen aktuellen Schnappschuss herunterladen

# text
seg-ab93ab55ddd9 = <a1>Celestrak</a1> verbreitet die Elementsätze des NORAD-Katalogs (North American Aerospace Defense Command) weiter, mindestens täglich aktualisiert. Für GPS:

# text
# c1: galileo
# c2: glo-ops
# c3: beidou
# c4: stations
seg-da7b4b89848b = Weitere nützliche Gruppen: <c1/>, <c2/> (GLONASS, das globale Satellitennavigationssystem Russlands), <c3/>, <c4/> (die ISS, Internationale Raumstation, und andere bemannte Stationen).

# text
seg-d7fe0dccbc36 = Die Datei ist eine Folge dreizeiliger Datensätze (Name, Zeile { "1" }, Zeile { "2" }). Der Parser von Kshana ignoriert Namenszeilen, sodass Sie die Datei unverändert einfügen können.

# text
seg-c2d6ca2089a1 = { "2" }. In ein Szenario einfügen

# text
# c1: tle
seg-6e221c5b640a = Setzen Sie in einem beliebigen Orbit-Szenario den Block <c1/> der Konstellation auf den Inhalt des Schnappschusses:

# text
seg-f2b0e78ef568 = (PRN ist die Nummer des Pseudozufallsrauschen-Codes, den ein GPS-Satellit sendet.)

# text
seg-976bcb48df94 = Ein Paar aus Zeile { "1" } + Zeile { "2" } wird mit <b>SGP4/SDP4</b> propagiert (Widerstands- und Tiefraumterme); eine reine Zeile { "2" } wird als analytische mittlere Kepler-Elemente behandelt. Beides darf gemischt werden.

# text
# c1: strict_checksum = true
# c2: false
seg-fa1d59fc7817 = <c1/> weist jede Zeile zurück, deren Modulo-10-Prüfsumme in Spalte 69 falsch ist — eine gute Integritätsprüfung für eine frisch heruntergeladene Datei. Der Standardwert ist <c2/>, weil die synthetischen Lehrszenarien Platzhalter-Prüfsummen verwenden.

# text
seg-90d3872ebf87 = { "3" }. Hinweise zu Epochen — lesen Sie dies, bevor Sie eine Geometriezahl zitieren

# text
# c1: parse_propagators
# c2: src/tle.rs
# c3: t
# c4: tsince = t
seg-5e9056a30d53 = SGP4 propagiert jeden Satelliten ab <b>seiner eigenen TLE-Epoche</b>, und <c1/> (in <c2/>) liefert nur Propagatoren zurück, sodass die Szenariozeit <c3/> als <c4/> auf jeden Satelliten unabhängig angewendet wird. Das ist nur dann die richtige Konvention, wenn alle Elementsätze in der Datei dieselbe Epoche haben.

# text
seg-3d04797ae50e = <b>Eine Celestrak-Gruppendatei liefert das nicht.</b> Die Datei wird zu einem Zeitpunkt <em>heruntergeladen</em>, aber der Elementsatz jedes Satelliten wird in seinem eigenen Rhythmus aktualisiert, sodass die Epochen darin über Tage verteilt sind. Gemessen an den in diesem Repository mitgelieferten Sätzen (Zeile { "1" }, Spalten { "19" }–{ "32" }):

# text
seg-5f67557dd207 = Testdatei

# text
seg-ce4855643f31 = Sätze

# text
seg-49a5b4798be4 = Epochenstreuung

# text
seg-b758a9b7ee02 = { "70.6" } h

# text
seg-79e6ea88957c = { "76.4" } h

# text
seg-e1e30f69fa4f = { "335.7" } h

# text
# c1: orbit
# c2: integrity
seg-9d38cc073c94 = { "70.6" } h sind { "5.9" } GPS-Umläufe. Unverändert propagiert, ist die Phasenlage in der Bahnebene durcheinandergebracht: Die Satelliten befinden sich in den richtigen Höhen und Neigungen, aber nicht dort, wo sie an irgendeinem einzelnen Tag waren, sodass die sichtbare Menge, der DOP (Dilution of Precision) und jede daraus berechnete Verfügbarkeit eine Konstellation beschreiben, die es nie gab. Nichts im Parser misst diese Streuung für Sie, und die Arten <c1/> und <c2/> gleichen Epochen nicht an: Ein TLE-Block in einem Szenario wird immer je Satellitenepoche propagiert.

# text
# c1: tsince
# c2: Tle::epoch_days_1950
# c3: tests/igs_real_data.rs
# c4: real_gps_tle_snapshot
seg-fa82a18e4418 = <b>Gehen Sie stattdessen so vor.</b> Behalten Sie die Epoche neben dem Propagator, wählen Sie einen Bezugszeitpunkt und verschieben Sie das <c1/> jedes Satelliten darauf. <c2/> ist öffentlich, daher ist die Parse-Schleife kurz; <c3/> (<c4/>) ist das durchgearbeitete Beispiel in diesem Verzeichnisbaum:

# text
# c1: tests/igs_real_data.rs
# c2: teme_to_ecef
seg-78092818695e = TEME ist das Bezugssystem mit wahrem Äquator und mittlerem Äquinoktium, in dem SGP4 arbeitet; <c1/> dreht es mit <c2/> in erdfeste Koordinaten.

# text
seg-78f483dfc3fa = Wenn Sie nicht angleichen, sagen Sie das, wenn Sie die Zahl berichten: Sie ist eine Aussage über Bahn-<em>Schalen</em>, nicht über einen realen Himmel.

# text
# c1: tests/araim_dual_real_data.rs
seg-34fddbd3d57f = Wie viel das ausmacht, wird in <c1/> gemessen, das dieselben Verschiebungen anwendet (Bezugszeitpunkt: die späteste Epoche in den kombinierten GPS- und Galileo-Testdaten, 2026-06-07T07:{ "21" }:{ "04" } UTC (koordinierte Weltzeit)) in einem { "24" }-h-Verfügbarkeitslauf mit ARAIM (erweiterte empfängerautonome Integritätsüberwachung) für zwei Konstellationen. Unter einem VAL (vertikale Alarmgrenze) von { "12" } m liefert der angeglichene Himmel für nur GPS { "0.993" }, für gepooltes GPS+Galileo { "1.000" } und für das konstellationsfehlerrobuste Dual { "0.990" }; die nicht angeglichene Konvention je Satellitenepoche liefert für dieselben Eingaben { "0.208" }, { "0.671" } und { "0.031" } — ein anderer Schluss, kein kleiner Fehler.

# text
# c1: README.md
seg-49f6c8f71d99 = <a1><c1/></a1> — die Orbit-Szenarien.

# text
# c1: SCENARIOS.md
# c2: orbit
# c3: integrity
# c4: gnss-sim
# c5: jamming
# c6: constellation-design
# c7: constellation
# c8: ephemeris
# c9: tle
seg-c842884cb3e7 = <a1><c1/></a1> — die Felder der Art <c2/>; die Arten <c3/>, <c4/>, <c5/> und <c6/> verwenden dieselbe Tabelle <c7/>, und <a2><c8/></a2> nimmt ein einzelnes <c9/>.

# text
# c1: INTEGRITY.md
seg-a2c5db6dcf42 = <a1><c1/></a1> — die ARAIM-Engine, die der Test mit realem Himmel antreibt.

# text
# c1: src/tle.rs
# c2: parse_propagators
# c3: ParseOpts { strict_checksum }
seg-106047488885 = <c1/> — der Parser (<c2/>, <c3/>).

# text
seg-c9068c1bc579 = <s1>Zurück</s1>Ergebnisschema
