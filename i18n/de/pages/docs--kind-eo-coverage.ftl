# docs--kind-eo-coverage: translations (de)

# text
seg-99ef7c1d552c = Szenarioart der Engine v{ $version }, Familie <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Familienseite: <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>

# text
seg-3068552e4ab4 = VALIDATED: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Art nennen.

# text
seg-98151954f217 = false

# text
seg-8e62cc4af6ea = Themenseite: <a1>ENTRY-EO-ASCENT.md</a1>

# text
# c1: docs/kinds/by-kind/eo-coverage.md
seg-fc32bcd32dec = Quelle: <c1/>

# text
# c1: eo-coverage
seg-d72c017ca1fa = <c1/> (Szenarioart)

# text
seg-47b4aea6ed01 = Fußabdruck der Erdbeobachtungsnutzlast und Abdeckungsgeometrie (SMAD-Raumdreieck): Erdwinkelradius, Streifenbreite, Bodenauflösung im Nadir, maximaler Off-Nadir-Zugriff, Kreisbahnperiode, J2-Knotenperiode und Bodenspurabstand am Äquator mit einem Flag für lückenlose Abdeckung, für eine Bahnhöhe, Inklination (standardmäßig sonnensynchron) und Sensor-FOV/IFOV. MODELLED Geometrie der kugelförmigen Erde (keine Radiometrie/MTF/Atmosphäre/Jitter/Glint); Knotenabstand R_e·(ω − Ω̇)·T_nodal mit säkularen J2-Raten erster Ordnung.

# text
# c1: scenarios/eo-coverage.toml
seg-105bb8a3c33f = Ein Lauf von <c1/> fasst sich so zusammen: eo-coverage: { "700" } km, ±{ "7.5" }° FOV -> { "184" } km swath, { "9.8" } m nadir GSD, access to { "745" } km off-nadir; node spacing { "2752" } km (gapped) (MODELLED)

# text
# c1: altitude_km
# c2: half_fov_deg
# c3: ifov_microrad
# c4: max_off_nadir_deg
# c5: inclination_deg
seg-609c5b7bc6f1 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/eo-coverage.toml
seg-14f19837e422 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-834408a40783 = min

# text
seg-ade2ba71a96c = Ergebnisbezeichnung (die der Engine): MODELLED — Raumdreieck-Geometrie der kugelförmigen Erde; Streifen/GSD/Zugriff sind geometrisch (keine Radiometrie/MTF/Atmosphäre/Jitter/Glint), der Bodenspurabstand ist R_e·(ω − Ω̇)·T_nodal mit säkularen J2-Raten erster Ordnung

# attr:alt
seg-c2a8332f2ee2 = Das Diagramm, das die Engine für scenarios/eo-coverage.toml schreibt, Art eo-coverage

# text
seg-d86d43628cf3 = <b>VALIDATED</b> SMAD-Raumdreieck-Geometrie: Erdwinkelradius, Streifenbreite, GSD im Nadir, maximaler Off-Nadir-Zugriff und Kreisbahnperiode, dazu die J2-Knotenperiode erster Ordnung (eo_payload::j2_nodal_period) und der Bodenspurabstand am Äquator R_e (omega_ Tests: <a1>eo_payload_coverage_reference.rs</a1>.

# text
seg-9938f1de9eb8 = <b>VALIDATED</b> SMAD-Raumdreieck-Geometrie: Erdwinkelradius, Streifenbreite, GSD im Nadir, maximaler Off-Nadir-Zugriff und Kreisbahnperiode, dazu die J2-Knotenperiode erster Ordnung (. Unabhängige Referenz (ExternalDataset): Orekit { "12.2" } (Apache-2.0) und GeographicLib { "2.1" } (MIT), beide als getrennte Programme ausgeführt, vorab registriert (766823f3) vor der Änderung der Engine und jedem Lauf der Referenz: Kugelgrößen innerhalb von { "1e-9" } relativ (schlechtester Wert: Winkelradius { "5.4e-16" }, Streifen { "7.0e-13" }, Zugriff { "1.9e-14" }), Periode { "1e-12" } ({ "1.6e-16" }), GSD im Nadir { "1e-7" } ({ "2.9e-10" }), die J2-Knotenperiode und der Knotenabstand innerhalb von { "0.1" } % einer numerischen J2-Propagation von Orekit mit einem Knotendetektor ({ "1" }

# text
# c1: label
seg-45625167e59f = MODELLED — Raumdreieck-Geometrie der kugelförmigen Erde; Streifen/GSD/Zugriff sind geometrisch (keine Radiometrie/MTF/Atmosphäre/Jitter/Glint), der Bodenspurabstand ist R_e·(ω − Ω̇)·T_nodal mit säkularen J2-Raten erster Ordnung (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-cf22f13c78d3 = MODELLED Geometrie der kugelförmigen Erde (keine Radiometrie/MTF/Atmosphäre/Jitter/Glint); Knotenabstand R_e·(ω − Ω̇)·T_nodal mit säkularen J2-Raten erster Ordnung. (Artenkatalog (<c1/>))

# text
seg-153325fb00d3 = EHRLICHER GELTUNGSBEREICH: MODELLED nur Geometrie der kugelförmigen Erde -- kein Modell für Radiometrie / MTF / Atmosphäre / Zeige-Jitter / Sonnenglint. Der Bodenspurabstand ist R_e*(omega - dOmega/dt)*T_nodal mit säkularen J2-Raten erster Ordnung; die Inklination ist standardmäßig die sonnensynchrone für die Höhe. Lauf: kshana scenarios/eo-coverage.toml (Kommentar der Szenariodatei, Zeilen { "7" } bis { "11" })

# text
seg-5dc02c3d10f7 = <s1>Zurück</s1>entry-heating

# text
seg-33f408d48d13 = <s1>Weiter</s1>eo-radiometry
