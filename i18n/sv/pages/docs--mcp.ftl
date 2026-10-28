# docs--mcp: translations (sv)

seg-261c059bec54 = Rådgivande, inte typgodkänd navigationsutrustning: operatören är fortsatt ansvarig för navigeringen. Servern körs på din dator; ingenting skickas till Ashforde OÜ.

seg-13641146503d = Cursor (ett klick)

seg-3bd13fe295f4 = VS Code (ett klick)

seg-fea7b394cdde = npx

seg-76fcc8024f2f = uvx / pipx

seg-deb5187472d1 = Homebrew

seg-491167f2310c = Scoop

seg-5c425ea185ee = Förbyggd binär

seg-d107bc8e1950 = MCP-register

seg-842b77a21c5f = Kanal

seg-d6476863f862 = Förmåga

seg-fdbb9db68f1d = ingen

seg-1759a8cce7d6 = Slag

seg-564133d6a0c4 = Konstellationer kring vilken kropp som helst

seg-b88a2a9497c2 = Verktyg

seg-a683980168f7 = Docker

seg-f3a2279d6df7 = Kommando eller knapp

seg-20c5ae650eb7 = Kräver

seg-af4d3ce85e11 = Fastnålad form

seg-0fdd85a80584 = <a1>npx (Node)</a1> · <a2>Docker</a2>

seg-b02bdf7c7661 = Node, eller Docker

seg-de23dcdd2647 = <a1>npx (Node)</a1> · <a2>Docker</a2> · <a3>Insiders (npx)</a3>

seg-abf8b5fe685a = Node { "18" }+

seg-06299cefbf9e = Python { "3.9" }+ med uv eller pipx

seg-26795c302f8a = brew

seg-ded975fa67fa = formel för v{ $version }

seg-667d6dde705b = <c1/> sedan <c2/>

seg-f6e9fc5f46fe = Scoop (Windows)

seg-bc4762d20004 = manifest för v{ $version }

seg-f7c0a2fbb0b5 = winget

seg-9e599ab3c0a3 = winget (Windows)

seg-091d1404bb8a = cargo

seg-145ddf98e77f = Rust { "1.88" }+

seg-b308519d4c8d = <a1>utgivningssidan</a1>: <c1/> (Linux x86-64), <c2/>, kontrollerad med <c3/> och <c4/>

seg-c39cac69f700 = v{ $version }

seg-e8f5e2b6580b = <c1/> (hittas av register-medvetna klienter)

seg-b1a6e807f06f = en register-medveten klient

seg-d5a3818ac3b6 = Fjärr (streamable HTTP)

seg-5f1397b1ea30 = din egen värd

seg-e7acd0ff4c84 = Källa: <c1/>

seg-81a87d14efda = Kshana: märket, ett kompassmålkors som markerar det exakta ögonblicket, bredvid ordmärket kshana

seg-3d5232472e42 = kshana-mcp: fråga din AI-assistent, så svarar motorn

seg-ef90bf1e0b51 = <c1/> är en <a1>Model Context Protocol</a1>-server (MCP) för <b>Kshana</b>, simulatorn med öppen källkod för PNT-resiliens (positionering, navigering och tidssynkronisering). Den låter en AI-assistent (artificiell intelligens) köra den verkliga motorn och läsa tillbaka dess JSON (JavaScript Object Notation) i stället för att gissa matematiken. Den talar över stdio (standard in och ut) med vilken MCP-kompatibel klient som helst, inklusive Cursor och JetBrains AI Assistant / Junie.

seg-1fddef4e9a49 = Matematiken som Kshana är validerad för är precis där en språkmodell gissar dåligt: SGP4-banpropagering (Simplified General Perturbations { "4" }), IAU:s (International Astronomical Union) referenssystem, Allan-deviationer, tillgänglighet och DOP (dilution of precision) för GNSS (Global Navigation Satellite System), skyddsnivåer för ARAIM (advanced receiver autonomous integrity monitoring), fusion av GNSS och INS (tröghetsnavigeringssystem) samt kvantsensormodeller. Ställ en fråga; assistenten kör ett verkligt scenario och får kvalitetsmått med sitt ursprung och sin etikett VALIDATED eller MODELLED.

seg-d51681f30e8f = En öppen motor i mitten, med MCP-servern som en av dess ytor vid sidan av kommandoraden, Rust-biblioteket, Python, WebAssembly och Kshana Studio, Docker-avbilden och JetBrains-insticksmodulen; varje yta kör samma motor, och Kshana Pro bygger på den utan att förgrena den

seg-2a56e1f52830 = Verktyg

seg-b847694d91b5 = Kör ett scenario från en TOML-definition (Tom's Obvious, Minimal Language); returnerar sammanfattningen + hela resultat-JSON (JavaScript Object Notation: kvalitetsmått, kurvor). Valfri <c1/> returnerar diagrammet som SVG (Scalable Vector Graphics).

seg-3c00da00ec30 = Kontroll före körning: tolka TOML och identifiera dess typ, utan att köra.

seg-4516fd1e665c = De medföljande referensscenariona som JSON: varje <c1/>, dess <c2/> och en mening om vad det visar. Valfritt filter <c3/>. Varje exempel körs som det står, så det här är den snabbaste vägen till en giltig TOML för en typ.

seg-61db4a94ad72 = TOML-texten för ett medföljande referensscenario, byte för byte filen under <c1/>.

seg-306f7a835bb9 = Kör ett scenario och returnera dess rapport: sammanfattning för ledningen, indata, varje siffra med sin enhet och sin etikett VALIDATED eller MODELLED, händelser, de förmågor som övats och en reproducerbarhetspost. <c1/> är <c2/> (standard) eller <c3/> (den utskrivbara enfilssidan).

seg-bdacef6d5133 = Kör ett scenario och returnera dess tidsserier som en animering: <c1/> (standard), <c2/> (en fristående spelare) eller <c3/> (högst { "120" } i ett svar). Det första innehållsobjektet är en JSON-sammanfattning av vad som ritades; filerna följer. En typ utan samplad tidsaxel avvisas med skälet.

seg-313f7594bd81 = Vilka interoperabilitetsformat som gäller för ett scenario (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>), skälet när ett inte gör det, och den specifikation varje skrivare följer. Kör inte scenariot.

seg-e63b7853bb96 = Exportera ett scenario som CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK-efemerid (Systems Tool Kit) <c1/>, eller SigMF (Signal Metadata Format, för ett <c2/>-scenario med ett <c3/>-block). Det första innehållsobjektet är ett JSON-index över filerna (ändelse, storlek, kodning och SHA-256-digesten, den 256-bitars Secure Hash Algorithm); filerna följer, den binära SigMF-samplefilen som base64.

seg-074e914789c5 = Skriv en GeoJSON-rutt <c1/> in i ett scenario som flyger ett vägpunktsspår (<c2/>, <c3/>, <c4/>, <c5/>) och returnera den nya TOML.

seg-ae58a8577aa7 = Exportera konstellationen i ett <c1/>-scenario som SP3-c (Standard Product { "3" }, revision c) precisionsefemerid.

seg-6a59aacf26bb = Exportera elementen i ett <c1/>-scenario som en CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 OMM-katalog (Orbit Mean-elements Message).

seg-5562b319968b = Exportera tillståndsserien i ett <c1/>-scenario som CCSDS OEM-efemerid (Orbit Ephemeris Message) { "2.0" } — TEME-serien (true equator, mean equinox) av position <em>och</em> hastighet som verktyg för flygdynamik (GMAT, General Mission Analysis Tool; Orekit; STK, Systems Tool Kit) läser; den hastighetsbärande motsvarigheten till den rent positionsbaserade <c2/>.

seg-b0cf13e530b7 = Kör ett scenario och returnera dess reproducerbarhetstabell som CSV (kommaseparerade värden) — den bytestabila tabell som CLI (kommandoradsgränssnittet) skriver som <c1/>. Bara <c2/>, <c3/>, <c4/>, <c5/>, <c6/> (dess <c7/>-analys på en <c8/>- eller <c9/>-meddelandemodell) och <c10/> med <c11/> + <c12/> satta ger en; varje annan typ returnerar ett fel som nämner dessa.

seg-ab242cd0259c = Himmelsgeometri under en azimutberoende horisontlinje: från en plats, en tid och konstellationsförinställningar, tvåradselementmängder (<c1/>, propagerade med SGP4 till en UTC-<c2/>) eller satelliter som azimut/elevation eller ECEF, de synliga satelliterna och de som skyms av horisontlinjen, GDOP/PDOP/HDOP/VDOP/TDOP från den med gnss_lib_py kontrollerade DOP-kärnan, den öst-nord-upp-baserade kofaktorn och kovariansen (en klocka per system eller en gemensam) och den horisontella felellipsen; med <c3/> i stället för <c4/>, en REPRESENTATIVE förinställning med sitt ursprung och sin skärning för varje grad. MODELLED; bär den rådgivande förklaringen; ingen Monte Carlo över MCP. Se <a1><c5/></a1>.

seg-d6ed4e8d56e5 = Bedöm förtroendet för en verklig GNSS-mottagarlogg (global navigation satellite system). TOML anger loggens <c1/> (<c2/>, <c3/>, <c4/>, <c5/> eller <c6/>) och ger dess byte inbäddade som <c7/> eller <c8/>; verktyget kör förtroendeövervakarna (fall i bärvåg-brus-täthet, förlust av låsning, AGC (automatisk förstärkningsreglering), störningsindikator, positionssprång och, med RINEX plus sändningsnavigering, RAIM (receiver autonomous integrity monitoring) och en klockstödd övervakare) och returnerar när och varför positionsbestämningen slutade vara pålitlig. Valfria sektioner <c9/> och <c10/> poängsätter angivna händelser och förutsagda C/N0-fall mot angivna toleranser. En tabell <c11/> väljer de maritima övervakarna och lägger till en förtroendepoäng på 0-100 per epok med de övervakare som drog av (rådgivande; MODELLED). Loggen ges inbäddad som <c12/> eller <c13/> (högst { "4" } MiB). Diagram och CSV per epok på begäran. Se <a1><c14/></a1>.

seg-d1a967a443ea = Poängsätt ett begränsat NMEA { "0183" }-utdrag (högst { "2" } MiB och { "20,000" } epoker; det måste rymma kalibreringsfönstret) på det sätt som <c1/> poängsätter det: förtroendetillstånd per epok och poäng 0-100 med de övervakare som drog av, en sammanfattning och den sista <c2/>. Den begränsade formen av live-kommandot: ingen socket öppnas och ingenting skrivs till en port; grinden, <c3/> och telemetriexportörerna (Prometheus, OTLP, syslog) finns bara på kommandoraden. Endast rådgivande; MODELLED. Se <a1><c4/></a1>.

seg-89e894d4b416 = Ett fartygs NMEA { "0183" }-logg (högst { "4" } MiB) som en batchkörning, med sessions-TOML som anger fartygets gränser: poängmodellen och varje epoks poäng 0-100 med dess avdrag (svaret behåller antal per tillstånd och de första { "200" } degraderade eller opålitliga epokerna). Endast rådgivande; MODELLED.

seg-27698c80b7f1 = Läs den publicerade testkatalogen och sändningsplanen för Jammertest (NPRA/jammertest-plan, MIT) som schemalagd referens (<c1/>): en testytas tidsluckor blir förtroendehändelser för mottagare med katalog-id och år i varje etikett. Planerade tidsluckor, inte inspelade sändningstider; inget kontaktfält i planen läses. MODELLED. Se <a1><c2/></a1>.

seg-23daf6121ca0 = Poängsätt en mottagarlogg mot det schemat (<c1/>): per test detektionsfördröjning, missade larm och tid till återhämtning, samt falsklarmen utanför varje lucka. Textloggar som <c2/>, binära (<c3/>, <c4/>) som <c5/>. Ett signerat paket behöver en nyckel: kommandoraden. Endast rådgivande; MODELLED.

seg-0ca5b319e850 = Ett signerat bevispaket för ett fönster av ett fartygs logg (<c1/>): råloggens byte för fönstret, konfiguration, resultat och skäl per epok, en sammanfattningssida och ett manifest med varje SHA-256 och en hashkedja, signerat med Ed25519. Signeringsfröet returneras eller loggas aldrig; utan ett används en engångsnyckel, så paketet visar integritet, inte identitet. En teknisk post, inte ett juridiskt utlåtande. Se <a1><c2/></a1>.

seg-8df4c6fb851d = Bind en RFC { "3161" }-tidsstämpeltoken (base64 av <c1/>-byten) till ett paket, i minnet (<c2/>); paketet med token måste fortfarande kunna verifieras. Tidsstämplingsmyndighetens signatur kontrolleras inte: använd <c3/>.

seg-1f7a6f7f005a = Verifiera ett paket (<c1/>): varje hash, kedjan, signaturen, och med signerarens publika nyckel och hela loggen vem som signerade det och att utsnittet kom från den loggen. Namnger varje fel och fil. <c2/> är <c3/> (signeraren fastnålad), <c4/> (allt stämmer men ingen publik nyckel gavs, så signeraren är inte fastställd) eller <c5/>; <c6/> underkänner ett paket utan tidsstämpeltoken.

seg-c43761e01f63 = Syntetisk NMEA { "0183" } för bryggan för besättningsträning från en <c1/>-TOML (jamming, bortdragning av position, tidsspoofing, fördröjning vid återuppspelning) med instruktörsloggen (<c2/>); deterministisk per frö. Endast text: ingenting syntetiseras på RF- eller IQ-nivå och ingenting sänds; aldrig för ett fartygs levande navigationssystem. Svaret bär de första { "2000" } raderna.

seg-8aec8f61dab2 = En GNSS-störningskarta från ADS-B- eller AIS-positionsrapporter som CSV-text (högst { "4" } MiB): en <c1/>-GeoJSON per UTC-dygn, endast aggregerat (inga identifierare, celler med färre än { "5" } skilda flygplan eller fartyg hålls tillbaka), med datamängdens licens inbäddad. En degraderad cell identifierar inte störning som orsak; ingen prognos. MODELLED. Se <a1><c2/></a1>.

seg-d5959e4f1c96 = Ett scenarios fordonsrörelse och händelser för en GNSS-simulator i laboratorium (<c1/>): rörelse som CSV och JSON, NMEA, vägpunkter och händelser som text, ingenting skrivs till disk. Typerna <c2/>, <c3/>, <c4/>. Ingen signal: ingenting som exporteras är, modellerar eller driver en radiofrekvens- eller basbandssignal; simulatorn och dess operatör levererar signalerna. Se <a1><c5/></a1>.

seg-1076916237f0 = Det signerade tur-och-retur-paketet från laboratoriet (<c1/>): scenariot, laboratoriets <a1><c2/></a1>-dokument, mottagarloggen och dess poäng mot de angivna händelserna, länkade med hash. Avvisar villkor och poängsättningshändelser som motsäger varandra. Ingen signal; en teknisk post, inte en certifiering.

seg-9e1df2016cd7 = Spela upp en IQ-inspelning i arbetskatalogen över flera spårningsloopsutformningar (<c1/>): per utformning och PRN den stationära fas- och kodjittern, låsningsandelar och genomsnittlig C/N0. Högst { "256" } (utformning, PRN)-kanaler per anrop; spannet måste rymmas i samplebudgeten.

seg-a5af1743f993 = Kör störnings- och spoofingdetektionsövervakarna över en IQ-inspelning i arbetskatalogen (<c1/>): bredbandiga effekt- och spektralövervakare samt C/N0- och signalkvalitetsövervakare per satellit mot en inlärd baslinje. Serienamn och längder och upp till { "200" } händelser i svaret; hela rapporten på begäran som filer. En händelse säger att en uppmätt storhet lämnade sin baslinje, inte varför. MODELLED.

seg-c9c9c909c621 = Anpassa modellen för förlust av låsning i spårningsloopen till laboratoriekörningar (<c1/>) från ett <c2/>-scenario vars loggar är inbäddade (<c3/> eller <c4/>; en <c5/> avvisas). Läser och skriver ingen fil. MODELLED.

seg-4f231cd18d37 = Validera en <c1/>-fil som ges som text och returnera de lösta villkoren med deras hash. Endast inbäddat.

seg-2851f2858910 = Kartläggningen mot offentliga ramverk, ifylld utifrån resultatdokument som ges som text (<c1/>): vilka rader i sex ramverk och standarder för resiliens (US DHS Resilient PNT framework v2.0, IMO för fartyg, EASA för luftfart, NIS2 artikel { "21" }, EN { "16803" }, NIST IR 8323r1) körningarna ger belägg för, vilka de inte gör, och varje rads lucka. Tar <c2/> av <c3/> (högst { "64" }, { "4" } MiB totalt). En status säger att körningarna ger belägg för radens förmågor; den är inte ett fynd att ett ramverk uppfylls och inte ett betyg eller ett godkännande av någon produkt. <c4/> returneras med varje rapport; visa den ordagrant. MODELLED. Se <a1><c5/></a1>.

seg-0a5161ddea94 = De statiska kartläggningstabellerna (eller, med <c1/>, källdokumenten de hänvisar till med versioner och URL:er) som Markdown, med samma förklaring först. Behöver inga körningar.

seg-ffcc6c72dc1e = En förtroendeström (JSON-rader) eller ett <c1/>-resultat återgivet som Prometheus-text, CEF- eller LEEF-syslog-rader, en OTLP-JSON-last eller Home Assistant MQTT-discovery- och tillståndsrader, med kodarna <c2/>. Text i svaret: ingenting skickas eller serveras och ingen klocka läses. Endast rådgivande.

seg-2b82a8a22298 = Accelerometer- och gyroparametrar för scenariona <c1/> och <c2/> anpassade från en stillastående IMU-logg (CSV eller EuRoC) med Allan-deviation, med en färdig tabell <c3/> att klistra in och loggens SHA-256 (<c4/>). Text in, JSON ut; MODELLED.

seg-30d5bb6b34cb = Standardpaketen (<c1/>): poängsatta scenariouppsättningar för testprofilerna i DHS Resilient PNT framework (nivå { "1" } till { "4" }), IMO MSC.1/Circ.1575 och ICAO Doc { "9849" } bilaga F.

seg-767a05e5df9f = Ett paket körs mot sina trösklar som fastställts före körningen (<c1/>): varje test <c2/>, <c3/> eller <c4/>, med uppmätta och förväntade värden; ge rapporten till <c5/> för att se raderna. MODELLED; betygsätter ingen produkt.

seg-74110e6b530f = LunaNet Augmented Forward Signal kontrollerad mot LNIS V5 AD1 Volume A (LSIS-AFS V1.0, { "29" } januari { "2025" }): <c1/> (implementationen mot dokumentets tryckta kodtabeller och genomräknade exempel), <c2/> (en symbolström: synkmönster, SB1, FID, TOI-kontinuitet) eller <c3/> (en testström). LDPC och CRC-24Q för delramarna { "2" } till { "4" } verifieras inte; ingen signal skrivs.

seg-b6abad1f2c9d = Ett kshana-bench-bidrag poängsatt mot en referensfil, båda JSON-text (<c1/>, <c2/>): resultatfilen med specifikationsversion, delmängd, indatahashar och uppgiftens mått. MODELLED; beskriver en logg eller ett korpus, aldrig en produkt.

seg-c7a0d7981bfd = Resultatfiler från kshana-bench återgivna som den statiska topplistesidan (HTML-text), var och en först validerad.

seg-1ec7117c7825 = En förtroendeström (JSON-rader) eller ett <c1/>-resultat återgivet som Prometheus-text, CEF- eller LEEF-syslog-rader eller en OTLP-JSON-last, med kodarna <c2/>. Text i svaret: ingenting skickas eller serveras och ingen klocka läses. Endast rådgivande.

seg-0fc2e3928768 = Andelen av en rutts längd i degraderade, icke-degraderade, ej bedömda och ej observerade celler i en eller flera störningskartor, eventuellt inom ett datumintervall. Oobserverade celler är inget belägg för en klar rutt.

seg-62756ba18cf5 = Uppsättningen för GNSS-IQ-lagret: de signalnamn IQ-verktygen accepterar, om IQ-filverktygen är på, arbetskatalogen och samplebudgeten per anrop. Anropa det först.

seg-98939638409f = Beskriv en IQ-inspelning (inphase och kvadratur) i arbetskatalogen utan att bearbeta den: format, samplingshastighet, mittfrekvens, sampel, varaktighet, datafiler och storlekar (<c1/>).

seg-c529b1a7ee53 = Generera en GNSS-IQ-scen med flera satelliter i arbetskatalogen (<c1/>): angivna Doppler/C/N0-profiler, eller sann geometri från sändningsefemerid ur en RINEX-navigeringsfil, med en valfri propagationskanal på signalnivå. Svarar med de skrivna filerna och deras bytetal och referensens första epok per satellit.

seg-0c6f5e26367f = FFT-förvärv (fast Fourier transform) av en eller flera PRN (pseudoslumpkoder) över en inspelning (<c1/>), eventuellt bakom frontändssteg: per PRN, förvärvad eller inte, Doppler, kodfas, toppstatistik och tröskel; <c2/> (en PRN) behåller hela korrelationsytan Doppler × kodfas med finjusteringar av Doppler.

seg-1da73ad326de = Förvärva och spåra sedan med bänken av DLL/PLL/FLL (fördröjnings-, fas- och frekvenslåsta loopar) (<c1/>), med looparna från en <c2/>-TOML-fil i arbetskatalogen (<c3/>) eller den inbyggda utformningen, och valfri återförvärvning (<c4/>): per kanal, epoker, slutlig Doppler, slutlig och genomsnittlig C/N0, fas- och kodlåsningsandelar, låst vid slutet, det slutliga låsningstillståndet, falska låsningar och återförvärvningar, plus utformningens namn och hash. Spårning strömmar i begränsat minne; utdata per epok går bara till filer (<c5/>: E/P/L, diskriminatorer, looptillstånd, C/N0, låsningstillstånd som .csv/.jsonl/.bin; <c6/>).

seg-262bb9c592c0 = Tillämpa mottagarens frontändes- och störningsdämpande DSP (digital signalbehandling: bandpass, notch, blankning, excision, AGC, kvantiserare) på en inspelning och skriv en ny (<c1/>).

seg-cf33e101b144 = Kör en kampanj med uppspelning i laboratorium (<c1/>): inspelningar, var och en med en testvillkorsfil som anger laboratoriets kända referens, × frontändskedjor × looputformningar. Varje cell poängsätts för tid till förlust av låsning, tid för återförvärvning, C/N0-försämring mot det angivna J/S (bredvid en analytisk referens märkt MODELLED), andel falska låsningar, PLL/DLL-jitter och tillgänglighet. Inkrementell och återupptagbar: varje anrop kör de väntande celler som ryms i samplebudgeten (eller <c2/>).

seg-8112428c6226 = En kampanjutdatamapps framsteg: celler klara och väntande, och digesten när den är klar. Läser bara filer.

seg-8bd76f017ae4 = Varje verktyg är ett tunt, troget skal kring en offentlig funktion i biblioteket <c1/> — ingen ny simuleringslogik finns här, så en agent kör exakt den validerade motorn.

seg-b37bbaf38900 = GNSS-IQ-verktygen: filer in, kompakt JSON ut

seg-ecf2ec0eb66d = IQ-inspelningar kan uppgå till gigabyte, så verktygen <c1/> skickar aldrig sampel genom protokollet. De följer ett kontrakt:

seg-31a173dfe40d = <b>En arbetskatalog.</b> Servern läser och skriver IQ-filer bara i mappen som anges av <c1/>. Varje sökvägsargument är relativt den (en absolut sökväg måste lösas upp inuti den); indata löses upp genom symlänkar före kontrollen, en utdatas mapp måste redan finnas inuti den, och en befintlig utdata ersätts bara med <c2/>. Om den inte är satt är IQ-filverktygen av och säger hur de aktiveras; alla andra verktyg påverkas inte.

seg-4f734b84a91a = <b>En samplebudget.</b> Ett anrop genererar eller bearbetar högst <c1/> komplexa sampel (standard { "50 000 000" }). I byte är det { "400" } MB som <c2/> ({ "8" } byte per komplext sampel), { "200" } MB som <c3/> ({ "4" } byte) och { "100" } MB som <c4/> ({ "2" } byte); en scen skrivs som <c5/> om inte <c6/> säger annat. Kontrollen körs före allt arbete, och avslaget anger den varaktighet eller <c7/> som ryms.

seg-178284ddfee0 = <b>Kompakta svar.</b> Varje verktyg svarar med en JSON-sammanfattning: förvärvstoppar, C/N0, låsningstillstånd och varje skriven fil med sin sökväg och sitt bytetal. Tabeller per epok går till de filer <c1/> / <c2/> som du namnger.

seg-f375643798e9 = <b>Okända argument avvisas</b>, ignoreras inte, så ett felstavat alternativ är ett fel.

seg-41040247770d = Varje verktyg kör samma kodväg som <c1/> på kommandoraden, i processen. Lagret är enbart programvara: det skriver filer för mjukvarumottagare och driver ingen radiohårdvara. IQ-lagret lägger inte till någon syntes av störning eller spoofer, och ingenting sänds någonsin. (Den separata scenariotypen <c2/> kan skriva analytiska ögonblicksbilder av störsändar-IQ till en fil.)

seg-f02d2f6bac7c = Med Docker-avbilden, montera mappen och peka variabeln mot den: <c1/>.

seg-721079aa25e7 = Varje typ är nåbar

seg-116ada4f4498 = <c1/> skickar vidare efter scenariots <c2/>, så varje typ som <c3/> nämner körs genom den. Det inkluderar de nyare familjerna, var och en med medföljande exempel som en agent kan hämta:

seg-c7047f5750a9 = Ett exempel att utgå från

seg-b45752760eca = Solsystemet

seg-1ccf38ab6e24 = Kampanjer: kedjade faser, svep, Monte Carlo (slumpmässiga ensembler med frö), sammansättning

seg-67fe14962e1c = Navigering i låg omloppsbana runt jorden (LEO): signalutformning

seg-c555e5b73203 = LEO-navigering: länkbudget för passage

seg-67de12cac6f0 = LEO-navigering: navigeringsmeddelande

seg-b8badd962245 = LEO-navigering: sammanfogad positionering och tidssynkronisering

seg-0561cfd970d8 = <c1/> med en <c2/> nämner varje medföljande exempel av den typen. Animeringar, rapporter och interoperabilitetsexporter är inga typer: de är vyer av en körning, och <c3/>, <c4/> och <c5/> returnerar dem för varje scenario de gäller.

seg-62d106ca4a89 = Serveras inte: studiesviter (<c1/>), eftersom en svit nämner syskonscenariofiler på disk och scenarioverktygen inte läser någon fil. Kör varje medlem med <c2/>. (IQ-verktygen läser och skriver filer, men bara inuti sin arbetskatalog.)

seg-57f592bb676b = Installera MCP-servern

seg-77fc92e21295 = Ett stycke som nämner AI-klienter från tredje part är utelämnat här; det finns i <a1>mcp/kshana-mcp/README.md</a1> på GitHub.

seg-9ec78559983f = <c1/>, egen drift: se <a1>https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md</a1>

seg-b32b9d4e0f8b = Från en utcheckning eller git (utveckling):

seg-73a73af88f08 = HTTP-läge (egen drift)

seg-4f248ed3e597 = <c1/> serverar samma verktyg över streamable HTTP på <c2/>. Den binder bara loopback; en adress som inte är loopback kräver <c3/> och en bearer-token i <c4/>; IQ-filverktygen är av; förfrågans storlek, tid och samtidighet är begränsade; inget CORS-huvud skickas. Kshana tillhandahåller ingen slutpunkt: du driver den själv. Se <a1>docs/deploy/mcp-http.md</a1>.

seg-60f55b197ac2 = <c1/> lägger <c2/> på din <c3/> (vanligen <c4/>). Servern talar JSON-RPC (JSON remote procedure call) över stdio; loggar går till stderr. Att bygga från källkod kräver en Rust-verktygskedja ≥ { "1.88" } (den lagade SDK:n <c5/> { "2" }.x kräver det; själva biblioteket <c6/> behöver bara { "1.85" }); Docker-avbilden behöver ingen.

seg-2f3216082425 = Registrera den hos en klient

seg-1090ae3f689c = Praktiskt taget varje MCP-klient använder samma konfigurationsblock <c1/> — registrera binärfilen <c2/> med absolut sökväg:

seg-2da393482666 = Eller, med Docker-avbilden i stället för en lokal binärfil (ingen <c1/> behövs):

seg-a4f1295bb27a = Var det blocket finns beror på klienten:

seg-154c7e09063d = <b>Cursor</b> — <c1/> (globalt) eller <c2/> (per projekt).

seg-d4a06077c606 = <b>JetBrains AI Assistant / Junie</b> — Settings → Tools → AI Assistant → Model Context Protocol → Add → <em>As JSON</em>, klistra in blocket och starta sedan om IDE:n (integrated development environment) helt.

seg-daf0ea451b11 = <b>Skrivbordsassistenter</b> — de flesta använder en <c1/> med samma form <c2/>; kontrollera din klients dokumentation för filens plats.

seg-fc80286aa9bf = <b>CLI-agenter</b> — många accepterar samma JSON via en mekanism <c1/> / <c2/>.

seg-9f3ef8d76e05 = Använd alltid en absolut sökväg till binärfilen. Sätt <c1/> i <c2/> för att felsöka (diagnostik går till stderr; stdout är reserverad för JSON-RPC-protokollet).

seg-283d1eba838a = Prova

seg-61739e9b6515 = När den är registrerad, fråga din assistent saker som:

seg-256276ac933d = <em>"Lista scenariotyperna i Kshana."</em> → <c1/>

seg-2a8e3c76b939 = <em>"Visa mig ett spektrumexempel i Kshana och kör det."</em> → <c1/>, <c2/>, <c3/>

seg-d2e1e4148589 = <em>"Kör scenariot clock-holdover i Kshana med en tröskel på { "20" } ns och ett GNSS-avbrott på 2 timmar; vad är holdover för kvant jämfört med klassisk?"</em> → <c1/>

seg-f4b83873e280 = <em>"Exportera den GPS-konstellationen (Global Positioning System) som SP3."</em> → <c1/>

seg-54e01c1af45f = <em>"Ge mig tabellen realtime-frame-eop som CSV."</em> → <c1/>

seg-478e6fa0e8d8 = <em>"Lägg den Iridium-passagen på en Cesium-glob."</em> → <c1/>, <c2/>

seg-90829388d5d9 = <em>"Animera jamming-kampanjen."</em> → <c1/>

seg-9eb1b97ad2fd = <em>"Ge mig rapporten för den körningen, med dess reproducerbarhetspost."</em> → <c1/>

seg-dc60d64a3bb8 = <em>"Skapa en GPS L1-scen på en sekund med PRN { "3" } och { "17" }, förvärva och spåra den sedan."</em> → <c1/>, <c2/>, <c3/>, <c4/>

seg-942dc8abe0ec = Designanteckning — varför en separat crate

seg-ce6d0ecab448 = Servern är en <b>fristående crate utanför arbetsytan</b> med egen <c1/>, så att den officiella Rust-MCP-SDK:n (software development kit) <c2/> och dess asynkrona körmiljö aldrig hamnar i beroendegrafen för den publicerade crate:n <c3/>: en biblioteks- eller Python-användare kompilerar inte en server de inte kör. (Den delades först ut eftersom <c4/> är <b>edition { "2024" }</b> och kräver rustc ≥ { "1.85" }, medan huvudcrate:n då lovade { "1.75" }. Biblioteket deklarerar nu { "1.85" }; den här servern deklarerar { "1.88" }, golvet för den säkerhetslagade <c5/> { "2" }.x.) Kontinuerlig integration (CI) styr den här crate:n för sig — tester och <c6/> mot dess låsfil. rmcp:s licensträd är rent (Apache-2.0/MIT/BSD), så, till skillnad från korsvalideringscrate:n <c7/> som den i övrigt speglar, handlar uppdelningen inte om licensiering.

seg-75bf2d74642d = Licens: endast AGPL-3.0, GNU Affero General Public License version { "3" } endast (eller en kommersiell licens från Ashforde OÜ; se förrådets <a1>LICENSING.md</a1>).

seg-490ebbefb561 = <s1>Föregående</s1>Rust-crate

seg-350b6b914734 = <s1>Nästa</s1>MCP-server: alla installationskanaler

seg-492888115662 = De { "92" } inbyggda scenariotyperna med beskrivningar + obligatoriska/valfria fält — så att agenten kan konstruera ett giltigt scenario.
