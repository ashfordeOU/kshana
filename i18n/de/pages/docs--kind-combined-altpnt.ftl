# docs--kind-combined-altpnt: translations (de)

# text
# c1: docs/kinds/by-kind/combined-altpnt.md
seg-a83b25413fd8 = Quelle: <c1/>

# text
# c1: combined-altpnt
seg-92b24377c9be = <c1/> (Szenariotyp)

# text
seg-216efc4e6fba = Szenariotyp der Engine v{ $version }, Familie <a1>GPS-gesperrtes alternatives PNT</a1>. Nur beratend: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Kennzeichnung hier stammt von der Engine oder von der Verifikationsmatrix; ein Typ ist MODELLED, sofern die Matrix nichts anderes angibt (wie eine Kennzeichnung erworben wird: Abschnitt „Evidence“ der README).

# text
seg-f496b7f4c63a = GPS-gesperrter kombinierter Schwere-, Magnet- und Gelände-Navigator: drei skalare Feldkanäle, je Wegpunkt fusioniert, für eine schärfere Driftkorrektur (niedrigere CRLB) als mit jedem einzelnen Feld.

# text
# c1: scenarios/combined-altpnt.toml
seg-670730bd221e = Ein Lauf von <c1/> ergibt zusammengefasst: combined-altpnt | freie Inertialdrift { "70659" } m | Schwere { "464" } m Magnetik { "782" } m Gelände { "368" } m | FUSED { "365" } m

# text
# c1: start_lat_deg
# c2: start_lon_deg
# c3: step_lat_deg
# c4: step_lon_deg
# c5: waypoints
# c6: drift_lat_deg
# c7: drift_lon_deg
# c8: search_half_deg
# c9: search_step_deg
# c10: nmax
# c11: gravity_sigma_mgal
# c12: igrf_year
# c13: magnetic_sigma_nt
# c14: dem_seed
# c15: terrain_sigma_m
seg-cf6981466329 = Pflichtfelder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: coeffs
# c2: mascons
# c3: magnetic_mascons
# c4: igrf_alt_km
# c5: refine_stages
# c6: refine_factor
# c7: noise_seed
# c8: magnetic_grid
seg-078f09d100fa = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/combined-altpnt.toml
seg-557db767b9c3 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-df8d5e07e737 = mGal

# attr:alt
seg-498b1aea3770 = Das Diagramm, das die Engine für scenarios/combined-altpnt.toml schreibt, Typ combined-altpnt

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-0df60ac6343f = <b>MODELLED</b> Schwerekarten-Abgleich, geländebezogen (TERCOM/SITAN), magnetische Anomalie. Unabhängige Referenz (InternalConsistency): IGRF-14-Koeffizienten; CRLB des Matched-Filters aus ersten Prinzipien. Das Feld des Schwere-Benchmarks mit realem Feld ist extern geprüft (Zeile „Gravity-anomaly synthesis from a spherical-harmonic model“), aber sein Navigationsergebnis hat keine externe Referenz

# text
seg-d776abd5691c = Alternatives / ergänzendes PNT ist MODELLED, nicht validiert: gegen seine eigene geschlossene bzw. analytische Identität geprüft – erkennt Übertragungs- und Koeffizientenfehler, ist aber keine externe Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-98133e74f88a = Familienseite: <a1>GPS-gesperrtes alternatives PNT</a1>

# text
seg-49efcd2ced81 = <s1>Zurück</s1>clock

# text
seg-f2ccea3bb03e = <s1>Weiter</s1>conflict-resilience
