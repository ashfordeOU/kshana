# docs--interference-map: translations (fi)

seg-6555ff9a6d8e = Tuloste

seg-2247a2344710 = Merkitys

seg-c3c260b7063e = Testit

seg-d4a762001549 = Lisenssi

seg-1aa30db06794 = vähintään { "2" } hyppyä soluun saapuvana: peräkkäisiä ilmoituksia, joiden välimatka on vähintään { "1000" } m ja aikaero enintään { "1" } h ja joiden perusteella nopeus on yli { "70" } kn (laskettu nopeus käyttää ilmoitusten välillä vähintään { "1" } s, joten kaksi ilmoitusta samalla aikaleimalla ja vähintään { "1" } km:n päässä toisistaan olevissa paikoissa lasketaan hypyksi)

seg-7f9b22254009 = vähintään { "3" } ilmoitettua nopeutta yli { "70" } kn solussa

seg-e0d0968e8751 = vähintään { "5" } eri alusta ilmoittaa saman paikan (pyöristettynä { "1e-4" } asteen tarkkuuteen, noin { "11" } m) samassa 10 minuutin ikkunassa

seg-1bf4c460672c = Soluja, joissa on alle { "5" } eri alusta, ei julkaista; jokainen merkittyjen alusten määrä alle { "5" }, nolla mukaan lukien, ilmoitetaan arvona <c1/>.

seg-b2ea2ec6bad1 = <b>Versio { "2" }.</b> Versio { "1" } hyväksyi ilmaisimen jo { "3" } merkitystä aluksesta ja julkaisi luvut { "3" } ja { "4" }. Versio { "2" } nostaa merkittyjen alusten vähimmäismäärän arvoon { "5" }, joka on julkaisun vähimmäismäärä, jotta päätös <c1/> ei koskaan perustu pienempään alusmäärään kuin se, jonka alle lukuja ei julkaista. Tämä tiukentaa menetelmää, eikä versiosta { "1" } julkaistu yhtään tiedostoa.

seg-25593339aeb0 = <b>Tunnetut väärien positiivisten syyt</b>, joita osuussääntö ja kynnysarvot vähentävät mutta eivät poista: joissa, kanavissa ja satamissa olevat alukset karkean rantaviivan lähellä (siksi on olemassa { "2" } km:n sisämaapuskuri); kaksi samaa tunnistetta käyttävää alusta, mikä näyttää hypyiltä; transponderit, joilla on virheellinen paikkaratkaisu, sekä testilaitteet; ja luotsiveneiden ja etsintäalusten kierteleminen, joka voi muistuttaa kehiä. Mittakaavan { "1" }:{ "10" } miljoonaa rantaviivatiedosto on tarkka noin kilometrin tarkkuudella.

seg-ac661440a29a = Hyppy- ja nopeusilmaisimet vertaavat ilmoituksia yhden syötetiedoston sisällä; useaan tiedostoon tai päivään jakautunutta jälkeä ei yhdistetä.

seg-05f789b26904 = <b>Muisti.</b> Syöte luetaan rivi kerrallaan, eikä sitä pidetä kokonaisena muistissa. ADS-B säilyttää vain ilma-aluskohtaiset solukohtaiset laskurit. AIS säilyttää jokaisen hyväksytyn ilmoituksen tiiviissä tietueessa (noin { "40" } tavua), kunnes sen päivä on arvioitu, joten muisti kasvaa syötteen AIS-ilmoitusten määrän mukana; jaa hyvin suuri AIS-syöte päivittäin.

seg-206c78a69ded = Reitin altistuminen

seg-0d8832796ab7 = <c1/> on GeoJSON-LineString (sellaisenaan, Feature-kohteessa tai FeatureCollection-kohteessa) tai CSV-tiedosto, jonka rivit ovat muotoa <c2/>. <c3/> ottaa karttatiedostoja tai niiden hakemistoja, ja sen voi toistaa. Reittipisteet yhdistetään suorilla viivoilla leveys- ja pituusasteessa, joten tihennä pitkät osuudet; osuus kulkee pituusasteessa lyhintä tietä, joten antimeridiaanin ({ "179.5" } E – { "179.5" } W) ylittävä osuus ylittää sen. Reitti jaetaan noin { "250" } m:n paloihin. Jokainen pala mitataan omien kahden päätepisteensä välillä pallolla, jonka säde on { "6371.0088" } km (sama polku, joka ratkaisee, mihin soluun se kuuluu), ja se liitetään soluun, jossa sen keskipiste on.

seg-cc5e2553700b = Päivää ja lähdettä kohden raportti antaa reitin pituuden ja neljä osuutta, joiden summa on { "1" }: <c1/>, <c2/>, <c3/> (solu on olemassa mutta ilman päätöstä) ja <c4/> (solua ei ole kartassa). Lue kaksi viimeistä yhdessä ensimmäisen kanssa: reittiä, jolla on pieni heikentynyt osuus ja suuri havaitsemattomien osuus, ei ole osoitettu vapaaksi. ADS-B- ja AIS-rivit raportoidaan erikseen, eikä niitä koskaan yhdistetä. Jokaisella rivillä on kartan lisenssi ja tekijänmerkintä.

seg-3a087d90e317 = Kirjastofunktiot

seg-67ea1ff00bb8 = Kutsujille, jotka pitävät dataa muistissa (sidokset, MCP-palvelin, selainversio), moduuli <c1/> tarjoaa samat menetelmät niin, että sisään tulee teksti tai tavuja ja ulos JSON, eikä mitään tiedostoa tai verkkoa käytetä:

seg-4dbf41c0ec3b = Funktio

seg-95f87a38a522 = Syöte

seg-0fe8ff25f4a1 = Tuloste

seg-9e99af2c1f84 = ADS-B CSV -teksti

seg-e144f449c5b4 = yksi tavuviipale kutakin readsb-jälkitiedostoa kohden (gzip tai pelkkä)

seg-7effd7110c4c = AIS CSV -teksti, valinnainen maa-alueen GeoJSON-teksti

seg-10c5e0c0a9c8 = reittiteksti, karttojen GeoJSON-tekstit, valinnaiset rajat <c1/>

seg-be00d23d96e9 = <c1/> JSON

seg-20a842d675c2 = Kohteella <c1/> on <c2/> (<c3/>), <c4/> ja <c5/> (v1-asiakirja). <c6/> on <c7/> tai <c8/>; <c9/> on { "0.5" }. Virheet ovat <c10/>. Aineistosäännöt (hyväksytyt esiasetukset, lisenssiteksti vaaditaan, lajin on vastattava) pätevät täsmälleen kuten komentorivillä.

seg-1195686de09b = Ulkoinen validointi

seg-0de37085f544 = <c1/> vertaa Kshanaa riippumattomiin toteutuksiin synteettisillä syötteillä; toleranssit on ennakkorekisteröity tiedostossa <c2/>: NIC- ja NACp-koodien merkitykset pyModeS-dekoodausta vastaan synteettisillä ADS-B-kehyksillä, AIS:n ei-saatavilla-arvot pyais-dekoodausta vastaan synteettisillä AIVDM-lauseilla, ruudukon solujen osoitus shapelya vastaan, reitin pituus solun tilaa kohden shapelya ja GeographicLibia vastaan sekä sisämaan peittäminen shapelya ja pyprojia vastaan. Kiinnitteet tuottaa <c3/>; CI ei tarvitse Pythonia. Tämä validoi sen, miten koodit ja kenttäarvot luetaan, sekä geometrian. Se ei validoi sitä, että merkitty solu on häiriö.

seg-56a3e955cbcc = Kaikki testit käyttävät synteettistä generoitua dataa eivätkä verkkoa: yksikkötestit tiedostossa <c1/> ja <c2/> komentojen päästä päähän -testaukseen, mukaan lukien se, ettei yksikään tunniste päädy tulosteeseen ja että hylkäykset eivät jätä tiedostoja jälkeensä.

seg-212c43d1a41c = <s1>Edellinen</s1>NMEA-harjoitusvirrat

seg-7f13ee5d254e = <s1>Seuraava</s1>Häiriökartta: tietolähteet ja lisenssit

seg-1fc1794d9388 = ADS-B-menetelmä (kshana-interference-map/adsb/v2)

seg-a3a97ab49ed1 = AIS-menetelmä (kshana-interference-map/ais/v2)
