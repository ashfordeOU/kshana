# docs--kind-launch-window: translations (de)

# text
seg-99ef7c1d552c = Szenarioart der Engine v{ $version }, Familie <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Familienseite: <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>

# text
seg-b054c73f22e5 = kein Wert

# text
seg-8e62cc4af6ea = Themenseite: <a1>ENTRY-EO-ASCENT.md</a1>

# text
# c1: docs/kinds/by-kind/launch-window.md
seg-1c385961d594 = Quelle: <c1/>

# text
# c1: launch-window
seg-e0990c5f14da = <c1/> (Szenario-Kind)

# text
seg-7a4e6215a488 = Zweikörper-Start- und Aufstiegsgeometrie: Startazimut(e) (sin Az = cos i / cos lat), minimal erreichbare Inklination, Kreisbahngeschwindigkeit, der ostwärtige Bonus der Erdrotation, Dogleg-Ebenenwechsel-Δv, wenn die Zielinklination unter der Breite des Startplatzes liegt, und die Zahl der täglichen Startgelegenheiten. MODELLED Geometrie der kugelförmigen Erde (keine Korrektur durch das Geschwindigkeitsdreieck der rotierenden Erde, kein Modell der Aufstiegs-/Widerstandsverluste).

# text
# c1: scenarios/launch-window.toml
seg-e24b0ae723c7 = Ein Lauf von <c1/> fasst sich so zusammen: launch-window: lat { "28.5" }° -> i { "51.6" }°: Az { "45.0" }° asc, v_circ { "7669" } m/s, +{ "409" } m/s Earth-rotation bonus, { "2" } opportunities/day (MODELLED)

# text
# c1: site_lat_deg
# c2: target_inclination_deg
# c3: altitude_km
# c4: site_lon_deg
# c5: epoch
# c6: eop_finals2000a
seg-6f955816b5c6 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/launch-window.toml
seg-aaadee0743ee = Das Beispiel <c1/> setzt unter anderem:

# text
seg-58d26f083b8f = Ergebnisbezeichnung (der Engine): MODELLED — Zweikörper-Startgeometrie der kugelförmigen Erde; der Azimut ist die geometrische Beziehung sin(Az)=cos(i)/cos(lat) (keine Korrektur durch das Geschwindigkeitsdreieck der rotierenden Erde, kein Modell der Aufstiegs-/Widerstandsverluste)

# attr:alt
seg-9696283a95ae = Das Diagramm, das die Engine für scenarios/launch-window.toml schreibt, Kind launch-window

# text
seg-38175030f689 = <b>MODELLED</b> Zweikörper-Startazimut(e) (sin Az = cos i / cos lat), minimal erreichbare Inklination, Kreisbahngeschwindigkeit, ostwärtiger Bonus der Erdrotation, Dogleg-Ebenenwechsel-Δv und tägliche Gelegenheiten und, bei gegebener Epoche und IERS-finals2000A-Zeilen, der Standort

# text
seg-53bc589c7ed6 = <b>MODELLED</b> Zweikörper-Startazimut(e) (sin Az = cos i / cos lat), minimal erreichbare Inklination, Kreisbahngeschwindigkeit, ostwärtiger Bonus der Erdrotation, Dogleg-Ebenenwechsel-Δv a. Orakel (InternalConsistency): Sphärisch-trigonometrische Startgeometrie in geschlossener Form gegen veröffentlichte Rechenbeispiel-Anker (Vallado, Fundamentals of Astrodynamics 4th ed., Algorithm { "37" } Startazimut + Kap. 6 Ebenenwechsel; tests/launch_window_ascent_geometry_reference.rs). Diese verwenden dieselbe geschlossene Form, die kshana implementiert (eine Paritäts-/Übertragungsprüfung gegen einen veröffentlichten Wert, InternalConsistency); MODELLED Zweikörper, keine Geschwindigkeitsdreieck-/Aufstiegs-/Widerstandskorrektur der rotierenden Erde

# text
# c1: label
seg-12396619d3e5 = MODELLED — Zweikörper-Startgeometrie der kugelförmigen Erde; der Azimut ist die geometrische Beziehung sin(Az)=cos(i)/cos(lat) (keine Korrektur durch das Geschwindigkeitsdreieck der rotierenden Erde, kein Modell der Aufstiegs-/Widerstandsverluste) (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-715f1856bd37 = MODELLED Geometrie der kugelförmigen Erde (keine Korrektur durch das Geschwindigkeitsdreieck der rotierenden Erde, kein Modell der Aufstiegs-/Widerstandsverluste). (Kind-Katalog (<c1/>))

# text
seg-4e9a215e3918 = EHRLICHER GELTUNGSBEREICH: MODELLED. Nur geometrischer Azimut -- keine Korrektur durch das Geschwindigkeitsdreieck der rotierenden Erde (der Bonus wird getrennt ausgegeben, um ihn einzurechnen), keine Aufstiegstrajektorie / kein Widerstandsverlust- / Lenkmodell. Pre-Phase-A-Geometrie. Ausführen: kshana scenarios/launch-window.toml (Kommentar in der Szenariodatei, Zeilen { "8" } bis { "11" })

# text
seg-12332d181de4 = Die Startfenster- und Aufstiegsgeometrie (Missionsanalyse) ist MODELLED, nicht validiert: Sie wird gegen ihre eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-1a3841380d88 = <s1>Zurück</s1>jamming

# text
seg-78411b85f301 = <s1>Weiter</s1>leo-navmsg
