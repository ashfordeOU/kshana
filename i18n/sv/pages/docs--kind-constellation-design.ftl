# docs--kind-constellation-design: translations (sv)

seg-e27476e37522 = Jorden

seg-37d29d8303fe = km

seg-11e8c29ecb45 = Scenariotyp i motor v{ $version }, familj <a1>Konstellationer, täckning och geometri</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-a4f1e7d2041e = Familjesida: <a1>Konstellationer, täckning och geometri</a1>

seg-670191cf797f = Ämnessida: <a1>SOLAR-SYSTEM.md</a1>

seg-cb91473bfdda = Ämnessida: <a1>LEO-PNT.md</a1>

seg-f305ed6dc164 = Källa: <c1/>

seg-f708c26a5139 = <c1/> (scenariotyp)

seg-de173c9f4034 = Konstellationsutformning i stor skala: Walker DELTA- och Walker STAR-mönster i konventionen i: T/P/F (noder utspridda över { "360" } eller { "180" } deg, avstånd i planet { "360" }<em>P/T, fasförskjutning mellan plan { "360" }</em>F/T), explicita elementlistor och utformningar med flera skal, flera konstellationer i en körning, kring jorden, Månen, Mars eller valfri annan planet, Pluto eller större måne med konstanterna i modulen body (samma som typerna solar-system och body-pnt använder). FÖRINSTÄLLNINGAR från publicerade nominella element: gps-baseline och gps-expandable (de { "24" } platserna och de sex expanderbara paren fram/akter i GPS Standard Positioning Service Performance Standard, 5:e utgåvan { "2020" }, tabellerna 3.2-1 till 3.2-3), galileo (Walker 24/3/1 vid { "29 599.801" } km och { "56" } deg, Galileo Open Service Service Definition Document utgåva { "1.1" } tabellerna { "1" } och { "23" }), beidou och beidou-meo (Walker 24/3/1 vid { "21 528" } km och { "55" } deg plus tre geostationära satelliter vid { "80" }, { "110.5" } och { "140" } deg E och tre lutande geosynkrona satelliter vid { "55" } deg, BeiDou Open Service Performance Standard { "3.0" } avsnitt { "4.1" }; MEO-fasen och den lutande geosynkrona korsningen vid { "118" } deg E är modellerade eftersom standarden inte anger dem) och glonass (24/3/1 vid { "19 100" } km och { "64.8" } deg från platsformeln i GLONASS Interface Control Document utgåva { "5.1" } avsnitt { "5.2" }). TÄCKNING OCH DILUTION OF PRECISION: över ett rutnät av latitud/longitud och ett samplat fönster med en elevationsmask, antalet satelliter i sikte, GDOP, PDOP, HDOP och VDOP per cell, tillgängligheten (en positionsbestämning med PDOP vid eller under ett tröskelvärde, { "6" } som standard) per cell, globalt (areaviktat) och på den sämsta platsen, med en mottagarklocka per konstellation om inte clock = "common". Den skalar till tusentals satelliter: synlighet är en skalärprodukt mot varje satellits täckningshalvvinkel, och satelliterna delas in i band efter sub-satellitlatitud vid varje epok så att en rutnätsrad bara testar dem som kan vara i sikte; rapporten räknar de parprov som sparats. JSON innehåller rutnätskartorna och nedsamplade markspår per satellit. VALIDATED: Walker-generatorn mot Galileo OS SDD tabell { "23" } och GLONASS ICD:s platsformel, GPS-förinställningen mot den publicerade kolumnen för ekvatorskorsning i SPS PS tabell 3.2-1, och den globala HDOP-fördelningen för GPS-baslinjen mot SPS PS bilaga B (median { "0.94" }, { "95" }% { "1.25" }, medelvärde { "0.96" }, tolerans { "0.03" }). MODELLED: tvåkroppsbanor med valfri sekulär J2, en sfärisk kropp, enbart geometrisk synlighet (ingen signaleffekt, hälsostatus eller terräng), och den relativa fasen mellan olika system, som inte är en ögonblicksbild av något verkligt datum.

seg-21fbd84bfba1 = En körning av <c1/> sammanfattas som: constellation-design: { "5000" } satelliter (LEO-PNT) kring jorden; tillgänglighet { "99.22" }% (PDOP <= { "3" } vid { "20" } deg mask), sämsta plats { "0.00" }%, median-PDOP { "1.11" }, i genomsnitt { "39.4" } i sikte; { "648" } rutnätspunkter x { "12" } epoker (MODELLED)

seg-af572ce1fd89 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-fd393ddc7d5d = Exemplet <c1/> anger bland annat:

seg-d72b4c5393e0 = earth

seg-d9b3c54bd272 = common

seg-6411970ba342 = delta

seg-3bc1761c76ab = { "3" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-0a6f7f6c66c4 = km^3/s^{ "2" }

seg-ab9b72b9ffce = Resultatetikett (motorns): MODELLED - keplerska tvåkroppsbanor (valfri sekulär J2) kring en sfärisk kropp, geometrisk synlighet över en elevationsmask, dilution of precision med alla satelliter i sikte med en mottagarklocka per konstellation om inte clock = "common"; ingen signaleffekt, hälsostatus eller terräng. Walker-geometrin och de publi

seg-899e728ad9bd = Diagrammet som motorn skriver för scenarios/leo-pnt-mega-shell.toml, typ constellation-design

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-602493ac6987 = <b>VALIDATED</b> Generatorerna i typen <c1/>: Walker delta- och star-mönster i konventionen T/P/F (nodavstånd 360/P eller 180/P, avstånd i planet { "360" }·P/T, fasförskjutning mellan plan { "360" }·F/T), och GPS-baslinjen och den expanderbara 24-platsuppsättningen, Gal

seg-bdc81f37ad16 = <b>VALIDATED</b> Täckningsmotorn i typen <c1/> på GPS-baslinjens förinställning med 24 platser under villkoren i bilaga B till GPS Standard Positioning Service Performance Standard (SPS PS) (ett siderisk dygn, { "287" } femminutersteg, ett globalt rutnät på { "4" } x { "4" } deg med

seg-1272200ad4f2 = <b>MODELLED</b> Typen <c1/> utöver de två fastlåsta fallen: explicita utformningar och utformningar med flera skal, flera konstellationer per körning med en mottagarklocka per konstellation, jorden, Månen och Mars från kroppskonstanterna, BeiDou-förinställningen Tester: <a1>coverage_dop_gnss_lib_py_oracle.rs</a1>.

seg-0c64f22330d2 = <b>VALIDATED</b> Generatorerna i typen <c1/>: Walker delta- och star-mönster i konventionen T/P/F (nodavstånd 360/P eller 180/P, avstånd i planet { "360" }·P/T, int. Oberoende referens (ExternalDataset): Publicerade myndighetsdokument: Galileo Open Service Service Definition Document utgåva { "1.1" } (European GNSS Service Centre) tabellerna { "1" } och { "23" }, referenskonstellationen vid 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document utgåva { "5.1" } ({ "2008" }) avsnitt { "5.2" }, platsformeln för nodlongitud och latitudargument; GPS Standard Positioning Service Performance Standard 5:e utgåvan (april { "2020" }) tabellerna 3.2-1, 3.2-2 och

seg-87c4e19dc780 = <b>VALIDATED</b> Täckningsmotorn i typen <c1/> på GPS-baslinjens förinställning med 24 platser under villkoren i bilaga B till GPS Standard Positioning Service Performance Standard (SPS PS). Oberoende referens (ExternalDataset): GPS SPS PS 5:e utgåvan (april { "2020" }) bilaga B avsnitt B.3.2.2 och B.3.2.3, den publicerade globala medelfördelningen av HDOP för den fullt bemannade baslinjekonstellationen med 24 platser (median { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, medelvärde { "0.96" }), tabell 3.8-1 (PDOP-tillgänglighet) och tabell B.3-1 (ensemble-PDOP för en degraderad konstellation, används bara som övre gräns), plus en handhärledd sluten form för en epok. VDOP och PD

seg-04289f7252cd = <b>MODELLED</b> Typen <c1/> utöver de två fastlåsta fallen: explicita utformningar och utformningar med flera skal, flera konstellationer per körning med en mottagarklocka per konst. Oberoende referens (InternalConsistency): Inre samstämmighet: den brute-force-baserade elevationsskanningen, de handräknade reduktionerna och orbit::dop, och den slutna Walker- och geosynkrona geometrin. Tvåkroppsbanor med en valfri sekulär J2, en sfärisk kropp med lokal vertikal längs radien, enbart geometrisk synlighet (ingen signaleffekt, satellithälsa, terräng eller störning från tredje kropp), och den relativa fasen mellan system tagen från olika re

seg-00fa65d44cbd = MODELLED - keplerska tvåkroppsbanor (valfri sekulär J2) kring en sfärisk kropp, geometrisk synlighet över en elevationsmask, dilution of precision med alla satelliter i sikte med en mottagarklocka per konstellation om inte clock = "common"; ingen signaleffekt, hälsostatus eller terräng. Walker-geometrin och de publicerade förinställningarna kontrolleras mot Galileo OS SDD, GLONASS ICD och platstabellerna i GPS SPS Performance Standard, a (resultat <c1/>)
