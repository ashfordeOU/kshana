# docs--kind-lunar-vlbi-fim: translations (et)

# text
seg-b054c73f22e5 = väärtus puudub

# text
seg-98151954f217 = false

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: <a1>kontrollimaatriksi</a1> read, mis nimetavad seda liiki.

# text
seg-3319b18ac61f = ja veel { "1" } maatriksis.

# text
seg-2595bd629ffb = <b>MODELLED</b> Seitsmeparameetriline Helmerti datum, mis on levitatud SIMULEERITUD VAATLUSKAMPAANIAST, mitte taastatud süstitud teisendusest.

# text
# c1: docs/kinds/by-kind/lunar-vlbi-fim.md
seg-7ecec8d27f50 = Allikas: <c1/>

# text
# c1: lunar-vlbi-fim
seg-d54e29b7bc80 = <c1/> (stsenaariumi liik)

# text
seg-1bc37634ba9f = Kuu-VLBI jaamakoordinaatide kovariatsioon: lunar-vlbi vaadeldava viivituse osatuletised, mis on koondatud selgesõnalise AJAKAVA (baseline-id x epohhid) üle Fisheri informatsioonimaatriksiks, pööratud ja esitatud jaamakoordinaatide kovariatsioonina ning koordinaadipõhise jaamasigmana — arvutatud mootori väljund, mitte skalaarne viivituse täpsus, mis on surutud läbi eeldatud isotroopse g = { "3" } võrdjaotustegurist. Olek kannab Maaga FIKSEERITUD (ITRS) jaamakoordinaate, nii et Jacobi maatriks on inertsiaalne osatuletis, mida on pööratud iga epohhi GCRS->ITRS maatriksiga: Maa pöörlemine on see, mis teeb need koordinaadid vaadeldavaks, ja aruanne MÕÕDAB Maaga fikseeritud vaatejoone pühkimist ja majaka deklinatsiooni, mitte ei eelda neid. Üks vaatlus on üks (baseline, epohh) paar, kus MÕLEMAD jaamad on elevatsioonimaskist kõrgemal, kaalutud 1/delay_sigma_s^{ "2" }. Esitab auastme, datumi defekti, tingimuslikkuse arvu, täieliku informatsioonispektri, kovariatsioonimaatriksi, jaamapõhised telgede kaupa ja 3-D sigmad ning vaba võrgu nullruumi igal käivitusel; auastmepuuduse korral avaldatakse peamine sigma väärtusega NULL ja olekuga, mitte kunagi ei loeta seda peaaegu singulaarsest pöördmaatriksist. Võrdjaotusväärtus c<em>delay_sigma_s</em>sqrt(g/N) SAMA ajakava jaoks väljastatakse arvutatud väärtuse kõrval suhtega, koos isotroopse jäljepiiriga sqrt(p/trace(M)), mille AM-HM teeb kõvaks põhjaks — nii et suhe on anisotroopia, mille eeldus kõrvale jättis. Viivituse sulgumine tau_ik = tau_ij + tau_jk teeb geomeetriliselt sõltumatuks ainult n-1 baseline-i n(n-1)/2-st; aruanne esitab mõlemad arvud. MODELLED: Kuu keskpunkti efemeriid, jaamakellad, troposfäär ja Maa orientatsiooni parameetrid on hoitud FIKSEERITUD ja vaatlusi käsitletakse sõltumatutena, nii et kovariatsioon on Cramer-Rao piir vähendatud parameetrikomplekti jaoks, mitte ennustatud seansi tulemus; viivituse sigma, jaamakoordinaadid ja ajakava on sisendid. Osatuletis, mille geomeetrilise viivituse Jacobi maatriks välja jätab (diferentseeritud Shapiro liige), mõõdetakse lõpliku erinevusega ja väljastatakse. Mitte geodeetiline toode.

# text
# c1: scenarios/lunar-vlbi-fim.toml
seg-4df72c1b921e = Ühe <c1/> käivituse kokkuvõte: lunar-vlbi-fim | { "3" } jaama / { "3" } baseline-i x { "49" } epohhi = { "16" } vaatlust (mask { "10.0" } kraadi) | datum anchor-first-station | auaste 6/6 cond { "2.209e4" } | jaama sigma { "0.0926" } m vs võrdjaotus g={ "3" } { "0.0013" } m (suhe { "71.360" })

# text
# c1: stations
# c2: beacon_lat_deg
# c3: beacon_lon_deg
# c4: beacon_alt_m
# c5: epoch_year
# c6: epoch_month
# c7: epoch_day
# c8: arc_hours
# c9: step_min
# c10: delay_sigma_s
# c11: elevation_mask_deg
# c12: datum
# c13: estimate_beacon
# c14: rel_tol
# c15: equipartition_g
# c16: planetary_kernel_path
seg-f0dabe1b061b = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

# text
# c1: scenarios/lunar-vlbi-fim.toml
seg-fabf305ae1de = Näide <c1/> määrab muu hulgas:

# text
seg-7b0f433d1d63 = sigma = c * delay_sigma_s * (beacon_rang

# text
seg-8b098bf1df6b = Tulemuse silt (mootori oma): MODELLED Kuu-VLBI jaamakoordinaatide kovariatsioon. Kovariatsioon koondatakse mootori enda analüütilistest viivituse osatuletistest baseline-ide ja epohhide selgesõnalise ajakava üle ja pööratakse; seda EI teisendata skalaarsest viivituse täpsusest eeldatud geomeetriateguriga. Vaatluspõhine viivituse si

# attr:alt
seg-19c383444296 = Mootori joonistatud diagramm failile scenarios/lunar-vlbi-fim.toml, liik lunar-vlbi-fim

# text
seg-d1a6a5086102 = <b>VALIDATED</b> Viivituse osatuletised koondatud baseline-ide × epohhide ajakava üle Fisheri informatsioonimaatriksiks, pööratud jaamakoordinaatide kovariatsiooniks ja koordinaadipõhiseks jaamasigmaks, asendades eeldatud isotroopse võrdjaotuslingi a

# text
# c1: all-stations-fixed
seg-55ce02ad5dd5 = <b>MODELLED</b> Kolmas datumi valik, <c1/>, mis hoiab iga Maa jaama paigal ja hindab ainult MAJAKA Kuuga fikseeritud koordinaate — konfiguratsioon, mille jaoks Kuu pinnapunkti määramatust tegelikult esitatakse, kuna Maa jaama koordinaat

# text
seg-811a412b40b6 = <b>VALIDATED</b> Stsenaariumi lunar-vlbi-fim kõigi-jaamade-fikseeritud majaka kovariatsioon (iga Maa jaam paigal, majaka Kuuga fikseeritud koordinaadid hinnatud ainult) majakaga, mis on paigutatud JPL DE440 Kuule, mille loeb mootori enda tuumalugeja

# text
seg-a731b913bdf0 = <b>VALIDATED</b> Viivituse osatuletised koondatud baseline-ide × epohhide ajakava üle Fisheri informatsioonimaatriksiks, pööratud jaamakoordinaatide kovariatsiooniks ja koordinaadipõhiseks jaama. Sõltumatu etalon (ExternalDataset): Sõltumatu hoidlasisene tee. Iga Jacobi maatriksi rida tuletatakse uuesti lunar_vlbi::vlbi_delay_s tsentraalse lõpliku erinevusega, hinnatuna oleku enda Maaga fikseeritud ja Kuuga fikseeritud koordinaatidest, mis on pööratud edasi läbi tugisüsteemide ahela — tee, mis ei arvuta tuletist ega jaga analüütiliste osatuletistega ühtegi avaldist — ja informatsioonimaatriksid, mille kaks teed ehitavad, ühtivad täpsusega < { "1e-6" } suurimast diagonaalist. See

# text
# c1: all-stations-fixed
seg-2300ffd9fc4e = <b>MODELLED</b> Kolmas datumi valik, <c1/>, mis hoiab iga Maa jaama paigal ja hindab ainult MAJAKA Kuuga fikseeritud koordinaate — konfiguratsioon, mille jaoks Kuu. Sõltumatu etalon (ReferenceImpl): Suletud kujuga samasused, välist sõltumatut etaloni ei väideta ega ole saadaval. Hoobakätt kontrollitakse ρ/B vastu ja kaht võrdjaotusvormi omavahel täpsusega { "1e-15" } — algebralised samasused, seega tabavad need juhtmestusvea ja mitte midagi muud ning on nii märgitud. Sisuline tulemus on MEASURED, mitte väidetud: fikseeritud baseline-i viivitus piirab majaka SUUNDA, nii et vaatejoone komponent rea

# text
# c1: label
seg-2cbf700a234e = MODELLED Kuu-VLBI jaamakoordinaatide kovariatsioon. Kovariatsioon koondatakse mootori enda analüütilistest viivituse osatuletistest baseline-ide ja epohhide selgesõnalise ajakava üle ja pööratakse; seda EI teisendata skalaarsest viivituse täpsusest eeldatud geomeetriateguriga. Vaatluspõhine viivituse sigma, jaamakoordinaadid, majaka asukoht ja ajakava on sisendid. Kuu keskpunkti efemeriid, jaamakellad (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-8f63c3e774e2 = Kuu-VLBI jaamakoordinaatide kovariatsioon: lunar-vlbi vaadeldava viivituse osatuletised, mis on koondatud selgesõnalise AJAKAVA (baseline-id x epohhid) üle Fisheri informatsioonimaatriksiks, pööratud ja esitatud jaamakoordinaatide kovariatsioonina ning koordinaadipõhise jaamasigmana — arvutatud mootori väljund, mitte skalaarne viivituse täpsus, mis on surutud läbi eeldatud isotroopse g = { "3" } võrdjaotustegurist. (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-d09b166842d5 = Olek kannab Maaga FIKSEERITUD (ITRS) jaamakoordinaate, nii et Jacobi maatriks on inertsiaalne osatuletis, mida on pööratud iga epohhi GCRS->ITRS maatriksiga: Maa pöörlemine on see, mis teeb need koordinaadid vaadeldavaks, ja aruanne MÕÕDAB Maaga fikseeritud vaatejoone pühkimist ja majaka deklinatsiooni, mitte ei eelda neid. (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-bb7ff1e5d99f = Võrdjaotusväärtus c<em>delay_sigma_s</em>sqrt(g/N) SAMA ajakava jaoks väljastatakse arvutatud väärtuse kõrval suhtega, koos isotroopse jäljepiiriga sqrt(p/trace(M)), mille AM-HM teeb kõvaks põhjaks — nii et suhe on anisotroopia, mille eeldus kõrvale jättis. (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-0ed4495d4488 = MODELLED: Kuu keskpunkti efemeriid, jaamakellad, troposfäär ja Maa orientatsiooni parameetrid on hoitud FIKSEERITUD ja vaatlusi käsitletakse sõltumatutena, nii et kovariatsioon on Cramer-Rao piir vähendatud parameetrikomplekti jaoks, mitte ennustatud seansi tulemus; viivituse sigma, jaamakoordinaadid ja ajakava on sisendid. (liikide kataloog (<c1/>))

# text
seg-4df6e3981cc4 = D3 avaldatud ahel läheb vaatluspõhisest viivituse täpsusest jaamakoordinaadi määramatuseni läbi eeldatud ISOTROOPSE võrdjaotusteguri g = { "3" }. See samm on see, mida artikli enda kokkuvõte nimetab modelleeritud, mitte mõõdetud. See stsenaarium eemaldab selle: Kuu-VLBI viivituse osatuletised koondatakse päris (baseline x epohh) paaride ajakava üle Fisheri informatsioonimaatriksiks, pööratakse ja esitatakse a (stsenaariumifaili kommentaar, read { "3" } kuni { "8" })

# text
seg-489b93ca0f7f = Olek kannab Maaga FIKSEERITUD (ITRS) koordinaate, nii et Jacobi maatriks on inertsiaalne osatuletis, mida on pööratud iga epohhi GCRS->ITRS maatriksiga: Maa pöörlemine on see, mis teeb need koordinaadid üldse vaadeldavaks, ja aruanne MÕÕDAB Maaga fikseeritud vaatejoone pühkimist ja majaka deklinatsiooni, mitte ei eelda neid. Üks vaatlus on üks (baseline, epohh) paar, kus MÕLEMAD jaamad on elevatsioonimaskist kõrgemal, kaalutud 1/delay (stsenaariumifaili kommentaar, read { "10" } kuni { "14" })

# text
seg-efb5719364af = Mida aruandes lugeda * jaamapõhised telgede kaupa ja 3-D sigmad — arvutatud vastus; * võrdjaotusväärtus c<em>delay_sigma_s</em>sqrt(g/N) SAMA ajakava jaoks, trükitud selle kõrvale suhtega. See suhe ON anisotroopia, mille eeldus kõrvale jättis, ja isotroopne jäljepiir sqrt(p/trace(M)) teeb AM-HM kõvaks põhjaks, nii et eeldus võib alati ainult alahinnata; * auaste, datumi defekt, tingimuslikkuse arv, täielik sp (stsenaariumifaili kommentaar, read { "16" } kuni { "26" })

# text
seg-96c1a129aeae = <s1>Eelmine</s1>lunar-time-offset

# text
seg-199d98630271 = <s1>Järgmine</s1>lunar-vlbi
