# docs--positioning: translations (fi)

seg-6555ff9a6d8e = Tuloste

seg-0be9b5747c00 = Kshana

seg-94058315dfe4 = Syöte

seg-09721fbcf7fc = Lähde: <c1/>

seg-5b362d7b0903 = Kshana on avoin, toistettava <b>PNT-kestävyyden (paikannus, navigointi ja ajanmääritys) todistemoottori</b>. Kuvaat skenaarion — anturit tai kellot, GNSS-katkon (global navigation satellite system), häirintä- tai harhautushyökkäyksen, budjetin — ja se kertoo, miten hyvin aika ja sijainti pitävät, pisteytettynä operatiivisia laatumittareita (FoM) vasten. Jokainen näiden lukujen takana oleva ominaisuus on merkitty koneellisesti tarkistetussa matriisissa tasolle <b>VALIDATED</b> (tarkistettu riippumatonta ulkoista oraakkelia vasten), <b>MODELLED</b> (sisäisesti johdonmukainen, ei ulkoisesti tarkistettu) tai <b>PARTNER</b> (laitteistokumppanin omistama). Tämä sivu kertoo, missä se on vahvimmillaan, mihin se on tarkoitettu ja mitä se ei ole.

seg-48d576a345e3 = Missä se on vahvimmillaan: kriittisen infrastruktuurin ajoitus ja holdover

seg-f41d8a48ff13 = Moottorin parhaiten validoitu osa on ajoitus. Telekommunikaatioverkot, sähköverkot ja rahoitusmarkkinat saavat aikansa GNSS:ltä, ja jokaisen on mitoitettava <b>holdover</b>: kuinka kauan paikallinen kello voi käydä vapaasti GNSS:n menetyksen läpi, ennen kuin sen aikavirhe rikkoo budjetin.

seg-70d00c5fe203 = <b>Mikä on VALIDATED.</b> Taajuusvakausestimaattorit, joista holdover-vastaus rakennetaan — Allanin poikkeama (ADEV), muunnettu Allanin poikkeama (MDEV), aikapoikkeama (TDEV), suurin aikavälivirhe (MTIE) ja laajennetun alueen Theo1-estimaattori — on tarkistettu Stable32-viitepoikkeamia, riippumatonta <c1/>-kirjastoa ja todellista mitattua cesiumkelloa vasten. Holdover-liukuman varianssilaskenta ja sen käänteistys holdover-ajaksi on tarkistettu SciPyä vasten. Katso <a1><c2/></a1> kunkin rivin, testin ja oraakkelin osalta.

seg-9fbedc930565 = <b>Mikä pysyy MODELLED.</b> Kellolajikohtaiset kohinalattiat (esimerkiksi tietyn oskillaattorilajin pitkän aikavälin lattia) määräävät vastauksen vakaalle kellolle, ja ne ovat edustavia lukuja, eivät laitteesi mittauksia. Anna mitatut lattiat luvulle, jota aiot puolustaa.

seg-700df4898ede = <b>Telealan yksiköt.</b> Skenaariolaji <c1/> raportoi MTIE:n ja TDEV:n, tarkistaa ne International Telecommunication Union Telecommunication Standardization Sectorin (ITU-T) maskeja vasten — G.8272 ensisijaiselle vertailuaikakellolle (PRTC), G.8272.1 parannetulle PRTC:lle (ePRTC), G.8273.2 telealan rajakellolle (T-BC) ja G.8271.1 verkon rajoille vertailupisteessä C — ja raportoi, kuinka kauan holdover pysyy kunkin aikavirhebudjetin sisällä. Katso <a1><c2/></a1>.

seg-50421d8247ab = Mikä tekee siitä erilaisen

seg-7ec913b140ed = Fysiikka ja standardit eivät ole ero: Simplified General Perturbations { "4" } (SGP4) -propagointi, Allanin poikkeama, koordinaatistot ja DOP ovat saatavilla, ilmaisia ja oikein muissa kirjastoissa, ja Kshana tarkistaa itsensä useita niistä vasten. Ero on todistekuri:

seg-f7d466d5215b = <b>Avoin.</b> Moottori on GNU Affero General Public License (AGPL) -lisenssin alainen, joten kuka tahansa voi lukea ja ajaa sen uudelleen. Suljettuun integrointiin on olemassa kaupallinen lisenssi.

seg-76ff24c1939b = <b>Toistettava.</b> Tuloksen määrää <c1/>, bitti bitiltä, ja ajon voi jakaa linkkinä selaimen leikkikenttään.

seg-6df34e089b53 = <b>Alkuperämerkitty.</b> Jokainen anturiparametri on jäljitetty julkaistuun lähteeseen (<a1><c1/></a1>), ja jokaisella ominaisuudella on VALIDATED / MODELLED / PARTNER -tasonsa. Jatkuvan integroinnin (CI) vartija hylkää VALIDATED-rivin, jolla ei ole riippumatonta ulkoista oraakkelia, joten sisäistä itsetarkistusta ei voi esittää validointina.

seg-8bccfe110f4c = Emme ole löytäneet toista avointa työkalua, joka yhdistää nämä holdoverin, eheyden, inertialiukuman ja kvanttianturien yli, mutta haku, joka ei löydä mitään, ei todista, ettei mitään ole; emme väitä olevamme ainoa.

seg-e942b2474960 = Kvantti: neutraali kauppatutkimusmenetelmä, tulokset merkitty MODELLED

seg-655769464447 = Kshana vertaa kvantti- ja klassisia kelloja sekä inertia-antureita samalla skenaariolla samalla koodilla: jokainen laite on virhemalli, eikä moottori tiedä, mikä niistä on ”kvantti”. Pidä sitä <b>neutraalina kvantti–klassinen-kauppatutkimusmenetelmänä, jonka tulokset on merkitty MODELLED</b>. Useimmat syötteet ovat julkaistuja Allan-/kohinabudjettikertoimia; kylmäatomi-interferometrisellä kiihtyvyysanturilla on perusperiaatteista johtava kerros, joka johtaa sen kohinakertoimen. Kumppanin mitatun Allanin poikkeaman datan voi syöttää lajin <c1/> kautta, mikä on reitti tietyn laitteen lukujen ylentämiseen. Katso <a1><c2/></a1> ja <a2><c3/></a2>.

seg-eb5d247b42aa = Kuu, kuunläheinen ja syvä avaruus: ylläpidetty, ei pääotsikko

seg-4b9bd68b7fb1 = Kuun / kuunläheinen paketti (Kuun eheysvalvonta, Maa–Kuu-kolmen kappaleen ydin, Kuun aika-asteikot, palvelutilavuusanalyysi) ja syvän avaruuden radiometrinen navigointimoottori ovat ylläpidettyjä ominaisuuksia. Useimmat niiden riveistä ovat MODELLED, ja Kuun navigointia palvelevat jo omistetut työkalut, joten ne tarjotaan saman moottorin ominaisuuksina, kukin omalla tasollaan, eikä pääotsikkona.

seg-26f242f1bef8 = Moottorin muu osa

seg-b9b2e29e51d9 = Sama moottori samoilla tasoilla kattaa myös:

seg-89d1923b3ed9 = <b>Matalan Maan radan (LEO) PNT päästä päähän.</b> Signaalisuunnittelu (<c1/>), ohitus ja kaistakohtainen linkkibudjetti (<c2/>), lähetetty navigointiviesti (<c3/>), yhdistetty keski- ja matalan Maan radan paikannus (<c4/>), tarkan pistepaikannuksen (PPP) konvergenssi LEO-täydennyksellä (<c5/>), paikannus 5G:n ei-maanpäällisestä verkosta (<c6/>) sekä <c7/>, joka luovuttaa kunkin vaiheen tulosteen seuraavalle yhdelle järjestelmälle.

seg-2e5b57ccd454 = <b>Spektri.</b> L-kaistan (sekä ultrakorkeataajuus (UHF)-, S- ja C-kaistan) tehospektritiheyden vesiputous käsikirjoitetun häirintäaikajanan alla, kaistakohtaisella häirintä–signaali-suhteella ja efektiivisellä kantoaalto–kohinatiheydellä (<c1/>), sekä Signal Metadata Format (SigMF) -tallenteen syöttö ja tulostus.

seg-0e7fd993a838 = <b>Aurinkokunta ja mikä tahansa keskuskappale.</b> Planeettojen ja suurten kuiden sijainnit ja fysikaaliset vakiot (<c1/>), paikannus minkä tahansa näiden kappaleiden ympärillä (<c2/>) sekä Walker- ja julkaistuihin paikkoihin perustuva satelliittitähdistösuunnittelu kattavuus- ja DOP-kartoilla minkä tahansa niiden ympärillä (<c3/>).

seg-9d993a356eb0 = <b>Kampanjat.</b> Olemassa olevat lajit ketjutettuna yhdelle jaetulle aikajanalle, pyyhkäistynä, ajettuna siemennettyinä Monte Carlo -joukkoina tai rinnakkain jaetuissa olosuhteissa (<c1/>).

seg-905a9aa8c47c = <b>Tulosteet.</b> Jokainen ajo kirjoittaa tulosasiakirjan, kaavion ja raportin HTML- (HyperText Markup Language) ja JSON-muodossa (JavaScript Object Notation); <c1/> kirjoittaa SVG- (Scalable Vector Graphics), HTML- tai kehyssarja-animaation; <c2/> kirjoittaa CZML- (Cesium Language), KML- (Keyhole Markup Language), GeoJSON- tai STK-efemeridin (Systems Tool Kit) lajeille, jotka sijoittavat asioita Maan pinnalle, ja SigMF:n lajille <c3/>.

seg-75206591a52a = Useimmat näistä riveistä ovat MODELLED; varmennusmatriisi nimeää harvat VALIDATED-rivit (esimerkiksi International Telecommunication Unionin sade- ja tuikesuositukset, Galileon lähetetyn efemeridin algoritmi, CRC-24Q (24-bittinen syklinen redundanssitarkistus) -kehystarkistus ja planeettojen valoaikaratkaisija).

seg-785218a0ea66 = Mitä Kshana ei ole

seg-fae54ec38477 = <b>Ei radiotaajuinen (RF) signaalisimulaattori eikä hardware-in-the-loop (HIL) -laitteisto.</b> Kshana ei ohjaa radiolaitteistoa eikä lähetä mitään. Suurin osa siitä toimii virhemallien ja linkkibudjettien tasolla, ennen kuin laitteistoa tai laboratorioaikaa ostetaan. Signaalitasolla se on pelkkää ohjelmistoa: GNSS IQ -kerros (<c1/>) kirjoittaa kantataajuisia in-phase/quadrature (IQ) -näytetiedostoja legitiimeistä GNSS-signaaleista ohjelmistovastaanottimille ja ajaa niille omaa ohjelmistovastaanotintaan; lajin <c2/> osio <c3/> (versiosta { "0.29.0" }) kirjoittaa SigMF (Signal Metadata Format) -tilannekuvan analyyttisesta mallistaan, joka sisältää määritetyt häirintälähettimet (kohinankaltaiset häirintälähettimet taajuuskaistoittain, äänet ja chirpit aaltomuotoina); ja <c4/> summaa aidon ja harhauttajan replikasignaalin muistissa silmukan kaappauksen testaamiseksi kirjoittamatta sitä ulos. Laitteistovastaanottimen testaus todellista RF-herätettä vasten on RF-simulaattorin tehtävä.

seg-ca243f3f8e8d = <b>Ei MATLAB/Simulinkin, STK:n tai Orekitin korvaaja.</b> Se istuu niiden vieressä. Se lukee ja kirjoittaa niiden käyttämiä vaihtoformaatteja — CCSDS (Consultative Committee for Space Data Systems) Orbit Ephemeris Messages, SP3 (Standard Product { "3" }) -tarkat radat, RINEX (Receiver Independent Exchange Format) — kirjoittaa CZML-, KML-, GeoJSON- ja STK-efemeridit niiden katselimille, ja sen numeerinen voimamalli ristiintarkistetaan Orekitia vasten sen sijaan, että sitä tarjottaisiin sen tilalle.

seg-8fa4e93c3d0e = <b>Ei kantoaaltovaihe-GNSS-prosessointimoottori eikä paikannuspalvelu</b> (katso alla).

seg-8ba4b67bc813 = <b>Ei sertifiointiviranomainen.</b> VALIDATED-merkintä tarkoittaa, että ominaisuus täsmää ulkoiseen oraakkeliin; se ei ole minkään tuotteen tai operaattorin sertifiointi.

seg-362b857140b9 = Mitä Kshana on ja ei ole GNSS-prosessointimoottorin rinnalla

seg-f50951b2e9c8 = Kshana <b>ei</b> ole kantoaaltovaihe-GNSS-<em>prosessointi</em>moottori, eikä mikään skenaariolaji ole paikannuspalvelu. Sillä on kuitenkin jalansija mittausalueella kirjastokoodina, johon suorituskykytutkimus nojaa ja joka on tarkistettu riippumattomia viitteitä vasten. Lyhyen kantaviivan reaaliaikainen kinemaattinen (RTK) paikannus LAMBDA-kokonaislukuratkaisulla (least-squares ambiguity decorrelation adjustment) toimii todellisilla kaksitaajuisilla RINEX-havainnoilla, samoin staattinen float-tarkka pistepaikannus (PPP) -suodatin IGS:n lopullisilla radoilla ja kelloilla, ja tämän suodattimen estimoima vastaanottimen kello on aikaratkaisu IGS:n lopullista asemakelloa vasten. Jokainen kolmesta on <a1>varmennusmatriisin</a1> VALIDATED-rivi, siinä nimettyä IGS-asemadataa vasten, ja kukin toimii staattisilla, lyhyillä havaintoikkunoilla, ei suoratoistopalveluna, jossa on kokonaislukuepävarmuuden ratkaisu pitkillä kantaviivoilla, kantoaallon tasoitus tai kinemaattinen kulkija. Laji <c1/> ajaa float-PPP-suodattimen koodille ja kantoaallon vaiheelle, mutta itse simuloimillaan mittauksilla, tutkiakseen konvergenssiaikaa LEO-täydennyksen kanssa ja ilman; se ei käsittele havaintotiedostoa. Laji <c2/> (sijainti, nopeus ja aika) ratkaisee vastaanottimen sijainnin todellisista RINEX-koodipseudoetäisyyksistä sekä lähetetystä efemeridistä, validoituna International GNSS Servicen (IGS) mitattua koordinaattia (asema ABMF, 2018-05-13) vasten tarkkuudella <b>{ "5.7" } m 3-D RMS (root mean square) / { "1.1" } m vaaka</b>. Mutta tuote on suorituskykytutkimus, ei paikannuspalvelu, ja alla oleva kehystys on tarkoitettu säästämään mahdolliselta käyttäjältä väärän työkalun pettymys.

seg-169dd778c45f = GNSS-prosessointimoottori (RTKLIB, avoimen lähdekoodin reaaliaikainen kinemaattinen paikannuskirjasto; gLAB, GNSS-laboratoriotyökalupaketti, jonka tekee Katalonian teknillisen yliopiston gAGE-ryhmä)

seg-4faa1de0ef70 = skenaario: anturien virhemallit, katkoikkunat, geometria — tai lajille <c1/> todellinen RINEX-havaintotiedosto sekä lähetetty navigointidata

seg-ae60d0def8af = todelliset GNSS-havainnot (RINEX), efemeridit, korjaukset

seg-5fce99bb803d = suorituskykylaatumittarit: holdover, ajoitus-/sijaintivirhe, saatavuus, eheys-/turvallisuusrajat — sekä koodiin perustuva yksittäispistepaikannus (SPP) -sijainti lajista <c1/>

seg-b752bb5c3f64 = sijainti-/nopeus-/aika<b>ratkaisu</b> (SPP, PPP, RTK)

seg-dd8a47d4f618 = Kysymys, johon se vastaa

seg-b52fd8e0c856 = ”kuinka hyvä tämä arkkitehtuuri <em>olisi</em> ja missä se hajoaa?”

seg-09672ca004ac = ”missä <em>nyt</em> olen näillä mittauksilla?”

seg-00d5ebd56088 = Kvantti-/optiset anturit

seg-a55f2bd6c1bf = mallinnettu virhemalleina (optiset kellot, kylmäatomi-inertiamittausyksikkö (IMU), optinen ajansiirto), tulokset merkitty MODELLED

seg-7ccfb3395d84 = ei mallinneta

seg-ec21dbf4b910 = Todellisten havaintojen prosessointi

seg-324ef9a933d5 = koodi-SPP todellisista RINEX-havainnoista (<c1/>, metritaso); lyhyen kantaviivan RTK LAMBDAlla ja staattinen float-PPP todellisella kantoaallon vaiheella, kirjastokoodina IGS-asemia vasten tarkistettuna (VALIDATED, staattiset ja lyhyet ikkunat, ei suoratoistopalvelu); sekä geometria / DOP (dilution of precision) / saatavuus

seg-e15db8a33a9a = ydinosaaminen, aina kantoaaltovaihe-PPP/RTK:hon asti

seg-e6df7ccdba96 = nolla — toimii selaimen välilehdessä (WebAssembly)

seg-812c1c70ce63 = natiivirakennus / työkaluketju

seg-58df67617e1a = Täydentävät, ei kilpailevat — RTKLIB ja gLAB

seg-29aeb97bd509 = <a1>RTKLIB</a1> ja <a2>gLAB</a2> ovat kypsiä, laajasti käytettyjä GNSS-prosessointipaketteja. Ne ottavat todellisia mittauksia ja tuottavat paikannusratkaisun (SPP/PPP/RTK; gLAB on myös erinomainen opetustyökalu vahvalla perinteellä European Space Agencyssa (ESA) ja European Geostationary Navigation Overlay Servicessä (EGNOS)). Kshana <b>ei</b> korvaa niitä eikä yritä. Sen havaintopolku on kapea: koodiin perustuva yksittäispistepaikannus (<c1/>) ja, tarkistettuna kirjastokoodina, lyhyen kantaviivan RTK LAMBDA-kokonaislukuratkaisulla sekä staattinen float-PPP-suodatin todellisilla kaksitaajuisilla havainnoilla, kumpikin VALIDATED IGS-asemadataa vasten (PPP-suodatin myös RTKLIB-ajoa vasten samoilla syötteillä). Siinä ei ole kantoaallon tasoitusta, ei kinemaattista eikä suoratoistoprosessointia eikä pitkän kantaviivan kokonaislukuepävarmuuden ratkaisua, ja <c2/> ei estimoi troposfääriä eikä ionosfääriä — se soveltaa Saastamoinen/Niell-troposfäärimalleja ja L1/L2-ionosfääristä vapaata yhdistelmää, mutta ei ratkaise niitä tiloina.

seg-9c4e70ce8a55 = Putki on täydentävä:

seg-01f43da4858c = <b>RTKLIB / gLAB</b> vastaavat kysymykseen <em>”missä olen näistä signaaleista?”</em>

seg-f5370894cdd1 = <b>Kshana</b> vastaa kysymykseen <em>”kuinka kauan säilytän hyvän vastauksen, kun nuo signaalit loppuvat — ja paljonko parempi kello tai inertia-anturi, klassinen tai kvantti, minulle tuo?”</em>

seg-2403d6b115de = Luonteva työnkulku käyttää prosessointimoottoria GNSS:n saatavilla olevalle jaksolle ja Kshanaa <b>holdover</b>-käyttäytymisen ja sen ympärillä olevan anturikauppatilan tutkimiseen. Jos tarvitset kantoaaltovaihepaikannuspalvelun — kinemaattinen PPP tai RTK, pitkät kantaviivat, verkon kokonaislukuepävarmuuden ratkaisu — käytä RTKLIBiä tai gLABia; jos tarvitset toistettavaa, merkittyä todistetta kestävyydestä ja holdoverista, juuri sitä varten Kshana on rakennettu.

seg-21631e5c6be3 = Asennusta vaatimaton selainkerros

seg-9b01dd6721ed = Useimmat tämän alan simulointityökalut (RTKLIB, gLAB, General Mission Analysis Tool (GMAT), Orekit, STK) vaativat natiiviasennuksen tai lisenssin ja oppimiskäyrän ennen ensimmäistä tulosta. Kshana käännetään WebAssemblyksi ja toimii <b>kokonaan selaimessa</b> — <a1>leikkikenttä</a1> lataa toimivan skenaarion, ajaa todellista moottoria asiakaspuolella (mitään ei lähetetä) ja näyttää tuloksen sekunneissa. Ohjatut liukusäätimet ja yhden napsautuksen skenaariot tarkoittavat, että ensimmäinen hyödyllinen tulos ei vaadi TOMLia (Tom's Obvious Minimal Language, skenaariotiedoston muoto) eikä työkaluketjua.

seg-b1cb4b8f0ef1 = Tuo asennusta vaatimaton kerros on harkittu kanta:

seg-33b361bde50d = <b>Tavoitettavuus</b> — tarkastaja, opiskelija tai hankintavastaava voi kokeilla varsinaista moottoria linkistä, millä tahansa laitteella, ilman asennusta.

seg-a4a4ebf89cee = <b>Toistettavuus</b> — sama moottori, joka toimitetaan selaimessa, on kirjasto, joka toimitetaan crates.io:ssa, Python Package Indexissä (PyPI) ja npm:ssä; tulos on toistettavissa kohteesta <c1/>, ja ajon voi jakaa URL-osoitteena (verkko-osoite).

seg-3d3d4bda606c = <b>Rehellisyys</b> — moottorin ajaminen itse, avoimesti, on vahvin vastaus väitteeseen ”luota lukuihin”: selainkerros <em>on</em> auditointipinta.

seg-6095bcacb725 = Selainkerros ei tee Kshanasta työpöytäprosessointipaketin korvaajaa — se tekee suorituskykykauppatutkimuksen kysymyksestä lähestyttävän ihmisille, jotka eivät koskaan asentaisi sellaista.

seg-938ca8eab04c = <a1><c1/></a1> — rivikohtainen kattavuuskartta (ratkaisijan <c2/> koko kattavuus ja jäännökset ovat rivillä <b>GNSS / PNT -käsittely</b>).

seg-9e94b1740386 = <a1><c1/></a1> — mikä on validoitu, todisteineen.

seg-3a02f39bd90a = <a1><c1/></a1> — telealan ajoitusskenaario ja sen maskit.

seg-c5aa08e4ca55 = <a1><c1/></a1> — tässä käytettyjen termien selkokieliset määritelmät.

seg-85aaaa34ea7c = <a1><c1/></a1> — selainpohjainen testialusta.

seg-54e2deeffc7d = <s1>Edellinen</s1>Arkkitehtuuri

seg-b2f93c49d5c6 = <s1>Seuraava</s1>Muutosloki
