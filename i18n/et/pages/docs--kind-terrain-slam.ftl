# docs--kind-terrain-slam: translations (et)

# text
seg-216efc4e6fba = Mootori v{ $version } stsenaariumi liik, perekond <a1>GPS-ita alternatiivne PNT</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
seg-0df60ac6343f = <b>MODELLED</b> Gravitatsioonikaardi sobitamine, maastikureferentsiga (TERCOM/SITAN), magnetanomaalia. Oraakel (sõltumatu etalon) (InternalConsistency): IGRF-14 koefitsiendid; esimestest printsiipidest sobitusfiltri CRLB. Päris välja gravitatsiooni bench-i väli on väliselt kontrollitud (rida „Gravity-anomaly synthesis from a spherical-harmonic model“), kuid selle navigatsioonitulemusel pole välist sõltumatut etaloni

# text
seg-d776abd5691c = Alternatiivne / täiendav PNT on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-98133e74f88a = Perekonna leht: <a1>GPS-ita alternatiivne PNT</a1>

# text
# c1: docs/kinds/by-kind/terrain-slam.md
seg-bb7c9c4d4b5d = Allikas: <c1/>

# text
# c1: terrain-slam
seg-562e59d703e3 = <c1/> (stsenaariumi liik)

# text
seg-6bdc150ab25b = GPS-ita järjestikune (rekursiivne) maastikupõhine navigatsioon: osakestefilter käivitab maastikusobituse mõõtmismudeli epohhide kaupa (SITAN töötava filtrina), nii et ajas muutuvat INS-i triivi jälgitakse mööda trajektoori, kus partiipõhine terrain-nav taastab vaid ühe konstantse nihke.

# text
# c1: scenarios/terrain-slam.toml
seg-1e4350c2c5f0 = Ühe <c1/> käivituse kokkuvõte: terrain-slam | { "60" } teekonnapunkti | vabainertsiaalne RMS { "2947" } m (lõpp { "5082" } m) | maastikuga sobitatud RMS { "1241" } m (lõpp { "69" } m, 2x vähendus) | keskmine ESS 2599/4000 | sobituse sigma { "17.0" } m

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
seg-939d877137f6 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: n_particles
# c2: init_pos_sigma_deg
# c3: process_sigma_deg
# c4: resample_ess_frac
# c5: seed
seg-5ceb5b8597ac = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/terrain-slam.toml
seg-48e022b0945e = Näide <c1/> määrab muu hulgas:

# attr:alt
seg-4aca87f022dc = Diagramm, mille mootor kirjutab failile scenarios/terrain-slam.toml, liik terrain-slam

# text
seg-832919783819 = <s1>Eelmine</s1>terrain-nav

# text
seg-1693abd546fe = <s1>Järgmine</s1>time-transfer-budget
