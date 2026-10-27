# docs--constellation-design: translations (de)

# text
seg-f63dd3d7aad4 = Quelle

# text
# c1: docs/CONSTELLATION-DESIGN.md
seg-8f0e4021404d = Quelle: <c1/>

# text
# c1: constellation-design
# c2: src/body.rs
# c3: solar-system
# c4: body-pnt
# c5: src/constellation.rs
seg-44196ab9678c = Die Art <c1/> baut eine oder mehrere Satellitenkonstellationen um die Erde, den Mond, den Mars oder jeden anderen Körper im Katalog des Sonnensystems (<c2/>: die acht Planeten, Pluto, der Mond, Phobos, Deimos, die vier galileischen Monde und Titan, mit denselben Konstanten, die die Arten <c3/> und <c4/> verwenden; siehe <a1>SOLAR-SYSTEM.md</a1>) und bildet ihre Abdeckung und Verdünnung der Genauigkeit (DOP) über einem Breiten-/Längengitter ab. Quelle: <c5/>.

# text
# c1: body
# c2: earth
# c3: duration_s
# c4: step_s
# c5: mask_deg
# c6: grid_step_deg
# c7: lat_min_deg
# c8: lat_max_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: j2 = true
seg-61385c509a3d = Der Körper wird mit <c1/> gewählt (Standard <c2/>). Der Lauf umfasst <c3/> (Standard ein siderischer Tag, { "86 164" } s) in Schritten von <c4/> (Standard { "600" } s), oberhalb von <c5/> (Standard { "5" } deg), auf einem Gitter von <c6/> (Standard { "10" } deg), das <c7/>, <c8/>, <c9/> und <c10/> einschränken können; <c11/> fügt die säkulare Drift aus J2 hinzu, der zweiten zonalen Harmonischen des Gravitationsfelds des Körpers.

# text
seg-d02f6d747522 = Was hineingeht

# text
# c1: T/P/F
# c2: T
# c3: P
# c4: F
# c5: k
# c6: raan0 + k·ΔΩ
# c7: j
# c8: m0 + j·360·P/T + k·360·F/T
seg-743e68478333 = <b>Walker-Schalen</b> in der Konvention <c1/>: <c2/> Satelliten in <c3/> gleichmäßig verteilten Ebenen mit Phasierung <c4/>. Ein <em>Delta</em>-Muster verteilt die aufsteigenden Knoten über { "360" } deg, ein <em>Stern</em>-Muster über { "180" } deg. Ebene <c5/> liegt am Knoten <c6/> und ihr Satellit <c7/> bei der mittleren Anomalie <c8/>.

# text
seg-d86b01d633a0 = <b>Explizite Elementesätze</b>: große Halbachse oder Höhe, Exzentrizität, Inklination, Rektaszension des aufsteigenden Knotens (RAAN), Argument des Perizentrums und mittlere Anomalie.

# text
seg-0737ef1ddb72 = <b>Voreinstellungen</b> aus veröffentlichten Nominalelementen (nur Erde; eine Voreinstellung um einen anderen Körper ist ein Fehler):

# text
seg-587beeccaa11 = Voreinstellung

# text
seg-1ff32b87e030 = Satelliten

# text
seg-9e0514e371e5 = Global Positioning System (GPS) Standard Positioning Service Performance Standard (SPS PS), 5. Ausgabe, April { "2020" }, Tabellen 3.2-1 und 3.2-3

# text
seg-fb6956d09acc = { "24" } bis { "30" }

# text
# c1: expanded
seg-f679ee0f3a3f = SPS PS Tabelle 3.2-2: Jeder der sechs erweiterbaren Plätze (B1, D2, F2, A2, C4, E3), die in <c1/> genannt sind, wird durch sein vorderes und hinteres Paar ersetzt; standardmäßig alle sechs

# text
seg-45f3abdcb8d4 = Galileo Open Service Service Definition Document (OS SDD), Ausgabe { "1.1" }: Walker 24/3/1, große Halbachse { "29 599.801" } km, { "56" } deg (Tabelle { "1" }), Plätze aus Tabelle { "23" }

# text
seg-87e23a896f58 = BeiDou Open Service Performance Standard { "3.0" } ({ "2021" }), Abschnitt { "4.1" }: Walker 24/3/1 im mittleren Erdorbit (MEO) bei { "21 528" } km und { "55" } deg, dazu drei geostationäre (GEO) Satelliten bei { "80" }, { "110.5" } und { "140" } deg Ost und drei geneigte geosynchrone (IGSO) Satelliten bei { "55" } deg

# text
seg-70a32cd2402d = GLONASS Interface Control Document (ICD), Ausgabe { "5.1" } ({ "2008" }), Abschnitt { "5.2" }: Platzformel, { "19 100" } km, { "64.8" } deg

# text
seg-654d7aceff94 = Das RAAN der GPS-Tabelle ist zu ihrer Epoche inertial; die Voreinstellung wandelt es mit dem in der Tabelle genannten Greenwich-Stundenwinkel ({ "100.765" } deg) in eine erdfeste Knotenlänge um. GLONASS gibt absolute (Greenwich-)Knotenlängen direkt an. Das Galileo-Dokument nennt keinen Stundenwinkel, daher wird sein RAAN als Knotenlänge verwendet. Der BeiDou-Standard gibt weder die MEO-Phase noch die IGSO-Knoten an; die Voreinstellung beginnt das MEO-Muster am Knoten { "0" } und bei der mittleren Anomalie { "0" } und legt die drei IGSO auf eine Bodenspur, die den Äquator bei { "118" } deg Ost kreuzt. Diese beiden Festlegungen sind modelliert.

# text
# c1: clock = "per-constellation"
# c2: clock = "common"
seg-b2bbdd23c13b = Mehrere Konstellationen können sich einen Lauf teilen. Mit <c1/> (dem Standard) schätzt der Empfänger eine Uhr je System in Sicht, wie es ein Multi-GNSS-Empfänger (Global Navigation Satellite System) tut; <c2/> teilt eine Uhr.

# text
seg-27db52482bdd = Was herauskommt

# text
# c1: pdop_threshold
# c2: track_points
# c3: max_tracks
seg-2405196cfccb = Je Gitterzelle: mittlere, geringste und größte Zahl der Satelliten über der Maske; der Anteil der Epochen mit Positionsbestimmung und mit Positions-DOP (PDOP) bei oder unter <c1/>; mittlere geometrische, Positions-, horizontale und vertikale DOP (GDOP, PDOP, HDOP, VDOP); größter PDOP. Global, mit dem Kosinus der Breite gewichtet, sodass jede Zelle nach ihrer Fläche zählt: Verfügbarkeit, Verfügbarkeit am schlechtesten Standort sowie Mittelwert, Median, 90., 95. und 99. Perzentil und Maximum jeder DOP. Je Satellit: eine heruntergetastete Bodenspur (<c2/> Stützpunkte, Standard { "24" }, für höchstens <c3/> Satelliten, Standard { "120" }). Das Diagramm besteht aus zwei Karten, Verfügbarkeit und mittlerer PDOP.

# text
seg-6cb532d0bca9 = Wie es skaliert

# text
# c1: r
# c2: ε
# c3: λ = arccos((R/r)·cos ε) − ε
# c4: cos λ
# c5: φ
# c6: λ_max
# c7: φ
# c8: work
# c9: leo-pnt-mega-shell
seg-988ae3272c1f = Ein Satellit im Radius <c1/> liegt genau dann über einer Elevationsmaske <c2/>, wenn sein Zentriwinkel zum Nutzer höchstens <c3/> beträgt; der Sichtbarkeitstest ist also ein Skalarprodukt gegen <c4/>. In jeder Epoche werden die Satelliten außerdem nach der Breite des Subsatellitenpunkts sortiert, und eine Gitterzeile bei der Breite <c5/> testet nur die Satelliten innerhalb von <c6/> um <c7/>. Beides ist auf einem kugelförmigen Körper exakt, und ein Unit-Test hält jede Karte gegen einen Brute-Force-Durchlauf mit dem direkten Elevationstest. Der Block <c8/> gibt die Paartests an, die ein Brute-Force-Durchlauf machen würde, und die tatsächlich gemachten. Der Entwurf mit { "5" } 000 Satelliten im Unit-Test auf einem Gitter von { "10" } deg ({ "648" } Punkte, { "6" } Epochen) behält { "9.9" } % der { "19 440 000" } Paartests des Brute-Force-Durchlaufs; das mitgelieferte Szenario <c9/> ({ "5 000" } Satelliten, { "648" } Punkte, { "12" } Epochen) läuft mit der Release-Befehlszeilenbinärdatei auf einem Apple-Silicon-Laptop in etwa { "0.14" } s. Die Laufzeiten nach der Uhr hängen von der Maschine und ihrer Last ab. Die Engine verwendet keine Threads, keine Uhr und kein Dateisystem und läuft daher unverändert als WebAssembly.

# text
seg-abba032ee1c7 = Was geprüft wird und wogegen

# text
seg-2342ed239300 = VALIDATED, gegen veröffentlichte Dokumente:

# text
seg-dc7fe92fcf05 = Der Walker-Generator reproduziert alle { "24" } Zeilen von Galileo OS SDD Tabelle { "23" }, und die Platzformel des GLONASS ICD ist dieselbe Menge von { "24" } Plätzen wie ein Walker 24/3/1;

# text
seg-686f9543c7c9 = die GPS-Voreinstellung reproduziert die Spalte der Äquatorüberquerung der Bodenspur aus SPS PS Tabellen 3.2-1 und 3.2-2: { "35" } von { "36" } Orten innerhalb von { "0.0108" } deg gegenüber einem Rundungs-Zielwert von { "0.015" } deg. E3F wird an einem lockereren Zielwert von { "0.06" } deg gemessen, weil die E3F-Zeile der Tabelle selbst mit ihrem RAAN und ihrem Breitenargument inkonsistent ist: Ihr Breitenargument liegt { "14.60" } deg vor dem von E3, was die Überquerung um { "7.30" } deg verschiebt, während die Tabelle sie um { "7.36" } deg verschiebt;

# text
seg-dc2756c75401 = die GPS-Basislinie unter den Bedingungen von SPS PS Anhang B (ein siderischer Tag, { "287" } Schritte zu fünf Minuten, ein Gitter von { "4" } deg, alle in Sicht, Maske { "5" } deg) ergibt einen globalen HDOP-Median von { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" } und Mittelwert { "0.965" }, gegenüber den veröffentlichten { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } und { "0.96" } (Zielwert { "0.03" }, vor dem ersten Lauf festgelegt). Der PDOP-Median { "1.795" } liegt unter den { "1.815" } von Tabelle B.3-1, die eine verschlechterte Mischung aus 20-24 Satelliten beschreibt. Ein PDOP von { "6" } oder weniger gilt in { "100" } % der Zeit, gegenüber { "98" } % global und { "88" } % am schlechtesten Standort in Tabelle 3.8-1.

# text
seg-9aac9d8aa228 = Gegen eine Handherleitung geprüft, nicht gegen ein externes Dokument: Eine DOP für eine einzelne Epoche stimmt mit der geschlossenen Form für einen Satelliten im Zenit und drei bei { "30" } deg Elevation überein (PDOP 8/3, GDOP { "3.0732" }).

# text
seg-d946dad08e23 = MODELLED: Zweikörperbahnen mit optionaler säkularer J2-Drift; ein kugelförmiger Körper; nur geometrische Sichtbarkeit (keine Signalleistung, kein Satellitenzustand, kein Gelände); keine Störung durch einen dritten Körper, von der eine echte gefrorene Mondbahn abhängt. Der schlechteste einzelne Zeit-Raum-Punkt hängt vom Gitter ab: HDOP { "2.40" } und VDOP { "5.22" } hier gegenüber veröffentlichten { "2.49" } und { "5.43" }; diese werden berichtet, nicht festgeschrieben. Die Voreinstellungen der vier Systeme stammen aus verschiedenen Bezugsepochen, daher ist ihre Relativphase in einem Lauf keine Momentaufnahme irgendeines Datums.

# text
seg-a6c63abeb7e6 = Mitgelieferte Szenarien

# text
seg-3e6a942c84d4 = Jede Zeile gibt an, was der Lauf mit kshana { $version } ausgibt.

# text
# c1: scenarios/constellation-multi-gnss-coverage.toml
seg-c8b40c9c2c00 = <c1/>: GPS, Galileo, BeiDou und GLONASS ({ "102" } Satelliten) über einen Tag oberhalb einer Maske von { "10" } deg, eine Uhr je System. Verfügbarkeit (PDOP { "6" } oder weniger) { "100" } % global und am schlechtesten Standort, Median-PDOP { "0.95" }, im Mittel { "31.0" } Satelliten in Sicht.

# text
# c1: scenarios/leo-pnt-mega-shell.toml
seg-b65ade1eab04 = <c1/>: { "5 000" } Satelliten in vier Schalen im niedrigen Erdorbit (LEO) für Positionierung, Navigation und Zeitgebung (PNT), mit J2, oberhalb einer Maske von { "20" } deg. Verfügbarkeit (PDOP { "3" } oder weniger) { "99.22" } % global und { "0" } % am schlechtesten Standort, Median-PDOP { "1.11" }, im Mittel { "39.4" } Satelliten in Sicht.

# text
# c1: scenarios/lunar-relay-constellation.toml
seg-7d860ca30360 = <c1/>: { "8" } Satelliten in elliptischen gefrorenen Mondbahnen und eine kreisförmige Schale mit 6 Satelliten um den Mond. Verfügbarkeit (PDOP { "6" } oder weniger) { "21.33" } % global und { "0" } % am schlechtesten Standort, Median-PDOP { "5.22" }, im Mittel { "3.2" } Satelliten in Sicht.

# text
# c1: leo-pvt
# c2: scenarios/polar-arctic-leo-coverage.toml
seg-0c331bea1f52 = Die LEO-PNT-Abdeckung für Nutzer in Polar- und Arktisgebieten, gegenüber GNSS im mittleren Erdorbit, ist der Polarmodus der Art <c1/> (<c2/>; siehe <a1>LEO-PNT.md</a1>).

# text
seg-9aab3bf49146 = <s1>Zurück</s1>Fusionierte MEO- und LEO-Positionierung

# text
seg-9f717b9015e1 = <s1>Weiter</s1>Modelle für Quantensensoren
