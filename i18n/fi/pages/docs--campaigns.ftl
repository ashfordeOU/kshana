# docs--campaigns: translations (fi)

seg-f917e7fcac09 = Mikä se on

seg-cae10fb9bff8 = Skenaario

seg-7603033b1c87 = Lähde: <c1/>

seg-699c946d7d09 = Yksittäinen skenaario vastaa yhteen kysymykseen yhdestä tilanteesta. Tehtävä on tilanteiden jono ja suunnittelututkimus niiden perhe. Skenaariolaji <c1/> yhdistää olemassa olevat lajit yhdeksi ajoksi toteuttamatta mitään niistä uudelleen: jokainen jäsen on tavallinen skenaariotaulukko, jolla on oma <c2/>, ja se välitetään funktion <c3/> kautta täsmälleen niin kuin komento <c4/> sen ajaisi, ja kampanja vain lukee lukuja tulosasiakirjoista.

seg-cb4f48673970 = Kampanja on <b>MODELLED</b>. Sen koostamisidentiteetit on testattu (alla), mutta vaiheiden ketjuttaminen on mallinnusvalinta, ja kukin vaihe on vain niin hyvä kuin sen ajanut laji.

seg-80e367fbc391 = Aja sellainen kuten mikä tahansa muu skenaario:

seg-9f9995ebc904 = Kampanjassa voi olla mikä tahansa yhdistelmä neljästä osiosta; kampanja, jossa ei ole yhtään, ajetaan ja sen yhteenveto kertoo, ettei se koostanut mitään.

seg-002ddd72b3a2 = <c1/>: ketjutettu tehtävä yhdellä aikajanalla

seg-e99c4453b79d = Kukin vaihe ajaa yhden tai useamman skenaarion yhteisen tehtävän aikajanan ikkunassa, esimerkiksi holdover-tilassa olevan kellon ja samaan aikaan liukuvan inertianavigointijärjestelmän (INS). Kunkin ajon tulosteet luetaan nimettyihin <b>kanaviin</b>, sijoitetaan vaiheen alkuhetkeen ja otetaan uudelleen yhteiselle ruudukolle (<c1/>) nollannen asteen pidolla: ruudukon aika saa vaiheen ajon viimeisimmän näytteen, joka on sillä tai sitä aiemmin, ja on null, jos mikään kyseisen vaiheen ajo ei tarjoa kanavaa.

seg-842b77a21c5f = Kanava

seg-b2eb598fab2a = Esiasetuksen lähde

seg-f42465f7d066 = ns

seg-fdb4600bf100 = kellon aikavirhe

seg-aef6b877191d = aikavirheen suojaraja

seg-cc989ca58f1d = ajon oma <c1/>

seg-5e9f7cd33017 = näkyvien satelliittien efektiivisen kantoaalto-kohinatiheyssuhteen (C/N0) keskiarvo

seg-af6f07319f2d = <c1/>: kentän <c2/> keskiarvo

seg-f6b4ea158327 = seurannan menetyksen alaraja

seg-126535297c32 = <c1/>: skenaarion <c2/>, kun se sellaisen ilmoittaa

seg-f8f430695a88 = yhä seurattavat satelliitit

seg-3f9a9f33010b = pystysuuntainen suojaustaso

seg-2cfc68fa1c15 = pystysuuntainen hälytysraja

seg-d165177a255c = paikkavirhe

seg-29651ae6be6f = paikkavirheen kynnys

seg-c893c5e3ace5 = { "1" }, kun jokin vaiheen monitori hälyttää

seg-ade1d7072512 = katso alla

seg-e8c7ac7d117f = <c1/> on <c2/>, ellei ajo aseta <c3/>. Mikä tahansa muu suure luetaan eksplisiittisellä merkinnällä <c4/>: aikapolku, jossa yksi <c5/> nimeää rivit (<c6/>), arvopolku, joka jakaa nämä rivit, tai skalaari, joka lähetetään jokaiselle riville (etuliite <c7/> lukee ajon skenaarion sen tuloksen sijaan), valinnainen pelkistys (<c8/>, <c9/>, <c10/>, <c11/>) usealle arvolle yhden rivin alla, skaala ja yksikkö kanavalle, jota kampanja ei tunne.

seg-7d7bc5d19a61 = <b>Hälytykset</b> tulevat kolmesta lähteestä, jotka yhdistetään loogisella OR:lla vaiheen sisällä:

seg-74a10f5283ec = ajosta luetut esiasetetut liput: <c1/> hälyttää, kun alle neljä satelliittia seuraa (sen oma saatavuusmääritelmä); <c2/> hälyttää epookeilla, jotka se merkitsee ei saatavilla oleviksi;

seg-f22be2880015 = vaiheen kanavien esiasetussäännöt, arvioidaan <b>sen jälkeen</b>, kun <c1/> on suoritettu: <c2/> hälyttää, kun absoluuttinen aikavirhe ylittää arvon <c3/>; <c4/> kun paikkavirhe ylittää arvon <c5/>; eksplisiittiset säännöt kirjoitetaan kohtaan <c6/>;

seg-ccd94a7cb652 = hälyttävät tapahtumat: <c1/> tuottaa yhden kellotuetun monitorinsa kohdassa <c2/>; <c3/> tuottaa yhden vaiheen alussa, kun sen yhdistetty päätös hälyttää.

seg-f88b8ad5672f = <b>Tila siirretään</b> vaiheiden välillä kolmella eksplisiittisellä tavalla:

seg-0e3a0ee8e172 = <c1/> lisää kanavan arvon edellisen vaiheen lopussa tämän vaiheen saman kanavan arvoihin. Kellon vaihe, jonka harhauttaja veti pois, on kohta, josta holdover alkaa. Offsetin lisääminen on tarkka kellon vaiheelle, joka integroi taajuutta; paikkavirheelle se olettaa kahden virheen olevan samansuuntaisia, mikä on pessimistinen tapaus.

seg-4db8b11391a5 = <c1/> kirjoittaa edellisen vaiheen luvun (<c2/> kanavan loppuarvolle tai mikä tahansa aiemman ajon tulospolku) tämän vaiheen skenaarion pisteellä erotettuun avaimeen ennen ajoa, valinnaisella skaalalla ja siirtymällä.

seg-fdd5aa8b9627 = <c1/> päättää vaiheen hetkeen, jonka ajo laski, rajattuna arvoon <c2/>. Mukana toimitettu tehtävä päättää harhautusvaiheensa hetkeen <c3/>.

seg-cdd64676f509 = <c1/> pudottaa ajon oman aikajanan ensimmäiset sekunnit (lämmittely) ennen vaiheen nollahetkeä.

seg-d48bcd9890d3 = Mukana toimitettu tehtävä

seg-52fc5abca41f = <c1/> ajaa { "18" } jäsenskenaariota kuudessa vaiheessa { "10" } s ruudukolla:

seg-baea4e05ad26 = Vaihe

seg-9d3ee6a5613e = Ajot

seg-87fbeeb9abb9 = Mitä aikajana näyttää

seg-82bebc2bb038 = nominaali, { "600" } s

seg-cf54dae64cb7 = <c1/>, <c2/> (ei häirintälähdettä), <c3/>

seg-5cb80e4a7d4d = aikavirhe { "0" } ns; C/N0 { "43.0" } dB-Hz, kun alaraja on { "25" } dB-Hz; pystysuuntainen suojaustaso { "9.1" }–{ "21.6" } m, kun hälytysraja on { "50" } m

seg-13c92a72544a = häirintä, { "600" } s

seg-f9c01304734d = sama, häirintälähde tasolla -30 dBW, { "1" } km

seg-27d3b65152b0 = C/N0 laskee arvoon { "27.7" } dB-Hz, kaikki { "8" } satelliittia yhä seurattavina

seg-6a052db03815 = harhautus, päättyi hetkellä { "370" } s säännöllä <c1/>

seg-89856c1f83f8 = <c1/> ({ "0.1" } ns/s aikarampi), <c2/>, <c3/>

seg-cfcdd96b1132 = aikavirhe kasvaa rampilla arvoon { "36" } ns; radiotaajuinen ilmaisin hälyttää vaiheen alussa, kellotuettu monitori hetkellä { "370" } s

seg-92c8a76b84c2 = holdover, { "1800" } s

seg-8a6e0b2898d1 = <c1/> (estetty, mukana { "37.0" } ns), <c2/> (taktinen yksikkö liukumassa), <c3/> tasolla { "10" } dBW

seg-1948491e25ec = jokainen satelliitti menetetty (C/N0 noin -12 dB-Hz); aikavirhe { "36.4" }–{ "62.7" } ns, kun suojaraja on { "50" } ns; paikkavirhe kasvaa arvoon { "24" } km

seg-93e59087dd44 = eheyshälytys, { "600" } s

seg-f28f37baf8fe = <c1/> (mukana { "59.6" } ns), <c2/> ja <c3/> maskilla { "25" } astetta

seg-83d890c819f8 = { "5" } satelliittia seurannassa; suojaustaso { "19" }–{ "135" } m, puuttuu { "18" } ruudukkohetkellä, joita on yhteensä { "60" }; mukana kulkeva aikavirhe, { "52.1" }–{ "61.7" } ns, pysyy suojarajan yläpuolella ({ "50" } ns), joten hälytys on päällä koko vaiheen ajan

seg-1ab40b7893db = palautuminen, { "600" } s

seg-181d2a2f800b = aikavirhe takaisin arvossa { "0" } ns; hälytys hiljaa

seg-26ef3dc422ff = Eheysajot käyttävät esimerkin <c1/> omaa käyttäjäreittiä (pyöreä reitti, korkeus { "0.4" } km), eivät häirintävastaanottimen kiinteää paikkaa, ja maski { "25" } astetta edustaa uudelleen kiinnittyvän vastaanottimen osittaista taivasta. Nämä ovat skenaariovalintoja, jotka on kirjattu tiedostoon.

seg-03ae98f17988 = L-kaistan spektrin ohjaama tehtävä

seg-5daf8c8fdd83 = <c1/> ajaa { "8" } jäsenskenaariota kolmessa vaiheessa { "1" } s ruudukolla, ja GPS L1 C/A:n ja Galileo E1:n C/N0 luetaan lajista <c2/> (ks. <a1>SPECTRUM.md</a1>) eikä lajin <c3/> satelliittikohtaisesta taulukosta. Häirintälähteet ovat ne, jotka ovat tiedostossa <c4/>.

seg-7f34a00af961 = alku, päättyi hetkellä { "10" } s säännöllä <c1/>

seg-471ec0d86f76 = <c1/>, <c2/> (chirp hetkestä { "10" } s), <c3/>

seg-00b032242ebc = L1 C/A { "43.48" } ja E1 { "44.73" } dB-Hz; vaihe päättyy spektriajon omaan L1 C/A:n ensimmäiseen menetykseen (<c1/>); suojaustaso { "21.6" } m, kun raja on { "50" } m

seg-50220d719d5d = holdover, { "600" } s

seg-50de7cd69ac0 = <c1/> (estetty, mukana alkuvirhe, tässä { "0" } ns), <c2/> (chirp päällä)

seg-1d59e94d94e5 = L1 C/A { "3.38" } ja E1 { "4.44" } dB-Hz, molemmat alle rajan { "25" } dB-Hz; aikavirhe välillä -0.07 ja { "5.06" } ns, kun suojaraja on { "50" } ns; hälytys päällä

seg-6c56497d74fb = Galileo-varavaihtoehto, { "300" } s

seg-62bcfd3e8732 = <c1/> (synkronoitu uudelleen), <c2/> (CW-sävel L1-kantoaallolla), <c3/> Galileo-tyyppisellä Walker-tähdistöllä 24/3/1

seg-d455f0c06ee6 = L1 C/A pysyy arvossa { "17.98" } dB-Hz, E1 takaisin arvoon { "44.73" } dB-Hz; suojaustaso { "6.1" }–{ "17.7" } m; hälytys hiljaa

seg-2db37e292efe = E1:n palautuminen CW-sävyn alla perustuu spektrilajin jatkuvan spektrin käsittelyyn: sävel osuu MBOC-spektrin nollakohtaan eikä kytkeydy mihinkään. Todellinen sävel kytkeytyisi koodin spektriviivojen kautta; tämä on kirjattu tiedostoon ja asiakirjaan SPECTRUM.md.

seg-fb8d8636c554 = <c1/>: parametriruudukko mille tahansa lajille

seg-b14a11d60e9f = Yhdestä kolmeen pisteellä erotettua skenaarioavainta, kukin lineaarisella tai logaritmisella alueella, samoilla akseliarvoilla, joita laji <c1/> käyttää. Jokaisella akselilla on nimi ja yksikkö; jokaisella mittarilla on nimi ja tulospolku, ja sen yksikkö luetaan pyyhkäistyn lajin omasta yksikkölohkosta, ellei kampanja ilmoita omaa. Kun <c2/>, jokainen solmu on siemenillä alustettu Monte Carlo -joukko (toteuma <c3/> solmun siemenluvulla plus <c4/>), raportoituna alla olevilla tilastoilla. <c5/> pyyhkäisee häirintälähdettä, joka on { "1" } km päässä vastaanottimesta, tasolta -50 tasolle +{ "10" } dBW: keskimääräinen häirintä-signaalisuhde liikkuu täsmälleen { "1" } dB per dB ({ "12.2" }–{ "72.2" } dB), ja saatavuus putoaa arvosta { "1" } arvoon { "0" } välillä -30 ja -25 dBW.

seg-c1931e311cca = Pisteellä erotettu avain voi indeksoida taulukkotaulukkoa sijainnin mukaan: <c1/> on kolmannen taulukon <c3/> kenttä <c2/>, ja <c4/> yltää kolme tasoa alas.

seg-e774c578906d = <c1/>: siemenillä alustettu joukko

seg-bbacb9c66f92 = Toteuma <c1/> ajaa skenaarion siten, että sen siemenavaimeksi asetetaan <c2/>, kuten kelloensemble jo tekee, joten joukko toistuu täsmälleen. Kukin mittari raportoi keskiarvon, populaation keskihajonnan, lähimmän sijan 5., 50. ja 95. persentiilin, kiinteällä siemenluvulla lasketun persentiili-bootstrap-luottamusvälin (taso { "95" }%) keskiarvolle ({ "2000" } uudelleenotosta) ja oletuksena jokaisen näytteen siemenjärjestyksessä. Tulospolut voivat indeksoida taulukoita: <c3/> on viimeinen näyte.

seg-ed182d15151d = <c1/>: useita skenaarioita yhteisillä ehdoilla

seg-26fab14de534 = Nimetyt jaetut arvot (luku tai lukujen taulukko yksikköineen) kirjoitetaan jokaiseen jäseneen niihin avaimiin, joihin se ne sitoo, joten jäsenet eivät voi olla eri mieltä yhteisestä ehdosta. Jokainen jäsen ajetaan, ja jokaiselle mittarille yhdistetty yhteenveto antaa pienimmän, suurimman ja keskimääräisen arvon jäsenten yli ja nimeää parhaan ja huonoimman. <c1/> sijoittaa yhden häirintälähteen ({ "8" } dBW) Suomenlahdella olevan aluksen (noin { "30" } km päässä) ja Helsingin rannikkotiellä ajavan auton (noin { "50" } km päässä) väliin: alus menettää jokaisen satelliitin (keskimääräinen häirintä-signaalisuhde { "39.0" } dB), kun taas auto pitää vähintään neljä ({ "34.6" } dB).

seg-c888630c92d7 = <c1/>: yhden mittarin paras arvo

seg-b54f0deedd0f = Yhdestä kolmeen pisteellä erotettua skenaarioavainta, kukin rajattuna välille <c1/> asteikolla <c2/> tai <c3/>, haetaan yhden mittarin parasta arvoa varten (<c4/>, <c5/> tai <c6/>, joka minimoi etäisyyden arvosta <c7/>).

seg-b57ec5e5168a = Menetelmiä on kaksi:

seg-8fba07ce0cde = <c1/> ajaa jokaisen solmun ruudukossa, jossa on <c2/> askelta avainta kohden, pyyhkäisyn akseliarvoilla.

seg-844a7c1e3578 = <c1/> (oletus) ajaa deterministisen Nelder–Mead-simpleksin koordinaateissa, jotka on normalisoitu välille [{ "0" }, { "1" }] avainta kohden. Koepisteet projisoidaan laatikkoon. Osio ottaa parametrit <c2/>, alkuaskeleen <c3/> sekä pysäytystoleranssit <c4/> ja <c5/>.

seg-2b1159b467f8 = Ajo, jonka mittari puuttuu tai ei ole äärellinen, saa huonoimman pistemäärän ja säilyy jäljessä. Kun <c1/>, mittari on keskiarvo samoista siemenluvuista jokaisella arvioinnilla. Tulos antaa <c2/>, <c3/>, <c4/>, <c5/>, <c6/> sekä jokaisen arvioinnin kohdassa <c7/>.

seg-778a40736e7b = <c1/> hakee etäisyyden ja datanopeuden linkkimarginaalille, jonka arvo on { "3" } dB. Optimi on paikallinen laatikon ja aloituspisteen suhteen. Se on MODELLED, ei koskaan globaali väite.

seg-b94ab5e6dad4 = Protokolla ja sen ennakkorekisteröidyt kynnykset ovat kohdassa <c1/>. Testi on <c2/>. Tulokset:

seg-232c68472fa4 = 1-D-tavoiteratkaisu yhtyy suljettuun muotoon { "6e-15" } tarkkuudella;

seg-22f7abf70fc4 = ruudukkomenetelmä on bitti bitiltä sama kuin riippumaton raakavoimasilmukka;

seg-faea43f01e37 = simpleksi toimii vähintään yhtä hyvin kuin ruudukko { "41" } × { "41" }, noin kymmenesosalla sen ajoista.

seg-df1533fe6b95 = Kierroksen { "1" } 1-D-kynnys kirjattiin NOT MET: ennakkorekisteröity laatikko sulki ratkaisun pois.

seg-0862a4e9aa61 = Jokainen kampanjatulos sisältää kentän <c1/>, kampanja-asiakirjan kanonisen JavaScript Object Notation (JSON) -muodon SHA-256-tiivisteen (Secure Hash Algorithm { "2" }, 256-bittinen tiiviste), jota avainjärjestys ja muotoilu eivät muuta, sekä lohkon <c2/>, jossa on jäsenajojen määrä ja <c3/>, SHA-256 kaikkien jäsentulosten tiivisteiden yli lähetysjärjestyksessä. Kaksi samalla tiivisteellä varustettua ajoa tuotti tavu tavulta identtiset jäsentulokset. Jokainen vaiheajo kirjaa myös lajinsa, oman tiivisteensä <c4/>, jos lajilla on sellainen, ja tulosasiakirjansa SHA-256-tiivisteen. Jokaisella asiakirjan luvulla on yksikkömerkintä.

seg-2eeddb87e889 = Ydin on sekventiaalinen eikä lue tiedostoja, joten kampanja ajetaan muuttumattomana WebAssembly-rakennuksessa. Kampanjat eivät saa sisältää kampanjoita.

seg-f9b8b78dd64a = Viennit

seg-c4443bf160f7 = <c1/> kampanjassa kirjoittaa jokaisen geometrian sisältävän jäsenskenaarion omaksi tiedostojoukokseen, jäsenen nimike lisättynä ennen muotopäätettä: jokainen vaiheajo (<c2/> tai <c3/>, kun vaiheessa on useita ajoja), pyyhkäisyn perusskenaario (<c4/>), Monte Carlo -skenaario (<c5/>) ja jokainen koostettu jäsen (oma nimikkeensä, siihen sidotut jaetut arvot kirjoitettuina). Aiempaa vastaava jäsen kirjoitetaan kerran; siirrot sekä ajonaikaisesti sovelletut pyyhkäisy- tai siemenarvot eivät ole viedyissä skenaarioissa.

seg-0ba270495309 = Muoto, jota mikään jäsenistä ei voi kuvata, hylätään sen syyn kera. Skenaariokohtainen taulukko on asiakirjassa <a1>INTEROP.md</a1>.

seg-c20904c9d3b5 = LEO-PNT-kampanjat

seg-a598e2c06f51 = Viisitoista mukana toimitettua kampanjaa jäsentää matalan Maan kiertoradan (LEO) paikannus-, navigointi- ja ajanmääritys (PNT) -kysymyksiä; <a1>LEO-PNT.md</a1> kuvaa, mitä kukin näyttää. Mitä kukin ajaa, komentorivin yhteenvedon mukaan:

seg-f65b1f2b4182 = Tila

seg-e7d7defa7e71 = Kysymys

seg-08ab59acfe62 = koostaminen, { "4" } jäsentä

seg-a21e4db0fda9 = navigointiviestin palveludata suhteessa kehyksen pituuteen

seg-6c29f4690d2c = pyyhkäisy: <c1/>, { "7" } solmua

seg-97fba77aa2ec = yhdistetty MEO- ja LEO-paikannus suhteessa LEO-signaalin avaruusosuuden etäisyysvirheeseen (SISRE)

seg-7b9fbe34d38c = koostaminen, { "2" } jäsentä

seg-28352bd0c9e3 = sisätilojen LEO-PNT kaistan ja rakennusluokan mukaan

seg-a447c56022ec = pyyhkäisy: <c1/>, { "9" } solmua

seg-5b3cbfced221 = esineiden internetin (IoT) energia paikannusta kohden suhteessa LEO UHF -lähetystehoon

seg-3ebd95e5933a = pyyhkäisy: <c1/>, { "9" } solmua

seg-cfbac004ff64 = ei-maanpäällisen verkon (NTN) paikannus suhteessa viitesignaalin kaistanleveyteen

seg-07e8765975d1 = pyyhkäisy: <c1/>, { "3" } solmua

seg-db872d35033e = tarkan pistepaikannuksen (PPP) konvergenssi suhteessa 192 satelliitin LEO-kerroksen korkeuteen

seg-a4ec677dc4e6 = ketju, { "3" } vaihetta, kesto { "2100" } s

seg-2d91ecf8455d = Maailmanlaajuinen satelliittinavigointijärjestelmä (GNSS) häirittynä, LEO-kerros kantaa käyttäjää, eheys säilyy

seg-c44991a2a24e = pyyhkäisy: <c1/>, { "13" } solmua

seg-4b6e292d88f5 = LEO-kaistamonipuolisuus L-kaistan laajakaistaista tukahduttavaa häirintälähdettä vastaan

seg-30d86b528bee = harhautusmonitorit neljää harhauttajaa vastaan

seg-1690baf3a1b8 = ketju, { "1" } vaihe, kesto { "86 400" } s

seg-4d5b507c04de = 5G-tukiaseman ajoitus: holdover ja LEO-aika

seg-d32a80c40470 = ketju, { "3" } vaihetta, kesto { "1440" } s

seg-c38f9d3bd54e = konttien seuranta LEO UHF:llä: energia paikannusta kohden matkan varrella

seg-9bf38e403696 = ketju, { "2" } vaihetta, kesto { "1500" } s

seg-dea7117552f4 = autonominen ajoneuvo kaupunkikanjonissa LEO-kerroksen kanssa

seg-dbbd9ffcbfb4 = ketju, { "2" } vaihetta, kesto { "1800" } s

seg-37c0c3570023 = sama kaupunkikanjoni tasaisena { "35" } asteen katkaisukulmana ja taivaanrajana <c1/>

seg-ccaa34122145 = ketju, { "2" } vaihetta, kesto { "87 000" } s

seg-d16d8b2e9089 = kriittisen infrastruktuurin ajoitus: holdover LEO-ajalla

seg-4ee0b3036f4a = ketju, { "3" } vaihetta, kesto { "10 800" } s

seg-157c5bec7f5f = napa-alueiden ja arktisten alueiden käyttäjät polaarisella LEO-kerroksella

seg-64404160d0e7 = ketju, { "3" } vaihetta, kesto { "2520" } s

seg-a35e1603ba32 = rautatie- ja merenkulun käyttäjät LEO-kerroksella

seg-3d819fa3fd1c = MEO tarkoittaa keskikorkeaa Maan kiertorataa, UHF ultrakorkeaa taajuutta ja 5G mobiiliverkkojen viidettä sukupolvea.

seg-490920844143 = Mitä tarkistetaan

seg-483b1d4efb20 = <c1/> lukitsee koostamisidentiteetit:

seg-881d97a3fa2b = <b>Yhden vaiheen kampanja toistaa erillisen ajon bitti bitiltä.</b> Lajeille <c1/>, <c2/> ja <c3/> jäsenen tulosasiakirja on tavu tavulta identtinen funktion <c4/> tuloksen kanssa skenaariotiedostolla, sen tiiviste on se, jonka kampanja raportoi, ja kun ruudukko on ajon oma askel, jokainen kohdistettu arvo on yhtä suuri kuin erillisen sarjan arvo (häirinnän C/N0 on yhtä suuri kuin erillisestä asiakirjasta riippumattomasti laskettu keskiarvo).

seg-1a9e1ed5b18c = <b>Yhden solmun pyyhkäisy ja yhden jäsenen koostaminen</b> lukevat täsmälleen erillisen ajon luvun.

seg-883bb72e1239 = <b>Kiinteällä siemenluvulla ajettu joukko on tavu tavulta vakaa</b>, ja toteuma <c1/> on täsmälleen erillinen ajo arvolla <c2/>; kampanjan tiiviste ei välitä avainjärjestyksestä.

seg-170bc86059fa = Analyyttinen tapaus.

seg-0fd27291d6f4 = <c1/> ajaa { "200" } siemenlukua sirumittakaavaisesta atomikellosta, jossa on vain valkoista taajuuskohinaa (q_wf = { "9e-20" } s^2/s, Microchip SA.45s sigma_y({ "1" } s) = { "3e-10" }), synkronoituna kohtaan { "590" } s ja liukuen kohtaan { "3600" } s. Lopullinen aikavirhe on gaussinen, keskiarvo { "0" } ja keskihajonta sqrt(q_wf * { "3010" } s) = { "16.459" } ns (vaiheen satunnaiskävely valkoisen taajuuskohinan alla, National Institute of Standards and Technology (NIST) Technical Note { "1337" }). Raportoitu väli, [-2.52, { "1.59" }] ns, sisältää todellisen keskiarvon { "0" }; otoskeskihajonta, { "14.93" } ns, antaa khiin neliö -tunnusluvun { "164.5" } vapausasteilla { "199" }, kaksipuolisen välin ([{ "151.37" }, { "254.14" }], luottamustaso { "99" }%) sisällä. Kun siemenlukuja on { "3000" }, sama skenaario antaa { "16.31" } ns.

seg-61b54a16243f = <b>Spektriohjattu ketju</b> lukee erillisten ajojen luvut: alkuvaihe kestää täsmälleen spektriajon ensimmäisen menetyksen ajan, ja jokainen aikajanan L1 C/A- ja E1-arvo vastaa tarkkuudella { "1e-9" } dB erillisen vesiputousesimerkin riviä samalle häirintätilalle (nominaali, pelkkä chirp, pelkkä CW-sävel).

seg-5ebc02a24ce1 = <b>Ketju</b> siirtää tilaa dokumentoidusti: harhautusvaihe kestää täsmälleen harhautusajon havaitsemisajan, holdover kantaa täsmälleen harhautusajon poikkeaman havaitsemishetkellä, palautuminen ei kanna mitään, ja hälytys on päällä aina, kun suojaustaso puuttuu tai ylittää hälytysrajan.

seg-153e28bcb38a = Nämä tarkistavat, ettei koostaminen muuta mitään, mitä sen ei pitäisi. Ne eivät validoi ketjutettua tehtävää mitattua vastaan, minkä vuoksi kolme kampanjariviä asiakirjassa <a1>VERIFICATION-MATRIX.md</a1> ovat MODELLED.

seg-e82860f2d902 = <s1>Edellinen</s1>Todellisten TLE-tietojen käyttö

seg-e40757a0b4cb = <s1>Seuraava</s1>Ajoraportit

seg-e65edbaca6bf = [[phases]]: ketjutettu tehtävä yhdellä aikajanalla

seg-a433ddf74e55 = [sweep]: parametriruudukko mille tahansa lajille

seg-7ca90ac531bf = [monte_carlo]: siemenillä alustettu joukko

seg-03d764a4cb56 = [compose]: useita skenaarioita yhteisillä ehdoilla

seg-61a0db2550ba = [optimize]: yhden mittarin paras arvo
