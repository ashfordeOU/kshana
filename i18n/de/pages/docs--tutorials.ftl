# docs--tutorials: translations (de)

# text
seg-501402fc366f = Uhren-Holdover

# text
seg-cae10fb9bff8 = Szenario

# text
seg-a0b63210b807 = Mehr lesen

# text
seg-a7cfe6f135f1 = Bahn & Geometrie

# text
seg-835df2d05f2a = GNSS-Messungsbereich

# text
seg-3a0e724a8a2b = Stufe

# text
seg-28e87f407a10 = Bereich

# text
seg-d6476863f862 = Fähigkeit

# text
seg-b03d56f501c3 = Typ

# text
seg-029de6b99be0 = Inertiale Koppelnavigation

# text
seg-9ef8f99ca6e4 = Zeitübertragung

# text
seg-ec26df467b88 = Gemeinsame Kalman-Sensorfusion für PNT über dieselben Hybrid-Eingaben.

# text
seg-4f19d4fb1341 = Generischer N-D-Sweep über ein beliebiges Paket über gepunktete TOML-Schlüssel / JSON-Metrikpfade.

# text
seg-e7ab7b55c969 = 1-D-Trade-Study-Sweep über einen Uhrenpaket-Parameter.

# text
seg-e43910de5fd8 = Notebooks

# text
seg-d78822583c64 = Notebook

# text
# c1: docs/tutorials/README.md
seg-3959aefa12be = Quelle: <c1/>

# text
# c1: tests/tutorials.rs
seg-a5ebe4befda8 = Praxisnahe, durchgespielte Beispiele, die Sie von „ein mitgeliefertes Szenario ausführen“ zu „ein Ergebnis quantifizieren und verteidigen“ führen. Jede in den drei Tutorials genannte Zahl ist eine reale Ausgabe der Engine, verankert an einer externen (nicht zirkulären) maßgeblichen unabhängigen Referenz und <b>durch einen Integrationstest festgeschrieben</b> (<c1/>), sodass ein Tutorial nie unbemerkt von dem abweichen kann, was die Engine tatsächlich tut. Sagt ein Tutorial, dass die optische Uhr { "6600" } s hält, lässt der Test den Build an dem Tag scheitern, an dem das nicht mehr stimmt.

# text
seg-1c045624a6be = Kshana ist ein Simulator für Positionierung, Navigation und Zeitgebung (PNT). Die Tutorials verwenden einige weitere Abkürzungen, die jeweils an der ersten Stelle ausgeschrieben sind: GNSS (Global Navigation Satellite System), GPS (Global Positioning System), CLI (Befehlszeilenschnittstelle) und TOML (Tom's Obvious Minimal Language, das Format der Szenariodatei).

# text
seg-7a84a80b57d5 = Neu im Projekt? Lesen Sie zuerst die <a1>Einführung in die Konzepte</a1> und das <a2>Glossar</a2> und kehren Sie dann hierher zurück.

# text
seg-b4cd44590347 = Die drei durchgespielten Beispiele

# text
seg-eebeab9693b2 = Tutorial

# text
seg-a0bc6e585d71 = Was Sie lernen

# text
seg-b6cc01b76947 = Szenarioart

# text
seg-429bab0a0e05 = Schwierigkeit

# text
seg-0e188f9c0f65 = ~Zeit

# text
seg-bcf40448e55d = Meine erste Umlaufbahn: wo die GPS-Satelliten sind

# text
seg-de1032024a69 = eine reale GPS-Konstellation propagieren, Verfügbarkeit, Positions-DOP (PDOP) und Positionsgenauigkeit lesen und exportieren, wo die Satelliten tatsächlich sind (SP3-Präzisionsbahnformat)

# text
seg-e7b6c262333e = Einsteiger

# text
seg-d6042fb74a5f = { "15" } min

# text
seg-07a8d6cfc1ae = Uhren-Holdover: wie lange können Sie durchhalten

# text
seg-0e9c77468fb2 = einen Uhren-Holdover bei verweigertem GNSS ausführen, die Zeitgebungs-Kennzahl lesen und das dahinterstehende Wachstumsgesetz √(q_wf·T) verstehen

# text
seg-0f6fba31626a = { "20" } min

# text
seg-7973e9c54366 = Quantum gegen Classical bei der GNSS-Resilienz

# text
# c1: spoof
# c2: hybrid
seg-4d8036091b37 = der Abschluss: ein Spoofing-Detektor (<c1/>) und eine vollständige fusionierte PNT-Suite (<c2/>), und wie Sicherheit / Integrität / Koppelnavigation gemeinsam zu lesen sind

# text
seg-1b39d4927602 = fortgeschritten

# text
seg-ea37ac575235 = { "35" } min

# text
# c1: notebooks/
seg-1d56222dfd25 = Ausführbare Jupyter-Notebooks, nur mit synthetischen Daten und öffentlichen Elementsätzen im Repository, liegen in <a1><c1/></a1>:

# text
seg-9aae3a4e10dc = Schiffsvertrauen und Training

# text
seg-1d680d635c6d = einen synthetischen NMEA-Brückenstrom mit einem skriptgesteuerten Ereignis erzeugen und ihn dann mit den Schiffsvertrauens-Monitoren bewerten (beratend, keine typzugelassene Navigationsausrüstung)

# text
seg-739f8f5a9082 = wo Navigationsdaten degradiert aussahen und wie viel einer Route sie betreffen

# text
seg-443c908ff49b = Compliance-Zuordnung und Test-Bench-Export

# text
seg-0d639065192a = wofür eine Reihe von Läufen Belege für öffentliche Framework-Zeilen liefert (nie, dass ein Framework erfüllt ist), und Bewegung und Ereignisse eines Szenarios als Text für einen GNSS-Simulator im Labor exportiert (es wird kein Signal geschrieben)

# text
seg-981a3238794d = Quantum gegen Classical bei GDOP

# text
seg-228ce150ee80 = dieselbe Konstellationsgeometrie mit einem Quantum- und einem Classical-Sensor, verglichen nach Verdünnung der Genauigkeit

# text
seg-4b82b5edd4ff = Himmelsgeometrie unter einer Horizontlinie

# text
seg-1186b6cd6149 = die Satelliten, die ein Standort unter der Horizontlinie einer Straße oder eines Kais sieht, ihr DOP und ihre Fehlerellipse, ein datierter Himmel aus Elementsätzen und eine Monte-Carlo-Simulation mit Seed gegen die Kovarianz (MODELLED)

# text
seg-d9d06cb8e237 = So führen Sie ein Tutorial aus

# text
seg-ffc4ddfc9426 = Jedes Tutorial führt dasselbe Szenario auf drei Arten aus; wählen Sie, was zu Ihnen passt. Alle rufen die <em>eine</em> Engine auf, daher sind die Zahlen identisch (entspricht dem Abschnitt <a1>Verwendung</a1> der README).

# text
# c1: kind
# c2: <scenario>.result.json
# c3: <scenario>.chart.svg
# c4: <scenario>.report.html
# c5: <scenario>.report.json
# c6: <scenario>.table.csv
# c7: realtime-frame-eop
# c8: lunar-time-budget
# c9: lunar-jamming
# c10: leo-navmsg
# c11: telecom-timing
# c12: moonlight-service-volume
seg-e7ba76a06aa6 = <b>Befehlszeile.</b> Die CLI verzweigt nach dem Feld <c1/> des Szenarios und schreibt <c2/>, <c3/>, <c4/> und <c5/> neben die Eingabe (JSON ist JavaScript Object Notation, SVG Scalable Vector Graphics, HTML HyperText Markup Language). Einige Arten veröffentlichen außerdem eine Reproduzierbarkeitstabelle als <c6/> (durch Komma getrennte Werte): <c7/>, <c8/>, <c9/>, <c10/>, <c11/> und <c12/>, wenn ein Exportstandort gesetzt ist. Keines der drei Tutorials gehört dazu, daher sehen Sie diese Datei hier nicht.

# text
# c1: cargo run --
# c2: cargo install kshana
# c3: kshana scenarios/orbit-sgp4-gps.toml
# c4: kshana example
# c5: kshana example orbit-sgp4-gps > orbit-sgp4-gps.toml
# c6: scenarios/orbit-sgp4-gps.toml
seg-5ee6f15d3b08 = <c1/> baut die CLI aus diesem Checkout. Mit einer installierten Binärdatei (<c2/>) lautet derselbe Befehl <c3/>. Ohne Checkout sind die meisten mitgelieferten Szenarien in der Binärdatei enthalten: <c4/> listet sie auf (und nennt die wenigen, die nicht enthalten sind, mit Begründung), und <c5/> schreibt eines aus: die Kopie von <c6/>, mit der die Binärdatei gebaut wurde.

# text
# c1: kshana.run
seg-1b7e851749d5 = <b>Python.</b> Bauen Sie die Erweiterung einmal aus diesem Checkout mit maturin in einer aktiven virtuellen Umgebung und rufen Sie dann <c1/> auf:

# text
# c1: pip install kshana
# c2: json.loads(kshana.list_kinds())
seg-3aa10d551694 = <c1/> installiert stattdessen das veröffentlichte Wheel. Es kann hinter diesem Checkout zurückliegen: <c2/> zeigt Ihnen, welche Szenarioarten Ihr Build hat.

# text
seg-333b7956b06b = <b>Playground im Browser.</b> Ohne Installation: Öffnen Sie das <a1>Studio</a1>, wählen Sie ein Szenario, bearbeiten Sie die Parameter und lesen Sie das Ergebnis. Nichts wird hochgeladen; die Engine läuft clientseitig als WebAssembly.

# text
# c1: scenario + seed + engine version
seg-2cd8bbd1e7f0 = Die Tutorials zitieren die <b>CLI</b>, aber jeder Befehl hat oben das Äquivalent in Python und im Playground. Jedes Ergebnis ist aus <c1/> reproduzierbar: Führen Sie es zweimal aus, und Sie erhalten bitidentische Ausgaben.

# text
seg-d497caeb889a = Kommentierte Lehrszenarien

# text
# c1: .toml
# c2: scenarios/
# c3: # expected:
# c4: scenarios/
# c5: tests/tutorials.rs
seg-c966709a600d = Für jeden Fähigkeitsbereich gibt es eine stark kommentierte Datei <c1/> unter <a1><c2/></a1>: eine <em>Lehrkopie</em> eines kanonischen Szenarios, in der jedes Feld inline erklärt ist, die zitierte unabhängige Referenz genannt wird und die erwartete einzeilige Zusammenfassung als Kommentar <c3/> festgehalten ist. Die Feldwerte sind identisch mit denen des Ursprungs im obersten Verzeichnis <c4/> des Repositorys (<c5/> vergleicht das geparste TOML), sodass die dokumentierte Ausgabe stimmt. Auch die Golden-Hashes bleiben unberührt: Ein Kommentar ändert nie einen Szenario-Hash.

# text
seg-871fcecc5ee1 = Lehrdatei

# text
seg-4e852a6a1581 = Abgeleitet von

# text
seg-e74e1c9b387e = Integrität (RAIM, receiver autonomous integrity monitoring)

# text
seg-95b6cceb76e6 = Sicherheit (Spoofing)

# text
seg-dab48471c270 = Hybrid-PNT

# text
# c1: kind = "spoof"
# c2: 1 − P_md
# c3: kind
seg-c889e5e77121 = Die Lehrdatei für <b>Sicherheit</b> verwendet innen <c1/>: Die Sicherheitskennzahl (<c2/>, eins minus der Wahrscheinlichkeit einer verpassten Erkennung) wird vom Spoof-Paket erzeugt. Der Dateiname folgt der <em>Fähigkeit</em> (Sicherheit), die <c3/> folgt dem <em>Paket</em> (Spoof). Der Kopf dieser Datei weist darauf hin.

# text
seg-89fef83a9d54 = Der vollständige Katalog der Szenarioarten

# text
# c1: kind
# c2: src/api.rs::list_scenario_kinds()
# c3: 87
# c4: list_kinds()
# c5: kshana kinds --json
# c6: SCENARIOS.md
# c7: tests/tutorials.rs::tutorial_scenarios_use_real_kinds
seg-648bb07212cd = Die Engine verzweigt nach dem Feld <c1/> des Szenarios. Die Tabelle unten listet die am häufigsten verwendeten Arten (die acht Tutorial-Bereiche oben plus ihre nächsten Nachbarn). Sie ist <b>nicht</b> die vollständige Menge: <c2/> gibt alle <c3/> eingebauten Arten zurück. Diese Funktion (als <c4/> in den Bindungen für Python und WebAssembly (WASM) und als <c5/> in der Befehlszeile verfügbar) ist der maßgebliche, stets aktuelle Katalog, und <a1><c6/></a1> ist ihre erzeugte Aufzählung, ein Abschnitt je Art mit den erforderlichen und optionalen TOML-Feldern. <c7/> stellt sicher, dass jede in einem Tutorial dokumentierte Art eine reale Dispatch-Art ist, sodass nichts in dieser Tabelle eine nicht existierende Art nennen kann.

# text
# c1: runs > 1
seg-0f744a3a7193 = Uhren-Holdover gegen Vorgabe; optionales Monte-Carlo-Ensemble (<c1/>).

# text
seg-9a2564fdc86a = 1-DOF-Koppelnavigation (ein Freiheitsgrad) während eines GNSS-Ausfalls.

# text
seg-62f0400581b3 = GNSS-Verfügbarkeit + Verdünnung der Genauigkeit (DOP) aus einer Konstellation (Walker / Zweizeilen-Bahnelemente / RINEX, das Receiver Independent Exchange Format).

# text
seg-59fc8330ba12 = Snapshot / Solution-Separation / ARAIM (advanced RAIM) mit horizontalen und vertikalen Schutzniveaus (HPL/VPL) + Stanford-Diagramm.

# text
seg-22c598d57e77 = Durchgang mit ARAIM-Schutzniveaus am Mond-Südpol gegen eine LunaNet-Relaismenge.

# text
seg-f97d8fb3b6fa = Optische gegen Hochfrequenz-(HF-)Zweiwege-Zeit-/Frequenzübertragung.

# text
seg-8af1c652d854 = Hybrid-PNT-Abschluss: Uhr + Inertialmesseinheit (IMU) + Stützung durch Zeitübertragung.

# text
seg-d24a9596f53e = Lose und eng gekoppeltes GNSS/INS (Inertialnavigationssystem), erweiterter Kalman-Filter im Fehlerzustand.

# text
seg-3c915870476a = Simulation von Pseudoentfernungen im Messbereich (Klobuchar-Ionosphäre, Saastamoinen-/Niell-Troposphäre) + RAIM.

# text
seg-72284bad54e4 = Jamming nach Link-Budget: Störer-zu-Signal-Verhältnis (J/S) → effektive Träger-Rausch-Dichte (C/N₀) → Verlust der Verriegelung.

# text
seg-2ead4d42b427 = Stochastischer Zeit-Spoof-Detektor (Neyman–Pearson / χ²₁) mit Monte-Carlo-Wahrscheinlichkeiten für Fehlalarm und verpasste Erkennung (P_fa/P_md).

# text
seg-5f2f9e63093a = Über die Tutorials hinaus: neuere Fähigkeiten

# text
# c1: cargo run -- <file>
# c2: kshana <file>
# c3: tests/tutorials.rs
# c4: label
seg-3d6a8fd31402 = Die drei Tutorials bleiben bei den klassischen Paketen für Uhr, Orbit und Sicherheit. Die Engine ist weit darüber hinausgewachsen. Jede Zeile unten ist ein mitgeliefertes Szenario, das Sie unverändert ausführen können (<c1/> oder <c2/>); die Zusammenfassung ist die erste Zeile, die kshana { "0.35.0" } dafür am 2026-10-10 ausgegeben hat. Anders als die Zahlen der Tutorials sind diese Zeilen die Aufzeichnung eines einzelnen Laufs und nicht durch <c3/> festgeschrieben: Führen Sie das Szenario erneut aus, um den aktuellen Wert zu erhalten. Die Ergebnisse geben ihren eigenen Geltungsbereich an (die meisten tragen ein <c4/>), und die <a1>Verifikationsmatrix</a1> gibt an, welche Fähigkeiten gegen eine externe unabhängige Referenz VALIDATED und welche MODELLED sind.

# text
seg-2dc1d8680abb = Erste Zeile der Zusammenfassung

# text
seg-abd799395f27 = L-Band-Spektrum und Jamming-Wasserfall

# text
seg-33453b2cfdf3 = Das Sonnensystem zu einer Epoche

# text
seg-23bc4ff7f741 = Positionierung um einen anderen Körper

# text
seg-c135b151e469 = Konstellationsdesign im großen Maßstab

# text
seg-065995e9bd5e = Kampagnen: Arten, verkettet auf einer Zeitleiste

# text
seg-dbae357e7e34 = Ein LEO-PNT-System von Ende zu Ende

# text
seg-9d3d72ea03df = Fusionierte MEO- und LEO-Positionierung

# text
seg-acc2793d1721 = LEO-Signale, Durchgänge und Navigationsnachrichten

# text
# c1: LEO pass link budget, air user at 50.00, -30.00; 1 LEO satellite(s), 900 s window
seg-db2626e54a24 = <c1/> (der Durchgang)

# text
seg-319ddeeb8205 = <a1>LEO-SIGNAL.md</a1>, <a2>LEO-PASS.md</a2>, <a3>LEO-NAVMSG.md</a3>

# text
seg-aa93235e8c6d = PPP-Konvergenz mit einer LEO-Schicht; 5G-Positionierung

# text
seg-01160980ce50 = Resilienz: GNSS gestört, LEO trägt den Nutzer

# text
seg-adf8453bc035 = Vertikale Märkte: Schiene, See, Telekommunikation, Fahrzeuge, Arktis

# text
# c1: scenarios/leo-vertical-rail-maritime.toml
# c2: leo-vertical-*
seg-15a5098b5045 = <c1/> (und die anderen Dateien <c2/>)

# text
seg-e6494ed83ee3 = Telecom-Holdover gegen die Uhrengrenzwerte nach ITU-T (International Telecommunication Union, Telecommunication Standardization Sector) G.8272

# text
seg-dfc04f1abe82 = LEO ist die niedrige Erdumlaufbahn und MEO die mittlere Erdumlaufbahn; PVT ist Position, Geschwindigkeit und Zeit; PPP ist die präzise Punktpositionierung; 5G ist der Mobilfunkstandard der fünften Generation; TDB ist die baryzentrische dynamische Zeit; JD ist das Julianische Datum; TE ist der Zeitfehler.

# text
seg-1d45d94f2e5b = Die CLI fügt zu jedem Lauf drei Ausgaben hinzu:

# text
# c1: <scenario>.report.html
# c2: <scenario>.report.json
# c3: kshana --study <suite.toml>
# c4: .study.json
# c5: .study.html
# c6: kshana --study scenarios/quantum-pnt-demonstrator.suite.toml
seg-893276648fec = <b>Berichte.</b> Jeder Lauf schreibt <c1/> und <c2/> (siehe <a1>REPORTS.md</a1>). <c3/> führt eine Suite von Szenarien in ein <c4/> und ein <c5/> zusammen, zum Beispiel <c6/>.

# text
# c1: kshana <scenario.toml> --animate <svg|html|frames|all>
# c2: --animate html
# c3: scenarios/orbit-sgp4-gps.toml
# c4: orbit-sgp4-gps.animation.html
# c5: solar-system
seg-e9f06d47c82c = <c1/> stellt die Zeitreihen des Laufs dar, zum Beispiel schreibt <c2/> auf <c3/> die Datei <c4/>. Eine Art ohne abgetastete Zeitachse (wie <c5/>) wird mit einem Fehler abgelehnt; siehe <a1>ANIMATION.md</a1>.

# text
seg-f037fe5d7ffa = Interop-Exporte.

# text
# c1: --export <czml|kml|geojson|stk|sigmf|all|list>
# c2: --export list
# c3: spectrum
# c4: --export-sp3
# c5: --export-omm
# c6: --export-oem
seg-3977722b8517 = <c1/> schreibt das Ergebnis für andere Werkzeuge: CZML (Cesium Language), KML (Keyhole Markup Language, für Google Earth), GeoJSON (geografisches JSON), eine STK-Ephemeride (Systems Tool Kit) oder eine SigMF-Aufzeichnung (Signal Metadata Format). <c2/> nennt, welche Formate für ein Szenario gelten; SigMF gilt nur für <c3/>. Das Orbit-Paket exportiert außerdem <c4/>, <c5/> und <c6/> (CCSDS, das Consultative Committee for Space Data Systems, Bahnnachrichten). Siehe <a1>INTEROP.md</a1>.

# text
seg-3abd51182cc0 = Abgestufte Übungen

# text
# c1: exercises/
seg-9513af4fb862 = Arbeiten Sie die Leiter durch. Jede Stufe ist schwerer und belastbarer als die vorige; Referenzlösungen liegen in <a1><c1/></a1>.

# text
seg-89ad8eb64a54 = Ziel

# text
seg-0a824838ef57 = Was Sie tun

# text
seg-2463a86470b8 = Referenzlösung

# text
seg-7ce3ac2347b9 = Stufe { "1" } — ausführen und lesen

# text
seg-e1dee35aedff = ein mitgeliefertes Szenario unverändert ausführen und eine Kennzahl lesen

# text
# c1: scenarios/clock-holdover.toml
# c2: holdover_s
seg-296694716b3b = Führen Sie <c1/> aus; geben Sie das <c2/> von Quantum gegen Classical aus. CLI, Playground oder ein einzeiliger Python-Aufruf.

# text
seg-bad6d3afb6a0 = Stufe { "2" } — bearbeiten und durchlaufen

# text
seg-c18da238e470 = einen Parameter ändern und eine monotone Wirkung beobachten

# text
# c1: threshold_ns
# c2: kind = "sweep"
# c3: "sweep-nd"
seg-598ca8efea83 = Verschärfen Sie die Uhrenvorgabe (<c1/>) oder verlängern Sie den Ausfall und beobachten Sie, wie der Holdover sinkt; oder verwenden Sie <c2/>/<c3/>, um ihn zu tabellieren.

# text
seg-1d9dfecce6fa = Stufe { "3" } — quantifizieren und verteidigen

# text
seg-5b57f2c8ffb9 = Monte-Carlo, Konfidenzbänder, Reproduzierbarkeit und ein Schutzniveau

# text
# c1: runs = N
# c2: scenario_hash
seg-0fac2036b289 = Führen Sie ein Uhren-Ensemble aus (<c1/>), lesen Sie das Band [p05–p95], bestätigen Sie, dass zwei Läufe ein identisches <c2/> ergeben, und lesen Sie ein Integritäts-/Stanford-Ergebnis.

# text
# c1: maturin develop --features python
# c2: tier2_sweep.py
seg-45dc753da682 = Die Referenzlösungen verwenden die Python-Erweiterung (zuerst <c1/>). Aus dem Wurzelverzeichnis des Repositorys ausgeführt, gibt <c2/> aus, wie der Holdover der Chip-Scale-Atomuhr von { "2610" } s bei einer Vorgabe von { "20" } ns auf { "1140" } s bei { "5" } ns fällt.

# text
seg-e59b1beadb98 = Frische Daten gewünscht?

# text
seg-530db2e609d0 = Die Titelzahlen dieser Tutorials laufen vollständig aus Szenarien, die bereits im Repository liegen. Nichts wird abgerufen, wodurch sie reproduzierbar bleiben und sich gefahrlos in der kontinuierlichen Integration (CI) ausführen lassen. Für die „Erweitern Sie es“-Übungen können Sie Live-Daten ziehen:

# text
# c1: scripts/fetch_tles.sh
seg-6a20ec96cb92 = <b>GPS-Zweizeilen-Bahnelemente (TLEs)</b> (die Orbit-Konstellation auffrischen): <a1>https://celestrak.org/NORAD/elements/gp.php?GROUP=gps-ops&FORMAT=tle</a1>, Klartext-Elementsätze mit 3 Zeilen (Name + Zeile { "1" } + Zeile { "2" }). Hilfsskript: <c1/>. Offene Daten (Katalog der 18th Space Defense Squadron der US Space Force, weiterverbreitet von Celestrak, Dr. T. S. Kelso).

# text
# c1: tests/sgp4_verification.rs
# c2: docs/SGP4-VALIDATION.md
seg-9bcea1d9eb12 = <b>Verifikationsreferenz für SGP4 (Simplified General Perturbations { "4" })</b> (bereits eingebunden, nicht erneut abrufen): die Testvektoren „Revisiting Spacetrack Report #3“ von AIAA (American Institute of Aeronautics and Astronautics) 2006-6753, <a1>https://celestrak.org/publications/AIAA/2006-6753/</a1>, verwendet von <c1/>; siehe <a2><c2/></a2>.

# text
seg-d33aa34b2762 = <b>Referenz für Uhrenstabilitätsbeziehungen</b>: NIST (National Institute of Standards and Technology) Special Publication { "1065" } (Riley, <em>Handbook of Frequency Stability Analysis</em>), <a1>https://tf.nist.gov/general/pdf/2220.pdf</a1>, die Beziehungen σ_y(τ)↔Phase hinter Tutorial { "2" }.

# text
seg-36be39f17e35 = <s1>Zurück</s1>Studio-Anleitung

# text
seg-6f6204737a87 = <s1>Weiter</s1>{ "1" } · Ihre erste Umlaufbahn
