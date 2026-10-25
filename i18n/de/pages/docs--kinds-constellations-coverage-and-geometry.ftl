# docs--kinds-constellations-coverage-and-geometry: translations (de)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Typ

# text
seg-de173c9f4034 = Konstellationsentwurf im großen Maßstab: Walker-DELTA- und Walker-STAR-Muster in der i: T/P/F-Konvention (Knoten verteilt über { "360" } oder { "180" } Grad, Abstand in der Bahnebene { "360" }<em>P/T, Phasenversatz zwischen den Ebenen { "360" }</em>F/T), explizite Elementlisten und Mehrschalen-Entwürfe, mehrere Konstellationen in einem Lauf, um die Erde, den Mond, den Mars oder jeden anderen Planeten, Pluto oder größeren Mond mit den Konstanten im Modul body (denselben, die die Typen solar-system und body-pnt verwenden). VOREINSTELLUNGEN aus veröffentlichten Nominalelementen: gps-baseline und gps-expandable (die { "24" } Slots und die sechs erweiterbaren Vorder-/Hinter-Paare des GPS Standard Positioning Service Performance Standard, 5. Ausgabe { "2020" }, Tabellen 3.2-1 bis 3.2-3), galileo (Walker 24/3/1 bei { "29 599.801" } km und { "56" } Grad, Galileo Open Service Service Definition Document Ausgabe { "1.1" } Tabellen { "1" } und { "23" }), beidou und beidou-meo (Walker 24/3/1 bei { "21 528" } km und { "55" } Grad plus drei geostationäre Satelliten bei { "80" }, { "110.5" } und { "140" } Grad Ost und drei geneigte geosynchrone Satelliten bei { "55" } Grad, BeiDou Open Service Performance Standard { "3.0" } Abschnitt { "4.1" }; die MEO-Phase und die Kreuzung des geneigten geosynchronen Bogens bei { "118" } Grad Ost sind modelliert, weil der Standard sie nicht angibt) und glonass (24/3/1 bei { "19 100" } km und { "64.8" } Grad aus der Slot-Formel des GLONASS Interface Control Document Ausgabe { "5.1" } Abschnitt { "5.2" }). ABDECKUNG UND VERDÜNNUNG DER PRÄZISION: über einem Breiten-/Längengitter und einem abgetasteten Fenster mit Elevationsmaske die Zahl der sichtbaren Satelliten, GDOP, PDOP, HDOP und VDOP je Zelle, die Verfügbarkeit (ein Fix mit PDOP höchstens einem Schwellenwert, standardmäßig { "6" }) je Zelle, global (flächengewichtet) und am schlechtesten Standort, mit einer Empfängeruhr je Konstellation, sofern nicht clock = "common". Es skaliert auf Tausende von Satelliten: Die Sichtbarkeit ist ein Skalarprodukt gegen den Abdeckungs-Halbwinkel jedes Satelliten, und die Satelliten werden in jeder Epoche nach der Breite des Subsatellitenpunkts in Bänder eingeteilt, sodass eine Gitterzeile nur diejenigen prüft, die in Sicht sein können; der Bericht zählt die eingesparten Paarprüfungen. Das JSON enthält die Gitterkarten und heruntergetaktete Bodenspuren je Satellit. VALIDATED: der Walker-Generator gegen Galileo OS SDD Tabelle { "23" } und die GLONASS-ICD-Slot-Formel, die GPS-Voreinstellung gegen die veröffentlichte Spalte der Äquatorüberquerungen in SPS PS Tabelle 3.2-1 und die globale HDOP-Verteilung der GPS-Basislinie gegen SPS PS Anhang B (Median { "0.94" }, { "95" }% { "1.25" }, Mittelwert { "0.96" }, Toleranz { "0.03" }). MODELLED: Zweikörperbahnen mit optionalem säkularem J2, ein kugelförmiger Körper, nur geometrische Sichtbarkeit (keine Signalleistung, kein Gesundheitszustand, kein Gelände) und die Relativphase zwischen verschiedenen Systemen, die keine Momentaufnahme eines realen Datums ist.

# attr:alt
seg-899e728ad9bd = Das Diagramm, das die Engine für scenarios/leo-pnt-mega-shell.toml schreibt, Typ constellation-design

# text
seg-0549bc926a9b = Das gesamte Sonnensystem zu einer Epoche, für PNT (Positionierung, Navigation und Zeitgebung) um beliebige Körper. Für die Sonne, die acht Planeten, Pluto, den Mond, Phobos, Deimos, Io, Europa, Ganymed, Kallisto und Titan werden gemeldet: heliozentrische Position und Geschwindigkeit im ICRF (International Celestial Reference Frame, äquatorial J2000), heliozentrische Entfernung sowie ekliptikale Länge und Breite in J2000, der Gravitationsparameter, äquatorialer und mittlerer Radius, J2, soweit veröffentlicht, und sein Bezugsradius, die siderische Rotationsperiode, der IAU-Pol und der Nullmeridian zur Epoche, eine über einen Umlauf abgetastete Bahnspur (heliozentrisch bei Planeten, auf den Mutterkörper bezogen bei Monden) sowie Lichtlaufzeit, Einweg- und Zweiwegentfernung, solare Shapiro-Verzögerung und Sonnenabstand von einem Beobachterkörper aus (Standard Erde); zusätzliche from/to-Verbindungen werden ebenso behandelt. Positionen: die Keplerelemente des JPL von Standish und Williams (Table { "1" } für { "1800" } AD bis { "2050" } AD, Tables 2a/2b für { "3000" } BC bis { "3000" } AD) mit dem jeweiligen nominalen Fehler jedes Planeten, die Mondreihe von Montenbruck & Gill für die Aufteilung Erde–Mond, mittlere Elemente des JPL mit der synchronen Rotationsrate der IAU für die Marsmonde und die galileischen Monde sowie das Rotationsmodell der IAU für Titan. Lichtlaufzeit: die radiometrische Fixpunktlösung, Sender an seiner retardierten Position; newtonsch, wobei die Shapiro-Verzögerung gesondert ausgewiesen wird. VALIDATED gegen JPL Horizons (DE441) innerhalb des Doppelten des nominalen Fehlers: Merkur bis Saturn und die Erde aus Table { "1" } (schlechtester Wert das { "1.87" }-Fache des nominalen) und alle acht Planeten aus Tables 2a/2b (schlechtester Wert das { "1.71" }-Fache) sowie die Lichtlaufzeit von der Erde zu Mars und Jupiter. MODELLED, jede Zeile gekennzeichnet: Uranus und Neptun aus Table { "1" } (das { "2.0" }- und das { "5.2" }-Fache des nominalen Fehlers gegen DE441), Pluto (die Zeile von { "1992" }; kein angegebener Fehler), der Mond und die sieben Monde (gemessen gegen Horizons, keine veröffentlichte Schranke).

# attr:alt
seg-537aa8010e50 = Das Diagramm, das die Engine für scenarios/solar-system-tour.toml schreibt, Typ solar-system

# text
seg-e7dad1a1ecba = Positionierung um einen beliebigen Körper des Sonnensystems: ein Orbiter oder ein Lander auf der Oberfläche um einen namentlich gewählten Zentralkörper (Mars, der Mond, Europa, Ganymed, Titan und der Rest des Katalogs des Sonnensystems), der mit Einweg-Pseudoentfernungen von einer kleinen Walker-Navigationskonstellation um den Körper navigiert (Zweikörperbahnen mit der eigenen säkularen J2-Drift des Körpers, eine unbekannte Nutzeruhr) und optional mit einer uhrenfreien Zweiweg-Entfernungsmessung im Weltraum von der Erde, deren Richtung und Entfernung zu jeder Epoche aus der analytischen Ephemeride des Sonnensystems stammen. Sichtlinien werden von der mittleren Kugel des Körpers blockiert, und ein Nutzer auf der Oberfläche braucht außerdem die Elevationsmaske. Je Epoche: Relais in Sicht, ob die Erde über dem Limb steht, das GDOP und PDOP der reinen Konstellation (geometrische und Positions-Verdünnung der Genauigkeit), die formale Ein-Sigma-Positionsunsicherheit mit und ohne die Erdzeile und der Fehler einer mit Seed erzeugten Gauß-Newton-Kleinste-Quadrate-Lösung in beiden Fällen; über den Lauf: Verfügbarkeit, Erdsichtbarkeit, medianes PDOP, RMS-Fehler und medianes formales Sigma, dazu Lichtlaufzeit von der Erde zum Körper, Hin- und Rückweg, Shapiro-Verzögerung und Sonnenabstand zur Epoche. MODELLED: Die Relaisbahnen, die Rauschpegel und das momentane Messmodell sind Modellierungsentscheidungen, nicht gegen Navigationsdaten einer Mission validiert; die Körperkonstanten sind die in body.rs genannten veröffentlichten Werte, und die Erdgeometrie erbt die Bezeichnungen der Ephemeride des Sonnensystems.

# attr:alt
seg-6f341acbe994 = Das Diagramm, das die Engine für scenarios/mars-orbit-pnt.toml schreibt, Art body-pnt

# text
# c1: tle
# c2: orbit
# c3: epoch
# c4: tle
# c5: tle
# c6: epoch
seg-24266bc264df = Ephemeride und Bodenspur: einen Satelliten propagieren (TLE→SGP4 oder analytische Bahn) und seinen TEME-/GCRS-Zustand (Position + Geschwindigkeit), die ITRF-/ECEF-Position, Breite/Länge/Höhe des WGS-84-Subsatellitenpunkts und je Schritt Azimut/Elevation/Entfernung + Entfernungsrate (Doppler) der Station ausgeben. Der Satellit stammt aus einem <c1/> oder aus einer analytischen <c2/> mit ihrer <c3/> (ein <c4/> hat Vorrang, wenn beide angegeben sind); bei einem <c5/> überschreibt eine <c6/> die eigene Epoche des TLE als t = { "0" }.

# attr:alt
seg-0fd3c58fde09 = Das Diagramm, das die Engine für scenarios/ephemeris.toml schreibt, Art ephemeris

# text
seg-3f749aef8d89 = PNT im Deep Space am Mars: Eine simulierte MARCONI-Relais-Konstellation (areostationäre + geneigte Relais, die Einweg senden + Zweiweg an eine Deep-Space-Station weiterleiten) navigiert einen Referenznutzer (transfer | lmo | surface) durch den gemeinsamen radiometrischen Einweg-/Zweiweg-Fusionsschätzer. Sie gibt pro Epoche Geometrie/Sichtbarkeit, den erreichten RMS gegen die Wahrheit und die formale Kovarianz (1σ / 3σ Position) aus — eine ehrliche simulierte Gütezahl, KEIN zertifiziertes Schutzniveau.

# attr:alt
seg-c564dca90854 = Das Diagramm, das die Engine für scenarios/mars-pnt-lmo.toml schreibt, Kind mars-pnt

# text
seg-cb4262b66b8f = GNSS-Verfügbarkeit + DOP aus einer Bahnkonstellation (Walker / TLE / RINEX).

# attr:alt
seg-3b652c0da6de = Das Diagramm, das die Engine für scenarios/orbit-rinex.toml schreibt, Kind orbit

# text
seg-a4bdfc291fce = Vorhersage von Bodenstations-Überflügen: die Sichtbarkeits-Überflüge im Zeitbereich (AOS/TCA/LOS, maximale scheinbare Elevation, Dauer) einer Kreisbahn, als mittlere SGP4-Elemente zu Fensterbeginn, über einer Station oberhalb einer Elevationsmaske über ein Fenster hinweg, mit der gesamten Zugriffszeit. SGP4/SDP4-Propagation im erdfesten Bezugssystem IAU 2006/2000A (optional UT1 - UTC und Polbewegung), troposphärische Refraktion nach ITU-R P.834-9 und die Downlink-Lichtlaufzeit (beide standardmäßig an), Durchgänge auf { "1e-7" } s gelöst und die Kulmination per Goldener-Schnitt-Suche. Die Überflug-Geometrie ist gegen Orekit { "13.1.8" } an Stationen auf Meereshöhe VALIDATED; die Bahn und die Station des Szenarios sind illustrative Eingaben.

# attr:alt
seg-a09be8c586e3 = Das Diagramm, das die Engine für scenarios/passes.toml schreibt, Kind passes

# text
seg-4e31c8daf798 = Register

# text
# c1: docs/kinds/constellations-coverage-and-geometry.md
seg-44bbec836934 = Quelle: <c1/>

# text
seg-34a6079984a7 = Konstellationen, Abdeckung und Geometrie (Szenario-Kind-Familie)

# text
seg-6800289a282d = { "7" } Szenario-Kinds der Engine v{ $version }. Beratend: Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jedes Label hier stammt von der Engine oder von der Verifikationsmatrix; ein Kind ist MODELLED, sofern die Matrix nichts anderes sagt (wie ein Label verdient wird: der Abschnitt Evidence der README).

# text
# c1: kshana scenarios/orbit-gnss-challenged.toml
seg-d95cc2c1e798 = Themenseiten: <a1>CONSTELLATION-DESIGN</a1>, <a2>COVERAGE</a2>, <a3>SOLAR-SYSTEM</a3>, <a4>SKYLINE</a4>. Einen ausführen: <c1/>. Alle Familien: <a5>KINDS.md</a5>.

# attr:alt
seg-f044822c2fab = Kontaktbogen der Diagramme, die die Engine für die Kinds der Familie Konstellationen, Abdeckung und Geometrie schreibt

# text
seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

# text
seg-e2450f89bcc6 = Ephemeride & Bodenspur: einen Satelliten propagieren (TLE→SGP4 oder analytische Bahn) und seinen TEME/GCRS-Zustand (Position + Geschwindigkeit), die ITRF/ECEF-Position, WGS-84-Subsatelliten-Breite/Länge/Höhe und pro Schritt st

# text
seg-d021c1b23dbc = Konstellationsentwurf im großen Maßstab: Walker-DELTA- und Walker-STAR-Muster in der Konvention i: T/P/F (Knoten verteilt über { "360" } oder { "180" } deg, Abstand in der Ebene { "360" }<em>P/T, Phasenversatz zwischen den Ebenen { "360" }</em>F/T), explizit

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
seg-f6914ea43dba = Das gesamte Sonnensystem zu einer Epoche, für PNT (Positionierung, Navigation und Zeitgebung) um jeden Körper.

# text
seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

# text
seg-d71a07d8a59e = Positionierung um jeden Körper des Sonnensystems: ein Orbiter oder ein Lander auf der Oberfläche um einen namentlich gewählten Zentralkörper (Mars, der Mond, Europa, Ganymed, Titan und der Rest des Sonnensystem-Katalogs), navi

# text
seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

# text
seg-f6b22521b4a4 = PNT im Deep Space am Mars: Eine simulierte MARCONI-Relais-Konstellation (areostationäre + geneigte Relais, die Einweg senden + Zweiweg an eine Deep-Space-Station weiterleiten) navigiert einen Referenznutzer (transfer / l

# text
seg-cc85d9962c25 = Vorhersage von Bodenstations-Überflügen: die Sichtbarkeits-Überflüge im Zeitbereich (AOS/TCA/LOS, maximale scheinbare Elevation, Dauer) einer Kreisbahn, als mittlere SGP4-Elemente zu Fensterbeginn, über einer Station ober

# text
seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

# text
# c1: seed
# c2: threshold_ns
# c3: mask_deg
# c4: time
# c5: user|user_site
# c6: constellation
# c7: clock_quantum
# c8: clock_classical
# c9: sigma_uere_m
# c10: constellations
# c11: epoch
# c12: export_sp3
# c13: export_omm
# c14: export_oem
# c15: skyline
seg-a7bd3325080c = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>. Optional: <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-5e8a5e611ba9 = <b>Register:</b> MODELLED { "4" } · VALIDATED { "4" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>orbit</a1>.

# text
# c1: tle|orbit+epoch
# c2: step_s
# c3: duration_s
# c4: station
# c5: dut1_s
# c6: xp_arcsec
# c7: yp_arcsec
# c8: carrier_hz
# c9: eop_finals2000a
seg-968c1512151e = Erforderliche Felder: <c1/>. Optional: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

# text
seg-8c5e41cef6fd = <b>Register:</b> VALIDATED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>ephemeris</a1>.

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
seg-47aaf1afd6ec = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-bacf2a133146 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>constellation-design</a1>.

# text
# c1: epoch
# c2: epoch_jd_tdb
# c3: bodies
# c4: observer
# c5: track_points
# c6: table
# c7: links
seg-e99c2a83034e = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-d91ded1df3a2 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "3" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>solar-system</a1>.

# text
# c1: body
# c2: epoch
# c3: epoch_jd_tdb
# c4: duration_s
# c5: step_s
# c6: seed
# c7: table
# c8: user
# c9: constellation
# c10: earth_link
seg-fe02605b130e = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-12bc4b4b4631 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>body-pnt</a1>.

# text
# c1: user
# c2: clock_class
# c3: step_s
# c4: duration_s
# c5: nmax
# c6: range_sigma_m
# c7: doppler_sigma_mps
# c8: dynamic_tightness
# c9: two_way_period_s
# c10: seed
seg-bee590b4c9e7 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-c0394ad71cfe = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>mars-pnt</a1>.

# text
# c1: altitude_km
# c2: inclination_deg
# c3: raan_deg
# c4: arg_lat_deg
# c5: station_lat_deg
# c6: station_lon_deg
# c7: station_alt_m
# c8: epoch
# c9: mask_deg
# c10: duration_hours
# c11: step_s
# c12: refraction
# c13: light_time
# c14: ut1_minus_utc_s
# c15: xp_arcsec
# c16: yp_arcsec
seg-352823f8c5ac = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-bb4fa18e50a6 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "2" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>passes</a1>.

# text
seg-490ec99e2a38 = <s1>Zurück</s1>Uhren, Zeitgebung und Holdover

# text
seg-90ff7426b999 = <s1>Weiter</s1>GNSS-Messungen, Positionierung und Integrität
