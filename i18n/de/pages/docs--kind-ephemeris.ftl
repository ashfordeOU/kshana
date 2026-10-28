# docs--kind-ephemeris: translations (de)

# text
seg-37d29d8303fe = km

# text
seg-3068552e4ab4 = VALIDATED: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Art nennen.

# text
seg-c33e3cbba749 = arcsec

# text
seg-11e8c29ecb45 = Szenarioart der Engine v{ $version }, Familie <a1>Konstellationen, Abdeckung und Geometrie</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-a4f1e7d2041e = Familienseite: <a1>Konstellationen, Abdeckung und Geometrie</a1>

# text
seg-670191cf797f = Themenseite: <a1>SOLAR-SYSTEM.md</a1>

# text
seg-a3697ad561db = Hz

# text
# c1: docs/kinds/by-kind/ephemeris.md
seg-e388fdc74ffa = Quelle: <c1/>

# text
# c1: ephemeris
seg-9860cb88c021 = <c1/> (Szenarioart)

# text
# c1: tle
# c2: orbit
# c3: epoch
# c4: tle
# c5: tle
# c6: epoch
seg-24266bc264df = Ephemeride und Bodenspur: einen Satelliten propagieren (TLE→SGP4 oder analytische Bahn) und seinen TEME-/GCRS-Zustand (Position + Geschwindigkeit), die ITRF-/ECEF-Position, Breite/Länge/Höhe des WGS-84-Subsatellitenpunkts und je Schritt Azimut/Elevation/Entfernung + Entfernungsrate (Doppler) der Station ausgeben. Der Satellit stammt aus einem <c1/> oder aus einer analytischen <c2/> mit ihrer <c3/> (ein <c4/> hat Vorrang, wenn beide angegeben sind); bei einem <c5/> überschreibt eine <c6/> die eigene Epoche des TLE als t = { "0" }.

# text
# c1: scenarios/ephemeris.toml
seg-02f2745e0550 = Ein Lauf von <c1/> fasst sich so zusammen: scenario 0d4dd01b3160 | sgp4 (TLE) | { "559" } samples | alt { "419" }–{ "434" } km | |lat| ≤ { "51.8" }° | speed { "7653" }–{ "7661" } m/s | max el { "25.7" }° peak Doppler { "34.3" } kHz

# text
# c1: tle|orbit+epoch
seg-2ce1ab71e2cc = Pflichtfelder: <c1/>

# text
# c1: step_s
# c2: duration_s
# c3: station
# c4: dut1_s
# c5: xp_arcsec
# c6: yp_arcsec
# c7: carrier_hz
# c8: eop_finals2000a
seg-21dc45b3de59 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/ephemeris.toml
seg-cda81cdb3607 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-c59482e7defe = { "1" } 25544U 98067A { "20045.18587073" } .00000950 00000-0 25302-

# text
seg-4d208b6c0eb8 = Tag

# attr:alt
seg-0fd3c58fde09 = Das Diagramm, das die Engine für scenarios/ephemeris.toml schreibt, Art ephemeris

# text
seg-d291f20074f0 = <b>VALIDATED</b> Erddrehung aus einem zweiteiligen UT1-Julianischen Datum auf dem Bahnpfad, sodass die erdfeste Position die Mikrosekunde behält, die ein Datum aus einem einzelnen f64 verliert (etwa { "3e-9" } rad nahe { "2020" }): jd2::gmst82 (IAU-{ "1982" }-GMST, die TEME-Konvention, auf den zwei Teilen), cio:

# text
seg-976416e41291 = <b>VALIDATED</b> SGP4/SDP4, Cowell mit 6 Freiheitsgraden + Störungen, Batch-/sequenzielle Bahnbestimmung. Unabhängige Referenz (ExternalDataset): SGP4-Verifikationsvektoren nach AIAA 2006-6753

# text
seg-7cf505668c3c = <b>VALIDATED</b> IAU-2006/2000A-Präzession-Nutation, CIO GCRS↔ITRS, Schaltsekunden-Zeitskalen. Unabhängige Referenz (ExternalDataset): IAU-SOFA-/ERFA-Referenzvektoren; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

# text
seg-f19ce44dc0c0 = Themenseite: <a1>AGENCY-ORBIT-VALIDATION.md</a1>

# text
seg-a8ea4ba6e244 = <s1>Zurück</s1>eo-radiometry

# text
seg-971864553611 = <s1>Weiter</s1>fusion
