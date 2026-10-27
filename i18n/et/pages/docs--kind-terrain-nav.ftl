# docs--kind-terrain-nav: translations (et)

# text
seg-216efc4e6fba = Mootori v{ $version } stsenaariumi liik, perekond <a1>GPS-ita alternatiivne PNT</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
seg-0df60ac6343f = <b>MODELLED</b> Gravitatsioonikaardi sobitamine, maastikureferentsiga (TERCOM/SITAN), magnetanomaalia. Sõltumatu etalon (InternalConsistency): IGRF-14 koefitsiendid; esimestest printsiipidest sobitusfiltri CRLB. Päris välja gravitatsiooni bench-i väli on väliselt kontrollitud (rida „Gravity-anomaly synthesis from a spherical-harmonic model“), kuid selle navigatsioonitulemusel pole välist sõltumatut etaloni

# text
seg-d776abd5691c = Alternatiivne / täiendav PNT on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-98133e74f88a = Perekonna leht: <a1>GPS-ita alternatiivne PNT</a1>

# text
# c1: docs/kinds/by-kind/terrain-nav.md
seg-1d36a7dc3fd0 = Allikas: <c1/>

# text
# c1: terrain-nav
seg-7bfd6d049799 = <c1/> (stsenaariumi liik)

# text
seg-0d7bf5a4f07e = GPS-ita maastikupõhine navigatsioon (TERCOM/SITAN): radar-/baroaltimeeter sobitab maapinna kõrgusprofiili SRTM-stiilis DEM-iga, et taastada INS-i triiv.

# text
# c1: scenarios/terrain-nav.toml
seg-54690375328b = Ühe <c1/> käivituse kokkuvõte: terrain-nav | vabainertsiaalne triiv { "70659" } m | maastikuga sobitatud { "53" } m (1342x vähendus) | sobituse sigma { "17.0" } m

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
seg-db286a072e43 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: refine_stages
# c2: refine_factor
# c3: noise_seed
seg-efc57f43bd6f = Valikulised väljad: <c1/>, <c2/>, <c3/>

# text
# c1: scenarios/terrain-nav.toml
seg-96e3607379e0 = Näide <c1/> määrab muu hulgas:

# attr:alt
seg-c5e33c7122e2 = Diagramm, mille mootor kirjutab failile scenarios/terrain-nav.toml, liik terrain-nav

# text
seg-0fcad0016c78 = <s1>Eelmine</s1>telecom-timing

# text
seg-fa50992f818f = <s1>Järgmine</s1>terrain-slam
