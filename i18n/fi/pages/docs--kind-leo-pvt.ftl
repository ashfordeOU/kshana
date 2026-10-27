# docs--kind-leo-pvt: translations (fi)

seg-7f5ad6ab8c23 = GPS

seg-b054c73f22e5 = ei arvoa

seg-cb91473bfdda = Aihesivu: <a1>LEO-PNT.md</a1>

seg-a849735fcc6e = Aihesivu: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Matalan Maan kiertoradan navigointi</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; tyyppi on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-c5478f572d21 = Perhesivu: <a1>Matalan Maan kiertoradan navigointi</a1>

seg-be21370c2446 = joint

seg-dfe64e82e4e9 = Lähde: <c1/>

seg-fdba999dab11 = <c1/> (skenaariotyyppi)

seg-093aac4b5ff1 = Yhdistetty keskimatalan Maan kiertoradan (MEO) ja matalan Maan kiertoradan (LEO) paikannus, navigointi ja ajanmääritys (PNT) MINKÄ TAHANSA tähdistöjen yli: kukin [[system]] on constellation-design-tyypin GNSS-esiasetus, LEO-esiasetus (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, atomic-zero-clock-efemeridimalli, tai toinen esiasetustiedosto, kukin omassa tiedostossaan lähteet merkittyinä PUBLIC, WORKSHOP tai JOHDETTU), Walker-kuoria tai nimenomaisia elementtijoukkoja, kantoaallolla, sirunopeudella, kantoaalto–kohinatiheys-verhokäyrällä (C/N0) korkeuskulman maskista zeniittiin, signaalin avaruudessa -etäisyysvirheellä (SISRE), Doppler-sigmalla ja kellomallilla (oma vastaanottimen kello, jolloin järjestelmienvälinen harha estimoidaan, tai tunnettu lähetetty siirtymä). Neljä tilaa. DOPPLER: eräkohtainen Gauss-Newton-paikannus etäisyyden muutosnopeudesta analyyttisillä osittaisderivaatoilla, kellodriftin ja valinnaisen nopeuden tiloilla sekä valinnaisella korkeusrajoitteella, yhdellä tai usealla satelliitilla, virhe ikkunan pituuden funktiona, kunkin LEO-järjestelmän Doppler-, Doppler-muutosnopeus- ja nykäysverhokäyrä sekä yhden ohituksen radan suuntainen ja sivusuuntainen tarkkuus sivusuuntaisen siirtymän funktiona (sivusuuntainen virhe kasvaa rajatta, kun ohitus menee yläpuolelta; yhdellä ohituksella on myös peiliratkaisu radan jäljen toisella puolella). Vain Doppler-pohjainen tilaisuuden signaali (starlink-sop) ajetaan tässä. JOINT: epookkikohtaiset painotetut pienimmän neliösumman pseudoetäisyysratkaisut pelkästä GNSS:stä, pelkästä LEO:sta ja molemmista, mittauskohtaiset sigmat viivelukitun silmukan terminen kohinamalli C/N0:lla plus SISRE (tai kiinteä sigma, jotta signaalimalli voi syöttää niitä), estimoidut järjestelmienväliset harhat ja PDOP/HDOP/VDOP lisättyjen LEO-satelliittien lukumäärän funktiona. POLAR: näkyvät satelliitit ja DOP leveysasteen funktiona GNSS:lle, LEO:lle ja molemmille. TIMING: ajansiirto Coordinated Universal Time (UTC) -aikaan tunnetussa paikassa olevista LEO-satelliiteista kaksitilaisella kellosuodattimella, jonka prosessikohina tulee moottorin oskillaattoriluokista, C/N0:n ja oskillaattorin funktiona, sekä IS-GPS-200 järjestelmäajan ja UTC:n välinen lauseke; asetuksella [timing] trace = true jokainen rivi raportoi myös aikavirheensä ja ennustetun sigmansa jokaisella epookilla. VALIDATED: yläpuolelta horisonttiin kulkevan ohituksen suurin Doppler julkaistuja Iridium (enintään { "36" } kHz) ja Xona Pulsar X1 ({ "32" } – { "34" } kHz) -lukuja vastaan. MODELLED: kaikki muu; DOP tarkistetaan käsin johdettua tapausta vastaan, ratkaisut kovarianssiaan vastaan ja Doppler-malli etäisyyden kiihtyvyyden identiteettiä vastaan.

seg-f34d4bbcac4d = Yksi tiedoston <c1/> ajo tiivistyy seuraavasti: LEO PVT (joint) kohdassa { "61.10" }, { "6.60" } ajalla { "1800" } s GPS gnss { "24" } satelliittia korkeudella { "20182" } km, { "1575.42" } MHz Galileo gnss { "24" } satelliittia korkeudella { "23222" } km, { "1575.42" } MHz Pulsar X5 leo { "258" } satelliittia korkeudella { "1080" } km, { "1190.52" } MHz LEO-etäisyysmittaussatelliitti näkyvissä { "100.0" }% epookeista vain GNSS saatavuus { "1.000" }, PDOP mediaani { "1.48" }, RMS 3D-virhe { "1.29" } m vain LEO saatavuus { "1.000" }, PDOP mediaani { "2.33" }, RMS 3D-virhe { "0.69" } m yhdistetty saatavuus { "1.000" }, PDOP mediaani { "1.14" }, RMS 3D-virhe { "0.63" } m

seg-e271a69236bf = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-f850cba7d96e = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-bb3b3e8be839 = fjord

seg-99a3c57c7926 = { "7" } mukana toimitettua skenaariota käyttää tätä tyyppiä; muut ovat kohteessa <a1><c1/></a1>.

seg-b43a7ee40372 = Tuloksen nimike (moottorin oma): MODELLED yhdistetty painotettu pienimmän neliösumman pseudoetäisyyspaikannus yhdellä kellolla järjestelmää kohden tai tunnetulla siirtymällä; kohina viivelukitun silmukan mallista C/N0-verhokäyrällä plus signaalin avaruudessa -etäisyysvirhe

seg-90361a6f4e3c = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/leo-pvt-fjord-skyline.toml, tyyppi leo-pvt

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: tämän tyypin mainitsevat <a1>varmennusmatriisin</a1> rivit.

seg-68aa305e05a4 = <b>VALIDATED</b> Satelliitin tarkka etäisyyden muutosnopeus, jonka Maan kiinteä paikka ja nopeus tulevat kaksirunkoisesta radasta sekulaarilla J2-ajautumalla ja Maan pyörimisellä (leo_fusion::geom::EarthOrbit::state, nopeus paikan tarkka aikaderivaatta), Testit: <a1>leo_doppler_reference.rs</a1>.

seg-c3ef3e0163f2 = <b>MODELLED</b> Eräkohtainen Gauss-Newton-paikannus etäisyyden muutosnopeudesta analyyttisillä osittaisderivaatoilla (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), vakionopeus käyttäjälle valinnaisena, korkeuspseudomittaus pintakäyttäjälle, vaimennettu s Testit: <a1>leo_fusion_scenarios.rs</a1>.

seg-a4e0166269ea = <b>MODELLED</b> Painotetut pienimmän neliösumman Gauss-Newton-ratkaisut mille tahansa järjestelmien yhdistelmälle, yksi vastaanottimen kello järjestelmää kohden (järjestelmienvälinen harha estimoidaan paikan kanssa) tai tunnettu lähetetty siirtymä vertailuaika-asteikolla; mittauskohtaiset sigmat toimittaa Testit: <a1>leo_fusion_scenarios.rs</a1>.

seg-5c9f826efbc8 = <b>MODELLED</b> Kellomittaukset jokaiselta tunnetussa paikassa näkyvältä LEO-satelliitilta, yhdistettynä käänteisvarianssilla pseudoetäisyyskohinamallista, suodatettuna kaksitilaisella (vaihe, taajuus) Kalman-suodattimella, jonka prosessikohina on oskillaattoriluokan w Testit: <a1>leo_fusion_scenarios.rs</a1>.

seg-3319b18ac61f = ja { "1" } muu matriisissa.

seg-f6bd93155e41 = <b>MODELLED</b> Painotetut pienimmän neliösumman Gauss-Newton-ratkaisut mille tahansa järjestelmien yhdistelmälle, yksi vastaanottimen kello järjestelmää kohden (järjestelmienvälinen harha estimoidaan paikan kanssa) tai tunnettu. Oraakkeli (InternalConsistency): Käsin johdettu neljän satelliitin DOP (yksi satelliitti zeniitissä ja kolme horisontissa { "120" } deg:n välein, joiden normaalimatriisi kääntyy käsin), rakenteellinen identiteetti, jonka mukaan järjestelmä, jolla on oma kellonsa ja yksi satelliitti, ei lisää geometriaa, kohinattoman paikan, kellon ja harhan palautus sekä siemenluvulla alustetut virheet kovarianssia vastaan. Vain sisäisiä tarkistuksia; ei verrattu vastaanottimen tulosteeseen. { "0.30" } ulkoinen vertailu, havainto

seg-4056b0470099 = <b>MODELLED</b> Järjestelmäriippumattomat syötteet: jokainen järjestelmä on Walker-kuoria, nimenomaisia elementtejä tai GNSS-esiasetus, signaali (kantoaalto, sirunopeus, kaistanleveys, vastaanotettu teho tai C/N0-alue. Oraakkeli (InternalConsistency): Mainittujen julkisten arvojen jäljennös, tarkistettu rakenteen osalta (jokaisella julkisella lähteellä on URL, Walker-kuviot jakautuvat tasan, C/N0 vastaanotetusta tehosta jaettuna kT:llä lämpötilassa { "290" } K), ei ulkoista oraakkelia vastaan. Edustavat arvot nimetään kussakin esiasetuksessa ja ovat havainnollistavia

seg-df745ccdaceb = MODELLED yhdistetty painotettu pienimmän neliösumman pseudoetäisyyspaikannus yhdellä kellolla järjestelmää kohden tai tunnetulla siirtymällä; kohina viivelukitun silmukan mallista C/N0-verhokäyrällä plus signaalin avaruudessa -etäisyysvirhe (tulos <c1/>)

seg-c988291eb41d = MODELLED: kaikki muu; DOP tarkistetaan käsin johdettua tapausta vastaan, ratkaisut kovarianssiaan vastaan ja Doppler-malli etäisyyden kiihtyvyyden identiteettiä vastaan. (tyyppiluettelo (<c1/>))

seg-be908356ad19 = Skyline-esiasetus on REPRESENTATIVE (alkuperä tiedostoissa docs/SKYLINE.md ja <c1/>): syvien länsi-Norjan vuonojen leveyden ja korkeuserojen suuruusluokka, ei minkään vuonon mittaus. Vain näköyhteys: ei diffraktiota, heijastusta eikä näköyhteyden ulkopuolista vastaanottoa. Poista [skyline]-osio verrataksesi avoimeen taivaaseen. MODELLED. (skenaariotiedoston kommentti, rivit { "15" }–{ "18" })

seg-1d0ab26930e1 = Yhdistetty GNSS- ja LEO-pseudoetäisyyspaikannus järjestelmienvälisillä harhoilla ja signaalikohtaisilla virhemalleilla on MODELLED, ei validoitu: tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vastaan, mikä paljastaa kirjoitus- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-35916a8ac93e = Nimetyt LEO-PNT-järjestelmät valinnaisina dataesiasetuksina, kullakin oma lähteensä, on MODELLED, ei validoitu: tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vastaan, mikä paljastaa kirjoitus- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-6ac7dcc57b2a = <s1>Edellinen</s1>leo-ppp

seg-458b3eda3250 = <s1>Seuraava</s1>leo-signal
