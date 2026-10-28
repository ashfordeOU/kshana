# docs--animation: translations (fi)

seg-8428c41646b0 = Lähde: <c1/>

seg-a61d094894fd = <c1/> muuttaa ajon aikasarjan liikkuvaksi: animoiduksi Scalable Vector Graphics (SVG) -tiedostoksi, yhdeksi itsenäiseksi HyperText Markup Language (HTML) -soittimeksi tai numeroiduksi SVG-kehysten sarjaksi videoenkooderille. Kampanja toistetaan vaiheinaan (häirintä, harhautus, holdover, eheyshälytys) hälytykset merkittyinä; spektriajo toistaa vesiputouksensa rivi riviltä; matalan Maan kiertoradan (LEO) ylilento toistaa kaistakohtaisen linkkinsä ja harhauttajan kanssa monitoritilastot epookki epookilta.

seg-39d69331035d = Koodi: <c1/>. Testit: <c2/>.

seg-0b708f65d8d3 = Mitä se on ja mitä se ei ole

seg-ad8c12a3b510 = Viejä lukee tulosasiakirjan, jonka ajo on jo kirjoittanut. Se ei aja fysiikkaa uudelleen, ei uudelleennäytteistä, tasoita eikä interpoloi näytteiden välillä (lukuun ottamatta yhtä suoraa janaa, joka päättää jäljen kursoriin), eikä se lisää omia lukujaan. Animaatio on siksi täsmälleen yhtä hyvä kuin sen takana oleva ajo. Sen taso on <b>MODELLED, sisäinen johdonmukaisuus</b>: se on renderöinti, ei koskaan todiste, eikä sillä ole omaa varmennusmatriisin riviä.

seg-f37311ad7ef0 = Tulosteet

seg-0c21f772932e = Jokainen formaatti kirjoitetaan skenaarion viereen tavallisten <c1/>, <c2/> ja <c3/> rinnalle:

seg-f2ce7fc60cdf = Formaatti

seg-51a8df15f356 = Kirjoitetaan muodossa

seg-3ea93ae372ca = Mitä se sisältää

seg-3603593b9799 = Yksi SVG, joka on animoitu Cascading Style Sheets (CSS) -avainkehyksillä ja ilman skriptiä: jäljet piirtyvät liikkuvan aikakursorin taakse, tapahtumat ilmestyvät hetkellään, vesiputousrivit paljastuvat aikajärjestyksessä. Se toistuu silmukkana, ja valmis kuva pidetään { "1.5" } s ajan.

seg-6c91078b434e = Yksi tiedosto, jossa on rivinsisäinen skripti ja tyyli eikä ulkoisia resursseja: toisto ja tauko, vierityspalkki, nopeus (0,25x–4x), kaikki paneelit yhdellä synkronoidulla kursorilla, jokaisen jäljen elävä arvo, vaihekaista ja tapahtumaluettelo, joka hakee napsautuksesta. Välilyönti toistaa tai pysäyttää, nuolinäppäimet askeltavat, Home ja End hyppäävät.

seg-df02d37cd729 = <c1/>, <c2/>, … ja <c3/>.

seg-2e5ebd60cad0 = <c1/> voidaan antaa useita kertoja ja se ottaa pilkuilla erotetun luettelon (<c2/>) tai arvon <c3/>. <c4/> ({ "1" }–{ "60" }, oletus { "12" }) ja <c5/> ({ "0.5" } s–{ "600" } s, oletus { "8" } s) asettavat toiston; kehyssarja on rajattu { "7,200" } kehykseen.

seg-7e012ab53f45 = Kun <c1/> on mukana samassa komennossa, HTML-soitin luettelee viereensä kirjoitetut vientitiedostot (CZML, KML, GeoJSON, STK, SigMF) suhteellisina linkkeinä näihin sisartiedostoihin; linkki kirjoitetaan vain pelkälle tiedostonimelle, joten mikään ei voi poistua kansiosta eikä tavoittaa verkkoa. Laaja raportti (<c2/>) upottaa animoidun piirroksen aina, kun tuloksessa on aikasarja, riippumatta siitä, ajettiinko <c3/>.

seg-9c1d2204edab = Kun <c1/> ajetaan, tiedostoon <c2/> tulee lohko <c3/>: formaatit, kuvaa sekunnissa (fps), kesto, kehysmäärä, aikaväli, paneelien otsikot, JSON-polut, joista jokainen jälki luettiin (<c4/>), ja kaikki löydetyt mutta piirtämättömät sarjat (<c5/>). Ilman valitsinta <c6/> tulos on tavu tavulta identtinen tavallisen ajon kanssa.

seg-fa8388ae976e = Kehyssarja

seg-db4b53abe7d6 = Sarjassa on täsmälleen <c1/> kehystä. Kehys <em>i</em> näyttää aikajanan hetkeen <c2/> asti, joten ensimmäinen kehys on alku ja viimeinen on valmis kuva. <c3/> tallentaa <c4/>, <c5/>, <c6/>, <c7/> (<c8/>), pikselikoon, <c9/>, <c10/>, jokaisen kehyksen tehtäväajan (<c11/>), vaiheet, tapahtumat ja lähteet. Uudelleenvienti samaan hakemistoon poistaa ensin jokaisen siellä jo olevan <c12/> (eikä mitään muuta), joten lyhyempi sarja ei jätä pidemmän sarjan kehyksiä enkooderin luettavaksi.

seg-13b57b6d3c14 = Kehykset ovat SVG:tä, eivät Portable Network Graphics (PNG) -kuvia. Kirjastolla <c2/> rakennettu <c1/> lukee ne suoraan sarjan kirjoitusnopeudella ({ "24" } yllä olevassa esimerkissä; manifestin <c3/>):

seg-b20beeb45fac = <c1/> ilman kirjastoa <c2/> pysähtyy viestiin ”no decoder found for: svg”. Rasteroi kehykset ensin, esimerkiksi komennolla <c3/>, ja enkoodaa PNG-kuvat:

seg-fc61f546f605 = Saavutettavuus ja teema

seg-7015f7ed77dc = <b>Värimaailma.</b> Soitin seuraa asetusta <c1/> ja piirtää uudelleen sen muuttuessa; animoitu SVG sisältää paletistaan vaalean variantin saman media-kyselyn alla. Kehykset käyttävät staattisten kaavioiden tummaa palettia, koska videolla ei ole värimaailmaa.

seg-c3b1f19f191b = <b>Vähennetty liike.</b> Asetuksella <c1/> animoitu SVG kytkee jokaisen animaation pois ja näyttää valmiin kuvan (sen perustyylit ovat lopputila, joten mitään ei piiloteta), ja soitin avautuu pysäytettynä valmiilla kuvalla toistamisen sijaan; käyttäjä voi silti vierittää tai painaa Toista.

seg-f8dd26194eec = SVG:ssä on <c1/> ja <c2/>; soittimen säätimet ovat nimettyjä painikkeita, aluesyöte, jossa on puhuttu aika-arvo, ja valintalista.

seg-f5356cbf3675 = Mikä lasketaan aikasarjaksi

seg-ba43cf36ac20 = Tulosasiakirjat eroavat tyypeittäin, joten viejä tunnistaa moottorin tuottamat muodot eikä tyyppiluetteloa:

seg-952d09156712 = <b>Taulukko tietueita, joissa on aikakenttä</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> tai <c6/> taulukossa <c7/>), joka kasvaa tiukasti taulukon läpi. Jokainen muu numeerinen kenttä muuttuu jäljeksi; sama kenttä kahden juuren alla (<c8/> ja <c9/>) jakaa paneelin.

seg-2c3abce3f70a = <b>Objekti, jossa on tiukasti kasvava aikataulukko</b> (<c1/>, <c2/>, <c3/>, …) ja samanpituisia taulukoita sen rinnalla: sisaruksina numeerisia taulukoita, kartta <c4/>, jossa on tietueita <c5/> (aikajana <c6/>), tietuetaulukko, jonka tietueet sisältävät tällaisia taulukoita (kaistat <c7/>, tähdistön satelliittien radat), ja kaksiulotteinen taulukko, jonka rivit vastaavat aika-akselia ja jonka sisarena on taajuusakseli <c8/> (vesiputous <c9/>).

seg-0edf8c38f9eb = Tämän aikataulukon rinnalla <c1/> (<c2/>, <c3/>, <c4/>) muuttuvat vaihekaistaksi ja <c5/> (<c6/>, <c7/>, <c8/>) merkeiksi. Myös kaistan skalaarit <c9/> (sen ensimmäinen lukituksen menetys, sen pienin kantoaalto–kohinatiheyssuhde) merkitään.

seg-608c4fed9e98 = Jäljet, joilla on yksikkö, jakavat paneelin, kun niiden suuruusluokat ovat kertoimen { "100" } sisällä, joten { "50" } ns:n suoja ei litistä { "2" } ns:n virhettä. Enintään { "6" } paneelia, joissa on { "6" } jälkeä, piirretään; loput luetellaan kohdassa <c1/>. Jäljet, joissa on yli { "2,400" } näytettä, harvennetaan tasaisella askeleella, joka säilyttää viimeisen näytteen, ja vesiputous, jossa on yli { "96" } × { "120" } solua, keskiarvoistetaan alas (tehossa desibelisoluille, jotta kapeaa häirintälähdettä ei laimenneta).

seg-c386389e4f1d = LEO-tyypeistä jokainen mukana toimitettu skenaario tyypeille <c1/>, <c2/> ja <c3/> animoituu. <c4/> animoituu Doppler-, yhteispaikannus- ja ajoitustiloissaan (ajoitusajo tarvitsee <c5/>, mikä saa jokaisen rivin raportoimaan aikavirheensä ja ennustetun sigmansa jokaisella epookilla) ja hylätään napa-alueen kattavuustilassaan. <c6/> animoituu ylilennon keskivaiheen päivityksensä osalta ja hylätään koodaus-, sovitusvälin- ja mallivertailuanalyyseille. Tuloksissa <c7/> ja <c8/> ei ole aika-akselia, ja ne hylätään.

seg-eb31ec7a07b7 = Determinismi

seg-82bcf8a5b042 = Tuloste on tulosasiakirjan ja asetusten puhdas funktio: ei kelloa, ei satunnaislukua, ei hash-map-iterointia, ei tiedosto- tai verkkokäyttöä kirjastossa eikä aikaleimaa missään, joten sama skenaario, siemenluku ja asetukset antavat tavu tavulta identtiset tiedostot. Moduuli rakentuu WebAssemblylle sellaisenaan; vain komentorivikäyttöliittymä kirjoittaa tiedostoja.

seg-77e1f459f3d3 = Kirjastokäyttö

seg-b3fa41e48ea5 = <c1/> animoi jo olemassa olevan tulosasiakirjan, ja <c2/> palauttaa sen, mitä piirrettäisiin, piirtämättä sitä.

seg-0857a94a948e = Rajoitukset

seg-02f0f03af2fb = Python-wheel ja WebAssembly-moduuli eivät vielä tarjoa viejää; se on käytettävissä komentoriviltä, Rust-kirjastosta ja Model Context Protocol (MCP) -palvelimen työkalusta <c1/> (joka palauttaa enintään { "120" } kehystä yhdessä vastauksessa).

seg-cd3ec7b403ba = Akselit ovat lineaarisia. Sarja, joka kattaa monta dekadia (kellon virheen kasvu arvosta { "0.1" } ns mikrosekuntiin), näyttää tasaiselta ajon loppupuolelle asti.

seg-ed21d370a73c = Animoitu SVG perustuu leikkaussuorakulmion CSS-animaatioon; nykyiset Chromium-, Firefox- ja Safari-moottorit toistavat sen, kun taas katselin ilman CSS-animaatiota näyttää valmiin kuvan.

seg-9dfb9596ecf3 = Pyyhkäisy-, Monte Carlo- ja compose-kampanjoilla ei ole aika-akselia ja ne hylätään; pyyhkäisyn tai otoksen yhteenvetotilastot eivät ole aikasarja. Ketjutettu kampanja animoituu.

seg-be1f1afe7424 = <s1>Edellinen</s1>Ajoraportit

seg-6817433f69f6 = <s1>Seuraava</s1>Yhteentoimivuuden viennit ja tuonnit

seg-51cd8d5f527b = Tyyppi, jonka tulos ei sisällä yhtäkään näistä muodoista (linkkibudjetti, yhden epookin geometria, pelkkä tilastollinen Monte Carlo -yhteenveto tai telealan holdover, jonka tulos julkaisee tallenteen hashin mutta ei tallennetta), hylätään viestillä <c1/>, eikä mitään kirjoiteta. Versiolla kshana { $version } animoituu { "94" } niistä { "193" } ajettavasta skenaariotiedostosta (kaikki tiedostot paitsi tutkimussarja), ja { "99" } hylätään. <c2/> tulostaa laskennan.
