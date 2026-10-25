# docs--kind-lunar-frame-campaign: translations (de)

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
seg-3319b18ac61f = und { "1" } weitere in der Matrix.

# text
# c1: docs/kinds/by-kind/lunar-frame-campaign.md
seg-dd57b833cb20 = Quelle: <c1/>

# text
# c1: lunar-frame-campaign
seg-120769aba2cc = <c1/> (Szenario-Kind)

# text
seg-55679aff66db = Helmert-Bezugssystemdatum (Ähnlichkeit) mit sieben Parametern, angetrieben von einer SIMULIERTEN BEOBACHTUNGSKAMPAGNE statt von einer eingespeisten Transformation. Ein Netz von Erdstationen beobachtet einen Katalog von Baken auf der Mondoberfläche nach einem expliziten Zeitplan; die Partiellen der lunaren VLBI-Verzögerung werden über diesen Zeitplan zu einer Fisher-Informationsmatrix der Bakenkoordinaten akkumuliert, genau wie es lunar-vlbi-fim tut; und diese Information wird über den Helmert-Entwurf A = [I3 | [p]_x | p] an den Katalogpunkten in die Datumskovarianz H = A^T M_b A fortgepflanzt, diagnostiziert durch crate::fim::crlb. KEINE Transformation wird eingespeist, und nichts wird aus einer untergeschobenen Antwort wiedergewonnen, sodass die ausgegebene Datumsgenauigkeit aus dem Beobachtungsprogramm folgt: Eine Halbierung des Verzögerungs-Sigmas halbiert sie exakt, und eine Verlängerung des Bogens verbessert sie, weil die Libration, die der Bericht MISST (sub_earth_direction_sweep_deg), das ist, was die Bakenkoordinate in Sichtlinienrichtung von denen in der Himmelsebene trennt. Rang, Datumsdefekt, Konditionszahl, das gesamte Spektrum, die nicht beobachtbaren Richtungen IN DER SIEBENPARAMETER-BASIS, die schwächste Richtung auch bei vollem Rang und der Anteil jedes Parameters daran werden bei jedem Lauf ausgegeben; ein Parameter, den die Kampagne nicht beschränkt, wird als NULL mit einem Status veröffentlicht, nie aus einer fast singulären Inversen abgelesen. Die Korrelation der Bakenfehler wird gemessen, nicht angenommen: Bei festgehaltenen Stationen berührt keine Beobachtung zwei Baken, sodass die Informationsmatrix exakt blockdiagonal ist (offblock_fraction { "0" }), und bei geschätzten Stationen ist der Schur-marginalisierte Block gekoppelt, wobei die induzierte Korrelation ausgegeben und die gesamte Fortpflanzung ohne sie erneut ausgeführt wird, sodass der Preis einer Unabhängigkeitsannahme eine Zahl ist. Dieselbe Fortpflanzung unter einem isotropen Sigma je Koordinate und der Wiedergewinnungsfehler, den das Szenario lunar-frame-realisation ausgibt, werden beide hier ausgeführt und mit ihren Verhältnissen neben dem Kampagnenwert ausgegeben. MODELLED: Der Bakenkatalog hat Quellen, aber die KAMPAGNE ist simuliert — das Stationsnetz und das Verzögerungs-Sigma sind illustrative Eingaben, einzelne Verzögerungsbeobachtungen werden als unabhängig behandelt, und die Ephemeride des Mondzentrums, die Stationsuhren, die Troposphäre und die Erdorientierungsparameter werden FEST gehalten, sodass die Datumskovarianz eine Cramér-Rao-Schranke für einen reduzierten Parametersatz ist. Kein geodätisches Produkt.

# text
# c1: scenarios/lunar-frame-campaign.toml
seg-2e02c1ff8f48 = Ein Lauf von <c1/> fasst sich so zusammen: lunar-frame-campaign | { "4" } beacons x { "3" } baselines x { "49" } epochs = { "64" } obs (delay sigma { "1.000e-11" } s) | station datum fixed | Helmert rank 7/7 cond { "3.798e5" } | datum translation sigma { "6.397500" } m vs injected-transform recovery error { "0.3125" } m (ratio { "0.049" })

# text
# c1: stations
# c2: beacons
# c3: epoch_year
# c4: epoch_month
# c5: epoch_day
# c6: arc_hours
# c7: step_min
# c8: delay_sigma_s
# c9: elevation_mask_deg
# c10: earth_elevation_mask_deg
# c11: station_datum
# c12: rel_tol
# c13: assumed_coordinate_sigma_m
# c14: solver
seg-9c5feacf15ce = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>

# text
# c1: scenarios/lunar-frame-campaign.toml
seg-1d70a5b4a197 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-df90e5910fb4 = hr

# text
seg-d9523213de9f = Ergebnisbezeichnung (der Engine): MODELLED kampagnengetriebenes lunares Bezugssystemdatum. Die Helmert-Kovarianz mit sieben Parametern wird aus einer Informationsmatrix der Bakenkoordinaten fortgepflanzt, die aus den eigenen Partiellen der lunaren VLBI-Verzögerung der Engine über einen expliziten Zeitplan aus Baken, Basislinien und Epochen akkumuliert wurde; KEINE Ähnlichkeitstransformation wird eingespeist und

# attr:alt
seg-883d94b321b4 = Das Diagramm, das die Engine für scenarios/lunar-frame-campaign.toml schreibt, Kind lunar-frame-campaign

# text
seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die dieses Kind nennen.

# text
seg-2595bd629ffb = <b>MODELLED</b> Das Helmert-Datum mit sieben Parametern, fortgepflanzt aus einer SIMULIERTEN BEOBACHTUNGSKAMPAGNE statt wiedergewonnen aus einer eingespeisten Transformation.

# text
seg-fd34d760edb1 = <b>VALIDATED</b> Die Kovarianz des Helmert-Datums mit sieben Parametern, wobei ihre beiden simulierten Eingaben durch gemessene ersetzt sind: Der Zeitplan sind die Sendeepochen vom Boden von { "337" } archivierten Normalpunkten der ILRS-Laserentfernungsmessung zum Mond (2015-04-08 bis 2015-06-27, Grasse MeO { "7" } Tests: <a1>lunar_llr_real_data.rs</a1>.

# text
seg-055864084843 = <b>MODELLED</b> Optionale Eingaben extra_reflectors und extra_beacons beim Szenario lunar-llr-datum fügen einen Block station_geodesy hinzu: die Helmert-Information mit fünf Arrays aus dem archivierten Ausschnitt der Laserentfernungsmessung zum Mond plus die Information, die ein hinzugefügter Retroreflektor (ran Tests: <a1>lunar_station_geodesy.rs</a1>.

# text
seg-23bd763c32d8 = <b>VALIDATED</b> Die Kovarianz des Helmert-Datums mit sieben Parametern des Szenarios lunar-frame-campaign mit geschätzten Erdstationen (Station { "1" } verankert), wie lunar_frame_campaign sie in binary64 berechnet: die gemeinsame Fisher-Information von Station und Bake akkum Tests: <a1>lunar_frame_campaign_mpmath_oracle.rs</a1>.

# text
seg-49f323360dc3 = <b>VALIDATED</b> 7-Parameter-Anpassung des Helmert-Datums + ICRF-Orientierungsanbindung aus einem Netz von Punkten. Orakel (ExternalDataset): Unabhängiger Löser für die Ähnlichkeitstransformation nach gewichtetem Umeyama (Horn) in geschlossener Form (numpy/scipy, SVD-basiert; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — ein anderer Algorithmus als die iterative Gauss-Newton-Anpassung von kshana, der auf bytegleichen Punktnetzen dasselbe eindeutig definierte Optimum nach gewichteten kleinsten Quadraten erreicht

# text
seg-d024abcfd87c = <b>MODELLED</b> Das Helmert-Datum mit sieben Parametern, fortgepflanzt aus einer SIMULIERTEN BEOBACHTUNGSKAMPAGNE statt wiedergewonnen aus einer eingespeisten Transformation. Erdstationen beobachten eine Quelle. Orakel (ReferenceImpl): Identitäten in geschlossener Form und ein unabhängiger Weg im selben Repository, ohne Anspruch auf eine externe unabhängige Referenz. Der Helmert-Entwurf — die einzige neue Ableitung im Modul — wird durch zentrale finite Differenz von lunar_frame_realise::apply_helmert neu hergeleitet, einen Pfad, der keinen Ausdruck mit der analytischen Form teilt. Die Akkumulation, die er zusammensetzt, ist die von lunar-vlbi-fim, deren Jacobi-Matrix dort gegen lunar_vlbi::vlbi_delay_s finit differenziert wird, und die

# text
# c1: label
seg-0abd7b181f21 = MODELLED kampagnengetriebenes lunares Bezugssystemdatum. Die Helmert-Kovarianz mit sieben Parametern wird aus einer Informationsmatrix der Bakenkoordinaten fortgepflanzt, die aus den eigenen Partiellen der lunaren VLBI-Verzögerung der Engine über einen expliziten Zeitplan aus Baken, Basislinien und Epochen akkumuliert wurde; KEINE Ähnlichkeitstransformation wird eingespeist, und nichts wird aus einer untergeschobenen Antwort wiedergewonnen. Der Bakenkatalog ist die Tabelle benannter Standorte des Crates mit Quellen, aber die KAMPA (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-f92d22c06cd5 = Die Korrelation der Bakenfehler wird gemessen, nicht angenommen: Bei festgehaltenen Stationen berührt keine Beobachtung zwei Baken, sodass die Informationsmatrix exakt blockdiagonal ist (offblock_fraction { "0" }), und bei geschätzten Stationen ist der Schur-marginalisierte Block gekoppelt, wobei die induzierte Korrelation ausgegeben und die gesamte Fortpflanzung ohne sie erneut ausgeführt wird, sodass der Preis einer Unabhängigkeitsannahme eine Zahl ist. (Kind-Katalog (<c1/>))

# text
# c1: kshana kinds --json
seg-534cea416496 = MODELLED: Der Bakenkatalog hat Quellen, aber die KAMPAGNE ist simuliert — das Stationsnetz und das Verzögerungs-Sigma sind illustrative Eingaben, einzelne Verzögerungsbeobachtungen werden als unabhängig behandelt, und die Ephemeride des Mondzentrums, die Stationsuhren, die Troposphäre und die Erdorientierungsparameter werden FEST gehalten, sodass die Datumskovarianz eine Cramér-Rao-Schranke für einen reduzierten Parametersatz ist. (Kind-Katalog (<c1/>))

# text
seg-ec67b9d3adbb = Die Korrelation der Bakenfehler wird GEMESSEN, nicht angenommen. Bei festgehaltenen Stationen berührt keine Beobachtung zwei Baken, sodass die Informationsmatrix exakt blockdiagonal ist (offblock_fraction { "0" }); bei geschätzten Stationen ist der Schur-marginalisierte Block gekoppelt, die induzierte Korrelation wird ausgegeben, und die gesamte Fortpflanzung wird ohne sie erneut ausgeführt, sodass der Preis einer Unabhängigkeitsannahme eine Zahl ist statt einer c (Kommentar in der Szenariodatei, Zeilen { "17" } bis { "21" })

# text
seg-a2bb557da7ba = MODELLED: Der Bakenkatalog hat Quellen, aber die KAMPAGNE ist simuliert — das Stationsnetz und das Verzögerungs-Sigma sind illustrative Eingaben, einzelne Verzögerungsbeobachtungen werden als unabhängig behandelt, und die Ephemeride des Mondzentrums, die Stationsuhren, die Troposphäre und die Erdorientierungsparameter werden FEST gehalten. Kein geodätisches Produkt. (Kommentar in der Szenariodatei, Zeilen { "27" } bis { "30" })

# text
seg-57a371bca2c7 = Das lunare Bezugssystemdatum aus einer Beobachtungskampagne ist MODELLED, nicht validiert: Es wird gegen eine getrennte Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-7b56c979b2c9 = <s1>Zurück</s1>lunar-differential-pnt

# text
seg-70072dbfa305 = <s1>Weiter</s1>lunar-frame-realisation
