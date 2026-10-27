# docs--kind-reentry: translations (de)

# text
# c1: docs/kinds/by-kind/reentry.md
seg-c95aec0d2943 = Quelle: <c1/>

# text
# c1: reentry
seg-91424dc65b3e = <c1/> (Szenariotyp)

# text
seg-039f77066d97 = Allen-Eggers-Korridor für den ballistischen Wiedereintritt: Spitzenverzögerung (unabhängig vom ballistischen Koeffizienten, V_e^{ "2" } sin|γ|/(2eH)), Geschwindigkeit und Höhe bei der Spitzenverzögerung (peak-g) sowie die Geschwindigkeit bei maximaler Erwärmung, für eine Eintrittsgeschwindigkeit, einen Bahnneigungswinkel und einen ballistischen Koeffizienten durch eine exponentielle Atmosphäre, dazu eine ebene Punktmassenintegration desselben ballistischen Eintritts mit Gravitation, Erdkrümmung und der US-Standardatmosphäre { "1976" } (Spitzenverzögerung, Geschwindigkeit, Höhe und Zeit an der Spitze). MODELLED ist der ballistische Eintritt (ohne Auftrieb); die Erwärmungsausgabe ist die Geschwindigkeit bei maximaler Erwärmung, kein Wärmestrom (kein aerothermisches Modell und kein TPS-Modell).

# text
# c1: scenarios/reentry.toml
seg-9908d06c50eb = Ein Lauf von <c1/> fasst sich so zusammen: reentry (Allen–Eggers): V_e { "7800" } m/s, γ { "6.0" }° -> Spitze { "16.6" } g bei { "49" } km, { "4731" } m/s; die Erwärmung erreicht ihren Höchstwert bei { "6603" } m/s; Punktmasse (Gravitation, Krümmung, US76) Spitze { "16.4" } g (MODELLED ballistisch, keine Aerothermik)

# text
# c1: entry_velocity_m_s
# c2: flight_path_angle_deg
# c3: ballistic_coeff_kg_m2
# c4: scale_height_m
# c5: rho0_kg_m3
# c6: entry_interface_altitude_m
seg-f057c2a160e7 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/reentry.toml
seg-576245fd5b70 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-0b7769c97ff3 = Ergebnisbezeichnung (die der Engine): MODELLED — ballistischer Allen–Eggers-Eintritt (ohne Auftrieb), exponentielle isotherme Atmosphäre, konstanter Bahnneigungswinkel; die Spitzenverzögerung ist unabhängig vom ballistischen Koeffizienten; die Erwärmung ist die GESCHWINDIGKEIT bei maximaler Erwärmung, KEIN Wärmestrom (kein aerothermisches Modell und kein TPS-Modell)

# attr:alt
seg-b0109481e8ff = Das Diagramm, das die Engine für scenarios/reentry.toml schreibt, Typ reentry

# text
seg-c860b8679b47 = <b>MODELLED</b> Spitzenverzögerung (unabhängig vom ballistischen Koeffizienten), Geschwindigkeit und Höhe bei der Spitzenverzögerung sowie Geschwindigkeit bei maximaler Erwärmung für einen ballistischen Eintritt durch eine exponentielle Atmosphäre. Tests: <a1>reentry_point_mass_accelerometer_oracle.rs</a1>.

# text
seg-84abc0b9f859 = <b>MODELLED</b> Spitzenverzögerung (unabhängig vom ballistischen Koeffizienten), Geschwindigkeit und Höhe bei der Spitzenverzögerung sowie Geschwindigkeit bei maximaler Erwärmung für einen ballistischen Eintritt durch eine exponentielle Atmosphäre. R. Referenz (InternalConsistency): Allen–Eggers-Eintritt in analytischer geschlossener Form, zusätzlich gegengeprüft mit einer numerischen Integration (DOP853) der Differentialgleichung desselben reinen Widerstandseintritts mit scipy { "1.18" } solve_ivp (tests/ballistic_re_entry_corridor_reference.rs, { "36" } Fälle, schlechtester a_max rel { "2.9e-9" }) — eine Prüfung eines numerischen Integrals gegen die eigene analytische Form, also weiterhin InternalConsistency, KEINE externe Validierung. MODELLED ballistisch (ohne Auftrieb), kein aerothermisches Modell und kein TPS-Modell — die Erwärmungsausgabe ist eine Ge

# text
# c1: label
seg-8b9d3db5d563 = MODELLED — ballistischer Allen–Eggers-Eintritt (ohne Auftrieb), exponentielle isotherme Atmosphäre, konstanter Bahnneigungswinkel; die Spitzenverzögerung ist unabhängig vom ballistischen Koeffizienten; die Erwärmung ist die GESCHWINDIGKEIT bei maximaler Erwärmung, KEIN Wärmestrom (kein aerothermisches Modell und kein TPS-Modell) (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-82de2275c919 = MODELLED ist der ballistische Eintritt (ohne Auftrieb); die Erwärmungsausgabe ist die GESCHWINDIGKEIT bei maximaler Erwärmung, kein Wärmestrom (kein aerothermisches Modell und kein TPS-Modell). (Typkatalog (<c1/>))

# text
seg-080b28422342 = EHRLICHER GÜLTIGKEITSBEREICH: MODELLED ballistisch (ohne Auftrieb), exponentielle isotherme Atmosphäre, konstanter Bahnneigungswinkel. Kein aerothermisches Modell und kein TPS-Modell -- die Erwärmungsausgabe ist die GESCHWINDIGKEIT bei maximaler Erwärmung, kein Wärmestrom. Keine 3-/6-DoF-Trajektorie. Ausführen: kshana scenarios/reentry.toml (Kommentar der Szenariodatei, Zeilen { "8" } bis { "11" })

# text
seg-cfc345f0dc0d = Der ballistische Wiedereintrittskorridor (Allen–Eggers) ist MODELLED, nicht validiert: geprüft gegen die eigene geschlossene bzw. analytische Identität — das findet Übertragungs- und Koeffizientenfehler, ist aber keine externe Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-a4b7c16e3fea = <s1>Zurück</s1>realtime-frame-eop

# text
seg-6166a1c21525 = <s1>Weiter</s1>slot-timing

# text
seg-99ef7c1d552c = Szenarioart der Engine v{ $version }, Familie <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-8f1e7d3f5a07 = Familienseite: <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>

# text
seg-3a3ee499961e = <b>MODELLED</b> Ebener Gravity-Turn-Aufstieg eines mehrstufigen Fahrzeugs über einer nicht rotierenden kugelförmigen Erde durch die US Standard Atmosphere { "1976" } (Dichte und Druck), mit einem Nickimpuls, durch den Düsengegendruck verringertem Schub, Stufenbrennschlüssen bei exakten s

# text
seg-8e62cc4af6ea = Themenseite: <a1>ENTRY-EO-ASCENT.md</a1>

# text
seg-05ce408c2dbb = kg/m^{ "2" }

# text
seg-195347c63a8a = m/s^{ "2" }
