# docs--kind-leo-navmsg: translations (fi)

seg-debc2f07db78 = true

seg-cb91473bfdda = Aihesivu: <a1>LEO-PNT.md</a1>

seg-1d65b71c5de0 = { "5" } mukana toimitettua skenaariota käyttää tätä tyyppiä; muut ovat kohdassa <a1><c1/></a1>.

seg-648c27220789 = Lähde: <c1/>

seg-087287602b47 = <c1/> (skenaariotyyppi)

seg-49964654d5f4 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Matalan Maan kiertoradan navigointi</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; tyyppi on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-867f3e41b5ab = LEO-navigointiviesti: matalan Maan kiertoradan (LEO) paikannus-, navigointi- ja ajanmääritys-satelliitin lähettämä efemeridi ja kello, mille tahansa radalle, kantoaallolle ja mallille, valinnaisilla nimetyillä esiasetuksilla (Xona Pulsar, Iridium, Starlink, CentiSpace, edustava C-kaistan järjestelmä, ATOMIC-nollakellomalli, Celeste IOD). SISÄLTÖ: apudata (SVID, datan numero, kaista, signaalin terveys), synkronointi (viikko, viikon aika, toisen asteen kellopolynomi af0-af2 hetken toc ympärillä), efemeridi neljässä mallissa -- Galileo OS SIS ICD:n 16-parametrinen Kepler-joukko; kyseinen joukko sekä radan suuntainen, sivusuuntainen ja säteittäinen korjauspolynomi; Liu ym. { "2025" } 22-parametrinen malli; ECEF-polynomi ilman kellotermejä (ATOMIC-nollakello) -- sekä muut palvelut (Klobuchar-lähetysjoukko, NeQuick-G ai0-ai2 tehollisella ionisaatiotasolla, sekä järjestelmäajan ja UTC:n väliset parametrit ICD:n karkaussekuntilogiikalla). SOVITIN: tosi rata integroituna zonaalisella J2-J6- tai EGM2008-painovoimalla valittuun asteeseen ja ilmanvastuksella, sekä siemenluvulla alustettu vapaa tai ohjattu kello; Levenberg-Marquardt-sovitus Kepler-joukolle ei-singulaarisilla elementeillä, sitten lineaariset pienimmän neliösumman korjauspolynomit; kello sovitettuna vähennettynä suhteellisuusteoreettisella termillä, jonka käyttäjä lisää. ANALYYSIT: fit-interval-trade (signaalin avaruudessa -etäisyysvirhe, SISRE, globaaleilla keskiarvopainoilla radan korkeudelle, sovitusvälin ja päivitysjakson funktiona, pelkkä rata ja kellon kanssa), model-comparison (neljä mallia, parametrien lukumäärä, koodatut bitit sekä Kshanan sovitus Liu ym. korkeuksilla julkaistujen lukujen rinnalla), midpass-update (korkein ohitus käyttäjän yli, kunkin viestinvaihdon paikka-, kello- ja käyttäjäetäisyyshyppy, huonoimman geometrian hyppy, PASS/FAIL jatkuvuuskynnystä vastaan), encode-decode (Kshanan oma dokumentoitu binäärikehys CRC-24Q:lla, kenttäkohtainen puoliaskelkvantisointibudjetti, vioittuneen kehyksen tarkistus, RINEX-4-tyylinen tietueen vienti ja tuonti, joka on merkitty Kshana-laajennukseksi, sekä CSV-taulukko). VALIDATED: SISRE-painot julkaistua MEO/GEO-taulukkoa vastaan (Montenbruck ym. { "2018" }); Galileo-käyttäjäalgoritmi RTKLIB:ia vastaan todellisilla Galileon lähetysefemerideillä; CRC-24Q luettelon tarkistusarvoa ja RTCM { "1005" } -esimerkkikehystä vastaan. MODELLED: jokainen sovitus- ja SISRE-luku on esitysvirhe Kshanan integroimaa tosi rataa vastaan (ei radanmääritys- tai ennustevirhettä); Liu ym. -vertailu käyttää eri ratoja; koodaus- ja tekstimuodot ovat Kshanan omia.

seg-e5a4f0290e9e = Yksi tiedoston <c1/> ajo tiivistyy seuraavasti: LEO-navigointiviesti — { "510" } km, { "97.4" } deg, painovoima-aste { "20" }, malli kepler-rac SISRE-painot: w_R { "0.459" }, w_AC^{ "2" } 1/2.53 (maski { "0" } deg) encode-decode: malli kepler-rac, kehys { "152" } tavua ({ "1156" } hyötykuormabittiä, { "891" } efemeridi+kellobittiä), CRC-24Q 0x58ADF2 kvantisointi: suurin paikanmuutos { "0.52" } mm, kello { "0.09" } mm; SISRE tarkka { "0.0013" } m, kvantisoitu { "0.0013" } m vioittunut kehys hylätty: true; RINEX-kierros { "4.43e-6" } m; CSV-kierros { "0.00e0" } m sovitusvälin kompromissi ajalla { "1800" } s (käyttöjakso = sovitusväli): kepler16 { "60" } s SISRE rata RMS { "0.0003" } m maks { "0.0015" } m kellon kanssa RMS { "0.0006" } m kepler16 { "120" } s SISRE rata RMS { "0.0003" } m maks { "0.0015" } m kellon kanssa RMS { "0.0007" } m kepler16 { "300" } s SISRE rata RMS { "0.0036" } m maks { "0.0141" } m kellon kanssa RMS { "0.0037" } m kepler16 { "600" } s SISRE rata RMS { "0.0293" } m maks { "0.1023" } m kellon kanssa RMS { "0.0293" } m kepler16 { "900" } s SISRE rata RMS { "0.1073" } m maks { "0.3812" } m kellon kanssa RMS { "0.1075" } m kepler-rac { "60" } s SISRE rata RMS { "0.0000" } m maks { "0.0000" } m kellon kanssa RMS { "0.0005" } m kepler-rac { "120" } s SISRE rata RMS { "0.0001" } m maks { "0.0002" } m kellon kanssa RMS { "0.0007" } m kepler-rac { "300" } s SISRE rata RMS { "0.0005" } m maks { "0.0021" } m kellon kanssa RMS { "0.0012" } m kepler-rac { "600" } s SISRE rata RMS { "0.0097" } m maks { "0.0395" } m kellon kanssa RMS { "0.0096" } m kepler-rac { "900" } s SISRE rata RMS { "0.0388" } m maks { "0.1143" } m kellon kanssa RMS { "0.0390" } m 16-parametrinen Kepler-joukko heikkenee arvosta { "0.0003" } m ajalla { "60" } s arvoon { "0.1073" } m ajalla { "900" } s: yksi Kepler-joukko kierroskohtaisilla kaksinkertaisilla harmonisilla ei pysty seuraamaan LEO-kaaren korkeampitaajuisia painovoimatermejä ja ilmanvastusta kuin muutaman minuutin ajan, ja sen pienimmän neliösumman jäännös värähtelee ikkunan yli. Radan suuntaiset, sivu- ja säteittäispolynomit, joiden aste on korkeampi kuin Kepler-joukon kattama, imevät jäljelle jäävän, jolloin tulos on { "0.0388" } m ajalla { "900" } s.

seg-3f299f6b20c8 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-3adfcd7e275c = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-8243db187e2f = [encode-decode, fit-interval-trade]

seg-e866d042aab8 = Celeste IOD -viesti (workshop-esiasetus)

seg-c42f5a1ed964 = [kepler16, kepler-rac]

seg-549a6103e711 = bitti

seg-fb689f03361c = tavu

seg-c60901596100 = Tuloksen nimike (moottorin oma): MIXED — VALIDATED rakennuspalikat, MODELLED tulokset. SISRE-painot toistavat julkaistun MEO/GEO-taulukon (Montenbruck ym. { "2018" }), Galileo ICD -käyttäjäalgoritmi toistaa RTKLIB:n todellisilla Galileon lähetysefemerideillä, ja CRC-24Q toistaa luettelon tarkistusarvonsa ja RTCM { "1005" } -esimerkkikehyksen

seg-35e92abc6a23 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/leo-navmsg-celeste-iod.toml, tyyppi leo-navmsg

seg-43c1d9c81ccf = MODELLED { "5" } · VALIDATED { "6" }: tämän tyypin mainitsevat <a1>varmennusmatriisin</a1> rivit.

seg-efbe11be7ca1 = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: säteispaino w_R ja neliöity poikittaispaino w_AC^{ "2" } suuntaviivan nadiirikulman cos^{ "2" }- ja puolikkaan sin^{ "2" }-arvojen keskiarvoina näkyvän Maan kalotin käyttäjien yli, jotka on jakautunut tasaisesti elevaation yläpuolella

seg-b27c5fe8e179 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: Galileo OS SIS ICD:n Kepler-evaluointi (Keplerin yhtälö, toisen harmonisen korjaukset, Maan kiinteä solmu) kirjoitettuna erikseen moottorin RINEX-evaluaattorista, palauttaen paikan argumentin kanssa Testit: <a1>leo_navmsg_reference.rs</a1>.

seg-3a53131dc9a4 = <b>VALIDATED</b> leo_navmsg::codec::crc24q: generaattoripolynomi 0x1864CFB, alkuarvo { "0" }, ei heijastusta, ei loppu-XOR:ia, tarkistus, jonka Kshanan LEO-kehys kantaa jokaisen edeltävän tavun yli

seg-2b24c2669c23 = <b>VALIDATED</b> Tyypin <c1/> sovitin ja kompromissi: tosi rata integroituna zonaalisella J2-J6- tai EGM2008-painovoimalla valittuun asteeseen ja ilmanvastuksella, sekä siemenluvulla alustettu vapaa tai ohjattu kello; Galileo-Kepler-joukon Levenberg-Marquardt-sovitus ei-singulaarisilla

seg-ddb27b07b9af = ja { "7" } muuta matriisissa.

seg-053dae66c1be = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: säteispaino w_R ja neliöity poikittaispaino w_AC^{ "2" } suuntaviivan nadiirin cos^{ "2" }- ja puolikkaan sin^{ "2" }-arvojen keskiarvoina . Oraakkeli (ExternalDataset): Montenbruckin, Steigenbergerin ja Hauschildin ({ "2018" }) julkaistu SISRE-painokerroin-taulukko, Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } ja 1/49, GLONASS { "0.98" } ja 1/45, Galileo { "0.98" } ja 1/61, BeiDou MEO { "0.98" } ja 1/54, BeiDou IGSO/GEO { "0.99" } ja 1/126. Sama keskiarvo laskettuna LEO-säteillä antaa

seg-5b43ffde4634 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: Galileo OS SIS ICD:n Kepler-evaluointi (Keplerin yhtälö, toisen harmonisen korjaukset, Maan kiinteä solmu) kirjoitettuna erik. Oraakkeli (ExternalDataset): RTKLIB 2.4.2-p13 eph2pos ECEF-paikat (saman ICD-algoritmin riippumaton toteutus) todellisille BKG/IGS-lähetystietueille päivältä 2024-09-10, molemmat tallennettuina alkuperätietoineen hakemistoon tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Tämä validoi Kepler-käyttäjäalgoritmin; sen päälle lisätyt radan suuntaiset / sivu- / säteittäiskorjaukset katetaan omilla riveillään, ja Liu-termit b

seg-5b4f1e63795f = <b>VALIDATED</b> leo_navmsg::codec::crc24q: generaattoripolynomi 0x1864CFB, alkuarvo { "0" }, ei heijastusta, ei loppu-XOR:ia, tarkistus, jonka Kshanan LEO-kehys kantaa jokaisen edeltävän. Oraakkeli (ExternalDataset): Näiden parametrien CRC-luettelon tarkistusarvo (reveng.sourceforge.io CRC catalogue, CRC-24/LTE-A: leveys { "24" }, poly 0x864CFB, alku { "0" }, tarkistus 0xCDE703), jotka ovat RTCM { "10403" }:n ja Galileo OS SIS ICD:n CRC-24Q-parametrit, sekä RTCM { "10403" }:ssa painettu viestityypin { "1005" } esimerkkikehys

seg-6e2719a28884 = <b>VALIDATED</b> Tyypin <c1/> sovitin ja kompromissi: tosi rata integroituna zonaalisella J2-J6- tai EGM2008-painovoimalla valittuun asteeseen ja ilmanvastuksella, sekä siemenluvulla alustettu vapaa tai ohjattu. Oraakkeli (ExternalDataset): Todelliset tarkat tieteelliset radat totuutena (TU Graz IfG/ITSG:n operatiiviset reduced-dynamic-radat, vapaasti käytettävissä mihin tahansa kiitoksella; SHA-256-arvot fixturen NOTICE-tiedostossa), sovitettuina 16-parametrisella joukolla { "20" } ja { "30" } min kaarilla, verrattuna tilastoihin, jotka Liu ym. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) julkaisevat samoille satelliiteille ja päiville: radan suuntainen, sivu- ja säteis-RMS kukin 1.5x sisällä (mitattu { "0.804" } - { "1.087" }), SISR

seg-0c26ec09bf16 = SISRE on viestin esitysvirhe sitä tosi rataa vastaan, johon se sovitettiin; radanmääritys- ja ratojen ennustevirhettä ei mallinneta. (tulos <c1/>)

seg-3762de39de07 = Tosi rata on Kshanan numeerinen integrointi (zonaalinen tai EGM2008-painovoima, staattinen eksponentiaalinen ilmanvastus), ei todellisen satelliitin tarkka rata; ei kolmatta kappaletta, auringon säteilypainetta eikä vuorovesiä. (tulos <c1/>)

seg-4486dd350b57 = Binäärimuoto on Kshanan oma dokumentoitu koodaus, joka on mallinnettu julkaistujen viestikomponenttien mukaan; se ei ole Celesten tai minkään muun järjestelmän bittiasettelu (mikään ei ole julkinen). (tulos <c1/>)

seg-2a5c1bce8320 = RINEX-tyylinen lohko on dokumentoitu Kshana-laajennus; RINEX { "4.02" } ei määrittele LEO-navigointitietueita. (tulos <c1/>)

seg-642d8f4d60e7 = NeQuick-G-kertoimet kuljetetaan mukana ja tehollinen ionisaatiotaso lasketaan, mutta NeQuickin elektronitiheyden integrointia, joka muuttaa sen viiveeksi, ei ole toteutettu; Klobucharin viive on, skaalattuna kantoaaltoon kertoimella 1/f^{ "2" } ilman korjausta ionosfäärin sisällä lentävälle satelliitille. (tulos <c1/>)

seg-8ba04a3147bd = Liu ym. { "2025" } 22-parametrisen mallin termit seuraavat artikkelin käyttäjäalgoritmia (Eq. 1-7) ja sovitusstrategiaa (Section { "2.3" }); sen SISRE-korkeus-luvuissa käytettiin todellisia tarkkoja ratoja, joten tämä Kshanan integroimalla radalla tehty vertailu on MODELLED, ei VALIDATED (todellisella radalla tehty vertailu on tests/leo_navmsg_fit_real_orbit_oracle.rs). (tulos <c1/>)

seg-b3585c7feb4e = MIXED — VALIDATED rakennuspalikat, MODELLED tulokset. SISRE-painot toistavat julkaistun MEO/GEO-taulukon (Montenbruck ym. { "2018" }), Galileo ICD -käyttäjäalgoritmi toistaa RTKLIB:n todellisilla Galileon lähetysefemerideillä, ja CRC-24Q toistaa luettelon tarkistusarvonsa ja RTCM { "1005" } -esimerkkikehyksen. Jokainen sovitus-, SISRE-, jatkuvuus- ja kvantisointiluku on MODELLED: viestin esitysvirhe verrattuna (tulos <c1/>)

seg-d6e412aab1b4 = MODELLED: jokainen sovitus- ja SISRE-luku on esitysvirhe Kshanan integroimaa tosi rataa vastaan (ei radanmääritys- tai ennustevirhettä); Liu ym. (tyyppiluettelo (<c1/>))

seg-c5478f572d21 = Perhesivu: <a1>Matalan Maan kiertoradan navigointi</a1>

seg-d9257241d523 = Aihesivu: <a1>LEO-NAVMSG.md</a1>

seg-b0dcad22aed6 = <s1>Edellinen</s1>launch-window

seg-2984c4c69850 = <s1>Seuraava</s1>leo-pass
