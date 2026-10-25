# docs--kind-terrain-slam: translations (de)

# text
seg-216efc4e6fba = Szenariotyp der Engine v{ $version }, Familie <a1>GPS-gesperrtes alternatives PNT</a1>. Nur beratend: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Kennzeichnung hier stammt von der Engine oder von der Verifikationsmatrix; ein Typ ist MODELLED, sofern die Matrix nichts anderes angibt (wie eine Kennzeichnung erworben wird: Abschnitt „Evidence“ der README).

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-0df60ac6343f = <b>MODELLED</b> Schwerekarten-Abgleich, geländebezogen (TERCOM/SITAN), magnetische Anomalie. Unabhängige Referenz (InternalConsistency): IGRF-14-Koeffizienten; CRLB des Matched-Filters aus ersten Prinzipien. Das Feld des Schwere-Benchmarks mit realem Feld ist extern geprüft (Zeile „Gravity-anomaly synthesis from a spherical-harmonic model“), aber sein Navigationsergebnis hat keine externe Referenz

# text
seg-d776abd5691c = Alternatives / ergänzendes PNT ist MODELLED, nicht validiert: gegen seine eigene geschlossene bzw. analytische Identität geprüft – erkennt Übertragungs- und Koeffizientenfehler, ist aber keine externe Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-98133e74f88a = Familienseite: <a1>GPS-gesperrtes alternatives PNT</a1>

# text
# c1: docs/kinds/by-kind/terrain-slam.md
seg-bb7c9c4d4b5d = Quelle: <c1/>

# text
# c1: terrain-slam
seg-562e59d703e3 = <c1/> (Szenario-Kind)

# text
seg-6bdc150ab25b = GPS-verweigerte sequenzielle (rekursive) geländereferenzierte Navigation: Ein Partikelfilter führt das Messmodell des Geländeabgleichs Epoche für Epoche aus (SITAN als laufendes Filter), sodass eine zeitveränderliche INS-Drift entlang der Spur verfolgt wird, wo das Batch-terrain-nav nur einen einzelnen konstanten Versatz zurückgewinnt.

# text
# c1: scenarios/terrain-slam.toml
seg-1e4350c2c5f0 = Ein Lauf von <c1/> fasst sich zusammen als: terrain-slam | { "60" } Wegpunkte | freier Inertial-RMS { "2947" } m (final { "5082" } m) | geländeabgeglichener RMS { "1241" } m (final { "69" } m, 2x Reduktion) | mittleres ESS 2599/4000 | Abgleich-Sigma { "17.0" } m

# text
# c1: dem_seed
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_rate_lat_deg
# c8: drift_rate_lon_deg
# c9: altimeter_sigma_m
# c10: map_sigma_m
seg-939d877137f6 = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: n_particles
# c2: init_pos_sigma_deg
# c3: process_sigma_deg
# c4: resample_ess_frac
# c5: seed
seg-5ceb5b8597ac = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/terrain-slam.toml
seg-48e022b0945e = Das Beispiel <c1/> setzt unter anderem:

# attr:alt
seg-4aca87f022dc = Das Diagramm, das die Engine für scenarios/terrain-slam.toml schreibt, Kind terrain-slam

# text
seg-832919783819 = <s1>Zurück</s1>terrain-nav

# text
seg-1693abd546fe = <s1>Weiter</s1>time-transfer-budget
