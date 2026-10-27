# docs--leo-pnt-fusion: translations (fi)

seg-cae10fb9bff8 = Skenaario

seg-f63dd3d7aad4 = Lähde

seg-587beeccaa11 = Esiasetus

seg-a6c63abeb7e6 = Mukana toimitetut skenaariot

seg-354b42e3a5d0 = RNTF

seg-c5ce76c91ff7 = Merkintä

seg-9673ca8c2705 = Lähde: <c1/>

seg-989faf40651b = Yhdistetty MEO- ja LEO-paikannus, navigointi ja ajanmääritys

seg-c14c586a29e7 = Kolme skenaariolajia tuottaa paikannuksen, navigoinnin ja ajanmäärityksen (PNT) matalan Maan kiertoradan (LEO) satelliiteilla yksin tai yhdistettynä keskikorkean kiertoradan (MEO) maailmanlaajuisiin satelliittinavigointijärjestelmiin (GNSS): <c1/> (paikka, nopeus ja aika), <c2/> (tarkka pistepaikannus) ja <c3/> (5G-ei-maanpäällinen verkko). Lähde: <c4/>.

seg-351652fa0e42 = Moottori on <b>järjestelmäriippumaton</b>. Jokainen tähdistö on Walker-kuoria, nimenomaisia ratalementtejä tai lajin <c1/> GNSS-esiasetus; jokainen signaali on kantoaalto, sirunopeus ja kantoaalto–kohinatiheys (C/N0) -verhokäyrä; jokainen virhebudjetti on nimenomainen yhden sigman arvo. Nimetyt järjestelmät ovat valinnaisia <b>esiasetuksia</b>, yksi tiedosto kutakin, ja jokainen ominaisuus, testi ja mukana tuleva skenaario ajetaan ilman mitään tiettyä niistä.

seg-3e7c6608d5c4 = Järjestelmät ja esiasetukset

seg-1031746214ab = Skenaario luettelee järjestelmänsä <c1/>-taulukkoina. Tämä täydellinen skenaario yhdistää GPS-lähtötason tähdistön yleiskäyttöiseen LEO-kerrokseen ja ajetaan sellaisenaan (<c2/>; moottori { $version } antaa paikan tarkkuuden heikkenemiskertoimen (DOP) mediaaniksi { "2.43" } pelkälle GPS:lle ja { "1.17" } yhdistettynä sekä neliökeskiarvoiseksi 3D-virheeksi { "2.06" } m ja { "0.47" } m):

seg-6168fdca9b54 = <c1/> (Global Positioning System, GPS; tai <c2/>, <c3/>, <c4/>) ottaa julkaistun GNSS-tähdistön; <c5/> täyttää kaiken, minkä taulukko jättää pois, LEO-esiasetuksesta. C/N0 kulkee lineaarisesti korkeuskulman sinissä maskista zeniittiin (mallinnusvalinta: todellinen ylilennon verhokäyrä riippuu lähetysantennin kuviosta). Pseudoetäisyyden yhden sigman arvo on moottorin viivelukitussilmukan (DLL) terminen kohina (<c6/>) tällä C/N0:lla yhdistettynä signaali avaruudessa -etäisyysvirheeseen (SISRE), ellei <c7/> kiinnitä sitä; etäisyyden muutosnopeuden yhden sigman arvo on aallonpituus kertaa <c8/>. Koska sigma on syöte, erillinen signaalimalli voi syöttää sen paikannuskoodin tietämättä, mistä se tuli.

seg-a3f63252bd1b = Mitä se sisältää

seg-9872e31ebd72 = Lähteet

seg-e20c823f36f3 = X1 taajuudella { "1593.3225" } MHz, { "1.023" } Mchip/s, vastaanotettu teho −{ "148.2" }–−{ "139.1" } dBW; X5 taajuudella { "1190.51625" } MHz, { "10.23" } Mchip/s, −{ "144.9" }–−{ "136.2" } dBW; { "258" } satelliittia { "18" } tasossa { "1080" } km:n korkeudella, { "53" } ja { "97" } astetta

seg-57b56c874c9b = PUBLIC: <a1>arXiv:{ "2509.19551" }</a1>. Edustava: jako kahden inklinaation kesken, vaiheistus, etäisyysvirhe

seg-b0c5e502c21b = Iridium Satellite Time and Location (STL): { "66" } satelliittia, kuusi lähes napaista tasoa { "780" } km:n korkeudella ja { "86.4" } astetta; purskeet taajuuksilla { "1616" }–{ "1626" } MHz, neliövaiheavainnus (QPSK) nopeudella { "25 000" } symbolia/s; vastaanotettu teho { "300" }–{ "2400" } kertaa GPS:n minimi

seg-d65ae64607c1 = PUBLIC: <a1>Resilient Navigation and Timing Foundation (RNTF)</a1>, <a2>National Institute of Standards and Technology (NIST)</a2>, <a3>tähdistö</a3>. JOHDETTU: teho dBW:nä. Edustava: kantoaalto kaistan keskellä, etäisyysvirhe

seg-36771f73c21f = Vain Doppler: { "11.325" } GHz, { "240" } MHz ortogonaalinen taajuusjakomultipleksointi (OFDM) -majakka, C/N0 enintään { "57.07" } dB-Hz, Doppler-virhe { "30" } Hz; ensimmäinen { "1584" } satelliitin kuori { "550" } km:n korkeudella ja { "53" } asteen kulmassa

seg-44d4dd41848a = PUBLIC: <a1>Kozhaya, Saroufim ja Kassas { "2025" }</a1>, <a2>Federal Communications Commission (FCC) 21-48</a2>. Edustava: vaiheistus, horisontin C/N0

seg-2e13de07f9e9 = Binäärinen vaiheensiirtoavainnus (BPSK) nopeudella { "2.046" } Mchip/s lähellä L1:tä ja L5:tä; senttimetritason radanmääritys

seg-dd94a3839cb3 = PUBLIC: <a1>alustava arviointi</a1>, <a2>GPS Solutions</a2>. Edustava: kantoaallot, teho, koko toimiva tähdistö

seg-a34d6a186a36 = C-kaistan järjestelmä radionavigointisatelliittipalvelun (RNSS) allokaatiossa { "5010" }–{ "5030" } MHz, järjestelmille, joiden parametrit eivät ole julkisia

seg-7712896ff69a = PUBLIC: <a1>International Telecommunication Union (ITU) Radio Regulations</a1> -allokaatio. Kaikki muu <b>edustavaa</b>

seg-89ebc32469d9 = Efemeridi- ja kellomalli: kuudennen asteen polynomiefemeridi, { "30" } s päivitys, kello ohjattu GNSS-aikaan; SISRE { "0.26" } m

seg-ddbefb8a6723 = PUBLIC: <a1>InsideGNSS</a1>. JOHDETTU: SISRE. Yhdistä mihin tahansa tähdistöön kentän <c1/> kautta

seg-6389c92e07d4 = Euroopan avaruusjärjestön (ESA) Celeste-kiertoratademonstraatio (IOD), yksi parametrisoidun signaalisuunnitelman konfiguraatio

seg-b8bd6e76aeb2 = PUBLIC-kiertorata (<a1>ESA</a1>, <a2>Institute of Navigation (ION) abstract { "16907" }</a2>); WORKSHOP-signaaliparametrit, esitelty ESA:n Navigation Innovation and Support Programme (NAVISP) LEO-PNT-työpajassa vuonna { "2026" }

seg-bd7fb6eb444a = Jokainen työpajasta johdettu luku on tiedoston <c2/> moduulissa <c1/>, jota käyttää <c3/> (<c4/> valvoo, missä ne saavat esiintyä). Esiasetus pidetään pois näin: jokainen moottorin työpajasta johdettu luku on yhdessä tiedostossa, <c5/>, jonka <c6/> käännökseen mukaan vain, jos se on olemassa, sekä vain repositoriossa olevissa skenaarioissa <c7/>. Poistamalla tuo tiedosto ja ne skenaariot esiasetus pidetään pois ilman lähdekoodimuutosta; jokainen muu testi, oraakkeli ja skenaario ajetaan ilman sitä, ja README:n skenaariotiedostojen lukumäärä laskee edelleen pois pidetyt tiedostot.

seg-12cdcc633ae0 = Yksi laji, neljä tilaa (<c1/>).

seg-72b5d8cc82ea = <b>Doppler.</b> Vastaanotin, joka mittaa Dopplerin <c1/> aallonpituudella <c2/>, havaitsee etäisyyden muutosnopeuden <c3/>, missä <c4/> on näkölinja ja <c5/> vastaanottimen kellon ajautuma. Eräkohtainen Gauss–Newton-sovitus ratkaisee paikan, ajautuman ja valinnaisesti vakionopeuden analyyttisillä osittaisderivaatoilla <c6/>: vain satelliitin näkölinjaa vastaan kohtisuora nopeus kantaa paikkatietoa, joten geometria on se, miten näkölinjat kääntyvät ikkunan aikana. Raportti antaa virheen ikkunan pituuden funktiona, kunkin järjestelmän Dopplerin, Dopplerin muutosnopeuden ja nykäyksen verhokäyrän sekä yhden ylilennon taulukon. Yksi ylilento paikantaa käyttäjän radan suunnassa (nolla-Dopplerin ajankohta) ja sitä vastaan kohtisuorassa suunnassa (Doppler-käyrän jyrkkyys); poikittaisvirhe kasvaa rajatta, kun ylilento menee suoraan yläpuolelta, ja peilikuva maanpinnan radan yli sopii lähes yhtä hyvin (vain Maan pyöriminen erottaa ne). Vain Doppleria käyttävä järjestelmä (<c7/>, esiasetus <c8/>) ajetaan tässä tilassa.

seg-007d143c7fb4 = <b>Joint.</b> Jokaisella epookilla painotettu pienimmän neliösumman menetelmä pseudoetäisyyksille: pelkät GNSS-järjestelmät, pelkät LEO-järjestelmät ja kaikki yhdessä, yksi vastaanottimen kello järjestelmää kohden (järjestelmien välinen bias, ISB, estimoidaan) tai tunnettu lähetetty poikkeama vertailuaika-asteikolla. Se raportoi geometrisen, paikan, vaaka-, pysty- ja aikatarkkuuden heikkenemiskertoimet (GDOP, PDOP, HDOP, VDOP, TDOP), virheet, estimoidut biasit sekä DOP:n suhteessa GNSS-geometriaan lisättyjen LEO-satelliittien määrään.

seg-22f136a0c96f = <b>Polar.</b> Näkyvät satelliitit, DOP:n mediaani ja saatavuus leveysasteen funktiona MEO GNSS:lle, LEO:lle ja molemmille.

seg-1034557258d1 = <b>Timing.</b> Tunnetussa paikassa jokainen LEO-pseudoetäisyys on kellomittaus. Vastaanotin ajaa kaksitilaista (vaihe, taajuus) Kalman-suodinta, jonka prosessikohina on oskillaattoluokan valkoinen ja satunnaiskulun taajuuskohina (<c1/> ja kellomallit), pitää ajan ylilentojen välillä ja muuntaa järjestelmäajan yleisajaksi (UTC) IS-GPS-200:n lausekkeella <c2/>; lähetetyn poikkeaman epävarmuus on ajokohtainen bias.

seg-0d76fcc05e7d = Float-ratkaisun tarkan pistepaikannuksen (PPP) laajennettu Kalman-suodin (EKF) ionosfääririippumattomalle koodille ja vaiheelle: staattiset koordinaatit, valkoinen vastaanottimen kello, yksi järjestelmien välinen bias kutakin ylimääräistä järjestelmää kohden, satunnaiskulun zeniittikostea viive ja float-kokonaislukuepävarmuus satelliittikaarta kohden. Tarkan radan ja kellon virhe on yhteinen satelliitin koodille ja vaiheelle, joten jokainen satelliitti on yksi korreloitu kaksirivinen päivitys Joseph-vakautetussa muodossa, joka pitää kovarianssin positiivisesti definiittinä tuhansien millimetritason vaihepäivitysten yli. Mittaukset simuloidaan samasta mallista, joten position normalisoidun estimointivirheen neliön (NEES) on noudatettava khiin neliö -jakaumaa kolmella vapausasteella; testi tarkistaa sen Monte Carlo -siemenluvuilla. Suppeneminen on ensimmäinen epookki, jonka jälkeen vaaka- ja pystyvirheet pysyvät kynnysten ({ "10" } cm) alapuolella ajon loppuun asti.

seg-630384148ec7 = LEO-satelliitti ylittää taivaan noin kymmenessä minuutissa, MEO-satelliitti liikkuu muutaman asteen, joten LEO-kaaret erottavat kokonaislukuepävarmuudet paikasta paljon nopeammin.

seg-17f9cf9cc24d = 5G-ei-maanpäällisen verkon (NTN) alalinkki matkaviestisatelliittipalvelun (MSS) S-kaistalla, 3rd Generation Partnership Project (3GPP) -kaista n256 ({ "2170" }–{ "2200" } MHz). Saapumisajan Cramér–Rao-raja (CRB) on <c1/>, missä <c2/> on neliökeskiarvoinen (Gabor) kaistanleveys (<c3/> tasaiselle OFDM-spektrille), ja sävyn taajuudelle <c4/>. Laji vertaa kanavia (oletuksena { "5" } MHz:n New Radio -kanava ja { "200" } kHz:n kapeakaistakanava) alalinkin saapumisaikaratkaisujen kautta tuntemattomalla vastaanottimen kellolla sekä yhden satelliitin Doppler-ratkaisulla ylilennon aikana.

seg-516afd013d38 = Laji, tila

seg-529a5aeea10a = Mitä se osoittaa (siemenluvulla, deterministinen)

seg-6cd0b721006a = <c1/>, doppler

seg-c3c51264f12a = Xona Pulsar X1 -kerros ({ "258" } satelliittia), { "1" } Hz Doppler-kohina: 3D-virhe { "7.5" } m kymmenen minuutin jälkeen ({ "26" } satelliittia); yhdellä ylilennolla radan poikkisuuntainen yhden sigman arvo on { "303" } m, kun ylilento menee lähes yläpuolelta ({ "25" } km radan sivussa), verrattuna arvoon { "43" } m { "250" } km:n etäisyydellä radasta

seg-da85037a6691 = Vain Doppler-opportunistiset signaalit, { "30" } Hz Doppler-virhe taajuudella { "10" } Hz: muodollinen vaakasuuntainen yhden sigman arvo noin { "10" } m { "20" } s jälkeen { "12" } satelliitilla ja { "6" } m { "60" } s jälkeen

seg-4dbb00da5310 = <c1/>, joint

seg-553e8f4df276 = GPS ja Galileo PDOP:n mediaani { "1.47" } ja neliökeskiarvoinen (RMS) 3D-virhe { "1.06" } m; Xona X5 yksin { "1.73" } ja { "0.49" } m; yhdistettynä { "1.06" } ja { "0.41" } m; { "40" } ns LEO-bias ({ "11.99" } m) estimoitu arvoksi { "12.06" } m

seg-83378a120e0d = Suppeneminen { "7.4" } min (vain MEO GNSS), { "4.8" }, { "3.2" }, { "2.7" } ja { "2.3" } min, kun LEO-satelliitteja on { "60" }, { "96" }, { "192" } ja { "288" }

seg-4aadc3b41822 = Etäisyysraja { "0.26" }–{ "1.03" } m kaistalle { "4.5" } MHz ja { "6.5" }–{ "26" } m kaistalle { "180" } kHz; ratkaisut lähellä { "2" } m verrattuna arvoon { "26" } m

seg-5b1019210ca7 = <c1/>, polar

seg-108488f6cc6c = GPS ja Galileo VDOP { "1.20" } päiväntasaajalla, { "1.51" } leveysasteella { "89.9" } astetta; Iridiumin kanssa { "1.14" } navalla

seg-bcdbe0796127 = <c1/>, timing

seg-94ab83c05f50 = Iridium-ajansiirto { "6" } tunnin ajan Boulderissa: { "9.9" }–{ "11.4" } ns RMS nimellisellä C/N0:lla neljällä oskillaattoluokalla, { "15.1" }–{ "25.0" } ns, { "30" } dB alemmalla tasolla

seg-3007f5930dfd = <c1/> (valinnainen)

seg-f6ff187a00aa = GNSS, johon kaksi IOD-satelliittia liittyy vertailuaika-asteikolla (vain repositoriossa, pidetään pois esiasetuksen mukana)

seg-98710204278b = Lajit ajetaan myös muiden skenaarioiden sisällä: <c1/> on pyyhkäisyn <c2/> sekä kampanjoiden <c3/>, <c4/>, <c5/> ja <c6/> jäsen; <c7/> pyyhkäisyn <c8/> jäsen; <c9/> pyyhkäisyn <c10/> jäsen; ja <c11/> ja <c12/> ovat lajin <c13/> yhdistetyn paikkaratkaisun ja PPP:n vaiheet. Niiden tulokset ovat sivulla <a1>LEO-PNT.md</a1>.

seg-2f3086178d0b = Julkaistut luvut ja merkinnät

seg-8980b5ae869b = Luku

seg-0be9b5747c00 = Kshana

seg-3d2d01038419 = Iridium-Doppler enintään ±{ "36" } kHz

seg-a88258961299 = { "35.9" } kHz, ylilentojen vuorokauden maksimi, { "5" } %:n sisällä

seg-5bc3150b53f6 = VALIDATED (<c1/>)

seg-35a3ec8ee073 = Xona Pulsar X1 -Dopplerin maksimi { "32" }–{ "34" } kHz

seg-499acd31a8f8 = arXiv:{ "2509.19551" }

seg-e8c9c880a3eb = { "33.6" } kHz yhdestä kunkin julkaistun kuoren satelliitista ({ "1080" } km, { "53" } ja { "97" } astetta), välin sisällä ilman levennystä; pelkkä { "53" } asteen kuori huipentuu arvoon { "31.8" } kHz, koska Maan pyöriminen hidastaa myötäkulkuista rataa suhteessa maahan

seg-e12713d5019f = VALIDATED (sama testi)

seg-370ca62e7fc7 = Xona Pulsar X1 -nykäys ±{ "1.26" } Hz/s²

seg-4de9b0895288 = noin { "1.0" } Hz/s² yläpuolelta kulkevalla ylilennolla

seg-5019322f4669 = raportoitu, ei validoitu

seg-7fcb83027ff4 = PPP:n suppeneminen { "9.6" } → { "7.0" }, { "3.2" }, { "2.1" }, { "1.3" } min, kun LEO-satelliitteja on 60/96/192/288

seg-856e73fb2fb5 = Li et al., <em>Journal of Geodesy</em> { "93" }:{ "749" } ({ "2019" }), <a1>doi 10.1007/s00190-018-1195-2</a1>

seg-a03bc7c3b8a6 = { "7.4" } → { "4.8" }, { "3.2" }, { "2.7" }, { "2.3" } min, monotoninen

seg-0a1133c16dce = MODELLED suuntauksen johdonmukaisuus (tähdistöjä, kohinaa ja asemia ei toisteta)

seg-7c5292729f36 = Starlink noin { "2" } m { "20" } s:ssa kolmella satelliitilla

seg-6a54a7c58ade = Kozhaya, Saroufim and Kassas { "2025" }

seg-13fc5fc4f69f = muodollinen vaakasuuntainen yhden sigman arvo noin { "10" } m { "20" } s jälkeen { "12" } satelliitilla, täydellisellä efemeridillä ja kaikki virhe { "30" } Hz:n Doppler-sigmassa taajuudella { "10" } Hz

seg-4fc80a02ed6c = MODELLED vertailu (vastaanotinta ja mittaustaajuutta ei toisteta)

seg-5d0ae24eb74c = Iridium-ajoitus alle { "40" } ns UTC(NIST):stä

seg-fa4467605bc4 = NIST

seg-b910bf5135dd = noin { "10" } ns RMS mallinnettuna

seg-9025f3c376c5 = MODELLED vertailu

seg-4434b0ff1caa = Kaikki muu on MODELLED perusteluineen varmennusmatriisissa (<c1/>): DOP tarkistetaan käsin johdettua neljän satelliitin tapausta vastaan, ratkaisut kovarianssiaan vastaan, Doppler-malli etäisyyden kiihtyvyysidentiteettiä vastaan, PPP-suodin khiin neliö NEES-kaistaa vastaan ja rajat kvadratuuria vastaan.

seg-aa5482ac34ff = Rajoitukset, ilmaistuna selvästi

seg-0b4564367dcd = Kaksikappaleradat J2:n, Maan toisen vyöhykeharmonisen, maallisella ajautumalla; ei lähetetyn efemeridin sovitusvirhettä SISRE:n yhden sigman arvon lisäksi, ei satelliitin antennikuviota.

seg-b51ccfee4ab8 = Ei ionosfäärin tai troposfäärin viivettä lajissa <c1/> (PPP-suodin kantaa märän viiveen tilaa; sen ionosfääririippumaton yhdistelmä poistaa ensimmäisen kertaluvun ionosfäärin), ei tuikintaa, monitie-etenemistä, jaksohyppyjä eikä kokonaislukuepävarmuuden ratkaisua.

seg-a719ccac19c0 = NTN:n tarkkuus on raja, ei saavutettu tulos.

seg-19ba6cc0ca75 = Edustaviksi merkityt esiasetusarvot ovat havainnollistavia, eivätkä kuvaa minkään operaattorin suunnitelmaa.

seg-f9f335d67ff8 = <s1>Edellinen</s1>LEO-navigointiviesti

seg-062138bbb73c = <s1>Seuraava</s1>Tähdistön suunnittelu
