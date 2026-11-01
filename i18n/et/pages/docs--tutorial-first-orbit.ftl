# docs--tutorial-first-orbit: translations (et)

# text
seg-51ae9468b92a = Mis see stsenaarium on

# text
seg-08f3fdc9252a = Üherealise kokkuvõtte lugemine

# text
seg-def5271a207d = Mida test fikseerib

# text
seg-e5f926d1055b = Lõksud ja ühikud

# text
seg-cb457294fc53 = Mis edasi

# text
# c1: docs/tutorials/01-first-orbit.md
seg-dcb2d0b170c1 = Source: <c1/>

# text
seg-f57d8b38bf08 = Õpetus { "1" } — Minu esimene orbiit: kus on GPS satelliidid

# text
# c1: orbit
# c2: scenarios/orbit-sgp4-gps.toml
# c3: scenarios/orbit.toml
seg-1b9e1178555d = <c1/> · <b>Stsenaarium:</b> <c2/> (õppekoopia: <a1><c3/></a1>) · <b>Raskusaste:</b> algaja · <b>~{ "15" } min</b>

# text
seg-d065731294a1 = Lõpuks on propageeritud <em>tegelik</em> töötav GPS konstellatsioon, loetud selle kättesaadavust ja geomeetriat ning eksporditud tabel sellest, kus iga satelliit kosmoses tegelikult asub — ja teatakse, et see tabel on valideeritud välise etaloni vastu, mitte iseenda vastu.

# text
seg-b07bb365235d = GPS (Global Positioning System) satelliidid ütlevad kasutajale, <em>kus ta on</em> ja <em>mis kell on</em>. Enne seda tuleb teada, <b>kus satelliidid on</b> ja <b>mitu neist kasutaja näeb</b>. See on geomeetria ja geomeetria seab põranda sellele, kui täpselt saab positsioneerida (täpsuse halvenemise tegur ehk DOP). See õpetus:

# text
# c1: gps-ops
seg-dec5079e7715 = võtab GPS konstellatsiooni tõelise Celestraki <c1/> hetktõmmise (2021-07-28, { "30" } satelliiti, tõelised kaherealised elemendikomplektid, TLE-d),

# text
seg-693859c435d8 = propageerib iga satelliidi valideeritud SGP4/SDP4 mudeliga (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }),

# text
seg-74b73260c7bc = arvutab igal ajasammul välja, milliseid satelliite madala Maa orbiidi kasutaja näeb (nähtavusjoon, Maa varjutus ja { "5" }° kõrgusmask),

# text
seg-605c40b73e96 = muudab selle geomeetria <b>PDOP-iks</b> (positsiooni täpsuse halvenemise tegur) ja <b>positsiooni täpsuseks</b> ning

# text
seg-356e96d219b5 = ekspordib satelliitide tegelikud Maaga seotud (ECEF) asukohad SP3 faili (Standard Product { "3" }, rahvusvahelise GNSS teenistuse IGS täppisorbiidi vorming; GNSS on ülemaailmne satelliitnavigatsioonisüsteem).

# text
seg-ff1666fe175e = Selgroog on: <b>TLE → SGP4 propageerimine → ECEF epohhi kohta → nähtavus → nähtavate satelliitide arv → PDOP → positsiooni-sigma = PDOP · σ_UERE</b>, kus σ_UERE on kasutaja ekvivalentne kauguse viga (1-σ kauguse mõõtmise viga satelliidi kohta).

# text
seg-379da723ae57 = Või avada <a1>brauseri Studio</a1> ja valida orbiidi stsenaarium.

# text
seg-441743833f1e = Deterministlik käivitus (algväärtus (seed) = { "17" }) trükib:

# text
seg-918a30fea48a = Väli välja kaupa:

# text
# c1: scenario 4c51512369a6
seg-375fad797dcf = <b><c1/></b> — 12-märgiline stsenaariumi räsi. See on täpsete sisendite sõrmejälg (algväärtus (seed), läved, mudeli parameetrid, TLE plokk). Muuta mis tahes sisendit ja see muutub; hoida need samadena ja käivitus reprodutseeritakse bitt-bitilt. Sama räsi on templitud diagrammi jaluses ja JSON (JavaScript Object Notation) tulemusefailis.

# text
# c1: 345/361 samples GNSS-nominal
seg-133711d1ad9f = <b><c1/></b> — { "361" } ajasammust on kasutajal kasutatav fiks { "345" } sammul ({ "95.6" } %). Käivitus on { "12" } h läbimine ({ "43,200" } s) sammuga { "120" } s.

# text
# c1: best PDOP 1.07
seg-a500c0473784 = <b><c1/></b> — parim (madalaim) positsiooni täpsuse halvenemise tegur läbimise jooksul. PDOP lähedal väärtusele { "1" } on suurepärane geomeetria; mida madalam, seda parem.

# text
# c1: pos 1.07m
# c2: sigma_uere_m = 1.0
seg-98a24f0170d2 = <b><c1/></b> — parim positsiooni täpsus: <b>positsiooni-sigma = PDOP · σ_UERE</b>. Selles stsenaariumis <c2/>, seega on kaks arvu siin <em>numbriliselt võrdsed</em> — kuid reegel on PDOP × UERE, <b>mitte</b> „positsioon = PDOP“. { "3" } m UERE korral oleks positsiooni-sigma ~{ "3.2" } m. (Vt lõpus olevat lõksu.)

# text
# c1: holdover
# c2: p95
# c3: integrity
# c4: security
# c5: security
# c6: n/a (no attack)
seg-410081c6dcab = Kella arvud (<c1/>, <c2/>, <c3/>, <c4/>) tulevad kaasa, sest orbiidipakett kannab läbimise jooksul ka kella; need on <a1>õpetuse { "2" }</a1> fookus, mitte selle oma. (<c5/> näitab <c6/>, sest rünnakut ei ole seadistatud.)

# text
seg-95ccef0d94ae = JSON geomeetriaplokis on aluseks olevad arvud:

# text
seg-89cb7db9b9eb = Kus satelliidid on? (tasu)

# text
seg-81678afa0cee = Geomeetria on hea <em>sellepärast</em>, et satelliidid on tõesti GPS kihis. Tõestada seda — eksportida nende Maaga seotud asukohad:

# text
seg-1452dfac9e06 = Esimesed kolm satelliiti esimesel näidissammul, ECEF km-des (SP3 fail kannab neljandat, kella veergu, mis on kirjutatud „väärtust pole“ markeriga { "999999.999999" }):

# text
seg-4fd0f95da0cf = Võtta PG01 geotsentriline raadius:

# text
seg-cb02d7c01561 = Mitte-ringsõltuv sõltumatu etalon: kas see on tõesti GPS orbiit?

# text
seg-a7c478360464 = Õpetus, mis kontrollib mootorit iseenda vastu, ei tõesta midagi. Siin on väline, <em>mitte-ringsõltuv</em> ankur igale ülaltoodud väitele.

# text
# c1: a
# c2: tests/tutorials.rs::tutorial1_satellites_are_in_the_gps_meo_shell
# c3: 26000 km < |r(PG01)| < 27200 km
# c4: a
seg-eec62069a957 = <b>{ "1" }. Satelliidid asuvad tegelikul GPS keskmise Maa orbiidi (MEO) kihil.</b> GPS nominaalne poolpeatelg on <b>a = { "26,560" } km</b>, kõrgus ≈ { "20,180" } km üle Maa keskmise raadiuse { "6,378" } km (IS-GPS-200, GPS liidesespetsifikatsioon; GPS standardse positsioneerimisteenuse (SPS) toimivusstandard, USA kaitseministeerium (DoD); Misra & Enge, <em>Global Positioning System</em>, 2. trükk). PG01 hetkeraadius <b>{ "26,480.9" } km</b> jääb mõne sajandi km piiresse väärtusest <c1/> — täpselt see, mida annab tegelik GPS ekstsentrilisus (~{ "0.005" }–{ "0.02" }). Test <c2/> kinnitab <c3/> selle avaldatud <c4/> vastu, mis on <b>Kshanast väline</b>.

# text
# c1: T = 2π√(a³/μ)
# c2: a = 26,560 km
# c3: μ = 398,600.4418 km³/s²
# c4: T = 43,078 s = 11.967 h
seg-a052774de08f = <b>{ "2" }. Läbimise pikkus on üks GPS tiirlus.</b> Kepleri kolmas seadus annab perioodi <c1/> koos <c2/> ja <c3/> (World Geodetic System { "1984" }, WGS-84; National Imagery and Mapping Agency tehniline aruanne NIMA TR8350.2): <c4/>, pool tähepäeva. Stsenaariumi kestus { "43,200" } s („~üks GPS tiirlus“) ühtib sellega alla { "0.3" } % täpsusega ja GPS maapealne jälg kordub iga tähepäev (kaks tiiru), IS-GPS-200 järgi.

# text
# c1: tests/sgp4_verification.rs
# c2: docs/SGP4-VALIDATION.md
# c3: sgp4
seg-067fb466e396 = <b>{ "3" }. Propageeritud asukohad on valideeritud, mitte ainult iseendaga kooskõlalised.</b> SGP4/SDP4 propageerija, mis selle ECEF tabeli tekitas, ühtib <b>kõigi { "666" } AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 kontrollvektoriga halvima juhu täpsusega { "4.12" } mm</b> (<c1/>, <a1><c2/></a1>) ja ühtib sõltumatu paketiga <c3/> mikronialuse täpsusega. Seega on eksporditud tabel kontrollitud välise etalonrealisatsiooni vastu, mitte Kshana enda aritmeetika vastu.

# text
seg-652ec3b3d3b8 = <b>Märkus SP3 kuupäevade kohta.</b> SP3 epohhi päis näitab kohatäite kalendrikuupäeva (2000-01-01); propageerimine algab tegelikult iga TLE enda epohhist ({ "2021" }). Lugeda tabelit kui „ECEF asukohad esimesel näidissammul“, mitte kui „{ "1" }. jaanuaril { "2000" }“.

# text
# c1: tests/tutorials.rs
seg-74dcb96a27a9 = <c1/> muudab iga ülaltoodud arvu CI lepinguks:

# text
# c1: tutorial1_orbit_headline_holds
# c2: best_pdop ≈ 1.071
# c3: best_position_sigma_m == best_pdop
# c4: sigma_uere_m = 1.0
# c5: samples_total == 361
# c6: 345/361
seg-cbad1e83279d = <c1/> — <c2/>, <c3/> (sest <c4/>), <c5/> ja kokkuvõte sisaldab <c6/>.

# text
# c1: tutorial1_satellites_are_in_the_gps_meo_shell
# c2: a = 26,560 km
seg-241d75b1502b = <c1/> — PG01 raadius on GPS kihi vahemikus, kontrollituna avaldatud <c2/> vastu.

# text
seg-34328f4f148b = Kui mootor kunagi lõpetab tegeliku GPS kihi tootmise, läheb ehitus punaseks.

# text
# c1: sigma_uere_m = 1.0
seg-3c23c11911cb = <b>Positsiooni-sigma on PDOP × UERE, mitte PDOP.</b> Need on võrdsed <em>ainult sellepärast</em>, et <c1/> siin. Muuta UERE-t ja need lahknevad.

# text
seg-6bb2f31c15dc = <b>Ajastuse arvud on nanosekundites</b>, positsiooni arv meetrites. Neid mitte segada.

# text
# c1: holdover_s
seg-5bc68d0c144d = <b><c1/> on ruudustikule kvantiseeritud</b> (alampiir ajaruudustiku sammul). Selles läbimises on kasutaja põhimõtteliselt alati fiksis, seega on holdover { "0" } s (pole katkestust, mille kaudu veereda) — see on <em>hea</em> juhtum.

# text
# c1: mask_deg
seg-9c36a5c64af5 = Pingutada või lõdvendada kõrgusmaski (<c1/>) ja jälgida kättesaadavuse muutumist — see on 2. astme harjutus.

# text
# c1: scripts/fetch_tles.sh
seg-b0222934237e = Vahetada välja värske TLE hetktõmmisega, kasutades <c1/> (2. astme „kasutada värskeid andmeid“).

# text
seg-e487166204f8 = Liikuda edasi <a1>õpetuse { "2" } — Kella holdover</a1> juurde, kus GNSS signaal <em>võetakse ära</em> ja pardakell peab veerema.

# text
seg-795315608752 = <s1>Eelmine</s1>Õpetused

# text
seg-97ca5a3cc77e = <s1>Järgmine</s1>{ "2" } · Kella holdover
