# docs--leo-navmsg: translations (fi)

seg-cc651d9cef3b = Koodi

seg-cbf0f9bcd2d8 = Oraakkeli

seg-6e0cb6acc073 = VALIDATED

seg-35f8f623ea28 = { "30" } s

seg-f63dd3d7aad4 = Lähde

seg-e305279d5b11 = Sisältö

seg-4d208b6c0eb8 = day

seg-a7d59ba6e225 = rad

# text
seg-02dc0d42fb21 = sfu

seg-0f2d3faa9934 = Lähde: <c1/>

seg-d8aaee95aa44 = Skenaariolaji <c1/> rakentaa matalan Maan kiertoradan (LEO) paikannus-, navigointi- ja ajanmääritys (PNT) -satelliitin lähettämän efemeridi- ja kelloviestin sekä vastaa kysymyksiin, joita viestin suunnittelija esittää: kuinka pitkän ajan yksi viesti voi kattaa, mitä kukin lisäparametri tuo, mitä käyttäjä näkee, kun viesti vaihtuu ylilennon aikana, ja montako bittiä tarvitaan sentin tarkkuuteen.

seg-e61283b1e1a5 = Se on järjestelmäriippumaton. Mikä tahansa kiertorata, mikä tahansa kantoaalto ja mikä tahansa neljästä efemeridimallista ajetaan ilman esiasetusta; nimetyt esiasetukset ovat valinnaista dataa (katso <a1>Esiasetukset</a1>).

seg-1271cd4ad822 = Tulosta mukana tuleva esimerkki komennolla <c1/> (yksi nimi kutsua kohden) ja aja se komennolla <c2/>: <c3/>, <c4/>, <c5/> ja <c6/>. Laji on myös lajin <c7/> viestivaihe (<a1>LEO-PNT.md</a1>) ja kampanjan <c8/> jäsen, joka kokoaa neljä viestikonfiguraatiota ja raportoi kunkin kehyksen pituuden ({ "146" }, { "154" }, { "159" } ja { "171" } tavua).

seg-51da9ffaa0ec = Koodi: <c1/> — <c2/> (tietueet ja käyttäjäalgoritmi), <c3/> (todellinen rata ja kello), <c4/> (sovitin), <c5/> (signaali avaruudessa -etäisyysvirhe), <c6/> (ionosfääri ja yleisaika (UTC)), <c7/> (binäärimuoto), <c8/> (RINEX-tyyliset ja pilkuilla erotetut (CSV) viennit), <c9/> (yksi tiedosto esiasetusta kohden), <c10/> (laji).

seg-0505113a62e3 = Mitä viesti sisältää

seg-6752521002b2 = Osa

seg-cf6ae60eea4f = Aputiedot

seg-00eae74cb1e6 = avaruusaluksen tunniste (SVID), datan julkaisutunniste (IOD), kaistatunniste, signaalin terveystila (Galileon käytäntö: { "0" } OK, { "1" } pois käytöstä, { "2" } laajennettu toiminta, { "3" } testauksessa)

seg-0bdbdd2c923b = Synkronointi

seg-8120237b02ea = viikkonumero, lähetyksen viikon aika (TOW) ja toisen asteen kellopolynomi <c1/>

seg-b09dc4b322d3 = Efemeridi

seg-bbb3225e1d19 = yksi alla olevista neljästä mallista

seg-3a835a49b43f = Muut palvelut

seg-2a13461cb60c = Klobucharin lähetetty ionosfäärijoukko, Galileon NeQuick-G-kertoimet <c1/> viidellä myrskylipulla sekä järjestelmäajan ja UTC:n väliset parametrit <c2/>

seg-6b899ef63047 = Efemeridimallit

seg-60cd077d82a7 = Malli

seg-2afa300864a9 = Parametrit

seg-3e8a1cf183cc = Galileo Open Service Signal-in-Space Interface Control Documentin (OS SIS ICD) Keplerin joukko: <c1/>

seg-b1416ba3472f = sama, lisäksi radansuuntaiset, poikittaiset ja radiaaliset (RAC) korjauspolynomit <c1/>, <c2/>, <c3/> kentässä <c4/>, kertoimet metreinä, <c5/> kakkosen potenssi, joka on vähintään puolet sovitusvälistä (lähetetään), asteluvut määräytyvät kentästä <c6/> (oletus { "7" }, { "5" }, { "6" })

seg-9c0643152bbf = oletuksena { "16" } + { "21" }, lisäksi aika-asteikko

seg-e0afd541d64c = Liun, Sun, Xien, Zhoun ja Qun 22 parametrin malli ({ "2025" }, <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }, doi <a1>10.3390/rs17162894</a1>): { "16" } plus <c1/>

seg-a6042071a03f = ATOMICin (Autonomous Time and Orbit Determination for Microsatellite Constellations) nollakellomalli: Maan keskipisteinen Maan mukana pyörivä (ECEF) polynomi akselia kohden kentässä <c1/> (oletusaste { "6" }), ei kelloparametreja, koska satelliitin kello ohjataan järjestelmäaikaan (<a1>InsideGNSS</a1>)

seg-5869d6f65796 = oletuksena { "22" }

seg-6663aa3eeebc = Käyttäjäalgoritmi (<c1/>) on Galileon ICD:n sarja (Keplerin yhtälö, toisen harmonisen korjaukset, Maan mukana pyörivä solmu), jonka jälkeen kohteelle <c2/> lasketaan kolme polynomia Keplerin radan omassa koordinaatistossa: radiaalinen arvioitua paikkaa pitkin, poikittainen radan normaalia pitkin korjatusta inklinaatiosta ja solmusta, radansuuntainen täydentää kolmikon. Kello lisää ICD:n suhteellisuusteoreettisen termin <c3/>; kohteelle <c4/> se on yleinen muoto <c5/> polynomista ja sen derivaatasta.

seg-b3935a85a7b2 = Liun ym. termit noudattavat artikkelin käyttäjäalgoritmia (kohta { "2.2" }, yhtälöt 1-7): <c1/>, <c2/> (versiot ennen { "0.30" } käyttivät Global Positioning Systemin (GPS) siviilinavigoinnin käytäntöä <c3/>, joten niiden kirjoittama <c4/> on kaksi kertaa artikkelin arvo) sekä <c5/> lisättynä säteeseen, <c6/> korjaamaton leveysargumentti. Mittakaavakäytäntö <c7/> on kirjattu artikkelin yhtälöstä { "1" }; artikkelin vertailu todellisilla radoilla ei riipu siitä (kerroin ½ kohteessa <c8/> jättää jokaisen sovitetun luvun ennalleen), joten lähetetyn arvon <c9/> merkitystä ei siellä validoida.

seg-9a83292bffcf = Kaksi tulkintaa on Kshanan omia ja ne ilmoitetaan sellaisina:

seg-0e42fd0d5cf9 = RAC-koordinaatisto ja normalisointi <c1/>. Mikään julkinen asiakirja ei määritä LEO-korjauskoordinaatistoa lähetetylle viestille.

seg-1b8aaed09de8 = Nollakello-viestin kello on kokonaisuudessaan nolla: ohjaussilmukan oletetaan pitävän näennäisen kellon, suhteellisuusteoreettinen termi mukaan lukien, järjestelmäajassa.

seg-3472ce139588 = Sovitin

seg-4404a677d185 = <c1/> integroi radan kiinteäaskelisella neljännen kertaluvun Runge–Kutta-menetelmällä koordinaatistossa, joka muuttuu Maan mukana pyöriviksi akseleiksi yhdellä kierrolla, <c2/>, samalla yhdellä kierrolla, jonka lähetetty käyttäjäalgoritmi soveltaa. Painovoima on kaksikappale (<c3/>), vyöhykeharmoniset J2–J6 ({ "2" } – { "6" }) tai Earth Gravitational Model { "2008" } (EGM2008) -kenttä asteluvulle ja kertaluvulle { "7" }–{ "70" }, jonka tesseraaliset termit kantavat lyhytjaksoisen allekirjoituksen, joka tekee LEO-sovituksesta vaikean. Ilmanvastus on valinnainen (staattinen eksponentiaalinen tiheys). Kello on vapaasti käyvä (bias, ajautuma, ajautuman nopeus ja valkoinen taajuuskohina ilmoitetulla yhden sekunnin Allanin poikkeamalla, plus jaksollinen suhteellisuusteoreettinen termi) tai ohjattu (ensimmäisen kertaluvun Gauss–Markov-jäännös).

seg-ae3052e66b2a = <c1/> sovittaa Keplerin joukon Levenberg–Marquardt-menetelmällä ei-singulaarisille alkioille (<c2/>, <c3/>, <c4/>): LEO-rata on lähes ympyrä, joten <c5/> ja <c6/> yksinään ovat lähes erottamattomia. Se lähtee oskuloivasta tilasta kohdassa <c7/> J2-solmunopeudella. Heikot nollakeskiset priorit rajoittavat nopeudet ja harmoniset, joita lyhyt kaari ei pysty ratkaisemaan; havaintopainolla { "1" } cm ne vaikuttavat vain näissä nollasuunnissa. Sovitus <c8/> ottaa sen sijaan artikkelin kohdan { "2.3" } lähdön ja estimaattorin: se alkaa kaikilla korjaustermeillä nollana, ei käytä prioreita (tavallinen pienimmän neliösumman menetelmä) ja pitää artikkelin 100 iteraation katon. Se pysähtyy Kshanan omaan parametrien suppenemissääntöön, kun jokainen parametriaskel on alle { "1e-3" } sen muodollisesta keskihajonnasta; artikkeli pysähtyy sen sijaan, kun RMS muuttuu alle { "0.1" } mm. RAC-polynomit sovitetaan sitten radansuuntaisiin, poikittaisiin ja radiaalisiin jäännöksiin lineaarisella pienimmän neliösumman menetelmällä, ja kellopolynomi todelliseen kelloon vähennettynä suhteellisuusteoreettinen termi, jonka käyttäjä lisää takaisin.

seg-020f45edcae1 = Oletusarvojen koodaama havainto: Keplerin pienimmän neliösumman sovituksen jälkeen jäännös on rakenteensa mukaan se, mitä { "16" } parametria eivät voi kattaa, joten se värähtelee ikkunan yli (useita nollanylityksiä kussakin komponentissa) eikä ajaudu. Korjauspolynomi poistaa sen vain, kun sen aste ylittää sen, minkä Keplerin joukko jo kattaa: radansuuntainen { "7" }, poikittainen { "5" } ja radiaalinen { "6" } vievät 15 minuutin jäännöksen senttimetreistä noin millimetriin, kun taas matalammat poikittaisasteet poistavat lähes mitään (poikittainen jäännös on pariton ikkunan keskipisteen suhteen). Järjestelmä, joka johtaa Keplerin osan jollain muulla tavalla, jättää eri muotoisen jäännöksen, ja tarvittavat asteet seuraavat siitä. Celeste-esiasetuksen omat korjausasteet (matalammat kuin nämä; ne ovat vain esiasetustiedostossa, <c1/>) ajetaan tässä Kshanan pienimmän neliösumman pohjalla, minkä vuoksi sen poikittaistermit vaikuttavat tässä moottorissa vähän: lausuma Kshanan sovittimesta, ei mistään todellisesta järjestelmästä. <c2/> ja <c3/> ovat kokonaisia sekunteja, kuten binäärimuoto ne kantaa.

seg-f3538e6651fa = Kutakin viestiä käytetään sovitusikkunansa keskelle sijoitetun jakson ajan (ensimmäinen kompromissitaulukko käyttää koko ikkunaa). Signaali avaruudessa -etäisyysvirheen (SISRE) luvut mittaavat viestin <b>esitysvirhettä</b> suhteessa totuuteen, johon se sovitettiin, neliökeskiarvona (RMS) ja jakson maksimina. Radanmäärityksen ja ratakennusteen virhettä, jonka todellinen maa- tai aluksella oleva segmentti lisää päälle, ei mallinneta.

seg-c2b181269367 = Signaali avaruudessa -etäisyysvirhe

seg-63462a1abc95 = <c1/> käyttää Montenbruckin, Steigenbergerin ja Hauschildin maailmanlaajuista keskimääräistä SISRE:a ({ "2018" }, <em>Advances in Space Research</em> { "61" }({ "12" }):{ "3020" }–{ "3038" }, doi <a1>10.1016/j.asr.2018.03.041</a1>):

seg-c4f654264c42 = Painot ovat keskiarvoja käyttäjille, jotka on jaettu tasaisesti näkyvälle Maan kalotille, kohteille <c1/> ja <c2/>, missä <c3/> on näkölinjan nadirkulma satelliitilla, laskettuna radan omalle säteelle ja korkeuskulman maskille. Maskikulmalla { "0" }° laskenta toistaa artikkelin taulukon keskikorkealla kiertoradalla (GPS { "0.98" } ja 1/49, GLONASS 1/45, Galileo 1/61, BeiDou 1/54) ja geostationaarisella kiertoradalla ({ "0.99" } ja 1/126): se on <b>VALIDATED</b>-tarkistus. LEO:lla sama keskiarvo antaa

seg-66b488889b10 = Korkeus

seg-c07128592d7b = horisontin nadirkulma

seg-a4e04d9a23a5 = { "320" } km

seg-002adc24471f = { "510" } km

seg-fe2f70c29806 = { "550" } km

seg-4dee38ff0811 = { "786" } km

seg-cfc3c6939861 = { "1080" } km

seg-102de0413553 = { "1336" } km

seg-1b11819c8b2f = joten LEO-käyttäjä, joka näkee satelliitin kaukana nadirista, tuntee radansuuntaiset ja poikittaiset virheet paljon voimakkaammin kuin keskikorkean radan käyttäjä.

seg-b7a844ab6135 = Analyysit

seg-17111fe25e04 = <c1/> valitsee minkä tahansa neljästä (oletuksena kaikki).

seg-d0c1b335af73 = Sovitusvälin kompromissi

seg-f65e99c0d8b2 = <c1/> asettaa jakson, sovitusvälit, päivitysjaksot ja mallit. <c2/> ({ "550" } km, { "97.6" }°, EGM2008 asteelle { "20" } ja ilmanvastus, { "30" } minuuttia viestejä) antaa, kun käyttöjakso on yhtä pitkä kuin sovitusväli:

seg-f1a94c795c18 = Sovitusväli

seg-c6b034712788 = SISRE-radan RMS

seg-55c287c93940 = SISRE-radan maksimi

seg-ad604a608329 = SISRE kellon kanssa, RMS

seg-28723ab60ae0 = radiaalinen / radansuuntainen / poikittainen RMS

seg-911a62245e80 = { "60" } s

seg-1a35a89c1a34 = { "0.041" } cm

seg-7cf9e6e3178f = { "0.179" } cm

seg-d8a7f4c080dd = { "0.069" } cm

seg-93773d45092a = { "0.09" } / { "0.01" } / { "0.00" } cm

seg-64015edf42d8 = { "120" } s

seg-a1070c338686 = { "0.032" } cm

seg-cdacf90f8ce8 = { "0.160" } cm

seg-29aeee696ad2 = { "0.079" } cm

seg-1d2d7b57af6b = { "0.06" } / { "0.01" } / { "0.01" } cm

seg-8fa4e4ccc5cc = { "180" } s

seg-13182ae6d536 = { "0.093" } cm

seg-fc692062aaa8 = { "0.540" } cm

seg-9ef760f0777c = { "0.134" } cm

seg-9a7db44eb20e = { "0.18" } / { "0.06" } / { "0.00" } cm

seg-bbd4f2685bee = { "300" } s

seg-93410318239b = { "0.310" } cm

seg-4af8f1c977eb = { "1.033" } cm

seg-0921a535896a = { "0.329" } cm

seg-d50195d4cbea = { "0.09" } / { "0.49" } / { "0.02" } cm

seg-8de43db30454 = { "450" } s

seg-ec7f9ca7654b = { "1.690" } cm

seg-1ad55674fab9 = { "7.542" } cm

seg-a022913c956d = { "1.696" } cm

seg-31564c73398d = { "0.72" } / { "2.65" } / { "0.04" } cm

seg-21b0c99fbda4 = { "600" } s

seg-6840aea9ff12 = { "2.875" } cm

seg-798c8c1d0190 = { "10.219" } cm

seg-6b3b442069d8 = { "2.866" } cm

seg-8a53398e1999 = { "1.72" } / { "4.42" } / { "0.26" } cm

seg-4dabf1faddfc = { "900" } s

seg-d733d3fdac02 = { "9.345" } cm

seg-3334d120521b = { "34.032" } cm

seg-4d4a2cc180d0 = { "9.349" } cm

seg-7651a43f1f33 = { "6.46" } / { "14.14" } / { "0.91" } cm

seg-f1d733b03f45 = { "0.000" } cm

seg-81a60d921ce9 = { "0.057" } cm

seg-724c7750b1ca = { "0.00" } / { "0.00" } / { "0.00" } cm

seg-c8a720a6f160 = { "0.074" } cm

seg-b13f5539e4b1 = { "0.001" } cm

seg-1c9d3ee30ac7 = { "0.090" } cm

seg-7dd08c671dc7 = { "0.004" } cm

seg-740e69fcd85e = { "0.014" } cm

seg-c0db4312d8a0 = { "0.106" } cm

seg-e971c2fe0bb2 = { "0.00" } / { "0.00" } / { "0.01" } cm

seg-f3bda174cbef = { "0.037" } cm

seg-5a5bb868e8ff = { "0.176" } cm

seg-02b99fcb9fee = { "0.127" } cm

seg-e6c45fda719f = { "0.05" } / { "0.01" } / { "0.04" } cm

seg-ec1e77bc5be9 = { "0.214" } cm

seg-d3c1ed834802 = { "0.643" } cm

seg-23482e7c028f = { "0.229" } cm

seg-8f71690a7139 = { "0.28" } / { "0.09" } / { "0.26" } cm

seg-bfec9407ffae = { "1.015" } cm

seg-f295ad6efcf4 = { "3.695" } cm

seg-2cd92d16edfc = { "1.062" } cm

seg-4626119411c4 = { "1.52" } / { "0.70" } / { "0.91" } cm

seg-4e19f776d1b7 = Ja kun sovitus on { "300" } s ja vaihdellaan sitä, kuinka usein uusi viesti ottaa vallan:

seg-89810ffbeff3 = Päivitysjakso

seg-d4d1fa05e1a8 = { "0.314" } cm

seg-828b7488993b = { "0.850" } cm

seg-edb934c1419f = { "0.288" } cm

seg-52c8f821a7d2 = { "0.859" } cm

seg-e135107af135 = { "150" } s

seg-e7ce46d74f3e = { "0.219" } cm

seg-3391df1cf909 = { "0.830" } cm

seg-d6eb4f554461 = { "0.009" } cm

seg-22c68874002b = { "0.010" } cm

seg-2172d9ea618e = 16 parametrin Keplerin joukko heikkenee arvosta { "0.04" } cm kohdassa { "60" } s arvoon { "9.35" } cm kohdassa { "900" } s: yksi Keplerin joukko kaksi kertaa kierrosta kohden olevilla harmonisilla ei pysty seuraamaan LEO-kaaren korkeataajuisempia painovoimatermejä ja ilmanvastusta kuin muutaman minuutin ajan, ja sen pienimmän neliösumman jäännös värähtelee ikkunan yli. Radansuuntaiset/poikittaiset/radiaaliset polynomit (asteet { "7" }, { "5" }, { "6" }) vaimentavat jäljelle jäävän: { "1.01" } cm kohdassa { "900" } s, { "0.21" } cm kohdassa { "600" } s. Lyhimmillä väleillä Keplerin luvut ovat millimetrin alapuolella eivätkä enää ole tiukasti järjestyksessä (sovitusta rajoittaa silloin ehdollisuus, ei malli).

seg-aca262796570 = Mallien vertailu

seg-fdf2368d0210 = <c1/> ajaa neljä mallia { "1" }, { "5" } ja { "10" } minuutin välein samalla radalla, parametrien lukumäärällä ja efemeridin ja kellon biteillä Kshanan koodauksessa:

seg-7d3c6c43390d = Efemeridin + kellon bitit

seg-f7f60c66d89e = { "0.022" } cm

seg-f7bcb8a44fde = { "0.049" } cm

seg-2972b631701e = { "0.230" } cm

seg-cc42e8dc7238 = { "0.260" } cm

seg-67e50069c6f7 = { "3.061" } cm

seg-780954ab9d7f = { "3.071" } cm

seg-de81d6550264 = { "0.044" } cm

seg-fb171bf75f27 = { "0.005" } cm

seg-c8c067631f7a = { "0.120" } cm

seg-2dc41855c245 = { "0.208" } cm

seg-6ef79938dd22 = { "0.046" } cm

seg-7e96d7e34e63 = { "0.142" } cm

seg-c43199891163 = { "0.258" } cm

seg-f9a9fdebc114 = { "0.290" } cm

seg-f157ff5b40b1 = <c1/> (nollakello)

seg-9474a775dc5e = { "28.784" } cm

seg-5098c8b6f813 = { "0.561" } cm

seg-5e7fdc441b03 = { "28.774" } cm

seg-82d3fa2e27ef = Nollakellorivi pisteytetään kelloa vastaan, joka on ohjattu jäännöksellä { "0.24" } m (ATOMIC-luku), muut vapaasti käyvää kelloa vastaan, johon ne sovittuvat.

seg-769db176020f = <b>Liu ym. { "2025" }, SISRE korkeuden funktiona (MODELLED).</b> Sama skenaario sovittaa Kshanan 22 parametrin mallin 20 minuutin kaarille artikkelin viidellä korkeudella, kunkin satelliitin inklinaatiolla:

seg-01e587427a7e = Satelliitti

seg-f6bbd3d5d75c = Inklinaatio

seg-c54d0bd7d498 = Liu ym. { "2025" }

seg-16c489b75f44 = Kshana (vain radan RMS)

seg-ee4816ca13c1 = suhde

seg-510349500d23 = { "8.88" } cm

seg-a97bde451ec2 = { "4.25" } cm

seg-b6c1d48847d9 = { "475" } km

seg-f79249e9bd75 = { "6.21" } cm

seg-9b6757a674a5 = { "2.87" } cm

seg-62008169ca69 = { "2.20" } cm

seg-06a4bcde0ea3 = { "966" } km

seg-9e5e06ec23c3 = { "2.11" } cm

seg-41ce80bc0b62 = { "1.25" } cm

seg-c9f63cd8bd07 = { "0.75" } cm

seg-f11a960a1d52 = { "0.51" } cm

seg-0376cf5f98f0 = Tämä <b>ei</b> ole validointi. Artikkeli sovitti nimettyjen satelliittien todellisia tarkkoja tieteellisiä ratoja (täydellä painovoima-, ilmanvastus- ja ei-gravitaatiohistorialla); Kshana sovittaa oman integroidun ratansa, arvioi kuusi lisäparametria edellä kuvatulla tavalla ja käyttää omia SISRE-painojaan. Vertailu osoittaa suuntauksen ja suuruusluokan. Vertailu samoilla todellisilla radoilla, jotka artikkeli sovitti, on <c1/> (versiosta { "0.30" } lähtien 22 parametrin sovitus on siellä yhtä mieltä ennakkorekisteröidyn kertoimen { "1.5" } sisällä, artikkelin päivinä ja kahdeksana pidätettynä päivänä).

seg-d82887c766e3 = Päivitys kesken ylilennon

seg-d1104b6ea7fa = <c1/> sijoittaa käyttäjän (oletus { "45" }° N, { "10" }° E), etsii korkeimman maskin yläpuolisen ylilennon jaksosta <c2/> ja ajoittaa viestit välein <c3/>. Jokaisessa ylilennon sisäisessä vaihdossa se raportoi paikkahypyn, kellohypyn, käyttäjän pseudoetäisyyshypyn (uusi viesti miinus vanha), suurimman hypyn, jonka mikä tahansa näkyvä käyttäjä voisi nähdä (suljettu muoto nadirkartion yli), etäisyysvirheen ennen ja jälkeen sekä PASS tai FAIL vastaan <c4/>. <c5/> (sovitukset { "300" } s, päivitettynä { "150" } s välein):

seg-7d91304c87e3 = Vuorokauden korkein ylilento saavuttaa korkeuskulman { "43.7" }° ja kestää { "455" } s. Sen vaihdot:

seg-289e8da49cc8 = Vaihto

seg-e80d12ee2259 = Korkeuskulma

seg-b16789d14338 = Paikkahyppy

seg-b3c252609532 = Kellohyppy

seg-8239a390ec71 = Käyttäjän etäisyyshyppy

seg-4153faf7969d = Pahimman geometrian hyppy

seg-14402c7fb332 = IOD { "270" } → { "271" }

seg-7862a97ac55f = { "0.07" } mm

seg-4cfe934c881f = { "0.19" } mm

seg-9e9752920165 = -0.17 mm

seg-4267557786be = { "0.27" } mm

seg-46872e8925b2 = IOD { "271" } → { "272" }

seg-4c803fd2ccc9 = { "0.14" } mm

seg-cc9a8388f6bc = -0.24 mm

seg-0549f7fd0633 = IOD { "272" } → { "273" }

seg-ad1afcf9a466 = -0.22 mm

seg-c1b30171b4f0 = { "0.35" } mm

seg-f93647402fa9 = { "0.48" } mm

seg-69b35182807c = Suurin käyttäjän etäisyyshyppy { "0.35" } mm kynnystä { "5" } cm vastaan: <b>PASS</b>.

seg-96dcb456600d = Koodaus ja purku

seg-1b3674a0e041 = <c1/> koodaa kolmesta viestistä ensimmäisen, purkaa sen, tarkistaa CRC:n ja hylkää turmeltuneen kopion, tulostaa kvantisointibudjetin sekä kirjoittaa ja lukee takaisin RINEX-tyylisen lohkon ja CSV-taulukon:

seg-480eb9ffc333 = kehys: { "171" } tavua ({ "1310" } hyötykuormabittiä, joista { "1045" } on efemeridiä ja kelloa), 24-bittinen syklinen redundanssitarkistus (CRC-24Q) <c1/>;

seg-0e2a64a063fd = minkä tahansa yksittäisen kentän suurin puoliaskelvaikutus: <c1/>, { "0.545" } mm;

seg-a1875f7088b0 = koko viesti kvantisoinnin jälkeen: paikka { "1.126" } mm:n ja kello { "0.185" } mm:n sisällä täsmällisestä viestistä; SISRE { "0.113" } cm täsmällisenä, { "0.129" } cm puretussa;

seg-6e818708b695 = kehys, jossa yksi bitti on käännetty, hylätään: tosi;

seg-31fe0f6b133d = RINEX-tyylinen edestakainen kierros { "5.0e-06" } m:n sisällä, CSV-edestakainen kierros { "0.0e+00" } m:n sisällä.

seg-405cf34090cc = Alustariippumattomuus

seg-7f2193f6ff06 = Kehys on lähetettyjä kokonaislukuja, joten sen on oltava samat kokonaisluvut missä ja miten tahansa skenaario ajetaan: natiivi binääri millä tahansa käyttöjärjestelmällä, debug- tai release-käännös sekä selaimessa toimiva WebAssembly (WASM) -käännös. Tiellä oli kolme asiaa. Isäntäkoneen matematiikkakirjaston sini, kosini, arkustangentti ja eksponentti eivät välttämättä ole oikein pyöristettyjä ja eroavat isäntien välillä viimeisessä numerossa. Optimoitu käännös macOS:ssä ottaa yhden argumentin sinin ja kosinin järjestelmän yhdistetystä rutiinista, joka ei aina palauta yksittäisen sinin arvoa, joten debug- ja release-käännös erosivat myös. Ja tavallinen normaalijakaumanäytteistin kutsuu isännän eksponenttia ja logaritmia harvinaisissa haaroissaan. Sovitus muuttaa näin pienen eron erilaisiksi kvantisoiduiksi kentiksi. Koko laji (todellinen rata ja kello, sovitus, käyttäjäalgoritmi, signaali avaruudessa -etäisyysvirhe (SISRE), koodekki) laskee siksi jokaisen tällaisen funktion puhtaalla Rust-kirjastolla (crate) <c1/> kautta <c2/>, kokonaislukupotenssit eksplisiittisinä tuloina ja normaalipoikkeamat napamenetelmällä generaattorin raakatulosteesta. <c3/> lukitsee alla olevan koodaus- ja purkuskenaarion 171 tavun kehyksen ja yhden tarkistusarvon efemeridimallia kohden; debug-käännös, release-käännös ja WASM-käännös antavat tavu tavulta identtiset tulosasiakirjat kaikille viidelle mukana tulevalle skenaariolle lajista <c4/>.

seg-1ef00467df17 = Binäärimuoto

seg-af2dae9e9e7c = <b>Tämä on Kshanan oma dokumentoitu koodaus.</b> Se kantaa ne osat, jotka LEO-navigointiviestien julkaistut kuvaukset nimeävät, mallinnettuna Galileon ICD-kenttäjoukon mukaan. Se <b>ei</b> ole Celesten tai minkään muun järjestelmän bittirakenne: yksikään ei ole julkinen.

seg-6a730c01ad1c = Kehys: johdanto <c1/> ({ "8" } bittiä), versio { "1" } ({ "4" }), malli ({ "4" }: { "1" } <c2/>, { "2" } <c3/>, { "3" } <c4/>, { "4" } <c5/>), hyötykuorman pituus tavuina ({ "12" }), hyötykuorma nollatäytettynä tavun rajaan, CRC-24Q (24-bittinen syklinen redundanssitarkistus, { "24" } bittiä) jokaisen edeltävän tavun yli. CRC-24Q on Radio Technical Commission for Maritime Services -standardin RTCM { "10403" } ja Galileon ICD:n tarkistus (polynomi <c6/>, alkuarvo { "0" }); koodi toistaa luettelon tarkistusarvon <c7/> syötteelle <c8/> ja RTCM { "10403" } -viestityypin { "1005" } esimerkkikehyksen tarkistustavut (<b>VALIDATED</b>).

seg-a31d899eb435 = Galileon ICD:n askeleet valittiin keskikorkealle kiertoradalle, ja ne ovat liian karkeita senttitason LEO-viestille: <c1/> askelin { "2" }⁻⁵ m ({ "3.1" } cm), <c2/> { "2" }⁻²⁹ rad ({ "1.3" } cm LEO-säteellä), kulmat { "2" }⁻³¹ puoliympyrää ({ "1.0" } cm) ja <c3/> { "2" }⁻³⁴ s ({ "1.7" } cm). Kshana säilyttää ICD:n yksiköt ja puoliympyräkäytännön, tihentää askeleet niin, että jokaisen kentän puoliaskelvirhe pysyy alle { "1" } mm:n paikkaa tai etäisyyttä 15 minuutin ikkunassa, ja leventää kenttiä, jotta LEO-sovituksen tarvitsemat alueet säilyvät:

seg-caddc6f5b9a7 = Lohko

seg-b548b723c201 = Bitit

seg-d00b65801e9b = Askel

seg-2085d172bec3 = aputiedot ja synkronointi

seg-7e9018f82811 = viikko

seg-45cbfedb6f0e = kello (lippubitti { "0" })

seg-05d274f5ce99 = s/s^{ "2" }

seg-9d6d5136e12a = Keplerin (mallit 1-3)

seg-3fb59c8238cb = puoliympyrä

seg-d173e8d7026c = m^{ "0.5" }

seg-48c8bfb6e914 = radansuuntaiset/poikittaiset/radiaaliset korjaukset (malli { "2" })

seg-131652f53721 = Liu ym. { "2025" } lisät (malli { "3" })

seg-fccf37a24fc4 = puoliympyrä/s^{ "2" }

seg-ebde561c17ab = ECEF-polynomi (malli { "4" })

seg-822c7482547c = Klobuchar (lippubitti { "1" })

seg-7dd6e8bcaf43 = s/puoliympyrä^{ "2" }

seg-09408b08c481 = s/puoliympyrä^{ "3" }

seg-734162101b2d = NeQuick-G (lippubitti { "2" })

seg-ddbb363f4593 = sfu/deg^{ "2" }

seg-e2744b31e5d3 = UTC (lippubitti { "3" })

seg-545755e7b26f = Arvo, joka on kentän alueen ulkopuolella, hylätään, ei kierretä ympäri. Alueet tarkistettiin koodaamalla sovituksia korkeuksilla { "300" }–{ "2000" } km, inklinaatioilla { "0" }°–{ "140" }° ja sovitusväleillä enintään { "20" } minuuttia: <c1/> ja <c2/> ovat leveitä, koska lähes päiväntasaajan radalla solmu on huonosti määritelty ja sovitus jakaa leveysargumentin J2-ajautuman niiden kesken, ja <c3/> ja <c4/> siksi, että 22 parametrin sovitus { "20" } minuutin yli imee osan isoakselin lyhytjaksoisesta värähtelystä. Versiosta { "0.30" } lähtien 22 parametrin sovitus on artikkelin tavallinen pienimmän neliösumman menetelmä ilman prioreita, ja päiväntasaajan { "800" } km:n sovitus tarvitsee silloin arvon <c5/> noin { "6.3e-10" } puoliympyrää/s^{ "2" }, joten sen mittakaava muuttui arvosta { "2" }^-60 arvoon { "2" }^-58. Kohteen <c6/> 7. asteen radansuuntaiset korjaukset mahtuvat 22-bittiseen kerroinalueeseen { "15" } minuuttiin asti; pidempi sovitus voi ylittää sen ja hylätään silloin. <c7/> raportoi jokaiselle efemeridin ja kellon kentälle suurimman paikan ja etäisyyden muutoksen, jonka puoliaskelmuutos aiheuttaa käyttöjakson aikana, sekä koko viestin muutoksen kvantisoinnin jälkeen.

seg-1ad17f3d3643 = Tekstiviennit

seg-81fb376aa1e1 = <b>RINEX { "4.02" } ei määritä LEO-navigointitietueita</b> (sen järjestelmätunnukset ovat G, R, E, J, C, I ja S; <a1>International Global Navigation Satellite System (GNSS) Service (IGS) RINEX { "4.02" }</a1>). Lohko, jonka <c1/> kirjoittaa, lainaa RINEX { "4" } -muodon rakennetta — tietueen otsikko <c2/>, satelliitti- ja epookkirivi kolmella kelloparametrilla, lähetetyn radan rivit, joilla on neljä <c3/>-kenttää — ja on <b>dokumentoitu Kshanan laajennus</b>: järjestelmätunnus <c4/>, tietuetyypit <c5/>, <c6/>, <c7/>, <c8/> ja kolme otsikkokommenttia, jotka sen kertovat. Aiempaa työtä LEO-radoista RINEX-4-tyylisissä navigointitietueissa: <a2>arXiv { "2401.17767" }</a2>.

seg-9a3016441bce = CSV-taulukko kantaa viestit <c1/> ja <c2/> yhden riviä kohden. Oletussarakkeet käyttävät Galileon ICD:n nimiä (<c3/>); <c4/> valitsee sen sijaan esiasetuksen kirjoitusasun. Molemmat muodot luetaan takaisin.

seg-4a26902d2771 = Ionosfääri ja UTC

seg-c4d4dd2bac45 = <b>Klobuchar</b>: moottorin L1-malli (<c1/>, tarkistettu RTKLIB:ia vastaan) skaalattuna kantoaallolle ensimmäisen kertaluvun lailla <c2/>.

seg-0d3973f04ee5 = <b>NeQuick-G</b>: kertoimet kulkevat viestissä ja <c1/> palauttaa arvon <c2/> muunnetulle dip-leveysasteelle <c3/>, algoritmin säännöillä (kaikki nollakertoimet antavat { "63.7" } aurinkovuoyksikköä, sfu; tulos rajataan välille [{ "0" }, { "400" }] sfu). NeQuickin elektronitiheysmallia ja sen vinointegrointia, jotka muuttavat suureen <c4/> viiveeksi, <b>ei</b> ole toteutettu.

seg-66dbd447dfeb = Satelliitti muutaman sadan kilometrin korkeudella lentää ionosfäärin sisällä. Kumpikaan lähetetty malli ei huomioi satelliitin yläpuolista elektronipitoisuutta, eikä sille käytetä korjausta.

seg-7befd59b2ac6 = <b>UTC</b>: <c1/> soveltaa Galileon ICD:n kohdan § { "5.1.7" } kolmea tapausta (ennen karkaussekuntitapahtumaa, kuuden tunnin sisällä siitä ja sen jälkeen); lisätty sekunti lukee { "86400" }.

seg-2b0d77219437 = Esiasetukset

seg-d2908020db08 = Esiasetukset ovat dataa, yksi tiedosto kutakin hakemistossa <c1/>, lähteineen. Moottori ja jokainen mukana tuleva skenaario Celesteä lukuun ottamatta ajetaan ilman niitä.

seg-c353e7bec219 = Avain

seg-5566e1d71a4f = Kiertorata

seg-33f4c7af9c53 = Kantoaalto

seg-f4510e898031 = Viestimalli

seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

seg-890aa92157e4 = { "1080" } km, { "53" }°

seg-1eca13ba2309 = X1 { "1593.3225" } MHz

seg-ee9947222a30 = ei julkaistu

seg-77af616c1f6e = PUBLIC, arXiv { "2509.19551" }

seg-f016786d7755 = { "520" } km, { "97" }°

seg-780e931bf88d = PUBLIC, <a1>RNTF report</a1>, tähdistön kuvaus

seg-d5df094a5f89 = { "781" } km, { "86.4" }°

seg-94bc78cee128 = { "1621" } MHz ({ "1616" }–{ "1626" } MHz band)

seg-3f5de7f74502 = ei lähetystä

seg-4944294c230f = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>, tähdistön kuvaus

seg-c2a2761f73b1 = { "550" } km, { "53" }°

seg-2ef501f97eff = Ku-kaista, kaistan keskiarvo (edustava)

seg-567fab40bd24 = ei mitään (opportunistiset signaalit)

seg-a76527ba66b6 = PUBLIC, <a1>Sensors { "2023" }</a1>, <a2>Satellite Navigation { "2026" }</a2>

seg-f5dd5086eedd = { "700" } km, { "55" }°

seg-5fa6b60f66b4 = lähellä B1:tä (peitetty lähteessä; L1 sijaisena)

seg-5ebbf0042d7c = REPRESENTATIVE

seg-4f3e5a683682 = { "600" } km, { "97.8" }°

seg-c06f62ca5173 = { "5020" } MHz (RNSS C-kaistan keskikohta)

seg-884c81e55e79 = PUBLIC, <a1>InsideGNSS</a1>

seg-3b1fd041f9ba = { "500" } km (edustava)

seg-522c85402d84 = L1 (edustava)

seg-064b03765e4d = <c1/>, aste { "6" }, { "60" } s, päivitetään { "30" } s välein, nollakello, { "0.24" } m ohjausjäännös

seg-5619bc61b958 = WORKSHOP and PUBLIC

seg-20572d7e348d = { "510" } km, { "97.4" }°

seg-a17f4b4f7fb5 = { "1191.795" } MHz

seg-fad0950a2d67 = <c1/>, asteet ja tietueväli esiasetustiedostossa

seg-e881ffc4e14b = RNSS on radionavigointisatelliittipalvelu; RNTF on Resilient Navigation and Timing Foundation.

seg-e9524c71636d = <b>Celeste IOD.</b> Euroopan avaruusjärjestön (ESA) Celeste-kiertoratademonstraation (IOD) esiasetus on ainoa, joka käyttää ESA:n Navigation Innovation and Support Programme (NAVISP) LEO-PNT-työpajassa vuonna { "2026" } esitettyä aineistoa: viestin rakenne (Galileon Keplerin joukko plus radansuuntaiset/poikittaiset/radiaaliset korjauspolynomit, kellopolynomi, SVID, terveys, IOD, ionosfääri- ja UTC-parametrit), tietueväli ja CSV-sarakenimet. Kiertorata ({ "510" } km, lähes napainen aurinkosynkroninen) ja kantoaalto tulevat tiedostossa mainituista julkisista lähteistä. Celesten bittirakenne ei ole julkinen eikä sitä toisteta; myöhemmät Celesten vaiheet ja Euroopan unionin (EU) LEO-PNT-järjestelmä voivat poiketa. Jokainen työpajasta johdettu arvo on tiedoston <c2/> moduulissa <c1/>, jota käyttää <c3/>. Esiasetus pidetään pois näin: jokainen moottorin työpajasta johdettu luku on yhdessä tiedostossa, <c4/>, jonka <c5/> käännökseen mukaan vain, jos se on olemassa, sekä vain repositoriossa olevissa skenaarioissa <c6/>. Poistamalla tuo tiedosto ja ne skenaariot esiasetus pidetään pois ilman lähdekoodimuutosta; jokainen muu testi, oraakkeli ja skenaario ajetaan ilman sitä, ja README:n skenaariotiedostojen lukumäärä laskee edelleen pois pidetyt tiedostot.

seg-906da2752f76 = Varmennus

seg-7338b6210228 = Rivi

seg-c5ce76c91ff7 = Merkintä

seg-cfe0d596296e = SISRE-painot

seg-3e0059048a0d = Montenbruck ym. { "2018" } taulukko (GPS, GLONASS, Galileo, BeiDou, geostationaarinen)

seg-0f5e73171fe0 = Galileon ICD:n käyttäjäalgoritmi

seg-29ad977ef423 = RTKLIB <c1/> neljällä todellisella Galileon lähetetyllä efemeridillä, { "1" } mm akselia kohden (<c2/>)

seg-ecec254e8219 = luettelon tarkistusarvo <c1/>; RTCM { "10403" } { "1005" } -esimerkkikehys

seg-388633e4e785 = Sovittimen ja SISRE:n kompromissi

seg-8b85c3277e66 = kaksikappaletotuus palautettu { "1" } mm:n tarkkuudella; korjattu J2–J6-sovitus { "1" } mm:n tarkkuudella; monotoninen kasvu välin mukana

seg-4de7f2b173c5 = Ylilennon aikainen jatkuvuus

seg-bdbd2771c7f5 = hyppyidentiteetti; suljetun muodon kartiorajoite näytteenottoa vasten

seg-468a92a2caf7 = Binäärimuoto ja budjetti

seg-ba26f5f63172 = edestakaiset kierrokset; jokaisen kentän puoliaskel alle { "1" } mm

seg-9be43cbef131 = RINEX-tyylinen ja CSV

seg-a7748156fd6e = edestakaiset kierrokset

seg-88b5cda10923 = Liu ym. { "2025" } 22 parametrin malli ja sovitus

seg-7272ebdc1fec = TU Grazin ITSG-tarkat radat neljälle satelliitille vastaan artikkelin taulukot { "4" }, { "5" }, { "6" } ja { "8" }: radansuuntaiset, poikittaiset, radiaaliset ja SISRE-suhteet { "0.755" }–{ "1.138" } artikkelin päivinä ja { "0.683" }–{ "1.186" } kahdeksana pidätettynä päivänä, 1.5x:n sisällä (<c1/>)

seg-94066142a642 = ATOMICin nollakellopolynomi ja viiden korkeuden taulukko

seg-205cdc6a3696 = ATOMIC-tiedot lähteestä InsideGNSS; julkaistu Liun taulukko Kshanan integroidun radan sovituksen rinnalla tulostettuna, ei lukittu

seg-8c00ed11609c = ICD:n suljetut muodot; RTKLIB:lla tarkistettu Klobuchar-malli

seg-d5653e0958b5 = SISRE on vain esitysvirhe: ei radanmääritys- tai ratakennusteen virhettä.

seg-4968d9fcbc19 = Totuus on Kshanan integrointi (ei kolmatta kappaletta, auringon säteilypainetta tai vuorovesiä), ei todellisen satelliitin tarkka rata.

seg-6a4a1bf21b50 = Binäärimuoto ja RINEX-tyylinen lohko ovat Kshanan omia.

seg-26c0a2693081 = NeQuick-G kuljetetaan, ei integroida viiveeksi; ei korjausta ionosfäärin sisällä olevalle satelliitille.

seg-2a0c8190c38e = Liun ym. vertailu eroaa radoissa, parametrien tulkinnassa ja painoissa.

seg-4abe216f987a = <s1>Edellinen</s1>LEO-ylilento ja linkkibudjetti

seg-59d9bf4735d8 = <s1>Seuraava</s1>Yhdistetty MEO- ja LEO-paikannus
