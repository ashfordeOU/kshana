# docs--kind-lunar-frame-realisation: translations (et)

# text
seg-98151954f217 = false

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
seg-49f323360dc3 = <b>VALIDATED</b> 7-parameetriline Helmerti datumi sobitus + ICRF orientatsiooniside punktivõrgust. Oraakel (sõltumatu etalon) (ExternalDataset): Sõltumatu suletud kujul kaalutud Umeyama (Horn) sarnasusteisenduse lahendaja (numpy/scipy SVD-põhine; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — kshana iteratiivsest Gaussi–Newtoni sobitusest erinev algoritm, mis jõuab samale üheselt määratletud kaalutud vähimruutude optimumile baidiidentsetel punktivõrkudel

# text
# c1: docs/kinds/by-kind/lunar-frame-realisation.md
seg-0225ace73ba8 = Allikas: <c1/>

# text
# c1: lunar-frame-realisation
seg-a092c5795651 = <c1/> (stsenaariumi liik)

# text
seg-0c4c119abfca = Modelleeritud Kuu tugisüsteemi realiseerimine: 7-parameetriline Helmerti (sarnasus-) datumi sobitus — { "3" } translatsiooni, { "3" } väikese nurga pööret, { "1" } skaala — mis seob hinnatud selenograafilisest tuletatud MCMF punktikoordinaatide komplekti datumiga kaalutud vähimruutudega (crate::batch_ls::gauss_newton), pluss lihtne orientatsiooniside, mis väljendab realiseeritud väikest pööret ICRF telgede ümber suhtes IAU { "2015" } WGCCRE keha orientatsiooniga. Stsenaarium süstib teadaoleva väikese teisenduse (translatsioon ~kümned m, pööre ~µrad, skaala ~{ "1e-7" }) hästi hajutatud sünteetilisse punktivõrku, lisab algväärtusega (seed) Gaussi müra, taastab datumi ning esitab taastatud teisenduse, parameetripõhise taastamisvea süstitud tõe suhtes ja sobitusjärgse RMS jäägi. MODELLED enesekooskõla — taastab süstitud sarnasusteisenduse (müravabalt ~masinatäpsuseni), MITTE realiseerimist päris jälgimis-/VLBI andmete vastu; deterministlik (algväärtusega (seed)); ei ole TRL/pärandi/agentuuri heakskiitu.

# text
# c1: scenarios/lunar-frame-realisation.toml
seg-32d5e2749e64 = Ühe <c1/> käivituse kokkuvõte: lunar-frame-realisation | { "8" } punkti | translatsiooni viga { "3.125e-1" } m, pöörde viga { "3.418e-7" } rad, skaala viga -5.891e2 ppb | rms jääk { "0.887" } m | koondunud false

# text
# c1: n_points
# c2: tx_m
# c3: ty_m
# c4: tz_m
# c5: rot_x_urad
# c6: rot_y_urad
# c7: rot_z_urad
# c8: scale_ppb
# c9: noise_sigma_m
# c10: seed
# c11: epoch_year
# c12: epoch_month
# c13: epoch_day
seg-e732d2c2ab91 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

# text
# c1: scenarios/lunar-frame-realisation.toml
seg-29f85024974b = Näide <c1/> määrab muu hulgas:

# text
seg-49baab4910f3 = ppb

# text
seg-a7d59ba6e225 = rad

# attr:alt
seg-f3a6d69d0225 = Mootori joonistatud diagramm failile scenarios/lunar-frame-realisation.toml, liik lunar-frame-realisation

# text
# c1: kshana kinds --json
seg-f99a78efa965 = MODELLED enesekooskõla — taastab süstitud sarnasusteisenduse (müravabalt ~masinatäpsuseni), MITTE realiseerimist päris jälgimis-/VLBI andmete vastu; deterministlik (algväärtusega (seed)); ei ole TRL/pärandi/agentuuri heakskiitu. (liikide kataloog (<c1/>))

# text
seg-238cea087ae0 = Ausus: MODELLED enesekooskõla. Sõltumatu etalon on süstitud 7-parameetrilise sarnasusteisenduse taastamine (müravabalt ~masinatäpsuseni) pluss apply_helmert algebraline edasi-tagasi samasus. See EI OLE Kuu tugisüsteemi realiseerimine päris jälgimis- / VLBI andmete vastu ega väida mingit absoluutset tugisüsteemi täpsust. Deterministlik (algväärtusega (seed)). Ei väideta TRL-i, lennupärandit ega agentuuri heakskiitu. (stsenaariumifaili kommentaar, read { "23" } kuni { "27" })

# text
seg-07550d3d9610 = <s1>Eelmine</s1>lunar-frame-campaign

# text
seg-5a3a7120aae2 = <s1>Järgmine</s1>lunar-infrastructure
