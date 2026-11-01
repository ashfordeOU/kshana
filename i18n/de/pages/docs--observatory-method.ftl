# docs--observatory-method: translations (de)

# text
seg-0857a94a948e = Grenzen

# text
seg-2247a2344710 = Bedeutung

# text
seg-b652b86e6b8e = Zustand

# text
# c1: docs/observatory/METHOD.md
seg-7ca62fa39e10 = Quelle: <c1/>

# text
seg-48e063b567d0 = Störungsobservatorium: Methodenhinweis

# text
# c1: kshana-observatory/adsb/v1
# c2: kshana-interference-map/adsb/v2
seg-d0e1d6cadc10 = Version <c1/>, aufbauend auf <c2/>. Nur beratend: Dies ist eine Beschreibung dessen, wie veröffentlichte Positionsmeldungen an vergangenen Tagen aussahen, keine Messung eines Empfängers, keine Prognose, keine Bestätigung einer Störung und keine Zuschreibung ihrer Ursache.

# text
seg-c5eab49b8d6f = Was das Observatorium veröffentlicht

# text
seg-165ae7646608 = Ein Produkt pro UTC-Tag und Region, aus einem offenen Archiv von Flugzeugpositionen. Jede Zelle eines festen Breiten-Längen-Gitters von 0.5 Grad befindet sich in einem von <b>drei Zuständen</b>:

# text
seg-cc07647eb12e = Ein hoher Anteil der in der Zelle erfassten Flugzeuge meldete an diesem Tag eine geringe Navigationsgenauigkeit, deutlich über dem Hintergrund dieses Tages.

# text
seg-3e1dd7caaee6 = Es wurden genügend Flugzeuge erfasst, und der Anteil erfüllte die Regel nicht.

# text
# c1: insufficient_sample
# c2: no_day_background
# c3: day_wide_effect
seg-8f0d9ad60d62 = Die Daten erlaubten keine Aussage. Das ist <b>nicht</b> „unauffällig“. Jede so veröffentlichte Zelle trägt einen Datengrund: <c1/>, <c2/> oder <c3/>. Eine Zelle ganz ohne Eintrag wurde von weniger als { "5" } verschiedenen Flugzeugen gesehen und wird zurückgehalten.

# text
seg-e49e05b47061 = Sonst wird nichts veröffentlicht: keine Ursache, kein Akteur, kein Datensatz je Flugzeug. Die Gründe beschreiben, ob die Daten des Tages ausreichten, nie, warum die Genauigkeit gering war.

# text
# c1: kshana interference-map daily
seg-7b251c7860e0 = Drei Dateien pro Tag (<c1/>):

# text
# c1: observatory-adsb-<dataset>-<day>.geojson
# c2: schema
# c3: kshana-observatory-day/1
seg-2008b0ba6ac7 = <c1/>: die Zellen, mit <c2/> <c3/>, die Methode und ihre vorregistrierten Parameter, die Lizenz und Namensnennung, die Freigaberegel und ein Hinweis.

# text
# c1: observatory-adsb-<dataset>-<day>.png
seg-7d5b16eac4a3 = <c1/>: dieselben Zellen als Bild (degraded, not degraded, not observed schraffiert; leere Zellen wurden nicht beobachtet). Textblöcke in der Datei wiederholen den Hinweis und die Lizenz.

# text
# c1: observatory-adsb-<dataset>-<day>.incidents.json
# c2: schema
# c3: kshana-incident-report/1
# c4: cause
# c5: not attributed
seg-b76d2e071b16 = <c1/>: <c2/> <c3/>. Aneinandergrenzende degraded-Zellen (Diagonalen eingeschlossen) bilden einen Vorfall mit einem Begrenzungsrahmen und seinen Zellen. <c4/> ist der feste Text <c5/>. Die Datei ist eine Eingabe für einen Zyklus aus Melden, Bestätigen und Benachrichtigen (der Meldezyklus der Luftfahrt, der in einem NOTAM endet); sie ist weder eine Bestätigung noch ein NOTAM.

# text
# c1: .manifest.json
seg-49b7bdae0d6e = und eine <c1/> mit der Byte-Anzahl und dem SHA-256 der drei Dateien, der Methoden-ID, den Eingabezählern (gelesene und ausgeschlossene Zeilen) und dem Datensatzblock, damit ein Produkt geprüft und reproduziert werden kann.

# text
seg-d7bb390fb986 = Freigaberegeln (vom Befehl durchgesetzt)

# text
# c1: --delay-hours
seg-87147317f8da = <b>Mindestens { "24" } h Verzögerung.</b> Das Produkt eines Tages wird frühestens zum Ende dieses UTC-Tages plus <c1/> freigegeben ({ "24" } oder mehr; ein kleinerer Wert wird abgelehnt). Der Befehl lehnt einen Tag ab, der noch nicht veröffentlicht werden kann, und nennt den frühesten Zeitpunkt. Es gibt keinen Schalter, um das zu verkürzen.

# text
seg-43960c3f9b6c = Grobe Zellen.

# text
# c1: --cell-deg
seg-1a5ff10e5240 = <c1/> unter { "0.5" } wird abgelehnt.

# text
# c1: null
seg-e70d8d7f9980 = <b>Unterdrückung.</b> Eine Zelle, die von weniger als { "5" } verschiedenen Flugzeugen gesehen wurde, wird nicht veröffentlicht; eine Anzahl unter { "5" } ist <c1/> (null eingeschlossen), wie in der Basismethode.

# text
seg-ab75582c5032 = <b>Keine Zuschreibung.</b> Das Vokabular der Zustände und Gründe enthält keine Ursache; ein Test stellt das sicher.

# text
seg-0e7d76d7efd0 = <b>Quellen.</b> Nur adsb.lol (ODbL { "1.0" }) oder ein Nutzerdatensatz mit eigener Lizenz. <b>Daten des OpenSky Network werden abgelehnt</b> (seine Lizenz erlaubt weder die kommerzielle Nutzung noch die Weitergabe abgeleiteter Karten). ADS-B und AIS werden nie kombiniert.

# text
seg-dc28848046ac = <b>Lizenz des Produkts.</b> Eine ADS-B-Datei je Zelle, die aus adsb.lol erstellt wurde, ist eine abgeleitete Datenbank (Derived Database) und trägt in der Datei ODbL { "1.0" } und die Namensnennung von adsb.lol. Der Code von Kshana bleibt unter AGPL-3.0.

# text
seg-9eeba6648fec = Die Observable und die Basismethode

# text
# c1: kshana-interference-map/adsb/v2
# c2: docs/INTERFERENCE-MAP.md
seg-7334dc45eb2f = Ein ADS-B-Flugzeug meldet, wie genau es seine eigene GNSS-Position einschätzt: <b>NACp</b> (Navigation Accuracy Category for Position, eine horizontale { "95" }-%-Schranke von { "10" } NM bis unter { "3" } m) und <b>NIC</b> (Navigation Integrity Category, ein Eingrenzungsradius). Die Basismethode (<c1/>, <c2/>) zählt je Zelle und Tag den Anteil der <b>verschiedenen Flugzeuge</b>, deren Meldungen in der Zelle überwiegend geringe Genauigkeit zeigten, mit Schutzbedingungen: nur Höhen über { "5,000" } ft; ein Flugzeug zählt nur, wenn es am selben Tag anderswo gute Genauigkeit gemeldet hat (eine Geräte-Basislinie); der Zellenanteil muss den Median der Zellenanteile des Tages um eine Marge übersteigen; ein Tag, dessen Median selbst hoch ist, wird als verfälscht (confounded) markiert, und keine Zelle wird als degraded erklärt. Die Parameter wurden aus den Definitionen der Felder und aus der Datenschutzregel festgelegt, bevor irgendwelche Daten untersucht wurden, und sind in jede Ausgabedatei geschrieben. Das Observatorium fügt das Drei-Zustands-Vokabular, die Freigaberegeln und die oben genannten Dateien hinzu und ändert keinen Parameter.

# text
# c1: --bbox
# c2: method.scope
seg-96cf298985c6 = <b>Regionale Läufe.</b> Mit <c1/> werden nur Meldungen innerhalb des Rahmens gelesen. Die Geräte-Basislinie und der Hintergrund des Tages werden dann allein aus den Meldungen des Rahmens berechnet, und die Datei sagt das (<c2/>). Ein regionales Produkt ist daher ein Produkt der Daten dieser Region, kein Ausschnitt eines globalen.

# text
seg-2e7007b56a44 = Beziehung zur Methode NACp gegen Almanach-HDOP

# text
seg-4892485e534b = Pleninger, Topkova und Steiner, „GNSS interference detection: Methodology utilising ADS-B NACp indicator and GPS almanac data“, The Aeronautical Journal { "129" } ({ "1331" }), { "206" } bis { "223" } ({ "2025" }), doi 10.1017/aer.2024.67, vergleichen den aus dem NACp eines Flugzeugs folgenden Positionsfehler mit dem HDOP (horizontal dilution of precision) der GPS-Konstellation aus Almanachdaten und markieren ein Flugzeug als betroffen, wenn beide nicht übereinstimmen; die Arbeit bewertet die Methode an gezielten GPS-Jamming-Experimenten.

# text
seg-74ec1aca8a22 = <b>Was wir genutzt haben.</b> Nur den veröffentlichten Abstract und den bibliographischen Eintrag. Der Volltext stand uns nicht zur Verfügung (hinter einer Bezahlschranke), daher kennen wir weder seine Abbildung von NACp auf eine Fehlerschätzung noch seine HDOP-Berechnung noch seine Schwellenwerte, und wir behaupten nicht, sie zu reproduzieren.

# text
seg-4f8471649a07 = <b>Was das Observatorium stattdessen tut.</b> Die Frage, die der Almanach-Vergleich beantwortet, lautet: „Könnte die Konstellationsgeometrie allein diese geringe Genauigkeit erklären?“ Die Basismethode beantwortet eine verwandte Frage ohne Almanach: Ein geringer Anteil muss sich gegen den Hintergrund desselben Tages in der Region und gegen die eigenen guten Meldungen des Flugzeugs anderswo abheben. Das ist ein anderer und schwächerer Ersatz: Er kann nicht sagen, dass eine Stunde mit ruhiger Geometrie degraded war, wenn der Hintergrund des Tages ebenfalls niedrig ist. Ein Almanach-HDOP-Bewerter ist <b>nicht implementiert</b>. Das ist ein offener Punkt, der aus dem Volltext der Arbeit und dem öffentlichen GPS-Almanach gebaut und vor dem Lauf vorregistriert werden soll; bis dahin wird sie zitiert, nicht beansprucht.

# text
seg-e9b9902633af = Ein Produkt reproduzieren

# text
seg-95e48f0286d9 = Die Pipeline ist in allem, was sie veröffentlicht, deterministisch (das Salz der Kennung je Lauf ändert nur interne Hashes, die nie geschrieben werden). Die SHA-256-Werte des Manifests erlauben es, einen zweiten Lauf Byte für Byte zu vergleichen.

# text
seg-65236a42e316 = Sensitivitätsstudie

# text
# c1: kshana interference-map sensitivity <input> --dataset adsb-lol --day <day> --out report.json
# c2: docs/observatory/RESULTS.md
seg-0c843e799b8f = <c1/> spielt die Meldungen eines Tages unter Änderungen jedes vorregistrierten Parameters, jeweils einzeln (je zwei Werte, dazu ein Gitter von { "1.0" } Grad), erneut ab und berichtet je Variante die Anzahl der degraded, not degraded und not observed Zellen, den Jaccard-Index der degraded-Menge mit der registrierten, die Zellen, deren Zustand sich geändert hat, und die degraded-Fläche. Sie ändert nichts an der registrierten Regel: Eine Variante ist keine validierte Alternative, und eine große Änderung unter einem Parameter sagt, wie stark die Aussage von diesem Parameter abhängt, nicht, welcher Wert richtig ist. Die Ergebnisse für den Rückkatalog stehen in <c2/>.

# text
# c1: not_observed
seg-cc57d45c4b0a = <b>Abdeckung.</b> adsb.lol folgt Empfängern von Freiwilligen; die offene See und dünn abgedeckter Luftraum sind spärlich, und <c1/> ist dort häufig. Eine Karte zeigt die Abdeckung ihrer Quelle.

# text
seg-e3921e1eb177 = <b>Was geringe Genauigkeit bedeutet.</b> NACp und NIC sinken aus anderen Gründen als Störungen: Ausfälle von Satelliten oder Augmentation, Weltraumwetter, Fehler von Empfänger oder Transponder und Geometrie. Kein Zustand impliziert eine Ursache.

# text
seg-e5ad0dc456c0 = <b>Flugzeuge, die den ganzen Tag in einer betroffenen Region bleiben,</b> haben außerhalb keine Basislinie und werden nicht gezählt; die Methode unterschätzt daher einen anhaltenden regionalen Effekt. Die Sensitivitätsstudie zeigt die Wirkung der Basislinien-Schutzbedingung.

# text
seg-a2d41becc19b = <b>Tagesgrenzen</b> sind UTC; ein Ereignis, das Mitternacht überschreitet, wird auf zwei Tage aufgeteilt.

# text
seg-436af9f16feb = <b>Keine Referenzwahrheit.</b> Das Observatorium hat keine externe unabhängige Referenz: Jede Größe ist MODELLED, und keine Zeile der Verifikationsmatrix stützt sich darauf.

# text
seg-5c4966f0166d = <b>Sensibilität des Themas.</b> Karten dieser Art sind politisch. Das Observatorium nennt eine Methode, eine Verzögerung und ein Vokabular, sonst nichts; es nennt keine Staaten oder Akteure, und es veröffentlicht nicht in Echtzeit.

# text
seg-874f46a80c8b = <s1>Zurück</s1>Empfängerprotokolle lesen

# text
seg-3137b7595e59 = <s1>Weiter</s1>Störungsobservatorium: Ergebnisse
