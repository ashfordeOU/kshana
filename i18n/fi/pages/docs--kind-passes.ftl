# docs--kind-passes: translations (fi)

seg-debc2f07db78 = true

seg-37d29d8303fe = km

seg-0f4c2ab525ac = <b>MODELLED</b> Alalinkin Es/N0 yhden satelliitin jokaisen ylilennon varrella yhden aseman yllä (EIRP, vapaan tilan vaimennus, kosekanttilain mukainen ilmakehän vaimennus, muut häviöt, G/T, Boltzmannin vakio, symbolinopeus), tehokkain DVB-S2 MODCOD, joka ylittää ETSI EN { "302" } 307-

seg-72fd0321e4af = Aihesivu: <a1>CONTACT-SCHEDULING.md</a1>

seg-4636d450ef60 = <b>MODELLED</b> Yksi ajo ottaa yhteysaikataulun (luettelo aos_s/los_s-ikkunoista, joista kukin pyytää apertuuria navigointiin tai viestintään — sama ikkunasanasto, jonka <c1/> tuottaa, muunnettuna funktiolla <c2/>), apert

seg-11e8c29ecb45 = Moottorin v{ $version } skenaariolaji, perhe <a1>Satelliittitähdistöt, kattavuus ja geometria</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-a4f1e7d2041e = Perhesivu: <a1>Satelliittitähdistöt, kattavuus ja geometria</a1>

seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: tämän tyypin mainitsevat <a1>varmennusmatriisin</a1> rivit.

seg-df90e5910fb4 = hr

seg-2544da673115 = Lähde: <c1/>

seg-0db3f4e2402e = <c1/> (skenaariotyyppi)

seg-a4bdfc291fce = Maa-aseman ylilentoennuste: ympyräradan aika-alueen näkyvyysylilennot (AOS/TCA/LOS, suurin näennäinen korkeuskulma, kesto), SGP4-keskielementteinä ikkunan alussa, korkeuskulmamaskin yläpuolella olevan aseman yli ikkunan aikana, kokonaissaavutusaikoineen. SGP4/SDP4-propagointi IAU 2006/2000A -Maahan kiinnitetyssä koordinaatistossa (valinnainen UT1 - UTC ja napaliike), ITU-R P.834-9 -troposfäärirefraktio ja alalinkin valon kulkuaika (molemmat oletuksena päällä), ylitykset ratkaistuna tarkkuuteen { "1e-7" } s ja kulminaatio kultaisen leikkauksen haulla. Ylilennon geometria on VALIDATED Orekitia { "13.1.8" } vasten merenpinnan tasolla olevilla asemilla; skenaarion rata ja asema ovat havainnollistavia syötteitä.

seg-3050cc7fdc79 = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: passes: { "5" } ylilentoa { "550" } km / { "97.6" }° radalla pisteen ({ "52.2" }°, { "4.4" }°) yli > { "10" }° { "24" } h:n aikana; { "1659" } s kokonaissaavutusaikaa (MODELLED)

seg-699b650604d4 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-9d2941ba37e2 = Esimerkki <c1/> asettaa muun muassa:

seg-6f849331e33c = Tuloksen nimike (moottorin oma): MODELLED — aika-alueen maa-aseman ylilentoennuste; SGP4/SDP4-propagointi, IAU 2006/2000A -Maahan kiinnitetty koordinaatisto (UT1 = UTC, ei napaliikettä ellei Maan orientaatioparametreja anneta), näennäinen korkeuskulma ITU-R P.834-9 -refraktiolla ja valon kulkuajalla päällekytkettynä, ylitykset ja kulminaatio tarkennettuina askelta pienemmäksi

seg-a09be8c586e3 = Moottorin kirjoittama kaavio skenaariolle scenarios/passes.toml, tyyppi passes

seg-db35e4ebd275 = <b>VALIDATED</b> Moottorin propagaattorin aika-alueen näkyvyysylilennot (AOS/TCA/LOS, suurin korkeuskulma, kesto) korkeuskulmamaskin yläpuolella olevan aseman yli, interpoloiduin nousu-/laskuylityksin ja kokonaissaavutusajalla: passes::predict_passes, geometrinen ajoittaja (ei Testit: <a1>ground_station_pass_prediction_reference.rs</a1>.

seg-6799a54acee6 = <b>VALIDATED</b> SGP4-elementtijoukon näkyvyysylilennot (AOS, TCA, LOS, suurin näennäinen korkeuskulma, kesto) WGS-84-aseman yli validoidulla Maan kiertoradan polulla (IAU 2006/2000A, valinnaiset Maan orientaatioparametrit), ITU-R P.834-9 -troposfääri Testit: <a1>pass_predictor_on_path_orekit_oracle.rs</a1>.

seg-42d4290ed718 = <b>VALIDATED</b> Moottorin propagaattorin aika-alueen näkyvyysylilennot (AOS/TCA/LOS, suurin korkeuskulma, kesto) korkeuskulmamaskin yläpuolella olevan aseman yli, interpoloiduin nousu-/lasku. Oraakkeli (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — riippumaton lentodynamiikkakirjasto: ElevationDetector (Brent-juurenhaku) + EventsLogger ITRF-efemeridin yli, asema WGS-84 TopocentricFramena. AOS/LOS/suurin korkeuskulma/ylilentojen lukumäärä/kokonaissaavutusaika täsmäävät identtisellä radalla + asemalla + maskilla + ikkunalla (sidottu testiaineisto; ajuri xval/orekit-passes)

seg-eb79c117f1df = MODELLED — aika-alueen maa-aseman ylilentoennuste; SGP4/SDP4-propagointi, IAU 2006/2000A -Maahan kiinnitetty koordinaatisto (UT1 = UTC, ei napaliikettä ellei Maan orientaatioparametreja anneta), näennäinen korkeuskulma ITU-R P.834-9 -refraktiolla ja valon kulkuajalla päällekytkettynä, ylitykset ja kulminaatio tarkennettuina askelta pienemmäksi (tulos <c1/>)

seg-a7ddc8eeaf1e = <s1>Edellinen</s1>orbit

seg-3079cfb8decc = <s1>Seuraava</s1>pvt
