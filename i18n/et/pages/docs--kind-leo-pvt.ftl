# docs--kind-leo-pvt: translations (et)

# text
seg-7f5ad6ab8c23 = GPS

# text
seg-b054c73f22e5 = väärtus puudub

# text
seg-cb91473bfdda = Teemaleht: <a1>LEO-PNT.md</a1>

# text
seg-a849735fcc6e = Teemaleht: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-49964654d5f4 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Madala Maa orbiidi navigatsioon</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README peatükk Evidence).

# text
seg-c5478f572d21 = Perekonna leht: <a1>Madala Maa orbiidi navigatsioon</a1>

# text
seg-be21370c2446 = ühine

# text
# c1: docs/kinds/by-kind/leo-pvt.md
seg-dfe64e82e4e9 = Allikas: <c1/>

# text
# c1: leo-pvt
seg-fdba999dab11 = <c1/> (stsenaariumi liik)

# text
seg-093aac4b5ff1 = Ühendatud keskmise Maa orbiidi (MEO) ja madala Maa orbiidi (LEO) positsioneerimine, navigatsioon ja aeg (PNT) MIS TAHES konstellatsioonide üle: iga [[system]] on liigi constellation-design GNSS eelseade, LEO eelseade (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, atomic-zero-clock efemeriidimudel või mõni muu eelseadefail, igaüks oma failis, allikad märgitud PUBLIC, WORKSHOP või DERIVED), Walkeri kihid või selged elemendikomplektid, koos kandja, kiibisageduse, kandja ja mürategiheduse (C/N0) ümbrisega elevatsioonimaskist seniidini, signaal-ruumis vahemaaveaga (SISRE), Doppleri sigma ja kellamudeliga (oma vastuvõtjakell, nii et süsteemidevaheline nihe hinnatakse, või teada edastatud nihe). Neli režiimi. DOPPLER: kobar-Gaussi-Newtoni positsioneerimine vahemaa muutumiskiirusest analüütiliste osatuletistega, kellatriivi ja valikuliste kiiruse olekute ning valikulise kõrguspiiranguga, ühe- või mitme satelliidiga, viga akna pikkuse suhtes, iga LEO süsteemi Doppleri, Doppleri kiiruse ja tõmbe ümbris ning ühe läbilennu piki- ja ristisuunaline täpsus ristisuunalise nihke suhtes (ristisuunaline viga kasvab piiramatult, kui läbilend läheb pea kohale; ühel läbilennul on ka peeglilahendus üle maapinna jälje). Siin käitub ainult Doppleril põhinev võimaluse signaal (starlink-sop). JOINT: epohhipõhised kaalutud vähimruutude pseudovahemaa fikseeringud ainult GNSS-ist, ainult LEO-st ja mõlemast, mõõtmispõhised sigmad viivitussilmuse soojusmüra mudelist C/N0 juures pluss SISRE (või fikseeritud sigma, nii et signaalimudel saab neid toita), hinnatud süsteemidevahelised nihked ning PDOP/HDOP/VDOP lisatud LEO satelliitide arvu suhtes. POLAR: nähtavad satelliidid ja DOP laiuskraadi suhtes GNSS-i, LEO ja mõlema jaoks. TIMING: aja edastamine koordineeritud ülemaailmsele ajale (UTC) LEO satelliitidelt teadaoleval asukohal kahe olekuga kellafiltriga, mille protsessimüra tuleb mootori ostsillaatoriklassidest, C/N0 ja ostsillaatori suhtes, ning IS-GPS-200 süsteemiaja ja UTC avaldis; koos [timing] trace = true esitab iga rida ka oma ajavea ja ennustatud sigma igal epohhil. VALIDATED: pea kohalt horisondini läbilennu suurim Doppler avaldatud Iridiumi (kuni { "36" } kHz) ja Xona Pulsar X1 ({ "32" } kuni { "34" } kHz) arvude vastu. MODELLED: kõik muu; DOP-i kontrollitakse käsitsi tuletatud juhtumi vastu, fikseeringuid nende kovariatsiooni vastu ja Doppleri mudelit vahemaa kiirenduse samasuse vastu.

# text
# c1: scenarios/leo-pvt-fjord-skyline.toml
seg-f34d4bbcac4d = Ühe <c1/> käivituse kokkuvõte: LEO PVT (ühine) asukohas { "61.10" }, { "6.60" } { "1800" } s jooksul GPS gnss { "24" } sat kõrgusel { "20182" } km, { "1575.42" } MHz Galileo gnss { "24" } sat kõrgusel { "23222" } km, { "1575.42" } MHz Pulsar X5 leo { "258" } sat kõrgusel { "1080" } km, { "1190.52" } MHz LEO ulatuse mõõtmise satelliit nähtaval { "100.0" }% epohhidest ainult GNSS kättesaadavus { "1.000" }, mediaan-PDOP { "1.48" }, RMS 3D viga { "1.29" } m ainult LEO kättesaadavus { "1.000" }, mediaan-PDOP { "2.33" }, RMS 3D viga { "0.69" } m ühendatud kättesaadavus { "1.000" }, mediaan-PDOP { "1.14" }, RMS 3D viga { "0.63" } m

# text
# c1: mode
# c2: seed
# c3: duration_s
# c4: step_s
# c5: user
# c6: dll
# c7: doppler
# c8: joint
# c9: polar
# c10: timing
# c11: system
# c12: skyline
seg-e271a69236bf = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: scenarios/leo-pvt-fjord-skyline.toml
seg-f850cba7d96e = Näide <c1/> määrab muu hulgas:

# text
seg-bb3b3e8be839 = fjord

# text
# c1: scenarios/
seg-99a3c57c7926 = { "7" } kaasasolevat stsenaariumi kasutavad seda liiki; ülejäänud on kataloogis <a1><c1/></a1>.

# text
seg-b43a7ee40372 = Tulemuse silt (mootori oma): MODELLED ühine kaalutud vähimruutude pseudovahemaa positsioneerimine ühe kellaga süsteemi kohta või teadaoleva nihkega; müra viivitussilmuse mudelist C/N0 ümbrise juures pluss signaal-ruumis vahemaaviga

# attr:alt
seg-90361a6f4e3c = Mootori joonistatud diagramm failile scenarios/leo-pvt-fjord-skyline.toml, liik leo-pvt

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: <a1>kontrollimaatriksi</a1> read, mis nimetavad seda liiki.

# text
seg-68aa305e05a4 = <b>VALIDATED</b> Satelliidi täpne vahemaa muutumiskiirus, mille Maaga seotud asukoht ja kiirus tulevad kahe keha orbiidist sekulaarse J2 triivi ja Maa pöörlemisega (leo_fusion::geom::EarthOrbit::state, kiirus on asukoha täpne ajatuletis), Testid: <a1>leo_doppler_reference.rs</a1>.

# text
seg-c3ef3e0163f2 = <b>MODELLED</b> Kobar-Gaussi-Newtoni positsioneerimine vahemaa muutumiskiirusest analüütiliste osatuletistega (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), konstantne kasutajakiirus valikuna, kõrguse pseudomõõtmine pinnakasutaja jaoks, summutatud s Testid: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-a4e0166269ea = <b>MODELLED</b> Kaalutud vähimruutude Gaussi-Newtoni fikseeringud mis tahes süsteemide segu üle, üks vastuvõtjakell süsteemi kohta (süsteemidevaheline nihe hinnatakse koos asukohaga) või teada edastatud nihe etalonajaskaalal; mõõtmispõhised sigmad annab Testid: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-5c9f826efbc8 = <b>MODELLED</b> Kellamõõtmised igalt nähtaval LEO satelliidilt teadaoleval asukohal, ühendatud pöördvariatsiooniga pseudovahemaa müramudelist, filtreeritud kahe olekuga (faas, sagedus) Kalmani filtriga, mille protsessimüra on ostsillaatoriklassi w Testid: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-3319b18ac61f = ja veel { "1" } maatriksis.

# text
seg-f6bd93155e41 = <b>MODELLED</b> Kaalutud vähimruutude Gaussi-Newtoni fikseeringud mis tahes süsteemide segu üle, üks vastuvõtjakell süsteemi kohta (süsteemidevaheline nihe hinnatakse koos asukohaga) või teada. Oraakel (sõltumatu etalon) (InternalConsistency): Käsitsi tuletatud nelja satelliidi DOP (üks satelliit seniidis ja kolm horisondil { "120" } kraadi vahega, mille normaalmaatriks pöördub käsitsi), struktuurne samasus, et oma kellaga süsteem ja üks satelliit ei lisa geomeetriat, müravaba asukoha, kella ja nihke taastamine ning algväärtusega (seed) vead kovariatsiooni vastu. Ainult sisemised kontrollid; ei ole võrreldud vastuvõtja väljundiga. { "0.30" } väline võrdlus, leid

# text
seg-4056b0470099 = <b>MODELLED</b> Süsteemist sõltumatud sisendid: iga süsteem on Walkeri kihid, selged elemendid või GNSS eelseade, signaal (kandja, kiibisagedus, ribalaius, vastuvõetud võimsus või C/N0 vahemik. Oraakel (sõltumatu etalon) (InternalConsistency): Viidatud avalike väärtuste ülekanne, kontrollitud struktuuri osas (igal avalikul allikal on URL, Walkeri mustrid jagunevad ühtlaselt, C/N0 vastuvõetud võimsusest üle kT temperatuuril { "290" } K), mitte välise sõltumatu etaloni vastu. Esinduslikud väärtused on nimetatud igas eelseades ja on illustratiivsed

# text
# c1: label
seg-df745ccdaceb = MODELLED ühine kaalutud vähimruutude pseudovahemaa positsioneerimine ühe kellaga süsteemi kohta või teadaoleva nihkega; müra viivitussilmuse mudelist C/N0 ümbrise juures pluss signaal-ruumis vahemaaviga (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-c988291eb41d = MODELLED: kõik muu; DOP-i kontrollitakse käsitsi tuletatud juhtumi vastu, fikseeringuid nende kovariatsiooni vastu ja Doppleri mudelit vahemaa kiirenduse samasuse vastu. (liikide kataloog (<c1/>))

# text
# c1: kshana skyline --preset fjord
seg-be908356ad19 = Horisondiprofiili eelseade on REPRESENTATIVE (päritolu failis docs/SKYLINE.md ja <c1/>): Lääne-Norra sügavate fjordide laiuse ja reljeefi suurusjärk, mitte ühegi fjordi mõõdistus. Ainult otsenähtavus: ei ole difraktsiooni, peegeldust ega otsenähtavuseta vastuvõttu. Eemaldage sektsioon [skyline], et võrrelda lahtise taevaga. MODELLED. (stsenaariumifaili kommentaar, read { "15" } kuni { "18" })

# text
seg-1d0ab26930e1 = Ühine GNSS-i ja LEO pseudovahemaa positsioneerimine süsteemidevaheliste nihete ja signaalipõhiste veamudelitega on MODELLED, mitte valideeritud: kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-35916a8ac93e = Nimetatud LEO PNT süsteemid valikuliste andmeeelseadetena, igaühel oma allikas, on MODELLED, mitte valideeritud: kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-6ac7dcc57b2a = <s1>Eelmine</s1>leo-ppp

# text
seg-458b3eda3250 = <s1>Järgmine</s1>leo-signal
