# docs--interop: translations (da)

seg-f917e7fcac09 = Hvad det er

seg-cae10fb9bff8 = Scenarie

seg-f2ce7fc60cdf = Format

seg-8c718f7f9f5d = SigMF

seg-507b8c235614 = CZML

seg-bf09433a7342 = GeoJSON

seg-9c92e0bc42aa = KML

seg-b03d56f501c3 = Type

seg-357c2320b43a = ja

seg-c8c964a11462 = Kilde: <c1/>

seg-881ec6f8fbe0 = En kørsel skriver et resultatdokument, et diagram og en rapport. <c1/> skriver også scenariets geometri eller dets syntetiserede signal i de formater, som andre værktøjer allerede læser: en globeviser, et skrivebordskort, et geografisk informationssystem (GIS), en pakke til missionsanalyse eller et værktøj til softwaredefineret radio (SDR). Intet her læser et ur eller netværket, og ingen eksport bærer et genereringstidsstempel, så det samme scenarie giver byte-identiske filer ved hver kørsel.

seg-736f2dc67a3c = Filerne skrives ved siden af scenariet og navngives som resultatdokumentet: <c1/>, <c2/>, <c3/>, én <c4/> pr. bevægeligt objekt (eller <c5/>, når der er ét) og parret <c6/> / <c7/>. Med <c8/> får de undersøgelsens navn i stedet, som de andre output.

seg-21d3fba059d5 = Et format, der er navngivet eksplicit og ikke gælder for scenariet, er en fejl, der udskriver begrundelsen; under <c1/> udskrives begrundelsen, og formatet springes over. Bibliotekets indgangspunkter er <c2/>, <c3/> og <c4/>; de tager scenarieteksten og returnerer bytes, uden at røre nogen fil, så de også kører i WebAssembly-builden. Serveren for Model Context Protocol (MCP) udstiller de samme tre som værktøjerne <c5/>, <c6/> og <c7/> (se <c8/>).

seg-77200201db88 = Kode: <c1/> (<c2/> bygger én geometrisk beskrivelse af scenariet, <c3/>, <c4/>, <c5/> og <c6/> skriver den), <c7/> og <c8/> til signalet. Tests: <c9/>.

seg-f13ab6bb2e47 = Formater

seg-fc52229b569c = Specifikation, der følges

seg-3f237c8956eb = Cesium Language: en JSON-array (JavaScript Object Notation) af tidsmærkede pakker, læst af CesiumJS

seg-234fa6710fb9 = Keyhole Markup Language { "2.2" }, en standard fra Open Geospatial Consortium (OGC), læst af Google Earth og de fleste GIS-værktøjer; tidsmærkede spor bruger Googles udvidelse <c1/>

seg-ef08da440ce5 = <a1>https://www.ogc.org/standards/kml/</a1> (skemaets navneområde <c1/>; udvidelsens navneområde <c2/>)

seg-4cfac7667dbc = geografisk JSON, Internet Engineering Task Force (IETF) Request for Comments (RFC) { "7946" }

seg-de0feb450ae1 = STK <c1/>

seg-96173e7b4238 = efemeridefilen fra Ansys Systems Tool Kit (STK), i formen tid-position-hastighed <c1/>

seg-a2284e8c0034 = Signal Metadata Format: en JSON-metadatafil og en rå fil med komplekse in-phase- og kvadratur-sampler (IQ)

seg-b38ee3ebd012 = Hvad hver fil indeholder

seg-7d873bc11593 = Hvert geospatialt format skrives ud fra den samme scene, så de ikke kan være uenige om, hvor noget er. En scene har op til fire slags objekter:

seg-1fc686f6a7ea = <b>Bevægelige objekter</b> — satellitter og en brugerplatform, når den bevæger sig — samplet på scenariets eget tidsgitter med de propagatorer, som typens kørsel bruger.

seg-3db28cb6adc5 = <b>Faste steder</b> — en modtager, en jordstation, en jammer eller oprindelsen af et lokalt navigationssystem.

seg-0def04909935 = <b>Spor uden tid</b> — de waypoints, som en alternativ type til positionering, navigation og tidssynkronisering (PNT) baseret på terræn, tyngdekraft eller en kombination flyver. Disse typer har ingen tidsakse, så sporene bærer ingen.

seg-e14d49ae7330 = <b>Jammerens fodaftryk</b> — for typen <c1/> to cirkler om jammeren: den jordafstand, inden for hvilken en satellit i zenit (den stærkeste) falder under sporingstærsklen, så alle satellitter går tabt, og den afstand, inden for hvilken en satellit ved elevationsmasken (den svageste) gør det, så sporingen begynder at svigte. Begge kommer fra typens egne linkligninger (Kaplan og Hegarty, <em>Understanding GPS/GNSS</em> (Global Positioning System / Global Navigation Satellite Systems), 3. udg., §{ "9.4" }) med jammeren ved modtagerens horisont og tab i frit rum, og testsuiten kontrollerer, at det effektive forhold mellem bærebølge og støjtæthed ved hver radius er lig med tærsklen med { "1e-6" } dB. Cirklen tegnes på en kugle med jordens middelradius.

seg-e1dd97c47993 = Den første pakke er dokumentpakken (<c1/>, <c2/>) med et ur, der spænder over tidsgitteret. Hvert bevægeligt objekt er en pakke, hvis <c3/> har en ISO { "8601" } (International Organization for Standardization-format for dato og tid) UTC (Coordinated Universal Time) <c4/>, <c5/> <c6/> og <c7/> samples <c8/>: sekunder efter epoken, meter i Geocentric Celestial Reference System (GCRS). CesiumJS tager <c9/> som International Celestial Reference Frame (ICRF), hvis akser GCRS deler. Faste steder og fodaftrykkenes centre er konstante jordfaste <c10/> positioner med <c11/> <c12/>. Et fodaftryk er en <c13/> med begge halvakser lig med dets radius; et spor uden tid er en jordfastholdt <c14/>. Hver pakkes <c15/> angiver referencesystemet igen i ord.

seg-be6362f4c7e7 = Ét <c1/> med en <c2/> pr. objektklasse. Et bevægeligt objekt er en <c3/>, der rummer en <c4/>: én <c5/> pr. sample (ISO { "8601" } UTC), derefter én <c6/> pr. sample (længde, bredde, højde). Steder er <c7/>, fodaftryk <c8/>, hvis ring er lukket og mod uret, spor uden tid <c9/>. Koordinater er World Geodetic System { "1984" } (WGS { "84" }) længde og bredde i decimalgrader og højde i meter over WGS { "84" }-ellipsoiden, skrevet med <c10/> <c11/>. KML læser <c12/> som højde over middelvandstand; forskellen, geoidens undulation, er inden for ca. ±{ "110" } m og anvendes ikke. Dokumentets beskrivelse siger det.

seg-37dc14626a6c = Ét <c1/>. Positioner er <c2/> eller <c3/> — længde først, som RFC { "7946" } kræver — i WGS { "84" }-grader, med højde i meter over ellipsoiden. Et bevægeligt objekt er en <c4/> med en egenskab <c5/>, der rummer ét ISO { "8601" }-tidspunkt pr. position; et spor, der krydser meridianen { "180" }°, skrives som en <c6/>, delt dér, som RFC { "7946" } §{ "3.1.9" } kræver (krydsningspunktet interpoleres, og <c7/> viser så kun de oprindelige samples). Steder er <c8/>, fodaftryk <c9/> med en lukket ydre ring mod uret (§{ "3.1.6" }), spor uden tid <c10/>. Hvert feature har en egenskab <c11/>, der angiver enheden for hvert numerisk medlem.

seg-ea28a2bd431c = Én fil pr. bevægeligt objekt, da en STK-efemeride beskriver ét køretøj. Headeren angiver <c1/> (lig med antallet af datarækker), <c2/> (UTC, <c3/>), <c4/> med <c5/>, <c6/>, <c7/> og <c8/>; rækkerne under <c9/> er sekunder efter epoken, position i meter og hastighed i meter pr. sekund, i GCRS. En scene med kun faste steder eller spor uden tid skriver ingen fil <c10/>: et fast punkt er en STK Facility, ikke en efemeride. Et id, der ikke er en almindelig del af et filnavn (en konstellationsskal og en satellit, <c11/>), skrives med alle andre tegn som <c12/>, nummereret, hvis to id'er så falder sammen.

seg-52a78be5db9f = Typen <c1/> og typen <c2/> (gennem dens trin <c3/>) eksporterer hver satellit i lav jordbane (LEO) og brugeren ud fra typens egne propagatorer og tidsgitter. Typen arbejder i ECI0, det jordcentrerede inertialsystem, der ved epoken er på linje med det jordfaste system; hver sample omsættes til det jordfaste system på sit eget tidspunkt med typens jordrotation og derfra til GCRS gennem systemet true equator, mean equinox (TEME), som propagatoren Simplified General Perturbations { "4" } (SGP4) leverer sit output i, på det tidspunkt, med UT1 (Universal Time, jordens rotationsvinkel) sat lig med UTC og polbevægelse forsømt, som for de andre eksporter. De andre LEO-typer angiver, hvorfor et format ikke gælder (tabellen nedenfor).

seg-b134baf33fba = En <c1/> eksporterer hvert medlemsscenarie, der har geometri, som sit eget filsæt, med medlemmets etiket indsat før formatsuffikset: hver fasekørsel (<c2/>, eller <c3/>, når fasen har flere kørsler), sweepets basisscenarie (<c4/>), Monte Carlo-scenariet (<c5/>) og hvert sammensat medlem (dets etiket, med de delte værdier, det binder, skrevet ind). <c6/> skriver <c7/> og <c8/>. Et medlem, der er identisk med et tidligere, skrives én gang, og værdier, som en kampagne anvender under kørslen (overdragelser, sweepværdier, seeds), er ikke i det eksporterede medlem. Et format gælder for en kampagne, når det gælder for et medlem; ellers er begrundelsen note { "4" } i tabellen nedenfor. Se <a1>CAMPAIGNS.md</a1>.

seg-6579b6941d10 = Typen <c1/> og dens snapshot <c2/> — det modellerede L-bånd tegnet som komplekse samples på ét tidspunkt — som et par <c3/> / <c4/>, i den datatype, <c5/> angiver (<c6/> eller <c7/>). Det er den samme optagelse, som kørslen skriver og læser tilbage til sin egen konsistenskontrol: de eksporterede metadata er lig med blokken <c8/> i resultatdokumentet, og datafilen har længden <c9/>. Skribenten er <c10/>, modulet som typen <c11/> allerede brugte; intet er duplikeret.

seg-6e7c5f0e34f3 = Referencesystemer og tid

seg-01d1bedb0595 = Motoren propagerer i TEME (true equator, mean equinox of date), sit oprindelige system. Bevægelige objekter drejes til GCRS med reduktionen <c1/> (IAU { "2006" }-præcession og IAU 2000B-nutation, hvor IAU er Den Internationale Astronomiske Union), som gengiver Vallados publicerede eksempel på TEME til GCRF (Geocentric Celestial Reference Frame) med { "0.11" } m, for CZML og STK, og til det jordfaste system med <c2/> for KML og GeoJSON. Den jordfaste rotation er Greenwichs gennemsnitlige siderale vinkel med UT1 sat lig med UTC og uden polbevægelse — den samme reduktion, som eksporten til SP3 (Standard Product { "3" }) bruger. Ved en GPS-banes radius flytter den forsømte UT1−UTC på op til { "0.9" } s en satellits længde med op til ca. { "1.7" } km; jordstationer påvirkes ikke, da de er givet i bredde og længde.

seg-4eaa7b3e6946 = Typen <c1/> er undtagelsen: dens motoroutput bærer allerede GCRS- og jordfaste positioner (med scenariets UT1−UTC og polbevægelse eller en rigtig serie fra International Earth Rotation and Reference Systems Service (IERS)), og de skrives uændret.

seg-2299da743a4c = Alle tider er UTC. Skudsekunder er ikke modelleret: en forskydning henover et skudsekund tælles, som om hver dag havde { "86 400" } s, som motorens tidsgitre tæller.

seg-4f7a0b8b4358 = Epoken for <c1/> er den, som typens kørsel bruger, og hver fil navngiver den: typens <c2/> <c3/>; når den mangler, den tidligste epoke, satellitternes egne data bærer (en epoke for et two-line element set (TLE), et udsendt efemerides referencetid, starten på en SP3-fil), og 2000-01-01T00:{ "00" }:00Z kun når ingen satellit bærer en (Kepler-elementer). Eksporterne til SP3 og OEM (Orbit Ephemeris Message) beholder 2000-01-01T00:{ "00" }:00Z for et scenarie uden <c4/>, så for et sådant scenarie afviger deres datoer fra disse filers. Uden scenarie-<c5/> drejes hver satellit, der bærer sin egen epoke, ind i GCRS og de jordfaste systemer på sit eget tidspunkt (dens epoke plus <c6/>), da det er den dato, dens TEME-position hører til; hvor satellitternes epoker er forskellige, følger de fælles tidsmærker motorens forudsætning om, at hver satellit starter ved <c7/>, og filen angiver, med hvor mange timer de afviger. SGP4-elementepoken for Walker-konstellationerne i typerne <c8/> og <c9/> (2018-06-12T00:{ "00" }:00Z), som deres kørsler også bruger til jordrotationen; typens <c10/> <c11/>; typens <c12/> <c13/> eller TLE-epoke. Typen <c14/> har ingen kalenderepoke; dens eksport dateres <c15/> som for et banescenarie uden en.

seg-ee8eeb47f41b = Satellitter beholder de positionelle identifikatorer <c1/>, <c2/>, ... som eksporterne til SP3 og OEM giver dem, fordi propagatorerne ikke bærer TLE'ens navnelinjer.

seg-0491624c5f12 = Importer

seg-798f3ae1b77d = GeoJSON-rute.

seg-2a04d7d4bafc = <c1/> (bibliotek: <c2/>) læser den første <c3/> i et GeoJSON-dokument — en ren geometri, et <c4/> eller en <c5/> — og skriver den ind i sporinputtene for <c6/>, <c7/>, <c8/> og <c9/> (<c10/>, <c11/>, <c12/>, <c13/>, <c14/>) før kørslen. Disse typer flyver <c15/>, så en rute accepteres, når den er netop det: dens to ender (scenariets antal <c16/> bevares) eller tre eller flere positioner jævnt fordelt på en ret linje i bredde og længde, inden for { "1e-7" } grad (ca. { "1" } cm). Enhver anden rute afvises, og fejlen nævner den position, der ligger længst fra linjen. En rute til en type uden trajektorieinput afvises med den begrundelse. Længde og bredde områdetjekkes, hvilket fanger en fil med bredde først.

seg-be9fddebd47a = <b>SigMF-optagelse.</b> Blokken <c2/> i typen <c1/> læser et par <c3/> / <c4/> gennem <c5/> og plotter dets Welch-estimat ved siden af modellen (se <a1>SPECTRUM.md</a1>). At læse filer er en funktion i den native build; WebAssembly-builden tager bytes gennem <c6/>.

seg-f1ca9cee1065 = Hvordan eksporterne kontrolleres

seg-afe73c19e369 = <c1/> fortolker hver eksport med en validator, der er skrevet ud fra formatets specifikation, ikke med skribentens egen kode:

seg-bdc892a450c0 = CZML: en JSON-array, hvis første pakke er dokumentpakken med en <c1/>; entydige pakkeidentifikatorer; hver position angiver <c2/> <c3/> eller <c4/>; samplede positioner er <c5/> med en ISO { "8601" }-epoke og voksende tider.

seg-a28abb42c103 = KML: et velformet XML-dokument (Extensible Markup Language) i OGC's navneområde for KML { "2.2" } med ét rodfeature; skemaets rækkefølge af elementer inden for en Placemark; højst én geometri pr. Placemark; lukkede lineære ringe på fire eller flere positioner; <c1/>-tupler inden for området; gyldige værdier af <c2/>; <c3/>, der kan opløses; en <c4/> med lige så mange <c5/> som <c6/> og det deklarerede navneområde for udvidelsen.

seg-8e0f4e4c2309 = GeoJSON: længde først og inden for området, bredde inden for området, to eller tre tal pr. position, linjestrenge på to eller flere positioner, lukkede ydre ringe mod uret, intet segment henover meridianen { "180" }°, intet medlem <c1/>, en egenskab <c2/> på hvert feature.

seg-57bf7f9291e1 = STK: versionslinjen <c1/>, en blok <c2/> / <c3/> med de krævede nøgleord, <c4/>, <c5/> lig med antallet af datarækker, syv tal pr. række, voksende tider.

seg-e474c11480d8 = SigMF: <c1/> og <c2/> i <c3/>, arrays <c4/> og <c5/>, <c6/> på hver capture og en datafil med hele samples.

seg-82b7b39e7cad = Ud over strukturen sammenlignes en satellit eksporteret til CZML og til STK med motorens egen tilstand efter den samme referencesystemreduktion og stemmer med { "1" } mm i position (filerne bærer { "0.1" } mm): mod typens egen GCRS-output <c1/> og mod en uafhængig TEME-til-GCRS-propagering af konstellationen <c2/>, hver satellit dateret med sin egen TLE-epoke læst fra scenarieteksten. To kontroller går uden for motoren: den første <c3/>-satellits CZML-positioner stemmer med { "0.1" } m (målt { "2.3" } cm) med den samme TLE propageret af Python-pakken <c4/> og reduceret til GCRS af ERFA (Essential Routines for Fundamental Astronomy, den åbne implementering af IAU's SOFA-bibliotek), og de jordfaste positioner for satellitterne <c5/> er lig med de udsendte efemeridepositioner i grænsefladespecifikationen for Global Positioning System med { "1" } mm. De jordfaste positioner i eksporten <c6/> sammenlignes med de positioner, som jamming-kørslen bedømmer, med { "5" } mm. GeoJSON-ruten går rundt gennem et sporscenarie, SigMF-parret læses tilbage til de samme bytes, og hver eksport er byte-deterministisk.

seg-20fbf9a3fba7 = Dette er kontroller mod de publicerede specifikationer og mod selve motoren. Filerne er ikke indlæst i CesiumJS, Google Earth, Ansys STK eller et SDR-værktøj som en del af testsuiten, så accept i en bestemt version af de værktøjer er ikke afprøvet her.

seg-7349c09206ac = Udveksling af bane, attitude og kernel (bibliotek, { "0.36" })

seg-d5e34188aa96 = Ved siden af formaterne <c1/> tilføjede { "0.36" } bibliotekslæsere og -skribenter til de standardfiler, som værktøjer til missionsanalyse udveksler. De tager og returnerer tekst eller bytes og rører ingen fil. Hver er en VALIDATED række i <a1>verifikationsmatrixen</a1>, mod den uafhængige implementering, der er nævnt dér:

seg-cd8b6f2d43be = <b>CCSDS Orbit Data Messages</b> (<c1/>, med <c2/> til XML-formen): OPM, OMM og OCM i notation med nøgleord og værdi (KVN) og NDM/XML, efter CCSDS 502.0-B-3 (OPM og OMM i version { "3.0" } og { "2.0" }, OCM { "3.0" }). Kontrolleret begge veje mod Orekit: Orekit læser Kshanas filer, og Kshana læser Orekits. De fund, der er tilbage, er fastlåst af tests.

seg-00b9fc226c06 = <b>CCSDS Attitude Data Messages</b> (<c1/>, med <c2/>): AEM og APM efter CCSDS 504.0-B-2, i KVN og NDM/XML. Kontrolleret mod Orekit på samme måde, og postrotationerne mod Orekits.

seg-b8aa23f78f9e = <b>SPICE SPK</b> (<c1/>): skribenter og læsere af NAIF SPK-segmenter af typerne { "9" } og { "13" } (med eksport af en CCSDS OEM til en SPK-kernel) og typerne { "3" } og { "21" } (Chebyshev-polynomier og udvidede differenslinjer), kontrolleret mod NAIF SPICE-værktøjskassens egne læsere, ned til byte-identitet. Kshana skriver segmenterne ud fra de poster, den får: den tilpasser ikke Chebyshev-koefficienter og frembringer ikke differenslinjer.

seg-bb97cbb1ab9f = Importeren og skribenten til CCSDS OEM og kovariansblokken i OEM er ældre og beskrives under importerne ovenfor og i matrixen.

seg-8932eba75c68 = Kun de typer, der står i tabellen nedenfor, eksporterer geometri. Typer, hvis geometri er centreret om Månen, Mars eller et andet legeme, eksporteres ikke: CZML, KML og GeoJSON beskriver positioner om Jorden, og denne udgivelse skriver kun STK-filer med <c1/>, selv om selve STK-formatet tillader andre centrallegemer.

seg-a0593ad77202 = <c1/>, <c2/> og <c3/> har geometri med jorden som reference, som denne udgivelse ikke eksporterer; tabellen giver begrundelsen for hver.

seg-2bb9237839f3 = Typen <c1/> flyver sin trajektorie i et fladt lokalt tangentplan, så kun planets oprindelse eksporteres, ikke trajektorien.

seg-6049ab4ca3c9 = Jordfaste satellitpositioner forsømmer UT1−UTC og polbevægelse (se Referencesystemer og tid); KML-højder er ellipsoidiske, ikke over middelvandstand.

seg-4dda05aefd2b = Fodaftryk forudsætter udbredelse i frit rum, en jammer ved modtagerens horisont og en kugleformet jord for cirklen.

seg-2dd0656c518f = Hver scenariefil

seg-e024f5c1cab1 = Hvad <c1/> gør for hver fil i <c2/> (suitens manifest er ikke et scenarie og er udeladt). "yes" betyder, at formatet skrives og består sin validator; ellers peger tallet på begrundelsen. Genereret af <c3/>; <c4/> fejler, når den er forældet.

seg-c27f67dfbb37 = no [{ "1" }]

seg-3468244e2385 = no [{ "2" }]

seg-d0cf3f74cd10 = no [{ "3" }]

seg-62c880979169 = no [{ "4" }]

seg-9229b499c702 = no [{ "5" }]

seg-d9d6561c9e5b = no [{ "6" }]

seg-7d4a6538c638 = no [{ "7" }]

seg-f170ed4d8dca = no [{ "8" }]

seg-1c5eb5dca942 = no [{ "9" }]

seg-a930bb0d2e42 = no [{ "10" }]

seg-236853169f42 = no [{ "11" }]

seg-411e4f3aeae7 = no [{ "12" }]

seg-34fabcbb82f2 = no [{ "13" }]

seg-772bd344bbce = no [{ "14" }]

seg-460fd74c7c7e = no [{ "15" }]

seg-e1d91ce54b8b = no [{ "16" }]

seg-f3e0486f02e3 = no [{ "17" }]

seg-884160b0ed12 = no [{ "18" }]

seg-8202f4a426b0 = no [{ "19" }]

seg-a4e9a36289e5 = no [{ "20" }]

seg-034364e38105 = no [{ "21" }]

seg-3e3b6ecc7b43 = Hvorfor et format ikke gælder:

seg-d7bd20cb8710 = typerne <c1/> og <c2/> planlægger downlink-kontakter og kodning; eksportér et scenarie <c3/> for den samme satellit og station for at se geometrien

seg-f587b4df1635 = SigMF rummer komplekse basisbåndssamples, som kun typen <c1/> syntetiserer

seg-d102fb18ce8d = typen <c1/> simulerer attitude om massemidtpunktet uden bane eller position på jorden, så der er intet at placere på Jorden

seg-ecc0e31b0369 = scenarieinputtet bærer ingen horisontal position (ingen bredde og længde, ingen jordcentrerede koordinater, ingen banekomponenter ud over højst en højde), så der er intet at placere på Jorden

seg-2e0825b27359 = typerne <c1/> og <c2/> beregner budgetter uden position på Jorden

seg-1f17b963c7a6 = en STK-efemeride beskriver et køretøjs position og hastighed over tid; denne scene har kun faste punkter eller spor uden tid (et fast punkt er en STK Facility, ikke en efemeride)

seg-f79d0ce7b945 = intet medlemsscenarie i kampagnen har noget, som dette format beskriver; eksportér et medlem for sig for at se dets begrundelse

seg-08b7e027318a = typen <c1/> analyserer signaludformninger (spektre, sporing, erhvervelse, kompatibilitet) uden satellit- eller brugerposition; eksportér scenariet <c2/> eller <c3/>, der flyver udformningen

seg-31c8acef1aed = ikke eksporteret i denne udgivelse: de sammensmeltede positioneringstyper placerer deres satellitter i et jordfast system i forhold til en epoke, de aldrig nævner, så en tidsmærket eksport ville skulle opfinde kalenderdatoen (eksportér i stedet scenariet <c1/> eller <c2/>)

seg-3c57b084f0d7 = typens geometri er centreret om Månen, Mars eller et andet legeme i solsystemet; CZML, KML og GeoJSON beskriver positioner på eller om Jorden, og denne udgivelse skriver kun STK-efemerider med CentralBody Earth

seg-2edebe91839c = ikke eksporteret i denne udgivelse: <c1/> placerer sine satellitter i et legemefast system i forhold til en epoke, den aldrig nævner, så en tidsmærket eksport ville skulle opfinde kalenderdatoen

seg-951ac7c5f138 = ikke eksporteret i denne udgivelse: jordens konstellation af Global Navigation Satellite System (GNSS) i <c1/> ses fra en modtager i månens afstand, hvis trajektorie typen ikke udstiller som en tidsserie

seg-3cf7f7460c55 = ikke eksporteret i denne udgivelse: typen <c1/> rapporterer spidsbelastninger og opvarmning og beholder intet tidsmærket sporet på jorden

seg-cfc3df59e5c8 = typen <c1/> sweeper tilgængelighed og linkstyrke for en bruger på en skal eller en Kepler-trajektorie; den har ingen enkelt position at placere på et kort

seg-6271953188bd = scenariet <c1/> angiver opsendelsesstedets breddegrad, men ingen længdegrad, så stedet kan ikke placeres

seg-c9a63dfb34db = ikke eksporteret i denne udgivelse: sandhedsbanen i <c1/> er en tilpasningsreference, hvis jordrotationsvinkel ved epoken er et input (<c2/>, standard { "0" }) og ikke udledt af kalenderdatoen, så dens jordfaste positioner er ikke knyttet til en dato

seg-a03c2f0426db = dette spektrumscenarie har ingen blok [iq], så der syntetiseres ingen samples til optagelse

seg-d75f8ad6903a = ikke eksporteret i denne udgivelse: <c1/> læser og skriver en Orbit Ephemeris Message fra CCSDS (Consultative Committee for Space Data Systems), som selv er udvekslingsfilen for efemerider

seg-fdbaf96ecf3e = typen <c1/> beregner linkstatistik for jordsteder uden tidsmærket geometri at placere

seg-146a2e8ee590 = scenariet sweeper et andet scenarie over et gitter; eksportér det sweepede scenarie for sig

seg-b74484e3586b = typen <c1/> beregner et linkbudget og stabiliteter uden tidsmærket geometri at placere

seg-bcd613e62c69 = <s1>Forrige</s1>Eksport af animation

seg-0525f7fbbfd2 = <s1>Næste</s1>Valideringsstatus

seg-53a778722c16 = STK .e
