# docs--maritime-trust: translations (da)

seg-2247a2344710 = Betydning

seg-6940543aa3c0 = streng

seg-abec93a4a488 = streng eller null

seg-f5e7215e6835 = objekt

seg-b993ef559bd0 = Fra kode

seg-c353e7bec219 = Nøgle

seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> eller <c4/>

seg-2896f449bffb = Kilde: <c1/>

seg-342f34403ac5 = Maritim tillid: kan broen stole på denne positionsbestemmelse?

seg-49b609a9655c = <c1/> kan for et <b>skib i bevægelse</b> give en løbende tillidsværdi fra 0 til 100 for hver positionsbestemmelse ud fra det, enhver modtager allerede lægger på bussen (først NMEA { "0183" }), og angive, hvilke kontroller der sænkede den. Det er et softwarelag, der sidder ved siden af en modtager. Det er ikke en modtager, det erstatter ikke en, og det gør ikke en positionsbestemmelse mere nøjagtig.

seg-3c66739c9250 = <b>Vejledende software.</b> Kshana er ikke typegodkendt navigationsudstyr (IEC { "61108" }, IEC { "61162" }) og er ikke vurderet i forhold til nogen ydeevnestandard. Dens score og dens gate er hjælpemidler til navigatørens skøn. Operatøren er fortsat ansvarlig for fartøjets sikre navigation og for enhver beslutning om at stole på en positionsbestemmelse eller holde op med at stole på den.

seg-a9899ca66661 = Denne side siger, hvad kontrollerne ser på, hvad hver af dem kan og ikke kan fange, hvordan den køres live, og hvad gaten gør. Scoreafbildningen og hver standardværdi står i <a1><c1/></a1>.

seg-05e79b6c5a58 = Hvad den læser

seg-e784fdbe26e6 = Et fartøj erklæres i sessionsfilen, med dets grænser angivet før kørslen:

seg-e8e9ee2965cf = Sætning

seg-e127f2f26824 = Læst

seg-5e17bb4156f1 = GGA

seg-b38b8385ddcb = position, kvalitet af positionsbestemmelsen ({ "0" } = ingen positionsbestemmelse), højde over middelvandstand, geoideseparation, HDOP

seg-870056f55c30 = RMC

seg-445c02505551 = status (<c1/> gyldig, <c2/> ikke), fart og kurs over grunden, dato, tilstand

seg-8a259fc7b06d = VTG

seg-eb3e34f58751 = fart og kurs over grunden, hvor RMC ingen har

seg-add66711c27b = HDT, THS

seg-24e36e50b0ad = kurs (THS kun, når dens tilstand ikke er <c1/>)

seg-bcfb4cd59951 = VHW, VBW

seg-fa0a0dae1510 = fart gennem vandet (VBW kun, når dens status er <c1/>)

seg-774d1991fb0b = ZDA

seg-68d981999c72 = tid

seg-a0cc45088f5f = GSV

seg-0fad368a11cb = signalstyrke pr. satellit (dB-Hz), elevation og azimut (til geometrien)

seg-032eafc03b42 = GSA

seg-71334afb8a7d = dilution of precision og anvendte satellitter (til geometrien, hvor GSV ikke giver nogen himmel; og den angivne HDOP, som vagten sammenligner)

seg-305f423d3ead = en OSNMA-status, som en modtager rapporterede, oversat til denne sætning af den adapter, der læser modtageren: <c1/> autentificeret, <c2/> mislykkedes, <c3/> intet resultat

seg-7ce1d69e710e = Epoker, som modtageren selv siger ikke er en satellitpositionsbestemmelse (GGA-kvalitet { "0" } eller { "6" } til { "8" }: estimeret, manuel, simulator; RMC-status <c1/> eller tilstand <c2/>, <c3/>, <c4/>, <c5/>), bruges ikke til positionskontrollerne og er hverken belæg for eller imod: det har modtageren allerede selv sagt.

seg-a0ae80781c6e = De første <c1/> sekunder danner baselinen og scores aldrig. Hver monitor ser kun på den aktuelle og tidligere epoker, så en afgørelse ved en epoke ændrer sig ikke, når senere data ankommer, og en live-strøm giver samme score som den samme tekst læst som en fil.

seg-068593ad0a52 = Hvad hver kontrol fanger, og hvad den ikke kan

seg-094b90f0c701 = Retninger mellem positionsbestemmelser (sporets pejling, som drejningshastighedskontrollen bruger, den kurs, to positioner antyder) er retningen af korden mellem dem, som er geodætens <b>middelazimut</b> mellem positionsbestemmelserne, ikke fremadazimutten ved den første; de to adskiller sig med omkring halvdelen af meridiankonvergensen mellem positionsbestemmelserne ({ "0.001" } grader for en baseline på { "260" } m ved { "59.5" } graders bredde).

seg-ed3cdfcfbff5 = En forfalsket position skal stemme med et skibs fysik og med skibets øvrige sensorer. Hver kontrol sammenligner positionsbestemmelsen med én af dem. En kontrol er kun så uafhængig som sin anden kilde: en kurs fra et GNSS-kompas eller en "fart gennem vandet" udledt af GNSS er ikke uafhængig af den modtager, der testes, og tilføjer intet.

seg-9480aabf136e = Kontrol

seg-20e4f746c7e1 = Fanger

seg-e7b2ebe5eabc = Kan ikke

seg-21ad9895f606 = et positionsspring; et spor, hvis bevægelse den rapporterede fart og kurs ikke forklarer; en antydet fart, acceleration eller drejningshastighed over fartøjets angivne grænser

seg-dcbc6d4cd17f = en bortledning, hvis rapporterede fart og kurs følger det forfalskede spor og holder sig inden for grænserne (modtageren udleder dem af sin egen løsning, så de stemmer med hinanden); en fartgrænse, der er angivet for højt

seg-3542f83a7988 = et spor, der afviger fra den retning, skibet peger, med mere end den angivne krabbevinkel

seg-75f4d659f716 = en bortledning langs kursen (kursen ændrer sig ikke); en kurs fra den samme modtager eller et GNSS-kompas; en sidestrøm over tolerancen (falsk alarm); farter under <c1/>

seg-09dde82be447 = en bortledning, der ændrer farten over grunden i forhold til farten gennem vandet

seg-6ac740e5f51c = et log, der er udledt af GNSS; en strøm over tilladelsen (falsk alarm); en bortledning langsommere end tilladelsen

seg-e85d5f0933b7 = en højde, der ikke er dér, hvor havoverfladen og den angivne antennehøjde placerer den

seg-3806e1d46332 = en spoofer, der holder højden sandsynlig; tolerancen er bred, fordi den lodrette fejl for en enkeltstående modtager er stor; geoideseparationen registreres, men kontrolleres ikke, fordi motoren ikke har nogen geoidemodel

seg-5b70bd80640e = signaturen fra én sender: C/N0 på tværs af satellitterne, der falder sammen eller stiger sammen i forhold til kalibreringens baseline

seg-e6874a8047b1 = en spoofer, der former effekten pr. satellit; alt, mens selve baselinen bliver spoofet; en GSV-kadence, der er for langsom til at følge med

seg-371b17ce936a = modtagerens tid, der springer uregelmæssigt eller løber baglæns; i forhold til denne computers ur, at modtagerens tid driver væk fra det (kun realtidsstrømme)

seg-026479cb7966 = en forfalsket tid, der er konsistent og jævn; et ur, der er forkert fra starten

seg-906ab911b73d = en rapporteret OSNMA-autentifikationsfejl

seg-a04757b7ae57 = statussen læses, ikke verificeres; en spoofer, der undertrykker rapporten, ses ikke

seg-c36c24a337b8 = effektafvisning og tab af satellitter, som i det statiske tilfælde

seg-940b39a3988a = de siger, at omgivelserne er fjendtlige, ikke at positionsbestemmelsen er forkert

seg-9d751e1f5938 = <b>Hvad monitorer, der kun bruger NMEA, ikke kan.</b> En spoofer, der gengiver hele konstellationen med en selvkonsistent position, hastighed, kurs der passer til retningen, sandsynlig effekt pr. satellit og et ur, der passer, er usynlig for hver kontrol ovenfor: intet i sætningerne skelner dens positionsbestemmelse fra en virkelig. Det samme gælder en afspilning af optagede virkelige signaler. Autentifikation (OSNMA eller en modtager med sin egen beskyttelse mod spoofing) og uafhængige navigationssensorer er det, der lukker dette hul; dette lag kan kun bruge deres rapporterede status. En strøm, der allerede bliver spoofet, mens baselinen dannes, har ingen ren baseline. Fravær af en alarm er ikke belæg for en god positionsbestemmelse.

seg-e3e09e2412fb = Tillidsscore

seg-a1c05079de2f = Hver epoke efter kalibrering får en score fra { "0" } til { "100" } og årsagerne til, at den ikke er { "100" }: hvilke kontroller der trak fra, deres statistik i forhold til tærsklen og deres point. Bånd (grænser angivet i sessionen): <c1/> ved { "90" } eller derover, <c2/> ved { "55" } eller derover, <c3/> derunder. Afbildningen, hver vægt og dens begrundelse står i <a1><c4/></a1>; den er deterministisk og fastlagt, før en log scores, uden læring og uden noget, der er tilpasset hændelser.

seg-d56822e82e3d = Hvert fartøjsoutput bærer den vejledende erklæring: nøglen <c1/> i resultat-JSON og i hver live-linje, en første kommentarlinje <c2/> i CSV (læsere springer den over med deres kommentarindstilling), <c3/> og en fodtekst i SVG. Output fra en batchkørsel: <c4/> (med scoremodellen og hver epokes fradrag), <c5/> (med kolonnerne <c6/> og <c7/>) og <c8/>, som for et fartøj er det af modtageren rapporterede spor farvet efter tillidsbånd over scoren over tid.

seg-918516588036 = En syntetisk demo

seg-e6717d346ca6 = <c1/> rummer en opdigtet NMEA-log fra en færge på en rute fra Tallinn til Helsinki (et uddrag på 50 minutter, omkring { "17" } kn, { "1" } Hz: GGA, RMC, VTG, en gyrokurs, et fartlog, GSV med en sandsynlig himmel), hvor en bortledning af positionen fra { "1500" } s trækker den <em>rapporterede</em> position væk fra fartøjets virkelige. Modtageren bliver ved med at rapportere en <b>gyldig</b> positionsbestemmelse hele vejen; det er tillidsscoren, der falder, gennem båndet degraded ned i untrusted. <c2/> angiver hver tærskel, fartøjets grænser og hver scorevægt før kørslen.

seg-b2f24e5091d0 = Loggen er <b>tekst skrevet til en fil</b> af <c1/>: den modellerer intet radiosignal og sender intet. Den er ikke en måling, og ruten er illustrativ, ikke et søkort. <c2/> fastholder loggen og det forventede output som regressionsvagter på de syntetiske data; de siger intet om, hvordan en monitor klarer sig over for virkelig interferens.

seg-26ab8544afba = Tillidsscore over én syntetisk passage, fra en virkelig kørsel af motoren v{ $version } på examples/maritime-trust (en opdigtet NMEA-log fra en færge på en rute fra Tallinn til Helsinki, { "3001" } epoker ved { "1" } Hz). Tre baner deler én tidsakse. Øverst: afstanden mellem den position, modtageren rapporterer, og fartøjets virkelige position, som holder sig inden for nogle få meter indtil omkring { "1576" } s, hvor logens indskrevne bortledning af positionen trækker den væk, mens modtageren bliver ved med at rapportere en gyldig positionsbestemmelse. I midten: tillidsscoren fra { "0" } til { "100" }, ikke beregnet i de første { "300" } s af kalibreringen, i båndet nominal (mindst { "90" }) indtil bortledningen, derefter faldende gennem båndet degraded (mindst { "55" }) ned i båndet untrusted. Nederst: hver epokes bånd som et farvet bånd med sit navn. Scoren er vejledende. Vejledende software, ikke typegodkendt navigationsudstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsat ansvarlig for fartøjets navigation. Loggen er opdigtet for at vise formatet og monitorerne; den er ikke en måling og siger intet om, hvordan nogen modtager ville yde.

seg-ed183c325c7e = Figuren tegnes af <c1/> ud fra en virkelig kørsel af denne demo (<c2/>); scoren er vejledende, og loggen er opdigtet.

seg-8badaf0d8586 = Specifikation af Studio-visningen

seg-588092535a89 = Til den, der bygger Studio-visningen af en fartøjskørsel. Intet i dette afsnit er endnu implementeret i Studio; motorsiden (dataene nedenfor) er.

seg-5c34f31acf1d = <b>Input.</b> Et af følgende:

seg-57ca6d9000b1 = en batchkørsels resultat-JSON (<c1/>, eller det samme gennem <c2/> i WebAssembly-pakken med loggen direkte i teksten): <c3/> (båndgrænser, rampe, evidenshold, hver vægt), <c4/>, <c5/> og <c6/>, hver med <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, og fra { "0.36" } <c12/> og hvert fradrags <c13/>, med <c14/> og <c15/> på øverste niveau; eller

seg-bfab64386b6c = de levende JSON-linjer (skemaet ovenfor), ét objekt pr. epoke, tilføjet, mens strømmen kører. Hver linje bærer den af modtageren rapporterede <c1/> (skema { "1.1" }).

seg-f7c7462d315e = Demosættet er <c1/>: <c2/>, <c3/> (loggen) og <c4/> (<c5/>: hvor fartøjet virkelig var, hvilket ingen virkelig log har). En visning bør køre sessionen og læse referencefilen ved siden af.

seg-c015c26cf30a = Hvad der skal tegnes.

seg-92f452bdbed6 = <em>Spor</em>, nord opad, én skala på begge akser: de af modtageren rapporterede positioner som en linje farvet efter epokens bånd (grå kalibrerer, grøn nominal, rav degraded, rød untrusted), start og slut markeret, en målestok. For demoen det sande spor som en tynd neutral linje under det, så bortledningen vises som de to, der skilles; en kontakt til det sande spor og en aflæsning af forskydningen i meter ved markørens tidspunkt.

seg-3ba328e2188c = <em>Scoretidslinje</em>: scoren fra { "0" } til { "100" } mod tid, båndgrænserne (<c1/>, <c2/> fra <c3/>) som stiplede linjer, båndet som en strimmel nedenunder og starten på en angivet hændelse som en markør. Tidsaksen deles med sporet.

seg-33447da1d56d = <em>Årsager</em>: for den epoke, markøren står på, fradragene (monitor, forhold i forhold til tærskel, point) som vandrette søjler, den største først, med den vægt, hver monitor har fra <c1/>; monitorer, der kørte og ikke kostede noget, vist svagt, monitorer, der ikke kørte (ikke i <c2/>), opført som "not run", aldrig som bestået. Monitoren <c3/> har ingen post i <c4/>: dens loft er <c5/>.

seg-d0379b68ea67 = <em>Monitorstrimler</em>: én tynd strimmel pr. monitor i <c1/>, der viser dens forhold over tid (alarm ved { "1" }), så en læser kan se, hvilken kontrol der bevægede sig først.

seg-83d881ce6ab0 = <em>Gate-tilstand</em>: i en live-visning hver epokes <c1/> (<c2/>, <c3/>, <c4/>) som en strimmel under bånd-strimlen og den seneste <c5/>. I en batchvisning er de epoker, en gate ville have holdt tilbage, dem, hvis bånd er untrusted, med frigivelsesholdet anvendt.

seg-b96652af3a03 = <em>Geometribane</em> ({ "0.36" }): en strimmel under bånd-strimlen farvet efter <c1/> (grøn god, rav degraded, grå skraveret ukendt), i en farvefamilie, der er forskellig fra banerne for inkonsistens og omgivelser, med forklaringen "geometry: the sky, not the signal". Fradrag farvet efter <c2/> (geometri, omgivelser, inkonsistens) i årsagspanelet og monitorstrimlerne og antallet af epoker pr. klasse fra <c3/> ved siden af båndantallene. For den epoke, markøren står på: <c4/>, <c5/>, HDOP, PDOP, VDOP, <c6/>, <c7/> og et flag, når <c8/> er sat (geometrifradraget er så en inkonsistens). <c9/> vises som "geometry unknown: no GSV or GSA in the log", aldrig som god. Tærsklerne i <c10/> og deres proveniens fra <c11/> placeres ved siden af scoreindstillingerne. Den vejledende note bliver.

seg-c48906d03f90 = <em>Af modtageren rapporteret positionsbestemmelse</em>: demoens modtager rapporterer en gyldig positionsbestemmelse hele vejen (GGA-kvalitet { "1" }, RMC-status A); sig det i forklaringen, for det er pointen med visningen.

seg-869c8a92e2cf = <b>Interaktioner.</b> Én tidsmarkør delt af hvert panel (træk, piletaster og en afspilningsknap, der afspiller ved 1x til 60x); at holde musen over sporet eller en strimmel flytter den. Et klik på et fradrag fremhæver de epoker, hvor den monitor var over sin start. Et båndfilter (vis kun epoker med degraded og untrusted) og et spring til det første fradrag og til den første untrusted epoke. Hjælpetekst ved hvert monitornavn med enlinjebeskrivelsen fra denne side. Sessionens tærskler og vægte vises, skrivebeskyttede, ved siden af diagrammet, så det, scoren brugte, er på skærmen.

seg-1f97fe8ea2f1 = <b>Ordlyd, der skal bevares.</b> Siden skal sige, at det er vejledende software og ikke typegodkendt navigationsudstyr, at demoen er syntetisk tekst med en opdigtet bortledning, og at en positionsbestemmelse uden alarm ikke dermed er en god positionsbestemmelse (se begrænsningerne ovenfor). Intet tal på siden må læses som et mål for, hvordan kontrollerne klarer sig over for virkelig interferens.

seg-079ce44fd53e = Til kaldere, der har sessionen og bytes i hukommelsen (ingen filer, intet ur, ingen sockets; sikkert for WebAssembly), har <c1/>:

seg-e8c3172d72b8 = <c1/>: en hel log, scoret som en batchkørsel; det samme resultat som <c2/>, som serialiseres til resultat-JSON (<c3/>, <c4/>, <c5/> med scorer og fradrag).

seg-0302b7c35fd3 = <c1/>: et afgrænset stykke af en strøm (højst { "2" } MiB og { "20,000" } epoker, og langt nok til at rumme kalibreringsvinduet), scoret, som live-tilstand scorer, og returneret i live-JSON-linjeskemaet (<c2/>, den sidste <c3/>, et resumé af båndantal, laveste og endelige score, første untrusted tidspunkt). Modtagerens tid sammenlignes ikke med et værtsur. Den langvarige live-tilstand (sockets, en fil, der tilføjes til, gaten) hører til den binære fil.

seg-d971dae93784 = Begge kræver en session med <c1/>; dens tabel <c2/> er valgfri.

seg-870fece8026e = Kør den live

seg-c132d449414f = Sessionen er den samme <c1/> som i en batchkørsel, med en tabel <c2/>, der erklærer <c3/>; dens tabel <c4/> er ikke nødvendig. Serielle porte åbnes endnu ikke direkte: læs porten med det værktøj, du allerede bruger (<c5/> og <c6/>, en terminalserver, en multiplexer), og send den videre med pipe eller videresendelse. Direkte serielt input kan komme senere.

seg-13a043c1ce60 = Hver afsluttet epoke skriver én JSON-linje på standardoutput:

seg-b1f0c563c94d = <c1/> er <c2/>, <c3/>, <c4/> eller <c5/> (scorens bånd, med grænserne i sessionens tabel <c6/>); <c7/> er fraværende under kalibrering; <c8/> angiver, hvilke kontroller der tog point af, og hvor mange, den største først.

seg-9b21238a7dc1 = JSON-linjeskema (version { "1.1" })

seg-79306ff2d878 = Ét JSON-objekt pr. afsluttet epoke, nøgler i denne rækkefølge:

seg-a129b9e613d0 = Type

seg-bbcdd898d24d = heltal

seg-96958263575f = antal rapporterede epoker, fra { "1" }

seg-16022703e1c0 = tal

seg-95dde7698840 = sekunder siden strømmens første epoke

seg-dee4f7b91079 = epokens tid, som strømmen angiver den (ISO-8601 UTC med en dato, når en RMC er set, ellers <c1/>)

seg-0361f40a8e59 = tal eller null

seg-c2418289d966 = { "0" } til { "100" }, ét decimal; null under kalibrering, eller når <c1/> forklarer, hvorfor ingen kunne beregnes

seg-00575e5df2e1 = array

seg-54c1f879643b = <c1/>, flest point først; <c2/> er statistik i forhold til tærskel (alarm ved { "1" } eller mere); kun monitorer, der kostede point, er opført; <c3/> <em>(tilføjet i { "1.3" })</em> er <c4/>, <c5/> eller <c6/>

seg-24d178dfb34f = array af streng

seg-30948e769405 = monitorer ved eller over deres tærskel

seg-fb08af60656f = <c1/>, <c2/> eller <c3/>

seg-495aa49df7e2 = hvorfor ingen score blev beregnet (for eksempel en erklæret kurssensor, der er fraværende)

seg-3dabfd59cf4b = objekt eller null

seg-9395d2543ac0 = <em>(tilføjet i { "1.1" })</em> den position, modtageren rapporterede ved denne epoke, <c1/> (højde ellipsoidisk, hvor sætningen angiver geoideseparationen, ellers over middelvandstand); null, når modtageren ingen gav, herunder kalibreringsepoker uden positionsbestemmelse

seg-3af4806d7d74 = <em>(tilføjet i { "1.2" })</em> hvad denne software er og ikke er: vejledende, ikke typegodkendt navigationsudstyr, operatøren er fortsat ansvarlig

seg-79adcc5ee873 = <em>(tilføjet i { "1.3" })</em> satellitgeometrien: <c1/> (<c2/>, <c3/>, <c4/>, når strømmen ingen GSV-elevationer og -azimutter og ingen GSA har), <c5/> (<c6/>, <c7/>, <c8/>, <c9/>), <c10/> (<c11/>, <c12/>, <c13/>), <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/> (satellitter i sigte, men ikke sporet, mens DOP i sigte er god: geometrifradraget er så <c26/>), <c27/> (<c28/>, <c29/>, <c30/>, <c31/>: rapporteres altid, scores aldrig; scoren trækker kun fra for <c32/>) (se <a1><c33/></a1>)

seg-fc212411bf3c = Monitornavne (kebab-case; { "17" }): <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/> og fra { "1.3" } <c17/>. Nye navne kan tilføjes i senere versioner; forbrugere bør behandle et ukendt monitornavn som en monitor. Layoutet <c18/> nedenfor bærer en formatversion i sit første felt; dette JSON-skema er version { "1.3" }: { "1.1" } tilføjede <c19/>, { "1.2" } <c20/>, { "1.3" } <c21/> til sidst og <c22/> i hvert fradrag, og det ændres kun ved at tilføje nøgler til sidst.

seg-0019bf7fbfcd = Autentifikationsinput

seg-39b3dfbd97cc = Monitoren <c1/> tager autentifikationsstatus pr. satellit fra en autentifikationskilde gennem <c2/> (en liste af <c3/>, status <c4/>, <c5/> eller <c6/>), ved siden af den samlede <c7/>. På NMEA-siden bæres det samme af <c8/>, for eksempel <c9/>. Enhver fejl, samlet eller på én satellit, udløser monitorens alarm og koster hele dens vægt (den får forholdet { "1.5" }); succes er ikke belæg. Kshana verificerer intet her: den kilde, der gør, er ansvarlig for den status, den rapporterer.

seg-8ffc94901796 = En epoke er afsluttet, når den næste tidsstemplede sætning ankommer; sætninger fra langsommere eller usynkroniserede instrumenter (en gyro nogle tiendedele af et sekund efter modtageren), der ankommer før da, hører til den. Hvis strømmen går i stå i <c1/> (standard { "1.5" } s, sæt den over det længste mellemrum mellem din modtagers tidsstemplede sætninger), afsluttes epoken, som den står. De første <c2/> sekunder af strømmen danner baselinen og scores aldrig, så <b>en strøm, der allerede bliver spoofet, når den første gang forbindes, har ingen ren baseline</b>: start laget før rejsen eller mens positionsbestemmelsen vides at være god. Kalibreringsvinduet lukker én gang, efter ankomst: en epoke, hvis tid er tidligere end en tid, der allerede er set (en tilbagespoling, en genafspilning af strømmens start), er aldrig kalibrering, uanset hvad dens tid siger; den scores med et fuldt fradrag for <c3/>, hvilket er untrusted. Live-motoren scorer hver epoke over kalibreringsepokerne og det sidste minut eller deromkring af strømmen, så dens omkostning pr. epoke vokser med <c4/> gange epokeraten; hold vinduet kort på en hurtig modtager. Dens buffere er afgrænsede (en strøm af linjer uden en tidsstemplet sætning afsluttes for hver { "5,000" } linjer, kalibrering og historik er begrænset til { "20,000" } epoker).

seg-2ef5aad7c750 = Modtagerens tid sammenlignes også med denne computers monotone ur, hvilket kun betyder noget for en strøm, der ankommer i realtid. En gemt log, der fødes ind i fuld hastighed gennem stdin, TCP eller UDP, udløser pr. konstruktion den kontrol: angiv <c1/>. (<c2/> uden <c3/> indebærer det allerede.) En <c4/> læses som en genafspilning, indtil den er læst til ende, og værtsuret er koblet til derfra, så en bagkant ikke læses som en urfejl; kontrollen kræver så, at kalibreringsvinduet stadig er åbent (ellers har den ingen baseline og kører ikke).

seg-a06e58b2cfc8 = Strømafslutning og fejl: stdin og en fil, læst til ende, afsluttes normalt (exit { "0" }). En TCP-forbindelse, der lukkes af modparten, er ikke en normal afslutning for en strøm, der skal fortsætte: laget afsluttes med en værdi forskellig fra nul, efter at det har scoret og skrevet alt, det havde modtaget, og forbinder ikke igen, så kør det under en supervisor, der genstarter det. UDP-datagrammer, der deler en sætning, samles; læserne af stdin, en fil og TCP understøttes af en afgrænset kø, der skubber tilbage mod afsenderen (intet går tabt), mens UDP, som ikke kan skubbe tilbage, dropper datagrammer, som motoren ikke kan tage imod, og siger det på stderr. <c1/> binder loopback-adressen; angiv <c2/> for at lytte et andet sted (der udskrives en advarsel).

seg-0a0ed5e74ea4 = <c1/>: den proprietære sætning

seg-71ccf4a80c99 = Hver epoke producerer også én NMEA { "0183" }-sætning med en gyldig kontrolsum, som <c1/> skriver til en fil eller stdout, og som gaten indsætter i den videresendte strøm:

seg-df9382f4b055 = <c1/>: formatversionen

seg-6986879f86fb = UTC-tid for epoken, <c1/>; tom, hvis strømmen ikke gav nogen

seg-34418696f9d2 = tillidsscore { "0" } til { "100" }, ét decimal; tom under kalibrering, eller når ingen kunne beregnes

seg-0b249ba73868 = bånd: <c1/> kalibrerer, <c2/> nominal, <c3/> degraded, <c4/> untrusted

seg-281aba68405a = gate: <c1/> fra, <c2/> passeret, <c3/> holdt tilbage (positionsbestemmelsen blev markeret som ugyldig i den videresendte cyklus)

seg-f306c3f54a48 = op til to årsager, <c1/> forbundet med <c2/>; tom, når intet blev trukket fra

seg-4bee29dfe578 = Adressen er <c1/> + producentens mnemonik <c2/> + <c3/>. Udstyr, der ikke kender en proprietær sætning, ignorerer den. Kshana ignorerer sin egen <c4/> ved input.

seg-d75c9da94f37 = Gate-tilstand

seg-30c1f4a5706c = <c1/> placerer Kshana mellem modtageren og det udstyr, der bruger dens positionsbestemmelse (et kortsystem, et sporstyringssystem). NMEA-strømmen går ind, kommer ud på stdout og er:

seg-aa0692146620 = <b>sendt uændret igennem</b>, mens epoken ikke er untrusted (og under kalibrering), med en <c1/> efter hver cyklus af sætninger; og

seg-bbdd68edbb17 = <b>markeret som ugyldig</b>, mens den er untrusted: GGA-kvalitet <c1/>; RMC-status <c2/> (og dens tilstandsindikator <c3/> og navigationsstatus <c4/>, hvor de findes); GNS-tilstand <c5/> i hver position; GLL-status <c6/> og tilstand <c7/>; VTG-tilstand <c8/>, hvor den har en. Positionsfelterne er uændret, som de var: pointen er, at udstyret ser modtageren selv erklære positionsbestemmelsen for ugyldig og udløser sin egen alarm. Hver omskrevet sætning får sin kontrolsum genberegnet.

seg-23ee46747297 = Når positionsbestemmelsen først er holdt tilbage, frigives den først, efter at epokerne har været uden for båndet untrusted i <c1/> (standard { "30" } s), så en score ved båndgrænsen ikke kan få positionsbestemmelsen til at flimre. JSON-linjerne går kun dertil, hvor <c2/> angiver (som standard ingen steder, fordi strømmen har stdout).

seg-6b7b557a4909 = For at lade en kortplotter forbinde direkte skal den gatede strøm leveres over TCP i stedet for stdout:

seg-96ff51df9abe = <c1/> lytter på loopback-adressen; <c2/> lytter et andet sted (der udskrives en advarsel, fordi enhver, der kan nå adressen, kan læse strømmen). Et vilkårligt antal klienter kan forbinde; hver får den samme strøm fra det øjeblik, den forbinder, og klienter læser kun. Hver klient har sin egen afgrænsede kø og skriver, så en, der ikke kan følge med, droppes (dens forbindelse lukkes, en linje på stderr) og forsinker aldrig de øvrige eller inputtet. <c3/> kræver <c4/>; stdout bærer så intet af strømmen, så <c5/> er ledig.

seg-960e0abb0466 = Hvad gaten ikke gør, og hvad man bør vide, før man bruger den:

seg-ee3f18efa84c = Den er <b>til valg</b>. Intet markerer en positionsbestemmelse som ugyldig, medmindre <c1/> er angivet.

seg-9cd8243cb437 = Den <b>tilføjer latenstid</b>: en cyklus holdes, indtil dens epoke er scoret, hvilket er tiden til den næste tidsstemplede sætning (omkring én cyklus: et sekund for en modtager på { "1" } Hz), eller <c1/> efter den sidste, når strømmen går i stå. Udstyr, der har brug for en sætning inden for nogle få tiendedele af et sekund efter modtagerens output, må ikke sidde bag den.

seg-ec63f8f3230b = Den er <b>et enkelt punkt i kæden</b>: hvis den stopper, stopper strømmen. Kør den under supervision, og beslut på forhånd, hvad det efterfølgende udstyr gør uden en strøm.

seg-536e41a6a5e7 = Den <b>fejler lukket ved sine egne fejl</b>: hvis monitorerne ikke kan beregne en score efter kalibrering (en erklæret kurssensor, der intet sender, for få kalibreringsepoker), er epoken untrusted, bærer en <c1/> og holdes tilbage; frigivelsesholdet tidsmåles på denne computers ur, ikke på modtagerens tid, som er det, en spoofer styrer (ved en genafspilning findes kun modtagerens tid).

seg-5dd62cd853c6 = Den kan <b>tilbageholde en god positionsbestemmelse</b> (en falsk alarm) og lade en spoofet slippe igennem (en misset). Monitorerne kontrollerer en positionsbestemmelse mod et skibs fysik og dets øvrige sensorer; en forfalskning, der stemmer med dem alle, bliver ikke opdaget (se begrænsningerne nedenfor).

seg-a284a3ec9dfe = Den forventer en <b>ren NMEA { "0183" }-tekststrøm</b>. Binære frames, der er blandet ind i strømmen, videresendes uændret, men en <c1/> kan så havne mellem bytes i en frame.

seg-0c919698fa92 = Den er <b>ikke typegodkendt</b>, og intet i den er vurderet mod IEC { "61108" } eller IEC { "61162" }. Operatøren er fortsat ansvarlig for fartøjets navigation.

seg-9e3ea39c38cf = <s1>Forrige</s1>Modtagertillid

seg-136da5c10b2d = <s1>Næste</s1>NMEA-træningsstrømme

seg-990a49527516 = $PKSHT: den proprietære sætning
