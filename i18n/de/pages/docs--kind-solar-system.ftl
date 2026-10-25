# docs--kind-solar-system: translations (de)

# text
seg-e27476e37522 = Erde

# text
seg-5b561b4fd201 = Mars

# text
seg-59f1f277012b = Jupiter

# text
seg-e6e209ad07e0 = Europa

# text
seg-6f12259c6ec4 = Saturn

# text
# c1: docs/kinds/by-kind/solar-system.md
seg-028ac545e52e = Quelle: <c1/>

# text
# c1: solar-system
seg-934e7998420c = <c1/> (Szenariotyp)

# text
seg-0549bc926a9b = Das gesamte Sonnensystem zu einer Epoche, für PNT (Positionierung, Navigation und Zeitgebung) um beliebige Körper. Für die Sonne, die acht Planeten, Pluto, den Mond, Phobos, Deimos, Io, Europa, Ganymed, Kallisto und Titan werden gemeldet: heliozentrische Position und Geschwindigkeit im ICRF (International Celestial Reference Frame, äquatorial J2000), heliozentrische Entfernung sowie ekliptikale Länge und Breite in J2000, der Gravitationsparameter, äquatorialer und mittlerer Radius, J2, soweit veröffentlicht, und sein Bezugsradius, die siderische Rotationsperiode, der IAU-Pol und der Nullmeridian zur Epoche, eine über einen Umlauf abgetastete Bahnspur (heliozentrisch bei Planeten, auf den Mutterkörper bezogen bei Monden) sowie Lichtlaufzeit, Einweg- und Zweiwegentfernung, solare Shapiro-Verzögerung und Sonnenabstand von einem Beobachterkörper aus (Standard Erde); zusätzliche from/to-Verbindungen werden ebenso behandelt. Positionen: die Keplerelemente des JPL von Standish und Williams (Table { "1" } für { "1800" } AD bis { "2050" } AD, Tables 2a/2b für { "3000" } BC bis { "3000" } AD) mit dem jeweiligen nominalen Fehler jedes Planeten, die Mondreihe von Montenbruck & Gill für die Aufteilung Erde–Mond, mittlere Elemente des JPL mit der synchronen Rotationsrate der IAU für die Marsmonde und die galileischen Monde sowie das Rotationsmodell der IAU für Titan. Lichtlaufzeit: die radiometrische Fixpunktlösung, Sender an seiner retardierten Position; newtonsch, wobei die Shapiro-Verzögerung gesondert ausgewiesen wird. VALIDATED gegen JPL Horizons (DE441) innerhalb des Doppelten des nominalen Fehlers: Merkur bis Saturn und die Erde aus Table { "1" } (schlechtester Wert das { "1.87" }-Fache des nominalen) und alle acht Planeten aus Tables 2a/2b (schlechtester Wert das { "1.71" }-Fache) sowie die Lichtlaufzeit von der Erde zu Mars und Jupiter. MODELLED, jede Zeile gekennzeichnet: Uranus und Neptun aus Table { "1" } (das { "2.0" }- und das { "5.2" }-Fache des nominalen Fehlers gegen DE441), Pluto (die Zeile von { "1992" }; kein angegebener Fehler), der Mond und die sieben Monde (gemessen gegen Horizons, keine veröffentlichte Schranke).

# text
# c1: scenarios/solar-system-tour.toml
seg-bd2d27e1f91d = Ein Lauf von <c1/> fasst sich so zusammen: Sonnensystem bei 2026-09-28T00:{ "00" }:{ "00" } (JD { "2461311.50080" } TDB), { "18" } Körper, Beobachter Erde Standish Table { "1" } ({ "1800" } AD bis { "2050" } AD) Sonne { "0.0000" } au Länge { "0.00" } Grad Lichtlaufzeit { "500.1" } s [Ursprung] Merkur { "0.4666" } au Länge { "259.05" } Grad Lichtlaufzeit { "605.3" } s [VALIDATED] Venus { "0.7272" } au Länge { "348.72" } Grad Lichtlaufzeit { "182.1" } s [VALIDATED] Erde { "1.0022" } au Länge { "4.52" } Grad Beobachter [VALIDATED] Mond { "1.0046" } au Länge { "4.56" } Grad Lichtlaufzeit { "1.3" } s [MODELLED] Mars { "1.5544" } au Länge { "83.81" } Grad Lichtlaufzeit { "841.1" } s [VALIDATED] Phobos { "1.5545" } au Länge { "83.81" } Grad Lichtlaufzeit { "841.2" } s [MODELLED] Deimos { "1.5545" } au Länge { "83.80" } Grad Lichtlaufzeit { "841.1" } s [MODELLED] Jupiter { "5.3036" } au Länge { "130.91" } Grad Lichtlaufzeit { "2970.6" } s [VALIDATED] Io { "5.3049" } au Länge { "130.94" } Grad Lichtlaufzeit { "2971.5" } s [MODELLED] Europa { "5.2995" } au Länge { "130.93" } Grad Lichtlaufzeit { "2968.7" } s [MODELLED] Ganymed { "5.3005" } au Länge { "130.98" } Grad Lichtlaufzeit { "2969.6" } s [MODELLED] Kallisto { "5.3153" } au Länge { "130.96" } Grad Lichtlaufzeit { "2976.7" } s [MODELLED] Saturn { "9.4356" } au Länge { "10.77" } Grad Lichtlaufzeit { "4212.2" } s [VALIDATED] Titan { "9.4401" } au Länge { "10.74" } Grad Lichtlaufzeit { "4214.3" } s [MODELLED] Uranus { "19.4363" } au Länge { "62.62" } Grad Lichtlaufzeit { "9444.1" } s [MODELLED] Neptun { "29.8775" } au Länge { "2.62" } Grad Lichtlaufzeit { "14409.3" } s [MODELLED] Pluto { "35.6122" } au Länge { "304.19" } Grad Lichtlaufzeit { "17529.1" } s [MODELLED] Verbindung Mars -> Jupiter: Einweg { "2193.539" } s, Zweiweg { "4386.919" } s, Shapiro { "15.0" } us, Sonne { "15.0" } Grad Verbindung Saturn -> Erde: Einweg { "4212.176" } s, Zweiweg { "8424.347" } s, Shapiro { "22.1" } us, Sonne { "172.5" } Grad Verbindung Europa -> Jupiter: Einweg { "2.218" } s, Zweiweg { "4.437" } s, Shapiro { "0.0" } us, Sonne { "22.0" } Grad

# text
# c1: epoch
# c2: epoch_jd_tdb
# c3: bodies
# c4: observer
# c5: track_points
# c6: table
# c7: links
seg-26ecec1af8af = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/solar-system-tour.toml
seg-13de19567146 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-6081077a5c63 = 2026-09-28T00:{ "00" }:{ "00" }

# text
seg-c4b64eb26210 = ICRF (äquatorial J2000), heliozentrisch; m

# text
seg-6096a0ab243b = Standish Table { "1" } ({ "1800" } AD bis { "2050" } AD)

# text
seg-5c9a8d4716f5 = Ergebnisbezeichnung (die der Engine): MIXED: jeder Körper trägt seine eigene Bezeichnung. Die Planetenpositionen sind VALIDATED gegen JPL Horizons innerhalb des Doppelten des nominalen Fehlers nach Standish (Merkur bis Saturn und die Erde aus Table { "1" }; alle acht Planeten aus Tables 2a/2b); Uranus und Neptun aus Table { "1" }, Pluto, der Mond und die sieben Monde sind MODELLED.

# attr:alt
seg-537aa8010e50 = Das Diagramm, das die Engine für scenarios/solar-system-tour.toml schreibt, Typ solar-system

# text
# c1: solar-system
seg-7432155d5fec = <b>VALIDATED</b> Der Typ <c1/> mit planetary_kernel_path: jeder gemeldete Körper, dessen eigenen NAIF-Code der SPK enthält, bezieht seine heliozentrische J2000-Position und -Geschwindigkeit über den eigenen Leser der Engine aus dem Kernel (Bezeichnung KERNEL), eine Verbindung, deren zwei End

# text
seg-84ce0dd8daef = <b>VALIDATED</b> Heliozentrische Positionen von Merkur, Venus, dem Erde-Mond-Schwerpunkt, der Erde, Mars, Jupiter und Saturn aus Standish Table { "1" } ({ "1800" } AD bis { "2050" } AD) sowie aller acht Planeten aus Tables 2a/2b ({ "3000" } BC bis { "3000" } AD, mit den mittleren Argumenten b, c, s, f). Tests: <a1>solar_system_standish_earth_icrf_preregistered.rs</a1>.

# text
seg-cc5bd76ec542 = <b>MODELLED</b> Positionen von Uranus und Neptun aus Standish Table { "1" } (der Standard innerhalb von { "1800" } AD bis { "2050" } AD), Pluto aus der Zeile von { "1992" } in Table { "1" }, die die aktuelle JPL-Seite nicht mehr aufführt, und die heliozentrische Geschwindigkeit jedes Planeten: die Zweikörperableitung mit Tests: <a1>solar_system_horizons_reference.rs</a1>.

# text
# c1: solar-system
seg-ad3da7fe8e46 = <b>VALIDATED</b> Der Typ <c1/> mit planetary_kernel_path: jeder gemeldete Körper, dessen eigenen NAIF-Code der SPK enthält, bezieht seine heliozentrische J2000-Position und -Geschwindigkeit aus. Referenz (ExternalDataset): NAIF SPICE Toolkit (CSPICE N0067 bis spiceypy { "8.3.0" }) spkezr heliozentrische Zustände auf der vollständigen de440s.bsp, ein separates Programm, das keinen Kshana-Code aufruft (tests/fixtures/solar_system_kernel/, NOTICE.md); die Engine liest bitgenau Ausschnitte von de440s. Vorab registriert f8e946ea. Eine Bibliotheksprüfung der Verdrahtung: DE440 selbst und die analytischen Körper sind hier nicht validiert. Ergebnisse: docs/design/evidence/cap31-solar-system-kernel/RE

# text
seg-735fb0bc1705 = <b>VALIDATED</b> Heliozentrische Positionen von Merkur, Venus, dem Erde-Mond-Schwerpunkt, der Erde, Mars, Jupiter und Saturn aus Standish Table { "1" } ({ "1800" } AD bis { "2050" } AD) sowie aller . Referenz (ExternalDataset): geometrische heliozentrische Vektoren (ekliptikal und ICRF) aus JPL Horizons DE441, abgerufen nach den Commits der Vorregistrierung { "80451866" }, 8d38a28b und 558cc807. Zielwert: pro Planet und Komponente RMS höchstens das 1.0-Fache der angenäherten Fehler der Explanatory Supplement 3rd ed. Table { "8.10.1" } (die EMB-Zeile für die Erde); die Aufteilung Erde–EMB wird direkt gegen DE441 { "399" } minus { "3" } geprüft, höchstens { "0.3" } deg und { "8.1" } km zu jeder Epoche 1950-2050 (th

# text
seg-ab1192de28f5 = <b>VALIDATED</b> Die newtonsche Einweg-Lichtlaufzeit von einem beliebigen Körper zu einem anderen, empfangen zu einer Epoche, gelöst mit dem radiometrischen Fixpunkt-Lichtlaufzeitlöser (radiometric::light_t. Referenz (ExternalDataset): Einweg-Lichtlaufzeit LT (newtonsch, Abwärtsstrecke) aus JPL Horizons DE441 (VEC_CORR=LT, Beobachter im Erdzentrum), vorab registriert (480037d3, Änderung 54d5c86f, die nach dem Scheitern des ersten Abrufs an seiner Interpolationsvorbedingung von { "10" } m nur den Stützstellenabstand der Interpolation änderte, bevor irgendeine Lichtlaufzeit verglichen wurde) mit einem Zielwert von { "1e-6" } s pro Lichtlaufzeit, wobei der Löser mit den baryzentrischen Positionen von DE441 gespeist wurde, sodass die Iteration über die retardierte Senderposition sichtbar ist

# text
seg-5a2e745828ea = <b>MODELLED</b> Positionen von Uranus und Neptun aus Standish Table { "1" } (der Standard innerhalb von { "1800" } AD bis { "2050" } AD), Pluto aus der Zeile von { "1992" } in Table { "1" }, die die aktuelle JPL-Seite nicht mehr au. Referenz (ExternalDataset): Gemessen gegen JPL Horizons DE441 (dieselben committeten Fixtures), aber nicht validiert: Die angegebenen Werte von Table { "1" } für Uranus und Neptun werden gegen heliozentrische Positionen aus DE441 um bis zum { "2.0" }- und { "5.2" }-Fachen überschritten (Neptun erfüllt sie gegen baryzentrische Positionen, was nahelegt, dass die Anpassung nicht heliozentrisch war), die Seite nennt keinen Fehler für Pluto, und für die Geschwindigkeiten gibt es keine veröffentlichte Schranke. Tables 2a/2b erfüllen ihre eigenen

# text
# c1: label
seg-0131b082906b = MIXED: jeder Körper trägt seine eigene Bezeichnung. Die Planetenpositionen sind VALIDATED gegen JPL Horizons innerhalb des Doppelten des nominalen Fehlers nach Standish (Merkur bis Saturn und die Erde aus Table { "1" }; alle acht Planeten aus Tables 2a/2b); Uranus und Neptun aus Table { "1" }, Pluto, der Mond und die sieben Monde sind MODELLED. Die Lichtlaufzeiten sind newtonsch, aus denselben Positionen. (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-3e24f0bf9ccd = MODELLED, jede Zeile gekennzeichnet: Uranus und Neptun aus Table { "1" } (das { "2.0" }- und das { "5.2" }-Fache des nominalen Fehlers gegen DE441), Pluto (die Zeile von { "1992" }; kein angegebener Fehler), der Mond und die sieben Monde (gemessen gegen Horizons, keine veröffentlichte Schranke). (Typkatalog (<c1/>))

# text
seg-62b2e925233a = WAS VALIDATED IST UND WAS NICHT Jeder Körper trägt seine eigene Bezeichnung. Merkur bis Saturn und die Erde sind VALIDATED gegen JPL Horizons (Development Ephemeris DE441) innerhalb des Doppelten des nominalen Fehlers der Seite von Standish. Uranus und Neptun aus Table { "1" } überschreiten die Werte der Seite gegen DE441 (um das { "2.0" }- und das { "5.2" }-Fache) und sind MODELLED; ebenso Pluto, der Mond und die sieben Monde, die gegen Horizons gemessen wurden, aber kein p (Kommentar der Szenariodatei, Zeilen { "20" } bis { "25" })

# text
seg-2b36ac40e457 = Uranus und Neptun aus Standish Table { "1" }, Pluto und die Planetengeschwindigkeiten sind MODELLED, nicht validiert: eine Teilbehauptung wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit MODELLED. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-c19e6d035b7e = Positionen des Mondes und von sieben großen Monden (Phobos, Deimos, die galileischen Monde, Titan) sind MODELLED, nicht validiert: eine Teilbehauptung wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit MODELLED. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-ce15aaa5453c = Die physikalischen Konstanten jedes Körpers des Sonnensystems und der Bericht über das gesamte System sind MODELLED, nicht validiert: geprüft gegen die eigene geschlossene bzw. analytische Identität — das findet Übertragungs- und Koeffizientenfehler, ist aber keine externe Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-ceadf891b1e2 = <s1>Zurück</s1>slot-timing

# text
seg-0493962a6937 = <s1>Weiter</s1>space-packet

# text
seg-11e8c29ecb45 = Szenarioart der Engine v{ $version }, Familie <a1>Konstellationen, Abdeckung und Geometrie</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-dae4184bb004 = <b>VALIDATED</b> Die newtonsche Einweg-Lichtlaufzeit von einem beliebigen Körper zu einem beliebigen anderen, empfangen zu einer Epoche, gelöst vom radiometrischen Fixpunkt-Lichtlaufzeitlöser (radiometric::light_time_solution, Sender an seiner retardierten Position) über solar_system::link_o Tests: <a1>solar_system_light_time_preregistered.rs</a1>.

# text
seg-a4f1e7d2041e = Familienseite: <a1>Konstellationen, Abdeckung und Geometrie</a1>

# text
seg-670191cf797f = Themenseite: <a1>SOLAR-SYSTEM.md</a1>

# text
seg-cef32ee7d521 = Themenseite: <a1>CONSTELLATION-DESIGN.md</a1>

# text
seg-4d208b6c0eb8 = Tag

# text
seg-3319b18ac61f = und { "1" } weitere in der Matrix.

# text
seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die dieses Kind nennen.
