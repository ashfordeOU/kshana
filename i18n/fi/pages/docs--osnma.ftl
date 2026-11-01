# docs--osnma: translations (fi)

seg-fcd0ebea49bc = Komentorivi

seg-6816f4e1a0a0 = Versio

seg-94058315dfe4 = Syöte

# text
seg-23746ba370c2 = Lähde: <c1/>

# text
seg-1e9c104231db = Galileo OSNMA -vastaanottimen puolen todentaja

# text
seg-17fd702f5997 = Galileo Open Service Navigation Message Authentication (OSNMA) -todentaja vastaanottimen puolelle, toteutettu puhtaasti Rust-kielellä. Se lukee I/NAV-sivuja ja raportoi satelliittia ja epookkia kohti, onko navigointidata kryptografisesti todennettu, ja miksi tarkistus epäonnistui.

# text
seg-ae081f55c4f1 = <b>Ohjeellinen.</b> Tämä on analyysi- ja seurantatulos eikä tyyppihyväksytty navigointilaite. Tässä raportoitu todennustila ei ole navigoinnin eheyspalvelu, eikä sitä saa käyttää ainoana perusteena navigointia tai turvallisuutta koskevalle päätökselle.

# text
seg-84d7260098b1 = HUOMAUTUS: Galileo OSNMA -rajapinnan immateriaalioikeudet

# text
seg-6d78ccef53d5 = Kshana ei myönnä mitään oikeuksia Euroopan unionin immateriaalioikeuksiin Galileo OSNMA Signal-in-Space Interface Control Documentissa (”ICD IPRs”). ICD:n mukana tulee sen oma valtuutus (liite E), joka on epäyksinomainen ja rojaltivapaa ja jolla on omat ehtonsa, soveltamisalansa ja rajauksensa. Jokainen, joka käyttää, rakentaa tai jakelee tähän moduuliin perustuvaa ohjelmistoa, nojaa suoraan tähän valtuutukseen ja hänen on itse luettava ja hyväksyttävä sen ehdot. Kshanan lisenssi (AGPL-3.0-only tai kaupallinen lisenssi) kattaa vain Kshanan oman koodin.

# text
seg-c13ad334bf9a = Tämä moduuli toteuttaa algoritmit, jotka alla luetellut asiakirjat kuvaavat. ICD:n tekstiä ei jäljennetä; numeeriset arvot (kenttien asettelut, luettelotyypit, MAC-hakutaulukko) esitetään uudelleen Kshanan omalla merkintätavalla, ja lähde mainitaan koodissa. ICD ja Receiver Guidelines ovat © Euroopan unioni; lähde tunnustetaan tässä. Euroopan unioni, Euroopan komissio, EUSPA tai mikään muu taho ei ole kehittänyt, käyttänyt tai hyväksynyt Kshanaa eikä tue sitä.

# text
seg-860096b04999 = Viiteasiakirjat

# text
seg-04c1e1a6278d = Julkaissut European GNSS Service Centre.

# text
seg-278dd0f9df58 = Asiakirja

# text
seg-3427e40d7bee = Päivämäärä

# text
seg-54d15cb428d3 = Galileo OSNMA Signal-in-Space ICD (”SIS ICD”)

# text
seg-f63fbc1175cf = Issue { "1.1" }

# text
seg-fa85e4db2c93 = lokakuu { "2023" }

# text
seg-b89aa2b88558 = Galileo OSNMA Receiver Guidelines

# text
seg-907e4e46056c = Issue { "1.3" }

# text
seg-a9b75bc7f063 = tammikuu { "2024" }

# text
seg-530ae6421157 = Koodissa ja tässä mainitut kohta- ja taulukkonumerot viittaavat näihin versioihin.

# text
seg-143726cc3d5f = Mitä todennetaan

# text
seg-029a9bb7608f = Luottamusketju juuresta dataan asti:

# text
seg-886f1b6556ce = <b>Julkinen avain (ICD { "3.2.2" }, { "6.2" }).</b> DSM-PKR kootaan uudelleen lohkoistaan ja sen Merkle-polku kuljetaan läpi luotettuun Merkle-juureen (SHA-256).

# text
seg-27b4935fe47b = <b>KROOT (ICD { "3.2.3" }, { "6.3" }).</b> DSM-KROOT kootaan uudelleen; sen ECDSA-allekirjoitus (P-256/SHA-256 tai P-521/SHA-512) tarkistetaan sen nimeämää julkista avainta vastaan NMA-otsakkeen ja ketjun parametrien yli.

# text
seg-acc1f06cf63a = <b>TESLA-avaimet (ICD { "5.5" }, { "6.4" }).</b> Jokainen MACK-viestin avain kuljetaan takaisin KROOTiin tai aiempaan todennettuun avaimeen ketjun tiivistefunktiolla.

# text
seg-274285216a96 = <b>MACSEQ (ICD { "4.1.2" }, { "6.6" }).</b> Joustavat Tag-Info-kentät tarkistetaan MACSEQ:ta vastaan sillä avaimella, joka avaa kyseisen MACKin.

# text
seg-41ba810d7c8d = <b>Tagit (ICD { "4.2" }, { "6.7" }).</b> Jokainen tagi lasketaan uudelleen (HMAC-SHA-256 tai CMAC-AES, katkaistuna ketjun tagipituuteen) satelliittien tunnisteiden, alikehyksen ajan, tagin paikan, NMA-tilan ja sen kattaman navigointidatan yli ja verrataan. Käsitellään ADKD { "0" } (efemeridi, kello ja tila), ADKD { "4" } (ajoitusparametrit) ja ADKD { "12" } (hidas MAC, avain julkaistaan kymmentä alikehystä myöhemmin), sekä sellaisten satelliittien ristiintodennus, jotka eivät itse kanna OSNMA:ta, ja dummy-tagit (COP { "0" }).

# text
# c1: discarded
seg-1be16a4ca722 = Tagi, joka nimeää varatun arvon tai jonka ADKD ei vastaa MAC-hakutaulukon paikkaa, jätetään sivuun (Receiver Guidelines kehottaa hylkäämään sen) ja raportoidaan tilana <c1/>, ei epäonnistumisena.

# text
# c1: bad_crc
seg-eb993b3a0d17 = Sivut tarkistetaan CRC:llä (Galileon CRC-24Q) ennen mitään muuta; sivu, joka ei läpäise tarkistusta, pudotetaan ja raportoidaan (<c1/>).

# text
seg-c414a30d0840 = Tilaarvot

# text
# c1: authenticated
# c2: failed
# c3: tag_mismatch
# c4: macseq_mismatch
# c5: key_chain_mismatch
# c6: key_conflict
# c7: pending
# c8: no_chain
# c9: awaiting_key
# c10: no_nav_data
# c11: unknown_maclt
# c12: unsupported_function
# c13: service_not_usable
# c14: chain_mismatch
# c15: discarded
# c16: authenticated
seg-268f61b565b9 = Tagia kohden: <c1/>, <c2/> perusteella (<c3/>, <c4/>, <c5/>, <c6/>), <c7/> perusteella (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>) tai <c15/>. Dummy-tagi (COP { "0" }) näkyy tagitasolla tilana <c16/>, koska se todistaa avaimen, mutta se ei kata navigointidataa eikä koskaan lasketa satelliitille.

# text
seg-331a6ab821f3 = Satelliittia kohden siinä muodossa, jota receiver-trust-monitori kuluttaa:

# text
# c1: Authenticated
seg-9912068c5b34 = <c1/> vain niin kauan kuin uusin varmennettu efemeridi- ja kellodata (ADKD { "0" } tai

# text
# c1: Unavailable
seg-38e7f56293e7 = satelliitin osalta on tuoretta (oletuksena { "600" } s:n sisällä varmentajan ajasta) ja on edelleen käytössä oleva data. Tarkistus kohdistuu dataan, ei IODnav-arvoon: varmentaja pitää kirjaa todennetun bittijonon SHA-256:sta (Word Types { "1" }–{ "5" } sellaisina kuin ADKD { "0" } ne kattaa) sekä satelliitin lähettämän uusimman tällaisen jonon, ja niiden on oltava yhtäläiset. Kopioitu IODnav muiden sanojen päällä tai muutetut Word Type { "5" } -bitit (jotka eivät kanna IODnav-arvoa) tuottavat tilan <c1/>, kunnes uusi data todentuu. Alikehys, joka kantaa efemeridisanoja mutta ei täydellistä Word Types { "1" }–{ "5" } -joukkoa yhden IODnav-arvon alla, poistaa tilan samalla tavoin (jokainen aito E1-B-alikehys kantaa kaikki viisi); alikehys, jossa ei ole lainkaan efemeridisanoja, ei kerro mitään. Toisen satelliitin tagit (ristiintodennus) lasketaan sille satelliitille, jonka dataa ne kattavat.

# text
# c1: Failed
seg-233109ef4428 = <c1/>, kun satelliitin dataa koskeva tarkistus epäonnistui virhemuistin sisällä (oletuksena { "600" } s varmentajan ajasta), vaikka myöhempi data todentuisi. Epäsuhta merkitään sille satelliitille, jonka dataa tagi kattaa, ja sille satelliitille, joka lähetti tagin, koska kumpi tahansa voi olla vialla; MACSEQ-epäsuhta merkitään lähettävälle satelliitille.

# text
# c1: Unavailable
seg-8ba1d89bcf91 = <c1/> muuten sekä jokaiselle satelliitille varmennetun hälytysviestin jälkeen, NMA-tilassa "don't use" tai varatussa tilassa, ja siihen asti, kunnes ensimmäinen avain on todentunut.

# text
# c1: Failed
# c2: Authenticated
# c3: Unavailable
# c4: $PKSOS,<A|F|N>[,<sat>:<A|F|N>...]
# c5: kshana::osnma::pksos_sentence
seg-7fceea6e23f8 = Kokonaisarvo on <c1/>, jos mikä tahansa satelliitti epäonnistui, <c2/>, jos vähintään yksi on todennettu eikä yksikään epäonnistunut, muuten <c3/>. <c4/> on vastaava lause; <c5/> rakentaa sen.

# text
seg-446a3218ccbb = Aika

# text
# c1: set_reference_time
# c2: --reference-time
seg-18e91e6aa160 = Avainketju osoittaa, että avain kuuluu tietylle alikehykselle, ei sitä, että alikehys on nykyinen. Varmentaja ei siksi koskaan ota "nyt"-hetkeä todentamattomalta sivulta. Sen aika on myöhäisempi kahdesta: funktiolla <c1/> (<c2/>) annettu vertailuaika ja viimeisimmän todentuneen TESLA-avaimen alikehys (avainta ei voi tuntea ennen sen paikkaa, joten se todistaa ajan olevan vähintään tämä). Virhemuisti, todennuksen voimassaoloikkuna ja vanhan datan poisto toimivat tämän ajan mukaan. Alikehys, joka on leimattu yli kolme alikehystä viimeisimmän todentuneen avaimen jälkeen, jätetään sivuun, ellei sen oma avain todista sen aikaa; avain- ja hälytysviestit siinä käsitellään silti, koska ne kantavat oman todisteensa (allekirjoituksen tai Merkle-juuren).

# text
# c1: set_reference_time
# c2: poll_clock
# c3: KeyStall
seg-318323322a3a = Kello seisoo, kun OSNMA lakkaa, koska vain avaimet siirtävät sitä. Live-kutsujan on kutsuttava <c1/> isäntäajalla joka alikehys; todennus vanhenee silloin itsestään, ja <c2/> (ajetaan myös joka alikehys) palauttaa tapahtuman <c3/>, kun yksikään avain ei ole todentunut pidempään kuin todennusikkuna.

# text
# c1: freshness: NOT enforced
seg-5338d8f5de77 = Se, mitä tämä ei anna, on tuoreus. Ilman vertailuaikaa lähteestä, jota hyökkääjä ei voi siirtää, vanhan aidon datan toisto vanhoilla leimoilla todentuu, ja sivuleimat ovat vain lähteensä veroisia: komentorivi kertoo tämän (<c1/>) aina, kun vertailuaikaa ei ole annettu. Vertailuajan kanssa toleranssi on alle yksi alikehys (oletus { "29" } s; suuremmat arvot hylätään). Vertailuaika on yksi hetki: alikehykset, jotka ovat siitä toleranssia kauempana, jätetään sivuun ja lasketaan, joten se sopii live- tai juuri tallennetulle datalle, ei pitkälle tallenteelle. Tallenteelle jätä vertailuaika pois ja lue tulos muodossa "autenttinen, ei välttämättä tuore". Receiver Guidelines antaa muodollisen vaatimuksen.

# text
seg-aa37ce329914 = u-blox-virran sivuleimat tulevat itse todentamattomasta datasta (ks. Syöte), joten nekään eivät anna tuoreussuojaa.

# text
seg-a33d72076025 = Ketjut, avaimet ja hälytykset

# text
# c1: chain_mismatch
seg-be2d9588df65 = Varmennetut ketjut säilytetään ketjutunnuksen (CID) mukaan; tagit tarkistetaan NMA-otsikon nimeämällä ketjulla, ja otsikko, joka nimeää varmentamattoman ketjun, jättää alikehyksen tagit tarkistamatta (<c1/>). Voimassa olevan ketjun toinen KROOT lisää ankkurin; toisen ketjun KROOT säilytetään rinnalla, joten vanhan ketjun uudelleen ilmoittaminen uusimisen jälkeen ei kumoa uutta.

# text
# c1: stale
seg-bbb6574fa258 = NMA-otsikkoa ei todenneta, joten se, mitä se ilmoittaa, lasketaan vain vahvistettuna: kun useampi kuin yksi satelliitti lähettää saman otsikon alikehyksessä tai kun varmennetun KROOTin allekirjoitettu viesti sisältää sen (otsikko on osa tuota viestiä). Nämä kaksi eivät ole yhtä vahvoja. Useamman kuin yhden satelliitin yhtäpitävyys suojaa yksittäisen satelliitin poikkeamalta, ei harhauttajalta: yksi harhauttaja voi väärentää kaksi satelliittitunnusta. Sillä saa aikaan palvelunestoa eikä muuta, koska vahvistettu "don't use" tyhjentää jokaisen satelliitin todennetun datan: sen poistaminen, väärennetty tai aito, ei palauta mitään ennen kuin uudet tagit todentuvat aitojen operatiivisten alikehysten alla. (Ennen tuota tyhjennystä väärennetty poisto saattoi palauttaa jo todennettua dataa enintään todennusikkunan ajaksi.) Todellinen vahvistus on KROOT-allekirjoitettu otsikko, joka myös poistaa "don't use" -tilan uudelleen, kun se kantaa operatiivista tilaa. Yksittäisen satelliitin otsikko ei muuta mitään paitsi oman alikehyksensä tagien tarkistusta. KROOT, jonka sovellettavuusaika ei ole myöhäisempi kuin samalle tunnukselle pidetyn ketjun (vanhemman toisto), hylätään (<c1/>); saman ketjun KROOT lisää ankkurin.

# text
seg-5c08dbaa8d43 = Vahvistetun otsikon tila ja CPKS-arvo ohjaavat peruutusta. NMA-tilassa "don't use" CPKS "chain revoked" pudottaa otsikon nimeämän ketjun ja hylkää sen KROOTin tästä lähtien; CPKS "public key revoked" pudottaa julkisen avaimen, joka allekirjoitti kyseisen ketjun, sekä jokaisen sillä allekirjoitetun ketjun. Jos kyseisen tunnuksen korvaava ketju otettiin käyttöön ennen otsikon vahvistamista, kuinka paljon ennen tahansa, peruutettu avain on edellisen ketjun, ei uuden; tämä muisti säilytetään, kunnes peruutus on suoritettu tai toisen menettelyn otsikko vahvistetaan, ja joka alikehyksessä toistuva peruutusotsikko suoritetaan kerran. Samat CPKS-arvot operatiivisella tilalla merkitsevät siirtymää korvaavaan eivätkä peruuta mitään. Otsikkoa ei itsessään todenneta, joten väärennetty peruutus voi vain viedä todennuksen pois, ja se on lopullinen, kunnes varmentaja käynnistetään uudelleen. Tämä lopullisuus koskee myös käytössä olevaa avainta: väärennetty julkisen avaimen peruutus nollaa syrjäytetyn avaimen muistin ja peruuttaa käytössä olevan avaimen, ja vain uudelleenkäynnistys kumoaa sen.

# text
# c1: Unavailable
seg-e7d43eb18c24 = DSM-PKR, jonka NPKT on { "4" }, on hälytysviesti; se varmennetaan Merkle-puun kautta kuten avain, ja sen satunnainen NPK-kenttä on osa lehteä. Varmennettu hälytys tyhjentää kaikki ketjut ja julkiset avaimet, hylkää jokaisen myöhemmän KROOTin ja julkisen avaimen ja asettaa jokaisen satelliitin tilaan <c1/>, kuten Receiver Guidelines määrää, kunnes varmentaja käynnistetään uudelleen.

# text
seg-4068e9bda7c1 = DSM-KROOTin täytekenttä on allekirjoitetun viestin ja allekirjoituksen tiiviste. Se tarkistetaan ennen allekirjoitusta, ja se kertoo myös, millä NMA-otsikolla allekirjoitettu viesti rakennettiin, kun otsikko muuttui viestiä koottaessa.

# text
seg-8ea31bf25ef0 = Mitä ei varmenneta tai ei harjoiteta

# text
seg-3d0808cab632 = <b>Tuoreus.</b> Ks. Aika edellä: se vaatii vertailuajan ulkopuolelta.

# text
seg-b3d63950baa4 = <b>Uusiminen ja peruutus.</b> Ketjuja ja avaimia seurataan siinä laajuudessa kuin julkaistujen vektorien virrat niitä harjoittavat (uusiminen, ketjun loppu, ketjun ja avaimen peruutus, uusi julkinen avain, uusi Merkle-puu, hälytys), ei jokaista ICD:n sallimaa tapausta. Todentamattoman otsikon ilmoittama peruutus uskotaan sellaisenaan ja se on lopullinen istunnolle. Uusi Merkle-puu otetaan käyttöön vain varmentajalle annetun Merkle-juuren kautta.

# text
seg-f01d90a44585 = <b>Merkle-puun tiiviste.</b> DSM-PKR-viestit tarkistetaan SHA-256-puulla. SHA3-256-puuta, jonka ICD sallii tulevaisuudessa, ei tueta. Ketjun tiivistefunktio voi olla SHA-256 tai SHA3-256.

# text
seg-d9ca4e69ffc9 = <b>Avainten tilaluettelot.</b> Peruutusta seurataan NMA-otsikon ja virran viestien kautta; varmenteiden peruutuslistoja ei lueta.

# text
seg-73e0b16d03c7 = <b>Todennetun datan kattavuus.</b> ADKD { "4" } ja COP { "1" } parittomassa alikehyksessä lähetettynä ei voi todentua (Word Type { "10" } voidaan lähettää yhtä tai kahta alikehystä aiemmin); tämä maksaa vain saatavuutta, ei koskaan oikeellisuutta.

# text
seg-acc28dcced83 = <b>Vakioaikainen toiminta.</b> Ei tarjota eikä tarvita: varmentaja ei pidä salaisuuksia (vain julkisia avaimia, julkaistuja ketjuavaimia ja vastaanotettua dataa).

# text
seg-b2f8ec90ae39 = <b>Signaali ja datan laatu.</b> Sivut tarkistetaan CRC:llä ja hälytyssivut pudotetaan, mutta signaalista, jolla ne saapuivat, ei tiedetä mitään. I/NAV-sanojen { "1" }–{ "4" } Reed-Solomon-palautusta ei käytetä: data on vastaanotettava suoraan.

# text
seg-97313ba2bf88 = <b>Ei paikan eheyspalvelu.</b> Todennus kertoo, että data tuli järjestelmästä. Se ei kerro mitään signaalista, jolla se saapui, tai paikkaratkaisun laadusta.

# text
# c1: <svid> <gst_seconds> <60 hex digits>
# c2: #
# c3: gst_seconds
# c4: week * 604800 + time of week
seg-d696f298c4a2 = <b>Pelkkä sivumuoto.</b> Yksi sivupari riviä kohden: <c1/>, kommentit <c2/> sallittu. <c3/> on GST sekunteina (<c4/>) sivun alussa; heksa on parillisen ja parittoman puoliskon { "240" } bittiä (hännät mukaan lukien), merkitsevin bitti ensin.

# text
# c1: SVID,NumNavBits,NavBitsHEX
# c2: --start-gst
seg-e436d96b12cf = <b>Testivektori-CSV.</b> Julkaistujen vektorien asettelu (<c1/>). Aloitusaika tulee valitsimesta <c2/> tai päivätystä tiedostonimestä.

# text
# c1: --format ubx
# c2: src/osnma/ubx.rs
# c3: src/realdata/ubx.rs
seg-72132e3796bc = <b>u-blox UBX-RXM-SFRBX.</b> Raaka UBX-tavuvirta (<c1/>, tunnistetaan automaattisesti). Galileo E1-B I/NAV -viestit rakennetaan uudelleen sivupareiksi (<c2/>); muut järjestelmät, E5b, hälytyssivut ja kehykset, joiden tarkistussumma on virheellinen, ohitetaan. SFRBX ei kanna aikaa, joten jokainen sivu leimataan oman datansa sisällä olevasta ajasta (sanatyypit { "5" } ja { "0" }) ja hyväksytään vain, jos peräkkäiset aikaa kantavat sivut täsmäävät niiden välillä vastaanotettujen sivujen määrään; sivut, joita ei voi sijoittaa, pudotetaan, ei koskaan arvata. Tämä aika tulee itse datasta eikä anna tuoreussuojaa (ks. Aika edellä). Signaalitunnus { "0" } (E1-C) ei kanna dataa, joten sen hyväksyminen E1-B:n rinnalla on vaaratonta. Eksyvä synkronointipari, jolla on mieletön pituus, ei estä lukijaa. Kehystyskoodi on kolmas kopio UBX-kehystyksestä puussa (<c3/>, receiver-trust-sisäänluku); se pidetään erillään, jotta receiver-trust-toiminta pysyy ennallaan, ja nämä kolme voisivat myöhemmin jakaa yhden lukijan. SFRBX-viestin sanasuunnittelu on otettu julkisista kuvauksista ja tarkistettu vain synteettisillä kehyksillä, ei elävällä vastaanottimella.

# text
# c1: --epochs
# c2: --json
seg-47118a577876 = Tekstitulos antaa tilan satelliittia kohden ja valitsimella <c1/> tagia ja epookkia kohden; <c2/> antaa saman tagiluettelon kanssa. Poistumistila { "3" } tarkoittaa, että jonkin satelliitin dataa koskeva tarkistus epäonnistui, { "2" } tarkoittaa käyttö- tai syötevirhettä. Edellä oleva ohjeellinen huomautus tulostetaan ensin jokaisella polulla, myös virheiden ja käyttöohjeen yhteydessä.

# text
seg-e2af23b756f5 = Pythonista ja WebAssemblystä

# text
# c1: kshana.osnma_verify(data, format="", start_gst=None, merkle_root_hex="", public_keys=None, reference_time=None, max_time_error=None)
# c2: osnma_verify(input_base64, format, start_gst, merkle_root_hex, public_keys, reference_time, max_time_error)
# c3: kshana osnma verify --json
seg-4edf83a818d1 = <c1/> (Python) ja <c2/> (WebAssembly) ajavat saman varmentajan muistissa oleville tavuille ja palauttavat JSON-tulosteen, jonka <c3/> tulostaa, ohjeellinen huomautus mukaan lukien. MCP-palvelin ei sisällä sitä: syöte on pitkä raaka vastaanotinvirta, jota komentorivi ja Python palvelevat paremmin, ja agenttityökalu lisäisi suuren syötepinnan ilman hyötyä. Sama ohjeellinen huomautus ja samat rajoitukset pätevät; tila ei ole navigoinnin eheyspalvelu.

# text
seg-0987c3b00a14 = Testit ja testidata

# text
# c1: tests/osnma_synthetic.rs
seg-2acc9fa7212b = Testidata on synteettistä, ja Kshanan oma koodi ja testit tuottavat sen. Tähän arkistoon ei ole tallennettu ICD:n tai Guidelinesin vektoreita, läpikäytyjä esimerkkejä tai avainmateriaalia. Oletustestit (<c1/> ja yksikkötestit) rakentavat ketjun, sivut ja tagit yhtälöistä ja tarkistavat johdonmukaisuuden sekä sen, että tahallinen vioittaminen havaitaan: käännetty navigointibitti, käännetty avainbitti, toistetut tagit, väärät aikaleimat, vertailun ulkopuolella oleva aika, puuttuva data sekä katselmuksessa löydetyt hyökkäykset (väärennetty kaukaisen tulevaisuuden alikehys, jonka ei pidä pyyhkiä virhettä, todennus, jonka on vanhennuttava ja seurattava IODnav-arvoa, hälytys, NMA-tila "don't use", dummy-tagit, MACSEQ-epäsuhta, ristiriitaiset avaimet, ketjun peruutus ja uusiminen, virheellinen täyte tai allekirjoitus), ja CMAC-AES, SHA3-256-ketju ja P-521-allekirjoitus kuljetetaan varmentajan läpi. Koska tämä data tulee omasta ICD-tulkinnastamme, se osoittaa sisäistä johdonmukaisuutta, ei vaatimustenmukaisuutta.

# text
seg-4906b14a33a3 = Primitiivit tarkistetaan julkaistuja tunnettujen vastausten testejä vastaan, joista yksikään ei ole ICD:stä: RFC { "4231" } (HMAC-SHA-256), RFC { "4493" } (CMAC-AES-128), FIPS { "197" } (AES), FIPS { "202" } (SHA3-256) ja RFC { "6979" } (ECDSA P-256). P-521-allekirjoitukset tarkistetaan koodauksen ja tiivisteen valinnan osalta testissä tehdyllä kertakäyttöavaimella; käyrän aritmetiikka on kirjaston.

# text
# c1: tests/osnma_official_vectors.rs
# c2: KSHANA_OSNMA_VECTORS
seg-82ee90adf7ed = Vastaavuus virallisiin vektoreihin tarkistetaan testillä <c1/>, joka on vapaaehtoinen: se lukee kopion virallisesta testivektoriarkistosta, jonka lataat itse, muuttujan <c2/> nimeämästä hakemistosta, eikä tee mitään, kun muuttujaa ei ole asetettu. Se ei tallenna eikä jaa uudelleen mitään, eivätkä oletustestiajot käytä verkkoa. Se antaa varmentajalle vain Merkle-juuren ja yhden puun julkiset avaimet, kuten vastaanotin saisi, joten ketjut muodostetaan virran allekirjoitetusta DSM-KROOTista ja koko polku ajetaan: Merkle, allekirjoitus, avainketju, MACSEQ ja tagit. Se varmistaa vektorijoukkoa kohden todennettujen tagien alarajan, ettei yksikään epäonnistunut, mitkä ketjut ja avaimet virta ilmoittaa, ADKD { "0" }-, { "4" }- ja { "12" }-tagien todentumisen, että todennus jatkuu ketjun lopun, ketjun peruutuksen, avaimen peruutuksen ja uuden julkisen avaimen jälkeen, että hälytysviesti varmentuu eikä jätä mitään todennetuksi, ja että jokainen vektori käyttää vain HMAC-SHA-256:ta, SHA-256-ketjua, 128-bittisiä avaimia, 40-bittisiä tageja ja hakutaulukon merkintöjä { "33" } ja { "34" }. ICD:n muut algoritmi- ja parametrivalinnat katetaan siksi vain edellä mainituilla tunnettujen vastausten ja synteettisillä testeillä.

# text
seg-70bb026ce655 = Riippuvuudet

# text
# c1: hmac
# c2: cmac
# c3: aes
# c4: sha3
# c5: p256
# c6: p521
# c7: ecdsa
# c8: sha2
# c9: wasm32-unknown-unknown
# c10: cargo deny
seg-00a3dd901039 = RustCrypto-paketit, puhdasta Rustia, MIT OR Apache-2.0, rakennettu ilman oletusominaisuuksia: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> ja <c6/> (ominaisuus <c7/>, käytetään vain varmennukseen), sekä puussa jo oleva <c8/>. Ne rakentuvat kohteeseen <c9/> ja läpäisevät komennon <c10/>.

# text
seg-7ab62b91d469 = <s1>Edellinen</s1>Luottamus tietoturvatelemetriana

# text
seg-5dc48294fbb2 = <s1>Seuraava</s1>LunaNetin täydennetty eteenpäinsignaali
