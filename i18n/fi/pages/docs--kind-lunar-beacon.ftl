# docs--kind-lunar-beacon: translations (fi)

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-3c4e3d725bb6 = Lähde: <c1/>

seg-5e402fc935cb = <c1/> (skenaariotyyppi)

seg-142ad48fe422 = Kuun kiertoradalla toimivan navigointipalvelun pintamajakkatäydennys ajettavana ennen/jälkeen-taulukkona. Etelänapaisen alueen käyttäjä näkee harvan kiertoratajoukon kapealla taivaan alueella, joten etäisyysmittausgeometria on huonosti ehdollistettu; muutama KARTOITETTU PINTAMAJAKKA tuottaa matalan korkeuskulman, laajan atsimuutin näköyhteysrivit, joita pelkästään yläpuolella oleva joukko ei tuota, ja vaakasuuntainen tarkkuuden heikkenemiskerroin romahtaa. Skenaario raportoi kolme konfiguraatiota yhdellä epookilla — pelkät satelliitit, satelliitit plus näkyvät majakat ja suurempi tähdistö vaihtoehtoisena reittinä samaan geometriaan — kullakin näkyvien lähteiden lukumäärä, täysi DOP ja saavutettu 1-sigma-tarkkuus METREINÄ, joka saadaan kertomalla majakkakohtaisella käyttäjäekvivalenttisella etäisyysvirheellä, joka on koottu kellosynkronoinnin, monitie-etenemisen ja mittaustermien neliösumman neliöjuurena. Majakan näkyvyys on ilmattoman Kuun kahden korkeuden geometrinen horisontti (ei ilmakehää, joten raja on tarkka), ja DOP-kokoaminen on sama ydin, joka on tarkistettu ristiin gnss_lib_py:tä vastaan tiedostossa tests/dop_reference.rs. MIKSI TÄMÄ TYYPPI ON OLEMASSA: sen takana oleva moduuli on ollut moottorissa ja tarkistettu riippumatonta DOP-polkua vastaan L08/L09:stä lähtien, mutta siihen ei päässyt käsiksi ajosta — ei tyyppiä, ei lähetyshaaraa, ei mukana toimitettua tiedostoa. README mainosti kyvykkyyttä ja varmennusmatriisissa EI ollut siitä lainkaan riviä, joten se oli samanaikaisesti väitetty proosassa ja väittämättä kirjanpidossa (ledger) samalla kun se oli moottorissa tavoittamaton. Oletukset ovat geometria, jolla on jo sitoutettu golden-vertailu (käyttäjä -80 deg:ssa { "2" } m antennilla, kolme majakkaa kohdissa -80/0, -79/+{ "60" } ja -79/-60 korkeudella { "2" } km, kuuden satelliitin havainnollistava LCNS-tilannekuva hetkellä t={ "0" }, { "5" } deg:n maski), joten paljas ajo toistaa taulukon, jonka oraakkeli jo kattaa, eikä keksi uusia lukuja. MODELLED: tähdistön suunnittelu, majakoiden sijoittelu ja jokainen virhebudjetin suuruus ovat havainnollistavia syötteitä, eivät käytössä oleva mittaus tai mitattu linkki; vain DOP-aritmetiikka, horisontin suljettu muoto ja relaatio sigma = DOP x sigma_URE on ankkuroitu ulkoisesti. Ei ole palvelun suorituskykysitoumus.

seg-22ea11fcf367 = Yksi tiedoston <c1/> ajo tiivistyy seuraavasti: Kuun pintamajakkatäydennys — maski { "5.0" } deg, epookki +{ "0" } s, majakkakohtainen sigma_URE { "1.1576" } m { "6" } satelliittia, ei majakoita sats { "5" } beacons { "0" } GDOP { "11.6627" } PDOP { "9.6941" } HDOP { "3.4868" } VDOP { "9.0454" } TDOP { "6.4840" } saavutettu 1-sigma: 3D { "11.222" } m H { "4.036" } m V { "10.471" } m { "6" } satelliittia + { "1" } näkyvää majakkaa sats { "5" } beacons { "1" } GDOP { "4.9979" } PDOP { "4.1160" } HDOP { "1.9721" } VDOP { "3.6128" } TDOP { "2.8350" } saavutettu 1-sigma: 3D { "4.765" } m H { "2.283" } m V { "4.182" } m { "24" } satelliittia, ei majakoita sats { "19" } beacons { "0" } GDOP { "2.8929" } PDOP { "2.4226" } HDOP { "1.0199" } VDOP { "2.1974" } TDOP { "1.5811" } saavutettu 1-sigma: 3D { "2.804" } m H { "1.181" } m V { "2.544" } m majakat parantavat PDOP:ia kertoimella 2.355x; sen sijaan suurempi tähdistö, 4.002x MODELLED: tähdistö, majakoiden sijoittelu ja virhebudjetti ovat havainnollistavia syötteitä. Taustalla oleva DOP-ydin on gnss_lib_py:llä validoitu ja majakan horisontti on L01:n suljettu muoto.

seg-25522022cf9a = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-acfef3f325e4 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-a53e353706f6 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/lunar-beacon.toml, tyyppi lunar-beacon

seg-89e2f6bb2540 = <b>MODELLED</b> Majakkatäydennetty tarkkuuden heikkenemiskerroin Kuun pinnan käyttäjälle: näkyvien satelliittien näköyhteysrivit ja näkyvien pintamajakoiden etäisyysmittausrivit yhdistetään yhdeksi suunnittelumatriisiksi ja arvioidaan jaetun DOP-ytimen kautta, ja t Testit: <a1>validate_p2_beacon_before_after_table.rs</a1>.

seg-654a3554b1e3 = <b>MODELLED</b> Majakkatäydennetty tarkkuuden heikkenemiskerroin Kuun pinnan käyttäjälle: näkyvien satelliittien näköyhteysrivit ja näkyvien pintamajakoiden etäisyysmittausrivit yhdistetään. Oraakkeli (ReferenceImpl): DOP-aritmetiikka on crate::orbit::dop-ydin, validoitu erikseen ulkoisesti gnss_lib_py:tä vastaan tiedostossa tests/dop_reference.rs; tämä rivi ei lainaa sen rivin tilaa uudelleen. Majakan näkyvyyshorisontti on L01:n suljettu muoto, ja sigma = DOP x sigma_URE on GNSS:n vakiorelaatio (Kaplan ja Hegarty, Understanding GPS/GNSS, section { "7" }). Tällä rivillä täydennys itse tarkistetaan riippumatonta

seg-4d1fc06e907b = MODELLED: tähdistön suunnittelu, majakoiden sijoittelu ja jokainen virhebudjetin suuruus ovat havainnollistavia syötteitä, eivät käytössä oleva mittaus tai mitattu linkki; vain DOP-aritmetiikka, horisontin suljettu muoto ja relaatio sigma = DOP x sigma_URE on ankkuroitu ulkoisesti. (tyyppiluettelo (<c1/>))

seg-aaafed663400 = MITÄ ON ANKKUROITU JA MITÄ EI Ankkuroitu: DOP-kokoaminen on ydin, joka on tarkistettu ristiin gnss_lib_py:tä vastaan tiedostossa tests/dop_reference.rs; majakan näkyvyys on ilmattoman Kuun kahden korkeuden geometrinen horisontti suljetussa muodossa (ei ilmakehää, joten ei taittumalaajennusta ja raja on tarkka); ja sigma = DOP x sigma_URE on vakiorelaatio (Kaplan & Hegarty, Understanding GPS/GNSS, section { "7" }). EI ankkuroitu — MODELL (skenaariotiedoston kommentti, rivit { "40" }–{ "49" })

seg-2516c4208769 = Kuun pintamajakoiden DOP-täydennys on MODELLED, ei validoitu: tarkistettu tämän saman koodikannan erillistä toteutusta vastaan: riippumaton testattavasta yksiköstä mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-ebb9724de60a = <s1>Edellinen</s1>lunar-attack-surface

seg-ca9b68783354 = <s1>Seuraava</s1>lunar-differential-pnt

seg-b81e98467952 = <s1>Seuraava</s1>lunar-descent
