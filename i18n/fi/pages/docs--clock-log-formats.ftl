# docs--clock-log-formats: translations (fi)

seg-ca2fcdd60f65 = Lähde: <c1/>

seg-0dfd1160c5d7 = Kellolokien formaatit

seg-f52a62872493 = <c1/> lukee mitatun kellolokin yhdeksi normalisoiduksi vaihesarjaksi: tasavälinen <c2/>-näytteiden ruudukko, jossa näytteenottoväli <c3/> on annettu tai löydetty, jokainen aukko lasketaan ja lokin yksiköt nimetään. Kahdeksan formaattia luetaan, kukin dokumentoituna osajoukkona. Kaikki osajoukon ulkopuolinen hylätään virheellä, joka nimeää löydetyn, eikä sitä lueta likimääräisesti.

seg-dbdbfec37ab6 = <b>Lyhenteet.</b> RINEX on Receiver Independent Exchange Format. TICC on TAPR:n (Tucson Amateur Packet Radio) aikavälilaskin. ADEV on limittäinen Allanin poikkeama, TDEV aikapoikkeama ja MTIE suurin aikavälivirhe. <c1/> on näytteenottoväli sekunteina.

seg-1d5a6c2090af = Missä lokia voi käyttää

seg-2a391645eeeb = <b><c1/></b>: <c2/> korvaa kentän <c3/> tai <c4/>. Lokin vaihe, yksikkönä ns, on aikavirhesarja, jota verrataan maskeihin, ja raporttiin lisätään lohko <c5/>, joka kertoo, miten loki luettiin.

seg-4c2a67008451 = <b>Kellolaji</b>: taulukko <c1/> lisää ajoon lohkon <c2/>: miten loki luettiin, taulukon SHA-256 (<c3/>; ajon <c4/> ei kata taulukkoa) ja vaihenäytteiden tiiviste sekä limittäinen ADEV, TDEV ja MTIE oktaavikeskiarvoistuskertoimilla. Se vaatii <c5/>. Simuloitu holdover pysyy ennallaan.

seg-2f464fe709c9 = Ilman taulukkoa molemmat lajit jäsennetään, tiivistetään ja raportoidaan täsmälleen kuten ennenkin.

seg-c931c5ec2f4a = Formaatit

seg-0b758195e7eb = <b><c1/></b>: TimeLab-tyyliset ASCII-vaihe- tai taajuuslokit, selväkielinen muoto, jonka TimeLab vie ja jonka sen ASCII-tuonti ja Stable32 lukevat. Rivillä on yksi lukema: joko yksi sarake tasavälillä <c2/> tai kaksi saraketta <c3/>. Sarakkeet voi erottaa tyhjemerkeillä, pilkuilla tai puolipisteillä.

seg-a7ae9e712bea = Rivit, jotka alkavat merkillä <c1/>, <c2/> tai <c3/>, ovat kommentteja. Muotoa <c4/> (tai <c5/>) oleva kommentti asettaa arvon <c6/> (s), <c7/> (<c8/>, <c9/>, <c10/>, <c11/> tai <c12/>, vaiheelle), <c13/> (<c14/> tai <c15/>) tai <c16/> (<c17/> tai <c18/>, kahden sarakkeen ensimmäiselle).

seg-84cf463d5e74 = Yksi alussa oleva ei-numeerinen rivi tulkitaan sarakeotsikoksi.

seg-84f4b59bcdbf = Taajuusdata (suhteellinen taajuus) hyväksytään vain yhtenä sarakkeena. Se integroidaan vaiheeksi muodossa <c1/> (NIST SP { "1065" }, { "2008" }, §{ "4.1" }).

seg-8cc445eb84f3 = TimeLabin binääri- ja projektitiedostoja (<c1/>) ei lueta.

seg-3af6e4e7bc73 = Aikaleimatilan rivit (<c1/>, <c2/>) ja TimeLab-tilan pseudoaikaleimakanava (<c3/>) ovat tapahtuma-aikaleimoja. Valitun kanavan vaihe on sen aikaleima miinus nimellinen tikitys: <c4/>, missä <c5/> on ensimmäisen tapahtuman jälkeen kulunut kokonaislukumäärä jaksoja <c6/>. Puuttuva tapahtuma on aukko.

seg-cecf9df4ff10 = Välitilan rivit (<c1/> tai mikä tahansa tunniste, joka alkaa <c2/>) luetaan suoraan vaiheeksi, yksi lukema jokaista väliä <c3/> kohden. Skenaarion on ilmoitettava <c4/>, koska rivi ei sisällä aikaa.

seg-5ec2509907dd = Rivit, jotka alkavat merkillä <c1/>, sekä rivit, jotka eivät ole muotoa <c2/> (kuten käynnistysvalikko), ohitetaan ja lasketaan.

seg-cb4b7062dd5a = linuxptp- ja chrony-lokit

seg-c6c70813a988 = Nämä viisi formaattia lukevat sen, mitä käynnissä oleva aikademoni kirjoittaa omasta kellostaan. Ne on tarkoitettu ajoitusketjun tarkistamiseen jälkikäteen (boundary clock, grandmaster-kellon PHC, chrony-asiakas) samoilla estimaattoreilla kuin muut lokit. Ne eivät lue demonin asetuksia, eikä mikään tässä keskustele demonin kanssa.

seg-e1f85ff146d2 = <b><c1/></b>, <b><c2/></b>, <b><c3/></b>: linuxptp:n servorivit, kukin formaatti lukee vain oman ohjelmansa rivejä. Lukema on seuraavan muotoinen rivi

seg-e32842403b6b = Aikaleima on rivin ensimmäinen <c1/> (demonin monotoninen kello). Se luetaan myös syslog-etuliitteen jälkeen, jossa prosessitunnus kuten <c2/> ei sisällä desimaaliosaa eikä sitä oteta.

seg-72678cd6c03e = Vaihe on kirjattu arvo <c1/> nanosekunteina, muunnettuna sekunneiksi. Se on demonin mittaama orjakellon aikavirhe viitettään vastaan sellaisena kuin se on kirjattu: positiivinen, kun orja on edellä. Se on servo-ohjauksen jälkeen jäljelle jäävä virhe, ei vapaasti käyvän kellon ajautuminen.

seg-f9080412572a = Aikaleiman ja sanan <c1/> väliset sanat nimeävät lähteen (<c2/>, <c3/> etuliitteelle <c4/>, <c5/>, <c6/>). Loki, jossa on useampi kuin yksi lähde, tarvitsee <c7/>; virhe listaa ne.

seg-5bef874341f2 = Lukemat ennen kuin servo ensimmäisen kerran ilmoittaa tilan <c1/> (lukittu) jätetään pois ja lasketaan kenttään <c2/>: <c3/> ja <c4/> ovat lukitsematon ja askeltila, joiden poikkeamat ovat sisäänvetotransientteja. Servo, joka ei koskaan saavuta tilaa <c5/>, hylätään. Rivi, jossa ei ole tilakenttää, luetaan sellaisenaan.

seg-121fbe1486cf = Yhteenvetorivit (<c1/>), viestit <c2/> ja <c3/> sekä muiden ohjelmien rivit ohitetaan ja lasketaan.

seg-92164f4a56be = Taaksepäin menevät aikaleimat (uudelleenkäynnistetty demoni) hylätään; jaa loki osiin.

seg-d86fd2a815d8 = <b><c1/></b>, <b><c2/></b>: chronyn tiedostot <c3/> ja <c4/>, luetaan sarakepaikan mukaan. Lukema on rivi, jossa on vähintään { "14" } saraketta (tracking) tai { "13" } (statistics) ja joka alkaa UTC-päivämäärällä ja -ajalla muodossa <c5/>. Sarakeotsikkorivi ohitetaan ja lasketaan; sen alla oleva viiva <c6/> ohitetaan laskematta.

seg-bae4f6895d14 = Tracking: sarake { "7" }, paikallinen poikkeama kellon päivityksessä, sekunteina. IP-osoite tai viitetunnus vaihtuu valitun lähteen mukana, joten ilman <c1/> jokainen rivi luetaan yhtenä paikallisena kellona. <c2/> säilyttää yhden viitetunnuksen.

seg-12b284cd7d8c = Statistics: sarake { "5" }, lähteen arvioitu poikkeama sekunteina. Jokaista lähdeosoitetta kohden on yksi sarja, ja loki tarvitsee <c1/>, jos siinä on useampi kuin yksi.

seg-197645e3c7c5 = Epookit ovat sekunteja hetkestä 1980-01-06 { "00" }:{ "00" }:{ "00" } UTC, ilman karkaussekuntien käsittelyä. Chrony kirjoittaa rivin jokaista päivitystä tai lähdenäytettä kohden, joten väli ei ole tasainen. <c1/> on mediaaniväli; lukema, joka tulee alle puolta <c2/> aikaisemmin säilytetyn lukeman jälkeen, pudotetaan ja lasketaan kenttään <c3/>, ja pidempi väli on aukko, jonka asetus <c4/> raportoi. Anna <c5/> ja <c6/> lokille, jonka kyselyväli on vakaa.

seg-61fbb0479c95 = Chronyn sarakkeet ja linuxptp:n rivirakenteet ovat demonien julkisen dokumentaation mukaisia. Hakemiston <c1/> fixturet on kirjoitettu Kshanaa varten keksityin arvoin (ks. <c2/>); mitään todellista lokia ei ole luettu, joten rakenne, joka eroaa demonin versioiden välillä, voidaan silti hylätä tai tulkita väärin. Riviä, joka ei täsmää, ei arvata, vaan se ohitetaan ja lasketaan.

seg-b120a37b7d60 = <c1/> ja aukot

seg-6fd68aad2fd7 = Kun lokissa on aikaleimat eikä arvoa <c1/> ole annettu, <c2/> on peräkkäisten aikaleimojen mediaaniväli pyöristettynä neljään merkitsevään numeroon, ja lähteeksi raportoidaan <c3/>. Laskurin väli poikkeaa nimellisestä viitteen taajuuspoikkeaman verran, osia per { "10" }^{ "6" } tai vähemmän. Skenaarion arvo <c4/> voittaa aina (lähde <c5/>), sitten otsikkokommentti <c6/> (lähde <c7/>).

seg-59e52611a7d3 = Näytteet sijoitetaan ruudukkoon <c1/>, ja puuttuva epookki on aukko. Lukemat, jotka poikkeavat ruudukosta yli { "1" } % arvosta <c2/>, pudotetaan ja lasketaan, samoin kaksoiskappaleet (ensimmäinen säilytetään). Aukkokäytäntö on jokin seuraavista:

seg-61b1664a7c48 = <c1/> (oletus): mikä tahansa aukko on virhe, joka laskee aukot;

seg-593c998b65e0 = <c1/>: säilytetään pisin aukoton jakso;

seg-f184ce746389 = <c1/>: täytetään sisäiset aukot lineaarisella interpoloinnilla ja raportoidaan täytettyjen määrä.

seg-1f3dc3429615 = Estimaattorit tarvitsevat aukottoman aineiston, minkä vuoksi aukot ratkaistaan tässä.

seg-0f061f726ec5 = <s1>Edellinen</s1>Holdover-testi ja ajoituslaitteisto silmukassa

seg-3c89cfcbbd04 = <s1>Seuraava</s1>Laitteiston turvallisuus

seg-9b52cd5eb4be = tau0 ja aukot

seg-9c8042f0d3d7 = <b><c1/></b>: RINEX-kellotiedostot, versiot { "2.00" } ja { "3.00" }–{ "3.04" } (mukaan lukien version { "3.04" } yhdeksänmerkkinen nimikenttä). Tietue <c2/> tarkistetaan ja mikä tahansa muu versio hylätään nimeämällä löydetty versio: IGS julkaisee kelloformaatin (<c3/>, <c4/>, <c5/>) versioon { "3.04" } asti, ja dokumentit RINEX { "4.00" }, { "4.01" } ja { "4.02" } määrittelevät vain havainto-, navigointi- ja meteorologiset tiedostot, joten kellotiedostosta ei ole luettavaa versiota { "4.00" }. Otsikosta luetaan vain <c6/>, ja se ohitetaan rivin <c7/> saakka. Datatietueista säilytetään vain yhden kellon tietueet tyypeistä <c8/> (satelliitti) ja <c9/> (vastaanotin tai asema), valittuna nimen perusteella. Niiden ensimmäinen arvokenttä, kellon harha sekunteina, on vaihe. Jatkorivit ja tietueet <c10/>, <c11/> ja <c12/> ohitetaan. Epookit ovat tietueen kalenterikentät sekunteina hetkestä 1980-01-06 { "00" }:{ "00" }:{ "00" } tiedoston omassa aikajärjestelmässä ilman muunnosta.

seg-b65f4a928891 = <b><c1/></b>: TAPR TICC -laskurin lokit (TICC Operation Manual, revisiot { "23" }. marraskuuta { "2016" } ja { "15" }. joulukuuta { "2025" }, ”measurement modes”). Jokainen datakenttä on sekunteja { "12" } desimaalin tarkkuudella ({ "11" } oletuksena laiteohjelmistosta { "20251101" } alkaen: mikä tahansa määrä { "15" } asti luetaan). Aikaleima luetaan desimaalitekstistään kokonaislukuna femtosekunteja, ei binäärisenä liukulukuna, joten laskurin käynnistyksen jälkeen päiviä otetun lokin vaihe säilyttää laskurin oman erotuskyvyn: tyypin <c2/> aikaleiman väli arvolla { "3.0e5" } s on { "5.8e-11" } s, noin laskurin { "60" } ps.

seg-bb51bfa2a834 = Paired Timestamp -tila tulostaa samat rivit kanavajärjestyksessä ja luetaan Timestamp-tilana; 3-Corner Hat -tila lisää synteettisen kanavan <c1/>, joka luetaan kuten yllä.

seg-220bc7450e83 = Jaksotilan ja Debug-tilan tuloste hylätään. Kanava, jonka lukemat eivät kasva, raportoidaan jaksotilana. Binäärinen Timestamp-tila ei ole tekstiä, ja sen tiedosto hylätään viestillä, joka kertoo sen.

seg-1138c53b3eac = Oma kello

seg-1f9cce016fa0 = Kellotyypin taulukko <c1/> raportoi, kuinka vakaa oma kello oli, simulaation rinnalla: <c2/> (<c3/>) on <c4/>, johon on lisätty IGS-satelliittikellon 96 lukeman ote rivinsisäisenä TimeLab-lokina. Korvaa <c5/> avaimilla <c6/> ja <c7/> omaa tiedostoa varten. Lohko <c8/> tuloksessa sisältää sen, miten loki luettiin (formaatti, <c9/> ja mistä se tuli, jokainen aukko) sekä sen ADEV, TDEV ja MTIE; se ei muuta simulaatiota.

seg-584564d1a734 = Holdoverin ajaminen omalla kellolla: <c1/>

seg-56799b5fea19 = Loki sovitetaan tiedoston <c1/> laitekorttimenettelyllä (ehdollistaminen, neliöllinen termi poistettu, lag-1-kohinan tunnistus, painotettu pienimmän neliösumman menetelmä white PM-, white FM-, flicker FM- ja random-walk FM -kohinoilla keskiarvoistusajoilla, joilla on vähintään { "30" } vapausastetta). Nimetty kello ottaa sitten arvot <c2/>, <c3/>, <c4/> ja sovitetun <c5/>; <c6/> pysyy sellaisena kuin skenaariossa on, koska loki sisältää viitteensä siirtymän, ei kellon siirtymää kurinalaistuksen jälkeen. Valkoinen vaihekohina sovitetaan ja raportoidaan mutta sitä ei simuloida. Tulos saa lohkon <c7/> (kertoimet, sovituspisteet, ajon käyttämät arvot, mikä jätettiin pois, lokin SHA-256) ja kello saa tunnisteen <c8/>. Arvolla <c9/> ensemble ottaa otoksensa sovitetusta kellosta (lohko <c10/> vaatii arvon <c11/>). Sovitus ilman taajuuskohinaa, liian lyhyt loki sovitettavaksi ja avain <c12/>, jonka arvo ei ole <c13/> eikä <c14/>, ovat virheitä, jotka sanovat niin. <c15/> on esimerkki ({ "6" } tuntia IGS-satelliittikelloa).

seg-fe695061eed3 = Mitä vertailu tunnetulla kohinalla (<c1/>) osoittaa ja mitä pitää muistaa:

seg-90657795ba62 = Täyttyi: white-FM-taso palautetaan tarkkuudella { "5" } % jokaisella synteettisellä tietueella, jossa se on; sovitettu kortti toistaa todellisen Allanin poikkeaman kertoimen { "1.35" } sisällä jokaisella keskiarvoistusajalla, jolla se sovitettiin; sovituksen tunnistama kohinaeksponentti on sama kuin allantoolsin joka pisteessä (5071A-tietueella sen jälkeen, kun ehdollistamisen poistama vaiheaskel poistetaan myös allantoolsin syötteestä).

seg-f1ec27a393ae = <b>Ei täyttynyt, ja testi kiinnittää sen:</b> random-walk FM palautetaan vain, kun se hallitsee tietueen pisimpiä keskiarvoistusaikoja, ja silloinkin vain yhdessä kolmesta { "131 072" } s sarjan tietueesta; ylityskohdalla { "3 000" } s sovitus antoi sen flicker FM:lle ja ajautumalle. Random-walk FM:n ja flicker FM:n jako ei ole luotettava yhdestä tietueesta. Ajo toistaa lokin vakauden niillä keskiarvoistusajoilla, jotka loki kattaa; niiden ulkopuolella kaksi valintaa eroavat (flicker FM on vakio lattia, random-walk FM kasvaa keskiarvoistusajan neliöjuurena).

seg-88ba5ae782d4 = MODELLED: vaihtoehtotarkastelu kellon kohinalle sellaisena kuin loki sen näyttää, ei kellon kalibrointi eikä ennuste sen tulevasta käyttäytymisestä.

seg-6e88b597bbf0 = Virheellinen loki on virhe, joka nimeää löydetyn (rivin, version, puuttuvan valitsimen), ei koskaan osittainen tulos: <c1/> kiinnittää { "24" } tällaista tapausta.

seg-4a05abb27420 = MODELLED. Tämä on jäsennin, ja sen tuloste syöttää estimaattoreita, jotka on validoitu muualla allantoolsia vastaan. Tiedoston <c1/> yksikkötestit käyttävät pieniä käsin kirjoitettuja lokeja, ja linuxptp- ja chrony-formaateille hakemiston <c2/> fixtureja. <c3/> ajaa tiedostossa <c4/> ennakkorekisteröidyn vertailun: kolme siemenluvulla tuotettua synteettistä lokia, yksi per formaatti, jotka riippumaton, tämän sivun pohjalta saman tekijän kirjoittama lukija lukee takaisin, ja ADEV, TDEV ja MTIE tarkistetaan allantoolsia { "2024.6" } vastaan; vertailu kattaa vain kolme ensimmäistä formaattia, ja linuxptp- ja chrony-lukijoilla on jäsennystestit mutta ei oraakkelivertailua. Tämän vertailun lokit ovat synteettisiä, joten mikään siinä ei kuvaa todellista kelloa tai laskuria; vertailu mitatuilla sarjoilla kuvataan alla.

seg-576211abf0b4 = Mitatulla datalla

seg-3c8d10e8bd1c = <c1/> ajaa tiedostossa <c2/> ennalta rekisteröidyn vertailun (kirjattu ennen yhtäkään testiaineistoa tai ajoa) neljällä mitatulla sarjalla: Stable32-tiedosto <c3/>, 5071A-cesiumkellon { "65 536" } ensimmäistä lukemaa vetymaseria vasten sekä IGS-satelliitin G01 ({ "30" } s) ja aseman ABMF ({ "300" } s) kellot päivän 2026-08-02 IGS-lopullisesta kellotiedostosta, vendoroituna leikkeenä NOTICE-tiedostoineen. Kahdella ensimmäisellä ei ole uudelleenjakolupaa: niistä kirjoitetut lokit ovat git-ohitetussa hakemistossa <c4/> (<c5/>), ja testi sanoo sen ja menee läpi, kun ne puuttuvat, ellei aseteta <c6/>. Moottori ja riippumaton lukija lukevat kumpikin jokaisen lokin, ja ADEV, TDEV ja MTIE verrataan allantoolsiin { "2024.6" }. Kirjattu tiedostoon <c7/>: toimitetulla lukijalla TICC-lokit, otsikon versio ja viisi virheviestiä alittivat ennalta rekisteröidyt kynnykset; ne korjattiin ja vertailu ajettiin uudelleen muuttumattomana. Täyttyi, yhtä paria lukuun ottamatta: taajuuslokin MTIE eroaa allantoolsin vastaavasta, koska allantools integroi taajuuden miinus sen keskiarvon (kiinnitetty tilaan NOT MET; vertailukelpoinen vertailu täyttyy). Rivi pysyy MODELLED: TICC-lokit ovat mitattua kellodataa, jonka skriptimme on koodannut uudelleen laskurin asetteluun (todellista TICC-tallennetta ei löytynyt), ja viitelukijalla on sama tekijä kuin moottorin lukijalla.

seg-52778d17f4db = Holdoverin ajaminen omalla kellolla: [clock_fit]
