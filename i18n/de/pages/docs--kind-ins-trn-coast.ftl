# docs--kind-ins-trn-coast: translations (de)

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } mitgelieferte Szenarien verwenden diesen Typ; die übrigen stehen in <a1><c1/></a1>.

# text
seg-bf51947657c0 = navigation

# text
seg-3068552e4ab4 = VALIDATED: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Art nennen.

# text
seg-c4ed27a559df = Themenseite: <a1>RESILIENCE-CROSSWALK.md</a1>

# text
seg-7b2721b7588d = Szenarioart der Engine v{ $version }, Familie <a1>Inertial-, Fusions- und Quantensensoren</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-f7f12029e0ec = Familienseite: <a1>Inertial-, Fusions- und Quantensensoren</a1>

# text
# c1: docs/kinds/by-kind/ins-trn-coast.md
seg-f7305f3a0b5a = Quelle: <c1/>

# text
# c1: ins-trn-coast
seg-92b90cb4a839 = <c1/> (Szenario-Kind)

# text
seg-5b9a6efe6337 = INS/TRN-Auslauffehlermodell: Positionsfehler gegen Auslaufdauer, aufgebaut aus IMU-Koeffizienten statt als angenommene Driftrate durchgefahren. Fünf Wachstumsbeiträge — Beschleunigungsmesser-Bias, Kreisel-Bias-Neigung über die Schwerkraft, Geschwindigkeits-Random-Walk, Winkel-Random-Walk und Skalenfaktor gegen die zurückgelegte Strecke — jeweils fortgeschrieben durch ein inertiales Fehlermodell mit neun Zuständen in lokaler Horizontebene mit Schuler-Rückkopplung bei einer angegebenen Breite und Höhe (die führenden Gesetze für kurzes Auslaufen t², t³, t^{ "1.5" }, t^{ "2.5" } und t¹/t² werden daneben ausgegeben) und kombiniert nach einer ANGEGEBENEN Regel (standardmäßig Wurzel aus der Quadratsumme, oder lineare Summe, oder deterministische Summe mit stochastischer Quadratsummenwurzel; alle drei werden bei jedem Lauf berechnet, sodass die Wahl sichtbar ist statt vergraben). Die Auslaufdauern, die vom Aufrufer vorgegebene Positionsschwellen erreichen (standardmäßig { "10" } m und { "50" } m), werden durch die vorhandene Bisektion der Engine gefunden, jeweils mit einer Aufschlüsselung je Beitrag, die die dominante Quelle nennt, und das Überschreiten jedes einzelnen Beitrags wird zusätzlich algebraisch invertiert, sodass beide übereinstimmen. Ein Modus der geländebezogenen Navigation begrenzt das Auslaufen mit periodischen Positionsfixes und gibt das größte Fixintervall aus, das jede Schwelle hält; ein reiner Positionsfix lässt Geschwindigkeitsfehler und Neigung über den Fix hinweg bestehen, sodass er das Auslaufen nicht bei jeder Fixrate begrenzt, und der Bericht sagt das, statt eine Null auszugeben. MODELLED: Die Koeffizienten der IMU-Klasse sind repräsentative Bandwerte, kein Datenblatt, und das Residuum des Geländefixes ist eine Eingabe. Eine nicht erreichte Schwelle wird als null mit einem Status ausgegeben, nie als Null. Kein zertifiziertes Leistungsprodukt für Trägheitsnavigation.

# text
# c1: scenarios/ins-trn-coast.toml
seg-bbd497aa3ba6 = Ein Lauf von <c1/> fasst sich so zusammen: ins-trn-coast | navigation IMU, { "250" } m/s, combination rss | { "10" } m at { "251.0" } s (accel_bias) | { "50" } m at { "608.8" } s (accel_bias) | TRN position-only peak { "44.7" } m over { "1200" } s

# text
# c1: imu_grade
# c2: accel_bias_ug
# c3: accel_vrw_m_s_per_sqrt_hr
# c4: accel_scale_factor_ppm
# c5: gyro_bias_deg_per_hr
# c6: gyro_arw_deg_per_sqrt_hr
# c7: speed_m_s
# c8: ref_accel_m_s2
# c9: latitude_deg
# c10: height_m
# c11: combination
# c12: crossing_thresholds_m
# c13: grades
# c14: drift_band_lo_m_per_s
# c15: drift_band_hi_m_per_s
# c16: trn_fix_mode
# c17: trn_fix_interval_s
# c18: trn_fix_residual_m
# c19: mission_duration_s
seg-e0555ca683b1 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

# text
# c1: scenarios/ins-trn-coast.toml
seg-95887c4551c7 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-4db5a594afc1 = rss

# text
seg-5868f641c089 = ug

# text
seg-1918189ac2bf = ppm

# text
seg-7eba4c5ee1e4 = Ergebnisbezeichnung (der Engine): MODELLED INS/TRN-Auslauffehlerbudget. Jeder Beitrag wird durch ein inertiales Fehlermodell mit neun Zuständen in lokaler Horizontebene mit Schuler-Rückkopplung fortgeschrieben (ebene Plattform mit Kurs Nord an einem angegebenen Standort, frei inertial einschließlich des instabilen Vertikalkanals); seine führenden Gesetze für kurzes Auslaufen (Bias t^{ "2" }, gy

# attr:alt
seg-134a4c91da3a = Das Diagramm, das die Engine für scenarios/ins-trn-coast.toml schreibt, Kind ins-trn-coast

# text
seg-7bb77ec86a0a = <b>VALIDATED</b> Budget Positionsfehler gegen Auslaufdauer, aufgebaut aus IMU-Koeffizienten, wobei jede Fehlerquelle (Beschleunigungsmesser-Bias, Kreisel-Bias, Geschwindigkeits-Random-Walk, Winkel-Random-Walk, Skalenfaktor im Reiseflug und unter anhaltender spezifischer Kraft) durch ein n

# text
seg-d69247df315f = <b>VALIDATED</b> Budget Positionsfehler gegen Auslaufdauer, aufgebaut aus IMU-Koeffizienten, wobei jede Fehlerquelle (Beschleunigungsmesser-Bias, Kreisel-Bias, Geschwindigkeits-Random-Walk, Winkel-Random-Walk, . Orakel (ExternalDataset): NaveGo v1.4 (Commit 24d9488, LGPL-3.0), als eigenes Programm unter GNU Octave { "8.4.0" } ausgeführt: frei inertiale Auslaufläufe mit demselben IMU-Fehlerprofil, mit einer korrigierten numerischen Totzone in seiner Quaternionen-Aktualisierung (qua_update.m: die Absicherung bei einer Rate unter { "1e-8" } rad/s ersetzt durch wnorm == { "0" }, angewandt auf eine Laufzeitkopie und einmal als übereinstimmend zugesichert; mit der Absicherung an Ort und Stelle fror eine langsam driftende Plattformlage ein und schnitt die

# text
# c1: label
seg-498cb2f96fa7 = MODELLED INS/TRN-Auslauffehlerbudget. Jeder Beitrag wird durch ein inertiales Fehlermodell mit neun Zuständen in lokaler Horizontebene mit Schuler-Rückkopplung fortgeschrieben (ebene Plattform mit Kurs Nord an einem angegebenen Standort, frei inertial einschließlich des instabilen Vertikalkanals); seine führenden Gesetze für kurzes Auslaufen (Bias t^{ "2" }, Kreisel-Bias-Neigung t^{ "3" }, Geschwindigkeits-Random-Walk t^{ "1.5" }, Winkel-Random-Walk t^{ "2.5" }, Skalenfaktor x zurückgelegte Strecke) werden gegengeprüft (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-63c221a546f7 = INS/TRN-Auslauffehlermodell: Positionsfehler gegen Auslaufdauer, aufgebaut aus IMU-Koeffizienten statt als angenommene Driftrate durchgefahren. (Kind-Katalog (<c1/>))

# text
# c1: kshana kinds --json
seg-164504645f4a = MODELLED: Die Koeffizienten der IMU-Klasse sind repräsentative Bandwerte, kein Datenblatt, und das Residuum des Geländefixes ist eine Eingabe. (Kind-Katalog (<c1/>))

# text
seg-ee0281a1f401 = Die Frage, die dies beantwortet: Wenn eine GNSS-Studie (oder eine mit Apertur-Tastverhältnis) sagt „Nehmen Sie eine Koppelnavigationsdrift von { "0.001" }–{ "0.050" } m/s an“, woher kommt diese Zahl? Sie kommt aus der IMU, und dieses Szenario berechnet sie, statt sie durchzufahren. Fünf Wachstumsterme — Beschleunigungsmesser-Bias (t^{ "2" }), Kreisel-Bias-Neigung über die Schwerkraft (t^{ "3" }), Geschwindigkeits-Random-Walk (t^{ "1.5" }), Winkel-Random-Walk (t^{ "2.5" }) und Skalenfaktor mal zurückgelegte Stre (Kommentar in der Szenariodatei, Zeilen { "4" } bis { "11" })

# text
seg-32d4adcfe249 = <s1>Zurück</s1>inertial

# text
seg-47366ab55be3 = <s1>Weiter</s1>integrity
