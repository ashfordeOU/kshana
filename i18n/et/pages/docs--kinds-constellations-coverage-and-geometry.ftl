# docs--kinds-constellations-coverage-and-geometry: translations (et)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Liik

# text
seg-e7dad1a1ecba = Positsioneerimine ümber suvalise Päikesesüsteemi keha: orbiter või pinnaleandur nimega valitud keskkeha ümber (Marss, Kuu, Europa, Ganymedes, Titan ja ülejäänud Päikesesüsteemi kataloog), navigeerides ühesuunaliste pseudovahemaadega keha ümber oleva väikese Walkeri navigatsioonikonstellatsiooni abil (kahe keha orbiidid keha enda J2 sekulaarse triiviga, tundmatu kasutaja kell) ja soovi korral kellavaba süvakosmose kahesuunalise vahemaaga Maalt, mille suund ja kaugus tulevad analüütilisest Päikesesüsteemi efemeriidist igal epohhil. Vaatejooned blokeerib keha keskmine sfäär ja pinnakasutaja vajab ka kõrgusmaski. Epohhi kohta: nähtavad releed, kas Maa on limbuse kohal, ainult konstellatsiooni GDOP ja PDOP (geomeetriline ja positsiooni täpsuse halvenemise tegur), formaalne ühe sigma positsiooni määramatus Maa reaga ja ilma ning algväärtusega (seed) Gauss-Newtoni vähimruutude lahendi viga mõlemal juhul; jooksu üle: kättesaadavus, Maa nähtavus, PDOP-i mediaan, RMS-viga ja formaalse sigma mediaan, pluss Maa ja keha vaheline valguse levimisaeg, edasi-tagasi aeg, Shapiro viivitus ja Päikese nurkkaugus epohhil. MODELLED: releeorbiidid, mürataseme ja hetkeline mõõtemudel on modelleerimisvalikud, mitte missiooni navigatsiooniandmete vastu valideeritud; keha konstandid on body.rs-is viidatud avaldatud väärtused ning Maa geomeetria pärib Päikesesüsteemi efemeriidi sildid.

# attr:alt
seg-6f341acbe994 = Diagramm, mille mootor kirjutab failile scenarios/mars-orbit-pnt.toml, liik body-pnt

# text
seg-de173c9f4034 = Konstellatsiooni kujundus suures mastaabis: Walker DELTA ja Walker STAR mustrid i: T/P/F konventsioonis (sõlmed hajutatud üle { "360" } või { "180" } kraadi, orbiidisisene vahe { "360" }<em>P/T, orbiitidevaheline faasinihe { "360" }</em>F/T), selgesõnalised elementide loendid ja mitme kihiga kujundused, mitu konstellatsiooni ühes jooksus, Maa, Kuu, Marsi või mis tahes muu planeedi, Pluuto või suure kuu ümber, kasutades body-mooduli konstante (samu, mida kasutavad liigid solar-system ja body-pnt). EELSEADISTUSED avaldatud nimielementidest: gps-baseline ja gps-expandable (GPS Standard Positioning Service Performance Standard-i { "24" } pesa ja kuus ees/taga laiendatavat paari, 5. väljaanne { "2020" }, tabelid 3.2-1 kuni 3.2-3), galileo (Walker 24/3/1 kõrgusel { "29 599.801" } km ja { "56" } kraadi, Galileo Open Service Service Definition Document väljaanne { "1.1" } tabelid { "1" } ja { "23" }), beidou ja beidou-meo (Walker 24/3/1 kõrgusel { "21 528" } km ja { "55" } kraadi pluss kolm geostatsionaarset satelliiti pikkuskraadidel { "80" }, { "110.5" } ja { "140" } kraadi E ning kolm kaldus geosünkroonset satelliiti { "55" } kraadi juures, BeiDou Open Service Performance Standard { "3.0" } jaotis { "4.1" }; MEO faas ja { "118" } kraadi E kaldus-geosünkroonse ristumine on modelleeritud, sest standard neid ei väida) ja glonass (24/3/1 kõrgusel { "19 100" } km ja { "64.8" } kraadi GLONASS Interface Control Document väljaande { "5.1" } jaotise { "5.2" } pesavalemist). KATVUS JA TÄPSUSE HALVENEMISE TEGUR: üle laius-/pikkuskraadi ruudustiku ja valimiga akna kõrgusmaskiga, nähtavate satelliitide arv, GDOP, PDOP, HDOP ja VDOP lahtri kohta, kättesaadavus (lahendus PDOP-iga lävel või sellest allpool, vaikimisi { "6" }) lahtri kohta, globaalselt (pindalaga kaalutud) ja halvimas asukohas, ühe vastuvõtja kellaga konstellatsiooni kohta, kui just clock = "common". See skaleerub tuhandete satelliitideni: nähtavus on skalaarkorrutis iga satelliidi katvuse poolnurgaga ja satelliidid jaotatakse epohhi kaupa subsatelliitse laiuskraadi järgi ribadesse, nii et ruudustiku rida testib ainult neid, mis võivad olla nähtaval; aruanne loeb kokku säästetud paaritestid. JSON kannab ruudustikukaarte ja alandatud diskreetimisega satelliidikaupa maapealseid jälgi. VALIDATED: Walkeri generaator Galileo OS SDD tabeli { "23" } ja GLONASS ICD pesavalemi vastu, GPS-i eelseadistus SPS PS tabeli 3.2-1 avaldatud ekvaatoriületuse veeru vastu ning GPS-i baasjoone globaalne HDOP jaotus SPS PS lisa B vastu (mediaan { "0.94" }, { "95" }% { "1.25" }, keskmine { "0.96" }, tolerants { "0.03" }). MODELLED: kahe keha orbiidid valikulise sekulaarse J2-ga, sfääriline keha, ainult geomeetriline nähtavus (signaali võimsust, tervist ega maastikku ei ole) ning erinevate süsteemide suhteline faas, mis ei ole ühegi tegeliku kuupäeva hetktõmmis.

# attr:alt
seg-899e728ad9bd = Diagramm, mille mootor kirjutab failile scenarios/leo-pnt-mega-shell.toml, liik constellation-design

# text
# c1: tle
# c2: orbit
# c3: epoch
# c4: tle
# c5: tle
# c6: epoch
seg-24266bc264df = Efemeriid ja maapinnatrajektoor: levita üks satelliit (TLE→SGP4 või analüütiline orbiit) ja väljasta selle TEME/GCRS olek (positsioon + kiirus), ITRF/ECEF positsioon, WGS-84 subsatelliitne laius/pikkus/kõrgus ning sammu kohta jaama az/el/vahemaa + vahemaakiirus (Doppler). Satelliit tuleb väljalt <c1/> või analüütilisest <c2/>-st koos selle <c3/>-ga (<c4/> võidab, kui antud on mõlemad); väljaga <c5/> asendab <c6/> TLE enda epohhi kui t = { "0" }.

# attr:alt
seg-0fd3c58fde09 = Diagramm, mille mootor kirjutab failile scenarios/ephemeris.toml, liik ephemeris

# text
seg-3f749aef8d89 = Kaugkosmose Marsi PNT: simuleeritud MARCONI releekonstellatsioon (areostatsionaarsed + kaldega releed, mis edastavad ühesuunaliselt + releestavad kahesuunaliselt kaugkosmose jaamale) navigeerib etalonkasutajat (transfer | lmo | surface) ühise ühe-/kahesuunalise radiomeetrilise liitmise hindaja kaudu. Esitab epohhipõhise geomeetria/nähtavuse, saavutatud RMS-i tõe suhtes ja formaalse kovariatsiooni (1σ / 3σ asukoht) — aus simuleeritud kvaliteedinäitaja, MITTE sertifitseeritud kaitsetase.

# attr:alt
seg-c564dca90854 = Mootori joonistatud diagramm failile scenarios/mars-pnt-lmo.toml, liik mars-pnt

# text
seg-cb4262b66b8f = GNSS-i kättesaadavus + DOP orbitaalsest konstellatsioonist (Walker / TLE / RINEX).

# attr:alt
seg-3b652c0da6de = Diagramm, mille mootor kirjutab failile scenarios/orbit-rinex.toml, liik orbit

# text
seg-a4bdfc291fce = Maajaama läbimiste ennustus: ringorbiidi ajaplaanilised nähtavusläbimised (AOS/TCA/LOS, maksimaalne näiv tõusunurk, kestus), SGP4 keskmiste elementidena akna alguses, jaama kohal üle tõusunurga maski kogu akna jooksul, koos kogu juurdepääsuajaga. SGP4/SDP4 propageerimine IAU 2006/2000A Maaga seotud tugisüsteemis (valikuline UT1 - UTC ja poolusliikumine), ITU-R P.834-9 troposfääri murdumine ja allalingi valguse levimisaeg (mõlemad vaikimisi sees), ületused lahendatud täpsusega { "1e-7" } s ja kulminatsioon kuldlõike otsinguga. Läbimise geomeetria on VALIDATED Orekit { "13.1.8" } vastu merepinna kõrgusel asuvates jaamades; stsenaariumi orbiit ja jaam on illustratiivsed sisendid.

# attr:alt
seg-a09be8c586e3 = Diagramm, mille mootor kirjutab failile scenarios/passes.toml, liik passes

# text
seg-0549bc926a9b = Kogu Päikesesüsteem ühel epohhil, PNT-d (positsioneerimine, navigatsioon ja aeg) silmas pidades mis tahes keha ümber. Päikese, kaheksa planeedi, Pluuto, Kuu, Phobose, Deimose, Io, Europa, Ganymedese, Callisto ja Titani kohta annab see aru heliotsentrilisest asukohast ja kiirusest ICRF-is (International Celestial Reference Frame, ekvatoriaalne J2000), heliotsentrilisest kaugusest ning J2000 ekliptika pikkuskraadist ja laiuskraadist, gravitatsiooniparameetrist, ekvatoriaalsest ja keskmisest raadiusest, J2-st, kus see on avaldatud, ja selle tugiraadiusest, sideraalsest pöörlemisperioodist, IAU poolusest ja nullmeridiaanist epohhil, ühe tiiru jooksul valimisse võetud orbiiditrajektoorist (planeetidel heliotsentriline, kuudel emakeha-tsentriline) ning vaatleja keha (vaikimisi Maa) suhtes valguse levimisajast, ühe- ja kahesuunalisest kaugusest, Päikese Shapiro viivitusest ja Päikese nurkkaugusest; lisa from/to lingid saavad sama kohtlemise. Asukohad: Standishi ja Williamsi JPL-i Kepleri elemendid (tabel { "1" } aastatele { "1800" } pKr kuni { "2050" } pKr, tabelid 2a/2b aastatele { "3000" } eKr kuni { "3000" } pKr) iga planeedi nimiveaga, Montenbrucki ja Gilli Kuu rida Maa–Kuu jaotuse jaoks, JPL-i keskmised elemendid IAU sünkroonse pöörlemiskiirusega Marsi ja Galilei kuude jaoks ning IAU pöörlemismudel Titani jaoks. Valguse levimisaeg: radiomeetriline kinnispunkti lahendus, saatja oma hilinenud asukohas; Newtoni, Shapiro viivitus esitatud eraldi. VALIDATED JPL Horizonsi (DE441) vastu kuni kahekordse nimiveani: Merkuur kuni Saturn ja Maa tabelist { "1" } (halvim { "1.87" } korda nimiviga) ja kõik kaheksa planeeti tabelitest 2a/2b (halvim { "1.71" } korda) ning Maa–Marsi ja Maa–Jupiteri valguse levimisaeg. MODELLED, iga rida sildistatud: Uraan ja Neptuun tabelist { "1" } ({ "2.0" } ja { "5.2" } korda nimiviga DE441 vastu), Pluuto ({ "1992" }. aasta rida; viga pole esitatud), Kuu ja seitse kuud (mõõdetud Horizonsi vastu, avaldatud piiri pole).

# attr:alt
seg-537aa8010e50 = Diagramm, mille mootor kirjutab failile scenarios/solar-system-tour.toml, liik solar-system

# text
seg-4e31c8daf798 = Register (ledger)

# text
# c1: docs/kinds/constellations-coverage-and-geometry.md
seg-44bbec836934 = Allikas: <c1/>

# text
seg-34a6079984a7 = Konstellatsioonid, katvus ja geomeetria (stsenaariumi liikide perekond)

# text
seg-6800289a282d = { "7" } stsenaariumi liiki mootorist v{ $version }. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
# c1: kshana scenarios/orbit-gnss-challenged.toml
seg-d95cc2c1e798 = Teemalehed: <a1>CONSTELLATION-DESIGN</a1>, <a2>COVERAGE</a2>, <a3>SOLAR-SYSTEM</a3>, <a4>SKYLINE</a4>. Käivita üks: <c1/>. Kõik perekonnad: <a5>KINDS.md</a5>.

# attr:alt
seg-f044822c2fab = Kontaktlehe pilt diagrammidest, mille mootor kirjutab perekonna Konstellatsioonid, katvus ja geomeetria liikide jaoks

# text
seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

# text
seg-e2450f89bcc6 = Efemeriid ja maapealne jälg: ühe satelliidi propageerimine (TLE→SGP4 või analüütiline orbiit) ning selle TEME/GCRS oleku (asukoht + kiirus), ITRF/ECEF asukoha, WGS-84 alamsatelliidi laiuse/pikkuse/kõrguse ja sammu kohta väljastamine st

# text
seg-d021c1b23dbc = Konstellatsiooni kujundus suures mastaabis: Walker DELTA ja Walker STAR mustrid i: T/P/F konventsioonis (sõlmed hajutatud üle { "360" } või { "180" } kraadi, orbiidisisene vahe { "360" }<em>P/T, orbiitidevaheline faasinihe { "360" }</em>F/T), selgesõnalised

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
seg-f6914ea43dba = Kogu Päikesesüsteem ühel epohhil, PNT-d (positsioneerimine, navigatsioon ja aeg) silmas pidades mis tahes keha ümber.

# text
seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

# text
seg-d71a07d8a59e = Positsioneerimine mis tahes Päikesesüsteemi keha ümber: orbiiter või pinnal asuv maandur nime järgi valitud kesksekeha ümber (Marss, Kuu, Europa, Ganymedes, Titan ja ülejäänud Päikesesüsteemi kataloog), navi

# text
seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

# text
seg-f6b22521b4a4 = Sügavkosmose Marsi PNT: simuleeritud MARCONI releekonstellatsioon (areostatsionaarsed + kaldus releed, mis edastavad ühesuunaliselt + releeravad kahesuunaliselt sügavkosmose jaamale) navigeerib etalonkasutajat (ülekanne / l

# text
seg-cc85d9962c25 = Maajaama läbimiste ennustus: ringorbiidi ajaplaanilised nähtavusläbimised (AOS/TCA/LOS, maksimaalne näiv tõusunurk, kestus), SGP4 keskmiste elementidena akna alguses, jaama kohal üle

# text
seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

# text
# c1: seed
# c2: threshold_ns
# c3: mask_deg
# c4: time
# c5: user|user_site
# c6: constellation
# c7: clock_quantum
# c8: clock_classical
# c9: sigma_uere_m
# c10: constellations
# c11: epoch
# c12: export_sp3
# c13: export_omm
# c14: export_oem
# c15: skyline
seg-a7bd3325080c = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>. Valikulised: <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-5e8a5e611ba9 = <b>Register (ledger):</b> MODELLED { "4" } · VALIDATED { "4" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>orbit</a1>.

# text
# c1: tle|orbit+epoch
# c2: step_s
# c3: duration_s
# c4: station
# c5: dut1_s
# c6: xp_arcsec
# c7: yp_arcsec
# c8: carrier_hz
# c9: eop_finals2000a
seg-968c1512151e = Kohustuslikud väljad: <c1/>. Valikulised: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

# text
seg-8c5e41cef6fd = <b>Register (ledger):</b> VALIDATED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>ephemeris</a1>.

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
seg-47aaf1afd6ec = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-bacf2a133146 = <b>Register (ledger):</b> MODELLED { "1" } · VALIDATED { "2" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>constellation-design</a1>.

# text
# c1: epoch
# c2: epoch_jd_tdb
# c3: bodies
# c4: observer
# c5: track_points
# c6: table
# c7: links
seg-e99c2a83034e = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-d91ded1df3a2 = <b>Register (ledger):</b> MODELLED { "2" } · VALIDATED { "3" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>solar-system</a1>.

# text
# c1: body
# c2: epoch
# c3: epoch_jd_tdb
# c4: duration_s
# c5: step_s
# c6: seed
# c7: table
# c8: user
# c9: constellation
# c10: earth_link
seg-fe02605b130e = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-12bc4b4b4631 = <b>Register (ledger):</b> MODELLED { "1" } · VALIDATED { "1" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>body-pnt</a1>.

# text
# c1: user
# c2: clock_class
# c3: step_s
# c4: duration_s
# c5: nmax
# c6: range_sigma_m
# c7: doppler_sigma_mps
# c8: dynamic_tightness
# c9: two_way_period_s
# c10: seed
seg-bee590b4c9e7 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-c0394ad71cfe = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>mars-pnt</a1>.

# text
# c1: altitude_km
# c2: inclination_deg
# c3: raan_deg
# c4: arg_lat_deg
# c5: station_lat_deg
# c6: station_lon_deg
# c7: station_alt_m
# c8: epoch
# c9: mask_deg
# c10: duration_hours
# c11: step_s
# c12: refraction
# c13: light_time
# c14: ut1_minus_utc_s
# c15: xp_arcsec
# c16: yp_arcsec
seg-352823f8c5ac = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-bb4fa18e50a6 = <b>Register (ledger):</b> MODELLED { "2" } · VALIDATED { "2" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>passes</a1>.

# text
seg-490ec99e2a38 = <s1>Eelmine</s1>Kellad, ajastus ja holdover

# text
seg-90ff7426b999 = <s1>Järgmine</s1>GNSS-i mõõtmised, positsioneerimine ja terviklikkus
