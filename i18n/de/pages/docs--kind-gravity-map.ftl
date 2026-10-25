# docs--kind-gravity-map: translations (de)

# text
# c1: scenarios/
seg-0cd8dc81045c = { "4" } mitgelieferte Szenarien verwenden diesen Typ; die übrigen stehen in <a1><c1/></a1>.

# text
seg-216efc4e6fba = Szenariotyp der Engine v{ $version }, Familie <a1>GPS-gesperrtes alternatives PNT</a1>. Nur beratend: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Kennzeichnung hier stammt von der Engine oder von der Verifikationsmatrix; ein Typ ist MODELLED, sofern die Matrix nichts anderes angibt (wie eine Kennzeichnung erworben wird: Abschnitt „Evidence“ der README).

# text
seg-df8d5e07e737 = mGal

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-0df60ac6343f = <b>MODELLED</b> Schwerekarten-Abgleich, geländebezogen (TERCOM/SITAN), magnetische Anomalie. Unabhängige Referenz (InternalConsistency): IGRF-14-Koeffizienten; CRLB des Matched-Filters aus ersten Prinzipien. Das Feld des Schwere-Benchmarks mit realem Feld ist extern geprüft (Zeile „Gravity-anomaly synthesis from a spherical-harmonic model“), aber sein Navigationsergebnis hat keine externe Referenz

# text
seg-d776abd5691c = Alternatives / ergänzendes PNT ist MODELLED, nicht validiert: gegen seine eigene geschlossene bzw. analytische Identität geprüft – erkennt Übertragungs- und Koeffizientenfehler, ist aber keine externe Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-98133e74f88a = Familienseite: <a1>GPS-gesperrtes alternatives PNT</a1>

# text
# c1: docs/kinds/by-kind/gravity-map.md
seg-43227f4c8295 = Quelle: <c1/>

# text
# c1: gravity-map
seg-2a4cb69bc920 = <c1/> (Szenario-Kind)

# text
seg-9a58a7b09423 = GPS-verweigerte Navigation mit Schwerefeld-Kartenabgleich: Ein Kaltatom-Gravimeter ermittelt aus der Folge von Schwereanomalien, die es durchfliegt, eine konstante INS-Drift.

# text
# c1: scenarios/gravity-map-nav.toml
seg-c8caaff45826 = Ein Lauf von <c1/> fasst sich so zusammen: gravity-map | free-inertial drift { "78302" } m | gravity-matched { "1882" } m | matching sigma { "2.000e0" } mGal

# text
# c1: nmax
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_lat_deg
# c8: drift_lon_deg
# c9: gravimeter_asd
# c10: averaging_time_s
# c11: map_sigma_mgal
# c12: search_half_deg
# c13: search_step_deg
seg-4d9bcce2dd39 = Pflichtfelder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

# text
# c1: coeffs
# c2: mascons
# c3: refine_stages
# c4: refine_factor
# c5: noise_seed
# c6: reference
# c7: map_error_mc
seg-54272925e770 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/gravity-map-nav.toml
seg-5dfee3a0cc22 = Das Beispiel <c1/> setzt unter anderem:

# attr:alt
seg-c42d90057e9f = Das Diagramm, das die Engine für scenarios/gravity-map-nav.toml schreibt, Kind gravity-map

# text
seg-fe3ba7e11502 = <s1>Zurück</s1>gnss-ssv

# text
seg-2b9bdd9def58 = <s1>Weiter</s1>holdover-test
