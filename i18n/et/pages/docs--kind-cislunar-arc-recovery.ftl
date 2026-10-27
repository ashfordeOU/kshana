# docs--kind-cislunar-arc-recovery: translations (et)

# text
seg-debc2f07db78 = true

# text
seg-330cbcd04718 = murd (dimensioonitu)

# text
# c1: docs/kinds/by-kind/cislunar-arc-recovery.md
seg-8f21a5462b09 = Allikas: <c1/>

# text
# c1: cislunar-arc-recovery
seg-e4858b0a33c9 = <c1/> (stsenaariumi liik)

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
# c1: independence
seg-f994c81583bf = MODELLED sõltumatu hindaja test tsislunaarse kaare pikkuse jälgitavuse läve jaoks. See lävi on jälgitavusmaatriksi RANGI lugemine, mis on kokku pandud ANALÜÜTILISTEST vahemaa Jacobi ridadest ja ANALÜÜTILISEST variatsioonilisest olekuüleminekumaatriksist, ning selle ruutjuur-infofiltri ristkontroll voldib kokku needsamad read — kooskõlakontroll kahe numbrilise masina vahel, mitte kinnitus. See liik annab puuduva vahekohtuniku: pakettlahendi vähimruutude hindaja, mis tegelikult TAASTAB juhtsatelliidi algoleku simuleeritud mõõtmistest, kusjuures mõõtmise osatuletised võetakse liidetud otsemudeli KESKMISTE LÕPLIKE VAHEDENA. See ei kutsu ühtegi analüütilist Jacobi rida, ühtegi variatsioonilist olekuüleminekumaatriksit, ühtegi singulaarväärtuse ega omaväärtuse lahutust, ühtegi astaku tolerantsi ega ruutjuur-infofiltrit — allikatekstikaitse failis tests/cislunar_arc_recovery_reference.rs muudab selle jõustatavaks — samal ajal kui dünaamika (sama RK4 CR3BP voog), algtingimused (sama diferentsiaalselt korrigeeritud konstellatsioon), skalaarne vaadeldav suurus ja epohhiruudustik on tahtlikult jagatud ning nimetatud väljastatud <c1/> plokis, sest ühe füüsikalise probleemi kaks analüüsi peavad olema füüsikas kooskõlas, et olla võrreldavad. Kaks kriteeriumi, kumbki pühitud üle viie dekaadi oma piirist: MÜRATA TAASTAMINE (iga algväärtusega (seed) katse lõplik olekuviga on kuni recovery_factor korda selle a priori nihe — astaku analoog, ilma singulaarväärtuse tolerantsita) ja MONTE CARLO HINNATAVUS (mõõdetud RMS positsioonivea üle algväärtusega (seed) müraansambli alla väljaöeldud piiri — hinnatavuse analoog, mõõdetud, mitte ennustatud). Toetab tasapinnalist nelja oleku ja ruumilist kuue oleku, DRO / L2 halo / L2 NRHO perekondi, vahemaa ja vahemaakiiruse vaadeldavaid suurusi ning Kuu-keskset polaarparametrisatsiooni, kus teisendus rakendatakse OLEKULE ja otsemudel diferentseeritakse seal uuesti. MEASURED avaldatud tasapinnalisel DRO ruudustikul: hindaja taastab neljaoleku alates { "0.782609" } h, astakukriteeriumi { "2.086957" } h vastu tolerantsi rel_tol { "1e-6" } juures (suhe { "0.375" }) — astakulävi EI ole kinnitust leidnud taastatavuse piirina — samal ajal kui mõõdetud hinnatavuse piir langeb samasse ruudustiku lahtrisse nagu formaalne, { "5.739130" } h, ning mõõdetud veakõver reprodutseerib formaalse 1-sigma üle { "21" } kaare pikkuse geomeetrilise keskmise suhtega { "0.98" }. MODELLED: konstellatsiooni kujundus, epohhiruudustik, ainus jälgitav link, nihke suurus, mõõtmise sigma ja kaks väljaöeldud piiri. Mitte sertifitseeritud navigatsioonitulemuslikkuse toode.

# text
# c1: scenarios/cislunar-arc-recovery.toml
seg-ada71f37b21b = Ühe <c1/> jooksu kokkuvõte: cislunar-arc-recovery | dro perekond, 4 olekut, { "4" } s/c, vahemaa vaadeldav, kartesiaanlik parametrisatsioon | { "6.0" } h kaar, { "24" } epohhi (ruudustik { "0.260870" } h), { "32" } katset, algväärtus (seed) { "20260920" } | lõplike vahede osatuletised, ei analüütilist Jacobi / STM / SVD / SRIF | mürata taastamine alates { "0.782609" } h (tegur { "1e-2" }) vs Gramiani astakulävi { "2.086957" } h | Monte Carlo hinnatavus alates { "5.739130" } h (RMS pos ≤ { "1.000" } km, σ { "1.000" } m) vs Gramiani hinnatavus { "5.739130" } h | kaare lõpu RMS pos { "0.6026" } km

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: spatial
# c6: family
# c7: n_spacecraft
# c8: observable
# c9: coordinates
# c10: trials
# c11: seed
# c12: displacement_nd
# c13: recovery_factor
# c14: sigma_range_m
# c15: sigma_range_rate_mm_s
# c16: error_bound_km
# c17: max_iterations
# c18: rel_tol
seg-3d4a2773c32f = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

# text
# c1: scenarios/cislunar-arc-recovery.toml
seg-eb621f41dfbb = Näide <c1/> määrab muu hulgas:

# text
seg-6d584e86deba = suhe (dimensioonitu)

# text
seg-f7f4d06e661f = cislunar-observability identsel

# text
seg-a6cb7ed2ff6d = Tulemuse silt (mootori oma): MODELLED tsislunaarse kaare pikkuse taastamise test (sõltumatu hindaja kinnitus P6 jälgitavuse läve jaoks). VALIDATED tuum: hindaja on paketi olemasolev kaalutud Gauss-Newtoni pakettkorrektor (crate::batch_ls), mille kavandimaatriks on liidetud otsemudeli KESKMINE LÕPLIK VAHE

# attr:alt
seg-2fe411ae2153 = Diagramm, mille mootor kirjutab failile scenarios/cislunar-arc-recovery.toml, liik cislunar-arc-recovery

# text
seg-99dd8cc0e3ef = <b>MODELLED</b> Pakettlahendi vähimruutude hindaja, mis TAASTAB juhtsatelliidi algoleku satelliitidevahelistest simuleeritud mõõtmistest sama epohhiruudustiku kasvavate eesliidete üle, mida kasutab astak-kaare tabel, mõõtmise osatuletistega, mis on võetud keskmiste lõplike vahedena Testid: <a1>cislunar_arc_recovery_reference.rs</a1>.

# text
seg-67aab2162719 = <b>MODELLED</b> Pakettlahendi vähimruutude hindaja, mis TAASTAB juhtsatelliidi algoleku satelliitidevahelistest simuleeritud mõõtmistest sama epohhiruudustiku kasvavate eesliidete üle. Oraakel (sõltumatu etalon) (ReferenceImpl): Eraldi hindaja selles koodibaasis teisel algoritmil ja lahkuneval koodirajal: mittelineaarne kaalutud Gauss-Newton lõplike vahede osatuletistega, selle otsus loetud mõõdetud olekutaastamise veana km ja mm/s. Sellel pole Gramiani astaku ja kovariatsiooni teega ühtegi ühist avaldist ning eraldatus on JÕUSTATUD allikatekstikaitsega, mitte väidetud. MEASURED avaldatud tasapinnalisel DRO ruudustikul: th

# text
# c1: label
seg-7be582874f98 = MODELLED tsislunaarse kaare pikkuse taastamise test (sõltumatu hindaja kinnitus P6 jälgitavuse läve jaoks). VALIDATED tuum: hindaja on paketi olemasolev kaalutud Gauss-Newtoni pakettkorrektor (crate::batch_ls), mille kavandimaatriks on liidetud otsemudeli KESKMINE LÕPLIK VAHE - see ei kutsu ühtegi analüütilist mõõtmise Jacobi rida, ühtegi variatsioonilist olekuüleminekumaatriksit, ühtegi singulaarväärtuse o (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-52fe686b1fdf = MODELLED sõltumatu hindaja test tsislunaarse kaare pikkuse jälgitavuse läve jaoks. (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-48e6e57a0b40 = MODELLED: konstellatsiooni kujundus, epohhiruudustik, ainus jälgitav link, nihke suurus, mõõtmise sigma ja kaks väljaöeldud piiri. (liikide kataloog (<c1/>))

# text
seg-75f275dcb2d2 = MODELLED: konstellatsiooni kujundus, epohhiruudustik, ainus jälgitav link, nihke suurus, mõõtmise sigma ja kaks väljaöeldud piiri. Mitte sertifitseeritud navigatsioonitulemuslikkuse toode. (stsenaariumifaili kommentaar, read { "33" } kuni { "35" })

# text
seg-ea82d9fd6506 = Sõltumatu hindaja kinnitus tsislunaarse kaare pikkuse läve jaoks on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — testitavast üksusest sõltumatu, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
seg-53d57e6dafa6 = <s1>Eelmine</s1>campaign

# text
seg-fe3ecf4b55fe = <s1>Järgmine</s1>cislunar-observability
