# docs--example-multi-tool: translations (et)

# text
# c1: docs/examples/multi-tool-pipeline.md
seg-077d900655af = Allikas: <c1/>

# text
seg-42e93cd44e94 = Läbitöötatud näide: Kshana kui mitme tööriista missioonianalüüsi liimikiht

# text
# c1: label
seg-286cf0e7bb71 = See viib ühe trajektoori otsast lõpuni läbi standarditel põhinevate koostalitlus- ja missioonianalüüsi stsenaariumi liikide ning näitab, kuidas Kshana asub programmi juba kasutatavate kõrge täpsusega tööriistade <em>vahel</em>, mitte ei konkureeri nendega: GMAT (General Mission Analysis Tool), Orekit ja STK (Systems Tool Kit) trajektoori kavandamiseks ning Basilisk või { "42" } asendi- ja orbiidijuhtimissüsteemi (AOCS) simulatsiooniks. Iga samm on käivitatav stsenaariumi liik ja iga tulemus kannab märget <c1/>, mis ütleb selle ulatuse ja tõendustaseme.

# text
# c1: label
seg-7198d05bece6 = Aus märkus: see on <em>geomeetria-/analüütiline</em> torujuhe Phase A-eelsel / kompromissiuuringu tasemel (enne missiooni esimest ametlikku kavandusfaasi). See ei ole lennudünaamika sertifitseerimine; vt iga liigi välja <c1/>.

# text
seg-70c18138497b = Muud allpool kasutatud lühendid: FDS (lennudünaamikasüsteem), CCSDS (Consultative Committee for Space Data Systems), OEM (Orbit Ephemeris Message), SGP4 (Simplified General Perturbations { "4" }, kaherealise elemendikomplekti propagaator), TOML (stsenaariumifaili vorming) ja CLI (käsurea liides).

# text
seg-7cc0d4d15c4a = Torujuhe

# text
# c1: passes
# c2: link-budget
# c3: campaign
seg-09a321d36a10 = Sammud on eraldi käivitused: igaüks võtab sisendid oma stsenaariumifailist, nii et arvu kandmiseks ühest teise (näiteks kaldkaugus stsenaariumi liigist <c1/> liiki <c2/>) tuleb muuta järgmist faili. Stsenaariumi liik <c3/> võib hoida mitut liiki ühes käivituses ühiste tingimuste all; vt <a1>CAMPAIGNS.md</a1>.

# text
seg-382ae9161181 = Iga allpool olev käsk käivitatakse hoidla juurkataloogist ning selle all olev kokkuvõte on esimene rida, mille kshana { $version } prindib tarnitud stsenaariumi jaoks.

# text
# c1: oem-interop
seg-7939b15235c8 = { "1" }. Importige kavandaja loodud trajektoor (<c1/>)

# text
seg-4b732dd54291 = GMAT, Orekit ja STK kõik <em>ekspordivad</em> CCSDS orbiidi efemeriidisõnumeid (Orbit Ephemeris Message). Kshana impordib need (silla teine suund), nii et Kshana analüüs võib alata täpselt sellest orbiidist, mille trajektoori kavandaja kinnitas, mitte uuesti tuletatud lähendist:

# text
# c1: oem_text
# c2: kshana scenarios/orbit-sgp4-gps.toml --export-oem gps.oem
# c3: oem-interop: ingested 30 segment(s), 10830 states from external OEM (originator KSHANA) (MODELLED interop)
# c4: label
seg-3136cfd5a40e = See raporteerib segmendid, objektid, tugisüsteemid ja epohhide ulatuse ning kiiruse kooskõla kontrolli, näidates, et efemeriid imporditi truult (edasi-tagasi viga alla { "1" }×{ "10" }⁻⁶ km). Kui sisendiks anda <c1/> asemel väline fail, raporteerib see, mida ta parsis: kui sisendiks on OEM, mille kirjutab <c2/>, prindib see <c3/>. Märge <c4/> ütleb selgelt, et see on struktuuri- ja füüsikakontroll impordi kohta, mitte allika orbiiditäpsuse valideerimine.

# text
# c1: passes
seg-e2c563fcb8cb = { "2" }. Millal see on maajaamast nähtav? (<c1/>)

# text
# c1: refraction
# c2: light_time
seg-d66361888ede = Prognoosib jaama kohal tõusu-/loojumisüleminekuid üle kõrgusnurga maski: signaali omandamine (AOS), lähima möödumise aeg (TCA), signaali kadumine (LOS), maksimaalne kõrgusnurk ja kestus ning kogu juurdepääsuaeg. See on maasegmendi planeerimispäring. Orbiit on SGP4 elemendikomplekt, mis on viidud Maaga seotud tugisüsteemi IAU 2006/2000A ahelas, ja kõrgusnurgad on näivad: ITU-R P.834-9 murdumine ja allalingi valguse levimisaeg, mõlemat saab eraldi sisse ja välja lülitada (<c1/>, <c2/>).

# text
# c1: link-budget
seg-24d31bafa334 = { "3" }. Kas ühendus sulgub? (<c1/>)

# text
seg-47bdb9d4700c = Üleminekul sisestage kaldkaugus ja terminali näitajad CCSDS { "401" } / DSN 810-005 (NASA Deep Space Network) lingivõrrandisse:

# text
seg-db12a99edcd2 = Raporteerib vabaruumi levikadu (FSPL), kandja ja müra tiheduse suhte (C/N₀), bitienergia ja müra tiheduse suhte (Eb/N₀), varu ning selle, kas link <b>sulgub</b> nõutava Eb/N₀ suhtes: sidevõimalikkuse kontroll, mis muudab „see on nähtav“ väiteks „me saame andmed tegelikult alla laadida“. Arvud tulenevad otse failis olevatest sisenditest (siin { "55" } dBW EIRP, ekvivalentne isotroopne kiirgusvõimsus, { "53" } dB/K vastuvõtu G/T-ks, võimenduse ja müratemperatuuri suhteks); enne varu lugemist sisestage oma terminali näitajad. See on deterministlik arvutus, mitte kalibreeritud terminali andmeleht.

# text
# c1: space-weather
seg-85ad46986461 = { "4" }. Kui kiiresti keskkond seda lagundab? (<c1/>)

# text
seg-8977b12fd934 = Juhib termosfääri neutraaltihedust päikese (F10.7, { "10.7" } cm raadiovoog, ja selle 81-päevane keskmine F10.7a) ning geomagnetilise (Kp ja ap indeksid) aktiivsuse kaudu Jacchia-71 eksosfääri temperatuuri abil. See hõlmab ~{ "5" }–{ "10" }× päikesetsükli tiheduse kõikumist, mille staatiline atmosfäär välja jätab, nii et orbiidi eluea või takistuse hinnang kajastab kosmoseilma režiimi, mitte fikseeritud atmosfääri. Alates versioonist { "0.30" } on tihedus Jacchia { "1971" } termosfääri tihedus, iseloomustatud NRLMSISE-00 (Naval Research Laboratory mass-spectrometer and incoherent-scatter) suhtes, kuid mitte andmetega valideeritud NRLMSISE-00 atmosfäär.

# text
seg-4b5bdadf3e7e = { "5" }. Andke tulemus edasi (eksport)

# text
# c1: orbit
# c2: --export-oem <file>
# c3: --export-sp3 <file>
# c4: --export-omm <file>
# c5: --export <czml|kml|geojson|stk|sigmf|all|list>
# c6: .e
# c7: spectrum
# c8: --export list
# c9: lunar-interop-export
seg-f4a438636ea8 = Sama CLI kirjutab järgmise tööriista jaoks standardfaile. Stsenaariumi liigi <c1/> stsenaariumi puhul kirjutab <c2/> CCSDS OEM { "2.0" } efemeriidi koos kiirusega (fail, mida GMAT, Orekit ja STK loevad), <c3/> SP3 (Standard Product { "3" }) täpse efemeriidi ja <c4/> CCSDS orbiidi keskmiste elementide sõnumi (Orbit Mean-Elements Message) kataloogi. <c5/> katab vaatajad: CZML (Cesium Language), KML (Keyhole Markup Language, Google Earthi jaoks), GeoJSON, STK efemeriidifailid (<c6/>, üks satelliidi kohta pluss kasutaja) ja SigMF (Signal Metadata Format) salvestised stsenaariumi liigist <c7/>. <c8/> ütleb, millised stsenaariumi puhul kehtivad. Kuu jaoks annab stsenaariumi liik <c9/> Kuu tugisüsteemi, ajaskaala ja efemeriidi CCSDS OEM-ina koos standardi järgimise kontrolliga. Vt <a1>INTEROP.md</a1>.

# text
seg-5293e6d761a8 = Miks see on liim, mitte konkurent

# text
# c1: launch-window
# c2: reentry
# c3: eo-coverage
# c4: space-packet
# c5: attitude-budget
seg-cd78b0435abb = Iga samm on väike, auditeeritav, reprodutseeritav stsenaarium selge ulatusemärkega. Kõrge täpsusega tööriistad omavad trajektoori optimeerimist, kuue vabadusastmega (6-DoF) AOCS-i ja aerotermilist sisenemist, laskumist ja maandumist (EDL); Kshana omab <b>avatud, tsiteeritavat, käivitatavat sidekudet</b>: standardvormingute importimine, läbivate geomeetria- ja teostatavuspäringute vastamine ning tulemuse edasiandmine tasemel, mida iga partner saab ilma litsentsita käivitada. Vt ka kaaslasi, missioonianalüüsi liike <c1/>, <c2/>, <c3/>, <c4/> ja <c5/>.

# text
seg-af1ab3c55fe6 = <s1>Eelmine</s1>{ "3" } · Kvant vs klassikaline

# text
seg-b0765a28b4ce = <s1>Järgmine</s1>Stsenaariumi liigid

# text
seg-dc88ec5ccc43 = { "1" }. Importige kavandaja loodud trajektoor (oem-interop)

# text
seg-cdff21ef6984 = { "2" }. Millal see on maajaamast nähtav? (passes)

# text
seg-afa47b4283a3 = { "3" }. Kas ühendus sulgub? (link-budget)

# text
seg-e508e844bf2d = { "4" }. Kui kiiresti keskkond seda lagundab? (space-weather)
