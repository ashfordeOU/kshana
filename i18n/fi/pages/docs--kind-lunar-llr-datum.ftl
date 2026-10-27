# docs--kind-lunar-llr-datum: translations (fi)

seg-3068552e4ab4 = VALIDATED: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän lajin.

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-3bc1761c76ab = { "3" } mukana toimitettua skenaariota käyttää tätä tyyppiä; muut ovat kohdassa <a1><c1/></a1>.

seg-8f8871ac8a0f = Aihesivu: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-fd34d760edb1 = <b>VALIDATED</b> Seitsenparametrisen Helmert-datumin kovarianssi, jossa sen kaksi simuloitua syötettä on korvattu mitatuilla: aikataulu on { "337" } arkistoidun ILRS Kuun laseretäisyysmittauksen normaalipisteen maalähetysepookit (2015-04-08 – 2015-06-27, Grasse MeO { "7" } Testit: <a1>lunar_llr_real_data.rs</a1>.

seg-49baab4910f3 = ppb

seg-a7d59ba6e225 = rad

seg-8db575fc6d82 = Lähde: <c1/>

seg-5329c6c75887 = <c1/> (skenaariotyyppi)

seg-25455a33523c = Seitsemän parametrin Helmert-kuukoordinaatiston datum, jonka pohjana on TODELLINEN, ARKISTOITU havaintokampanja simuloidun sijaan. Kun lunar-frame-campaign poisti syötetyn muunnoksen mutta ilmoitti silti asemaverkkonsa, aikataulunsa ja havaintokohtaisen sigmansa ILLUSTRATIVE-syötteinä, tämä tyyppi ottaa kaikki kolme mittauksista: epookit ovat arkistoitujen ILRS Consolidated Laser Ranging Data -normaalipisteiden maalähetysajat, havainnot ovat kuun viiteen retroreflektoriryhmään todella ammutut laseretäisyydet, ja jokainen havaintopaino on kyseisen normaalipisteen oma arkistoitu tarkkuus bin_rms/sqrt(n_raw), luettuna tiedostosta. Asemien koordinaatit tulevat IERS ITRF2020 SLR -ratkaisusta (ajettu epookkiin niiden julkaistuilla nopeuksilla) ja reflektorien koordinaatit JPL DE430:n taulukosta { "7" } keskimääräisessä Maa/keskimääräisessä pyörimiskoordinaatistossa, jonka IAU { "2015" } WGCCRE -malli toteuttaa. Etäisyyden osittaisderivaatat kertyvät yhteiseen reflektorikoordinaattien Fisherin informaatiomatriisiin ja etenevät saman Helmert-rakenteen läpi datumin kovarianssiin, jonka crate::fim::crlb diagnosoi. Aste, vaje, ehtoluku, spektri, havaitsemattomat suunnat seitsemän parametrin kannassa, heikoin suunta täydellä asteella ja kunkin parametrin osuus siitä tuotetaan jokaisella ajolla, ja rajoittamaton parametri julkaistaan arvona NULL ja tilatiedolla. Ryhmien välinen korrelaatio on MEASURED täsmälleen nolla eikä oletettu, koska laseretäisyys koskettaa yhtä ryhmää. Tietue, jota luettelot eivät pysty sijoittamaan — asema, jolla ei ole julkaistua ITRF-paikkaa — OHITETAAN JA LASKETAAN, eikä sille koskaan anneta korvaavaa koordinaattia. RAPORTTI ON SE, MIKÄ LINKEISTÄ ON MEASURED JA MIKÄ MODELLED, EI ALAVIITE: Kuun keskipisteen efemeridi ja IAU:n kappaleen asento ovat edelleen mallinnettuja, ja niiden yhteinen suuruus tuotetaan havaittu-miinus-laskettu yksisuuntaisena etäisyysresiduaalina kaikkien käytettyjen pisteiden yli; troposfääri, kiinteän kappaleen vuorovedet, aseman eksentrisyys, napaliike, UT1-UTC, relativistinen viive ja asemien kellot puuttuvat ja sisältyvät tähän residuaaliin. Koska efemeridivirhe vaikuttaa kovarianssiin vain kunkin näkölinjan suunnan kautta, jokainen ajo ratkaisee koko datumin myös uudelleen kaikki osittaisderivaatat kallistettuina arvolla sensitivity_tilt_deg (etumerkki vaihtelee) ja tuottaa suhdeluvun, joten kovarianssin epäherkkyys mallinnetulle efemeridille on luku eikä väite. Simuloidun kampanjan omat luvut AJETAAN ja tulostetaan mitattujen viereen, eikä niitä kopioida. MODELLED: seitsemän parametrin luvut ovat Cramer–Rao-raja pienennetylle parametrijoukolle todellisella aikataululla — ei ratkaistu datum, ei LLR-analyysi eikä geodeettinen tuote. Sidottu todellisen datan osajoukko toimitetaan repon mukana mutta ei julkaistun crate-kirjaston mukana; osoita data_dir sen kopioon.

seg-f4359803d67a = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: lunar-llr-datum: { "337" } arkistoitua normaalipistettä ({ "349" } jäsennetty) { "2" } asemalta { "5" } retroreflektoriryhmään { "80.9" } vrk:n aikana; normaalipisteen mitattu mediaanitarkkuus { "5.13" } mm yksisuuntaisena; reflektorien informaatioaste 15/15; Helmert-aste 7/7 ehtoluku { "2.399e4" }; datumin translaation sigma { "1.851746e-2" } m; havaittu-miinus-laskettu yksisuuntaisen residuaalin RMS { "156493.9" } m (mallinnetut linkit, pääasiassa analyyttinen kuun efemeridi)

seg-7eda56c1285a = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

seg-c95b4d285cbd = Esimerkki <c1/> asettaa muun muassa:

seg-37a77f49f048 = ps

seg-b5c1e8681164 = Tuloksen nimike (moottorin oma): Kuukoordinaatiston datum TODELLISESTA havaintokampanjasta. Aikataulu, havaintojen lukumäärä ja jokainen havaintopaino tulevat arkistoiduista ILRS:n kuun laseretäisyysmittauksen normaalipisteistä (mitattu); asemien koordinaatit tulevat IERS ITRF2020:sta ja retroreflektorien koordinaatit JPL DE430:n taulukosta { "7" } (julkaistu

seg-e4da113cbe18 = Moottorin kirjoittama kaavio skenaariolle scenarios/lunar-llr-datum.toml, tyyppi lunar-llr-datum

seg-764e54be97a0 = <b>VALIDATED</b> Seitsemän parametrin Helmert-datumin kovarianssi lunar-llr-datum -tyypille arkistoiduista ILRS:n normaalipisteistä ja niiden mitatuista painoista, ydinpolulla: geosentrinen kuun keskipiste luetaan JPL DE440:stä moottorin oman ydinlukijan avulla (planetary_ker Testit: <a1>validate_llr_datum_kernel_moon.rs</a1>.

seg-cae262db0e46 = <b>VALIDATED</b> Seitsemän parametrin Helmert-datumin kovarianssi, jossa kaksi simuloitua syötettä on korvattu mitatuilla: aikataulu on { "337" } arkisto. Oraakkeli (ExternalDataset): Suljetun muodon identiteetit, riippumaton repon sisäinen reitti ja versiosta { "0.36" } alkaen riippumaton SPICE- ja NumPy-kirjasto-oraakkeli tuoreella mitatulla datalla (alla); julkaistua kuun LLR-datumin kovarianssiparia, jota vasten tarkistaa, ei ole, joten tarkkuutta ei väitetä. Ainoa uusi derivaatta — etäisyyden osittaisderivaatta reflektorin kappalekiinteän paikan suhteen — johdetaan uudelleen keskeisellä differenssillä kaksisuuntaisesta valon kulkuajasta, jonka se

seg-61ac3609406a = Kuukoordinaatiston datum TODELLISESTA havaintokampanjasta. Aikataulu, havaintojen lukumäärä ja jokainen havaintopaino tulevat arkistoiduista ILRS:n kuun laseretäisyysmittauksen normaalipisteistä (mitattu); asemien koordinaatit tulevat IERS ITRF2020:sta ja retroreflektorien koordinaatit JPL DE430:n taulukosta { "7" } (julkaistu). Kuun keskipisteen efemeridi, IAU { "2015" } WGCCRE -kappaleen asento sekä troposfäärin, vuorovesien, aseman eksentrisyyden puuttuminen (tulos <c1/>)

seg-97610a2cca73 = Ryhmien välinen korrelaatio on MEASURED täsmälleen nolla eikä oletettu, koska laseretäisyys koskettaa yhtä ryhmää. (tyyppiluettelo (<c1/>))

seg-64b1c08eeb11 = RAPORTTI ON SE, MIKÄ LINKEISTÄ ON MEASURED JA MIKÄ MODELLED, EI ALAVIITE: Kuun keskipisteen efemeridi ja IAU:n kappaleen asento ovat edelleen mallinnettuja, ja niiden yhteinen suuruus tuotetaan havaittu-miinus-laskettu yksisuuntaisena etäisyysresiduaalina kaikkien käytettyjen pisteiden yli; troposfääri, kiinteän kappaleen vuorovedet, aseman eksentrisyys, napaliike, UT1-UTC, relativistinen viive ja asemien kellot puuttuvat ja sisältyvät tähän residuaaliin. (tyyppiluettelo (<c1/>))

seg-d38710f3ce4a = MODELLED: seitsemän parametrin luvut ovat Cramer–Rao-raja pienennetylle parametrijoukolle todellisella aikataululla — ei ratkaistu datum, ei LLR-analyysi eikä geodeettinen tuote. (tyyppiluettelo (<c1/>))

seg-a19e2b1fcaf1 = epookit ovat arkistoitujen ILRS Consolidated Laser Ranging Data -normaalipisteiden maalähetysajat; * havainnot ovat kuun viiteen retroreflektoriryhmään todella ammutut laseretäisyydet; * jokaisen havainnon paino on kyseisen normaalipisteen OMA arkistoitu tarkkuus, bin_rms/sqrt(n_raw), luettuna tiedostosta eikä oletettuna. (skenaariotiedoston kommentti, rivit { "7" } - { "12" })

seg-5ed6b83c01da = RAPORTTI ON SE, MIKÄ LINKEISTÄ ON MEASURED JA MIKÄ MODELLED, EI ALAVIITE. Kuun keskipisteen efemeridi ja IAU:n kappaleen asento pysyvät mallinnettuina, ja niiden yhteinen suuruus tuotetaan havaittu-miinus-laskettu yksisuuntaisena etäisyysresiduaalina kaikkien käytettyjen pisteiden yli; troposfääri, kiinteän kappaleen vuorovedet, aseman eksentrisyys, napaliike, UT1-UTC, relativistinen viive ja asemien kellot puuttuvat ja sijaitsevat tämän residuaalin sisällä. Koska (skenaariotiedoston kommentti, rivit { "18" } - { "26" })

seg-7e7ff3ce4971 = Ryhmien välinen korrelaatio on MEASURED täsmälleen nolla eikä oletettu, koska laseretäisyys koskettaa yhtä ryhmää. Tietue, jota luettelot eivät pysty sijoittamaan — asema, jolla ei ole julkaistua ITRF-paikkaa — OHITETAAN JA LASKETAAN, eikä sille koskaan anneta korvaavaa koordinaattia. Simuloidun kampanjan omat luvut AJETAAN ja tulostetaan mitattujen viereen. (skenaariotiedoston kommentti, rivit { "28" } - { "31" })

seg-8bfe258bedf5 = MODELLED: seitsemän parametrin luvut ovat Cramer–Rao-raja pienennetylle parametrijoukolle todellisella aikataululla. Ei ratkaistu datum, ei LLR-analyysi, ei geodeettinen tuote. (skenaariotiedoston kommentti, rivit { "33" } - { "34" })

seg-598a7d6ba1e7 = <s1>Edellinen</s1>lunar-joint-od-clock

seg-54b1c9200aae = <s1>Seuraava</s1>lunar-station-coverage
