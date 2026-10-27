# docs--kind-lunar-llr-datum: translations (et)

# text
seg-3068552e4ab4 = VALIDATED: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-8f8871ac8a0f = Teemaleht: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-fd34d760edb1 = <b>VALIDATED</b> Seitsmeparameetriline Helmerti datumi kovariatsioon, mille kaks simuleeritud sisendit on asendatud mõõdetutega: ajakava on { "337" } arhiveeritud ILRS Kuu laserulatuse normaalpunkti maapealse edastuse epohhid (2015-04-08 kuni 2015-06-27, Grasse MeO { "7" } Testid: <a1>lunar_llr_real_data.rs</a1>.

# text
seg-49baab4910f3 = ppb

# text
seg-a7d59ba6e225 = rad

# text
# c1: docs/kinds/by-kind/lunar-llr-datum.md
seg-8db575fc6d82 = Allikas: <c1/>

# text
# c1: lunar-llr-datum
seg-5329c6c75887 = <c1/> (stsenaariumi liik)

# text
seg-25455a33523c = Seitsmeparameetriline Helmerti Kuu tugisüsteemi datum, mida juhib PÄRIS, ARHIVEERITUD vaatluskampaania, mitte simuleeritud. Kus lunar-frame-campaign eemaldas süstitud teisenduse, kuid esitas siiski oma jaamavõrgu, ajakava ja vaatluspõhise sigma ILLUSTRATIVE sisenditena, võtab see liik kõik kolm mõõtmisest: epohhid on arhiveeritud ILRS Consolidated Laser Ranging Data normaalpunktide maapealse edastuse ajad, vaatlused on laserulatused, mis tegelikult lasti Kuu viiele retroreflektorimassiivile, ja iga vaatluse kaal on selle normaalpunkti enda arhiveeritud täpsus bin_rms/sqrt(n_raw), failist välja loetud. Jaamakoordinaadid tulevad IERS ITRF2020 SLR lahendusest (epohhile levitatud nende avaldatud kiirustega) ja reflektorikoordinaadid JPL DE430 Table { "7" } keskmise Maa/keskmise pöörlemise tugisüsteemis, mille IAU { "2015" } WGCCRE mudel realiseerib. Ulatuse osatuletised koondatakse ühiseks reflektorikoordinaatide Fisheri informatsioonimaatriksiks ja levitatakse sama Helmerti kavandi kaudu datumi kovariatsiooniks, mida diagnoosib crate::fim::crlb. Auaste, defekt, tingimuslikkus, spekter, mittevaadeldavad suunad seitsmeparameetrilises baasis, nõrgim suund täisastmel ja iga parameetri osa sellest väljastatakse igal käivitusel ning piiramata parameeter avaldatakse väärtusega NULL ja olekuga. Massiividevaheline korrelatsioon on MEASURED täpselt nullina, mitte eeldatud, sest laserulatus puudutab ühte massiivi. Kirje, mida kataloogid ei suuda paigutada — jaam, millel ei ole avaldatud ITRF asukohta — JÄETAKSE VÄLJA JA LOETAKSE KOKKU, mitte kunagi ei anta talle asendatud koordinaati. MILLISED LINGID ON MEASURED JA MILLISED MODELLED, SEE ON ARUANNE, MITTE ALLMÄRKUS: Kuu keskpunkti efemeriid ja IAU keha orientatsioon jäävad modelleerituks ning nende koondsuurus väljastatakse vaadeldud-miinus-arvutatud ühesuunalise ulatuse jäägina üle iga kasutatud punkti; troposfäär, tahke keha looded, jaama ekstsentrilisus, poolusliikumine, UT1-UTC, relativistlik viivitus ja jaamakellad puuduvad ja asuvad selle jäägi sees. Kuna efemeriidi viga jõuab kovariatsiooni ainult iga vaatejoone suuna kaudu, lahendab iga käivitus kogu datumi uuesti kõigi osatuletistega, mis on kallutatud sensitivity_tilt_deg võrra (märk vaheldub), ja väljastab suhte, nii et kovariatsiooni tundetus modelleeritud efemeriidi suhtes on arv, mitte argument. Simuleeritud kampaania enda arvud KÄIVITATAKSE ja trükitakse mõõdetute kõrvale, mitte ei kanta üle. MODELLED: seitsmeparameetrilised arvud on Cramer-Rao piir vähendatud parameetrikomplekti jaoks päris ajakaval — mitte lahendatud datum, mitte LLR analüüs ja mitte geodeetiline toode. Kinnitatud päris andmete lõik tuleb hoidlaga kaasa, kuid mitte avaldatud crate'iga; suunake data_dir selle koopiale.

# text
# c1: scenarios/lunar-llr-datum.toml
seg-f4359803d67a = Ühe <c1/> käivituse kokkuvõte: lunar-llr-datum: { "337" } arhiveeritud normaalpunkti ({ "349" } parsitud) { "2" } jaamast { "5" } retroreflektorimassiivini { "80.9" } p jooksul; mõõdetud normaalpunkti täpsuse mediaan { "5.13" } mm ühesuunaline; reflektori informatsiooni auaste 15/15; Helmerti auaste 7/7 cond { "2.399e4" }; datumi translatsiooni sigma { "1.851746e-2" } m; vaadeldud-miinus-arvutatud ühesuunalise jäägi RMS { "156493.9" } m (modelleeritud lingid, peamiselt analüütiline Kuu efemeriid)

# text
# c1: data_dir
# c2: normal_points_dir
# c3: reflectors_path
# c4: stations_path
# c5: dut1_s
# c6: rel_tol
# c7: compare_simulated_campaign
# c8: sensitivity_tilt_deg
# c9: planetary_kernel_path
# c10: extra_reflectors
# c11: extra_beacons
# c12: extra_earth_elevation_mask_deg
# c13: beacon_campaign
seg-7eda56c1285a = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

# text
# c1: scenarios/lunar-llr-datum.toml
seg-c95b4d285cbd = Näide <c1/> määrab muu hulgas:

# text
seg-37a77f49f048 = ps

# text
seg-b5c1e8681164 = Tulemuse silt (mootori oma): Kuu tugisüsteemi datum PÄRIS vaatluskampaaniast. Ajakava, vaatluste arv ja iga vaatluse kaal tulevad arhiveeritud ILRS Kuu laserulatuse normaalpunktidest (mõõdetud); jaamakoordinaadid tulevad IERS ITRF2020-st ja retroreflektorite koordinaadid JPL DE430 Table { "7" } (avaldatud

# attr:alt
seg-e4da113cbe18 = Mootori joonistatud diagramm failile scenarios/lunar-llr-datum.toml, liik lunar-llr-datum

# text
seg-764e54be97a0 = <b>VALIDATED</b> Lunar-llr-datum seitsmeparameetriline Helmerti datumi kovariatsioon arhiveeritud ILRS normaalpunktidest ja nende mõõdetud kaaludest tuumateel: geotsentriline Kuu keskpunkt loetakse JPL DE440-st mootori enda tuumalugejaga (planetary_ker Testid: <a1>validate_llr_datum_kernel_moon.rs</a1>.

# text
seg-cae262db0e46 = <b>VALIDATED</b> Seitsmeparameetriline Helmerti datumi kovariatsioon, mille kaks simuleeritud sisendit on asendatud mõõdetutega: ajakava on { "337" } arhiiv. Oraakel (sõltumatu etalon) (ExternalDataset): Suletud kujuga samasused, sõltumatu hoidlasisene tee ja alates { "0.36" } sõltumatu SPICE ja NumPy teegi etalon värsketel mõõdetud andmetel (allpool); avaldatud Kuu-LLR datumi kovariatsiooni paari, mille vastu kontrollida, ei ole, seega ei väideta täpsust. Ainus uus tuletis — ulatuse osatuletis reflektori kehaga seotud asukoha suhtes — tuletatakse uuesti kahesuunalise valgusaja tsentraalse lõpliku erinevusega, mida see diffe

# text
# c1: label
seg-61ac3609406a = Kuu tugisüsteemi datum PÄRIS vaatluskampaaniast. Ajakava, vaatluste arv ja iga vaatluse kaal tulevad arhiveeritud ILRS Kuu laserulatuse normaalpunktidest (mõõdetud); jaamakoordinaadid tulevad IERS ITRF2020-st ja retroreflektorite koordinaadid JPL DE430 Table { "7" } (avaldatud). Kuu keskpunkti efemeriid, IAU { "2015" } WGCCRE keha orientatsioon ning troposfääri, loodete, jaama ekstsentri puudumine (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-97610a2cca73 = Massiividevaheline korrelatsioon on MEASURED täpselt nullina, mitte eeldatud, sest laserulatus puudutab ühte massiivi. (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-64b1c08eeb11 = MILLISED LINGID ON MEASURED JA MILLISED MODELLED, SEE ON ARUANNE, MITTE ALLMÄRKUS: Kuu keskpunkti efemeriid ja IAU keha orientatsioon jäävad modelleerituks ning nende koondsuurus väljastatakse vaadeldud-miinus-arvutatud ühesuunalise ulatuse jäägina üle iga kasutatud punkti; troposfäär, tahke keha looded, jaama ekstsentrilisus, poolusliikumine, UT1-UTC, relativistlik viivitus ja jaamakellad puuduvad ja asuvad selle jäägi sees. (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-d38710f3ce4a = MODELLED: seitsmeparameetrilised arvud on Cramer-Rao piir vähendatud parameetrikomplekti jaoks päris ajakaval — mitte lahendatud datum, mitte LLR analüüs ja mitte geodeetiline toode. (liikide kataloog (<c1/>))

# text
seg-a19e2b1fcaf1 = epohhid on arhiveeritud ILRS Consolidated Laser Ranging Data normaalpunktide maapealse edastuse ajad; * vaatlused on laserulatused, mis tegelikult lasti Kuu viiele retroreflektorimassiivile; * iga vaatluse kaal on selle normaalpunkti ENDA arhiveeritud täpsus, bin_rms/sqrt(n_raw), failist välja loetud, mitte eeldatud. (stsenaariumifaili kommentaar, read { "7" } kuni { "12" })

# text
seg-5ed6b83c01da = MILLISED LINGID ON MEASURED JA MILLISED MODELLED, SEE ON ARUANNE, MITTE ALLMÄRKUS. Kuu keskpunkti efemeriid ja IAU keha orientatsioon jäävad modelleerituks ning nende koondsuurus väljastatakse vaadeldud-miinus-arvutatud ühesuunalise ulatuse jäägina üle iga kasutatud punkti; troposfäär, tahke keha looded, jaama ekstsentrilisus, poolusliikumine, UT1-UTC, relativistlik viivitus ja jaamakellad puuduvad ja asuvad selle jäägi sees. Kuna (stsenaariumifaili kommentaar, read { "18" } kuni { "26" })

# text
seg-7e7ff3ce4971 = Massiividevaheline korrelatsioon on MEASURED täpselt nullina, mitte eeldatud, sest laserulatus puudutab ühte massiivi. Kirje, mida kataloogid ei suuda paigutada — jaam, millel ei ole avaldatud ITRF asukohta — JÄETAKSE VÄLJA JA LOETAKSE KOKKU, mitte kunagi ei anta talle asendatud koordinaati. Simuleeritud kampaania enda arvud KÄIVITATAKSE ja trükitakse mõõdetute kõrvale. (stsenaariumifaili kommentaar, read { "28" } kuni { "31" })

# text
seg-8bfe258bedf5 = MODELLED: seitsmeparameetrilised arvud on Cramer-Rao piir vähendatud parameetrikomplekti jaoks päris ajakaval. Mitte lahendatud datum, mitte LLR analüüs, mitte geodeetiline toode. (stsenaariumifaili kommentaar, read { "33" } kuni { "34" })

# text
seg-598a7d6ba1e7 = <s1>Eelmine</s1>lunar-joint-od-clock

# text
seg-54b1c9200aae = <s1>Järgmine</s1>lunar-station-coverage
