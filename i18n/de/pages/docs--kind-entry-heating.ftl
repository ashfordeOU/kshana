# docs--kind-entry-heating: translations (de)

# text
seg-d72b4c5393e0 = earth

# text
seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

# text
seg-99ef7c1d552c = Szenarioart der Engine v{ $version }, Familie <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-8f1e7d3f5a07 = Familienseite: <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Art nennen.

# text
seg-a44edb1eb84d = kg

# text
seg-8e62cc4af6ea = Themenseite: <a1>ENTRY-EO-ASCENT.md</a1>

# text
# c1: docs/kinds/by-kind/entry-heating.md
seg-13b9e9187ab9 = Quelle: <c1/>

# text
# c1: entry-heating
seg-3a3f732cc2dd = <c1/> (Szenarioart)

# text
seg-b843e2e0a4ee = Atmosphärischer Eintritt einer Punktmasse mit 3 Freiheitsgraden über einer rotierenden kugelförmigen Erde oder einem Mars (ballistisch oder auftriebserzeugend bei konstanter Querneigung), RK4, durch US76, eine exponentielle oder die Mars-Atmosphäre, mit konvektiver Staupunktaufheizung nach Sutton-Graves (NASA TR R-376): Spitzenverzögerung, Wärmestrom und dynamischer Druck, Wärmelast, Reichweite, eine Energieprüfung im rotierenden Bezugssystem und die geschlossene Form nach Allen-Eggers daneben. Die Spitzenverzögerung wird gegen das veröffentlichte Stardust-Nominal geprüft; die Aufheizung ist MODELLED.

# text
# c1: scenarios/entry-heating-stardust.toml
seg-05c8dac8d411 = Ein Lauf von <c1/> fasst sich so zusammen: entry-heating (earth): V_rel { "12551" } m/s, γ { "8.43" }° -> peak { "35.4" } g at { "54.2" } km, peak q { "746" } W/cm² at { "62.0" } km, heat load { "20970" } J/cm², peak q_dyn { "20.8" } kPa; terminal-altitude at { "317" } s (closed form { "60.2" } g; MODELLED 3-DoF, no radiative/TPS)

# text
# c1: body
# c2: atmosphere
# c3: rho0_kg_m3
# c4: scale_height_m
# c5: entry_interface_altitude_m
# c6: velocity_frame
# c7: entry_speed_m_s
# c8: flight_path_angle_deg
# c9: heading_deg
# c10: latitude_deg
# c11: longitude_deg
# c12: mass_kg
# c13: drag_coefficient
# c14: reference_area_m2
# c15: nose_radius_m
# c16: lift_to_drag
# c17: bank_angle_deg
# c18: rotating_planet
# c19: step_s
# c20: terminal_altitude_m
# c21: max_time_s
seg-96504cafb034 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

# text
# c1: scenarios/entry-heating-stardust.toml
seg-1b68d973fd30 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-05ce408c2dbb = kg/m^{ "2" }

# text
seg-1a89d87a48a5 = NACA Report { "1381" } ({ "1958" }) ballistische Konsta

# text
seg-3159fc595ac9 = kg/m^{ "3" }

# text
seg-2721e146b7be = Ergebnisbezeichnung (die der Engine): MODELLED — Eintritt einer Punktmasse mit 3 Freiheitsgraden über einem rotierenden kugelförmigen Planeten (Zentralgravitation, kein J2), mitrotierende windfreie Atmosphäre, konstanter C_D, konstantes L/D und konstante Querneigung, RK4; konvektive Staupunktaufheizung nach NASA TR R-376 ({ "1971" }), kalte Wand, KEINE Strahlungsaufheizung, KEINE TPS-/Ablationsantwort, NICHT 6 Freiheitsgrade

# attr:alt
seg-dbb618cd6357 = Das Diagramm, das die Engine für scenarios/entry-heating-stardust.toml schreibt, Art entry-heating

# text
seg-e73b339df97b = <b>VALIDATED</b> Ein Eintritt einer Punktmasse mit 3 Freiheitsgraden über einer rotierenden kugelförmigen Erde durch die US Standard Atmosphere { "1976" }, mit RK4 aus einem inertialen Eintrittszustand integriert, mit Meldung der Spitzenverzögerung und ihrer Höhe; der planetenrelative Eintrittszustand aus dem i Tests: <a1>entry_stardust_published.rs</a1>.

# text
seg-10124432b79b = <b>MODELLED</b> Konvektiver Staupunkt-Wärmestrom q = k sqrt(rho/R_n) V^{ "3" } mit den Sutton-Graves-Konstanten für Erdluft und die Mars-Atmosphäre (NASA TR R-376, { "1971" }), seine Spitze und die integrierte Wärmelast entlang eines Eintritts mit 3 Freiheitsgraden, ballistisch oder auftriebserzeugend bei k Tests: <a1>entry_stardust_published.rs</a1>.

# text
seg-54d133781215 = <b>VALIDATED</b> Ein Eintritt einer Punktmasse mit 3 Freiheitsgraden über einer rotierenden kugelförmigen Erde durch die US Standard Atmosphere { "1976" }, mit RK4 aus einem inertialen Eintrittszustand integriert, mit Meldung der. Unabhängige Referenz (ExternalDataset): Das Stardust-Nominal von Desai, Mitcheltree und Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): maximale Verzögerung { "33.4" } g aus { "12.6" } km/s planetenrelativ mit der Startmasse von { "45.8" } kg, eine 6-DoF-POST-Trajektorie mit der vollen aerodynamischen Datenbank; Eintrittsschnittstelle nach Desai, Lyons, Tooley und Kangas (NTRS { "20090004445" }): Radius { "6503.14" } km, inertial { "12.9" } km/s bei -8.2 deg. Zielwerte vorab registriert in xval/entry-stardust/PREREGISTRATION.

# text
seg-03878684f9a1 = <b>MODELLED</b> Konvektiver Staupunkt-Wärmestrom q = k sqrt(rho/R_n) V^{ "3" } mit den Sutton-Graves-Konstanten für Erdluft und die Mars-Atmosphäre (NASA TR R-376, { "1971" }), seine . Unabhängige Referenz (InternalConsistency): Interne Konsistenz: die Beziehung und die Konstanten, wie sie in NASA TR R-376 gedruckt sind, eine Halbschritt-Konvergenzprüfung und die erwartete Reihenfolge der Spitzen von Aufheizung und Verzögerung. WAS NICHT: Es wurde kein veröffentlichter Aufheizwert verglichen (die Stardust-Veröffentlichungen geben eine Auslegungsgrenze und eine Schätzung aus konvektiv plus Strahlung von etwa { "1200" } W/cm2 an, die eine rein konvektive Beziehung nicht treffen kann); keine Strahlungsaufheizung, Wandtemperatur oder

# text
# c1: label
seg-a0f300b2ce78 = MODELLED — Eintritt einer Punktmasse mit 3 Freiheitsgraden über einem rotierenden kugelförmigen Planeten (Zentralgravitation, kein J2), mitrotierende windfreie Atmosphäre, konstanter C_D, konstantes L/D und konstante Querneigung, RK4; konvektive Staupunktaufheizung nach NASA TR R-376 ({ "1971" }), kalte Wand, KEINE Strahlungsaufheizung, KEINE TPS-/Ablationsantwort, NICHT 6 Freiheitsgrade (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-47f81ab160cc = Die Spitzenverzögerung wird gegen das veröffentlichte Stardust-Nominal geprüft; die Aufheizung ist MODELLED. (Artenkatalog (<c1/>))

# text
seg-47cda83af127 = Eintrittsschnittstelle bei einem Radius von { "6503.14" } km, inertial { "12.9" } km/s bei -8.2 deg, { "45.8" } kg, { "0.811" } m Durchmesser, { "0.2202" } m Nasenradius (Desai et al., NASA NTRS { "20050042027" } und { "20090004445" }). Breite und Kurs sind ein angenommener ungefährer Eintritt über dem Pazifik; C_D ist der { "60" }-deg-Kugelkegel-Standard des Moduls. Veröffentlichte nominale Spitzenverzögerung mit 6 Freiheitsgraden: { "33.4" } g. Die Aufheizung ist nur konvektiv nach Sutton-Graves, MODELLED. (Kommentar der Szenariodatei, Zeilen { "4" } bis { "8" })

# text
seg-98af076be1ac = Konvektive Staupunktaufheizung beim Eintritt (Sutton-Graves) bei einem Eintritt mit 3 Freiheitsgraden ist MODELLED, nicht validiert: gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Transkriptions- und Koeffizientenfehler ab, ist aber keine unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-77c073cd5d67 = <s1>Zurück</s1>earth-gnss-lunar

# text
seg-20ce5d56783c = <s1>Weiter</s1>eo-coverage
