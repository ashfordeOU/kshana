# docs--kind-constellation-design: translations (et)

# text
seg-e27476e37522 = Maa

# text
seg-37d29d8303fe = km

# text
seg-11e8c29ecb45 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Satelliidikonstellatsioonid, katvus ja geomeetria</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-a4f1e7d2041e = Perekonna leht: <a1>Satelliidikonstellatsioonid, katvus ja geomeetria</a1>

# text
seg-670191cf797f = Teemaleht: <a1>SOLAR-SYSTEM.md</a1>

# text
seg-cb91473bfdda = Teemaleht: <a1>LEO-PNT.md</a1>

# text
# c1: docs/kinds/by-kind/constellation-design.md
seg-f305ed6dc164 = Allikas: <c1/>

# text
# c1: constellation-design
seg-f708c26a5139 = <c1/> (stsenaariumi liik)

# text
seg-de173c9f4034 = Konstellatsiooni kujundus suures mastaabis: Walker DELTA ja Walker STAR mustrid i: T/P/F konventsioonis (sõlmed hajutatud üle { "360" } või { "180" } kraadi, orbiidisisene vahe { "360" }<em>P/T, orbiitidevaheline faasinihe { "360" }</em>F/T), selgesõnalised elementide loendid ja mitme kihiga kujundused, mitu konstellatsiooni ühes jooksus, Maa, Kuu, Marsi või mis tahes muu planeedi, Pluuto või suure kuu ümber, kasutades body-mooduli konstante (samu, mida kasutavad liigid solar-system ja body-pnt). EELSEADISTUSED avaldatud nimielementidest: gps-baseline ja gps-expandable (GPS Standard Positioning Service Performance Standard-i { "24" } pesa ja kuus ees/taga laiendatavat paari, 5. väljaanne { "2020" }, tabelid 3.2-1 kuni 3.2-3), galileo (Walker 24/3/1 kõrgusel { "29 599.801" } km ja { "56" } kraadi, Galileo Open Service Service Definition Document väljaanne { "1.1" } tabelid { "1" } ja { "23" }), beidou ja beidou-meo (Walker 24/3/1 kõrgusel { "21 528" } km ja { "55" } kraadi pluss kolm geostatsionaarset satelliiti pikkuskraadidel { "80" }, { "110.5" } ja { "140" } kraadi E ning kolm kaldus geosünkroonset satelliiti { "55" } kraadi juures, BeiDou Open Service Performance Standard { "3.0" } jaotis { "4.1" }; MEO faas ja { "118" } kraadi E kaldus-geosünkroonse ristumine on modelleeritud, sest standard neid ei väida) ja glonass (24/3/1 kõrgusel { "19 100" } km ja { "64.8" } kraadi GLONASS Interface Control Document väljaande { "5.1" } jaotise { "5.2" } pesavalemist). KATVUS JA TÄPSUSE HALVENEMISE TEGUR: üle laius-/pikkuskraadi ruudustiku ja valimiga akna kõrgusmaskiga, nähtavate satelliitide arv, GDOP, PDOP, HDOP ja VDOP lahtri kohta, kättesaadavus (lahendus PDOP-iga lävel või sellest allpool, vaikimisi { "6" }) lahtri kohta, globaalselt (pindalaga kaalutud) ja halvimas asukohas, ühe vastuvõtja kellaga konstellatsiooni kohta, kui just clock = "common". See skaleerub tuhandete satelliitideni: nähtavus on skalaarkorrutis iga satelliidi katvuse poolnurgaga ja satelliidid jaotatakse epohhi kaupa subsatelliitse laiuskraadi järgi ribadesse, nii et ruudustiku rida testib ainult neid, mis võivad olla nähtaval; aruanne loeb kokku säästetud paaritestid. JSON kannab ruudustikukaarte ja alandatud diskreetimisega satelliidikaupa maapealseid jälgi. VALIDATED: Walkeri generaator Galileo OS SDD tabeli { "23" } ja GLONASS ICD pesavalemi vastu, GPS-i eelseadistus SPS PS tabeli 3.2-1 avaldatud ekvaatoriületuse veeru vastu ning GPS-i baasjoone globaalne HDOP jaotus SPS PS lisa B vastu (mediaan { "0.94" }, { "95" }% { "1.25" }, keskmine { "0.96" }, tolerants { "0.03" }). MODELLED: kahe keha orbiidid valikulise sekulaarse J2-ga, sfääriline keha, ainult geomeetriline nähtavus (signaali võimsust, tervist ega maastikku ei ole) ning erinevate süsteemide suhteline faas, mis ei ole ühegi tegeliku kuupäeva hetktõmmis.

# text
# c1: scenarios/leo-pnt-mega-shell.toml
seg-21fbd84bfba1 = Ühe <c1/> jooksu kokkuvõte: constellation-design: { "5000" } satelliiti (LEO-PNT) Maa ümber; kättesaadavus { "99.22" }% (PDOP <= { "3" } { "20" } kraadi maskiga), halvim asukoht { "0.00" }%, PDOP-i mediaan { "1.11" }, keskmiselt { "39.4" } nähtaval; { "648" } ruudustikupunkti x { "12" } epohhi (MODELLED)

# text
# c1: body
# c2: duration_s
# c3: step_s
# c4: mask_deg
# c5: pdop_threshold
# c6: grid_step_deg
# c7: lat_min_deg
# c8: lat_max_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: clock
# c12: j2
# c13: track_points
# c14: max_tracks
# c15: constellation
seg-af572ce1fd89 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: scenarios/leo-pnt-mega-shell.toml
seg-fd393ddc7d5d = Näide <c1/> määrab muu hulgas:

# text
seg-d72b4c5393e0 = earth

# text
seg-d9b3c54bd272 = common

# text
seg-6411970ba342 = delta

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-0a6f7f6c66c4 = km^3/s^{ "2" }

# text
seg-ab9b72b9ffce = Tulemuse silt (mootori oma): MODELLED - kahe keha Kepleri orbiidid (valikuline sekulaarne J2) sfäärilise keha ümber, geomeetriline nähtavus üle kõrgusmaski, kõiki nähtavaid hõlmav täpsuse halvenemise tegur ühe vastuvõtja kellaga konstellatsiooni kohta, kui just clock = "common"; signaali võimsust, tervist ega maastikku ei ole. Walkeri geomeetria ja avaldatud

# attr:alt
seg-899e728ad9bd = Diagramm, mille mootor kirjutab failile scenarios/leo-pnt-mega-shell.toml, liik constellation-design

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
# c1: constellation-design
seg-602493ac6987 = <b>VALIDATED</b> Liigi <c1/> generaatorid: Walkeri delta- ja tähemustrid T/P/F konventsioonis (sõlmevahe 360/P või 180/P, orbiidisisene vahe { "360" }·P/T, orbiitidevaheline faasinihe { "360" }·F/T) ning GPS-i baasjoone ja laiendatav 24 pesa, Gal

# text
# c1: constellation-design
seg-bdc81f37ad16 = <b>VALIDATED</b> Liigi <c1/> katvusmootor GPS-i baasjoone 24 pesa eelseadistusel GPS Standard Positioning Service Performance Standard-i (SPS PS) lisa B tingimustel (üks sideeriline ööpäev, { "287" } viieminutilist sammu, { "4" } x { "4" } kraadi globaalne ruudustik w

# text
# c1: constellation-design
seg-1272200ad4f2 = <b>MODELLED</b> Liik <c1/> peale kahe fikseeritud juhu: selgesõnalised ja mitme kihiga kujundused, mitu konstellatsiooni jooksu kohta ühe vastuvõtja kellaga konstellatsiooni kohta, Maa, Kuu ja Mars body konstantidest, BeiDou eelseadistus Testid: <a1>coverage_dop_gnss_lib_py_oracle.rs</a1>.

# text
# c1: constellation-design
seg-0c64f22330d2 = <b>VALIDATED</b> Liigi <c1/> generaatorid: Walkeri delta- ja tähemustrid T/P/F konventsioonis (sõlmevahe 360/P või 180/P, orbiidisisene vahe { "360" }·P/T, int. Oraakel (sõltumatu etalon) (ExternalDataset): Avaldatud ametkondlikud dokumendid: Galileo Open Service Service Definition Document väljaanne { "1.1" } (European GNSS Service Centre) tabelid { "1" } ja { "23" }, etalonkonstellatsioon kuupäeval 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document väljaanne { "5.1" } ({ "2008" }) jaotis { "5.2" }, pesavalem sõlme pikkuskraadi ja laiuskraadi argumendi jaoks; GPS Standard Positioning Service Performance Standard 5. väljaanne (aprill { "2020" }) tabelid 3.2-1, 3.2-2 ja

# text
# c1: constellation-design
seg-87c4e19dc780 = <b>VALIDATED</b> Liigi <c1/> katvusmootor GPS-i baasjoone 24 pesa eelseadistusel GPS Standard Positioning Service Performance Standard-i (SPS PS) lisa . Oraakel (sõltumatu etalon) (ExternalDataset): GPS SPS PS 5. väljaanne (aprill { "2020" }) lisa B jaotised B.3.2.2 ja B.3.2.3, täielikult hõivatud baasjoone 24 pesa konstellatsiooni avaldatud globaalse keskmise HDOP jaotus (mediaan { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, keskmine { "0.96" }), tabel 3.8-1 (PDOP kättesaadavus) ja tabel B.3-1 (halvenenud konstellatsiooni ansambli PDOP, kasutatud ainult ülempiirina), pluss käsitsi tuletatud suletud kuju ühe epohhi jaoks. VDOP ja PD

# text
# c1: constellation-design
seg-04289f7252cd = <b>MODELLED</b> Liik <c1/> peale kahe fikseeritud juhu: selgesõnalised ja mitme kihiga kujundused, mitu konstellatsiooni jooksu kohta ühe vastuvõtja kellaga konste. Oraakel (sõltumatu etalon) (InternalConsistency): Sisemine kooskõla: jõumeetodil kõrgusskaneerimine, käsitsi arvutatud ja orbit::dop redutseerimised ning suletud kujul Walkeri ja geosünkroonne geomeetria. Kahe keha orbiidid valikulise sekulaarse J2-ga, sfääriline keha kohaliku vertikaaliga piki raadiust, ainult geomeetriline nähtavus (signaali võimsust, satelliidi tervist, maastikku ega kolmanda keha häiringut ei ole) ning süsteemidevaheline suhteline faas, mis on võetud erinevatest re

# text
# c1: label
seg-00fa65d44cbd = MODELLED - kahe keha Kepleri orbiidid (valikuline sekulaarne J2) sfäärilise keha ümber, geomeetriline nähtavus üle kõrgusmaski, kõiki nähtavaid hõlmav täpsuse halvenemise tegur ühe vastuvõtja kellaga konstellatsiooni kohta, kui just clock = "common"; signaali võimsust, tervist ega maastikku ei ole. Walkeri geomeetriat ja avaldatud eelseadistusi kontrollitakse Galileo OS SDD, GLONASS ICD ja GPS SPS Performance Standard pesatabelite vastu, a (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-62f0fc16a247 = MODELLED: kahe keha orbiidid valikulise sekulaarse J2-ga, sfääriline keha, ainult geomeetriline nähtavus (signaali võimsust, tervist ega maastikku ei ole) ning erinevate süsteemide suhteline faas, mis ei ole ühegi tegeliku kuupäeva hetktõmmis. (liikide kataloog (<c1/>))

# text
seg-3ef4276dd40b = Mida jooks vastab: nähtavad satelliidid, PDOP/HDOP/VDOP/GDOP { "10" } kraadise lahtri kohta ning aja osakaal, mil PDOP on { "3" } või sellest väiksem üle { "20" } kraadise maski kahe tunni jooksul. Kaardil nähtav nõrk koht on polaarmütsid: ükski kiht ei ulatu üle umbes { "82" } kraadi laiuskraadi, nii et pooluse lähedal näeb kasutaja kõiki satelliite taeva ühel poolel ja vertikaalgeomeetria halveneb. MODELLED: illustratiivne kujundus, kahe keha orbiidid J2-ga, sfääri (stsenaariumifaili kommentaar, read { "17" } kuni { "21" })

# text
seg-c333d3fe22cd = Katvuse ja täpsuse halvenemise teguri kaardid suvaliste suuremahuliste mitme konstellatsiooniga kujunduste jaoks mis tahes keskkeha ümber on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-436504a8b26f = <s1>Eelmine</s1>conflict-resilience

# text
seg-cba188459c80 = <s1>Järgmine</s1>contact-schedule
