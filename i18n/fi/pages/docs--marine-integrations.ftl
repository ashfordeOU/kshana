# docs--marine-integrations: translations (fi)

seg-2e34ace70d11 = Signal K -lisäosa

seg-0857a94a948e = Rajoitukset

seg-2247a2344710 = Merkitys

seg-c3c260b7063e = Testit

seg-06ff6eed7e99 = OpenCPN

seg-ab1af8b3d968 = katso edellä

seg-7e304f816037 = Lähde: <c1/>

seg-fb2b0841a172 = Merenkulun integraatiot: luottamuspistemäärä sillalla

seg-a88b3968c706 = Kshanan merenkulun luottamuspistemäärä (<a1><c1/></a1>) on käytettävissä ohjelmistoista, joita veneilijät jo ajavat: palvelinliitännäinen ohjelmistolle <b>Signal K</b> sekä <b>OpenCPN</b> gate-tilan NMEA:n kautta TCP:llä. Referenssiversio asentaa sen pienelle tietokoneelle vastaanottimen viereen.

seg-eb8043b9e269 = <b>Ohjeellinen ohjelmisto.</b> Kshana ei ole tyyppihyväksytty navigointilaite (IEC { "61108" }, IEC { "61162" }), eikä sitä ole arvioitu suhteessa mihinkään suorituskykystandardiin. Kaikki tämän sivun sisältö on apuväline navigoijan harkinnalle. Käyttäjä vastaa edelleen aluksen turvallisesta navigoinnista ja kaikista päätöksistä luottaa paikkaratkaisuun tai lopettaa sen luottaminen. Mikään tässä ei lähetä mitään, eikä mikään tässä tee paikkaratkaisusta tarkempaa.

seg-dab66f260e56 = Osa

seg-40fd2019e974 = Tila versiossa { "0.35" }

seg-7bcecf49199c = toimitettu, yksikkötestattu tallennetulla synteettisellä tulosteella; ei julkaistu npm:ään

seg-d5278e683d37 = OpenCPN gate-tilan NMEA:n kautta TCP:llä

seg-a876f5d43e39 = toimitettu ja testattu (kuluttajapuolen toisto); itse OpenCPN:n käyttöliittymää ei aja mikään testi

seg-4a6d2f45b403 = OpenCPN:n natiivi pistemääräpaneelin liitännäinen

seg-b0d4d32612e9 = rakennettu, logiikka yksikkötestattu ja ajettu OpenCPN:n versiossa { "5.8.4" } virtuaalinäytöllä (todisteet hakemistossa <c1/>); ei paketoitu liitännäishallintaan; julkaistaan vasta tarkastuksen jälkeen

seg-2e0058b5e057 = Referenssiversio

seg-959d93e3a56d = osat, käyttöjärjestelmän vaiheet, systemd-yksiköt (kuivaajo tarkistettu), konttivaihtoehto; ei testattu aluksella

seg-8524cb32f0a3 = Kaikki lukee yhtä asiaa: komennon <c1/> tulostetta (JSON-rivit, lause <c2/>, gate). Siirtomuodot on kuvattu tiedostossa <a1><c3/></a1>. Signal K -liitännäinen pitää tietonsa niistä yhdessä tiedostossa <c4/>; muodon muutos on yhden tiedoston muokkaus.

seg-e5b08ab63d78 = Ei npm-riippuvuuksia. Liitännäinen itse toimii Node-versiolla { "18" } tai uudemmalla; nykyiset julkaisut ohjelmasta <c1/> vaativat Node-version { "22" } tai uudemman, joten käytännössä käytetään versiota { "22" }. Kopioi tai linkitä <c2/> palvelimen kansioon <c3/> (esimerkiksi <c4/>), käynnistä palvelin uudelleen ja ota käyttöön <b>Kshana GNSS trust</b> kohdassa Server, Plugin Config.

seg-fd80525d7dd1 = Mistä epookit tulevat (<c1/>)

seg-013478c9a701 = Mitä liitännäinen tekee

seg-abbd00e9cacf = <c1/> (oletus)

seg-8ca5f95ed09d = Ajaa komennon <c1/> ja kirjoittaa sen vakiosyötteeseen jokaisen palvelimen vastaanottaman raa'an lauseen (NMEA { "0183" }; palvelimen tapahtuma <c2/>). Käynnistää sen uudelleen porrastetulla viiveellä, jos se päättyy | <b>Käytä sitä vain palvelimella, jolla on yksi NMEA-lähde</b>: se syöttää jokaisen lauseen jokaiselta toimittajalta lomittain, joten toinen GNSS-vastaanotin tai AIS näyttää yhdeltä vastaanottimelta, jonka sijainti hyppii, ja se voidaan pisteyttää harhautukseksi. Jos lähteitä on useampi, käytetään tilaa <c3/> ja kyseisen vastaanottimen omaa virtaa (<c4/>) tai tilaa <c5/> gatelta.

seg-3b3eadcffb90 = Ajaa komennon <c1/>, esimerkiksi <c2/> tai <c3/>

seg-d69b5ebe1042 = Yhdistää JSON-rivien syötteeseen, jonka <c1/> kirjoittaa (esimerkiksi välittäjältä hakemistossa <c2/>)

seg-cd5a419844cc = Yhdistää NMEA-virtaan (esimerkiksi palvelun tai kontin gate-tuloste referenssiversiossa, portti { "10110" }) ja lukee vain sen lauseet <c1/>

seg-f17c9b7d7abc = Virralla, jota jo harhautetaan, kun monitori ensimmäisen kerran yhdistää, ei ole puhdasta lähtötasoa (ensimmäisiä <c1/> sekuntia ei koskaan pisteytetä). Käynnistä se ennen matkaa.

seg-33fc47100aa6 = Julkaistut polut

seg-f032afe8b331 = Jokainen epookki päivittää (lähde <c1/>):

seg-b809eaf502ad = Polku

seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> tai <c4/>

seg-d4d4d5d5ec1f = { "0" } – { "100" } tai <c1/> kalibroinnin aikana

seg-5280497b5d9f = <c1/>, suurin ensin: mitkä tarkistukset laskivat pistemäärää

seg-6089a3166c91 = monitorit, jotka ovat parhaillaan raja-arvonsa yläpuolella

seg-55280b62eb19 = <c1/>, <c2/> tai <c3/> (kun gate ajetaan muualla; <c4/> kohteesta <c5/> sen puuttuessa)

seg-963da9c0d2a3 = <c1/>: sijainti, jonka testattava vastaanotin ilmoitti kyseisellä epookilla (JSON-skeema { "1.1" } tai uudempi; ei julkaista, kun virrassa ei ole sijaintia, esimerkiksi kohteesta <c2/> tai ohjelman <c3/> vanhemmasta versiosta). <b>Vain luottamuskonteksti</b>: liitännäinen ei koskaan kirjoita polkua <c4/>, joten aluksen oma sijaintipolku säilyy koskemattomana

seg-50599cef740d = annetaan, kun tila muuttuu: <c1/>

seg-ad58b4599f78 = Liitännäinen lähettää myös Signal K -metatiedot näille poluille kerran käynnistyksessä. <c1/> on Kshanan luottamuspistemäärä { "0" } – { "100" }, pistemäärä eikä suhdeluku tai todennäköisyys, joten sillä ei ole SI-yksikköä; sen metatiedot antavat alueen, kuvauksen ja vyöhykkeet, jotka seuraavat alla olevia raja-arvoja. <c2/> ovat pistemääräpisteitä, jotka on vähennetty tästä { "0" } – { "100" } pistemäärästä.

seg-bf0c90f5c02a = Ilmoitus on <c1/>, <c2/>, <c3/> tai <c4/>. Se poistetaan julkaisemalla tila <c5/>, ei <c6/>: kuluttajan, joka pitää vain tilaa <c7/> poistettuna, tulee pitää poistettuna myös tilaa <c8/>. Oletuksena <b>heikentynyt</b> kaista antaa <c9/> ja <b>epäluotettu</b> kaista antaa <c10/>, asetuksella <c11/>. Ilmoitus lasketaan alemmas, kun tila on ollut parempi <c12/> epookin ajan. Jos epookkia ei tule <c13/> sekuntiin, se varoittaa, ettei pistemäärää päivitetä. Kalibrointi ei koskaan nosta ilmoitusta. Lähde <c14/> ei sisällä luetteloa <c15/> (lause sisältää vain kaistan, pistemäärän ja kaksi suurinta syytä).

seg-89cdf02b58e3 = Asetukset (jokainen raja-arvo)

seg-d7bdd78470ec = suoritettava tiedosto (spawn-tilat). <b>Se ajaa mitä tahansa suoritettavaa tiedostoa palvelimen käyttäjänä</b>: vain Signal K -palvelimen ylläpitäjän pitäisi pystyä muuttamaan liitännäisen asetuksia

seg-73091c431bcf = aluksen rajat, raja-arvot ja pistemäärän painot (spawn-tilat)

seg-f5f08c50abc7 = komentoon <c1/> lisättävät argumentit molemmissa spawn-tiloissa: syöte tilalle <c2/>, lisäliput kuten <c3/> (tallennettu loki syötettynä reaaliaikaa nopeammin) tilalle <c4/>. Liitännäinen hylkää liput <c5/>, <c6/>, <c7/> ja <c8/> (se lukee ohjelman <c9/> JSON-tulosteen vakiotulosteesta), ja tilalle <c10/> myös syöteliput (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>)

seg-01caf7ed213f = TCP-tilat (gate palvelee portissa { "10110" }: aseta portti asetukselle <c1/>)

seg-72b911dea6bd = <c1/>: Kshanan ilmoittama kaista, jonka rajat ovat istuntotiedostossa. <c2/>: alla olevat kaksi pistemäärää

seg-76ca56821979 = Tila <c1/>: tämän alapuolella tila on <c2/> (Kshanan oletusraja tilalle nominal)

seg-429d8fc4570f = Tila <c1/>: tämän alapuolella tila on <c2/> (Kshanan oletusraja tilalle degraded)

seg-6d5c9e402211 = heikentyneen kaistan tila: <c1/>, <c2/> tai <c3/>

seg-e88a2979ef07 = peräkkäisiä epookkeja huonommassa tilassa ennen kuin ilmoitus annetaan

seg-0eec67224385 = peräkkäisiä epookkeja paremmassa tilassa ennen kuin se lasketaan alas

seg-76b52e312539 = varoita, jos epookkia ei tule näin pitkään aikaan; <c1/> kytkee sen pois

seg-87d3fcf7fec9 = ilmoitustavat

seg-9a455cf4a2f9 = Liitännäinen ei toimi gatena: se ei koskaan muuta paikkaratkaisua. Paikkaratkaisun merkitseminen virheelliseksi karttajärjestelmälle on gate, jota käsitellään alla.

seg-30f48b177c1c = <c1/>, ei riippuvuuksia, ei verkkoa osoitetta <c2/> pidemmälle. Testit jäsentävät ja toistavat 66 epookin otteen JSON-riveistä ja lauseista <c3/>, jotka komento <c4/> kirjoitti synteettiseen Itämeren demoon (keksittyä dataa, vain tekstiä), ja tarkistavat kahden muodon yhtäpitävyyden, pito- ja tyhjennyskäyttäytymisen, pistemääräkäyttötilan, vanhentumisen ja kolme syöttöpolkua paikallista syötettä ja korvaavaa lapsiprosessia vasten. Nämä testit eivät käynnistä oikeaa Signal K -palvelinta; erillinen skriptattu ajo tekee niin, katso alla.

seg-024928983177 = Ajo oikeassa Signal K -palvelimessa

seg-80b5a217d13c = <c1/> sisältää skriptin, joka lataa liitännäisen kiinnitettyyn pakettiin <c2/> { "2.33.0" } (yksityisessä, vain loopbackia käyttävässä verkkonimiavaruudessa) ja tallentaa, mitä palvelimen omat REST- ja WebSocket-rajapinnat näyttävät. Luottamuspolut ilmestyvät, ilmoitus kulkee tiloissa warn, alarm, normal (pidon jälkeen) ja taas warn, kun data loppuu, ja kun oikea <c3/> sai syötteensä palvelimen omasta NMEA-syötteestä, se julkaisi myös <c4/>, ei koskaan <c5/>. Yksi palvelinversio, yksi ajo, ei oikeaa alusta; rajoitukset ja toisto ovat todisteiden README-tiedostossa.

seg-fea2e7d140c3 = OpenCPN lukee NMEA:ta verkosta, ja <c1/> voi itse palvella gate-käsitellyn virran TCP-portissa.

seg-92981e13bc6f = Suositus: suora yhteys.

seg-e6caa4d53b9a = (<c1/> on vastaanottimen sarjaportti luettuna komennoilla <c2/> ja <c3/>, multiplekseri tai ohjelman <c6/> omat syötteet <c4/>/<c5/>; referenssiversion <c7/> tekee tämän systemd:n alla.) <c8/> sitoutuu loopback-osoitteeseen; mikä tahansa määrä vain lukevia asiakkaita voi yhdistää, ja asiakas, joka ei pysy mukana, pudotetaan muita viivyttämättä.

seg-311e4379acf1 = Vaihtoehto: välittäjä.

seg-11b4c4791f55 = <c1/> on riippuvuudeton Node-jakelija, joka tekee saman ohjelmalle <c2/> ilman asetusta <c3/>, tai palvelee mitä tahansa muuta rivivirtaa (konttivaihtoehto käyttää sitä JSON-epookeille):

seg-93cb82966313 = Se välittää tavut muuttumattomina, vain kokonaisia rivejä, ja pudottaa asiakkaan, joka ei lue. Suosi suoraa yhteyttä: yksi prosessi vähemmän ketjussa.

seg-4226afc6175c = OpenCPN:ssä: Options, Connections, Add Connection, <b>Network</b>, protokolla <b>TCP</b>, osoite <c1/>, portti <c2/>, suunta <b>Input</b>. Kun luottamus ei ole romahtanut, virta on vastaanottimen oma, ja lisäksi yksi lause <c3/> jaksoa kohti. Kun se on romahtanut, välitetyn GGA:n laatu on <c4/>, RMC:n tila <c5/>, ja tilaindikaattorit kertovat, ettei paikkaratkaisua ole, tarkistussummat laskettuna uudelleen: laite näkee vastaanottimen itse julistavan paikkaratkaisun virheelliseksi ja antaa oman hälytyksensä. Lauseet <c6/> näkyvät OpenCPN:n NMEA-debug-ikkunassa (Options, Connections, ”NMEA debug window”). Sijaintikentät jätetään sellaisiksi kuin ne vastaanotettiin.

seg-8549d49f1b2c = Lue ”Gate mode” tiedostosta <a1><c1/></a1> ennen kuin tähän luotetaan: se on valinnainen, lisää viivettä (jaksoa pidetään, kunnes sen epookki on pisteytetty), on ketjun yksittäinen kohta ja voi pidättää hyvän paikkaratkaisun sekä päästää läpi väärennetyn.

seg-533a911141d6 = <c1/> toistaa tallennetun otteen synteettisestä gate-käsitellystä virrasta ({ "186" } lausetta luottamuksen romahtamishetken ympärillä, kirjoittanut <c2/>) välittäjän läpi oikean TCP-pistokkeen yli ja tarkistaa, mitä kuluttaja vastaanottaa: virta tavu tavulta mielivaltaisessa pilkkomisessa; kelvolliset tarkistussummat jokaisessa lauseessa, uudelleenkirjoitetut mukaan lukien; GGA ja RMC yhtäpitävinä, kelvollisia ja sitten virheellisiä ilman välkyntää; yksi lause <c3/> jaksoa kohti, jonka gate-kenttä on <c4/> täsmälleen siellä, missä paikkaratkaisu on virheellinen; kaksi kuluttajaa identtisinä; osittaista riviä ei koskaan välitetä. Tämä tarkistaa OpenCPN:lle annetun virran, ei OpenCPN:n omaa näyttöä.

seg-12fc91a3f69b = Päästä päähän -tarkistus oikealla binäärillä, ei osa oletustestejä (se vaatii rakennetun ohjelman <c1/>):

seg-fea419a50c52 = Molemmat ajavat yhden tunnin synteettisen demon ja tarkistavat, että paikkaratkaisu muuttuu ensin kelvolliseksi ja sitten virheelliseksi ja että jokaiselle epookille on lause <c1/>.

seg-e76c11d8f003 = Natiivi liitännäinen

seg-7a5ac2d2f229 = <c1/> on OpenCPN:n pistemääräpaneeli (pistemäärä, kaista, gate, tärkeimmät syyt, hälytys kun luottamus muuttuu epäluotetuksi), joka lukee lauseet <c2/> OpenCPN:n omasta NMEA-virrasta, joten se ei tarvitse muuta yhteyttä kuin yllä olevan. Se rakennetaan CMakella OpenCPN:n liitännäisrajapinnan otsaketta (mukana toimitettu, lähdekomitteineen) ja wxWidgetsiä vasten; <c3/> ajaa wx-vapaat logiikkatestit ja tarkistaa, että kirjasto vie ne sisääntulokohdat, joita OpenCPN hakee. Se on ajettu OpenCPN:n versiossa { "5.8.4" } virtuaalinäytöllä synteettisellä gate-käsitellyllä virralla (OpenCPN välitti liitännäiselle lauseen <c4/>, paneeli muuttui punaiseksi ja OpenCPN:n oma sijainti jäätyi, kun gate kytkeytyi; kuvakaappaukset, loki ja skripti hakemistossa <c5/>), mutta ei oikealla työpöydällä, muilla versioilla tai alustoilla, eikä sitä ole paketoitu OpenCPN:n liitännäishallintaan. Katso liitännäisen <a1><c6/></a1>. Se on lisensoitu GPL-3.0-or-later, toisin kuin muu repositorio (<a2><c7/></a2>).

seg-a2adfa7ff5fb = Kuvakaappaukset tuolta ajolta hakemistossa <c1/> (yksi ajo, OpenCPN { "5.8.4" } virtuaalinäytöllä, synteettinen data; <a1><c2/></a1> kertoo rajoitukset):

seg-ee5e8bb5a734 = OpenCPN-karttaikkuna, jossa Kshana-pistemääräpaneelin liitännäinen on käynnissä synteettisellä gate-käsitellyllä virralla ennen luottamuksen romahtamista: paneeli ei ole auki (se avautuu itse hälytyksessä), aluksen sijainti tilarivillä on { "54" } { "32.4659" } N { "018" } { "46.1670" } E, nopeus { "16.48" } kn ja kurssi { "088" }, ja paikkaratkaisun ilmaisin oikeassa yläkulmassa näyttää kolme palkkia.

seg-1189d82affbb = Sama OpenCPN-ikkuna romahduksen jälkeen: Kshana-paneeli on auki punaisena, pistemäärä { "47" } ja sana UNTRUSTED, rivit gate: fix marked invalid, cn0-spread -30.0, speed-log -21.0 ja ikä { "2" } s, sekä toteamus, että tämä on ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite, ja että käyttäjä vastaa edelleen. Tilarivi näyttää yhä { "54" } { "32.4672" } N { "018" } { "46.2227" } E, ja paikkaratkaisun ilmaisin on pudonnut kahteen palkkiin.

seg-90c7cdee8892 = OpenCPN, jolle syöte tuli suoraan komennolla kshana receiver-trust live --gate --listen: Kshana-paneeli on auki punaisena, pistemäärä { "44" } ja UNTRUSTED, rivit gate: fix marked invalid, cn0-spread -30.0, speed-log -18.8 ja ikä { "1" } s, sekä ohjeellinen toteamus. Tämä ajo ei tue sijainnin jäätymishavaintoa: OpenCPN oli vielä käsittelemässä alkupurskeen epookkeja.

seg-dce06383cde1 = Nämä näyttävät putkiston ja gate-käsitellyn paikkaratkaisun saapumisen OpenCPN:ään, eivät sitä, että mikään hälytys olisi oikea-aikainen tai oikea todellisella aluksella. Ohjeellinen ohjelmisto, ei tyyppihyväksytty laite.

seg-f9f39d089438 = <a1><c1/></a1>: yleinen osaluettelo, käyttöjärjestelmän asetukset, kaksi systemd-yksikköä (ohjeellinen monitori ja valinnainen gate), konttivaihtoehto ja Signal K -kytkentä. <c2/> ajaa komennon <c3/> yksiköille käynnistämättä mitään.

seg-5e2a2e8af941 = Pistemäärä on vain yhtä hyvä kuin sen takana olevat tarkistukset, jotka katsovat aluksen fysiikkaa ja sen muita antureita; itsensä kanssa yhdenmukainen väärennös, jonka kello täsmää, jää pelkkiin NMEA-tietoihin perustuvilta monitoreilta huomaamatta (<a1><c1/></a1>). Hälytyksen puuttuminen ei ole todiste hyvästä paikkaratkaisusta.

seg-be1ed291f7c3 = Mikään tämän sivun luku ei ole mitattu havaitsemis- tai väärän hälytyksen osuus. Yllä olevat testit tarkistavat putkiston synteettisellä tekstillä; ne eivät kerro mitään siitä, miten mikään monitori pärjää todellisessa häiriössä.

seg-97d775b504c6 = Ei tyyppihyväksytty; käyttäjä vastaa edelleen.

seg-69222f7d5068 = <s1>Edellinen</s1>Häiriökartta: tietolähteet ja lisenssit

seg-8eba9835d7df = <s1>Seuraava</s1>Taivaan geometria ja horisonttiprofiilit

seg-2093a1d8a24e = Mistä epookit tulevat (lähde)
