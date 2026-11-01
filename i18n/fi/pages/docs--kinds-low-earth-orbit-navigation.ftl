# docs--kinds-low-earth-orbit-navigation: translations (fi)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Tyyppi

seg-867f3e41b5ab = LEO-navigointiviesti: matalan Maan kiertoradan (LEO) paikannus-, navigointi- ja ajanmääritys-satelliitin lähettämä efemeridi ja kello, mille tahansa radalle, kantoaallolle ja mallille, valinnaisilla nimetyillä esiasetuksilla (Xona Pulsar, Iridium, Starlink, CentiSpace, edustava C-kaistan järjestelmä, ATOMIC-nollakellomalli, Celeste IOD). SISÄLTÖ: apudata (SVID, datan numero, kaista, signaalin terveys), synkronointi (viikko, viikon aika, toisen asteen kellopolynomi af0-af2 hetken toc ympärillä), efemeridi neljässä mallissa -- Galileo OS SIS ICD:n 16-parametrinen Kepler-joukko; kyseinen joukko sekä radan suuntainen, sivusuuntainen ja säteittäinen korjauspolynomi; Liu ym. { "2025" } 22-parametrinen malli; ECEF-polynomi ilman kellotermejä (ATOMIC-nollakello) -- sekä muut palvelut (Klobuchar-lähetysjoukko, NeQuick-G ai0-ai2 tehollisella ionisaatiotasolla, sekä järjestelmäajan ja UTC:n väliset parametrit ICD:n karkaussekuntilogiikalla). SOVITIN: tosi rata integroituna zonaalisella J2-J6- tai EGM2008-painovoimalla valittuun asteeseen ja ilmanvastuksella, sekä siemenluvulla alustettu vapaa tai ohjattu kello; Levenberg-Marquardt-sovitus Kepler-joukolle ei-singulaarisilla elementeillä, sitten lineaariset pienimmän neliösumman korjauspolynomit; kello sovitettuna vähennettynä suhteellisuusteoreettisella termillä, jonka käyttäjä lisää. ANALYYSIT: fit-interval-trade (signaalin avaruudessa -etäisyysvirhe, SISRE, globaaleilla keskiarvopainoilla radan korkeudelle, sovitusvälin ja päivitysjakson funktiona, pelkkä rata ja kellon kanssa), model-comparison (neljä mallia, parametrien lukumäärä, koodatut bitit sekä Kshanan sovitus Liu ym. korkeuksilla julkaistujen lukujen rinnalla), midpass-update (korkein ohitus käyttäjän yli, kunkin viestinvaihdon paikka-, kello- ja käyttäjäetäisyyshyppy, huonoimman geometrian hyppy, PASS/FAIL jatkuvuuskynnystä vastaan), encode-decode (Kshanan oma dokumentoitu binäärikehys CRC-24Q:lla, kenttäkohtainen puoliaskelkvantisointibudjetti, vioittuneen kehyksen tarkistus, RINEX-4-tyylinen tietueen vienti ja tuonti, joka on merkitty Kshana-laajennukseksi, sekä CSV-taulukko). VALIDATED: SISRE-painot julkaistua MEO/GEO-taulukkoa vastaan (Montenbruck ym. { "2018" }); Galileo-käyttäjäalgoritmi RTKLIB:ia vastaan todellisilla Galileon lähetysefemerideillä; CRC-24Q luettelon tarkistusarvoa ja RTCM { "1005" } -esimerkkikehystä vastaan. MODELLED: jokainen sovitus- ja SISRE-luku on esitysvirhe Kshanan integroimaa tosi rataa vastaan (ei radanmääritys- tai ennustevirhettä); Liu ym. -vertailu käyttää eri ratoja; koodaus- ja tekstimuodot ovat Kshanan omia.

seg-35e92abc6a23 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/leo-navmsg-celeste-iod.toml, tyyppi leo-navmsg

seg-c3861f7d717c = LEO-ohitus ja linkkibudjetti kaista kaistalta LEO-PNT:lle (paikannus, navigointi ja ajanmääritys matalalta Maan kiertoradalta), järjestelmäriippumaton: käyttäjä (maa-, meri-, ilma- tai sisätila, paikallaan tai liikkuva) ja yksi tai useampi LEO-satelliitti SUUNNITELLUSTA OHITUKSESTA (DESIGNED PASS; ympyrärata sijoitettuna niin, että käyttäjä näkee yhden valitun enimmäiskorkeuskulman ohituksen valittuna aikana, auringon suhteen synkroninen pyydettäessä), nimenomaisista ELEMENTEISTÄ, TLE:stä (kahden rivin elementtijoukko) moottorin SGP4:n kautta tai WALKER-tähdistöstä, jonka rakentaa tähdistösuunnittelukoodi (korkeimmat ohitukset raportoidaan). Kaistat tulevat nimetystä esiasetuksesta (yleinen monikaistainen UHF/L/S/C, yleinen C-kaista, Xona Pulsar X1/X5, Iridium STL, Starlink vain Doppler-pohjaisena tilaisuuden signaalina, CentiSpace sekä valinnainen Celeste IOD -esiasetus, joka on merkitty WORKSHOP) tai kirjoitetaan skenaarioon; kukin esiasetus ilmoittaa, ovatko sen luvut PUBLIC (URL-osoitteella), REPRESENTATIVE vai WORKSHOP. Satelliittia, kaistaa ja epookkia kohden: korkeuskulma, atsimuutti, etäisyys, etäisyyden muutosnopeus ja etäisyyden kiihtyvyys; vapaan tilan etenemishäviö; EIRP ja satelliitin kuviohyöty (isoflux, Gaussin keila tai tasainen); käyttäjäantennin hyöty korkeuskulman funktiona (laastari, puolipallomainen tai isotrooppinen); kaasumainen vaimennus (ITU-R P.676-10 Annex { "2" }), sadevaimennus (ITU-R P.838-3 -kertoimet ja P.618-14-menettely sadeintensiteetistä ja sateen korkeudesta), troposfäärinen tuike (ITU-R P.618-14 section { "2.4.1" }), rakennuksen läpäisyhäviö sisätilakäyttäjälle (ITU-R P.2109-2), polarisaatioepäsovitus, järjestelmän kohinalämpötila ja C/N0 (kantoaalto–kohinatiheys); Doppler ja Dopplerin muutosnopeus suljetussa muodossa etäisyyden muutosnopeudesta ja etäisyyden kiihtyvyydestä, kumpikin tarkistettuna keskeisillä differensseillä; ensimmäisen kertaluvun ionosfääriviive { "40.3" } STEC/f^{ "2" } Klobucharin tai pystysuoran TEC:n vinosta TEC:stä, skaalattuna satelliitin alapuolella olevaan ionosfäärin osaan. Kaistapareille annetaan ionosfääristä vapaat kertoimet, kohinan vahvistus ja koodikohina ohituksen huipulla. MEO-GNSS-satelliitit (Galileo- tai GPS-esiasetukset) arvioidaan samalla antenni- ja kohinamallilla niiden liitäntädokumenttien vastaanotetuilla tehoilla, joten LEO:n kellomainen ohitus ja tasaiset GNSS-kantoaallot jakavat yhden kuvaajan. Valinnainen [iot]-osio antaa ensimmäiseen paikkaratkaisuun kuluvan ajan, energian paikkaratkaisua kohden ja akun keston käyttösuhteen funktiona ilmoitetulle vastaanottimen tehobudjetille (MODELLED). Kukin kaistapari antaa myös sen geometriasta vapaan yhdistelmän huipulla takaisin saaman vinon TEC:n ja tämän arvion koodikohinan sigman (ionosfäärin luotaus). Valinnainen [spoofer]-osio väärentää sellaisen väitetyn paikan signaalit, joka hyppää tai työnnetään pois todellisesta alkuhetken jälkeen, ja ajaa kaksi monitoria ilmoitetuilla väärän hälytyksen ja havaitsematta jäämisen todennäköisyyksillä: Doppler- ja ohitusgeometrian johdonmukaisuus (mitatut etäisyyden muutosnopeudet verrattuna niihin, jotka ennustetaan radoista ja riippumattomasta ennakkopaikasta ja -nopeudesta, yleistetty pienimmän neliösumman khiin neliö -testi ikkunan yli, GNSS-, LEO- ja kaikilla kanavilla) ja kaistojen välinen johdonmukaisuus (kunkin LEO-kaistaparin malli korjatun geometriasta vapaan yhdistelmän epookista epookkiin -askel), raportoiden epookkikohtaiset tilastot ja sen, milloin kukin monitori havaitsee (MODELLED). VALIDATED osat: vapaan tilan häviö, P.838-3-kertoimet sen Table { "5" } -taulukkoa vastaan, P.618-14:n sade- ja tuikemenettelyt sekä P.2109:n rakennuksen läpäisyhäviö ITU-R Study Group { "3" } -validointiesimerkkejä vastaan, IS-GPS-200 L1/L2-ryhmäviiveen suhde sekä ympyräradan paikallaan olevan käyttäjän suurin Doppler arXiv { "2509.19551" } Table { "1" } -taulukkoa vastaan. MODELLED: EIRP:t, kuviot, TEC:n Chapman-osuus satelliitin alapuolella ja koko ohitus.

seg-02ae51cfada6 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/leo-pass-iridium.toml, tyyppi leo-pass

seg-81d1604171a5 = Yksi LEO-PNT-järjestelmä (paikannus, navigointi ja ajanmääritys matalalta Maan kiertoradalta) päästä päähän, mille tahansa tähdistölle ja signaalille: signal_design-kentän nimeämä leo-signal-suunnitelma (julkinen esiasetus tai sisäinen [signal]-suunnitelma) asettaa [pass]-kaistan keskitaajuuden, kaistanleveyden, sirunopeuden ja EIRP-jaon, leo-pass-linkkibudjetti antaa seuratun C/N0:n ja kaistarajoitetun koodijitterin ohituksen yli, C/N0-suora sin(korkeuskulma):n funktiona ja [navmsg]-viestin lähetetty SISRE (sovitettuna ohituksen satelliitin korkeudelle) syöttävät jokaisen [fusion] leo-pvt -yhteisratkaisun LEO-järjestelmän ja valinnaisesti [ppp] leo-ppp -tapaukset; jokainen luovutus listataan arvoineen ja yksikköineen. MODELLED.

seg-abe0599498c9 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/leo-pnt-end-to-end.toml, tyyppi leo-pnt-chain

seg-32a570f1a4fa = Tarkan pistepaikannuksen (PPP) konvergenssi pelkällä GNSS:llä ja LEO-täydennyksellä: float-laajennettu Kalman-suodatin ionosfääristä vapaalla koodilla ja kantoaallon vaiheella staattisilla asemakoordinaateilla, valkoisella vastaanottimen kellolla, yhdellä järjestelmienvälisellä harhalla kutakin ylimääräistä järjestelmää kohden, satunnaiskävelevällä zeniittimärkäviiveellä, joka kuvataan kertoimella 1/sin(elevaatio), sekä float-epäselvyydellä satelliittikaarta kohden; tarkka rata- ja kellovirhe on valkoinen ja yhteinen satelliitin koodille ja vaiheelle, joten kukin satelliitti on yksi korreloitu kaksirivinen päivitys Joseph-stabiloidussa muodossa. Mittaukset simuloidaan samasta mallista siemenluvulla alustetulla kohinalla usean paikan ja siemenluvun yli, ja kukin tapaus (ensin vain GNSS, sitten kukin LEO-järjestelmien [[case]], mikä tahansa tähdistö tai esiasetus) raportoi konvergenssiajan mediaanin (ensimmäinen epookki, jonka jälkeen vaaka- ja pystyvirheet pysyvät kynnysten alapuolella, oletuksena { "10" } cm), konvergoituneiden osuuden, virhekäyrien mediaanit ja suodattimen johdonmukaisuuden (ajojen keskiarvoistettu paikka-NEES verrattuna kaksipuoliseen { "95" }%:n khiin neliö -kaistaan). Valinnaisesti julkaistujen Li ym. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2) keskileveysasteen lukujen rinnalla: { "9.6" } min multi-GNSS:lle lyhenee arvoihin { "7.0" }, { "3.2" }, { "2.1" } ja { "1.3" } min, kun LEO-satelliitteja on { "60" }, { "96" }, { "192" } ja { "288" }. MODELLED: trendin johdonmukaisuusvertailu, ei sen tutkimuksen tähdistöjen, kohinan tai asemien toisto; ei kokonaislukuepävarmuuden ratkaisua, ei vaihehyppyjä, ei vaiheen käämimistä, ei vuorovesiä eikä ajallisesti korreloituneita tuotevirheitä.

seg-225ef04c64af = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/leo-ppp-convergence.toml, tyyppi leo-ppp

seg-093aac4b5ff1 = Yhdistetty keskimatalan Maan kiertoradan (MEO) ja matalan Maan kiertoradan (LEO) paikannus, navigointi ja ajanmääritys (PNT) MINKÄ TAHANSA tähdistöjen yli: kukin [[system]] on constellation-design-tyypin GNSS-esiasetus, LEO-esiasetus (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, atomic-zero-clock-efemeridimalli, tai toinen esiasetustiedosto, kukin omassa tiedostossaan lähteet merkittyinä PUBLIC, WORKSHOP tai JOHDETTU), Walker-kuoria tai nimenomaisia elementtijoukkoja, kantoaallolla, sirunopeudella, kantoaalto–kohinatiheys-verhokäyrällä (C/N0) korkeuskulman maskista zeniittiin, signaalin avaruudessa -etäisyysvirheellä (SISRE), Doppler-sigmalla ja kellomallilla (oma vastaanottimen kello, jolloin järjestelmienvälinen harha estimoidaan, tai tunnettu lähetetty siirtymä). Neljä tilaa. DOPPLER: eräkohtainen Gauss-Newton-paikannus etäisyyden muutosnopeudesta analyyttisillä osittaisderivaatoilla, kellodriftin ja valinnaisen nopeuden tiloilla sekä valinnaisella korkeusrajoitteella, yhdellä tai usealla satelliitilla, virhe ikkunan pituuden funktiona, kunkin LEO-järjestelmän Doppler-, Doppler-muutosnopeus- ja nykäysverhokäyrä sekä yhden ohituksen radan suuntainen ja sivusuuntainen tarkkuus sivusuuntaisen siirtymän funktiona (sivusuuntainen virhe kasvaa rajatta, kun ohitus menee yläpuolelta; yhdellä ohituksella on myös peiliratkaisu radan jäljen toisella puolella). Vain Doppler-pohjainen tilaisuuden signaali (starlink-sop) ajetaan tässä. JOINT: epookkikohtaiset painotetut pienimmän neliösumman pseudoetäisyysratkaisut pelkästä GNSS:stä, pelkästä LEO:sta ja molemmista, mittauskohtaiset sigmat viivelukitun silmukan terminen kohinamalli C/N0:lla plus SISRE (tai kiinteä sigma, jotta signaalimalli voi syöttää niitä), estimoidut järjestelmienväliset harhat ja PDOP/HDOP/VDOP lisättyjen LEO-satelliittien lukumäärän funktiona. POLAR: näkyvät satelliitit ja DOP leveysasteen funktiona GNSS:lle, LEO:lle ja molemmille. TIMING: ajansiirto Coordinated Universal Time (UTC) -aikaan tunnetussa paikassa olevista LEO-satelliiteista kaksitilaisella kellosuodattimella, jonka prosessikohina tulee moottorin oskillaattoriluokista, C/N0:n ja oskillaattorin funktiona, sekä IS-GPS-200 järjestelmäajan ja UTC:n välinen lauseke; asetuksella [timing] trace = true jokainen rivi raportoi myös aikavirheensä ja ennustetun sigmansa jokaisella epookilla. VALIDATED: yläpuolelta horisonttiin kulkevan ohituksen suurin Doppler julkaistuja Iridium (enintään { "36" } kHz) ja Xona Pulsar X1 ({ "32" } – { "34" } kHz) -lukuja vastaan. MODELLED: kaikki muu; DOP tarkistetaan käsin johdettua tapausta vastaan, ratkaisut kovarianssiaan vastaan ja Doppler-malli etäisyyden kiihtyvyyden identiteettiä vastaan.

seg-90361a6f4e3c = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/leo-pvt-fjord-skyline.toml, tyyppi leo-pvt

seg-97b8d07150d4 = LEO-PNT-signaalisuunnitelmat: parametrisoidut matalan Maan kiertoradan (LEO) paikannus-, navigointi- ja ajanmääritys (PNT) -signaalit mille tahansa järjestelmälle, kaistalle ja rakenteelle. SIGNAALI on kaista (keskitaajuus, lähetyskaistanleveys, ITU-allokaatio RNSS/RDSS/MSS/EESS/non-RNSS/other) ja komponentit (hankinta, data, pilotti; mikä tahansa osajoukko), kullakin modulaatio (BPSK(n) murtoluku-n:llä, BOC(m,n), MBOC({ "6,1" },p) tai tasainen OFDM-tyyppinen kaista), tehoosuus, valinnaiset FDMA-alikantoaaltosiirtymät, koodin pituus ja datanopeus. Signaalit tulevat käännökseen sisällytetyistä julkisista esiasetustiedostoista (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; kullakin lähde-URL ja jokainen julkaisematon arvo merkitty REPRESENTATIVE) tai kirjoitetaan sisäisesti. SIGNAALIA KOHDEN: kaistarajoitettu tehospektritiheys ja kunkin komponentin tehosta lähetyskaistan läpäisevä osuus (BPSK:n suljettu muoto numeerisen arvon rinnalla), RMS-kaistanleveys (Gabor), viivelukitun silmukan koodinseurannan terminen jitter C/N0:n ja early-late-välin funktiona Betzin ja Kolodziejskin { "2009" } kaistarajoitetusta koherentista (tai epäkoherentista) early-late-kaavasta rajoittamattoman kaistan oppikirjamuodolla ja katoavan välin Gabor-rajalla, etäisyysmittaustarkkuus metreinä, hankinnan hakuavaruus (Doppler-lokerot radan suurimmasta Dopplerista sekä oskillaattori- ja käyttäjätermit, kertaa koodilokerot), neliölakiin perustuva havaitsemistodennäköisyys sekä keskimääräinen sarja- ja koodirinnakkaishankinta-aika, signaalin spektrierotuskerroin signaaleihin GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b ja E5 AltBOC ja kunkin niistä signaaliin C/N0-heikkenemisellä, sekä CW-, laajakaistainen ja sovitettu J/S, jonka seurattu komponentti sietää, spectrum-tyypin oman SSC-koneiston avulla. KAISTAVERTAILU: ensimmäisen kertaluvun ionosfääriviive ({ "40.3" } TEC/f^{ "2" }), vapaan tilan häviö, etäisyysmittaustarkkuus yhtä suurella C/N0:lla ja yhtä suurella EIRP:llä sekä häirinnän sieto. Valinnaiset MUOTOTARKISTUKSET vertaavat suunnitelman spektriä kuvattuun mittaukseen (MODELLED johdonmukaisuus). VALIDATED: BPSK:n teho kaistalla ({ "90.3" } % pääkeilassa) ja Gabor-kaistanleveyden suljetut muodot, kaistarajoitettu jitter palautuu oppikirjan koherenttiin early-late-muotoon ja sen Gabor-rajaan, siirretyn BPSK:n spektrierotuskerroin Parsevalin suljettua muotoa vastaan, AltBOC-spektrin yksikköpinta-ala sekä suurin LEO-Doppler julkaistuja Xona Pulsar (32-34 kHz) ja Iridium ({ "36" } kHz) -lukuja vastaan. MODELLED: jokainen suunnitelma, tehojako, C/N0 ja häirintätaso; EFQPSK-, CSK- ja OFDM-spektrit approksimoidaan.

seg-8bf45b6989d1 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/leo-band-trade.toml, tyyppi leo-signal

seg-4f0edb786a35 = Paikannus 5G:n ei-maanpäällisen verkon (NTN) alalinkistä mobiilisatelliittipalvelun (MSS) S-kaistalla (3GPP-kaista n256, alalinkki { "2170" }–{ "2200" } MHz; oletuskantoaalto { "2172.5" } MHz): Cramér–Rao-raja (CRB) saapumisajalle, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)), jossa beta on tasaisen OFDM-spektrin (B/sqrt({ "12" })) neliöllinen keskiarvo- (Gabor) kaistanleveys, ja kompleksisen sinin Dopplerille, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), kullekin signaalille (oletuksena { "5" } MHz:n New Radio -kanava, jossa { "4.5" } MHz on käytössä, ja { "200" } kHz:n kapeakaistakanava, jossa { "180" } kHz on käytössä); sitten minkä tahansa LEO-tähdistön yli alalinkin saapumisaikapaikannukset tuntemattomalla vastaanottimen kellolla (siemenlukuun perustuva, sigmana raja plus verkon synkronointivirhe), niiden PDOP ja muodollinen 3D-sigma sekä yhden satelliitin Doppler-paikannus pisimmän ylilennon yli korkeus kiinnitettynä. MODELLED: kaistanleveydestä rajaan -askel on oppikirjan suljettu muoto, tarkistettu tasaisten ja kaistarajoitettujen BPSK-spektrien numeerista integrointia vasten (sisäinen johdonmukaisuus, julkaistua laskuesimerkkiä ei ole kiinnitetty), ja paikannustarkkuus on raja monitiettömällä kanavalla ilmoitetulla synkronointivirheellä, ei saavutettu tulos.

seg-c200240dd65e = Moottorin kirjoittama kaavio skenaariolle scenarios/ntn-5g-positioning.toml, tyyppi ntn-positioning

# text
seg-4e31c8daf798 = Kirjanpito

# text
seg-6800289a282d = { "7" } skenaariolajia, moottorin v{ $version }. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva tunniste on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten tunniste ansaitaan: READMEn Evidence-osio).

# text
seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
# c1: docs/kinds/low-earth-orbit-navigation.md
seg-22eb3a688624 = Lähde: <c1/>

# text
seg-561a783e9516 = Matalan Maan kiertoradan navigointi (skenaariolajiperhe)

# text
# c1: kshana scenarios/leo-pnt-end-to-end.toml
seg-47751d798019 = Aihesivut: <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>. Aja yksi: <c1/>. Kaikki perheet: <a5>KINDS.md</a5>.

# attr:alt
seg-4867ae5d108b = Kuvakooste moottorin kirjoittamista kaavioista perheen Matalan Maan kiertoradan navigointi lajeille

# text
seg-1e724b481e67 = LEO-PNT-signaalisuunnitelmat: parametroidut matalan Maan kiertoradan (LEO) PNT-signaalit (paikannus, navigointi ja ajanmääritys) mille tahansa järjestelmälle, kaistalle ja rakenteelle.

# text
seg-82ad7da67939 = LEO-ylilento ja linkkibudjetti kaista kerrallaan LEO-PNT:lle (paikannus, navigointi ja ajanmääritys matalalta Maan kiertoradalta), järjestelmäriippumaton: käyttäjä (maa, meri, ilma tai sisätila, paikallaan tai liikkuva) ja yksi tai useampi

# text
seg-3f28c23605a4 = MODELLED { "7" } · VALIDATED { "5" }

# text
seg-c20a76308fb3 = LEO-navigointiviesti: matalan Maan kiertoradan (LEO) paikannus-, navigointi- ja ajanmääritys-satelliitin lähettämä efemeridi ja kello, mille tahansa radalle, kantoaallolle ja mallille, valinnaisin nimetyin esiasetuksin (Xona P

# text
seg-04fdaadf1cba = MODELLED { "5" } · VALIDATED { "6" }

# text
seg-06236b581684 = Fuusioitu keskikorkean Maan kiertoradan (MEO) ja matalan Maan kiertoradan (LEO) paikannus, navigointi ja ajanmääritys (PNT) MINKÄ TAHANSA tähdistöjen yli: jokainen [[system]] on constellation-design-lajin GNSS-esiasetus, LEO-esiasetus

# text
seg-d9e5f4726bbb = Tarkka pistepaikannus (PPP) -konvergenssi pelkällä GNSS:llä ja LEO-augmentaatiolla: float-laajennettu Kalman-suodatin ionosfääristä vapaalla koodilla ja kantoaallon vaiheella staattisin asemakoordinaatein, a

# text
seg-44f4148f4a5f = Paikannus 5G:n ei-maanpäällisen verkon (NTN) alalinkistä matkaviestinpalvelun (MSS) S-kaistalla (3GPP-kaista n256, alalinkki { "2170" }–{ "2200" } MHz; oletuskantoaalto { "2172.5" } MHz): Cramér–Rao-raja

# text
seg-1ee838a551ef = Yksi LEO-PNT-järjestelmä (paikannus, navigointi ja ajanmääritys matalalta Maan kiertoradalta) päästä päähän, mille tahansa tähdistölle ja signaalille: signal_design-kentän nimeämä leo-signal-suunnitelma (julkinen esiasetus tai rivinsisäinen [s

# text
# c1: presets
# c2: signals
# c3: receiver
# c4: acquisition
# c5: compatibility
# c6: trade
# c7: shape_checks
# c8: psd_points
seg-70d1ac6ddc95 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-472d9e86ee20 = <b>Kirjanpito:</b> MODELLED { "2" } · VALIDATED { "2" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>leo-signal</a1>.

# text
# c1: epoch
# c2: duration_s
# c3: step_s
# c4: user
# c5: atmosphere
# c6: ionosphere
# c7: satellite
# c8: leo_constellation
# c9: gnss
# c10: iono_free_pairs
# c11: iot
# c12: spoofer
# c13: name
# c14: description
# c15: skyline
seg-17d1c06ba5c5 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-9a7671c30d7e = <b>Kirjanpito:</b> MODELLED { "7" } · VALIDATED { "5" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>leo-pass</a1>.

# text
# c1: name
# c2: description
# c3: seed
# c4: analysis
# c5: preset
# c6: orbit
# c7: clock
# c8: message
# c9: trade
# c10: comparison
# c11: midpass
seg-cba2c7f7050a = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-7ba3e667487d = <b>Kirjanpito:</b> MODELLED { "5" } · VALIDATED { "6" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>leo-navmsg</a1>.

# text
# c1: mode
# c2: seed
# c3: duration_s
# c4: step_s
# c5: user
# c6: dll
# c7: doppler
# c8: joint
# c9: polar
# c10: timing
# c11: system
# c12: skyline
seg-8ca53a87d092 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>.

# text
seg-389c67090de1 = <b>Kirjanpito:</b> MODELLED { "3" } · VALIDATED { "2" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>leo-pvt</a1>.

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: runs
# c5: criterion_horizontal_m
# c6: criterion_vertical_m
# c7: compare_li_2019
# c8: noise
# c9: site
# c10: gnss
# c11: case
seg-e004092d6056 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-e485df9372e6 = <b>Kirjanpito:</b> MODELLED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>leo-ppp</a1>.

# text
# c1: seed
# c2: carrier_hz
# c3: signal
# c4: integration_s
# c5: doppler_integration_s
# c6: cn0_dbhz
# c7: sync_error_m
# c8: user
# c9: duration_s
# c10: step_s
# c11: system
seg-089266c42199 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-e0a3133f468f = <b>Kirjanpito:</b> VALIDATED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>ntn-positioning</a1>.

# text
# c1: signal_design
# c2: pass
# c3: fusion
# c4: name
# c5: description
# c6: seed
# c7: signal
# c8: navmsg
# c9: od_sisre_m
# c10: ppp
seg-ea759d0040db = Pakolliset kentät: <c1/>, <c2/>, <c3/>. Valinnaiset: <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-db08b7916378 = <b>Kirjanpito (ledger):</b> MODELLED. Koko sivu, jolla ovat syötteet, tulokset, todisteet ja rajoitukset: <a1>leo-pnt-chain</a1>.

seg-534d13455a76 = <s1>Edellinen</s1>Häirintä, harhautus ja spektri

seg-ec3fb19fb5bd = <s1>Seuraava</s1>Kuu ja Maa–Kuu-avaruus
