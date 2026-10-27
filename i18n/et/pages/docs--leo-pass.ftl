# docs--leo-pass: translations (et)

# text
seg-cae10fb9bff8 = Stsenaarium

# text
seg-cbf0f9bcd2d8 = Oraakel (sõltumatu etalon)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-f63dd3d7aad4 = Allikas

# text
seg-587beeccaa11 = Eelseade

# text
seg-1ff32b87e030 = Satelliidid

# text
seg-a6c63abeb7e6 = Kaasasolevad stsenaariumid

# text
seg-60cd077d82a7 = Mudel

# text
seg-2b0d77219437 = Eelseadistused

# text
seg-5566e1d71a4f = Orbiit

# text
seg-c2a2761f73b1 = { "550" } km, { "53" }°

# text
seg-c5ce76c91ff7 = Silt

# text
# c1: docs/LEO-PASS.md
seg-813d372bda81 = Source: <c1/>

# text
# c1: leo-pass
seg-0bd4af67ffdb = LEO läbilend ja sidelingi eelarve (<c1/>)

# text
# c1: leo-pass
seg-30417c63c48e = LEO-PNT on positsioneerimine, navigatsioon ja aeg (PNT) madala Maa orbiidi (LEO) satelliitidelt. Liik <c1/> simuleerib ühte või mitut LEO satelliidi läbilendu kasutaja kohal ning arvutab sidelingi eelarve sagedusribade kaupa, kõrvuti nähtavate keskmise Maa orbiidi (MEO) GNSS-i (ülemaailmse satelliitnavigatsioonisüsteemi) satelliitidega. Mootor on <b>süsteemist sõltumatu</b>: mis tahes konstellatsioon, mis tahes signaalikujundus ja mis tahes sagedusriba, kirjutatud otse stsenaariumisse. Nimetatud süsteemid on valikulised eelseadistused, igaüks oma failis koos allikaga.

# text
# c1: src/leo_pass.rs
# c2: src/leo_link/
seg-242c84daecb0 = Kood: <a1><c1/></a1> (liik) ja <a2><c2/></a2> (avalikud ehituskivid, mida teised moodulid võivad kutsuda).

# text
# c1: leo-pass-vs-gnss-cn0
# c2: leo-indoor-uhf
# c3: leo-iot-energy
# c4: leo-pass-xona-pulsar
# c5: leo-pass-iridium
# c6: leo-resilience-spoof-doppler
# c7: leo-focus-science-iono-sounding
# c8: leo-pass-celeste-iod-multiband
# c9: leo-resilience-spoof-monitors
# c10: leo-focus-iot-eirp
# c11: leo-focus-indoor-uhf
# c12: leo-vertical-*
# c13: leo-pnt-chain
seg-0e6b09e372f5 = Stsenaariumid: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> ja valikuline <c8/> (tulemused jaotises <a1>Komplekti kuuluvad stsenaariumid</a1>). Liik on ühtlasi kampaaniate <c9/>, <c10/>, <c11/> ja iga <c12/> stsenaariumi liige ning liigi <c13/> läbilennuetapp.

# text
seg-59cebed2f589 = Kõigi LEO-PNT liikide ja stsenaariumide ülevaade: <a1>LEO-PNT.md</a1>.

# text
# c1: tests/leo_link_reference.rs
# c2: tests/fixtures/leo_link/
seg-9646ce17cddf = Oraaklid (sõltumatud etalonid): <a1><c1/></a1>, testandmed kataloogis <c2/> koos nende allika URL-idega.

# text
seg-c1020ac47091 = Mida üks käivitus arvutab

# text
seg-10dedc607eac = Iga LEO satelliidi, sagedusriba ja epohhi kohta:

# text
seg-35bf9a48e566 = Termin

# text
seg-b0f12ee05fe9 = Kõrgusnurk, asimuut, kaugus

# text
seg-24ad909c4fb8 = WGS-84 (World Geodetic System { "1984" }) kasutaja, satelliit inertsiaalsüsteemis, mis epohhil ühtib Maaga seotud süsteemiga

# text
seg-c9f61c3348ef = arvutatud

# text
# c1: ρ̇ = d·Δv/ρ
# c2: ρ̈ = (|Δv|² − ρ̇² + d·Δa)/ρ
seg-ebd800ec3d47 = Kaugusemuutuse kiirus <c1/>, kaugusemuutuse kiirendus <c2/>

# text
seg-232b42b71f03 = suletud kuju; iga käivitus kontrollib mõlemat levitatud kauguse tsentraalsete vahede vastu ja annab aru suurimast erinevusest

# text
seg-b3a55e868346 = suletud kuju

# text
# c1: −f·ρ̇/c
# c2: −f·ρ̈/c
seg-3f1f90a57c2f = Doppler <c1/>, Doppleri kiirus <c2/>

# text
seg-852b6c351ce4 = esimene järk, sagedusriba kaupa

# text
seg-4eb4b779679b = Vabaruumi levikadu

# text
# c1: 20·log10(4πRf/c)
seg-31f67bcd2d50 = Friis, <c1/>

# text
seg-fb5f06a91de1 = Satelliidi EIRP (ekvivalentne isotroopselt kiiratud võimsus) ja kiirgusdiagramm

# text
# c1: −12(η/θ₃)²
seg-883702244778 = isovoog äärmise kõrgusnurgani, Gaussi peasagar <c1/> dB või tasane

# text
seg-b6e91c5252d3 = Kasutaja antenn

# text
# c1: G_z + 10·q·log10(sin el)
seg-ed92a0abf62f = plaaster <c1/> dBic, poolkerakujuline või isotroopne

# text
seg-0ac54d232e0a = Gaasiline sumbumine

# text
seg-30fb5b0a0bc7 = ITU-R (International Telecommunication Union, Radiocommunication Sector) P.676-10 lisa { "2" } lihtsustatud avaldised (asendatud standardiga P.676-13, mille tabuleeritud koefitsiente mootor ei kanna)

# text
seg-58d58478e9eb = Vihmasumbumine

# text
seg-4c1e413d5fc3 = ITU-R P.838-3 koefitsiendid ja P.618-14 § { "2.2.1.1" } protseduur vihmaintensiivsusest R0.01 ja vihmakõrgusest

# text
seg-dab78c0552b6 = Troposfääri skintillatsioon

# text
seg-8e5ca14cbf08 = ITU-R P.618-14 § { "2.4.1" }; alla { "4" } GHz ekstrapolatsioon, mis on aruandes märgitud

# text
seg-788516420351 = VALIDATED ({ "4" }–{ "55" } GHz)

# text
seg-32dddfdba584 = Hoonesse sisenemise kadu (siseruumides kasutaja)

# text
seg-ef9025622e81 = ITU-R P.2109-2, traditsiooniline või soojustõhus, tee kõrgusnurga juures fassaadil

# text
seg-c7d1bccd4d51 = Polarisatsiooni mittesobivus

# text
seg-f4aaea269382 = polarisatsioonikadu tegur teljesuhetest ja suundadest, keskmistatud üle ellipsi orientatsiooni

# text
seg-96601850a9d5 = Süsteemi müratemperatuur

# text
# c1: 290(10^(NF/10) − 1)
seg-82735c7f3ea5 = antenni põhi + neelava tee taevakiirgus ({ "275" } K) + kosmiline { "2.7" } K + vastuvõtja <c1/>

# text
seg-53ce973b0ee7 = C/N0 (kandelaine ja müra tiheduse suhe)

# text
seg-fa01d060cf1a = Ionosfääri grupiviivitus

# text
# c1: 40.3·STEC/f²
seg-33f2113dea70 = <c1/>, STEC (kaldsuunaline täielik elektronsisaldus) Klobuchari mudelist või vertikaalsest täielikust elektronsisaldusest (TEC), skaleeritud Chapmani kihi satelliidi alla jääva osa järgi

# text
seg-431dfeb5edba = skaleerimine VALIDATED, TEC MODELLED

# text
# c1: √(a₁² + a₂²)
# c2: [iot]
seg-56df31449434 = Sagedusribapaari kohta: ionosfäärivabad koefitsiendid, müravõimendus <c1/> ning iga sagedusriba ja kombinatsiooni termiline koodimüra läbilennu tipul. MEO GNSS-i võrdlus kasutab sama kasutaja antenni ja vastuvõtjat, iga signaali liidese dokumendi minimaalse vastuvõetava võimsusega (Galileo Open Service Signal-in-Space Interface Control Document, OS SIS ICD, väljaanne { "2.1" } tabel { "12" }; GPS dokumentidest IS-GPS-200 ja IS-GPS-705), pluss märgitud ülemäär, skaleeritud kaugusega. Valikuline <c2/> (asjade interneti) jaotis annab esimese lahenduseni kuluva aja, energia lahenduse kohta ja aku eluea töötsükli suhtes märgitud vastuvõtja võimsuseelarve korral (MODELLED, iga eeldus on sisend ja loetletud aruandes).

# text
# c1: orbit = "pass"
seg-7132ede02109 = <c1/> (vaikimisi): ringorbiit, mis on paigutatud nii, et kasutaja näeb ühte läbilendu valitud maksimaalse kõrgusnurgaga valitud ajal, tõusval või laskuval, kasutajast ida- või läänepool; kaldenurk võib olla päikesesünkroonne.

# text
# c1: orbit = "elements"
seg-688307acbf0d = <c1/>: selgesõnalised Kepleri elemendid.

# text
# c1: orbit = "tle"
seg-e9085739bcb8 = <c1/>: kaherealine elementide komplekt (TLE) mootori Simplified General Perturbations { "4" } (SGP4) levitaja kaudu.

# text
# c1: [[leo_constellation]]
# c2: constellation-design
# c3: ConstellationCfg
seg-7dcc5fdbc249 = <c1/>: Walkeri konstellatsioon, mille koostab kood <c2/> (selle <c3/> või eelseadistuse kestad); aknas esitatakse kõrgeimad läbilennud.

# text
seg-ec7e163dd073 = Sagedusribad ja signaalikujundused

# text
# c1: system = "<preset>"
# c2: bands
# c3: [[satellite.band]]
# c4: system = "none"
# c5: [[satellite.band]]
seg-4d49743b3544 = Sagedusribad: <c1/> valikulise <c2/> alamhulgaga ning <c3/> kirjed, mis lisavad sagedusriba või alistavad eelseadistatud riba mis tahes välja. <c4/> ainult <c5/> kirjetega ei kasuta eelseadistust üldse.

# text
# c1: leo-signal
# c2: signal = "xona-x5"
# c3: data/leo-signals/
# c4: leo-pnt-chain
# c5: frequency_mhz
# c6: leo-signal
seg-bd1e114aaea6 = Sagedusriba võib nimetada ka <c1/> kujunduse (<c2/>, mis tahes kujundus kataloogis <c3/> või kujundus, mille liik <c4/> edasi annab; vt <a1>LEO-SIGNAL.md</a1>). Riba võtab siis kujunduse keskssageduse (kui <c5/> pole antud), edastusribalaiuse ja jälgitava komponendi kiibisageduse, jagab oma EIRP kujunduse komponentide vahel nende võimsusosade järgi ning annab igal epohhil aru jälgitava komponendi C/N0-st ja selle ribapiiratud varase-hilise koodijälgimise värinast (Betz ja Kolodziejski { "2009" }, liigi <c6/> valem) kaugusveana.

# text
seg-1d96501bb12d = Iga eelseadistus märgib oma arvud PUBLIC (URL-iga), REPRESENTATIVE (dokumenteeritud kavandusvalik, mitte kunagi väide reaalse süsteemi kohta) või WORKSHOP.

# text
seg-f708914fed48 = Sagedusribad

# text
# c1: generic-leo
seg-6459abcaeebe = <c1/> (vaikimisi)

# text
seg-a0dab2ebeb1b = REPRESENTATIVE; L-, S- ja C-kandelained avalikest dokumentidest

# text
seg-cd0075385395 = UHF { "450" } MHz (esinduslik), L { "1191.795" } MHz (Galileo E5 keskpunkt), S { "2492.028" } MHz (NavIC S, Navigation with Indian Constellation S-riba kandelaine), C { "5020" } MHz ({ "5010" }–{ "5030" } MHz RNSS (raadionavigatsiooni-satelliitteenus) eraldise keskpunkt), igaüks { "0" } dBW

# text
seg-3f0de4312fcb = { "550" } km päikesesünkroonne, Walker 240/12/1

# text
seg-486f17197d4d = REPRESENTATIVE, C-riba süsteemidele, mille parameetrid ei ole avalikud (näiteks TrustPoint)

# text
seg-f6696b70591c = C { "5020" } MHz, BPSK({ "10" }) (binaarne faasmanipulatsioon kiirusel { "10" } × { "1.023" } Mchip/s), isovoog

# text
seg-4ae6741795f9 = PUBLIC, <a1>arXiv { "2509.19551" }</a1> tabelid { "1" }–{ "2" }

# text
seg-a1be637cda63 = X1 { "1593.3225" } MHz, X5 { "1190.51625" } MHz; EIRP avaldatud minimaalsest vastuvõetavast võimsusest { "10" }° juures

# text
seg-cb74283148d7 = { "1080" } km, { "53" }° ({ "192" }) ja { "97" }° ({ "66" })

# text
seg-5ae1331b91f8 = PUBLIC, <a1>Resilient Navigation and Timing Foundation (RNTF)</a1> ja avaldatud orbiit

# text
seg-c995dade5aa6 = Satellite Time and Location (STL) { "1621" } MHz juures ({ "1616" }–{ "1626" } MHz keskpunkt); EIRP „{ "300" } korda GPS“

# text
seg-dd6322466888 = { "781" } km, { "86.4" }°, { "66" } { "6" } tasandil

# text
seg-ad0ba129439b = PUBLIC signaaliandmed (<a1>NAVIGATION { "72" }({ "1" })</a1>), REPRESENTATIVE orbiit ja EIRP

# text
seg-1931203a036c = Ku { "240" } MHz majakas, ainult Doppler

# text
seg-0533710bbbe1 = PUBLIC signaali struktuur (<a1>PMC10301026</a1>), REPRESENTATIVE orbiit ja EIRP

# text
seg-cee286338f01 = BPSK { "2.046" } Mchip/s L1 ja L5 lähedal

# text
seg-fe3cdce92b31 = { "1000" } km, { "55" }°

# text
# c1: celeste-iod
seg-03d5ae448705 = <c1/> (valikuline)

# text
seg-800f173f2b20 = WORKSHOP signaaliparameetrid, PUBLIC orbiit

# text
seg-e8626249e708 = konfiguratsiooni #1 seitse sagedusriba

# text
seg-cb29553176c7 = { "510" } km päikesesünkroonne

# text
# c1: link
# c2: src/celeste_iod.rs
# c3: scenarios/leo-pass-celeste-iod-multiband.toml
# c4: src/celeste_iod.rs
# c5: build.rs
# c6: scenarios/*celeste-iod*.toml
seg-10f79909a5bc = <b>Celeste IOD (orbiidil demonstreerimise) eelseadistus on valikuline.</b> Selle signaaliparameetrid esitati Euroopa Kosmoseagentuuri (ESA) Navigation Innovation and Support Programme (NAVISP) LEO-PNT töötoas { "2026" } ning neil pole veel avalikku allikat; need asuvad faili <c2/> moodulis <c1/>, mida kasutab <c3/>. Kuidas eelseadistust tagasi hoitakse: iga mootori töötoast pärinev arv asub ühes failis, <c4/>, mille <c5/> kompileerib sisse ainult siis, kui see olemas on, ja ainult hoidlas olevates stsenaariumides <c6/>. Selle faili ja nende stsenaariumide kustutamine hoiab eelseadistuse tagasi ilma lähtekoodi muutmata; iga muu test, sõltumatu etalon ja stsenaarium töötab ilma selleta ning README stsenaariumifailide arv loeb tagasi hoitud failid ikka sisse. Selle EIRP ja kiirt on kalibreeritud töötoas näidatud C/N0 jälje järgi, nii et see stsenaarium reprodutseerib jälje konstruktsiooni järgi.

# text
seg-9f9ff4fe18f8 = ATOMIC „nullkella“ polünoomiga ringhäälestatud efemeriidi mudel on navigatsioonisõnumi eelseadistus ega kuulu sellesse liiki.

# text
seg-dc496b16046b = LEO ja GNSS-i vaatlus

# text
# c1: scenarios/leo-pass-vs-gnss-cn0.toml
seg-6be559b1ac29 = <c1/> reprodutseerib kvalitatiivselt seda, mida LEO-PNT demonstratsioonid näitavad: LEO C/N0 tõuseb ja langeb kellakujuliselt, mis püsib { "590" } s maski kohal ja saavutab tipus { "56.8" } dB-Hz, { "8.9" } dB üle tasaste MEO GNSS-i kandelainete mediaani (Galileo E1, { "40.5" } kuni { "52.0" } dB-Hz, mediaan { "47.8" } dB-Hz). Varu tuleb kaugusest, mitte tugevamast saatjast: läbilennu tipul on satelliit { "569" } km kaugusel, umbes { "40" } korda lähemal kui Galileo satelliit seniidis ({ "23 222" } km), mis tähendab { "32" } dB vähem vabaruumi levikadu; üldine eelseadistus kiirgab { "0" } dBW ({ "1" } W).

# text
# c1: kshana scenarios/<name>.toml
seg-08debab7c94a = Iga rida on üks <c1/> käivitus (mootor { $version }):

# text
seg-9a60f0bf803e = Seadistus

# text
seg-fde146239f5d = Ühe käivituse tulemus

# text
# c1: generic-leo
seg-41455a3f15b6 = <c1/> L-riba, { "550" } km, { "80" }° läbilend Müncheni kohal

# text
seg-9d5c154eceb1 = L tipp { "56.8" } dB-Hz, mediaan { "42.2" } dB-Hz; Galileo E1 mediaan { "47.8" } dB-Hz

# text
# c1: xona-pulsar
seg-9423b1184fb0 = <c1/>, kavandatud { "70" }° läbilend ja neli kaldkestal satelliiti, mereliikluse kasutaja

# text
seg-63bf0b8f7f3a = X1 tipp { "65.6" } dB-Hz ja X5 { "68.9" } dB-Hz kavandatud läbilennul; suurim X1 Doppler { "31.4" } kHz

# text
# c1: iridium-stl
seg-8a3383072765 = <c1/>, { "65" }° läbilend, õhusõiduki kasutaja

# text
seg-d2fea8542638 = STL tipp { "80.5" } dB-Hz, { "34.3" } dB üle GPS L1 mediaani; suurim Doppler { "35.4" } kHz

# text
# c1: generic-leo
seg-d837a8a7648b = <c1/>, siseruumides kasutaja Roomas (traditsiooniline hoone)

# text
seg-4fbead0588d2 = tipp UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "8.5" } dB-Hz; Galileo E1 mediaan { "22.4" } dB-Hz

# text
# c1: generic-leo
# c2: [iot]
seg-954e16842d59 = <c1/> UHF ja L koos jaotisega <c2/>

# text
seg-9aa81f6f4929 = kuum lahendus { "0.90" } s ja { "18.0" } mJ igal signaalil; külm lahendus UHF { "19.0" } s ({ "381" } mJ), L { "47.0" } s ({ "939" } mJ), GPS L1 { "38.1" } s ({ "762" } mJ)

# text
# c1: generic-leo
seg-97476f9d4212 = <c1/>, neli sagedusriba, { "70" }° läbilend Tromsø kohal

# text
seg-fd1463da9965 = vt <a1>Ionosfääri sondeerimine</a1>

# text
seg-1ad5bde12b4f = { "16" } satelliiti { "1080" } km üldisest kihist, L ja C, { "30" } m hüpe

# text
seg-25cf36cf0de3 = vt <a1>Spuufimise seirajad</a1>

# text
# c1: kshana scenarios/<name>.toml --animate html --export all
# c2: .animation.html
seg-6cdf9830433e = <c1/> kirjutab ka interaktiivse esitaja (<c2/>, läbilennu epohhid) ning läbilennu geomeetria CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON ja STK (Systems Tool Kit) efemeriidifailid (<a1>ANIMATION.md</a1>, <a2>INTEROP.md</a2>).

# text
seg-d3a0fc36329a = Ionosfääri sondeerimine

# text
# c1: STEC = (P₂ − P₁)·f₁²f₂² / (40.3·(f₁² − f₂²))
# c2: geometry_free_stec_tecu
# c3: geometry_free_stec_sigma_tecu
# c4: scenarios/leo-focus-science-iono-sounding.toml
seg-1e64715af2ff = Iga sagedusribapaar annab ka kaldsuunalise TEC, mille selle geomeetriavaba koodikombinatsioon läbilennu tipul taastab, <c1/>, ja selle hinnangu 1-sigma kahe sagedusriba koodimürast tipul (<c2/>, <c3/>). Hinnang on konstruktsiooni järgi võrdne mudeli kaldsuunalise TEC-iga: kombinatsioon on esimeses järgus täpne. Sigma on see, mis teeb sagedusribaplaanist parema või halvema sondeerija: <c4/> (neli sagedusriba Tromsø kohal) taastab igast paarist { "18.85" } TEC ühikut, UHF-i ja L-i 1-sigmaga { "0.017" } TEC ühikut ning S-i ja C-i puhul { "2.9" }. Ainult termiline koodimüra; mitmeteelevi ega sagedustevahelist nihet pole. MODELLED.

# text
# c1: [spoofer]
seg-8f59acefb2b3 = Spuufimise seirajad (<c1/>)

# text
# c1: [spoofer]
# c2: onset_s
# c3: offset_m
# c4: push_rate_m_s
# c5: push_azimuth_deg
# c6: bands
# c7: gnss = false
# c8: simulate_iono
seg-91941393400a = Valikuline jaotis <c1/> võltsib signaale, mida vastuvõtja näeks väidetaval asukohal. Alates <c2/> hüppab väidetav asukoht <c3/> võrra ja liigub seejärel horisontaalselt kiirusega <c4/> suunas <c5/>; võltsitud kaugus ja kaugusemuutuse kiirus on täpselt väidetava asukoha omad, jaotises <c6/> nimetatud LEO sagedusribadel (vaikimisi kõik) ja MEO GNSS-i signaalil, kui pole <c7/>. <c8/> ütleb, kas võltsitud pseudovahemaad kannavad ionosfääri viivitust (maapealse saatja omad ei kanna).

# text
# c1: src/leo_link/spoof.rs
# c2: p_fa
# c3: 1 − p_md
seg-845f6840d92d = Vastuvõtja käitab kahte seiret (<a1><c1/></a1>), kumbki märgitud valehäire tõenäosusega epohhi kohta (<c2/>, vaikimisi { "1e-5" }), ja kuulutab tuvastamise välja esimesel epohhil, mil selle tuvastustõenäosus jõuab väärtuseni <c3/> (vaikimisi { "0.999" }). Tuvastustõenäosused on täpsed märgitud Gaussi müra korral, arvutatud müravaba keskmise jäägi põhjal; müra ei genereerita.

# text
seg-cc38b40eb7a5 = Seire

# text
seg-8b34ac584c3d = Statistik

# text
seg-7b158594c4d9 = Mida see näeb

# text
seg-89756d80bc29 = Doppleri ja läbilennu geomeetria kooskõla

# text
# c1: prior_sigma_m
# c2: prior_velocity_sigma_m_s
# c3: window_s
# c4: drift_sigma_m_s
seg-2174c7725e48 = mõõdetud kaugusemuutuse kiirused võrreldes nendega, mis on ennustatud orbiitidest ja sõltumatust eelasukohast ja -kiirusest (<c1/>, <c2/>); üldistatud vähimruutude hii-ruut akna kohta <c3/> (vaikimisi üks samm), kella triiv on tüütu parameeter (või antud <c4/>); sagedusluku silmuse müra C/N0-st (Kaplan & Hegarty { "2006" }, § { "5.6.2" }), GNSS-i kanalitel, LEO kanalitel ja kõigil kanalitel

# text
# c1: δx
# c2: g·δx
# c3: g = −(Δv − ρ̇u)/ρ
seg-14eab06a47d5 = asukohaviga <c1/> nihutab kaugusemuutuse kiirust <c2/>, <c3/> võrra: LEO satelliidi ristkiirus selle kauguse suhtes on umbes { "25" } korda MEO satelliidi oma, seega on sama viga LEO Doppleris umbes { "25" } korda suurem

# text
seg-390ac49b3c09 = Sagedusribadevaheline kooskõla

# text
# c1: √(2(σ₁² + σ₂²))
# c2: iono_rate_bound_m_s
seg-986d501c2b01 = iga LEO sagedusribapaari geomeetriavaba pseudovahemaa kombinatsiooni epohhist epohhi samm, vastuvõtja ionosfäärimudel eemaldatud, võrreldes <c1/> koodimüra ja talutava modelleerimata ionosfääri muutuskiirusega (<c2/>)

# text
seg-389187df55d7 = spuufer, mis võltsib mõned sagedusribad ja mitte teisi, või iga sagedusriba ilma ionosfäärita, oma algushetkel; mitte selline, mis võltsib iga sagedusriba ja simuleerib ionosfääri

# text
# c1: scenarios/leo-resilience-spoof-doppler.toml
# c2: scenarios/leo-resilience-spoof-monitors.toml
seg-4dd44d7fa566 = <c1/>: { "30" } m hüpe mõõdistatud asukohas Frankfurdis muudab GNSS-i kaugusemuutuse kiirusi umbes { "4" } mm/s ja LEO omi umbes { "10" } cm/s (mediaangradiendid { "1.4e-4" } ja { "3.5e-3" } sekundis). Ainult GNSS-i test ei tuvasta seda kunagi (suurim mittetsentraalsus { "0.06" }); iga kanali test tuvastab selle { "105" } s pärast algust. <c2/> käitab nelja spuuferit mõlema seire vastu.

# text
seg-1b64098e01f3 = Piirangud, mis on öeldud igas tulemuses: spuufer on idealiseeritud, isekooskõlaline asukoha lükkamine, mis kompenseerib oma tee (võimsuse, saabumisnurga ega korrelatsioonitipu signatuuri pole); eelteadmine on spuufitud lahendustest sõltumatu; vastuvõtja ionosfäärimudel on mootori oma, seega on autentne sagedusribadevaheline jääk keskmiselt null. MODELLED (kaks rida failis <a1>VERIFICATION-MATRIX.md</a1>).

# text
seg-edb7b16b6c0e = Valideerimine

# text
seg-051b8cd1849d = Test

# text
seg-609c537a9dfd = ITU-R P.838-3 tabel { "5" }, { "115" } sagedust

# text
seg-5bf24bec38f2 = iga koefitsient { "0.6" } piires oma viimasest trükitud numbrist (halvim täheldatud { "0.51" })

# text
seg-86204b023d44 = ITU-R Study Group { "3" } valideerimisnäited (CG-3M3J-13-ValEx-Rev8.3.0), P.618-14 vihm

# text
seg-13180d4097d1 = { "56" } juhtu { "1e-4" } dB piires (täheldatud { "5e-6" } dB)

# text
seg-84161e5f97f8 = Samad näited, P.618-14 skintillatsioon

# text
seg-0a4305c867ff = { "42" } juhtu { "1e-5" } dB piires

# text
seg-054f8dbe2792 = ITU-R Study Group { "3" } Clutter and BEL töövihik, P.2109

# text
seg-8ae2eeed4be4 = { "568" } väärtust { "0.001" } dB piires

# text
# c1: γ = (77/60)²
seg-6df2eded9f19 = IS-GPS-200 grupiviivituse suhe <c1/>

# text
seg-d0b293230f91 = täpsusega { "1e-12" }; L1/L2 ja L1/L5 võimendus { "2.978" } ja { "2.588" }

# text
seg-f9a0e24c00a7 = Friisi kilomeeter–megahertsi kuju

# text
seg-4e94a67f40f6 = täpsusega { "1e-4" } dB

# text
seg-ee59b4c520eb = arXiv { "2509.19551" } tabel { "1" } (Pulsar in-orbit validation (IOV), full operational capability (FOC) polaarne, FOC kaldus, GPS)

# text
seg-345998ca457c = { "20" } kiirust ja Doppleri maksimumi { "0.05" } % piires

# text
seg-30e34076f4a7 = Vihma ja skintillatsiooni sõltumatud etalonid võtavad vihmakõrguse ja märja murdumisnäitaja nii, nagu valideerimisnäited need annavad: mootor ei kanna ei ITU-R P.839 ega P.453 kaarti.

# text
seg-d2d1075a0b67 = EIRP-d ja kiirgusdiagrammid on avaldatud vastuvõetavad võimsused, mis on tehtud EIRP-ks, või esindusliku valiku tulemused; ühegi satelliidi mõõdetud diagrammi ei kasutata ega võrrelda ühtegi LEO C/N0 mõõtmisega.

# text
seg-915a9564608d = Gaasiline liige on asendatud P.676-10 lihtsustatud meetod; alla { "1" } GHz on see { "1" } GHz väärtus, skaleeritud teguriga f², ning vihm loetakse seal nulliks.

# text
seg-cdd9faf5b61d = TEC osa LEO satelliidi all tuleb ühest Chapmani kihist (plasmasfääri pole), mida saab alistada märgitud osaga.

# text
seg-4b72218497e7 = Kavandatud läbilennu ja Walkeri orbiidid on kahekeha, valikulise sekulaarse J2-ga (Maa teine tsonaalne harmooniline); TLE tee kasutab SGP4. Kasutaja enda kiirendus jäetakse suletud kujuga Doppleri kiirusest välja (numbriline kontroll annab aru, mida see liikuva kasutaja puhul maksab).

# text
seg-9fc2cd6d38e9 = RINEX (Receiver Independent Exchange Format) { "4.02" } ei sisalda LEO navigatsioonikirjeid; iga RINEX-laadne LEO eksport kuulub navigatsioonisõnumi koodi ja on dokumenteeritud Kshana laiendus (varasem töö: arXiv { "2401.17767" }).

# text
seg-593081243d8c = <s1>Eelmine</s1>LEO signaalikujundused

# text
seg-468e70f9a669 = <s1>Järgmine</s1>LEO navigatsioonisõnum

# text
seg-072d0d8f618c = Spuufimise seirajad ([spoofer])
