# docs--lunar-infrastructure: translations (de)

# text
seg-cae10fb9bff8 = Szenario

# text
seg-61817375c8ea = Lunare Bahn und Oberfläche als Navigations- und geodätische Infrastruktur

# text
seg-9872e31ebd72 = Quellen

# text
# c1: docs/LUNAR-INFRASTRUCTURE.md
seg-922905241a6b = Quelle: <c1/>

# text
# c1: xval/lunar-infra/PREREGISTRATION.md
# c2: PREREGISTRATION-amendment-1.md
# c3: xval/lunar-infra/RESULTS.md
seg-7908583855a2 = Die Entwürfe, Eingaben und Zielwerte wurden in <c1/> festgelegt (eingecheckt, bevor eine Studie bewertet wurde), dazu zwei offengelegte Änderungen (<c2/>). Das Urteil zu jedem Zielwert steht in <c3/>.

# text
seg-d9d9d0864ae0 = Studie

# text
seg-3b01a756c305 = Was berechnet wird

# text
# c1: family = "elfo"
seg-a4ef7c81b35f = Bordseitige Erde-GNSS-Bahnbestimmung in einer NRHO (oder <c1/>) gegen eine unabhängige bodengestützte Entfernungs- und Entfernungsraten-Bahnbestimmung von drei DSN-Stationen; die formale Kovarianz jeder Schätzung; eine gesetzte Monte-Carlo-Simulation, ob die beiden Kovarianzen ihre Differenz erklären (q, Chi-Quadrat mit { "6" } Freiheitsgraden); eine eingespeiste nicht modellierte Beschleunigung

# text
# c1: lunar-infrastructure-carrier-phase.toml
# c2: xval/lunar-infra/scenarios/carrier-phase-scored.toml
seg-849c67471e69 = <c1/> (schnell), <c2/> (bewertet, etwa acht Minuten)

# text
seg-b9c6eb8d778c = Doppeldifferenzierte Trägerphase gemeinsam für Oberflächenstation und Orbiter; Kovarianz der Float-Mehrdeutigkeit; LAMBDA; Bootstrap- und Monte-Carlo-Erfolg; Positions-Sigma für Float und Fixed

# text
seg-74c347e0bc69 = Fisher-Information des 7-Parameter-Monddatums aus Erdstations-Entfernungsmessung, mit und ohne Entfernungen zwischen Orbiter und Oberflächenstation; gesetzte Zufallsstationsmengen

# text
seg-4ed875c39781 = GNSS, VLBI und Laserentfernungsmessung an einem Raumfahrzeug: Cramér-Rao-Genauigkeit der Offsets zwischen den Techniken gegenüber dem Fehler des lokalen Anschlusses

# text
seg-de25104c09a2 = Information zu h2, k2, l2 und der physikalischen Libration aus Laserentfernungsmessung, Orbiter-Tracking, einem Gravimeter und einer Oberflächenuhr (Konstanten gemeinsam mit den Mondzeit-Modulen)

# attr:alt
seg-18fc4ba766df = Konsistenz einer bordseitigen Erde-GNSS-Bahnbestimmung in einem nahezu geradlinigen Halo-Orbit mit einer unabhängigen bodengestützten Bahnbestimmung, aus echten Läufen der Engine v{ $version } auf scenarios/lunar-infrastructure-od-consistency.toml und der Variante mit Modellfehler ({ "400" } Versuche je Lauf). Die mittlere normierte Differenz q beträgt { "5.81" } ohne Modellfehler und { "5.95" } mit einem eingespeisten Beschleunigungsfehler von { "3e-10" } m/s2, bei erwarteten { "6" }: Die beiden Bahnlösungen sind konsistent (Zielwert C1 MET). Der Anteil der Versuche oberhalb des { "95" }-%-Punkts beträgt { "0.040" } und { "0.052" }; der Zielwert für das Erkennen des eingespeisten Fehlers lag bei mindestens { "0.5" }, daher ist er NOT MET (C3): Die bordseitige Lösung ist auf etwa { "352" } m bekannt gegenüber { "23" } m bei der bodengestützten, sodass sich eine Verschiebung von zehn Metern in ihrer Kovarianz verbirgt. MODELLED: ein eingeschränktes Dreikörpermodell mit angegebenen Vereinfachungen und illustrativen Eingaben, keine Messung einer Mondgröße. Beratend: Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.

# attr:alt
seg-4c08262e2556 = Festsetzen der ganzzahligen Trägerphasen-Mehrdeutigkeit zwischen Mondoberflächenstationen und einem Orbiter, aus dem eingecheckten Ergebnis des bewerteten Laufs der Engine v{ $version } (tests/fixtures/lunar_infra/phase_full_run.json: { "3" } Bogenlängen, je eine Monte-Carlo-Simulation mit { "400" } Ziehungen, geschrieben von scenarios/carrier-phase-scored.toml). { "1" } Tag: Erfolg { "1.0" } % (Standardfehler { "0.5" } %), { "134" } Mehrdeutigkeiten, Orbiter-Positions-Sigma { "45.6" } m Float und { "18.5" } m Fixed; { "2" } Tage: Erfolg { "0.5" } % (Standardfehler { "0.4" } %), { "259" } Mehrdeutigkeiten, Orbiter-Positions-Sigma { "21.5" } m Float und { "8.7" } m Fixed; { "3" } Tage: Erfolg { "2.8" } % (Standardfehler { "0.8" } %), { "375" } Mehrdeutigkeiten, Orbiter-Positions-Sigma { "6.3" } m Float und { "2.1" } m Fixed. Ein ganzzahliges Festsetzen wird nicht erreicht: Der Erfolg bleibt bei { "25" } dBi zwischen { "1" } % und { "3" } %, und bei den registrierten { "12" } dBi lässt sich das Problem nicht aufstellen. MODELLED: ein eingeschränktes Dreikörpermodell mit angegebenen Vereinfachungen und illustrativen Eingaben, keine Messung einer Mondgröße. Beratend: Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.

# attr:alt
seg-7e5b10641b20 = Genauigkeit des siebenparametrigen Monddatums (drei Translationen, ein Maßstab und drei Rotationen) aus Erdstations-Entfernungsmessung, mit und ohne Entfernungen zwischen Orbiter und Oberflächenstation, aus einem echten Lauf der Engine v{ $version } auf scenarios/lunar-infrastructure-frame-coestimation.toml. Das Cramér-Rao-Sigma der Translationen und Rotationen sinkt mit den Orbiter-Verbindungen (zum Beispiel t_z von { "0.98" } m auf { "0.046" } m); der kleinste Informations-Eigenwert steigt auf das 111-Fache, und die CRLB-Spur sinkt auf { "1.0" } % (Zielwert F3 MET). Dies setzt voraus, dass die Bahn in den Mondachsen bekannt ist, wobei ihr Fehler durch das Orbiter-Entfernungs-Sigma von { "1" } m getragen wird. MODELLED: ein eingeschränktes Dreikörpermodell mit angegebenen Vereinfachungen und illustrativen Eingaben, keine Messung einer Mondgröße. Beratend: Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.

# attr:alt
seg-377d29dcc6e8 = Genauigkeit der Offsets zwischen Laserentfernungsmessungs-, VLBI- und GNSS-Positionen eines Raumfahrzeugs gegenüber dem Fehler des bodengestützten lokalen Anschlusses, aus einem echten Lauf der Engine v{ $version } auf scenarios/lunar-infrastructure-space-tie.toml (ein Bogen von 6.56 Tagen, Technik-Sigmas GNSS { "10" } m, VLBI { "1" } m, Laser { "0.1" } m). Bei einem lokalen Anschluss von { "1" } mm bis { "1" } m bleibt das Sigma der Translation Laser minus GNSS nahe { "1.04" } m, bis der Anschluss { "1" } m erreicht: Es wird durch das Messrauschen der Techniken begrenzt, nicht durch den lokalen Anschluss. Die allein durch den Anschluss gesetzte Untergrenze ist die Quadratwurzel aus zwei mal sein Sigma. MODELLED: ein eingeschränktes Dreikörpermodell mit angegebenen Vereinfachungen und illustrativen Eingaben, keine Messung einer Mondgröße. Beratend: Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.

# attr:alt
seg-9d507a371319 = Welche Beobachtungsfamilie für die Love-Zahlen h2, k2 und l2 des Mondes empfindlich ist, aus einem echten Lauf der Engine v{ $version } auf scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Jede Zelle ist die partielle Ableitung (RMS) der Beobachtungen einer Familie nach einem Parameter, in den eigenen Einheiten dieser Familie (die Zellen werden also entlang einer Zeile verglichen, nicht entlang einer Spalte); ein Strich bedeutet, dass die Familie keine Empfindlichkeit hat. Laserentfernungsmessung: h2 { "7.6" }, k2 keine, l2 { "9.8" }. Orbiter-Tracking: h2 keine, k2 { "0.00086" }, l2 keine. Oberflächengravimeter: h2 { "2.9e+03" }, k2 { "4.3e+03" }, l2 keine. Oberflächenuhr: h2 { "2.8e-17" }, k2 { "2.8e-17" }, l2 keine. Mit allen vier Familien beträgt das Cramér-Rao-Sigma { "0.36" } % des nominalen h2, { "0.52" } % von k2 und { "1.16" } % von l2. Das Hinzufügen einer Familie senkte den kleinsten Eigenwert nie ({ "28" } von { "28" } Hinzufügungen), aber die Spur der Pseudoinversen war nur in { "16" } von { "28" } Fällen nicht größer: Diese Hälfte von Zielwert G3 ist NOT MET. Die Orbiter-Familie sieht das Sichtlinienintegral der k2-Beschleunigung, einen Wert am oberen Ende. MODELLED: ein eingeschränktes Dreikörpermodell mit angegebenen Vereinfachungen und illustrativen Eingaben, keine Messung einer Mondgröße. Beratend: Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.

# text
seg-570b9276834b = Angegebene Vereinfachungen

# text
# c1: geodesy-sensitivity
# c2: frame-coestimation
# c3: geodesy-sensitivity
seg-ab053aadb65d = Erde und Mond als Punktmassen auf einer Kreisbahn, keine Sonne, keine Gravitationsharmonischen des Mondes; die Rotationsachse der Erde ist die Bahnnormale; das Inertialsystem ist bei t = { "0" } gleich dem rotierenden System; ein kugelförmiger Mond; ein synchrones Mondsystem (keine Libration) außer in <c1/>; die Bahn wird in den Mondachsen in <c2/> als bekannt gehalten (ihr Fehler wird durch das Orbiter-Entfernungs-Sigma getragen); die Orbiter-Familie von <c3/> sieht das Sichtlinienintegral der k2-Beschleunigung, nachdem eine Konstante und ein linearer Trend entfernt wurden, einen Wert am oberen Ende.

# text
seg-fd644b1f33ec = Aufbau des Berichts

# text
# c1: kind
# c2: study
# c3: label
# c4: scenario_hash
# c5: units
# c6: units
# c7: docs/field-units-schema.json
seg-03efc65cbb0e = Jeder Bericht trägt <c1/>, <c2/>, <c3/>, <c4/>, die Felder der Studie und einen <c5/>-Block (eine Einheit und eine Herkunftsklasse für jedes numerische Feld). Es werden keine Zeitreihen ausgegeben. Feldlisten: der <c6/>-Block jedes Berichts und <c7/>.

# text
# c1: earthstns_fx
seg-bc9bb4f545e2 = k2 = { "0.024116" } +/- { "0.000108" } (Lemoine et al., Geophys. Res. Lett. { "41" }({ "10" }), 3382-3389, { "2014" }, doi 10.1002/2014GL060027), als Nominalwert verwendet. h2 und l2 sind Linearisierungspunkte, keine verifizierten Werte. Die DSN-Stationskoordinaten sind die ITRF93-Werte in den Kommentaren des NAIF-Kernels <c1/>; die DSN-Genauigkeitsbänder wurden nur aus Suchzusammenfassungen gelesen. Das Space-Tie-Konzept folgt den öffentlichen Beschreibungen von GRASP und ESA Genesis. Die vollständige Tabelle, mit der Angabe, wie jeder Wert gelesen wurde, steht in der Vorregistrierung.

# text
seg-6cd670ae6eea = Ergebnisse auf einen Blick (siehe RESULTS.md)

# text
seg-6334f82991d3 = Nicht erreicht und durch Tests festgeschrieben, die den Fehlschlag behaupten: C3 (die Kennzahl für den eingespeisten Fehler schlägt bei { "3e-10" } m/s2 nicht an), die Bootstrap-Raten-Hälfte von Q3 bei { "1e-9" } und die CRLB-Spur-Hälfte von G3. Das ganzzahlige Festsetzen der Mehrdeutigkeit wird bei den registrierten Eingaben nicht erreicht. Nichts ist VALIDATED.

# text
seg-1d3bffc2fd02 = <s1>Zurück</s1>Navigation für Raumnutzer (gnss-ssv)

# text
seg-90932eed0074 = <s1>Weiter</s1>LEO-Positionierung, -Navigation und -Zeitgebung

# text
# c1: lunar-infrastructure
# c2: study
seg-bfb9c5efbe57 = Szenarioart <c1/>, fünf durch <c2/> ausgewählte Studien. <b>MODELLED</b>: ein eingeschränktes Dreikörpermodell mit angegebenen Vereinfachungen und ILLUSTRATIVE Eingaben. Die Numerik wird gegen unabhängige numpy/scipy-Programme geprüft; nichts wird mit einer Messung einer Mondgröße verglichen, und nichts hier ist eine Aussage über eine Mission oder ein System. Nicht mit einer Behörde verbunden und von keiner unterstützt. Beratende Software, kein typzugelassenes Gerät. Kshana sendet nichts und steuert keine Hardware.
