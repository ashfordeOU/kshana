# docs--kind-lunar-time-budget: translations (de)

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } mitgelieferte Szenarien verwenden diese Art; die anderen sind in <a1><c1/></a1>.

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
seg-8f8871ac8a0f = Themenseite: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-a2889fb2b42a = Themenseite: <a1>integrations.md</a1>

# text
# c1: docs/kinds/by-kind/lunar-time-budget.md
seg-11f512367036 = Quelle: <c1/>

# text
# c1: lunar-time-budget
seg-f7cd4fcfc62d = <c1/> (Szenario-Kind)

# text
seg-cac3a0bcbfc6 = MODELLED durchgängiges Zeitfehlerbudget der koordinierten Mondzeit (LTC): die sieben LTC-Fehlerterme, zusammengestellt als Zeitfehlerkurven x_i(τ) über ein ganzes Gitter von Mittelungszeiten, per Wurzelsumme zu x_Σ(τ) zusammengefasst, und der ÜBERGANG τ zwischen Uhr und Bezugssystem, bei dem der wachsende Uhrenterm den konstanten Echtzeit-Term der Bezugssystemrealisierung überholt (darunter ist das Budget vom Bezugssystem begrenzt, darüber von der Uhr) — die ehrliche Antwort auf das Artefakt eines einzelnen τ. Die τ-Steigungen sind in geschlossener Form und analytisch prüfbar (Uhr τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, Böden τ^{ "0" }, Messung τ^{ "{" }-1/2{ "}" }), und die Uhrenzeilen reproduzieren die veröffentlichten Eintages-Spezifikationen der Uhren (crate::clock_specs); die GRÖSSEN der Böden für HF-/optischen Link, Bezugssystemrealisierung, relativistisches Residuum und Ephemeride sind modellierte Budgetzuweisungen (dokumentierte Standardwerte, vom Aufrufer überschreibbar), keine Messungen. Der Beitrag ist das reproduzierbare Übergangs-τ, keine zertifizierte Zahl je Term; nicht zertifiziert für den operativen Zeithaltebetrieb.

# text
# c1: scenarios/lunar-time-budget.toml
seg-8a5c9e451d4e = Ein Lauf von <c1/> fasst sich so zusammen: lunar-time-budget | clock passive-h-maser | 7-term x_Σ(τ) over { "57" } τ-points ({ "1" }–{ "1e7" } s) | crossover τ { "8.689e4" } s (x { "1.001e-9" } s) | frame floor { "1.001e-9" } s | clock x({ "1" } d) { "0.995" } ns (MODELLED)

# text
# c1: clock
# c2: tau_min_s
# c3: tau_max_s
# c4: points_per_decade
# c5: clocks
# c6: time_lab
seg-7cdc521303eb = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/lunar-time-budget.toml
seg-c050033b32c3 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-eebd3e40d0b9 = Ergebnisbezeichnung (der Engine): MODELLED durchgängiges LTC-Zeitfehlerbudget. Die τ-Steigungen sind in geschlossener Form und analytisch prüfbar (Uhr τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, Böden τ^{ "0" }, Messung τ^{ "{" }-1/2{ "}" }), und die Uhrenzeilen reproduzieren die veröffentlichten Eintages-Spezifikationen der Uhren; die Böden für HF-/optischen Link, Bezugssystemrealisierung, relativistisches Residuum und Ephemeride

# attr:alt
seg-56fe184f2a12 = Das Diagramm, das die Engine für scenarios/lunar-time-budget.toml schreibt, Kind lunar-time-budget

# text
seg-b03509dfcb1b = <b>MODELLED</b> Ein Lauf von lunar-time-budget gibt je Uhrenklasse eine Übergangszeile zwischen Uhr und Bezugssystem gegen einen einzigen gemeinsamen Bezugssystemterm aus, sodass die Uhr die einzige Variable des Vergleichs ist; jede Zeile trägt den auf zwei Wegen erreichten Übergang -- per Bisektion aus der gen

# text
seg-fd52e493b6c2 = <b>MODELLED</b> Der optionale Block [time_lab] des Szenarios lunar-time-budget modelliert die Uhr einer lunaren Referenzstation (standardmäßig die Klasse miniRAFS, oder eine beliebige benannte Klasse, oder eine an angegebene Stabilitätspunkte angepasste Gerätekarte), gesteuert auf die koordinierte Mondzeit an Tests: <a1>lunar_station_time_lab.rs</a1>.

# text
seg-d8807d5308d4 = <b>MODELLED</b> Ein Lauf von lunar-time-budget gibt je Uhrenklasse eine Übergangszeile zwischen Uhr und Bezugssystem gegen einen einzigen gemeinsamen Bezugssystemterm aus, sodass die Uhr die einzige Variable des Vergleichs ist. Orakel (InternalConsistency): Zwei verschiedene Berechnungen derselben Größe in der Codebasis, nicht eine, die wiederholt wird: Die Bisektion auf der Potenzgesetzkurve nach IEEE-1139 weiß nichts über den Rauschtyp, während die geschlossene Form den dominanten Typ algebraisch invertiert, sodass ein falsch klassifizierter Rauschtyp oder eine schlechte Klammer als nicht winzige relative Differenz erscheint. Die vier Werte reproduzieren außerdem die veröffentlichte Tabelle der Veröffentlichung auf die Hälfte ihrer letzten gedruckten Stelle -- aber diese Tabelle war ihre

# text
seg-4c0d7da4f7f6 = <b>MODELLED</b> Das Szenario lunar-time-budget veröffentlicht seine arraywertigen Ausgaben als Tabelle in Langform (Gitterindex, Mittelungszeit, Term) neben dem Bericht, sodass die sieben je. Orakel (InternalConsistency): Nur Selbstkonsistenz: Die veröffentlichte Summe wird gegen die Wurzel der Quadratsumme der Terme in derselben Datei geprüft, und die ausgegebene Kurve reproduziert die freigegebene p3_time_budget_curve.csv über alle { "57" } Punkte. Beide Prüfungen teilen die eigenen Termdefinitionen dieser Engine, daher ist keine davon unabhängig. Der Uhrenterm beruht auf veröffentlichten Uhrenspezifikationen, aber die GRÖSSEN der Böden für Link, Bezugssystem, Relativistik und Ephemeride sind dokumentiert

# text
# c1: label
seg-8abdeb1a36e1 = MODELLED durchgängiges LTC-Zeitfehlerbudget. Die τ-Steigungen sind in geschlossener Form und analytisch prüfbar (Uhr τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, Böden τ^{ "0" }, Messung τ^{ "{" }-1/2{ "}" }), und die Uhrenzeilen reproduzieren die veröffentlichten Eintages-Spezifikationen der Uhren; die GRÖSSEN der Böden für HF-/optischen Link, Bezugssystemrealisierung, relativistisches Residuum und Ephemeride sind modellierte Budgetzuweisungen (dokumentierte Standardwerte, vom Aufrufer überschreibbar), keine Messungen. Der Beitrag (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-66a794432751 = MODELLED durchgängiges Zeitfehlerbudget der koordinierten Mondzeit (LTC): die sieben LTC-Fehlerterme, zusammengestellt als Zeitfehlerkurven x_i(τ) über ein ganzes Gitter von Mittelungszeiten, per Wurzelsumme zu x_Σ(τ) zusammengefasst, und der ÜBERGANG τ zwischen Uhr und Bezugssystem, bei dem der wachsende Uhrenterm den konstanten Echtzeit-Term der Bezugssystemrealisierung überholt (darunter ist das Budget vom Bezugssystem begrenzt, darüber von der Uhr) — die ehrliche Antwort auf das Artefak (Kind-Katalog (<c1/>))

# text
seg-ca1763d4a416 = Ehrlichkeit: MODELLED. Die Tau-Steigungen sind in geschlossener Form und analytisch prüfbar (Uhr tau^{ "{" }+1/2{ "}" } oder tau^{ "{" }+{ "1" }{ "}" }, Böden tau^{ "0" }, Messung tau^{ "{" }-1/2{ "}" }), und die Uhrenzeilen reproduzieren die veröffentlichten Eintages-Spezifikationen der Uhren; aber die GRÖSSEN der Böden für HF-/optischen Link, Bezugssystemrealisierung, relativistisches Residuum und Ephemeride sind modellierte Budgetzuweisungen (dokumentierte Standardwerte, vom Aufrufer überschreibbar), keine Messungen. Der Beitrag ist (Kommentar in der Szenariodatei, Zeilen { "13" } bis { "18" })

# text
seg-8f884949bdf1 = Die Tabelle des lunaren Zeitübergangs je Uhrenklasse ist MODELLED, nicht validiert: Sie wird gegen ihre eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-5eaed32490ca = Die Reproduzierbarkeit des lunaren Zeitfehlerbudgets ist MODELLED, nicht validiert: Sie wird gegen ihre eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-988e99fc26be = <s1>Zurück</s1>lunar-station-coverage

# text
seg-a0992d394960 = <s1>Weiter</s1>lunar-time-offset
