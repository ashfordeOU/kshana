# docs--leo-pnt-fusion: translations (et)

# text
seg-cae10fb9bff8 = Stsenaarium

# text
seg-f63dd3d7aad4 = Allikas

# text
seg-587beeccaa11 = Eelseade

# text
seg-a6c63abeb7e6 = Kaasasolevad stsenaariumid

# text
seg-354b42e3a5d0 = RNTF

# text
seg-c5ce76c91ff7 = Silt

# text
# c1: docs/LEO-PNT-FUSION.md
seg-9673ca8c2705 = Source: <c1/>

# text
seg-989faf40651b = Liidetud MEO ja LEO positsioneerimine, navigatsioon ja aeg

# text
# c1: leo-pvt
# c2: leo-ppp
# c3: ntn-positioning
# c4: src/leo_fusion/
seg-c14c586a29e7 = Kolm stsenaariumi liiki pakuvad positsioneerimist, navigatsiooni ja aega (PNT) madala Maa orbiidi (LEO) satelliitidega üksi või liidetuna keskmise Maa orbiidi (MEO) globaalsete satelliitnavigatsioonisüsteemidega (GNSS): <c1/> (asukoht, kiirus ja aeg), <c2/> (täppispunktpositsioneerimine) ja <c3/> (5G mittemaapealne võrk). Allikas: <c4/>.

# text
# c1: constellation-design
seg-351652fa0e42 = Mootor on <b>süsteemist sõltumatu</b>. Iga konstellatsioon on Walkeri kestad, selgesõnalised orbiidielemendid või liigi <c1/> GNSS-i eelseadistus; iga signaal on kandelaine, kiibisagedus ja kandelaine ja müra tiheduse (C/N0) ümbrik; iga veaeelarve on selgesõnaline üks sigma. Nimetatud süsteemid on valikulised <b>eelseadistused</b>, üks fail igaühe kohta, ning iga võimekus, test ja komplekti kuuluv stsenaarium töötab ilma ühegi kindla neist.

# text
seg-3e7c6608d5c4 = Süsteemid ja eelseadistused

# text
# c1: [[system]]
# c2: kshana <file>.toml
seg-1031746214ab = Stsenaarium loetleb oma süsteemid tabelitena <c1/>. See täielik stsenaarium ühendab GPS-i baaskonstellatsiooni üldise LEO kihiga ja töötab nii, nagu kirjutatud (<c2/>; mootor { $version } annab asukoha täpsuse halvenemise teguri mediaaniks { "2.43" } ainult GPS-i puhul ja { "1.17" } liidetuna ning 3D ruutkeskmiseks veaks { "2.06" } m ja { "0.47" } m):

# text
# c1: preset = "gps-baseline"
# c2: galileo
# c3: beidou-meo
# c4: glonass
# c5: leo_preset = "..."
# c6: navsignal::dll_code_jitter_chips
# c7: sigma_pr_m
# c8: sigma_doppler_hz
seg-6168fdca9b54 = <c1/> (Global Positioning System, GPS; või <c2/>, <c3/>, <c4/>) võtab avaldatud GNSS-i konstellatsiooni; <c5/> täidab LEO eelseadistusest kõik, mille tabel välja jätab. C/N0 kasvab lineaarselt kõrgusnurga siinuses maskist seniidini (modelleerimisvalik: reaalne läbilennu ümbrik sõltub saatja antenni diagrammist). Pseudovahemaa üks sigma on mootori viivituslukustussilmuse (DLL) termiline müra (<c6/>) selle C/N0 juures koos signaal-ruumis kaugusveaga (SISRE), kui <c7/> seda ei fikseeri; kaugusemuutuse kiiruse üks sigma on lainepikkus korda <c8/>. Kuna sigma on sisend, saab eraldi signaalimudel seda toita, ilma et positsioneerimiskood teaks, kust see tuli.

# text
seg-a3f63252bd1b = Mida see kannab

# text
seg-9872e31ebd72 = Allikad

# text
seg-e20c823f36f3 = X1 sagedusel { "1593.3225" } MHz, { "1.023" } Mchip/s, vastuvõetav võimsus −{ "148.2" } kuni −{ "139.1" } dBW; X5 sagedusel { "1190.51625" } MHz, { "10.23" } Mchip/s, −{ "144.9" } kuni −{ "136.2" } dBW; { "258" } satelliiti { "18" } tasandil kõrgusel { "1080" } km, { "53" } ja { "97" } kraadi

# text
seg-57b56c874c9b = PUBLIC: <a1>arXiv:{ "2509.19551" }</a1>. Esinduslik: jaotus kahe kaldenurga vahel, faasimine, kaugusviga

# text
seg-b0c5e502c21b = Iridium Satellite Time and Location (STL): { "66" } satelliiti, kuus peaaegu polaarset tasandit kõrgusel { "780" } km ja { "86.4" } kraadi; impulsid { "1616" } kuni { "1626" } MHz, nelifaasmanipulatsioon (QPSK) kiirusel { "25 000" } sümbolit/s; vastuvõetav võimsus { "300" } kuni { "2400" } korda GPS-i miinimum

# text
seg-d65ae64607c1 = PUBLIC: <a1>Resilient Navigation and Timing Foundation (RNTF)</a1>, <a2>National Institute of Standards and Technology (NIST)</a2>, <a3>konstellatsioon</a3>. TULETATUD: võimsus dBW-des. Esinduslik: kandelaine riba keskel, kaugusviga

# text
seg-36771f73c21f = Ainult Doppler: { "11.325" } GHz, { "240" } MHz ortogonaalse sagedusjaotusega multipleksimise (OFDM) majakas, C/N0 kuni { "57.07" } dB-Hz, Doppleri viga { "30" } Hz; esimene { "1584" } satelliidi kest kõrgusel { "550" } km ja { "53" } kraadi

# text
seg-44d4dd41848a = PUBLIC: <a1>Kozhaya, Saroufim ja Kassas { "2025" }</a1>, <a2>Federal Communications Commission (FCC) 21-48</a2>. Esinduslik: faasimine, horisondi C/N0

# text
seg-2e13de07f9e9 = Binaarne faasmanipulatsioon (BPSK) kiirusel { "2.046" } Mchip/s L1 ja L5 lähedal; sentimeetritäpne orbiidi määramine

# text
seg-dd94a3839cb3 = PUBLIC: <a1>esialgne hinnang</a1>, <a2>GPS Solutions</a2>. Esinduslik: kandelained, võimsus, kogu töökorras konstellatsioon

# text
seg-a34d6a186a36 = C-riba süsteem { "5010" } kuni { "5030" } MHz raadionavigatsiooni-satelliitteenuse (RNSS) eraldises, süsteemidele, mille parameetrid ei ole avalikud

# text
seg-7712896ff69a = PUBLIC: <a1>Rahvusvahelise Telekommunikatsiooniliidu (ITU) raadiosidereeglite</a1> eraldis. Kõik muu on <b>esinduslik</b>

# text
seg-89ebc32469d9 = Efemeriidi ja kella mudel: kuuenda astme polünoomefemeriid, { "30" } s värskendus, kell juhitud GNSS-i ajale; SISRE { "0.26" } m

# text
# c1: ephemeris_preset
seg-ddbefb8a6723 = PUBLIC: <a1>InsideGNSS</a1>. TULETATUD: SISRE. Kombineeri mis tahes konstellatsiooniga läbi <c1/>

# text
seg-6389c92e07d4 = Euroopa Kosmoseagentuuri (ESA) Celeste'i orbiidil demonstreerimine (IOD), üks parameetritega signaalikujunduse konfiguratsioon

# text
seg-b8bd6e76aeb2 = PUBLIC orbiit (<a1>ESA</a1>, <a2>Institute of Navigation (ION) kokkuvõte { "16907" }</a2>); WORKSHOP signaaliparameetrid, esitatud ESA Navigation Innovation and Support Programme (NAVISP) LEO-PNT töötoas { "2026" }

# text
# c1: fusion
# c2: src/celeste_iod.rs
# c3: scenarios/celeste-iod-fused-pvt.toml
# c4: tests/workshop_preset_isolation.rs
# c5: src/celeste_iod.rs
# c6: build.rs
# c7: scenarios/*celeste-iod*.toml
seg-bd7fb6eb444a = Iga töötoast pärinev arv asub faili <c2/> moodulis <c1/>, mida kasutab <c3/> (<c4/> jõustab, kus need võivad esineda). Kuidas eelseadistust tagasi hoitakse: iga mootori töötoast pärinev arv asub ühes failis, <c5/>, mille <c6/> kompileerib sisse ainult siis, kui see olemas on, ja ainult hoidlas olevates stsenaariumides <c7/>. Selle faili ja nende stsenaariumide kustutamine hoiab eelseadistuse tagasi ilma lähtekoodi muutmata; iga muu test, sõltumatu etalon ja stsenaarium töötab ilma selleta ning README stsenaariumifailide arv loeb tagasi hoitud failid ikka sisse.

# text
# c1: mode = "doppler" | "joint" | "polar" | "timing"
seg-12cdcc633ae0 = Üks liik, neli režiimi (<c1/>).

# text
# c1: f_D
# c2: λ
# c3: ρ̇ = −λ f_D = u·(v_s − v_u) + ḋ
# c4: u
# c5: ḋ
# c6: ∂ρ̇/∂r = −(I − u uᵀ)(v_s − v_u)/ρ
# c7: doppler_only = true
# c8: starlink-sop
seg-72b5d8cc82ea = <b>Doppler.</b> Vastuvõtja, mis mõõdab Dopplerit <c1/> lainepikkusel <c2/>, vaatleb kaugusemuutuse kiirust <c3/>, kus <c4/> on vaatejoon ja <c5/> vastuvõtja kella triiv. Paketine Gauss–Newtoni sobitus lahendab asukoha, triivi ja valikuliselt konstantse kiiruse analüütiliste osatuletistega <c6/>: asukohainfot kannab ainult satelliidi kiirus risti vaatejoonega, seega on geomeetria see, kuidas vaatejooned akna jooksul pöörduvad. Aruanne annab vea sõltuvuses akna pikkusest, iga süsteemi Doppleri, Doppleri kiiruse ja tõmbe ümbriku ning ühe läbilennu tabeli. Üks läbilend leiab kasutaja piki rada (nullDoppleri hetk) ja risti sellega (Doppleri kõvera järsus); ristsuunaline viga kasvab piiramatult, kui läbilend läheb otse pea kohal, ning peegelpilt üle maapealse jälje sobib peaaegu sama hästi (neid eristab ainult Maa pöörlemine). Ainult Doppleri süsteem (<c7/>, eelseadistus <c8/>) töötab selles režiimis.

# text
seg-007d143c7fb4 = <b>Ühine.</b> Igal epohhil kaalutud vähimruutude meetod ainult GNSS-i süsteemide, ainult LEO süsteemide ja kõigi pseudovahemaadel, üks vastuvõtja kell süsteemi kohta (süsteemidevaheline nihe, ISB, hinnatakse) või teadaolev ringhäälestatud nihe tugiajaskaalal. See annab aru geomeetrilisest, asukoha-, horisontaalsest, vertikaalsest ja aja täpsuse halvenemise tegurist (GDOP, PDOP, HDOP, VDOP, TDOP), vigadest, hinnatud nihetest ning DOP-ist võrreldes GNSS-i geomeetriale lisatud LEO satelliitide arvuga.

# text
seg-22f136a0c96f = <b>Polaarne.</b> Nähtavad satelliidid, mediaan-DOP ja kättesaadavus laiuskraadi suhtes MEO GNSS-i, LEO ja mõlema korral.

# text
# c1: slot-timing
# c2: Δt_UTC = Δt_LS + A0 + A1 (t_E − t_ot + 604800 (WN − WN_t))
seg-1034557258d1 = <b>Ajastus.</b> Teadaoleval asukohal on iga LEO pseudovahemaa kellamõõtmine. Vastuvõtja käitab kahe olekuga (faas, sagedus) Kalmani filtrit, mille protsessimüra on ostsillaatoriklassi valge ja juhusliku käimise sagedusmüra (<c1/> ja kellamudelid), hoiab aega läbilendude vahel ning teisendab süsteemiaja koordineeritud maailmaajaks (UTC) IS-GPS-200 avaldisega <c2/>; ringhäälestatud nihke määramatus on käivituse kohta nihe.

# text
seg-0d76fcc05e7d = Ujuvlahendusega täppispunktpositsioneerimise (PPP) laiendatud Kalmani filter (EKF) ionosfäärivabadel koodi- ja faasimõõtmistel: staatilised koordinaadid, valge vastuvõtja kell, üks süsteemidevaheline nihe iga lisasüsteemi kohta, juhusliku käimisega seniidi märg viivitus ja ujuv mitmetähenduslikkus satelliidikaare kohta. Täpne orbiidi ja kella viga on satelliidi koodile ja faasile ühine, seega on iga satelliit üks korreleeritud kaherealine uuendus Josephi stabiliseeritud kujul, mis hoiab kovariatsiooni positiivselt määratuna tuhandete millimeetritasemel faasiuuenduste jooksul. Mõõtmised simuleeritakse samast mudelist, seega peab asukoha normaliseeritud hinnangu ruutviga (NEES) järgima hii-ruut seadust kolme vabadusastmega; test kontrollib seda Monte Carlo algväärtuste (seed) üle. Koondumine on esimene epohh, pärast mida horisontaalne ja vertikaalne viga püsivad künniste ({ "10" } cm) all käivituse lõpuni.

# text
seg-630384148ec7 = LEO satelliit ületab taeva umbes kümne minutiga, MEO satelliit liigub mõne kraadi, seega eraldavad LEO kaared mitmetähenduslikkused asukohast palju varem.

# text
# c1: c / (2π β sqrt(2 (C/N0) T))
# c2: β
# c3: B/√12
# c4: sqrt(3 / (2π² (C/N0) T³))
seg-17f9cf9cc24d = 5G mittemaapealse võrgu (NTN) allalink mobiil-satelliitteenuse (MSS) S-ribas, 3rd Generation Partnership Project (3GPP) riba n256 ({ "2170" } kuni { "2200" } MHz). Cramér–Rao piir (CRB) saabumisajale on <c1/>, kus <c2/> on ruutkeskmine (Gaboři) ribalaius (<c3/> tasase OFDM spektri korral), ja tooni sagedusele <c4/>. Liik võrdleb kanaleid (vaikimisi { "5" } MHz New Radio kanal ja { "200" } kHz kitsasriba kanal) allalingi saabumisaja lahenduste kaudu tundmatu vastuvõtja kellaga ja ühe satelliidi Doppleri lahendusega läbilennu jooksul.

# text
seg-516afd013d38 = Liik, režiim

# text
seg-529a5aeea10a = Mida see näitab (algväärtusega, deterministlik)

# text
# c1: leo-pvt
seg-6cd0b721006a = <c1/>, doppler

# text
seg-c3c51264f12a = Xona Pulsar X1 kiht ({ "258" } satelliiti), { "1" } Hz Doppleri müra: 3D viga { "7.5" } m kümne minuti järel ({ "26" } satelliiti); ühel läbilennul on ristsuunaline üks sigma { "303" } m, kui läbilend läheb peaaegu otse pea kohal ({ "25" } km rajast kõrval), võrreldes { "43" } m-ga { "250" } km rajast kõrval

# text
seg-da85037a6691 = Ainult Doppleri oportunistlikud signaalid, { "30" } Hz Doppleri viga sagedusel { "10" } Hz: formaalne horisontaalne üks sigma umbes { "10" } m { "20" } s järel { "12" } satelliidiga ja { "6" } m { "60" } s järel

# text
# c1: leo-pvt
seg-4dbb00da5310 = <c1/>, joint

# text
seg-553e8f4df276 = GPS-i ja Galileo mediaan-PDOP { "1.47" } ning ruutkeskmine (RMS) 3D viga { "1.06" } m; Xona X5 üksi { "1.73" } ja { "0.49" } m; liidetud { "1.06" } ja { "0.41" } m; { "40" } ns LEO nihe ({ "11.99" } m) hinnatud kui { "12.06" } m

# text
seg-83378a120e0d = Koondumine { "7.4" } min (ainult MEO GNSS), { "4.8" }, { "3.2" }, { "2.7" } ja { "2.3" } min { "60" }, { "96" }, { "192" } ja { "288" } LEO satelliidiga

# text
seg-4aadc3b41822 = Kaugusepiir { "0.26" } kuni { "1.03" } m { "4.5" } MHz korral ja { "6.5" } kuni { "26" } m { "180" } kHz korral; lahendused umbes { "2" } m võrreldes { "26" } m-ga

# text
# c1: leo-pvt
seg-5b1019210ca7 = <c1/>, polar

# text
seg-108488f6cc6c = GPS-i ja Galileo VDOP { "1.20" } ekvaatoril, { "1.51" } { "89.9" } kraadi juures; Iridiumiga { "1.14" } poolusel

# text
# c1: leo-pvt
seg-bcdbe0796127 = <c1/>, timing

# text
seg-94ab83c05f50 = Iridiumi aja edastamine { "6" } tunni jooksul Boulderis: { "9.9" } kuni { "11.4" } ns RMS nominaalse C/N0 korral nelja ostsillaatoriklassi lõikes, { "15.1" } kuni { "25.0" } ns { "30" } dB madalama korral

# text
# c1: celeste-iod-fused-pvt
seg-3007f5930dfd = <c1/> (valikuline)

# text
seg-f6ff187a00aa = GNSS, millega liituvad kaks IOD satelliiti tugiajaskaalal (ainult hoidlas, eelseadistusega tagasi hoitud)

# text
# c1: leo-pvt
# c2: leo-focus-fused-pnt-sisre
# c3: leo-vertical-autonomous-vehicle
# c4: leo-vertical-polar-arctic
# c5: leo-vertical-critical-infrastructure-timing
# c6: leo-vertical-5g-network-timing
# c7: leo-ppp
# c8: leo-focus-ppp-altitude
# c9: ntn-positioning
# c10: leo-focus-ntn-bandwidth
# c11: leo-pvt
# c12: leo-ppp
# c13: leo-pnt-chain
seg-98710204278b = Liigid töötavad ka teistes stsenaariumides: <c1/> on <c2/> pühke ning kampaaniate <c3/>, <c4/>, <c5/> ja <c6/> liige; <c7/> on pühke <c8/> liige; <c9/> on pühke <c10/> liige; ning <c11/> ja <c12/> on liigi <c13/> liidetud lahenduse ja PPP etapid. Nende tulemused on failis <a1>LEO-PNT.md</a1>.

# text
seg-2f3086178d0b = Avaldatud arvud ja sildid

# text
seg-8980b5ae869b = Arv

# text
seg-0be9b5747c00 = Kshana

# text
seg-3d2d01038419 = Iridiumi Doppler kuni ±{ "36" } kHz

# text
seg-a88258961299 = { "35.9" } kHz, päevase läbilendude maksimum, { "5" }% piires

# text
# c1: tests/leo_doppler_reference.rs
seg-5bc3150b53f6 = VALIDATED (<c1/>)

# text
seg-35a3ec8ee073 = Xona Pulsar X1 maksimaalne Doppler { "32" } kuni { "34" } kHz

# text
seg-499acd31a8f8 = arXiv:{ "2509.19551" }

# text
seg-e8c9c880a3eb = { "33.6" } kHz ühelt satelliidilt iga avaldatud kesta kohta ({ "1080" } km, { "53" } ja { "97" } kraadi), intervalli sees ilma laiendamata; ainult { "53" } kraadi kest saavutab tipus { "31.8" } kHz, sest Maa pöörlemine aeglustab otsesuunalist orbiiti maapinna suhtes

# text
seg-e12713d5019f = VALIDATED (sama test)

# text
seg-370ca62e7fc7 = Xona Pulsar X1 tõmme ±{ "1.26" } Hz/s²

# text
seg-4de9b0895288 = umbes { "1.0" } Hz/s² otse pea kohal toimuval läbilennul

# text
seg-5019322f4669 = esitatud, mitte valideeritud

# text
seg-7fcb83027ff4 = PPP koondumine { "9.6" } → { "7.0" }, { "3.2" }, { "2.1" }, { "1.3" } min 60/96/192/288 LEO korral

# text
seg-856e73fb2fb5 = Li jt, <em>Journal of Geodesy</em> { "93" }:{ "749" } ({ "2019" }), <a1>doi 10.1007/s00190-018-1195-2</a1>

# text
seg-a03bc7c3b8a6 = { "7.4" } → { "4.8" }, { "3.2" }, { "2.7" }, { "2.3" } min, monotoonne

# text
seg-0a1133c16dce = MODELLED suundumuse kooskõla (konstellatsioone, müra ja jaamu ei reprodutseerita)

# text
seg-7c5292729f36 = Starlink umbes { "2" } m { "20" } s jooksul kolme satelliidiga

# text
seg-6a54a7c58ade = Kozhaya, Saroufim ja Kassas { "2025" }

# text
seg-13fc5fc4f69f = formaalne horisontaalne üks sigma umbes { "10" } m { "20" } s järel { "12" } satelliidiga, täiusliku efemeriidiga ja kõigi vigadega { "30" } Hz Doppleri sigmas sagedusel { "10" } Hz

# text
seg-4fc80a02ed6c = MODELLED võrdlus (vastuvõtjat ja mõõtmissagedust ei reprodutseerita)

# text
seg-5d0ae24eb74c = Iridiumi ajastus alla { "40" } ns UTC(NIST)-ist

# text
seg-fa4467605bc4 = NIST

# text
seg-b910bf5135dd = umbes { "10" } ns RMS modelleeritud

# text
seg-9025f3c376c5 = MODELLED võrdlus

# text
# c1: docs/VERIFICATION-MATRIX.md
seg-4434b0ff1caa = Kõik muu on MODELLED, selle põhjendus on kontrollimaatriksis (<c1/>): DOP on kontrollitud käsitsi tuletatud nelja satelliidi juhu vastu, lahendused nende kovariatsiooni vastu, Doppleri mudel kaugusekiirenduse samasuse vastu, PPP filter hii-ruut NEES vahemiku vastu ning piirid kvadratuuri vastu.

# text
seg-aa5482ac34ff = Piirangud, öeldud otse

# text
seg-0b4564367dcd = Kahekeha orbiidid sekulaarse triiviga J2-st, Maa teisest tsonaalsest harmoonilisest; ringhäälestatud efemeriidi sobitusviga peale SISRE ühe sigma ei ole, satelliidi antennidiagrammi pole.

# text
# c1: leo-pvt
seg-b51ccfee4ab8 = Ionosfääri- ega troposfäärihilistust ei ole liigis <c1/> (PPP filter kannab märja viivituse olekut; selle ionosfäärivaba kombinatsioon eemaldab esimese järgu ionosfääri), skintillatsiooni, mitmeteelevi, tsüklihüppeid ega täisarvuliste mitmetähenduslikkuste lahendamist ei ole.

# text
seg-a719ccac19c0 = NTN täpsus on piir, mitte saavutatud tulemus.

# text
seg-19ba6cc0ca75 = Eelseadistuse väärtused, mis on märgitud esindusliku, on illustratiivsed ega kirjelda ühegi operaatori kavandit.

# text
seg-f9f335d67ff8 = <s1>Eelmine</s1>LEO navigatsioonisõnum

# text
seg-062138bbb73c = <s1>Järgmine</s1>Konstellatsiooni kavandamine
