# docs--kind-ins-trn-coast: translations (fi)

seg-bf51947657c0 = navigointi

seg-3068552e4ab4 = VALIDATED: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän lajin.

seg-c4ed27a559df = Aihesivu: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-3bc1761c76ab = { "3" } mukana toimitettua skenaariota käyttää tätä tyyppiä; muut ovat kohdassa <a1><c1/></a1>.

seg-7b2721b7588d = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Inertia-, fuusio- ja kvanttianturit</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-195347c63a8a = m/s^{ "2" }

seg-f7f12029e0ec = Perhesivu: <a1>Inertia-, fuusio- ja kvanttianturit</a1>

seg-f7305f3a0b5a = Lähde: <c1/>

seg-92b90cb4a839 = <c1/> (skenaariotyyppi)

seg-5b9a6efe6337 = INS/TRN-liukumavirhemalli: paikkavirhe liukuajan funktiona, rakennettu IMU-kertoimista eikä pyyhkäisty oletettuna ajautumisnopeutena. Viisi kasvutekijää — kiihtyvyysmittarin harha, gravitaation kautta vaikuttava gyroharhan kallistuma, nopeuden satunnaiskävely, kulman satunnaiskävely ja asteikkokerroin kuljettua matkaa vastaan — etenee kukin yhdeksäntilaisen paikallistasoisen inertiavirhemallin läpi Schuler-takaisinkytkennällä ilmoitetulla leveysasteella ja korkeudella (lyhyen liukumisen johtavan asteen lait t², t³, t^{ "1.5" }, t^{ "2.5" } ja t¹/t² raportoidaan sen rinnalla) ja yhdistetään ILMOITETULLA säännöllä (oletuksena neliösumman neliöjuuri (rss), tai lineaarinen summa, tai deterministinen summa ja stokastinen rss; kaikki kolme lasketaan jokaisella ajolla, jotta valinta näkyy eikä ole piilossa). Liukuajat, joilla kutsujan antamat paikkakynnykset ({ "10" } m ja { "50" } m oletuksena) saavutetaan, paikannetaan moottorin olemassa olevalla puolitushaulla, ja kullekin annetaan osatekijäkohtainen erittely, joka nimeää hallitsevan lähteen; lisäksi jokaisen yksittäisen osatekijän ylitys käännetään algebrallisesti, jotta nämä kaksi täsmäävät. Maastosuhteisen navigoinnin (TRN) tila rajaa liukumisen jaksollisilla paikkapäivityksillä ja raportoi suurimman päivitysvälin, jolla kukin kynnys pitää; pelkkä paikkapäivitys jättää nopeusvirheen ja kallistuman voimaan päivityksen yli, joten se ei aina rajaa liukumista millään päivitystaajuudella, ja raportti sanoo tämän eikä palauta nollaa. MODELLED: IMU-luokan kertoimet ovat edustavia kaistaarvoja, eivät datalehti, ja maastopäivityksen jäännös on syöte. Saavuttamaton kynnys raportoidaan arvona null ja tilatiedolla, ei koskaan nollana. Ei ole sertifioitu inertianavigoinnin suorituskykytuote.

seg-bbd497aa3ba6 = Yksi tiedoston <c1/> ajo tiivistyy seuraavasti: ins-trn-coast | navigointi-IMU, { "250" } m/s, yhdistäminen rss | { "10" } m kohdassa { "251.0" } s (accel_bias) | { "50" } m kohdassa { "608.8" } s (accel_bias) | TRN pelkkä paikka, huippu { "44.7" } m ajalla { "1200" } s

seg-e0555ca683b1 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-95887c4551c7 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-4db5a594afc1 = rss

seg-5868f641c089 = ug

seg-1918189ac2bf = ppm

seg-7eba4c5ee1e4 = Tuloksen nimike (moottorin oma): MODELLED INS/TRN-liukumavirhebudjetti. Kukin osatekijä etenee yhdeksäntilaisen paikallistasoisen inertiavirhemallin läpi Schuler-takaisinkytkennällä (vaaka-alusta pohjoiseen suunnattuna ilmoitetulla paikalla, vapaa inertiaratkaisu mukaan lukien epästabiili pystykanava); sen lyhyen liukumisen johtavan asteen lait (harha t^{ "2" }, gyro

seg-134a4c91da3a = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/ins-trn-coast.toml, tyyppi ins-trn-coast

seg-7bb77ec86a0a = <b>VALIDATED</b> Paikkavirhe liukuajan funktiona -budjetti, rakennettu IMU-kertoimista, kukin virhelähde (kiihtyvyysmittarin harha, gyroharha, nopeuden satunnaiskävely, kulman satunnaiskävely, asteikkokerroin matkalennolla ja jatkuvan ominaisvoiman alaisena) kulkeutettuna läpi

seg-d69247df315f = <b>VALIDATED</b> Paikkavirhe liukuajan funktiona -budjetti, rakennettu IMU-kertoimista, kukin virhelähde (kiihtyvyysmittarin harha, gyroharha, nopeuden satunnaiskävely, kulman satunnaiskävely, . Oraakkeli (ExternalDataset): NaveGo v1.4 (commit 24d9488, LGPL-3.0), ajettuna erillisenä ohjelmana GNU Octave { "8.4.0" } -ympäristössä: vapaan inertiaratkaisun liukumisajot samalla IMU-virheprofiililla, yhdellä korjatulla numeerisella kuolleella kaistalla sen kvaternioipäivityksessä (qua_update.m: suojaehto, joka koski alle { "1e-8" } rad/s:n kulmanopeutta, korvattu ehdolla wnorm == { "0" }, sovellettuna ajonaikaiseen kopioon ja vahvistettuna täsmääväksi kerran; suojaehdon ollessa paikallaan hitaasti ajautuva alustan asenne jäätyi ja katkaisi

seg-498cb2f96fa7 = MODELLED INS/TRN-liukumavirhebudjetti. Kukin osatekijä etenee yhdeksäntilaisen paikallistasoisen inertiavirhemallin läpi Schuler-takaisinkytkennällä (vaaka-alusta pohjoiseen suunnattuna ilmoitetulla paikalla, vapaa inertiaratkaisu mukaan lukien epästabiili pystykanava); sen lyhyen liukumisen johtavan asteen lait (harha t^{ "2" }, gyroharhan kallistuma t^{ "3" }, nopeuden satunnaiskävely t^{ "1.5" }, kulman satunnaiskävely t^{ "2.5" }, asteikkokerroin x kuljettu matka) tarkistetaan ristiin (tulos <c1/>)

seg-63c221a546f7 = INS/TRN-liukumavirhemalli: paikkavirhe liukuajan funktiona, rakennettu IMU-kertoimista eikä pyyhkäisty oletettuna ajautumisnopeutena. (tyyppiluettelo (<c1/>))

seg-164504645f4a = MODELLED: IMU-luokan kertoimet ovat edustavia kaistaarvoja, eivät datalehti, ja maastopäivityksen jäännös on syöte. (tyyppiluettelo (<c1/>))

seg-ee0281a1f401 = Kysymys, johon tämä vastaa: kun GNSS-tutkimus (tai aukon käyttösuhteella ohjattu tutkimus) sanoo ”oleta paikanlaskennan ajautuma { "0.001" }–{ "0.050" } m/s”, mistä tuo luku tulee? Se tulee IMU:sta, ja tämä skenaario laskee sen eikä pyyhkäise sitä. Viisi kasvutermiä — kiihtyvyysmittarin harha (t^{ "2" }), gravitaation kautta vaikuttava gyroharhan kallistuma (t^{ "3" }), nopeuden satunnaiskävely (t^{ "1.5" }), kulman satunnaiskävely (t^{ "2.5" }) ja asteikkokerroin kerrottuna kuljetulla matkalla (skenaariotiedoston kommentti, rivit { "4" }–{ "11" })

seg-32d4adcfe249 = <s1>Edellinen</s1>inertial

seg-47366ab55be3 = <s1>Seuraava</s1>integrity
