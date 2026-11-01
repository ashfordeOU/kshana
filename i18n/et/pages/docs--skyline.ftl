# docs--skyline: translations (et)

# text
seg-f917e7fcac09 = Mis see on

# text
seg-6c6e7248496f = Taeva geomeetria

# text
seg-379f49bff6fb = Python

# text
seg-2bd2101ce454 = Pind

# text
seg-ad856ad710eb = Staatus

# text
seg-cbf0f9bcd2d8 = Sõltumatu etalon

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-c14b8fe46517 = Asimuudist sõltuv skyline'i mask: nähtav hulk, asimuut ja tõusunurk ning DOP maski all

# text
seg-bbb1828b3db1 = Tänavakanjoni, sektori ja maastiku taandamine tabeliks

# text
seg-2c53381d48ae = Horisontaalne veaellips ja süsteemikohane kofaktor geomeetria kovariatsioonist

# text
seg-de6c33774c9c = CLI

# text
seg-d1e9715513b4 = Näide

# text
seg-587beeccaa11 = Eelseade

# text
seg-98f4f946a7ac = WASM

# text
seg-b03d56f501c3 = Liik

# text
seg-4dbf41c0ec3b = Funktsioon

# text
seg-2b0d77219437 = Eelseadistused

# text
seg-7338b6210228 = Rida

# text
seg-6317db731879 = Kirjeldus

# text
# c1: docs/SKYLINE.md
seg-be2f66de7d07 = Allikas: <c1/>

# text
seg-3cb660ef6b03 = Horisondimaskid ja taevageomeetria

# text
# c1: mask_deg
# c2: docs/design/2026-10-12-geometry-and-skyline-design.md
seg-724f72bdfa36 = Kuni { "0.36" } oli iga Maa nähtavuse test mootoris üks kõrgusnurga piir, <c1/>: satelliit loeti arvesse, kui see oli sellel numbril või kõrgemal, olenemata suunast. Tänav, kai, fjord või kraana varjab osa taevast ja jätab ülejäänu lahtiseks. <b>Horisondijoon</b> on kõrguspiir, mis sõltub asimuudist; <b>taevageomeetria funktsioonid</b> muudavad asukoha, aja, konstellatsioonid ja horisondijoone nähtavaks hulgaks, täpsuse halvenemise teguriks (DOP), geomeetria kovariatsiooniks, horisontaalseks veaellipsiks, Monte Carlo pilveks ja taevakaardiks. Kavand on <c2/> (punktid { "1" } ja { "2" }).

# text
seg-4c1bc0b37f54 = Tõendid: maskeeritud nähtavusotsus (geodeetilised vaatenurgad, tabelmask, nähtav hulk ja selle DOP) on <b>VALIDATED</b> Orekit { "12.2" } ja gnss_lib_py { "1.0.4" } vastu eelregistreeritud võrdluses, nagu ka veaellips ja süsteemipõhine kofaktor (numpy, eelregistreeritud); kanjoni-, sektori- ja maastikukärped, eelseaded ja ülejäänud taevageomeetria funktsioonid on <b>MODELLED</b> (<a1>Tõendid</a1>). Horisondijoon eemaldab nähtavuse sirgel olevad satelliidid ja mitte midagi enamat. Eelseaded on REPRESENTATIVE geomeetriad, mitte mõõdistused.

# text
seg-6fa3291b70e3 = Horisondijoon

# text
# c1: [0, 90)
seg-08585dd55bb5 = Horisondijoon on nelja kirelduse punktiviisiline maksimum. Asimuut on kraadid päripäeva tõelisest põhjast asukoha lokaalses ida-põhja-üles teljestikus; kõrgused on ühikus <c1/>.

# text
seg-9d0e2b0a469f = TOML

# text
seg-3dbc7ff9f5ab = Tabel

# text
# c1: [0, 360)
seg-a67486e7d10e = Kõrgused on asimuudi suhtes lineaarselt interpoleeritud ja ümber keeratud kohal { "360" }°. Asimuudid on rangelt kasvavad väljal <c1/>; kuni { "3600" } rida.

# text
seg-bc12ba94381f = Tänavakanjon

# text
seg-23066e2eb509 = Kaks sirget paralleelset seina (allpool).

# attr:aria-label, text
seg-821762272e2f = Sektorid

# text
# c1: az_from
# c2: az_to
seg-7387a718a7c3 = Teravate servadega vahemikud päripäeva alates <c1/> (kaasa arvatud) kuni <c2/> (välja arvatud), mis võivad põhja kaudu ümber keerata; kuni { "360" }.

# text
seg-2768e3772b56 = Maastik

# text
# c1: atan((height_m − d²/(2 R_eff)) / d)
# c2: R_eff = 4/3 × 6371 km
# c3: height_m
seg-5a5c08a77b86 = Punktid taandatud tabeliks: kõrgusnurk <c1/>, koos kõveruse languga väärtuse <c2/> jaoks (valitud, esitatud konstant). <c3/> on antenni kohal.

# text
# c1: preset = "<name>"
# c2: table
# c3: sectors
# c4: terrain
seg-fb86c0db0c90 = <c1/> algab nimetatud geomeetriast; kanjoni väljad alistavad seejärel eelseade kanjoni välja väljahaaval ning <c2/>, <c3/> ja <c4/> lisavad sellele.

# text
# c1: mask_deg
# c2: az
# c3: max(mask_deg, skyline(az))
# c4: >=
# c5: mask_deg
seg-0d76504a1d74 = Vastuvõtja <c1/> säilitab oma tähenduse: see on tasane horisondijoon. Efektiivne piir asimuudil <c2/> on <c3/> ja satelliit on nähtav, kui selle kõrgusnurk on <b>sellega võrdne või suurem</b>: sama <c4/>, mida tasane mask alati kasutas. Satelliit, mis on kohal <c5/>, kuid horisondijoonest allpool, on <b>horisondijoone poolt maskeeritud</b>.

# text
seg-f7fd13e569e3 = Tänavakanjon

# text
# c1: s
# c2: w
# c3: a
# c4: az
# c5: θ = az − s
# c6: d(az) = (w/2) / |sin θ|
# c7: h
seg-290f563c1ff7 = Tänav kulgeb piki asimuuti <c1/>, seinte vahel <c2/> meetrit, antenn <c3/> meetri kõrgusel keskjoonel. Piki asimuuti <c4/>, väärtusega <c5/>, jõuab kiir seinani pärast <c6/>, nii et kõrgusega <c7/> sein lõikab piiri

# text
# c1: length_m = L
# c2: d(az) · |cos θ| > L/2
# c3: antenna_m
# c4: width_m
seg-8662708f4f32 = Avatud riba on tänava suunas. Väärtusega <c1/> (antenn keskel) väljub kiir läbi avatud otsa ja sein ei lõika midagi, kui <c2/>. Sein, mis pole antennist kõrgem, ei lõika midagi. <c3/> vaikeväärtus on { "1.5" } m (auto katus või käeshoitav vastuvõtja, esitatud valik); uus kanjon vajab <c4/>.

# text
# c1: kshana skyline --preset <name>
seg-1eeff52ea5a5 = Valitud ja esitatud mõõtmed (kavandimärkuse omad), mitte ühegi tegeliku koha mõõdistused. <c1/> trükib ühe koos selle päritolu ja iga kraadi piiriga.

# text
seg-13e8e5460280 = Geomeetria

# text
seg-6d71c5cbe104 = Kanjon: tänav { "0" }°, laius { "20" } m, seinad { "30" } m ja { "30" } m, antenn { "1.5" } m. { "70.7" }° risti tänavaga, tänava suunas avatud.

# text
seg-ab3415ff8811 = Kõrguse ja laiuse suhe { "1.5" }, tänavakanjonite kujusuhete vahemikus { "0.5" }–{ "2" } allikas Oke ({ "1988" }), <em>Street design and urban canopy layer climate</em>, Energy and Buildings { "11" }, { "103" }–{ "113" }.

# text
seg-e331f02251f8 = Sektorid: mere poole avatud üle { "090" }–{ "270" } ({ "180" }°); kaihooned { "8" }° üle { "315" }–{ "045" } ({ "90" }°); lainemurd ja selle tuli { "3" }° üle { "045" }–{ "090" } ja { "270" }–{ "315" }.

# text
seg-6926e1bfc55d = Esitatud valikud (näiteks { "40" } m laohooned umbes { "285" } m kaugusel).

# text
# c1: 1500/|sin az|
seg-f13d4df9a42c = Maastik: seinad { "600" } m antenni kohal { "1500" } m kaugusel põhja-lõuna suunalise kanali mõlemal küljel, üks punkt kraadi kohta (väärtusel <c1/> m), kõveruse langus rakendatud. { "21.8" }° risti, alla { "1" }° piki telge.

# text
seg-4d3dedbe4491 = Sügavate Lääne-Norra fjordide laiuse ja reljeefi suurusjärk (Holtedahl ({ "1967" }), <em>Notes on the formation of fjords and fjord-valleys</em>, Geografiska Annaler 49A, { "193" }–{ "203" }).

# text
seg-51f5219cb050 = Sektorid: konteinerivirnad { "12" }° maa poole jääval poolel { "000" }–{ "180" }; kraanade noolad { "35" }° üle { "245" }–{ "255" } ja { "25" }° üle { "285" }–{ "295" }; mujal veele avatud.

# text
seg-a568ae949c3b = Viis ISO { "668" } high-cube konteinerit ({ "14.5" } m) umbes { "60" } m kaugusel antennist, mis on { "2" } m kõrgusel; nool umbes { "50" } m kai kohal kaugustel { "70" } m ja { "100" } m, post-Panamax kraana suurusjärk. Kraanasektor on läbipaistmatu.

# text
seg-65b1b45c787f = Stsenaariumis

# text
# c1: [skyline]
seg-e489759bbd65 = Valikuline jaotis <c1/>, liigi enda piiri kohal:

# text
seg-f98345079e70 = Mida horisondijoon muudab

# text
seg-cbe2f5ae721f = Valimi kohta

# text
# c1: orbit
# c2: user_site
seg-7368ea5c4b79 = <c1/> (koos väljaga <c2/>)

# text
seg-fde216d940fb = Nähtavuse ajajoon (GNSS kättesaadavus) ja DOP kokkuvõte.

# text
# c1: integrity
# c2: user_site
seg-7f6b2fcda681 = <c1/> (koos väljaga <c2/>)

# text
# c1: araim_dual
seg-8fafdb892253 = Satelliidid, mida RAIM ja ARAIM (<c1/>) kasutavad.

# text
seg-c0156fd1c895 = Satelliidid, mille pseudovahemaad simuleeritakse ja mida RAIM kasutab.

# text
seg-d7fa5e5cf33d = Satelliidid, mida vastuvõtja suudab jälgida, enne segajat.

# text
seg-86caf3ae19ad = Iga režiimi nähtavushulk iga süsteemi enda maski kohal, polaarlaotus kaasa arvatud (sama horisondijoon igal asukohal). Doppleri režiimi mähisjoon ja kavandatud üksikläbilend on piirid sellele, mida vastuvõtja peab käsitlema, ning säilitavad iga süsteemi maski.

# text
seg-20d2e86d17bc = Millised epohhid loetakse maski kohal olevaks, maski kohal oldud aeg, GNSS võrdluse satelliidid.

# text
# c1: nmea-scenario
seg-ed5bbd6b2c46 = <c1/> (õppe-NMEA)

# text
seg-d0eb9fd84d24 = Satelliidid väljal GSV ja lahendis. Asimuudid on tõelised suunad, mis on maapinna külge kinnitatud, mitte laeva kurss.

# text
# c1: orbit
# c2: integrity
# c3: user_site = { lat_deg, lon_deg, height_m }
# c4: user
# c5: epoch + t
# c6: t
# c7: epoch
# c8: epoch
# c9: integrity
# c10: user_site
# c11: user
seg-56cc8ae30218 = <b>Liikide <c1/> ja <c2/> maapealne asukoht.</b> Mõlemad liigid modelleerivad orbiidil olevat kasutajat geotsentrilise kõrgusnurga ja Maa suhtes fikseeritud asimuudita, seega võtavad nad horisondijoone vastu ainult kavandimärkuse maapealse asukoha režiimiga: <c3/> väljade <c4/> asemel (täpselt üks kahest). Iga valim on üks absoluutne ajahetk, <c5/>: iga satelliit levitatakse selleni (elemendikomplekti, edastatud efemeriidi või SP3 faili edasiliigutamine toimub selle enda epohhist, Walkeri satelliit loeb <c6/> alates <c7/>) ja pööratakse selle hetkel Maa suhtes fikseerituks, nii et asukoht näeb üht kooskõlalist taevast. <c8/> on orbiidi stsenaariumi enda; selle puudumisel (ja alati liigi <c9/> puhul, millel seda pole) on see uusim epohh nende satelliitide seas, millel see on, või ainult Walkeri mustrite puhul J2000. Kõrgusnurk ja asimuut on geodeetilised (WGS-84). Terviklikkuse liigi ARAIM kaitsetasemete ning Stanfordi vertikaalvea horisontaalne ja vertikaalne jaotus kasutab sama geodeetilist ülesuunda (WGS-84 ellipsoidi normaal, umbes { "0.19" }° geotsentrilisest radiaalist { "45" }° laiuskraadil); hetktõmmise RAIM kasutas seda juba. Liik <c10/> ilma horisondijooneta on tavaline maapealne kasutaja; orbiidil oleva <c11/> tee jääb muutmata.

# text
# c1: [skyline]
# c2: tests/skyline_scenarios.rs
# c3: docs/revisions/STUDIO15-portable-math-rebaseline.md
# c4: [skyline]
# c5: skyline
# c6: masked_by_skyline
seg-fae979b3b96f = <b>Tagasiühilduvus.</b> Ilma jaotiseta <c1/> on stsenaarium bait baidi haaval identne sellega, mida sama mootor andis enne horisondijoone koodi olemasolu: <c2/> kontrollib iga tarnitud stsenaariumi, mis neid liike käivitab, JSON-i, graafikut ja kokkuvõtet ning iga õppestsenaariumi NMEA teksti „{ "0.36" } portable“ baasjoone SHA-256 räsite vastu ({ "0.35.0" } väljalaskekommiti räsid, uuesti baseeritud, kui mootor läks üle portatiivsele matemaatikale, ja hoitud testis kirjena: <c3/>). Tühi jaotis <c4/> ei lõika midagi; tulemus on siis võrdne käivitusega ilma selleta, välja arvatud lisatud plokk <c5/> ja nullist <c6/> arvud.

# text
# c1: user
# c2: user
# c3: user_site
# c4: width_m
# c5: [0, 360)
# c6: [0, 90)
seg-fe88e0ad01e9 = <b>Mida tagasi lükatakse</b>, põhjusega teates: horisondijoon orbiidil olevale <c1/>; <c2/> ja <c3/> koos; tundmatu eelseade; kanjon ilma väljata <c4/>; tabel, mis ei ole väljal <c5/> rangelt kasvav; kõrgusnurk väljaspool <c6/>; tühi sektor; mittepositiivne maastikukaugus; sisend üle piirmäärade; mis tahes tundmatu võti.

# text
# c1: skyline: { source, open_fraction, provenance }
# c2: source
# c3: preset:<name>
# c4: preset:<name>+overrides
# c5: custom
# c6: open_fraction
# c7: max(mask_deg, skyline)
# c8: 1 − sin(cut)
# c9: provenance
# c10: units
seg-d1b10a0c833f = <b>Tulemus</b> saab välja <c1/>, kui jaotis on olemas: <c2/> on <c3/>, <c4/> või <c5/>; <c6/> on ülemise poolsfääri ruuminurga osa kõrgusel <c7/> (väärtuse <c8/> keskmine asimuudi üle: { "1" } nullmaski korral, { "0.5" } tasase { "30" }° piiri korral); <c9/> on eelseade rida või stsenaariumi enda. Ühikud ja päritoluklassid on blokis <c10/>.

# text
# c1: kshana example <name>
seg-0842c1133eb5 = Kaasasolevad näited (<c1/>):

# text
# c1: [skyline]
seg-5f77a52314c7 = Mida see näitab (võrdlemiseks eemalda jaotis <c1/>)

# text
# c1: city-street
seg-523f8c1a7912 = GPS + Galileo väljaku <c1/> põhjas: { "17" } valimist { "289" } säilitab lahendi, mediaan-PDOP { "70.5" } ({ "1.14" } lahtise taeva all).

# text
seg-6c5618dce8ab = Kahe konstellatsiooni ARAIM sadamasse sisenemisel: { "70" } satelliidi-epohhi peidetud, kättesaadavus muutumatu ({ "145" } / { "145" }).

# text
seg-36254db521fd = Pseudovahemaad ja RAIM kail: { "44" } satelliidi-epohhi peidetud; RAIM kättesaadavus { "0.59" } ({ "0.85" } lahtise taeva all).

# text
seg-6b0f8b4c700f = { "2" } W segaja sadamas: { "83" } satelliidi-epohhi peidetud, jälgimine muutumatu (segaja oli need juba võtnud).

# text
seg-22ceab915271 = GPS + Galileo + LEO kiht fjordis: liidetud PDOP mediaan { "1.14" } ({ "0.93" } lahtise taeva all).

# text
# c1: leo-vertical-autonomous-vehicle
# c2: city-street
seg-f940e764e244 = Kanjon <c1/> tasase { "35" }° piirina ja kui <c2/> pööratud auto kursi suunas: { "8" } versus { "4" } kuni { "5" } GPS ja Galileo satelliiti; liidetud keskmine viga { "2.1" } m mõlemal juhul; { "1.5" } m häire { "51" } % ja { "59" } % epohhidest.

# text
# c1: src/geometry.rs
seg-6aa4ec7e4058 = Viis mootori funktsiooni (<c1/>), kõigil pindadel samad:

# text
seg-4d6a793b2794 = Sisend → väljund

# text
# c1: id
# c2: system
# c3: az_deg
# c4: el_deg
# c5: cut_deg
# c6: visible
# c7: masked
# c8: n_visible
# c9: n_masked
# c10: open_fraction
# c11: dop
# c12: tdop_by_clock
# c13: states
# c14: cofactor_enu
# c15: covariance_enu_m2
# c16: ellipse_1sigma
# c17: ellipse
# c18: label
# c19: statement
# c20: advisory
seg-c99f58f1ccd2 = satelliidi kohta <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; <c8/>, <c9/>, <c10/>; <c11/> (GDOP, PDOP, HDOP, VDOP, TDOP, <c12/>); <c13/>, <c14/> (ühikuline dispersioon), <c15/>; <c16/> ja <c17/> nõutud usaldusnivool; <c18/>, <c19/>, <c20/>

# text
# c1: n
# c2: σ_UERE
# c3: seed
# c4: samples_enu_m
# c5: σ_UERE × HDOP
# c6: σ_UERE × PDOP
seg-a5b914aac404 = <c1/> (kuni { "5000" }, sisendi piirmäär) vähimruutude viga sõltumatute Gaussi kaugusvigade korral väärtusega <c2/> ChaCha8 vooust, mille algväärtus (seed) on <c3/>: <c4/>, empiiriline kovariatsioon, horisontaalne ja 3-D RMS koos <c5/> ja <c6/>, { "95" } % ellipsi sisse jääv osa

# text
# c1: open_fraction
seg-f435ee3b8709 = eelseaded koos sildi, kirjelduse, päritolu, iga kraadi piiri ja <c1/>

# text
# c1: source
# c2: provenance
# c3: open_fraction
seg-1937af5fa347 = horisondijoone jaotis, taandatud mootori kasutatavaks 360-kirjeliseks tabeliks, koos <c1/>, <c2/>, <c3/>

# text
seg-f16a1f2de329 = taevakaart staatilise SVG-na (ilma skriptita, ilma välise viiteta, iga sisendsõne on paojadastatud)

# text
seg-c802cf2a2e30 = Päring:

# text
# c1: systems
# c2: constellation-design
# c3: gps-baseline
# c4: galileo
# c5: beidou-meo
# c6: glonass
# c7: xona-pulsar
# c8: iridium-stl
# c9: leo-pvt
# c10: [[system]]
# c11: time_s
# c12: leo-pvt
# c13: "satellites": [{"id": "G05", "system": "GPS", "az_deg": 120, "el_deg": 35}, ...]
# c14: "ecef_m": [x, y, z]
# c15: site
# c16: user_ecef_m
# c17: "common"
# c18: σ_UERE
seg-c3c44c1967ba = <c1/> on mootori konstellatsiooni eelseaded (väljad <c2/> <c3/>, <c4/>, <c5/>, <c6/>, ...; LEO eelseaded <c7/>, <c8/>, ...) või täielik <c9/> <c10/> tabel, levitatud kuni <c11/> (Kepleri, sekulaarse J2-ga, <c12/> ühisrežiimi orbiidid). Nende suhtelised faasid tulevad erinevatest etalonepohhidest, seega on taevas <b>representatiivne geomeetria, mitte selle kuupäeva taevas sellel kohal</b>. Satelliidid võib anda ka otse (või lisaks): <c13/>, või väljadega <c14/> ja <c15/> või <c16/>. Vaikeväärtused: iga süsteemi enda mask ({ "5" }° GNSS, { "10" }° LEO; { "5" }° otse antud satelliitidele), üks vastuvõtja kell süsteemi kohta (<c17/> ühe jagatud kella jaoks), <c18/> { "1" } m (representatiivne kahe sagedusega eelarverida), usaldusnivoo { "0.95" }. Sisendi piirmäärad: kuni { "2000" } satelliiti horisondi kohal (rohkema nõudev süsteemitabel lükatakse tagasi enne ehitamist) ja { "16" } vastuvõtja kella.

# text
seg-6408f9b02ccb = Kuupäevastatud taevas elemendikomplektidest.

# text
# c1: "tle"
# c2: orbit-real-tle
# c3: "epoch"
# c4: time_s
# c5: site
# c6: "epoch"
# c7: 2026-06-07T12:00:00Z
# c8: epoch
# c9: tle
# c10: "tle_system"
# c11: TLE
# c12: sky_source
# c13: sky_statement
seg-7724e4ecafee = <c1/> võtab kaherealise elemendikomplekti teksti (nimerida iga komplekti ees on valikuline; kuni { "4" } MiB, sisendi piirmäär), levitatud mootori SGP4-ga (WGS-72, levitaja, mida <c2/> kasutab) hetkeni <c3/> pluss <c4/>, pööratud Maa suhtes fikseerituks, UT1 võetuna UTC-ks ja ilma poolusliikumiseta, ning vaadatuna kohast <c5/>. <c6/> on UTC ISO { "8601" } (<c7/>) ja kuupäevastab ainult elemendikomplektid (eelseadetel kuupäeva pole, seega lükatakse <c8/> ilma <c9/> tagasi); <c10/> sildistab need süsteemipõhise kella jaoks (vaikimisi <c11/>). Iga tulemus ütleb, millist taevast ta kujutab, väljades <c12/> ja <c13/>:

# text
seg-13a8b4ac40f9 = Taevas

# text
seg-c0bde35f9442 = mootori konstellatsiooni eelseaded: representatiivne geomeetria

# text
seg-d368b50280cc = elemendikomplektid, mis on levitatud esitatud epohhini: taevas, mille need elemendikomplektid sel epohhil annavad, mitte selle mõõtmine (nende enda täpsus on SGP4 oma ja komplektide vanus)

# text
# c1: epoch
# c2: time_s
seg-0bc07825a9b5 = ilma väljata <c1/>: elemendikomplektid, mis on levitatud uusima komplekti enda epohhini pluss <c2/>, representatiivne taevas

# text
seg-1230388da233 = otse antud satelliidid, nagu esitatud

# text
# c1: +
# c2: epoch_utc
# c3: tle_skipped
# c4: systems
seg-1a30004a7f9e = Segu ühendab need väljaga <c1/>. <c2/> on ajahetk, milleni elemendikomplektid levitati, ja <c3/> nimetab, millist osa tekstist ei kasutatud, koos põhjusega: valesti vormistatud või orvuks jäänud elemendikomplekti read (koos nende reanumbritega), komplektid, mille parser tagasi lükkas, ja komplektid, mida SGP4 ei suutnud sellesse ajahetke levitada (lagunenud või oma piiridest väljas); kokku kuni { "100" } kirjet, seejärel üks viimane kirje, mis loendab ülejäänud. Tühi loend <c4/> ei lisa eelseadeid. Taevakaart esitab aluse oma jaluses.

# text
# c1: orbit::cofactor_from_los
# c2: orbit::dop
# c3: orbit::dop_cov
# c4: orbit::dop
# c5: tests/dop_reference.rs
seg-8560c13c7ea3 = <b>Üks tuum.</b> Kofaktormaatriks on <c1/>, kujundusmaatriksi koostamine ja Gauss-Jordani pöördmaatriks väljade <c2/> taga. <c3/> avab kovariatsiooni ja <c4/> on selle taandus, nii et VALIDATED skalaarid on muutumatud ja neid kinnitab endiselt <c5/>. Teist DOP realisatsiooni ei ole.

# text
# c1: k σ √λ
# c2: λ
# c3: k = √(−2 ln(1 − p))
# c4: √5.991 = 2.448
# c5: ½ atan2(2 Q_EN, Q_NN − Q_EE)
# c6: [0, 180)
seg-cb1be3e04419 = <b>Ellips.</b> Pooltelg <c1/> ida-põhja bloki omaväärtustele <c2/>, koos <c3/> (<c4/> { "95" } % juures, { "1" } { "39.35" } % juures) ning peatelje asimuut <c5/> väljal <c6/> põhjast.

# text
seg-96062e2cfed1 = Sisenemispunktid

# text
# c1: kshana sky <request.json|toml>
# c2: kshana sky --site <lat,lon[,h]> (--systems <a,b> | --tle <file>) [--epoch] [--tle-system] [--time] [--mask] [--skyline-preset] [--uere] [--clock]
# c3: --monte-carlo <n> --seed <s>
# c4: --svg
# c5: kshana skyline --preset <name> | --presets | --profile <file>
seg-f8dc86bd9da2 = <c1/> või <c2/>, koos <c3/> või <c4/>; <c5/>

# text
seg-d5b5bdf6081c = Rust

# text
# c1: kshana::geometry::{sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg}
# c2: kshana::surface::*
seg-8d0f99ed4837 = <c1/>, samanimelised <c2/>

# text
seg-40a7552d2ba9 = MCP

# text
# c1: sky_geometry
# c2: request
# c3: skyline_preset
seg-42f0fe3b42ab = <c1/> (<c2/> või <c3/>); MCP kaudu Monte Carlot ei tehta (massvalimid, mida agent peaks kokku võtma, mitte kandma)

# text
# c1: label
# c2: statement
seg-9d04c658b37a = Iga tulemus kannab <c1/> (MODELLED), väljavõtet <c2/> (geomeetria esitatud veamudeli all: sõltumatud, võrdsed, nullkeskmisega Gaussi kaugusvead; mitte vastuvõtja tegeliku vea ennustus, millel on ka kallutused, mitmeteelevi ja otsenähtavuseta vead; mitte terviklikkuse piir) ja nõuannet: <em>Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }): laeva navigeerimise eest vastutab jätkuvalt operaator.</em>

# text
# c1: docs/VERIFICATION-MATRIX.md
seg-0e1285fdfe52 = Viis registri (ledger) rida (<c1/>), nagu kavandimärkus neid piirab:

# text
# c1: TopocentricFrame
# c2: ElevationMask
# c3: get_dop
# c4: xval/orekit-skyline/PREREGISTRATION.md
seg-1aa76286f152 = Orekit { "12.2" } (<c1/> vaatenurgad, <c2/>) koos gnss_lib_py { "1.0.4" } (<c3/> ja DOP maatriks), eelregistreeritud failis <c4/> (commit e4b9d912) enne kummagi käivitamist: { "1173" } vaatenurka kuuel asukohal ja neljal epohhil, kuus tabelit, { "142" } nähtavat hulka; halvim kõrgusnurk { "1.3e-13" }°, asimuut { "2.3e-13" }°, mask { "1.1e-12" }° versus { "1e-9" }°; identsed nähtavad hulgad, ükski pole piiririba sees; DOP { "3.3e-13" } suhteline ja kofaktor { "6.6e-13" } maatriksi skaalast versus { "1e-9" }. Ulatus: tabelmaskid, geodeetilised vaatenurgad, maskeeritud hulk ning selle ühiskella DOP ja kofaktor.

# text
seg-b33828edbe2f = käsitsi arvutatud väärtused; ülaltoodud võrdlus loeb nende tabeleid sisenditena ega kontrolli neid

# text
seg-ca950752be62 = Horisondijoone eelseaded

# text
seg-83946f66ca78 = puudub: valitud, esitatud mõõtmed (kontrollitud ainult iseenda vastu)

# text
# c1: linalg.inv
# c2: linalg.eigh
# c3: xval/numpy-ellipse/PREREGISTRATION.md
seg-ca5db55640a9 = numpy { "2.5.4" } <c1/> ja <c2/> (standardne P2) { "142" } sisse kirjutatud nähtaval hulgal, ühine kell ja üks kell süsteemi kohta, eelregistreeritud failis <c3/> (commit 0bbeeaee): { "270" } juhtu, teljed { "5.1e-13" } suhteline, orientatsioon { "5.3e-12" }°, kofaktor { "1.0e-12" } maatriksi skaalast, versus { "1e-9" } ja { "1e-6" }°

# text
seg-44e5f9ca28f7 = Taevageomeetria funktsioonid

# text
seg-8e3953481bbf = koostis: eelseade levitamine representatiivse taevani, Monte Carlo pilv (kontrollitud geomeetria vastu, mida see valimina võtab), pinnad

# text
# c1: [skyline]
seg-e8eec007c6b9 = Jaotise <c1/> puudumist kontrollitakse bait baidi haaval väljundite { "0.35.0" } vastu, mis näitab tagasiühilduvust ega kinnita midagi. gnss_lib_py rakendab ainult ühte kõrgusnurga maski, seega on see siin DOP-i sõltumatu etalon, mitte maski sõltumatu etalon.

# text
seg-d5894e54715b = Mida horisondijoon ei modelleeri: difraktsioon seina serva kohal, peegeldused ja otsenähtavuseta signaalid, mida tegelik vastuvõtja võib siiski jälgida (need jäetakse välja, mitte ei halvendata), osaline läbipaistvus (võrkkraana on kogu oma sektoris läbipaistmatu), antud punktidest kaugemal olev maastik ning Maa kõverus kanjoni- ja sektorivormides.

# text
seg-745d19d6b35d = <s1>Eelmine</s1>Mere-integratsioonid

# text
seg-bbe8dd07d33b = <s1>Järgmine</s1>Usaldus turvatelemeetriana
