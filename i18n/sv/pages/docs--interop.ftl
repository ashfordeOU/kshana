# docs--interop: translations (sv)

seg-f917e7fcac09 = Vad det är

seg-cae10fb9bff8 = Scenario

seg-f2ce7fc60cdf = Format

seg-8c718f7f9f5d = SigMF

seg-507b8c235614 = CZML

seg-bf09433a7342 = GeoJSON

seg-9c92e0bc42aa = KML

seg-b03d56f501c3 = Typ

seg-357c2320b43a = ja

seg-c8c964a11462 = Källa: <c1/>

seg-881ec6f8fbe0 = En körning skriver ett resultatdokument, ett diagram och en rapport. <c1/> skriver också scenariots geometri, eller dess syntetiserade signal, i de format som andra verktyg redan läser: en globvisare, en skrivbordskarta, ett geografiskt informationssystem (GIS), ett uppdragsanalyspaket eller ett verktyg för programvarudefinierad radio (SDR). Ingenting här läser en klocka eller nätverket, och ingen export bär en genereringstidsstämpel, så samma scenario ger byteidentiska filer vid varje körning.

seg-736f2dc67a3c = Filerna skrivs bredvid scenariot och får namn som resultatdokumentet: <c1/>, <c2/>, <c3/>, en <c4/> per rörligt objekt (eller <c5/> när det finns ett) och paret <c6/> / <c7/>. Med <c8/> får de studiens namn i stället, som de andra utdata gör.

seg-21d3fba059d5 = Ett format som namnges uttryckligen men inte gäller för scenariot är ett fel som skriver ut skälet; under <c1/> skrivs skälet ut och formatet hoppas över. Biblioteksingångarna är <c2/>, <c3/> och <c4/>; de tar scenariotexten och returnerar bytes, utan att röra någon fil, så de körs också i WebAssembly-bygget. Model Context Protocol-servern (MCP) tillhandahåller samma tre som verktygen <c5/>, <c6/> och <c7/> (se <c8/>).

seg-77200201db88 = Kod: <c1/> (<c2/> bygger en geometrisk beskrivning av scenariot, <c3/>, <c4/>, <c5/> och <c6/> skriver den), <c7/> och <c8/> för signalen. Tester: <c9/>.

seg-f13ab6bb2e47 = Format

seg-fc52229b569c = Specifikation som följs

seg-3f237c8956eb = Cesium Language: en JSON-array (JavaScript Object Notation) av tidsmärkta paket, läst av CesiumJS

seg-234fa6710fb9 = Keyhole Markup Language { "2.2" }, en standard från Open Geospatial Consortium (OGC), läst av Google Earth och de flesta GIS-verktyg; tidsmärkta spår använder Google-tillägget <c1/>

seg-ef08da440ce5 = <a1>https://www.ogc.org/standards/kml/</a1> (schemats namnrymd <c1/>; tilläggets namnrymd <c2/>)

seg-4cfac7667dbc = geografisk JSON, Internet Engineering Task Force (IETF) Request for Comments (RFC) { "7946" }

seg-de0feb450ae1 = STK <c1/>

seg-96173e7b4238 = efemeridfilen för Ansys Systems Tool Kit (STK), formen tid-position-hastighet <c1/>

seg-a2284e8c0034 = Signal Metadata Format: en JSON-metadatafil och en rå fil med komplexa IQ-sampel (in-phase och quadrature)

seg-b38ee3ebd012 = Vad varje fil innehåller

seg-7d873bc11593 = Varje geospatialt format skrivs från samma scen, så de kan inte vara oeniga om var något befinner sig. En scen har upp till fyra slags objekt:

seg-1fc686f6a7ea = <b>Rörliga objekt</b> — satelliter, och en användarplattform när den rör sig — samplade på scenariots eget tidsrutnät med de propagerare som typens körning använder.

seg-3db28cb6adc5 = <b>Fasta platser</b> — en mottagare, en markstation, en jammer eller ursprunget för ett lokalt navigeringssystem.

seg-0def04909935 = <b>Tidslösa spår</b> — de vägpunkter som en typ för alternativ positionering, navigering och tidssynkronisering (PNT) med terräng, gravitation eller kombination flyger. De här typerna har ingen tidsaxel, så spåren bär ingen.

seg-e14d49ae7330 = <b>Jammerfotavtryck</b> — för typen <c1/>, två cirklar kring jammern: markavståndet inom vilket en satellit i zenit (den starkaste) hamnar under spårningströskeln, så att varje satellit förloras, och avståndet inom vilket en satellit vid elevationsmasken (den svagaste) gör det, så att spårningen börjar misslyckas. Båda kommer från typens egna länkekvationer (Kaplan och Hegarty, <em>Understanding GPS/GNSS</em> (Global Positioning System / Global Navigation Satellite Systems), 3:e uppl., §{ "9.4" }) med jammern vid mottagarens horisont och friutrymmesdämpning, och testsviten kontrollerar att den effektiva kvoten mellan bärvåg och brustäthet vid varje radie är lika med tröskeln inom { "1e-6" } dB. Cirkeln ritas på en sfär med jordens medelradie.

seg-e1dd97c47993 = Det första paketet är dokumentpaketet (<c1/>, <c2/>) med en klocka som spänner över tidsrutnätet. Varje rörligt objekt är ett paket vars <c3/> har en ISO { "8601" } (International Organization for Standardization-format för datum och tid) UTC (Coordinated Universal Time) <c4/>, <c5/> <c6/> och <c7/> sampel <c8/>: sekunder efter epoken, meter i Geocentric Celestial Reference System (GCRS). CesiumJS tar <c9/> som International Celestial Reference Frame (ICRF), vars axlar GCRS delar. Fasta platser och fotavtryckens mittpunkter är konstanta jordfasta <c10/>-positioner med <c11/> <c12/>. Ett fotavtryck är en <c13/> med båda halvaxlarna lika med sin radie; ett tidslöst spår en markfäst <c14/>. Varje pakets <c15/> anger systemet en gång till i ord.

seg-be6362f4c7e7 = Ett <c1/> med en <c2/> per objektklass. Ett rörligt objekt är en <c3/> som innehåller en <c4/>: en <c5/> per sampel (ISO { "8601" } UTC), därefter en <c6/> per sampel (longitud, latitud, höjd). Platser är <c7/>er, fotavtryck <c8/>er vars ring är sluten och moturs, tidslösa spår <c9/>er. Koordinater är longitud och latitud i World Geodetic System { "1984" } (WGS { "84" }) i decimala grader och höjd i meter över WGS { "84" }-ellipsoiden, skrivna med <c10/> <c11/>. KML läser <c12/> som höjd över medelhavsytan; skillnaden, geoidundulationen, ligger inom cirka ±{ "110" } m och tillämpas inte. Dokumentets beskrivning säger det.

seg-37dc14626a6c = Ett <c1/>. Positioner är <c2/> eller <c3/> — longitud först, som RFC { "7946" } kräver — i WGS { "84" }-grader, med höjd i meter över ellipsoiden. Ett rörligt objekt är en <c4/> med en egenskap <c5/> som innehåller en ISO { "8601" }-tid per position; ett spår som korsar meridianen { "180" }° skrivs som en <c6/> som klipps där, som RFC { "7946" } §{ "3.1.9" } anger (korsningspunkten interpoleras, och <c7/> listar då bara de ursprungliga samplen). Platser är <c8/>er, fotavtryck <c9/>er med en sluten yttre ring moturs (§{ "3.1.6" }), tidslösa spår <c10/>er. Varje objekt har en egenskap <c11/> som anger enheten för varje numerisk medlem.

seg-ea28a2bd431c = En fil per rörligt objekt, eftersom en STK-efemerid beskriver ett fordon. Huvudet anger <c1/> (lika med antalet datarader), <c2/> (UTC, <c3/>), <c4/> med <c5/>, <c6/>, <c7/> och <c8/>; raderna under <c9/> är sekunder efter epoken, position i meter och hastighet i meter per sekund, i GCRS. En scen med enbart fasta platser eller tidslösa spår skriver ingen <c10/>-fil: en fast punkt är en STK Facility, inte en efemerid. Ett id som inte är en vanlig del av ett filnamn (ett konstellationsskal och en satellit, <c11/>) skrivs med varje annat tecken som <c12/>, numrerat om två id då sammanfaller.

seg-52a78be5db9f = Typen <c1/> och typen <c2/> (genom sitt steg <c3/>) exporterar varje satellit i låg omloppsbana (LEO) och användaren från typens egna propagerare och tidsrutnät. Typen arbetar i ECI0, det jordcentrerade tröghetssystem som är i linje med det jordfasta systemet vid epoken; varje sampel omvandlas till det jordfasta systemet vid sin egen tid med typens jordrotation och därifrån till GCRS via systemet true equator, mean equinox (TEME) som propagatorn Simplified General Perturbations { "4" } (SGP4) ger utdata i, vid det ögonblicket, med UT1 (Universal Time, jordrotationsvinkeln) satt lika med UTC och polrörelse försummad, som för de andra exporterna. De andra LEO-typerna anger varför ett format inte gäller (tabellen nedan).

seg-b134baf33fba = En <c1/> exporterar varje medlemsscenario som har geometri som sin egen filuppsättning, med medlemmens etikett insatt före formatsuffixet: varje fas körning (<c2/>, eller <c3/> när fasen har flera körningar), svepets basscenario (<c4/>), Monte Carlo-scenariot (<c5/>) och varje sammansatt medlem (dess etikett, med de delade värden den binder inskrivna). <c6/> skriver <c7/> och <c8/>. En medlem som är identisk med en tidigare skrivs en gång, och värden som en kampanj tillämpar vid körning (överlämningar, svepvärden, frön) finns inte i den exporterade medlemmen. Ett format gäller för en kampanj när det gäller för någon medlem; annars är skälet not { "4" } i tabellen nedan. Se <a1>CAMPAIGNS.md</a1>.

seg-6579b6941d10 = Typen <c1/> och dess ögonblicksbild <c2/> — det modellerade L-bandet ritat som komplexa sampel vid ett ögonblick — som ett par <c3/> / <c4/>, i den datatyp som <c5/> anger (<c6/> eller <c7/>). Det är samma inspelning som körningen skriver och läser tillbaka för sin egen konsistenskontroll: de exporterade metadata är lika med blocket <c8/> i resultatdokumentet, och datafilen har längden <c9/>. Skrivaren är <c10/>, modulen som typen <c11/> redan använde; ingenting dupliceras.

seg-6e7c5f0e34f3 = Referenssystem och tid

seg-01d1bedb0595 = Motorn propagerar i TEME (true equator, mean equinox of date), sitt eget system. Rörliga objekt roteras till GCRS med reduktionen <c1/> (IAU { "2006" } precession och IAU 2000B nutation, där IAU är International Astronomical Union), som återger Vallados publicerade TEME-till-GCRF-exempel (Geocentric Celestial Reference Frame) inom { "0.11" } m, för CZML och STK, och till det jordfasta systemet med <c2/> för KML och GeoJSON. Den jordfasta rotationen är Greenwichs mean sidereal-vinkel med UT1 satt lika med UTC och polrörelse inte tillämpad — samma reduktion som SP3-exporten (Standard Product { "3" }) använder. Vid en GPS-banradie flyttar den försummade UT1−UTC på upp till { "0.9" } s en satellits longitud med upp till cirka { "1.7" } km; markplatser påverkas inte, eftersom de anges i latitud och longitud.

seg-4eaa7b3e6946 = Typen <c1/> är undantaget: dess motorutdata bär redan GCRS- och jordfasta positioner (med scenariots UT1−UTC och polrörelse, eller en verklig serie från International Earth Rotation and Reference Systems Service (IERS)), och de skrivs oförändrade.

seg-2299da743a4c = Varje tid är UTC. Skottsekunder modelleras inte: en förskjutning över en skottsekund räknas som om varje dag hade { "86 400" } s, som motorns tidsrutnät räknar.

seg-4f7a0b8b4358 = Epoken för <c1/> är den som typens körning använder, och varje fil anger den: typen <c2/> har <c3/>; när den saknas, den tidigaste epok som satelliternas egna data bär (en epok för en two-line element set (TLE), referenstiden för en sänd efemerid, starten på en SP3-fil), och 2000-01-01T00:{ "00" }:00Z först när ingen satellit bär någon (Kepler-element). SP3- och OEM-exporterna (Orbit Ephemeris Message) behåller 2000-01-01T00:{ "00" }:00Z för ett scenario utan <c4/>, så för ett sådant scenario skiljer sig deras datum från de här filernas. Utan scenariots <c5/> roteras varje satellit som bär sin egen epok in i GCRS och de jordfasta systemen vid sitt eget ögonblick (dess epok plus <c6/>), eftersom det är det datum dess TEME-position hör till; där satelliternas epoker skiljer sig följer de gemensamma tidsmärkena motorns förutsättning att varje satellit startar vid <c7/>, och filen anger med hur många timmar de skiljer sig. SGP4-elementepoken för Walker-konstellationerna i typerna <c8/> och <c9/> (2018-06-12T00:{ "00" }:00Z), som deras körningar också använder för jordrotationen; typen <c10/> har <c11/>; typen <c12/> har <c13/> eller TLE-epok. Typen <c14/> har ingen kalenderepok; dess export datumsätter <c15/> som för ett banscenario utan en.

seg-ee8eeb47f41b = Satelliter behåller de positionella identifierarna <c1/>, <c2/>, ... som SP3- och OEM-exporterna ger dem, eftersom propagerarna inte bär TLE:ernas namnrader.

seg-0491624c5f12 = Importer

seg-798f3ae1b77d = GeoJSON-rutt.

seg-2a04d7d4bafc = <c1/> (bibliotek: <c2/>) läser den första <c3/> i ett GeoJSON-dokument — en ensam geometri, en <c4/> eller en <c5/> — och skriver den till spårindata för <c6/>, <c7/>, <c8/> och <c9/> (<c10/>, <c11/>, <c12/>, <c13/>, <c14/>) före körningen. De typerna flyger <c15/>, så en rutt godtas när den är exakt det: dess två ändar (scenariots antal <c16/> behålls), eller tre eller fler positioner jämnt fördelade på en rak linje i latitud och longitud, inom { "1e-7" } grad (cirka { "1" } cm). Varje annan rutt vägras och felet namnger den position som ligger längst från linjen. En rutt för en typ utan trajektoriaindata vägras med det skälet. Longitud och latitud intervallkontrolleras, vilket fångar upp en fil med latitud först.

seg-be9fddebd47a = <b>SigMF-inspelning.</b> Blocket <c2/> i typen <c1/> läser ett par <c3/> / <c4/> genom <c5/> och ritar dess Welch-skattning bredvid modellen (se <a1>SPECTRUM.md</a1>). Att läsa filer är en funktion i det inbyggda bygget; WebAssembly-bygget tar bytes genom <c6/>.

seg-f1ca9cee1065 = Hur exporterna kontrolleras

seg-afe73c19e369 = <c1/> tolkar varje export med en validerare skriven utifrån formatets specifikation, inte med skrivarens egen kod:

seg-bdc892a450c0 = CZML: en JSON-array vars första paket är dokumentpaketet med en <c1/>; unika paketidentifierare; varje position anger <c2/> <c3/> eller <c4/>; samplade positioner är <c5/> med en ISO { "8601" }-epok och ökande tider.

seg-a28abb42c103 = KML: ett välformat XML-dokument (Extensible Markup Language) i OGC:s KML { "2.2" }-namnrymd med ett rotobjekt; schemats elementordning inuti en Placemark; högst en geometri per Placemark; slutna linjära ringar med fyra eller fler positioner; <c1/>-tupler inom intervall; giltiga <c2/>-värden; <c3/> som går att lösa upp; en <c4/> med lika många <c5/> som <c6/>, och tilläggets namnrymd deklarerad.

seg-8e0f4e4c2309 = GeoJSON: longitud först och inom intervall, latitud inom intervall, två eller tre tal per position, linjer om två eller fler positioner, slutna yttre ringar moturs, inget segment över meridianen { "180" }°, ingen medlem <c1/>, en egenskap <c2/> på varje objekt.

seg-57bf7f9291e1 = STK: versionsraden <c1/>, ett block <c2/> / <c3/> med de nyckelord som krävs, <c4/>, <c5/> lika med antalet datarader, sju tal per rad, ökande tider.

seg-e474c11480d8 = SigMF: <c1/> och <c2/> i <c3/>, arrayerna <c4/> och <c5/>, <c6/> på varje inspelning, och en datafil med hela sampel.

seg-82b7b39e7cad = Utöver strukturen jämförs en satellit som exporteras till CZML och till STK med motorns eget tillstånd efter samma systemreduktion, och stämmer inom { "1" } mm i position (filerna bär { "0.1" } mm): mot typen <c1/>s eget GCRS-utdata, och mot en oberoende TEME-till-GCRS-propagering av konstellationen <c2/>, där varje satellit datumsätts med sin egen TLE-epok läst från scenariotexten. Två kontroller går utanför motorn: den första satellitens <c3/> CZML-positioner stämmer inom { "0.1" } m (uppmätt { "2.3" } cm) med samma TLE propagerad av Python-paketet <c4/> och reducerad till GCRS av ERFA (Essential Routines for Fundamental Astronomy, den öppna implementationen av IAU:s SOFA-bibliotek), och de jordfasta positionerna för satelliterna <c5/> är lika med de sända efemeridpositionerna i gränssnittsspecifikationen för Global Positioning System inom { "1" } mm. Exporten <c6/> jordfasta positioner jämförs med de positioner som jammingkörningen poängsätter, inom { "5" } mm. GeoJSON-rutten går fram och tillbaka genom ett spårscenario, SigMF-paret läses tillbaka till samma bytes, och varje export är byte-deterministisk.

seg-20fbf9a3fba7 = Det här är kontroller mot de publicerade specifikationerna och mot själva motorn. Filerna har inte lästs in i CesiumJS, Google Earth, Ansys STK eller ett SDR-verktyg som en del av testsviten, så godtagande av en viss version av de verktygen är inte testat här.

seg-7349c09206ac = Utbyte av bana, attityd och kärnor (bibliotek, { "0.36" })

seg-d5e34188aa96 = Vid sidan av formaten <c1/> lade { "0.36" } till biblioteksläsare och -skrivare för de standardfiler som uppdragsanalysverktyg utbyter. De tar och returnerar text eller bytes och rör ingen fil. Var och en är en VALIDATED rad i <a1>verifieringsmatrisen</a1>, mot den oberoende implementation som namnges där:

seg-cd8b6f2d43be = <b>CCSDS Orbit Data Messages</b> (<c1/>, med <c2/> för XML-formen): OPM, OMM och OCM i nyckelvärdesnotation (KVN) och NDM/XML, enligt CCSDS 502.0-B-3 (OPM och OMM versionerna { "3.0" } och { "2.0" }, OCM { "3.0" }). Kontrollerad åt båda hållen mot Orekit: Orekit läser Kshanas filer och Kshana läser Orekits. De fynd som återstår är fastlåsta av tester.

seg-00b9fc226c06 = <b>CCSDS Attitude Data Messages</b> (<c1/>, med <c2/>): AEM och APM enligt CCSDS 504.0-B-2, i KVN och NDM/XML. Kontrollerade mot Orekit på samma sätt, och postrotationerna mot Orekits.

seg-b8aa23f78f9e = <b>SPICE SPK</b> (<c1/>): skrivare och läsare för NAIF SPK-segment av typerna { "9" } och { "13" } (med export av en CCSDS OEM till en SPK-kärna) och typerna { "3" } och { "21" } (Chebyshev-polynom och utökade differensrader), kontrollerade mot NAIF SPICE-verktygslådans egna läsare, ända ned till byteidentitet. Kshana skriver segmenten från poster den får: den anpassar inte Chebyshev-koefficienter och producerar inga differensrader.

seg-bb97cbb1ab9f = CCSDS OEM-importeraren och -skrivaren samt OEM-kovariansblocket är äldre och beskrivs under importerna ovan och i matrisen.

seg-8932eba75c68 = Bara typerna i tabellen nedan exporterar geometri. Typer vars geometri har Månen, Mars eller en annan himlakropp som centrum exporteras inte: CZML, KML och GeoJSON beskriver positioner kring jorden, och den här versionen skriver STK-filer endast med <c1/>, även om själva STK-formatet tillåter andra centralkroppar.

seg-a0593ad77202 = <c1/>, <c2/> och <c3/> har jordrelaterad geometri som den här versionen inte exporterar; tabellen anger skälet för var och en.

seg-2bb9237839f3 = Typen <c1/> flyger sin bana i ett plant lokalt tangentplan, så bara planets origo exporteras, inte banan.

seg-6049ab4ca3c9 = Jordfasta satellitpositioner bortser från UT1−UTC och polrörelse (se Referenssystem och tid); KML-höjder är ellipsoidiska, inte över medelvattenyta.

seg-4dda05aefd2b = Täckningsområden förutsätter fri rymdutbredning, en jammer vid mottagarens horisont och en sfärisk jord för cirkeln.

seg-2dd0656c518f = Varje scenariofil

seg-e024f5c1cab1 = Vad <c1/> gör för varje fil i <c2/> (sviten manifest är inte ett scenario och är utelämnad). "ja" betyder att formatet skrivs och klarar sin validerare; annars pekar numret på skälet. Genereras av <c3/>; <c4/> misslyckas när tabellen är föråldrad.

seg-c27f67dfbb37 = nej [{ "1" }]

seg-3468244e2385 = nej [{ "2" }]

seg-d0cf3f74cd10 = nej [{ "3" }]

seg-62c880979169 = nej [{ "4" }]

seg-9229b499c702 = nej [{ "5" }]

seg-d9d6561c9e5b = nej [{ "6" }]

seg-7d4a6538c638 = nej [{ "7" }]

seg-f170ed4d8dca = nej [{ "8" }]

seg-1c5eb5dca942 = nej [{ "9" }]

seg-a930bb0d2e42 = nej [{ "10" }]

seg-236853169f42 = nej [{ "11" }]

seg-411e4f3aeae7 = nej [{ "12" }]

seg-34fabcbb82f2 = nej [{ "13" }]

seg-772bd344bbce = nej [{ "14" }]

seg-460fd74c7c7e = nej [{ "15" }]

seg-e1d91ce54b8b = nej [{ "16" }]

seg-f3e0486f02e3 = nej [{ "17" }]

seg-884160b0ed12 = nej [{ "18" }]

seg-8202f4a426b0 = nej [{ "19" }]

seg-a4e9a36289e5 = nej [{ "20" }]

seg-034364e38105 = nej [{ "21" }]

seg-3e3b6ecc7b43 = Varför ett format inte är tillämpligt:

seg-d7bd20cb8710 = typerna <c1/> och <c2/> planerar nedlänkskontakter och kodning; exportera ett <c3/>-scenario för samma satellit och station för att se geometrin

seg-f587b4df1635 = SigMF innehåller komplexa basbandssampel, som bara typen <c1/> syntetiserar

seg-d102fb18ce8d = typen <c1/> simulerar attityd kring masscentrum utan bana eller markposition, så det finns inget att placera på jorden

seg-ecc0e31b0369 = scenariots indata har ingen horisontell position (ingen latitud och longitud, inga jordcentrerade koordinater, inga banelement utöver högst en höjd), så det finns inget att placera på jorden

seg-2e0825b27359 = typerna <c1/> och <c2/> beräknar budgetar utan jordposition

seg-1f17b963c7a6 = en STK-efemerid beskriver ett farkostens position och hastighet mot tid; den här scenen har bara fasta punkter eller spår utan tidsangivelser (en fast punkt är en STK Facility, inte en efemerid)

seg-f79d0ce7b945 = ingen medlemsscenario i kampanjen har något som det här formatet beskriver; exportera en medlem för sig för att se dess skäl

seg-08b7e027318a = typen <c1/> analyserar signalutformningar (spektrum, spårning, förvärv, kompatibilitet) utan satellit- eller användarposition; exportera scenariot <c2/> eller <c3/> som flyger utformningen

seg-31c8acef1aed = exporteras inte i den här versionen: de sammanslagna positioneringstyperna placerar sina satelliter i ett jordfast system relativt en epok som de aldrig anger, så en tidsstämplad export skulle behöva hitta på kalenderdatumet (exportera scenariot <c1/> eller <c2/> i stället)

seg-3c57b084f0d7 = typens geometri har Månen, Mars eller en annan himlakropp i solsystemet som centrum; CZML, KML och GeoJSON beskriver positioner på eller kring jorden, och den här versionen skriver STK-efemerider endast med CentralBody Earth

seg-2edebe91839c = exporteras inte i den här versionen: <c1/> placerar sina satelliter i ett kroppsfast system relativt en epok som den aldrig anger, så en tidsstämplad export skulle behöva hitta på kalenderdatumet

seg-951ac7c5f138 = exporteras inte i den här versionen: jordens konstellation av Global Navigation Satellite System (GNSS) i <c1/> ses från en mottagare på månavstånd, vars bana typen inte visar som en tidsserie

seg-3cf7f7460c55 = exporteras inte i den här versionen: typen <c1/> redovisar toppbelastningar och uppvärmning och för inget tidsstämplat markspår

seg-cfc3df59e5c8 = typen <c1/> svepar tillgänglighet och länkstyrka för en användare på ett skal eller en keplersk bana; den har ingen enskild position att placera på en karta

seg-6271953188bd = scenariot <c1/> anger uppskjutningsplatsens latitud men ingen longitud, så platsen kan inte placeras

seg-c9a63dfb34db = exporteras inte i den här versionen: sanningsbanan för <c1/> är en anpassningsreferens vars jordrotationsvinkel vid epoken är en indata (<c2/>, standardvärde { "0" }), inte härledd från kalenderdatumet, så dess jordfasta positioner är inte knutna till ett datum

seg-a03c2f0426db = det här spektrumscenariot har inget [iq]-block, så inga sampel syntetiseras att spela in

seg-d75f8ad6903a = exporteras inte i den här versionen: <c1/> läser och skriver ett CCSDS (Consultative Committee for Space Data Systems) Orbit Ephemeris Message, som i sig är utbytesfilen för efemerider

seg-fdbaf96ecf3e = typen <c1/> beräknar länkstatistik för markstationer utan tidsstämplad geometri att placera

seg-146a2e8ee590 = scenariot svepar ett annat scenario över ett rutnät; exportera det svepta scenariot för sig

seg-b74484e3586b = typen <c1/> beräknar en länkbudget och stabiliteter, utan tidsstämplad geometri att placera

seg-bcd613e62c69 = <s1>Föregående</s1>Animationsexport

seg-0525f7fbbfd2 = <s1>Nästa</s1>Valideringsstatus

seg-53a778722c16 = STK .e
