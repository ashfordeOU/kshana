# docs--skyline: translations (sv)

seg-f917e7fcac09 = Vad det är

seg-6c6e7248496f = Himmelsgeometri

seg-379f49bff6fb = Python

seg-2bd2101ce454 = Yta

seg-ad856ad710eb = Status

seg-cbf0f9bcd2d8 = Oberoende referens

seg-6e0cb6acc073 = VALIDATED

seg-c14b8fe46517 = Azimutberoende skylinemask: synlig mängd, azimut och elevation samt DOP under masken

seg-bbb1828b3db1 = Reduktioner av gatukanjon, sektor och terräng till en tabell

seg-2c53381d48ae = Horisontell felellips och kofaktor per system från geometrikovariansen

seg-de6c33774c9c = CLI

seg-d1e9715513b4 = Exempel

seg-587beeccaa11 = Förinställning

seg-98f4f946a7ac = WASM

seg-b03d56f501c3 = Typ

seg-4dbf41c0ec3b = Funktion

seg-2b0d77219437 = Förinställningar

seg-7338b6210228 = Rad

seg-6317db731879 = Beskrivning

seg-be2f66de7d07 = Källa: <c1/>

seg-3cb660ef6b03 = Skylinemasker och himlageometri

seg-724f72bdfa36 = Fram till { "0.36" } var varje sikttest mot jorden i motorn en enda elevationsgräns, <c1/>: en satellit räknades när den låg vid eller över ett tal, oavsett riktning. En gata, en kaj, en fjord eller en kran blockerar en del av himlen och lämnar resten öppen. En <b>skyline</b> är en elevationsgräns som beror på azimut; <b>himlageometrifunktionerna</b> gör en plats, en tid, konstellationer och en skyline till den synliga mängden, dilution of precision (DOP), geometrikovariansen, den horisontella felellipsen, ett Monte Carlo-moln och ett skyplot. Designen är <c2/> (punkterna { "1" } och { "2" }).

seg-4c1bc0b37f54 = Evidens: beslutet om maskerad sikt (geodetiska siktvinklar, tabellmasken, den synliga mängden och dess DOP) är <b>VALIDATED</b> mot Orekit { "12.2" } och gnss_lib_py { "1.0.4" } i en förhandsregistrerad jämförelse, och det är även felellipsen och kofaktorn per system (numpy, förhandsregistrerade); reduktionerna för kanjon, sektor och terräng, förinställningarna och resten av himlageometrifunktionerna är <b>MODELLED</b> (<a1>Evidens</a1>). En skyline tar bort satelliter med fri sikt och ingenting mer. Förinställningarna är REPRESENTATIVE geometrier, inga uppmätningar.

seg-6fa3291b70e3 = Skyline

seg-08585dd55bb5 = En skyline är det punktvisa maximumet av fyra beskrivningar. Azimut är grader medurs från sann nord i platsens lokala öst-nord-upp-system; elevationer anges i <c1/>.

seg-9d0e2b0a469f = TOML

seg-3dbc7ff9f5ab = Tabell

seg-a67486e7d10e = Elevationer interpolerade linjärt i azimut, med wrap vid { "360" }°. Azimut strikt växande i <c1/>; högst { "3600" } rader.

seg-bc12ba94381f = Gatukanjon

seg-23066e2eb509 = Två raka parallella väggar (nedan).

seg-821762272e2f = Sektorer

seg-7387a718a7c3 = Skarpkantade intervall, medurs från <c1/> (inkluderad) till <c2/> (exkluderad), som kan passera genom norr; högst { "360" }.

seg-2768e3772b56 = Terräng

seg-5a5c08a77b86 = Punkter reducerade till en tabell: elevation <c1/>, med krökningsfallet för <c2/> (en vald, angiven konstant). <c3/> är ovanför antennen.

seg-fb86c0db0c90 = <c1/> utgår från en namngiven geometri; kanjonfälten åsidosätter sedan förinställningens kanjon fält för fält, och <c2/>, <c3/> och <c4/> läggs till den.

seg-0d76504a1d74 = Mottagarens <c1/> behåller sin betydelse: den är en platt skyline. Det effektiva gränsvärdet vid azimut <c2/> är <c3/>, och en satellit är synlig när dess elevation är <b>vid eller över</b> det: samma <c4/> som den platta masken alltid använde. En satellit över <c5/> men under skylinen är <b>maskerad av skylinen</b>.

seg-f7fd13e569e3 = Gatukanjonen

seg-290f563c1ff7 = En gata löper längs azimut <c1/>, <c2/> meter mellan väggarna, med antennen <c3/> meter upp på mittlinjen. Längs azimut <c4/>, med <c5/>, når strålen en vägg efter <c6/>, så en vägg med höjden <c7/> skär vid

seg-8662708f4f32 = Den öppna remsan ligger längs gatan. Med <c1/> (antennen i mitten) lämnar en stråle genom en öppen ände, och väggen skär ingenting, när <c2/>. En vägg som inte är högre än antennen skär ingenting. <c3/> är som standard { "1.5" } m (ett biltak eller en handhållen mottagare, ett angivet val); en ny kanjon kräver <c4/>.

seg-1eeff52ea5a5 = Valda och angivna dimensioner (designanteckningens), inte mätningar av någon verklig plats. <c1/> skriver ut en med dess proveniens och dess skärning för varje grad.

seg-13e8e5460280 = Geometri

seg-6d71c5cbe104 = Kanjon: gata { "0" }°, bredd { "20" } m, väggar { "30" } m och { "30" } m, antenn { "1.5" } m. { "70.7" }° tvärs gatan, öppen längs den.

seg-ab3415ff8811 = Höjd-till-bredd { "1.5" }, inom bandet { "0.5" }–{ "2" } för gatukanjoners proportioner i Oke ({ "1988" }), <em>Street design and urban canopy layer climate</em>, Energy and Buildings { "11" }, { "103" }–{ "113" }.

seg-e331f02251f8 = Sektorer: öppet mot havet över { "090" }–{ "270" } ({ "180" }°); kajbyggnader { "8" }° över { "315" }–{ "045" } ({ "90" }°); vågbrytaren och dess fyr { "3" }° över { "045" }–{ "090" } och { "270" }–{ "315" }.

seg-6926e1bfc55d = Angivna val (till exempel lagerbyggnader på { "40" } m cirka { "285" } m bort).

seg-f13d4df9a42c = Terräng: väggar { "600" } m över antennen på { "1500" } m avstånd på vardera sidan av en nord-sydlig kanal, en punkt per grad (på <c1/> m), krökningsfall tillämpat. { "21.8" }° tvärs, under { "1" }° längs axeln.

seg-4d3dedbe4491 = Av samma storleksordning som bredden och reliefen hos de djupa västnorska fjordarna (Holtedahl ({ "1967" }), <em>Notes on the formation of fjords and fjord-valleys</em>, Geografiska Annaler 49A, { "193" }–{ "203" }).

seg-51f5219cb050 = Sektorer: containerstaplar { "12" }° över den landvända halvan { "000" }–{ "180" }; kranarmar { "35" }° över { "245" }–{ "255" } och { "25" }° över { "285" }–{ "295" }; i övrigt öppet mot vattnet.

seg-a568ae949c3b = Fem high-cube-containrar enligt ISO { "668" } ({ "14.5" } m) cirka { "60" } m bort från en antenn { "2" } m upp; en kranarm cirka { "50" } m över kajen på { "70" } m och { "100" } m, av storleksordningen hos en post-Panamax-kran. En kransektor är ogenomskinlig.

seg-65b1b45c787f = I ett scenario

seg-e489759bbd65 = En valfri sektion <c1/>, över typens egen gränsvinkel:

seg-f98345079e70 = Vad skylinen ändrar

seg-cbe2f5ae721f = Per sampel

seg-7368ea5c4b79 = <c1/> (med <c2/>)

seg-fde216d940fb = Synlighetstidslinjen (GNSS-tillgänglighet) och DOP-sammanfattningen.

seg-7f6b2fcda681 = <c1/> (med <c2/>)

seg-8fafdb892253 = De satelliter som RAIM och ARAIM (<c1/>) använder.

seg-c0156fd1c895 = De satelliter vars pseudoavstånd simuleras och används av RAIM.

seg-d7fa5e5cf33d = De satelliter som mottagaren kan spåra, före jammern.

seg-86caf3ae19ad = Varje lägesuppsättning av satelliter i sikte över varje systems egen mask, inklusive polarsvepet (samma skyline på varje plats). Envelopen för Doppler-läget och den utformade enskilda passagen är gränser för vad en mottagare måste hantera och behåller varje systems mask.

seg-20d2e86d17bc = Vilka epoker som räknas som över masken, tiden över den, GNSS-jämförelsens satelliter.

seg-ed5bbd6b2c46 = <c1/> (tränings-NMEA)

seg-d0eb9fd84d24 = Satelliterna i GSV och i positionsbestämningen. Azimut är sanna bäringar fixerade mot marken, inte fartygets kurs.

seg-56cc8ae30218 = <b>Markplatsen för <c1/> och <c2/>.</b> Båda typerna modellerar en kretsande användare med geocentrisk elevation och utan jordfast azimut, så de tar en skyline bara med designanteckningens markplatsläge: <c3/> i stället för <c4/> (exakt en av de två). Varje sampel är ett absolut ögonblick, <c5/>: varje satellit propageras till det (en elementuppsättning, sänd efemerid eller SP3-fil förs fram från sin egen epok, en Walker-satellit räknar <c6/> från <c7/>) och roteras till jordfast vid det, så att platsen ser en enhetlig himmel. <c8/> är omloppsscenariots egen; saknas en (och alltid för <c9/>, som inte har någon) är det den nyaste epoken bland de satelliter som har en, eller J2000 enbart för Walker-mönster. Elevation och azimut är geodetiska (WGS-84). Den horisontella och vertikala uppdelningen av integritetstypens ARAIM-skyddsnivåer och Stanfords vertikalfel använder samma geodetiska uppåt (WGS-84-ellipsoidens normal, cirka { "0.19" }° från den geocentriska radialen vid { "45" }° latitud); ögonblicks-RAIM använde den redan. En <c10/> utan skyline är en vanlig markanvändare; vägen för den kretsande <c11/> är oförändrad.

seg-fae979b3b96f = <b>Bakåtkompatibilitet.</b> Utan en sektion <c1/> är ett scenario byte-identiskt med vad samma motor gav innan skylinekod fanns: <c2/> kontrollerar JSON, diagram och sammanfattning för varje medföljande scenario som kör någon av dessa typer, och NMEA-texten för varje träningsscenario, mot SHA-256-digest av baslinjen "{ "0.36" } portable" (digesten från utgåvans { "0.35.0" } commit, ombaserade när motorn gick över till portabel matematik och bevarade i testet som referens: <c3/>). En tom sektion <c4/> skär ingenting; resultatet är då lika med körningen utan den, förutom det tillagda blocket <c5/> och nollräknarna <c6/>.

seg-fe88e0ad01e9 = <b>Vad som avvisas</b>, med skälet i meddelandet: en skyline på en kretsande <c1/>; <c2/> och <c3/> tillsammans; en okänd förinställning; en kanjon utan <c4/>; en tabell som inte är strikt växande i <c5/>; en elevation utanför <c6/>; en tom sektor; ett icke-positivt terrängavstånd; indata över gränserna; varje okänd nyckel.

seg-d1b10a0c833f = <b>Resultatet</b> får <c1/> när sektionen finns: <c2/> är <c3/>, <c4/> eller <c5/>; <c6/> är andelen av den övre halvsfärens rymdvinkel över <c7/> (medelvärdet av <c8/> över azimut: { "1" } för noll mask, { "0.5" } för en platt skärning vid { "30" }°); <c9/> är förinställningens rad eller scenariots egen. Enheter och proveniensklasser finns i blocket <c10/>.

seg-0842c1133eb5 = Medföljande exempel (<c1/>):

seg-5f77a52314c7 = Vad det visar (ta bort sektionen <c1/> för att jämföra)

seg-523f8c1a7912 = GPS + Galileo längst ned i <c1/>: { "17" } av { "289" } sampel behåller en positionsbestämning, median-PDOP { "70.5" } ({ "1.14" } under öppen himmel).

seg-6c5618dce8ab = ARAIM med två konstellationer vid infart till en hamn: { "70" } satellitepoker dolda, tillgängligheten oförändrad ({ "145" } av { "145" }).

seg-36254db521fd = Pseudoavstånd och RAIM på en kaj: { "44" } satellitepoker dolda; RAIM-tillgänglighet { "0.59" } ({ "0.85" } under öppen himmel).

seg-6b0f8b4c700f = En jammer på { "2" } W i en hamn: { "83" } satellitepoker dolda, spårningen oförändrad (jammern hade redan tagit dem).

seg-22ceab915271 = GPS + Galileo + ett LEO-lager i en fjord: median för sammansatt PDOP { "1.14" } ({ "0.93" } under öppen himmel).

seg-f940e764e244 = Kanjonen i <c1/> som en platt skärning vid { "35" }° och som <c2/> vriden längs bilens kurs: { "8" } mot { "4" } till { "5" } GPS- och Galileo-satelliter; sammansatt medelfel { "2.1" } m i båda; larmet på { "1.5" } m vid { "51" } % respektive { "59" } % av epokerna.

seg-6aa4ec7e4058 = Fem motorfunktioner (<c1/>), desamma på varje yta:

seg-4d6a793b2794 = Indata → utdata

seg-c99f58f1ccd2 = per satellit <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; <c8/>, <c9/>, <c10/>; <c11/> (GDOP, PDOP, HDOP, VDOP, TDOP, <c12/>); <c13/>, <c14/> (enhetsvarians), <c15/>; <c16/> och <c17/> vid begärd konfidens; <c18/>, <c19/>, <c20/>

seg-a5b914aac404 = <c1/> (högst { "5000" }, en indatagräns) minsta-kvadratfel under oberoende gaussiska avståndsfel på <c2/> från en ChaCha8-ström med fröet <c3/>: <c4/>, den empiriska kovariansen, horisontell och 3D-RMS bredvid <c5/> och <c6/>, andelen innanför ellipsen på { "95" } %

seg-f435ee3b8709 = förinställningarna med etikett, beskrivning, proveniens, skärningen för varje grad och <c1/>

seg-1937af5fa347 = en skylinesektion reducerad till den tabell med 360 poster som motorn använder, med <c1/>, <c2/>, <c3/>

seg-f16a1f2de329 = skyploten som statisk SVG (inget skript, ingen extern referens, varje indatasträng escape-kodad)

seg-c802cf2a2e30 = En begäran:

seg-c3c44c1967ba = <c1/> är motorns konstellationsförinställningar (från <c2/>: <c3/>, <c4/>, <c5/>, <c6/>, ...; LEO-förinställningarna <c7/>, <c8/>, ...) eller en fullständig tabell <c9/> <c10/>, propagerad till <c11/> (keplersk med sekulär J2, de gemensamma lägesbanorna i <c12/>). Deras relativa faser kommer från olika referensepoker, så himlen är <b>en representativ geometri, inte himlen det datumet på den platsen</b>. Satelliter kan i stället (eller dessutom) anges direkt: <c13/>, eller med <c14/> och en <c15/> eller <c16/>. Standardvärden: varje systems egen mask ({ "5" }° GNSS, { "10" }° LEO; { "5" }° för direkt angivna satelliter), en mottagarklocka per system (<c17/> för en gemensam klocka), <c18/> { "1" } m (en representativ budgetrad för dubbla frekvenser), konfidens { "0.95" }. Indatagränser: högst { "2000" } satelliter över horisonten (en systemtabell som begär fler avvisas innan den byggs) och { "16" } mottagarklockor.

seg-6408f9b02ccb = En daterad himmel från elementuppsättningar.

seg-7724e4ecafee = <c1/> tar text för tvåradiga elementuppsättningar (en namnrad före varje uppsättning är valfri; högst { "4" } MiB, en indatagräns), propagerad av motorns SGP4 (WGS-72, propagatorn som <c2/> använder) till <c3/> plus <c4/>, roterad till jordfast med UT1 satt lika med UTC och utan polrörelse, och sedd från <c5/>. <c6/> är UTC ISO { "8601" } (<c7/>) och daterar bara elementuppsättningarna (förinställningarna har inget datum, så en <c8/> utan <c9/> avvisas); <c10/> märker dem för klockan per system (standard <c11/>). Varje resultat anger vilken himmel det är i <c12/> och <c13/>:

seg-13a8b4ac40f9 = Himlen

seg-c0bde35f9442 = motorns konstellationsförinställningar: en representativ geometri

seg-d368b50280cc = elementuppsättningarna propagerade till den angivna epoken: den himmel som dessa elementuppsättningar ger vid den epoken, inte en mätning av den (deras egen noggrannhet är SGP4:s och uppsättningarnas ålder)

seg-0bc07825a9b5 = ingen <c1/>: elementuppsättningarna propagerade till den nyaste uppsättningens egen epok plus <c2/>, en representativ himmel

seg-1230388da233 = satelliter angivna direkt, som de anges

seg-1a30004a7f9e = En blandning förenar dem med <c1/>. <c2/> är det ögonblick elementuppsättningarna propagerades till, och <c3/> anger vilken del av texten som inte användes, med skälet: felformade eller föräldralösa rader för elementuppsättningar (med radnummer), uppsättningar som parsern avvisade, och uppsättningar som SGP4 inte kunde propagera till det ögonblicket (förfallna, eller bortom sina gränser); högst { "100" } poster totalt, därefter en sista post som räknar resten. En tom lista <c4/> lägger inte till några förinställningar. Skyploten anger underlaget i sin fot.

seg-8560c13c7ea3 = <b>En kärna.</b> Kofaktormatrisen är <c1/>, sammansättningen av designmatrisen och Gauss-Jordan-inversen bakom <c2/>. <c3/> exponerar kovariansen och <c4/> är dess reduktion, så de skalärer som är VALIDATED är oförändrade och fortfarande fastlåsta av <c5/>. Det finns ingen andra DOP-implementation.

seg-cb1be3e04419 = <b>Ellipsen.</b> Halvaxlar <c1/> för egenvärdena <c2/> i öst-nord-blocket, med <c3/> (<c4/> vid { "95" } %, { "1" } vid { "39.35" } %), och huvudaxelns azimut <c5/> i <c6/> från norr.

seg-96062e2cfed1 = Ingångspunkter

seg-f8dc86bd9da2 = <c1/> eller <c2/>, med <c3/> eller <c4/>; <c5/>

seg-d5b5bdf6081c = Rust

seg-8d0f99ed4837 = <c1/>, <c2/> med samma namn

seg-40a7552d2ba9 = MCP

seg-42f0fe3b42ab = <c1/> (<c2/>, eller <c3/>); ingen Monte Carlo över MCP (bulkprover som en agent bör sammanfatta, inte bära)

seg-9d04c658b37a = Varje resultat bär <c1/> (MODELLED), <c2/> (geometri under en angiven felmodell: oberoende, lika, gaussiska avståndsfel med medelvärde noll; inte en förutsägelse av en mottagares verkliga fel, som också har bias, flervägsfel och fel utan siktlinje; inte en integritetsgräns) och den rådgivande texten: <em>Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC { "61108" }, IEC { "61162" }): operatören är fortsatt ansvarig för fartygets navigering.</em>

seg-0e1285fdfe52 = Fem registerrader (<c1/>), som designanteckningen avgränsar dem:

seg-1aa76286f152 = Orekit { "12.2" } (lookvinklar via <c1/>, <c2/>) med gnss_lib_py { "1.0.4" } (<c3/> och DOP-matrisen), förhandsregistrerad i <c4/> (commit e4b9d912) innan någondera kördes: { "1173" } lookvinklar på sex platser och fyra epoker, sex tabeller, { "142" } synliga uppsättningar; sämsta elevation { "1.3e-13" }°, azimut { "2.3e-13" }°, mask { "1.1e-12" }° mot { "1e-9" }°; identiska synliga uppsättningar, ingen i gränsbandet; DOP { "3.3e-13" } relativt och kofaktor { "6.6e-13" } av matrisskalan mot { "1e-9" }. Omfattning: tabellmasker, geodetiska lookvinklar, den maskerade mängden och dess DOP och kofaktor med gemensam klocka.

seg-b33828edbe2f = handberäknade värden; jämförelsen ovan läser deras tabeller som indata och kontrollerar dem inte

seg-ca950752be62 = Skylineförinställningar

seg-83946f66ca78 = ingen: valda, angivna dimensioner (kontrollerade endast mot sig själva)

seg-ca5db55640a9 = numpy { "2.5.4" } <c1/> och <c2/> (standard P2) på de { "142" } incheckade synliga uppsättningarna, gemensam klocka och en klocka per system, förhandsregistrerad i <c3/> (commit 0bbeeaee): { "270" } fall, axlar { "5.1e-13" } relativt, orientering { "5.3e-12" }°, kofaktor { "1.0e-12" } av matrisskalan, mot { "1e-9" } och { "1e-6" }°

seg-44e5f9ca28f7 = Funktioner för himmelsgeometri

seg-8e3953481bbf = sammansättningen: förinställningspropagering till en representativ himmel, Monte Carlo-molnet (kontrollerat mot den geometri det samplar), ytorna

seg-e8eec007c6b9 = Att en sektion <c1/> saknas kontrolleras byte för byte mot utdata från { "0.35.0" }, vilket visar bakåtkompatibilitet och validerar ingenting. gnss_lib_py tillämpar bara en enda elevationsmask, så den är den oberoende DOP-referensen här, inte den oberoende maskreferensen.

seg-d5894e54715b = Vad en skyline inte modellerar: diffraktion över en väggkant, reflektioner och signaler utan siktlinje som en verklig mottagare ändå kan spåra (de tas bort, försämras inte), partiell transparens (en gallerkran är ogenomskinlig över sin sektor), terräng bortom de angivna punkterna och jordkrökning inom kanjon- och sektorformerna.

seg-745d19d6b35d = <s1>Föregående</s1>Marina integrationer

seg-bbe8dd07d33b = <s1>Nästa</s1>Förtroende som säkerhetstelemetri
