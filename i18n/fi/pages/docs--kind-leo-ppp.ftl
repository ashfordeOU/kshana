# docs--kind-leo-ppp: translations (fi)

seg-37d29d8303fe = km

seg-cb91473bfdda = Aihesivu: <a1>LEO-PNT.md</a1>

seg-a849735fcc6e = Aihesivu: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Matalan Maan kiertoradan navigointi</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; tyyppi on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-c5478f572d21 = Perhesivu: <a1>Matalan Maan kiertoradan navigointi</a1>

seg-8f0aab32310b = Lähde: <c1/>

seg-c9852d3b79c8 = <c1/> (skenaariotyyppi)

seg-32a570f1a4fa = Tarkan pistepaikannuksen (PPP) konvergenssi pelkällä GNSS:llä ja LEO-täydennyksellä: float-laajennettu Kalman-suodatin ionosfääristä vapaalla koodilla ja kantoaallon vaiheella staattisilla asemakoordinaateilla, valkoisella vastaanottimen kellolla, yhdellä järjestelmienvälisellä harhalla kutakin ylimääräistä järjestelmää kohden, satunnaiskävelevällä zeniittimärkäviiveellä, joka kuvataan kertoimella 1/sin(elevaatio), sekä float-epäselvyydellä satelliittikaarta kohden; tarkka rata- ja kellovirhe on valkoinen ja yhteinen satelliitin koodille ja vaiheelle, joten kukin satelliitti on yksi korreloitu kaksirivinen päivitys Joseph-stabiloidussa muodossa. Mittaukset simuloidaan samasta mallista siemenluvulla alustetulla kohinalla usean paikan ja siemenluvun yli, ja kukin tapaus (ensin vain GNSS, sitten kukin LEO-järjestelmien [[case]], mikä tahansa tähdistö tai esiasetus) raportoi konvergenssiajan mediaanin (ensimmäinen epookki, jonka jälkeen vaaka- ja pystyvirheet pysyvät kynnysten alapuolella, oletuksena { "10" } cm), konvergoituneiden osuuden, virhekäyrien mediaanit ja suodattimen johdonmukaisuuden (ajojen keskiarvoistettu paikka-NEES verrattuna kaksipuoliseen { "95" }%:n khiin neliö -kaistaan). Valinnaisesti julkaistujen Li ym. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2) keskileveysasteen lukujen rinnalla: { "9.6" } min multi-GNSS:lle lyhenee arvoihin { "7.0" }, { "3.2" }, { "2.1" } ja { "1.3" } min, kun LEO-satelliitteja on { "60" }, { "96" }, { "192" } ja { "288" }. MODELLED: trendin johdonmukaisuusvertailu, ei sen tutkimuksen tähdistöjen, kohinan tai asemien toisto; ei kokonaislukuepävarmuuden ratkaisua, ei vaihehyppyjä, ei vaiheen käämimistä, ei vuorovesiä eikä ajallisesti korreloituneita tuotevirheitä.

seg-8126f4edf6b6 = Yksi tiedoston <c1/> ajo tiivistyy seuraavasti: PPP-konvergenssi arvoon { "0.10" } m vaaka / { "0.10" } m pysty, { "12" } ajoa tapausta kohden, { "96" } GNSS-satelliittia vain GNSS { "0" } LEO mediaani { "7.4" } min konvergoitui { "100" }% NEES keskiarvo { "3.13" } { "60" } LEO { "60" } LEO mediaani { "4.8" } min konvergoitui { "100" }% NEES keskiarvo { "3.08" } { "96" } LEO { "96" } LEO mediaani { "3.2" } min konvergoitui { "100" }% NEES keskiarvo { "2.74" } { "192" } LEO { "192" } LEO mediaani { "2.7" } min konvergoitui { "100" }% NEES keskiarvo { "2.65" } { "288" } LEO { "288" } LEO mediaani { "2.3" } min konvergoitui { "100" }% NEES keskiarvo { "3.06" } Li ym. { "2019" } (julkaistu, min) vs mallinnettu: { "0" }:9.6/7.4 { "60" }:7.0/4.8 { "96" }:3.2/3.2 { "192" }:2.1/2.7 { "288" }:1.3/2.3

seg-aee2e93b2c20 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-3589a089c89d = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-4dbe1423bb57 = { "60" } LEO

seg-85b65d194f0d = { "96" } LEO

seg-2750ec8c218f = Tuloksen nimike (moottorin oma): MODELLED float-PPP (ionosfääristä vapaa koodi ja vaihe, valkoinen kello, satunnaiskävelevä märkäviive, float-epäselvyydet kaarta kohden) simuloiduilla mittauksilla samasta mallista; Li ym. ({ "2019" }) luvut ovat trendin vertailu, eivät toisto

seg-225ef04c64af = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/leo-ppp-convergence.toml, tyyppi leo-ppp

seg-c75ca72ca711 = <b>MODELLED</b> Float-PPP-laajennettu Kalman-suodatin ionosfääristä vapaalla koodilla ja vaiheella: staattiset koordinaatit, valkoinen vastaanottimen kello, yksi järjestelmienvälinen harha kutakin ylimääräistä järjestelmää kohden, satunnaiskävelevä zeniittimärkäviive, joka kuvataan kertoimella 1/sin(elevaatio), float-epäselvyys satelliittia kohden Testit: <a1>leo_fusion_scenarios.rs</a1>.

seg-b55fd1cda5fa = <b>MODELLED</b> Float-PPP-laajennettu Kalman-suodatin ionosfääristä vapaalla koodilla ja vaiheella: staattiset koordinaatit, valkoinen vastaanottimen kello, yksi järjestelmienvälinen harha kutakin ylimääräistä järjestelmää kohden, satunnaiskävelevä. Oraakkeli (ExternalDataset): NEES-khiin neliö -testi on sisäinen johdonmukaisuustarkistus (totuus ja suodatin jakavat mallin). Trendiä verrataan julkaisuun Li ym., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min lyhenee arvoihin { "7.0" }, { "3.2" }, { "2.1" } ja { "1.3" } min, kun LEO-satelliitteja on { "60" }, { "96" }, { "192" } ja { "288" }. Mukana toimitettu skenaario antaa { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } ja { "2.3" } min

seg-302365809dbf = MODELLED float-PPP (ionosfääristä vapaa koodi ja vaihe, valkoinen kello, satunnaiskävelevä märkäviive, float-epäselvyydet kaarta kohden) simuloiduilla mittauksilla samasta mallista; Li ym. ({ "2019" }) luvut ovat trendin vertailu, eivät toisto (tulos <c1/>)

seg-6ce77bce8946 = MODELLED: trendin johdonmukaisuusvertailu, ei sen tutkimuksen tähdistöjen, kohinan tai asemien toisto; ei kokonaislukuepävarmuuden ratkaisua, ei vaihehyppyjä, ei vaiheen käämimistä, ei vuorovesiä eikä ajallisesti korreloituneita tuotevirheitä. (tyyppiluettelo (<c1/>))

seg-ba2fd25fdcff = Nämä neljä LEO-tähdistöä ovat edustavia Walker-delta-kuoria korkeudella { "1000" } km ja kulmassa { "60" } deg, joissa on { "60" }, { "96" }, { "192" } ja { "288" } satelliittia; ne EIVÄT ole artikkelin suunnitelmia, ja kohina, asemat ja konvergenssin määritelmä (vaaka- ja pystyvirheet alle { "10" } cm ajon loppuun asti) ovat tämän mallin. Vertailu on siksi MODELLED johdonmukaisuustarkistus trendille: konvergenssin on lyhennyttävä monotonisesti t (skenaariotiedoston kommentti, rivit { "10" }–{ "14" })

seg-b641b835570c = Tarkan pistepaikannuksen konvergenssi pelkällä GNSS:llä ja LEO-täydennyksellä on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko kyvykkyys kokoaa yhteen mallinnettuja osia, joten kyvykkyys pysyy mallinnettuna. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-368eb6979183 = <s1>Edellinen</s1>leo-pnt-chain

seg-2458954d9c22 = <s1>Seuraava</s1>leo-pvt
