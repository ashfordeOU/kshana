# docs--observatory-results: translations (de)

# text
# c1: docs/observatory/RESULTS.md
seg-69304b8b186b = Quelle: <c1/>

# text
seg-df5b53307f50 = Ergebnisse des Observatoriums: 30-Tage-Rückkatalog für die Ostsee und Sensitivitätsstudie

# text
# c1: kshana-observatory/adsb/v1
# c2: kshana-interference-map/adsb/v2
seg-072bdea11014 = Version <c1/> über <c2/> (Parameter in der Basismethode vorregistriert, unverändert). MODELLED: Es gibt keine externe unabhängige Referenz, keine Referenzwahrheit und keine Ursachenzuschreibung. Eine degraded-Zelle bedeutet, dass ein hoher Anteil der dort erfassten Flugzeuge an diesem Tag eine geringe Navigationsgenauigkeit meldete; sie sagt nicht, warum. Eine Zelle, die not observed oder nicht vorhanden ist, wurde nicht bewertet, was nicht dasselbe ist wie unauffällig.

# text
seg-0d1eeedcab3a = Was ausgeführt wurde

# text
# c1: v<YYYY>.<MM>.<DD>-planes-readsb-prod-0
# c2: adsblol/globe_history_2026
# c3: scripts/fetch_adsblol_day.sh
# c4: back-catalogue/fetch/<tag>.parts.json
seg-df6ddf801a25 = <b>Quelle:</b> adsb.lol-readsb-Verlauf (ODbL { "1.0" }), GitHub-Release <c1/> von <c2/>, abgerufen von <c3/> Teil für Teil (etwa { "3.4" } GB pro Tag, { "2" } Teile). Der Herausgeber nennt keine Prüfsummen, daher ist der SHA-256 jedes Teils in <c4/> festgehalten.

# text
# c1: scripts/observatory_backcatalogue.sh
seg-9fa2d2319ed3 = <b>Region und Tage:</b> der Rahmen { "53.5" }, { "9.0" }, { "66.0" }, { "31.0" } (Süd, West, Nord, Ost: die Ostsee und ihre Küsten), { "30" } UTC-Tage vom 2026-09-15 bis 2026-10-14, Zellen von { "0.5" } Grad, mit <c1/> (ein Tag nach dem anderen, Rohdateien nach jedem Tag gelöscht).

# text
# c1: method.scope
seg-8b65d148bbd8 = <b>Freigaberegeln:</b> Der neueste Tag (2026-10-14) lag bei der Erstellung mehr als { "24" } h nach seinem Ende; sonst lehnt der Befehl ab. Regionale Läufe berechnen die Geräte-Basislinie und den Hintergrund des Tages nur aus den Meldungen des Rahmens (<c1/>).

# text
# c1: back-catalogue/MANIFEST.json
seg-64581554e84a = <b>Dateien:</b> Die { "120" } Produktdateien (GeoJSON, PNG, Vorfall-JSON, Manifest je Tag) sind <b>nicht in git</b>. Der Hash jeder Datei steht in <c1/>, und ein Tag lässt sich aus seinem Archiv neu aufbauen und vergleichen.

# text
# c1: manifest.json
seg-c89b88dc3d3b = Beispiel dafür, wie ein Tag aussieht: Am 2026-09-15 enthielt das Archiv { "110,619,797" } Positionszeilen in { "79,826" } Trace-Dateien; { "103.0" } Millionen lagen außerhalb des Rahmens, { "5.6" } Millionen waren kein ADS-B, { "1.2" } Millionen waren am Boden oder unter { "5,000" } ft, { "0.6" } Millionen enthielten kein Genauigkeitsfeld, und { "212,426" } wurden aggregiert (Eingabezähler in <c1/>).

# text
seg-cc590aa74075 = Drei Tage (2026-09-18, 2026-09-26, 2026-10-03) wurden erneut aus dem Archiv geholt und ein zweites Mal ausgeführt: GeoJSON, PNG und die Vorfalldatei sind <b>byte-identisch</b> mit dem ersten Lauf (SHA-256 gleich), das Produkt ist also deterministisch, obwohl das Salz des Kennungs-Hashes pro Lauf zufällig ist.

# text
seg-3532be519183 = Zusammenfassung des Rückkatalogs

# text
seg-56aae646318e = UTC-Tag

# text
seg-42784010b115 = veröffentlichte Zellen

# text
seg-2672b7f55371 = degraded

# text
seg-378ee89e4bd3 = not degraded

# text
seg-14783d89f2fe = not observed (veröffentlicht)

# text
seg-711d143678ae = Vorfälle

# text
# c1: not_observed
seg-0f1ffe21d381 = { "30" } Tage: insgesamt { "96" } degraded-Zellen, { "28" } der { "30" } Tage mit mindestens einer, { "70" } Vorfälle (Cluster aneinandergrenzender degraded-Zellen), kein Tag mit einem tagesweiten Effekt. Der Median des Zellenanteils betroffener Flugzeuge (der Hintergrund des Tages) beträgt an { "29" } Tagen { "0" } und an einem { "0.006" }, sodass die Hintergrund-Schutzbedingung (eine Zelle muss den Hintergrund um { "0.15" } übersteigen) in dieser Region nie eine Aussage geändert hat. Die Anzahl der degraded-Zellen pro Tag reicht von { "0" } bis { "8" } (Mittelwert { "3.2" }). Etwa ein Drittel der pro Tag veröffentlichten Zellen ist <c1/> (zu wenige Flugzeuge erfasst): Die Abdeckung ist die Grenze dieses Produkts, nicht der Himmel.

# text
seg-606aed861c95 = Was dies nicht aussagt: Die Tage mit mehr degraded-Zellen sind in keinem physikalischen Sinn „schlechter“, ein anhaltend betroffenes Gebiet würde unterschätzt (Flugzeuge, die den ganzen Tag nur darin fliegen, haben außerhalb keine Basislinie und werden nicht gezählt), und nichts hier sagt, wer oder was die geringe Genauigkeit verursacht hat.

# text
seg-ef37626a4c47 = Sensitivitätsstudie (drei Tage)

# text
# c1: kshana interference-map sensitivity
# c2: sensitivity/<day>.json
seg-aacbb761ee19 = <c1/> spielt die aufgezeichneten Meldungen eines Tages unter einzelnen Änderungen der registrierten Parameter erneut ab (je zwei Werte, dazu ein Gitter von { "1.0" } Grad). Tage: 2026-09-18 (die meisten degraded-Zellen, { "8" }), 2026-09-26 ({ "1" } degraded-Zelle) und 2026-10-03 ({ "0" }). Vollständige Berichte: <c2/> (je { "23" } Varianten; { "2.2" }, { "1.7" } und { "1.7" } Millionen Zeilen erneut abgespielt). Degraded-Zellen unter jeder Variante (registrierter Wert in Klammern; das registrierte Ergebnis ist { "8" }, { "1" } und { "0" } degraded-Zellen):

# text
seg-dfced7e594d2 = Parameter (registriert)

# text
seg-2ac3e771679d = Wert

# text
seg-0953dbfd76db = Gitter { "0.5" } Grad

# text
seg-bf5746d1a110 = { "2" } (gröbere Zellen)

# text
seg-e4016df2fcd3 = Zur Lesart, ohne einen Sieger zu bestimmen:

# text
seg-81cfcbf0de89 = Die Aussagen reagieren empfindlich auf die Schwellenwerte der Genauigkeitscodes und auf die Stichprobenregeln, und die kleinen Anzahlen schwanken stark.

# text
# c1: low_nic_max
# c2: degraded_share
# c3: min_reports_per_aircraft_in_cell
# c4: low_nic_max
# c5: degraded_share
seg-097ed1aa1504 = <c1/>, <c2/> und <c3/> ändern jeweils an jedem Tag die Anzahl der degraded-Zellen um einen Faktor von zwei oder mehr; eine Lockerung von <c4/> auf { "6" } macht aus { "1" } degraded-Zelle am 09-26 { "12" } (Jaccard mit der registrierten Menge { "0.08" }). Am 09-18 behält die Erhöhung von <c5/> auf { "0.4" } { "1" } der { "8" } (Jaccard { "0.125" }). Eine Zellenaussage nahe den Schwellenwerten ist ebenso eine Aussage über die Schwellenwerte wie über die Daten.

# text
# c1: min_aircraft_sampled
seg-0d0c96099d30 = <b><c1/> verschiebt Zellen vor allem zwischen not degraded und not observed</b>: Am 09-18 lässt es die Anzahl der degraded-Zellen bei { "8" }, während { "21" } bis { "56" } Zellen den Zustand wechseln.

# text
# c1: background_margin
# c2: min_baseline_good_reports
# c3: day_confound_background
seg-04cc05318a5d = <b>Drei Schutzbedingungen sind hier inaktiv</b>: <c1/>, <c2/> und <c3/> ändern an keinem der drei Tage etwas (der Hintergrundanteil ist { "0" }); diese Region und dieser Zeitraum sagen daher nichts darüber, wie gut sie funktionieren. Sie wären dort von Bedeutung, wo ein regionaler Effekt den Hintergrund anhebt.

# text
seg-7ba403b84fbd = <b>Ein gröberes Gitter ({ "1.0" } Grad) verändert das Bild</b> ({ "2" }, { "3" } und { "1" } degraded-Zellen; die veröffentlichten Zellen sinken auf etwa ein Drittel, { "226" } gegenüber { "694" } am 09-18, weil jede Zelle viermal so groß ist): Die Zellengröße ist eine Methodenentscheidung, und das Observatorium legt sie auf { "0.5" } Grad fest.

# text
# c1: low_nic_max
seg-4db2f5313410 = Ein Tag ohne registrierte degraded-Zelle (10-03) hat unter { "9" } der { "22" } Nicht-Gitter-Varianten degraded-Zellen (bis zu { "8" } mit <c1/> { "6" }): „keine degraded-Zelle“ ist ebenfalls eine vom Schwellenwert abhängige Aussage.

# text
seg-a818be844f3a = Keine Variante ist eine validierte Alternative, und die registrierte Regel bleibt durch diese Studie unverändert. Die Studie sagt nicht, welche Parameterwerte richtig sind.

# text
seg-98c799bfbc25 = <s1>Zurück</s1>Störungsobservatorium: Methode

# text
seg-5d0c003e73dc = <s1>Weiter</s1>kshana-bench
