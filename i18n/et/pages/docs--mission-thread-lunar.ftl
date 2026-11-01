# docs--mission-thread-lunar: translations (et)

seg-f942b36a11c4 = GitHubis veel mitte

seg-3b01a756c305 = Mida see arvutab

seg-b478421b21bb = Allikas: <c1/>

seg-dbd59cc01982 = Artemis-klassi missiooniahela Kuu lõik

seg-7b56ed698c30 = Neli stsenaariumi liiki, millest igaüks on ka liidese <c1/> faasiliik (<c2/>): need kannavad navigatsiooni- ja ajastusvea eelarvet läbi lõunapooluse Kuu missiooni, Kuu orbiidil kohtumisest maandumiseni, viibimisest pinnal ja tõusust tagasi orbiidile. <b>Iga siinne arv on MODELLED</b>: nimetatud mudel ILLUSTRATIVE sisenditega, mitte ükski neist ei ole väide ühegi missiooni, süsteemi ega koha kohta. „Artemis-klass“ nimetab missioonikontseptsioonide klassi ja midagi enamat; ühegi agentuuri andmeid, tooteid ega heakskiitu ei kasutata ega väideta ning siin ei ole miski ühegagi neist seotud. Nõuandev tarkvara, mitte kinnitatud navigatsiooniseade. Kshana ei edasta midagi ega juhi riistvara.

seg-5282ad2c498a = Faas ja liik

seg-9b927127e042 = Näidisstsenaarium

seg-40f3e1b2d58b = Tuum

seg-2cfaaa8be402 = suhteline navigatsioon dokkimiseni, { "100" } km ringpolaarorbiit või { "100" } km kuni { "3000" } km elliptiline polaarorbiit

seg-9ee09d63fed3 = maandumishajuvuse eelarve lõunapooluse piirkonna kohas

seg-c4568984e75c = <c1/>, <c2/> (vajab DEM-i, lähtekoodi koopiat)

seg-a098e14e6a63 = positsioneerimise ja ajastuse kättesaadavus koha ja aastaaja kaupa

seg-8278ae655fcc = <c1/>, <c2/> (vajab DEM-i, lähtekoodi koopiat)

seg-249eff5159d0 = tõus kohtumisorbiidile ja orbiidile tagasi kantav kovariatsioon

seg-36184e593ade = Iga tuum on funktsioon argumendist <c1/>; eraldiseisev käivitus koostab vaikesisenemise (Kuu-keskne inertsiaalne kovariatsioon { "100" } m ja { "0.1" } m/s, { "1" } mikrosekundi LTC kell) ja vaikeepohhi 2028-01-01, ning ahela käivitus võtab sisenemise eelmisest faasist. Tugisüsteeme ja ajaskaalasid teisendab ning üleandmise reeglit rakendab ahel, mitte tuum: faasi ümbris teisendab sisenemisoleku ahela teisenduste kaudu süsteemile <c2/> (pinnakaardi puhul süsteemile <c3/>) ja LTC kellale ning teisendusread lisatakse faasi eelarvesse. Tugisüsteem või ajaskaala, mida ahel teisendada ei saa (näiteks ITRF), lükatakse tagasi ahela teatega; otse kutsutud tuum, kellele antakse tugisüsteem, mida see kasutada ei saa, lükkab selle tagasi koos põhjusega. Faas ei lähtesta kunagi kovariatsiooni, ta annab edasi ainult selle, millega ta lõpetab.

seg-59f4a1a2684e = Mida iga faas teeb

seg-e112a34ef118 = Kaks sõidukit, jälitaja ja sihtmärk, lendavad samal orbiidil crate'i Kuu jõumudeli all (gravitatsiooniväli ning Maa ja Päike kolmanda kehana). Partii Gauss-Newtoni hinnang üle kaare taastab mõlemad algolekud järgmisest:

seg-33bb01b1e72a = sõiduki kohta üks absoluutne asukohafiks ILLUSTRATIVE LCNS-klassi releekomplektist (Kuu taha jäävad releesatelliidid jäetakse välja, vaja on nelja), mille valge osa on AFS piloodi (BPSK({ "5" }), { "5.115" } Mchip/s) koodijälgimise tõke nimetatud C/N0 juures korrutatuna DOP-i kofaktoriga;

seg-b061f6742a86 = <b>püsiv</b> signaali ruumis viga igal fiksil: releede vead ei keskmistu tundide pikkuse kaare jooksul ära, seetõttu kantakse seda konstantsete asukohanihetena, millest üks on mõlemale sõidukile ühine (<c1/> dispersioonist, vaikimisi { "0.9" }, ILLUSTRATIVE) ja üks iga sõiduki kohta sõltumatu. Konstantne nihe ei anna keskmistamisest kasu, mis on konservatiivne lugemine;

seg-437ac74b1400 = ristlingi kaugus samast signaalist selle enda C/N0 juures.

seg-3513a55e44e5 = See esitab formaalse ja Monte Carlo suhtelise asukoha- ja kiirusvea sihtmärgi kohalikes telgedes, nende epohhide osa, kus mõlemal sõidukil on fiksid, suhtelise oleku keskmise normaliseeritud hinnangu vea ruudu (NEES) selle oodatud väärtuse { "6" } suhtes, gravitatsioonihälbete eiramisest tuleneva suhtelise triivi, suletud kujuga Hilli (Clohessy-Wiltshire'i) kontrolli ringorbiidi korral, ahela <c1/> suhteliste lõppandurite mudelid (ILLUSTRATIVE parameetrid) kõrvuti ainult signaalidel põhineva näitajaga ning jälitaja 6x6 kovariatsiooni lõpus.

seg-5d3fa3e8486c = <b>Mida tulemus ütleb.</b> Ainult signaalidega fikseerib ristlingi kaugus suhtelise asukoha vaatejoone suunas, kuid suhtelist asukohta sellega risti piiravad sõltumatu signaali ruumis viga ja see, mida dünaamika annab; dokkimiseks on vaja suhtelist andurit ning read <c1/> näitavad, millisel kaugusel ahela iga andurimudel signaalidest paremaks osutub. Tulemus sõltub ka sellest, et tõeolek ja hindaja jagavad jõumudelit; hindaja valik <c2/> näitab hälbete eiramise hinda ja sellise käivituse puhul ei oodata kooskõla.

seg-66c4eb27641b = Faas lendab oma nominaalorbiidil (väljad <c1/>), seega sisenemise asukoha- ja kiirusvektorit ei kasutata, kasutatakse ainult selle kovariatsiooni, tugisüsteemi ja kella; ahela sündmus ütleb seda.

seg-751f29ab7a35 = Iga horisontaaltelje kohta viieoleklik inertsiaalvea mudel (asukoht, kiirus, kiirendusmõõturi nihe, asendi kalle, güroskoobi nihe, mida juhib laskumise erijõud) sisenemiskovariatsioonist ja IMU-st, seejärel järjestikune filter üle lubatud abivahendite:

seg-c2eae4508a2f = <b>AFS-fiks</b>: lameda maski kohal nähtavatelt releesatelliitidelt, ENU DOP-i kofaktor korrutatud kasutaja kauguse veaga. <c1/> kasutab signaali ruumis viga; <c2/> kasutab liigi <c3/> paranduslingi jääki. Täpselt kolme nähtava releega kella abistatakse, mitte ei hinnata, ning fiks kannab siis liiget <c4/>: siin siseneb Kuu aeg fiksi.

seg-39c938fb24e9 = <b>Reljeefipõhine fiks</b>: <c1/> käivitab crate'i TERCOM/SITAN sobitaja oma sünteetilisel reljeefil ja Maa meetriskaalal (asendus, mitte lõunapooluse reljeef); <c2/> võtab koha päris LOLA DEM-i kõrgusakna sobitamise Cramér-Rao tõkke, <c3/>, ja ei väida fiksi seal, kus reljeef piirab ainult ühte suunda (apertuuri probleem).

seg-795ef82edc61 = <b>Kuu aeg</b>: kella viga fiksi hetkel ühendab sisenemiskella, selle kasvu sünkroniseerimisest alates ja liigi <c1/> LTC-TT liikme. Režiimiga <c2/> tiksub sõiduk TT-s ja kogunenud nihe on parandamata kõrvalekalle; režiimiga <c3/> jääb alles ainult avaliku { "56" } kuni { "59" } mikrosekundit päevas riba määramatus üle horisondi. Ajamärgi viga nihutab fiksi mööda trajektoori suuruse <c4/> võrra.

seg-d655c932abbf = Maandumishajuvus on navigatsiooni viga maandumisel pluss sõltumatu juhtimisliige (<c1/>, ILLUSTRATIVE, vaikimisi { "20" } m telje kohta). Tabel <c2/> käivitab abivahendite kõik kombinatsioonid. Ellipsit kalibreeritakse Monte Carlo meetodil (simuleeritud maandumiste osa 3-sigma kontuuri sees võrreldes { "98.9" } %-ga, mille annab 2-D Gaussi jaotus).

seg-82b71e26bc89 = <b>Loe seda ettevaatusega.</b> Vaikehajuvuses domineerib eeldatav juhtimisliige ja igas lõunapooluse kohas on releegeomeetria peaaegu sama, seega kohad erinevad vähe. Kuu aeg loeb ajamärgistamise kaudu vähe ({ "150" } m/s korrutatuna mõne mikrosekundiga on alla millimeetri); see loeb siis, kui geomeetria halveneb kolmele releele.

seg-f5af0aef6649 = Iga koha ja aastaaja (epohh ja sellele järgnev aken) kohta: releepositsioneerimine (neli või enam releed nähtaval maski ja koha reljeefihorisondi kohal, PDOP alla läve, samadest funktsioonidest ja konstellatsioonist nagu <c1/>; ühe koha tulemus võrdub selle näitajaga bitini), kas Maa ja Päike on horisondi kohal (analüütiline Päike, Kuu ja Kuu orientatsioon, libratsioon kaasa arvatud) ning ajastuse kättesaadavus (nähtaval on relee või Maa) koos pikima lõiguga, mil ei ole kumbagi. Releenäitaja aastaajaga selles mudelis ei muutu (Kepleri komplekt, keskmine pöörlemine); Maa ja Päikese näitajad muutuvad. Faas annab kovariatsiooni edasi muutmata kujul ja distsiplineerib kella ajastuse põrandani (ILLUSTRATIVE, { "50" } ns), jättes alles ainult pikima ajastuse lünga, mille ajaks tuleb holdover-it kasutada.

seg-0890ec65a04e = Laskumise viieoleklik mudel kõigil kolmel koha teljel pinnaolekust, AFS-fiks nimetatud intervalliga sama Kuu aja käsitlusega ning orbiidile jõudmisel edasi antud täielik 6x6 asukoha-kiiruse kovariatsioon, mille puhul iga telje asukoha-kiiruse korrelatsioon säilitatakse. Mootori väljalülituse hajuvus nihutab sõiduki asukohta ja seda esitatakse navigatsioonikovariatsiooni kõrval, mitte ei kanta edasi. Vead hoitakse stardikoha telgedes (ilma allavoolu kõveruseta) ja nominaalne väljumisolek on asendus; tulemus on ainult kovariatsioon.

seg-f60b576fabcd = Kuidas dokument faasi kirjeldab

seg-be8e0001ed0c = Ahelas on faasi tabel <c1/> eraldiseisva stsenaariumi enda tabel. Faasi pikkus on ahela <c2/>: mudel, mis nimetab ka oma pikkusevõtme (<c3/>, <c4/>, <c5/>, <c6/>), peab sellega ühtima, vastasel juhul faas lükatakse tagasi, ning mudel, mis jätab võtme välja, võtab ahela oma. Algväärtus (seed) on ahela id-põhine faasi algväärtus, seega annab sama id ja ahela algväärtusega eraldi käivitatud faas samad arvud, mis ahelas. Valesti kirjutatud mudeli võti lükatakse tagasi, mitte ei eirata. Faaside vaheline üleandmine ning selleks vajalikud tugisüsteemide ja ajaskaalade teisendused (Kuu-keskne inertsiaalne ja Kuuga seotud, Maa Kuuks, LTC paarid) kuuluvad ahelale.

seg-52a6e2ec0a99 = Kavandid, sisendid ja lävendid fikseeriti failis <c1/> enne ühtegi käivitust, kuue kuupäevastatud muudatusega, millest igaüks on failis avalikustatud; iga läve otsus, kaasa arvatud möödalaskmised ja hindaja ajalugu, on failis <c2/>.

seg-a1cf56c505d0 = <b>A1</b> (levitaja LRO rekonstrueeritud trajektoori vastu, { "24" } h): MET, suurim 3-D erinevus { "33" } m võrreldes läviga { "500" } m, radiaalne RMS { "2.4" } m võrreldes läviga { "60" } m.

seg-25464238f6bd = <b>A2</b> (sama levitaja CAPSTONE'i peaaegu sirgjoonelise halo-orbiidi vastu ühe 6.5-päevase tiiru jooksul): <b>NOT MET</b>, lõppasukoha erinevus { "136.8" } km võrreldes läviga { "25" } km ja oskulatsioonilise periapsise raadiuse erinevus { "28.4" } km võrreldes läviga { "10" } km. Põhjuseid ei eraldatud (kandidaadid on välja jäetud kiirgussurve ja albeedo, orbiidi tundlikkus algoleku suhtes ning analüütilised Maa ja Päikese read); rida jääb MODELLED.

seg-e1099ad81a5d = Need kaks rida testivad Kuu liikide jagatud levitajat. <b>Need ei testi ühtegi navigatsioonifiltrit, signaali ega eelarvet ning ühelgi muul siinsel asjal ei ole välist sõltumatut etaloni.</b>

seg-9a4b2392aa92 = Kõik muu on MODELLED ning liikide kooskõlakontrollid (eelregistreerimise B1 kuni B8) testivad teostust selle enda nimetatud mudeli, mitte Kuu vastu.

seg-3365490b59b7 = <s1>Eelmine</s1>Missiooniahel: start kuni sisenemine

seg-90932eed0074 = <s1>Järgmine</s1>LEO positsioneerimine, navigatsioon ja aeg
