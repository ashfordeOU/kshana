# docs--agents: translations (et)

# text
# c1: docs/AGENTS.md
seg-0619151df586 = Allikas: <c1/>

# text
seg-d0e198572cfe = Kshana kasutamine AI agendist

# text
# c1: SURFACES.md
seg-eccd1d5fbdb2 = Agendile (või agenti juhtivale isikule): millist tööriista millise küsimuse jaoks kutsuda, mida tööriistad teevad ja mida mitte ning mida iga vastusega koos hoida. Pinnad ja lahtrid, mis konkreetsel pinnal ei ole saadaval: <a1><c1/></a1>.

# text
seg-a0354cacda4c = Ühenda

# text
seg-337d23a873f5 = Kolmandate osapoolte AI klientide nimetamise lõik on siit välja jäetud; see on GitHubis failis <a1>docs/AGENTS.md</a1>.

# text
seg-01a862ed86e6 = Reegel iga vastuse jaoks

# text
seg-0adf5e5ad79a = Käivita mootor; ära arva arve. Esita, mida tööriist tagastas, koos selle ühiku ja tõendustasemega (VALIDATED välise sõltumatu etaloni vastu või MODELLED), stsenaariumi, algväärtuse (seed) ja mootori versiooniga, et käivitust saaks korrata. Hoia iga tulemuse enda ettevaatusmärkused sellega koos.

# text
seg-f67845b891c5 = Milline tööriist millise küsimuse jaoks

# text
seg-6f4bb4962340 = Küsimus

# text
seg-8efda304925b = Tööriist (MCP)

# text
seg-83d609ff5cc7 = Kaldkriipsukäsk

# text
seg-9b937d3cbf88 = Käivita või selgita PNT stsenaariumi (orbiidid, GNSS, ajastus, sulandamine, Kuu, optilised lingid, ...)

# text
seg-ba8b3824bba2 = Kas see vastuvõtja logi või selle laeva NMEA oli usaldusväärne ja millal see lakkas olemast?

# text
# c1: assess_receiver_log
# c2: assess_vessel_log
# c3: assess_vessel_stream
seg-f3ea74f278ac = <c1/> (mis tahes logivorming), <c2/> (laeva NMEA, pakett), <c3/> (piiratud väljavõte)

# text
seg-aa194fda4300 = Mul on väljaõppeks vaja sünteetilist NMEA-d segamise, eemaletiitmise, aja spuufimise või taasesituse sündmusega

# text
seg-0211b49536df = Näita laeva usaldusskoori seires või SIEM-vormingutes (Prometheus, CEF, LEEF, OTLP)

# text
seg-701250dfa798 = Skoori vastuvõtja logi avaldatud Jammertesti ajakava suhtes (tuvastusviivitus, tuvastamata alarmid, valehäired, taastumisaeg) või muuda see plaan sündmusteks

# text
seg-d1c81008d5f8 = Tee rikkumist paljastav kirje sellest, mida mootor laeva logi ühe akna kohta ütles, või kontrolli seda

# text
seg-b7892674ac60 = Millise Galileo satelliitide navigatsiooniandmeid see vastuvõtja voog autentib (OSNMA)?

# text
# c1: kshana osnma verify
# c2: kshana.osnma_verify
# c3: osnma_verify
seg-084a787c65cf = <b>puudub: MCP-s ei ole.</b> Kasuta <c1/> (CLI), <c2/> (Python) või <c3/> (WASM, Studio OSNMA kaart)

# text
seg-4fc021a0a145 = ei ole kaldkriipsukäsk

# text
seg-0f5db62071e9 = Vajan stsenaariumi sõiduki liikumist ja sündmuste aegu, et neid laboratoorse GNSS-i simulaatori kaudu taasesitada

# text
seg-919946a95002 = Millised avalike raamistike nõuderead need käivitused toetavad tõendeid (supports evidence for) ja milline on lünk?

# text
# c1: compliance_report
# c2: compliance_mapping
seg-5e08ec7f4852 = <c1/> (tulemusest tekstina), <c2/> (tabelid, käivitusi pole)

# text
seg-ff6556a46025 = Käivita skooritud standardipakett (DHS RPCF katseprofiilid, IMO MSC.1/Circ.1575, ICAO Doc { "9849" } lisa F) enne käivitust väidetud lävede vastu?

# text
# c1: list_standards_packs
# c2: run_standards_pack
# c3: compliance_report
seg-709c6501a661 = <c1/>, <c2/> (anna aruanne ridade saamiseks käsule <c3/>)

# text
seg-1745cce01677 = Kontrolli LunaNet Augmented Forward Signal'i (koodid, SB1, kaadrivorming) LNIS V5 / LSIS-AFS V1.0 vastu või kontrolli sümbolivoogu?

# text
# c1: lunanet_afs_check
# c2: mode
seg-d4d2e950054c = <c1/> (<c2/> spec, symbols või generate); alamkaadrite { "2" } kuni { "4" } LDPC-d ja CRC-24Q-d ei ole kontrollitud

# text
seg-86c207c3996e = Seo labori käivitus (stsenaarium, väidetud katsetingimused, vastuvõtja logi, skoor) ühes allkirjastatud paketis?

# text
# c1: create_round_trip_pack
# c2: export_test_bench
# c3: docs/spec/TEST-CONDITIONS.md
seg-25bb29e6aa3d = <c1/> pärast <c2/> (<c3/>)

# text
seg-3856b38bb9d2 = Skoori tuvastus- või holdover-esitus kshana-bench tõefaili vastu või renderda tulemusfailid edetabelilehena?

# text
seg-87e686c064ce = Vajan stsenaariumi, mis lendaks GeoJSON-marsruuti (terrain-nav, terrain-slam, gravity-map, combined-altpnt)

# text
seg-bf72fff11d84 = Milliseid satelliite näeb kasutaja tänaval, sadamas, fjordis või konteinerterminalis ning millised on DOP ja veaellips?

# text
# c1: sky_geometry
# c2: skyline_preset
# c3: [skyline]
# c4: run_scenario
# c5: orbit
# c6: integrity
# c7: user_site
seg-86eb2756fd7f = <c1/> (päring või <c2/>); stsenaariumi jaotis <c3/> käsu <c4/> kaudu (<c5/> ja <c6/> vajavad <c7/>)

# text
seg-bd7f9d7e8e27 = Kus on GNSS näinud halvenenud ja kui suur osa sellest marsruudist on selles?

# text
# c1: build_interference_map
# c2: route_exposure
seg-908b6e65372f = <c1/>, seejärel <c2/>

# text
seg-1f715d5e0c4f = GNSS-i IQ-salvestised (stseen, püüdmine, jälgimine, esiots, kampaaniad)

# text
# c1: iq_signals
# c2: iq_*
seg-5569efd18c6b = Esmalt <c1/>, seejärel <c2/> tööriistad

# text
# c1: vessel-receiver-trust
# c2: training-nmea-scenario
# c3: trust-telemetry
# c4: compliance-mapping
# c5: test-bench-export
# c6: gnss-iq
# c7: interference-map-route-exposure
seg-d44650438742 = Oskused <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> ja <c7/> kannavad allolevaid reegleid agentidele, mis laadivad oskusi.

# text
seg-a4de5a40b743 = Mida iga tööriist ei tee

# text
# c1: iq_*
# c2: KSHANA_MCP_IQ_DIR
seg-3f27662a983e = <b>Failide lugemine või kirjutamine.</b> Sisu on sisseehitatud: sisendid on tekst päringus, piiratud { "4" } MiB-ga, ja stsenaariumi väli, mis nimetab faili, lükatakse tagasi. Ainult <c1/> tööriistad puudutavad kausta, ja ainult seda, mille nimetab <c2/>, iga rada sellega piiratud.

# text
# c1: kshana osnma verify <file> --public-key ... --json
# c2: osnma_verify
seg-3efe81d26cad = <b>OSNMA kontrollimine.</b> MCP tööriista pole: sisend on pikk töötlemata vastuvõtja voog (I/NAV lehed või UBX salvestis), mis sobib CLI-le ja Pythonile, ning seda võtvad tööriistad lisaksid suure sisendi pinna ilma kasuta. Suuna kasutaja käsule <c1/> (või Pythoni <c2/>). Mida iganes selle väljund ütleb, kanna nõuanne sõna-sõnalt kaasa: ainult autentimise olek, mitte navigatsiooni terviklikkuse teenus, mitte tüübikinnitust omav navigatsiooniseade ja ilma spuufimisvastase toimivuse väiteta; tulemus on tähenduslik ainult Merkle'i juure või avaliku võtmega, mille kasutaja sai teist teed pidi.

# text
seg-b13a75d08152 = Protsessi käitamine.

# text
# c1: receiver-trust live
# c2: --listen
# c3: trust-telemetry
# c4: assess_vessel_stream
# c5: advisory
# c6: geometry
# c7: class
# c8: #
# c9: --udp
# c10: --listen tcp:
seg-9dfcbee6fdb8 = <c1/> töötava vooluna (koos väravaga ja <c2/>), telemeetria eksportijad (<c3/>: Prometheus, syslog, OTLP) ja väljaõppe-NMEA voogedastus aadressile on ainult käsurealt. <c4/> skoorib väljavõtet sama mootoriga ega kirjuta ühtegi porti. Väljavõtte tööriistad tagastavad live JSON-lines skeemi { "1.3" } (<c5/> avaldus ja satelliitide <c6/> igal epohhil, <c7/> igal mahaarvamisel); laeva käivituse CSV algab <c8/> kommentaarireaga, mis kannab sama avaldust, seega loe seda kommentaarivalikuga. <c9/> ja <c10/> seovad loopback-aadressi, kui pole öeldud teisiti.

# text
seg-ac51aad84893 = Signaali kirjutamine.

# text
# c1: export_test_bench
# c2: notice
seg-ad032dee3fd3 = <c1/> tagastab sõiduki liikumise ja märgistatud sündmuste intervallid tekstina; miski, mida see tagastab, ei ole raadiosageduslik ega baasribasignaal, ei modelleeri ega juhi seda, ja sündmus ei ole retsept häire tekitamiseks. Anna selle <c2/> failidega kaasa; simulaator ja selle operaator vastutavad nende käitamise eest ainult seal, kus see on lubatud.

# text
seg-39f3aae1143a = Kaardistusest rohkemat öelda.

# text
# c1: compliance_report
# c2: statement
seg-ed04b567fc87 = <c1/> väidab, milliseid raamistiku ridu käivituste komplekt toetab tõendeid (supports evidence for), koos iga rea lüngaga. See ei ütle kunagi, et raamistik on täidetud või toode hinnatud või heaks kiidetud; kanna selle <c2/> sõna-sõnalt kaasa ja ütle „toetab tõendeid (supports evidence for)“, mitte midagi tugevamat. See loeb sisseantud tulemuse ja stsenaariumi teksti, mitte kunagi rada.

# text
# c1: --allow-network
seg-eda73a8fcbfe = <b>Andmete tõmbamine.</b> Maismaapolügooni allalaadimine on ainult käsurealt ja vajab <c1/>. Anna maismaafail, kui soovitakse, tekstina. Kasuta ainult andmeid, mida kasutajal on lubatud kasutada.

# text
seg-d513f734248e = <b>Midagi edastada või RF-i sünteesida.</b> Väljaõppegeneraator kirjutab NMEA teksti; IQ-kiht kirjutab tarkvaravastuvõtjate jaoks näidisfaile.

# text
seg-63eb4c5b4a17 = Mida vastusega koos hoida

# attr:aria-label, text
seg-6555ff9a6d8e = Väljund

# text
seg-a056a59fb678 = Hoia

# text
seg-c01c0fedd895 = Satelliitide geomeetria ja mahaarvamise klassid ({ "0.36" })

# text
# c1: geometry
# c2: environment
# c3: inconsistency
# c4: unknown
seg-3723ec5a3f8c = Esita geomeetria skoori kõrval ja iga mahaarvamise klass sellisena, nagu tagastati: <c1/> tähendab taevast (väide taeva kohta, mitte järeldus, et rünnakut ei toimunud), <c2/> signaalikeskkonda, <c3/> ründetaolist tõendit. Ütle „geomeetria teadmata“, kui olek on <c4/> (logis pole GSV-d ega GSA-d); ära järelda seda. Lävendid on <b>MODELLED</b> väidetud päritoluga.

# text
seg-0938dfb71d72 = Vastuvõtja usaldusskoor

# text
seg-8e3a7376cd6b = <b>Nõuandev</b>: mitte tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }); vastutab jätkuvalt operaator. <b>MODELLED</b>. Väida laeva piirid enne käivitust ja ära häälesta lävendit tulemuse järgi. Kõrge skoor ei ole tõend tõelise lahendi kohta; kontrollid ei näe spuuferit, mis on kooskõlas iga teise sensoriga.

# text
seg-ae3f0548e93f = Tõendipakett

# text
# c1: intact-signer-not-pinned
seg-81189f29f884 = <b>Tehniline kirje</b>, mitte juriidiline arvamus, faktiväide ega heakskiit. Kontrolli allkirjastaja avaliku võtmega, mis on saadud teist teed pidi; ilma selleta on otsus <c1/>, mis tõestab ainult terviklikkust võtme suhtes, mida pakett ise nimetab: ütle „terve, allkirjastaja pole tuvastatud“, mitte kunagi „kontrollitud“. Ära kunagi tagasta, logi ega küsi allkirjastamise seemet (seed) vestluses, kui võti on oluline: kasuta CLI-d.

# text
seg-512e5ee42c1e = Väljaõppe-NMEA

# text
seg-c59a76aefff5 = <b>Ainult tekst</b>, väljaõppeks ja katsetamiseks, <b>mitte kunagi</b> laeva reaalajas navigatsioonisüsteemidele. Tagasta algväärtus (seed) ja juhendaja logi.

# text
seg-14781c19be62 = Häirekaart, marsruudi ekspositsioon

# text
seg-7135c6f44d49 = See, kuidas täpsuskoode loetakse ning võrgu ja marsruudi geomeetria, on <b>VALIDATED</b> sõltumatute teekide vastu sünteetilistel sisenditel; meetodi lävendid jäävad <b>MODELLED</b> ning seda, et halvenenud lahter on häire, <b>ei</b> kontrollita: halvenenud lahter <b>ei</b> tuvasta häiret põhjusena. Lahter, mida ei vaadeldud, <b>ei ole</b> tõend selge marsruudi kohta. Varasemad aruanded, <b>mitte prognoos</b>. Ainult koond: ära proovi identifikaatoreid taastada. ADS-B ja AIS kaardid jäävad eraldi.

# text
seg-e47db9be47ea = Taevageomeetria, horisondijoon

# text
# c1: advisory
seg-839eb485b1d2 = <b>MODELLED</b> geomeetria väidetud veamudeli all, ainult otsenähtavus: ei mingit difraktsiooni, mitmeteelevi ega mitteotsenähtavuse vastuvõttu. Eelseadistused on <b>REPRESENTATIVE</b>, mitte mõõdistused; kanna eelseadistuse päritolu kaasa. Eelseadistatud konstellatsioonid on esinduslik taevas, mitte kuupäeva taevas. Ellips skaleerib väidetud UERE-d: mitte mõõdetud täpsus ja mitte terviklikkuse piir. Hoia <c1/> alles.

# text
# c1: optical-atmosphere
seg-0002a3dc682e = Optilise lingi kättesaadavus (<c1/>, { "0.37" })

# text
# c1: availability_ceiling_pct
seg-1098f908d9dc = <b>MODELLED</b>, nõuandev. Pilvekliimad on väidetud sisendid, mitte andmestik, ja ühtegi mõõdetud kättesaadavuse kirjet ei ole võrreldud: ütle „nende eelduste korral“, mitte kunagi „kättesaadavus sellel asukohal“. Hoia asukoha <b>lagi</b> (<c1/>: mida ükski varu ei tõsta) selle kättesaadavuse kõrval ja ütle, millised tehnikakasud on sisendid (Kshana ei modelleeri adaptiivoptika silmust). Arvutused on kontrollitud sõltumatu programmi vastu, mis kontrollib valemite teostust, mitte atmosfääri.

# text
# c1: holdover-test
seg-3324b2e2021e = Holdover-test (<c1/>, { "0.38" })

# text
# c1: docs/TIMING-HIL.md
seg-9177789844f7 = <b>MODELLED</b>, nõuandev. Ütle „mõõdetud maski vastu“, mitte kunagi, et kell või süsteem vastab soovitusele või on selle vastu heaks kiidetud. Kaks aega (GNSS eemaldatud, GNSS taastatud) on <b>operaatori väide</b>: Kshana ei eemaldanud ega taastanud midagi ega saa neid kontrollida, seega tsiteeri neid väidetuna. Mask, mille jaoks kirje on liiga lühike, on <b>INCOMPLETE</b>, mitte kunagi läbimine. Servo logi (linuxptp, chrony) on viga servojuhtimise all, mitte sõltumatu mõõtmine UTC vastu; ütle, millisest kirjest arvud pärinevad. Vt <c1/>.

# text
seg-18d3f2b50d0a = Mis tahes stsenaariumi tulemus

# text
# c1: figure_tiers
# c2: label
seg-aab46d50d125 = <c1/> või <c2/>, mida see väidab, ja päritolurida.

# text
seg-166f773b2804 = Piirid

# text
seg-203a91deb52c = Kasuta sünteetilisi või kasutaja enda andmeid. Ära nimeta väljundites inimesi, laevu ega organisatsioone, mida kasutaja sisendis ei olnud. Kshana on analüüsi- ja väljaõppetööriist, mitte lennu- ega navigatsiooniprodukt.

# text
seg-ec064f62f7dc = <s1>Eelmine</s1>MCP server: isehostitav HTTP-režiim

# text
seg-1f44dbd65ce3 = <s1>Järgmine</s1>Kust on iga võimekus kättesaadav
