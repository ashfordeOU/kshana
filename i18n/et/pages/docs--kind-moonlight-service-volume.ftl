# docs--kind-moonlight-service-volume: translations (et)

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
seg-8f8871ac8a0f = Teemaleht: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-a2889fb2b42a = Teemaleht: <a1>integrations.md</a1>

# text
# c1: docs/kinds/by-kind/moonlight-service-volume.md
seg-eb9f9a422d38 = Allikas: <c1/>

# text
# c1: moonlight-service-volume
seg-f8988314faf2 = <c1/> (stsenaariumi liik)

# text
seg-28c6a5644152 = Modelleeritud tsislunaarse navigatsiooniteenuse teeninduspiirkonna analüüs ILLUSTRATIVE, avalikest allikatest pärit Moonlight/LCNS-klassi Kuu orbiidi satelliidikonstellatsioonist (ESAga seotud ei ole): käib läbi selenograafilise laius- ja pikkuskraadi ruudustiku ajahorisondi jooksul ning annab DOP-i / katvuse / kättesaadavuse (≥{ "4" } satelliiti JA PDOP < lävi) ning üldistatud Kuu ARAIM-i kaitsetaseme (HPL/VPL) ümbriku üle piirkonna. DOP-i geomeetria KASUTAB UUESTI gnss_lib_py abil VALIDATED tuuma (crate::orbit::dop); kaitsetase KASUTAB UUESTI LunaNet LNIS-i Kuu ARAIM-i masinavärki (crate::lunar, σ_URE≈{ "30" } m) ja taandub erijuhuna olemasolevaks lõunapooluse kaitsetasemeks. MODELLED koostis: ringikujuline või elliptiline Kepleri releekomplekt (mitte tegelik diferentsiaalselt korrigeeritud LCNS/NRHO efemeriid), keskmise pöörlemisega Kuu (ilma libratsiooni ja pretsesseeruva poolusteta). Deterministlik (puhas geomeetria). TRL-i, kogemuspärandit ega agentuuri heakskiitu ei väideta.

# text
# c1: scenarios/moonlight-service-volume.toml
seg-8516d1ded5dd = Ühe <c1/> käivituse kokkuvõte: moonlight-service-volume | { "8" } satelliiti (illustratiivne LCNS-klass, seotud ei ole) | { "24" } punkti × { "12" } epohhi | katvus { "37.8" }% (PDOP<{ "6.0" }) | satelliite { "4" }–{ "7" } | PDOP 2.19/13.74/180.30 | HPL { "139" }–{ "4177" } m | PL kättesaadavus { "0.0" }% | MODELLED

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: lat_min_deg
# c7: lat_max_deg
# c8: lat_step_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: lon_step_deg
# c12: horizon_hours
# c13: step_min
# c14: elev_mask_deg
# c15: pdop_threshold
# c16: alert_limit_m
# c17: p_hmi
# c18: perturbed
# c19: sigma_ure_m
# c20: export_site_lat_deg
# c21: export_site_lon_deg
# c22: export_antenna
# c23: ephemeris_path
# c24: planetary_kernel_path
# c25: epoch_utc
# c26: terrain
seg-b59e8773bcb9 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>

# text
# c1: scenarios/moonlight-service-volume.toml
seg-0d935e7c43da = Näide <c1/> määrab muu hulgas:

# attr:alt
seg-edb738273a3a = Diagramm, mille mootor kirjutab failile scenarios/moonlight-service-volume.toml, liik moonlight-service-volume

# text
seg-1974d1d64c9c = <b>VALIDATED</b> Moonlight-klassi Kuu DOP / katvus / kättesaadavus ning üldistatud Kuu ARAIM-i kaitsetasemed teeninduspiirkonna üle. Sõltumatu etalon (sõltumatu etalon; ExternalDataset): sõltumatu kolmanda osapoole autoriteetne ANISE { "0.10.2" } astro::Orbit Kepleri propageerija (Nyx Space, MPL-2.0) — ekvinoktsiaalne kahe keha koodirada, mis erineb kshana Newtoni-Raphsoni Kepleri lahendajast; satelliidi MCI asukoht langeb kokku täpsusega <{ "1e-3" } m ning tuletatud nähtavate satelliitide arv ja hulk ühtivad täpselt igas ruudustiku punktis. DOP-i tuum on gnss_lib_py abil kontrollitud; terviklikkus kasutab avaldatud LunaNet/LCNS-i parameetreid

# text
seg-47f496c1d603 = <b>VALIDATED</b> Satelliidi topotsentrilised vaatenurgad (asimuut põhjast päripäeva, tõusunurk) ja kaldkaugus nimetatud selenograafilises asukohas, kui satelliit on asukoha. Sõltumatu etalon (sõltumatu etalon; ExternalDataset): ANISE { "0.10.2" } (Nyx Space, MPL-2.0, käivitatud tööriistana kataloogist xval/anise-service-geometry, binaarfail lunar-look-angles-xval, mis ei kutsu ühtegi Kshana koodi): ANISE-i enda asimuudi, tõusunurga ja kauguse rutiin (azimuth_elevation_range_sez) asukohtadele, mis on ehitatud selle laiuse-pikkuse-kõrguse konstruktoriga pck00011 Kuul (kera { "1737.4" } km), kusjuures satelliidid on pööratud süsteemi MOON_PA_DE440 faili moon_pa_de440_200625.bpc kaudu. { "768" } valimit o

# text
# c1: kshana kinds --json
seg-1f12671176ad = MODELLED koostis: ringikujuline või elliptiline Kepleri releekomplekt (mitte tegelik diferentsiaalselt korrigeeritud LCNS/NRHO efemeriid), keskmise pöörlemisega Kuu (ilma libratsiooni ja pretsesseeruva poolusteta). (liikide kataloog (<c1/>))

# text
seg-2ff91fe31123 = AUSTUS: MODELLED koostis. DOP-i geomeetria on valideeritud tuuma UUESTIKASUTUSE KAUDU; katvuse / kättesaadavuse / terviklikkuse koostis on MODELLED — ringikujuline või elliptiline Kepleri releekomplekt (mitte diferentsiaalselt korrigeeritud LCNS / { "9" }:{ "2" } NRHO efemeriid), keskmise pöörlemisega Kuu (ilma füüsilise libratsiooni ja pretsesseeruva poolusteta) ning avaldatud LunaNet LNIS-i terviklikkuse parameetrid. See demonstreerib Kuu teeninduspiirkonna M (stsenaariumifaili kommentaar, read { "27" }–{ "32" })

# text
seg-f3279128de3b = <s1>Eelmine</s1>mars-pnt

# text
seg-92cd937a3fb7 = <s1>Järgmine</s1>ntn-positioning

seg-e66e2ca31e54 = Teemaleht: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-25040e105bf7 = <b>MODELLED</b> Liik ja faas <c1/>: releede kättesaadavus ja PDOP, Maa ja Päikese nähtavus ning distsiplineeritud pinnakell iga koha ja aastaaja kohta, liigi <c2/> reljeefisiluetiga; ühe koha käivitus võrdub selle liigi

seg-6730fa1b9820 = <s1>Eelmine</s1>mission-thread
