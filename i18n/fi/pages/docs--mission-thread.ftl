# docs--mission-thread: translations (fi)

seg-e27476e37522 = Maa

seg-34bdcfd66ded = Siinä repositorion haarassa, josta nämä dokumentit tulevat; ei vielä GitHubissa

seg-092dd691ca17 = Raportti

seg-f942b36a11c4 = Ei vielä GitHubissa

seg-b03d56f501c3 = Tyyppi

seg-2afa300864a9 = Parametrit

seg-b7cf72949a21 = Lähde: <c1/>

seg-32755afa0f78 = Tehtäväketju

seg-d4af67363efc = Ohjeellinen ohjelmisto, ei virallisesti hyväksytty navigointilaite. Vain julkisia lähteitä; ei ole sidoksissa mihinkään virastoon eikä sen hyväksymä, eikä mikään tässä väitä vastaavuutta minkään ohjelman vaatimusten kanssa.

seg-816770c97995 = <c1/> ketjuttaa tehtävän vaiheet, kukin yksi kahdeksasta rekisteröidystä lajista omine antureineen ja suotimineen, ja raportoi koko ketjun <b>navigointi- ja ajoitusvirhebudjetin</b>: jokaiselle vaiheelle 1-sigma-paikan, -nopeuden ja kellon harhan tulohetkellä, huipussa ja poistuessa; jokaisen sen osuuden yksikköineen; marginaalin ilmoittamaasi vaatimukseen nähden; heikoimman lenkin; päivätyt tapahtumat; ja aikajanakuvan. Jokainen luku on <b>MODELLED</b>: ilmoitettu syöte tai sen malli. Ainoat ulkoiset oraakkelirivit ovat kohdassa <s1><c2/></s1>, ja ne kertovat, mitä ne testaavat.

seg-c29a19879c84 = Aja esimerkki checkoutista (se lukee sitoutetun Kuun kernel-leikkauksen):

seg-00f84b734853 = Asiakirja

seg-9979b2c873df = <b>Asiakirja torjutaan, ei arvata,</b> kun vaihetunniste toistuu, lista <c1/> on tyhjä, nimi on tuntematon, mallin avain ei ole lajin tuntema, pituusavain on ristiriidassa avaimen <c2/> kanssa tai vaihe luettelee lähteen, jonka sen malli ei anna lukuja.

seg-9b1e6ac618b5 = Mitä siirto tekee

seg-0e965f3e30fa = Eteenpäin siirretty tila on täysi 6x6-kovarianssi tilasta <c1/> SI-yksiköissä, kello (harha, ajautuma ja niiden kovarianssi, aikaskaalalla merkittynä), koordinaatisto, tehtäväaika ja todistetason nimike. Siirto ei koskaan nollaa kovarianssia.

seg-47599d03571d = Sääntö

seg-023113cc5afb = siirtää tilan eteenpäin muuttumattomana

seg-43967d0b6dd8 = valkoinen kiihtyvyyskohina, jonka PSD on <c1/> ajalla <c2/> suoraviivaisessa mallissa; rivi ilmoittaa molemmat

seg-2c791ab0fd0f = dead reckoning ajan <c1/>, sitten akseli asetetaan lähteen lattiaan vain siellä, missä lattia on pienempi; ei koskaan lattian alle, ei koskaan nollausta

seg-36b9117f5379 = Koordinaatistot ja aikaskaalat

seg-5853aaba827f = Ketju muuntaa siirrossa, ei koskaan vaiheen sisällä, ja jokainen muunnos on oma budjettirivinsä. Koordinaatistot: GCRF, MCI, MCMF (ITRF ja LVLH torjutaan perustelun kera). <c1/> siirtää origon Kuun geosentrisen tilan verran: DE440-luokan tila kernelistä siellä, missä se kattaa epookin (sijaisarvo { "5" } m ja { "1" } mm/s; mitattu pahin { "2.6" } m kiinnitettyjä JPL Horizons -arvoja vasten), muuten analyyttinen sarja sen mitatulla { "195.7" } km RMS:llä, jonka rivi ilmoittaa; Kuun esimerkin on siis sisällettävä kernel, joka kattaa sen epookin. <c2/> on keskimääräinen tähtiaikainen pyöriminen akselit epookissa kohdistettuina ja ilman libraatiota. Aikaskaalat kulkevat TT:n kautta: <c3/> täsmällinen, <c4/> lisää { "14" } us, <c5/> käyttää lajin <c6/> sekulaarista nopeutta sen { "56" }–{ "59" } us/vrk -kaistalla nopeuden epävarmuutena.

seg-5ee610d8ab89 = Kahdeksan vaihelajia

seg-70b73f1acebf = Osuus

seg-0e39a468de1d = moottoroitu nousu parkkiradalle: vakionopeuksinen kovarianssi valkoisella kiihtyvyyskohinalla, GNSS-hankinta ja häipyminen, kellon holdover

seg-d359ae5982a6 = <c1/>-avaimet tiedostossa <c2/>

seg-57c44fd6e061 = suhteellinen navigointi anturijaksojen yli: Clohessy–Wiltshire-siirtymä LVLH-koordinaatistossa, 6x6 Kalman-kovarianssi, telakointi-ikkuna

seg-7dce961e2c67 = alla

seg-4b233c6cdf8b = TLI-poltto ja kuunläheinen risteily: Cowell-propagointi, differenssipohjainen tilasiirtymämatriisi, gnss-ssv- ja maaseurantapäivitykset

seg-352e27d02c86 = paluurannikko ilmakehän tulorajapintaan; lentoratakulman sigma, käytävän todennäköisyys, huippuhidastuvuus, jalanjälki

seg-95eb34012fe8 = Kuu

seg-cc72d2fc8a43 = suhteellinen navigointi telakointiin Kuun kiertoradalla

seg-2cfa6846c937 = laskeutumishajonnan budjetti napa-alueen kohteessa

seg-e9f5fc58fe12 = sama

seg-ba3c65a210dd = pinnan PNT- ja ajoitussaatavuus kohteen ja vuodenajan mukaan

seg-8b9c5124dd3c = moottoroitu nousu injektiokiertoradalle

seg-4ce0fa85457c = Kuun lajit ovat myös erillisiä skenaariolajeja; rakenne ja todisteet ovat tiedostossa <a1><c1/></a1>.

seg-d16877f38793 = Budjetti kantaa <b>suhteellisia</b> sigmoja; takaa-ajajan absoluuttinen kovarianssi siirretään eteenpäin muuttumattomana ja rivi kertoo sen, koska tämä vaihe mittaa ajoneuvoja toisiinsa nähden, ei Maahan nähden. Alkuperäinen suhteellinen kovarianssi on takaa-ajajan absoluuttinen kovarianssi plus kohteen ilmoitetut sigmat, lisättynä ikään kuin riippumattomina (varovainen). Avaimet: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, valinnaiset <c6/> ja <c7/> sekä yksi tai useampi <c8/> avaimilla <c9/>, <c10/>, <c11/>, <c12/> (<c13/>, <c14/> tai <c15/>, ILLUSTRATIVE parametrit tiedostossa <c16/>) ja <c17/>; jaksojen kestot summautuvat vaiheen kestoksi. Telakointi-ikkuna on aika siitä hetkestä, jolloin suhteellinen sigma pysyy kaappausverhokäyrän sisällä, vaiheen loppuun. Toistot ovat erillisiä vaiheita omine tunnisteineen.

seg-088b78574ab4 = Keskimääräinen tila on moottorin Cowell-propagaattori Maan gravitaatiolla ja J2:lla sekä Auringolla ja Kuulla kolmansina kappaleina. Kovarianssi kulkee jokaisen <c1/>-osan läpi eteenpäin laskettavalla differenssitilasiirtymämatriisilla (nimellisajo ja kuusi häirittyä ajoa) ja valkoisella kiihtyvyyskohinalla. Poltto on tulonopeuden suuntaan määritellyllä kokoosuudella ja suuntausvirheellä. <b>Nimetty rajoitus:</b> sitoutetut Kuun kernel-leikkaukset sisältävät Kuun mutta eivät Aurinkoa, joten propagaattori ottaa Kuun kernelistä ja Auringon analyyttisestä sarjasta (Auringon kolmannen kappaleen termi on epäherkkä kyseisen sarjan virheelle); vaihe kertoo tapahtumassa, kumpaa se käytti, ja missä mikään kernel ei kata osaa, se käyttää analyyttistä sarjaa molemmille. Polttoa <b>ei ole kohdennettu</b>: nimellinen tila on siellä, minne määritelty poltto johtaa, ja Kuun vaiheet ottavat vain kovarianssin.

seg-e5a67295a5ae = Päivitykset, joita käytetään vain, kun asiakirja luettelee lähteen: <c1/> (paikkakorjaukset saatavuudella ja PDOP:lla moottorin space-service-volume-pyyhkäisystä oskuloivaa Maan rataa pitkin, joka edustaa kaarta, yksi pyyhkäisy per <c2/>; korjauksen sigma = PDOP:n mediaani kertaa <c3/>; odotetun informaation muoto pitää ajon deterministisenä) ja <c4/> (etäisyys ja etäisyyden muutosnopeus geosentrisessä suunnassa, joten taivaan tasoa ei havaita; päivityksen varianssi jaetaan seurantatyökuormalla). Avaimet: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, valinnaiset <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-3a69ca6723ba = Rannikko on lajin <c1/> rannikko ilman polttoa, päättyen ilmakehän tulorajapintaan; sen avaimet ovat yllä olevat rannikkoavaimet. Rajapinnalla vaihe lukee lentoratakulman ja sen sigman täydestä kovarianssista, todennäköisyyden, että kulma on määritellyn käytävän sisällä, huippuhidastuvuuden nimellisessä kulmassa ja molemmilla käytävän reunoilla (moottorin tasomainen ballistinen tulo Allen–Eggers-suljetun muodon rinnalla) valinnaista rajaa vasten sekä jalanjäljen: alasuuntainen määritellystä herkkyydestä, sivusuuntainen rajapinnan kovarianssista kiertoratatasoa vasten poikittain. Avaimet: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, valinnaiset <c8/>, <c9/> ja <c10/> (nimellinen paluutila, kuusi lukua, kun ketjussa ei ole Maahan suuntautuvaa polttoa sen tuottamiseksi). Mikään tässä ei mallinna kapselin nostovoimaa, ohjausta tai kuumenemista.

seg-352783ef7181 = Maaverkon peitto

seg-69d6ab8e93bc = Valinnainen taulukko <c1/> antaa asemat ja alimman seurantakorkeuskulman; kunkin nimeämänsä vaiheen osalta ketju laskee vaiheen osuuden, jonka asema voi seurata, ja välittää sen vaiheelle työkuormana, joka skaalaa sen maaseurantapäivitysnopeutta. Geometriat: <c2/> (tulotila lennettynä kahden kappaleen mallilla ja J2:lla, matalan kiertoradan vaiheille), <c3/> (ajoneuvo Kuun paikassa, kuunläheiselle risteilylle) ja <c4/> (antamasi työkuorma). Aseman vaihto menettää ajan <c5/>; vaiheen budjetti saa pisimmän välin, jolloin mikään asema ei ole näkyvissä, ja tapahtuma antaa työkuorman. Mikään ei mallinna verkon antenneja tai aikatauluja.

seg-467b14d7ef59 = <c1/>: <c2/> (indeksi, tunniste, laji, ajat, nimike, navigointi- ja aikalähteet, rajoittava lähde, tulo-, huippu- ja poistumissigmat, vaatimus, marginaali, <c3/> rivikohtaisella yksiköllä, <c4/>), <c5/> (pienin marginaali määriteltyyn vaatimukseen nähden, muuten suurin huippupaikka), <c6/>, ketjun <c7/> (heikoimman vaiheen nimike) sekä <c8/>-lohko. Kuva on 1-sigma-paikka ja kellon harha tehtävän ajan funktiona, yksi kaista vaihetta kohden.

seg-a3c40c51c2ff = Mitä todiste on

seg-1168810d4407 = Ketjun nimike on heikoimman vaiheen nimike, ja jokainen vaihe on MODELLED. Kuun propagaattoria verrataan LRO:hon ja CAPSTONEen (<s1><c1/></s1>); kuunläheistä kaarta verrataan julkiseen Horizons-lentorataan (<s2><c2/></s2>). Rivi täyttää kynnyksen tai jää siitä ennen ajoa sitoutettuun tiedostoon kiinnitetyn kynnyksen mukaan, ja ohitus kirjataan ohitukseksi. Mikään ei ole VALIDATED, ellei kirjanpito niin sano.

seg-ee3c5b58e6fa = <s1>Edellinen</s1>Kuun kiertorata ja pinta infrastruktuurina

seg-b963f8a02aed = <s1>Seuraava</s1>Tehtäväketju: Kuun osuus

seg-af81a8087ca7 = entry
