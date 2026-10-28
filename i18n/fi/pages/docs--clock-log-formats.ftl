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
