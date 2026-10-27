# docs--marine-integrations: translations (et)

# text
seg-2e34ace70d11 = Signal K pistikprogramm

# text
seg-0857a94a948e = Piirangud

# text
seg-2247a2344710 = Tähendus

# text
seg-c3c260b7063e = Testid

# text
seg-06ff6eed7e99 = OpenCPN

# text
seg-ab1af8b3d968 = vt ülalpool

# text
seg-c353e7bec219 = Võti

# text
seg-df52127d74b6 = Kus

# text
seg-7670cf4ceda3 = Vaikeväärtus

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-7e304f816037 = Allikas: <c1/>

# text
seg-fb2b0841a172 = Merendusintegratsioonid: usaldusskoor sillal

# text
# c1: MARITIME-TRUST.md
seg-a88b3968c706 = Kshana mereliine usaldusskoor (<a1><c1/></a1>) on kättesaadav tarkvaras, mida paadisõitjad juba kasutavad: <b>Signal K</b> serveri plugin ja <b>OpenCPN</b> värava-režiimis NMEA kaudu TCP-ga. Etalonehitus paneb selle vastuvõtja kõrvale väikesele arvutile.

# text
seg-eb8043b9e269 = <b>Nõuandev tarkvara.</b> Kshana ei ole tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }) ning seda ei ole hinnatud ühegi toimivusstandardi vastu. Kõik sellel lehel on abivahend navigaatori otsustusvõimele. Laeva ohutu navigeerimise eest ning iga otsuse eest lahendile tugineda või sellele enam mitte tugineda vastutab jätkuvalt operaator. Siin ei edastata midagi ja siin ei muuda miski lahendit täpsemaks.

# text
seg-dab66f260e56 = Osa

# text
seg-40fd2019e974 = Seis versioonis { "0.35" }

# text
seg-7bcecf49199c = tarnitud, ühiktestitud salvestatud sünteetilisel väljundil; npm-is avaldamata

# text
seg-d5278e683d37 = OpenCPN värava-režiimis NMEA kaudu TCP-ga

# text
seg-a876f5d43e39 = tarnitud ja testitud (tarbijapoolne kordusesitus); OpenCPN-i kasutajaliidest ennast ei juhi ükski test

# text
seg-4a6d2f45b403 = OpenCPN natiivne skooripaneeli plugin

# text
# c1: integrations/opencpn/evidence/
seg-b0d4d32612e9 = ehitatud, loogika ühiktestitud ja käivitatud OpenCPN-is { "5.8.4" } virtuaalse ekraani all (tõendid kataloogis <c1/>); pakendamata pluginahalduri jaoks; tarnitakse alles pärast ülevaatust

# text
seg-2e0058b5e057 = Etalonehitus

# text
seg-959d93e3a56d = osad, OS-i sammud, systemd üksused (kuivkäivituse kontrollitud), konteineri valik; laeval testimata

# text
# c1: kshana receiver-trust live
# c2: $PKSHT
# c3: MARITIME-TRUST.md
# c4: integrations/signalk/lib/adapter.js
seg-8524cb32f0a3 = Kõik see loeb üht asja: käsu <c1/> väljundit (JSON-read, lause <c2/>, värav). Andmevormingud on failis <a1><c3/></a1>. Signal K plugin hoiab oma teadmisi neist ühes failis, <c4/>; vormingumuudatus on ühe faili muudatus.

# text
# c1: signalk-server
# c2: integrations/signalk/
# c3: node_modules
# c4: ~/.signalk/node_modules/signalk-kshana-trust
seg-e5b08ab63d78 = npm-sõltuvusi ei ole. Plugin ise töötab Node { "18" } või uuemaga; praegused <c1/> väljalasked vajavad Node { "22" } või uuemat, seega praktikas kasutage { "22" }. Kopeerige või linkige <c2/> serveri kataloogi <c3/> (näiteks <c4/>), taaskäivitage server ja lubage <b>Kshana GNSS trust</b> menüüs Server, Plugin Config.

# text
# c1: source
seg-fd80525d7dd1 = Kust epohhid tulevad (<c1/>)

# text
seg-013478c9a701 = Mida plugin teeb

# text
# c1: spawn-signalk-nmea
seg-abbd00e9cacf = <c1/> (vaikimisi)

# text
# c1: kshana receiver-trust live <sessionFile>
# c2: nmea0183
# c3: spawn-args
# c4: --tcp
# c5: tcp-pksht
seg-8ca5f95ed09d = Käivitab <c1/> ja kirjutab iga NMEA { "0183" } lause, mille server saab (serveri <c2/> sündmus), selle standardsisendisse. Taaskäivitab selle tagasilangusega, kui see väljub | <b>Kasutage seda ainult serveris, millel on üks NMEA allikas</b>: see söödab kõik laused igalt pakkujalt läbisegi, nii et teine GNSS-i vastuvõtja või AIS näeb välja nagu üks vastuvõtja, mille asukoht hüppab, ja seda võidakse hinnata spuufimisena. Mitme allika korral kasutage <c3/> selle vastuvõtja enda <c4/> vooga või <c5/> väravast.

# text
# c1: kshana receiver-trust live <sessionFile> <inputArgs...>
# c2: ["--tcp","192.0.2.10:10110"]
# c3: ["--udp","10110"]
seg-3b3eadcffb90 = Käivitab <c1/>, näiteks <c2/> või <c3/>

# text
# c1: kshana
# c2: integrations/opencpn/
seg-d69b5ebe1042 = Ühendub JSON-ridade vooga, mida <c1/> kirjutab (näiteks releest kataloogis <c2/>)

# text
# c1: $PKSHT
seg-cd5a419844cc = Ühendub NMEA vooga (nt teenuse või konteineri värava väljund etalonehituses, port { "10110" }) ja loeb ainult selle <c1/> lauseid

# text
# c1: calibration_s
seg-f17c9b7d7abc = Voog, mida spuufitakse juba siis, kui seire esimest korda ühendub, ei oma puhast lähtetaset (esimesi <c1/> sekundit ei hinnata kunagi). Käivitage see enne reisi.

# text
seg-33fc47100aa6 = Avaldatud teed

# text
# c1: kshana-trust
seg-f032afe8b331 = Iga epohh uuendab (allikas <c1/>):

# text
seg-b809eaf502ad = Tee

# text
# c1: calibrating
# c2: nominal
# c3: degraded
# c4: untrusted
seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> või <c4/>

# text
# c1: null
seg-d4d4d5d5ec1f = { "0" } kuni { "100" } või <c1/> kalibreerimise ajal

# text
# c1: [{monitor, points}]
seg-5280497b5d9f = <c1/>, suurim esimesena: millised kontrollid skoori vähendasid

# text
seg-6089a3166c91 = seirajad, mis on praegu üle oma läve

# text
# c1: off
# c2: passed
# c3: withheld
# c4: null
# c5: $PKSHT
seg-55280b62eb19 = <c1/>, <c2/> või <c3/> (kui värav töötab mujal; <c4/> väärtusest <c5/>, kui seda ei ole)

# text
# c1: {latitude, longitude, altitude}
# c2: $PKSHT
# c3: kshana
# c4: navigation.position
seg-963da9c0d2a3 = <c1/>: asukoht, mida testitav vastuvõtja sellel epohhil teatas (JSON-skeem { "1.1" } või uuem; ei avaldata, kui voog seda ei kanna, näiteks käsust <c2/> või vanemast <c3/>). <b>Ainult usaldusekontekst</b>: plugin ei kirjuta kunagi teed <c4/>, nii et laeva enda asukohatee jääb puutumata

# text
# c1: {state, method, message}
seg-50599cef740d = tõstetakse, kui olek muutub: <c1/>

# text
# c1: score
# c2: reasons[].points
seg-ad58b4599f78 = Plugin saadab nende teede jaoks ka Signal K metaandmed korra käivitumisel. <c1/> on Kshana usaldusskoor vahemikus { "0" } kuni { "100" }, skoor, mitte suhe ega tõenäosus, seega ei kanna see SI ühikut; selle metaandmed annavad vahemiku, kirjelduse ja tsoonid, mis järgivad allpool toodud lävesid. <c2/> on skoorilt maha võetud skoorpunktid sellest { "0" } kuni { "100" } skoorist.

# text
# c1: normal
# c2: alert
# c3: warn
# c4: alarm
# c5: normal
# c6: null
# c7: null
# c8: normal
# c9: warn
# c10: alarm
# c11: method: ["visual","sound"]
# c12: clearAfterEpochs
# c13: staleAfterS
# c14: $PKSHT
# c15: alarms
seg-bf0c90f5c02a = Teavitus on <c1/>, <c2/>, <c3/> või <c4/>. See tühistatakse oleku <c5/> avaldamisega, mitte <c6/>: tarbija, kes käsitab tühistatuna ainult <c7/>, peaks käsitama tühistatuna ka <c8/>. Vaikimisi annab <b>degraded</b> riba <c9/> ja <b>untrusted</b> riba annab <c10/> koos <c11/>. See langetatakse pärast <c12/> epohhi paremas olekus. Kui epohhi ei saabu <c13/> sekundi jooksul, hoiatab see, et skoori ei uuendata. Kalibreerimine ei tekita kunagi teavitust. Allikas <c14/> ei kanna loetelu <c15/> (lause sisaldab ainult riba, skoori ja kahte peamist põhjust).

# text
seg-89cdf02b58e3 = Seadistus (iga lävi)

# text
seg-d7bdd78470ec = käivitatav fail (spawn-režiimid). <b>See käivitab mis tahes käivitatava faili serveri kasutajana</b>: pluginaseadistust peaks saama muuta ainult Signal K serveri administraator

# text
seg-73091c431bcf = laeva piirid, lävendid ja skoori kaalud (spawn-režiimid)

# text
# c1: kshana receiver-trust live <sessionFile>
# c2: spawn-args
# c3: --replay
# c4: spawn-signalk-nmea
# c5: --gate
# c6: --listen
# c7: --json
# c8: --pksht
# c9: kshana
# c10: spawn-signalk-nmea
# c11: --stdin
# c12: --file
# c13: --tcp
# c14: --udp
# c15: --follow
# c16: --from-end
seg-f5f08c50abc7 = argumendid, mis lisatakse käsule <c1/> mõlemas spawn-režiimis: sisend <c2/> jaoks, lisalipud nagu <c3/> (salvestatud logi, mida söödetakse reaalajast kiiremini) režiimile <c4/>. Plugin lükkab tagasi <c5/>, <c6/>, <c7/> ja <c8/> (see loeb käsu <c9/> JSON-i standardväljundist) ning režiimis <c10/> ka sisendlipud (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>)

# text
# c1: tcp-pksht
seg-01caf7ed213f = TCP-režiimid (värav teenindab pordil { "10110" }: seadke port režiimile <c1/>)

# text
# c1: band
# c2: score
seg-72b911dea6bd = <c1/>: riba, mida Kshana teatab, servadega seansifailis. <c2/>: allpool toodud kaks skoori

# text
# c1: score
# c2: degradedState
seg-76ca56821979 = režiim <c1/>: sellest allpool on olek <c2/> (Kshana vaikepiir nominal jaoks)

# text
# c1: score
# c2: alarm
seg-429d8fc4570f = režiim <c1/>: sellest allpool on olek <c2/> (Kshana vaikepiir degraded jaoks)

# text
# c1: normal
# c2: alert
# c3: warn
seg-6d5c9e402211 = degraded riba olek: <c1/>, <c2/> või <c3/>

# text
seg-e88a2979ef07 = järjestikused epohhid halvemas olekus enne teavituse tõstmist

# text
seg-0eec67224385 = järjestikused epohhid paremas olekus enne selle langetamist

# text
# c1: 0
seg-76b52e312539 = hoiata, kui epohhi ei saabu nii kaua; <c1/> lülitab selle välja

# text
seg-87d3fcf7fec9 = teavitusmeetodid

# text
seg-9a455cf4a2f9 = Plugin ei tööta väravana: see ei muuda kunagi lahendit. Lahendi märkimine kehtetuks kaardisüsteemi jaoks on värav, allpool.

# text
# c1: node:test
# c2: 127.0.0.1
# c3: $PKSHT
# c4: kshana receiver-trust live
seg-30f48b177c1c = <c1/>, sõltuvusteta, võrku peale <c2/> ei kasutata. Testid parsivad ja kordavad 66-epohhilist väljavõtet JSON-ridadest ja <c3/> lausetest, mille <c4/> kirjutas sünteetilise Balti demo jaoks (väljamõeldud andmed, ainult tekst), kontrollivad kahe vormingu kokkulangevust, hoidmise ja tühistamise käitumist, skoorirežiimi, aegumist ja kolme sisendteed kohaliku voo ja asenduslapseprotsessi vastu. Need testid ei käivita päris Signal K serverit; seda teeb eraldi skriptitud käivitus, vt allpool.

# text
seg-024928983177 = Käivitamine päris Signal K serveris

# text
# c1: integrations/signalk/evidence/
# c2: signalk-server
# c3: kshana
# c4: reportedPosition
# c5: navigation.position
seg-80b5a217d13c = <c1/> sisaldab skripti, mis laadib plugina fikseeritud paketti <c2/> { "2.33.0" } (privaatses ainult loopback-võrgu nimeruumis) ja salvestab, mida serveri enda REST ja WebSocket API-d näitavad. Usalduse teed ilmuvad, teavitus läheb warn, alarm, normal (pärast hoidmist) ja uuesti warn, kui andmed lakkavad, ning päris <c3/> puhul, mida söödab serveri enda NMEA sisend, avaldas see ka <c4/>, mitte kunagi <c5/>. Üks serveri versioon, üks käivitus, päris laeva ei ole; piirangud ja taasesitus tõendite README-s.

# text
# c1: kshana receiver-trust live --gate
seg-fea2e7d140c3 = OpenCPN loeb NMEA-d võrgust ja <c1/> võib ise väravdatud voogu TCP pordil teenindada.

# text
seg-92981e13bc6f = Soovitatav: otseühendus.

# text
# c1: some-nmea-source
# c2: stty
# c3: cat
# c4: --tcp
# c5: --udp
# c6: kshana
# c7: kshana-gate.service
# c8: --listen tcp:<port>
seg-e6caa4d53b9a = (<c1/> on vastuvõtja jadaport, mida loetakse käskudega <c2/> ja <c3/>, multiplekser või käsu <c6/> enda sisendid <c4/>/<c5/>; etalonehituse <c7/> teeb seda systemd all.) <c8/> seob loopback-aadressi; ühenduda võib suvaline arv ainult lugemiseks mõeldud kliente ning klient, kes sammu ei pea, visatakse välja teisi viivitamata.

# text
seg-311e4379acf1 = Alternatiiv: relee.

# text
# c1: integrations/opencpn/nmea-tcp-relay.mjs
# c2: kshana
# c3: --listen
seg-11b4c4791f55 = <c1/> on sõltuvusteta Node'i hajutaja, mis teeb sama käsu <c2/> jaoks ilma <c3/>, või teenindab mis tahes muud reavoogu (konteineri valik kasutab seda JSON-epohhide jaoks):

# text
seg-93cb82966313 = See edastab baite muutmata, ainult tervete ridadena, ja viskab välja kliendi, kes ei loe. Eelistage otseühendust: üks protsess vähem ahelas.

# text
# c1: 127.0.0.1
# c2: 10110
# c3: $PKSHT
# c4: 0
# c5: V
# c6: $PKSHT
seg-4226afc6175c = OpenCPN-is: Options, Connections, Add Connection, <b>Network</b>, protokoll <b>TCP</b>, aadress <c1/>, port <c2/>, suund <b>Input</b>. Kuni usaldus ei ole kokku kukkunud, on voog vastuvõtja enda pluss üks <c3/> lause tsükli kohta. Kui see on kokku kukkunud, on edastatud GGA kvaliteet <c4/>, RMC olek <c5/> ja režiiminäidikud ütlevad, et lahendit ei ole, kontrollsummad ümber arvutatud: seade näeb, et vastuvõtja ise kuulutab lahendi kehtetuks, ja tõstab oma alarmi. Laused <c6/> on nähtavad OpenCPN-i NMEA silumisaknas (Options, Connections, „NMEA debug window“). Asukohaväljad jäetakse sellisteks, nagu need saadi.

# text
# c1: MARITIME-TRUST.md
seg-8549d49f1b2c = Lugege enne sellele tuginemist jaotist „Gate mode“ failis <a1><c1/></a1>: see on nõusolekupõhine, lisab latentsust (tsüklit hoitakse, kuni selle epohh on hinnatud), on ahelas üksik punkt ning võib hea lahendi kinni hoida, aga võltsitud lahendi läbi lasta.

# text
# c1: test/relay.test.mjs
# c2: kshana receiver-trust live --gate
# c3: $PKSHT
# c4: W
seg-533a911141d6 = <c1/> kordab sünteetilise väravdatud voo salvestatud väljavõtet ({ "186" } lauset usalduse kokkukukkumise hetke ümber, kirjutanud <c2/>) releest päris TCP sokli kaudu ja kontrollib, mida tarbija saab: voog bait-baidilt suvalise tükeldamise korral; kehtivad kontrollsummad igal lausel, ümber kirjutatutel kaasa arvatud; GGA ja RMC kokkulangevus, kehtiv ja seejärel kehtetu ilma väreluseta; üks <c3/> tsükli kohta oma värava väljaga <c4/> täpselt seal, kus lahend on kehtetu; kaks tarbijat identsed; osalist rida ei edastata kunagi. See kontrollib voogu, mis OpenCPN-ile antakse, mitte OpenCPN-i enda ekraani.

# text
# c1: kshana
seg-12fc91a3f69b = Otsast lõpuni kontroll päris binaarfailiga, mis ei kuulu vaiketestide hulka (see vajab ehitatud käsku <c1/>):

# text
# c1: $PKSHT
seg-fea419a50c52 = Mõlemad käivitavad ühetunnise sünteetilise demo ja kontrollivad, et lahend muutub kehtivaks, seejärel kehtetuks, ühe <c1/>-ga epohhi kohta.

# text
seg-e76c11d8f003 = Natiivne plugin

# text
# c1: integrations/opencpn/plugin/
# c2: $PKSHT
# c3: ctest
# c4: $PKSHT
# c5: integrations/opencpn/evidence/
# c6: README.md
# c7: LICENSING.md
seg-7a5ac2d2f229 = <c1/> on OpenCPN-i skooripaneel (skoor, riba, värav, peamised põhjused, hoiatus, kui usaldus muutub untrusted-iks), mis loeb <c2/> OpenCPN-i enda NMEA voost, seega ei vaja see ühtki ühendust peale ülaltoodu. See ehitatakse CMake'iga OpenCPN-i plugina API päisefaili (kaasatud koos oma lähtekoodi commit-iga) ja wxWidgetsi vastu; <c3/> käivitab wx-vabad loogikatestid ja kontrollib, et teek ekspordib sisenemispunktid, mida OpenCPN otsib. Seda on käivitatud OpenCPN-is { "5.8.4" } virtuaalse ekraani all sünteetilisel väravdatud voogul (OpenCPN andis <c4/> pluginale, paneel muutus punaseks ja OpenCPN-i enda asukoht külmus, kui värav rakendus; ekraanipildid, logi ja skript kataloogis <c5/>), aga mitte päris töölaual, teistes versioonides ega platvormidel ning see ei ole pakendatud OpenCPN-i pluginahalduri jaoks. Vt plugina <a1><c6/></a1>. See on litsentseeritud GPL-3.0-or-later alusel, erinevalt ülejäänud hoidlast (<a2><c7/></a2>).

# text
# c1: integrations/opencpn/evidence/
# c2: README.md
seg-a2adfa7ff5fb = Selle käivituse ekraanipildid kataloogis <c1/> (üks käivitus, OpenCPN { "5.8.4" } virtuaalse ekraani all, sünteetilised andmed; <a1><c2/></a1> annab piirangud):

# attr:alt
seg-ee5e8bb5a734 = OpenCPN-i kaardiaken, milles töötab Kshana skooripaneeli plugin sünteetilisel väravdatud voogul, enne usalduse kokkukukkumist: paneel ei ole avatud (see avab ennast alarmi korral), laeva asukoht olekuribal on { "54" } { "32.4659" } N { "018" } { "46.1670" } E kiirusega { "16.48" } kn ja kursiga { "088" }, ning lahendinäidik paremal üleval näitab kolme riba.

# attr:alt
seg-1189d82affbb = Sama OpenCPN-i aken pärast kokkukukkumist: Kshana paneel on avatud punasena skooriga { "47" } ja sõnaga UNTRUSTED, read gate: fix marked invalid, cn0-spread -30.0, speed-log -21.0 ja age { "2" } s ning väide, et see on nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade ja et operaator jääb vastutavaks. Olekuriba näitab endiselt { "54" } { "32.4672" } N { "018" } { "46.2227" } E ja lahendinäidik on langenud kahele ribale.

# attr:alt
seg-90c7cdee8892 = OpenCPN, mida söödab otse kshana receiver-trust live --gate --listen: Kshana paneel on avatud punasena skooriga { "44" } ja UNTRUSTED, read gate: fix marked invalid, cn0-spread -30.0, speed-log -18.8 ja age { "1" } s ning nõuandev väide. See käivitus ei toeta asukoha külmumise vaatlust: OpenCPN töötas veel läbi epohhide algset purset.

# text
seg-dce06383cde1 = Need näitavad torustikku ja väravdatud lahendi jõudmist OpenCPN-i, mitte seda, et ükski alarm oleks õigeaegne või õige päris laeva jaoks. Nõuandev tarkvara, mitte tüübikinnitust omav seade.

# text
# c1: deploy/reference-build/
# c2: deploy/reference-build/check-units.sh
# c3: systemd-analyze verify
seg-f9f39d089438 = <a1><c1/></a1>: üldine osade loetelu, OS-i seadistus, kaks systemd üksust (nõuandev seire ja nõusolekupõhine värav), konteineri valik ja Signal K ühendamine. <c2/> käivitab <c3/> üksustel midagi käivitamata.

# text
# c1: MARITIME-TRUST.md
seg-5e2a2e8af941 = Skoor on nii hea kui selle taga olevad kontrollid, mis vaatavad laeva füüsikat ja selle teisi sensoreid; ise-kooskõlas võltsing sobiva kellaga jääb ainult NMEA-põhistele seirajatele märkamatuks (<a1><c1/></a1>). Alarmi puudumine ei ole tõend hea lahendi kohta.

# text
seg-be1ed291f7c3 = Ükski sellel lehel olev arv ei ole mõõdetud tuvastus- või valehäire määr. Ülaltoodud testid kontrollivad torustikku sünteetilisel tekstil; need ei ütle midagi selle kohta, kuidas ükski seire tegelike häirete korral hakkama saab.

# text
seg-97d775b504c6 = Mitte tüübikinnitust omav; vastutab jätkuvalt operaator.

# text
seg-69222f7d5068 = <s1>Eelmine</s1>Häirekaart: andmeallikad ja litsentsid

# text
seg-8eba9835d7df = <s1>Järgmine</s1>Taevageomeetria ja silmapiirijooned

# text
seg-2093a1d8a24e = Kust epohhid tulevad (source)
