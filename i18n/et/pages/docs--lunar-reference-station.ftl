# docs--lunar-reference-station: translations (et)

# text
seg-f37311ad7ef0 = Väljundid

# text
seg-f63dd3d7aad4 = Allikas

# text
seg-9872e31ebd72 = Allikad

# text
# c1: docs/LUNAR-REFERENCE-STATION.md
seg-38afa54b0306 = Allikas: <c1/>

# text
seg-e8ee3794bac6 = <b>MODELLED.</b> Sätestatud eelduste korral (satelliidikonstellatsioon, selle signaal-ruumis viga, jaama kaardistamistäpsus, korrektsioonide latentsus ja lingi kvantimine, igaüks on sisend, mis on märgitud oma avaliku allikaga või kui ILLUSTRATIVE) annab mudel allpool toodud arvud. Need <b>ei</b> ole väide ühegi tegeliku süsteemi toimivuse kohta. Kshana <b>ei</b> ole seotud ühegi ametiga ega nende heaks kiidetud ning ei esita TRL-i ega lennupärandi väidet. Ainult nõuandev.

# text
seg-22eb5bd00092 = Eesmärk

# text
seg-25678ae41147 = Avalik materjal kirjeldab Kuu lõunapooluse etalonjaama, mis jälgib Kuu navigatsiooniteenust, arvutab kohalikke diferentsiaalkorrektsioone, hoiab Kuu ajaetaloni aatomkellal ning kannab laserretroreflektorit ja VLBI saatjat Kuu tugisüsteemi jaoks (klass, mida avalikult kirjeldatakse ESA NovaMooni kontseptsiooni juures; allikad allpool). Kshana modelleerib juba iga osa eraldi. See uuring koondab need üheks reprodutseeritavaks, avatud analüüsiks selle kohta, mida selline jaam avalikel eeldustel suudaks, ja eelregistreerib selle, et seda saaks hinnata avaldatud tulemuste ja lõpuks lennutulemuste vastu.

# text
# c1: run_toml
# c2: run_scenario
# c3: kind = "lunar-station-coverage"
seg-6ac04119fc30 = või <c1/> Pythonist, WebAssembly'st või MCP serveri <c2/> koos <c3/>.

# text
# c1: lunar-station-coverage
seg-671e68d341fd = Katvuse ja täpsuse kaart (<c1/>)

# text
# c1: lunar-differential-pnt
seg-f034e2642dab = Diferentsiaaletalonjaama jaoks teadaolevas lõunapolaarses asukohas: igas kasutajapunktis ringruudustikul laiuskraadilt { "80" }° S poolusest ja piirkonnas, päeva jooksul epohhide ja Monte Carlo katsete kohta: parandatud ja parandamata asukohavea percentiilid (3-D, horisontaalne, vertikaalne), kättesaadavus koos põhjusega iga kättesaamatu epohhi kohta, katvus enne käivitust sätestatud läve suhtes, DO-229E kaitsetasemed, katvusraadius asimuudisektori kohta ning korrektsioonilingi bilanss jaamas ja halvimas punktis. Uut füüsikat ei ole: see läbib funktsiooni <c1/> testitud funktsioone ja taandub sellele liigile täpselt ühes punktis, ühes epohhis ja ühes katses.

# text
seg-94058315dfe4 = Sisend

# text
seg-7670cf4ceda3 = Vaikeväärtus

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ephemeris_path
seg-98b42925ad5c = Satelliidikonstellatsioon (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) või <c6/>

# text
seg-bfdd053b2611 = puusisene LCNS-klassi komplekt

# text
seg-389db26524b4 = ILLUSTRATIVE kaasasolevas vaikeväärtuses; avalike allikate näide seab neli satelliiti ja { "24" } h perioodi allikatest S2 ja S4, elementide komplekt jääb ILLUSTRATIVE (ükski allikas seda ei esita)

# text
seg-91231bdcc599 = ILLUSTRATIVE

# text
# c1: station_lat_deg
# c2: station_lon_deg
# c3: station_height_m
seg-6b9d48431e4b = Jaam (<c1/>, <c2/>, <c3/>)

# text
seg-fcdb2f3ac330 = { "89" }° S, { "0" }°, { "0" } m

# text
seg-f32dcb376b51 = { "0.30" } m

# text
seg-93d78578585f = ILLUSTRATIVE (puusisene tugisüsteemi realisatsiooni jaotus, ise MODELLED)

# text
# c1: orbit_err_m
# c2: clock_err_m
# c3: sise_sigma_m
# c4: sise_orbit_variance_fraction
seg-59286c0377ce = <c1/>, <c2/> või <c3/> koos <c4/>

# text
seg-fe90a6f490f9 = { "100" } m, { "30" } m (vaatejoone SISE { "65" } m)

# text
# c1: sise_sigma_m
seg-9a432ef35cac = ILLUSTRATIVE kaasasolevas vaikeväärtuses; avalike allikate näide seab <c1/> = { "10" } / { "1.96" } m allikast S4 lk 8

# text
seg-970357ba3630 = { "0" } m, { "10" } s, { "8" } bitti

# text
# c1: grid_lat_max_deg
# c2: grid_lat_step_deg
# c3: points
seg-311a924e2133 = Ruudustik (<c1/>, <c2/>) või <c3/>

# text
seg-49a2022b83c0 = { "80" }° S, { "1" }° ({ "346" } punkti)

# text
seg-e945f5407b12 = uuringupiirkond

# text
# c1: t_start_s
# c2: t_span_s
# c3: t_step_s
# c4: n_trials
seg-fed48a6c31be = Aeg (<c1/>, <c2/>, <c3/>), <c4/>

# text
seg-0fec404c8c7c = { "0" } s, üks päev, { "600" } s, { "200" }

# text
seg-d35d88b0753b = { "20" } m p95 juures kaasasolevas vaikeväärtuses ({ "1" } m avalike allikate näites)

# text
seg-fa7858b14f89 = sätestatud enne käivitust; { "20" } m on ILLUSTRATIVE, mõõdetud vaikeväärtuse illustratiivsete vigade järgi

# text
seg-a6ee5e2a8b61 = { "10" } m

# text
seg-329ad585cd9b = ILLUSTRATIVE: avalikku väärtust ei ole

# text
seg-422a316b806b = { "5" } m, { "1e-4" }, { "42" }

# text
# c1: units
# c2: tests/field_units_global.rs
# c3: availability
# c4: coverage_fraction
# c5: corrected_p_3d_m
# c6: corrected_p_h_m
# c7: corrected_p_v_m
# c8: uncorrected_p_3d_m
# c9: improvement_factor
# c10: hpl_max_m
# c11: vpl_max_m
# c12: hpl_below_alert_fraction
# c13: worst_point
# c14: coverage_radius_km
# c15: points[]
# c16: budget_at_station_and_at_edge
seg-c530b459b0ef = Iga arvväli kannab tulemuse <c1/> plokis ühikut ja päritoluklassi (kontrollib <c2/>). Piirkonna plokk: <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>; <c14/> iga { "30" }° asimuudisektori kohta; <c15/> iga punkti kohta; ja <c16/>.

# text
seg-4aa380258574 = Mida kontrollid suudavad ja ei suuda öelda

# text
# c1: tests/lunar_station_coverage_reference.rs
# c2: lunar-differential-pnt
seg-112cb6bffc03 = <c1/>: taandumine liigile <c2/>, nullbaasi ja kaardistamise põrandad, monotoonsus, kättesaamatuse põhjused, determinism, töökaitse. Need näitavad, et läbivaatus on just see mudel, mida see väidab läbivaatavat.

# text
# c1: tests/lunar_station_numpy_oracle.rs
# c2: tests/fixtures/lunar_station/PREREGISTRATION.md
seg-695ed4f23f3c = <c1/>: aritmeetika sõltumatu numpy ümberarvutus eksporditud juhtumitel, eelregistreeritud enne selle käivitamist. Asukohad ja percentiilid täitsid oma lävendid; jaama korrektsioonid jäid oma lävenditest mööda kahekordse täpsuse ümardamise tõttu (registreeritud koos arvudega failis <c2/>).

# text
seg-be6ecf79d22c = Ükski neist ei kontrolli mudelit. Veamudel, esimese astme dekorrelatsioon, kaardistamise, vananemise ja kvantimise mudelid ning iga lävi on selle projekti enda omad või ILLUSTRATIVE.

# text
seg-d6f194e28401 = Maastiku silmapiirimaskid

# text
# c1: [terrain]
# c2: src/lunar_terrain.rs
# c3: [azimuth_deg, elevation_deg]
# c4: mask_deg
# c5: unavailable.terrain_masked
# c6: user_lt4
seg-9ad9b163a3a0 = MODELLED. Valikuline <c1/> jaotis (<c2/>) annab jaamale ja igale kasutajapunktile oma asimuudist sõltuva silmapiiri formaadis { "0.36" } skyline-tabel (read <c3/>, asimuudis lineaarne, ülemineku ümbermähkimisega kohal { "360" }°). Satelliit loetakse saidil arvesse, kui see on nii <c4/> kui ka oma asimuudi silmapiiri kohal; epohh, mille silmapiir jätab punktis alla nelja satelliidi, kus lame mask annab neli, teatatakse kui <c5/> (<c6/> säilitab oma lameda tähenduse). Kaks allikat, mis kombineeritakse punktiti maksimumina, kui on antud mõlemad:

# text
# c1: station_horizon
# c2: user_horizon
# c3: source
seg-4d55808bc002 = sätestatud profiil, <c1/> või <c2/> (rakendatud igas kasutajapunktis), kummalgi nõutav märgis <c3/>;

# text
# c1: dem_path
# c2: azimuth_step_deg
# c3: max_range_km
# c4: LDEM_75S_240M
# c5: data/lunar-dem/NOTICE.md
seg-d6fda9939caa = silmapiir, mis on kiirjälgimisega (ray-marching) leitud polaarse DEM-i (<c1/>) kohal: Kuu sfääri suurringid täpse kõverusega, sätestatud mastikõrguselt (vaikimisi { "2" } m), iga <c2/> järel (vaikimisi { "1" }°), kuni <c3/> (vaikimisi { "150" } km) või ruudustiku servani. Hoidla sisaldab avaliku omandi LRO LOLA polaarprodukti <c4/> väljalõiget, { "5" } × { "5" } ploki keskmisena ümberproovitud kuni { "1200" } m ja umbes ±{ "420" } km poolusest (<c5/>: allika URL, SHA-256, litsents, väljalõike ja ümberproovimise sammud);

# text
# c1: dem_path
# c2: dem_tile_path
# c3: realdata::lola_dem
# c4: lat_min lat_max lon_min lon_max n_lat n_lon
# c5: terrain.dem_tile
# c6: tests/lunar_station_terrain.rs
seg-292c49f3739a = või, asemel <c1/>, laius-/pikkuskraadi DEM-i plaat (<c2/>) tekstivormingus <c3/> (päis <c4/>, seejärel kõrgused meetrites keskmise sfääri kohal, reajärjestuses), mida jälgitakse kiirega sama moodi, laiuskraadi samm määrab vaikesammu. Aruanne kordab plaadi teed, SHA-256 ja ulatust (<c5/>). Vendoritud väljalõikest ümberproovitud plaat annab jaamale väljalõike enda silmapiiri täpsusega { "0.22" }° (<c6/>). Ühtki plaati ei ole kaasatud.

# text
# c1: moonlight-service-volume
# c2: terrain
# c3: user_horizon
# c4: dem_path
seg-34ed85bb9ac0 = Samu maske rakendatakse <c1/> ruudustikule (<c2/>, <c3/> ja <c4/>; DEM-ist väljapoole jääv ruudustikupunkt säilitab lameda maski ja see loetakse kokku). Ilma jaotiseta on iga dokument baitideni identne jooksuga ilma selleta.

# text
# c1: tests/fixtures/lunar_terrain/PREREGISTRATION.md
seg-8d07f0227ab8 = Kontrollid: kiirjälgimine taastoodab suletud kujuga silmapiirid (paljas sfääri langus, kraater platool selle keskelt ja väljastpoolt, rasterdatud koonus analüütilise koonuse vastu); vendoritud väljalõige on orienteeritud nagu allikas (Shackletoni ja Haworthi põhjad madalal, Malaperti massiiv kõrgel); sõltumatu numpy kiirvise väljalõikel, eelregistreeritud (<c1/>), langeb kokku täpsusega { "5.5e-10" } kraadi viies punktis, mis kontrollib aritmeetikat, mitte maastikku. Ühtki avaldatud polaarset silmapiiri ega valgustatuse arvu ei ole taastoodetud, nii et rida jääb MODELLED (registri rida „Lunar terrain horizon masks from a stated profile or a polar DEM“).

# text
# c1: scenarios/lunar-station-coverage-terrain.toml
seg-10a1d62ab5cc = <c1/> käivitab kaasasolevad sisendid { "2" }° ruudustikul { "100" } katsega ja DEM-i silmapiiriga igas punktis. Jaamakohal ({ "89" }° S, { "0" }° E) on kõrgeim silmapiir umbes { "4.0" }°, alla { "5" }° maski, nii et jaamas maastik ei piira; kasutajapunktides on iga punkti kõrgeima silmapiiri pindalaga kaalutud keskmine { "9.7" }° ja suurim { "26.3" }°. Samade sisendite ja lameda maskiga võrreldes tõuseb piirkonna parandatud p95 3-D viga väärtuselt { "16.3" } m väärtusele { "18.6" } m ja suurim HPL väärtuselt { "480" } m väärtusele { "62" } km. Piirkonna kättesaadavus tõuseb väärtuselt { "91.9" } % väärtusele { "93.0" } %: epohh on kättesaamatu, kui punkt kasutab satelliiti, mida jaam ei näe, ja silmapiir, mis peidab selle satelliidi punkti eest, võib epohhi kättesaadavaks teha.

# text
# c1: moonlight-service-volume
# c2: terrain
# c3: clears_terrain
# c4: export_site_terrain
seg-6d18d8a8dc78 = <b>Maastik ja silmapiiri maskeerimine: käsitletud versioonis { "0.36" }, piirangutega.</b> Sätestatud profiilist või vendoritud LOLA DEM-i väljalõikest tulenevad saidipõhised silmapiirimaskid on modelleeritud (ülal). Mis jääb: vendoritud väljalõige on { "1200" } m piksli kohta, seega siluvad umbes kilomeetrist väiksemad reljeefid ära ja ploki keskmised madaldavad teravaid tippe; kiir, mis väljalõikest lahkub (umbes { "420" } km poolusest), lõpeb seal; difraktsiooni, maastiku mitmeteelevi ega osalist varjestust ei ole; kaugusmõõtmise saitide asukohad jäävad keskmisele sfäärile sätestatud kõrgustel (DEM määrab ainult silmapiiri); silmapiiri ei ole väliste arvude vastu valideeritud. Funktsiooni <c1/> satelliidipõhine eksportsait maskeeritakse nagu ruudustikupunkt: jaotisega <c2/> kannab iga ekspordirida välja <c3/> ja aruanne saidi silmapiiri (<c4/>); antenni kiirekitsa tallide arvestus loeb siiski iga lingi, mis ületab lameda maski.

# text
# c1: [receiver]
# c2: src/lunar_receiver.rs
# c3: a + b exp(-el / el0)
seg-b58b3ff1ef20 = <b>Mitmeteelevi ja vastuvõtja riistvara: käsitletud versioonis { "0.36" } valikulisena, piirangutega.</b> Jaotis <c1/> (<c2/>) lisab kõrgusnurgast sõltuva mitmeteelevi <c3/> kasutajas ja jaamas (DO-229 funktsionaalne vorm; Kuul on iga väärtus ILLUSTRATIVE), jaama mitmeteelevi soovi korral esimese astme Gauss-Markovina epohhide kaupa, early-minus-late DLL koodimüra C/N0-st ja kanalitevahelised nihked kanali kohta. Mis jääb: antenni faasitsentri ja grupiviivituse varieerumist ei modelleerita; ükski Kuu mõõtmine ei fikseeri mitmeteelevi väärtusi; korrektsioonilingi bilansiplokk ei sisalda vastuvõtja liikmeid.

# text
seg-677252c2d3e5 = Efemeriidi vea kasv latentsuse jooksul: käsitletud versioonis { "0.36" } valikulisena, piirangutega.

# text
# c1: orbit_err_growth_m_per_s
# c2: rate x latency / sqrt(3)
# c3: tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md
seg-3af08edab1cc = <c1/> lisab edastatava orbiidi vea lineaarse kasvu vanusega (kauguse 1-sigma <c2/>), külmutatud vea ümberprojitseerimise peale; lineaarne kasv on levitatud olekuvea esimese astme liige (kontrollitud { "1" } % täpsusega kohal { "600" } s puusisese kahe keha levitamise vastu). Mis jääb: ükski avalik allikas ei anna Kuu kasvukiirust (ILLUSTRATIVE); orbiidi suunalist/radiaalset struktuuri ei ole; korrektsioonilingi bilansiplokk kasutab külmutatud mudelit. K5 lisa (<c3/>, eelregistreeritud eraldi) käivitab K5 väärtustel { "0.001" }, { "0.01" } ja { "0.1" } m/s: see ei täida ühelgi juhul ({ "369.8" } m, { "2315" } m, { "22797" } m { "1.5" } m läve vastu), nagu enne käivitust öeldud.

# text
# c1: [solution]
# c2: src/lunar_solution.rs
# c3: trace_case
# c4: tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md
seg-5bba9be34cad = <b>Lahendi stiil (filter, kõrguspiirang, kolm satelliiti): valikuline versioonis { "0.36" }, piirangutega.</b> Jaotis <c1/> (<c2/>) lisab kõrguse pseudomõõtmise, sellega kolme satelliidi miinimumi ja staatilise kasutaja kaalutud vähimruutude akna epohhide kohta (jagatud asukoht, kell epohhi kohta), mis asendab filtrit. Mis jääb: see käsitleb epohhide vigu sõltumatutena, nii et see keskmistub kiiremini kui ajas korreleeritud vead; see on ainult staatilisele kasutajale; dünaamilist filtrit, kandelaine faasi ega täisarvuliste mitmetähenduslikkuste lahendamist ei ole; juhtumi jälg (<c3/>) näitab hetktõmmise aritmeetikat. Avaldatud väidete lisa selle režiimiga on <c4/> (eelregistreeritud eraldi). { "1" } m kõrguspiirangu, kolme satelliidi ja 6-epohhilise aknaga (ILLUSTRATIVE seaded) langeb R300 parandatud p95 3-D viga väärtuselt { "280.6" } m väärtusele { "2.11" } m (horisontaalne { "0.90" } m, ei hinnatud); K1 kuni K5 ei täida endiselt ja K6 täidab, { "1" } { "6" }-st nagu registreeritud käivituses. Akna sõltumatuse eeldus soosib seda.

# text
seg-4f8274f839a7 = Võrdlus avaldatud väidetega

# text
seg-82391b00e1bc = MODELLED. Selle mudeli, mis on käivitatud avalike eelduste järgi, võrdlus väidetega, mida allikad esitavad. See ei ole väide ühegi tegeliku süsteemi toimivuse kohta.

# text
# c1: tests/fixtures/lunar_station/SOURCES.md
seg-fc27b4012f02 = Allikad S1 kuni S5 (pealkiri, URL, hankimise kuupäev, SHA-256, litsents): <c1/>.

# text
# c1: tests/fixtures/lunar_station_published/CLAIMS.md
seg-d866653008e1 = Iga arvuline väide, tsiteeritud koos selle lehekülje ja sätestatud eeldustega ning liigitatud võrreldavaks, osaliselt võrreldavaks või mittevõrreldavaks: <c1/>. Ükski väide ei ole täielikult võrreldav, sest ükski allikas ei esita percentiili ega satelliitide orbiidielemente.

# text
# c1: tests/fixtures/lunar_station_published/PREREGISTRATION.md
# c2: tests/lunar_station_published_oracle.rs
seg-50535c58d3cf = Lävendid, juhtumid ja sisendid, kinnitatud eraldi enne käivitust (redaktsioon { "2" }, 05bf9a19), ja registreeritud käivitus: <c1/>. Järeldus on fikseeritud failis <c2/>.

# text
seg-069a652c402e = lävi

# text
seg-d6120708c062 = väide (allikad)

# text
seg-5b480535b54b = see mudel

# text
seg-6231a005ccc9 = otsus

# text
seg-45dc6ff5d546 = üks jaam annab meetrialuse täpsuse kogu lõunapooluse { "300" } km ringil (S1, S2, S3)

# text
seg-4da98cf6180b = katvus { "0.00" }

# text
seg-70a79ec95bf4 = ei läbinud

# text
seg-cd0e9021aaa3 = sama, { "600" } km ring (S2 lk 10, S3 lk 23)

# text
seg-ef9f2ee31c52 = meetrialune koodikorrektsioonidega (S1, S2)

# text
seg-9f4e2b6991e8 = parandatud p95 3-D { "280.6" } m

# text
seg-ac3c99ec0d15 = <= { "1.5" } m

# text
seg-1b720f1677cc = „detsimeetritase“ pseudovahemaa korrektsioonidest (S3 lk 22, S5 lk 5)

# text
seg-ffa1c831a14f = { "280.6" } m

# text
seg-70368d910820 = <= { "0.15" } m

# text
seg-786f940b345e = ei läbinud (ei oleks saanud läbida allikate { "0.30" } m koodimüra korral)

# text
seg-da761dde1cae = meetrialune säilib { "600" } s latentsuse korral (S2 lk 16)

# text
seg-2a9db96bd87f = { "293.0" } m

# text
seg-021336eb5623 = sama täpsus baasjoone pikkusel { "10" } km kuni { "500" } km (S2 lk 17)

# text
seg-62190343777c = suhe { "1.39" }

# text
seg-7a33a168b020 = läbis

# text
seg-e666f1eb7a59 = { "1" } { "6" } lävendist läbitakse. Põhjus on geomeetria. Ükski allikas ei avalda satelliidikonstellatsiooni orbiidielemente. ILLUSTRATIVE puusiseste elementide korral jagavad kasutaja ja jaam nelja satelliiti üle { "5" } kraadi ainult { "8" } % ({ "300" } km) ja { "6" } % ({ "600" } km) epohhidest, peaaegu singulaarse geomeetria juures: parandamata p95 on { "3.8" } km, kus allikad toovad < { "10" } m. Allikate enda simulatsioonid kasutasid filtrit, kõrguspiirangut ja kolme satelliiti ühises nähtavuses, mida see hetktõmmise mudel ei sisalda. Käivitus ei taasta seetõttu väiteid nende elementide korral ning see ei ole tõend, et väited on valed. K6 läbimine on kahe geomeetriadominantse arvu suhe ega ütle midagi dekorrelatsiooni kohta. Avaldatud konstellatsiooni elementide komplekt hinnataks samade lävenditega teise, kuupäevastatud käivitusena.

# text
seg-1da5fcf7bbf5 = Eelregistreeritud ennustus

# text
# c1: c05dac1d
# c2: docs/predictions/lunar-reference-station.md
# c3: tests/prediction_frozen.rs
seg-4ea806a57380 = Eelregistreeritud ennustus, külmutatud commit-il <c1/> avalike allikate sisenditel, koos selle hindamisprotokolliga: <a1><c2/></a1>. See on ennustus, mitte valideerimine, ja iga selles olev arv on domineeritud nelja satelliidi konstellatsiooni avaldamata elementide komplekti poolt (kasutatud elemendid on ILLUSTRATIVE): { "80" } kraadi S piirkonnas kättesaadavus { "8.2" } %, parandatud p95 3-D { "280" } m, parandamata { "3.8" } km. MODELLED; <c3/> kukub läbi, kui mõni külmutatud bait liigub.

# text
seg-e6aef34d5023 = Jaama ajalabor

# text
# c1: [time_lab]
# c2: lunar-time-budget
# c3: scenarios/lunar-station-time-lab.toml
# c4: docs/lunar-station/time-lab.md
seg-4ef12bffa7c4 = Kas jaama miniRAFS, mis on suunatud LTC-le ja seejärel vabalt töötav või uuesti suunatud, püsib piirides { "1" }, { "10" } ja { "100" } ns: funktsiooni <c2/> valikuline <c1/> plokk (<c3/>). miniRAFS jõuab väärtuseni { "1" } ns pärast { "2.8" } s, { "10" } ns pärast { "377" } s ja { "100" } ns pärast { "10.5" } h; allika nanosekundilist sihti tsiteeritakse, mitte ei võeta omaks. MODELLED. Mudel, väljundid, ajad lävendini tabel nelja kellaklassi kohta ja võrdlus allikatega: <a1><c4/></a1>.

# text
seg-69ddf7ea8fcb = Jaama geodeesia

# text
# c1: extra_reflectors
# c2: extra_beacons
# c3: lunar-llr-datum
# c4: scenarios/lunar-station-geodesy-baseline.toml
# c5: -with-station.toml
# c6: docs/lunar-station/geodesy.md
seg-717a5c91387b = Kui palju üks retroreflektor ja üks VLBI majakas jaama asukohas kitsendavad Kuu tugisüsteemi datumit väljaspool viit arhiveeritud retroreflektorikomplekti: funktsiooni <c3/> valikulised sisendid <c1/> ja <c2/> (<c4/> ja <c5/>). Cramér–Rao piirid vähendatud parameetrikomplekti jaoks ILLUSTRATIVE ajakava ja asukoha korral: nihke normi 1-sigma langeb väärtuselt { "0.0185" } m väärtusele { "0.0102" } m (suhe { "0.551" }), mastaap väärtuselt { "0.00178" } väärtusele { "0.00063" } ppm. MODELLED. Meetod, hoiatused (lõunapolaarne asukoht näeb Maad madalal või üldse mitte) ja täielik Helmerti tabel: <a1><c6/></a1>.

# text
# c1: tests/fixtures/lunar_station/SOURCES.md
seg-8a873848459b = Iga allikas pealkirja, identifikaatori ja väljaandja kaupa koos hankimise kuupäeva ja litsentsiga. URL-id, SHA-256 räsid ja märkused selle kohta, kus allikad lähevad lahku, on registris <a1><c1/></a1>. Ühtki allikafaili ei levitata edasi. Isikunimed on meelega välja jäetud.

# text
seg-b1f1e1efa042 = id

# text
seg-02071a726f21 = pealkiri

# text
seg-0634af374469 = identifikaator

# text
seg-fd875b5fb817 = väljaandja

# text
seg-a6f8ef268fcc = hangitud

# text
seg-d04709ddc97d = litsents

# text
seg-1d4174e911c1 = valge raamat Kuu etalonjaama kohta positsioneerimiseks, ajastamiseks ja teaduseks, versioon { "3" }

# text
seg-e09e1cc11921 = arXiv (autorite valge raamat)

# text
seg-c91720d34bd3 = arXiv mitteeksklusiivne levitamislitsents { "1.0" } (annab õigused ainult arXivile)

# text
seg-df12c861db1e = „Lunar local Differential PNT and Selenodetic Reference Station“ ({ "27" } slaidi)

# text
seg-03f689a0ba49 = ioag.org/meetings/cislunar, jaotis { "6" }, punkt { "07" }

# text
seg-406990fe43a8 = ICG-IOAG tsislunaarse PNT-i töötuba, veebruar { "2025" }; Euroopa Kosmoseagentuuri slaidid

# text
seg-58579c3faf2f = ei ole öeldud; märgitud avalikuks levitamiseks alates slaidist { "3" }

# text
seg-57df0ef791e6 = „Moonlight: LCNS, and Lunar Pathfinder“ ({ "28" } slaidi)

# text
# c1: LunarPNT_Jun24_01_04.pdf
seg-7e18a15e0d16 = unoosa.org, <c1/>

# text
seg-23aee49b1347 = UNOOSA, ICG Kuu PNT-i ühise töörühma sessioon, juuni { "2024" }; Euroopa Kosmoseagentuuri slaidid

# text
seg-f4e53e44f0b5 = ei ole öeldud; märgitud avalikuks levitamiseks

# text
seg-b22a694c481d = „Moonlight Programme Development Status“ ({ "16" } slaidi)

# text
seg-3fd0ab93507d = 2. ICG-IOAG tsislunaarse PNT-i töötuba, veebruar { "2026" }; Euroopa Kosmoseagentuuri ja Telespazio slaidid

# text
seg-472771298df7 = „Lunar Reference Time: ESA's Views“ ({ "9" } slaidi)

# text
seg-6229db9cb23d = Tsislunaarse PNT-i töötuba, veebruar { "2026" }; Euroopa Kosmoseagentuuri slaidid

# text
# c1: LUNAR_SIGMA_URE_M
seg-6b626a2abd0f = LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS) V1.0 ja puusisene <c1/>

# text
# c1: lunar_afs
seg-4e07c500e353 = nagu on registreeritud koos <c1/>

# text
seg-28f8d886c4e5 = juba puus olemas

# text
seg-2006c194fef6 = nagu seal registreeritud

# text
seg-68db6a17b4e7 = <s1>Eelmine</s1>Päikesesüsteem ja muud kehad

# text
seg-79d53edd2374 = <s1>Järgmine</s1>Kosmosekasutaja navigatsioon (gnss-ssv)

# text
seg-9c59637f0666 = Katvuse ja täpsuse kaart (lunar-station-coverage)
