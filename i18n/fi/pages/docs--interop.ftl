# docs--interop: translations (fi)

seg-f917e7fcac09 = Mikä se on

seg-cae10fb9bff8 = Skenaario

seg-f2ce7fc60cdf = Formaatti

seg-8c718f7f9f5d = SigMF

seg-507b8c235614 = CZML

seg-bf09433a7342 = GeoJSON

seg-9c92e0bc42aa = KML

seg-b03d56f501c3 = Tyyppi

seg-357c2320b43a = kyllä

seg-c8c964a11462 = Lähde: <c1/>

seg-881ec6f8fbe0 = Ajo kirjoittaa tulosasiakirjan, kaavion ja raportin. <c1/> kirjoittaa lisäksi skenaarion geometrian tai sen synteettisesti tuotetun signaalin muodoissa, joita muut työkalut jo lukevat: maapallonäkymä, työpöytäkartta, paikkatietojärjestelmä (GIS), tehtäväanalyysipaketti tai ohjelmistoradiotyökalu (SDR). Mikään tässä ei lue kelloa tai verkkoa, eikä yksikään vienti sisällä luontiaikaleimaa, joten sama skenaario tuottaa tavu tavulta identtiset tiedostot joka ajolla.

seg-736f2dc67a3c = Tiedostot kirjoitetaan skenaarion viereen ja nimetään kuten tulosasiakirja: <c1/>, <c2/>, <c3/>, yksi <c4/> kutakin liikkuvaa kohdetta kohden (tai <c5/>, kun kohteita on yksi) sekä pari <c6/> / <c7/>. Kun käytössä on <c8/>, ne saavat tutkimuksen nimen, kuten muutkin tulosteet.

seg-21d3fba059d5 = Nimenomaisesti nimetty muoto, joka ei sovellu skenaarioon, on virhe, joka tulostaa syyn; kun käytössä on <c1/>, syy tulostetaan ja muoto ohitetaan. Kirjastoon kuuluvat sisääntulopisteet ovat <c2/>, <c3/> ja <c4/>; ne ottavat skenaarion tekstin ja palauttavat tavuja, eivät käytä tiedostoja, joten ne toimivat myös WebAssembly-versiossa. Model Context Protocol (MCP) -palvelin tarjoaa samat kolme työkaluina <c5/>, <c6/> ja <c7/> (katso <c8/>).

seg-77200201db88 = Koodi: <c1/> (<c2/> rakentaa skenaariosta yhden geometrisen kuvauksen, ja <c3/>, <c4/>, <c5/> ja <c6/> kirjoittavat sen), <c7/> ja <c8/> signaalia varten. Testit: <c9/>.

seg-f13ab6bb2e47 = Muodot

seg-fc52229b569c = Noudatettu määrittely

seg-3f237c8956eb = Cesium Language: JSON-taulukko (JavaScript Object Notation) aikaleimatuista paketeista, jota CesiumJS lukee

seg-234fa6710fb9 = Keyhole Markup Language { "2.2" }, Open Geospatial Consortiumin (OGC) standardi, jota Google Earth ja useimmat GIS-työkalut lukevat; aikaleimatut jäljet käyttävät Googlen laajennusta <c1/>

seg-ef08da440ce5 = <a1>https://www.ogc.org/standards/kml/</a1> (skeeman nimiavaruus <c1/>; laajennuksen nimiavaruus <c2/>)

seg-4cfac7667dbc = maantieteellinen JSON, Internet Engineering Task Forcen (IETF) Request for Comments (RFC) { "7946" }

seg-de0feb450ae1 = STK <c1/>

seg-96173e7b4238 = Ansys Systems Tool Kitin (STK) efemeriditiedosto, aika-paikka-nopeus-muoto <c1/>

seg-a2284e8c0034 = Signal Metadata Format: JSON-metatietotiedosto ja raakatiedosto kompleksisista vaihe- ja kvadratuurinäytteistä (IQ)

seg-b38ee3ebd012 = Mitä kukin tiedosto sisältää

seg-7d873bc11593 = Jokainen paikkatietomuoto kirjoitetaan samasta kohtauksesta, joten ne eivät voi olla eri mieltä siitä, missä mikäkin on. Kohtauksessa on enintään neljää lajia kohteita:

seg-1fc686f6a7ea = <b>Liikkuvat kohteet</b> — satelliitit ja käyttäjäalusta, kun se liikkuu — näytteistetään skenaarion omalla aikaruudukolla käyttäen propagaattoreita, joita lajin ajo käyttää.

seg-3db28cb6adc5 = <b>Kiinteät paikat</b> — vastaanotin, maa-asema, häirintälähetin tai paikallisen navigointikoordinaatiston origo.

seg-0def04909935 = <b>Aikaleimattomat jäljet</b> — reittipisteet, joita maasto-, painovoima- tai yhdistetty vaihtoehtoinen paikannus-, navigointi- ja ajanmääritys (PNT) -laji lentää. Näillä lajeilla ei ole aika-akselia, joten jäljillä ei ole aikaa.

seg-e14d49ae7330 = <b>Häirintälähettimen jalanjäljet</b> — lajille <c1/> kaksi ympyrää häirintälähettimen ympärillä: maanpinnan etäisyys, jonka sisällä zeniitissä oleva satelliitti (voimakkain) jää seurantakynnyksen alle, jolloin jokainen satelliitti menetetään, ja etäisyys, jonka sisällä korkeuskulmamaskissa oleva satelliitti (heikoin) jää sen alle, jolloin seuranta alkaa pettää. Molemmat tulevat lajin omista linkkiyhtälöistä (Kaplan ja Hegarty, <em>Understanding GPS/GNSS</em> (Global Positioning System / Global Navigation Satellite Systems), 3. painos, §{ "9.4" }), kun häirintälähetin on vastaanottimen horisontissa ja käytetään vapaan tilan vaimennusta, ja testisarja tarkistaa, että kantoaalto-kohinatiheyssuhde on kullakin säteellä yhtä suuri kuin kynnys { "1e-6" } dB:n tarkkuudella. Ympyrä piirretään pallolle, jonka säde on Maan keskisäde.

seg-e1dd97c47993 = Ensimmäinen paketti on asiakirjapaketti (<c1/>, <c2/>), jonka kello kattaa aikaruudukon. Jokainen liikkuva kohde on paketti, jonka kentässä <c3/> on ISO { "8601" } (kansainvälisen standardointijärjestön päivämäärä- ja aikamuoto) UTC (koordinoitu yleisaika) -aika <c4/>, <c5/> <c6/> sekä näytteet <c7/> <c8/>: sekunteja epookin jälkeen, metrejä Geocentric Celestial Reference Systemissä (GCRS). CesiumJS tulkitsee koordinaatiston <c9/> International Celestial Reference Frameksi (ICRF), jonka akselit GCRS jakaa. Kiinteät paikat ja jalanjälkien keskipisteet ovat vakioita Maan mukana pyöriviä paikkoja <c10/>, joilla <c11/> on <c12/>. Jalanjälki on <c13/>, jonka molemmat puoliakselit ovat yhtä suuret kuin sen säde; aikaleimaton jälki on maahan kiinnitetty <c14/>. Jokaisen paketin <c15/> ilmaisee koordinaatiston vielä sanoin.

seg-be6362f4c7e7 = Yksi <c1/>, jossa on yksi <c2/> kutakin kohdeluokkaa kohden. Liikkuva kohde on <c3/>, joka sisältää kohteen <c4/>: yksi <c5/> näytettä kohden (ISO { "8601" } UTC) ja sitten yksi <c6/> näytettä kohden (pituusaste, leveysaste, korkeus). Paikat ovat kohteita <c7/>, jalanjäljet kohteita <c8/>, joiden rengas on suljettu ja vastapäivään kiertävä, ja aikaleimattomat jäljet kohteita <c9/>. Koordinaatit ovat World Geodetic System { "1984" } (WGS { "84" }) -pituus- ja leveysasteita desimaaliasteina ja korkeus metreinä WGS { "84" } -ellipsoidin yläpuolella, kirjoitettuina asetuksella <c10/> <c11/>. KML tulkitsee arvon <c12/> korkeudeksi keskimääräisen merenpinnan yläpuolella; ero, geoidin undulaatio, on noin ±{ "110" } m:n sisällä, eikä sitä sovelleta. Asiakirjan kuvaus kertoo tämän.

seg-37dc14626a6c = Yksi <c1/>. Paikat ovat <c2/> tai <c3/> — pituusaste ensin, kuten RFC { "7946" } vaatii — WGS { "84" } -asteina, korkeus metreinä ellipsoidin yläpuolella. Liikkuva kohde on <c4/>, jonka ominaisuus <c5/> sisältää yhden ISO { "8601" } -ajan kutakin paikkaa kohden; { "180" }° meridiaanin ylittävä jälki kirjoitetaan siihen katkaistuna kohteena <c6/>, kuten RFC { "7946" } §{ "3.1.9" } vaatii (ylityspiste interpoloidaan, ja <c7/> luettelee sen jälkeen vain alkuperäiset näytteet). Paikat ovat kohteita <c8/>, jalanjäljet kohteita <c9/>, joilla on suljettu vastapäivään kiertävä ulkorengas (§{ "3.1.6" }), ja aikaleimattomat jäljet kohteita <c10/>. Jokaisella kohteella on ominaisuus <c11/>, joka nimeää kunkin numeerisen jäsenen yksikön.

seg-ea28a2bd431c = Yksi tiedosto kutakin liikkuvaa kohdetta kohden, koska STK-efemeridi kuvaa yhtä ajoneuvoa. Otsikko antaa <c1/> (yhtä suuri kuin datarivien määrä), <c2/> (UTC, <c3/>), <c4/> ja <c5/>, <c6/>, <c7/> sekä <c8/>; rivit kohdan <c9/> alla ovat sekunteja epookin jälkeen, paikka metreinä ja nopeus metreinä sekunnissa GCRS:ssä. Kohtaus, jossa on vain kiinteitä paikkoja tai aikaleimattomia jälkiä, ei kirjoita tiedostoa <c10/>: kiinteä piste on STK Facility, ei efemeridi. Tunniste, joka ei ole pelkkä tiedostonimen osa (satelliittitähdistön kuori ja satelliitti, <c11/>), kirjoitetaan siten, että jokainen muu merkki on <c12/>, ja numeroidaan, jos kaksi tunnistetta sen jälkeen yhtyy.

seg-52a78be5db9f = Laji <c1/> ja laji <c2/> (vaiheensa <c3/> kautta) vievät jokaisen matalan Maan kiertoradan (LEO) satelliitin ja käyttäjän lajin omista propagaattoreista ja aikaruudukosta. Laji toimii koordinaatistossa ECI0, Maan keskipisteeseen kiinnitetyssä inertiaalikoordinaatistossa, joka on epookilla linjassa Maan mukana pyörivän koordinaatiston kanssa; jokainen näyte muunnetaan Maan mukana pyörivään koordinaatistoon omalla ajanhetkellään lajin Maan pyörimisellä ja sieltä GCRS:ään true equator, mean equinox (TEME) -koordinaatiston kautta, jossa Simplified General Perturbations { "4" } (SGP4) -propagaattori antaa tuloksensa, kyseisellä ajanhetkellä niin, että UT1 (yleisaika, Maan pyörimiskulma) on yhtä suuri kuin UTC ja napaliike jätetään huomiotta, kuten muissakin viennissä. Muut LEO-lajit kertovat, miksi muoto ei sovellu (alla oleva taulukko).

seg-b134baf33fba = Laji <c1/> vie jokaisen geometrian sisältävän jäsenskenaarion omana tiedostojoukkonaan, jäsenen nimike lisättynä ennen muodon päätettä: jokainen vaiheajo (<c2/> tai <c3/>, kun vaiheessa on useita ajoja), pyyhkäisyn peruskenaario (<c4/>), Monte Carlo -skenaario (<c5/>) ja jokainen koottu jäsen (sen nimike, siihen sidotut jaetut arvot kirjoitettuina mukaan). Komento <c6/> kirjoittaa tiedostot <c7/> ja <c8/>. Aiempaa vastaava jäsen kirjoitetaan kerran, ja arvot, jotka kampanja soveltaa ajon aikana (luovutukset, pyyhkäisyarvot, siemenluvut), eivät ole viedyssä jäsenessä. Muoto sopii kampanjaan, kun se sopii johonkin jäseneen; muuten syy on alla olevan taulukon huomautus { "4" }. Katso <a1>CAMPAIGNS.md</a1>.

seg-6579b6941d10 = Lajin <c1/> kuvahetki <c2/> — mallinnettu L-kaista piirrettynä kompleksisina näytteinä yhdellä ajanhetkellä — parina <c3/> / <c4/>, tietotyypillä, jonka <c5/> nimeää (<c6/> tai <c7/>). Se on sama tallenne, jonka ajo kirjoittaa ja lukee takaisin oman johdonmukaisuustarkistuksensa vuoksi: viety metatieto on sama kuin tulosasiakirjan lohko <c8/>, ja datatiedostolla on pituus <c9/>. Kirjoittaja on <c10/>, moduuli, jota laji <c11/> jo käytti; mitään ei ole kahdennettu.

seg-6e7c5f0e34f3 = Koordinaatistot ja aika

seg-01d1bedb0595 = Moottori propagoi TEME:ssä (todellinen päiväntasaaja, päivämäärän keskimääräinen kevättasauspiste), sen omassa koordinaatistossa. Liikkuvat kohteet kierretään GCRS:ään reduktiolla <c1/> (IAU { "2006" } -prekessio ja IAU 2000B -nutaatio, missä IAU on International Astronomical Union), joka toistaa Vallado julkaiseman TEME–GCRF-esimerkin (Geocentric Celestial Reference Frame) { "0.11" } m:n tarkkuudella, CZML:ää ja STK:ta varten, ja Maan mukana pyörivään koordinaatistoon reduktiolla <c2/> KML:ää ja GeoJSONia varten. Maan mukana pyörivä kierto on Greenwichin keskimääräinen tähtikulma, jossa UT1 on yhtä suuri kuin UTC eikä napaliikettä sovelleta — sama reduktio, jota SP3-vienti (Standard Product { "3" }) käyttää. GPS-kiertoradan säteellä huomiotta jätetty UT1−UTC, enintään { "0.9" } s, siirtää satelliitin pituusastetta enintään noin { "1.7" } km; maapaikat eivät kärsi tästä, koska ne annetaan leveys- ja pituusasteena.

seg-4eaa7b3e6946 = Laji <c1/> on poikkeus: sen moottoritulos sisältää jo GCRS- ja Maan mukana pyörivät paikat (skenaarion UT1−UTC- ja napaliikearvoilla tai todellisella International Earth Rotation and Reference Systems Servicen (IERS) sarjalla), ja ne kirjoitetaan muuttamattomina.

seg-2299da743a4c = Jokainen aika on UTC. Karkaussekunteja ei mallinneta: karkaussekunnin yli menevä poikkeama lasketaan niin kuin jokaisessa päivässä olisi { "86 400" } s, kuten moottorin aikaruudukot laskevat.

seg-4f7a0b8b4358 = Epookki <c1/> on sama, jota lajin ajo käyttää, ja jokainen tiedosto nimeää sen: lajin <c2/> kenttä <c3/>; kun sitä ei ole, varhaisin epookki, jonka satelliittien omat tiedot sisältävät (kaksirivisen orbitaalielementtijoukon (TLE) epookki, lähetetyn efemeridin vertailuaika, SP3-tiedoston alku), ja 2000-01-01T00:{ "00" }:00Z vain silloin, kun yksikään satelliitti ei sisällä sitä (Keplerin elementit). SP3- ja OEM (Orbit Ephemeris Message) -viennit pitävät arvon 2000-01-01T00:{ "00" }:00Z skenaariolle, jolla ei ole kenttää <c4/>, joten tällaisen skenaarion kohdalla niiden päivämäärät eroavat näistä tiedostoista. Kun skenaariolla ei ole kenttää <c5/>, jokainen satelliitti, jolla on oma epookkinsa, kierretään GCRS- ja Maan mukana pyöriviin koordinaatistoihin omalla ajanhetkellään (sen epookki plus <c6/>), koska se on päivämäärä, johon sen TEME-paikka kuuluu; kun satelliittien epookit eroavat, jaetut aikamerkinnät noudattavat moottorin oletusta, että jokainen satelliitti alkaa hetkellä <c7/>, ja tiedosto kertoo, kuinka monta tuntia ne eroavat. Lajien <c8/> ja <c9/> Walker-satelliittitähdistöjen SGP4-elementtiepookki (2018-06-12T00:{ "00" }:00Z), jota niiden ajot käyttävät myös Maan pyörimiseen; lajin <c10/> kenttä <c11/>; lajin <c12/> kenttä <c13/> tai TLE-epookki. Lajilla <c14/> ei ole kalenteriepookkia; sen vienti ajoittaa hetken <c15/> kuten kiertorata-skenaario, jolla sitä ei ole.

seg-ee8eeb47f41b = Satelliitit pitävät paikkaan perustuvat tunnisteet <c1/>, <c2/>, ... jotka SP3- ja OEM-viennit antavat niille, koska propagaattorit eivät kanna TLE-nimirivejä.

seg-0491624c5f12 = Tuonnit

seg-798f3ae1b77d = GeoJSON-reitti.

seg-2a04d7d4bafc = <c1/> (kirjasto: <c2/>) lukee GeoJSON-asiakirjan ensimmäisen kohteen <c3/> — pelkän geometrian, <c4/>-kohteen tai <c5/>-kohteen — ja kirjoittaa sen lajien <c6/>, <c7/>, <c8/> ja <c9/> jälkisyötteisiin (<c10/>, <c11/>, <c12/>, <c13/>, <c14/>) ennen ajoa. Nämä lajit lentävät kaavaa <c15/>, joten reitti hyväksytään, kun se on täsmälleen sellainen: sen kaksi päätä (skenaarion kentän <c16/> määrä säilytetään) tai kolme tai useampi paikkaa tasavälein suoralla viivalla leveys- ja pituusasteessa { "1e-7" } asteen (noin { "1" } cm) tarkkuudella. Mikä tahansa muu reitti hylätään, ja virhe nimeää paikan, joka on kauimpana viivasta. Reitti lajille, jolla ei ole lentoratasyötettä, hylätään tällä syyllä. Pituus- ja leveysasteen arvoalueet tarkistetaan, mikä havaitsee leveysaste edellä -tiedoston.

seg-be9fddebd47a = <b>SigMF-tallenne.</b> Lajin <c1/> lohko <c2/> lukee parin <c3/> / <c4/> tiedoston <c5/> kautta ja piirtää sen Welch-estimaatin mallin viereen (katso <a1>SPECTRUM.md</a1>). Tiedostojen lukeminen on natiiviversion ominaisuus; WebAssembly-versio ottaa tavut funktion <c6/> kautta.

seg-f1ca9cee1065 = Miten viennit tarkistetaan

seg-afe73c19e369 = <c1/> jäsentää jokaisen viennin validaattorilla, joka on kirjoitettu muodon määrittelystä, ei kirjoittajan oman koodin avulla:

seg-bdc892a450c0 = CZML: JSON-taulukko, jonka ensimmäinen paketti on asiakirjapaketti, jossa on <c1/>; yksilölliset pakettitunnisteet; jokainen paikka ilmoittaa <c2/> <c3/> tai <c4/>; näytteistetyt paikat ovat <c5/>, joissa on ISO { "8601" } -epookki ja kasvavat ajat.

seg-a28abb42c103 = KML: hyvin muodostettu XML-asiakirja (Extensible Markup Language) OGC KML { "2.2" } -nimiavaruudessa, jossa on yksi juurikohde; skeeman elementtijärjestys Placemarkin sisällä; enintään yksi geometria Placemarkia kohden; suljetut lineaarirenkaat, joissa on neljä tai useampi paikka; monikot <c1/> arvoalueella; kelvolliset arvot kentälle <c2/>; kohteet <c3/>, jotka ratkeavat; <c4/>, jossa on yhtä monta <c5/> kuin <c6/>, ja laajennuksen nimiavaruus ilmoitettuna.

seg-8e0f4e4c2309 = GeoJSON: pituusaste ensin ja arvoalueella, leveysaste arvoalueella, kaksi tai kolme lukua paikkaa kohden, viivamuodot, joissa on kaksi tai useampi paikka, suljetut vastapäivään kiertävät ulkorenkaat, ei { "180" }° meridiaanin yli menevää segmenttiä, ei jäsentä <c1/>, ominaisuus <c2/> jokaisella kohteella.

seg-57bf7f9291e1 = STK: versiorivi <c1/>, lohko <c2/> / <c3/> vaadituilla avainsanoilla, <c4/>, <c5/> yhtä suuri kuin datarivien määrä, seitsemän lukua riviä kohden, kasvavat ajat.

seg-e474c11480d8 = SigMF: <c1/> ja <c2/> kohdassa <c3/>, taulukot <c4/> ja <c5/>, <c6/> jokaisessa tallenteessa ja datatiedosto, jossa on kokonaisia näytteitä.

seg-82b7b39e7cad = Rakenteen lisäksi CZML:ään ja STK:hon viety satelliitti verrataan moottorin omaan tilaan saman koordinaatistoreduktion jälkeen, ja ne täsmäävät { "1" } mm:n tarkkuudella paikassa (tiedostot sisältävät { "0.1" } mm): lajin <c1/> omaa GCRS-tulostetta vastaan sekä satelliittitähdistön <c2/> riippumatonta TEME–GCRS-propagointia vastaan, kukin satelliitti ajoitettuna oman skenaariotekstistä luetun TLE-epookkinsa mukaan. Kaksi tarkistusta menee moottorin ulkopuolelle: CZML-paikat ensimmäiselle satelliitille <c3/> täsmäävät { "0.1" } m:n tarkkuudella (mitattu { "2.3" } cm) saman TLE:n kanssa, jonka Python-paketti <c4/> propagoi ja ERFA (Essential Routines for Fundamental Astronomy, IAU:n SOFA-kirjaston avoin toteutus) reduktoi GCRS:ään, ja satelliittien <c5/> Maan mukana pyörivät paikat ovat yhtä suuret kuin Global Positioning Systemin rajapintamäärittelyn lähetettyjen efemeridien paikat { "1" } mm:n tarkkuudella. Viennin <c6/> Maan mukana pyörivät paikat verrataan paikkoihin, jotka jamming-ajo pisteyttää, { "5" } mm:n tarkkuudella. GeoJSON-reitti kiertää lentorataskenaarion kautta edestakaisin, SigMF-pari luetaan takaisin samoiksi tavuiksi, ja jokainen vienti on tavutasolla deterministinen.

seg-20fbf9a3fba7 = Nämä ovat tarkistuksia julkaistuja määrityksiä ja moottoria itseään vastaan. Tiedostoja ei ole ladattu CesiumJS:ään, Google Earthiin, Ansys STK:hon tai SDR-työkaluun osana testisarjaa, joten tiettyjen näiden työkalujen versioiden hyväksyntää ei testata täällä.

seg-7349c09206ac = Kiertoradan, asennon ja ytimen tiedonvaihto (kirjasto, { "0.36" })

seg-d5e34188aa96 = Muotojen <c1/> lisäksi { "0.36" } lisäsi kirjastolukijat ja -kirjoittajat tehtäväanalyysityökalujen vaihtamille vakiotiedostoille. Ne ottavat ja palauttavat tekstiä tai tavuja eivätkä käytä tiedostoja. Jokainen on VALIDATED-rivi <a1>varmennusmatriisissa</a1>, verrattuna siinä nimettyyn riippumattomaan toteutukseen:

seg-cd8b6f2d43be = <b>CCSDS Orbit Data Messages</b> (<c1/>, XML-muotoa varten <c2/>): OPM, OMM ja OCM avain-arvo-notaatiossa (KVN) ja NDM/XML:nä, CCSDS 502.0-B-3:n mukaan (OPM ja OMM versiot { "3.0" } ja { "2.0" }, OCM { "3.0" }). Tarkistettu molempiin suuntiin Orekitia vastaan: Orekit lukee Kshanan tiedostot ja Kshana lukee Orekitin tiedostot. Jäljelle jäävät havainnot on kiinnitetty testeillä.

seg-00b9fc226c06 = <b>CCSDS Attitude Data Messages</b> (<c1/>, <c2/> mukana): AEM ja APM CCSDS 504.0-B-2:n mukaan, KVN:nä ja NDM/XML:nä. Tarkistettu Orekitia vastaan samalla tavalla, ja tietueiden kierrot Orekitin kiertoja vastaan.

seg-b8aa23f78f9e = <b>SPICE SPK</b> (<c1/>): NAIF SPK -segmenttien kirjoittajat ja lukijat tyypeille { "9" } ja { "13" } (mukaan lukien CCSDS OEM:n vienti SPK-ytimeksi) sekä tyypeille { "3" } ja { "21" } (Chebyshev-polynomit ja laajennetut erotusrivit), tarkistettuna NAIF SPICE -työkalupaketin omia lukijoita vastaan tavutason identtisyyteen asti. Kshana kirjoittaa segmentit annetuista tietueista: se ei sovita Chebyshev-kertoimia eikä tuota erotusrivejä.

seg-bb97cbb1ab9f = CCSDS OEM -tuoja ja -kirjoittaja sekä OEM-kovarianssilohko ovat vanhempia, ja ne kuvataan yllä olevien tuontien alla ja matriisissa.

seg-8932eba75c68 = Vain alla olevan taulukon lajit vievät geometriaa. Lajeja, joiden geometria on keskitetty Kuuhun, Marsiin tai muuhun kappaleeseen, ei viedä: CZML, KML ja GeoJSON kuvaavat paikkoja Maan ympärillä, ja tämä julkaisu kirjoittaa STK-tiedostoja vain asetuksella <c1/>, vaikka STK-muoto itse sallii muitakin keskuskappaleita.

seg-a0593ad77202 = Lajeilla <c1/>, <c2/> ja <c3/> on Maahan sidottua geometriaa, jota tämä julkaisu ei vie; taulukko antaa syyn kullekin.

seg-2bb9237839f3 = Laji <c1/> lentää lentoratansa litteällä paikallisella tangenttitasolla, joten vain tason origo viedään, ei lentorataa.

seg-6049ab4ca3c9 = Maan mukana pyörivät satelliittipaikat jättävät huomiotta UT1−UTC:n ja napaliikkeen (katso Koordinaatistot ja aika); KML-korkeudet ovat ellipsoidisia, eivät keskimääräisen merenpinnan yläpuolella.

seg-4dda05aefd2b = Jalanjäljet olettavat vapaan tilan etenemisen, häirintälähettimen vastaanottimen horisontissa ja pallomaisen Maan ympyrää varten.

seg-2dd0656c518f = Jokainen skenaariotiedosto

seg-e024f5c1cab1 = Mitä <c1/> tekee kullekin tiedostolle hakemistossa <c2/> (sarjan manifesti ei ole skenaario, ja se on jätetty pois). ”kyllä” tarkoittaa, että muoto kirjoitetaan ja se läpäisee validaattorinsa; muuten numero osoittaa syyn. Tuottaa <c3/>; <c4/> epäonnistuu, kun se on vanhentunut.

seg-c27f67dfbb37 = ei [{ "1" }]

seg-3468244e2385 = ei [{ "2" }]

seg-d0cf3f74cd10 = ei [{ "3" }]

seg-62c880979169 = ei [{ "4" }]

seg-9229b499c702 = ei [{ "5" }]

seg-d9d6561c9e5b = ei [{ "6" }]

seg-7d4a6538c638 = ei [{ "7" }]

seg-f170ed4d8dca = ei [{ "8" }]

seg-1c5eb5dca942 = ei [{ "9" }]

seg-a930bb0d2e42 = ei [{ "10" }]

seg-236853169f42 = ei [{ "11" }]

seg-411e4f3aeae7 = ei [{ "12" }]

seg-34fabcbb82f2 = ei [{ "13" }]

seg-772bd344bbce = ei [{ "14" }]

seg-460fd74c7c7e = ei [{ "15" }]

seg-e1d91ce54b8b = ei [{ "16" }]

seg-f3e0486f02e3 = ei [{ "17" }]

seg-884160b0ed12 = ei [{ "18" }]

seg-8202f4a426b0 = ei [{ "19" }]

seg-a4e9a36289e5 = ei [{ "20" }]

seg-034364e38105 = ei [{ "21" }]

seg-3e3b6ecc7b43 = Miksi muoto ei sovellu:

seg-d7bd20cb8710 = lajit <c1/> ja <c2/> suunnittelevat alalinkin yhteydet ja koodauksen; vie skenaario <c3/> samalle satelliitille ja asemalle nähdäksesi geometrian

seg-f587b4df1635 = SigMF sisältää kompleksisia kantataajuisia näytteitä, joita vain laji <c1/> synteesoi

seg-d102fb18ce8d = laji <c1/> simuloi asentoa massakeskipisteen ympäri ilman kiertorataa tai maapaikkaa, joten Maahan ei ole mitään sijoitettavaa

seg-ecc0e31b0369 = skenaarion syöte ei sisällä vaakasuuntaista paikkaa (ei leveys- ja pituusastetta, ei Maan keskipisteeseen sidottuja koordinaatteja, ei kiertorata-elementtejä korkeutta lukuun ottamatta), joten Maahan ei ole mitään sijoitettavaa

seg-2e0825b27359 = lajit <c1/> ja <c2/> laskevat budjetteja ilman Maan paikkaa

seg-1f17b963c7a6 = STK-efemeridi kuvaa ajoneuvon paikkaa ja nopeutta ajan funktiona; tässä kohtauksessa on vain kiinteitä pisteitä tai aikaleimattomia jälkiä (kiinteä piste on STK Facility, ei efemeridi)

seg-f79d0ce7b945 = kampanjan millään jäsenskenaariolla ei ole mitään, mitä tämä muoto kuvaa; vie jäsen yksinään nähdäksesi sen syyn

seg-08b7e027318a = laji <c1/> analysoi signaalisuunnitelmia (spektrit, seuranta, kaappaus, yhteensopivuus) ilman satelliitin tai käyttäjän paikkaa; vie skenaario <c2/> tai <c3/>, joka lentää suunnitelman

seg-31c8acef1aed = ei viedä tässä julkaisussa: yhdistetyt paikannuslajit sijoittavat satelliittinsa Maan mukana pyörivään koordinaatistoon epookkiin nähden, jota ne eivät koskaan nimeä, joten aikaleimatun viennin pitäisi keksiä kalenteripäivämäärä (vie sen sijaan skenaario <c1/> tai <c2/>)

seg-3c57b084f0d7 = lajin geometria on keskitetty Kuuhun, Marsiin tai muuhun aurinkokunnan kappaleeseen; CZML, KML ja GeoJSON kuvaavat paikkoja Maassa tai sen ympärillä, ja tämä julkaisu kirjoittaa STK-efemeridit vain asetuksella CentralBody Earth

seg-2edebe91839c = ei viedä tässä julkaisussa: <c1/> sijoittaa satelliittinsa kappaleen mukana pyörivään koordinaatistoon epookkiin nähden, jota se ei koskaan nimeä, joten aikaleimatun viennin pitäisi keksiä kalenteripäivämäärä

seg-951ac7c5f138 = ei viedä tässä julkaisussa: lajin <c1/> Maan Global Navigation Satellite System (GNSS) -satelliittitähdistöä katsotaan Kuun etäisyydellä olevasta vastaanottimesta, jonka lentorataa laji ei tarjoa aikasarjana

seg-3cf7f7460c55 = ei viedä tässä julkaisussa: laji <c1/> raportoi huippukuormat ja kuumenemisen eikä pidä aikaleimattua maanpintajälkeä

seg-cfc3df59e5c8 = laji <c1/> pyyhkäisee saatavuutta ja linkin voimakkuutta käyttäjälle kuorella tai Keplerin lentoradalla; sillä ei ole yhtä paikkaa, jonka voisi sijoittaa kartalle

seg-6271953188bd = skenaario <c1/> antaa laukaisupaikan leveysasteen mutta ei pituusastetta, joten paikkaa ei voi sijoittaa

seg-c9a63dfb34db = ei viedä tässä julkaisussa: lajin <c1/> totuusrata on sovitusviite, jonka Maan pyörimiskulma epookilla on syöte (<c2/>, oletus { "0" }), eikä sitä johdeta kalenteripäivämäärästä, joten sen Maan mukana pyörivät paikat eivät ole sidottuja päivämäärään

seg-a03c2f0426db = tässä spektriskenaariossa ei ole lohkoa [iq], joten tallennettavia näytteitä ei synteesoida

seg-d75f8ad6903a = ei viedä tässä julkaisussa: <c1/> lukee ja kirjoittaa CCSDS (Consultative Committee for Space Data Systems) Orbit Ephemeris Messagen, joka on itse efemeridin tiedonvaihtotiedosto

seg-fdbaf96ecf3e = laji <c1/> laskee linkkitilastoja maa-asemille, joilla ei ole aikaleimattua geometriaa sijoitettavaksi

seg-146a2e8ee590 = skenaario pyyhkäisee toista skenaariota ruudukon yli; vie pyyhkäisty skenaario yksinään

seg-b74484e3586b = laji <c1/> laskee linkkibudjetin ja vakaudet ilman aikaleimattua geometriaa sijoitettavaksi

seg-bcd613e62c69 = <s1>Edellinen</s1>Animaatiovienti

seg-0525f7fbbfd2 = <s1>Seuraava</s1>Validointitila

seg-53a778722c16 = STK .e
