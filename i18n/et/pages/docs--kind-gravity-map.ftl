# docs--kind-gravity-map: translations (et)

# text
# c1: scenarios/
seg-0cd8dc81045c = { "4" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-216efc4e6fba = Mootori v{ $version } stsenaariumi liik, perekond <a1>GPS-ita alternatiivne PNT</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-df8d5e07e737 = mGal

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
seg-0df60ac6343f = <b>MODELLED</b> Gravitatsioonikaardi sobitamine, maastikureferentsiga (TERCOM/SITAN), magnetanomaalia. Sõltumatu etalon (InternalConsistency): IGRF-14 koefitsiendid; esimestest printsiipidest sobitusfiltri CRLB. Päris välja gravitatsiooni bench-i väli on väliselt kontrollitud (rida „Gravity-anomaly synthesis from a spherical-harmonic model“), kuid selle navigatsioonitulemusel pole välist sõltumatut etaloni

# text
seg-d776abd5691c = Alternatiivne / täiendav PNT on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-98133e74f88a = Perekonna leht: <a1>GPS-ita alternatiivne PNT</a1>

# text
# c1: docs/kinds/by-kind/gravity-map.md
seg-43227f4c8295 = Allikas: <c1/>

# text
# c1: gravity-map
seg-2a4cb69bc920 = <c1/> (stsenaariumi liik)

# text
seg-9a58a7b09423 = GPS-ita gravitatsioonikaardi sobitamise navigatsioon: külmaatomi gravimeeter taastab konstantse INS-i triivi gravitatsioonianomaalia jadast, mille läbi see lendab.

# text
# c1: scenarios/gravity-map-nav.toml
seg-c8caaff45826 = Ühe <c1/> jooksu kokkuvõte: gravity-map | vaba inertsiaalne triiv { "78302" } m | gravitatsiooniga sobitatud { "1882" } m | sobitamise sigma { "2.000e0" } mGal

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
seg-4d9bcce2dd39 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

# text
# c1: coeffs
# c2: mascons
# c3: refine_stages
# c4: refine_factor
# c5: noise_seed
# c6: reference
# c7: map_error_mc
seg-54272925e770 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/gravity-map-nav.toml
seg-5dfee3a0cc22 = Näide <c1/> määrab muu hulgas:

# attr:alt
seg-c42d90057e9f = Diagramm, mille mootor kirjutab failile scenarios/gravity-map-nav.toml, liik gravity-map

# text
seg-fe3ba7e11502 = <s1>Eelmine</s1>gnss-ssv

# text
seg-2b9bdd9def58 = <s1>Järgmine</s1>holdover-test
