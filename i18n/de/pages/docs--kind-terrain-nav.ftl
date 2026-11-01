# docs--kind-terrain-nav: translations (de)

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
# c1: docs/kinds/by-kind/terrain-nav.md
seg-1d36a7dc3fd0 = Quelle: <c1/>

# text
seg-0d7bf5a4f07e = GPS-verweigerte geländereferenzierte Navigation (TERCOM/SITAN): Ein Radar-/Baro-Höhenmesser gleicht das Bodenhöhenprofil mit einem DEM im SRTM-Stil ab, um die INS-Drift zurückzugewinnen.

# text
# c1: scenarios/terrain-nav.toml
seg-54690375328b = Ein Lauf von <c1/> fasst sich zusammen als: terrain-nav | freie Inertialdrift { "70659" } m | geländeabgeglichen { "53" } m (1342x Reduktion) | Abgleich-Sigma { "17.0" } m

# text
# c1: dem_seed
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_lat_deg
# c8: drift_lon_deg
# c9: altimeter_sigma_m
# c10: map_sigma_m
# c11: search_half_deg
# c12: search_step_deg
seg-db286a072e43 = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: refine_stages
# c2: refine_factor
# c3: noise_seed
seg-efc57f43bd6f = Optionale Felder: <c1/>, <c2/>, <c3/>

# text
# c1: scenarios/terrain-nav.toml
seg-96e3607379e0 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-0fcad0016c78 = <s1>Zurück</s1>telecom-timing

# text
seg-fa50992f818f = <s1>Weiter</s1>terrain-slam

# text
# c1: terrain-nav
seg-7bfd6d049799 = <c1/> (Szenarioart)

# attr:alt
seg-c5e33c7122e2 = Das Diagramm, das die Engine für scenarios/terrain-nav.toml schreibt, Art terrain-nav

seg-e66e2ca31e54 = Themenseite: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-d5da9ee3c152 = <b>MODELLED</b> Die Art und Phase <c1/>: ein inertiales Fehlermodell mit fünf Zuständen je Achse (Position, Geschwindigkeit, Beschleunigungsmesser-Bias, Neigung, Kreisel-Bias) über einen angetriebenen Abstieg, gestützt durch AFS-Lösungen (eigenständig oder differenziell, mit dem uhrgestützten Fall mit drei Relai
