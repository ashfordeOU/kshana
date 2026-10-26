# docs--jammertest: translations (fi)

seg-f8cf777c0caa = Pinnat

seg-45425f378b61 = merkitys

seg-9367b8736d36 = Lähde: <c1/>

seg-c2a40cd73d0e = Jammertest-pisteytys: julkaistu suunnitelma aikataulutettuna totuutena

seg-a560942cbd27 = <c1/> lukee Jammertestin testiluettelon ja lähetyssuunnitelman ja muuttaa yhden testialueen aikavälit vastaanottimen luottamuksen kohteiksi <c2/>. <c3/> ajaa vastaanottimen lokin luottamusmonitorien läpi ja pisteyttää sen tätä aikataulua vastaan testi kerrallaan. Jokainen tulos on <b>MODELLED</b>: aikataulu kertoo, milloin testi oli <em>suunniteltu</em>, ei sitä, milloin lähetin oli päällä.

seg-bc4e7285c38a = Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC { "61108" }, IEC { "61162" }): käyttäjä vastaa edelleen aluksen navigoinnista. Norjan tielaitos (Norwegian Public Roads Administration), Nkom tai tapahtuman järjestäjät eivät hyväksy mitään tässä esitettyä; mitään sopimusta niiden kanssa ei väitetä.

seg-af0edceb1503 = Yhden synteettisen vastaanottimen lokin pisteytys kolmen testin aikataulua vastaan, moottorin v{ $version } todellisesta ajosta (`kshana jammertest score`). Loki on keksitty: { "1800" } s NMEA:a, jossa on { "20" } dB:n C/N0-lasku kahden jakson ajan. Aikataulussa on kolme aikaväliä; keskimmäisellä aikavälillä lokissa ei ole häirintälähetintä. Pisteytys merkitsee havaituiksi { "2" } testiä kaikkiaan { "3" } testistä (mediaaniviive { "0" } s) ja { "1" } jäi havaitsematta, ja väärän hälytyksen ajoja on { "0" } { "0.25" } h:n puhtaan ajan aikana. Mikään tässä ei kerro mitään todellisesta vastaanottimesta. Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC { "61108" }, IEC { "61162" }): käyttäjä vastaa edelleen aluksen navigoinnista.

seg-ceaa46bdcb7e = Suunnitelma ja luettelo

seg-73a5899de383 = Lähde: Norjan tielaitoksen (Norwegian Public Roads Administration) arkisto <c1/> (<a1>https://github.com/NPRA/jammertest-plan</a1>), <b>MIT-lisenssi</b> (tekijänoikeus { "2024" } Norwegian Public Roads Administration; lisenssiteksti tarkistetaan tiedostossa <c2/>). Tiedostot haetaan, ei koskaan sisällytetä mukaan:

seg-2a4967d30c3a = Se lataa luettelot ja { "2025" } suunnitelmatiedostot kiinnitetyllä commitilla <c1/> ja hylkää jokaisen tiedoston, jonka SHA-256 eroaa tiedostosta <c2/>.

seg-7826929c89f6 = Luettelotestillä on pisteillä erotettu tunniste, <c1/> (esimerkiksi <c2/>: tyyppi { "1" } jamming, ryhmä { "2" }, testi { "5" }). Suunnitelma luettelee testialuetta ja aikaväliä kohden, mikä tunniste on aikataulutettu. Tyypit { "1" } (jamming), { "2" } (spoofing) ja { "3" } (meaconing) lähettävät; tyyppi { "0" } (tiedotustilaisuudet, lisäaika, varaukset ja ad hoc -aikavälit) ei lähetä, ja se ohitetaan. Suunnitelman ajat ovat paikallista seinäkelloaikaa; <c3/> (oletus { "2" }, CEST) kertoo, kuinka kaukana ne ovat UTC:stä. Suunnitelmatiedostoissa on testiyhteyshenkilön kenttä, jossa on henkilön nimi: sitä ei koskaan lueta, eikä siitä johdettua kirjoiteta mihinkään.

seg-3eab33a0c38f = Tuonti

seg-91fddde78691 = <c1/> korvaa asetukset <c2/>/<c3/>, kun loki ei ilmoita alkuaan. Tuloste on TOML <c4/>, joka liitetään vastaanottimen luottamuksen skenaarioon; jokainen nimike alkaa <c5/> ja sisältää painosvuoden, luettelotunnisteen ja alueen, ja otsikko tallentaa jokaisen lähdetiedoston SHA-256:n. <c6/> lukee sen sijaan yhden JammerTest { "2024" } -aineiston kansion tapahtumatotuuden (sen <c7/>, aikaleimat siirretty asetuksella <c8/>, oletus -2: niissä lukee <c9/>, mutta ne ovat paikallista aikaa).

seg-6ed6415a6f52 = Pisteytys

seg-1e72a977f7ad = <c1/> on vastaanottimen luottamuksen skenaario (<c2/>, valinnaiset <c3/>, <c4/>). Sen omat <c5/> korvataan tuodulla aikataululla. Aikataulutettua testiä kohden:

seg-99427ab75a03 = kenttä

seg-d2681be37798 = <c1/> (hälytys { "10" } s:n sisällä, oletus <c2/>, suunnitellusta alusta), <c3/> (myöhemmin, aikavälin sisällä), <c4/> (ei yhtään), <c5/>

seg-01a977f18700 = ensimmäinen hälytys miinus suunniteltu alku

seg-b83d1f0a1fb7 = aikavälin lopusta ensimmäisen vähintään <c1/> ({ "10" } s) pituisen hälytyksettömän jakson alkuun ennen seuraavaa testiä

seg-84a34f13e93b = Testi on pisteytettävissä vain, jos se alkaa vähintään <c1/> sen jälkeen, kun loki alkoi; loki, jossa on aikaisempi testi, merkitään <c2/> (lähtötaso on voinut muodostua häiriön aikana). <b>Väärät hälytykset</b> ovat hälyttäviä kalibroinnin jälkeisiä ajanhetkiä kaikkien aikavälien ulkopuolella, kun aikavälejä on laajennettu asetuksella <c3/> ({ "60" } s) ennen ja jälkeen (tai palautumispisteen jälkeen), laskettuna ajanhetkinä ja ajoina, sekä ajoja tunnissa puhdasta aikaa kohden. Kun käytössä ovat <c4/> ja <c5/>, ajo kirjoitetaan allekirjoitettuna todistepakettina (<c6/>): tuloskortti ja tuotu aikataulu ovat tiedoston <c7/> sisällä, siis hajautusketjun ja allekirjoituksen sisällä. Paketti on tekninen tallenne, ei oikeudellinen lausunto.

seg-382613112d5d = Mitä tulos ei kerro

seg-f1cb12a89001 = Suunniteltu aikaväli ei ole lähetystallenne. Lähetin on voinut käynnistyä myöhään, pysähtyä aikaisin tai ei koskaan toimia; ”havaitsematta jäänyt” testi voi olla testi, jota ei lähetetty, ja viive lasketaan suunnitellusta alusta.

seg-32baa4a4b9f0 = ”Puhdas” ajanhetki on ”suunniteltujen aikavälien ulkopuolella”, ei ”todistetusti häiriötön”.

seg-95cc22bbacc5 = Mittausalueen monitorien tekemä havaitseminen ei kerro mitään matalatehoisen koherentin harhauttimen havaitsemisesta.

seg-2e91813cf9d7 = Mikään ulkoinen oraakkeli ei ilmoita todellisia lähetysaikoja, joten mikään tässä ei ole VALIDATED.

seg-cfdf09e38e6e = Vuoden { "2024" } aineistoajo (ennakkorekisteröity)

seg-473ed6ca71e5 = Tiedosto <c1/> kiinnitti populaation, määritelmät ja kynnykset ennen ensimmäistä pisteytettyä ajoa; tiedosto <c2/> tallentaa sen ajon. Tulos: <b>rekisteröity datan vähimmäismääräsääntö ei täyttynyt</b> ({ "4" } pisteytettävää jamming-ikkunaa { "4" } kansiosta, kun kansioita, joissa on <c3/>, oli { "12" }: { "5" } kansiota pudotettiin lähtötasosäännön vuoksi ja { "3" } UBX-lokissa alku ilmoitetaan vain GPS-viikon sekunteina), joten <b>mitään kynnystä ei voida arvioida</b>. Mitään ei löysätty eikä ajettu uudelleen. <b>v2</b> (<c4/>, commitoitu yksinään ennen sen ajoa; vain datan käsittelyä, samat kynnykset ja datan vähimmäismääräsääntö) sijoitti vain GPS-ajan sisältävät lokit kansion päivämäärästä, pisteytti { "12" } vain CSV:tä sisältävää kansiota ja käytti liikkuvan alustan istuntoa liikkuville roverille. Tulos (<c5/>): { "24" } kansiosta säilytettiin { "14" }, mutta vain <c6/> pisteytettävää jamming-ikkunaa, joten datan vähimmäismääräsääntö ei jälleen täyttynyt ja <b>mitään kynnystä ei voida arvioida</b>. V1:n tulos on muuttumaton. Vain kuvailevasti: { "7" } jamming-ikkunasta { "3" } hälytti { "10" } s:n sisällä ja { "4" } myöhemmin, yksikään ei jäänyt havaitsematta; mediaaniviive { "18" } s; puhdas hälytysosuus { "0.089" }. Sitova rajoite on nyt lähtötasosääntö, joka poistaa { "10" } kansiota; uusi rekisteröinti vaatisi eri säännön varhaisille ikkunoille. Aineisto (JammerTest { "2024" }, Zenodo { "15911589" }, GPL-3.0-or-later) haetaan skriptillä <c7/>, eikä sitä koskaan sisällytetä mukaan; testi <c8/> kiinnittää tallennetun ajon, kun <c9/> osoittaa purettuun aineistoon.

seg-cd75b60bd0db = SimulaMetin { "2025" } NMEA-aineisto

seg-87bc2544154b = SimulaMetin Jammertest { "2025" } NMEA-johdettua aineistoa (IEEE DataPort, DOI 10.21227/a7v4-xw11) <b>ei</b> ole sovitettu versiossa { "0.38" }. Sen sivu ei ilmoita lisenssiä ja toteaa ”This dataset requires an IEEE DataPort Subscription to access”: ehdot eivät selvästi salli uudelleenjakelua tai automaattista hakua, joten sovitinta tai hakuskriptiä ei kirjoitettu. Sen käyttö vaatii omistajan päätöksen ja mieluiten tekijöiden kirjallisen suostumuksen.

seg-aa8d3fe2adf3 = CLI, Rust (<c1/>), Python (<c2/>, <c3/>), WebAssembly (samat nimet), samannimiset MCP-työkalut sekä komento <c4/> ja taito <c5/>. Allekirjoitettu paketti on vain komentorivillä (se tarvitsee allekirjoitusavaimen). Katso <c6/>.

seg-82aab597103a = <s1>Edellinen</s1>LunaNet-laajennettu eteenpäin suuntautuva signaali

seg-fb9e48a04566 = <s1>Seuraava</s1>Kone- ja anturisyötteet
