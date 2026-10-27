# docs--kind-oem-interop: translations (et)

# text
seg-99ef7c1d552c = Mootori v{ $version } stsenaariumi liik, perekond <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne märgis on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas märgis teenitakse: README jaotis Evidence).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Perekonna leht: <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>

# text
seg-3068552e4ab4 = VALIDATED: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
# c1: docs/kinds/by-kind/oem-interop.md
seg-4abcbdaddcf8 = Allikas: <c1/>

# text
# c1: oem-interop
seg-a92dcafd670e = <c1/> (stsenaariumi liik)

# text
seg-dbffff25b57f = CCSDS OEM koostalitlussild: impordib välise lennudünaamika tööriista (GMAT/Orekit/STK väljastavad kõik OEM-i) loodud orbiidi efemeriidisõnumi (Orbit Ephemeris Message) ning annab aru selle segmentidest/objektidest/tugisüsteemidest/epohhivahemikust ja kiiruse kooskõla kontrollist; sisendita teeb see läbi loodud etalonorbiidi edasi-tagasi ringi ning annab aru impordi↔ekspordi täpsusest. MODELLED struktuurne/füüsikaline sisendikontroll, MITTE lähteandmete orbiiditäpsuse valideerimine.

# text
# c1: scenarios/oem-interop.toml
seg-21eb1c9d7571 = Ühe <c1/> käivituse kokkuvõte: oem-interop: edasi-tagasi läbitud { "2" } segment(i), { "12" } olekut; suurim edasi-tagasi viga { "4.88e-7" } km / { "4.61e-10" } km/s (MODELLED interop)

# text
# c1: oem_text
seg-54c35d9fbfd9 = Valikulised väljad: <c1/>

# text
# c1: scenarios/oem-interop.toml
seg-d4117f615cd8 = Näide <c1/> määrab muu hulgas:

# text
seg-d7db74d14617 = KSHANA

# text
seg-b16f858574ca = Tulemuse silt (mootori oma): MODELLED — CCSDS OEM impordi/edasi-tagasi läbimise koostalitlussild (GMAT/Orekit/STK väljastavad OEM-i); struktuurne + füüsikaline sisendikontroll, MITTE lähteandmete orbiiditäpsuse valideerimine

# attr:alt
seg-5db5a7c812ca = Diagramm, mille mootor kirjutab failile scenarios/oem-interop.toml, liik oem-interop

# text
seg-cd29f08ef235 = <b>VALIDATED</b> CCSDS { "502.0" } OEM importija (parse_oem), mis talub COMMENT-ridu / lisametaandmete võtmesõnu / kovariatsiooniplokke ja on kirjutaja täpne pöördfunktsioon; edasi-tagasi läbimine + välise faili sisend koos kiiruse kooskõla kontrolliga. Testid: <a1>ccsds_oem_interop_reference.rs</a1>.

# text
# c1: oem
seg-20071a16b316 = <b>VALIDATED</b> CCSDS { "502.0" } OEM importija (parse_oem), mis talub COMMENT-ridu / lisametaandmete võtmesõnu / kovariatsiooniplokke ja on kirjutaja täpne pöördfunktsioon; edasi-tagasi läbimine + . Oraakel (sõltumatu etalon; ExternalDataset): sõltumatu kolmanda osapoole CCSDS-502 parser <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — eraldi koodibaas, mis dekodeerib kshana väljastatud EME2000/UTC OEM-i bait-baidilt identselt ({ "24" } olekut { "2" } testfailis, asukoha/kiiruse Δ = { "0" }) ja mille range lugeja kinnitab metaandmete märgid; kshana parser ühtib sellega samamoodi ka lisatud välisel OEM-il. Kaks ausat koostalitlusleidu (oem teek lükkab tagasi kshana satelliidikohase mu

# text
# c1: label
seg-7ab6bb7a1b8a = MODELLED — CCSDS OEM impordi/edasi-tagasi läbimise koostalitlussild (GMAT/Orekit/STK väljastavad OEM-i); struktuurne + füüsikaline sisendikontroll, MITTE lähteandmete orbiiditäpsuse valideerimine (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-343a56c07d02 = MODELLED struktuurne/füüsikaline sisendikontroll, MITTE lähteandmete orbiiditäpsuse valideerimine. (liikide kataloog (<c1/>))

# text
seg-44aba1ad1d37 = AUS ULATUS: MODELLED struktuurne + füüsikaline sisendikontroll, MITTE lähteefemeriidi orbiiditäpsuse valideerimine. Käivitamine: kshana scenarios/oem-interop.toml (stsenaariumifaili kommentaar, read { "11" }–{ "13" })

# text
seg-833df8eedc34 = <s1>Eelmine</s1>ntn-positioning

# text
seg-28254e1b38d4 = <s1>Järgmine</s1>optical-atmosphere
