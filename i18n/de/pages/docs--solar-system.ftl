# docs--solar-system: translations (de)

# attr:aria-label, text
seg-31a05429b836 = Körper

# text
seg-1c78d5337e16 = Pluto

# text
seg-6cb7a787ac67 = Referenzen

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-60cd077d82a7 = Modell

# text
seg-c5ce76c91ff7 = Kennzeichnung

# text
seg-430edd66bda0 = Nicht modelliert

# text
seg-7670cf4ceda3 = Standard

# text
seg-e0eb14018b2c = wie oben

# text
seg-3dbc7ff9f5ab = Tabelle

# text
# c1: docs/SOLAR-SYSTEM.md
seg-9fe60d39f2db = Quelle: <c1/>

# text
seg-c44439432020 = Sonnensystem und Positionierung um andere Körper

# text
seg-4d4ee55b5fb4 = Zwei Szenarioarten arbeiten jenseits des Erde-Mond-Systems:

# text
# c1: solar-system
seg-fa202376da31 = <c1/> meldet jeden Körper des Katalogs zu einer Epoche: Position und Geschwindigkeit, physikalische Konstanten, Lichtlaufzeit und Entfernung von einem Beobachterkörper sowie eine Bahnspur.

# text
# c1: body-pnt
seg-9859aabbb4f4 = <c1/> setzt einen Navigationsnutzer (einen Orbiter oder einen Lander auf der Oberfläche) um einen beliebigen Katalogkörper außer Sonne und Erde, mit einer lokalen Navigationskonstellation und einer optionalen Entfernung im tiefen Raum von der Erde.

# text
# c1: constellation-design
seg-ec582fa8f67f = Die Art <c1/> verwendet denselben Katalog, um Konstellationen um jeden dieser Körper aufzubauen (<a1>CONSTELLATION-DESIGN.md</a1>).

# text
# c1: src/body.rs
# c2: src/ephem.rs
# c3: src/ephem_provider.rs
# c4: AnalyticSolarSystem
# c5: src/solar_system.rs
# c6: src/body_pnt.rs
# c7: src/radiometric.rs
# c8: tests/solar_system_horizons_reference.rs
seg-31f150c83173 = Code: <c1/> (der Katalog und seine Konstanten), <c2/> (die analytischen Ephemeriden), <c3/> (<c4/>, der Anbieter, den beide Arten lesen), <c5/> und <c6/> (die Arten) und <c7/> (Lichtlaufzeit, Zwei-Wege-Entfernung und die Shapiro-Verzögerung). Tests: <c8/> und die Unit-Tests jedes Moduls.

# text
seg-3ce9aab4916e = Der Katalog

# text
# c1: src/body.rs
# c2: J2
seg-35cd9ebaf04e = Achtzehn Körper: die Sonne, die acht Planeten, Pluto, der Mond, Phobos, Deimos, die vier galileischen Monde (Io, Europa, Ganymed, Kallisto) und Titan. Namen werden ohne Beachtung der Groß- und Kleinschreibung abgeglichen. Für jeden enthält <c1/> den Gravitationsparameter GM, den äquatorialen und den volumetrischen mittleren Radius, die zweite zonale Harmonische <c2/> und deren Bezugsradius, wo einer veröffentlicht ist, sowie das Pol- und Nullmeridian-Modell der Internationalen Astronomischen Union (IAU) (siderische Rotationsperiode, negativ bei einem rückläufigen Rotator). Jeder Wert nennt seine Quelle im Code.

# text
seg-525b8b29345d = Woher die Positionen kommen

# text
seg-0fd4c3af55ba = Merkur bis Saturn und die Erde, aus Tabelle { "1" } ({ "1800" } n. Chr. bis { "2050" } n. Chr.)

# text
seg-9d820791a27b = Keplersche Elemente des Jet Propulsion Laboratory (JPL) von Standish und Williams, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>

# text
seg-d8549658ae99 = Alle acht Planeten aus den Tabellen 2a/2b ({ "3000" } v. Chr. bis { "3000" } n. Chr.)

# text
seg-1f0b417c3809 = die Elemente für lange Zeitspannen derselben Seite

# text
seg-bfe1c209044a = Uranus und Neptun aus Tabelle { "1" }

# text
seg-ba5dfdd2de52 = die Zeile der Tabelle { "1" } von { "1992" } ({ "1800" } n. Chr. bis { "2050" } n. Chr. nur; die aktuelle Seite hat sie entfernt und nennt keinen Fehler)

# text
seg-001ca2ad22e1 = Der Mond

# text
seg-6ff6068aeacf = die Mondreihe von Montenbruck und Gill, die das Erde-Mond-Baryzentrum aufteilt

# text
seg-f906cffa45a2 = Phobos, Deimos, die galileischen Monde, Titan

# text
seg-6ba84144ad88 = mittlere Elemente des JPL mit dem Rotationsmodell der IAU

# text
# c1: table = "auto"
# c2: table1
# c3: table2
# c4: epoch_jd_tdb
seg-d5640ad2cd08 = <c1/> (der Standard) nimmt Tabelle { "1" } innerhalb von { "1800" } n. Chr. bis { "2050" } n. Chr. und die Tabellen 2a/2b außerhalb davon; <c2/> und <c3/> erzwingen jeweils eine. Pluto außerhalb seiner Tabelle ist ein Fehler, keine Extrapolation. Die Epoche ist ein Datum mit Uhrzeit nach ISO { "8601" } in koordinierter Weltzeit (UTC), über die Terrestrische Zeit (TT) mit den Schaltsekunden in die Baryzentrische Dynamische Zeit (TDB) umgerechnet, oder ein TDB-Julianisches Datum, direkt mit <c4/> angegeben.

# text
# c1: tests/fixtures/solar_system/
# c2: cargo test --test solar_system_horizons_reference -- --nocapture
seg-912a2223e495 = Die unabhängige Referenz ist JPL Horizons (<a1>https://ssd.jpl.nasa.gov/horizons/</a1>, Development Ephemeris DE441), mit den abgefragten Vektoren, die unter <c1/> eingecheckt sind. Eine Planetenzeile ist VALIDATED, wo sie innerhalb des Doppelten des eigenen nominalen Fehlers der Standish-Seite bleibt. Gemessen mit <c2/>:

# text
seg-d8bbd5e4f483 = Tabelle { "1" }, Merkur bis Saturn und das Erde-Mond-Baryzentrum, { "12" } Epochen von { "1800" } bis { "2049" }: im ungünstigsten Fall das { "1.87" }-Fache des nominalen Fehlers (Entfernung des Saturn).

# text
seg-18568cec6c91 = Tabellen 2a/2b, alle acht Planeten, { "15" } Epochen von etwa { "1000" } v. Chr. bis { "2500" } n. Chr.: im ungünstigsten Fall das { "1.71" }-Fache (Entfernung des Mars).

# text
seg-7f3aa4a24e8f = Uranus und Neptun nach Tabelle { "1" } überschreiten die Angaben der Seite gegenüber DE441: das { "2.04" }- und das { "5.16" }-Fache des nominalen Längenfehlers. Sie sind unter dem Sechsfachen festgeschrieben und bleiben MODELLED.

# text
seg-41d2f404224b = Pluto: innerhalb von { "39.2" } Bogensekunden in der Länge und { "1.14e9" } m in der Entfernung.

# text
seg-11c31908ba69 = Monde, größter vom Planeten aus gesehener Winkel über { "2000" } bis { "2040" }: Phobos { "5.65" } Grad, Deimos { "0.38" }, Io { "0.40" }, Europa { "1.63" }, Ganymed { "0.22" }, Kallisto { "0.27" }, Titan { "3.31" }. Der geozentrische Mond: { "0.046" } Grad.

# text
seg-24d36a3ce8d4 = Planetengeschwindigkeiten: größter relativer Fehler { "3.72e-3" } der Geschwindigkeit (MODELLED).

# text
seg-0bae9b8d09ea = Der Mond und die sieben Monde sind mit festgeschriebenen Zielwerten gemessen, aber es gibt keine veröffentlichte Schranke, gegen die sie validiert werden könnten, daher sind sie MODELLED.

# text
# c1: xval/
# c2: EphemerisProvider
seg-2cf791a940ea = Die analytischen Ephemeriden brauchen keine Kerneldatei. Ein Kernel der JPL Development Ephemeris (Positionen in DE-Güte) wird nur von den separaten Kreuzvalidierungs-Crates unter <c1/> gelesen, über dasselbe Trait <c2/>; das Haupt-Crate hängt nicht von ihnen ab.

# text
# c1: epoch
# c2: epoch_jd_tdb
# c3: bodies
# c4: observer
# c5: track_points
# c6: table
# c7: [[links]]
seg-5bff2c54125b = Eingaben: <c1/> (Standard 2026-01-01T00:{ "00" }:{ "00" }) oder <c2/>; <c3/> (Standard alle achtzehn); <c4/> (Standard die Erde); <c5/> je Bahn ({ "8" } bis { "2000" }, Standard { "120" }); <c6/>; und beliebig viele <c7/>, jede zur Epoche empfangen.

# text
seg-5787ece2c791 = Je Körper liefert das Ergebnis seine Klasse und seinen Mutterkörper, die Kennung der NASA Navigation and Ancillary Information Facility (NAIF), die heliozentrische Position und Geschwindigkeit im Internationalen Himmelsreferenzsystem (ICRF, äquatorial J2000) in Metern und Metern pro Sekunde, die ekliptikale Länge, Breite und Entfernung, die Position relativ zum Mutterkörper, die Umlaufdauer, die obigen Konstanten, den Pol und den Nullmeridian zur Epoche, den nominalen Fehler nach Standish, wo einer existiert, seine Bezeichnung und Methodenzeichenfolge sowie eine Bahnspur über einen Umlauf (heliozentrisch bei einem Planeten, auf den Mutterkörper zentriert bei einem Mond; ein einzelner Punkt bei der Sonne). Die Verbindung vom Beobachter und jede zusätzliche Verbindung liefert:

# text
seg-36bad4b7b4ba = die newtonsche Einweg-Lichtlaufzeit, gelöst vom radiometrischen Fixpunkt-Lichtlaufzeit-Löser mit dem Sender an seiner retardierten Position, und die entsprechende Einweg-Entfernung;

# text
seg-c5602eb76a05 = die Zwei-Wege-Lichtlaufzeit und -Entfernung;

# text
seg-dab8e2db61d3 = die Shapiro-Verzögerung der Sonne, gesondert ausgewiesen und nicht addiert;

# text
seg-90d00587a59f = der Sonnenabstandswinkel.

# text
seg-4c172f9f7cf6 = Die Lichtlaufzeit ist gegen die von Horizons gemeldete Einweg-Lichtlaufzeit VALIDATED: Mars und Jupiter zum Erdmittelpunkt bei vier Epochen von { "2000" } bis { "2040" }, größter Fehler { "0.070" } s für den Mars gegenüber einem Zielwert von { "0.207" } s und { "1.31" } s für Jupiter gegenüber { "4.04" } s. Der Zielwert ist das Doppelte der Summe der Standish-Entfernungsfehler des Ziels und des Erde-Mond-Baryzentrums, geteilt durch die Lichtgeschwindigkeit: Die Lichtlaufzeit kann nicht besser sein als die Positionen. Sie ist die newtonsche geometrische Lichtlaufzeit, keine relativistische oder plasmakorrigierte Observable.

# text
# c1: scenarios/solar-system-tour.toml
seg-4f8cd6aef754 = Das mitgelieferte <c1/> meldet alle achtzehn Körper bei 2026-09-28T00:{ "00" }:{ "00" } mit Spuren aus 180 Punkten und fügt die Verbindungen Mars-zu-Jupiter (Einweg { "2193.539" } s), Saturn-zu-Erde ({ "4212.176" } s) und Europa-zu-Jupiter ({ "2.218" } s) hinzu.

# text
seg-d22cc535f04b = Ein Nutzer navigiert um einen namentlich gewählten Körper (jeden Katalogkörper außer Sonne und Erde, die die Art zurückweist) mit zwei Arten von Messung:

# text
# c1: planes
# c2: sats_per_plane
# c3: phasing_f
# c4: J2
seg-9eeb7f77aec7 = Einweg-Pseudoentfernungen von einer Walker-Delta-Navigationskonstellation um den Körper (<c1/> mal <c2/>, Phasenversatz zwischen den Ebenen <c3/>), geflogen als Zweikörperbahnen mit der säkularen Drift durch das eigene <c4/> des Körpers; die Nutzeruhr ist unbekannt, daher tragen diese Zeilen eine Spalte für den Uhrenbias;

# text
# c1: [earth_link]
seg-56ac318f6f27 = optional eine Zwei-Wege-Entfernung vom Erdmittelpunkt (<c1/>), die keine Nutzeruhr braucht und als Einweg-Entfernung mit eigenem Rauschen gemeldet wird. Richtung und Entfernung der Erde stammen zu jeder Epoche aus der analytischen Ephemeride.

# text
# c1: mars-pnt
seg-551d44492aae = Eine Sichtlinie ist blockiert, wenn sie innerhalb des mittleren Radius des Körpers verläuft (der Sehnentest der Art <c1/>), und ein Oberflächennutzer braucht zusätzlich die Elevationsmaske. Zu jeder Epoche bildet der Lauf den geometrischen und den Positions-Dilution-of-Precision-Wert (GDOP, PDOP) der Konstellation allein, die formale Ein-Sigma-Positionsunsicherheit mit und ohne die Erdzeile und je eine geseedete Gauß-Newton-Kleinste-Quadrate-Lösung in beiden Fällen, sodass der Bericht zeigt, was die Verbindung im tiefen Raum hinzufügt.

# text
seg-6f1161567330 = oberste Ebene

# text
seg-432421ccb9d7 = 2027-02-19T00:{ "00" }:{ "00" }, eine Mars-Opposition

# text
seg-0b688042ed44 = { "86 400" } s, { "600" } s

# text
# c1: orbiter
# c2: surface
seg-c7b3aaecd6e2 = <c1/> (oder <c2/>)

# text
# c1: altitude_km
# c2: inclination_deg
# c3: raan_deg
# c4: u0_deg
# c5: eccentricity
seg-c452a6f7a9d4 = Orbiter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
seg-67f7b23bf604 = { "400" } km, { "75" } Grad, { "0" }, { "0" }, { "0" }

# text
# c1: lat_deg
# c2: lon_deg
# c3: height_m
seg-b412b65733d8 = Oberfläche: <c1/>, <c2/>, <c3/>

# text
seg-7639d2583131 = drei mittlere Radien

# text
seg-fe4a8d9da406 = { "60" } Grad

# text
seg-7ac449fb9569 = { "1" } m

# text
# c1: mask_deg
seg-128c4a5edd9b = <c1/> (Oberflächennutzer)

# text
seg-3d4b760f6ed6 = { "10" } Grad

# text
seg-498493929023 = wahr, { "1" } m

# text
# c1: raan_deg
# c2: u0_deg
seg-18e477dc7f02 = <c1/> ist die Rektaszension des aufsteigenden Knotens im Äquatorialsystem des Körpers und <c2/> das Argument der Breite zur Epoche.

# text
seg-a743b0b5e668 = Die beiden mitgelieferten Szenarien, wie sie mit kshana { "0.36" } laufen (portable Mathematik, auf jeder Plattform gleich):

# text
seg-b24010bdb302 = Nutzer

# text
seg-cb9cd741ba85 = Orbiter, { "300" } km, { "93" } Grad

# text
seg-fa11e61f0d1d = Oberfläche, { "20" } Grad N, { "60" } Grad O

# text
seg-e17a9ae6905c = Relais

# text
seg-359db3c9ad19 = { "12" } bei { "10 000" } km, { "60" } Grad

# text
seg-1bb041045be4 = { "12" } bei { "4500" } km, { "55" } Grad, Maske { "10" } Grad

# text
seg-604aefd62668 = Zeitspanne

# text
seg-825603e2fbed = ein Sol, { "296" } Epochen

# text
seg-372159825c11 = { "306 822" } s, { "171" } Epochen

# text
seg-132e3bbcc94c = Lichtlaufzeit zur Erde, einfach / hin und zurück

# text
seg-76351e2f75f8 = { "338.3" } s / { "676.6" } s

# text
seg-2d0234ec6301 = { "2182.9" } s / { "4365.8" } s

# text
seg-d0f05f440103 = Erde in Sicht

# text
seg-d7ad84776ec6 = { "0.811" } der Epochen

# text
seg-44bf83b16660 = Verfügbarkeit, nur Relais / mit der Entfernung zur Erde

# text
seg-07e0a8499670 = Medianer PDOP

# text
seg-e802f5920237 = RMS-Lösungsfehler, nur Relais / mit der Entfernung zur Erde

# text
seg-ed769d9370a0 = { "1.883" } m / { "1.629" } m

# text
seg-873187e2b016 = { "112.742" } m / { "86.499" } m

# text
seg-bcba58871d0b = Mediane formale Sigma, nur Relais / mit der Entfernung zur Erde

# text
seg-536757d9f141 = { "1.375" } m / { "1.304" } m

# text
seg-14d7b5dc82e8 = { "5.360" } m / { "4.239" } m

# text
# c1: docs/revisions/STUDIO15-portable-math-rebaseline.md
seg-67d3d30060ad = (RMS: quadratischer Mittelwert.) Eine Europa-Epoche (t = { "16 200" } s) liegt an der Verfügbarkeitsgrenze, wo das letzte Bit eines berechneten Radius entscheidet, ob ihre Lösung mit der Entfernung zur Erde zustande kommt. Vor { "0.36" } entschied die Mathematikbibliothek des Hosts darüber, sodass dasselbe Szenario für die beiden Werte „mit der Entfernung zur Erde“ { "0.719" } und { "86.147" } m auf Linux x86-64 und { "0.725" } und { "85.800" } m auf macOS arm64 ausgab. Seit { "0.36" } wird jede transzendente Funktion von der portablen Mathematikbibliothek berechnet, die Epoche löst sich auf jeder Plattform auf dieselbe Weise auf (nativ und WebAssembly liefern dieselben Bytes), und die Werte sind { "0.713" } und { "86.499" } m (<a1><c1/></a1>). Um Europa hebt die Entfernung zur Erde die Verfügbarkeit von { "0.480" } auf { "0.713" } der Epochen. Wo die Erde den Rand nie freigibt, fügt die Verbindung nichts hinzu: Ein Lander bei { "89.5" } Grad S auf dem Mond unter einer Relaishülle aus 12 Satelliten in { "5000" } km hat die Erde bei { "0" } von { "145" } Epochen in Sicht, und seine Fehler sind mit und ohne die Verbindung gleich.

# text
seg-41507568efb8 = <b>MODELLED.</b> Die Relaisbahnen ignorieren dritte Körper (der Zug Jupiters auf Relais um Europa ist nicht modelliert), das Rauschen ist gaußsch bei den angegebenen Pegeln, und das Messmodell ist augenblicklich, nicht um die Lichtlaufzeit retardiert. Was geprüft wird: die Relaisperiode gegen das dritte Keplersche Gesetz für den Körper, ein Orbiter, der seinen Radius hält, und ein Lander auf der Oberfläche, die Entfernung zur Erde, die die formale Unsicherheit nie verschlechtert, die geseedeten Lösungsfehler, die mit dem formalen Sigma übereinstimmen (quadratischer Mittelwert von Fehler über Sigma in [{ "0.6" }, { "1.5" }]), und ein deterministischer Lauf. Nichts davon sind Navigationsdaten einer Mission.

# text
# c1: ephemeris
seg-b78c9e331a43 = Die Art <c1/>

# text
# c1: ephemeris
# c2: eop_finals2000a
# c3: finals2000A
# c4: src/ephemeris.rs
seg-b9f40c641a49 = Trotz des Namens ist <c1/> eine Erdsatelliten-Art: ein Satellit, aus einem Two-Line-Element-Satz (TLE) über den Propagator Simplified General Perturbations { "4" } (SGP4) oder aus einer analytischen Bahn, über ein Zeitraster. In jedem Schritt gibt sie den inertialen Zustand (Position und Geschwindigkeit) im System True Equator, Mean Equinox (TEME) und im Geocentric Celestial Reference System (GCRS), die erdfeste Position, den Subsatellitenpunkt im World Geodetic System { "1984" } (WGS { "84" }) und, für eine optionale Bodenstation, Azimut, Elevation, Entfernung und Entfernungsrate aus. <c2/> nimmt den Text einer <c3/>-Datei des International Earth Rotation and Reference Systems Service (IERS) für UT1−UTC und Polbewegung je Epoche entgegen. Code: <c4/>.

# text
seg-1babcba7b4ba = Relativistische Lichtlaufzeitterme über die gesondert gemeldete Shapiro-Verzögerung hinaus und die Verzögerung durch Sonnenplasma.

# text
seg-0c49dfc777ca = Positionen, die besser sind als die oben angegebene Genauigkeit von Standish und der mittleren Elemente; im Haupt-Crate gibt es keinen Kernel-Leser.

# text
# c1: body-pnt
# c2: constellation-design
seg-18d925e53ce0 = Störungen durch dritte Körper bei Relais von <c1/> und bei Bahnen von <c2/>.

# text
seg-3968ed54e3fe = Gelände auf einem beliebigen Körper: Ein Körper ist seine mittlere Kugel.

# text
# c1: solar-system
# c2: body-pnt
seg-4650526c532e = Interoperabilitäts-Exporte: CZML, KML und GeoJSON beschreiben Positionen um die Erde, daher exportieren die Szenarien <c1/> und <c2/> keine (<a1>INTEROP.md</a1>).

# text
seg-cb7e3d4bf5aa = E. M. Standish und J. G. Williams, "Keplerian Elements for Approximate Positions of the Major Planets", JPL Solar System Dynamics, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>.

# text
seg-aaf6a1f91c1a = O. Montenbruck und E. Gill, <em>Satellite Orbits: Models, Methods and Applications</em>, Springer, { "2000" }, §{ "3.3.2" }.

# text
seg-8b7aa3bb95f0 = B. A. Archinal et al., "Report of the IAU Working Group on Cartographic Coordinates and Rotational Elements: { "2015" }", <em>Celestial Mechanics and Dynamical Astronomy</em> { "130" }, { "2018" }.

# text
seg-10c8408cab27 = JPL Horizons, <a1>https://ssd.jpl.nasa.gov/horizons/</a1>.

# text
seg-e95a41f0ded7 = <s1>Zurück</s1>Validierung des Kraftmodells

# text
seg-a801b99f7040 = <s1>Weiter</s1>Lunare Referenzstation

# text
seg-e0aba02258f4 = Die Ephemeriden-Art
