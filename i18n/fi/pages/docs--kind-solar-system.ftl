# docs--kind-solar-system: translations (fi)

seg-e27476e37522 = Maa

seg-5b561b4fd201 = Mars

seg-59f1f277012b = Jupiter

seg-e6e209ad07e0 = Europa

seg-6f12259c6ec4 = Saturnus

seg-11e8c29ecb45 = Moottorin v{ $version } skenaariolaji, perhe <a1>Satelliittitähdistöt, kattavuus ja geometria</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-dae4184bb004 = <b>VALIDATED</b> Newtonilainen yhdensuuntainen valoaika mistä tahansa kappaleesta mihin tahansa toiseen, vastaanotettuna epookilla, ratkaistuna radiometrisellä kiintopistevaloaikaratkaisijalla (radiometric::light_time_solution, lähetin viivästetyssä paikassaan) funktion solar_system::link_o kautta Testit: <a1>solar_system_light_time_preregistered.rs</a1>.

seg-a4f1e7d2041e = Perhesivu: <a1>Satelliittitähdistöt, kattavuus ja geometria</a1>

seg-670191cf797f = Aihesivu: <a1>SOLAR-SYSTEM.md</a1>

seg-cef32ee7d521 = Aihesivu: <a1>CONSTELLATION-DESIGN.md</a1>

seg-4d208b6c0eb8 = day

seg-3319b18ac61f = ja { "1" } muu matriisissa.

seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: tämän tyypin mainitsevat <a1>varmennusmatriisin</a1> rivit.

# text
# c1: docs/kinds/by-kind/solar-system.md
seg-028ac545e52e = Lähde: <c1/>

# text
# c1: solar-system
seg-934e7998420c = <c1/> (skenaariolaji)

# text
seg-0549bc926a9b = Koko aurinkokunta yhdellä epookilla PNT:tä (paikannus, navigointi ja ajanmääritys) varten minkä tahansa kappaleen ympärillä. Auringolle, kahdeksalle planeetalle, Plutolle, Kuulle, Phobokselle, Deimokselle, Iolle, Europalle, Ganymedeelle, Callistolle ja Titanille se raportoi heliosentrisen paikan ja nopeuden ICRF:ssä (International Celestial Reference Frame, ekvatoriaalinen J2000), heliosentrisen etäisyyden sekä J2000-ekliptisen pituuden ja leveyden, gravitaatioparametrin, ekvatoriaalisen ja keskisäteen, J2:n silloin kun se on julkaistu ja sen vertailusäteen, sideerisen pyörimisjakson, IAU:n navan ja nollameridiaanin epookilla, yhden kierroksen yli otetun rataprofiilin (heliosentrinen planeetoille, emokappaleen keskipisteeseen suhteutettu kuille) sekä valoajan, yksi- ja kaksisuuntaisen etäisyyden, Auringon Shapiro-viiveen ja Auringon erotuskulman havaitsijakappaleesta (oletuksena Maa); lisäksi annetut from/to-linkit saavat saman käsittelyn. Paikat: Standishin ja Williamsin JPL:n Kepler-elementit (Taulukko { "1" } vuosille { "1800" } AD–{ "2050" } AD, taulukot 2a/2b vuosille { "3000" } BC–{ "3000" } AD) kunkin planeetan nimellisvirheineen, Montenbruckin ja Gillin kuusarja Maa–Kuu-jakoon, JPL:n keskielementit IAU:n synkronisella pyörimisnopeudella Marsin ja Galileon kuille sekä IAU:n pyörimismalli Titanille. Valoaika: radiometrinen kiintopisteratkaisu, lähetin takaisinviivästetyssä paikassaan; newtonilainen, Shapiro-viive raportoituna erikseen. VALIDATED JPL Horizonsia (DE441) vastaan kaksinkertaisen nimellisvirheen sisällä: Merkurius–Saturnus ja Maa taulukosta { "1" } (pahin { "1.87" } kertaa nimellinen) ja kaikki kahdeksan planeettaa taulukoista 2a/2b (pahin { "1.71" } kertaa) sekä Maa–Mars- ja Maa–Jupiter-valoaika. MODELLED, jokainen rivi merkittynä: Uranus ja Neptunus taulukosta { "1" } ({ "2.0" } ja { "5.2" } kertaa nimellinen virhe DE441:tä vastaan), Pluto (vuoden { "1992" } rivi; ei ilmoitettua virhettä), Kuu ja seitsemän kuuta (mitattu Horizonsia vastaan, ei julkaistua rajaa).

# text
# c1: scenarios/solar-system-tour.toml
seg-bd2d27e1f91d = Yksi ajo, jossa on <c1/>, tiivistyy seuraavasti: Solar system at 2026-09-28T00:{ "00" }:{ "00" } (JD { "2461311.50080" } TDB), { "18" } bodies, observer Earth Standish Table { "1" } ({ "1800" } AD to { "2050" } AD) Sun { "0.0000" } au lon { "0.00" } deg light time { "500.1" } s [origin] Mercury { "0.4666" } au lon { "259.05" } deg light time { "605.3" } s [VALIDATED] Venus { "0.7272" } au lon { "348.72" } deg light time { "182.1" } s [VALIDATED] Earth { "1.0022" } au lon { "4.52" } deg observer [VALIDATED] Moon { "1.0046" } au lon { "4.56" } deg light time { "1.3" } s [MODELLED] Mars { "1.5544" } au lon { "83.81" } deg light time { "841.1" } s [VALIDATED] Phobos { "1.5545" } au lon { "83.81" } deg light time { "841.2" } s [MODELLED] Deimos { "1.5545" } au lon { "83.80" } deg light time { "841.1" } s [MODELLED] Jupiter { "5.3036" } au lon { "130.91" } deg light time { "2970.6" } s [VALIDATED] Io { "5.3049" } au lon { "130.94" } deg light time { "2971.5" } s [MODELLED] Europa { "5.2995" } au lon { "130.93" } deg light time { "2968.7" } s [MODELLED] Ganymede { "5.3005" } au lon { "130.98" } deg light time { "2969.6" } s [MODELLED] Callisto { "5.3153" } au lon { "130.96" } deg light time { "2976.7" } s [MODELLED] Saturn { "9.4356" } au lon { "10.77" } deg light time { "4212.2" } s [VALIDATED] Titan { "9.4401" } au lon { "10.74" } deg light time { "4214.3" } s [MODELLED] Uranus { "19.4363" } au lon { "62.62" } deg light time { "9444.1" } s [MODELLED] Neptune { "29.8775" } au lon { "2.62" } deg light time { "14409.3" } s [MODELLED] Pluto { "35.6122" } au lon { "304.19" } deg light time { "17529.1" } s [MODELLED] link Mars -> Jupiter: one-way { "2193.539" } s, two-way { "4386.919" } s, Shapiro { "15.0" } us, Sun { "15.0" } deg link Saturn -> Earth: one-way { "4212.176" } s, two-way { "8424.347" } s, Shapiro { "22.1" } us, Sun { "172.5" } deg link Europa -> Jupiter: one-way { "2.218" } s, two-way { "4.437" } s, Shapiro { "0.0" } us, Sun { "22.0" } deg

# text
# c1: epoch
# c2: epoch_jd_tdb
# c3: bodies
# c4: observer
# c5: track_points
# c6: table
# c7: links
seg-26ecec1af8af = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/solar-system-tour.toml
seg-13de19567146 = Esimerkki <c1/> asettaa muun muassa seuraavat:

# text
seg-6081077a5c63 = 2026-09-28T00:{ "00" }:{ "00" }

# text
seg-c4b64eb26210 = ICRF (ekvatoriaalinen J2000), heliosentrinen; m

# text
seg-6096a0ab243b = Standish Table { "1" } ({ "1800" } AD to { "2050" } AD)

# text
seg-5c9a8d4716f5 = Tuloksen tunniste (moottorin oma): MIXED: jokaisella kappaleella on oma tunnisteensa. Planeettojen paikat ovat VALIDATED JPL Horizonsia vastaan kaksinkertaisen Standishin nimellisvirheen sisällä (Merkurius–Saturnus ja Maa taulukosta { "1" }; kaikki kahdeksan planeettaa taulukoista 2a/2b); Uranus ja Neptunus taulukosta { "1" }, Pluto, Kuu ja seitsemän kuuta ovat MODELLED.

# attr:alt
seg-537aa8010e50 = Moottorin kirjoittama kaavio skenaariolle scenarios/solar-system-tour.toml, laji solar-system

# text
# c1: solar-system
seg-7432155d5fec = <b>VALIDATED</b> Laji <c1/>, kun planetary_kernel_path on annettu: jokainen raportoitu kappale, jonka oman NAIF-koodin SPK sisältää, ottaa heliosentrisen J2000-paikkansa ja -nopeutensa kernelistä moottorin oman lukijan kautta (tunniste KERNEL), linkki, jonka kaksi pää

# text
seg-84ce0dd8daef = <b>VALIDATED</b> Merkuriuksen, Venuksen, Maa–Kuu-barycentrin, Maan, Marsin, Jupiterin ja Saturnuksen heliosentriset paikat Standishin taulukosta { "1" } ({ "1800" } AD to { "2050" } AD) ja kaikkien kahdeksan planeetan taulukoista 2a/2b ({ "3000" } BC to { "3000" } AD, b-, c-, s-, f-keskianomalia-termein) Testit: <a1>solar_system_standish_earth_icrf_preregistered.rs</a1>.

# text
seg-cc5bd76ec542 = <b>MODELLED</b> Uranuksen ja Neptunuksen paikat Standishin taulukosta { "1" } (oletus välillä { "1800" } AD to { "2050" } AD), Pluto vuoden { "1992" } taulukon { "1" } rivistä, jota nykyinen JPL:n sivu ei enää luettele, sekä jokaisen planeetan heliosentrinen nopeus: kahden kappaleen derivaatta Testit: <a1>solar_system_horizons_reference.rs</a1>.

# text
# c1: solar-system
seg-ad3da7fe8e46 = <b>VALIDATED</b> Laji <c1/>, kun planetary_kernel_path on annettu: jokainen raportoitu kappale, jonka oman NAIF-koodin SPK sisältää, ottaa heliosentrisen J2000-paikkansa ja -nopeutensa. Oraakkeli (ExternalDataset): NAIF SPICE Toolkit (CSPICE N0067 spiceypy { "8.3.0" } kautta) spkezr-heliosentriset tilat täydellä de440s.bsp:llä, erillinen ohjelma, joka ei kutsu mitään Kshana-koodia (tests/fixtures/solar_system_kernel/, NOTICE.md); moottori lukee de440s-leikkeet bitti bitiltä. Ennakkorekisteröity f8e946ea. Library-tarkistus johdotuksesta: DE440:ää itseään ja analyyttisiä kappaleita ei tässä validoida. Tulokset: docs/design/evidence/cap31-solar-system-kernel/RE

# text
seg-735fb0bc1705 = <b>VALIDATED</b> Merkuriuksen, Venuksen, Maa–Kuu-barycentrin, Maan, Marsin, Jupiterin ja Saturnuksen heliosentriset paikat Standishin taulukosta { "1" } ({ "1800" } AD to { "2050" } AD) ja kaikkien . Oraakkeli (ExternalDataset): JPL Horizons DE441 geometriset heliosentriset vektorit (ekliptinen ja ICRF), haettu ennakkorekisteröinti-commitien { "80451866" }, 8d38a28b ja 558cc807 jälkeen. Kynnys: planeettaa ja komponenttia kohden RMS enintään 1.0x Explanatory Supplement 3rd ed. -teoksen taulukon { "8.10.1" } likimääräisistä virheistä (EMB-rivi Maalle); Maa–EMB-jako tarkistetaan suoraan DE441:tä vastaan { "399" } miinus { "3" }, enintään { "0.3" } deg ja { "8.1" } km jokaisella epookilla 1950-2050 (th

# text
seg-ab1192de28f5 = <b>VALIDATED</b> Newtonilainen yksisuuntainen valoaika mistä tahansa kappaleesta mihin tahansa toiseen, vastaanotettuna epookilla, ratkaistuna radiometrisellä kiintopisteen valoaikaratkaisijalla (radiometric::light_t. Oraakkeli (ExternalDataset): JPL Horizons DE441 yksisuuntainen alalinkin newtonilainen valoaika LT (VEC_CORR=LT, havaitsija Maan keskipiste), ennakkorekisteröity (480037d3, muutos 54d5c86f, joka muutti vain interpolointisolmujen väliä sen jälkeen, kun ensimmäinen haku ei täyttänyt { "10" } m:n interpolointiehtoa, ennen kuin mitään valoaikaa verrattiin) kynnyksellä { "1e-6" } s valoaikaa kohden, ratkaisijalle syötettynä DE441:n barycentriset paikat, jolloin takaisinviivästetyn lähettimen iteraatio on näkyvä

# text
seg-5a2e745828ea = <b>MODELLED</b> Uranuksen ja Neptunuksen paikat Standishin taulukosta { "1" } (oletus välillä { "1800" } AD to { "2050" } AD), Pluto vuoden { "1992" } taulukon { "1" } rivistä, jota nykyinen JPL:n sivu ei enää li. Oraakkeli (ExternalDataset): Mitattu JPL Horizons DE441:tä vastaan (samat committoidut fiksturit), mutta ei validoitu: taulukon { "1" } ilmoitetut luvut Uranukselle ja Neptunukselle ylittyvät enintään { "2.0" } ja { "5.2" } kertaisesti DE441:n heliosentrisiin paikkoihin verrattuna (Neptunus täyttää ne barycentrisiin paikkoihin verrattuna, mikä viittaa siihen, ettei sovitus ollut heliosentrinen), sivu ei ilmoita Plutolle virhettä, eikä nopeuksille ole julkaistua rajaa. Taulukot 2a/2b täyttävät omat

# text
# c1: label
seg-0131b082906b = MIXED: jokaisella kappaleella on oma tunnisteensa. Planeettojen paikat ovat VALIDATED JPL Horizonsia vastaan kaksinkertaisen Standishin nimellisvirheen sisällä (Merkurius–Saturnus ja Maa taulukosta { "1" }; kaikki kahdeksan planeettaa taulukoista 2a/2b); Uranus ja Neptunus taulukosta { "1" }, Pluto, Kuu ja seitsemän kuuta ovat MODELLED. Valoajat ovat newtonilaisia, samoista paikoista. (tulos <c1/>)

# text
# c1: kshana kinds --json
seg-3e24f0bf9ccd = MODELLED, jokainen rivi merkittynä: Uranus ja Neptunus taulukosta { "1" } ({ "2.0" } ja { "5.2" } kertaa nimellinen virhe DE441:tä vastaan), Pluto (vuoden { "1992" } rivi; ei ilmoitettua virhettä), Kuu ja seitsemän kuuta (mitattu Horizonsia vastaan, ei julkaistua rajaa). (lajiluettelo (<c1/>))

# text
seg-62b2e925233a = MIKÄ ON VALIDATED JA MIKÄ EI Jokaisella kappaleella on oma tunnisteensa. Merkurius–Saturnus ja Maa ovat VALIDATED JPL Horizonsia (Development Ephemeris DE441) vastaan Standishin sivun kaksinkertaisen nimellisvirheen sisällä. Uranus ja Neptunus taulukosta { "1" } ylittävät sivun luvut DE441:tä vastaan ({ "2.0" } ja { "5.2" } kertaa) ja ovat MODELLED; samoin Pluto, Kuu ja seitsemän kuuta, joita mitattiin Horizonsia vastaan mutta joille ei ole julk (skenaariotiedoston kommentti, rivit { "20" }–{ "25" })

# text
seg-2b36ac40e457 = Uranus ja Neptunus Standishin taulukosta { "1" }, Pluto ja planeettojen nopeudet on MODELLED, ei validoitu: osaväite on tarkistettu ulkoisesti, mutta koko ominaisuus koostuu mallinnetuista osista, joten ominaisuus pysyy tasolla Modelled. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

# text
seg-c19e6d035b7e = Kuun ja seitsemän suuren kuun (Phobos, Deimos, Galileon kuut, Titan) paikat on MODELLED, ei validoitu: osaväite on tarkistettu ulkoisesti, mutta koko ominaisuus koostuu mallinnetuista osista, joten ominaisuus pysyy tasolla Modelled. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

# text
seg-ce15aaa5453c = Jokaisen aurinkokunnan kappaleen fysikaaliset vakiot ja koko järjestelmän raportti on MODELLED, ei validoitu: tarkistettu omaa suljetun muodon eli analyyttistä identiteettiään vastaan — se paljastaa kirjoitus- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

# text
seg-ceadf891b1e2 = <s1>Edellinen</s1>slot-timing

# text
seg-0493962a6937 = <s1>Seuraava</s1>space-packet
