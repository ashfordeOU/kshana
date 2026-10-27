# docs--kind-passes: translations (de)

# text
seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Art nennen.

# text
seg-debc2f07db78 = true

# text
seg-37d29d8303fe = km

# text
seg-0f4c2ab525ac = <b>MODELLED</b> Downlink-Es/N0 entlang jedes Überflugs eines Satelliten über einer Station (EIRP, Freiraumdämpfung, atmosphärische Dämpfung nach dem Kosekansgesetz, übrige Verluste, G/T, Boltzmann-Konstante, Symbolrate), der effizienteste DVB-S2-MODCOD, der seine ETSI EN { "302" } 307-

# text
seg-72fd0321e4af = Themenseite: <a1>CONTACT-SCHEDULING.md</a1>

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
seg-4636d450ef60 = <b>MODELLED</b> Ein Lauf nimmt einen Kontaktplan (eine Liste von aos_s/los_s-Fenstern, die jeweils von der Apertur Navigation oder Kommunikation anfordern — dasselbe Fenstervokabular, das <c1/> ausgibt, umgewandelt von <c2/>), eine Apert

# text
seg-11e8c29ecb45 = Szenarioart der Engine v{ $version }, Familie <a1>Konstellationen, Abdeckung und Geometrie</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-a4f1e7d2041e = Familienseite: <a1>Konstellationen, Abdeckung und Geometrie</a1>

# text
seg-df90e5910fb4 = hr

# text
# c1: docs/kinds/by-kind/passes.md
seg-2544da673115 = Quelle: <c1/>

# text
seg-a4bdfc291fce = Vorhersage von Bodenstations-Überflügen: die Sichtbarkeits-Überflüge im Zeitbereich (AOS/TCA/LOS, maximale scheinbare Elevation, Dauer) einer Kreisbahn, als mittlere SGP4-Elemente zu Fensterbeginn, über einer Station oberhalb einer Elevationsmaske über ein Fenster hinweg, mit der gesamten Zugriffszeit. SGP4/SDP4-Propagation im erdfesten Bezugssystem IAU 2006/2000A (optional UT1 - UTC und Polbewegung), troposphärische Refraktion nach ITU-R P.834-9 und die Downlink-Lichtlaufzeit (beide standardmäßig an), Durchgänge auf { "1e-7" } s gelöst und die Kulmination per Goldener-Schnitt-Suche. Die Überflug-Geometrie ist gegen Orekit { "13.1.8" } an Stationen auf Meereshöhe VALIDATED; die Bahn und die Station des Szenarios sind illustrative Eingaben.

# text
# c1: scenarios/passes.toml
seg-3050cc7fdc79 = Ein Lauf von <c1/> fasst sich zusammen als: passes: { "5" } Überflug/Überflüge einer { "550" } km / { "97.6" }°-Bahn über ({ "52.2" }°, { "4.4" }°) > { "10" }° in { "24" } h; { "1659" } s Gesamtzugriff (MODELLED)

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
seg-699b650604d4 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

# text
# c1: scenarios/passes.toml
seg-9d2941ba37e2 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-6f849331e33c = Ergebnisbezeichnung (die der Engine): MODELLED — Vorhersage von Bodenstations-Überflügen im Zeitbereich; SGP4/SDP4-Propagation, erdfestes Bezugssystem IAU 2006/2000A (UT1 = UTC, keine Polbewegung, sofern keine Erdorientierungsparameter angegeben sind), scheinbare Elevation mit ITU-R-P.834-9-Refraktion und Lichtlaufzeit, wenn eingeschaltet, Durchgänge und Kulmination verfeinert

# text
seg-db35e4ebd275 = <b>VALIDATED</b> Sichtbarkeits-Überflüge im Zeitbereich (AOS/TCA/LOS, maximale Elevation, Dauer) eines Engine-Propagators über einer Station oberhalb einer Elevationsmaske, mit interpolierten Auf-/Untergangsdurchgängen und Gesamtzugriff: passes::predict_passes, der geometrische Scheduler (kein Tests: <a1>ground_station_pass_prediction_reference.rs</a1>.

# text
seg-6799a54acee6 = <b>VALIDATED</b> Sichtbarkeits-Überflüge (AOS, TCA, LOS, maximale scheinbare Elevation, Dauer) eines SGP4-Elementsatzes über einer WGS-84-Station auf dem validierten Erdbahn-Pfad (IAU 2006/2000A, optionale Erdorientierungsparameter), mit troposphärischer Refraktion nach ITU-R P.834-9 Tests: <a1>pass_predictor_on_path_orekit_oracle.rs</a1>.

# text
seg-42d4290ed718 = <b>VALIDATED</b> Sichtbarkeits-Überflüge im Zeitbereich (AOS/TCA/LOS, maximale Elevation, Dauer) eines Engine-Propagators über einer Station oberhalb einer Elevationsmaske, mit interpolierten Auf-/Unter. Unabhängige Referenz (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — eine unabhängige Flugdynamik-Bibliothek: ElevationDetector (Brent-Nullstellensucher) + EventsLogger über einer ITRF-Ephemeride, Station als WGS-84-TopocentricFrame. AOS/LOS/maximale Elevation/Überflugzahl/Gesamtzugriff stimmen bei identischer Bahn+Station+Maske+Fenster überein (eingecheckte Fixture; Treiber xval/orekit-passes)

# text
# c1: label
seg-eb79c117f1df = MODELLED — Vorhersage von Bodenstations-Überflügen im Zeitbereich; SGP4/SDP4-Propagation, erdfestes Bezugssystem IAU 2006/2000A (UT1 = UTC, keine Polbewegung, sofern keine Erdorientierungsparameter angegeben sind), scheinbare Elevation mit ITU-R-P.834-9-Refraktion und Lichtlaufzeit, wenn eingeschaltet, Durchgänge und Kulmination unterhalb des Schritts verfeinert (Ergebnis <c1/>)

# text
seg-a7ddc8eeaf1e = <s1>Zurück</s1>orbit

# text
seg-3079cfb8decc = <s1>Weiter</s1>pvt

# text
# c1: passes
seg-0db3f4e2402e = <c1/> (Szenarioart)

# attr:alt
seg-a09be8c586e3 = Das Diagramm, das die Engine für scenarios/passes.toml schreibt, Szenarioart passes
