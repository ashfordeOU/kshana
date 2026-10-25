# docs--bench: translations (de)

# text
seg-5aa5efd6b7da = AUC

# text
# c1: docs/BENCH.md
seg-5fcf52aba837 = Quelle: <c1/>

# text
# c1: bench/SPEC.md
# c2: bench/LICENCES.md
# c3: xval/bench/PREREGISTRATION.md
# c4: PREREGISTRATION-v2.md
# c5: xval/bench/RESULTS-v2.md
seg-d3c3517e3bb2 = Ein offener Satz von Aufgaben, Aufteilungen und Metriken für die Erkennung von GNSS-Störungen und für timing-holdover. Die Spezifikation ist <a1><c1/></a1> (Version { "2.0.0" }; Lizenz von Text und Manifesten: CC-BY-4.0 / CC0 vorgeschlagen, Entscheidung des Eigentümers steht aus). Die Prüfung der Datensatzlizenzen ist <a2><c2/></a2>. Die Zielwerte der Basislinien wurden vor dem ersten bewerteten Lauf in <a3><c3/></a3> und, für { "2.0.0" }, in <a4><c4/></a4> festgelegt, und ihre Ergebnisse stehen in <a5><c5/></a5>.

# text
# c1: agc_k_sigma
seg-6c455061baac = Urteile, wie dort festgehalten: Die Zielwerte des Bewerters, C1 bis C3 und D2 sind erreicht; <b>A2 ist NOT MET</b> (<c1/> AUC { "0.766" } gegenüber mindestens { "0.80" } auf der Testaufteilung), <b>D1 ist NOT MET</b> (größte Lücke { "0.0301" }) und <b>Aufgabe (b) R1 ist NOT MET</b> (übernommen, nicht neu ausgeführt). Kein Zielwert wird gelockert.

# text
seg-ebe1c987bc7c = Was es ist: eine Möglichkeit, Methoden auf denselben Daten mit demselben Metrikcode zu vergleichen. Was es nicht ist: eine Rangliste von Produkten, eine Zulassung oder ein Beleg dafür, dass eine Methode im Feld funktioniert. Jede Bewertung ist MODELLED, und eine Bewertung beschreibt ein Protokoll oder einen Korpus, nie ein Produkt. Kshana-Ergebnisse sind beratend.

# attr:alt
seg-874effe5ee80 = Die eingebauten Basislinien der Aufgabe D von kshana-bench (die Optimismuslücke) auf der Testaufteilung, aus einem echten Lauf der Engine v{ $version } (`kshana bench baseline`). Jedes Balkenpaar ist die Fläche unter der ROC-Kurve für die Fälle innerhalb der Verteilung und für die verschobenen Fälle; die Lücke dazwischen ist die Optimismuslücke, gemessen an einer Toleranz von { "0.05" }. fused-max-z: { "0.998" } und { "0.983" } (Lücke { "0.015" }); sqm-imbalance: { "0.882" } und { "0.882" } (Lücke { "0.001" }); agc-excess: { "0.848" } und { "0.819" } (Lücke { "0.030" }); raim-parity: { "0.682" } und { "0.672" } (Lücke { "0.010" }); energy-cn0-drop: { "0.595" } und { "0.565" } (Lücke { "0.030" }). Die Labels sind Labels eines generativen Modells eines synthetischen Korpus, nie Felddaten: MODELLED. Beratend: modelliert oder gegen genannte Referenzen gemessen, keine Zulassung, keine Zertifizierung und keine Konformitätserklärung. Eine Bewertung beschreibt ein Protokoll oder einen Korpus, nie ein Produkt.

# text
seg-6ce7bd4525d6 = Aufgaben

# text
seg-09907c94f04d = Aufgabe

# text
seg-1c6199627b90 = Daten

# text
seg-9cdfe78e3b22 = Primäre Metrik

# text
seg-5093217f24a1 = (a) Erkennung auf Empfängerprotokollen

# text
seg-809068c95ddf = eine Epoche eines JammerTest-{ "2024" }-Protokolls

# text
# c1: scripts/fetch_jammertest2024.sh
seg-f87dda92fbd2 = abgerufen durch <c1/> (GPL-3.0+, nie eingebunden)

# text
seg-9493bfc5bd64 = (b) Erkennung auf IQ

# text
seg-8d012e25aa62 = ein bewertetes Fenster einer Szene

# text
seg-69f020ed20da = synthetisches Kshana-Szenenrezept; TEXBAT nur als Referenz

# text
seg-499ae444224e = AUC je Alarmart

# text
seg-73028caefeb0 = (c) Vorhersage von timing-holdover

# text
seg-0d0b071690cf = (Satellit, Ursprung)

# text
seg-6cf42152f523 = IGS-Uhren bei { "300" } s (eingecheckter Auszug, festgelegter Hash)

# text
seg-74bd23dfebf5 = RMSE bei { "3600" } s

# text
seg-3cc3545250e5 = (d) Optimismuslücke außerhalb der Verteilung

# text
seg-ab343a29b019 = ein synthetischer Fall

# text
# c1: impairment-eval
seg-b25d781ff536 = Korpus <c1/>, innerhalb und außerhalb der Verteilung

# text
seg-e32f49d34f7b = AUC außerhalb und die Lücke

# text
seg-1ad563733f12 = Befehle

# text
# c1: kshana-bench-predictions/1
# c2: scores
# c3: predictions
# c4: kshana-bench-result/1
seg-c9d00ff2e1d0 = Eine Einreichung ist eine Datei (<c1/>): <c2/> (eine Zahl je Fall-ID; höher heißt wahrscheinlicher beeinträchtigt) für die Aufgaben a, b und d oder <c3/> (die Phasenänderung in ns bei jedem Horizont) für Aufgabe c. Eine Ergebnisdatei (<c4/>) nennt die Spezifikationsversion, die Aufteilung, den SHA-256 der Wahrheit und der Vorhersagen sowie die Metriken. Ergebnisse verschiedener Hauptversionen der Spezifikation kommen nie in eine Tabelle.

# text
seg-bdc715c52ab5 = Ehrliche Grenzen

# text
# c1: bench/holdout/COMMITMENTS.json
seg-f26f0e79f2ed = Die zurückgehaltenen Datensätze mit echten Daten (a und c) sind öffentlich, weil jeder die Daten herunterladen kann. Sie schützen davor, eine Aufteilung nach Kenntnis der Bewertungen zu wählen, nicht davor, auf diesen Ordnern abzustimmen. Der versiegelte zurückgehaltene Datensatz der Aufgabe (d) ist ein Commit-and-Reveal-Verfahren: Der Eigentümer legt nur den Hash in <c1/> fest und behält den Startwert (bisher ist keiner versiegelt).

# text
# c1: kshana jammertest score
seg-81c3f961230b = Die Wahrheit der Aufgabe (a) sind die geplanten Angriffsfenster der Ereignisprotokolle in Minutenauflösung, daher ist eine Erkennungswahrscheinlichkeit eine untere Schranke; die Metriken auf Ereignisebene (Latenz, verpasste Alarme, Fehlalarme) kommen mit dem Jammertest-Bewerter von <c1/>.

# text
# c1: docs/design/DETECTION-ROC.md
seg-47df52b5c5e6 = Die IQ-Basislinie der Aufgabe (b) wird aus <c1/> übernommen und für v1 nicht neu ausgeführt.

# text
seg-d54342791763 = Der Korpus der Aufgabe (d) ist eine Trennbarkeits- und Pipeline-Prüfung; eine AUC darauf ist eine AUC über modellabgeleitete Labels.

# text
seg-3d8bfdeead6c = <s1>Zurück</s1>Störungs-Observatorium: Ergebnisse

# text
seg-07f5b51844d1 = <s1>Weiter</s1>Einen Empfänger gegen ein Szenario laufen lassen
