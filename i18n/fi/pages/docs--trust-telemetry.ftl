# docs--trust-telemetry: translations (fi)

seg-2247a2344710 = Merkitys

seg-d4e48c972084 = Tunnukset

seg-ca448daf5ec7 = nominal

seg-a129b9e613d0 = Tyyppi

seg-c711c7fecbfc = Yksi luottamustulos kolmessa vientimuodossa, moottorin v{ $version } todellisista ajoista (`kshana trust-telemetry`) aineistolla examples/maritime-trust: Prometheus-tekstiesitys (viimeisin luottamuspistemäärä on { "5.9" } ja epäluotettava kaista on asetettu) sekä viimeiset CEF- ja LEEF-viestit. Komento ei julkaise mitään, ellei sille anneta kohdetta, ei pidä hallussaan tunnistetietoja eikä lähetä radiosignaalia. Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC { "61108" }, IEC { "61162" }): käyttäjä vastaa edelleen aluksen navigoinnista.

seg-15fcf05d16c5 = Lähde: <c1/>

seg-05919ac6cf31 = GNSS-luottamus tietoturvatelemetriana

seg-8978c6508ebd = <c1/> muuttaa epookkikohtaisen GNSS-luottamusvirran (pistemäärä 0-100, luokka, syyt) signaaleiksi, joita operatiivinen tai tietoturvakeskus jo vastaanottaa: Prometheus-mittareiksi, syslog-tapahtumiksi CEF- tai LEEF-muodossa SIEM:lle ja valinnaisesti OpenTelemetryksi. Se lukee virran; se ei koskaan muuta luottamusarviota eikä lähetä mitään muuta kuin telemetriaa.

seg-14ad6b7911d6 = Syöte on live-JSON-rivien skeema v1.1, joka on dokumentoitu tiedostossa <c1/>. Luetaan: <c2/>; <c3/> (<c4/>, luokka); <c5/> (0-100 tai null); <c6/> (epookin aika sellaisena kuin se on ilmoitettu); <c7/> (<c8/>); <c9/> (<c10/>, <c11/>, <c12/> tai null); syyt ovat monitorit kentässä <c13/>, sitten mahdolliset muut kentässä <c14/>; skeemasta { "1.3" } alkaen <c15/> (<c16/>, <c17/>, <c18/>, <c19/>) ja kunkin vähennyksen <c20/>. Muut avaimet jätetään huomiotta, koska skeema kasvaa vain lisättävillä avaimilla. Rivi, jota ei voi jäsentää, lasketaan kohteessa <c21/> ja ohitetaan; arvot alueen 0-100 ulkopuolella hylätään, ei rajata, jotta muodon muutos huomataan. Ainoa koodi, joka tuntee tämän muodon, on <c22/>.

seg-2c94f3717f82 = <c1/> tarjotaan ilman todennusta ja oletuksena osoitteessa <c2/>. Sitominen muualle tulostaa varoituksen; aseta se oman pääsynhallintasi taakse. Päätepiste käsittelee yhtä yhteyttä kerrallaan { "2" } s:n lukurajalla, joten joutilas asiakas voi viivästyttää kaavintaa enintään sen verran; se on tarkoitettu yhdelle kaapijalle, ei avoimeen verkkoon.

seg-7e66e43f15a8 = Home Assistant ja NTP-laitteet (MQTT)

seg-fbe56ff7f1ed = <c1/> tulostaa ja <c2/> julkaisee JSON-tila-asiakirjan ja Home Assistant MQTT -löytöviestit. Löytö (säilytetty, hakemiston <c3/> alla) tekee kolme entiteettiä: luottamuspistemäärä, luottamusluokka (syyt attribuutteina) ja ongelma-anturi <c4/>. Tila-asiakirja menee osoitteeseen <c5/> (oletus <c6/>, säilytetty): <c7/>, <c8/> (null, kun ei ole), <c9/>, <c10/>, <c11/>, <c12/>, <c13/> ja ohjeellinen lausuma; paikkaa ei koskaan sisällytetä. Asetukset: <c14/>, <c15/>, <c16/>.

seg-252025356c0e = Julkaisija puhuu MQTT { "3.1.1" } -protokollaa QoS { "0" } -tasolla ja lukee vain välittäjän CONNACKin. Sillä ei ole tunnistetietoja eikä TLS:ää, joten käytä välittäjää paikallisessa verkossa (tai paikallista releä, joka lisää ne). Toimitus ajetaan omassa säikeessään { "1024" } jonon takana: kuollut välittäjä pudottaa viestejä, jotka lasketaan ja raportoidaan lopussa, eikä se koskaan jumita virtaa. NTP-laite tai mikä tahansa muu kuluttaja, joka haluaa pelkkää JSONia, voi lukea saman tilarivin. Mitään ei kirjoiteta vastaanottimelle tai kellolle. Python, WebAssembly ja MCP ottavat <c1/> ja palauttavat samat rivit <c2/> (mitään ei julkaista siellä).

seg-ed95ebb0ba1b = Pythonista, WebAssemblystä ja MCP:stä

seg-93be007cdfda = Enkooderit ovat saatavilla myös teksti sisään, teksti ulos -kutsuina ilman prosessia, pistoketta tai kelloa: Python <c1/>, WebAssembly-vienti <c2/> ja MCP-työkalu <c3/> (lisäosan komento <c4/>). <c5/> on <c6/>, <c7/>, <c8/> tai <c9/>; <c10/> on <c11/> (virta) tai <c12/> (eräntulos). Ne palauttavat saman tekstin, jonka komentorivi tulostaa (<c13/>, <c14/>), samoilla rajoilla: syslog-rivit eivät sisällä aikaleimaa, <c15/> on enintään { "255" } tulostettavaa ASCII-merkkiä ilman välilyöntejä (muuten evätään, sekä täällä että komentorivillä), ja käyttöpinnan rajaa suurempi vastaus ({ "4" } MiB MCP:ssä) evätään, koska CEF ja LEEF asetuksella <c16/> kirjoittavat yhden tapahtuman epookkia kohti. Mitään ei lähetetä, tarjota tai kirjoiteta; käynnissä olevat viejät pysyvät prosessina komentorivillä.

seg-f8c367611a9e = Toimitus ei koskaan jumita arviointia

seg-3853bb63c7ad = Syslog- ja OpenTelemetry-toimitus ajetaan omissa säikeissään. Syöttösilmukka vain ulottaa niille viestin tai tilannekuvan eikä koskaan odota, joten kuollut, hidas tai lukematon kerääjä ei voi aiheuttaa vastapainetta live-virralle eikä jäädyttää kohdetta <c1/>:

seg-589d02c31dfe = jokaisella yhteydenotolla ja kirjoituksella on { "2" } s:n raja; epäonnistunut yhteys pudotetaan ja avataan uudelleen laiskasti eksponentiaalisella viiveellä { "1" } s:sta enintään { "60" } s:iin;

seg-3c272ded25a3 = viesti, jota ei voi toimittaa (kerääjä alhaalla, kirjoitus aikakatkaistu, { "1024" } jono täynnä), pudotetaan ja lasketaan kohteessa <c1/>; hälytä sen nopeudesta;

seg-4a7cd2065731 = OpenTelemetry-viejälle annetaan kopio rekisteristä, joten verkon I/O:n aikana ei pidetä lukkoa; jos vienti on yhä käynnissä, uusi tilannekuva ohitetaan (seuraava sisältää samat kumulatiiviset summat).

seg-57c3bbe405c8 = Syötteen lopussa lähetyssäikeille annetaan niiden jäljellä olevat aikarajat valmistua.

seg-14c13ed8c509 = Prometheus-mittarit

seg-d060b2163513 = Mittari

seg-45c41bf74eb8 = gauge

seg-e43a6814d13c = vakio { "1" }

seg-3662d2b8a789 = viimeisin pistemäärä 0-100; puuttuu, jos lähde ei anna sitä

seg-1c50874472fc = { "1" } nykyiselle luokalle, { "0" } muille

seg-843ba9d00f65 = <c1/>, <c2/>, <c3/>, <c4/>: { "1" } nykyiselle tilalle, { "0" } muille; puuttuu ilman porttia

seg-3e01cab63c59 = vastaanottimen ilmoittama paikka; <b>vain asetuksella <c1/></b> (päätepiste on todentamaton ja paikka voi tunnistaa sijainnin tai aluksen)

seg-280a5ca2e5d9 = { "1" }, jos läsnä viimeisimmällä epookilla

seg-22ded4fe7f29 = laskuri

seg-800b23c30e2f = vastaanotetut epookit

seg-be11849d8a9b = epookit, joissa syy oli läsnä

seg-0475fe7b26ba = jäsentämättömät syöterivit

seg-65f1db183cbc = syyesiintymät, jotka on laskettu kohteeseen <c1/> (katso alla)

seg-e756633e7d5c = toimittamatta jääneet syslog-tapahtumat

seg-2de3258f83ee = viimeisimmän epookin siirtymä virran alusta

seg-c02fe207663e = seinäkellon vastaanottoaika; hälytä sen iästä

seg-67d5bbbde75a = satelliittigeometria viimeisimmällä epookilla, <c1/>, <c2/>, <c3/>: { "1" } nykyiselle <em>(skeeman { "1.3" } syötteet)</em>

seg-4878afc243e3 = { "1" } degraded, { "0" } good; puuttuu, kun geometria on tuntematon

seg-c21f54522128 = { "1" }, kun näkyvissä olevia satelliitteja ei seurata vaikka niiden geometria on hyvä (signaali katosi, ei taivas; <c1/> näyttää yhä { "1" }), muuten { "0" }; puuttuu, kun geometria on tuntematon tai syöte ei kerro

seg-db29584bb51c = HDOP, PDOP ja käytetyt satelliitit viimeisimmällä epookilla; kukin puuttuu, kun ei ole

seg-c60ca4530e92 = epookit geometrian tilan mukaan

seg-fd6bf7764eca = geometriatunniste viimeisimmällä epookilla, <c1/>, <c2/>, <c3/>, <c4/>: { "1" } nykyiselle; ei koskaan pisteytetä (pistemäärä vähentää vain arvosta <c5/>); syötteistä, jotka kantavat tunnisteen ({ "0.36" })

seg-d6f04ef7adfb = VDOP viimeisimmällä epookilla; puuttuu, kun ei ole

seg-cb8feee01192 = <b>Geometriatunniste on pääotsikko.</b> Piirrä kuvaaja ja hälytä kohteesta <c1/> (OTLP <c2/>, CEF kolmas <c3/>-kenttä, LEEF <c4/>): <c5/> on ainoa tunniste, josta pistemäärä vähentää. Geometrian tila on kuvaileva: <c6/> sisältää informatiivisen tapauksen <c7/>, joka voi tulla hyvän tai kohtalaisen DOP:n kanssa, joten älä hälytä pelkästä kohteesta <c8/>.

seg-70343708da03 = Skeeman { "1.3" } syötteistä <c1/> kantaa myös <c2/>-tunnisteen (<c3/>, <c4/>, <c5/>) jokaisella syyllä, joka tuli sellaisen kanssa: vähennyksen luokka viimeisimmällä epookilla. Geometriasarjat tulevat kaikkien muiden jälkeen ja vasta kun syöteepookki kantaa kohdetta <c6/> (live-skeema { "1.3" }, tulos moottorista { "0.36" } tai uudemmasta), joten { "0.35" }-virta tai -tulos renderöityy tavu tavulta kuten ennen. Tunnisteiden arvot ovat kiinteitä joukkoja (tuntematon tila luetaan <c7/>; tuntematon luokka pudotetaan). Hälytä kohteesta <c8/> pelkän luokan sijaan, jotta huono taivas ei hälytä hyökkäyksenä; luokka <c9/> on lausuma taivaasta, ei havainto siitä, ettei hyökkäystä tapahtunut (katso <c10/>).

seg-3f45b21003d5 = Tunniste <c1/> on osa sarjan identiteettiä: kun syyn luokka muuttuu epookkien välillä (<c2/> luokasta <c3/> luokkaan <c4/>, kun menetetyt satelliitit olivat matalalla, tai <c5/> luokkaan <c6/>, kun ilmoitettu HDOP on ristiriidassa ilmoitetun taivaan kanssa), vanhaa sarjaa ei enää viedä ja uusi alkaa. Kysele kentällä <c7/> ja <c8/>, kun luokalla ei ole väliä, ja odota tällaisen vaihdon näyttävän yhden sarjan päättymiseltä ja toisen alkamiselta. Skeeman { "1.3" } sarjat, tunniste <c9/> ja CEF/LEEF-geometriakentät tarkistetaan moottorin omilla testeillä ja CEF-oraakkeleilla (pycef, Logstash); ulkoisilla Prometheus- ja OTLP-oraakkeleilla ei vielä ole { "1.3" }-virtaa.

seg-17ca55cea260 = Syiden nimet typistetään { "128" } merkkiin, ja enintään { "64" } erillistä syytä saa oman sarjansa; myöhemmät lasketaan kohteessa <c1/> ja kohteessa <c2/>, joten vihamielinen tai viallinen syöte ei voi luoda rajatonta tunnisteiden kardinaliteettia.

seg-35f3faf39d1c = <c1/> on yksi arvoista <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Syiden nimet ovat virran monitorien nimiä (<c7/>, <c8/>, ...; eräntuloksessa <c9/>, <c10/>, <c11/>).

seg-a726fc8d28c2 = Esimerkkikojelauta on tiedostossa <c1/> (tuo se ja valitse Prometheus-tietolähteesi).

seg-208f33eda580 = Syslog: CEF ja LEEF

seg-0d53db66a990 = Tapahtumat lähetetään RFC { "5424" } -kehyksessä (facility local0, sovellus <c1/>, viestin tunniste <c2/>) UDP:n yli (yksi datagrammi kutakin; IPv4 tai IPv6) tai TCP:n yli, oletuksena rivinvaihtoon päättyen tai asetuksella <c3/> kehystettynä <c4/> kuten RFC { "6587" }:ssä. Oletuksena yksi tapahtuma lähetetään luokan muutosta kohti; <c5/> lähettää yhden epookkia kohti. Valmistaja kirjoitetaan <c6/> (ASCII), jotta mikään SIEM ei tulkitse sitä väärin.

seg-9cb6e1b9fec0 = Käsite

seg-9e4ce52ac5d9 = Syslog-vakavuus

seg-084d2e726d3f = CEF-vakavuus

seg-60fa1c602748 = LEEF <c1/>

seg-7948fbcf87cb = calibrating

seg-453691777f9d = { "6" } info

seg-2ac57280bf6a = { "4" } varoitus

seg-f757a767bd4a = untrusted

seg-8e4e2d9142f9 = { "2" } kriittinen

seg-4c5b832482cb = unknown

seg-5e4f3b0222cd = { "5" } huomautus

seg-b07ec4ccabf7 = Kenttien vastaavuus (tapahtuman tunniste on <c1/>):

seg-bfad2619553e = CEF

seg-62108c4b1d75 = LEEF { "2.0" } (erotin <c1/>)

seg-18a4ca402cd9 = luokka

seg-d3bc36a445cb = lähettävä isäntä

seg-521cea5013c8 = band (luottamusluokka)

seg-2b9153eb068d = <c1/> (tunniste <c2/>)

seg-f1be6ef87011 = syyt, pilkuilla erotettuina

seg-e77a9847bc7b = edellinen luokka

seg-87b7f1652b0c = pistemäärä

seg-470a89a86d79 = <c1/> (<c2/>), jätetään pois, jos ei ole

seg-fc2aebb988bf = epookin siirtymä, s

seg-9f9d0d551742 = lokin aikatunniste

seg-57ed10b00272 = portin tila

seg-7159f151c079 = geometrian tila, sitten <c1/> ja epookin vähennysten luokat pilkuilla erotettuina (esimerkiksi <c2/>) <em>({ "1.3" } -syötteet)</em>; syötteistä, jotka kantavat tunnisteen ({ "0.36" }), kolmas kenttä, <c3/> ja tunniste, jolloin luokkakenttä on aina läsnä (esimerkiksi <c4/>, <c5/>)

seg-973339622a60 = <c1/> (vain tila), <c2/> (luokat) ja <c3/> (tunniste)

seg-ae3a1d06bddf = HDOP

seg-c431625778a6 = PDOP

seg-e10eccec5f94 = ({ "0.36" }, tunnisteen kanssa)

seg-e0a712018ced = VDOP <em>({ "0.36" }, tunnisteen kanssa)</em>

seg-42273c09a591 = ei kuljeteta: neljä liukuluku-mukautettua kenttää on otettu

seg-292efe9557d6 = käytetyt satelliitit <em>({ "0.36" }, tunnisteen kanssa)</em>

seg-179b75fd8f06 = <c1/> (<c2/>), kokonaisluku

seg-f69551c20173 = signaalin menetys: näkyvissä olevia satelliitteja ei seurata, vaikka niiden geometria on hyvä

seg-bb927aab7541 = ei kuljeteta kenttänä (mikään CEF-sanakirjan avain ei ole vapaa sille): tila on <c1/> ja geometriavähennyksen luokka <c2/> kentässä <c3/>

seg-6a80d53b2163 = <c1/>, vain kun se pätee

seg-1f099d4ef4b6 = CEF:ssä geometria käyttää vain sanakirjan mukautettuja kenttiä (ei keksittyjä avaimia); tunniste kulkee kentässä <c1/> eikä kentässä <c2/>, koska Logstashin CEF-koodekki ei kartoita kenttiä <c3/>. Geometriatapahtumat { "1.3" }, tunnistetapaukset mukaan lukien, kuuluvat CEF-riviin, jonka taso on VALIDATED: kumpikin oraakkelijäsentäjä lukee ne takaisin sellaisina kuin ne on kirjoitettu (<c4/>, muutokset { "4" } ja { "5" }, kukin rekisteröitynä ennen kuin kumpaakaan jäsentäjää ajettiin sen tapauksilla). Tunniste-, VDOP- ja satelliittimääräkentät liitetään kaikkien aiempien kenttien ja sarjojen jälkeen, ja vain syötteille, jotka kantavat tunnisteen, joten syöte ilman sellaista renderöityy täsmälleen kuten ennen.

seg-b295bf5bac3e = Tyhjät kentät jätetään pois (ei kohdetta <c1/> ilman syitä). Isäntänimi typistetään { "255" } merkkiin. CEF-otsikon arvoissa kenoviivat <c2/> ja <c3/> escapataan; laajennusarvoissa <c4/>, <c5/> ja rivinvaihdot escapataan. LEEF-arvoissa <c6/> ja rivinvaihdot korvataan välilyönneillä.

seg-a3b77e9593eb = OpenTelemetry (oletuksena pois päältä)

seg-396c34d29783 = Rakenna asetuksella <c1/> ja anna <c2/>. Viejä lähettää OTLP/HTTP JSONia (<c3/>, <c4/>, <c5/>, <c6/>, ja skeeman { "1.3" } syötteille <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/> ja syötteistä, jotka kantavat tunnisteen ({ "0.36" }), <c13/> (attribuutti <c14/>) ja <c15/>; kumulatiiviset summat kantavat kohdetta <c16/>) joka <c17/> epookki (oletus { "10" }) ja syötteen lopussa. Se ei lisää riippuvuutta eikä sisällä TLS:ää: lähetä kerääjälle samalla isännällä tai luotetussa segmentissä, joka välittää eteenpäin TLS:n yli. Päätepisteet <c18/> evätään.

seg-c3111d73a8b0 = <s1>Edellinen</s1>Taivaan geometria ja horisonttiprofiilit

seg-4c539b667a05 = <s1>Seuraava</s1>Galileo OSNMA -varmennus
