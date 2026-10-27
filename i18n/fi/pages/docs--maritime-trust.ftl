# docs--maritime-trust: translations (fi)

seg-2247a2344710 = Merkitys

seg-6940543aa3c0 = merkkijono

seg-abec93a4a488 = merkkijono tai null

seg-f5e7215e6835 = objekti

seg-b993ef559bd0 = Koodista

seg-c353e7bec219 = Avain

seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> tai <c4/>

seg-2896f449bffb = Lähde: <c1/>

seg-342f34403ac5 = Merenkulun luottamus: voiko silta luottaa tähän paikkaratkaisuun?

seg-49b609a9655c = <c1/> voi pisteyttää <b>liikkuvalle alukselle</b> jokaiselle paikkaratkaisulle reaaliaikaisen luottamusluvun 0-100 siitä, mitä mikä tahansa vastaanotin jo syöttää väylälle (ensin NMEA { "0183" }), ja kertoa, mitkä tarkistukset laskivat sitä. Se on ohjelmistokerros vastaanottimen vieressä. Se ei ole vastaanotin, se ei korvaa sellaista, eikä se tee paikkaratkaisusta tarkempaa.

seg-3c66739c9250 = <b>Ohjeellinen ohjelmisto.</b> Kshana ei ole tyyppihyväksytty navigointilaite (IEC { "61108" }, IEC { "61162" }), eikä sitä ole arvioitu suhteessa mihinkään suorituskykystandardiin. Sen pistemäärä ja gate ovat apuvälineitä navigoijan harkinnalle. Käyttäjä vastaa edelleen aluksen turvallisesta navigoinnista ja kaikista päätöksistä luottaa paikkaratkaisuun tai lopettaa sen luottaminen.

seg-a9899ca66661 = Tämä sivu kertoo, mitä tarkistukset katsovat, mitä kukin voi ja ei voi havaita, miten se ajetaan reaaliaikaisesti ja mitä gate tekee. Pistemäärän kuvaus ja kaikki oletukset ovat tiedostossa <a1><c1/></a1>.

seg-05e79b6c5a58 = Mitä se lukee

seg-e784fdbe26e6 = Alus ilmoitetaan istuntotiedostossa, ja sen rajat esitetään ennen ajoa:

seg-e8e9ee2965cf = Lause

seg-e127f2f26824 = Luettu

seg-5e17bb4156f1 = GGA

seg-b38b8385ddcb = sijainti, paikkaratkaisun laatu ({ "0" } = ei paikkaratkaisua), korkeus keskimerenpinnasta, geoidin erotus, HDOP

seg-870056f55c30 = RMC

seg-445c02505551 = tila (<c1/> kelvollinen, <c2/> ei), maanopeus ja -kurssi, päivämäärä, toimintatila

seg-8a259fc7b06d = VTG

seg-eb3e34f58751 = maanopeus ja -kurssi, kun RMC:ssä ei ole sellaisia

seg-add66711c27b = HDT, THS

seg-24e36e50b0ad = suunta (THS vain, kun sen toimintatila ei ole <c1/>)

seg-bcfb4cd59951 = VHW, VBW

seg-fa0a0dae1510 = nopeus veden suhteen (VBW vain, kun sen tila on <c1/>)

seg-774d1991fb0b = ZDA

seg-68d981999c72 = aika

seg-a0cc45088f5f = GSV

seg-0fad368a11cb = satelliittikohtainen signaalinvoimakkuus (dB-Hz), korkeuskulma ja atsimuutti (geometriaa varten)

seg-032eafc03b42 = GSA

seg-71334afb8a7d = DOP (tarkkuuden heikkenemiskerroin) ja käytetyt satelliitit (geometriaa varten, kun GSV ei anna taivasta; ja ilmoitettu HDOP, jota tarkistus vertaa)

seg-305f423d3ead = vastaanottimen ilmoittama OSNMA-tila, jonka vastaanotinta lukeva sovitin on muuntanut tähän lauseeseen: <c1/> todennettu, <c2/> epäonnistui, <c3/> ei tulosta

seg-7ce1d69e710e = Epookkeja, joista vastaanotin itse sanoo, etteivät ne ole satelliittipaikkaratkaisu (GGA-laatu { "0" } tai { "6" } – { "8" }: arvioitu, manuaalinen, simulaattori; RMC-tila <c1/> tai toimintatila <c2/>, <c3/>, <c4/>, <c5/>), ei käytetä paikkatarkistuksiin eikä ne ole todiste suuntaan eikä toiseen: vastaanotin on jo sen sanonut.

seg-a0ae80781c6e = Ensimmäiset <c1/> sekuntia muodostavat lähtötason, eikä niitä koskaan pisteytetä. Jokainen monitori katsoo vain nykyistä ja aiempia epookkeja, joten päätös epookilla ei muutu myöhempien tietojen saapuessa, ja reaaliaikainen virta antaa saman pistemäärän kuin sama teksti tiedostona luettuna.

seg-068593ad0a52 = Mitä kukin tarkistus havaitsee ja mitä ei

seg-094b90f0c701 = Paikkaratkaisujen väliset suunnat (käännösnopeustarkistuksen käyttämä raidesuunta, kahden sijainnin implikoima kurssi) ovat niiden välisen jänteen suunta, joka on geodeesin <b>keskimääräinen atsimuutti</b> paikkaratkaisujen välillä, ei eteenpäinatsimuutti ensimmäisessä paikkaratkaisussa; nämä kaksi eroavat noin puolella paikkaratkaisujen välisten meridiaanien suppenemisesta ({ "0.001" } astetta peruslinjalla, jonka pituus on { "260" } m, leveysasteella { "59.5" } astetta).

seg-ed3cdfcfbff5 = Väärennetyn sijainnin on täsmättävä aluksen fysiikkaan ja aluksen muihin antureihin. Jokainen tarkistus vertaa paikkaratkaisua yhteen niistä. Tarkistus on vain niin riippumaton kuin sen toinen lähde: GNSS-kompassin suunta tai GNSS:stä johdettu ”nopeus veden suhteen” ei ole riippumaton testattavasta vastaanottimesta eikä tuo mitään lisää.

seg-9480aabf136e = Tarkistus

seg-20e4f746c7e1 = Havaitsee

seg-e7b2ebe5eabc = Ei pysty

seg-21ad9895f606 = paikkahyppäys; reitti, jonka liikettä ilmoitettu nopeus ja kurssi eivät selitä; implisiittinen nopeus, kiihtyvyys tai kääntymisnopeus ilmoitettujen aluksen rajojen yli

seg-dcbc6d4cd17f = raahaus, jonka ilmoitettu nopeus ja kurssi seuraavat väärennettyä reittiä ja pysyvät rajojen sisällä (vastaanotin johtaa ne omasta ratkaisustaan, joten ne ovat keskenään samassa linjassa); liian korkeaksi asetettu nopeusraja

seg-3542f83a7988 = reitti, joka poikkeaa siitä, mihin alus osoittaa, enemmän kuin ilmoitettu ajautumiskulma (crab angle)

seg-75f4d659f716 = raahaus kurssin suuntaisesti (kurssi ei muutu); keulasuunta samasta vastaanottimesta tai GNSS-kompassista; toleranssin ylittävä sivuttaisvirta (väärä hälytys); nopeudet alle <c1/>

seg-09dde82be447 = raahaus, joka muuttaa maanopeutta suhteessa nopeuteen veden suhteen

seg-6ac740e5f51c = loki, joka on GNSS-johdettu; sallitun arvon ylittävä virta (väärä hälytys); sallittua hitaampi raahaus

seg-e85d5f0933b7 = korkeus, joka ei ole siellä, minne merenpinta ja ilmoitettu antennin korkeus sen asettavat

seg-3806e1d46332 = harhauttaja, joka pitää korkeuden uskottavana; toleranssi on leveä, koska yksittäisvastaanottimen pystysuuntainen virhe on suuri; geoidin erotus kirjataan mutta sitä ei tarkisteta, koska moottorissa ei ole geoidimallia

seg-5b70bd80640e = yhden lähettimen tunnusmerkki: C/N0 kaikilla satelliiteilla romahtaa yhdessä tai nousee yhdessä kalibrointilähtötasoon verrattuna

seg-e6874a8047b1 = harhauttaja, joka muotoilee tehon satelliittikohtaisesti; mikä tahansa, kun lähtötaso itse on harhautettu; liian hidas GSV-toistotiheys seurattavaksi

seg-371b17ce936a = vastaanottimen aika askeltaa epäsäännöllisesti tai kulkee taaksepäin; tämän tietokoneen kelloa vasten vastaanottimen aika ajautuu siitä (vain reaaliaikaiset virrat)

seg-026479cb7966 = väärennetty aika, joka on johdonmukainen ja tasainen; kello, joka on väärässä alusta asti

seg-906ab911b73d = ilmoitettu OSNMA-todennuksen epäonnistuminen

seg-a04757b7ae57 = tila luetaan, ei tarkisteta; harhauttajaa, joka vaimentaa ilmoituksen, ei nähdä

seg-c36c24a337b8 = tehon kieltäminen ja satelliittien menetys, kuten staattisessa tapauksessa

seg-9d751e1f5938 = <b>Mitä pelkästään NMEA:han perustuvat monitorit eivät voi.</b> Harhauttaja, joka toistaa koko tähdistön itsejohdonmukaisella paikalla, nopeudella, keulasuuntaan sopivalla kurssilla, uskottavalla satelliittikohtaisella teholla ja vastaavalla kellolla, on näkymätön kaikille yllä oleville tarkistuksille: mikään lauseissa ei erota sen paikkaratkaisua oikeasta. Sama koskee tallennettujen oikeiden signaalien toistoa. Todennus (OSNMA tai vastaanotin, jolla on oma harhautuksenesto) ja riippumattomat navigointianturit sulkevat tuon aukon; tämä kerros voi vain käyttää niiden ilmoittamaa tilaa. Virrassa, jota jo harhautetaan lähtötason muodostuessa, ei ole puhdasta lähtötasoa. Hälytyksen puuttuminen ei ole todiste hyvästä paikkaratkaisusta.

seg-e3e09e2412fb = Luottamuspistemäärä

seg-a1c05079de2f = Jokainen kalibroinnin jälkeinen epookki saa pistemäärän väliltä { "0" }–{ "100" } ja syyt, miksi se ei ole { "100" }: mitkä tarkistukset vähensivät, niiden tilasto kynnystä vasten ja niiden pisteet. Kaistat (rajat ilmoitettu istunnossa): <c1/> arvolla { "90" } tai yli, <c2/> arvolla { "55" } tai yli, <c3/> sen alapuolella. Kuvaus, jokainen paino ja sen peruste ovat tiedostossa <a1><c4/></a1>; se on deterministinen ja kiinnitetty ennen lokin pisteytystä, ilman oppimista ja ilman tapahtumiin sovitettua mitään.

seg-d56822e82e3d = Jokainen aluksen tuloste sisältää ohjeellisen lausunnon: tulos-JSONin ja jokaisen live-rivin avain <c1/>, CSV:n ensimmäinen kommenttirivi <c2/> (lukijat ohittavat sen kommenttivalitsimellaan), SVG:n kuvaus <c3/> ja alatunniste. Eräajon tulosteet: <c4/> (pistemallin ja jokaisen epookin vähennysten kanssa), <c5/> (sarakkeilla <c6/> ja <c7/>) ja <c8/>, joka aluksella on vastaanottimen ilmoittama reitti luottamuskaistan värillä pistemäärän yläpuolella ajan funktiona.

seg-918516588036 = Synteettinen demo

seg-e6717d346ca6 = <c1/> sisältää tekaistun NMEA-lokin lautasta Tallinna–Helsinki-reitillä (50 minuutin ote, noin { "17" } kn, { "1" } Hz: GGA, RMC, VTG, gyrokeulasuunta, nopeusloki, GSV uskottavalla taivaalla), jossa paikan raahaus pois vetää <em>ilmoitetun</em> paikan pois aluksen todellisesta paikasta alkaen hetkestä { "1500" } s. Vastaanotin ilmoittaa koko ajan <b>pätevän</b> paikkaratkaisun; luottamuspistemäärä on se, joka laskee, heikentyneen kaistan kautta luottamattomaan. <c2/> ilmoittaa jokaisen kynnyksen, aluksen rajat ja jokaisen pistepainon ennen ajoa.

seg-b2f24e5091d0 = Loki on <b>tiedostoon kirjoitettua tekstiä</b>, jonka tuottaa <c1/>: se ei mallinna mitään radiosignaalia eikä lähetä mitään. Se ei ole mittaus, ja reitti on havainnollistava, ei merikartta. <c2/> kiinnittää lokin ja odotetun tulosteen regressiosuojiksi synteettiselle datalle; ne eivät kerro mitään siitä, miten mikään monitori toimii todellisessa häiriössä.

seg-26ab8544afba = Luottamuspistemäärä yhden synteettisen kulun yli, moottorin v{ $version } todellisesta ajosta aineistolla examples/maritime-trust (tekaistu NMEA-loki lautasta Tallinna–Helsinki-reitillä, { "3001" } epookkia taajuudella { "1" } Hz). Kolme kaistaa jakaa yhden aika-akselin. Ylhäällä: vastaanottimen ilmoittaman paikan ja aluksen todellisen paikan välinen etäisyys, joka pysyy muutaman metrin sisällä noin hetkeen { "1576" } s asti, kun lokin käsikirjoitettu paikan raahaus vetää sen pois, vaikka vastaanotin ilmoittaa edelleen pätevän paikkaratkaisun. Keskellä: luottamuspistemäärä { "0" }–{ "100" }, jota ei lasketa kalibroinnin ensimmäisten { "300" } s aikana, nimelliskaistalla (vähintään { "90" }) raahaukseen asti, sitten laskien heikentyneen kaistan (vähintään { "55" }) kautta luottamattomaan kaistaan. Alhaalla: kunkin epookin kaista värillisenä nauhana nimineen. Pistemäärä on ohjeellinen. Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC { "61108" }, IEC { "61162" }): käyttäjä vastaa edelleen aluksen navigoinnista. Loki on tekaistu muodon ja monitorien havainnollistamiseksi; se ei ole mittaus eikä kerro mitään siitä, miten mikään vastaanotin toimisi.

seg-ed183c325c7e = Kuvan piirtää <c1/> tämän demon todellisesta ajosta (<c2/>); pistemäärä on ohjeellinen, ja loki on tekaistu.

seg-8badaf0d8586 = Studion näkymän määrittely

seg-588092535a89 = Sille, joka rakentaa aluksen ajon Studio-näkymän. Mitään tämän osion sisällöstä ei ole vielä toteutettu Studiossa; moottorin puoli (alla oleva data) on.

seg-5c34f31acf1d = <b>Syötteet.</b> Jompikumpi:

seg-57ca6d9000b1 = eräajon tulos-JSON (<c1/> tai sama WebAssembly-paketin kautta kohdassa <c2/>, loki sisäisenä): <c3/> (kaistarajat, ramppi, todisteen pito, jokainen paino), <c4/>, <c5/> ja <c6/>, kussakin <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, ja versiosta { "0.36" } <c12/> sekä kunkin vähennyksen <c13/>, ylätasolla <c14/> ja <c15/>; tai

seg-bfab64386b6c = live-JSON-rivit (yllä oleva skeema), yksi olio epookkia kohti, lisättynä virran edetessä. Jokainen rivi sisältää vastaanottimen ilmoittaman kentän <c1/> (skeema { "1.1" }).

seg-f7c7462d315e = Demojoukko on <c1/>: <c2/>, <c3/> (loki) ja <c4/> (<c5/>: missä alus todella oli, mitä yhdessäkään oikeassa lokissa ei ole). Näkymän tulisi ajaa istunto ja lukea totuustiedosto rinnalla.

seg-c015c26cf30a = Mitä piirretään.

seg-92f452bdbed6 = <em>Reitti</em>, pohjoinen ylhäällä, yksi mittakaava molemmilla akseleilla: vastaanottimen ilmoittamat paikat viivana, joka on väritetty epookin kaistan mukaan (harmaa kalibroi, vihreä nimellinen, keltainen heikentynyt, punainen luottamaton), alku ja loppu merkittyinä, mittakaavajana. Demossa todellinen reitti ohuena neutraalina viivana sen alla, jotta raahaus näkyy kahden erkaantumisena; kytkin todelliselle reitille ja metreinä ilmaistu poikkeama kursorin ajanhetkellä.

seg-3ba328e2188c = <em>Pistemääräaikajana</em>: pistemäärä { "0" }–{ "100" } ajan funktiona, kaistarajat (<c1/> ja <c2/> kohdasta <c3/>) katkoviivoina, kaista nauhana alla ja minkä tahansa ilmoitetun tapahtuman alku merkkinä. Aika-akseli on jaettu reitin kanssa.

seg-33447da1d56d = <em>Syyt</em>: kursorin kohdalla olevalle epookille vähennykset (monitori, suhde kynnykseen, pisteet) vaakapalkkeina, suurin ensin, kunkin monitorin painolla kohdasta <c1/>; monitorit, jotka ajettiin ja maksoivat ei mitään, heikosti näkyvinä, monitorit, joita ei ajettu (eivät kohdassa <c2/>), lueteltuina merkinnällä ”ei ajettu”, ei koskaan läpäisseinä. Monitorilla <c3/> ei ole kohdan <c4/> merkintää: sen katto on <c5/>.

seg-d0379b68ea67 = <em>Monitorinauhat</em>: yksi ohut nauha jokaiselle monitorille, joka on luettelossa <c1/>, ja se näyttää monitorin suhteen ajan funktiona (hälytys arvolla { "1" }), jotta lukija näkee, mikä tarkistus liikahti ensin.

seg-83d881ce6ab0 = <em>Portin tila</em>: live-näkymässä kunkin epookin <c1/> (<c2/>, <c3/>, <c4/>) kaistanauhan alla olevana nauhana sekä viimeisin <c5/>. Eräajonäkymässä epookit, jotka portti olisi pidättänyt, ovat ne, joiden kaista on luottamaton, vapautuspito sovellettuna.

seg-b96652af3a03 = <em>Geometriakaista</em> ({ "0.36" }): kaistanauhan alla oleva nauha, joka on väritetty kohdan <c1/> mukaan (vihreä hyvä, keltainen heikentynyt, harmaa viivoitettu tuntematon), eri väriperheessä kuin epäjohdonmukaisuus- ja ympäristökaistat, selitteellä ”geometria: taivas, ei signaali”. Vähennykset väritettyinä kentän <c2/> mukaan (geometria, ympäristö, epäjohdonmukaisuus) syypaneelissa ja monitorinauhoissa, sekä epookkikohtaiset luokkamäärät kohdasta <c3/> kaistamäärien vieressä. Kursorin kohdalla olevalle epookille: <c4/>, <c5/>, HDOP, PDOP, VDOP, <c6/>, <c7/> ja lippu, kun <c8/> on asetettu (geometriavähennys on silloin epäjohdonmukaisuus). <c9/> näytetään tekstinä ”geometria tuntematon: lokissa ei ole GSV- eikä GSA-lausetta”, ei koskaan hyvänä. Kohdan <c10/> kynnykset ja niiden alkuperä kohdasta <c11/> sijoitetaan pistemääräasetusten viereen. Ohjeellinen huomautus säilyy.

seg-c48906d03f90 = <em>Vastaanottimen ilmoittama paikkaratkaisu</em>: demon vastaanotin ilmoittaa pätevän paikkaratkaisun koko ajan (GGA-laatu { "1" }, RMC-tila A); sano se selitteessä, koska se on näkymän pointti.

seg-869c8a92e2cf = <b>Vuorovaikutus.</b> Yksi aikakursori jaettuna kaikkien paneelien kesken (vedä, nuolinäppäimet ja toistopainike, joka toistaa nopeudella 1x–60x); reitin tai minkä tahansa nauhan päällä liikkuminen siirtää sitä. Vähennyksen napsauttaminen korostaa epookit, joilla kyseinen monitori oli aloituskynnyksensä yläpuolella. Kaistasuodatin (näytä vain heikentyneet ja luottamattomat epookit) sekä hyppy ensimmäiseen vähennykseen ja ensimmäiseen luottamattomaan epookkiin. Jokaisen monitorin nimen päällä oleva vihjeteksti antaa tämän sivun yhden rivin kuvauksen. Istunnon kynnykset ja painot näytetään vain luku -tilassa kaavion vieressä, jotta näkyy, mitä pistemäärä käytti.

seg-1f97fe8ea2f1 = <b>Säilytettävä sanamuoto.</b> Sivun on sanottava, että se on ohjeellinen ohjelmisto eikä tyyppihyväksytty navigointilaite, että demo on synteettistä tekstiä tekaistulla raahauksella ja että paikkaratkaisu ilman hälytystä ei sen vuoksi ole hyvä paikkaratkaisu (ks. yllä olevat rajat). Mikään sivun luku ei saa näyttää mittarilta siitä, miten tarkistukset toimivat todellisessa häiriössä.

seg-079ce44fd53e = Niille kutsujille, jotka pitävät istunnon ja tavut muistissa (ei tiedostoja, ei kelloa, ei soketteja; turvallinen WebAssemblylle), <c1/> tarjoaa:

seg-e8c3172d72b8 = <c1/>: kokonainen loki pisteytettynä eräajona; sama tulos kuin <c2/>, joka serialisoituu tulos-JSONiksi (<c3/>, <c4/>, <c5/> pistemäärin ja vähennyksin).

seg-0302b7c35fd3 = <c1/>: rajattu pala virrasta (enintään { "2" } MiB ja { "20,000" } epookkia, ja riittävän pitkä sisältämään kalibrointi-ikkunan), pisteytettynä kuten live-tila pisteyttää ja palautettuna live-JSON-rivien skeemassa (<c2/>, viimeinen <c3/>, kaistamäärien yhteenveto, alin ja lopullinen pistemäärä, ensimmäisen luottamattoman ajanhetki). Vastaanottimen aikaa ei verrata isäntäkelloon. Pitkään käynnissä oleva live-tila (soketit, liitettävä tiedosto, portti) kuuluu binäärille.

seg-d971dae93784 = Molemmat tarvitsevat istunnon, jossa on <c1/>; sen taulu <c2/> on valinnainen.

seg-870fece8026e = Aja se livenä

seg-c132d449414f = Istunto on sama <c1/> kuin eräajossa, ja siinä on taulu <c2/>, joka ilmoittaa <c3/>; sen taulua <c4/> ei tarvita. Sarjaportteja ei vielä avata suoraan: lue portti jo käyttämälläsi työkalulla (<c5/> ja <c6/>, terminaalipalvelin, multiplekseri) ja putkita tai välitä se. Suora sarjasyöte voi tulla myöhemmin.

seg-13a043c1ce60 = Jokainen valmis epookki kirjoittaa yhden JSON-rivin stdoutiin:

seg-b1f0c563c94d = <c1/> on <c2/>, <c3/>, <c4/> tai <c5/> (pistemäärän kaista, rajat istunnon taulussa <c6/>); <c7/> puuttuu kalibroinnin aikana; <c8/> luettelee, mitkä tarkistukset veivät pisteitä ja kuinka monta, suurin ensin.

seg-9b21238a7dc1 = JSON-rivien skeema (versio { "1.1" })

seg-79306ff2d878 = Yksi JSON-olio jokaista valmista epookkia kohti, avaimet tässä järjestyksessä:

seg-a129b9e613d0 = Tyyppi

seg-bbcdd898d24d = kokonaisluku

seg-96958263575f = raportoitujen epookkien lukumäärä alkaen arvosta { "1" }

seg-16022703e1c0 = luku

seg-95dde7698840 = sekunteja virran ensimmäisestä epookista

seg-dee4f7b91079 = epookin aika sellaisena kuin virta sen ilmoittaa (ISO-8601 UTC päivämäärällä, kun RMC on nähty, muuten <c1/>)

seg-0361f40a8e59 = luku tai null

seg-c2418289d966 = { "0" }–{ "100" }, yksi desimaali; null kalibroinnin aikana tai kun <c1/> kertoo, miksi mitään ei voitu tuottaa

seg-00575e5df2e1 = taulukko

seg-54c1f879643b = <c1/>, suurimmat pisteet ensin; <c2/> on tilasto jaettuna kynnyksellä (hälytys arvolla { "1" } tai yli); vain pisteitä maksaneet monitorit luetellaan; <c3/> <em>(lisätty versiossa { "1.3" })</em> on <c4/>, <c5/> tai <c6/>

seg-24d178dfb34f = merkkijonotaulukko

seg-30948e769405 = monitorit, jotka ovat kynnyksellään tai sen yläpuolella

seg-fb08af60656f = <c1/>, <c2/> tai <c3/>

seg-495aa49df7e2 = miksi pistemäärää ei tuotettu (esimerkiksi ilmoitettu keulasuunta-anturi puuttuu)

seg-3dabfd59cf4b = olio tai null

seg-9395d2543ac0 = <em>(lisätty versiossa { "1.1" })</em> vastaanottimen tällä epookilla ilmoittama paikka, <c1/> (korkeus ellipsoidinen, kun lause antaa geoidin erotuksen, muuten keskimerenpinnan yläpuolella); null, kun vastaanotin ei antanut mitään, mukaan lukien kalibroinnin epookit ilman paikkaratkaisua

seg-3af4806d7d74 = <em>(lisätty versiossa { "1.2" })</em> mitä tämä ohjelmisto on ja ei ole: ohjeellinen, ei tyyppihyväksytty navigointilaite, käyttäjä vastaa edelleen

seg-79adcc5ee873 = <em>(lisätty versiossa { "1.3" })</em> satelliittigeometria: <c1/> (<c2/>, <c3/>, <c4/>, kun virrassa ei ole GSV-korkeus- ja atsimuuttikulmia eikä GSA:ta), <c5/> (<c6/>, <c7/>, <c8/>, <c9/>), <c10/> (<c11/>, <c12/>, <c13/>), <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/> (näkyvissä olevat mutta ei seurattavat satelliitit, kun näkyvän taivaan DOP on hyvä: geometriavähennys on silloin <c26/>), <c27/> (<c28/>, <c29/>, <c30/>, <c31/>: aina raportoitu, ei koskaan pisteytetty; pistemäärä vähentää vain arvosta <c32/>) (ks. <a1><c33/></a1>)

seg-fc212411bf3c = Monitorien nimet (kebab-case; { "17" }): <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/> ja versiosta { "1.3" } <c17/>. Uusia nimiä voidaan lisätä myöhemmissä versioissa; kuluttajien tulee käsitellä tuntematonta monitorin nimeä monitorina. Alla oleva asettelu <c18/> kantaa versiotunnuksen ensimmäisessä kentässään; tämä JSON-skeema on versio { "1.3" }: { "1.1" } lisäsi kentän <c19/>, { "1.2" } kentän <c20/>, { "1.3" } kentän <c21/> loppuun ja kentän <c22/> jokaiseen vähennykseen, ja se muuttuu vain lisäämällä avaimia loppuun.

seg-0019bf7fbfcd = Todennussyöte

seg-39b3dfbd97cc = Monitori <c1/> ottaa satelliittikohtaisen todennustilan todennuslähteestä kohdan <c2/> kautta (luettelo <c3/>, tila <c4/>, <c5/> tai <c6/>) kokonaistilan <c7/> rinnalla. NMEA-puolella saman kantaa <c8/>, esimerkiksi <c9/>. Mikä tahansa epäonnistuminen, kokonais- tai yksittäisen satelliitin, hälyttää monitorin ja maksaa sen koko painon (sille annetaan suhde { "1.5" }); onnistuminen ei ole todiste. Kshana ei varmenna täällä mitään: lähde, joka varmentaa, vastaa ilmoittamastaan tilasta.

seg-8ffc94901796 = Epookki on valmis, kun seuraava ajoitettu lause saapuu; hitaampien tai synkronoimattomien laitteiden lauseet (gyro muutaman kymmenesosasekunnin vastaanottimen perässä), jotka saapuvat ennen sitä, kuuluvat siihen. Jos virta pysähtyy ajaksi <c1/> (oletus { "1.5" } s, aseta se pidemmäksi kuin vastaanottimesi ajoitettujen lauseiden pisin väli), epookki viimeistellään sellaisenaan. Virran ensimmäiset <c2/> sekuntia muodostavat lähtötason eikä niitä koskaan pisteytetä, joten <b>virralla, jota jo harhautetaan, kun se ensimmäisen kerran yhdistetään, ei ole puhdasta lähtötasoa</b>: käynnistä kerros ennen matkaa tai kun paikkaratkaisun tiedetään olevan hyvä. Kalibrointi-ikkuna sulkeutuu kerran, saapumisen mukaan: epookki, jonka aika on aiempi kuin jo nähty aika (taaksepäinkelaus, virran alun toisto), ei ole koskaan kalibrointia riippumatta siitä, mitä sen aika sanoo; se pisteytetään täydellä vähennyksellä <c3/>, joka on luottamaton. Live-moottori pisteyttää jokaisen epookin kalibrointiepookkien ja virran viimeisen minuutin tai niin yli, joten sen kustannus epookkia kohti kasvaa arvon <c4/> kertaa epookkitaajuuden mukana; pidä ikkuna lyhyenä nopealla vastaanottimella. Sen puskurit ovat rajattuja (lauseiden tulva ilman ajoitettua lausetta viimeistellään joka { "5,000" } riviltä, kalibrointi ja historia on rajattu arvoon { "20,000" } epookkia).

seg-2ef5aad7c750 = Vastaanottimen aikaa verrataan myös tämän tietokoneen monotoniseen kelloon, jolla on merkitystä vain reaaliajassa saapuvalle virralle. Täydellä nopeudella stdinin, TCP:n tai UDP:n kautta syötetty tallennettu loki laukaisee tämän tarkistuksen väistämättä: anna <c1/>. (<c2/> ilman kohtaa <c3/> tarkoittaa sitä jo.) Komento <c4/> luetaan toistona, kunnes se on luettu loppuun, ja isäntäkello otetaan käyttöön siitä eteenpäin, joten kertynyt jono ei näy kellovikana; tarkistus vaatii sen jälkeen, että kalibrointi-ikkuna on yhä auki (muuten sillä ei ole lähtötasoa eikä se aja).

seg-a06e58b2cfc8 = Virran päättyminen ja viat: stdin ja tiedosto, jotka luetaan loppuun, päättyvät normaalisti (poistumiskoodi { "0" }). TCP-yhteys, jonka vastapuoli sulkee, ei ole normaali loppu virralle, jonka pitäisi jatkua: kerros poistuu nollasta poikkeavalla koodilla pisteytettyään ja kirjoitettuaan kaiken vastaanottamansa eikä yhdistä uudelleen, joten aja se valvojan alaisena, joka käynnistää sen uudelleen. UDP-datagrammit, jotka jakavat lauseen, yhdistetään; stdinin, tiedoston ja TCP:n lukijoita tukee rajattu jono, joka kohdistaa lähettäjään vastapainetta (mitään ei katoa), kun taas UDP, joka ei voi kohdistaa vastapainetta, pudottaa datagrammit, joita moottori ei voi ottaa, ja kertoo siitä stderriin. <c1/> sitoutuu loopback-osoitteeseen; anna <c2/> kuunnellaksesi muualla (varoitus tulostetaan).

seg-0a0ed5e74ea4 = <c1/>: valmistajakohtainen lause

seg-71ccf4a80c99 = Jokainen epookki tuottaa myös yhden NMEA { "0183" } -standardin mukaisen lauseen, jossa on kelvollinen tarkistussumma, jonka <c1/> kirjoittaa tiedostoon tai stdoutiin ja jonka portti lisää eteenpäin välitettävään virtaan:

seg-df9382f4b055 = <c1/>: muotoversio

seg-6986879f86fb = epookin UTC-aika, <c1/>; tyhjä, jos virta ei antanut sellaista

seg-34418696f9d2 = luottamuspistemäärä { "0" }–{ "100" }, yksi desimaali; tyhjä kalibroinnin aikana tai kun mitään ei voitu tuottaa

seg-0b249ba73868 = kaista: <c1/> kalibroi, <c2/> nimellinen, <c3/> heikentynyt, <c4/> luottamaton

seg-281aba68405a = portti: <c1/> pois, <c2/> läpi päästetty, <c3/> pidätetty (paikkaratkaisu merkittiin virheelliseksi eteenpäin välitetyssä jaksossa)

seg-f306c3f54a48 = enintään kaksi syytä, <c1/> yhdistettynä merkillä <c2/>; tyhjä, kun mitään ei vähennetty

seg-4bee29dfe578 = Osoite on <c1/> + valmistajan lyhenne <c2/> + <c3/>. Laitteisto, joka ei tunne valmistajakohtaista lausetta, ohittaa sen. Kshana ohittaa oman lauseensa <c4/> syötteessä.

seg-d75c9da94f37 = Porttitila

seg-30c1f4a5706c = <c1/> asettaa Kshanan vastaanottimen ja sen paikkaratkaisua käyttävän laitteiston (karttajärjestelmä, reitinohjausjärjestelmä) väliin. NMEA-virta menee sisään, tulee ulos stdoutiin ja on:

seg-aa0692146620 = <b>välitetty muuttumattomana</b>, kun epookki ei ole luottamaton (ja kalibroinnin aikana), ja jokaisen lausejakson jälkeen tulee <c1/>; ja

seg-bbdd68edbb17 = <b>merkitty virheelliseksi</b>, kun se on luottamaton: GGA-laatu <c1/>; RMC-tila <c2/> (ja sen tilailmaisin <c3/> sekä navigointitila <c4/>, kun läsnä); GNS-tila <c5/> jokaisessa paikassa; GLL-tila <c6/> ja tila <c7/>; VTG-tila <c8/>, kun sillä on sellainen. Paikkakenttiä ei muuteta: pointti on, että laitteisto näkee vastaanottimen itse ilmoittavan paikkaratkaisun virheelliseksi ja nostaa oman hälytyksensä. Jokaisen uudelleenkirjoitetun lauseen tarkistussumma lasketaan uudelleen.

seg-23ee46747297 = Kun paikkaratkaisu on kerran pidätetty, se vapautetaan vasta, kun epookit ovat olleet pois luottamattomasta kaistasta ajan <c1/> (oletus { "30" } s), jotta kaistan reunalla oleva pistemäärä ei saa paikkaratkaisua vilkkumaan. JSON-rivit menevät vain sinne, minne <c2/> sanoo (oletuksena ei minnekään, koska virralla on stdout).

seg-6b7b557a4909 = Jotta karttaplotteri voi yhdistää suoraan, tarjoile portitettu virta TCP:n yli stdoutin sijaan:

seg-96ff51df9abe = <c1/> kuuntelee loopback-osoitetta; <c2/> kuuntelee muualla (varoitus tulostetaan, koska kuka tahansa, joka tavoittaa osoitteen, voi lukea virran). Mikä tahansa määrä asiakkaita voi yhdistää; kukin saa saman virran yhdistämishetkestä alkaen, ja asiakkaat vain lukevat. Jokaisella asiakkaalla on oma rajattu jono ja kirjoittaja, joten se, joka ei pysy mukana, pudotetaan (yhteys suljetaan, rivi stderriin) eikä se koskaan viivästytä muita tai syötettä. <c3/> tarvitsee kohdan <c4/>; stdout ei silloin kanna mitään virrasta, joten <c5/> on vapaa.

seg-960e0abb0466 = Mitä portti ei tee ja mitä on hyvä tietää ennen sen käyttöä:

seg-ee3f18efa84c = Se on <b>valinnainen</b>. Mikään ei merkitse paikkaratkaisua virheelliseksi, ellei kohtaa <c1/> anneta.

seg-9cd8243cb437 = Se <b>lisää latenssia</b>: jaksoa pidetään, kunnes sen epookki on pisteytetty, mikä on aika seuraavaan ajoitettuun lauseeseen (noin yksi jakso: sekunti, kun vastaanotin toimii taajuudella { "1" } Hz), tai <c1/> viimeisen jälkeen, kun virta pysähtyy. Laitteisto, joka tarvitsee lauseen muutaman kymmenen millisekunnin kuluessa vastaanottimen tulosteesta, ei saa olla sen takana.

seg-ec63f8f3230b = Se on <b>ketjun yksittäinen piste</b>: jos se pysähtyy, virta pysähtyy. Aja se valvottuna ja päätä etukäteen, mitä alavirran laitteisto tekee ilman virtaa.

seg-536e41a6a5e7 = Se <b>sulkeutuu vikatilanteessa (fail closed) omien vikojensa kohdalla</b>: jos monitorit eivät voi tuottaa pistemäärää kalibroinnin jälkeen (ilmoitettu keulasuunta-anturi, joka ei lähetä mitään, liian vähän kalibrointiepookkeja), epookki on luottamaton, kantaa kohdan <c1/> ja pidätetään; vapautuspito ajastetaan tämän tietokoneen kellolla, ei vastaanottimen ajalla, jota harhauttaja hallitsee (toistossa on vain vastaanottimen aika).

seg-5dd62cd853c6 = Se voi <b>pidättää hyvän paikkaratkaisun</b> (väärä hälytys) samoin kuin päästää läpi harhautetun (havaitsematta jäänyt tapahtuma). Monitorit tarkistavat paikkaratkaisun aluksen fysiikkaa ja sen muita antureita vastaan; väärennös, joka on johdonmukainen niiden kaikkien kanssa, jää huomaamatta (ks. alla olevat rajoitukset).

seg-a284a3ec9dfe = Se odottaa <b>pelkkää tekstivirtaa muodossa NMEA { "0183" }</b>. Virtaan sekoittuneet binäärikehykset välitetään muuttumattomina, mutta <c1/> voi silloin päätyä kehyksen tavujen väliin.

seg-0c919698fa92 = Se <b>ei ole tyyppihyväksytty</b>, eikä mitään sen osaa ole arvioitu standardia IEC { "61108" } tai IEC { "61162" } vastaan. Käyttäjä vastaa edelleen aluksen navigoinnista.

seg-9e3ea39c38cf = <s1>Edellinen</s1>Vastaanottimen luottamus

seg-136da5c10b2d = <s1>Seuraava</s1>NMEA-harjoitusvirrat

seg-990a49527516 = $PKSHT: valmistajakohtainen sanoma
