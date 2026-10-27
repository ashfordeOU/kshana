# docs--kind-constellation-design: translations (fi)

seg-e27476e37522 = Maa

seg-37d29d8303fe = km

seg-11e8c29ecb45 = Moottorin v{ $version } skenaariolaji, perhe <a1>Satelliittitähdistöt, kattavuus ja geometria</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-a4f1e7d2041e = Perhesivu: <a1>Satelliittitähdistöt, kattavuus ja geometria</a1>

seg-670191cf797f = Aihesivu: <a1>SOLAR-SYSTEM.md</a1>

seg-cb91473bfdda = Aihesivu: <a1>LEO-PNT.md</a1>

seg-f305ed6dc164 = Lähde: <c1/>

seg-f708c26a5139 = <c1/> (skenaariotyyppi)

seg-de173c9f4034 = Tähdistösuunnittelu mittakaavassa: Walker DELTA- ja Walker STAR -kuviot i: T/P/F-merkintätavassa (solmut jakautuneina { "360" } tai { "180" } asteelle, ratatason sisäinen väli { "360" }<em>P/T, ratatasojen välinen vaihesiirtymä { "360" }</em>F/T), eksplisiittiset elementtilistat ja monikuorisuunnitelmat, useita tähdistöjä yhdessä ajossa, Maan, Kuun, Marsin tai minkä tahansa muun planeetan, Pluton tai suuren kuun ympärillä body-moduulin vakioilla (samoilla, joita solar-system- ja body-pnt-tyypit käyttävät). ESIASETUKSET julkaistuista nimellisistä elementeistä: gps-baseline ja gps-expandable ({ "24" } paikkaa ja kuusi eteen/taakse laajennettavaa paria GPS Standard Positioning Service Performance Standardin 5. painoksesta { "2020" }, taulukot 3.2-1–3.2-3), galileo (Walker 24/3/1 korkeudella { "29 599.801" } km ja { "56" } astetta, Galileo Open Service Service Definition Document issue { "1.1" } taulukot { "1" } ja { "23" }), beidou ja beidou-meo (Walker 24/3/1 korkeudella { "21 528" } km ja { "55" } astetta sekä kolme geostationaarista satelliittia pituuspiireillä { "80" }, { "110.5" } ja { "140" } astetta itään ja kolme kallistettua geosynkronista satelliittia { "55" } asteen kaltevuudella, BeiDou Open Service Performance Standard { "3.0" } kohta { "4.1" }; MEO-vaihe ja { "118" } asteen itäisen pituuden kallistetun geosynkronisen radan leikkaus on mallinnettu, koska standardi ei esitä niitä) ja glonass (24/3/1 korkeudella { "19 100" } km ja { "64.8" } astetta GLONASS Interface Control Document edition { "5.1" } kohdan { "5.2" } paikkakaavasta). PEITTO JA TARKKUUDEN HEIKKENEMISKERROIN: leveys-/pituusasteruudukossa ja otetussa aikaikkunassa korkeuskulmamaskilla näkyvien satelliittien lukumäärä, GDOP, PDOP, HDOP ja VDOP ruutua kohti, saatavuus (paikannus, jonka PDOP on enintään kynnys, oletuksena { "6" }) ruutua kohti, maailmanlaajuisesti (pinta-alapainotettuna) ja huonoimmassa paikassa, yhdellä vastaanottimen kellolla tähdistöä kohti, ellei clock = "common". Se skaalautuu tuhansiin satelliitteihin: näkyvyys on pistetulo kunkin satelliitin kattavuuden puolikulmaa vastaan, ja satelliitit jaetaan kullakin epookilla kaistoihin satelliitin alapisteen leveysasteen mukaan, jotta ruudukon rivi testaa vain ne, jotka voivat olla näkyvissä; raportti laskee säästetyt paritestit. JSON sisältää ruudukkokartat ja harvennetut satelliittikohtaiset maanpintajäljet. VALIDATED: Walker-generaattori Galileo OS SDD:n taulukkoa { "23" } ja GLONASS ICD:n paikkakaavaa vastaan, GPS-esiasetus SPS PS:n taulukon 3.2-1 julkaistua päiväntasaajan ylityssaraketta vastaan ja GPS-lähtötason globaali HDOP-jakauma SPS PS:n liitettä B vastaan (mediaani { "0.94" }, { "95" }% { "1.25" }, keskiarvo { "0.96" }, toleranssi { "0.03" }). MODELLED: kahden kappaleen radat valinnaisella sekulaarisella J2:lla, pallomainen kappale, vain geometrinen näkyvyys (ei signaalitehoa, terveystilaa eikä maastoa) ja eri järjestelmien välinen suhteellinen vaihe, joka ei ole minkään todellisen päivämäärän tilannekuva.

seg-21fbd84bfba1 = Yksi ajo tiedostolla <c1/> tiivistyy seuraavasti: constellation-design: { "5000" } satellites (LEO-PNT) around the Earth; availability { "99.22" }% (PDOP <= { "3" } at { "20" } deg mask), worst site { "0.00" }%, median PDOP { "1.11" }, mean { "39.4" } in view; { "648" } grid points x { "12" } epochs (MODELLED)

seg-af572ce1fd89 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-fd393ddc7d5d = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-d72b4c5393e0 = earth

seg-d9b3c54bd272 = common

seg-6411970ba342 = delta

seg-3bc1761c76ab = { "3" } mukana toimitettua skenaariota käyttää tätä tyyppiä; muut ovat kohdassa <a1><c1/></a1>.

seg-0a6f7f6c66c4 = km^3/s^{ "2" }

seg-ab9b72b9ffce = Tulosmerkintä (moottorin oma): MODELLED - kahden kappaleen Kepler-radat (valinnainen sekulaarinen J2) pallomaisen kappaleen ympärillä, geometrinen näkyvyys korkeuskulmamaskin yläpuolella, kaikki näkyvissä olevat huomioiva tarkkuuden heikkenemiskerroin yhdellä vastaanottimen kellolla tähdistöä kohti, ellei clock = "common"; ei signaalitehoa, terveystilaa eikä maastoa. Walker-geometria ja julkai

seg-899e728ad9bd = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/leo-pnt-mega-shell.toml, skenaariotyyppi constellation-design

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän tyypin.

seg-602493ac6987 = <b>VALIDATED</b> Tyypin <c1/> generaattorit: Walker delta- ja star-kuviot T/P/F-merkintätavassa (solmuväli 360/P tai 180/P, ratatason sisäinen väli { "360" }·P/T, ratatasojen välinen vaihesiirtymä { "360" }·F/T) sekä GPS-lähtötason ja laajennettavan 24 paikan, Gal

seg-bdc81f37ad16 = <b>VALIDATED</b> Tyypin <c1/> kattavuusmoottori GPS-lähtötason 24 paikan esiasetuksella GPS Standard Positioning Service Performance Standardin (SPS PS) liitteen B ehdoilla (yksi tähtivuorokausi, { "287" } viiden minuutin askelta, { "4" } x { "4" } asteen globaali ruudukko w

seg-1272200ad4f2 = <b>MODELLED</b> Tyyppi <c1/> kahden kiinnitetyn tapauksen ulkopuolella: eksplisiittiset ja monikuorisuunnitelmat, useita tähdistöjä ajoa kohti yhdellä vastaanottimen kellolla tähdistöä kohti, Maa, Kuu ja Mars kappalevakioista, BeiDou-esiasetus Testit: <a1>coverage_dop_gnss_lib_py_oracle.rs</a1>.

seg-0c64f22330d2 = <b>VALIDATED</b> Tyypin <c1/> generaattorit: Walker delta- ja star-kuviot T/P/F-merkintätavassa (solmuväli 360/P tai 180/P, ratatason sisäinen väli { "360" }·P/T, int. Oraakkeli (ExternalDataset): Julkaistut virastojen asiakirjat: Galileo Open Service Service Definition Document issue { "1.1" } (European GNSS Service Centre) taulukot { "1" } ja { "23" }, vertailutähdistö ajankohtana 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document edition { "5.1" } ({ "2008" }) kohta { "5.2" }, solmun pituuden ja leveysargumentin paikkakaava; GPS Standard Positioning Service Performance Standard 5th edition (huhtikuu { "2020" }) taulukot 3.2-1, 3.2-2 ja

seg-87c4e19dc780 = <b>VALIDATED</b> Tyypin <c1/> kattavuusmoottori GPS-lähtötason 24 paikan esiasetuksella GPS Standard Positioning Service Performance Standardin (SPS PS) liitteen . Oraakkeli (ExternalDataset): GPS SPS PS 5th edition (huhtikuu { "2020" }) liitteen B kohdat B.3.2.2 ja B.3.2.3, täysin miehitetyn lähtötason 24 paikan tähdistön julkaistu globaali keskimääräinen HDOP-jakauma (mediaani { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, keskiarvo { "0.96" }), taulukko 3.8-1 (PDOP-saatavuus) ja taulukko B.3-1 (heikentyneen tähdistön ensemble-PDOP, käytetty vain ylärajana) sekä käsin johdettu suljetun muodon ratkaisu yhdelle epookille. VDOP ja PD

seg-04289f7252cd = <b>MODELLED</b> Tyyppi <c1/> kahden kiinnitetyn tapauksen ulkopuolella: eksplisiittiset ja monikuorisuunnitelmat, useita tähdistöjä ajoa kohti yhdellä vastaanottimen kellolla tähdistöä kohti. Oraakkeli (InternalConsistency): Sisäinen johdonmukaisuus: raa'an voiman korkeuskulmaskannaus, käsin lasketut ja orbit::dop-redusoinnit sekä suljetun muodon Walker- ja geosynkroninen geometria. Kahden kappaleen radat valinnaisella sekulaarisella J2:lla, pallomainen kappale paikallisella pystysuunnalla säteen suuntaisena, vain geometrinen näkyvyys (ei signaalitehoa, satelliitin terveystilaa, maastoa eikä kolmannen kappaleen häiriötä) ja järjestelmien välinen suhteellinen vaihe otettuna eri re

seg-00fa65d44cbd = MODELLED - kahden kappaleen Kepler-radat (valinnainen sekulaarinen J2) pallomaisen kappaleen ympärillä, geometrinen näkyvyys korkeuskulmamaskin yläpuolella, kaikki näkyvissä olevat huomioiva tarkkuuden heikkenemiskerroin yhdellä vastaanottimen kellolla tähdistöä kohti, ellei clock = "common"; ei signaalitehoa, terveystilaa eikä maastoa. Walker-geometria ja julkaistut esiasetukset on tarkistettu Galileo OS SDD:tä, GLONASS ICD:tä ja GPS SPS Performance Standardin paikkataulukoita vastaan, a (tulos <c1/>)

seg-62f0fc16a247 = MODELLED: kahden kappaleen radat valinnaisella sekulaarisella J2:lla, pallomainen kappale, vain geometrinen näkyvyys (ei signaalitehoa, terveystilaa eikä maastoa) ja eri järjestelmien välinen suhteellinen vaihe, joka ei ole minkään todellisen päivämäärän tilannekuva. (tyyppiluettelo (<c1/>))

seg-3ef4276dd40b = Mihin ajo vastaa: näkyvät satelliitit, PDOP/HDOP/VDOP/GDOP { "10" } asteen ruutua kohti sekä se aikaosuus, jolloin PDOP on enintään { "3" } { "20" } asteen maskin yläpuolella kahden tunnin ajalla. Kartan näyttämä heikko kohta ovat napa-alueet: yksikään kuori ei yllä noin { "82" } asteen leveysasteen yläpuolelle, joten navan lähellä oleva käyttäjä näkee kaikki satelliitit taivaan toisella puolella ja pystygeometria heikkenee. MODELLED: havainnollistava suunnitelma, kahden kappaleen radat J2:lla, pallo (skenaariotiedoston kommentti, rivit { "17" }–{ "21" })

seg-c333d3fe22cd = Mielivaltaisten monitähdistösuunnitelmien kattavuus- ja tarkkuuden heikkenemiskerroin -kartat mittakaavassa, minkä tahansa keskuskappaleen ympärillä, on MODELLED, ei validoitu: se on tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vasten — se havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-436504a8b26f = <s1>Edellinen</s1>conflict-resilience

seg-cba188459c80 = <s1>Seuraava</s1>contact-schedule
