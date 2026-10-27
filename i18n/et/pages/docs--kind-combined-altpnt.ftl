# docs--kind-combined-altpnt: translations (et)

# text
# c1: docs/kinds/by-kind/combined-altpnt.md
seg-a83b25413fd8 = Allikas: <c1/>

# text
# c1: combined-altpnt
seg-92b24377c9be = <c1/> (stsenaariumi liik)

# text
seg-216efc4e6fba = Mootori v{ $version } stsenaariumi liik, perekond <a1>GPS-ita alternatiivne PNT</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-f496b7f4c63a = GPS-ita kombineeritud gravitatsiooni + magnetvälja + maastiku navigaator: kolm skalaarset väljakanalit, mis on ühendatud teekonnapunkti kaupa, et saada teravam (madalama CRLB-ga) triivikorrektsioon kui ühegi üksiku väljaga.

# text
# c1: scenarios/combined-altpnt.toml
seg-670730bd221e = Ühe <c1/> jooksu kokkuvõte: combined-altpnt | vaba inertsiaalne triiv { "70659" } m | gravitatsioon { "464" } m magnetväli { "782" } m maastik { "368" } m | FUSED { "365" } m

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
seg-cf6981466329 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: coeffs
# c2: mascons
# c3: magnetic_mascons
# c4: igrf_alt_km
# c5: refine_stages
# c6: refine_factor
# c7: noise_seed
# c8: magnetic_grid
seg-078f09d100fa = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/combined-altpnt.toml
seg-557db767b9c3 = Näide <c1/> määrab muu hulgas:

# text
seg-df8d5e07e737 = mGal

# attr:alt
seg-498b1aea3770 = Diagramm, mille mootor kirjutab failile scenarios/combined-altpnt.toml, liik combined-altpnt

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
seg-0df60ac6343f = <b>MODELLED</b> Gravitatsioonikaardi sobitamine, maastikureferentsiga (TERCOM/SITAN), magnetanomaalia. Oraakel (sõltumatu etalon) (InternalConsistency): IGRF-14 koefitsiendid; esimestest printsiipidest sobitusfiltri CRLB. Päris välja gravitatsiooni bench-i väli on väliselt kontrollitud (rida „Gravity-anomaly synthesis from a spherical-harmonic model“), kuid selle navigatsioonitulemusel pole välist sõltumatut etaloni

# text
seg-d776abd5691c = Alternatiivne / täiendav PNT on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-98133e74f88a = Perekonna leht: <a1>GPS-ita alternatiivne PNT</a1>

# text
seg-49efcd2ced81 = <s1>Eelmine</s1>clock

# text
seg-f2ccea3bb03e = <s1>Järgmine</s1>conflict-resilience
