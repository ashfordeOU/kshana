# docs--evidence-packs: translations (fi)

seg-2247a2344710 = Merkitys

seg-ade1d7072512 = katso alla

seg-245fe1f87b08 = Tiedosto

seg-802d8b6f3afd = Lähde: <c1/>

seg-710e7e630acb = Todistepaketit: allekirjoitettu tietue GNSS-luottamustapahtumasta

seg-dbc796deac2a = <b>Paketti on tekninen tietue, ei oikeudellinen lausunto.</b> Se kertoo, mitä Kshana-moottori laski ilmoitetusta vastaanotinlokista ilmoitetulla kokoonpanolla, ja antaa jokaisen tarkistaa, ettei mitään ole muutettu jälkeenpäin. Se ei kerro, mikä tapahtuman aiheutti, kuka oli vastuussa, täyttyikö jokin velvoite tai että loki osoittaa sen, mitä vastaanotin todella vastaanotti. Sekä manifesti että yhteenveto sanovat tämän.

seg-d99cb540310c = Todistepaketti on tarkoitettu tapahtumaraporttia, vakuutusyhtiötä tai viranomaisen kysymystä varten: ”mitä järjestelmä kertoi GNSS-signaalista näiden kahden ajanhetken välillä, ja voidaanko tuohon tietueeseen luottaa?”

seg-2fa31fe443b4 = Paketin tekeminen

seg-983924cb2eea = Laboratorioistunnosta tehtävässä paketissa <c1/> tallentaa käyttäjän kuvauksen asetelmasta (johdettu tai suojattu, vaimennus tai kotelointi, mikä lähetti mahdollisen radiotaajuisen signaalin) allekirjoitettuun manifestiin; katso <a1><c2/></a1>. Se tallennetaan sellaisena kuin se annetaan, eikä sitä koskaan varmenneta.

seg-f01e59c876a3 = <c1/> ja <c2/> ovat sekunteja lokin ensimmäisestä epookista tai ISO-8601-muotoinen UTC-aika, kun loki ilmoittaa oman alkuaikansa. Asetuksen <c3/> hakemistossa ei saa olla jo tiedostoja. Asetukselle <c4/> annetaan todellinen UTC-aika, kuten <c5/> (kaikki muu hylätään), tai <c6/>, joka jättää luontiajan pois ja tekee paketista tavu tavulta toistettavan. Luontiaika on se, minkä allekirjoittaja ilmoittaa; mikään ei tarkista sitä kellosta, ja juuri sitä varten valinnainen aikaleimatunniste on.

seg-c72ddd97ad0b = Avaintiedostossa on 32-tavuinen Ed25519-siemenluku { "64" } heksadesimaalinumerona; anna oma (esimerkiksi avainhallintajärjestelmässä säilytetty) tai anna komennon <c1/> luoda sellainen. Komento <c2/> varoittaa, jos tiedosto on muiden käyttäjien luettavissa. Tiedosto <c3/> sulkee pois kaavan <c4/>; nimeä avain näin, jos se on työkopiossa.

seg-077cbd944c5d = Mitä paketissa on

seg-7cf2608b2b2f = Todistepaketin rakenne. Vastaanotinloki (NMEA, u-blox UBX, RINEX { "3" } tai Android-loki) ja aikaikkuna menevät komennolle kshana receiver-trust evidence, joka kirjoittaa seitsemän tiedostoa: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig ja valinnaisen timestamp.tsr. Manifesti tallentaa koko lokin ja jokaisen tiedoston SHA-256-tiivisteen sekä tiedostojen yli lasketun tiivisteketjun; allekirjoitus kattaa manifestin. kshana evidence verify tarkistaa allekirjoituksen, jokaisen tiedoston tiivisteen, ketjun ja sen, ettei mukana ole luettelemattomia tiedostoja, ja päättyy koodilla { "0" }, kun varmennus onnistuu, { "1" }, kun jokin epäonnistui, ja { "3" }, kun allekirjoittajaa ei ollut kiinnitetty. Paketti on tekninen tietue, ei oikeudellinen lausunto.

seg-e305279d5b11 = Sisältö

seg-05107c0bd3c8 = ikkunan raa'at vastaanotinlokin tavut

seg-b19ce12544a5 = ajettu skenaario (jokainen monitorin kynnys, tapahtuma ja vertailusääntö), ajetut monitorit, kalibroinnin lähtötaso ja skenaarion tiiviste; aluksen osalta myös ohjeellinen lausuma, jonka jokainen aluksen tuloste sisältää (ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite); versiosta { "0.36" } alkaen <c1/> (todella käytetty taulukko <c2/>, geometriamonitorin paino, jokainen alkuperä ja luokkasäännöt). Hakemistonimet ja upotetut hyötykuormat poistetaan.

seg-e3c2457161bc = jokainen ikkunan epookki moottorin tilastoineen, hälytykset (syyt) ja luottamustila; versiosta { "0.36" } alkaen myös sen satelliittien <c1/> (hyvä, heikentynyt syineen tai tuntematon, kun loki ei anna satelliittigeometriaa) ja <c2/> jokaiselle päätelmälle (<c3/>, <c4/>, <c5/>)

seg-2e309765271f = itsenäinen, skriptitön yhteenveto: tunnistetiedot, tiivisteet, tulokset, syyt, geometriakaista (epookit geometriatilan mukaan) erillään päätelmien luokista ({ "0.36" }), jokainen kynnys, epookkikohtainen taulukko ja tietueen rajoitukset

seg-467277f816d2 = moottorin versio, ikkuna, luontiaika, lokin muoto ja nimi, <b>koko lokin SHA-256</b>, viipaleen alue ja SHA-256, allekirjoittajan julkinen avain ja sormenjälki, jokaisen tiedoston koko ja SHA-256 sekä tiedostojen yli lasketty tiivisteketju

seg-7a92ff70ed7f = Ed25519-allekirjoitus tiedoston <c1/> täsmälleen samojen tavujen yli

seg-b517814b077d = valinnainen RFC { "3161" } -aikaleimatunniste

seg-6ad4c5f3afbe = <b>Lokiviipale.</b> Lukija ilmoittaa jokaisen epookin lähdetavuvälin, joten viipale on pienin tavualue, joka sisältää jokaisen ikkunan epookin (<c1/>): NMEA, u-blox UBX, RINEX { "3" } -havainnot ja Android-lokit. Se tiivistetään raakatavuina, ei koskaan dekoodattuna tekstinä. Suoran syötteen tai RINEX { "2" } -tiedoston osalta väliä ei ole; silloin koko loki liitetään mukaan ja manifesti sanoo <c2/> (ikkuna rajaa, mitkä epookit raportoidaan, ei sitä, mitkä tavut sisällytetään). Yhteenveto kertoo, kumpi pätee. Viipale on ikkunan tavujen tietue, ei itsenäinen loki: esimerkiksi RINEX-viipaleessa ei ole tiedoston otsaketta.

seg-c4c81cbd4981 = <b>Tiivisteketju.</b> Manifesti luettelee tiedostot kiinteässä järjestyksessä. <c1/>; jokaiselle tiedostolle <c2/> (pituus { "4" } tavuna, big-endian). Viimeinen lenkki on <c3/>. Tiedoston järjestyksen muuttaminen, poistaminen tai korvaaminen muuttaa ketjun; allekirjoitus kattaa ketjun.

seg-1147c5b0d348 = Paketin varmennus

seg-e716ddf7bcc9 = Poistumiskoodi { "0" } tarkoittaa varmennettu; { "1" } tarkoittaa, että jokin epäonnistui; { "2" } tarkoittaa käyttövirhettä; { "3" } tarkoittaa, että paketti on eheä mutta sen allekirjoittajaa ei ollut kiinnitetty (katso alla). Jokainen tarkistus raportoi tuloksen läpäisty, hylätty tai ohitettu, ja jokainen epäonnistuminen nimetään:

seg-f6f2cebd9cb0 = Virhekoodi

seg-312a5d784f42 = manifestia ei voi lukea

seg-6f1b5d9d6711 = ei allekirjoitusta, ei 64-tavuinen pienaakkosinen heksadesimaaliallekirjoitus tai se ei täsmää tiedoston <c1/> yli

seg-129b78f142f1 = avain ei kelpaa tai poikkeaa annetusta

seg-c86b25543d55 = luetteloitu tiedosto puuttuu tai poikkeaa manifestista; tiedosto nimetään

seg-f98d26abf045 = tiedosto on paketissa mutta ei manifestissa

seg-842bac6a9e69 = lenkki ei ole se, mitä sen syötteet antavat; tiedosto nimetään

seg-413034467a64 = manifesti on ristiriidassa itsensä tai tiedoston <c1/> kanssa

seg-ef4bfbedca33 = asetuksella <c1/>: hallussa oleva loki ei ole tallennettu loki tai viipale ei ole kyseinen sen alue

seg-dcd686ac77f7 = Yhden minkä tahansa tiedoston yhden tavun muuttaminen epäonnistuttaa varmennuksen vastaavalla syyllä: muuttunut artefakti ilmoitetaan kyseisen tiedoston tiivisteen poikkeamana eikä muuna; muuttunut manifesti epäonnistuttaa allekirjoituksen. Tiivisteiden ja ketjun uudelleenlaskenta tiedoston muokkauksen jälkeen ei auta ilman allekirjoitusavainta; silloin epäonnistuu vain allekirjoitus.

seg-066fe7c07bf6 = <b>Kiinnitä avain.</b> Ilman asetusta <c1/> paketti todistaa vain olevansa eheä omaksi ilmoittamansa avaimen suhteen, jonka kuka tahansa voi luoda. Siksi varmennus päättyy silloin koodilla { "3" } ja sanoo "INTACT, BUT THE SIGNER IS NOT PINNED" eikä "VERIFIED"; asetus <c2/> hyväksyy paketin oman avaimen tietoisesti ja tulostaa "VERIFIED against the key the pack names itself (signer NOT pinned; pass --pubkey)". Hanki allekirjoittajan julkinen avain allekirjoittajalta luotettavaa reittiä pitkin (ei paketista) ja anna se asetuksella <c3/>: { "64" } heksadesimaalinumeroa tai tiedosto <c4/>. Yksityisen avaimen antaminen erehdyksessä tunnistetaan ja hylätään. Sormenjälki (avaimen SHA-256:n ensimmäiset { "128" } bittiä, { "32" } heksadesimaalinumeroa) tulostetaan silmämääräistä vertailua varten; koko avaimen kiinnittäminen on luotettava tapa.

seg-a01c7ba606c9 = Paketin muoto ja varmennusmenettely (normatiivinen)

seg-fa43e16b6aba = Tämä jakso on määrittely, jonka pohjalta riippumaton varmentaja kirjoitetaan. Isoilla kirjaimilla kirjoitetut sanat ovat vaatimuksia. Paketti on hakemisto (tai mikä tahansa kuvaus tiedostonimestä tavuihin), jonka tiedostot on nimetty täsmälleen alla olevan mukaisesti; varmentaja käsittelee kunkin tiedoston tavuja sellaisina kuin ne on tallennettu eikä serialisoi mitään uudelleen.

seg-1fbabb3f1092 = <b>Tiedostot.</b> Artefaktitiedostot tässä kiinteässä järjestyksessä ovat <c1/>, <c2/>, <c3/>, <c4/>. Paketissa on myös <c5/> ja <c6/>, ja siinä SAA olla <c7/>. Mikä tahansa muu nimi on <em>luetteloimaton tiedosto</em>.

seg-3ed6e38ad2ee = <b>Heksadesimaali.</b> Jokainen heksamerkkijono on pelkästään pienaakkosin <c1/>, ilman välilyöntejä; isoja kirjaimia ei hyväksytä. SHA-256-arvot ovat { "64" } numeroa, julkinen avain { "64" } numeroa ja allekirjoitus { "128" } numeroa.

seg-6609210d003a = <b><c1/>.</b> 64-tavuisen Ed25519-allekirjoituksen (RFC { "8032" }, puhdas Ed25519-menettely) 128-numeroinen pienaakkosinen heksadesimaaliesitys tiedoston <c2/> täsmälleen samojen tavujen yli, jota seuraa täsmälleen yksi <c3/> eikä mitään muuta. Allekirjoitus TÄYTYY tarkistaa tiukasti: allekirjoitus, jonka S-arvo ei ole pienempi kuin ryhmän kertaluku L, on virheellinen.

seg-b163e9f5db66 = <b><c1/>.</b> UTF-8-muotoinen JSON-objekti. Sen jäsenet (varmentajan TÄYTYY löytää kukin ilmoitetulla JSON-tyypillä; lisäjäsenet jätetään huomiotta):

seg-ace92bcbfd8a = jäsen

seg-04f69a0edb2f = tyyppi

seg-45425f378b61 = merkitys

seg-6940543aa3c0 = merkkijono

seg-48d303baac62 = TÄYTYY olla <c1/>

seg-6e57561e7f01 = kuvaileva

seg-abec93a4a488 = merkkijono tai null

seg-7d059c0b6372 = luontiaika, kuvaileva

seg-507d53a53380 = objekti <c1/>

seg-bb2bcbbf404a = lukuja, sekunteja

seg-64572c65426f = ei-negatiivinen kokonaisluku

seg-14d421e391dd = tiedoston <c1/> JSON-taulukon alkioiden lukumäärä

seg-f5e7215e6835 = objekti

seg-a4117217030c = <c1/> merkkijono, <c2/> merkkijono, <c3/> heksadesimaali, <c4/> ei-negatiivinen kokonaisluku, <c5/> merkkijono tai null sekä <c6/>

seg-02389e71a339 = <c1/> (täsmälleen <c2/> tai <c3/>; mikä tahansa muu arvo tekee manifestista virheellisen), <c4/> ja <c5/> ei-negatiivisia kokonaislukuja (tavusiirtymiä, loppu poissulkeva), <c6/> heksadesimaali

seg-6c9176965aae = <c1/> merkkijono (<c2/>), <c3/> heksadesimaali ({ "32" } tavua), <c4/> merkkijono

seg-dcba59304030 = objektitaulukko

seg-e42ed5e07430 = yksi artefaktitiedostoa kohden kiinteässä järjestyksessä: <c1/> merkkijono, <c2/> merkkijono, <c3/> ei-negatiivinen kokonaisluku, <c4/> heksadesimaali, <c5/> heksadesimaali

seg-b79c9500b744 = heksadesimaali

seg-697592bd3757 = viimeinen lenkki

seg-9da5d92757bd = objekti, valinnainen

seg-2032c208038d = mukana vain laboratorioistunnosta tehdyssä paketissa (<c1/>): käyttäjän lausuma <c2/>, <c3/>, <c4/>, <c5/> (<c6/> tai <c7/>), <c8/> tai <c9/>, <c10/>, <c11/> ja valinnaisesti <c12/>, tallennettuna sellaisenaan. Manifestin allekirjoitus kattaa sen, eikä sitä koskaan varmenneta; varmentaja raportoi sen muodossa "attested by the named operator; not verified by Kshana". Muulloin sitä ei ole, ja paketti ilman sitä pysyy muuttumattomana

seg-9411be425a80 = <c1/> on julkisen avaimen { "32" } tavun SHA-256:n ensimmäiset { "32" } heksadesimaalinumeroa.

seg-80e55f2d3496 = Tiivisteketju.

seg-9346fe50efac = <c1/> on { "23" } ASCII-tavun <c2/> SHA-256. Jokaiselle artefaktille järjestyksessä <c3/>, jossa <c4/> otetaan manifestiin kyseiselle artefaktille tallennetusta arvosta <c5/> (ketju on siis manifestin ominaisuus ja se tarkistetaan manifestia vasten, ei tiedostoja vasten).

seg-9dd985d8cb03 = <b>Menettely.</b> Varmentaja suorittaa nämä vaiheet järjestyksessä ja kerää jokaisen virheen; tulos on virheiden <em>joukko</em>, joista kukin on <c1/> ja, missä ilmoitettu, tiedosto <c2/>. Se EI SAA pysähtyä ensimmäiseen virheeseen paitsi siellä, missä niin sanotaan. <c3/> on julkinen avain, johon varmentajaa käskettiin luottamaan, jos mikään.

seg-abb1d2635143 = Ei tiedostoa <c1/>: virhe <c2/>; pysähdy.

seg-73a4aeb463e8 = Jos <c1/> ei ole JSON-objekti, jossa on jokainen yllä oleva jäsen ilmoitetuissa tyypeissä (mukaan lukien <c2/>-alkiot kaikkine jäsenineen ja <c3/>): virhe <c4/>. Muuten, jos <c5/> ei ole yllä oleva arvo: <c6/>.

seg-36c9df2abf34 = Allekirjoitusvaihe. Tämä vaihe suoritetaan riippumatta siitä, oliko manifesti luettavissa. Jos manifesti oli luettavissa, <em>nimetty avain</em> on <c1/>; jos se ei ole { "64" } pienaakkosista heksadesimaalinumeroa, virhe <c2/> (ei nimettyä avainta); muuten, jos <c3/> ei ole sen sormenjälki, virhe <c4/> (avain pysyy käyttökelpoisena). Jos sekä <c5/> että nimetty avain on olemassa ja ne eroavat: virhe <c6/>. <em>Tarkistusavain</em> on <c7/>, jos sellainen annettiin, muuten nimetty avain, jos sellainen on; kummankaan puuttuessa tarkistusavainta ei ole (tämä koskee jokaista tapausta, jossa manifesti ei ollut luettavissa eikä asetusta <c8/> annettu). Jos tiedostoa <c9/> ei ole: <c10/>. Muuten, jos tiedosto ei ole täsmälleen { "128" } pienaakkosista heksadesimaalinumeroa ja yksi <c11/>: <c12/>. Muuten, jos tarkistusavain ei ole kelvollinen Ed25519-julkisen avaimen koodaus: <c13/>. Muuten, jos tarkistusavain on olemassa eikä allekirjoitus täsmää tiukasti tiedoston <c14/> tavujen yli (mitä ne sitten ovatkin): <c15/>. (Ilman tarkistusavainta allekirjoitusta ei tarkisteta, eikä siitä nosteta virhettä.)

seg-3dbe07af8fa8 = Jos manifesti ei ollut luettavissa (vaihe { "2" } antoi <c1/>): pysähdy tähän.

seg-b7e03ef2dea5 = Artefaktit. Jos kohdan <c1/> nimet eivät ole täsmälleen yllä olevat neljä järjestyksessä: <c2/>. Sitten jokaiselle manifestin alkiolle järjestyksessä: jos paketissa ei ole kyseisen nimistä tiedostoa, <c3/> (nimi); muuten, jos sen pituus poikkeaa arvosta <c4/>, <c5/> (nimi); ja erikseen, jos tiedoston SHA-256 poikkeaa arvosta <c6/>, <c7/> (nimi).

seg-24cda5a1d9d8 = Luetteloimattomat tiedostot: jokaiselle paketin tiedostolle, joka ei ole <c1/>, <c2/>, <c3/> eikä manifestin kohdan <c4/> nimi: <c5/> (nimi).

seg-d103ade9a7c7 = Ketju. Käy manifestin <c1/> läpi järjestyksessä alkaen arvosta <c2/>. Jos alkion <c3/> ei ole { "64" } pienaakkosista heksadesimaalinumeroa: <c4/> ja ketju hylätään (ei päätarkistusta). Muuten laske lenkki; jos se poikkeaa alkion arvosta <c5/>: <c6/> (nimi). Läpikäynnin jälkeen, jos ketjua ei hylätty ja viimeinen lenkki poikkeaa arvosta <c7/>: <c8/>.

seg-be9fade3f879 = Viipale ja epookit. Nosta <c1/> (enintään kerran syytä kohden, ja varmentaja raportoi koodin kerran riippumatta siitä, kuinka monta syytä pätee), jos jokin seuraavista: <c2/>; <c3/>; kohdan <c4/> alkion <c5/> poikkeaa arvosta <c6/>; kyseisen alkion <c7/> poikkeaa arvosta <c8/>; tai <c9/> on <c10/> ja jokin kohdista <c11/>, <c12/>, <c13/>. Jos <c14/> on olemassa ja jäsentyy JSON-taulukoksi, jonka pituus poikkeaa arvosta <c15/>: <c16/>.

seg-0dc49ed14c1f = Koko loki. Vain jos varmentajalle annettiin alkuperäisen lokin tavut: jos niiden SHA-256 poikkeaa arvosta <c1/>, <c2/>; muuten, jos väli <c3/> ei ole lokin sisällä tai lokin tavut siinä poikkeavat tiedostosta <c4/>, <c5/>.

seg-a7f787d6e6df = Aikaleima. Ilman tiedostoa <c1/>: jos varmentajaa käskettiin vaatimaan sellainen, <c2/>; muuten ei mitään. Jos sellainen on: jos sitä ei voi lukea RFC { "3161" } -tunnisteena tai -vastauksena (katso alla), <c3/>; muuten, jos sen viestin sormenjälki ei ole tiedoston <c4/> tavujen tiiviste sormenjäljen omalla algoritmilla (SHA-256, SHA-384 tai SHA-512): <c5/>.

seg-f7d908c6bf38 = Paketti on varmennettu täsmälleen silloin, kun virhejoukko on tyhjä. Se, oliko allekirjoittaja kiinnitetty, raportoidaan erikseen eikä se muuta virhejoukkoa.

seg-b0d74519122d = <b>Aikaleimatunniste.</b> Tunniste on DER-koodattu <c1/>, jonka sisältötyyppi on CMS SignedData ({ "1.2.840.113549.1.7.2" }) ja jonka kapseloitu sisältötyyppi on <c2/> ({ "1.2.840.113549.1.9.16.1.4" }); vastaus on DER-koodattu <c3/> (<c4/>, jota seuraa tunniste), jonka tila on { "0" } tai { "1" }. Kohdan <c5/> viestisormenjäljen algoritmin täytyy olla SHA-256, SHA-384 tai SHA-512 ja tiivisteen pituuden kyseisen algoritmin mukainen, ja sen <c6/> todellinen UTC-kalenteriaika. Määrittelemätöntä pituutta käyttävää BER:iä ei hyväksytä. Viranomaisen allekirjoitus ja varmenneketju tarkistetaan vain, kun luotetut ankkurit on annettu (<c7/>, alla).

seg-2156bf4dabb3 = RFC { "3161" } -aikaleima (valinnainen)

seg-27a71ea73d7d = Aikaleimapalvelun antama aikaleimatunniste osoittaa, että manifesti oli olemassa hetkellä, jonka palvelu todistaa. Tunniste on tiedoston <c1/> yli, joten se pyydetään paketin tekemisen jälkeen (sellaista ei voi antaa paketin luontivaiheessa, ja <c2/> hylkää tunnisteen, joka ei ole täsmälleen tämän manifestin yli):

seg-7ae6e0326b65 = <c1/> lukee tunnisteen (pelkkä tunniste tai täysi vastaus), tarkistaa, että se on myönnetty ja että sen viestisormenjälki on yhtä suuri kuin tiedoston <c2/> tiiviste, ja tulostaa siinä ilmoitetun ajan. Ilman luotettuja ankkureita se lisää "timestamp authority signature not verified by Kshana" ja raportoi <c3/>; aja yllä oleva rivi <c4/> sitä osaa varten. Tunniste, jonka sormenjälki poikkeaa, tai sellainen, joka ei jäsenny, on virhe. Tunnisteen sisältötyypit, sormenjäljen pituus ja luontiaika tarkistetaan järkevyyden vuoksi.

seg-88359c107bf1 = Kun annetaan <c1/> (yksi tai useampi PEM-varmenne, kaikkiin luotetaan), <c2/> tarkistaa myös viranomaisen offline-tilassa samoin kuin <c3/>: allekirjoitettujen attribuuttien viestitiivisteen, allekirjoituksen (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 tai P-384), ESS-allekirjoitusvarmenteen sidonnan, allekirjoittajan kriittisen timeStamping-laajennetun avainkäytön sekä ketjun itse myönnettyyn ankkuriin, jokainen varmenne voimassa tunnisteen ajanhetkellä <c4/>. Virhe raportoidaan muodossa <c5/> ja ensimmäisenä epäonnistuneella tarkistuksella, ja <c6/> on tosi vain, kun kaikki läpäistiin. Perumista (CRL tai OCSP) ei tarkisteta. Tämä varmentaja on samaa mieltä OpenSSL { "3.0.13" }:n kanssa { "27" } itse luodussa tapauksessa (<c7/>).

seg-f534ae37f10c = <b>Tunniste on allekirjoitetun manifestin vieressä, ei sen sisällä.</b> Mikään allekirjoituksessa tai ketjussa ei kata sitä, joten tunniste voidaan poistaa tai korvata toisella kelvollisella tunnisteella ilman, että allekirjoitus epäonnistuu. Siksi <c1/> huomauttaa, kun paketissa ei ole sellaista, ja <c2/> tekee puuttuvasta tunnisteesta virheen (<c3/>); korvattu tunniste jää kiinni vain, jos se ei täsmää manifestiin. <c4/> kieltäytyy ylikirjoittamasta olemassa olevaa tunnistetta, ellei anneta asetusta <c5/>. Jos aikaleimalla on merkitystä, säilytä tunniste ja varmennustulos omissa tietueissa ja vaadi se.

seg-b993ef559bd0 = Koodista

seg-de24fd02c7c2 = <c1/> on se yksi sisääntulopiste, jota komentorivi ja jokainen muu pinta kutsuvat paketin tekemiseen: sisään menevät skenaario, lokin tavut (ja RINEXille navigointitiedoston tavut), ikkuna tekstinä, otsikko ja valinnainen luontiaika sekä allekirjoituksen siemenluku; ulos tulevat tiedostot, epookkien lukumäärä, viipale, manifestin tiiviste ja allekirjoittajan sormenjälki. Se ei lue tiedostoja eikä kelloa, joten samat syötteet antavat samat tavut. Sen alla <c2/> ja <c3/> ovat puhtaita funktioita: sisään tavut (<c4/>, 32-tavuinen siemenluku, tiedostojen <c5/>), ulos serialisoitavat tulokset (<c6/>, <c7/>). Ne eivät käytä tiedostoja, kelloa tai prosessin tilaa ja rakentuvat alustalle <c8/>, joten Python-, WebAssembly- ja palvelinpinnat kutsuvat niitä muuttumattomina. Komentorivi on ohut kääre niiden ympärillä.

seg-292a5bc48548 = Mitä paketti ei tee

seg-852aca7fc407 = Se ei aja arviointia uudelleen. Kuka tahansa, jolla on koko loki ja <c1/>, voi ajaa <c2/> uudelleen ja verrata tiedostoon <c3/>; paketti todistaa, mitä tallennettiin, ei sitä, että moottori oli oikeassa.

seg-91639deac47d = Se ei todista, että loki on aito tai täydellinen. Koko lokin tiiviste sitoo tietueen yhteen tiedostoon; mistä tiedosto tuli, on käyttäjän osoitettava.

seg-0f721c314fa1 = Se ei sisällä mitään suorituskykyväitettä häiriön havaitsemisesta tai torjunnasta.

seg-9c361736bf27 = Se on tekninen tietue eikä oikeudellinen lausunto tai sertifiointi.

seg-68bcf43b4e27 = <s1>Edellinen</s1>Rivikattavuus

seg-09c0b5fa6e52 = <s1>Seuraava</s1>Optiset yhteydet ilmakehän läpi
