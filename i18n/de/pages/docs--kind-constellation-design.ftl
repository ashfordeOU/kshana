# docs--kind-constellation-design: translations (de)

# text
seg-e27476e37522 = Erde

# text
# c1: docs/kinds/by-kind/constellation-design.md
seg-f305ed6dc164 = Quelle: <c1/>

# text
# c1: constellation-design
seg-f708c26a5139 = <c1/> (Szenariotyp)

# text
seg-de173c9f4034 = Konstellationsentwurf im großen Maßstab: Walker-DELTA- und Walker-STAR-Muster in der i: T/P/F-Konvention (Knoten verteilt über { "360" } oder { "180" } Grad, Abstand in der Bahnebene { "360" }<em>P/T, Phasenversatz zwischen den Ebenen { "360" }</em>F/T), explizite Elementlisten und Mehrschalen-Entwürfe, mehrere Konstellationen in einem Lauf, um die Erde, den Mond, den Mars oder jeden anderen Planeten, Pluto oder größeren Mond mit den Konstanten im Modul body (denselben, die die Typen solar-system und body-pnt verwenden). VOREINSTELLUNGEN aus veröffentlichten Nominalelementen: gps-baseline und gps-expandable (die { "24" } Slots und die sechs erweiterbaren Vorder-/Hinter-Paare des GPS Standard Positioning Service Performance Standard, 5. Ausgabe { "2020" }, Tabellen 3.2-1 bis 3.2-3), galileo (Walker 24/3/1 bei { "29 599.801" } km und { "56" } Grad, Galileo Open Service Service Definition Document Ausgabe { "1.1" } Tabellen { "1" } und { "23" }), beidou und beidou-meo (Walker 24/3/1 bei { "21 528" } km und { "55" } Grad plus drei geostationäre Satelliten bei { "80" }, { "110.5" } und { "140" } Grad Ost und drei geneigte geosynchrone Satelliten bei { "55" } Grad, BeiDou Open Service Performance Standard { "3.0" } Abschnitt { "4.1" }; die MEO-Phase und die Kreuzung des geneigten geosynchronen Bogens bei { "118" } Grad Ost sind modelliert, weil der Standard sie nicht angibt) und glonass (24/3/1 bei { "19 100" } km und { "64.8" } Grad aus der Slot-Formel des GLONASS Interface Control Document Ausgabe { "5.1" } Abschnitt { "5.2" }). ABDECKUNG UND VERDÜNNUNG DER PRÄZISION: über einem Breiten-/Längengitter und einem abgetasteten Fenster mit Elevationsmaske die Zahl der sichtbaren Satelliten, GDOP, PDOP, HDOP und VDOP je Zelle, die Verfügbarkeit (ein Fix mit PDOP höchstens einem Schwellenwert, standardmäßig { "6" }) je Zelle, global (flächengewichtet) und am schlechtesten Standort, mit einer Empfängeruhr je Konstellation, sofern nicht clock = "common". Es skaliert auf Tausende von Satelliten: Die Sichtbarkeit ist ein Skalarprodukt gegen den Abdeckungs-Halbwinkel jedes Satelliten, und die Satelliten werden in jeder Epoche nach der Breite des Subsatellitenpunkts in Bänder eingeteilt, sodass eine Gitterzeile nur diejenigen prüft, die in Sicht sein können; der Bericht zählt die eingesparten Paarprüfungen. Das JSON enthält die Gitterkarten und heruntergetaktete Bodenspuren je Satellit. VALIDATED: der Walker-Generator gegen Galileo OS SDD Tabelle { "23" } und die GLONASS-ICD-Slot-Formel, die GPS-Voreinstellung gegen die veröffentlichte Spalte der Äquatorüberquerungen in SPS PS Tabelle 3.2-1 und die globale HDOP-Verteilung der GPS-Basislinie gegen SPS PS Anhang B (Median { "0.94" }, { "95" }% { "1.25" }, Mittelwert { "0.96" }, Toleranz { "0.03" }). MODELLED: Zweikörperbahnen mit optionalem säkularem J2, ein kugelförmiger Körper, nur geometrische Sichtbarkeit (keine Signalleistung, kein Gesundheitszustand, kein Gelände) und die Relativphase zwischen verschiedenen Systemen, die keine Momentaufnahme eines realen Datums ist.

# text
# c1: scenarios/leo-pnt-mega-shell.toml
seg-21fbd84bfba1 = Ein Lauf von <c1/> ergibt zusammengefasst: constellation-design: { "5000" } Satelliten (LEO-PNT) um die Erde; Verfügbarkeit { "99.22" }% (PDOP <= { "3" } bei { "20" } Grad Maske), schlechtester Standort { "0.00" }%, mittlerer PDOP { "1.11" }, Mittel { "39.4" } in Sicht; { "648" } Gitterpunkte x { "12" } Epochen (MODELLED)

# text
# c1: body
# c2: duration_s
# c3: step_s
# c4: mask_deg
# c5: pdop_threshold
# c6: grid_step_deg
# c7: lat_min_deg
# c8: lat_max_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: clock
# c12: j2
# c13: track_points
# c14: max_tracks
# c15: constellation
seg-af572ce1fd89 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: scenarios/leo-pnt-mega-shell.toml
seg-fd393ddc7d5d = Das Beispiel <c1/> setzt unter anderem:

# text
seg-d72b4c5393e0 = earth

# text
seg-d9b3c54bd272 = common

# text
seg-6411970ba342 = delta

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } mitgelieferte Szenarien verwenden diesen Typ; die übrigen stehen in <a1><c1/></a1>.

# text
seg-0a6f7f6c66c4 = km^3/s^{ "2" }

# text
seg-ab9b72b9ffce = Ergebnisbezeichnung (die der Engine): MODELLED - Keplersche Zweikörperbahnen (optional säkulares J2) um einen kugelförmigen Körper, geometrische Sichtbarkeit oberhalb einer Elevationsmaske, All-in-View-Verdünnung der Präzision mit einer Empfängeruhr je Konstellation, sofern nicht clock = "common"; keine Signalleistung, kein Gesundheitszustand, kein Gelände. Die Walker-Geometrie und die veröffentlichten

# attr:alt
seg-899e728ad9bd = Das Diagramm, das die Engine für scenarios/leo-pnt-mega-shell.toml schreibt, Typ constellation-design

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diesen Typ nennen.

# text
# c1: constellation-design
seg-602493ac6987 = <b>VALIDATED</b> Die Generatoren des Typs <c1/>: Walker-Delta- und -Star-Muster in der T/P/F-Konvention (Knotenabstand 360/P oder 180/P, Abstand in der Bahnebene { "360" }·P/T, Phasenversatz zwischen den Ebenen { "360" }·F/T), und die 24-Slot-Basislinie und erweiterbare Variante von GPS, Gal

# text
# c1: constellation-design
seg-bdc81f37ad16 = <b>VALIDATED</b> Die Abdeckungs-Engine des Typs <c1/> auf der 24-Slot-GPS-Basislinien-Voreinstellung unter den Bedingungen von Anhang B des GPS Standard Positioning Service Performance Standard (SPS PS) (ein Sterntag, { "287" } Fünf-Minuten-Schritte, ein { "4" } x { "4" } Grad globales Gitter w

# text
# c1: constellation-design
seg-1272200ad4f2 = <b>MODELLED</b> Der Typ <c1/> jenseits der beiden festgelegten Fälle: explizite und Mehrschalen-Entwürfe, mehrere Konstellationen je Lauf mit einer Empfängeruhr je Konstellation, die Erde, der Mond und der Mars aus den Körperkonstanten, die BeiDou-Voreinstellung Tests: <a1>coverage_dop_gnss_lib_py_oracle.rs</a1>.

# text
# c1: constellation-design
seg-0c64f22330d2 = <b>VALIDATED</b> Die Generatoren des Typs <c1/>: Walker-Delta- und -Star-Muster in der T/P/F-Konvention (Knotenabstand 360/P oder 180/P, Abstand in der Bahnebene { "360" }·P/T, int. Unabhängige Referenz (ExternalDataset): Veröffentlichte Behördendokumente: Galileo Open Service Service Definition Document Ausgabe { "1.1" } (European GNSS Service Centre) Tabellen { "1" } und { "23" }, die Referenzkonstellation vom 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document Ausgabe { "5.1" } ({ "2008" }) Abschnitt { "5.2" }, die Slot-Formel für Knotenlänge und Argument der Breite; GPS Standard Positioning Service Performance Standard 5. Ausgabe (April { "2020" }) Tabellen 3.2-1, 3.2-2 und

# text
# c1: constellation-design
seg-87c4e19dc780 = <b>VALIDATED</b> Die Abdeckungs-Engine des Typs <c1/> auf der 24-Slot-GPS-Basislinien-Voreinstellung unter den Bedingungen von Anhang B des GPS Standard Positioning Service Performance Standard (SPS PS) Appendix . Unabhängige Referenz (ExternalDataset): GPS SPS PS 5. Ausgabe (April { "2020" }) Anhang B Abschnitte B.3.2.2 und B.3.2.3, die veröffentlichte globale mittlere HDOP-Verteilung der vollständig besetzten 24-Slot-Basislinien-Konstellation (Median { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, Mittelwert { "0.96" }), Tabelle 3.8-1 (PDOP-Verfügbarkeit) und Tabelle B.3-1 (Ensemble-PDOP einer degradierten Konstellation, nur als obere Schranke verwendet), plus eine von Hand hergeleitete geschlossene Form für eine Epoche. Die VDOP und PD

# text
# c1: constellation-design
seg-04289f7252cd = <b>MODELLED</b> Der Typ <c1/> jenseits der beiden festgelegten Fälle: explizite und Mehrschalen-Entwürfe, mehrere Konstellationen je Lauf mit einer Empfängeruhr je Konste. Unabhängige Referenz (InternalConsistency): Interne Konsistenz: der Brute-Force-Elevationsscan, die von Hand berechneten Reduktionen und orbit::dop sowie die geschlossene Walker- und geosynchrone Geometrie. Zweikörperbahnen mit optionalem säkularem J2, ein kugelförmiger Körper mit der lokalen Vertikalen entlang des Radius, nur geometrische Sichtbarkeit (keine Signalleistung, kein Satellitengesundheitszustand, kein Gelände, keine Störung durch Dritte Körper) und die Relativphase zwischen Systemen, aus verschiedenen re

# text
# c1: label
seg-00fa65d44cbd = MODELLED - Keplersche Zweikörperbahnen (optional säkulares J2) um einen kugelförmigen Körper, geometrische Sichtbarkeit oberhalb einer Elevationsmaske, All-in-View-Verdünnung der Präzision mit einer Empfängeruhr je Konstellation, sofern nicht clock = "common"; keine Signalleistung, kein Gesundheitszustand, kein Gelände. Die Walker-Geometrie und die veröffentlichten Voreinstellungen werden gegen die Galileo OS SDD, die GLONASS ICD und die Slot-Tabellen des GPS SPS Performance Standard geprüft, a (Ergebnis <c1/>)
