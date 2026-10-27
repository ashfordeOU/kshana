# docs--test-bench: translations (fi)

seg-245fe1f87b08 = Tiedosto

seg-e305279d5b11 = Sisältö

seg-292871e5747d = Lähde: <c1/>

seg-d18a29239225 = Vastaanottimen ajo viedyllä skenaariolla

seg-aa3498c7cb16 = Vastaanottimen valmistaja, jolla on laboratorion GNSS-simulaattori, voi toistaa Kshana-skenaarion ajoneuvon liikkeen sen kautta, tallentaa testattavan vastaanottimen toiminnan ja pisteyttää tuon lokin komennolla <c1/> ennen ajoa ilmoitettuja tapahtumia vastaan. Kshana toimittaa liikkeen, tapahtuma-ajat ja pisteytyksen. Se kirjoittaa <b>ei signaalia</b>: mikään tässä viety ei synteesioi, mallinna tai lähetä radiotaajuista tai kantataajuista aaltomuotoa, ja viety tapahtuma on nimetty aikaväli, ei resepti häiriön tuottamiseen. Simulaattori ja sen käyttäjä toimittavat signaalit, ja käyttäjä vastaa siitä, että niitä ajetaan vain siellä, missä se on sallittua (johdotettuna tai suojattuna, simulaattorin omien turvaohjeiden mukaisesti).

seg-414c7774d133 = Tämä sivu on menetelmä. Se ei julkaise tuloksia.

seg-a0ad7b35922f = { "1" }. Vienti

seg-798d75d3b65c = Koskee tyyppiä <c1/> (ajoprofiili asenteella; navigointitilan katkot ovat tapahtumat) sekä tyyppejä <c2/> ja <c3/> (paikallaan oleva vastaanotin skenaarion keston ajan; skenaarion <c4/> häirintälähetin on yksi tapahtuma ajon yli). Muut tyypit kertovat, miksi niillä ei ole ajoneuvon lentorataa. <c5/> on liikkeen aikanollan UTC-hetki (oletus 2024-01-01T00:{ "00" }:00Z); skenaarioissa ei ole omaa kalenteripäivää ajoneuvon liikkeelle. Sen on oltava todellinen UTC-hetki, <c6/> (perässä oleva <c7/> hyväksytään), vuosi välillä { "2000" }-{ "2099" } ja jokainen kenttä sallitulla alueella; mikä tahansa muu evätään. Tuloste on tavu tavulta identtinen samalle skenaariolle ja epookille.

seg-c153d8ef8735 = yksi rivi näytettä kohti: <c1/>, Maahan kiinnitetty <c2/>, <c3/>, geodeettinen <c4/>, <c5/>, <c6/>, <c7/>

seg-fa4c8c0d2b72 = tuon CSV:n epookki, koordinaatistot, yksiköt, sarakkeet ja edestakaisen luvun toleranssit

seg-8c74ca211e3a = NMEA { "0183" } -lauseet <c1/> ja <c2/> näytettä kohti, tarkistussummineen

seg-2b0fd541f1dc = rivi <c1/>, sitten rivit <c2/> (kirjoitetaan vain, kun jokainen näyteväli on sama kokonaisluku millisekunteja; jos se jää pois, komento kertoo syyn vakiovirheeseen)

seg-d09d2dab9a17 = samat tapahtumat lohkoina <c1/> skenaariolle <c2/>

seg-866a3c4870af = ajo asiakirjana <a1><c1/></a1> tallenteelle <c2/>: tapahtumat ilmoitettuna totuutena, ja laboratorion täytettäväksi jäävät <c3/>, <c4/>, <c5/>, kunkin tapahtuman <c6/> ja teho

seg-9ea6a94d4586 = Koordinaatistot ja käytännöt

seg-8d3b7d2ef815 = <b>Paikka:</b> WGS { "84" }, Maahan kiinnitetty (ECEF: <c1/> päiväntasaajan kautta nollameridiaanilla, <c2/> navan kautta); <c3/>, <c4/>, <c5/> antavat saman paikan geodeettisesti, <c6/> ellipsoidin yläpuolella.

seg-93a2975d2a19 = <b>Nopeus:</b> Maahan kiinnitetyt akselit, suhteessa Maahan.

seg-be05c2278e98 = <c1/> myötäpäivään tosipohjoisesta välillä [{ "0" }, { "360" }), <c2/> nokka ylös positiivinen, <c3/> oikea siipi alas positiivinen; kääntö-nousu-kierto (3-2-1) paikallisesta pohjois-itä-alas-koordinaatistosta runkoakseleihin x eteen, y oikealle, z alas. Paikallaan oleva lähde kirjoittaa nollia. NMEA ja reittipisteteksti eivät sisällä asennetta.

seg-3c3ad1295628 = <b>Suunta on rungon kääntökulma, ei kulkusuunta.</b> Ajoprofiilissa <c1/> runko kääntyy kanttiaaltona nopeuden seuratessa, joten suunta ja maan suhteen kulkusuunta voivat erota kymmenillä asteilla (jopa noin { "77" } astetta mukana toimitetussa skenaariossa <c2/>). NMEA:n <c3/> kurssi on maan suhteen kulkusuunta, nopeusvektorin suunta, joten simulaattori, joka lukee suunnan liiketiedostosta, ja simulaattori, joka lukee kurssin NMEA-tiedostosta, näkevät eri kulmat. CSV:n maan suhteen kulkusuunta on pohjois-itä-alas-koordinaatistoon käännetyn nopeuden <c4/>.

seg-224b53995157 = <b>Korkeus seuraa skenaariota.</b> Tyypillä <c1/> arvo <c2/> on tyypin oman totuutensa tangenttitasoaskeltamista eikä sitä pidetä vakiona (noin { "7" } m skenaarion <c3/> { "180" } s:n aikana); se on skenaarion liike kirjoitettuna sellaisenaan.

seg-f78a354f96ee = <b>NMEA-paikkamerkit <c1/>.</b> Paikannuksen laatu ({ "1" }), käytetyt satelliitit ({ "12" }) ja HDOP ({ "1.0" }) kirjoitetaan vain, jotta lause on hyvin muodostettu. Ne eivät kerro mitään skenaarion geometriasta tai vastaanottimen tilasta.

seg-f5cd510aac0c = <c1/> epookin jälkeen, UTC, karkaussekunteja ei mallinneta.

seg-d2a2f655760d = <b>NMEA-korkeudet ovat ellipsoidisia.</b> Kentän <c1/> korkeus sisältää ellipsoidisen korkeuden ja geoidierotus kirjoitetaan arvona { "0.0" }. Simulaattori, joka käsittelee korkeutta korkeutena keskimerenpinnasta, sijoittaa ajoneuvon väärin paikallisen geoidin aaltoilun verran.

seg-ee3a9a3ec84d = <b>Edestakaisen luvun toleranssit</b> (testattu lukemalla jokainen tiedosto takaisin): CSV:n paikka { "0.1" } mm, leveys- ja pituusaste { "1e-9" } astetta, nopeus { "0.1" } mm/s, kulmat { "1e-6" } astetta; NMEA:n vaakapaikka { "5" } mm, korkeus { "1" } mm, nopeus { "0.001" } solmua, kurssi { "0.001" } astetta.

seg-a554992d2694 = Tiedostojen lataaminen simulaattoriin

seg-757382614413 = Laboratoriosimulaattorit eroavat toisistaan, eikä tämä repositorio toista minkään simulaattorin käsikirjaa. Tarkista, mitä yllä olevista muodoista omasi lukee, ja sen ilmoitetut vaatimukset:

seg-cc49ceccea20 = Monet liiketuojat odottavat kiinteää päivitystaajuutta, yleisesti { "10" } Hz. Skenaario <c1/> askeltaa { "0.1" } s:n välein; paikallaan olevassa skenaariossa aseta <c2/> simulaattorisi haluamaan taajuuteen.

seg-e98bf4bf6c6e = Jotkin tuojat ohittavat näytteet, jotka osuvat kokonaisten sekuntien väliin, tai jättävät aikasarakkeen huomiotta ja käyttävät rivijärjestystä. Aloita liike kokonaisesta sekunnista ja pidä ruudukko säännöllisenä.

seg-3c470262eb15 = CSV-tuoja, jonka avulla voi yhdistää sarakkeita, voi lukea tiedoston <c1/> suoraan: valitse Maahan kiinnitetyt tai geodeettiset sarakkeet ja aseta niiden yksiköt tiedostosta <c2/>. Desimaalien typistäminen tuottaa väärää kiihtyvyyttä, joten säilytä kirjoitettu tarkkuus.

seg-41a2bfe45b37 = Tiedosto sisältää vain liikkeen. Määritä tähdistö, häiriö ja vastaanottimen etupää simulaattorissa ja ajoita ne tiedoston <c1/> tapahtumiin.

seg-024ab011a2e3 = Kshana ei kirjoita mitään toimittajakohtaista skriptirajapintaa.

seg-6d67d4e2cdf0 = Tarkistettu yhden avoimen lähdekoodin simulaattorin lukijoilla

seg-e4ce0597a644 = Simulaattorin gps-sdr-sim (MIT, commit 28ca29a6) liikelukijoille annettiin kahdeksan mukana toimitetun skenaarion viennit. Jokainen lukija palautti viedyn lentoradan (<c1/>, ennakkorekisteröity tiedostossa <c2/>):

seg-3caed3fc2e47 = gps-sdr-sim-asetus

seg-ad9e78555851 = Anna sille

seg-4f9be75880d3 = Suurin ero CSV:hen

seg-0e86c1df1bc5 = <c1/> (NMEA GGA)

seg-e03dd1d45ced = <c1/> sellaisenaan kuin kirjoitettu

seg-8d28fbcc4c4a = { "1.2" } mm

seg-fd39660fcb73 = <c1/> (aika, leveysaste, pituusaste, korkeus)

seg-c4e171cbf0de = { "0.15" } mm

seg-390b0c0fb695 = <c1/> (aika, x, y, z)

seg-ff26559a85e8 = täsmälleen

seg-f4c13a327904 = Älä anna asetukselle <c1/> koko liike-CSV:tä. Sen lukija mahtuu { "100" } merkkiä riville, ja CSV-rivi on noin { "160" } merkkiä, joten jokainen rivi luetaan kahtena näytteenä. Otsikkorivi luetaan yhtenä lisänäytteenä, jossa ei ole lukuja.

seg-43cc6f9c50b2 = gps-sdr-sim pitää muistissa enintään { "3000" } näytettä, { "300" } s kiinteällä { "10" } Hz:llä, ja jättää aikasarakkeen huomiotta. Viennit <c1/> askeltavat täsmälleen { "0.1" } s:n välein. Pidemmät skenaariot, kuten 20 minuutin <c2/>, luetaan vain ensimmäisten { "300" } s:n osalta.

seg-500243b6e402 = Tämä tarkistaa, että tiedostot luetaan sellaisina kuin ne on kirjoitettu. Se ei tarkista skenaarion fysiikkaa eikä mitään, mitä simulaattori lähettää.

seg-a4c4514276e9 = { "2" }. Ilmoita, mitä pisteytät, ennen ajoa

seg-3a3e2be36c65 = Tapahtumatiedosto antaa skenaarion määrittelemät aikavälit. Kopioi <c1/> skenaarioon <c2/>, lisää mikä tahansa ennuste, jonka haluat tarkistettavan, ja kiinnitä monitorien kynnysarvot ja toleranssit <b>ennen</b> kuin vastaanotin ajaa. Älä säädä niitä lokin näkemisen jälkeen; skenaario, kynnysarvot ja lokin SHA-256 ovat kaikki tuloksen tiivisteessä.

seg-d07b9ad8cfa9 = Viedyt tapahtumat kantavat skenaarion oman tyypin: skenaarion <c1/> häirintälähetin on <c2/>; navigointitilan katko on <c3/>, koska skenaario ilmoittaa, ettei GNSS ollut saatavilla, mutta ei miten. Muuta kenttä <c4/> vastaamaan sitä, mitä määrität simulaattorin tekemään.

seg-faa87b3ba315 = { "3" }. Aja vastaanotin

seg-0a3b63cf5615 = Käynnistä vastaanotin ja sen kirjaaja, käynnistä simulaattorin skenaario liiketiedostolla ja anna ajon kattaa kalibrointijakso, jokainen tapahtuma ja marginaali viimeisen jälkeen. Säilytä vastaanottimen oma loki (UBX, RINEX { "3" } -havainnot, Android-kirjaajan CSV tai NMEA satelliittitilalauseineen). Lokin voi silti pisteyttää vastaanottimen oman paikan perusteella, vaikka siinä ei olisi satelliittikohtaista signaalinvoimakkuutta, mutta kantoaalto-kohinasuhteen monitorit tarvitsevat sen.

seg-fbbc12dfeb3f = { "4" }. Kohdista kellot

seg-5828311af3d4 = <c1/> laskee tapahtuma-ajat vastaanottimen lokin ensimmäisestä epookista; liiketiedosto laskee ensimmäisestä näytteestään. Jos loki alkaa <c2/> sekuntia ennen liikkeen ensimmäistä näytettä, lisää <c3/> jokaiseen arvoon <c4/> ja <c5/>. Kirjaa siirtymä ja se, miten mittasit sen, ja ilmoita se skenaarion kentässä <c6/> tai kommentissa, koska väärä siirtymä siirtää jokaista pistemäärää. Pelkät tapahtuma-ajat eivät kerro siirtymää; käytä simulaattorin skenaarion aloitusmerkkiä tai vastaanottimen omia aikaleimoja.

seg-22f7b68c445b = { "5" }. Pisteytä

seg-e024186a2874 = kirjoittaa <c1/>, <c2/> ja <c3/>. Jokaisesta tapahtumasta tulos antaa väärät hälytykset ennen alkua, ensimmäisen hälytyksen ja sen monitorit, viiveen ja lopputuloksen (<c4/>, <c5/>, <c6/>, <c7/>) sekä ennustetun ja havaitun kantoaalto-kohinasuhteen laskun, kun ennuste on ilmoitettu. Ristiriita raportoidaan, ei koskaan säädetä pois. Katso <a1>RECEIVER-TRUST.md</a1>.

seg-5fa1e4890f91 = Jos haluat nähdä, mille julkisen viitekehyksen riveille istunto tukee todisteita:

seg-abc6aaf44c95 = Katso <a1>compliance/README.md</a1>. Tuo raportti kuvaa antamiesi ajojen todisteita; se ei tee havaintoa vastaanottimesta eikä mistään viitekehyksestä.

seg-69fa39640c2d = { "6" }. Linkitä edestakainen ajo yhteen allekirjoitettuun pakettiin

seg-f24e2dd64c47 = Pisteytyksen jälkeen <c1/> sitoo neljä kirjausta yhteen: viemäsi skenaarion, laboratorion <a1>testiolosuhteet</a1>, vastaanotinlokin ja pisteytyksen. Täytä <c2/> (lokin polku ja SHA-256, testattava vastaanotin, kunkin tapahtuman tyyppi ja ilmoitettu teho), sitten:

seg-78bed55de550 = <c1/> sisältää lohkon <c2/> (<c3/>), jossa on <c4/>, <c5/>, <c6/> ja pisteytys (arvioitavista tapahtumista havaitut, ensimmäinen hälytys), manifestin tiivisteiden ja allekirjoituksen kattamana. Komento kieltäytyy paketista, jonka olosuhteet ja pisteytystapahtumat ovat ristiriidassa tai jonka ilmoitettu lokin tiiviste ei ole lokin tiiviste. Kuten jokainen todistepaketti, se on tekninen kirjaus, ei oikeudellinen lausunto.

seg-5fe6548911da = Työstetty esimerkki: gps-sdr-sim kirjoittaa tiedoston

seg-eeccc823e109 = Tämä esimerkki käyttää avoimen lähdekoodin simulaattoria gps-sdr-sim vain <b>kantataajuustiedoston kirjoittamiseen</b> viedystä liikkeestä. Kshana ei lähetä, eikä mikään tällä sivulla automatisoi tuon tiedoston toistamista radion kautta. Jos laboratoriosi toistaa tällaisen tiedoston vastaanottimeen, se on käyttäjäsi vastuulla, tehdään vain siellä, missä se on sallittua (johdotettuna tai suojattuna, simulaattorin ja radion omien turvaohjeiden mukaisesti), ja Kshana ei dokumentoi eikä kääri sitä.

seg-db81fdadfd19 = Mitä laboratorio sitten tekeekin tiedostolla <c1/>, tapahtuu Kshanan ulkopuolella. Vastaanottimen oma loki, miten se sitten hankitaankin, on se, jonka vaihe { "5" } pisteyttää ja vaihe { "6" } linkittää. Tiedostot ja tarkistukset, joita Kshana tekee omille viennilleen, on testattu vain synteettisellä datalla (<c2/>); mitään laboratorioajoa ei väitetä tässä.

seg-dffcbdb8e6c3 = Mitä tämä menetelmä ei tee

seg-d0b62c238953 = Se ei tuota signaalia, eikä se sano, mitä häiriötä simulaattorin pitäisi tuottaa. Tapahtumat kertovat milloin, eivät mitä.

seg-3aa11bed60c8 = Yksittäinen istunto on yksittäinen datapiste. Tulos kuvaa tuota lokia tuolla kokoonpanolla, eikä kerro mitään muista vastaanottimista, laiteohjelmistoista, antenneista tai todellisesta häiriöstä.

seg-b156403456e4 = Korkeudet, nopeudet ja aikakohdistus on käyttäjän tarkistettava simulaattoria vasten; vienti ilmoittaa omat käytäntönsä ja toleranssinsa eikä muuta.

seg-337ff53bc890 = <s1>Edellinen</s1>kshana-bench

seg-87be81f5e600 = <s1>Seuraava</s1>Compliance-kartoitus
