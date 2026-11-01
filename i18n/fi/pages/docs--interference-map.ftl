# docs--interference-map: translations (fi)

seg-6555ff9a6d8e = Tuloste

seg-2247a2344710 = Merkitys

seg-c3c260b7063e = Testit

seg-d4a762001549 = Lisenssi

seg-e7b6d071246e = Lähde: <c1/>

seg-143c73287d6c = <c1/> rakentaa päiväkohtaisen kuvan siitä, missä ilma-alukset ja alukset raportoivat heikentynyttä navigointidataa, sinun toimittamistasi avoimesti lisensoiduista seurantatiedostoista. <c2/> kertoo sitten, kuinka suuri osa suunnitellusta reitistä oli kunakin päivänä vaikutusalueen soluissa.

seg-158f33f95ec3 = Mitä tämä on: kuvaus siitä, miltä julkaistut paikkaraportit näyttivät aiempina päivinä. Mitä se ei ole: minkään vastaanottimen mittaus, ennuste tai todiste häiriöstä. Heikentyneellä tai poikkeavalla solulla on useita mahdollisia syitä (lueteltu jäljempänä), ja solu, jolla ei ole merkintää, yksinkertaisesti jäi havaitsematta.

seg-64d3ee269407 = Kaikki toimii paikallisilla tiedostoilla. Oletuskomennot eivät koskaan avaa verkkoyhteyttä; ainoa valinnainen latausapuri vaatii nimenomaisen lipun.

seg-e251b385ff46 = Kaksi synteettistä häiriökarttapäivää, piirretty hakemiston examples/interference-map/output tallennetuista näytteistä, kummallakin oma synteettinen reittinsä ja moottorin raportoimat reittialtistuksen osuudet. Vasemmalla ADS-B-päivä: { "1" } heikentynyt solu, { "6" } ei heikentynyttä, { "4" } arvioimatonta (viivoitettu) sekä solut, joilla ei ole merkintää, piirretty tyhjinä, joita ei havaittu. Reitti on { "525" } km: { "11.5" }% sen pituudesta heikentyneissä soluissa, { "38.3" }% ei heikentyneissä, { "9.1" }% arvioimattomissa ja { "41.1" }% ei havaituissa. Oikealla AIS-päivä: ympyrä- ja maalla-ilmaisimien merkitsemät solut, ei poikkeavat solut ja tyhjät solut; reitti on { "454" } km, josta { "10.5" }% poikkeavissa soluissa, { "21.2" }% ei poikkeavissa, { "0.0" }% arvioimattomissa ja { "68.3" }% ei havaituissa. ADS-B ja AIS ovat erillisiä kerroksia, joita ei koskaan yhdistetä. Merkitty solu ei ole havainto häiriöstä, ja solu ilman väriä jäi havaitsematta, mikä ei ole sama asia kuin vapaa. Kaikki data on keksittyä, avoimella Atlantin keskialueella, eikä se ole mittaus.

seg-765f43228dc6 = Molemmat päivät ovat hakemiston <c1/> synteettisiä näytteitä, ja kummallakin on synteettinen reitti hakemistossa <c2/>; reittialtistuksen osuudet ovat se, mitä <c3/> niille tulostaa. Mikään niissä ei ole todellinen paikka, ilma-alus tai alus.

seg-228f39c0305b = Data ja lisenssit

seg-d3336cc18ff7 = Sisäänrakennettuina ovat vain tiedostossa <a1><c1/></a1> tarkastetut lähteet, valittuna valitsimella <c2/>:

seg-b03d56f501c3 = Tyyppi

seg-2328672e782f = Tulosteen lisenssikenttä

seg-2319c7a6f6e2 = ODbL { "1.0" }

seg-7464d3c830f3 = AIS

seg-c13f76567536 = Yhdysvaltain public domain (CC0 { "1.0" } julkaisijan mukaan)

seg-636c2bb6f29d = public domain

seg-f6f4e431d36d = NLOD { "2.0" }

seg-5621e3a3908f = kumpi tahansa

seg-6b3a1f8ca649 = mitä ilmoitat

seg-be349e2c455f = <c1/>, <c2/>, <c3/> vaaditaan

seg-590344d1eae5 = Jokainen tulostetiedosto upottaa lisenssin, lisenssin URL-osoitteen, vaaditun tekijänmaininnan ja lähteen kattavuusrajoitukset. Sisäänrakennettua kohtaa ei ole lähteille, joiden ehdot kieltävät kaupallisen käytön tai johdettujen karttojen edelleenjaon.

seg-2d8eaefab0f8 = <b>ODbL ja Kshanan versiot.</b> adsb.lolin datasta tehty solukohtainen ADS-B-tiedosto on Derived Database ja julkaistaan ODbL { "1.0" } -lisenssillä; sen kenttä <c1/> kertoo tämän. Kshanan oma koodi pysyy AGPL-3.0:na. Kshanan kaupalliset versiot, jotka kirjoittavat tällaisia tiedostoja, liittävät saman huomautuksen, ja kaikkien, jotka julkaisevat tiedoston uudelleen, on säilytettävä se. ADS-B- ja AIS-tuloksia ei koskaan yhdistetä yhteen tiedostoon, joten ODbL ei kiinnity AIS-kerrokseen.

seg-bb4932d5d15c = <b>Kattavuuden vinouma.</b> Kartat perivät lähteensä kattavuuden. adsb.lol seuraa vapaaehtoisten vastaanottimia, joten avomeri ja heikosti katetut alueet ovat harvoja. Kystverketin avoin data jättää pois alle { "15" } m:n kalastusalukset ja alle { "45" } m:n huviveneet, joten sen kartta heijastaa suurempia aluksia. MarineCadastre kattaa vain Yhdysvaltain vedet.

seg-713babc3963b = <b>Tunnisteet.</b> Syöterivit sisältävät ilma-aluksen tai aluksen tunnisteen. Se tiivistetään muistissa satunnaisella ajokohtaisella suolalla, sitä käytetään vain erillisten ilma-alusten tai alusten laskemiseen, eikä sitä koskaan kirjoiteta, kirjata lokiin tai tulosteta. Tulosteet ovat aggregaatteja: mikään tunniste ei esiinny niissä missään.

seg-fa3c70a8997a = <b>Pimitys.</b> Solua, jossa havaittiin sinä päivänä alle <c1/> erillistä ilma-alusta tai alusta, ei julkaista lainkaan, ja AIS:ssä julkaistun solun merkittyjen alusten lukumäärä yksi tai kaksi raportoidaan arvona <c2/>. Mikään julkaistu arvo ei voi tunnistaa yksittäistä ilma-alusta tai alusta.

seg-02dbfcb9c808 = Syöttömuodot

seg-2f291f986a87 = Pelkkä CSV otsikkorivillä, pilkuin erotettu, ilman lainausmerkkejä, UTC-ajat. Sarakejärjestys on vapaa; tuntemattomat sarakkeet ohitetaan. Aikaleima on Unix-sekunteja tai <c1/>. Rivit, joita ei voi jäsentää, lasketaan tulosteen metadataan, ei jätetä äänettömästi pois.

seg-571365be20a5 = ADS-B (<c1/>):

seg-aaeff8f42699 = Sarake

seg-b10a51ed96c0 = Pakollinen

seg-357c2320b43a = kyllä

seg-14ac5d0f109b = raportin aika

seg-6dbe5595d0be = läpinäkymätön tunniste (tiivistetään, ei koskaan tallenneta)

seg-c5fb6b91dc68 = astetta

seg-e283838c85aa = korkeus jalkoina; <c1/> tai tyhjä arvo sulkee rivin pois

seg-9ab90c35bd7d = vähintään yksi

seg-868e5b9c00ab = kokonaisluvut { "0" }–{ "11" }; tyhjä tarkoittaa, ettei arvoa ole raportoitu

seg-db907db790b1 = ei

seg-5c2ce9f61700 = jos sarake on olemassa, käytetään vain arvoja, jotka alkavat merkillä <c1/> (MLAT, TIS-B ja vastaavat suljetaan pois)

seg-412f40b8eeb1 = <b>adsb.lolin readsb-historia luettuna suoraan.</b> Päiväarkistot ovat jaettu tar-paketti readsb-jälkitiedostoista. Pura yksi julkaisijan kuvaamalla tavalla (yhdistä osat, <c1/>) ja anna sitten Kshanalle purettu hakemisto, yksittäinen <c2/>-tiedosto tai CSV:

seg-6e7d378bd89b = Hakemistosta etsitään rekursiivisesti tiedostoja <c1/> (muut tiedostot, kuten <c2/>, ohitetaan, eikä symbolisia linkkejä seurata). Jokainen tiedosto on gzip-pakattu tai pelkkää JSONia, mikä tunnistetaan sen ensimmäisistä tavuista, koska readsb kirjoittaa gzipin nimellä, jonka pääte on <c3/>; purku on rajattu { "512" } MiB:iin tiedostoa kohti. Jokaisesta jälkimerkinnästä Kshana lukee aikasiirtymän, leveysasteen, pituusasteen, korkeuden (merkki <c4/> sulkee merkinnän pois), ilma-aluksen tietoolion kentät <c5/> ja <c6/> sekä paikkalähdemerkkijonon (merkinnät, jotka eivät ole ADS-B:tä, suljetaan pois). Merkinnällä, jolla ei ole tietoolioa, ei ole tarkkuuskenttiä, ja se lasketaan poissuljetuksi. Tiedosto, jota ei voi lukea, lasketaan kenttään <c7/> tulosteen metadatassa ja ohitetaan.

seg-b1502f7f4c98 = AIS (<c1/>):

seg-91395984ddac = astetta; AIS:n ”ei saatavilla” -arvot ja ({ "0" }, { "0" }) hylätään

seg-34ae94eb1797 = maanopeus solmuina; { "102.3" } (ei saatavilla) käsitellään puuttuvana

seg-a1e60af5adaa = Maalla-ilmaisin tarvitsee maapolygonitiedoston (<c1/>): GeoJSON Polygon tai MultiPolygon. Tarkoitettu tiedosto on Natural Earthin { "1" }:{ "10" } miljoonan mittakaavan maakerros (public domain). Ilman valitsinta <c2/> ilmaisin on pois käytöstä, ja tuloste sanoo niin. Sen lataamiseksi (ainoa verkkoyhteys tässä ominaisuudessa):

seg-cd55a09894c5 = Tämä ajaa järjestelmän komennon <c1/> (argumenttilistana, ei komentotulkin kautta) HTTPS:n yli kerran yhdelle tiedostolle kiinteässä osoitteessa, joka nimeää yhden upstream-repositorion commitin. Lataus säilytetään vain, jos sen SHA-256 vastaa koodiin kiinnitettyä arvoa; ristiriita poistaa sen ja epäonnistuu. Jos komentoa <c2/> ei ole asennettu, komento sanoo sen ja antaa osoitteen ja tarkistussumman, jotta tiedoston voi noutaa käsin. Repositorioon ei niputeta mitään.

seg-95eeaa0033b3 = Yksi GeoJSON-tiedosto lähdettä ja UTC-päivää kohti hakemistossa <c1/>, nimettynä <c2/>, missä <c3/> on <c4/> tai <c5/>, <c6/> on avaimen <c7/> arvo (<c8/>, <c9/>, <c10/> tai <c11/>) ja päivämäärä on raporttien UTC-päivä: <c12/>, <c13/>. Aineisto on nimessä, jotta kaksi saman tyypin aineistoa ei voi jakaa tiedostoa, ja <b>Kshana ei koskaan korvaa tiedostoa</b>: jos mikä tahansa kohde on olemassa, komento epäonnistuu ennen kuin mitään kirjoitetaan. CLI tulostaa yhden rivin jokaisesta kirjoittamastaan tiedostosta. Lukija voi palauttaa kolme osaa lausekkeella <c14/>; sama tieto on tiedoston sisällä (<c15/>, <c16/>, <c17/>). Synteettiset näytetiedostot, yksi lähdettä kohti, ovat hakemistossa <c18/>, niiden uudelleen luovan komennon kanssa, katseluohjelman rakentamista ja testaamista varten. Ylätason jäsen <c19/> sisältää skeeman nimen, päivämäärän, ruudukon, menetelmän tunnisteen ja jokaisen parametrin, päivätason luvut, datan lisenssin ja tekijänmaininnan sekä huomautuksen. Jokainen kohde on solupolygoni, jolla on <c20/>, <c21/>, <c22/>, <c23/> ja aggregaattilukumäärät.

seg-1ee702004726 = Ruudukko on kiinteä: neliösolut, joiden koko on <c1/> astetta (oletus { "0.5" }) leveys- ja pituusasteessa, indeksoituna pisteestä (-90, -180). Itä–länsi-suuntainen leveys kapenee leveysasteen mukana: oletuksella noin { "55" } km päiväntasaajalla ja noin { "28" } km { "60" } asteen kohdalla. Leveysaste { "90" } kuuluu viimeiseen riviin, ja pituusaste { "180" } on sama pituuspiiri kuin -180. <b>Ennalta rekisteröidyt menetelmät on määritelty { "0.5" } asteen ruudukolle.</b> Toinen arvo valitsimelle <c2/> toimii, mutta ei ole ennalta rekisteröity menetelmä: CLI sanoo niin, ja tiedosto kirjaa <c3/> ja <c4/> (false), jotta katseluohjelma voi sanoa sen myös.

seg-6e1e8f2a9082 = <b>Pimitetyt lukumäärät.</b> Jokainen solukohtainen lukumäärä, joka on julkaisuminimin ({ "5" }) alapuolella, on <c1/>, nolla mukaan lukien, joten <c2/> ei koskaan tarkoita ”ei yhtään”, eikä mikään julkaistu luku voi tunnistaa yksittäistä ilma-alusta tai alusta. Kentät <c3/> ja <c4/> annetaan edelleen. ADS-B-tiedostoissa <c5/> on julkaistulla solulla aina vähintään { "5" }; <c6/> ja <c7/> ovat <c8/>, kun arvo on alle { "5" }, ja <c9/> on <c10/>, ellei molempia ole vähintään { "5" } (osuus paljastaisi pimitetyn lukumäärän). AIS-tiedostoissa kukin kentän <c11/> merkintä on <c12/>, kun arvo on alle { "5" }.

seg-fd929d6ee90b = Formaatin versio ja kentät

seg-ff443e9cbd20 = Formaatti on lukittu muotoon <c1/>, <c2/>. Muutos, joka poistaa tai nimeää uudelleen kentän tai muuttaa sen merkitystä, nostaa versiota; kentän lisääminen ei nosta, joten lukijan on ohitettava kentät, joita se ei tunne. Lukumäärä, joka on <c3/>, on pimitetty, ei nolla.

seg-60818bfc3f90 = Kentän <c1/> arvot: ADS-B <c2/>, <c3/>, <c4/>, <c5/>, <c6/>; AIS <c7/>, <c8/>. <c9/> on tosi vain arvoille <c10/> ja <c11/>. Reittialtistusraportilla on oma skeemansa <c12/>.

seg-ea526ebdd260 = Observatorio: päivätuote

seg-e33f63fe5c0a = <c1/> muuttaa yhden UTC-päivän ADS-B-raportit observatorion kolmeksi tiedostoksi (GeoJSON, PNG ja häiriöraportti-JSON) ja tiivistemanifestiksi, ja <c2/> toistaa kyseisen päivän ennalta rekisteröityjen parametrien yksi kerrallaan tehdyillä muutoksilla. Komento valvoo julkaisusääntöjä: vähintään { "24" } h päivän päättymisen jälkeen (<c3/> voi vain nostaa), solut { "0.5" } astetta tai karkeammat, vain kolme tilaa (<c4/>, <c5/>, <c6/>), ei syyn osoittamista ja ei OpenSky-dataa. Menetelmämuistio, tiedostomuodot ja rajoitukset ovat tiedostossa <a1><c7/></a1>. Alueellinen ajo (<c8/>) lukee vain laatikon raportit ja sanoo sen tiedostossa.

seg-31ce42fc05dc = Studion karttasivun määrittely

seg-a9aca2e2d390 = Studion karttasivua varten, joka lataa käyttäjän antaman GeoJSON-tiedoston (sivu rakennetaan Studion lähdekoodissa, ei tässä repositoriossa). Mitään ei lähetetä: tiedosto luetaan selaimessa, eikä sivu tee pyyntöä mihinkään datalähteeseen.

seg-064ec5d4c91a = <b>Tiedoston lukeminen.</b> Hyväksy tiedosto vain, jos <c1/> alkaa merkkijonolla <c2/> ja <c3/> on luku, jota sivu tukee; muuten sano, ettei tiedosto ole tuettu Kshanan häiriökartta. Lue yllä luetellut kentät; ohita tuntemattomat. Tiedostossa on yksi lähde ja yksi päivä. Useita tiedostoja voi ladata.

seg-5be32f8cff46 = <b>Solut.</b> Piirrä jokaisen kohteen polygoni. Väritä arvolla <c1/>, ja kerro aina selitteessä, mitä kukin väri tarkoittaa. Neljä tilaa, joista mitään ei saa piilottaa tai yhdistää:

seg-b652b86e6b8e = Tila

seg-4a511b6a03e3 = Mistä se tulee

seg-f92da2236260 = Heikentynyt (AIS:ssä poikkeava)

seg-591ebe8007cb = suuri osuus ilma-aluksista raportoi matalaa tarkkuutta, tai alusten havaittiin olevan poikkeavia, sinä päivänä

seg-bd993c64b6e8 = <c1/> on tosi

seg-88d43eb1c14a = Vapaa

seg-af5f7989fd09 = havaittu riittävällä määrällä ilma-aluksia tai aluksia eikä merkitty

seg-2bc810e02210 = <c1/> on <c2/> tai <c3/>

seg-d894eaa21369 = Arvioimaton

seg-38c88ed94111 = havaittu, mutta otantaan ei tullut tarpeeksi ilma-aluksia, päivä oli sekoittunut, tai päivän taustaa ei voitu arvioida

seg-e358a8c7903f = <c1/> on <c2/>, <c3/> tai <c4/>

seg-013b7c903426 = Ei havaittu

seg-81bcffa57ec2 = liian vähän ilma-aluksia tai aluksia, joten solua ei julkaistu

seg-6828d71822bd = solulle ei ole kohdetta

seg-753192a770ac = ”Ei havaittu” on kohteen puuttuminen: piirrä se neutraalisti (ei täyttöä tai viivoitus), ei koskaan ”vapaan” värillä. Käytä väriskeemaa, joka ei nojaa pelkästään punaiseen ja vihreään. Solun tiedot kohdistettaessa tai valittaessa näyttävät kentän <c1/> lukumäärät sellaisenaan ja jokaisen luvun <c2/> muodossa ”pimitetty (alle { "5" })”, ei koskaan nollana. Katseluohjelman tulee myös sanoa, kun <c3/> on false, että tiedosto käyttää solukokoa, joka on ennalta rekisteröidyn menetelmän ulkopuolella.

seg-e90fedf7ad89 = <b>Kerrokset.</b> ADS-B ja AIS ovat erillisiä kerroksia, joilla on omat kytkimensä, selitteensä ja lisenssirivinsä. Älä koskaan yhdistä niitä yhdeksi väri- tai lukumääräkentäksi, älä koskaan piirrä niitä yhdeksi yhdistetyksi soluksi äläkä koskaan laske niiden soluja yhteen. Eri päivät ovat eri tiedostoja: näytä yksi päivä kerrallaan päivänvalitsimella päällekkäisten päivien sijaan.

seg-6d500d3c0baa = <b>Lisenssi ja tekijänmaininta.</b> Näytä jokaiselle näkyvälle kerrokselle kartalla ja kaikissa viennissä tai kuvakaappauksissa tekstin <c1/> sanatarkasti, kentän <c2/> linkillä osoitteeseen <c3/> sekä kentän <c4/>. Jos ADS-B-kerros näytetään, sen ODbL-lisenssi koskee vain sitä kerrosta. Älä tarjoa yhdistetyn tiedoston vientiä.

seg-6f786153ef8e = <b>Menetelmä.</b> Tarjoa menetelmän tunniste ja parametrit (<c1/>, <c2/>) sekä luvut <c3/> tietopaneelissa, mukaan lukien <c4/> (sano selvästi, ettei yhtäkään solua julistettu heikentyneeksi päivän taustan vuoksi) ja <c5/>.

seg-905348837439 = <b>Säilytettävät varaumat</b> (näytä tiedoston omat <c1/> ja <c2/> ja pidä tämä sanamuoto tai sen vastine näkyvillä kartan kanssa):

seg-1f70e308010a = Heikentynyt tai poikkeava solu ei ole havainto häiriöstä. On olemassa muitakin syitä.

seg-7cde0ddadb73 = Solu ilman väriä jäi havaitsematta. Se ei ole todiste siitä, että alue oli vapaa.

seg-1135dfeadb8f = Tämä on kuvaus aiemmista paikkaraporteista, ei ennuste eikä minkään vastaanottimen mittaus.

seg-3ad1216bf3ed = Kattavuus seuraa datalähdettä; lue kattavuushuomautukset.

seg-046f6af48349 = Sivu ei saa nimetä tai näyttää yksittäistä ilma-alusta tai alusta, eikä tiedostoissa ole yhtään.

seg-ae79b67c3b98 = <b>Reittialtistus.</b> Jos sivu lataa myös raportin <c1/>, näytä sen rivit päivää ja lähdettä kohti neljän osuuden (heikentynyt, vapaa, arvioimaton, ei havaittu) kanssa yhdessä, ei koskaan heikentynyttä osuutta yksinään, sekä raportin <c2/> ja kunkin rivin <c3/> ja <c4/>.

seg-98131acf49d8 = ADS-B-menetelmä (<c1/>)

seg-83b660b0bfa6 = Jokainen ilmassa oleva ADS-B-raportti sisältää kaksi itse arvioitua navigoinnin laatukenttää: NIC (sijainnin sulkeumasäde) ja NACp ({ "95" } %:n tarkkuusraja, EPU). Kun aluksella oleva vastaanotin menettää satelliittiratkaisunsa tai lakkaa luottamasta siihen, molemmat laskevat, minkä vuoksi ne ovat häiriön tunnusmerkki. Ne laskevat myös muista syistä.

seg-4b9020a68db6 = <b>Ennalta rekisteröidyt parametrit</b> (koodin vakioita, kirjoitetaan jokaiseen tiedostoon; muutos tarkoittaa uutta menetelmäversiota):

seg-e73ea9921fcf = Parametri

seg-8650fa804f14 = Korkeusalaraja

seg-25056ee5a36c = barometrinen korkeus vähintään { "5000" } ft

seg-17322eff480a = Matalan tarkkuuden raportti

seg-48ab6ed5eedd = NACp enintään { "6" } (ilmoitettu EPU-raja on { "556" } m, { "0.3" } NM, tai suurempi, tai tuntematon) tai NIC enintään { "5" } (ilmoitettu sulkeumasäteen raja on { "1852" } m, { "1" } NM, tai suurempi, tai tuntematon)

seg-84beb488319d = Hyvä raportti

seg-2595055d9593 = NACp vähintään { "8" } ja NIC vähintään { "7" }; arvioidaan syötteen sisältämien kenttien perusteella (molemmat, kun molemmat ovat olemassa, muuten se, joka on)

seg-b4bbce695b2d = Laitteiston lähtötaso

seg-4986ed51f600 = ilma-alus lasketaan soluun vain, jos sillä on samana päivänä vähintään { "5" } hyvää raporttia kyseisen solun ulkopuolella

seg-42859d1d785b = Soluun otantaan tulleet ilma-alukset

seg-1ae26d6d99a9 = vähintään { "3" } raporttia solussa

seg-48bba15e2e0e = Solussa vaikutuksen alaiset ilma-alukset

seg-1fe9c3ab930c = vähintään { "50" } % sen solun raporteista on matalan tarkkuuden raportteja

seg-b147473d133c = Vähimmäisotanta

seg-33060cda8536 = vähintään { "10" } otantaan tullutta ilma-alusta

seg-009ca23b9cd6 = Heikentynyt

seg-afef85ae2a25 = vähintään { "5" } vaikutuksen alaista ilma-alusta, otantaan tulleiden ilma-alusten vaikutuksen alaisten osuus vähintään { "0.30" }, ja vähintään { "0.15" } yli päivän solujen mediaaniosuuden

seg-890dcc56fa5c = Sekoittunut päivä

seg-b27768e64d62 = solujen mediaaniosuus (vähintään { "5" } täyden otannan solun yli) vähintään { "0.15" }: yhtäkään solua ei julisteta heikentyneeksi

seg-18fbf3c348c9 = Ei taustaa

seg-534111e0c6ad = alle { "5" } täyden otannan solua, joten mediaania ei voi arvioida: solu, joka täyttää kynnykset, on <c1/>, ei heikentynyt

seg-b571f127c595 = Julkaisuminimi

seg-60621ffc5bcf = vähintään { "5" } havaittua erillistä ilma-alusta

seg-f36389caf81b = Nämä arvot asetettiin NIC- ja NACp-koodien määritelmistä ja yksityisyyssäännöstä ennen kuin mitään dataa katsottiin. Niitä ei viritetty todellisella datalla, ja testit käyttävät vain synteettistä dataa. Solujen tilat: <c1/>, <c2/>, <c3/> (julkaistu, mutta alle { "10" } otantaan tullutta ilma-alusta), <c4/> ja <c5/>.

seg-c89afc07989b = <b>Versio { "2" }.</b> Versio { "1" } julisti solun heikentyneeksi jo { "3" } vaikutuksen alaisella ilma-aluksella, mikä on alle 5 ilma-aluksen julkaisuminimin, ja ohitti päivän taustatarkistuksen sanomatta sitä, kun alle { "5" } solua oli otannassa täysin. Versio { "2" } vaatii vähintään { "5" } vaikutuksen alaista ilma-alusta ja pidättää arvion (<c1/>), kun taustaa ei voi arvioida. Molemmat muutokset tiukentavat menetelmää (mikään, mikä ei ollut heikentynyt versiossa { "1" }, ei ole heikentynyt versiossa { "2" }); syynä on, ettei julkaistu arvio saa koskaan perustua pienempään ilma-alusmäärään kuin se määrä, jonka alapuolella lukumäärät pimitetään. Version { "1" } tiedostoja ei julkaistu.

seg-ffd0e5175548 = Miksi tarkkuuskentät laskevat muista syistä kuin häiriöstä, ja kunkin suoja:

seg-12b613a77f64 = Syy

seg-e30479c3e5d8 = Suoja

seg-ecac3d226210 = Vanhemmat transponderit, jotka eivät koskaan raportoi NIC:iä tai NACp:tä tai raportoivat ne kiinteällä matalalla arvolla

seg-8b504b60fcc0 = laitteiston lähtötaso: ilma-alusta, jolla ei ole hyviä raportteja muualla samana päivänä, ei lasketa

seg-1df45f128708 = Matala korkeus ja pintaoperaatiot (maastopeitto, erilaiset paikkaformaatit)

seg-cc5f23f0da05 = korkeusalaraja; rivit, jotka on merkitty <c1/>, suljetaan pois

seg-ddf6aeb47dbe = MLAT tai muut ei-GNSS-paikat

seg-51162a1835d1 = suodatin <c1/>, kun sarake on olemassa

seg-08196503a657 = Yksi ilma-alus lähettää monta raporttia

seg-bf13dfa85dbe = lasketaan erilliset ilma-alukset, ei raportteja

seg-bbcb809624bc = Satelliittitähdistön tai täydennysjärjestelmän katko tai avaruussääilmiö, joka laskee tarkkuutta laajalla alueella

seg-5f428bb7ad4a = solun on ylitettävä päivän solujen mediaaniosuus marginaalilla, ja päivä, jonka mediaani on itsessään korkea, merkitään sekoittuneeksi eikä yhtäkään solua julisteta

seg-30290253a95d = Vika yhden ilma-aluksen laitteistossa

seg-b673195405ff = vaatii osuuden monesta erillisestä ilma-aluksesta ja vähimmäisotannan

seg-aeebeded71be = Vähän ilma-aluksia solussa

seg-c33c60b49b17 = vähimmäisotanta; kun havaintoja on alle { "5" }, solua ei julkaista

seg-dc8abb9b411f = Mitä jää jäljelle: menetelmä ei osaa erottaa häiriötä alueellisesta syystä, joka on paikallinen eikä laaja (paikallinen satelliittigeometrian vaikutus tai maapohjaisen täydennysjärjestelmän katko näyttäisi samalta), ja se on varovainen yhteen suuntaan: ilma-alus, joka lentää koko päivän vain vaikutusalueen sisällä, ei saa lähtötasoa eikä sitä lasketa, joten pysyvät laajat alueet raportoidaan liian vähäisinä.

seg-41d725eeaba9 = AIS-menetelmä (<c1/>)

seg-7fd53079dccf = Alusta ja päivää kohti viisi ilmaisinta. Ilmaisin <b>täyttää ehdot</b> solussa, kun se merkitsee vähintään { "5" } erillistä alusta, joiden osuus solussa havaituista aluksista on vähintään { "20" } %; solu on <c1/>, jos jokin ilmaisin täyttää ehdot.

seg-6d599353e8e1 = Ilmaisin

seg-551f38a9061c = Sääntö (ennalta rekisteröity)

seg-295e8a28a5b9 = vähintään { "3" } raporttia solussa yli { "2000" } m toimitetusta rantaviivasta sisämaahan

seg-fd21160e6685 = { "20" } peräkkäisen raportin ikkuna (askel { "10" }, aukot enintään { "30" } min), jonka keskimääräinen säde keskipisteestä on { "500" } m – { "20" } km, säteen variaatiokerroin enintään { "0.15" }, yksi kulkusuunta, jonka kokonaiskiertymä on vähintään { "270" } astetta (askeleet enintään { "90" } astetta, nettokiertymä vähintään { "80" } % kokonaiskiertymästä), ja keskinopeus vähintään { "2" } kn

seg-1aa30db06794 = vähintään { "2" } hyppyä soluun saapuvana: peräkkäisiä ilmoituksia, joiden välimatka on vähintään { "1000" } m ja aikaero enintään { "1" } h ja joiden perusteella nopeus on yli { "70" } kn (laskettu nopeus käyttää ilmoitusten välillä vähintään { "1" } s, joten kaksi ilmoitusta samalla aikaleimalla ja vähintään { "1" } km:n päässä toisistaan olevissa paikoissa lasketaan hypyksi)

seg-7f9b22254009 = vähintään { "3" } ilmoitettua nopeutta yli { "70" } kn solussa

seg-e0d0968e8751 = vähintään { "5" } eri alusta ilmoittaa saman paikan (pyöristettynä { "1e-4" } asteen tarkkuuteen, noin { "11" } m) samassa 10 minuutin ikkunassa

seg-1bf4c460672c = Soluja, joissa on alle { "5" } eri alusta, ei julkaista; jokainen merkittyjen alusten määrä alle { "5" }, nolla mukaan lukien, ilmoitetaan arvona <c1/>.

seg-b2ea2ec6bad1 = <b>Versio { "2" }.</b> Versio { "1" } hyväksyi ilmaisimen jo { "3" } merkitystä aluksesta ja julkaisi luvut { "3" } ja { "4" }. Versio { "2" } nostaa merkittyjen alusten vähimmäismäärän arvoon { "5" }, joka on julkaisun vähimmäismäärä, jotta päätös <c1/> ei koskaan perustu pienempään alusmäärään kuin se, jonka alle lukuja ei julkaista. Tämä tiukentaa menetelmää, eikä versiosta { "1" } julkaistu yhtään tiedostoa.

seg-25593339aeb0 = <b>Tunnetut väärien positiivisten syyt</b>, joita osuussääntö ja kynnysarvot vähentävät mutta eivät poista: joissa, kanavissa ja satamissa olevat alukset karkean rantaviivan lähellä (siksi on olemassa { "2" } km:n sisämaapuskuri); kaksi samaa tunnistetta käyttävää alusta, mikä näyttää hypyiltä; transponderit, joilla on virheellinen paikkaratkaisu, sekä testilaitteet; ja luotsiveneiden ja etsintäalusten kierteleminen, joka voi muistuttaa kehiä. Mittakaavan { "1" }:{ "10" } miljoonaa rantaviivatiedosto on tarkka noin kilometrin tarkkuudella.

seg-ac661440a29a = Hyppy- ja nopeusilmaisimet vertaavat ilmoituksia yhden syötetiedoston sisällä; useaan tiedostoon tai päivään jakautunutta jälkeä ei yhdistetä.

seg-05f789b26904 = <b>Muisti.</b> Syöte luetaan rivi kerrallaan, eikä sitä pidetä kokonaisena muistissa. ADS-B säilyttää vain ilma-aluskohtaiset solukohtaiset laskurit. AIS säilyttää jokaisen hyväksytyn ilmoituksen tiiviissä tietueessa (noin { "40" } tavua), kunnes sen päivä on arvioitu, joten muisti kasvaa syötteen AIS-ilmoitusten määrän mukana; jaa hyvin suuri AIS-syöte päivittäin.

seg-206c78a69ded = Reitin altistuminen

seg-0d8832796ab7 = <c1/> on GeoJSON-LineString (sellaisenaan, Feature-kohteessa tai FeatureCollection-kohteessa) tai CSV-tiedosto, jonka rivit ovat muotoa <c2/>. <c3/> ottaa karttatiedostoja tai niiden hakemistoja, ja sen voi toistaa. Reittipisteet yhdistetään suorilla viivoilla leveys- ja pituusasteessa, joten tihennä pitkät osuudet; osuus kulkee pituusasteessa lyhintä tietä, joten antimeridiaanin ({ "179.5" } E – { "179.5" } W) ylittävä osuus ylittää sen. Reitti jaetaan noin { "250" } m:n paloihin. Jokainen pala mitataan omien kahden päätepisteensä välillä pallolla, jonka säde on { "6371.0088" } km (sama polku, joka ratkaisee, mihin soluun se kuuluu), ja se liitetään soluun, jossa sen keskipiste on.

seg-cc5e2553700b = Päivää ja lähdettä kohden raportti antaa reitin pituuden ja neljä osuutta, joiden summa on { "1" }: <c1/>, <c2/>, <c3/> (solu on olemassa mutta ilman päätöstä) ja <c4/> (solua ei ole kartassa). Lue kaksi viimeistä yhdessä ensimmäisen kanssa: reittiä, jolla on pieni heikentynyt osuus ja suuri havaitsemattomien osuus, ei ole osoitettu vapaaksi. ADS-B- ja AIS-rivit raportoidaan erikseen, eikä niitä koskaan yhdistetä. Jokaisella rivillä on kartan lisenssi ja tekijänmerkintä.

seg-3a087d90e317 = Kirjastofunktiot

seg-67ea1ff00bb8 = Kutsujille, jotka pitävät dataa muistissa (sidokset, MCP-palvelin, selainversio), moduuli <c1/> tarjoaa samat menetelmät niin, että sisään tulee teksti tai tavuja ja ulos JSON, eikä mitään tiedostoa tai verkkoa käytetä:

seg-4dbf41c0ec3b = Funktio

seg-95f87a38a522 = Syöte

seg-0fe8ff25f4a1 = Tuloste

seg-9e99af2c1f84 = ADS-B CSV -teksti

seg-e144f449c5b4 = yksi tavuviipale kutakin readsb-jälkitiedostoa kohden (gzip tai pelkkä)

seg-7effd7110c4c = AIS CSV -teksti, valinnainen maa-alueen GeoJSON-teksti

seg-10c5e0c0a9c8 = reittiteksti, karttojen GeoJSON-tekstit, valinnaiset rajat <c1/>

seg-be00d23d96e9 = <c1/> JSON

seg-20a842d675c2 = Kohteella <c1/> on <c2/> (<c3/>), <c4/> ja <c5/> (v1-asiakirja). <c6/> on <c7/> tai <c8/>; <c9/> on { "0.5" }. Virheet ovat <c10/>. Aineistosäännöt (hyväksytyt esiasetukset, lisenssiteksti vaaditaan, lajin on vastattava) pätevät täsmälleen kuten komentorivillä.

seg-1195686de09b = Ulkoinen validointi

seg-0de37085f544 = <c1/> vertaa Kshanaa riippumattomiin toteutuksiin synteettisillä syötteillä; toleranssit on ennakkorekisteröity tiedostossa <c2/>: NIC- ja NACp-koodien merkitykset pyModeS-dekoodausta vastaan synteettisillä ADS-B-kehyksillä, AIS:n ei-saatavilla-arvot pyais-dekoodausta vastaan synteettisillä AIVDM-lauseilla, ruudukon solujen osoitus shapelya vastaan, reitin pituus solun tilaa kohden shapelya ja GeographicLibia vastaan sekä sisämaan peittäminen shapelya ja pyprojia vastaan. Kiinnitteet tuottaa <c3/>; CI ei tarvitse Pythonia. Tämä validoi sen, miten koodit ja kenttäarvot luetaan, sekä geometrian. Se ei validoi sitä, että merkitty solu on häiriö.

seg-56a3e955cbcc = Kaikki testit käyttävät synteettistä generoitua dataa eivätkä verkkoa: yksikkötestit tiedostossa <c1/> ja <c2/> komentojen päästä päähän -testaukseen, mukaan lukien se, ettei yksikään tunniste päädy tulosteeseen ja että hylkäykset eivät jätä tiedostoja jälkeensä.

seg-212c43d1a41c = <s1>Edellinen</s1>NMEA-harjoitusvirrat

seg-7f13ee5d254e = <s1>Seuraava</s1>Häiriökartta: tietolähteet ja lisenssit

seg-1fc1794d9388 = ADS-B-menetelmä (kshana-interference-map/adsb/v2)

seg-a3a97ab49ed1 = AIS-menetelmä (kshana-interference-map/ais/v2)

seg-e3949a1e6082 = Lähetinalue (<c1/>)

seg-34bdcfd66ded = Siinä repositorion haarassa, josta nämä dokumentit tulevat; ei vielä GitHubissa

seg-4fc5a1dcc963 = <c1/> arvioi, <b>missä häiriölähde voi olla</b>, samoista avoimista ADS-B- tai AIS-raporteista: alue ilmoitetuilla luottamustasoilla, painopiste epävarmuusellipsillä ja istunnot ajassa. Se ei koskaan palauta pelkkää pistettä. <b>MODELLED</b> (kirjanpitorivi <c2/>): fysiikka on oppikirjan radion näköyhteys, alueiden uskottavuus on ehdollinen mallille, ja ainoa ulkoinen tarkistus on Jammertest-vertailu, joka on ennalta rekisteröity tiedostossa <s1><c3/></s1>. Lähetinalueiden julkaiseminen julkisessa observatoriossa on erillinen omistajan päätös ja on <b>pois päältä</b>: observatorio ei lue tätä moduulia, ja testi kiinnittää sen.

seg-194d573cb817 = Valinnat: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> (AIS), <c6/> (TDOA-paikannuksen fuusio; alla). Jokainen valinta, joka poikkeaa ennalta rekisteröidystä arvosta, ilmoitetaan sanoin ”ei ennalta rekisteröity menetelmä”. Tiedostoja ei koskaan ylikirjoiteta.

seg-5767c749117a = <b>Malli.</b> Raportit lokeroidaan <em>yksiköihin</em> (yksi ilma-alus tai alus yhdessä 2 minuutin lokerossa), kukin <em>vaikutuksen alainen</em> (ADS-B: vähintään puolella sen raporteista on matala NIC tai NACp kartan oman säännön mukaan; AIS: epäuskottava nopeus tai hyppy tai paikka rannikkoviivan sisämaan puolella) tai ei. Ilma-alus tai alus lasketaan vain, jos syötteessä on vähintään { "5" } hyvää raporttia (sama laitteiston lähtötason suoja kuin kartalla). Vaikutuksen alaiset yksiköt ryhmitellään <em>istunnoiksi</em>: yli { "30" } minuutin väli jakaa ajassa, ja aikaklusterin sisällä kaksi yksikköä kuuluu yhteen, kun yksi lähetin voisi olla molempien kantamalla. Jokaisella istunnolla jokainen ruudukon ehdokaspaikka saa uskottavuusfunktion arvon:

seg-0e3abeb21526 = <b>Näköyhteys.</b> Korkeudella <c1/> oleva ilma-alus ja lähetinantenni korkeudella <c2/> näkevät toisensa etäisyydelle <c3/> km asti 4/3-maapallon säteellä. <c4/> marginalisoidaan välille { "2" }–{ "100" } m ({ "8" } logaritmisesti jaettua arvoa).

seg-75f5afea310e = <b>Teho.</b> Lähettimen teho on tuntematon, joten tehollinen kantama { "12" } km:stä { "426" } km:iin (askeleet { "1.25" }) tai ”vain näköyhteys” rajaa kantaman, marginalisoituna yhtäpainoisesti. Kantaman reuna on pehmeä: yksikkö lasketaan kantamalla olevaksi painolla, joka laskee lineaarisesti kummallakin puolella välillä, jonka pituus on { "15" }% kantamasta (vähintään kolme neljäsosaa ruudukon solusta), koska maastoa, antennikuviota ja reittiä ei tunneta sitä tarkemmin.

seg-ff9cf5fc9fbe = <b>Vaikutuksen alaiset ja ulkopuoliset.</b> Ilma-alus tai alus on <em>herkkä</em> todennäköisyydellä { "0.6" } (vastaanotinlaitteisto, antenni ja signaalireitti vaihtelevat), herkän ilma-aluksen kantaman sisällä oleva yksikkö on vaikutuksen alainen todennäköisyydellä { "0.9" }, ja mikä tahansa muu yksikkö on vaikutuksen alainen taustatodennäköisyydellä { "0.03" } (muut syyt). Herkkyys on ilma-aluksen latentti ominaisuus, summattu pois ilma-alusta kohti, samoin pysyvä laitevika (todennäköisyys { "0.03" }: kaikki kyseisen ilma-aluksen yksiköt ovat vaikutuksen alaisia missä tahansa se onkaan), mikä estää viallista transponderia vetämästä aluetta. Siksi <b>vaikutuksen alainen</b> ilma-alus vetää posteriorin kohti paikkoja, jotka yltäisivät siihen, ja <b>vaikutuksen ulkopuolinen ilma-alus, jolla on näköyhteys,</b> työntää vastaan paikkoja, jotka olisivat yltäneet siihen, enintään yhden ilma-aluksen painolla riippumatta siitä, kuinka monta raporttia se lähetti, kun taas vaikutuksen ulkopuolinen ilma-alus ilman näköyhteyttä ei kerro mitään.

seg-51e09cf3944c = <b>Maastoton.</b> Maastoa, kanavointia ja diffraktiota ei mallinneta (maasto voi vain poistaa näköyhteyden).

seg-b966c198786a = <b>Temperointi.</b> Log-uskottavuus kerrotaan luvulla { "0.3" } (tehoposteriori). Mallin todistusaineisto on riippuvaisempaa ja sen reunat vähemmän teräviä kuin uskottavuuden olettama riippumattomuus, ja synteettisellä datalla, jossa on nämä viat, temperoimattomat alueet sisälsivät todellisen lähteen selvästi harvemmin kuin ilmoitettu osuus; { "0.3" } valittiin vain synteettisellä datalla (johdanto on tiedostossa <c1/>, kohta { "8" }).

seg-4488bddfd8da = Posteriori antaa <b>suurimman tiheyden alueet</b> ilmoitetuilla tasoilla (sisäkkäiset; polygonit reikineen tarvittaessa), posteriorilla painotetun <b>painopisteen</b> ja sen <b>momenttiellipsin</b> (skaalattu tasolle { "95" }% gaussisen mallin mukaan; kalibroidut tasot ovat polygonit, ei ellipsi). Ruudukko on karkea (noin { "5" }–{ "10" } km) koko alueella, ja jokainen massaa sisältävä karkea solu jaetaan { "4" } × { "4" }. <b>Kattavuusharha</b> käsitellään ehdollistamalla sille, missä raportteja on: alue on leveä siellä, missä ilma-aluksia oli vähän, ja istunto, jonka { "95" }% alue täyttää yli { "80" }% hakualueestaan, raportoidaan tilana <c1/>, ilman painopistettä.

seg-2ee93e45c01e = <b>Istunnot ja profiili.</b> Jokaisella julkaistulla istunnolla on alku, loppu, kesto, sellaisten 0.5 asteen solujen pinta-ala, joissa on vaikutuksen alainen yksikkö ja vähintään { "5" } erillistä ilma-alusta tai alusta, erilliset vaikutuksen alaiset ja havaitut määrät sekä vastatodiste (erilliset vaikutuksen ulkopuoliset, joilla on näköyhteys painopisteeseen; pidätetään alle { "5" }). Istunto, jossa on alle <c1/> erillistä vaikutuksen alaista ilma-alusta tai alusta, pidätetään ja lasketaan. Profiili antaa UTC-tunnin mukaan erilliset vaikutuksen alaiset ilma-alukset (<c2/> alle { "5" }) ja istuntoajan minuutit sekä istuntoajan tunnit UTC-päivää kohti.

seg-857aad210cde = Valinnainen TDOA-fuusio.

seg-fcfc554b4f3d = <c1/> ottaa muodon <c2/> (vähintään kolme vastaanotinta; <c3/> on vastaanotin <c4/> miinus vastaanotin { "0" }). Paikka ratkaistaan Maan pinnalla Gauss-Newtonilla funktiolla <c5/>, sen kovarianssi on <c6/>, ja gaussinen kerrotaan posterioriin. Cramer-Rao-raja on mallin alaraja, ei mitattu tarkkuus.

seg-55c1c9c80601 = <b>Tulosteet</b> (<c1/>): <c2/> (MultiPolygon-alue tasoa ja istuntoa kohti, ellipsipolygoni, painopistepiste, joka kantaa ellipsinsä), <c3/>, <c4/>, <c5/>. Jokainen sisältää aineiston lisenssin, lisenssin URL-osoitteen ja tekijänoikeusmerkinnän, menetelmätunnisteen <c6/>, jokaisen parametrin, oletukset ja rajoitukset, ja kantaa <b>todistemerkintänsä</b> (taso MODELLED, kirjanpitorivien tunnisteet; kuvan alla oleva kaista, rivit <c7/> taulukossa, jäsen <c8/> JSONissa). Konetiedostot ovat englanniksi kielestä riippumatta; kuvateksti ja komentorivin rivit lokalisoidaan. Synteettinen esimerkki on kohteessa <c9/> (<c10/>).

seg-7f93e7987855 = <b>Yksityisyys ja sanamuoto.</b> Mikään ilma-aluksen tai aluksen tunniste ei esiinny missään tulosteessa; raportin paikkaa ei piirretä; istunto vaatii vähintään { "5" } erillistä ilma-alusta tai alusta; alle { "5" } olevat määrät ovat <c1/>. Sanamuoto on neutraali: ”arvioitu lähetinalue”, ”häiriölähteen alue”. Alue ei ole kenenkään sijainti, ei ole syyn havainto eikä kerro mitään siitä, kuka tai mikä on lähteen takana; laajennettu sanamuototesti tarkistaa tulosteista toimijoiden, aikomuksen ja konfliktin sanat.

seg-5298b30a7857 = <b>Rajoitukset.</b> Uskottavuus on ehdollinen mallille. Synteettisellä datalla (generaattori, joka jakaa mallin, kantaman reunat { "15" }% epävarmoja ilma-alusta kohti, pysyvät laitevikat, tuntematon teho ja tuntematon antennin korkeus) { "95" }% alue sisälsi todellisen lähteen osuudessa { "0.99" } istunnoista (ilma-alusgeometria) ja osuudessa { "1.00" } (aluksen geometria) ja { "50" }% alue osuudessa noin { "0.77" }: tasot ovat konservatiivisia uskottavuuseksponentin { "0.3" } vuoksi, ja istunnon painopistevirheen mediaani on { "23" } km (ilma-alukset) ja { "12" } km (alukset). Kalibrointi tarkistetaan vain synteettisellä datalla; Jammertest-vertailu ennalta rekisteröitiin (<c1/>) ja ajettiin kerran: NOT ASSESSABLE molemmille lähteille (<c2/>). Yksi lähde istuntoa kohti; useat lähellä olevat lähteet näyttävät yhdeltä. Alueellinen syy (tähdistön katkos, avaruussää) antaa alueen, joka ei ole lähde. ADS-B antaa vähän raportteja vilkkaan ilmatilan ulkopuolella, ja vain noin neljännes readsb-jälkipisteistä kantaa NIC- ja NACp-arvon, joten harvat alueet antavat leveitä alueita tai ei aluetta ({ "31" }% aluksen geometrian istunnoista oli <c3/>).

seg-d8eb178ef226 = Lähetinalue (interference-map locate)
