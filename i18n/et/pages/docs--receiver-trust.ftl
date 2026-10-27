# docs--receiver-trust: translations (et)

# text
seg-adc34608c46b = Klass

# text
seg-2247a2344710 = Tähendus

# text
seg-fdbb9db68f1d = puudub

# text
seg-f63dd3d7aad4 = Allikas

# text
seg-98151954f217 = false

# text
seg-c353e7bec219 = Võti

# text
seg-cc38b40eb7a5 = Seire

# text
seg-7670cf4ceda3 = Vaikeväärtus

# text
seg-a0cc45088f5f = GSV

# attr:alt
seg-26ab8544afba = Usaldusskoor ühe sünteetilise reisi vältel, mootori v{ $version } tegelikust käivitusest andmetel examples/maritime-trust (väljamõeldud NMEA logi praamist Tallinna–Helsingi liinil, { "3001" } epohhi sagedusel { "1" } Hz). Kolm rada jagavad ühte ajatelge. Ülal: kaugus vastuvõtja teatatud asukoha ja laeva tegeliku asukoha vahel, mis püsib mõne meetri piires kuni umbes { "1576" } s, kui logi stsenaariumipärane asukoha nihutamine selle eemale tõmbab, samal ajal kui vastuvõtja jätkab kehtiva lahendi teatamist. Keskel: usaldusskoor vahemikus { "0" } kuni { "100" }, mida ei arvutata kalibreerimise esimese { "300" } s jooksul, nominal ribas (vähemalt { "90" }) kuni nihutamiseni, seejärel langemas läbi degraded riba (vähemalt { "55" }) untrusted ribasse. All: iga epohhi riba värvilise lindina koos selle nimega. Skoor on nõuandev. Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }): laeva navigeerimise eest vastutab jätkuvalt operaator. Logi on välja mõeldud vormingu ja seirajate näitamiseks; see ei ole mõõtmine ega ütle midagi selle kohta, kuidas ükski vastuvõtja toimiks.

# attr:alt
seg-7000c522cc93 = Vastuvõtja enda spuufimislipp Kshana häirete kõrval, mootori v{ $version } tegelikust käitusest väljamõeldud UBX logil ({ "200" } epohhi sagedusega { "1" } Hz). C/N0 langeb { "20" } dB ajal { "80" } kuni { "90" } s ja { "120" } kuni { "130" } s; vastuvõtja märgib { "120" } kuni { "130" } s ja { "160" } kuni { "165" } s. Pärast kalibreerimist võrreldud { "140" } epohhist oli { "11" } puhul mõlemad märkinud, { "6" } puhul ainult vastuvõtja, { "11" } puhul ainult Kshana ja { "112" } puhul ei kumbki. Ükski pool ei ole tegelik tõde ja kokkulangevus ei ole valideerimine. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus.

# text
# c1: docs/RECEIVER-TRUST.md
seg-caadaad98cf6 = Allikas: <c1/>

# text
seg-4f10c2397fcc = Vastuvõtja usaldus: reaalse GNSS-i vastuvõtja logi hindamine

# text
# c1: kshana receiver-trust
seg-2596bdcdaf8e = <c1/> loeb logi reaalsest globaalsest satelliitnavigatsioonisüsteemi (GNSS) vastuvõtjast, käitab usalduse monitore selle kohal epohhi kaupa ja ütleb, millal ja miks vastuvõtja lahendus lakkas usaldusväärne olemast. See võib logi ka skoorida sündmuste ja ennustuste vastu, mille te esitate <b>enne</b> jooksu: kas iga sündmus tuvastati õigel ajal ja kas modelleeritud kandja ja müra tiheduse (C/N0) langus langeb kokku sellega, mida vastuvõtja mõõtis.

# text
seg-63f24d5f2d5e = Vaatlussuurused on vastuvõtja omad; monitorid ja nende läved on mootori ja teie omad. Iga tulemus kannab seda silti, logi SHA-256 ja iga läve, millega see jooksis, nii et jooksu saab korrata ja auditeerida.

# text
# c1: MARITIME-TRUST.md
seg-6f5014b93fbc = Käimasoleva laeva kohta, koos reaalajas skoori ja valikulise väravaga kaardisüsteemi ees, vt <a1><c1/></a1>.

# text
# c1: session.result.json
# c2: session.trust.csv
# c3: session.trust.svg
# c4: path
seg-82cdabb6086f = See kirjutab <c1/>, <c2/> (üks rida epohhi kohta) ja <c3/> (keskmine C/N0 ajas koos usalduse olekuga all) stsenaariumi kõrvale ning prindib ühe rea verdikti. Näitelogi on sünteetiline, tehtud vormingu näitamiseks; suunake <c4/> oma vastuvõtja logile.

# text
# c1: MARITIME-TRUST.md
seg-ec2be1ea73f5 = Ülaltoodud joonis on dokumendi <a1><c1/></a1> laevademo: väljamõeldud logi, nõuandev skoor.

# text
# c1: kshana.receiver_trust(toml)
# c2: receiver_trust(toml)
# c3: assess_receiver_log
seg-0f24c5cf4b9b = Sama stsenaarium töötab Pythonist (<c1/>), WebAssembly paketist (<c2/>, logi sisse kirjutatuna) ja Model Context Protocol (MCP) serveri tööriistast <c3/>.

# text
seg-1f3cc12b6230 = Logid, mida see loeb

# text
seg-23fd4a5bf5dd = Mida loetakse

# text
seg-2e1a655cf846 = u-blox binaarne

# text
# c1: jamInd
# c2: spoofDetState
# c3: self_report
seg-cb31da7b7d88 = NAV-SAT satelliidi kohta C/N0, kõrgus ja asimuut, NAV-PVT asukoht, MON-RF automaatvõimenduse juhtimine (AGC) ja segamisnäitaja <c1/>, NAV-TIMEGPS nädal ning vastuvõtja enda lipud: NAV-STATUS <c2/> ja SEC-SIG (<c3/>, vt <a1>RECEIVER-PROTOCOLS.md</a1>)

# text
seg-cec582f4afa5 = RINEX { "3" } vaatlusfail

# text
# c1: S
# c2: nav
seg-57708a636148 = <c1/> koodid (C/N0) satelliidi ja signaali kohta; edastatud navigatsioonifailiga (<c2/>) mootori enda lahenduse pseudovahemaad

# text
seg-176c2493782e = Androidi GnssLoggeri CSV

# text
# c1: Raw
# c2: AgcDb
# c3: Fix
seg-d69b9dd6ebad = <c1/> read: C/N0 ja <c2/> satelliidi kohta; <c3/> read: asukoht

# text
seg-d390120374a9 = NMEA { "0183" } tekst

# text
seg-9eb885aa79af = GSV signaali ja müra suhe satelliidi kohta (dB-Hz, signaali ID-ga { "4.10" } või ilma) ja selle kõrgus ning asimuut, GSA täpsuse halvenemise tegur ja kasutatud satelliidid, GGA ja RMC aeg ning asukoht

# text
seg-7864926ce37e = Septentrio binaarne ({ "0.38" }, ainult lugemine)

# text
seg-44675c4bdf40 = PVTGeodetic asukoht, MeasEpoch C/N0 satelliidi ja signaali kohta, RFStatus ribade arv; vt <a1>RECEIVER-PROTOCOLS.md</a1>

# text
# c1: .pos
seg-a5367d75c5ee = RTKLIB lahendusfail (<c1/>)

# text
seg-37d28ca5ed00 = aeg, asukoht (laius/pikkus või ECEF, teisendatud) ja kasutatud satelliidid epohhi kohta; kraadi-minuti-sekundi failid lükatakse tagasi teatega

# text
seg-5e10ecb93f96 = NovAtel OEM7 ASCII- või binaarlogid

# text
# c1: BESTPOS
# c2: RANGE
# c3: RXSTATUS
# c4: self_report
# c5: receiver-self-report
seg-a630fbcf7425 = <c1/> asukoht (ainult arvutatud lahendus), <c2/> C/No satelliidi ja signaali kohta; <c3/> segaja lipud muutuvad epohhi <c4/>-ks (segamise olek { "2" }, kui vastuvõtja annab segaja lipu, { "1" }, kui mitte; RXSTATUS-is spuufimise lippu ei ole), mida võrreldakse Kshana häiretega võrdlusega <c5/>

# text
seg-d4735b581cbf = GNSS-SDR Monitori ja PVT-monitori vood JSON-ridadena

# text
# c1: integrations/gnss-sdr/relay.py
seg-053235d67fb3 = kanalipõhine C/N0, lahendus, kasutatud satelliidid, HDOP, asimuut ja kõrgus; teeb <c1/>

# text
# c1: MACHINE-INPUTS.md
seg-2e9033aa4e9d = Nende kolme üksikasjad, allikad ja piirangud: <a1><c1/></a1>.

# text
# c1: source_span
# c2: [start, end)
# c3: >
# c4: Raw
# c5: Fix
# c6: Raw
seg-8987b2c46eb0 = Iga lugejate toodetud epohh kannab ka <c1/>, <c2/> baidinihkeid sisendis: väikseim ühtne vahemik, mis sisaldab selle andnud kirjeid, nii et täpse toore lõigu saab sündmuseakna jaoks räsida. NMEA: iga rida, mida loetakse, kuni epohh on jooksev (ülemhulk, kui sõnumite vahel on tähendusetu rida). UBX: epohhi kaadrid. RINEX { "3" }: epohhikirjed igast <c3/> reast järgmiseni. Android: epohhi <c4/> read (<c5/> rida ainult epohhi jaoks, millel ei ole <c6/> ridu). Puudub reaalajavoo puhul ja kõikjal, kus see ei ole hästi defineeritud (RINEX { "2" }).

# text
# c1: path
# c2: text
# c3: base64
seg-cea9532b57a2 = Fail antakse kujul <c1/> (lahendatakse stsenaariumi enda kausta suhtes) või sisse kirjutatuna kujul <c2/> või <c3/> (ainsad valikud brauseris).

# text
seg-3bc4f9c91950 = IMU logi teise andurina

# text
# c1: [log.imu]
seg-49b10ad5928e = <c1/> lisab inertsiaalse logi samale kellale:

# text
# c1: heading0_deg
# c2: heading-course
# c3: heading_sensor = true
# c4: hdg_cog_tol_deg
# c5: csv
# c6: MACHINE-INPUTS.md
# c7: text
# c8: base64
# c9: path
seg-9e0560b09f5a = Pöördekiirus integreeritakse väljast <c1/> ja see täidab suuna kõikjal, kus vastuvõtja logi seda ei kanna, nii et monitor <c2/> (mis vajab platvormil <c3/>) võrdleb güroskoobi suunda kursiga maapinna suhtes. Güroskoop triivib: suund on nii hea kui integreerimisaken ja <c4/> otsustab, mida loetakse lahknevuseks. Paigutus <c5/> on dokumenteeritud failis <c6/>. IMU baidid on osa stsenaariumi räsist ja tõendipaketi stsenaariumi räsist. Sisse kirjutatud (<c7/>/<c8/>) töötab igal pinnal; <c9/> lükatakse tagasi seal, kus faile ei loeta.

# text
seg-fd3e6ef1cd93 = Platvorm: staatiline või laev

# text
# c1: [platform]
# c2: static
seg-b67c0d57dc1d = Ülaltoodud monitorid eeldavad fikseeritud antenni. Stsenaarium esitab platvormi enne jooksu ülemise taseme tabelis <c1/>; ilma selleta on platvorm <c2/> ja midagi ei muutu.

# text
seg-3d6bc18bd83e = Miks see väärtus

# text
seg-32f339f63acf = Üle kaubalaevade ja enamiku reisilaevade teenduskiiruse, nii et reaalne laev ei saavuta seda kunagi; kaugelt alla kiiruse, mida asukoha äravedamine eeldab. Aeglasem laev peaks esitama madalama piiri: mida madalam piir, seda varem äravedamine tabatakse.

# text
seg-9506e8601857 = Suur laev muudab kiirust palju vähem kui { "0.1" } m/s²; väike kiire alus saavutab kõva gaasimuutuse korral mõne kümnendiku.

# text
seg-b0b6baaee456 = Suur laev pöörab palju aeglasemalt kui { "1" } kraadi/s ja väike alus kõvas pöördes mõne kraadi/s.

# text
seg-53d0fffb3c09 = Paigalduse omadus; oletus oleks peidetud lävi.

# text
# c1: true
seg-ac48403443f9 = Deklareeritud <c1/> ja logis puuduv on viga, seega ei saa puuduv andur läbida puhta kontrollina.

# text
# c1: kind = "static"
# c2: position-jump
# c3: monitor_config
seg-8266739dc26b = Laevavõtmed lükatakse tagasi tingimusel <c1/>. Laeva jaoks monitor <c2/> ei tööta, sest see mõõdab kaugust kalibreerimiskeskmisest, mis on liikuval antennil vale; tulemuse <c3/> salvestab platvormi ja kasutatud piirid.

# text
# c1: kshana nmea-scenario
seg-7551792a0cb4 = Dokumendi <a1><c1/></a1> sünteetilised NMEA-vood, mis on tehtud meeskonna koolituseks, aktsepteerib NMEA lugeja ja neid saab sellest liigist käitada nagu mis tahes NMEA logi.

# text
seg-18d7538bc56d = Monitorid

# text
# c1: monitors_run
# c2: calibration_s
seg-e5c1cb89f0b3 = Iga monitor vajab oma andmeid; monitori, mille andmeid logis ei ole, ei käitata ja seda ei loetleta väljal <c1/>. Esimesed <c2/> sekundit (vaikeväärtus { "60" }) määravad lähtetaseme ega anna kunagi häiret.

# text
seg-3be9ee05f087 = Annab häire, kui

# text
seg-98ead58c671d = Vajab

# text
# c1: cn0_drop_db
seg-f6e6df453260 = keskmine C/N0 lähtetasemega ühiste satelliitide üle langeb <c1/> või rohkem (vaikeväärtus { "6" } dB)

# text
# c1: sats_lost
seg-d9bf6efc6835 = jälgitavad satelliidid langevad lähtetaseme mediaanist <c1/> või rohkem allapoole (vaikeväärtus { "4" })

# text
# c1: agc_k_sigma
seg-60c7a99f9819 = AGC näit erineb lähtetasemest rohkem kui <c1/> standardhälbe võrra (vaikeväärtus { "5" })

# text
# c1: AgcDb
seg-7c1c65e64418 = UBX MON-RF või Android <c1/>

# text
# c1: jamInd
# c2: jam_ind_threshold
seg-a5a5252417cb = u-blox <c1/> ületab väärtust <c2/> (vaikeväärtus { "80" } väärtusest { "255" })

# text
seg-8bca191bf4c4 = UBX MON-RF

# text
# c1: position_jump_m
seg-0ac4898d81cf = vastuvõtja enda lahendus on kalibreerimiskeskmisest kaugemal kui <c1/> (vaikeväärtus { "50" } m)

# text
seg-6a3fec1214b9 = teatatud asukoht

# text
seg-4c05faf783eb = pariteedi-vastuvõtja autonoomne terviklikkuse monitooring (RAIM) mootori enda üksikpunkti lahendusel lükkab mõõtmiskomplekti tagasi

# text
# c1: nav
seg-037ab193613c = RINEX-i logi koos <c1/>

# text
seg-8890a4ebf231 = mootori üksikpunkti lahendus ebaõnnestub viie või enama satelliidiga

# text
seg-0a5a708ac75b = vastuvõtja kell erineb oma prognoositud sirgest rohkem kui selle kalibreerimismüra vähim tuvastatav nihe

# text
seg-31b64b635261 = Kalibreeritud profiil (valikuline).

# text
# c1: [monitors] profile = "jammertest-2024-calibrated"
# c2: cn0_drop_db = 1.5
# c3: agc_k_sigma = 3.5
# c4: jam_ind_threshold = 29
# c5: xval/jammertest-trust/PREREGISTRATION.md
# c6: cn0_drop_db
# c7: xval/jammertest-trust/RESULTS.md
# c8: profile_note
seg-a73f2c2dfc9a = <c1/> asendab kolm häirelävendit väärtustega, mis on kalibreeritud avalikul andmekogul JammerTest { "2024" } (üks u-blox ZED-F9P stsenaariumi kohta; Zenodo { "15911589" }): <c2/>, <c3/>, <c4/>. Kalibreerimine oli eelregistreeritud (<c5/>) ja profiil on MODELLED, sobitatud ühel avalikul kampaanial: selle <c6/> lävi <b>jättis täitmata</b> eelregistreeritud suletud komplekti valehäire läve ({ "0.0231" } võrreldes väärtusega { "0.02" }); AGC ja segamisnäitaja lävendid ning ühendi lävi (valehäired { "0.033" }, tuvastamine { "0.81" }) said täidetud (<c7/>). See kehtib selle vastuvõtjatüübi kohta sellel sündmusel, planeeritud ründeakende vastu, ja kalibreeriti andmekogu CSV-logidel (selle UBX-logid annavad kahes kaustas rohkem valehäireid). Profiiliga käitatud tulemus kordab rakendatud lävendeid ja kannab märget <c8/>, mis ütleb seda kõike. Ilma profiilita kehtivad ülaltoodud vaikeväärtused ja iga väljund jääb muutumatuks.

# text
# c1: vessel
# c2: [maritime]
# c3: src/receiver_trust/maritime.rs
# c4: monitors_run
seg-1fa8c4bd1a18 = <c1/> platvormi puhul käitatakse ka liikuva platvormi monitore (läved ülemise taseme tabelis <c2/>, iga vaikeväärtus dokumenteeritud failis <c3/>); igaüks vajab oma andmeid ja see loetletakse väljal <c4/> ainult siis, kui see otsustas:

# text
seg-4b2840d9d0af = asukoha muutus ei kattu teatatud kiiruse ja kursiga või eeldab kiirust, kiirendust või pöörlemiskiirust, mis on üle laeva piiride

# text
seg-656c19cb5b52 = lahendused; kiirus ja kurss (RMC või VTG) surnud lugemi (dead-reckoning) osa jaoks

# text
# c1: hdg_cog_tol_deg
# c2: min_speed_kn
seg-cedefd52998d = güroskoobi suund ja kurss maapinna suhtes erinevad rohkem kui <c1/> (kiirus üle <c2/>)

# text
# c1: heading_sensor = true
seg-c66704cbdd02 = HDT, THS või VHW suund, <c1/>

# text
# c1: stw_sog_tol_kn
seg-1bbbf0033234 = kiirus vee suhtes ja kiirus maapinna suhtes erinevad rohkem kui <c1/>

# text
seg-c9101740b235 = VHW või VBW ja kiirus maapinna suhtes

# text
# c1: antenna_height_m
# c2: sea_level_tol_m
seg-42ac59072099 = GGA kõrgus erineb väärtusest <c1/> rohkem kui <c2/>

# text
# c1: antenna_height_m
seg-811ec460249c = GGA kõrgus, <c1/>

# text
# c1: cn0_spread_frac
seg-854ea9c26df4 = C/N0 hajuvus satelliitide vahel langeb tasemele <c1/> selle kalibreerimismediaanist

# text
# c1: cn0_rise_db
# c2: cn0_rise_frac
seg-837fc4cb832c = ühiste satelliitide C/N0 tõusis keskmiselt <c1/> ja <c2/> neist tõusis

# text
seg-faae07674361 = järjestikused epohhi ajad astuvad ebaregulaarselt, jooksevad tagurpidi või lahkuvad hostikellast

# text
seg-f799a53897ed = NMEA aeg; viimase osa jaoks hostikell

# text
seg-ee4913c9f2ed = vastuvõtja teatab OSNMA autentimise ebaõnnestumisest (loetakse teatatud olekut; midagi ei kontrollita; OSNMA kontrollimiseks I/NAV-lehtedest endist vt <a1>docs/OSNMA.md</a1>)

# text
# c1: $PKSOS
seg-3fad5fcde4dc = <c1/> olekulause

# text
seg-ce072f2ebb6c = Epohh on <b>usaldamatu</b>, kui RAIM, kellamonitor, lahendamise ebaõnnestumine või asukohahüpe annab häire või kui C/N0 langus jõuab oma läve kahekordsele väärtusele; <b>halvenenud</b> mis tahes muu häire korral; ja <b>nominaalne</b> muul juhul.

# text
# c1: raim
# c2: solve-failure
# c3: clock
# c4: tests/jammertest_spoof_oracle_support
# c5: tests/receiver_trust_jammertest.rs
seg-4124ff6013a0 = Mootori rada (<c1/>, <c2/>, <c3/>) on sama arvutus mis JammerTest { "2024" } spuufimise sõltumatul etalonil failis <c4/>: <c5/> kontrollib, et kõigil kaheksal avaldatud algushetkel langeb esimene häire samale epohhile ja on samat liiki.

# text
seg-83be3c22a577 = Usaldusskoor (laeva platvorm)

# text
# c1: statistic / threshold
seg-812991f245cd = Laeva puhul saab iga epohh pärast kalibreerimist ka skoori vahemikus { "0" } kuni { "100" } ja põhjused, miks see ei ole { "100" }. Kujutis on deterministlik ja fikseeritud enne mis tahes logi skoorimist: ei mingit õppimist, midagi ei sobitata sündmustele. Iga monitor taandab oma tõendid suhtarvule <c1/> (häire väärtusel { "1" } või enam); suhtarv maksab skoorile

# text
# c1: onset_ratio
# c2: full_ratio
# c3: evidence_hold_s
seg-ada5a0a52315 = seega ei maksa monitor midagi, kuni see on alla <c1/> oma läve (vaikeväärtus { "0.5" }), maksab poole oma kaalust oma läve juures ja kogu kaalu <c2/> korda läve juures (vaikeväärtus { "1.5" }); skoor ei kasva ühegi statistiku korral. Allikas, mis epohhil ei teata, hoiab oma viimast statistikut <c3/> (vaikeväärtus { "10" } s: kaks tsüklit C/N0 lausest, mida saadetakse iga { "5" } s järel), nii häirena kui mahaarvamisena.

# text
# c1: floor(x * 10 + 0.5) / 10
# c2: cn0-drop
# c3: agc
# c4: jam-ind
# c5: loss-of-lock
# c6: position-jump
# c7: raim
# c8: clock
# c9: solve-failure
# c10: kinematic
# c11: heading-course
# c12: speed-log
# c13: sea-level
# c14: cn0-spread
# c15: cn0-rise
# c16: time-consistency
# c17: osnma
# c18: geometry
seg-6c06de24ebfe = Ümardamine on pool üles (<c1/>), riba on ümardatud skoori oma ja piiramine tuleb enne ümardamist. Mahaarvamistes loetletakse ainult monitorid, mille punktid on üle nulli, koos nende suhtarvu ja ümardamata punktidega, suurimad punktid ees; võrdsete punktidega mahaarvamised loetletakse monitorinimede järjekorras <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>. Monitorile, mille test on läbitud või läbikukkunud (ebaõnnestunud lahendamine, ebaõnnestunud autentimine), antakse suhtarv { "1.5" }, täiskaal. Loetletud punktid on need enne piiramist tasemele { "0" }.

# text
seg-e36961d46c41 = Kaal (punktid)

# text
seg-673f6adcd681 = Miks

# text
seg-399be3301faf = autentimise ebaõnnestumine on väide, mitte statistik

# text
seg-69cfc61477d6 = võltsasukoht peab olema vastuolus füüsikaga või vastuvõtja enda kontrollidega ja aeg ei saa joosta tagurpidi; üks rikkumine täisjõul ({ "1.5" } korda selle lävi: { "60" } punkti, skoor { "40" }) on usaldamatu ja oma läve juures ({ "30" } punkti, skoor { "70" }) halvenenud

# text
seg-7fa1e6e67411 = üks sõltumatu andur, mis ei nõustu, on halvenenud; kaks täisjõul on usaldamatud

# text
seg-4c4825d2957a = signaalikeskkond või nõrgalt informatiivne kontroll

# text
seg-b5a364a03714 = keskkond on vaenulik; see üksi ei näita, et lahendus on vale

# text
# c1: [geometry]
seg-4e3749965405 = kuni { "15" }, <c1/>

# text
# c1: cap_points
seg-1e595dbcf96f = ei ole kaal sellel kallakul: mitte midagi, kui taevas ei ole kehv, siis kuni <c1/> ({ "15" }); ainuüksi geomeetria jõuab halvenenud tasemele, mitte kunagi usaldamatule, ega anna häiret (vt allpool „Geomeetria“)

# text
# c1: score_model
# c2: score.deductions
seg-9902ca062070 = Riba servad tulenevad kaaludest: kergeim häiret andev monitor maksab oma läve juures { "12.5" } punkti, seega jätab iga häire nominaalse riba; ükski üksik monitor alla { "60" } punkti ei saa üksi usaldamatu ribani jõuda (mitu koos võivad). Tulemus salvestab skoorimudeli (<c1/>) ja iga epohh kannab <c2/>: millised monitorid arvasid maha, nende suhtarvud ja nende punktid. Laeva puhul on epohhi olek tema skoori riba.

# text
seg-6f620668ee85 = Geomeetria: loomulik halvenemine ründetaolisest vastuolust eraldi

# text
# c1: docs/design/2026-10-12-geometry-and-skyline-design.md
# c2: geometry
# c3: environment
# c4: inconsistency
seg-93257d87e0d4 = Vastuvõtja kai kraana kõrval, lüüsis või kõrge kere all kaotab satelliite ja selle lahendus halveneb põhjusel, mis ei ole rünnak. Alates versioonist { "0.36" }, järgides geomeetria disainimärget (<c1/>, jaotis { "4" }), kannab iga epohh oma <b>satelliidigeomeetriat</b>, laeva skooril on <b>geomeetriamonitor</b> ja iga mahaarvamine kannab <b>klassi</b>: <c2/> (taevas), <c3/> (signaalikeskkond) või <c4/> (ründetaoline tõend).

# text
# c1: orbit::dop
# c2: source = derived
# c3: source = reported
# c4: evidence_hold_s
# c5: unknown
seg-17d13c39b5aa = <b>Kust geomeetria tuleb.</b> Iga jälgitava satelliidi kõrgus ja asimuut (NMEA GSV, UBX NAV-SAT), millest tuletatakse täpsuse halvenemise tegur (DOP) mootori ainsa DOP-tuumaga (<c1/>, VALIDATED gnss_lib_py vastu): <c2/>. Selle puudumisel DOP ja kasutatud satelliidid, mida vastuvõtja esitab (NMEA GSA): <c3/>. Taevapositsioonid ja GSA kehtivad skoori <c4/> jooksul (vaikeväärtus { "10" } s), sest paljud siinid saadavad GSV-d iga mõne sekundi järel; epohhil mittetäielikku GSV komplekti (väljavõtte lõpp, kaotatud lause) ei kasutata. Logi, millel ei ole kumbagi, näiteks NMEA ainult GGA ja RMC-ga või Androidi ja RINEX-i logid täna, saab oleku <b><c5/></b> märkusega „geomeetria teadmata“: mootor ei oleta geomeetriat, mida talle ei antud, ja geomeetriamonitor ei tööta.

# text
seg-a267da42ac3d = piisavalt satelliite ja DOP läve piires

# text
# c1: few-satellites
# c2: high-pdop
# c3: high-hdop
# c4: sky-blocked
seg-dabcd392914a = üks või mitu põhjust: <c1/>, <c2/>, <c3/> ja (informatiivne, skooris mitte) <c4/>, kui iga jälgitav satelliit asub horisondi ühes pooles

# text
seg-c255a66d3813 = logi ei anna sellele epohhile satelliidigeomeetriat

# text
# c1: degraded
# c2: sky-blocked
# c3: poor
seg-0a50145c2bfa = Olek on kirjeldav ja skoori jaoks on tähtis silt (allpool): <c1/> hõlmab informatiivset juhtu <c2/>, mis võib tulla koos hea või rahuldava DOP-iga, ja skoorile läheb ainult silt <c3/>.

# text
# c1: geometry.label
# c2: good
# c3: hdop_good
# c4: pdop_good
# c5: used_good
# c6: poor
# c7: hdop_max
# c8: pdop_max
# c9: min_used
# c10: fair
# c11: unknown
seg-93e49a562493 = <b>Silt</b> (alati teatatud, mitte kunagi skooris). Iga epohhi <c1/> on <c2/> (HDOP kuni <c3/> { "2" }, PDOP kuni <c4/> { "3" } ja vähemalt <c5/> { "6" } satelliiti), <c6/> (HDOP üle <c7/> { "4" }, PDOP üle <c8/> { "6" } või vähem kui <c9/> { "5" } satelliiti), <c10/> nende kahe vahel või <c11/>. Epohhi märkus algab alati sildi ja arvudega, näiteks „geomeetria rahuldav: HDOP { "1.105" }, PDOP { "1.831" }, VDOP { "1.410" }, { "8" } satelliiti; skooris mitte (skoor arvab maha ainult üle HDOP { "4" }, PDOP { "6" } või alla { "5" } satelliidi)“, ja lisab „, signaalikadu“, kui see kehtib.

# text
# c1: max(hdop / hdop_max, pdop / pdop_max, min_used / n_used)
# c2: cap_points
# c3: full_ratio
# c4: floor
# c5: degraded_min
# c6: min(cap_points, 100 - floor)
# c7: [score]
# c8: degraded_min
# c9: degraded_min
# c10: 100 - degraded_min
# c11: floor
# c12: degraded_min
# c13: monitors_run
# c14: [score.weights]
# c15: geometry_model.cap_in_force
# c16: geometry_model.floor_in_force
seg-13838e036fae = <b>Geomeetriamonitor</b> (laeva skoor). See arvab <b>maha midagi, kui geomeetria ei ole kehv</b>: selle suhtarv on <c1/> ja kuni see on kuni { "1" } (hea või rahuldav geomeetria, kaasa arvatud GPS-i ainult avatud taevas { "8" } satelliidiga) ei maksa see midagi, seega skooritakse selline logi täpselt nagu versioonis { "0.35" }. Üle { "1" } kasvab mahaarvamine lineaarselt väärtuseni <c2/> ({ "15" }) tasemel <c3/> ({ "1.5" } korda läve: HDOP { "6" }, PDOP { "9" }, { "3" } satelliiti): { "7.5" } punkti suhtarvul { "1.25" } (HDOP { "5" } või { "4" } satelliiti), { "15" } alates { "1.5" } (skoor { "85" }, halvenenud). Üksi ei saa see skoori kunagi viia alla taseme <c4/> (vaikeväärtus: skoori <c5/>, { "55" }), seega jõuab ainuüksi geomeetria halvenenud ribale ja mitte kunagi usaldamatule: kehtiv piir on <c6/>, nii et tabel <c7/>, mis tõstab <c8/> (näiteks { "0.35" } oma <c9/> { "90" }), langetab piiri väärtusele <c10/>, mitte ei lükata tagasi, ja <c11/>, mis on seatud alla <c12/>, lükatakse tagasi. Monitor ei anna häiret; see loetletakse väljal <c13/> viimasena, kui see otsustas mis tahes epohhil (laev, mille logi annab geomeetria), ja seda ei arvata versiooni { "0.35" } identsusse; see ei ole <c14/> kirje (selle seadmine lükatakse tagasi) ning kehtiv piir ja alampiir salvestatakse väljadele <c15/> ja <c16/>. Kehva epohhi märkus ütleb miks, näiteks „geomeetria kehv: HDOP { "5.200" }, PDOP { "7.900" }, VDOP { "4.100" }, { "7" } satelliiti; halvenenud geomeetria tõttu: HDOP { "5.200" } üle { "4" } (tuletatud { "7" } logitud satelliidist); mitte vastuolu“.

# text
# c1: score.deductions[].class
seg-2082f4ccb250 = <b>Klassid.</b> Iga mahaarvamine (<c1/>):

# text
# c1: geometry
# c2: loss-of-lock
# c3: low_elev_deg
seg-4197bc517f73 = <c1/> (kehv geomeetria); <c2/>, kui iga kalibreerimislähtetasemega võrreldes kaotatud satelliit oli viimasel teatamisel alla <c3/>

# text
# c1: cn0-drop
# c2: cn0-spread
# c3: cn0-rise
# c4: agc
# c5: jam-ind
# c6: loss-of-lock
# c7: geometry
seg-e06597696553 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> muul juhul; <c7/> signaalikao ajal (allpool)

# text
# c1: kinematic
# c2: heading-course
# c3: speed-log
# c4: sea-level
# c5: time-consistency
# c6: clock
# c7: raim
# c8: position-jump
# c9: osnma
# c10: solve-failure
# c11: geometry
seg-5fc0eb79c51b = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; ja <c11/>, kui geomeetria on kehv ja esitatud HDOP ei lange kokku esitatud taevaga (allpool)

# text
# c1: max(reported_vs_derived_tol, reported_vs_derived_rel × derived HDOP)
# c2: reported_derived_mismatch: true
# c3: inconsistency
# c4: reported_derived_mismatch
# c5: geometry_summary.hdop_mismatch
# c6: geometry
seg-1b5e88a4aae4 = <b>Kaitse võltsitud kehva taeva vastu.</b> Spuufer võiks saata hõreda GSV või teatada kõrge HDOP-i, et osta tolerantsi. Mootor sildistab ega anna andeks: ükski teine kontroll ei laiene kehva geomeetria tõttu ja vastuvõtja esitatud HDOP (GSA hoidmise jooksul, muidu GGA) võrreldakse esitatud taevast tuletatud HDOP-iga. Kui need erinevad rohkem kui <c1/> ({ "1.0" } või { "25" } % tuletatud HDOP-ist, olenevalt sellest, kumb on suurem), kannab epohh <c2/> ja kui geomeetria on kehv, klassifitseeritakse selle mahaarvamine <c3/>. Hea või rahuldava geomeetria korral lahknevust teatatakse ja ei skooritud: midagi ei arvata maha, kui geomeetria ei ole kehv. See on teadlik valik ({ "0.36" }): „null, kui ei ole kehv“ kehtib iga epohhi kohta, nii et hea ja rahuldav geomeetria skooritakse täpselt nagu versioonis { "0.35" } ja võltsitud HDOP ei ole kunagi vaikne. Lipp (<c4/>) on tulemuse igal epohhil ja igal reaalajarea real, märkus ütleb „…tolerantsist väljaspool: teatatud, skooris mitte (geomeetria ei ole kehv)“ või „…: geomeetria mahaarvamine klassifitseeritakse vastuoluks“, <c5/> loendab epohhe ja tõendite kokkuvõtte leht näitab arvu, null kaasa arvatud. { "25" } % on <b>REPRESENTATIVE</b> inseneriotsus, mitte mõõdetud ega standardne arv: vastuvõtja, mis lahendab ühe kella konstellatsiooni kohta või osaga satelliitidest, mida see jälgib (kõrgusmask, C/N0 piir, RAIM-i välistus), esitab HDOP-i, mis erineb iga jälgitava satelliidi ühe kella HDOP-ist summa võrra, mis kasvab HDOP-iga, seega loeks fikseeritud tolerants üksi loomulikku kehva geomeetriat vastuoluks. Suurem erinevus loetakse endiselt vastuoluks. Mahaarvamine, mis on klassifitseeritud <c6/>, on väide taeva kohta, mitte järeldus, et rünnakut ei toimunud.

# text
# c1: low_elev_deg
# c2: signal_loss: true
# c3: environment
seg-0e729ad96db9 = <b>Signaalikadu ei ole taevas.</b> Kui satelliite, mida vastuvõtja loetleb nähtavana (üle <c1/>), ei jälgita, tuletab mootor ka kõigi nähtavate satelliitide DOP-i. Kui see nähtavate satelliitide DOP on läve piires ja kas midagi ei jälgita või jälgimata satelliidid on jaotunud mööda horisonti (mitte piiratud selle ühe poolega), siis taevas oli olemas ja signaal mitte: epohh kannab <c2/>, märkust „satelliidid nähtavad, kuid jälgimata: signaalikeskkond, mitte geomeetria“ ja geomeetria mahaarvamine klassifitseeritakse <c3/>. Jälgimata satelliidid, mis on piiratud horisondi ühe poolega, loetakse endiselt blokeeritud taevaks (sein, kaljuserv, kai). Kahepoolne takistus (kanjon või kitsas fjord) loetakse signaalikaoks, kuni horisondijoon on seadistatud. Vastuvõtja puuduva lahenduse märgid ei ole DOP: esitatud HDOP või PDOP { "99" } või enam, GGA kvaliteet { "0" } ja GSA režiim { "1" } ei anna esitatud DOP-i.

# text
# c1: [geometry]
seg-0f218d21843b = Võti <c1/>

# text
# c1: sigma_uere_m
# c2: kin_pos_tol_m
seg-e5ec84abd61b = valitud (disainimärge { "4.2" }): tasemel <c1/> { "1.5" } m on HDOP { "4" } 2drms väärtusega { "12" } m, kinemaatilise kontrolli <c2/>. IEC 61108-1 puhul tsiteeritakse sageli, et see esitab oma täpsusnõuded HDOP ≤ { "4" } (või PDOP ≤ { "6" }) jaoks: meenutatud GNSS-vastuvõtjate sekundaarkirjandusest, konkreetset sekundaarset allikat ei konsulteeritud ja standardit ei loetud; kontrollida standardi tekstiga

# text
# c1: scenarios/polar-arctic-leo-coverage.toml
# c2: tests/constellation_availability_published_spec_oracle.rs
seg-d99dc0fd090a = PDOP kättesaadavuse lävi <c1/>; GPS SPS Performance Standard, 5. väljaanne ({ "2020" }), PDOP ≤ { "6" }, nagu tsiteeritud failis <c2/>; kontrollida standardi tekstiga

# text
seg-2fffa47378ec = üks rohkem kui lahendus vajab, nii et üksik kadu ei lõpeta lahendust; vähim arv, millel on RAIM-i jaoks üks liigne mõõtmine

# text
# c1: hdop_max
seg-7dc0baed2bc4 = esitatud sisend lüli 2drms jaoks <c1/>; seadke vastuvõtja enda arv

# text
seg-7b5778d93d40 = { "1.0" } HDOP

# text
seg-093cff5d1150 = valitud (disainimärge { "4.2" }): tolerantsi absoluutne osa; lahknevus üle tolerantsi ei ole geomeetria

# text
seg-be5c3aefd942 = REPRESENTATIVE inseneriotsus: suhteline osa, vastuvõtjatele, millel on konstellatsioonipõhised kellad või alamhulga lahendused

# text
seg-e71c6876114b = disainimärge { "4.3" }: sellest allapoole kaotatud satelliidid on taevale kaotatud; horisondijoon ({ "0.36" } punkt { "1" }) laiendab seda

# text
seg-bebe291ca1c0 = geomeetriline, informatiivne: iga satelliit horisondi ühes pooles

# text
seg-06519582227b = disainimärge { "4.2" }: ainuüksi geomeetria viib skoori nominaalsest halvenenuks ja mitte kunagi usaldamatuks; maha arvatakse ainult siis, kui geomeetria on kehv (asutaja otsus B1, { "0.36" })

# text
# c1: full_ratio
# c2: cap_points
seg-be21b5a31382 = skoori enda <c1/>: kallak jõuab väärtuseni <c2/> tasemel { "1.5" } korda kehvad läved

# text
# c1: degraded_min
seg-e922a5342a3c = skoori <c1/> ({ "55" })

# text
# c1: min(cap_points, 100 - floor)
# c2: degraded_min
seg-09fe8c435ece = ainuüksi geomeetria ei jõua kunagi usaldamatu ribani; kehtiv piir on <c1/>; alla <c2/> alampiir lükatakse tagasi

# text
# c1: hdop_max
seg-a07e6ce67371 = REPRESENTATIVE, ainult silt: pool väärtusest <c1/> (skoori { "0.35" } algussuhtarv)

# text
# c1: pdop_max
seg-06db7e7af59c = REPRESENTATIVE, ainult silt: pool väärtusest <c1/>

# text
# c1: min_used
seg-7e7f17d36ea4 = REPRESENTATIVE, ainult silt: üks rohkem kui <c1/>, nii et üksik kadu jätab endiselt liigse mõõtmise

# text
# c1: epochs[].geometry
# c2: status
# c3: reasons
# c4: source
# c5: n_used
# c6: hdop
# c7: pdop
# c8: vdop
# c9: open_fraction
# c10: max_azimuth_gap_deg
# c11: age_s
# c12: reported_hdop
# c13: reported_derived_mismatch
# c14: note
# c15: in_view
# c16: low_elev_deg
# c17: signal_loss
# c18: label
# c19: class
# c20: geometry_model
# c21: geometry_summary
# c22: score_model.weights
# c23: docs/revisions/STUDIO15-portable-math-rebaseline.md
# c24: tests/geometry_trust_no_change.rs
# c25: $PKSHT
# c26: tests/geometry_corpus_identity.rs
# c27: $PKSHT
# c28: inconsistency
# c29: tests/geometry_trust.rs
# c30: environment
# c31: geometry
# c32: inconsistency
seg-ef7a4c24e870 = <b>Mis väljundites muutus ja mis mitte.</b> Ükski skoor ei muutu, kui geomeetria ei ole kehv; silt teatatakse alati. Lisatud võtmed: <c1/> (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/> ümardatud väärtuseni { "0.001" }, <c9/> (null, kuni horisondijoon on seadistatud), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/> (satelliidid, mis on loetletud üle <c16/>), <c17/>, <c18/>), <c19/> igal mahaarvamisel ja lõpus <c20/> (läved, hoidmine, kehtiv piir ja alampiir, päritolu, klassireeglid) ning <c21/> (epohhid oleku, sildi ja mahaarvamise klassi järgi ning epohhid esitatud HDOP lahknevusega); <c22/> on nagu versioonis { "0.35" }. Kaks testi hoiavad seda „{ "0.36" } portable“ lähtetaseme baitideni, kui need võtmed on eemaldatud (versiooni { "0.35.0" } räsid, mis on ümber lähtestatud, kui mootor läks üle portatiivsele matemaatikale, ja mida hoitakse testides kirjena sellest, mida { "0.35.0" } välja andis: <c23/>). <c24/> hoiab mõlema näidissessiooni kõiki väljundeid (tulemuse JSON, CSV, SVG, verdikt, taasesitatud reaalajaread, <c25/>, Prometheus, CEF, LEEF). <c26/> hoiab iga kinnitatud laeva NMEA korpuse partii tulemust, kokkuvõtet, reaalajaridu ja <c27/> (demo ja mereviite fikstuurid, igaüks ka GPS-i ainult avatud taevana { "8" } satelliidiga, ja meeskonnakoolituse stsenaariumid, mis on genereeritud nende algväärtustest); kahes koolitusstsenaariumis, kus segamine teeb geomeetria kehvaks, on iga epohh, mis ei ole kehv, identne ja iga kehv erineb ainuüksi geomeetria mahaarvamise võrra. Logi, mille geomeetria on kehv, kaotab kuni { "15" } punkti, mida see versioonis { "0.35" } ei kaotanud; see on ettenähtud muutus. Demol loetakse äravedamine <c28/>; <c29/> muudab logi nii, et maskeerib lääne taeva (rahuldav: sildistatud, skooris mitte), maskeerib selle ja kaks idapoolset satelliiti (kehv: geomeetria mahaarvamised, lukustuse kadu <c30/>, sest ka kõrged satelliidid läksid), kaotab ainult alla { "15" }° satelliidid (lukustuse kadu <c31/>) ja esitab HDOP-i, mida taevas ei seleta (kehva geomeetria mahaarvamine muutub <c32/>). Läved on MODELLED: valitud, mitte ühelegi logile sobitatud; siin ei väideta midagi selle kohta, kui sageli loomulikku halvenemist ja rünnakuid päris andmetel eristatakse.

# text
seg-8ddaf82ba00b = Sündmuste ja ennustuste esitamine

# text
# c1: detected
# c2: late
# c3: missed
# c4: not-evaluable
# c5: agree
# c6: disagree
# c7: no-prediction
# c8: not-evaluable
seg-c52c285aa308 = Iga sündmuse kohta annab tulemus valehäired kalibreerimise ja algushetke vahel, esimese häire ja selle monitorid, latentsuse, tulemuse (<c1/>, <c2/>, <c3/> või <c4/>) ning vaadeldud C/N0 languse mediaani ennustuse vastu (<c5/>, <c6/>, <c7/> või <c8/>). Lahknevust teatatakse, mitte kunagi ei häälestata ära: tolerantsid on stsenaariumis ja stsenaarium on tulemuse räsis.

# text
seg-3715df3fd8f7 = Mida see ei väida

# text
# c1: VERIFICATION-MATRIX.md
seg-21a4b903e179 = Usalduse monitorid on MODELLED: nende läved on sisendid ja nende tuvastamise toimivus reaalse häire korral on see, mida sündmuste skoorimine mõõdab, mitte midagi, mida see liik väidab. JammerTest { "2024" } spuufimise sessioonidel tabavad mootori raja monitorid mõne algushetke { "10" } s jooksul ja on teiste puhul hilised; arvude jaoks vt rida „Clock-aided χ², RAIM, AGC, SQM fused per-epoch security FoM“ failis <a1><c1/></a1>. Ennustus, mis ühe logiga kokku langeb, on üks andmepunkt, mitte valideerimine.

# text
seg-0c413c1a491c = <s1>Eelmine</s1>Vastupidavuse ristviited

# text
seg-63fc2b340fd1 = <s1>Järgmine</s1>Meretrust
