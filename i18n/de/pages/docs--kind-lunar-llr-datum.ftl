# docs--kind-lunar-llr-datum: translations (de)

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } mitgelieferte Szenarien verwenden diesen Typ; die übrigen stehen in <a1><c1/></a1>.

# text
seg-3068552e4ab4 = VALIDATED: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Art nennen.

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
seg-8f8871ac8a0f = Themenseite: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-fd34d760edb1 = <b>VALIDATED</b> Die Kovarianz des Helmert-Datums mit sieben Parametern, wobei ihre beiden simulierten Eingaben durch gemessene ersetzt sind: Der Zeitplan sind die Sendeepochen vom Boden von { "337" } archivierten Normalpunkten der ILRS-Laserentfernungsmessung zum Mond (2015-04-08 bis 2015-06-27, Grasse MeO { "7" } Tests: <a1>lunar_llr_real_data.rs</a1>.

# text
seg-49baab4910f3 = ppb

# text
seg-a7d59ba6e225 = rad

# text
# c1: docs/kinds/by-kind/lunar-llr-datum.md
seg-8db575fc6d82 = Quelle: <c1/>

# text
# c1: scenarios/lunar-llr-datum.toml
seg-f4359803d67a = Ein Lauf von <c1/> fasst sich so zusammen: lunar-llr-datum: { "337" } archived normal points ({ "349" } parsed) from { "2" } station(s) to { "5" } retroreflector arrays over { "80.9" } d; median measured normal-point precision { "5.13" } mm one-way; reflector information rank 15/15; Helmert rank 7/7 cond { "2.399e4" }; datum translation sigma { "1.851746e-2" } m; observed-minus-computed one-way residual RMS { "156493.9" } m (the modelled links, chiefly the analytic lunar ephemeris)

# text
# c1: data_dir
# c2: normal_points_dir
# c3: reflectors_path
# c4: stations_path
# c5: dut1_s
# c6: rel_tol
# c7: compare_simulated_campaign
# c8: sensitivity_tilt_deg
# c9: planetary_kernel_path
# c10: extra_reflectors
# c11: extra_beacons
# c12: extra_earth_elevation_mask_deg
# c13: beacon_campaign
seg-7eda56c1285a = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

# text
# c1: scenarios/lunar-llr-datum.toml
seg-c95b4d285cbd = Das Beispiel <c1/> setzt unter anderem:

# text
seg-37a77f49f048 = ps

# text
seg-b5c1e8681164 = Ergebnisbezeichnung (der Engine): Lunares Bezugssystemdatum aus einer ECHTEN Beobachtungskampagne. Der Zeitplan, die Beobachtungszahl und jedes Beobachtungsgewicht stammen aus archivierten Normalpunkten der ILRS-Laserentfernungsmessung zum Mond (gemessen); die Stationskoordinaten stammen aus IERS ITRF2020 und die Retroreflektorkoordinaten aus JPL DE430 Tabelle { "7" } (veröffentlich

# text
seg-764e54be97a0 = <b>VALIDATED</b> Die Kovarianz des Helmert-Datums lunar-llr-datum mit sieben Parametern aus archivierten ILRS-Normalpunkten und ihren gemessenen Gewichten auf dem Kernel-Pfad: Das geozentrische Mondzentrum wird von dem eigenen Kernel-Leser der Engine aus JPL DE440 gelesen (planetary_ker Tests: <a1>validate_llr_datum_kernel_moon.rs</a1>.

# text
seg-cae262db0e46 = <b>VALIDATED</b> Die Kovarianz des Helmert-Datums mit sieben Parametern, wobei ihre beiden simulierten Eingaben durch gemessene ersetzt sind: Der Zeitplan sind die Sendeepochen vom Boden von { "337" } Archiv. Orakel (ExternalDataset): Identitäten in geschlossener Form, ein unabhängiger Weg im selben Repository und seit { "0.36" } eine unabhängige Orakelbibliothek mit SPICE und NumPy auf frischen gemessenen Daten (unten); es gibt kein veröffentlichtes Paar einer Datumskovarianz der lunaren LLR, gegen das sich prüfen ließe, daher wird keine Genauigkeit beansprucht. Die einzige neue Ableitung — die Entfernungspartielle nach der körperfesten Position des Reflektors — wird durch zentrale finite Differenz der Zweiweg-Lichtlaufzeit neu hergeleitet, die sie differenziert

# text
# c1: label
seg-61ac3609406a = Lunares Bezugssystemdatum aus einer ECHTEN Beobachtungskampagne. Der Zeitplan, die Beobachtungszahl und jedes Beobachtungsgewicht stammen aus archivierten Normalpunkten der ILRS-Laserentfernungsmessung zum Mond (gemessen); die Stationskoordinaten stammen aus IERS ITRF2020 und die Retroreflektorkoordinaten aus JPL DE430 Tabelle { "7" } (veröffentlicht). Die Ephemeride des Mondzentrums, die Orientierung des Körpers nach IAU { "2015" } WGCCRE und das Fehlen von Troposphäre, Gezeiten, Stationsexzentri (Ergebnis <c1/>)

# text
seg-a19e2b1fcaf1 = Die Epochen sind die Sendezeiten vom Boden archivierter Normalpunkte der ILRS Consolidated Laser Ranging Data; * die Beobachtungen sind die tatsächlich auf die fünf Retroreflektor-Arrays auf dem Mond abgefeuerten Laserentfernungen; * jedes Beobachtungsgewicht ist die EIGENE archivierte Präzision dieses Normalpunkts, bin_rms/sqrt(n_raw), aus der Datei ausgelesen statt angenommen. (Kommentar in der Szenariodatei, Zeilen { "7" } bis { "12" })

# text
seg-5ed6b83c01da = WELCHE VERBINDUNGEN MEASURED UND WELCHE MODELLED SIND, IST DER BERICHT, KEINE FUSSNOTE. Die Ephemeride des Mondzentrums und die Orientierung des IAU-Körpers bleiben modelliert, und ihre gemeinsame Größe wird als Residuum der Einwegentfernung beobachtet minus berechnet über jeden verwendeten Punkt ausgegeben; Troposphäre, Festkörpergezeiten, Stationsexzentrizität, Polbewegung, UT1-UTC, relativistische Verzögerung und Stationsuhren fehlen und liegen in diesem Residuum. Weil (Kommentar in der Szenariodatei, Zeilen { "18" } bis { "26" })

# text
seg-7e7ff3ce4971 = Die Korrelation zwischen den Arrays wird bei genau null MEASURED statt angenommen, weil eine Laserentfernung ein Array berührt. Ein Datensatz, den die Kataloge nicht platzieren können — eine Station ohne veröffentlichte ITRF-Position — wird ÜBERSPRUNGEN UND GEZÄHLT, nie mit einer ersatzweisen Koordinate versehen. Die Zahlen der simulierten Kampagne werden AUSGEFÜHRT und neben den gemessenen ausgegeben. (Kommentar in der Szenariodatei, Zeilen { "28" } bis { "31" })

# text
seg-8bfe258bedf5 = MODELLED: Die Zahlen mit sieben Parametern sind eine Cramér-Rao-Schranke für einen reduzierten Parametersatz auf einem realen Zeitplan. Kein gelöstes Datum, keine LLR-Analyse, kein geodätisches Produkt. (Kommentar in der Szenariodatei, Zeilen { "33" } bis { "34" })

# text
seg-598a7d6ba1e7 = <s1>Zurück</s1>lunar-joint-od-clock

# text
seg-54b1c9200aae = <s1>Weiter</s1>lunar-station-coverage

# text
seg-25455a33523c = Helmert-Bezugssystemdatum des Mondes mit sieben Parametern, angetrieben von einer ECHTEN, ARCHIVIERTEN Beobachtungskampagne statt von einer simulierten. Wo lunar-frame-campaign die eingespeiste Transformation entfernte, aber sein Stationsnetz, seinen Zeitplan und sein Sigma je Beobachtung weiterhin als ILLUSTRATIVE Eingaben angab, entnimmt diese Szenarioart alle drei der Messung: Die Epochen sind die Sendezeiten vom Boden archivierter Normalpunkte der ILRS Consolidated Laser Ranging Data, die Beobachtungen sind die tatsächlich auf die fünf Retroreflektor-Arrays auf dem Mond abgefeuerten Laserentfernungen, und jedes Beobachtungsgewicht ist die eigene archivierte Präzision bin_rms/sqrt(n_raw) dieses Normalpunkts, aus der Datei ausgelesen. Die Stationskoordinaten stammen aus der SLR-Lösung IERS ITRF2020 (mit ihren veröffentlichten Geschwindigkeiten auf die Epoche fortgeschrieben) und die Reflektorkoordinaten aus JPL DE430 Tabelle { "7" } in dem Mean-Earth/Mean-Rotation-Bezugssystem, das das Modell IAU { "2015" } WGCCRE realisiert. Entfernungspartielle werden zur gemeinsamen Fisher-Informationsmatrix der Reflektorkoordinaten akkumuliert und über denselben Helmert-Entwurf in die Datumskovarianz fortgepflanzt, diagnostiziert durch crate::fim::crlb. Rang, Defekt, Kondition, Spektrum, nicht beobachtbare Richtungen in der Basis mit sieben Parametern, die schwächste Richtung bei vollem Rang und der Anteil jedes Parameters daran werden bei jedem Lauf ausgegeben, und ein nicht beschränkter Parameter wird als NULL mit einem Status veröffentlicht. Die Korrelation zwischen den Arrays wird bei genau null MEASURED statt angenommen, weil eine Laserentfernung ein Array berührt. Ein Datensatz, den die Kataloge nicht platzieren können — eine Station ohne veröffentlichte ITRF-Position — wird ÜBERSPRUNGEN UND GEZÄHLT, nie mit einer ersatzweisen Koordinate versehen. WELCHE VERBINDUNGEN MEASURED UND WELCHE MODELLED SIND, IST DER BERICHT, KEINE FUSSNOTE: Die Ephemeride des Mondzentrums und die Orientierung des IAU-Körpers bleiben modelliert, und ihre gemeinsame Größe wird als Residuum der Einwegentfernung beobachtet minus berechnet über jeden verwendeten Punkt ausgegeben; Troposphäre, Festkörpergezeiten, Stationsexzentrizität, Polbewegung, UT1-UTC, relativistische Verzögerung und Stationsuhren fehlen und stecken in diesem Residuum. Weil ein Ephemeridenfehler eine Kovarianz nur über die Richtung jeder Sichtlinie erreicht, löst jeder Lauf außerdem das gesamte Datum mit allen um sensitivity_tilt_deg gekippten Partiellen (mit wechselndem Vorzeichen) erneut und gibt das Verhältnis aus, sodass die Unempfindlichkeit der Kovarianz gegenüber der modellierten Ephemeride eine Zahl ist statt eines Arguments. Die Zahlen der simulierten Kampagne werden AUSGEFÜHRT und neben den gemessenen ausgegeben, nicht übertragen. MODELLED: Die Zahlen mit sieben Parametern sind eine Cramér-Rao-Schranke für einen reduzierten Parametersatz auf einem realen Zeitplan — kein gelöstes Datum, keine LLR-Analyse und kein geodätisches Produkt. Der eingecheckte Ausschnitt realer Daten wird mit dem Repository ausgeliefert, aber nicht mit dem veröffentlichten Crate; richten Sie data_dir auf eine Kopie davon.

# text
# c1: lunar-llr-datum
seg-5329c6c75887 = <c1/> (Szenarioart)

# text
# c1: kshana kinds --json
seg-64b1c08eeb11 = WELCHE VERBINDUNGEN MEASURED UND WELCHE MODELLED SIND, IST DER BERICHT, KEINE FUSSNOTE: Die Ephemeride des Mondzentrums und die Orientierung des IAU-Körpers bleiben modelliert, und ihre gemeinsame Größe wird als Residuum der Einwegentfernung beobachtet minus berechnet über jeden verwendeten Punkt ausgegeben; Troposphäre, Festkörpergezeiten, Stationsexzentrizität, Polbewegung, UT1-UTC, relativistische Verzögerung und Stationsuhren fehlen und stecken in diesem Residuum. (Szenarioarten-Katalog (<c1/>))

# text
# c1: kshana kinds --json
seg-97610a2cca73 = Die Korrelation zwischen den Arrays wird bei genau null MEASURED statt angenommen, weil eine Laserentfernung ein Array berührt. (Szenarioarten-Katalog (<c1/>))

# text
# c1: kshana kinds --json
seg-d38710f3ce4a = MODELLED: Die Zahlen mit sieben Parametern sind eine Cramér-Rao-Schranke für einen reduzierten Parametersatz auf einem realen Zeitplan — kein gelöstes Datum, keine LLR-Analyse und kein geodätisches Produkt. (Szenarioarten-Katalog (<c1/>))

# attr:alt
seg-e4da113cbe18 = Das Diagramm, das die Engine für scenarios/lunar-llr-datum.toml schreibt, Art lunar-llr-datum
