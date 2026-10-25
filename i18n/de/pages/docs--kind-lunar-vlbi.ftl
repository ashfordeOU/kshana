# docs--kind-lunar-vlbi: translations (de)

# text
seg-c1ce24cd6008 = analytisch

# text
seg-37d29d8303fe = km

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
seg-df90e5910fb4 = hr

# text
seg-3843825d0733 = us

# text
seg-d1a6a5086102 = <b>VALIDATED</b> Verzögerungspartielle, über einen Zeitplan aus Basislinien × Epochen zu einer Fisher-Informationsmatrix akkumuliert, invertiert zur Kovarianz der Stationskoordinaten und zum Stations-Sigma je Koordinate, wodurch eine angenommene isotrope Gleichverteilungsverknüpfung aus einer

# text
# c1: all-stations-fixed
seg-55ce02ad5dd5 = <b>MODELLED</b> Eine dritte Datumswahl, <c1/>, die jede Erdstation festhält und allein die mondfesten Koordinaten des BEACON schätzt — die Konfiguration, für die eine Unsicherheit eines Punktes auf der Mondoberfläche tatsächlich angegeben wird, da die Koordinaten der Erdstation

# text
# c1: docs/kinds/by-kind/lunar-vlbi.md
seg-afeb6e26c5ad = Quelle: <c1/>

# text
seg-e01f77d493a0 = Modellierte geodätische Lunar-VLBI-Laufzeitobservable: Eine Erdbasislinie (zwei Bodenstationen, GCRS) beobachtet ein Einweg-Signal eines Beacons der NovaMoon-Klasse auf der Mondoberfläche. Sie liefert die Nahfeld-Laufzeit als Zwei-Entfernungs-Differenz, ihre Rate und die Wellenfrontkrümmungs-Nahfeldkorrektur über einen Durchgang — gegengeprüft gegen die Ebene-Welle-Δ-DOR-Observable derselben Codebasis im Fernfeldgrenzfall, mit durch finite Differenzen verifizierten Partialableitungen. Der analytische Standardpfad ist MODELLED und trägt die Vorbehalte zu Bezugssystemkonsistenz, Polbewegung xp=yp={ "0" } und Ebene-Welle-gegen-Nahfeld. Wird planetary_kernel_path, earth_orientation_kernel_path und moon_orientation_kernel_path gesetzt, läuft stattdessen der Kernel-Pfad (DE440, MOON_PA_DE440, ITRF93; konvergierte baryzentrische Lichtlaufzeiten; ergänzt die Beacon- und Stationspartialableitungen der Epoche), dessen newtonsche Laufzeit und Partialableitungen mit den konvergierten Lichtlaufzeiten von NAIF SPICE auf { "0.06" } ps und { "7.4e-9" } übereinstimmen. Nicht gegen reale VLBI-Daten validiert.

# text
# c1: scenarios/lunar-vlbi.toml
seg-92227c085867 = Ein Lauf von <c1/> fasst sich zusammen als: lunar-vlbi | Basislinie { "10727" } km | Beacon-Entfernung { "402900" } km | Laufzeit -10049.126 µs (Rate { "1.312e-6" } s/s) | Nahfeld { "58.9" } µs | { "13" } Samples über { "6.0" } h

# text
# c1: station1_lat_deg
# c2: station1_lon_deg
# c3: station1_alt_m
# c4: station2_lat_deg
# c5: station2_lon_deg
# c6: station2_alt_m
# c7: beacon_lat_deg
# c8: beacon_lon_deg
# c9: beacon_alt_m
# c10: epoch_year
# c11: epoch_month
# c12: epoch_day
# c13: horizon_hours
# c14: step_min
# c15: planetary_kernel_path
# c16: earth_orientation_kernel_path
# c17: moon_orientation_kernel_path
seg-1a38a07a0d70 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>

# text
# c1: scenarios/lunar-vlbi.toml
seg-11450a55fc9d = Das Beispiel <c1/> setzt unter anderem:

# text
seg-61f431e422e5 = <b>MODELLED</b> Nahfeld-VLBI-Laufzeit für eine Erdbasislinie, die ein Mond-Beacon beobachtet, + Partialableitungen

# text
seg-7342b50d34e4 = <b>VALIDATED</b> Nahfeld-VLBI-Laufzeit für eine Erdbasislinie, die ein Mond-Beacon beobachtet, mit Beacon- und Stationspartialableitungen, auf dem Kernel-Pfad (lunar_vlbi::KernelGeometry): DE440-Erde und -Mond, DE440-Hauptträgheitsachsen des Mondes, ITRF93-Erdorientierung mit UT1 und Tests: <a1>naif_kernel_reader_check.rs</a1>.

# text
seg-5547f1f662d3 = und { "2" } weitere in der Matrix.

# text
seg-1461c84350d8 = <b>MODELLED</b> Nahfeld-VLBI-Laufzeit für eine Erdbasislinie, die ein Mond-Beacon beobachtet, + Partialableitungen. Unabhängige Referenz (ReferenceImpl): Ebene-Welle-delta_dor (dieselbe Codebasis) im Fernfeldgrenzfall; Partialableitungen durch finite Differenzen. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): gegen ANISE { "0.10" } konvergierte Lichtlaufzeiten durch DE440 ({ "75" } Laufzeiten am 2024-01-01 über drei DSN-Basislinien, erzeugt von xval/anise-lunar-od ohne Kshana-Code), liegt keine Laufzeit innerhalb der Toleranz von { "1" } ps. Die größte Abweichung beträgt { "24" } µs, vom analytischen Mondzentrum (etwa { "200" } km von DE

# text
seg-0beac99bb095 = Ehrlichkeit: MODELLED, NICHT gegen reale VLBI-Daten validiert. Die Polbewegung wird weggelassen (xp = yp = { "0" }), sodass die inertialen Stationspositionen einen Bezugssystemfehler von einigen Metern tragen; das Beacon mischt eine Mean-Equator-of-Date-Mondreihe mit einem ICRF-körperfesten Versatz (jd_tdb ~ jd_tt), eine Bezugssystem-Inkonsistenz unterhalb der Modellgüte; keine Lichtlaufzeit-Iteration, Medien oder Aberration über das differenzierte Shapiro hinaus. Kein TRL, keine Flugerfahrung oder Agentur- (Kommentar der Szenariodatei, Zeilen { "17" } bis { "21" })

# text
seg-58b64e5ff3db = Geodätisches Lunar-VLBI ist MODELLED, nicht validiert: geprüft gegen eine separate Implementierung in derselben Codebasis — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-04089c4d6fbe = <s1>Zurück</s1>lunar-vlbi-fim

# text
seg-6adcdfbaa8be = <s1>Weiter</s1>mars-pnt

# attr:alt
seg-07d97fc1abac = Das Diagramm, das die Engine für scenarios/lunar-vlbi.toml schreibt, Szenarioart lunar-vlbi

# text
# c1: lunar-vlbi
seg-6d1a32afd780 = <c1/> (Szenarioart)

# text
seg-9af586816181 = MODELLED { "3" } · VALIDATED { "3" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Szenarioart nennen.

# text
# c1: kshana kinds --json
seg-b41c162b015f = Der analytische Standardpfad ist MODELLED und trägt die Vorbehalte zu Bezugssystemkonsistenz, Polbewegung xp=yp={ "0" } und Ebene-Welle-gegen-Nahfeld. (Szenarioarten-Katalog (<c1/>))
