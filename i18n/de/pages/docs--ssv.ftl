# docs--ssv: translations (de)

# text
seg-0857a94a948e = Grenzen

# text
seg-75c8da01c0f1 = MET

# text
seg-069a652c402e = Zielwert

# attr:alt
seg-1f79a5aae6c5 = Signalverfügbarkeit für einen Nutzer auf einer Kugel in { "36000" } km Höhe mit Halbkugelantenne, aus einem echten Lauf der Engine v{ $version } auf scenarios/gnss-ssv-shell.toml (ein verkleinerter Lauf: { "162" } Nutzer, { "3" } Tage, Schritte von { "10" } min), bei einer Schwelle von { "20" } dB-Hz. Für jede Konstellation und jedes Band zwei Balken: der Anteil der Paare (Nutzer, Epoche) mit mindestens einem Signal und mit mindestens vier. Kombiniert, L1: { "99.4" } % mindestens eines, { "73.2" } % mindestens vier, längster Ausfall unter vier Signalen { "160" } min. Kombiniert, L5: { "100.0" } % mindestens eines, { "99.9" } % mindestens vier, längster Ausfall unter vier Signalen { "20" } min. MODELLED: eine modellierte Studie aus genannten Eingaben, keine Messung und keine Aussage zum Service Volume irgendeines Systems. Die verkleinerte Größe ist nicht der Vergleich mit dem Heft. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben.

# attr:alt
seg-92ef8e0b78de = Signale entlang einer hohen Erdumlaufbahn (Perigäum { "497" } km, Apogäum { "58622" } km, Umlaufzeit { "18.8" } h), aus einem echten Lauf der Engine v{ $version } auf scenarios/gnss-ssv-heo.toml, Band L1. Oben: die beste Trägerleistungsdichte unter den sichtbaren Signalen, gegen die Schwelle von { "20" } dB-Hz. Mitte: die Anzahl der sichtbaren Signale aller Konstellationen, von { "4" } bis { "55" } entlang der abgetasteten Punkte. Von den empfangenen Verbindungen kamen { "2252" } durch eine Hauptkeule und { "696" } durch Nebenkeulen, mit einem gekennzeichneten parametrischen Ersatzdiagramm, nicht dem gemessenen Diagramm irgendeines Systems. Median-PDOP { "67" }, 95. Perzentil { "358" }. MODELLED: eine modellierte Studie aus genannten Eingaben, keine Messung und keine Aussage zum Service Volume irgendeines Systems. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben.

# attr:alt
seg-902c5c7da9aa = Ein Neun-Zustands-Bordfilter auf einem Transfer von niedriger Umlaufbahn zum Mond, aus einem echten Lauf der Engine v{ $version } auf scenarios/gnss-ssv-nav-lunar.toml ({ "289" } Epochen, { "13" } Punkte gezeichnet). Auf einer logarithmischen Achse der wahre Positionsfehler und die eigene Ein-Sigma-Schranke des Filters gegen die Zeit seit dem Start. Innerhalb der GNSS-Umlaufbahnen beträgt der Positions-RMS { "1.4" } m; oberhalb davon { "90" } m, mit einem Endfehler von { "184" } m bei { "193,330" } km Höhe mit { "1" } Messung. Der mittlere normierte quadrierte Schätzfehler über den ganzen Lauf ist { "4.4" } (etwa { "3" } für einen konsistenten Positionsblock). Wahrheit und Filter teilen ihre Sonne- und Mond-Ersatzmodelle. MODELLED: eine modellierte Studie aus genannten Eingaben, keine Messung und keine Aussage zum Service Volume irgendeines Systems. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben.

# attr:alt
seg-9a947b61a4cb = Relativnavigation von { "2" } Deputies um einen Chief auf einer hohen Umlaufbahn, aus einem echten Lauf der Engine v{ $version } auf scenarios/gnss-ssv-formation-heo.toml ({ "401" } Epochen). Für jeden Deputy zwei Balken: der relative Positions-RMS aus der Subtraktion der beiden unabhängigen absoluten Schätzungen und aus dem Relativfilter auf einfach differenzierten Pseudoentfernungen. Basislinie { "0.8" } km: { "5.1" } m und { "1.2" } m. Basislinie { "2.0" } km: { "4.1" } m und { "2.1" } m. Der Absolutfilter ist hier nicht konsistent: mittlerer normierter quadrierter Schätzfehler { "187" } gegenüber etwa { "3" } bei einem konsistenten Filter, seine angegebene Unsicherheit ist also viel zu klein. MODELLED: eine modellierte Studie aus genannten Eingaben, keine Messung und keine Aussage zum Service Volume irgendeines Systems. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben.

# attr:alt
seg-d76123040989 = Der aufgezeichnete Vergleich des Verfügbarkeitsmodells für Raumfahrzeugnutzer mit dem öffentlichen Heft zum Space Service Volume, aus den festgeschriebenen Ergebnissen des vorregistrierten Laufs (xval/gnss-ssv/results-run1.json, geschrieben vom Beispiel ssv_booklet_check der Engine v{ $version }). Zielwert für Zielwert die Zellen innerhalb der Toleranz: S0 { "13" } von { "13" } (MET); S1 { "43" } von { "52" } (NOT MET); S2 { "48" } von { "52" } (NOT MET); S3 { "122" } von { "155" } (NOT MET); S4 { "132" } von { "156" } (NOT MET); S5 { "18" } von { "26" } (NOT MET); S6 { "26" } von { "26" } (MET); S7 { "0" } von { "20" } Panel-Diagrammen (NOT MET). Nur S0 und S6 sind unter der vorregistrierten Lesart erreicht. Eine Diagnosevariante, die die anderen GLONASS-Winkel des Hefts verwendet, bringt S1, S2 und S4 auf jede Zelle, ersetzt aber nicht den Lauf der Aufzeichnung. Keine Registerzeile ist VALIDATED. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben.

# text
# c1: docs/SSV.md
seg-74675df154dc = Quelle: <c1/>

# text
# c1: gnss-ssv
seg-ce7ea32e67f1 = GNSS jenseits der Konstellation: die Art <c1/>

# text
seg-389cb131fd77 = Nur beratend. Modellierte Ergebnisse aus angegebenen Eingaben und einer simulierten Wahrheit; keine Zertifizierung, keine flugqualifizierte Größe und keine Aussage über das Service Volume irgendeines Systems. Kshana sendet nichts.

# text
# c1: gnss-ssv
# c2: [shell]
# c3: [trajectory]
# c4: [navigation]
# c5: [formation]
seg-a0011b278269 = Die Art <c1/> beantwortet: Wie viele GNSS-Signale kann ein Raumfahrzeug oberhalb, im Bereich oder weit jenseits der GNSS-Bahnen nutzen, wie stark sind sie, wie gut ist die Geometrie und was kann ein Filter an Bord damit tun? Sie hat drei Modi, gewählt danach, welche Tabelle das Szenario hat: <c2/>, <c3/> oder <c4/> (mit einem optionalen <c5/>).

# text
seg-2e4ac6b7a883 = Status: <b>MODELLED</b>. Die Verfügbarkeits-Sweeps werden unter einer Vorregistrierung mit dem Booklet des ICG Space Service Volume verglichen; siehe <a1>was der Vergleich zeigt</a1>, bevor Sie sich auf irgendeine Zahl verlassen.

# text
seg-a0ff58bccaa8 = Öffentliche Quellen

# text
# c1: xval/gnss-ssv/fetch.sh
seg-4658268e82e1 = <em>The Interoperable Global Navigation Satellite Systems Space Service Volume</em>, United Nations Office for Outer Space Affairs, ST/SPACE/75 ({ "1" }. November { "2018" }), erstellt vom International Committee on GNSS (ICG), Working Group B: die Methode (Anhang B), die Bahnelemente jeder Konstellation (Anhang C), die Sendestrahlbreiten und -leistungen (Tabellen B2, B6, B8, { "4.2" }), die Nutzerantennen (Tabelle B10) und die veröffentlichten Verfügbarkeitstabellen. Es ist selbst eine Simulation. Abgerufen von <c1/> (SHA-256 festgelegt), nie mitgeliefert.

# text
seg-e46d9353e6f3 = U.S. Coast Guard Navigation Center, Antennenpanel-Diagramme von GPS Block IIR und IIR-M (Marquis, { "2014" }): die gemessenen L1-Panel-Diagramme, die nur verwendet werden, um den parametrischen Ersatz zu beurteilen (Zielwert S7). Abgerufen, nie mitgeliefert, keine Diagrammdaten eingecheckt.

# text
# c1: src/ssv/limb.rs
seg-0a002dc0df64 = Die Konstanten des Modells (Gravitation, Erdrotation, Freiraumdämpfung, Rauschdichte) sind Standard; das Gallagher-Dichtegesetz der Plasmasphäre, die Chapman-Schicht und das Profil der Funkrefraktivität sind veröffentlichte Formen, verwendet mit angegebenen einfachen Parametern (siehe <c1/>).

# text
seg-c3c3f63df966 = Shell-Modus: die globale Metrik des Booklets

# text
# c1: [shell]
seg-f1e153c95b13 = <c1/> setzt einen Nutzer auf eine Kugel (standardmäßig { "36,000" } km Höhe mit einer zum Nadir gerichteten halbkugelförmigen Antenne, das obere SSV; oder { "8,000" } km mit einer Rundstrahlantenne, das untere SSV) auf einem Ikosphärengitter mit 2.562 Punkten und zählt über { "14" } Tage in 1-Minuten-Schritten den Anteil der Paare (Nutzer, Epoche) mit mindestens einem und mindestens vier Signalen, je Konstellation und kombiniert, sowie den längsten Ausfall beim ungünstigsten Nutzer. Der Sweep verwendet das geschlossene Sichtbarkeitsintervall im Zentralwinkel (ein Strahlkegel, Erdabschattung durch die Kugel von { "6378" } km plus { "50" } km, die Nutzerhalbkugel und die HF-Reichweitengrenze) und läuft in einem Release-Build in Sekunden; ein Eigenschaftstest prüft ihn gegen das allgemeine geometrische Prädikat.

# text
seg-3fb4c06c8b3f = Trajektorien-Modus: entlang einer Bahn

# text
# c1: [trajectory]
# c2: leo
# c3: meo
# c4: geo
# c5: heo
# c6: lunar-transfer
seg-632fedc95af5 = <c1/> fliegt den Nutzer auf einer keplerschen Bahn (eine Voreinstellung: <c2/>, <c3/>, <c4/>, <c5/> (Tabelle { "5.10" } des Booklets) oder <c6/>, oder Elemente) und meldet je Band und Konstellation die Verfügbarkeit von einem und von vier Signalen, Ausfalldauern, Signale in Sicht, bestes C/N0, Dilution of Precision (Median, 95. Perzentil, ungünstigster Wert), über die Hauptkeule und über Nebenkeulen empfangene Verbindungen sowie eine optionale Zeitreihe und CSV.

# text
# c1: [transmit] pattern
# c2: booklet
# c3: parametric
# c4: table
# c5: pattern_csv
# c6: pattern_text
# c7: xval/gnss-ssv/extract_patterns.py
seg-7bfd301cd789 = <b>Sendediagramm</b> (<c1/>): <c2/> (konstante Leistung innerhalb des Referenzwinkels außerhalb der Blickachse), <c3/> (ein beschrifteter Ersatz: { "3" } dB je Grad jenseits des Referenzwinkels bis zu einem Boden { "25" } dB unter der Hauptkeule; <b>nicht</b> das gemessene Diagramm irgendeines Systems) oder <c4/> (ein gemessenes Diagramm, das Sie liefern: <c5/> oder inline <c6/>; die Panel-Diagramme von Block IIR/IIR-M lassen sich mit <c7/> extrahieren).

# text
seg-c1390929d9f2 = <b>Empfangsantennen</b>: Rundstrahl, Halbkugel oder die Antennen mit hohem Gewinn und die Patch-Antennen aus Tabelle B10 des Booklets, Nadir oder Zenit; jede Verbindung verwendet die Antenne mit dem höheren Gewinn.

# text
# c1: [atmosphere]
seg-fe56ab7a2cac = <b>Medium des Randstrahls</b> (<c1/>): eine Chapman-Ionosphäre, eine Plasmasphäre (Form nach Gallagher { "1988" }, Plasmapause bei L = { "4.5" }, unterhalb von { "1,500" } km abgeflacht) und eine neutrale Atmosphäre (Beugung von etwa { "1.33" } Grad an der Oberfläche, Sauerstoffabsorption, Defokussierung), integriert entlang des geraden Strahls. Meldet die schräge TEC, den plasmasphärischen Anteil, die Zusatzverzögerung, die Tangentenhöhe und die durch Streifen verlorenen Verbindungen. Integration entlang des geraden Strahls: Die Beugung wird gemeldet, nicht iteriert.

# text
# c1: [receiver] weak_signal
seg-1bad91204f6a = <b>Empfänger für schwache Signale</b> (<c1/>): kohärente und nichtkohärente Integration, Datenbitgrenze, Unterstützung und Pilotkanäle, Dopplersuche; die Erfassungsschwelle bei den angegebenen Detektions- und Fehlalarmwahrscheinlichkeiten und die Träger- und Codeverfolgungsschwellen ersetzen die feste C/N0-Schwelle (Bereich { "10" } bis { "25" } dB-Hz). Verwendet die Erfassungs- und Verfolgungsschleifenmodelle der Engine wieder.

# text
seg-497126fe23e9 = Navigationsmodus: ein Filter an Bord

# text
# c1: [navigation]
# c2: [atmosphere]
seg-af7919ae046e = <c1/> fliegt ein Fahrzeug auf hoher Bahn oder auf einem Mondtransfer und lässt ein erweitertes Kalman-Filter mit neun Zuständen laufen (Position, Geschwindigkeit, Empfängeruhrbias und -drift, ein Skalenfaktor für den Strahlungsdruck der Sonne) auf Pseudoentfernungen. Die Wahrheit wird mit Punktmassen-Gravitation, J2, Dritt-Körper-Einfluss von Sonne und Mond und Strahlungsdruck mit zylindrischem Erdschatten integriert; das Filter modelliert Gravitation, J2 und die dritten Körper und schätzt den Strahlungsdruck. Die Pseudoentfernungen stammen aus derselben Streckengeometrie und C/N0-Schwelle wie die Sweeps; ihr Rauschen wächst, wenn das C/N0 fällt; die Zusatzverzögerung des Mediums (mit <c2/>) wird addiert und vom Filter nicht modelliert. Der Bericht trennt den Teil des Laufs innerhalb der GNSS-Bahnen (unterhalb von { "20,000" } km Höhe) vom Teil darüber, gibt die längste Lücke ohne Messung an sowie den mittleren normierten quadrierten Schätzfehler (etwa { "3" } für einen konsistenten Positionsblock). Sonne und Mond sind kreisförmige Ersatzmodelle mit geringer Genauigkeit.

# text
seg-a515950c13d6 = Formationsmodus: Relativnavigation

# text
# c1: [formation]
# c2: [navigation]
seg-8d2b72ca56d9 = <c1/> (braucht <c2/> für den Chief) fügt in der wahren Anomalie versetzte Deputies hinzu. Jedes Fahrzeug lässt das absolute Filter laufen; die Position des Deputy relativ zum Chief wird durch Subtraktion der unabhängigen absoluten Schätzungen und durch ein Relativfilter auf einfach differenzierten Pseudoentfernungen der Signale geschätzt, die beide Fahrzeuge verfolgen. Der Bericht gibt beides an, die Basislinie und die Zahl der gemeinsam verfolgten Signale.

# text
seg-dc78efcb8bcb = Was der Vergleich mit dem Booklet zeigt

# text
# c1: xval/gnss-ssv/PREREGISTRATION.md
# c2: xval/gnss-ssv/RESULTS.md
# c3: results-*.json
# c4: tests/ssv_booklet_results.rs
seg-643bcfcea515 = Die Zielwerte wurden vor dem Lauf in voller Größe vorab festgelegt (<c1/>, Nachträge { "1" } bis { "5" }); Ergebnisse in <c2/>, Zellen in <c3/>, festgeschrieben durch <c4/>, Verfehlungen eingeschlossen.

# text
seg-5498636f8d07 = was

# text
seg-32c0ea7929e2 = Lauf { "1" } (vorab registrierte Lesart)

# text
seg-abe521171d2f = GLONASS-Winkelvariante (Diagnose)

# text
seg-9489ef691574 = minimale Strahlungsleistung, { "13" } Signale, innerhalb von { "0.1" } dB

# text
seg-4b7e0252355c = Geometrie des oberen SSV (Tabelle B4)

# text
seg-e3c870085a6c = NOT MET ({ "43" } von { "52" } Zellen)

# text
seg-b57b1f9b0b43 = alle { "52" } Zellen innerhalb der Toleranz

# text
seg-6bf57763d120 = unteres SSV (Tabelle { "5.2" })

# text
seg-c9349a3a0185 = NOT MET ({ "48" } von { "52" })

# text
seg-056eae8e55d1 = alle { "52" }

# text
seg-805e4402f556 = oberes SSV mit 15/20/25 dB-Hz (Tabelle B9)

# text
seg-a8d9a1f66989 = NOT MET ({ "122" } von { "155" })

# text
seg-7a6fd0eb8f77 = { "153" } von { "155" }

# text
seg-cb1a6f558a09 = sechs GEO-Missionen

# text
seg-e4759e8d2baa = NOT MET ({ "132" } von { "156" })

# text
seg-3e59e79791e2 = alle { "156" }

# text
seg-76d88834ab69 = HEO-Mission

# text
seg-1c06414304a0 = NOT MET ({ "18" } von { "26" })

# text
seg-b1656692859b = { "21" } von { "26" }

# text
seg-d4cedd711485 = Mondmission

# text
seg-b52333886109 = NOT MET ({ "23" } von { "26" })

# text
seg-479a041e2b62 = parametrisches Diagramm gegenüber gemessenen GPS-L1-Panel-Diagrammen

# text
seg-b514bc035c86 = NOT MET (RMS { "6.3" } bis { "8.8" } dB gegenüber { "3" } dB)

# text
seg-dd703fdea949 = Das Booklet ist bei dem Referenzwinkel außerhalb der Blickachse von GLONASS in sich widersprüchlich: Die Tabellen B2 und B6 geben { "20" } und { "28" } Grad an, Tabelle { "4.2" } gibt { "26" } und { "34" } an. Lauf { "1" } verwendete die ersten (was die Vorregistrierung benannte); fast jede Verfehlung in S1 bis S5 betrifft GLONASS. Die Variante, vor ihrem Lauf als Diagnose festgelegt, verwendet die zweiten, und dann stimmen das obere SSV, das untere SSV und die GEO-Missionen Zelle für Zelle überein, Ausfälle eingeschlossen. Die Variante ersetzt Lauf { "1" } nicht. <b>Keine Zeile ist VALIDATED</b>: Das Booklet ist eine Simulation, die Urteilsregel verlangt S0 bis S3 unter der vorab registrierten Lesart, und die übrigen Verfehlungen (GPS L1 bei { "20" } dB-Hz, HEO Galileo, QZSS und NavIC, die lunaren GLONASS-Zeilen) sind nicht erklärt.

# text
seg-6eecf686159b = Ausführen

# text
# c1: kshana.run
# c2: run_scenario
# c3: pattern_csv
# c4: pattern_text
seg-adbb9c22de1c = Jedes mitgelieferte Szenario ist so verkleinert, dass es in Sekunden läuft; der Vergleich in voller Größe ist das obige Beispiel. Dieselbe Art läuft aus Python (<c1/>), im Browser (WebAssembly), auf dem MCP-Server (<c2/>, nur Inline-Text: <c3/> ist eine Dateiquelle und wird zurückgewiesen, verwenden Sie <c4/>) und in den Plugins.

# text
seg-8fa10c8e7ab7 = MODELLED: Nichts hier wurde mit gemessenem GNSS-Empfang im Orbit verglichen. Das Booklet ist eine Simulation.

# text
seg-b34e9acebec0 = Keplersche Zweikörperbahnen für die GNSS-Konstellationen und für den Nutzer in den Sweeps; der Mondtransfer ist eine Zweikörper-Ellipse, keine propagierte Trajektorie.

# text
seg-76aa617ba828 = Das Medium ist ein angegebenes einfaches Modell mit Integration entlang des geraden Strahls; es ist keine Weltraumwettervorhersage.

# text
seg-3114c4249988 = Das Navigationsfilter ist eine Entwurfsstudie: keine Manöver, keine Lage, keine Mehrwegeausbreitung, und die Wahrheit teilt ihre Sonnen- und Mondephemeriden mit dem Filter.

# text
seg-2deafc0f9534 = <s1>Zurück</s1>Lunare Referenzstation

# text
seg-23386861eebf = <s1>Weiter</s1>Mondbahn und Mondoberfläche als Infrastruktur
