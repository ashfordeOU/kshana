# docs--tutorial-first-orbit: translations (de)

# text
seg-51ae9468b92a = Was dieses Szenario ist

# text
seg-08f3fdc9252a = Die einzeilige Zusammenfassung lesen

# text
seg-def5271a207d = Was der Test festschreibt

# text
seg-e5f926d1055b = Fallstricke und Einheiten

# text
seg-cb457294fc53 = Wie es weitergeht

# text
# c1: docs/tutorials/01-first-orbit.md
seg-dcb2d0b170c1 = Quelle: <c1/>

# text
seg-f57d8b38bf08 = Tutorial { "1" } — Meine erste Umlaufbahn: wo die GPS-Satelliten sind

# text
# c1: orbit
# c2: scenarios/orbit-sgp4-gps.toml
# c3: scenarios/orbit.toml
seg-1b9e1178555d = <c1/> · <b>Szenario:</b> <c2/> (Lehrkopie: <a1><c3/></a1>) · <b>Schwierigkeit:</b> Einsteiger · <b>~{ "15" } min</b>

# text
seg-d065731294a1 = Am Ende haben Sie die <em>reale</em> operative GPS-Konstellation propagiert, ihre Verfügbarkeit und Geometrie gelesen und eine Tabelle exportiert, wo sich jeder Satellit tatsächlich im Raum befindet — und Sie wissen, dass diese Tabelle gegen eine externe Referenz validiert ist, nicht gegen sich selbst.

# text
seg-b07bb365235d = GPS-Satelliten (Global Positioning System) sagen einem Nutzer, <em>wo er ist</em> und <em>wie spät es ist</em>. Zuvor müssen Sie wissen, <b>wo die Satelliten sind</b> und <b>wie viele davon ein Nutzer sehen kann</b>. Das ist Geometrie, und die Geometrie legt die Untergrenze dafür fest, wie genau Sie positioniert werden können (die Verdünnung der Genauigkeit, englisch dilution of precision, DOP). Dieses Tutorial:

# text
# c1: gps-ops
seg-dec5079e7715 = nimmt einen echten Schnappschuss <c1/> von Celestrak der GPS-Konstellation (2021-07-28, { "30" } Satelliten, echte Zweizeilen-Bahnelemente, TLEs),

# text
seg-693859c435d8 = propagiert jeden Satelliten mit dem validierten SGP4/SDP4-Modell (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }),

# text
seg-74b73260c7bc = ermittelt in jedem Zeitschritt, welche Satelliten ein Nutzer in niedriger Erdumlaufbahn sehen kann (Sichtlinie, Erdverdeckung und eine Elevationsmaske von { "5" }°),

# text
seg-605c40b73e96 = macht aus dieser Geometrie einen <b>PDOP</b> (Positions-DOP) und eine <b>Positionsgenauigkeit</b> und

# text
seg-356e96d219b5 = exportiert die tatsächlichen erdzentrierten, erdfesten (ECEF) Positionen der Satelliten in eine SP3-Datei (Standard Product { "3" }, das Präzisionsbahnformat des International GNSS Service, IGS; GNSS ist Global Navigation Satellite System).

# text
seg-ff1666fe175e = Das Rückgrat ist: <b>TLE → SGP4-Propagation → ECEF je Epoche → Sichtbarkeit → Zahl sichtbarer Satelliten → PDOP → Positions-Sigma = PDOP · σ_UERE</b>, wobei σ_UERE der äquivalente Nutzer-Entfernungsfehler ist (der 1-σ-Entfernungsmessfehler je Satellit).

# text
seg-379da723ae57 = Oder öffnen Sie das <a1>Studio im Browser</a1> und wählen Sie das Orbit-Szenario.

# text
seg-441743833f1e = Der deterministische Lauf (Seed = { "17" }) gibt aus:

# text
seg-918a30fea48a = Feld für Feld:

# text
# c1: scenario 4c51512369a6
seg-375fad797dcf = <b><c1/></b> — der 12-stellige Szenario-Hash. Er ist der Fingerabdruck der genauen Eingaben (Seed, Schwellen, Modellparameter, der TLE-Block). Ändern Sie eine Eingabe, ändert er sich; halten Sie sie gleich, reproduzieren Sie den Lauf bitgenau. Derselbe Hash steht in der Fußzeile des Diagramms und in der Ergebnisdatei im JSON-Format (JavaScript Object Notation).

# text
# c1: 345/361 samples GNSS-nominal
seg-133711d1ad9f = <b><c1/></b> — von den { "361" } Zeitschritten hat der Nutzer in { "345" } davon eine brauchbare Lösung ({ "95.6" } %). Der Lauf ist ein Durchgang von { "12" } h ({ "43,200" } s) mit einer Schrittweite von { "120" } s.

# text
# c1: best PDOP 1.07
seg-a500c0473784 = <b><c1/></b> — der beste (niedrigste) PDOP über den Durchgang. Ein PDOP nahe { "1" } ist eine hervorragende Geometrie; je niedriger, desto besser.

# text
# c1: pos 1.07m
# c2: sigma_uere_m = 1.0
seg-98a24f0170d2 = <b><c1/></b> — die beste Positionsgenauigkeit: <b>Positions-Sigma = PDOP · σ_UERE</b>. In diesem Szenario gilt <c2/>, daher sind die beiden Zahlen hier <em>numerisch gleich</em> — aber die Regel lautet PDOP × UERE, <b>nicht</b> „Position = PDOP“. Bei einem UERE von { "3" } m läge das Positions-Sigma bei ~{ "3.2" } m. (Siehe den Fallstrick am Ende.)

# text
# c1: holdover
# c2: p95
# c3: integrity
# c4: security
# c5: security
# c6: n/a (no attack)
seg-410081c6dcab = Die Uhrenangaben (<c1/>, <c2/>, <c3/>, <c4/>) kommen mit, weil das Orbit-Paket während des Durchgangs auch eine Uhr führt; sie stehen im Mittelpunkt von <a1>Tutorial { "2" }</a1>, nicht dieses. (<c5/> lautet <c6/>, weil kein Angriff konfiguriert ist.)

# text
seg-95ccef0d94ae = Der Geometrieblock im JSON enthält die zugrunde liegenden Zahlen:

# text
seg-89cb7db9b9eb = Wo sind die Satelliten? (der Ertrag)

# text
seg-81678afa0cee = Die Geometrie ist gut, <em>weil</em> die Satelliten wirklich in der GPS-Schale stehen. Beweisen Sie es — exportieren Sie ihre erdfesten Positionen:

# text
seg-1452dfac9e06 = Die ersten drei Satelliten im ersten Abtastschritt, ECEF in km (die SP3-Datei enthält eine vierte Spalte für die Uhr, geschrieben als Marker „kein Wert“ { "999999.999999" }):

# text
seg-4fd0f95da0cf = Nehmen Sie den geozentrischen Radius von PG01:

# text
seg-cb02d7c01561 = Die nicht zirkuläre unabhängige Referenz: ist das wirklich eine GPS-Umlaufbahn?

# text
seg-a7c478360464 = Ein Tutorial, das die Engine gegen sich selbst prüft, beweist nichts. Hier ist der externe, <em>nicht zirkuläre</em> Anker für jede obige Aussage.

# text
# c1: a
# c2: tests/tutorials.rs::tutorial1_satellites_are_in_the_gps_meo_shell
# c3: 26000 km < |r(PG01)| < 27200 km
# c4: a
seg-eec62069a957 = <b>{ "1" }. Die Satelliten liegen auf der realen mittleren Erdumlaufbahn-Schale (MEO) des GPS.</b> Die nominelle große Halbachse von GPS beträgt <b>a = { "26,560" } km</b>, die Höhe ≈ { "20,180" } km über dem mittleren Erdradius von { "6,378" } km (IS-GPS-200, die GPS-Schnittstellenspezifikation; der GPS Standard Positioning Service (SPS) Performance Standard, US-Verteidigungsministerium (DoD); Misra & Enge, <em>Global Positioning System</em>, 2. Aufl.). Der momentane Radius von PG01 von <b>{ "26,480.9" } km</b> liegt wenige hundert km von <c1/> entfernt — genau das, was die reale GPS-Exzentrizität (~{ "0.005" }–{ "0.02" }) erzeugt. Der Test <c2/> prüft <c3/> gegen dieses veröffentlichte <c4/>, das <b>extern zu Kshana</b> ist.

# text
# c1: T = 2π√(a³/μ)
# c2: a = 26,560 km
# c3: μ = 398,600.4418 km³/s²
# c4: T = 43,078 s = 11.967 h
seg-a052774de08f = <b>{ "2" }. Die Länge des Durchgangs ist ein GPS-Umlauf.</b> Das dritte Keplersche Gesetz liefert die Umlaufzeit <c1/> mit <c2/> und <c3/> (World Geodetic System { "1984" }, WGS-84; technischer Bericht NIMA TR8350.2 der National Imagery and Mapping Agency): <c4/>, ein halber Sterntag. Die Szenariodauer von { "43,200" } s („~ein GPS-Umlauf“) stimmt damit auf unter { "0.3" } % überein, und die GPS-Bodenspur wiederholt sich laut IS-GPS-200 jeden Sterntag (zwei Umläufe).

# text
# c1: tests/sgp4_verification.rs
# c2: docs/SGP4-VALIDATION.md
# c3: sgp4
seg-067fb466e396 = <b>{ "3" }. Die propagierten Positionen sind validiert, nicht selbstkonsistent.</b> Der SGP4/SDP4-Propagator, der diese ECEF-Tabelle erzeugt hat, stimmt mit <b>allen { "666" } Verifikationsvektoren AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 im ungünstigsten Fall auf { "4.12" } mm</b> überein (<c1/>, <a1><c2/></a1>) und stimmt mit der unabhängigen Crate <c3/> im Submikrometerbereich überein. Die exportierte Tabelle ist also gegen eine externe Referenzimplementierung geprüft, nicht gegen die eigene Arithmetik von Kshana.

# text
seg-652ec3b3d3b8 = <b>Ein Hinweis zu den SP3-Daten.</b> Der SP3-Epochenkopf zeigt ein Platzhalter-Kalenderdatum (2000-01-01); die Propagation läuft tatsächlich ab der eigenen Epoche jedes TLE ({ "2021" }). Lesen Sie die Tabelle als „ECEF-Positionen im ersten Abtastschritt“, nicht als „am { "1" }. Januar { "2000" }“.

# text
# c1: tests/tutorials.rs
seg-74dcb96a27a9 = <c1/> macht jede obige Zahl zu einem CI-Vertrag:

# text
# c1: tutorial1_orbit_headline_holds
# c2: best_pdop ≈ 1.071
# c3: best_position_sigma_m == best_pdop
# c4: sigma_uere_m = 1.0
# c5: samples_total == 361
# c6: 345/361
seg-cbad1e83279d = <c1/> — <c2/>, <c3/> (weil <c4/>), <c5/>, und die Zusammenfassung enthält <c6/>.

# text
# c1: tutorial1_satellites_are_in_the_gps_meo_shell
# c2: a = 26,560 km
seg-241d75b1502b = <c1/> — der Radius von PG01 liegt im Band der GPS-Schale, geprüft gegen das veröffentlichte <c2/>.

# text
seg-34328f4f148b = Wenn die Engine jemals aufhört, eine reale GPS-Schale zu erzeugen, wird der Build rot.

# text
# c1: sigma_uere_m = 1.0
seg-3c23c11911cb = <b>Positions-Sigma ist PDOP × UERE, nicht PDOP.</b> Die beiden sind nur gleich, <em>weil</em> hier <c1/> gilt. Ändern Sie das UERE, und sie gehen auseinander.

# text
seg-6bb2f31c15dc = <b>Die Zeitgebungsangaben sind in Nanosekunden</b>, die Positionsangabe in Metern. Vermischen Sie sie nicht.

# text
# c1: holdover_s
seg-5bc68d0c144d = <b><c1/> ist rasterquantisiert</b> (eine untere Schranke bei der Schrittweite des Zeitrasters). In diesem Durchgang hat der Nutzer im Wesentlichen immer eine Lösung, daher ist der Holdover { "0" } s (kein Ausfall zum Überbrücken) — das ist der <em>gute</em> Fall.

# text
# c1: mask_deg
seg-9c36a5c64af5 = Verengen oder erweitern Sie die Elevationsmaske (<c1/>) und beobachten Sie, wie sich die Verfügbarkeit ändert — das ist eine Übung der Stufe 2.

# text
# c1: scripts/fetch_tles.sh
seg-b0222934237e = Tauschen Sie mit <c1/> einen frischen TLE-Schnappschuss ein (Stufe 2, „frische Daten verwenden“).

# text
seg-e487166204f8 = Weiter mit <a1>Tutorial { "2" } — Uhren-Holdover</a1>, wo das GNSS-Signal <em>weggenommen</em> wird und die Borduhr durchhalten muss.

# text
seg-795315608752 = <s1>Zurück</s1>Tutorials

# text
seg-97ca5a3cc77e = <s1>Weiter</s1>{ "2" } · Uhren-Holdover
