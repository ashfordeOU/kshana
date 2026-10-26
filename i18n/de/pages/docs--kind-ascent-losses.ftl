# docs--kind-ascent-losses: translations (de)

# text
seg-99ef7c1d552c = Szenarioart der Engine v{ $version }, Familie <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (Artenkatalog (<c1/>))

# text
seg-8f1e7d3f5a07 = Familienseite: <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>

# text
# c1: docs/kinds/by-kind/ascent-losses.md
seg-5d7cf510f4e9 = Quelle: <c1/>

# text
# c1: ascent-losses
seg-23e7becab606 = <c1/> (Szenarioart)

# text
seg-34d041d6bd9f = Ebener Gravity-Turn-Aufstieg eines mehrstufigen Fahrzeugs über einer nicht rotierenden kugelförmigen Erde durch die US Standard Atmosphere { "1976" } (senkrechter Anstieg, Nickimpuls, Schub entlang der Geschwindigkeit), wobei die Gravitations-, Luftwiderstands-, Lenk- und Gegendruckverluste integriert werden und das ideale dv minus Verluste gegen die Brennschlussgeschwindigkeit geprüft wird; max-Q, Spitzenbeschleunigung und Brennschlusszustand. MODELLED.

# text
# c1: scenarios/ascent-losses.toml
seg-cd6181de5e43 = Ein Lauf von <c1/> fasst sich so zusammen: ascent-losses: ideal dv { "11290" } m/s, losses { "2359" } m/s (gravity { "2276" }, drag { "15" }, steering { "0" }, back-pressure { "67" }); burnout { "509" } km at { "8932" } m/s, gamma { "8.7" } deg; max-Q { "32.5" } kPa (MODELLED)

# text
# c1: stages
# c2: payload_kg
# c3: drag_coefficient
# c4: reference_area_m2
# c5: kick_altitude_m
# c6: kick_angle_deg
# c7: kick_duration_s
# c8: step_s
seg-58f9e8d24a73 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/ascent-losses.toml
seg-ec4396f2fa76 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-a44edb1eb84d = kg

# text
seg-37205a55d23c = m^{ "2" }

# text
seg-98151954f217 = false

# text
seg-68a37ebbc01e = Ergebnisbezeichnung (die der Engine): MODELLED — ebener Gravity-Turn-Aufstieg eines mehrstufigen Fahrzeugs über einer nicht rotierenden kugelförmigen Erde durch US76, mit integrierten Gravitations-, Luftwiderstands-, Lenk- und Gegendruckverlusten und geprüfter Identität „ideales dv minus Verluste“; konstanter C_D, keine Rotation, kein Gleitflug, keine Lenkung über den Nickimpuls hinaus

# attr:alt
seg-ccf2185b0b5e = Das Diagramm, das die Engine für scenarios/ascent-losses.toml schreibt, Art ascent-losses

# text
seg-3a3ee499961e = <b>MODELLED</b> Ebener Gravity-Turn-Aufstieg eines mehrstufigen Fahrzeugs über einer nicht rotierenden kugelförmigen Erde durch die US Standard Atmosphere { "1976" } (Dichte und Druck), mit einem Nickimpuls, durch den Düsengegendruck verringertem Schub, Stufenbrennschlüssen bei exakten s

# text
seg-cac91718c4e1 = <b>MODELLED</b> Ebener Gravity-Turn-Aufstieg eines mehrstufigen Fahrzeugs über einer nicht rotierenden kugelförmigen Erde durch die US Standard Atmosphere { "1976" } (Dichte und Druck), mit einem. Unabhängige Referenz (InternalConsistency): Interne Konsistenz: die exakte Identität Brennschlussgeschwindigkeit = Summe Isp g0 ln(m0/mf) minus die vier integrierten Verluste (Residuum unter { "1e-6" } m/s), die Tsiolkowski-Gleichung bei einem senkrechten Vakuumbrand, bei dem die Gravitation der einzige Verlust ist, und die US76-Drücke auf Meereshöhe und an der Tropopause. WAS NICHT: Die Verluste keines veröffentlichten Fahrzeugs wurden verglichen; keine Erdrotation, kein Gleitflug, keine Drosselung und keine Lenkung über den Impuls hinaus; konstanter C_D; keine Trajekt

# text
# c1: label
seg-906f001cd9ea = MODELLED — ebener Gravity-Turn-Aufstieg eines mehrstufigen Fahrzeugs über einer nicht rotierenden kugelförmigen Erde durch US76, mit integrierten Gravitations-, Luftwiderstands-, Lenk- und Gegendruckverlusten und geprüfter Identität „ideales dv minus Verluste“; konstanter C_D, keine Rotation, kein Gleitflug, keine Lenkung über den Nickimpuls hinaus (Ergebnis <c1/>)

# text
seg-4c237f051651 = Gravitations-, Luftwiderstands-, Lenk- und Gegendruckverluste beim Raketenaufstieg sind MODELLED, nicht validiert: gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Transkriptions- und Koeffizientenfehler ab, ist aber keine unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-8e62cc4af6ea = Themenseite: <a1>ENTRY-EO-ASCENT.md</a1>

# text
seg-73148557c9a6 = <s1>Zurück</s1>araim-reference-check

# text
seg-3af9699f27a7 = <s1>Weiter</s1>attitude-budget

# text
seg-f916c5a08595 = Gravity-Turn-Aufstiegsverluste eines ILLUSTRATIVEN zweistufigen Kerosin/Sauerstoff-Trägers (kein reales Fahrzeug): senkrechter Anstieg bis { "1" } km, ein Nickimpuls von { "3" } deg für { "10" } s, dann Schub entlang der Geschwindigkeit. Der Lauf integriert die Gravitations-, Luftwiderstands-, Lenk- und Gegendruckverluste und prüft, dass das ideale dv minus die Verluste der Brennschlussgeschwindigkeit entspricht. MODELLED: ebene, nicht rotierende Erde, konstanter C_D, kein Gleitflug, keine Lenkung über den Impuls hinaus. (Kommentar der Szenariodatei, Zeilen { "1" } bis { "5" })
