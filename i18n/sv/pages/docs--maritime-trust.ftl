# docs--maritime-trust: translations (sv)

seg-2247a2344710 = Betydelse

seg-6940543aa3c0 = sträng

seg-abec93a4a488 = sträng eller null

seg-f5e7215e6835 = objekt

seg-b993ef559bd0 = Från kod

seg-c353e7bec219 = Nyckel

seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> eller <c4/>

seg-2896f449bffb = Källa: <c1/>

seg-342f34403ac5 = Maritimt förtroende: kan bryggan lita på den här positionsbestämningen?

seg-49b609a9655c = <c1/> kan för ett <b>fartyg i rörelse</b> beräkna en löpande förtroendesiffra mellan 0 och 100 för varje positionsbestämning, utifrån det som varje mottagare redan lägger på bussen (NMEA { "0183" } först), och ange vilka kontroller som sänkte den. Det är ett programvarulager som sitter bredvid en mottagare. Det är inte en mottagare, det ersätter inte någon, och det gör inte en positionsbestämning mer exakt.

seg-3c66739c9250 = <b>Rådgivande programvara.</b> Kshana är inte typgodkänd navigationsutrustning (IEC { "61108" }, IEC { "61162" }) och har inte bedömts mot någon prestandastandard. Dess poäng och dess gate är stöd för navigatörens omdöme. Operatören är fortsatt ansvarig för fartygets säkra navigering och för varje beslut att lita på, eller att sluta lita på, en positionsbestämning.

seg-a9899ca66661 = Den här sidan beskriver vad kontrollerna tittar på, vad var och en kan och inte kan fånga, hur du kör det live och vad gaten gör. Poängmappningen och varje standardvärde finns i <a1><c1/></a1>.

seg-05e79b6c5a58 = Vad den läser

seg-e784fdbe26e6 = Ett fartyg deklareras i sessionsfilen, med sina gränser angivna före körningen:

seg-e8e9ee2965cf = Mening

seg-e127f2f26824 = Läses

seg-5e17bb4156f1 = GGA

seg-b38b8385ddcb = position, positionskvalitet ({ "0" } = ingen positionsbestämning), höjd över medelhavsytan, geoidseparation, HDOP

seg-870056f55c30 = RMC

seg-445c02505551 = status (<c1/> giltig, <c2/> inte), fart och kurs över grund, datum, läge

seg-8a259fc7b06d = VTG

seg-eb3e34f58751 = fart och kurs över grund, där RMC saknar dem

seg-add66711c27b = HDT, THS

seg-24e36e50b0ad = rättvisande kurs (THS endast när dess läge inte är <c1/>)

seg-bcfb4cd59951 = VHW, VBW

seg-fa0a0dae1510 = fart genom vattnet (VBW endast när dess status är <c1/>)

seg-774d1991fb0b = ZDA

seg-68d981999c72 = tid

seg-a0cc45088f5f = GSV

seg-0fad368a11cb = signalstyrka per satellit (dB-Hz), elevation och azimut (för geometrin)

seg-032eafc03b42 = GSA

seg-71334afb8a7d = geometrisk försämring av precisionen och använda satelliter (för geometrin, där GSV inte ger någon himmel; och det angivna HDOP som vakten jämför)

seg-305f423d3ead = en OSNMA-status som en mottagare rapporterade, översatt till den här meningen av den adapter som läser mottagaren: <c1/> autentiserad, <c2/> misslyckad, <c3/> inget resultat

seg-7ce1d69e710e = Epoker som mottagaren själv säger inte är en satellitbestämd position (GGA-kvalitet { "0" }, eller { "6" } till { "8" }: uppskattad, manuell, simulator; RMC-status <c1/>, eller läge <c2/>, <c3/>, <c4/>, <c5/>) används inte för positionskontrollerna och bär inget belägg åt något håll: mottagaren har redan sagt det.

seg-a0ae80781c6e = De första <c1/> sekunderna utgör baslinjen och poängsätts aldrig. Varje övervakare tittar bara på den aktuella och tidigare epoker, så ett beslut vid en epok ändras inte när senare data anländer, och en löpande ström ger samma poäng som samma text läst som en fil.

seg-068593ad0a52 = Vad varje kontroll fångar, och vad den inte kan fånga

seg-094b90f0c701 = Riktningar mellan positionsbestämningar (kursen längs spåret som används av kontrollen av girhastighet, kursen som två positioner antyder) är riktningen för kordan mellan dem, vilket är geodetens <b>medelazimut</b> mellan positionsbestämningarna, inte framåtazimuten vid den första positionsbestämningen; de skiljer sig med ungefär halva meridiankonvergensen mellan positionsbestämningarna ({ "0.001" } grader för en baslinje på { "260" } m vid { "59.5" } graders latitud).

seg-ed3cdfcfbff5 = En förfalskad position måste stämma med ett fartygs fysik och med fartygets andra sensorer. Varje kontroll jämför positionsbestämningen med en av dem. En kontroll är bara så oberoende som dess andra källa: en kurs från en GNSS-kompass, eller en "fart genom vattnet" härledd från GNSS, är inte oberoende av mottagaren under test och tillför ingenting.

seg-9480aabf136e = Kontroll

seg-20e4f746c7e1 = Fångar upp

seg-e7b2ebe5eabc = Kan inte

seg-21ad9895f606 = ett positionssprång; ett spår vars rörelse inte förklaras av rapporterad fart och kurs; en underförstådd fart, acceleration eller girhastighet över fartygets angivna gränser

seg-dcbc6d4cd17f = en bortdragning där rapporterad fart och kurs följer det förfalskade spåret och håller sig inom gränserna (mottagaren härleder dem ur sin egen lösning, så de stämmer med varandra); en fartgräns som är angiven för högt

seg-3542f83a7988 = ett spår som avviker från fartygets stävriktning med mer än den angivna avdriftsvinkeln

seg-75f4d659f716 = en bortdragning längs kursen (kursen ändras inte); en stävriktning från samma mottagare eller en GNSS-kompass; en tvärsättning över toleransen (falsklarm); farter under <c1/>

seg-09dde82be447 = en bortdragning som ändrar farten över grund i förhållande till farten genom vattnet

seg-6ac740e5f51c = en logg som är härledd ur GNSS; en ström över det tillåtna (falsklarm); en bortdragning långsammare än det tillåtna

seg-e85d5f0933b7 = en höjd som inte ligger där havsytan och den angivna antennhöjden placerar den

seg-3806e1d46332 = en spoofer som håller höjden rimlig; toleransen är bred eftersom det vertikala felet för fristående positionering är stort; geoidseparationen registreras men kontrolleras inte, eftersom motorn saknar geoidmodell

seg-5b70bd80640e = signaturen från en enda sändare: C/N0 över satelliterna som faller samtidigt, eller stiger samtidigt, jämfört med kalibreringens baslinje

seg-e6874a8047b1 = en spoofer som formar effekten per satellit; allt medan själva baslinjen är utsatt för spoofing; en GSV-takt som är för långsam för att följa med

seg-371b17ce936a = att mottagarens tid stegar oregelbundet eller går baklänges; mot den här datorns klocka, att mottagarens tid driver ifrån den (endast realtidsströmmar)

seg-026479cb7966 = en förfalskad tid som är konsekvent och jämn; en klocka som är fel från början

seg-906ab911b73d = ett rapporterat OSNMA-autentiseringsfel

seg-a04757b7ae57 = statusen läses av, inte verifieras; en spoofer som undertrycker rapporten syns inte

seg-c36c24a337b8 = effektbortfall och förlust av satelliter, som i det statiska fallet

seg-940b39a3988a = de säger att miljön är fientlig, inte att positionsbestämningen är fel

seg-9d751e1f5938 = <b>Vad övervakare som bara läser NMEA inte kan göra.</b> En spoofer som återskapar hela konstellationen med en självkonsekvent position, hastighet, kurs som är förenlig med stävriktningen, rimlig effekt per satellit och en matchande klocka är osynlig för varje kontroll ovan: ingenting i meningarna skiljer dess positionsbestämning från en verklig. Detsamma gäller en återuppspelning av inspelade verkliga signaler. Autentisering (OSNMA, eller en mottagare med eget skydd mot spoofing) och oberoende navigationssensorer är det som sluter det gapet; det här lagret kan bara använda deras rapporterade status. En ström som redan utsätts för spoofing medan baslinjen bildas har ingen ren baslinje. Att ingen larm utlöses är inget belägg för en god positionsbestämning.

seg-e3e09e2412fb = Förtroendepoäng

seg-a1c05079de2f = Varje epok efter kalibreringen får en poäng från { "0" } till { "100" } och skälen till att den inte är { "100" }: vilka kontroller som drog av poäng, deras statistik mot tröskeln och deras poäng. Band (gränserna anges i sessionen): <c1/> vid { "90" } eller däröver, <c2/> vid { "55" } eller däröver, <c3/> under det. Avbildningen, varje vikt och skälet till den finns i <a1><c4/></a1>; den är deterministisk och fastställd innan en logg poängsätts, utan inlärning och utan att något anpassats till händelser.

seg-d56822e82e3d = Varje fartygsutdata bär den rådgivande förklaringen: nyckeln <c1/> i resultat-JSON och i varje live-rad, en första kommentarsrad <c2/> i CSV-filen (läsare hoppar över den med sitt kommentarsalternativ), <c3/> och en sidfot i SVG-filen. Utdata från en batchkörning: <c4/> (med poängmodellen och varje epoks avdrag), <c5/> (med kolumnerna <c6/> och <c7/>) och <c8/>, som för ett fartyg är det av mottagaren rapporterade spåret färgat efter förtroendeband ovanför poängen över tid.

seg-918516588036 = En syntetisk demo

seg-e6717d346ca6 = <c1/> innehåller en påhittad NMEA-logg för en färja på rutten Tallinn till Helsingfors (ett utdrag på 50 minuter, ungefär { "17" } kn, { "1" } Hz: GGA, RMC, VTG, en gyrokurs, en fartlogg, GSV med en rimlig himmel) där en bortdragning av positionen drar den <em>rapporterade</em> positionen bort från fartygets verkliga från { "1500" } s. Mottagaren fortsätter hela tiden att rapportera en <b>giltig</b> positionsbestämning; det är förtroendepoängen som faller, genom det degraderade bandet ner i det opålitliga. <c2/> anger varje tröskel, fartygets gränser och varje poängvikt före körningen.

seg-b2f24e5091d0 = Loggen är <b>text skriven till en fil</b> av <c1/>: den modellerar ingen radiosignal och sänder ingenting. Den är ingen mätning och rutten är illustrativ, inte ett sjökort. <c2/> låser loggen och den förväntade utdatan som regressionsskydd för de syntetiska data; de säger ingenting om hur någon övervakare klarar sig vid verklig störning.

seg-26ab8544afba = Förtroendepoäng över en syntetisk överfart, från en verklig körning av motor v{ $version } på examples/maritime-trust (en påhittad NMEA-logg för en färja på rutten Tallinn till Helsingfors, { "3001" } epoker vid { "1" } Hz). Tre fält delar en tidsaxel. Överst: avståndet mellan den position mottagaren rapporterar och fartygets verkliga position, som håller sig inom några meter till ungefär { "1576" } s, då loggens skriptade bortdragning av positionen drar den bort, medan mottagaren fortsätter att rapportera en giltig positionsbestämning. I mitten: förtroendepoängen från { "0" } till { "100" }, inte beräknad under de första { "300" } s av kalibreringen, i det nominella bandet (minst { "90" }) fram till bortdragningen, och sedan fallande genom det degraderade bandet (minst { "55" }) ner i det opålitliga bandet. Längst ned: varje epoks band som ett färgat band med sitt namn. Poängen är rådgivande. Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC { "61108" }, IEC { "61162" }): operatören är fortsatt ansvarig för fartygets navigering. Loggen är påhittad för att visa formatet och övervakarna; den är ingen mätning och säger ingenting om hur någon mottagare skulle prestera.

seg-ed183c325c7e = Figuren är ritad av <c1/> utifrån en verklig körning av den här demon (<c2/>); poängen är rådgivande och loggen är påhittad.

seg-8badaf0d8586 = Specifikation för Studio-vyn

seg-588092535a89 = För den som bygger Studio-vyn för en fartygskörning. Ingenting i det här avsnittet är ännu implementerat i Studio; motorsidan (data nedan) är det.

seg-5c34f31acf1d = <b>Indata.</b> Någon av:

seg-57ca6d9000b1 = resultat-JSON från en batchkörning (<c1/>, eller samma sak via <c2/> i WebAssembly-paketet med loggen inbäddad): <c3/> (bandgränser, ramp, belägghållning, varje vikt), <c4/>, <c5/> och <c6/>, var och en med <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, och från { "0.36" } <c12/> och varje avdrags <c13/>, med <c14/> och <c15/> på översta nivån; eller

seg-bfab64386b6c = live-JSON-raderna (schema ovan), ett objekt per epok, tillagda medan strömmen pågår. Varje rad bär den av mottagaren rapporterade <c1/> (schema { "1.1" }).

seg-f7c7462d315e = Demouppsättningen är <c1/>: <c2/>, <c3/> (loggen) och <c4/> (<c5/>: var fartyget verkligen var, vilket ingen verklig logg har). En vy bör köra sessionen och läsa referensfilen vid sidan av.

seg-c015c26cf30a = Vad som ska ritas.

seg-92f452bdbed6 = <em>Spår</em>, norr uppåt, en skala på båda axlarna: de av mottagaren rapporterade positionerna som en linje färgad efter epokens band (grå kalibrering, grön nominell, gul degraderad, röd opålitlig), start och slut markerade, en skalstock. För demon, det sanna spåret som en tunn neutral linje under, så att bortdragningen syns som att de två skiljs åt; en växel för det sanna spåret och en avläsning av avvikelsen i meter vid markörens tid.

seg-3ba328e2188c = <em>Poängtidslinje</em>: poängen från { "0" } till { "100" } mot tid, bandgränserna (<c1/>, <c2/> från <c3/>) som streckade linjer, bandet som en remsa under, och starten på varje angiven händelse som en markör. Tidsaxeln delas med spåret.

seg-33447da1d56d = <em>Skäl</em>: för epoken under markören, avdragen (övervakare, kvot mot tröskel, poäng) som horisontella staplar, störst först, med den vikt varje övervakare bär från <c1/>; övervakare som kördes och inte kostade något visas svagt, övervakare som inte kördes (inte i <c2/>) listas som "not run", aldrig som utan anmärkning. Övervakaren <c3/> har ingen post i <c4/>: dess tak är <c5/>.

seg-d0379b68ea67 = <em>Övervakarremsor</em>: en tunn remsa per övervakare i <c1/> som visar dess kvot över tid (larm vid { "1" }), så att en läsare ser vilken kontroll som rörde sig först.

seg-83d881ce6ab0 = <em>Grindtillstånd</em>: i en live-vy, <c1/> för varje epok (<c2/>, <c3/>, <c4/>) som en remsa under bandremsan, och den senaste <c5/>. I en batchvy är de epoker en grind skulle ha hållit tillbaka de vars band är opålitligt, med frisläppningshållningen tillämpad.

seg-b96652af3a03 = <em>Geometrifält</em> ({ "0.36" }): en remsa under bandremsan färgad efter <c1/> (grön god, gul degraderad, grå streckad okänd), i en färgfamilj som skiljer sig från fälten för inkonsekvens och miljö, med förklaringen "geometry: the sky, not the signal". Avdrag färgade efter <c2/> (geometry, environment, inconsistency) i skälpanelen och övervakarremsorna, och antalet epoker per klass från <c3/> bredvid bandantalen. För epoken under markören: <c4/>, <c5/>, HDOP, PDOP, VDOP, <c6/>, <c7/> och en flagga när <c8/> är satt (geometriavdraget är då en inkonsekvens). <c9/> visas som "geometry unknown: no GSV or GSA in the log", aldrig som god. Tröskelvärdena i <c10/> och deras ursprung från <c11/> placeras bredvid poänginställningarna. Den rådgivande anmärkningen står kvar.

seg-c48906d03f90 = <em>Av mottagaren rapporterad positionsbestämning</em>: demons mottagare rapporterar en giltig positionsbestämning hela tiden (GGA-kvalitet { "1" }, RMC-status A); säg det i förklaringen, för det är hela poängen med vyn.

seg-869c8a92e2cf = <b>Interaktioner.</b> En tidsmarkör som delas av varje panel (dra, piltangenter och en uppspelningsknapp som spelar upp med 1x till 60x); att hovra över spåret eller någon remsa flyttar den. Ett klick på ett avdrag markerar de epoker där den övervakaren låg över sitt insättningsvärde. Ett bandfilter (visa bara degraderade och opålitliga epoker) och ett hopp till det första avdraget och till den första opålitliga epoken. Hovertext på varje övervakarnamn med enradsbeskrivningen från den här sidan. Sessionens trösklar och vikter visas skrivskyddade bredvid diagrammet, så att det som poängen använde syns på skärmen.

seg-1f97fe8ea2f1 = <b>Formuleringar att behålla.</b> Sidan måste säga att det är rådgivande programvara och inte typgodkänd navigationsutrustning, att demon är syntetisk text med en påhittad bortdragning, och att en positionsbestämning utan larm inte därmed är en god positionsbestämning (se begränsningarna ovan). Ingen siffra på sidan får läsas som ett mått på hur kontrollerna klarar sig vid verklig störning.

seg-079ce44fd53e = För anropare som har sessionen och byten i minnet (inga filer, ingen klocka, inga sockets; säkert för WebAssembly) har <c1/>:

seg-e8c3172d72b8 = <c1/>: en hel logg, poängsatt som en batchkörning; samma resultat som <c2/>, som serialiseras till resultat-JSON (<c3/>, <c4/>, <c5/> med poäng och avdrag).

seg-0302b7c35fd3 = <c1/>: en begränsad del av en ström (högst { "2" } MiB och { "20,000" } epoker, och tillräckligt lång för att rymma kalibreringsfönstret), poängsatt som live-läget poängsätter och returnerad i live-JSON-lines-schemat (<c2/>, den sista <c3/>, en sammanfattning av bandantal, lägsta och slutliga poäng, första opålitliga tid). Mottagarens tid jämförs inte med en värdklocka. Det långkörande live-läget (sockets, en fil som fylls på, grinden) tillhör binärfilen.

seg-d971dae93784 = Båda behöver en session med <c1/>; dess tabell <c2/> är valfri.

seg-870fece8026e = Kör den live

seg-c132d449414f = Sessionen är samma <c1/> som för en batchkörning, med en tabell <c2/> som deklarerar <c3/>; dess tabell <c4/> behövs inte. Serieportar öppnas inte direkt ännu: läs porten med verktyget du redan använder (<c5/> och <c6/>, en terminalserver, en multiplexer) och för den vidare via pipe eller vidarebefordran. Direkt serieinmatning kan komma senare.

seg-13a043c1ce60 = Varje avslutad epok skriver en JSON-rad på stdout:

seg-b1f0c563c94d = <c1/> är <c2/>, <c3/>, <c4/> eller <c5/> (poängens band, med gränserna i sessionens tabell <c6/>); <c7/> saknas under kalibreringen; <c8/> anger vilka kontroller som drog av poäng och hur många, störst först.

seg-9b21238a7dc1 = JSON-lines-schema (version { "1.1" })

seg-79306ff2d878 = Ett JSON-objekt per avslutad epok, nycklarna i den här ordningen:

seg-a129b9e613d0 = Typ

seg-bbcdd898d24d = heltal

seg-96958263575f = antal rapporterade epoker, från { "1" }

seg-16022703e1c0 = tal

seg-95dde7698840 = sekunder sedan strömmens första epok

seg-dee4f7b91079 = epokens tid så som strömmen anger den (ISO-8601 UTC med datum när en RMC har setts, annars <c1/>)

seg-0361f40a8e59 = tal eller null

seg-c2418289d966 = { "0" } till { "100" }, en decimal; null under kalibreringen eller när <c1/> anger varför ingen kunde produceras

seg-00575e5df2e1 = lista

seg-54c1f879643b = <c1/>, största poäng först; <c2/> är statistiken delad med tröskeln (larm vid { "1" } eller mer); bara övervakare som kostade poäng listas; <c3/> <em>(tillagd i { "1.3" })</em> är <c4/>, <c5/> eller <c6/>

seg-24d178dfb34f = lista med strängar

seg-30948e769405 = övervakare vid eller över sin tröskel

seg-fb08af60656f = <c1/>, <c2/> eller <c3/>

seg-495aa49df7e2 = varför ingen poäng producerades (till exempel en deklarerad kurssensor som saknas)

seg-3dabfd59cf4b = objekt eller null

seg-9395d2543ac0 = <em>(tillagd i { "1.1" })</em> den position mottagaren rapporterade vid den här epoken, <c1/> (höjden ellipsoidisk där meningen anger geoidseparationen, annars över medelhavsnivån); null när mottagaren inte gav någon, även för kalibreringsepoker utan positionsbestämning

seg-3af4806d7d74 = <em>(tillagd i { "1.2" })</em> vad den här programvaran är och inte är: rådgivande, inte typgodkänd navigationsutrustning, operatören är fortsatt ansvarig

seg-79adcc5ee873 = <em>(tillagd i { "1.3" })</em> satellitgeometrin: <c1/> (<c2/>, <c3/>, <c4/> när strömmen saknar GSV-elevationer och -azimuter och saknar GSA), <c5/> (<c6/>, <c7/>, <c8/>, <c9/>), <c10/> (<c11/>, <c12/>, <c13/>), <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/> (satelliter i sikte men inte spårade medan DOP för det som är i sikte är god: geometriavdraget är då <c26/>), <c27/> (<c28/>, <c29/>, <c30/>, <c31/>: rapporteras alltid, poängsätts aldrig; poängen drar bara av för <c32/>) (se <a1><c33/></a1>)

seg-fc212411bf3c = Övervakarnamn (kebab-case; { "17" }): <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, och från { "1.3" } <c17/>. Nya namn kan läggas till i senare versioner; konsumenter bör behandla ett okänt övervakarnamn som en övervakare. Layouten för <c18/> nedan bär en formatversion i sitt första fält; det här JSON-schemat är version { "1.3" }: { "1.1" } lade till <c19/>, { "1.2" } <c20/>, { "1.3" } <c21/> i slutet och <c22/> i varje avdrag, och det ändras bara genom att nycklar läggs till i slutet.

seg-0019bf7fbfcd = Autentiseringsindata

seg-39b3dfbd97cc = Övervakaren <c1/> tar autentiseringsstatus per satellit från en autentiseringskälla via <c2/> (en lista med <c3/>, status <c4/>, <c5/> eller <c6/>), vid sidan av den övergripande <c7/>. På NMEA-sidan bärs samma sak av <c8/>, till exempel <c9/>. Varje fel, övergripande eller på en satellit, larmar övervakaren och kostar hela dess vikt (den ges kvoten { "1.5" }); framgång är inget belägg. Kshana verifierar ingenting här: källan som gör det ansvarar för den status den rapporterar.

seg-8ffc94901796 = En epok är avslutad när nästa tidsatta mening kommer; meningar från långsammare eller osynkroniserade instrument (en gyro några tiondels sekunder efter mottagaren) som kommer före dess tillhör den. Om strömmen står still i <c1/> (standard { "1.5" } s, sätt det över det längsta glappet mellan din mottagares tidsatta meningar) avslutas epoken som den är. De första <c2/> sekunderna av strömmen utgör baslinjen och poängsätts aldrig, så <b>en ström som redan utsätts för spoofing när den först ansluts har ingen ren baslinje</b>: starta lagret före resan, eller medan positionsbestämningen är känd för att vara god. Kalibreringsfönstret stängs en gång, efter ankomst: en epok vars tid är tidigare än en tid som redan setts (en tillbakaspolning, en återuppspelning av strömmens början) är aldrig kalibrering vad dess tid än säger; den poängsätts med ett fullt avdrag för <c3/>, vilket är opålitligt. Live-motorn poängsätter varje epok över kalibreringsepokerna och den senaste minuten eller så av strömmen, så dess kostnad per epok växer med <c4/> gånger epokfrekvensen; håll fönstret kort på en snabb mottagare. Dess buffertar är begränsade (en störtflod av rader utan tidsatt mening avslutas var { "5,000" }:e rad, kalibrering och historik är begränsade till { "20,000" } epoker).

seg-2ef5aad7c750 = Mottagarens tid jämförs också med den här datorns monotona klocka, vilket bara betyder något för en ström som kommer i realtid. En lagrad logg som matas in i full fart via stdin, TCP eller UDP utlöser den kontrollen av konstruktion: ange <c1/>. (<c2/> utan <c3/> innebär det redan.) En <c4/> läses som en återuppspelning tills den har lästs till slutet, och värdklockan kopplas in från då och framåt, så att en eftersläpning inte läses som ett klockfel; kontrollen kräver då att kalibreringsfönstret fortfarande är öppet (annars har den ingen baslinje och körs inte).

seg-a06e58b2cfc8 = Strömmens slut och fel: stdin och en fil som läses till slutet avslutas normalt (exit { "0" }). En TCP-anslutning som stängs av motparten är inte ett normalt slut för en ström som borde fortsätta: lagret avslutas med en kod som inte är noll efter att ha poängsatt och skrivit allt det tagit emot och ansluter inte igen, så kör det under en övervakare som startar om det. UDP-datagram som delar en mening fogas ihop; läsarna av stdin, en fil och TCP backas upp av en begränsad kö som trycker tillbaka mot avsändaren (ingenting går förlorat), medan UDP, som inte kan trycka tillbaka, släpper datagram som motorn inte kan ta emot och säger det på stderr. <c1/> binder loopback-adressen; ange <c2/> för att lyssna någon annanstans (en varning skrivs ut).

seg-0a0ed5e74ea4 = <c1/>: den proprietära meningen

seg-71ccf4a80c99 = Varje epok producerar också en NMEA { "0183" }-mening, med giltig kontrollsumma, som <c1/> skriver till en fil eller stdout och som grinden sätter in i den vidarebefordrade strömmen:

seg-df9382f4b055 = <c1/>: formatversionen

seg-6986879f86fb = epokens UTC-tid, <c1/>; tom om strömmen inte gav någon

seg-34418696f9d2 = förtroendepoäng { "0" } till { "100" }, en decimal; tom under kalibreringen eller när ingen kunde produceras

seg-0b249ba73868 = band: <c1/> kalibrering, <c2/> nominell, <c3/> degraderad, <c4/> opålitlig

seg-281aba68405a = grind: <c1/> av, <c2/> släppt igenom, <c3/> tillbakahållen (positionsbestämningen markerades som ogiltig i den vidarebefordrade cykeln)

seg-f306c3f54a48 = upp till två skäl, <c1/> sammanfogade med <c2/>; tom när inget drogs av

seg-4bee29dfe578 = Adressen är <c1/> + tillverkarens mnemonik <c2/> + <c3/>. Utrustning som inte känner till en proprietär mening ignorerar den. Kshana ignorerar sin egen <c4/> vid indata.

seg-d75c9da94f37 = Grindläge

seg-30c1f4a5706c = <c1/> placerar Kshana mellan mottagaren och den utrustning som använder dess positionsbestämning (ett sjökortssystem, ett spårstyrningssystem). NMEA-strömmen går in, kommer ut på stdout och är:

seg-aa0692146620 = <b>vidarebefordrad oförändrad</b> så länge epoken inte är opålitlig (och under kalibreringen), med en <c1/> efter varje cykel av meningar; och

seg-bbdd68edbb17 = <b>markerad som ogiltig</b> medan den är opålitlig: GGA-kvalitet <c1/>; RMC-status <c2/> (och dess lägesindikator <c3/> och navigationsstatus <c4/> där de finns); GNS-läge <c5/> i varje position; GLL-status <c6/> och läge <c7/>; VTG-läge <c8/> där det har ett. Positionsfälten lämnas som de var: poängen är att utrustningen ser mottagaren själv deklarera positionsbestämningen som ogiltig och utlöser sitt eget larm. Varje omskriven mening får sin kontrollsumma omräknad.

seg-23ee46747297 = När positionsbestämningen väl hållits tillbaka släpps den först efter att epokerna varit utanför det opålitliga bandet i <c1/> (standard { "30" } s), så att en poäng vid bandgränsen inte kan få positionsbestämningen att flimra. JSON-raderna går bara dit <c2/> anger (som standard ingenstans, eftersom strömmen har stdout).

seg-6b7b557a4909 = För att låta en kartplotter ansluta direkt, servera den grindade strömmen över TCP i stället för stdout:

seg-96ff51df9abe = <c1/> lyssnar på loopback-adressen; <c2/> lyssnar någon annanstans (en varning skrivs ut, eftersom vem som helst som når adressen kan läsa strömmen). Valfritt antal klienter kan ansluta; var och en får samma ström från det ögonblick den ansluter, och klienter läser bara. Varje klient har sin egen begränsade kö och skrivare, så en som inte hänger med släpps (dess anslutning stängs, en rad på stderr) och fördröjer aldrig de andra eller indata. <c3/> kräver <c4/>; stdout bär då ingenting av strömmen, så <c5/> är ledigt.

seg-960e0abb0466 = Vad grinden inte gör, och vad du bör veta innan du använder den:

seg-ee3f18efa84c = Den är <b>opt-in</b>. Ingenting markerar en positionsbestämning som ogiltig om inte <c1/> anges.

seg-9cd8243cb437 = Den <b>ger fördröjning</b>: en cykel hålls tills dess epok är poängsatt, vilket är tiden till nästa tidsatta mening (ungefär en cykel: en sekund för en mottagare på { "1" } Hz), eller <c1/> efter den sista när strömmen står still. Utrustning som behöver en mening inom några tiotal millisekunder från mottagarens utdata får inte sitta bakom den.

seg-ec63f8f3230b = Den är <b>en enda punkt i kedjan</b>: om den stannar stannar strömmen. Kör den övervakad och bestäm i förväg vad den efterföljande utrustningen gör utan en ström.

seg-536e41a6a5e7 = Den <b>stänger säkert vid egna fel</b>: om övervakarna inte kan producera en poäng efter kalibreringen (en deklarerad kurssensor som inte skickar något, för få kalibreringsepoker) är epoken opålitlig, bär en <c1/> och hålls tillbaka; frisläppningshållningen tidsätts efter den här datorns klocka, inte efter mottagarens tid, vilket är vad en spoofer styr (för en återuppspelning finns bara mottagarens tid).

seg-5dd62cd853c6 = Den kan <b>hålla tillbaka en god positionsbestämning</b> (ett falsklarm) och släppa igenom en spoofad (ett missat larm). Övervakarna kontrollerar en positionsbestämning mot ett fartygs fysik och dess andra sensorer; en förfalskning som är konsekvent med alla dem syns inte (se begränsningarna nedan).

seg-a284a3ec9dfe = Den förväntar sig en <b>ren NMEA { "0183" }-textström</b>. Binära ramar som blandats in i strömmen vidarebefordras oförändrade, men en <c1/> kan då hamna mellan byten i en ram.

seg-0c919698fa92 = Den är <b>inte typgodkänd</b> och ingenting i den har bedömts mot IEC { "61108" } eller IEC { "61162" }. Operatören är fortsatt ansvarig för fartygets navigering.

seg-9e3ea39c38cf = <s1>Föregående</s1>Mottagarförtroende

seg-136da5c10b2d = <s1>Nästa</s1>NMEA-träningsströmmar

seg-990a49527516 = $PKSHT: den proprietära meningen
