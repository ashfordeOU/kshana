# docs--solar-system: translations (et)

# attr:aria-label, text
seg-31a05429b836 = Kehad

# text
seg-1c78d5337e16 = Pluuto

# text
seg-6cb7a787ac67 = Viited

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-60cd077d82a7 = Mudel

# text
seg-c5ce76c91ff7 = Silt

# text
seg-430edd66bda0 = Modelleerimata

# text
seg-7670cf4ceda3 = Vaikeväärtus

# text
seg-e0eb14018b2c = nagu ülal

# text
seg-3dbc7ff9f5ab = Tabel

# text
# c1: docs/SOLAR-SYSTEM.md
seg-9fe60d39f2db = Allikas: <c1/>

# text
seg-c44439432020 = Päikesesüsteem ja positsioneerimine teiste kehade ümber

# text
seg-4d4ee55b5fb4 = Kaks stsenaariumi liiki töötavad väljaspool Maa–Kuu süsteemi:

# text
# c1: solar-system
seg-fa202376da31 = <c1/> raporteerib kataloogi iga keha ühel epohhil: asukoht ja kiirus, füüsikalised konstandid, valgusaeg ja kaugus vaatluskehast ning orbiiditrajektoor.

# text
# c1: body-pnt
seg-9859aabbb4f4 = <c1/> paigutab navigatsioonikasutaja (orbiidil olev kaaslane või pinnal olev maandur) mis tahes kataloogikeha ümber peale Päikese ja Maa, koos kohaliku navigatsioonikonstellatsiooni ja valikulise kaugkosmose kaugusega Maalt.

# text
# c1: constellation-design
seg-ec582fa8f67f = Liik <c1/> kasutab sama kataloogi konstellatsioonide ehitamiseks mis tahes nende kehade ümber (<a1>CONSTELLATION-DESIGN.md</a1>).

# text
# c1: src/body.rs
# c2: src/ephem.rs
# c3: src/ephem_provider.rs
# c4: AnalyticSolarSystem
# c5: src/solar_system.rs
# c6: src/body_pnt.rs
# c7: src/radiometric.rs
# c8: tests/solar_system_horizons_reference.rs
seg-31f150c83173 = Kood: <c1/> (kataloog ja selle konstandid), <c2/> (analüütilised efemeriidid), <c3/> (<c4/>, pakkuja, mida mõlemad liigid loevad), <c5/> ja <c6/> (liigid) ning <c7/> (valgusaeg, kahesuunaline kaugus ja Shapiro viivitus). Testid: <c8/> ja iga mooduli ühiktestid.

# text
seg-3ce9aab4916e = Kataloog

# text
# c1: src/body.rs
# c2: J2
seg-35cd9ebaf04e = Kaheksateist keha: Päike, kaheksa planeeti, Pluuto, Kuu, Phobos, Deimos, neli Galilei kuud (Io, Europa, Ganymedes, Callisto) ja Titan. Nimesid võrreldakse tõstutundlikkuseta. Iga keha kohta kannab <c1/> gravitatsiooniparameetrit GM, ekvatoriaal- ja ruumalakeskmist raadiust, teist zonaalharmoonikut <c2/> ja selle etalonraadiust, kui see on avaldatud, ning Rahvusvahelise Astronoomialiidu (IAU) poolus- ja nullmeridiaani mudelit (tähtpäeva pöörlemisperiood, negatiivne tagurpidi pöörleja korral). Iga väärtus viitab koodis oma allikale.

# text
seg-525b8b29345d = Kust asukohad pärinevad

# text
seg-0fd4c3af55ba = Merkuurist Saturnini ja Maa, tabelist { "1" } ({ "1800" } pKr kuni { "2050" } pKr)

# text
seg-9d820791a27b = Jet Propulsion Laboratory (JPL) Standishi ja Williamsi Kepleri elemendid, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>

# text
seg-d8549658ae99 = Kõik kaheksa planeeti tabelitest 2a/2b ({ "3000" } eKr kuni { "3000" } pKr)

# text
seg-1f0b417c3809 = sama lehe pikaajalised elemendid

# text
seg-bfe1c209044a = Uraan ja Neptuun tabelist { "1" }

# text
seg-ba5dfdd2de52 = { "1992" } tabeli { "1" } rida (ainult { "1800" } pKr kuni { "2050" } pKr; praegune leht eemaldas selle ja ei esita viga)

# text
seg-001ca2ad22e1 = Kuu

# text
seg-6ff6068aeacf = Montenbrucki ja Gilli Kuu rida, mis jagab Maa–Kuu baarütsentri

# text
seg-f906cffa45a2 = Phobos, Deimos, Galilei kuud, Titan

# text
seg-6ba84144ad88 = JPL keskmised elemendid koos IAU pöörlemismudeliga

# text
# c1: table = "auto"
# c2: table1
# c3: table2
# c4: epoch_jd_tdb
seg-d5640ad2cd08 = <c1/> (vaikimisi) võtab tabeli { "1" } vahemikus { "1800" } pKr kuni { "2050" } pKr ja tabelid 2a/2b sellest väljaspool; <c2/> ja <c3/> sunnivad ühe valima. Pluuto väljaspool oma tabelit on viga, mitte ekstrapolatsioon. Epohh on ISO { "8601" } kuupäev ja kellaaeg koordineeritud ülemaailmses ajas (UTC), teisendatud maise aja (TT) kaudu liigsekunditega baarütsentrilisse dünaamilisse aega (TDB), või väljaga <c4/> otse antud TDB Juliuse kuupäev.

# text
# c1: tests/fixtures/solar_system/
# c2: cargo test --test solar_system_horizons_reference -- --nocapture
seg-912a2223e495 = Oraakel (sõltumatu etalon) on JPL Horizons (<a1>https://ssd.jpl.nasa.gov/horizons/</a1>, Development Ephemeris DE441), küsitud vektorid on kirjutatud sisse kataloogi <c1/>. Planeedi rida on VALIDATED seal, kus see jääb Standishi lehe enda nominaalvea kahekordse piiresse. Mõõdab <c2/>:

# text
seg-d8bbd5e4f483 = Tabel { "1" }, Merkuurist Saturnini ja Maa–Kuu baarütsenter, { "12" } epohhi aastatel { "1800" } kuni { "2049" }: halvim { "1.87" } korda nominaalviga (Saturni kaugus).

# text
seg-18568cec6c91 = Tabelid 2a/2b, kõik kaheksa planeeti, { "15" } epohhi umbes { "1000" } eKr kuni { "2500" } pKr: halvim { "1.71" } korda (Marsi kaugus).

# text
seg-7f3aa4a24e8f = Tabeli { "1" } Uraan ja Neptuun ületavad DE441 vastu lehe näitajaid: { "2.04" } ja { "5.16" } korda nominaalset pikkusevea. Need on alla kuue korra kinnitatud ja jäävad MODELLED.

# text
seg-41d2f404224b = Pluuto: { "39.2" } kaaresekundi piires pikkuses ja { "1.14e9" } m kauguses.

# text
seg-11c31908ba69 = Kuud, halvim planeedilt nähtav nurk aastatel { "2000" } kuni { "2040" }: Phobos { "5.65" } kraadi, Deimos { "0.38" }, Io { "0.40" }, Europa { "1.63" }, Ganymedes { "0.22" }, Callisto { "0.27" }, Titan { "3.31" }. Geotsentriline Kuu: { "0.046" } kraadi.

# text
seg-24d36a3ce8d4 = Planeetide kiirused: halvim suhteline viga { "3.72e-3" } kiirusest (MODELLED).

# text
seg-0bae9b8d09ea = Kuud ja seitset kuud mõõdetakse kinnitatud lävedega, kuid nende kinnitamiseks puudub avaldatud piir, seega on need MODELLED.

# text
# c1: xval/
# c2: EphemerisProvider
seg-2cf791a940ea = Analüütilised efemeriidid ei vaja tuumafaili. JPL Development Ephemeris tuuma (DE-klassi asukohad) loevad ainult eraldi ristvalideerimise crate'id kataloogis <c1/>, sama <c2/> trait'i kaudu; põhicrate neist ei sõltu.

# text
# c1: epoch
# c2: epoch_jd_tdb
# c3: bodies
# c4: observer
# c5: track_points
# c6: table
# c7: [[links]]
seg-5bff2c54125b = Sisendid: <c1/> (vaikimisi 2026-01-01T00:{ "00" }:{ "00" }) või <c2/>; <c3/> (vaikimisi kõik kaheksateist); <c4/> (vaikimisi Maa); <c5/> orbiidi kohta ({ "8" } kuni { "2000" }, vaikimisi { "120" }); <c6/>; ja suvaline arv <c7/>, igaüks vastu võetud epohhil.

# text
seg-5787ece2c791 = Iga keha kohta annab tulemus selle klassi ja vanema, NASA Navigation and Ancillary Information Facility (NAIF) identifikaatori, heliotsentrilise asukoha ja kiiruse Rahvusvahelises Taevaslikus Tugisüsteemis (ICRF, ekvatoriaalne J2000) meetrites ja meetrites sekundis, ekliptikaalse pikkuse, laiuse ja kauguse, asukoha oma vanema suhtes, orbiidiperioodi, ülaltoodud konstandid, pooluse ja nullmeridiaani epohhil, Standishi nominaalvea, kui see on olemas, selle sildi ja meetodisõne ning orbiiditrajektoori ühe tiiru jooksul (planeedi puhul heliotsentriline, kuu puhul vanema keskne; Päikese puhul üks punkt). Vaatleja link ja iga lisalink annavad:

# text
seg-36bad4b7b4ba = Newtoni ühesuunalise valgusaja, lahendatuna radiomeetrilise püsipunkti valgusaja lahendajaga, kus saatja on oma viivitatud asukohas, ja vastava ühesuunalise kauguse;

# text
seg-c5602eb76a05 = kahesuunalise valgusaja ja kauguse;

# text
seg-dab8e2db61d3 = Päikese Shapiro viivituse, esitatud eraldi ja mitte liidetud;

# text
seg-90d00587a59f = Päikese nurkkauguse.

# text
seg-4c172f9f7cf6 = Valgusaeg on VALIDATED Horizonsi raporteeritud ühesuunalise valgusaja vastu: Mars ja Jupiter Maa keskpunktini neljal epohhil aastatel { "2000" } kuni { "2040" }, halvim viga { "0.070" } s Marsi puhul läve { "0.207" } s vastu ja { "1.31" } s Jupiteri puhul { "4.04" } s vastu. Lävi on sihtmärgi ja Maa–Kuu baarütsentri Standishi kaugusvigade summa kahekordne, jagatud valguse kiirusega: valgusaeg ei saa olla parem kui asukohad. See on Newtoni geomeetriline valgusaeg, mitte relativistlik ega plasmakorrigeeritud vaadeldav suurus.

# text
# c1: scenarios/solar-system-tour.toml
seg-4f8cd6aef754 = Kaasasolev <c1/> raporteerib kõik kaheksateist keha hetkel 2026-09-28T00:{ "00" }:{ "00" } 180-punktiliste trajektooridega ning lisab lingid Marss–Jupiter (ühesuunaline { "2193.539" } s), Saturn–Maa ({ "4212.176" } s) ja Europa–Jupiter ({ "2.218" } s).

# text
seg-d22cc535f04b = Kasutaja navigeerib nime järgi valitud keha ümber (mis tahes kataloogikeha peale Päikese ja Maa, mille liik tagasi lükkab) kahe mõõtmisliigiga:

# text
# c1: planes
# c2: sats_per_plane
# c3: phasing_f
# c4: J2
seg-9eeb7f77aec7 = ühesuunalised pseudovahemaad Walkeri delta navigatsioonikonstellatsioonist keha ümber (<c1/> kaupa <c2/>, tasanditevaheline faasimine <c3/>), lennatud kahekeha orbiitidena keha enda sekulaarse triiviga <c4/>; kasutaja kell on teadmata, seega kannavad need read kella nihke veergu;

# text
# c1: [earth_link]
seg-56ac318f6f27 = valikuliselt kahesuunaline kaugus Maa keskpunktist (<c1/>), mis ei vaja kasutaja kella ja mida raporteeritakse ühesuunalise kaugusena oma müraga. Maa suund ja kaugus tulevad analüütilisest efemeriidist igal epohhil.

# text
# c1: mars-pnt
seg-551d44492aae = Vaatejoon on blokeeritud, kui see läbib keha keskmise raadiuse sisemust (liigi <c1/> kõõlutest), ja pinnakasutaja vajab ka kõrgusnurga maski. Igal epohhil moodustab käivitus ainuüksi konstellatsiooni geomeetrilise ja positsiooni täpsuse halvenemise teguri (GDOP, PDOP), formaalse ühe sigma positsiooni ebakindluse koos Maa reata ja ilma, ning algväärtusega (seed) Gaussi–Newtoni vähimruutude lahendi mõlemal viisil, nii et aruanne näitab, mida kaugkosmose link lisab.

# text
seg-6f1161567330 = ülemine tase

# text
seg-432421ccb9d7 = 2027-02-19T00:{ "00" }:{ "00" }, Marsi vastasseis

# text
seg-0b688042ed44 = { "86 400" } s, { "600" } s

# text
# c1: orbiter
# c2: surface
seg-c7b3aaecd6e2 = <c1/> (või <c2/>)

# text
# c1: altitude_km
# c2: inclination_deg
# c3: raan_deg
# c4: u0_deg
# c5: eccentricity
seg-c452a6f7a9d4 = orbiidil olija: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
seg-67f7b23bf604 = { "400" } km, { "75" } kraadi, { "0" }, { "0" }, { "0" }

# text
# c1: lat_deg
# c2: lon_deg
# c3: height_m
seg-b412b65733d8 = pind: <c1/>, <c2/>, <c3/>

# text
seg-7639d2583131 = kolm keskmist raadiust

# text
seg-fe4a8d9da406 = { "60" } kraadi

# text
seg-7ac449fb9569 = { "1" } m

# text
# c1: mask_deg
seg-128c4a5edd9b = <c1/> (pinnakasutaja)

# text
seg-3d4b760f6ed6 = { "10" } kraadi

# text
seg-498493929023 = tõene, { "1" } m

# text
# c1: raan_deg
# c2: u0_deg
seg-18e477dc7f02 = <c1/> on tõusva sõlme rektastsensioon keha ekvatoriaalsüsteemis ja <c2/> laiuskraadi argument epohhil.

# text
seg-a743b0b5e668 = Kaks kaasasolevat stsenaariumi, nagu need käivituvad kshana { "0.36" } all (portatiivne matemaatika, igal platvormil sama):

# text
seg-b24010bdb302 = Kasutaja

# text
seg-cb9cd741ba85 = orbiidil olija, { "300" } km, { "93" } kraadi

# text
seg-fa11e61f0d1d = pind, { "20" } kraadi N, { "60" } kraadi E

# text
seg-e17a9ae6905c = Releed

# text
seg-359db3c9ad19 = { "12" } kõrgusel { "10 000" } km, { "60" } kraadi

# text
seg-1bb041045be4 = { "12" } kõrgusel { "4500" } km, { "55" } kraadi, { "10" } kraadi mask

# text
seg-604aefd62668 = Ulatus

# text
seg-825603e2fbed = üks sol, { "296" } epohhi

# text
seg-372159825c11 = { "306 822" } s, { "171" } epohhi

# text
seg-132e3bbcc94c = Maa valgusaeg, ühesuunaline / edasi-tagasi

# text
seg-76351e2f75f8 = { "338.3" } s / { "676.6" } s

# text
seg-2d0234ec6301 = { "2182.9" } s / { "4365.8" } s

# text
seg-d0f05f440103 = Maa nähtav

# text
seg-d7ad84776ec6 = { "0.811" } epohhidest

# text
seg-44bf83b16660 = Kättesaadavus, ainult releed / koos Maa kaugusega

# text
seg-07e0a8499670 = PDOP mediaan

# text
seg-e802f5920237 = Lahendi RMS viga, ainult releed / koos Maa kaugusega

# text
seg-ed769d9370a0 = { "1.883" } m / { "1.629" } m

# text
seg-873187e2b016 = { "112.742" } m / { "86.499" } m

# text
seg-bcba58871d0b = Formaalse sigma mediaan, ainult releed / koos Maa kaugusega

# text
seg-536757d9f141 = { "1.375" } m / { "1.304" } m

# text
seg-14d7b5dc82e8 = { "5.360" } m / { "4.239" } m

# text
# c1: docs/revisions/STUDIO15-portable-math-rebaseline.md
seg-67d3d30060ad = (RMS: ruutkeskmine.) Üks Europa epohh (t = { "16 200" } s) asub kättesaadavuse serval, kus arvutatud raadiuse viimane bitt otsustab, kas selle Maa kauguse lahend tehakse. Enne { "0.36" } otsustas selle hosti matemaatikateek, nii et sama stsenaarium trükkis kahe „koos Maa kaugusega“ näitaja jaoks { "0.719" } ja { "86.147" } m Linux x86-64 peal ning { "0.725" } ja { "85.800" } m macOS arm64 peal. Alates { "0.36" } arvutab iga transtsendentse funktsiooni portatiivne matemaatikateek, epohh laheneb igal platvormil ühtmoodi (natiivne ja WebAssembly annavad samad baidid) ning näitajad on { "0.713" } ja { "86.499" } m (<a1><c1/></a1>). Europa ümber tõstab Maa kaugus kättesaadavuse väärtuselt { "0.480" } väärtusele { "0.713" } epohhidest. Seal, kus Maa ei tõuse kunagi limbusest kõrgemale, ei lisa link midagi: maandur kohal { "89.5" } kraadi S Kuul 12-satelliidilise, { "5000" } km releekihi all näeb Maad { "0" } epohhil { "145" }-st ja selle vead on sama koos lingiga ja ilma.

# text
seg-41507568efb8 = <b>MODELLED.</b> Releeorbiidid ignoreerivad kolmandaid kehasid (Jupiteri tõmmet Europa ümber olevatele releedele ei modelleerita), müra on Gaussi esitatud tasemetel ja mõõtmismudel on hetkeline, mitte valgusajaga viivitatud. Mida kontrollitakse: releeperiood Kepleri kolmanda seaduse vastu keha jaoks, orbiidil olija hoiab oma raadiust ja maandur pinnal, Maa kaugus ei halvenda kunagi formaalset ebakindlust, algväärtusega (seed) lahendivead langevad kokku formaalse sigmaga (vea ruutkeskmine sigma suhtes vahemikus [{ "0.6" }, { "1.5" }]) ja deterministlik käivitus. Mitte midagi sellest ei ole missiooni navigatsiooniandmed.

# text
# c1: ephemeris
seg-b78c9e331a43 = Liik <c1/>

# text
# c1: ephemeris
# c2: eop_finals2000a
# c3: finals2000A
# c4: src/ephemeris.rs
seg-b9f40c641a49 = Nimest hoolimata on <c1/> Maa satelliidi liik: üks satelliit kaherealisest elemendikomplektist (TLE) läbi Simplified General Perturbations { "4" } (SGP4) levitaja või analüütilisest orbiidist, üle ajaruudustiku. Igal sammul väljastab see inertsiaalse oleku (asukoht ja kiirus) tõelise ekvaatori, keskmise pööripunkti (TEME) süsteemis ja Geocentric Celestial Reference System (GCRS) süsteemis, Maa suhtes fikseeritud asukoha, World Geodetic System { "1984" } (WGS { "84" }) satelliidialuse punkti ning valikulise maajaama puhul asimuudi, kõrgusnurga, kauguse ja kauguse muutumiskiiruse. <c2/> võtab International Earth Rotation and Reference Systems Service (IERS) <c3/> faili teksti iga epohhi UT1−UTC ja poolusliikumise jaoks. Kood: <c4/>.

# text
seg-1babcba7b4ba = Relativistlikud valgusaja liikmed peale eraldi raporteeritud Shapiro viivituse ning Päikese plasma viivitus.

# text
seg-0c49dfc777ca = Asukohad, mis on paremad kui ülalnimetatud Standishi ja keskmiste elementide täpsus; põhicrate'is puudub tuumalugeja.

# text
# c1: body-pnt
# c2: constellation-design
seg-18d925e53ce0 = Kolmanda keha häiringud <c1/> releedel ja <c2/> orbiitidel.

# text
seg-3968ed54e3fe = Maastik mis tahes kehal: keha on selle keskmine sfäär.

# text
# c1: solar-system
# c2: body-pnt
seg-4650526c532e = Koostalitlusvõime eksport: CZML, KML ja GeoJSON kirjeldavad asukohti Maa ümber, seega ei ekspordi stsenaariumid <c1/> ja <c2/> midagi (<a1>INTEROP.md</a1>).

# text
seg-cb7e3d4bf5aa = E. M. Standish ja J. G. Williams, „Keplerian Elements for Approximate Positions of the Major Planets“, JPL Solar System Dynamics, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>.

# text
seg-aaf6a1f91c1a = O. Montenbruck ja E. Gill, <em>Satellite Orbits: Models, Methods and Applications</em>, Springer, { "2000" }, §{ "3.3.2" }.

# text
seg-8b7aa3bb95f0 = B. A. Archinal et al., „Report of the IAU Working Group on Cartographic Coordinates and Rotational Elements: { "2015" }“, <em>Celestial Mechanics and Dynamical Astronomy</em> { "130" }, { "2018" }.

# text
seg-10c8408cab27 = JPL Horizons, <a1>https://ssd.jpl.nasa.gov/horizons/</a1>.

# text
seg-e95a41f0ded7 = <s1>Eelmine</s1>Jõumudeli valideerimine

# text
seg-a801b99f7040 = <s1>Järgmine</s1>Kuu etalonjaam

# text
seg-e0aba02258f4 = Efemeriidi liik
