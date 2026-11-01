# docs--timing-hil: translations (fi)

seg-f8cf777c0caa = Pinnat

seg-f2ce7fc60cdf = Formaatti

seg-d00b65801e9b = Askel

seg-0d580ea8043d = Aikavirhetallenteesta pisteytetty holdover-testi, moottorin v{ $version } todellisesta ajosta skenaariolla scenarios/holdover-test-example.toml ({ "601" } näytettä { "5" } s välein). Operaattori poistaa GNSS:n hetkellä { "600" } s ja palauttaa sen hetkellä { "2400" } s; aikavirhe ajautuu arvoon { "299" } ns holdoverin lopussa, ylittää { "100" } ns budjetin { "675" } s kohdalla ja palaa { "100" } ns kaistan sisään { "70" } s palautuksen jälkeen. Tulokset: perustason maskit PASS, holdover-maskit FAIL, holdover-verhokäyrä FAIL, toipuminen RECOVERED. Mitattu maskia vasten, ei hyväksyntä. Ajat ovat operaattorin ilmoitus, eivät Kshanan varmentamia. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu.

seg-7a1246297c82 = Lähde: <c1/>

seg-6ea3dec83080 = Ajoituksen hardware-in-the-loop: vedä antenni irti, pisteytä holdover

seg-5901f0b26939 = Telekommunikaatio- ja sähköyhtiöt testaavat ajoitusjärjestelmää poistamalla siltä GNSS:n ja katsomalla, mitä kello tekee. Kshana ei tee sitä heidän puolestaan eikä koske heidän laitteisiinsa. Se lukee käyttäjän omien mittarien tuottaman aikavirhetallenteen, jakaa sen käyttäjän ilmoittamien kahden ajan kohdalta ja <b>mittaa jokaisen vaiheen julkisia ITU-T-maskeja vastaan</b>. Skenaariotyyppi on <a1><c1/></a1>; esimerkkiskenaariot ovat <c2/> ja <c3/>.

seg-daf4b071bad0 = Tämä on laitteistoturvallisuuden <b>vaihe { "1" }</b>: passiivinen, vain vastaanotto, ei Kshanan RF-lähetystä (<a1><c1/></a1>). Ohjeellinen ohjelmisto, ei tyyppihyväksytty laite. Kukaan ei ole luokitellut, hyväksynyt tai tarkistanut tätä menettelyä, eikä se kerro mitään siitä, täyttääkö järjestelmä suosituksen.

seg-da0c48bbe011 = Menettely

seg-e753ca7a1c99 = Käyttäjä ajaa neljä vaihetta. Kshana ei tee yhtäkään niistä.

seg-0c338b956741 = Mitä käyttäjä tekee

seg-ebd95b343349 = Mitä tallenne osoittaa

seg-03999de98059 = { "1" }. Lähtötaso

seg-730f2037d22a = Antaa järjestelmän toimia GNSS:ään lukittuna niin kauan kuin testi vaatii (ja merkitsee muistiin, kuinka monta päivää se oli ollut lukittuna aiemmin).

seg-f45aae4139bd = Aikavirhe ohjattuna.

seg-0f050dcede80 = { "2" }. GNSS poistettu

seg-50c0df832eda = Poistaa GNSS:n testattavalta järjestelmältä, esimerkiksi antennikaapelin vastaanottimelta tai laboratorion oman simulaattorin lähdön, ja <b>kirjaa ajan ylös</b>. Tarkista ensin vastaanottimen valmistajan käsikirja: jotkin vastaanottimet syöttävät antennille virran, ja joissakin avoin portti tarvitsee päätevastuksen.

seg-e371e7e357e3 = Hetki, jolloin aikavirhe alkaa vaellella.

seg-f05dc0acb396 = { "3" }. Holdover

seg-a98186503e0f = Jättää järjestelmän omalle oskillaattorilleen suunnitelluksi ajaksi.

seg-1da66cdca856 = Järjestelmän holdover.

seg-61197c9bad91 = { "4" }. Palautuminen

seg-75af1f4fec83 = Palauttaa GNSS:n ja <b>kirjaa ajan ylös</b>.

seg-1259d36fc78c = Aikavirhe palaa (tai ei palaa).

seg-c09b1ea8f1a4 = Kaksi asiaa, jotka käyttäjän on tehtävä, koska Kshana ei voi:

seg-31f6c357864b = Ilmoita kaksi aikaa.

seg-59f9eb10035a = <c1/> ja <c2/> ovat käyttäjän ilmoitus. Kshana ei havaitse poistoa tallenteesta eikä varmenna aikoja. Väärä aika siirtää vaiheiden rajoja ja siten tulosta.

seg-6d0d3186fbe3 = <b>Käytä samaa kelloa tallenteelle ja ajoille.</b> Kellolokissa aika-akseli alkaa ensimmäisestä lukemasta, joten kaksi aikaa ovat sekunteja lokin ensimmäisestä rivistä.

seg-bd181a831803 = Mitä tallentaa

seg-52758c10be0a = Mikä tahansa näistä, olemassa olevien lukijoiden <c1/> kautta (<a1><c2/></a1>):

seg-fef0034cb88b = Mittari

seg-ad6f33d70f3f = Miten tallenne tehdään

seg-ef7f547609ad = linuxptp <c1/> (orja- tai rajakellon servo)

seg-f548a2ae96e5 = aja asetuksella <c1/> ja säilytä rivit <c2/>

seg-9a3b58be1b0b = linuxptp <c1/>

seg-77255f8f5fef = rivit <c1/>

seg-2cf9256bd790 = linuxptp <c1/>

seg-c667a97b92a8 = rivit <c1/>

seg-ed305bcea4f8 = chrony <c1/>

seg-021b760aae59 = <c1/> tiedostossa <c2/>

seg-a7f2d72a5cb7 = chrony <c1/>

seg-a70952a099d5 = <c1/> tiedostossa <c2/>

seg-6ad29120ffe7 = TAPR TICC -laskuri

seg-32f703bfcab7 = aikaleimatila vertausta vastaan

seg-6862a9ac9a68 = TimeLab ASCII -vienti

seg-b5e7e3a272d6 = vaihe ilmoitetussa yksikössä

seg-8af4aac4426f = RINEX-kellotiedosto

seg-21d5c43719f2 = yksi kello

seg-3a82b5295ab1 = mikä tahansa muu

seg-6bebda4a3c6c = <c1/> tai <c2/>

seg-9a443cc0c444 = <c1/> -parit, tasavälisesti näytteistetty

seg-b8d1d45df70b = <b>Sillä on väliä, mitä tallenne mittaa.</b> Servo-loki (linuxptp, chrony) tallentaa siirtymän, jonka daemon mittasi ja jota se korjaa: se on servo-ohjauksen alla jäljelle jäävä aikavirhe, ei kellon riippumaton mittaus UTC:tä vastaan. Testin holdover-vaiheen aikana, joka todella poistaa vertauksen, servo-loki näyttää silti sen, mitä daemon uskoi, mikä voi poiketa todellisesta virheestä. TICC tai muu laskuri riippumatonta vertausta vastaan on vahvempi tallenne; kerro, mitä käytit, kun raportoit tuloksen.

seg-6d4e25914d1c = Skenaario

seg-ca1244db2387 = Valinnaiset avaimet: <c1/> (nimi, <c2/>, lähde; telecom-timing-oletukset, kun puuttuvat) ja <c3/> osiossa <c4/> yhden lähteen valitsemiseksi lokista, jossa niitä on useita.

seg-38eb634b7f8f = Mitä raportti sisältää

seg-6a64755e11d6 = <b><c1/></b>: lähtötasolle, holdoverille ja palautumiselle alku ja loppu, näytemäärä sekä aikavirheen keskiarvo, rms-, suurin ja loppuarvo.

seg-cd11d0838c44 = <b><c1/></b>: jokainen nimeämäsi maski mitattuna vaiheessa, jonka ehto sen nimeää. Lukitulle kellolle kirjoitettu maski mitataan lähtötasolla; holdoverille tai autonomiselle kellolle kirjoitettu holdoverissa. Jokaisella tarkistuksella on raja, mitattu arvo, marginaali ja taulukko, josta se on jäljennetty. Maski, joka tarvitsee pidemmän tallenteen kuin vaihe antoi, on <b>INCOMPLETE</b>, ei koskaan ekstrapoloitu; maski, jota moottori ei voi arvioida tallenteen näyteväliä varten, on <b>NOT-EVALUATED</b> syineen.

seg-cb54e67ca4eb = <b><c1/></b>: murtotaajuussiirtymä, jonka järjestelmä piti (pienimmän neliösumman suoran kulmakerroin holdoverin aikavirheen läpi, yksikössä ns/s, mikä on miljardisosia), jäännös tuon suoran ympärillä, suurin absoluuttinen aikavirhe ja sen ajankohta sekä askel poiston hetkellä.

seg-daa40ac07396 = <b><c1/></b>: ITU-T G.8272.1 taulukon { "3" } ePRTC-A:n holdover-verhokäyrä arvosta <c2/>, sekä aika, jolloin se ylitetään ensimmäisen kerran.

seg-cd480a1bf901 = <b><c1/></b>: aika poiston jälkeen, jolloin kukin aikavirhebudjetti ylitetään ensimmäisen kerran.

seg-007a0393cb39 = <b><c1/></b>: tuliko <c2/> kaistan sisään ja pysyikö siinä viipymäajan, kuinka kauan GNSS:n paluun jälkeen se alkoi, huippu palautuksen jälkeen ja suurin askel peräkkäisten näytteiden välillä palautumisen aikana.

seg-199497dfcc09 = <b><c1/></b>: lähtötaso- ja holdover-vaiheiden MTIE ja TDEV.

seg-ce00a41a322f = <b><c1/></b>: yhden sanan yhteenveto vaihetta kohti.

seg-c09fc305ead1 = Jokaisella luvulla on yksikkönsä ja tieto siitä, mistä se tuli, raportin lohkossa <c1/>.

seg-5d87a772c132 = Sanat ja rajat

seg-0810b24c6f3e = Tulos on <b>mitattu maskia vastaan</b>. Maskit on jäljennetty vapaasti ladattavista ITU-T-suosituksista (samat taulukot kuin tyypissä <c1/>, lueteltu sivulla <a1><c2/></a1>), ja jokainen kohta, jonka suositukset jättävät ”jatkotutkimuksen kohteeksi”, puuttuu, eikä sitä ole täytetty. Kshana ei sano, että kello tai järjestelmä täyttää suosituksen tai on hyväksytty sitä vastaan, eikä raportti sano sitä myöskään.

seg-527189cf37c6 = <b>MODELLED.</b> Vaiheiden logiikka, suoran sovitus ja palautumissääntö on tarkistettu tallenteilla, jotka on rakennettu kaavoista, joiden vastaukset tiedetään ennen ajoa; mitään laboratorion holdoveria ei ole pisteytetty ulkoista oraakkelia vastaan, eikä mikään kumppani tai laboratorio ole sopinut mistään. Ajoituslaboratoriota tarvittaisiin, ennen kuin mitään kellokohtaista lukua voitaisiin ylentää.

seg-ad8160fbed46 = <b>Mitä ei katsota</b>, ilmoitettuna jokaisessa raportissa: oliko GNSS todella poistettu ja palautettu ilmoitettuina aikoina; mikä tahansa vaihe, jota käyttäjä ei tallentanut; maskit, jotka on määritelty { "0.1" } Hz:n suodattimen kautta tallenteelle, joka on näytteistetty hitaammin kuin kerran sekunnissa; mittarin oma mittausepävarmuus; sekä mikä tahansa suosituksen menettely aikavirhetallenteen ulkopuolella (lämpötilaprofiilit, pakettiverkon kuorma).

seg-cf681db42f05 = <b>Palautumiskaista on testin oma valinta.</b> Oletus { "100" } ns on PRTC-A:n suurin absoluuttinen aikavirhe (ITU-T G.8272); se on kätevä viiva, ei minkään suosituksen vaatimus palautumiselle.

seg-4ce2f2052df4 = <b>Ei lähetyspolkua.</b> Kshana lukee tiedostoja. Se ei tuota signaalia, ja GNSS:n poistaminen laboratoriossa tehdään laboratorion omilla laitteilla ja sen omalla luvalla.

seg-0cff831a8444 = <c1/> on skenaariotyyppi, joten se ajetaan kaikkialla, missä tyyppejä ajetaan: <c2/>, Rust-rajapinta (<c3/>), Python-sidos (<c4/>), WebAssembly- ja npm-koonti (sisäinen <c5/> tai <c6/>; tiedostoavaimet eivät ole siellä käytettävissä), MCP-palvelin (<c7/>, vain sisäinen sisältö) ja Kshana Studion skenaarioajuri. Kaksi skenaariotiedostoa on mukana toimitettu (<c8/>).

seg-432c07a8e6f5 = <s1>Edellinen</s1>Harhautettu aika

seg-8499ae539222 = <s1>Seuraava</s1>Kellolokien muodot
