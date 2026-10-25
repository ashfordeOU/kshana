# docs--kind-leo-navmsg: translations (de)

# text
seg-debc2f07db78 = true

# text
seg-cb91473bfdda = Themenseite: <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-1d65b71c5de0 = { "5" } mitgelieferte Szenarien verwenden diese Art; die anderen sind in <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/leo-navmsg.md
seg-648c27220789 = Quelle: <c1/>

# text
seg-867f3e41b5ab = LEO-Navigationsnachricht: die ausgesendete Ephemeride und Uhr eines Satelliten für Positionierung, Navigation und Zeitgebung im niedrigen Erdorbit (LEO), für jede Bahn, jeden Träger und jedes Modell, mit optionalen benannten Voreinstellungen (Xona Pulsar, Iridium, Starlink, CentiSpace, ein repräsentatives C-Band-System, das ATOMIC-Nulluhr-Modell, Celeste IOD). INHALT: Hilfsdaten (SVID, Datenausgabestand, Band, Signalzustand), Synchronisation (Woche, Wochensekunde, ein Uhrenpolynom zweiter Ordnung af0-af2 um toc), Ephemeride in einem von vier Modellen -- dem 16-Parameter-Kepler-Satz des Galileo OS SIS ICD; diesem Satz plus Korrekturpolynomen in Flugrichtung, quer zur Flugrichtung und radial; dem 22-Parameter-Modell nach Liu et al. { "2025" }; einem ECEF-Polynom ohne Uhrenterme (ATOMIC-Nulluhr) -- und weitere Dienste (ein ausgesendeter Klobuchar-Satz, NeQuick-G ai0-ai2 mit dem effektiven Ionisationsniveau und Parameter von Systemzeit zu UTC mit der Schaltsekundenlogik des ICD). FITTER: eine Wahrheitsbahn, integriert mit zonaler J2-J6- oder EGM2008-Schwere bis zum gewählten Grad und mit Luftwiderstand, und eine mit Seed erzeugte freie oder gesteuerte Uhr; Levenberg-Marquardt-Anpassung des Kepler-Satzes auf nichtsingulären Elementen, dann lineare Korrekturpolynome nach kleinsten Quadraten; Uhr angepasst abzüglich des relativistischen Terms, den der Nutzer hinzufügt. ANALYSEN: fit-interval-trade (Signal-in-Space-Entfernungsfehler, SISRE, mit global gemittelten Gewichten für die Bahnhöhe, gegen Anpassungsintervall und Aktualisierungsperiode, nur Bahn und mit Uhr), model-comparison (vier Modelle, Parameterzahl, codierte Bits und die Anpassung von Kshana bei den Höhen von Liu et al. neben den veröffentlichten Werten), midpass-update (der höchste Überflug über einem Nutzer, der Sprung von Position, Uhr und Nutzerentfernung bei jedem Nachrichtenwechsel, der Sprung bei schlechtester Geometrie, PASS/FAIL gegen eine Kontinuitätsschwelle), encode-decode (das eigene dokumentierte Binärframe von Kshana mit CRC-24Q, ein Quantisierungsbudget von je einem halben Schritt pro Feld, eine Prüfung eines beschädigten Frames, ein Export und Import von Datensätzen im RINEX-4-Stil, bezeichnet als Kshana-Erweiterung, und eine CSV-Tabelle). VALIDATED: die SISRE-Gewichte gegen die veröffentlichte MEO/GEO-Tabelle (Montenbruck et al. { "2018" }); der Galileo-Nutzeralgorithmus gegen RTKLIB auf realen Galileo-Broadcast-Ephemeriden; CRC-24Q gegen seinen Katalog-Prüfwert und den RTCM-{ "1005" }-Beispielframe. MODELLED: Jede Anpassungs- und SISRE-Zahl ist ein Darstellungsfehler gegen eine von Kshana integrierte Wahrheit (kein Bahnbestimmungs- oder Vorhersagefehler); der Vergleich mit Liu et al. verwendet andere Bahnen; die Codierungs- und Textformate sind die eigenen von Kshana.

# text
# c1: scenarios/leo-navmsg-celeste-iod.toml
seg-e5a4f0290e9e = Ein Lauf von <c1/> fasst sich so zusammen: LEO navigation message — { "510" } km, { "97.4" } deg, gravity degree { "20" }, model kepler-rac SISRE weights: w_R { "0.459" }, w_AC^{ "2" } 1/2.53 (mask { "0" } deg) encode-decode: kepler-rac model, frame { "152" } bytes ({ "1156" } payload bits, { "891" } ephemeris+clock bits), CRC-24Q 0x58ADF2 quantisation: largest position change { "0.52" } mm, clock { "0.09" } mm; SISRE exact { "0.0013" } m, quantised { "0.0013" } m corrupted frame rejected: true; RINEX round trip { "4.43e-6" } m; CSV round trip { "0.00e0" } m fit-interval trade over { "1800" } s (usage period = fit interval): kepler16 { "60" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0006" } m kepler16 { "120" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0007" } m kepler16 { "300" } s SISRE orbit RMS { "0.0036" } m max { "0.0141" } m with clock RMS { "0.0037" } m kepler16 { "600" } s SISRE orbit RMS { "0.0293" } m max { "0.1023" } m with clock RMS { "0.0293" } m kepler16 { "900" } s SISRE orbit RMS { "0.1073" } m max { "0.3812" } m with clock RMS { "0.1075" } m kepler-rac { "60" } s SISRE orbit RMS { "0.0000" } m max { "0.0000" } m with clock RMS { "0.0005" } m kepler-rac { "120" } s SISRE orbit RMS { "0.0001" } m max { "0.0002" } m with clock RMS { "0.0007" } m kepler-rac { "300" } s SISRE orbit RMS { "0.0005" } m max { "0.0021" } m with clock RMS { "0.0012" } m kepler-rac { "600" } s SISRE orbit RMS { "0.0097" } m max { "0.0395" } m with clock RMS { "0.0096" } m kepler-rac { "900" } s SISRE orbit RMS { "0.0388" } m max { "0.1143" } m with clock RMS { "0.0390" } m Der 16-Parameter-Kepler-Satz verschlechtert sich von { "0.0003" } m bei { "60" } s auf { "0.1073" } m bei { "900" } s: Ein Kepler-Satz mit zweimal pro Umlauf auftretenden Harmonischen kann den höherfrequenten Schweretermen und dem Luftwiderstand eines LEO-Bogens nicht länger als einige Minuten folgen, und sein Residuum nach kleinsten Quadraten schwingt über das Fenster. Die Polynome in Flugrichtung/quer/radial, von höherem Grad, als der Kepler-Satz abdeckt, nehmen auf, was übrig bleibt, und ergeben { "0.0388" } m bei { "900" } s.

# text
# c1: name
# c2: description
# c3: seed
# c4: analysis
# c5: preset
# c6: orbit
# c7: clock
# c8: message
# c9: trade
# c10: comparison
# c11: midpass
seg-3f299f6b20c8 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/leo-navmsg-celeste-iod.toml
seg-3adfcd7e275c = Das Beispiel <c1/> setzt unter anderem:

# text
seg-8243db187e2f = [encode-decode, fit-interval-trade]

# text
seg-e866d042aab8 = Celeste-IOD-Nachricht (Workshop-Voreinstellung)

# text
seg-c42f5a1ed964 = [kepler16, kepler-rac]

# text
seg-549a6103e711 = bit

# text
seg-fb689f03361c = byte

# text
seg-c60901596100 = Ergebnisbezeichnung (der Engine): MIXED — VALIDATED Bausteine, MODELLED Ergebnisse. Die SISRE-Gewichte reproduzieren die veröffentlichte MEO/GEO-Tabelle (Montenbruck et al. { "2018" }), der Nutzeralgorithmus des Galileo-ICD reproduziert RTKLIB auf realen Galileo-Broadcast-Ephemeriden, und CRC-24Q reproduziert seinen Katalog-Prüfwert und den RTCM-{ "1005" }-Beispielf

# text
seg-efbe11be7ca1 = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: das radiale Gewicht w_R und das quadrierte Quergewicht w_AC^{ "2" } als Mittelwerte von cos^{ "2" } und halbem sin^{ "2" } des Nadirwinkels der Sichtlinie über Nutzer, die gleichmäßig auf der sichtbaren Erdkappe oberhalb einer Elevati

# text
seg-b27c5fe8e179 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: die Kepler-Auswertung des Galileo OS SIS ICD (Keplergleichung, Korrekturen zweiter Harmonischer, erdfester Knoten), getrennt vom RINEX-Auswerter der Engine geschrieben, die die Position mit dem Argumen Tests: <a1>leo_navmsg_reference.rs</a1>.

# text
seg-3a53131dc9a4 = <b>VALIDATED</b> leo_navmsg::codec::crc24q: Generatorpolynom 0x1864CFB, Anfangswert { "0" }, keine Spiegelung, kein abschließendes XOR, die Prüfung, die der LEO-Frame von Kshana über jedes vorangehende Byte trägt

# text
seg-ddb27b07b9af = und { "7" } weitere in der Matrix.

# text
seg-053dae66c1be = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: das radiale Gewicht w_R und das quadrierte Quergewicht w_AC^{ "2" } als Mittelwerte von cos^{ "2" } und halbem sin^{ "2" } des Nadirwinkels der Sichtlinie. Orakel (ExternalDataset): Die veröffentlichte SISRE-Gewichtungsfaktor-Tabelle von Montenbruck, Steigenberger und Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } und 1/49, GLONASS { "0.98" } und 1/45, Galileo { "0.98" } und 1/61, BeiDou MEO { "0.98" } und 1/54, BeiDou IGSO/GEO { "0.99" } und 1/126. Derselbe Mittelwert, ausgewertet bei LEO-Radien, ergibt die

# text
seg-5b43ffde4634 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: die Kepler-Auswertung des Galileo OS SIS ICD (Keplergleichung, Korrekturen zweiter Harmonischer, erdfester Knoten), getrennt geschrieben. Orakel (ExternalDataset): ECEF-Positionen von RTKLIB 2.4.2-p13 eph2pos (eine unabhängige Implementierung desselben ICD-Algorithmus) für reale BKG/IGS-Broadcast-Datensätze vom 2024-09-10, beide mit Herkunftsnachweis eingecheckt in tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Dies validiert den Kepler-Nutzeralgorithmus; die zusätzlich aufgesetzten Korrekturen in Flugrichtung/quer/radial werden von eigenen Zeilen abgedeckt, und die Terme nach Liu b

# text
seg-5b4f1e63795f = <b>VALIDATED</b> leo_navmsg::codec::crc24q: Generatorpolynom 0x1864CFB, Anfangswert { "0" }, keine Spiegelung, kein abschließendes XOR, die Prüfung, die der LEO-Frame von Kshana über jedes vorangehende. Orakel (ExternalDataset): Der Katalog-Prüfwert der CRC für diese Parameter (reveng.sourceforge.io CRC-Katalog, CRC-24/LTE-A: Breite { "24" }, Poly 0x864CFB, Init { "0" }, Check 0xCDE703), die die CRC-24Q-Parameter von RTCM { "10403" } und des Galileo OS SIS ICD sind, und der Beispielframe des Nachrichtentyps { "1005" }, der in RTCM { "10403" } abgedruckt ist

# text
# c1: limitations[0]
seg-0c26ec09bf16 = SISRE ist der Darstellungsfehler der Nachricht gegen die Wahrheit, an die sie angepasst wurde; Fehler der Bahnbestimmung und der Bahnvorhersage werden nicht modelliert. (Ergebnis <c1/>)

# text
# c1: limitations[1]
seg-3762de39de07 = Die Wahrheitsbahn ist eine numerische Integration von Kshana (zonale oder EGM2008-Schwere, statischer exponentieller Luftwiderstand), nicht die präzise Bahn eines realen Satelliten; kein dritter Körper, kein Strahlungsdruck der Sonne und keine Gezeiten. (Ergebnis <c1/>)

# text
# c1: limitations[2]
seg-4486dd350b57 = Das Binärformat ist die eigene dokumentierte Codierung von Kshana, nach dem Vorbild der veröffentlichten Nachrichtenkomponenten modelliert; es ist nicht das Bitlayout von Celeste oder eines anderen Systems (keines ist öffentlich). (Ergebnis <c1/>)

# text
# c1: limitations[3]
seg-2a5c1bce8320 = Der Block im RINEX-Stil ist eine dokumentierte Kshana-Erweiterung; RINEX { "4.02" } definiert keine LEO-Navigationsdatensätze. (Ergebnis <c1/>)

# text
# c1: limitations[4]
seg-642d8f4d60e7 = Die NeQuick-G-Koeffizienten werden mitgeführt und das effektive Ionisationsniveau wird berechnet, aber die Integration der NeQuick-Elektronendichte, die daraus eine Laufzeitverzögerung macht, ist nicht implementiert; die Klobuchar-Verzögerung ist es, skaliert auf den Träger mit 1/f^{ "2" } und ohne Korrektur für einen Satelliten, der innerhalb der Ionosphäre fliegt. (Ergebnis <c1/>)

# text
# c1: limitations[5]
seg-8ba04a3147bd = Die 22-Parameter-Terme nach Liu et al. { "2025" } folgen dem Nutzeralgorithmus der Veröffentlichung (Gl. 1-7) und ihrer Anpassungsstrategie (Abschnitt { "2.3" }); ihre SISRE-über-Höhe-Zahlen verwendeten reale präzise Bahnen, daher ist dieser Vergleich auf einer von Kshana integrierten Bahn MODELLED, nicht VALIDATED (der Vergleich mit realen Bahnen ist tests/leo_navmsg_fit_real_orbit_oracle.rs). (Ergebnis <c1/>)

# text
# c1: label
seg-b3585c7feb4e = MIXED — VALIDATED Bausteine, MODELLED Ergebnisse. Die SISRE-Gewichte reproduzieren die veröffentlichte MEO/GEO-Tabelle (Montenbruck et al. { "2018" }), der Nutzeralgorithmus des Galileo-ICD reproduziert RTKLIB auf realen Galileo-Broadcast-Ephemeriden, und CRC-24Q reproduziert seinen Katalog-Prüfwert und den RTCM-{ "1005" }-Beispielframe. Jede Zahl zu Anpassung, SISRE, Kontinuität und Quantisierung ist MODELLED: der Darstellungsfehler einer Nachricht gegen eine (Ergebnis <c1/>)

# text
seg-c5478f572d21 = Familienseite: <a1>Low-Earth-orbit navigation</a1>

# text
seg-d9257241d523 = Themenseite: <a1>LEO-NAVMSG.md</a1>

# text
seg-b0dcad22aed6 = <s1>Zurück</s1>launch-window

# text
seg-2984c4c69850 = <s1>Weiter</s1>leo-pass

# text
# c1: leo-navmsg
seg-087287602b47 = <c1/> (Szenarioart)

# text
# c1: leo-navmsg
seg-2b24c2669c23 = <b>VALIDATED</b> Der Fitter und Trade der Szenarioart <c1/>: eine Wahrheitsbahn, integriert mit zonaler J2-J6- oder EGM2008-Schwere bis zum gewählten Grad und mit Luftwiderstand, und eine mit Seed erzeugte freie oder gesteuerte Uhr; eine Levenberg-Marquardt-Anpassung des Galileo-Kepler-Satzes auf nichtsingulären

# attr:alt
seg-35e92abc6a23 = Das Diagramm, das die Engine für scenarios/leo-navmsg-celeste-iod.toml schreibt, Szenarioart leo-navmsg

# text
seg-43c1d9c81ccf = MODELLED { "5" } · VALIDATED { "6" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Szenarioart nennen.

# text
seg-49964654d5f4 = Szenarioart der Engine v{ $version }, Familie <a1>Low-Earth-orbit navigation</a1>. Hinweis (beratend): Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Szenarioart ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung erworben wird: der Abschnitt Evidence der README).

# text
# c1: leo-navmsg
seg-6e2719a28884 = <b>VALIDATED</b> Der Fitter und Trade der Szenarioart <c1/>: eine Wahrheitsbahn, integriert mit zonaler J2-J6- oder EGM2008-Schwere bis zum gewählten Grad und mit Luftwiderstand, und eine mit Seed erzeugte freie oder gesteuerte. Orakel (ExternalDataset): Echte präzise wissenschaftliche Bahnen als Wahrheit (operationelle reduziert-dynamische Bahnen der TU Graz IfG/ITSG, frei für jede Nutzung mit Namensnennung; SHA-256-Werte im NOTICE der Fixture), angepasst mit dem 16-Parameter-Satz über Bögen von { "20" } und { "30" } min, gegen die Statistiken, die Liu et al. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) für dieselben Satelliten und Tage veröffentlichen: Flugrichtungs-, Quer- und Radial-RMS jeweils innerhalb von 1.5x (gemessen { "0.804" } bis { "1.087" }), SISR

# text
# c1: kshana kinds --json
seg-d6e412aab1b4 = MODELLED: Jede Anpassungs- und SISRE-Zahl ist ein Darstellungsfehler gegen eine von Kshana integrierte Wahrheit (kein Bahnbestimmungs- oder Vorhersagefehler); der Vergleich mit Liu et al. (Szenarioarten-Katalog (<c1/>))
