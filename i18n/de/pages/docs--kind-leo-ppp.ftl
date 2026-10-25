# docs--kind-leo-ppp: translations (de)

# text
seg-37d29d8303fe = km

# text
seg-cb91473bfdda = Themenseite: <a1>LEO-PNT.md</a1>

# text
seg-a849735fcc6e = Themenseite: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-49964654d5f4 = Szenario-Kind der Engine v{ $version }, Familie <a1>Low-Earth-orbit navigation</a1>. Hinweis (beratend): Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; ein Kind ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung erworben wird: der Abschnitt Evidence der README).

# text
seg-c5478f572d21 = Familienseite: <a1>Low-Earth-orbit navigation</a1>

# text
# c1: docs/kinds/by-kind/leo-ppp.md
seg-8f0aab32310b = Quelle: <c1/>

# text
# c1: leo-ppp
seg-c9852d3b79c8 = <c1/> (Szenario-Kind)

# text
seg-32a570f1a4fa = Konvergenz der präzisen Punktpositionierung (PPP) nur mit GNSS und mit LEO-Stützung: ein erweitertes Kalman-Filter mit Float-Lösung auf ionosphärenfreiem Code und ionosphärenfreier Trägerphase mit den statischen Stationskoordinaten, einer weißen Empfängeruhr, einem Inter-System-Bias je zusätzlichem System, einer als Random Walk modellierten zenitalen feuchten Verzögerung, abgebildet mit 1/sin(Elevation), und einer Float-Mehrdeutigkeit je Satellitenbogen; der präzise Bahn-und-Uhr-Fehler ist weiß und für Code und Phase eines Satelliten gemeinsam, sodass jeder Satellit eine korrelierte Zweizeilen-Aktualisierung in Joseph-stabilisierter Form ist. Die Messungen werden aus demselben Modell mit Seed-Rauschen über mehrere Standorte und Seeds simuliert, und jeder Fall (zuerst nur GNSS, dann jedes [[case]] von LEO-Systemen, beliebige Konstellation oder Voreinstellung) gibt die mediane Konvergenzzeit an (die erste Epoche, nach der die horizontalen und vertikalen Fehler unter den Schwellen bleiben, standardmäßig { "10" } cm), den konvergierten Anteil, die medianen Fehlerkurven und die Konsistenz des Filters (das über die Läufe gemittelte Positions-NEES gegen das zweiseitige { "95" }-%-Chi-Quadrat-Band). Optional neben den veröffentlichten Zahlen für mittlere Breiten von Li et al. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2): { "9.6" } min für Multi-GNSS, verkürzt auf { "7.0" }, { "3.2" }, { "2.1" } und { "1.3" } min mit { "60" }, { "96" }, { "192" } und { "288" } LEO-Satelliten. MODELLED: ein Konsistenzvergleich des Trends, keine Reproduktion der Konstellationen, des Rauschens oder der Stationen jener Studie; keine Auflösung der Mehrdeutigkeit, keine Cycle Slips, kein Phase-Wind-up, keine Gezeiten und keine zeitkorrelierten Produktfehler.

# text
# c1: scenarios/leo-ppp-convergence.toml
seg-8126f4edf6b6 = Ein Lauf von <c1/> fasst sich so zusammen: PPP convergence to { "0.10" } m horizontal / { "0.10" } m vertical, { "12" } runs per case, { "96" } GNSS satellites GNSS only { "0" } LEO median { "7.4" } min converged { "100" }% NEES mean { "3.13" } { "60" } LEO { "60" } LEO median { "4.8" } min converged { "100" }% NEES mean { "3.08" } { "96" } LEO { "96" } LEO median { "3.2" } min converged { "100" }% NEES mean { "2.74" } { "192" } LEO { "192" } LEO median { "2.7" } min converged { "100" }% NEES mean { "2.65" } { "288" } LEO { "288" } LEO median { "2.3" } min converged { "100" }% NEES mean { "3.06" } Li et al. { "2019" } (published, min) vs modelled: { "0" }:9.6/7.4 { "60" }:7.0/4.8 { "96" }:3.2/3.2 { "192" }:2.1/2.7 { "288" }:1.3/2.3

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: runs
# c5: criterion_horizontal_m
# c6: criterion_vertical_m
# c7: compare_li_2019
# c8: noise
# c9: site
# c10: gnss
# c11: case
seg-aee2e93b2c20 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/leo-ppp-convergence.toml
seg-3589a089c89d = Das Beispiel <c1/> setzt unter anderem:

# text
seg-4dbe1423bb57 = { "60" } LEO

# text
seg-85b65d194f0d = { "96" } LEO

# text
seg-2750ec8c218f = Ergebnisbezeichnung (der Engine): MODELLED Float-PPP (ionosphärenfreier Code und ionosphärenfreie Phase, weiße Uhr, als Random Walk modellierte feuchte Verzögerung, Float-Mehrdeutigkeiten je Bogen) auf simulierten Messungen aus demselben Modell; die Zahlen von Li et al. ({ "2019" }) sind ein Vergleich des Trends, keine Reproduktion

# attr:alt
seg-225ef04c64af = Das Diagramm, das die Engine für scenarios/leo-ppp-convergence.toml schreibt, Kind leo-ppp

# text
seg-c75ca72ca711 = <b>MODELLED</b> Ein erweitertes Kalman-Filter mit Float-PPP auf ionosphärenfreiem Code und ionosphärenfreier Phase: statische Koordinaten, eine weiße Empfängeruhr, ein Inter-System-Bias je zusätzlichem System, eine als Random Walk modellierte zenitale feuchte Verzögerung, abgebildet mit 1/sin(Elevation), eine Float-Mehrdeutigkeit je Satel Tests: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-b55fd1cda5fa = <b>MODELLED</b> Ein erweitertes Kalman-Filter mit Float-PPP auf ionosphärenfreiem Code und ionosphärenfreier Phase: statische Koordinaten, eine weiße Empfängeruhr, ein Inter-System-Bias je zusätzlichem System, ein als Random Walk. Orakel (ExternalDataset): Der NEES-Chi-Quadrat-Test ist eine Prüfung der internen Konsistenz (Wahrheit und Filter teilen das Modell). Der Trend wird verglichen mit Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: Multi-GNSS { "9.6" } min, verkürzt auf { "7.0" }, { "3.2" }, { "2.1" } und { "1.3" } min mit { "60" }, { "96" }, { "192" } und { "288" } LEO-Satelliten. Das mitgelieferte Szenario ergibt { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } und { "2.3" } min mit i

# text
# c1: label
seg-302365809dbf = MODELLED Float-PPP (ionosphärenfreier Code und ionosphärenfreie Phase, weiße Uhr, als Random Walk modellierte feuchte Verzögerung, Float-Mehrdeutigkeiten je Bogen) auf simulierten Messungen aus demselben Modell; die Zahlen von Li et al. ({ "2019" }) sind ein Vergleich des Trends, keine Reproduktion (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-6ce77bce8946 = MODELLED: ein Konsistenzvergleich des Trends, keine Reproduktion der Konstellationen, des Rauschens oder der Stationen jener Studie; keine Auflösung der Mehrdeutigkeit, keine Cycle Slips, kein Phase-Wind-up, keine Gezeiten und keine zeitkorrelierten Produktfehler. (Kind-Katalog (<c1/>))

# text
seg-ba2fd25fdcff = Die vier LEO-Konstellationen hier sind repräsentative Walker-Delta-Schalen bei { "1000" } km und { "60" } deg mit { "60" }, { "96" }, { "192" } und { "288" } Satelliten; sie sind NICHT die Designs der Veröffentlichung, und das Rauschen, die Stationen und die Konvergenzdefinition (horizontale und vertikale Fehler unter { "10" } cm bis zum Ende des Laufs) sind die dieses Modells. Der Vergleich ist daher eine MODELLED Konsistenzprüfung des Trends: Die Konvergenz muss sich monoton mit t verkürzen (Kommentar in der Szenariodatei, Zeilen { "10" } bis { "14" })

# text
seg-b641b835570c = Die Konvergenz der präzisen Punktpositionierung nur mit GNSS und mit LEO-Stützung ist MODELLED, nicht validiert: Eine Teilaussage wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-368eb6979183 = <s1>Zurück</s1>leo-pnt-chain

# text
seg-2458954d9c22 = <s1>Weiter</s1>leo-pvt
