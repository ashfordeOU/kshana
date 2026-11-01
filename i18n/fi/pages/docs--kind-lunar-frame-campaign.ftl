# docs--kind-lunar-frame-campaign: translations (fi)

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-3319b18ac61f = ja { "1" } muu matriisissa.

seg-dd57b833cb20 = Lähde: <c1/>

seg-120769aba2cc = <c1/> (skenaariotyyppi)

seg-55679aff66db = Seitsenparametrinen Helmertin (similariteetti)koordinaatiston datum, jota ohjaa SIMULOITU HAVAINTOKAMPANJA eikä lisätty muunnos. Maa-asemien verkko havainnoi Kuun pinnan majakoiden luetteloa nimenomaisen aikataulun mukaan; Kuun VLBI-viiveen osittaisderivaatat kertyvät tuon aikataulun yli majakkakoordinaattien Fisherin informaatiomatriisiksi täsmälleen kuten lunar-vlbi-fim tekee; ja tuo informaatio välitetään Helmert-suunnittelumatriisin A = [I3 | [p]_x | p] kautta luettelopisteissä datumin kovarianssiksi H = A^T M_b A, jonka diagnosoi crate::fim::crlb. MITÄÄN muunnosta EI lisätä eikä mitään palauteta istutetusta vastauksesta, joten raportoitu datumin tarkkuus johtuu havaintoohjelmasta: viiveen sigman puolittaminen puolittaa sen täsmälleen, ja kaaren pidentäminen parantaa sitä, koska libraatio, jonka raportti MITTAA (sub_earth_direction_sweep_deg), erottaa näköyhteyden suuntaisen majakkakoordinaatin taivaan tason suuntaisista. Aste, datumin vajaus, ehtoluku, koko spektri, havaitsemattomat suunnat SEITSENPARAMETRISESSA KANNASSA, heikoin suunta täydelläkin asteella ja kunkin parametrin osuus siitä raportoidaan jokaisella ajolla; parametri, jota kampanja ei rajoita, julkaistaan arvona NULL ja tilatiedolla, ei koskaan lähes singulaarisen käänteismatriisin lukemana. Majakkavirheiden korrelaatio on mitattu, ei oletettu: kun asemat pidetään kiinteinä, mikään havainto ei kosketa kahta majakkaa, joten informaatiomatriisi on täsmälleen lohkodiagonaalinen (offblock_fraction { "0" }), ja kun asemat estimoidaan, Schur-marginalisoitu lohko on kytketty, indusoitu korrelaatio tulostetaan ja koko eteneminen ajetaan uudelleen sen ollessa hylättynä, jotta riippumattomuusoletuksen hinta on luku. Sama eteneminen isotrooppisella koordinaattikohtaisella sigmalla ja palautusvirhe, jonka skenaario lunar-frame-realisation raportoi, ajetaan molemmat tässä ja tulostetaan kampanja-arvon rinnalle suhdelukuineen. MODELLED: majakkaluettelo on lähteistetty mutta KAMPANJA on simuloitu — asemaverkko ja viiveen sigma ovat havainnollistavia syötteitä, yksittäisiä viivehavaintoja käsitellään riippumattomina, ja Kuun keskipisteen efemeridi, asemakellot, troposfääri ja Maan orientaatioparametrit pidetään KIINTEINÄ, joten datumin kovarianssi on Cramer-Rao-raja supistetulle parametrijoukolle. Ei ole geodeettinen tuote.

seg-2e02c1ff8f48 = Yksi tiedoston <c1/> ajo tiivistyy seuraavasti: lunar-frame-campaign | { "4" } majakkaa x { "3" } baselinea x { "49" } epookkia = { "64" } havaintoa (viiveen sigma { "1.000e-11" } s) | aseman datum kiinteä | Helmert-aste 7/7 ehto { "3.798e5" } | datumin translaation sigma { "6.397500" } m vs lisätyn muunnoksen palautusvirhe { "0.3125" } m (suhde { "0.049" })

seg-9c5feacf15ce = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>

seg-1d70a5b4a197 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-df90e5910fb4 = hr

seg-d9523213de9f = Tuloksen nimike (moottorin oma): MODELLED kampanjaohjattu Kuun koordinaatiston datum. Seitsenparametrinen Helmert-kovarianssi etenee majakkakoordinaattien informaatiomatriisista, joka on kertynyt moottorin omista Kuun VLBI-viiveen osittaisderivaatoista majakoiden, baselinejen ja epookkien nimenomaisen aikataulun yli; MITÄÄN similariteettimuunnosta EI lisätä ja

seg-883d94b321b4 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/lunar-frame-campaign.toml, tyyppi lunar-frame-campaign

seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: tämän tyypin mainitsevat <a1>varmennusmatriisin</a1> rivit.

seg-2595bd629ffb = <b>MODELLED</b> Seitsenparametrinen Helmert-datum, joka etenee SIMULOIDUSTA HAVAINTOKAMPANJASTA eikä palaudu lisätystä muunnoksesta.

seg-fd34d760edb1 = <b>VALIDATED</b> Seitsenparametrisen Helmert-datumin kovarianssi, jossa sen kaksi simuloitua syötettä on korvattu mitatuilla: aikataulu on { "337" } arkistoidun ILRS Kuun laseretäisyysmittauksen normaalipisteen maalähetysepookit (2015-04-08 – 2015-06-27, Grasse MeO { "7" } Testit: <a1>lunar_llr_real_data.rs</a1>.

seg-055864084843 = <b>MODELLED</b> Valinnaiset syötteet extra_reflectors ja extra_beacons skenaariossa lunar-llr-datum lisäävät station_geodesy-lohkon: viiden taulukon Helmert-informaation arkistoidusta Kuun laseretäisyysmittauksen otteesta plus informaation, jonka lisätty retroheijastin (ran Testit: <a1>lunar_station_geodesy.rs</a1>.

seg-23bd763c32d8 = <b>VALIDATED</b> Skenaarion lunar-frame-campaign seitsenparametrisen Helmert-datumin kovarianssi Maa-asemat estimoituina (asema { "1" } ankkuroituna), kuten lunar_frame_campaign laskee sen binary64-tarkkuudella: yhteinen asema- ja majakka-Fisher-informaatio kertyy Testit: <a1>lunar_frame_campaign_mpmath_oracle.rs</a1>.

seg-49f323360dc3 = <b>VALIDATED</b> 7-parametrinen Helmert-datumin sovitus + ICRF-orientaatiositominen pisteverkosta. Oraakkeli (ExternalDataset): Riippumaton suljetun muodon painotettu Umeyama (Horn) -similariteettimuunnosratkaisija (numpy/scipy SVD-pohjainen; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — eri algoritmi kuin kshanan iteratiivinen Gauss–Newton-sovitus, joka saavuttaa saman yksikäsitteisesti määritellyn painotetun pienimmän neliösumman optimin tavutarkasti identtisillä pisteverkoilla

seg-d024abcfd87c = <b>MODELLED</b> Seitsenparametrinen Helmert-datum, joka etenee SIMULOIDUSTA HAVAINTOKAMPANJASTA eikä palaudu lisätystä muunnoksesta. Maa-asemat havainnoivat lähteis. Oraakkeli (ReferenceImpl): Suljetun muodon identiteetit ja riippumaton reitti repon sisällä, ilman väitettyä ulkoista oraakkelia. Helmert-suunnittelumatriisi — moduulin ainoa uusi derivaatta — johdetaan uudelleen funktion lunar_frame_realise::apply_helmert keskeisellä äärellisellä differenssillä, polulla, joka ei jaa lauseketta analyyttisen muodon kanssa. Sen kokoama kertymä on lunar-vlbi-fim:n, jonka Jakobiaani differoidaan äärellisillä differensseillä funktiota lunar_vlbi::vlbi_delay_s vastaan siellä, ja joka

seg-0abd7b181f21 = MODELLED kampanjaohjattu Kuun koordinaatiston datum. Seitsenparametrinen Helmert-kovarianssi etenee majakkakoordinaattien informaatiomatriisista, joka on kertynyt moottorin omista Kuun VLBI-viiveen osittaisderivaatoista majakoiden, baselinejen ja epookkien nimenomaisen aikataulun yli; MITÄÄN similariteettimuunnosta EI lisätä eikä mitään palauteta istutetusta vastauksesta. Majakkaluettelo on paketin lähteistetty nimettyjen paikkojen taulukko, mutta KAMPA (tulos <c1/>)

seg-f92d22c06cd5 = Majakkavirheiden korrelaatio on mitattu, ei oletettu: kun asemat pidetään kiinteinä, mikään havainto ei kosketa kahta majakkaa, joten informaatiomatriisi on täsmälleen lohkodiagonaalinen (offblock_fraction { "0" }), ja kun asemat estimoidaan, Schur-marginalisoitu lohko on kytketty, indusoitu korrelaatio tulostetaan ja koko eteneminen ajetaan uudelleen sen ollessa hylättynä, jotta riippumattomuusoletuksen hinta on luku. (tyyppiluettelo (<c1/>))

seg-534cea416496 = MODELLED: majakkaluettelo on lähteistetty mutta KAMPANJA on simuloitu — asemaverkko ja viiveen sigma ovat havainnollistavia syötteitä, yksittäisiä viivehavaintoja käsitellään riippumattomina, ja Kuun keskipisteen efemeridi, asemakellot, troposfääri ja Maan orientaatioparametrit pidetään KIINTEINÄ, joten datumin kovarianssi on Cramer-Rao-raja supistetulle parametrijoukolle. (tyyppiluettelo (<c1/>))

seg-ec67b9d3adbb = Majakkavirheiden korrelaatio on MEASURED (mitattu), ei oletettu. Kun asemat pidetään kiinteinä, mikään havainto ei kosketa kahta majakkaa, joten informaatiomatriisi on täsmälleen lohkodiagonaalinen (offblock_fraction { "0" }); kun asemat estimoidaan, Schur-marginalisoitu lohko on kytketty, indusoitu korrelaatio tulostetaan ja koko eteneminen ajetaan uudelleen sen ollessa hylättynä, jotta riippumattomuusoletuksen hinta on luku eikä c (skenaariotiedoston kommentti, rivit { "17" }–{ "21" })

seg-a2bb557da7ba = MODELLED: majakkaluettelo on lähteistetty mutta KAMPANJA on simuloitu — asemaverkko ja viiveen sigma ovat havainnollistavia syötteitä, yksittäisiä viivehavaintoja käsitellään riippumattomina, ja Kuun keskipisteen efemeridi, asemakellot, troposfääri ja Maan orientaatioparametrit pidetään KIINTEINÄ. Ei ole geodeettinen tuote. (skenaariotiedoston kommentti, rivit { "27" }–{ "30" })

seg-57a371bca2c7 = Kuun koordinaatiston datum havaintokampanjasta on MODELLED, ei validoitu: tarkistettu tämän saman koodikannan erillistä toteutusta vastaan: riippumaton testattavasta yksiköstä mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-7b56c979b2c9 = <s1>Edellinen</s1>lunar-differential-pnt

seg-70072dbfa305 = <s1>Seuraava</s1>lunar-frame-realisation
