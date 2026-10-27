# docs--claims-vs-reality: translations (et)

# text
seg-a47934361f43 = Meeskonna koolituse NMEA voogud

# text
seg-ee2e250497f9 = Katsestendi eksport

# text
seg-2bd2101ce454 = Pind

# text
seg-ad856ad710eb = Staatus

# text
seg-98d0bc6b40ce = Avalike raamistike compliance-kaardistus

# text
seg-80f3f0aae42c = Häirekaart

# text
# c1: docs/CLAIMS-VS-REALITY.md
seg-28b1885c4ca7 = Allikas: <c1/>

# text
seg-bf5c2811ce29 = Väited vs tegelikkus — ülepaisutatud väidete register (ledger)

# text
# c1: OC-0
# c2: OC-13
seg-592e007bc3cf = Kshana varasema versiooni sõltumatu audit kataloogis neliteist <b>ülepaisutatud väidet</b> (<c1/>…<c2/>): kohad, kus avalik pind (README, mänguväljak, FoM (kvaliteedinäitaja) sildid, stsenaariumipaketid) kirjeldas võimekust tugevamalt, kui kood pakkus. See leht on sulgemisregister: iga rida annab algse ülepaisutatud väite, selle lahendamise viisi ja tõendi. Esineb kaks lahenduse liiki:

# text
seg-39250970dbbf = <b>Väide tagasi võetud</b> — sõnastus parandati koodiga kooskõlla (aus ümberraamimine, võimekus ei muutunud). „Null koodi = null väidet.“

# text
seg-fb7da0f79ead = <b>Asendatud</b> — tegelik võimekus ehitati ja testiti hiljem, nii et tugev väide muutus <em>täpseks</em>.

# text
# c1: tests/no_overclaims.rs
# c2: README.md
# c3: docs/CAPABILITY.md
# c4: docs/GLOSSARY.md
# c5: web/capabilities.json
# c6: web/index.html
# c7: web/README.md
# c8: README.crates.md
# c9: README.pypi.md
# c10: README.npm.md
seg-5292f7162e2b = Regressioonikaitse (<c1/>) skannib iga CI (pidev integreerimine) käituse korral elavaid avalikke pindu (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> ning crates.io, PyPI (Python Package Index) ja npm esilehed <c8/>, <c9/>, <c10/>) ning annab vea, kui mõni taandatud paljas ülepaisutatud väite fraas ilmub uuesti ilma ettevaatusmärkuseta — nii et rida ei saa vaikselt GREEN-ist tagasi langeda.

# text
seg-dafc6f322f34 = Kõik neliteist rida on <b>GREEN</b>.

# text
seg-5cf7bf2d1889 = OC (ülepaisutatud väide)

# text
seg-0e01d4053d7f = Algne ülepaisutatud väide

# text
seg-36bf87638923 = Lahendus

# text
seg-70a952c4150b = „ühine Kalmani liitmishindaja“ vihjas ühele ristkovariatsiooniga filtrile; kood käitas kahte sõltumatut hindajat

# text
seg-d5682a7fdb11 = <b>Asendatud</b> — ehitati tõeline ristkovariatsiooniga seotud kella+asukoha Kalmani filter

# text
# c1: src/fusion/coupled.rs
seg-1008020cd9e4 = <c1/> ({ "7" } testi, sh 100 katsega seotud-vs-sidumata ansambel, mis nõuab, et seotud asukoha RMS (ruutkeskmine) oleks alla { "0.6" }× sidumata omast ja seotud filter võidaks vähemalt { "90" } katsest { "100" }-st); CAPABILITY „Sensor fusion“ → täielik

# text
seg-334fc345d501 = „kellaabistatud spuufimise tuvastamise RAIM (vastuvõtja autonoomne terviklikkuse seire)“ vihjas mitme satelliidiga RAIM-detektorile

# text
seg-cf0795c2ee02 = <b>Väide tagasi võetud → Asendatud</b> — ümber raamitud kella stabiilsuse spuufimise tuvastatavuse piiriks; seejärel lisandus tõeline RAIM/ARAIM (HPL/VPL (HPL: horisontaalne kaitsetase; VPL: vertikaalne kaitsetase))

# text
# c1: src/raim.rs
# c2: docs/INTEGRITY.md
seg-f46432acbfa0 = <c1/> ({ "30" } testi — hetktõmmis + lahenduste eraldamise ARAIM, HPL/VPL, FDE (vea tuvastamine ja välistamine), Stanfordi diagrammid); <c2/>

# text
seg-8b47f69dbb76 = „segamise demonstraator“, mille taga polnud segamise koodi

# text
seg-bfff34d5a250 = <b>Asendatud</b> — ehitati lingibilansi segamismudel J/S → efektiivne C/N₀ → sideme kaotus

# text
# c1: src/jamming.rs
seg-5f75628b8201 = <c1/> ({ "10" } testi); README rida „Resilience“

# text
seg-bae512770cd6 = „Täielik IMU (inertsiaalmõõtühik) Alani dispersiooni müramudel IMU triaadil“ — mudel oli ühe teljega

# text
seg-50c0b5855cb9 = <b>Väide tagasi võetud → Asendatud</b> — ümber raamitud 1-DOF (DOF: vabadusaste) veaeelarveks; seejärel anti välja kolmeteljeline strapdown INS (inertsiaalnavigatsioonisüsteem)

# text
# c1: src/inertial
seg-501bf7d8fff0 = <c1/> kolmeteljeline strapdown (kvaternioonasend, NED (põhi-ida-alla) mehhaniseerimine, coning/sculling); ROADMAP „Inertial“

# text
seg-ad250a99b05f = „Hübriidne PNT (positsioneerimine, navigatsioon ja aeg) integreerimine“ vihjas seotud GNSS/INS (GNSS: ülemaailmne satelliitnavigatsioonisüsteem) filtrile; see oli dead-reckoning’u veaeelarve

# text
seg-85fb58d37a5d = <b>Väide tagasi võetud → Asendatud</b> — ümber raamitud dead-reckoning’uks seadistatava uuesti haakimisega; seejärel anti välja tõeline tihedalt seotud GNSS/INS liitmine

# text
# c1: src/fusion/tightly_coupled17.rs
seg-9e6b092d5656 = <c1/> (17-olekuline UKF (unscented Kalmani filter) kvant-CAI (CAI: külmaatomi interferomeeter) dead-reckoning’uga); CAPABILITY „Sensor fusion“ → täielik

# text
seg-46a637f8e967 = „valideeritud ~{ "2" }%“ vihjas ranget jõustatud lävendit

# text
# c1: VALIDATION.md
seg-5e98d7664558 = <b>Väide tagasi võetud</b> — <c1/> nimetab <em>jõustatud</em> läve ({ "20" }–{ "25" }% algväärtuste keskmisena); „~{ "2" }%“ märgiti tüüpiliseks vaatluseks, mitte lävendiks

# text
# c1: docs/VALIDATION.md
seg-84f4fcdc7e50 = <c1/> päis „On tolerances“

# text
seg-85ec2fe9c7f7 = „platvormideülene deterministlik“ ilma kinnitatud tõendita

# text
seg-6e516f04db89 = <b>Väide tagasi võetud</b> — tööriistaahel fikseeriti täpsele väljalasele; stsenaariumipõhised kuldräsid kinnitati reprodutseeritavuse lüüsiga. (Bitthaaval identsus <em>üle</em> OS/arhitektuuri (OS: operatsioonisüsteem) jääb avatud punktiks, mida öeldakse ausalt.)

# text
# c1: rust-toolchain.toml
# c2: 1.93.0
# c3: tests/golden.rs
# c4: tests/cross_platform_golden.rs
# c5: scripts/check-reproducible.sh
seg-9db327be56c3 = <c1/> (kanal <c2/>); <c3/> (arvväärtused täpsusega { "1e-6" }); <c4/> (iga tulemuse sisendi sõrmejälje ja kuju räsi, käitatud Linuxi, macOS-i ja Windowsi CI maatriksil); <c5/>

# text
seg-2708139388ed = „hübriidne kvant-klassikaline PNT simulaator“ vihjas esimestest printsiipidest lähtuvale kvantfüüsikale

# text
seg-717167714e83 = <b>Väide tagasi võetud → Asendatud</b> — ümber raamitud PNT vastupidavuse simulaatoriks, mis kasutab kvantsensorite toimivusmudeleid; seejärel lisandus esimestest printsiipidest lähtuv Mach–Zehnderi CAI füüsika

# text
# c1: src/inertial/quantum_imu.rs
# c2: 1/√(N·C²·T²)
# c3: docs/QUANTUM.md
seg-c67fb22add4b = <c1/> ({ "26" } testi — Mach–Zehnderi faas, projektsioonimüra <c2/>, vibratsiooni ülekandefunktsioon, Coriolis + AC-Starki (AC: vahelduvvool) süstemaatilised vead); <c3/>

# text
seg-5c6b7d4f2029 = „Integrity Performance“ FoM vihjas lennunduse HPL/VPL/RAIM terviklikkusele

# text
seg-ee5487da890c = <b>Väide tagasi võetud + Asendatud (kihiti)</b> — stsenaariumi käitusepõhine FoM on ausalt sildistatud kui <em>filtri sisemine kooskõla</em> (<b>mitte</b> lennunduse terviklikkus); tõeline ARAIM HPL/VPL esitatakse <em>eraldi</em>, et neid ei aetaks kunagi segi

# text
# c1: src/fom.rs:80
# c2: integrity
# c3: src/raim.rs
# c4: docs/INTEGRITY.md
seg-31aacdf17b02 = <c1/> (<c2/>: sisemine kooskõla, ettevaatusmärkusega); <c3/> + <c4/> (tõeline ARAIM)

# text
seg-0686fa147c96 = Turvalisuse FoM esitati alati tähendusrikkana, isegi rünnaku puudumisel

# text
# c1: 1 − P_md
seg-d6d9296422fc = <b>Väide tagasi võetud</b> — Turvalisuse FoM (<c1/>) on raamitud spuufimise detektori konteksti ja on tähendusrikas ainult siis, kui rünnakustsenaarium on seadistatud

# text
seg-8f7b211b5a0c = README rida „Resilience“; Turvalisuse FoM on defineeritud töönõudeliselt kahjulikus spetsifikatsioonipunktis

# text
seg-d66421174e94 = „Positioning Performance“ FoM vihjas täielikule asukohadomeeni täpsusele

# text
# c1: pos_rms_m
seg-9eeb13a16350 = <b>Väide tagasi võetud</b> — sildistatud inertsiaal-/hübriidpakettide 1-DOF <c1/>-ks, selgesõnaliselt <b>mitte</b> 2-D CEP/2DRMS (CEP: ringvea tõenäoline väärtus) ega DOP-kaalutud (DOP: täpsuse halvenemise tegur) täpsuseks

# text
seg-e8115df73c10 = README kvaliteedinäitajate tabel (rida „Positioning Performance“)

# text
seg-5c73759a2454 = inertsiaalse FoM arve loeti ühe algväärtuse põhjal ansambli statistikana

# text
# c1: monte_carlo: false
# c2: runs = N
seg-3db3a41ce848 = <b>Väide tagasi võetud</b> — üksik käitus märgitakse <c1/>; <c2/> annab keskmise/hajuvuse/alglaadimisega { "95" }% usaldusvahemiku

# text
seg-bf737455e6f2 = README FoM tabel; stsenaariumikatvuse ümbriku testid

# text
seg-aa362992b5da = stsenaarium „SGP4 (Simplified General Perturbations { "4" }) GPS (Global Positioning System) konstellatsioon“ kasutas sünteetilisi kohatäite TLE-sid (kahe rea elemendikomplekte)

# text
# c1: gps-ops
seg-ebae20813a52 = <b>Asendatud</b> — stsenaarium manustab nüüd ehtsa kuupäevatembeldatud Celestraki <c1/> hetktõmmise rangete kontrollsummadega

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: gps-ops
# c3: strict_checksum
# c4: tests/scenario_coverage.rs
seg-2d49f6101571 = <c1/> (tõeline <c2/>, <c3/>); <c4/>

# text
# c1: Cargo.toml
seg-cdefa4ee436a = README versioonistring lahknes failist <c1/>

# text
# c1: Cargo.toml
seg-8e66b9485565 = <b>Väide tagasi võetud</b> — CI lüüs kontrollib, et README olekumärk ühtib failiga <c1/>

# text
seg-347fd8c1f334 = { "0.35" }: väited hoitud kitsad ja üks parandus

# text
# c1: tests/no_overclaims.rs
# c2: tests/compliance_report.rs
seg-946ff389cec5 = Väljalaske { "0.35" } funktsioonid kirjutati nii, et nende piirid on toodud väite kõrval, ja samad kaitsed (<c1/> ning sõnastuskaitse failis <c2/>) skannivad neid kirjeldavaid lehti. See tabel ei kuulu ülaltoodud neljateistkümne reaga registrisse; uute pindade puhul registreerib see, mida väidetakse ja mida mitte.

# text
seg-6ac3f9b26aad = Mida väidetakse

# text
seg-6f558815da86 = Mida ei väideta

# text
# c1: receiver_trust
# c2: $PKSHT
seg-d0964d2f9bbc = Laeva usaldusskoor (<c1/>, <c2/>, lüüs, Signal K, OpenCPN)

# text
seg-ee4d75006bfc = 0–100 skoor ja põhjused vastuvõtja enda NMEA-st, MODELLED

# text
seg-59ff27c84fe4 = nõuandev, mitte tüübikinnitust omav navigatsiooniseade; ühe logi skoor ei ole väide teiste vastuvõtjate kohta; see ei muuda lahendit täpsemaks

# text
seg-8869e6a5c10b = sünteetiline sillal tekkiv NMEA skriptitud sündmuste ja juhendaja logiga

# text
seg-bc4ba77bc569 = ainult tekst, raadiosageduslikku väljundit pole; mitte kunagi laeva reaalsete navigatsioonisüsteemide jaoks; nõuandev, mitte tüübikinnitust omav navigatsiooniseade

# text
seg-9482ecbb2748 = allkirjastatud tehniline kirje, mida saab võrguühenduseta kontrollida

# text
seg-20ae6dd2b780 = ei ole õiguslik arvamus; ei ütle, mis sündmuse põhjustas, kes oli vastutav ega seda, et logi näitab seda, mida vastuvõtja tegelikult vastu võttis

# text
seg-4132fc36f1d3 = koondatud halvenenud navigatsiooniga ruudud avatud litsentsiga aruannetest

# text
seg-c64960abf9fb = ei ole prognoos; marsruudi kokkupuude on ruutude osa, mitte risk

# text
seg-ed6d268e0291 = stsenaariumi sõiduki liikumine ja sündmused failides, mida laborisimulaator saab lugeda

# text
seg-85c8ad22ef03 = signaali ei kirjutata; simulaatori ega vastuvõtja toimivust ei väideta

# text
seg-1bba9a883650 = millised read käituste kogum toetab tõendeid (supports evidence for), igal real on lünk

# text
seg-f2a836780831 = mitte kunagi seda, et raamistik on täidetud või toode heaks kiidetud; pelgalt stsenaariumi liigi silt ei ole tõend

# text
# c1: docs/RESILIENCE-CROSSWALK.md
seg-31c7009c9914 = <b>Parandus on registreeritud väljalases { "0.35" }.</b> Faili <c1/> ja vastupidavusmooduli kommentaaride varasem versioon kirjeldas seitset „tehnikakategooriat“ DHS Resilient PNT Conformance Framework’is. Selle raamistiku versioon { "2.0" } defineerib põhifunktsioonid (Prevent, Respond, Recover), tasemed { "0" } kuni { "4" } ja kaheksa nummerdatud nõuet ning seitsmest kategooriast koosnevat loendit ei sisalda. Seitse alamskoori nime, mida hindamismootor väljastab, on Kshana enda ja ristviide ütleb seda nüüd ka.

# text
seg-f70787ecb194 = Kuidas rida jääb GREEN-iks

# text
# c1: tests/no_overclaims.rs
seg-f2c599e8882a = Tugevad väited (OC-0/2/7/8 ning OC-1/3/4/12 asendatud pooled) on GREEN, sest võimekus on <b>välja antud ja testitud</b> — mitte seetõttu, et sõnastust pehmendati. Tagasi võetud read on GREEN, sest elav sõnastus ühtib koodiga. Kaitsetest teeb teise kategooria jõustatavaks: kui taandatud ülepaisutatud väite fraas naaseb avalikule pinnale, läheb CI punaseks. Vt <c1/>.

# text
seg-39e475441b60 = <s1>Eelmine</s1>Miks read jäävad modelleeritud tasemele

# text
seg-07ef8e1e862e = <s1>Järgmine</s1>Päritolu
