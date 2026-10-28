# docs--leo-pnt: translations (et)

# text
seg-46c7e6f003dd = Süsteem

# text
seg-cae10fb9bff8 = Stsenaarium

# text
seg-f1f903f1b9ff = Vastupidavus

# text
seg-1759a8cce7d6 = Liigid

# text
seg-71aee5eb55c5 = UHF

# text
seg-f63dd3d7aad4 = Allikas

# text
seg-587beeccaa11 = Eelseade

# text
seg-e305279d5b11 = Sisu

# text
seg-b03d56f501c3 = Liik

# text
seg-6752521002b2 = Osa

# text
seg-cf6ae60eea4f = Lisaandmed

# text
seg-0bdbdd2c923b = Sünkroniseerimine

# text
seg-b09dc4b322d3 = Efemeriid

# text
seg-3a835a49b43f = Muud teenused

# text
seg-a17f4b4f7fb5 = { "1191.795" } MHz

# text
seg-c5ce76c91ff7 = Silt

# text
seg-c1020ac47091 = Mida üks käivitus arvutab

# text
seg-f708914fed48 = Sagedusribad

# text
seg-486f17197d4d = REPRESENTATIVE, C-riba süsteemidele, mille parameetrid ei ole avalikud (näiteks TrustPoint)

# text
# c1: celeste-iod
seg-03d5ae448705 = <c1/> (valikuline)

# text
seg-fde146239f5d = Ühe käivituse tulemus

# text
seg-a3f63252bd1b = Mida see kannab

# text
# c1: docs/LEO-PNT.md
seg-7d2c6fbf95b7 = Source: <c1/>

# text
seg-6f1f29597f4b = LEO-PNT Kshanas

# text
seg-2a3a1f19005a = LEO-PNT on positsioneerimine, navigatsioon ja aeg (PNT) madala Maa orbiidi (LEO) satelliitidelt, keskmise Maa orbiidi (MEO) globaalsete satelliitnavigatsioonisüsteemide (GNSS), nagu Global Positioning System (GPS) ja Galileo, kõrval või asemel. See leht seob kokku mootori kõik LEO-PNT liigid ja stsenaariumid: mida igaüks arvutab, sagedusribad ja signaalide eelseadistused ning kust nende arvud pärinevad, mida navigatsioonisõnum kannab, mis on VALIDATED ja mis MODELLED ning kuidas iga stsenaariumi käivitada. Liigilehed lähevad sügavamale:

# text
seg-8e3556046e63 = Leht

# text
# c1: leo-signal
# c2: spectrum
seg-cdb06a47be0a = <c1/> (signaalikujundused) ja mitme sagedusribaga <c2/> paneelid

# text
# c1: leo-pass
seg-09894e033033 = <c1/> (läbilennu geomeetria ja sidelingi eelarve sagedusriba kaupa, väikese energiakuluga lahendused, ionosfääri sondeerimine, spuufimise seirajad)

# text
# c1: leo-navmsg
seg-f19c0bfe2996 = <c1/> (ringhäälestatud sõnum: sobitaja, kasutaja algoritm, binaar- ja tekstivormingud)

# text
# c1: leo-pvt
# c2: leo-ppp
# c3: ntn-positioning
seg-0fe4979f8309 = <c1/>, <c2/>, <c3/> (liidetud positsioneerimine, täppispunktpositsioneerimine, 5G mittemaapealse võrgu (NTN) positsioneerimine, ajastus, polaarkatvus)

# text
# c1: spectrum
seg-29013ad5656c = <c1/> (segamise juga-diagrammid ja segaja ja signaali suhe (J/S) sagedusriba kaupa)

# text
# c1: campaign
seg-d291250b5d01 = <c1/> (ahelad, pühked, Monte Carlo ja mis tahes liikide kompositsioonid)

# text
seg-8d2de8f77619 = Esmalt süsteemist sõltumatu

# text
seg-f3750a8f2863 = Mootor on üldine LEO-PNT simulaator. Mis tahes konstellatsioon (Walkeri muster, selgesõnalised orbiidielemendid, kaherealine elementide komplekt (TLE) Simplified General Perturbations { "4" } (SGP4) levitaja kaudu või kavandatud üksik läbilend), mis tahes signaalikujundus (mis tahes sagedusriba, mis tahes segu binaarse faasmanipulatsiooni (BPSK), binaarse nihkekandja (BOC) ja sagedusjaotusega hulgipöörduse (FDMA) komponentidest), mis tahes navigatsioonisõnumi mudel. Nimetatud süsteemid on valikulised eelseadistused: andmefailid, igaüks oma allikaga, mis täidavad ainult selle, mille stsenaarium välja jätab. Iga võimekus, test, sõltumatu etalon ja komplekti kuuluv stsenaarium töötab ilma Celeste'i andmeteta.

# text
# c1: src/celeste_iod.rs
# c2: build.rs
# c3: scenarios/*celeste-iod*.toml
# c4: tests/workshop_preset_isolation.rs
seg-4d3bd0301e59 = Celeste IOD (orbiidil demonstreerimise) eelseadistus on üks valikuline eelseadistus nende hulgas. Selle signaaliparameetrid esitati ESA NAVISP (Euroopa Kosmoseagentuuri Navigation Innovation and Support Programme) LEO-PNT töötoas { "2026" } ning neil pole veel avalikku allikat. Iga mootori töötoast pärinev arv asub ühes failis, <a1><c1/></a1>, mille <c2/> kompileerib sisse ainult siis, kui see olemas on, ja ainult hoidlas olevates stsenaariumides <c3/>. Selle faili ja nende stsenaariumide kustutamine hoiab eelseadistuse tagasi ilma lähtekoodi muutmata; iga muu test, sõltumatu etalon ja stsenaarium töötab ilma selleta (<c4/> valvab, millised failid võivad seda nimetada). See leht ei anna ühtki selle arvu.

# text
seg-5b348102cb63 = Liigid ja kuidas need seostuvad

# text
seg-120b9be05fc3 = signaalikujunduse ribapiiratud võimsusspektri tihedus (PSD), võimsus ribas, ruutkeskmine (Gaboři) ribalaius, koodijälgimise värin võrreldes kandelaine ja müra tihedusega (C/N0), omandamise otsing ja spektraalse eraldatuse koefitsiendid (SSC) GNSS-i signaalide vastu; sagedusribade kompromiss (ülikõrgsagedus (UHF), L, S, C)

# text
seg-d9febf3c74c8 = suletud kujuga valemid VALIDATED, kujundused ja kompromiss MODELLED

# text
# c1: spectrum
seg-d0d8d1edd9ee = <c1/> (mitme sagedusriba paneelid)

# text
seg-dc3ceb315e9a = sagedusribakaupa juga-diagrammid sagedusribakaupa segajatega (pidevlaine (CW), sirin, kitsasriba, lairiba, sobitatud), iga signaali J/S ja efektiivne C/N0 üle ajajoone

# text
seg-126a14392994 = spektrid VALIDATED, segajad MODELLED

# text
seg-e63f73ab5bca = läbilennu geomeetria, Doppler ja Doppleri kiirus, vabaruumi levikadu, satelliidi ja kasutaja antennid, ITU-R (International Telecommunication Union, Radiocommunication Sector) gaasiline sumbumine, vihm, skintillatsioon ja hoonesse sisenemise kadu, C/N0 sagedusriba ja epohhi kaupa MEO GNSS-i kandelainete kõrval; ionosfäär sagedusriba kaupa ja ionosfäärivabad paarid; väikese energiakuluga lahendused; ionosfääri sondeerimine; spuufimise seirajad

# text
seg-a9fd4162604f = komponendid VALIDATED, läbilend MODELLED

# text
seg-91304e663174 = ringhäälestatud efemeriidi- ja kellasõnum: sobitaja, signaal-ruumis kaugusviga (SISRE) võrreldes sobitusvahemiku ja uuendusperioodiga, läbilennu keskel uuenduse pidevus, kasutaja algoritm, binaarkaader 24-bitise tsüklilise liiasuskontrolliga (CRC-24Q), eksport RINEX { "4" } (Receiver Independent Exchange Format) stiilis ja komadega eraldatud väärtustena (CSV)

# text
seg-cf93a9ba065c = kasutaja algoritm, kaalud ja CRC VALIDATED, sobitused MODELLED

# text
seg-3084696ad387 = Doppleri positsioneerimine, ühine GNSS + LEO pseudovahemaa lahendus süsteemidevaheliste nihetega, polaar- ja Arktika geomeetria, aja edastamine koordineeritud maailmaajale (UTC), valikulise epohhikaupa ajavea jäljega

# text
seg-79117194e50b = maksimaalne Doppler VALIDATED, ülejäänu MODELLED

# text
seg-1de31fd3cf86 = täppispunktpositsioneerimise (PPP) koondumine ainult GNSS-iga ja LEO kihtidega

# text
seg-525733c10d9b = 5G NTN positsioneerimise täpsus allalingi ribalaiusest (Cramér–Rao piir)

# text
seg-cb8eee06e664 = üks süsteem otsast lõpuni: signaalikujundus, läbilend, sõnum, liidetud lahendus ja PPP, iga üleandmine loetletud

# text
seg-d28e18170f82 = mis tahes eelnevatest, aheldatuna ühel ajajoonel, pühitud, käivitatud Monte Carlo ansamblina või komponeeritud ühiste tingimuste all

# text
seg-5479654fabfd = Ahel annab väärtusi edasi koodis (vt allpool <a1>Otsast otsani LEO-PNT ahel</a1>): signaalikujundus määrab läbilennu sagedusriba EIRP (ekvivalentne isotroopselt kiiratud võimsus) jaotuse ja jälgitava kiibisageduse; läbilend annab jälgitava C/N0 ja koodivärina; navigatsioonisõnumi SISRE ja läbilennu C/N0 kaaluvad liidetud lahenduse LEO mõõtmisi.

# text
# c1: data/leo-signals/generic-bands.toml
# c2: generic-c-band.toml
seg-a0331a21413c = Üldised kujundused kasutavad avalikke sagedusribade keskpunkte; igaüks on REPRESENTATIVE, mitte ühegi süsteemi signaal (<c1/>, <c2/>).

# text
seg-a86ce24d81de = Sagedusriba

# text
seg-daf61ebdca17 = Eraldis

# text
seg-ba6fbebc2a98 = Üldine kujundus

# text
seg-3332ae549a90 = Keskpunkt

# text
seg-c7be6f6797a8 = Edastusribalaius

# text
seg-74f4e80c65cb = Komponendid

# text
seg-e95de3591152 = Esimese järgu ionosfääriviivitus võrreldes L-ga

# attr:title
seg-e769f0411e64 = Avaldaja poolt tagasi võetud; arhiivikoopiat pole

# text
seg-8b04e51a023e = ei ole raadionavigatsiooni eraldis (esinduslik); kandelaine avalikust <s1>openRECEIVER uuringust</s1> (leht on sellest ajast tagasi võetud; vt <a1>LEO-SIGNAL.md</a1>)

# text
seg-ea152d84aabc = { "465" } MHz

# text
seg-8a3026904912 = { "10" } MHz

# text
seg-e1500e8695b9 = BPSK({ "5" }) pilooti- ja andmekomponent

# text
seg-ac33d89291ca = raadionavigatsiooni-satelliitteenus (RNSS), Galileo E5 keskpunkt

# text
seg-278d0b375f6f = { "20.46" } MHz

# text
seg-54e10c07ace3 = BPSK({ "10" }) pilooti- ja andmekomponent

# text
seg-5e28b8377751 = raadiopositsioneerimise-satelliitteenus (RDSS), NavIC (Navigation with Indian Constellation) S-kandelaine

# text
seg-39e207bee75b = { "2492.028" } MHz

# text
seg-a573432714b8 = { "16.5" } MHz

# text
seg-6fe14d537f33 = RNSS, eraldise { "5010" }–{ "5030" } MHz keskpunkt

# text
seg-48fabff33863 = { "5020" } MHz

# text
seg-0b50907d3165 = { "20" } MHz

# text
seg-c43105d1c770 = C laiendatud

# text
seg-c05714081a0e = väljaspool RNSS eraldist (esinduslik)

# text
seg-638ab0837b29 = { "5100" } MHz

# text
seg-4d3857271629 = { "120" } MHz

# text
seg-18bc5451fc46 = BPSK({ "50" }) pilooti- ja andmekomponent

# text
seg-3714e1c00ab8 = S (mobiil-satelliitteenus, MSS)

# text
seg-cc26934bac14 = MSS allalink, 3GPP (Third Generation Partnership Project) riba n256

# text
# c1: ntn-positioning
seg-12ca7304ece7 = kasutab <c1/>

# text
seg-896b6ee57728 = { "2172.5" } MHz

# text
seg-e6e1d955489a = { "0.18" } kuni { "20" } MHz

# text
seg-50e44c7042c9 = 5G New Radio positsioneerimissignaalid

# text
# c1: (f_L/f)²
# c2: f_L
# c3: 20·log10(f/f_L)
seg-e75e48eeeca1 = BPSK(n) on binaarne faasmanipulatsioon kiirusel n × { "1.023" } Mchip/s. Viivituse suhe on <c1/>, kus <c2/> = { "1191.795" } MHz. Vabaruumi levikadu kasvab sama kauguse korral <c3/> võrra (−{ "8.2" } dB UHF-is, +{ "6.4" } dB S-is, +{ "12.5" } dB C-s).

# text
seg-02f71b44edf5 = Signaalide ja süsteemide eelseadistused

# text
seg-c60ce9c32b57 = REPRESENTATIVE, sagedusribade keskpunktid ITU raadiosidereeglitest

# text
# c1: generic-bands
# c2: generic-leo
# c3: leo-pass
seg-58fae66f7c12 = <c1/> (signaalikujundused): ülaltoodud sagedusribade tabel; <c2/> (vaikimisi <c3/>): UHF sagedusel { "450" } MHz, L, S ja C ülaltoodud keskpunktides, { "0" } dBW EIRP sagedusriba kohta, { "550" } km päikesesünkroonne Walker 240/12/1 kiht

# text
seg-5d918965c00c = BPSK({ "10" }) sagedusel { "5020" } MHz, isovoo kiir

# text
seg-dddb031a7e2e = PUBLIC: Leclère, Marathe ja Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>arXiv { "2509.19551" }</a1>

# text
seg-67fc4039084d = X1 sagedusel { "1593.3225" } MHz ({ "1.023" } Mchip/s) ja X5 sagedusel { "1190.51625" } MHz ({ "10.23" } Mchip/s), avaldatud minimaalne ja maksimaalne vastuvõetav võimsus, { "258" } satelliiti umbes { "1080" } km kõrgusel ({ "53" } ja { "97" } kraadi kestad)

# text
seg-f17f98d1ae0b = PUBLIC: <a1>Resilient Navigation and Timing Foundation (RNTF) ülevaade</a1>

# text
# c1: leo-pass
seg-c6694cdbb02b = impulsid { "1616" }–{ "1626" } MHz, Doppler kuni ±{ "36" } kHz, { "66" } satelliiti { "780" } km kõrgusel ({ "781" } km eelseadistuses <c1/>), vastuvõetav võimsus „{ "300" } kuni { "2400" } korda GPS“

# text
# c1: starlink-soo
# c2: starlink-soop
# c3: starlink-sop
seg-704ec002a889 = <c1/> / <c2/> / <c3/> (signaali-, läbilennu- ja positsioneerimisliigid)

# text
seg-a4a3a7c7bc22 = PUBLIC signaaliandmed: Kozhaya, Saroufim ja Kassas, <a1>NAVIGATION { "72" }({ "1" })</a1>; REPRESENTATIVE orbiit

# text
seg-49985bf11216 = { "240" } MHz Ku-riba majakas, mida kasutatakse ainult Doppleri jaoks, C/N0 umbes { "57" } dB-Hz

# text
seg-84cb50b019e0 = PUBLIC signaali struktuur: <a1>PMC10301026</a1>; REPRESENTATIVE orbiit ja võimsus

# text
seg-1c50faed9f1e = BPSK kiirusel { "2.046" } Mchip/s L1 ja L5 lähedal

# text
# c1: atomic-zero-clock
# c2: atomic
seg-c72e9b87f116 = <c1/> (<c2/> sõnumiliigis)

# text
seg-3dd4136094c0 = PUBLIC: <a1>InsideGNSS, ATOMIC (Autonomous Time and Orbit Determination for Microsatellite Constellations) kasulik koormus</a1>

# text
seg-4f0cff24b4fd = 6. astme polünoomefemeriid ilma kelliliikmeteta (kell on juhitud GNSS-i ajale)

# text
seg-9d1e7aebcd84 = WORKSHOP: esitatud ESA NAVISP LEO-PNT töötoas { "2026" }

# text
seg-28c2e7ae6065 = orbiidil demonstreerimise signaalikonfiguratsioon #1 ja sõnumipaigutus, ühes tagasihoitavas failis

# text
seg-9f0d16f43993 = Iga eelseadistus märgib oma arvud PUBLIC (URL-iga), REPRESENTATIVE (dokumenteeritud kavandusvalik, mitte kunagi väide reaalse süsteemi kohta) või WORKSHOP ning iga seda kasutava käivituse tulemus ütleb, milline.

# text
seg-556fe9c6c3b1 = Navigatsioonisõnum

# text
seg-a220662ed8de = LEO navigatsioonisõnum (<a1>LEO-NAVMSG.md</a1>) kannab nelja osa, struktuuri, mida jagavad Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD) ja avaldatud LEO ettepanekud:

# text
seg-5bda276f6e82 = Galileo ICD 16-parameetriline Kepleri komplekt (pooltelje ruutjuur, ekstsentrilisus, kaldenurk ja selle muutuskiirus, tõusva sõlme rektastsensioon ja selle muutuskiirus, periapsise argument, keskmine anomaalia, keskmise liikumise parandus, kuus harmoonilist parandust, tugiaeg) pluss piki-, risti- ja radiaalsuunalised parandupolünoomid; või Liu jt { "2025" } 22-parameetriline mudel (<a1>doi 10.3390/rs17162894</a1>); või ATOMIC nullkella polünoom

# text
seg-8a7dabfece01 = nädalanumber ja nädala aeg (TOW) ning teise astme kellapolünoom (af0, af1, af2 ajahetke toc suhtes)

# text
seg-24eaf4ae7eb3 = kosmoseaparaadi identifikaator (SVID), andmeväljaanne (IOD), signaali tervis

# text
seg-e7d819b7a724 = ionosfäärikorrektsioonid ühe sagedusega kasutajatele (Klobuchari-laadne komplekt ja NeQuick-G ai0–ai2) ning süsteemiaja ja UTC vaheline nihe (A0, A1, lisasekundid ja nende ajakava)

# text
seg-200e59d9279c = Binaarkaader on Kshana enda dokumenteeritud kodeering, mis on modelleeritud nende komponentide järgi, mitte ühegi süsteemi bitipaigutus. RINEX { "4.02" } ei määratle ühtki LEO navigatsioonikirjet, seega on RINEX-laadne eksport dokumenteeritud Kshana laiendus (varasem töö: <a1>arXiv { "2401.17767" }</a1>).

# text
# c1: campaign
# c2: spectrum
seg-aa18ab84599b = <c1/> pühe <c2/>

# text
seg-70dc120ea19e = { "50" } MHz laiune barraaž sagedusel { "1185" } MHz, pühitud −{ "140" }-st −{ "80" } dBW-ni: GPS L5 kaob −{ "105" } dBW juures, Galileo E5a ja LEO L-riba signaal −{ "100" } dBW juures; LEO UHF-, S- ja C-riba signaalid säilitavad { "49.4" }, { "49.2" } ja { "47.4" } dB-Hz igal võimsusel

# text
seg-61f05d7e3a18 = { "40" } MHz laiune barraaž sagedusel { "1185" } MHz, mis tõuseb { "5" } dB iga { "10" } s järel alates −{ "125" } dBW-st: GPS L5 kaob −{ "105" } dBW juures, Galileo E5a −{ "100" } dBW juures, Xona X5 (oma avaldatud miinimumil, −{ "144.9" } dBW) −{ "95" } dBW juures; üldine LEO signaal −{ "135" } dBW juures jälgib endiselt −{ "90" } dBW juures ({ "28.9" } dB-Hz). Vastuvõetav võimsus ostab J/S varu dB-lt dB-le

# text
seg-6a3a46be60a5 = { "30" } m asukohahüpe mõõdistatud asukohas: ainult GNSS-i Doppleri test ei tuvasta seda kunagi; iga kanali test tuvastab, { "105" } s pärast algust (vt <a1>LEO-PASS.md</a1>)

# text
# c1: campaign
# c2: leo-pass
seg-d0c4683d7c93 = <c1/> kompositsioon <c2/>

# text
seg-bf0ec52f63ea = neli spuuferit, mõlemad seirajad: ainult L-riba spuufer ja kõigi sagedusribade spuufer ilma ionosfäärita tabatakse sagedusribadevahelise seirajaga algushetkel ({ "300" } s) ja Doppleri seirajaga { "420" } s ja { "395" } s juures; ionosfääri arvestav kõigi sagedusribade spuufer ainult Doppleri seirajaga ({ "395" } s); ainult GNSS-i { "30" } m lükke ei tuvasta kumbki

# text
# c1: campaign
# c2: spectrum
# c3: integrity
seg-17bcc4ead2ee = <c1/> ahel (<c2/>, <c3/>)

# text
seg-d9b6e6fe6807 = GNSS segatud { "15" } minutit (GPS L1 jämekoodi/omandamise (C/A) kood umbes { "10" } dB-Hz-ni, E5a { "17.4" } dB-Hz-ni { "25" } dB-Hz põranda vastu), samal ajal kui S- ja C-riba LEO signaalid hoiavad { "49.2" } ja { "47.4" } dB-Hz; vastuvõtja autonoomne terviklikkuse seire (RAIM) ainult LEO kihil moodustab kaitsetaseme igal epohhil, mis jääb { "50" } m vertikaalse häirepiiri alla { "28" } { "30" } ruudustikuajast, ülejäänud kahe puhul antakse häire; nominaalne ja taastumisfaas { "5.4" } kuni { "15.6" } m

# text
# c1: multi-band-jamming-waterfall
seg-42efdd12fc54 = Spuufimise seirajad, nende statistikud ja piirangud on failis <a1>LEO-PASS.md</a1>. Mitme sagedusriba juga-diagramm iga sagedusriba erineva segajaga on <c1/> (<a2>LEO-SIGNAL.md</a2>).

# text
seg-d9e58c4aa8d5 = Üks stsenaarium iga katsete fookusvaldkonna kohta

# text
seg-1ab626f27e9d = Celeste IOD kolmandate osapoolte katsetamise kutse (ESA Open Space Innovation Platform, OSIP) kaheksa katsete fookusvaldkonda on üldised LEO-PNT küsimused; igaühel on süsteemist sõltumatu stsenaarium:

# text
seg-afc60ca3c9da = Fookusvaldkond

# text
seg-8a8f40ce3e40 = Suure täpsusega positsioneerimine (PPP)

# text
# c1: campaign
# c2: leo-ppp
seg-b5eb3448dbb1 = <c1/> pühe <c2/>

# text
seg-5692301bc7cf = 192 satelliidi kiht kõrgusel { "500" }, { "1000" } ja { "1500" } km lühendab multi-GNSS-i ujuv-PPP koondumist Münchenis { "13.0" } minutilt { "3.25" }, { "3.25" } ja { "3.5" } minutini (kuus realisatsiooni, { "30" } s epohhid)

# text
seg-3992215bc8c9 = PNT vastupidavus (L, S, C)

# text
seg-a2cc270b415c = vt Vastupidavus

# text
seg-8a6381ff15ac = 5G/6G NTN ühilduvus

# text
# c1: campaign
# c2: ntn-positioning
seg-ae21ac79775f = <c1/> pühe <c2/>

# text
seg-cb52e7eb3c36 = positsioneerimise tugiribalaius { "180" } kHz kuni { "20" } MHz: seniidikauguse sigma { "6.5" } m kuni { "5.8" } cm, saabumisaja 3D viga { "30.1" } m kuni { "2.1" } m, piiratud { "1" } m võrgu sünkroniseerimisveaga

# text
seg-45985b521980 = Väikese energiakuluga PNT asjade internetile (IoT) ja mobiilile

# text
# c1: campaign
# c2: leo-pass
# c3: [iot]
seg-9afaaed509ef = <c1/> pühe <c2/> <c3/>

# text
seg-3bb8cc776a28 = UHF EIRP −{ "35" } kuni +{ "5" } dBW: alla mediaan-C/N0 umbes { "35" } dB-Hz tõuseb kuumkäivituse energia lahenduse kohta { "18" } mJ-lt { "55" } J-ni; selle kohal on aku eluiga ühe lahenduse korral tunnis { "8334" } päeva, mille määrab unevool

# text
seg-4b0890bd9215 = LEO-PNT teadus

# text
seg-a1ddeda103fa = kaldsuunaline täielik elektronsisaldus (TEC) neljasagedusriba läbilennu iga sagedusribapaarist Tromsø kohal: { "18.85" } TEC ühikut taastatud iga paari poolt, 1-sigma { "0.017" } (UHF koos L-iga) kuni { "2.9" } TEC ühikut (S koos C-ga)

# text
seg-fc31db33e6fe = Täiendavad PNT andmeteenused

# text
# c1: campaign
# c2: leo-navmsg
seg-91db4e7b4d9c = <c1/> kompositsioon <c2/>

# text
seg-aee8bb27a2fb = Kshana sõnumikaader kasvab { "146" } baidilt (efemeriid ja kell, { "1045" } bitti) { "154" }-ni Klobuchari komplektiga, { "159" }-ni NeQuick-G-ga ja { "171" }-ni UTC parameetritega

# text
seg-bd6c76037986 = Siseruumide navigatsioon (UHF)

# text
seg-0a274a3aeb86 = tipu siseruumide C/N0 traditsioonilises hoones: UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "9.0" } dB-Hz; soojustõhusas hoones UHF { "15.3" } dB-Hz ja iga muu sagedusriba madalam

# text
seg-101de8218f35 = MEO + LEO liidetud PNT

# text
# c1: campaign
# c2: leo-pvt
seg-b4daa58a2fe7 = <c1/> pühe <c2/>

# text
seg-903d8dcb96cc = Xona X5 liidetud GPS-i ja Galileoga Madridi kohal: ainult GNSS-i 3D viga { "1.06" } m ruutkeskmine (RMS); liidetud { "0.08" } m { "5" } cm LEO SISRE korral, { "0.57" } m { "0.5" } m korral ja { "1.01" } m { "5" } m korral

# text
seg-ebe7a27275cb = Üks stsenaarium iga lõppkasutaja vertikaali kohta

# text
# c1: campaign
# c2: leo-pass
seg-7c21d067769a = Iga vertikaal on ühe ajajoonega <c1/> ahel, seega see animeeritakse, ja igal on <c2/> liige, seega see ekspordib geomeetria (vt <a1>Käivitamine</a1>).

# text
seg-1d1135625500 = Vertikaal

# text
seg-f1a7e54ea7d0 = Autonoomsed sõidukid

# text
seg-3610a5f7c352 = auto Münchenis: avatud tee, liidetud viga keskmiselt { "0.30" } m; { "35" }-kraadises linnakanjonis jätab GPS ja Galileo { "8" } satelliiti ja { "5.8" } m keskmise vea, üldine LEO kiht lisab { "4" } kuni { "5" } ja toob selle { "2.1" } m-ni, mis on ikka üle { "1.5" } m sõidurajatasandi läve umbes poolel kanjoni epohhidest

# text
seg-6622d9c7366d = Raudtee ja mereliiklus

# text
# c1: maritime-strait-jamming
# c2: rail-tunnel-coast
seg-73ba745cb492 = komplekti kuuluv <c1/> laev kaotab iga GNSS-i satelliidi ({ "12.1" } dB-Hz), samal ajal kui selle S- ja C-riba LEO läbilend saavutab { "44.2" } ja { "38.1" } dB-Hz; komplekti kuuluv <c2/> rong jõuab { "2" } m inertsiaalse veani { "35.8" } s pärast tunnelisse sisenemist; avatud kohas annab selle LEO läbilend L-ribas { "35" } kuni { "50" } dB-Hz

# text
seg-c87973b9139a = Kriitiline taristu

# text
seg-c16a4c99e132 = alajaama ajaserveri TCXO-klassi ostsillaator (temperatuurikompenseeritud kvarts), mis töötab päeva vabalt ilma GNSS-ita, jõuab { "29" } µs-ni, ületades { "1" } µs valvepiiri { "75" } ja { "80" } minutit pärast kadu (5-minutilisel ruudustikul); sama klass, mis on Iridiumile distsiplineeritud, püsib vahemikus −{ "40" } kuni +{ "11" } ns

# text
seg-1be8e11b2530 = Polaar- ja Arktika kasutajad

# text
seg-660e450cb4ab = GPS + Galileo keskmine asukoha täpsuse halvenemise tegur (PDOP) { "1.38" }, { "1.57" } ja { "1.62" } Tromsøs, Svalbardil ja Põhjapoolusel; Iridiumiga { "1.29" }, { "1.34" } ja { "1.26" }, nähtavast { "3.0" }, { "5.5" } ja { "6.8" } Iridiumi satelliidist

# text
seg-22d99734acf1 = Juhtmevabad võrgud 5G/6G

# text
# c1: telecom-timing
seg-abcc6337206f = tugijaama ahjustatud kvartsostsillaator (OCXO) holdoveris ületab { "1.1" } µs võrgupiiri { "8863" } s pärast ja { "1.5" } µs lõpprakenduse piiri { "10006" } s pärast (liigi <c1/> analüüs); Xona X5-le distsiplineerituna püsib selle ajaviga terve päeva vahemikus −{ "0.7" } kuni +{ "0.3" } ns, ennustatud 1-sigmaga { "5" } ns, mis on ringhäälestatud UTC nihke märgitud määramatus

# text
seg-532d6814ab2d = Varade jälgimine ja IoT

# text
seg-b4d6d822e1d0 = konteineri märgi kuum UHF lahendus maksab { "18" } mJ kai ääres ja merel ({ "8334" } päeva akut ühe lahenduse korral tunnis) ja { "34" } mJ laos ({ "5770" } päeva), kus L-riba langeb { "20" } kuni { "24" } dB-Hz-ni

# text
seg-e54b0342fa79 = VALIDATED ja MODELLED

# text
seg-dd808d1741f3 = Rida on VALIDATED ainult siis, kui test reprodutseerib avaldatud seadistuse ja kinnitab avaldatud arvu märgitud tolerantsi piires; kõik muu on MODELLED koos põhjendusega (<a1>VERIFICATION-MATRIX.md</a1>, <a2>MODELLED-RATIONALE.md</a2>).

# text
seg-592a6cf625c5 = VALIDATED LEO-PNT read:

# text
seg-344712930047 = suletud kujuga ribapiiratud signaalivõimsus ja varase-hilise koodijälgimise värin avaldatud töökohtades (Betz ja Kolodziejski { "2009" }), Gaboři ribalaiuse ja SSC ristkontrolliga;

# text
seg-e93d5b5d3dda = LEO navigatsioonisatelliidi maksimaalne Doppler (Xona Pulsar X1 { "32" }–{ "34" } kHz, Iridium ±{ "36" } kHz) ja staatilise kasutaja Doppleri ümbrik arXiv { "2509.19551" } tabeli { "1" } vastu;

# text
seg-b02c1b42e509 = ITU-R P.838-3 vihmakoefitsiendid, P.618-14 vihmasumbumine ja troposfääri skintillatsioon ning P.2109-2 hoonesse sisenemise kadu ITU-R Study Group { "3" } valideerimisandmete vastu;

# text
seg-fc668542b66d = esimese järgu ionosfääriviivituse skaleerimine ja vabaruumi levikadu (IS-GPS-200 grupiviivituse suhe, Friisi kuju);

# text
seg-59847c667c8b = globaalkeskmise SISRE kaalud (Montenbruck jt { "2018" }), Galileo ICD kasutaja algoritm RTKLIB-i vastu reaalsetel ringhäälestatud efemeriididel ja CRC-24Q oma kataloogi kontrollväärtuse vastu.

# text
seg-922761c46f8a = MODELLED LEO-PNT read: iga signaalikujundus ja sagedusribade kompromiss, mitme sagedusriba juga-diagramm, iga läbilend ja sidelingi eelarve tervikuna, eelseadistused, väikese energiakuluga lahendused, sõnumi sobitaja ja vormingud, Doppler ja ühine positsioneerimine, PPP koondumine, NTN positsioneerimine, aja edastamine, polaarkatvus, otsast otsani ahel, spuufimise seirajad ja ionosfääri sondeerimine ning iga kampaania (kampaania komponeerib liike ega lisa füüsikat; selle kompositsiooni samasusi testitakse, <a1>CAMPAIGNS.md</a1>). Ühtegi LEO C/N0, kaugusviga ega positsioneerimisarvu ei võrrelda ühegi satelliidi mõõtmisega.

# text
seg-3cc1d3f1c0f8 = Stsenaariumi käivitamine

# text
# c1: kshana example <name>
seg-00d5b60c0ebb = Iga ülaltoodud stsenaarium kuulub komplekti: <c1/> väljastab selle ja

# text
# c1: .result.json
# c2: .chart.svg
# c3: .report.html
# c4: .report.json
# c5: .animation.html
seg-e01ebe977e65 = kirjutab faili kõrvale tulemuse (<c1/>), diagrammi (<c2/>), täiustatud aruande (<c3/> ja <c4/>, koos jaotisega, mis põimib animeeritud käivituse ja loetleb eksportid), interaktiivse esitaja (<c5/>) ja eksportid. Mis kehtib, sõltub liigist:

# text
# c1: leo-pass
# c2: spoof.series
# c3: spectrum
# c4: leo-pvt
# c5: leo-ppp
# c6: --animate
# c7: leo-resilience-multiband-diversity
# c8: leo-resilience-spoof-monitors
# c9: leo-focus-*
# c10: leo-focus-science-iono-sounding
# c11: --animate
seg-8a96eda978b4 = ajateljega käivitus animeeritakse: <c1/> epohhid, spuufimise käivituse <c2/>, <c3/> ajajooned, <c4/> ühised epohhid ja ajaveajäljed, <c5/> veakõverad ja iga kampaania ahel. Pühkel või kompositsioonil pole ajatelge: <c6/> lükkab selle tagasi väljumisstaatusega { "1" } ja siis ei kirjuta käsk üldse midagi, seega käivita kaheksa pühet ja kompositsiooni ülal (<c7/>, <c8/> ja iga <c9/> stsenaarium peale <c10/>) ilma <c11/>;

# text
# c1: leo-pass
# c2: leo-pnt-chain
# c3: <name>.<member>.czml
seg-8d26148aeeff = <c1/> ja <c2/> ekspordivad läbilennu geomeetria CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON ja STK (Systems Tool Kit) efemeriidid; kampaania ekspordib iga geomeetriaga liikme eraldi failikomplektina, liikme silt failinimes (<c3/>), seega iga vertikaal ekspordib oma LEO läbilennud; teised LEO liigid ütlevad, miks vorming ei kehti (<a1>INTEROP.md</a1>).

# text
seg-6f3ad057f914 = Ülejäänud LEO stsenaariumid liikide kaupa (üksikasjad iga liigi lehel):

# text
# c1: leo-band-trade
# c2: xona-pulsar-signals
# c3: celeste-iod-classical-pilot-signals
seg-73365a12bf64 = <c1/>, <c2/>, valikuline <c3/>

# text
# c1: leo-pass-vs-gnss-cn0
# c2: leo-pass-xona-pulsar
# c3: leo-pass-iridium
# c4: leo-indoor-uhf
# c5: leo-iot-energy
# c6: leo-pass-celeste-iod-multiband
seg-f34e2d4b3374 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, valikuline <c6/>

# text
# c1: leo-navmsg-fit-interval-trade
# c2: leo-navmsg-model-comparison
# c3: leo-navmsg-midpass-update
# c4: leo-navmsg-encode-decode
# c5: leo-navmsg-celeste-iod
seg-559eaf4bafa1 = <c1/>, <c2/>, <c3/>, <c4/>, valikuline <c5/>

# text
# c1: leo-doppler-positioning
# c2: starlink-sop-doppler-positioning
# c3: meo-leo-fused-pvt
# c4: polar-arctic-leo-coverage
# c5: leo-timing-utc
# c6: celeste-iod-fused-pvt
seg-731d447261fc = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, valikuline <c6/>

# text
# c1: leo-pnt-end-to-end
# c2: xona-pulsar-end-to-end
# c3: celeste-iod-end-to-end
seg-e3017b224dfc = <c1/>, <c2/>, valikuline <c3/>

# text
seg-1ada84b384ee = Valikulised stsenaariumid on ainult hoidlas ja hoitakse tagasi koos Celeste'i eelseadistuse failiga.

# text
# c1: leo-pnt-mega-shell
# c2: constellation-design
# c3: slot-timing-ocxo-leo
# c4: slot-timing
seg-6305e46ec778 = Kaks neist asuvad teistes liikides. <c1/> (<c2/>) mõõdab 5000 satelliidi LEO-PNT konstellatsiooni nelja illustratiivse Walkeri kestana: kättesaadavus { "99.22" } % PDOP-i väärtusel { "3" } või vähem üle { "20" }° maski, mediaan-PDOP { "1.11" } ja keskmiselt { "39.4" } nähtavat satelliiti { "648" } ruudustikupunkti ja { "12" } epohhi peale. <c3/> (<c4/>) küsib, kui kaua LEO väikesatelliidi andmelehe OCXO püsib { "100" } ns pilu valvepiiri sees k = { "3" } korral pärast viimast GNSS-i lahendust: valve katkeb { "650.8" } s pärast lahendust, seega vajab ta lahendust vähemalt iga { "645.8" } s järel ({ "133.8" } päevas), kusjuures juhusliku käimise sagedusmüra on domineeriv liige.

# text
seg-ee9f20a4485b = Otsast otsani LEO-PNT ahel

# text
# c1: leo-pnt-chain
# c2: src/leo_pnt_chain.rs
seg-a6167db680ba = Liik <c1/> (<a1><c2/></a1>) jälgib ühte LEO-PNT süsteemi selle signaalikujundusest kuni kasutaja asukohani. Iga etapp on mootori enda liik, käivitatud ahelstsenaariumi oma tabelil, ja ahel annab väärtusi ühelt etapilt järgmisele koodis edasi:

# text
seg-38ce4c90dd78 = Allikast

# text
seg-2cbf005ed5cc = Sihtkohta

# text
seg-5d84d64174b6 = Mida edasi antakse

# text
seg-15372352ab42 = jälgitava komponendi võimsusosa, ribasisene osa ja jälgitav kiibisagedus (sagedusriba EIRP jaotus ja selle C/N0 nihe)

# text
# c1: [navmsg.orbit]
seg-0be525c6b695 = ahela satelliidi kõrgus ja kaldenurk (sõnumi tõeline orbiit), kui <c1/> neid ei määra

# text
seg-d2306e118be7 = jälgitav C/N0 positsioneerimismaski juures ja seniidis, läbilennule sobitatud vähimruutude sirgest muutujas sin(kõrgusnurk)

# text
# c1: od_sisre_m
seg-ee40b8cd109b = signaal-ruumis kaugusviga (SISRE): sõnumi esitusviga (ruutkeskmine, orbiit ja kell) koos stsenaariumi <c1/> orbiidi määramise liikmega ruutsummana

# text
seg-b4b3dff58f3b = kandesagedus ja jälgitav kiibisagedus

# text
# c1: handoffs
# c2: [pass]
# c3: signal = "<design>"
# c4: leo-pass
# c5: leo-signal
seg-4def115dba1b = Väärtus antakse edasi ainult seal, kus järgmine tabel selle jätab määramata, ning iga üleandmine on loetletud tulemuse massiivis <c1/> koos selle väärtuse, ühiku ja sihtkohaga. Sagedusriba <c2/> peab nimetama kujunduse (<c3/>); nii kannab ka sagedusriba <c4/> iga <c5/> kujundust iseseisvalt: see võtab kujunduse keskssageduse, edastusribalaiuse ja jälgitava kiibisageduse, jagab oma EIRP komponentide vahel ning annab igal epohhil aru jälgitava komponendi C/N0-st ja ribapiiratud koherentse varase-hilise koodijälgimise värinast (Betz ja Kolodziejski { "2009" }; poolkiibi vahe, { "1" } Hz silmus, { "20" } ms).

# text
# c1: generic-l
seg-2a2b15256cf4 = üldine: esindusliku <c1/> kujundus, { "1080" } km, { "53" }° läbilend Madridi kohal, 240 satelliidi Walkeri kiht

# text
seg-bb05e8e505e3 = jälgitav C/N0 tipp { "58.2" } dB-Hz, mediaan-koodivärin { "0.050" } m; SISRE { "0.250" } m antud edasi; ainult GNSS-i ruutkeskmine (RMS) 3D viga { "1.60" } m, GNSS + LEO { "0.43" } m; täppispunktpositsioneerimise (PPP) koondumine { "11.5" } min ainult GNSS-iga, { "7.5" } min LEO kihiga

# text
seg-4d1299ee4725 = Xona Pulsar X5 (arXiv { "2509.19551" }), kaldkest positsioneerimiseks ja mõlemad kestad PPP jaoks

# text
seg-a8fe501bf419 = jälgitav C/N0 tipp { "66.3" } dB-Hz, mediaan-koodivärin { "0.018" } m; ainult GNSS-i RMS 3D viga { "1.49" } m, GNSS + LEO { "0.68" } m; PPP koondumine { "20.6" } min ainult GNSS-iga, { "5.9" } min Pulsariga

# text
# c1: celeste-iod-end-to-end
seg-002e4c918dda = <c1/> (valikuline)

# text
seg-a608af78a360 = Celeste IOD E5 konfiguratsioon #1 koos Celeste'i sõnumi eelseadistusega (hoitakse tagasi koos eelseadistusega)

# text
seg-be428c21bd27 = läbilend reprodutseerib tipu koguvõimsuse C/N0, mille jaoks eelseadistus on kalibreeritud (väärtus asub eelseadistuse failis); kaks satelliiti liigutavad 95-minutilist liidetud lahendust vaevu ({ "1.50" } m kuni { "1.48" } m RMS 3D)

# text
seg-bf44ba47e48b = kirjutab tulemuse, diagrammi, täiustatud aruande (mis põimib animeeritud läbilennu ja lingib eksportidele), interaktiivse esitaja ning läbilennu geomeetria CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON ja STK (Systems Tool Kit) efemeriidifailid.

# text
# c1: od_sisre_m
seg-a08e67a32d60 = Ahel on MODELLED: see ei lisa füüsikat ja iga etapp säilitab oma sildid. Positsioneerimisetapi C/N0 mudel on sirge muutujas sin(kõrgusnurk), seega taandatakse läbilennu eripärane kuju kaheks arvuks; sõnumietapp ei modelleeri orbiidi määramist, mistõttu on <c1/> märgitud sisend ({ "0.25" } m komplekti kuuluvates stsenaariumides, esinduslik detsimeetritasemel pardal toimuva orbiidi määramise ja juhitud kiibiskaalas kella kohta, mida ATOMIC kasulik koormus esitab: <a1>https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/</a1>).

# text
seg-ee3c5b58e6fa = <s1>Eelmine</s1>Kuu orbiit ja pind taristuna

# text
seg-6b951d6413c8 = <s1>Järgmine</s1>LEO signaalikujundused

seg-9bfe27f7ebc5 = <s1>Eelmine</s1>Missiooniahel: Kuu lõik
