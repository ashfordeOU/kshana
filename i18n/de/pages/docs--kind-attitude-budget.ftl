# docs--kind-attitude-budget: translations (de)

# text
seg-99ef7c1d552c = Szenarioart der Engine v{ $version }, Familie <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Familienseite: <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>

# text
seg-3068552e4ab4 = VALIDATED: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Art nennen.

# text
# c1: docs/kinds/by-kind/attitude-budget.md
seg-40ca4197150b = Quelle: <c1/>

# text
# c1: attitude-budget
seg-a271f371a3cf = <c1/> (Szenarioart)

# text
seg-62c0dda9fc56 = 3-DOF-Lage- und Zeigefehlerbudget: das Störmoment des Schwerkraftgradienten im ungünstigsten Fall ((3/2)(μ/R³)ΔI) und ein Wurzel-aus-Summe-der-Quadrate-Zeigefehlerbudget über benannte 1σ-Beiträge (Sensorrauschen, Reaktionsrad-Jitter, thermisch, Ausrichtung) mit dem dominanten Term, für eine Bahnhöhe und eine Streuung der Körperträgheit. MODELLED skalares AOCS-Budget — eine Ergänzung vor der Hardware zu Basilisk/42, keine Simulation von Regelkreis, 6 Freiheitsgraden oder flexiblen Moden.

# text
# c1: scenarios/attitude-budget.toml
seg-9fdc45a8aaa3 = Ein Lauf von <c1/> fasst sich so zusammen: attitude-budget: { "600" } km, ΔI { "40" } kg·m² -> GG torque { "7.04e-5" } N·m; pointing { "10.7" }" RSS (dominant: reaction_wheel_jitter) (MODELLED scalar budget)

# text
# c1: altitude_km
# c2: i_max_kg_m2
# c3: i_min_kg_m2
# c4: contributors
seg-7cf112b1bcc3 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/attitude-budget.toml
seg-91ebbc89f9bb = Das Beispiel <c1/> setzt unter anderem:

# text
seg-c33e3cbba749 = arcsec

# text
seg-36df1bc710ab = alignment

# text
seg-d45f0ee66587 = kg*m^{ "2" }

# text
seg-3e3ce4fa89aa = N*m

# text
seg-0a78a7d6f93f = Ergebnisbezeichnung (die der Engine): MODELLED — skalares 3-DOF-AOCS-Fehlerbudget: Störmoment des Schwerkraftgradienten im ungünstigsten Fall + RSS-Zeigebudget; KEINE Simulation von Regelkreis, 6 Freiheitsgraden oder flexiblen Moden (eine Ergänzung vor der Hardware zu Basilisk/42, kein Ersatz)

# attr:alt
seg-ad0e72e3b688 = Das Diagramm, das die Engine für scenarios/attitude-budget.toml schreibt, Art attitude-budget

# text
seg-95b159fb5e68 = <b>VALIDATED</b> Störmoment des Schwerkraftgradienten im ungünstigsten Fall ((3/2)(μ/R³)ΔI) als Spitze über der Lage (die validierte Behauptung), dazu ein RSS-Zeigefehlerbudget über benannte 1σ-Beiträge mit dem dominanten Term (eine quadratische Summe von Zahlen, die der Aufrufer liefert Tests: <a1>attitude_gg_torque_reference.rs</a1>.

# text
seg-f7c8d8994896 = <b>VALIDATED</b> Störmoment des Schwerkraftgradienten im ungünstigsten Fall ((3/2)(μ/R³)ΔI) als Spitze über der Lage (die validierte Behauptung), dazu ein RSS-Zeigefehlerbudget über benannte 1σ . Unabhängige Referenz (ExternalDataset): Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), eine unabhängige C++-Implementierung des Schwerkraftgradienten-Moments mit vollem Tensor: Die Spitze (3/2)(μ/R³)ΔI von Kshana entspricht dem Moment von Basilisk bei der Lage von { "45" } deg auf { "1e-12" } relativ (schlechtester Wert { "2.1e-15" }) über { "5" } Höhen und { "8" } Trägheitstensoren und begrenzt das Moment von Basilisk über { "2000" } zufällige Lagen je Fall; Toleranz vor dem Vergleich festgelegt. Validierte Behauptung: der Schwerkraft

# text
seg-d2a6cf813e95 = <b>PARTNER</b> Nicht bereitgestellt — Kshana ist ein Simulator für Navigationsleistung, kein Satellitenbus-Hersteller. Unabhängige Referenz (NoneKind): keine: eine Disziplin im Besitz des Partners, absichtlich ohne Modul und ohne Test

# text
# c1: label
seg-3895121a5466 = MODELLED — skalares 3-DOF-AOCS-Fehlerbudget: Störmoment des Schwerkraftgradienten im ungünstigsten Fall + RSS-Zeigebudget; KEINE Simulation von Regelkreis, 6 Freiheitsgraden oder flexiblen Moden (eine Ergänzung vor der Hardware zu Basilisk/42, kein Ersatz) (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-f62458cae23b = MODELLED skalares AOCS-Budget — eine Ergänzung vor der Hardware zu Basilisk/42, keine Simulation von Regelkreis, 6 Freiheitsgraden oder flexiblen Moden. (Artenkatalog (<c1/>))

# text
seg-333fca11ac0c = EHRLICHER GELTUNGSBEREICH: MODELLED skalares Fehlerbudget -- eine Ergänzung vor der Hardware zu Basilisk/42, KEINE Simulation von Regelkreis, 6 Freiheitsgraden oder flexiblen Moden. Der Schwerkraftgradiententerm wird als Moment gemeldet (ihn auf Zeigen abzubilden, braucht eine Regelsteifigkeit, die der Aufrufer besitzt); das Budget ist die quadratische Summe der gelieferten 1-Sigma-Beiträge. Lauf: kshana scenarios/attitude-budget.toml (Kommentar der Szenariodatei, Zeilen { "8" } bis { "13" })

# text
seg-0e27fcef1499 = <s1>Zurück</s1>ascent-losses

# text
seg-946c453cbf0f = <s1>Weiter</s1>body-pnt
